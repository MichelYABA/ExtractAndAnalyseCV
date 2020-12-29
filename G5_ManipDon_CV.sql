-- Requête pour tester la base 

-- Tous les candidats ayant au moins une expérience professionnelle 
SELECT NOM_CANDIDAT, PRENOM_CANDIDAT FROM CANDIDAT WHERE ID_CANDIDAT IN 
(SELECT  ID_CANDIDAT FROM EXPERIENCE_PROFESSIONNELLE GROUP BY ID_CANDIDAT);

-- La liste des etudiants ayant la compétence technique 9
SELECT NOM_CANDIDAT, PRENOM_CANDIDAT FROM POSSEDER_COMP_TECH INNER JOIN CANDIDAT ON CANDIDAT.ID_CANDIDAT = POSSEDER_COMP_TECH.ID_CANDIDAT 
WHERE ID_COMP_TECH = 9;


-- Les candidats ayant une expérience pro et habitant a paris et ayant le permis B  
SELECT ID_CANDIDAT, NOM_CANDIDAT, PRENOM_CANDIDAT FROM CANDIDAT JOIN EXPERIENCE_PROFESSIONNELLE USING (ID_CANDIDAT) WHERE 
PERMIS = 'B' AND VILLE = 'PARIS';

-- Les tels avec une anomalie
select tel from contacts where tel LIKE('<anomalie%');

-- Le nom des candidats ayant un liens web n'ayant pas d'anomalie 
select nom_candidat from contacts natural join candidat where LIEN_SITE_WEB NOT LIKE('<anomalie%');





/*

-- =============================================================================== 
-- DEPENDANCE FONCTIONNELLE
-- =============================================================================== 


-- HOMOGENEISATION & STANDARDISATION DES DONNEES : TOUT EN MAJUSCULE sans espaces superflus
UPDATE CANDIDAT SET COL1 = UPPER(RTRIM(LTRIM(REGEXP_REPLACE(COL1, '( ){2,}', ' '))));
UPDATE CANDIDAT SET COL2 = UPPER(RTRIM(LTRIM(REGEXP_REPLACE(COL2, '( ){2,}', ' '))));

COMMIT;
SELECT * FROM CANDIDAT ORDER BY 2;

-- =============================================================================== 
-- Chercher l'erreur ! dans les données ... ! >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> !!!
-- =============================================================================== 

-- Vérifier, dans la table CANDIDAT, si COL1 -DF- COL2
EXEC VerifFonctionalDependency('COL1', 'COL2', 'CANDIDAT');
SELECT * FROM VERIFDF ;




-- Compter le nombre d occurrences par valeur de COL1 et valeur de COL2 afin de détecter d éventuelles anomalies
CREATE OR REPLACE VIEW W1 (COL1, NOMBRE) AS SELECT COL1, COUNT(*) FROM CANDIDAT GROUP BY COL1 ORDER BY 1;
CREATE OR REPLACE VIEW W2 (COL2, NOMBRE) AS SELECT COL2, COUNT(*) FROM CANDIDAT GROUP BY COL2 ORDER BY 1;

SELECT * FROM W1;

SELECT * FROM W2;


-- Pour chacune des colonne concernée il faudrait NETTOYER/HOMOGENEISER/STANDARDISER le contenu : COL1
CREATE OR REPLACE VIEW W3(COL1, NBR1, COL1BIS, NBR2) AS 
SELECT A.COL1, A.NOMBRE, B.COL1, B.NOMBRE FROM W1 A, W1 B 
WHERE 
A.COL1 < B.COL1 AND 
UTL_MATCH.edit_distance_similarity(UPPER(A.COL1), UPPER(B.COL1)) > 70 AND
UTL_MATCH.jaro_winkler_similarity(UPPER(A.COL1), UPPER(B.COL1)) > 70;

SELECT * FROM W3;


-- On choisit les "BONNES ORTHOGRAPHES" dans la COL1 ET dans la COL1BIS en réalisant les mises à jour ci-dessous : !
-- On choisit les "BONNES ORTHOGRAPHES" des données dans la colonne COL1 et on crée les opérations de mises à jour !
CREATE OR REPLACE VIEW UPDATING_OPERATIONS(MODIFICATIONS) AS 
SELECT 'UPDATE CANDIDAT SET COL1 = '
|| CHR(39) || COL1 || CHR(39) || ' WHERE COL1 = ' || CHR(39) || COL1BIS || CHR(39) || ' ;'  
FROM W3 WHERE NBR1 >= NBR2
UNION
SELECT 'UPDATE CANDIDAT SET COL1 = '
|| CHR(39) || COL1BIS || CHR(39) || ' WHERE COL1 = ' || CHR(39) || COL1 || CHR(39) || ' ;' 
FROM W3 WHERE NBR2 > NBR1;

SELECT * FROM UPDATING_OPERATIONS ;


SELECT * FROM CANDIDAT;



-- Pour chacune des colonne concernée il faudrait NETTOYER/HOMOGENEISER/STANDARDISER le contenu : COL2
CREATE OR REPLACE VIEW W4(COL2, NBR1, COL2BIS, NBR2) AS 
SELECT A.COL2, A.NOMBRE, B.COL2, B.NOMBRE FROM W2 A, W2 B 
WHERE 
A.COL2 < B.COL2 AND 
UTL_MATCH.edit_distance_similarity(UPPER(A.COL2), UPPER(B.COL2)) > 70 AND
UTL_MATCH.jaro_winkler_similarity(UPPER(A.COL2), UPPER(B.COL2)) > 70;

SELECT * FROM W4;


CREATE OR REPLACE VIEW UPDATING_OPERATIONS(MODIFICATIONS) AS 
SELECT 'UPDATE CANDIDAT SET COL2 = '
|| CHR(39) || COL2 || CHR(39) || ' WHERE COL2 = ' || CHR(39) || COL2BIS || CHR(39) || ' ;' 
FROM W4 WHERE NBR1 >= NBR2
UNION
SELECT 'UPDATE CANDIDAT SET COL2 = '
|| CHR(39) || COL2BIS || CHR(39) || ' WHERE COL2 = ' || CHR(39) || COL2 || CHR(39) || ' ;'
FROM W4 WHERE NBR2 > NBR1;

SELECT * FROM UPDATING_OPERATIONS ;

SELECT DISTINCT * FROM CANDIDAT ORDER BY 2;  


EXEC VerifFonctionalDependency('COL1', 'COL2', 'CANDIDAT');
SELECT * FROM VERIFDF ;


-- Les valeurs pour lesquelles la DF COL1 -DF- COL2 n'est pas vérifiée
CREATE OR REPLACE VIEW VAL_NON_DF AS SELECT * FROM VERIFDF WHERE NBROCC > 1 ORDER BY 1;
SELECT 'LES VALEURS POUR LESQUELLES LA DF N EST PAS VERIFIEE SONT : ' AS LEFTCOL_NON_DF FROM DUAL;
SELECT * FROM VAL_NON_DF;


 -- LES LIGNES A PROBLEMES SONT :
CREATE OR REPLACE VIEW V_COL1COL2 (COL1, COL2) AS 
SELECT COL1, COL2 
FROM (SELECT DISTINCT * FROM CANDIDAT)
WHERE UPPER(COL1) IN (SELECT UPPER(LEFTCOL) FROM VAL_NON_DF) AND COL2 IS NOT NULL ;

SELECT * FROM V_COL1COL2 ORDER BY 1;


-- Traitement des valeurs nulles (On écarte les lignes avec COL2 = NULL !)
CREATE OR REPLACE VIEW LINESWITH_COL2MISSING AS SELECT DISTINCT * FROM CANDIDAT WHERE COL2 IS NULL;
SELECT * FROM LINESWITH_COL2MISSING;



-- Traitement effectif de la dépendance fonctionnelle (CORRECTIONS)
-- Etude des couples (Col1, Col2)

CREATE OR REPLACE VIEW W_COL1COL2 (COL1, COL2, C1C2) AS 
SELECT COL1, COL2, COL1 || ' ' || COL2 FROM CANDIDAT WHERE COL2 IS NOT NULL;
SET LINES 1000
SET PAGES 1000
COLUMN C1C2 FORMAT A30
COLUMN COL1 FORMAT A30
COLUMN COL2 FORMAT A30
CREATE OR REPLACE VIEW W_DF (COL1, COL2, C1C2, NOMBRE) AS 
SELECT COL1, COL2, C1C2, COUNT(*) N  FROM W_COL1COL2 GROUP BY COL1, COL2, C1C2 ORDER BY 1;
SELECT * FROM W_DF;



CREATE OR REPLACE VIEW UPDATING_OPERATIONS(MODIFICATIONS) AS 
SELECT 'UPDATE CANDIDAT SET COL2 = (SELECT COL2 FROM W_DF WHERE COL1 = ' || CHR(39) || COL1 || CHR(39) || 
' AND NOMBRE = (SELECT MAX(NOMBRE) FROM W_DF WHERE COL1 = ' || CHR(39) || COL1 || CHR(39) || 
' )) WHERE COL1 = ' || CHR(39) || COL1 || CHR(39) || ';' 
FROM W_DF ;

SELECT * FROM UPDATING_OPERATIONS ;


SELECT DISTINCT * FROM CANDIDAT ORDER BY 1;



SELECT DISTINCT * FROM CANDIDAT ORDER BY 2, 1;


EXEC VerifFonctionalDependency('COL1', 'COL2', 'CANDIDAT');
SELECT * FROM VERIFDF ;



/* Procedure de verification des dépendances */ 
/*
CREATE OR REPLACE PROCEDURE VerifFonctionalDependency( LEFTCOL IN VARCHAR, RIGHTCOL IN VARCHAR, NOMTAB IN VARCHAR ) IS
-- Procédure qui permet de vérifier, dans la table de nom NOMTAB si :
-- la colonne de nom LEFTCOL détermine fonctionnellement la colonne de nom RIGHTCOL
-- = la colonne de nom RIGHTCOL est fonctionnellement dépendnate de la colonne de nom LEFTCOL
  Query     VARCHAR(500);
  Resultat  VARCHAR(100);
  NBRMAXOCC NUMBER;
BEGIN  -- Début de la procédure VerifFonctionalDependency

  Query := 'DROP TABLE LISTAVERIFIER_DF0';
  EXECUTE IMMEDIATE Query;
  Query := 'CREATE TABLE LISTAVERIFIER_DF0 ( ' || LEFTCOL || ', ' || RIGHTCOL || ') AS SELECT ' || LEFTCOL || ', ' || RIGHTCOL || ' FROM ' || NOMTAB;
  -- Query := 'CREATE TABLE LISTAVERIFIER_DF0 ( ' || LEFTCOL || ', ' || RIGHTCOL || ') AS SELECT UPPER(' || LEFTCOL || '), UPPER(' || RIGHTCOL || ') FROM ' || NOMTAB;
  EXECUTE IMMEDIATE Query;
  Query := 'DROP TABLE LISTAVERIFIER_DF1';
  EXECUTE IMMEDIATE Query;
  Query := 'CREATE TABLE LISTAVERIFIER_DF1 (LEFTCOL, RIGHTCOL) AS SELECT DISTINCT * FROM LISTAVERIFIER_DF0';
  EXECUTE IMMEDIATE Query;
  Query := 'DROP TABLE VERIFDF';
  EXECUTE IMMEDIATE Query;
  Query := 'CREATE TABLE VERIFDF (LEFTCOL, NBROCC) AS SELECT LEFTCOL, COUNT(*) FROM LISTAVERIFIER_DF1 GROUP BY LEFTCOL ORDER BY LEFTCOL';
  EXECUTE IMMEDIATE Query;
  COMMIT;
  
  SELECT MAX(NBROCC) INTO NBRMAXOCC FROM VERIFDF;	
  IF NBRMAXOCC > 1 THEN 
     DBMS_OUTPUT.PUT_LINE(' La dépendance fonctionnelle ' || LEFTCOL || ' -DF- ' || RIGHTCOL || ' n''est pas vérifiée !,' || ' dans la table ' || NOMTAB);
	 Resultat := 'FALSE-NON-Vérifiée';
  ELSE
     DBMS_OUTPUT.PUT_LINE(' La dépendance fonctionnelle ' || LEFTCOL || ' -DF- ' || RIGHTCOL || ' est vérifiée !,' || ' dans la table ' || NOMTAB);
	 Resultat := 'TRUE-Vérifiée';
  END IF;
  
  --RETURN(Resultat);
END; -- Fin de la procédure VerifFonctionalDependency
/

-- =============================================================================== 
-- FIN DEPENDANCE FONCTIONNELLE
-- =============================================================================== 


-- =============================================================================== 
-- ELIMINE DOUBSIMIL
-- =============================================================================== 

-- Procedure qui permet d'eliminer les similaires par rapport a un certain seuil, le seuil1 est pour le jaro_winkler_similarity et le seuil2 est pour l'edit distances
CREATE OR REPLACE PROCEDURE ELIMINEDOUBSIMIL (NOMTAB VARCHAR2, Seuil1 IN NUMBER, Seuil2 IN NUMBER, Id IN VARCHAR) IS
-- Procédure qui permet de sauvegarder la table source de données dans S
  Query VARCHAR(2000);
  vari VARCHAR2(2555) := ' ';
  vari2 VARCHAR2(3000) :=' ';
  -- recupère les noms des colonnes
  CURSOR v_columns is  Select * FROM USER_TAB_COLUMNS where TABLE_NAME = NOMTAB;
  tmp VARCHAR2(30);
  nb NUMBER(1);
BEGIN -- Début de la procédure ELIMINEDOUBSIMIL

  -- Concatenation des colonnes 
  FOR k in v_columns LOOP
    vari2 := k.COLUMN_NAME || ',' || vari2;
    vari := '||' || k.COLUMN_NAME || ' ' || vari;
    tmp := k.COLUMN_NAME;
  END LOOP;
  vari := tmp || vari;
  -- Sauvedarde des données source dans la dable S
  Query := 'DROP TABLE S';
  EXECUTE IMMEDIATE Query;
  Query := 'CREATE TABLE S AS SELECT  * FROM ' || NOMTAB;
  EXECUTE IMMEDIATE Query;
  -- Creation de la table de concatenation avec l'id
  Query := 'CREATE OR REPLACE VIEW Tab_Dupli(NEWKEY, ID) AS SELECT ' || vari || ', ' || Id ||' FROM ' || NOMTAB;
  EXECUTE IMMEDIATE Query;
-- TRAVAIL A FAIRE : Transformer les étapes pour éliminer les doubles/similaires dans une procédure
  Query := 'CREATE OR REPLACE VIEW V1 AS
  SELECT N1.NEWKEY AS NEWKEY1, N2.NEWKEY AS NEWKEY2, N1.ID as ID1, N2.ID AS ID2 FROM Tab_Dupli N1, Tab_Dupli N2 WHERE N1.NEWKEY < N2.NEWKEY';
  EXECUTE IMMEDIATE Query;
  Query := 'CREATE OR REPLACE VIEW V2 AS
  SELECT ID1, ID2 ,NEWKEY1, NEWKEY2, UTL_MATCH.jaro_winkler_similarity(UPPER(NEWKEY1), UPPER(NEWKEY2)) as JWS, UTL_MATCH.edit_distance_similarity(UPPER(NEWKEY1), UPPER(NEWKEY2)) EDS  FROM V1 ';
  EXECUTE IMMEDIATE Query;
  -- Détection des doubles et/ou similaires
  -- On crée une requête V3 qui contient les similaires a partir du seuil1 et seuil2
  Query := 'CREATE OR REPLACE VIEW V3 AS (SELECT ID1, ID2, NEWKEY1, NEWKEY2 FROM V2 WHERE JWS >'|| Seuil1 || ' AND EDS >'  ||Seuil2 || ') ';
  EXECUTE IMMEDIATE Query;
  -- Elimination des doubles et/ou similaires par une fonction
  nb := SUPPR(NOMTAB, Id);
END; -- Début de la procédure ELIMINEDOUBSIMIL
/


-- Ici on supprime dans la table client les similitudes pour la table clients
CREATE OR REPLACE FUNCTION SUPPR(NOMTAB IN VARCHAR, ID IN VARCHAR) RETURN NUMBER IS
	CURSOR Cursor_Key is SELECT DISTINCT * FROM V3;
	req VARCHAR(500);
  id1 VARCHAR2(30);
BEGIN
    FOR i in Cursor_Key LOOP
        id1 :=  chr(39) || i.ID1 ||chr(39);
        req := ' DELETE FROM ' || NOMTAB || ' WHERE ' || ID || ' = ' || id1 ;
		    EXECUTE IMMEDIATE req;
    END LOOP;
	RETURN 1;
END;
/

-- =============================================================================== 
-- FIN ELIMINE DOUBSIMIL
-- =============================================================================== 
*/