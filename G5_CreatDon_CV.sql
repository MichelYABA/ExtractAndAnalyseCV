DROP TABLE CANDIDAT CASCADE CONSTRAINTS;
DROP TABLE FORMATIONS CASCADE CONSTRAINTS;
DROP TABLE ETABLISSEMENT CASCADE CONSTRAINTS;
DROP TABLE SUIVRE_FORMATION CASCADE CONSTRAINTS;
DROP TABLE COMPETENCES_OPERATIONNELLES CASCADE CONSTRAINTS;
DROP TABLE POSSEDER_COMP_OP CASCADE CONSTRAINTS;
DROP TABLE CERTIFICAT CASCADE CONSTRAINTS;
DROP TABLE COMPETENCES_TECHNIQUES CASCADE CONSTRAINTS;
DROP TABLE POSSEDER_COMP_TECH CASCADE CONSTRAINTS;
DROP TABLE LANGUES CASCADE CONSTRAINTS;
DROP TABLE PARLE_LANGUES CASCADE CONSTRAINTS;
DROP TABLE PHOTOS CASCADE CONSTRAINTS;
DROP TABLE CENTRE_INTERET CASCADE CONSTRAINTS;
DROP TABLE AIMER_INTERET CASCADE CONSTRAINTS;
DROP TABLE REFERENCE CASCADE CONSTRAINTS;
DROP TABLE RELATION CASCADE CONSTRAINTS;
DROP TABLE CONTACTS CASCADE CONSTRAINTS;
DROP TABLE EXPERIENCE_PROFESSIONNELLE CASCADE CONSTRAINTS;
DROP TABLE PROJETS CASCADE CONSTRAINTS;

--PROMPT =========================================================
--PROMPT >> Table : CANDIDAT                                   
--PROMPT =========================================================

CREATE TABLE CANDIDAT
(
	ID_CANDIDAT				VARCHAR2(25), 
	NOM_CANDIDAT			VARCHAR2(50),
	PRENOM_CANDIDAT			VARCHAR2(50),
	AGE_CANDIDAT			NUMBER(3),
	SEXE					CHAR(1),
	DATE_NAISSANCE			DATE,
	SITUATION_FAMILIALE		CHAR(4),
	PERMIS					CHAR(2),
	NATIONALITE				VARCHAR2(40),
	MOBILITE				VARCHAR2(40),
	PRESENTATION			VARCHAR2(100),
	CONSTRAINT PK_CANDIDAT 	PRIMARY KEY(ID_CANDIDAT),
	CONSTRAINT NN_CANDIDAT_NOM_CANDIDAT	CHECK(NOM_CANDIDAT IS NOT NULL),
	CONSTRAINT NN_CANDIDAT_PRENOM_CANDIDAT	CHECK(PRENOM_CANDIDAT IS NOT NULL),
	CONSTRAINT CK_CANDIDAT_AGE_CANDIDAT	CHECK(AGE_CANDIDAT > 15),
	CONSTRAINT CK_CANDIDAT_SEXE	CHECK (SEXE IN ('M','F')),
	CONSTRAINT CK_CANDIDAT_SITUATION_FAMILIALE	CHECK (SITUATION_FAMILIALE IN ('M','C','V','P')),
	CONSTRAINT CK_CANDIDAT_PERMIS	CHECK (PERMIS IN ('B','A'))	
);


--PROMPT =========================================================
--PROMPT >> Table : ETABLISSEMENT                                            
--PROMPT =========================================================
CREATE TABLE ETABLISSEMENT (
	ID_ETABLISSEMENT        VARCHAR2(50),
	NOM_ETABLISSEMENT		VARCHAR2(50),
	TYPE_ETABLISSEMENT	 	VARCHAR2(45),
	VILLE_ETABLISSEMENT 	VARCHAR2(45),
	PAYS_ETABLISSEMENT	  	VARCHAR2(45),
	CONSTRAINT PK_ETABLISSEMENT PRIMARY KEY(ID_ETABLISSEMENT),
	CONSTRAINT CK_ETABLISSEMENT_VILLE	CHECK(VILLE_ETABLISSEMENT = UPPER(VILLE_ETABLISSEMENT)),
	CONSTRAINT CK_ETABLISSEMENT_PAYS	CHECK(PAYS_ETABLISSEMENT = UPPER(PAYS_ETABLISSEMENT))

);


--PROMPT =========================================================
--PROMPT >> Table : FORMATIONS                                             
--PROMPT =========================================================

CREATE TABLE FORMATIONS (
	CODE_FORMATION		  	VARCHAR2(35),
	ID_ETABLISSEMENT        VARCHAR2(45),
	INTITULE_FORMATION		VARCHAR2(300) ,
	CONSTRAINT PK_FORMATIONS PRIMARY KEY(CODE_FORMATION),
	CONSTRAINT FK_FOR_ETAB FOREIGN KEY(ID_ETABLISSEMENT) REFERENCES ETABLISSEMENT(ID_ETABLISSEMENT)
	
);


--PROMPT =========================================================
--PROMPT >> Table : SUIVRE_FORMATION                                             
--PROMPT =========================================================

CREATE TABLE SUIVRE_FORMATION (
	CODE_FORMATION		VARCHAR2(35),
	ID_CANDIDAT		  	VARCHAR2(35),
	RESULTAT		  	VARCHAR2(50),
	MENTION	  			VARCHAR2(50),
	DATE_DEBUT  			DATE,
	DATE_FIN	  			DATE,
	CONSTRAINT PK_SUIVRE_FORMATION PRIMARY KEY(CODE_FORMATION,ID_CANDIDAT),
	CONSTRAINT FK_SUIVRE_FORMATION_CODE_FORMATION_FORMATIONS FOREIGN KEY(CODE_FORMATION) REFERENCES FORMATIONS(CODE_FORMATION),
	CONSTRAINT FK_SUIVRE_FORMATION_ID_CANDIDAT_CANDIDAT FOREIGN KEY(ID_CANDIDAT) REFERENCES CANDIDAT(ID_CANDIDAT)
);

--PROMPT =========================================================
--PROMPT >> Table : LANGUES                                             
--PROMPT =========================================================

CREATE TABLE LANGUES (
	ID_LANGUE		  	VARCHAR2(35),
	Nom_langues		  	VARCHAR2(50),
	Pays_langues		VARCHAR2(35),
	CONSTRAINT PK_LANGUES PRIMARY KEY(ID_LANGUE)
);

--PROMPT =========================================================
--PROMPT >> Table : PARLE_LANGUES                                             
--PROMPT =========================================================

CREATE TABLE PARLE_LANGUES (
	ID_LANGUE		  	VARCHAR2(35),
	ID_CANDIDAT		  	VARCHAR2(35),
	SCORE		  		VARCHAR2(35),
	NIVEAU	 		 	VARCHAR2(35),
	CONSTRAINT PK_PARLE_LANGUES PRIMARY KEY(ID_LANGUE,ID_CANDIDAT),
	CONSTRAINT FK_PARLE_LANGUES_ID_LANGUE_LANGUES FOREIGN KEY(ID_LANGUE) REFERENCES LANGUES(ID_LANGUE),
	CONSTRAINT FK_PARLE_LANGUES_ID_CANDIDAT_CANDIDAT FOREIGN KEY(ID_CANDIDAT) REFERENCES CANDIDAT(ID_CANDIDAT)
);


--PROMPT =========================================================
--PROMPT >> Table : COMPETENCES_OPERATIONNELLES                                             
--PROMPT =========================================================

CREATE TABLE COMPETENCES_OPERATIONNELLES (
	ID_COMP_OP		  	VARCHAR2(35),
	NOM_COMP_OP		  	VARCHAR2(60),
	DESCRIPTION_OP		VARCHAR2(100),
	CONSTRAINT PK_COMPETENCES_OPERATIONNELLES PRIMARY KEY(ID_COMP_OP)
);


--PROMPT =========================================================
--PROMPT >> Table : POSSEDER_COMP_OP                                             
--PROMPT =========================================================

CREATE TABLE POSSEDER_COMP_OP (
	ID_COMP_OP		 	VARCHAR2(35),
	ID_CANDIDAT		  	VARCHAR2(35),
	DATE_OBTENTION		DATE,
	CONSTRAINT PK_POSSEDER_COMP_OP PRIMARY KEY(ID_COMP_OP,ID_CANDIDAT),
	CONSTRAINT FK_POSSEDER_COMP_OP_ID_COMP_OP_COMPETENCES_OPERATIONNELLES FOREIGN KEY(ID_COMP_OP) REFERENCES COMPETENCES_OPERATIONNELLES(ID_COMP_OP),
	CONSTRAINT FK_POSSEDER_COMP_OP_ID_CANDIDAT_CANDIDAT FOREIGN KEY(ID_CANDIDAT) REFERENCES CANDIDAT(ID_CANDIDAT)
);


--PROMPT =========================================================
--PROMPT >> Table : CERTIFICAT                                             
--PROMPT =========================================================

CREATE TABLE CERTIFICAT (
	ID_CERTIFICAT		VARCHAR2(35),
	CERTIFICATEUR		VARCHAR2(60),
	TITRE		  		VARCHAR2(60),
	DATE_DEBUT	  		DATE,
	DATE_FIN	  		DATE,
	MENTION				VARCHAR2(60),
	ID_CANDIDAT 		VARCHAR2(30),
	CONSTRAINT PK_CERTIFICAT PRIMARY KEY(ID_CERTIFICAT),
	CONSTRAINT FK_CERTIFICAT_ID_CANDIDAT_CANDIDAT FOREIGN KEY(ID_CANDIDAT) REFERENCES CANDIDAT(ID_CANDIDAT)
);


--PROMPT =========================================================
--PROMPT >> Table : COMPETENCES_TECHNIQUES                                             
--PROMPT =========================================================

CREATE TABLE COMPETENCES_TECHNIQUES (
	ID_COMP_TECH		VARCHAR2(30),
	NOM_COM		  		VARCHAR2(50),
	TYPE_COM		  	VARCHAR2(50), 
	CONSTRAINT PK_COMPETENCES_TECHNIQUES PRIMARY KEY(ID_COMP_TECH)
);


--PROMPT =========================================================
--PROMPT >> Table : POSSEDER_COMP_TECH                                             
--PROMPT =========================================================

CREATE TABLE POSSEDER_COMP_TECH (
	ID_COMP_TECH		 	VARCHAR2(30),
	ID_CANDIDAT		  		VARCHAR2(30),
	DATE_OBTENTION		  	DATE,
	NIVEAU_MAITRISE	  		VARCHAR2(50),
	CONSTRAINT PK_POSSEDER_COMP_TECH PRIMARY KEY(ID_COMP_TECH,ID_CANDIDAT),
	CONSTRAINT FK_POSSEDER_COMP_TECH_ID_COMP_TECH_COMPETENCES_TECHNIQUES FOREIGN KEY(ID_COMP_TECH) REFERENCES COMPETENCES_TECHNIQUES(ID_COMP_TECH),
	CONSTRAINT FK_POSSEDER_COMP_TECH_ID_CANDIDAT_CANDIDAT FOREIGN KEY(ID_CANDIDAT) REFERENCES CANDIDAT(ID_CANDIDAT),
	CONSTRAINT CK_POSSEDER_COMP_TECH_NIVEAU_MAITRISE CHECK (NIVEAU_MAITRISE IN ('DEBUTANT','MOYEN','EXPERT'))
);


--PROMPT =========================================================
--PROMPT >> Table : PHOTOS                                             
--PROMPT =========================================================

CREATE TABLE PHOTOS (
	ID_PHOTO		  	VARCHAR2(30),
	PHOTO		  		VARCHAR2(100),
	ID_CANDIDAT		  	VARCHAR2(30),
	CONSTRAINT PK_PHOTOS PRIMARY KEY(ID_PHOTO),
	CONSTRAINT FK_PHOTOS_ID_CANDIDAT_CANDIDAT FOREIGN KEY(ID_CANDIDAT) REFERENCES CANDIDAT(ID_CANDIDAT)
);


--PROMPT =========================================================
--PROMPT >> Table : CENTRE_INTERET                                             
--PROMPT =========================================================

CREATE TABLE CENTRE_INTERET (
	ID_INTERET		  			VARCHAR2(30),
	NOM_CENTRE_INTERET		  	VARCHAR2(100),
	CONSTRAINT PK_CENTRE_INTERET PRIMARY KEY(ID_INTERET)
);


--PROMPT =========================================================
--PROMPT >> Table : AIMER_INTERET                                             
--PROMPT =========================================================

CREATE TABLE AIMER_INTERET (
	ID_INTERET		  VARCHAR2(30),
	ID_CANDIDAT		  VARCHAR2(30),
	DESCRIPTION		  VARCHAR2(100),
	CONSTRAINT PK_AIMER_INTERET PRIMARY KEY(ID_INTERET,ID_CANDIDAT),
	CONSTRAINT FK_AIMER_INTERET_ID_INTERET_CENTRE_INTERET FOREIGN KEY(ID_INTERET) REFERENCES CENTRE_INTERET(ID_INTERET),
	CONSTRAINT FK_AIMER_INTERET_ID_CANDIDAT_CANDIDAT FOREIGN KEY(ID_CANDIDAT) REFERENCES CANDIDAT(ID_CANDIDAT)
);


--PROMPT =========================================================
--PROMPT >> Table : REFERENCE                                             
--PROMPT =========================================================

CREATE TABLE REFERENCE (
	ID_REF		  				VARCHAR2(10),
	NOM_REF		  				VARCHAR2(50),
	PRENOM_REF		  			VARCHAR2(50),
	POSTE	  					VARCHAR2(50),
	ENTREPRISE_ETABLISSEMENT	VARCHAR2(50),
	CONSTRAINT PK_REFERENCE PRIMARY KEY(ID_REF),
	CONSTRAINT CK_REFERENCE_NOM_REF	CHECK(NOM_REF = UPPER(NOM_REF))
);


--PROMPT =========================================================
--PROMPT >> Table : RELATION                                             
--PROMPT =========================================================

CREATE TABLE RELATION (
	ID_REF		  		VARCHAR2(30),
	ID_CANDIDAT		  	VARCHAR2(30),
	CONSTRAINT PK_RELATION PRIMARY KEY(ID_REF,ID_CANDIDAT),
	CONSTRAINT FK_RELATION_ID_REF_REFERENCE FOREIGN KEY(ID_REF) REFERENCES REFERENCE(ID_REF),
	CONSTRAINT FK_RELATION_ID_CANDIDAT_CANDIDAT FOREIGN KEY(ID_CANDIDAT) REFERENCES CANDIDAT(ID_CANDIDAT)
);


--PROMPT =========================================================
--PROMPT >> Table : CONTACTS                                             
--PROMPT =========================================================

CREATE TABLE CONTACTS (
	ID_CONTACT		  	VARCHAR2(30),
	PAYS		  		VARCHAR2(50),
	VILLE		 		VARCHAR2(50),
	CODE_POSTALE	 	NUMBER(5),
	NUMERO_RUE	  		VARCHAR2(50),
	RUE	  				VARCHAR2(50),
	TEL   				VARCHAR2(50),
	MAIL	  			VARCHAR2(50), 
	LIEN_FACEBOOK  		VARCHAR2(100),
	LIEN_LINKEDIN  		VARCHAR2(100),
	LIEN_SKYPE  		VARCHAR2(100),
	LIEN_INSTAGRAM 		VARCHAR2(100),
	LIEN_SITE_WEB  		VARCHAR2(100),
	ID_CANDIDAT  		VARCHAR2(30),
	CONSTRAINT PK_CONTACTS PRIMARY KEY(ID_CONTACT),
	CONSTRAINT FK_CONTACTS_ID_CANDIDAT_CANDIDAT FOREIGN KEY(ID_CANDIDAT) REFERENCES CANDIDAT(ID_CANDIDAT),
	CONSTRAINT CK_CONTACTS_PAYS	CHECK(PAYS = UPPER(PAYS)),
	CONSTRAINT CK_CONTACTS_VILLE CHECK(VILLE = UPPER(VILLE))
);


--PROMPT =========================================================
--PROMPT >> Table : EXPERIENCE_PROFESSIONNELLE                                             
--PROMPT =========================================================

CREATE TABLE EXPERIENCE_PROFESSIONNELLE (
	ID_EXP_PRO		 	VARCHAR2(30),
	TITRE_POSTE		  	VARCHAR2(100),
	ENTREPRISE		  	VARCHAR2(50),
	PAYS	  			VARCHAR2(50),
	VILLE	  			VARCHAR2(50),
	DATE_DEBUT	  		DATE,
	DATE_FIN   			DATE,
	MISSIONS	  		VARCHAR2(150), 
	TACHES  			VARCHAR2(150),
	ID_CANDIDAT 		VARCHAR2(30),
	CONSTRAINT PK_EXPERIENCE_PROFESSIONNELLE PRIMARY KEY(ID_EXP_PRO),
	CONSTRAINT FK_EXPERIENCE_PROFESSIONNELLE_ID_CANDIDAT_CANDIDAT FOREIGN KEY(ID_CANDIDAT) REFERENCES CANDIDAT(ID_CANDIDAT),
	CONSTRAINT CK_EXPERIENCE_PROFESSIONNELLE_PAYS	CHECK(PAYS = UPPER(PAYS)),
	CONSTRAINT CK_EXPERIENCE_PROFESSIONNELLE_VILLE CHECK(VILLE = UPPER(VILLE))
);


--PROMPT =========================================================
--PROMPT >> Table : PROJETS                                             
--PROMPT =========================================================

CREATE TABLE PROJETS (
	ID_PROJET		 	VARCHAR2(100),
	TITRE_PROJET		VARCHAR2(200),
	TYPE_PROJET		  	VARCHAR2(50),
	PAYS	  			VARCHAR2(50),
	VILLE	 		 	VARCHAR2(50),
	DATE_DEBUT	  		DATE,
	DATE_FIN   			DATE,
	MISSION	  			VARCHAR2(150), 
	TACHES	  			VARCHAR2(100),
	ID_CANDIDAT	  		VARCHAR2(30),
	CONSTRAINT PK_PROJETS PRIMARY KEY(ID_PROJET),
	CONSTRAINT FK_PROJETS_ID_CANDIDAT_CANDIDAT FOREIGN KEY(ID_CANDIDAT) REFERENCES CANDIDAT(ID_CANDIDAT),
	CONSTRAINT CK_PROJETS_PAYS	CHECK(PAYS = UPPER(PAYS)),
	CONSTRAINT CK_PROJETS_VILLE CHECK(VILLE = UPPER(VILLE))
);

--PROMPT =========================================================
--PROMPT >> FIN DE LA CREATION DES TABLES                                            
--PROMPT =========================================================

--PROMPT ===============================================================
--PROMPT >> DEBUT DE LA CREATION DES METAS TABLES POUR LES CONTRAINTES                                         
--PROMPT ===============================================================

DROP TABLE METATABLE_FORMATIONS CASCADE CONSTRAINTS;
DROP TABLE METATABLE_ETABLISSEMENT CASCADE CONSTRAINTS;
DROP TABLE METATABLE_RELATION CASCADE CONSTRAINTS;
DROP TABLE METATABLE_LANGUES CASCADE CONSTRAINTS;
DROP TABLE METATABLE_PARLE_LANGUES CASCADE CONSTRAINTS;
DROP TABLE METATABLE_SUIVRE_FORMATION CASCADE CONSTRAINTS;
DROP TABLE METATABLE_CANDIDAT CASCADE CONSTRAINTS;
DROP TABLE METATABLE_CERTIFICAT CASCADE CONSTRAINTS;
DROP TABLE METATABLE_PHOTOS CASCADE CONSTRAINTS;
DROP TABLE METATABLE_CONTACTS CASCADE CONSTRAINTS;
DROP TABLE METATABLE_EXPERIENCE_PROFESSIONNELLE CASCADE CONSTRAINTS;
DROP TABLE METATABLE_PROJETS CASCADE CONSTRAINTS;
DROP TABLE METATABLE_COMPETENCES_OPERATIONNELLES CASCADE CONSTRAINTS;
DROP TABLE METATABLE_POSSEDER_COMP_OP CASCADE CONSTRAINTS;
DROP TABLE METATABLE_COMPETENCES_TECHNIQUES CASCADE CONSTRAINTS;
DROP TABLE METATABLE_POSSEDER_COMP_TECH CASCADE CONSTRAINTS;
DROP TABLE METATABLE_CENTRE_INTERET CASCADE CONSTRAINTS;
DROP TABLE METATABLE_AIMER_INTERET CASCADE CONSTRAINTS;
DROP TABLE METATABLE_REFERENCE CASCADE CONSTRAINTS;


------ FORMATIONS
CREATE TABLE METATABLE_FORMATIONS
(
	CONSTRAINT_CODE_FORMATION VARCHAR2(100), 
	CONSTRAINT_ID_ETABLISSEMENT VARCHAR2(100),
	CONSTRAINT_INTITULE_FORMATION VARCHAR2(100) 
);

------ ETABLISSEMENT
CREATE TABLE METATABLE_ETABLISSEMENT
(
	CONSTRAINT_ID_ETABLISSEMENT         VARCHAR2(100),
	CONSTRAINT_NOM_ETABLISSEMENT		VARCHAR2(100),
	CONSTRAINT_TYPE_ETABLISSEMENT	 	VARCHAR2(100),
	CONSTRAINT_VILLE_ETABLISSEMENT 	    VARCHAR2(100),
	CONSTRAINT_PAYS_ETABLISSEMENT	  	VARCHAR2(100) 
);

------ RELATION
CREATE TABLE METATABLE_RELATION
(
	CONSTRAINT_ID_REF		  		VARCHAR2(100),
	CONSTRAINT_ID_CANDIDAT		  	VARCHAR2(100)
);

------- LANGUE
CREATE TABLE METATABLE_LANGUES
(
	CONSTRAINT_ID_LANGUE		  	VARCHAR2(100),
	CONSTRAINT_Nom_langues		  	VARCHAR2(100),
	CONSTRAINT_Pays_langues		    VARCHAR2(100)
);
------- PARLE_LANGUE
CREATE TABLE METATABLE_PARLE_LANGUES
(
	CONSTRAINT_ID_LANGUE		  	VARCHAR2(100),
	CONSTRAINT_ID_CANDIDAT		  	VARCHAR2(100),
	CONSTRAINT_SCORE		  		VARCHAR2(100),
	CONSTRAINT_NIVEAU	 		 	VARCHAR2(100)
);

--------- SUIVRE_FORMATION
CREATE TABLE METATABLE_SUIVRE_FORMATION
(
    CONSTRAINT_CODE_FORMATION		VARCHAR2(100),
	CONSTRAINT_ID_CANDIDAT		  	VARCHAR2(100),
	CONSTRAINT_RESULTAT		  	    VARCHAR2(100),
	CONSTRAINT_MENTION	  			VARCHAR2(100),
	CONSTRAINT_DATE_DEBUT  			VARCHAR2(100),
	CONSTRAINT_DATE_FIN	  			VARCHAR2(100)
);

--------- CANDIDAT ---------
CREATE TABLE METATABLE_CANDIDAT
(
	CONSTRAINT_ID_CANDIDAT VARCHAR2(500) DEFAULT NULL, 
	CONSTRAINT_NOM_CANDIDAT VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_PRENOM_CANDIDAT VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_AGE_CANDIDAT VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_SEXE VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_DATE_NAISSANCE VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_SITUATION_FAMILIALE VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_PERMIS VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_NATIONALITE VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_MOBILITE VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_PRESENTATION VARCHAR2(500) DEFAULT NULL
);


--------- CERTIFICAT ---------
CREATE TABLE METATABLE_CERTIFICAT
(
	CONSTRAINT_ID_CERTIFICAT VARCHAR2(500) DEFAULT NULL, 
	CONSTRAINT_CERTIFICATEUR VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_TITRE VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_DATE_DEBUT VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_DATE_FIN VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_MENTION VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_ID_CANDIDAT VARCHAR2(500) DEFAULT NULL
);

--------- PHOTOS ---------
CREATE TABLE METATABLE_PHOTOS
(
	CONSTRAINT_ID_PHOTO VARCHAR2(500) DEFAULT NULL, 
	CONSTRAINT_PHOTO VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_ID_CANDIDAT VARCHAR2(500) DEFAULT NULL
);


--------- ONTACTS ---------
CREATE TABLE METATABLE_CONTACTS
(
	CONSTRAINT_ID_CONTACT VARCHAR2(500) DEFAULT NULL, 
	CONSTRAINT_PAYS VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_VILLE VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_CODE_POSTALE VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_NUMERO_RUE VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_RUE VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_TEL VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_MAIL VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_LIEN_FACEBOOK VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_LIEN_LINKEDIN VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_LIEN_SKYPE VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_LIEN_INSTAGRAM VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_LIEN_SITE_WEB VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_ID_CANDIDAT VARCHAR2(500) DEFAULT NULL
);


--------- EXPERIENCE_PROFESSIONNELLE ---------
CREATE TABLE METATABLE_EXPERIENCE_PROFESSIONNELLE
(
	CONSTRAINT_ID_EXP_PRO VARCHAR2(500) DEFAULT NULL, 
	CONSTRAINT_TITRE_POSTE VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_ENTREPRISE VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_PAYS VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_VILLE VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_DATE_DEBUT VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_DATE_FIN VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_MISSIONS VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_TACHES VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_ID_CANDIDAT VARCHAR2(500) DEFAULT NULL
);


--------- PROJETS ---------
CREATE TABLE METATABLE_PROJETS
(
	CONSTRAINT_ID_PROJET VARCHAR2(500) DEFAULT NULL, 
	CONSTRAINT_TITRE_PROJET VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_TYPE_PROJET VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_PAYS VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_VILLE VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_DATE_DEBUT VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_DATE_FIN VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_MISSIONS VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_TACHES VARCHAR2(500) DEFAULT NULL,
	CONSTRAINT_ID_CANDIDAT VARCHAR2(500) DEFAULT NULL
);

--------- COMPETENCES_OPERATIONNELLES ---------
CREATE TABLE METATABLE_COMPETENCES_OPERATIONNELLES(
    CONSTRAINT_ID_COMP_OP   VARCHAR2(500)   DEFAULT NULL,
    CONSTRAINT_NOM_COMP_OP  VARCHAR2(500)   DEFAULT NULL,
    CONSTRAINT_DESCRIPTION_OP   VARCHAR2(500)   DEFAULT NULL
);

--------- POSSEDER_COMP_OP ---------
CREATE TABLE METATABLE_POSSEDER_COMP_OP(
    CONSTRAINT_ID_COMP_OP   VARCHAR2(500)   DEFAULT NULL,
    CONSTRAINT_ID_CANDIDAT  VARCHAR2(500)   DEFAULT NULL,
    CONSTRAINT_DATE_OBTENTION   VARCHAR2(500)   DEFAULT NULL
);

--------- COMPETENCES_TECHNIQUES ---------
CREATE TABLE METATABLE_COMPETENCES_TECHNIQUES(
    CONSTRAINT_ID_COMP_TECH VARCHAR2(500)   DEFAULT NULL,
    CONSTRAINT_NOM_COM  VARCHAR2(500)   DEFAULT NULL,
    CONSTRAINT_TYPE_COM VARCHAR2(500)   DEFAULT NULL

);

--------- POSSEDER_COMP_TECH ---------
CREATE TABLE METATABLE_POSSEDER_COMP_TECH(
    CONSTRAINT_ID_COMP_TECH VARCHAR2(500)   DEFAULT NULL,
    CONSTRAINT_ID_CANDIDAT  VARCHAR2(500)   DEFAULT NULL,
    CONSTRAINT_DATE_OBTENTION   VARCHAR2(500)   DEFAULT NULL,
    CONSTRAINT_NIVEAU_MAITRISE  VARCHAR2(500)   DEFAULT NULL

);

--------- CENTRE_INTERET ---------
CREATE TABLE METATABLE_CENTRE_INTERET(
    CONSTRAINT_ID_INTERET   VARCHAR2(500)   DEFAULT NULL,
    CONSTRAINT_NOM_CENTRE_INTERET   VARCHAR2(500)   DEFAULT NULL

);

--------- AIMER_INTERET ---------
CREATE TABLE METATABLE_AIMER_INTERET(
    CONSTRAINT_ID_INTERET   VARCHAR2(500)   DEFAULT NULL,
    CONSTRAINT_ID_CANDIDAT  VARCHAR2(500)   DEFAULT NULL,
    CONSTRAINT_DESCRIPTION  VARCHAR2(500)   DEFAULT NULL
);

--------- REFERENCE ---------
CREATE TABLE METATABLE_REFERENCE(
    CONSTRAINT_ID_REF   VARCHAR2(500)   DEFAULT NULL,
    CONSTRAINT_NOM_REF  VARCHAR2(500)   DEFAULT NULL,
    CONSTRAINT_PRENOM_REF   VARCHAR2(500)   DEFAULT NULL,
    CONSTRAINT_POSTE    VARCHAR2(500)   DEFAULT NULL,
    CONSTRAINT_ENTREPRISE_ETABLISSEMENT VARCHAR2(500)   DEFAULT NULL

);



--PROMPT =========================================================
--PROMPT >> FIN DE LA CREATION DES METAS TABLES POUR LES CONTRAINTES                                             
--PROMPT =========================================================

--PROMPT ===============================================================
--PROMPT >> DEBUT DE LA CREATION DES PROCEDURES INSERT                                      
--PROMPT ===============================================================

----------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------Procédure d'insertion FORMATION----------------------------------------------------------
CREATE OR REPLACE PROCEDURE INSERT_FORMATIONS(CODE_FORMATION VARCHAR2,ID_ETABLISSEMENT VARCHAR2, INTITULE_FORMATION VARCHAR2	) IS 
	 indicator BOOLEAN ;
     anomalie_CODE_FORMATION VARCHAR2(200) := CODE_FORMATION; 	
	 anomalie_ID_ETABLISSEMENT VARCHAR2(200) := ID_ETABLISSEMENT;
	 anomalie_INTITULE_FORMATION VARCHAR2(200) := INTITULE_FORMATION;
     CURSOR c_constraints is select*from METATABLE_FORMATIONS ;
     r_constraints c_constraints%ROWTYPE;
	
	 BEGIN
		 indicator := FALSE ;
     open c_constraints;
     FETCH c_constraints INTO r_constraints ;
     --EXIT WHEN c_constraints%NOTFOUND;
      IF (NOT REGEXP_LIKE(CODE_FORMATION  , r_constraints.CONSTRAINT_CODE_FORMATION)) THEN
      indicator := TRUE;
      anomalie_CODE_FORMATION := '<anomalie>'||' '|| CODE_FORMATION   ;
      END IF;
      IF (NOT REGEXP_LIKE(INTITULE_FORMATION  , r_constraints.CONSTRAINT_INTITULE_FORMATION)) THEN
       indicator := TRUE;
       anomalie_INTITULE_FORMATION := '<anomalie>' || ' '|| INTITULE_FORMATION;
      END IF;
      IF (NOT REGEXP_LIKE(ID_ETABLISSEMENT  , r_constraints.CONSTRAINT_ID_ETABLISSEMENT)) THEN
      indicator := TRUE;
       anomalie_ID_ETABLISSEMENT := '<anomalie>'||' '|| ID_ETABLISSEMENT;
      END IF;
		--Si une violation_contrainte est détecté, on insère pas
		 IF indicator = TRUE THEN --- des anomalies existent 
             INSERT INTO FORMATIONS VALUES(anomalie_CODE_FORMATION, anomalie_ID_ETABLISSEMENT, anomalie_INTITULE_FORMATION);
			 DBMS_OUTPUT.PUT_LINE('values violate constraints, marked by the keyword <anomalie>');
		 ELSE --- aucune anomalie n'a été détecté
			 INSERT INTO FORMATIONS VALUES(CODE_FORMATION, ID_ETABLISSEMENT, INTITULE_FORMATION);
		 	 DBMS_OUTPUT.PUT_LINE('no constraints have been violated');
		 END IF;
	 END;
/

-----------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------Procédure d'insertion ETABLISSEMENT----------------------------------------------------------
CREATE OR REPLACE PROCEDURE INSERT_ETABLISSEMENT(ID_ETABLISSEMENT VARCHAR2,NOM_ETABLISSEMENT VARCHAR2, TYPE_ETABLISSEMENT VARCHAR2,VILLE_ETABLISSEMENT VARCHAR2, PAYS_ETABLISSEMENT VARCHAR2) IS 
	 indicator BOOLEAN ;
	 anomalie_ID_ETABLISSEMENT VARCHAR2(200) := ID_ETABLISSEMENT;
	 anomalie_NOM_ETABLISSEMENT VARCHAR2(200) := NOM_ETABLISSEMENT;
     anomalie_TYPE_ETABLISSEMENT VARCHAR2(200) := TYPE_ETABLISSEMENT; 	
	 anomalie_VILLE_ETABLISSEMENT VARCHAR2(200) := VILLE_ETABLISSEMENT;
	 anomalie_PAYS_ETABLISSEMENT VARCHAR2(200) := PAYS_ETABLISSEMENT;
     CURSOR c_constraints is select*from METATABLE_ETABLISSEMENT ;
     r_constraints c_constraints%ROWTYPE;
	
	 BEGIN
		 indicator := FALSE ;
     open c_constraints;
     FETCH c_constraints INTO r_constraints ;
     --EXIT WHEN c_constraints%NOTFOUND;
      IF (NOT REGEXP_LIKE(ID_ETABLISSEMENT  , r_constraints.CONSTRAINT_ID_ETABLISSEMENT)) THEN
      indicator := TRUE;
      anomalie_ID_ETABLISSEMENT := '<anomalie>'||' '|| ID_ETABLISSEMENT  ;
      END IF;

      IF (NOT REGEXP_LIKE(NOM_ETABLISSEMENT , r_constraints.CONSTRAINT_NOM_ETABLISSEMENT)) THEN
       indicator := TRUE;
       anomalie_NOM_ETABLISSEMENT := '<anomalie>' || ' '|| NOM_ETABLISSEMENT;
      END IF;

      IF (NOT REGEXP_LIKE(TYPE_ETABLISSEMENT  , r_constraints.CONSTRAINT_TYPE_ETABLISSEMENT)) THEN
      indicator := TRUE;
       anomalie_TYPE_ETABLISSEMENT := '<anomalie>'||' '|| TYPE_ETABLISSEMENT;
      END IF;

      IF (NOT REGEXP_LIKE(VILLE_ETABLISSEMENT  , r_constraints.CONSTRAINT_VILLE_ETABLISSEMENT)) THEN
      indicator := TRUE;
       anomalie_VILLE_ETABLISSEMENT := '<anomalie>'||' '|| VILLE_ETABLISSEMENT;
      END IF;

      IF (NOT REGEXP_LIKE(PAYS_ETABLISSEMENT  , r_constraints.CONSTRAINT_PAYS_ETABLISSEMENT)) THEN
      indicator := TRUE;
       anomalie_PAYS_ETABLISSEMENT := '<anomalie>'||' '|| PAYS_ETABLISSEMENT;
      END IF;

		--Si une violation_contrainte est détecté, on insère pas
		 IF indicator = TRUE THEN --- des anomalies existent 
             INSERT INTO ETABLISSEMENT VALUES(anomalie_ID_ETABLISSEMENT, anomalie_NOM_ETABLISSEMENT, anomalie_TYPE_ETABLISSEMENT, anomalie_VILLE_ETABLISSEMENT,anomalie_PAYS_ETABLISSEMENT);
			 DBMS_OUTPUT.PUT_LINE('values violate constraints, marked by the keyword <anomalie>');
		 ELSE --- aucune anomalie n'a été détecté
			 INSERT INTO ETABLISSEMENT VALUES(ID_ETABLISSEMENT, NOM_ETABLISSEMENT, TYPE_ETABLISSEMENT, VILLE_ETABLISSEMENT,PAYS_ETABLISSEMENT);
		 	 DBMS_OUTPUT.PUT_LINE('no constraints have been violated');
		 END IF;
	 END;
/


----------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------Procédure d'insertion SUIVRE_FORMATION----------------------------------------------------------
CREATE OR REPLACE PROCEDURE INSERT_SUIVRE_FORMATION(CODE_FORMATION VARCHAR2,ID_CANDIDAT VARCHAR2, RESULTAT VARCHAR2,MENTION VARCHAR2, DATE_DEBUT DATE, DATE_FIN DATE) IS 
	 indicator BOOLEAN ;
	 anomalie_CODE_FORMATION VARCHAR2(200) := CODE_FORMATION;
	 anomalie_ID_CANDIDAT VARCHAR2(200) := ID_CANDIDAT;
     anomalie_RESULTAT VARCHAR2(200) := RESULTAT; 	
	 anomalie_MENTION VARCHAR2(200) := MENTION;

     CURSOR c_constraints is select*from METATABLE_SUIVRE_FORMATION ;
     r_constraints c_constraints%ROWTYPE;
	
	 BEGIN
		 indicator := FALSE ;
     open c_constraints;
     FETCH c_constraints INTO r_constraints ;
     
      IF (NOT REGEXP_LIKE(CODE_FORMATION  , r_constraints.CONSTRAINT_CODE_FORMATION)) THEN
      indicator := TRUE;
      anomalie_CODE_FORMATION := '<anomalie>'||' '|| CODE_FORMATION  ;
      END IF;

      IF (NOT REGEXP_LIKE(ID_CANDIDAT , r_constraints.CONSTRAINT_ID_CANDIDAT)) THEN
       indicator := TRUE;
       anomalie_ID_CANDIDAT := '<anomalie>' || ' '|| ID_CANDIDAT;
      END IF;

      IF (NOT REGEXP_LIKE(RESULTAT  , r_constraints.CONSTRAINT_RESULTAT)) THEN
      indicator := TRUE;
       anomalie_RESULTAT := '<anomalie>'||' '|| RESULTAT;
      END IF;

      IF (NOT REGEXP_LIKE(MENTION  , r_constraints.CONSTRAINT_MENTION)) THEN
      indicator := TRUE;
       anomalie_MENTION := '<anomalie>'||' '|| MENTION;
      END IF;


		--Si une violation_contrainte est détecté, on insère pas
		 IF indicator = TRUE THEN --- des anomalies existent 
             INSERT INTO SUIVRE_FORMATION VALUES(anomalie_CODE_FORMATION, anomalie_ID_CANDIDAT, anomalie_RESULTAT, anomalie_MENTION,DATE_DEBUT,DATE_FIN);
			 DBMS_OUTPUT.PUT_LINE('values violate constraints, marked by the keyword <anomalie>');
		 ELSE --- aucune anomalie n'a été détecté
			 INSERT INTO SUIVRE_FORMATION VALUES(CODE_FORMATION, ID_CANDIDAT, RESULTAT, MENTION,DATE_DEBUT,DATE_FIN);
		 	 DBMS_OUTPUT.PUT_LINE('no constraints have been violated');
		 END IF;
	 END;
/


----------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------Procédure d'insertion RELATION----------------------------------------------------------
CREATE OR REPLACE PROCEDURE INSERT_RELATION(ID_REF VARCHAR2,ID_CANDIDAT VARCHAR2) IS 
	 indicator BOOLEAN ;
	 anomalie_ID_REF VARCHAR2(200) := ID_REF;
	 anomalie_ID_CANDIDAT VARCHAR2(200) := ID_CANDIDAT;
     CURSOR c_constraints is select*from METATABLE_RELATION ;
     r_constraints c_constraints%ROWTYPE;
	
	 BEGIN
		 indicator := FALSE ;
     open c_constraints;
     FETCH c_constraints INTO r_constraints ;
     
      IF (NOT REGEXP_LIKE(ID_REF  , r_constraints.CONSTRAINT_ID_REF)) THEN
      indicator := TRUE;
      anomalie_ID_REF := '<anomalie>'||' '|| ID_REF  ;
      END IF;

      IF (NOT REGEXP_LIKE(ID_CANDIDAT , r_constraints.CONSTRAINT_ID_CANDIDAT)) THEN
       indicator := TRUE;
       anomalie_ID_CANDIDAT := '<anomalie>' || ' '|| ID_CANDIDAT;
      END IF;

      	--Si une violation_contrainte est détecté, on insère pas
		 IF indicator = TRUE THEN --- des anomalies existent 
             INSERT INTO RELATION VALUES(anomalie_ID_REF, anomalie_ID_CANDIDAT);
			 DBMS_OUTPUT.PUT_LINE('values violate constraints, marked by the keyword <anomalie>');
		 ELSE --- aucune anomalie n'a été détecté
			 INSERT INTO RELATION VALUES(ID_REF, ID_CANDIDAT);
		 	 DBMS_OUTPUT.PUT_LINE('no constraints have been violated');
		 END IF;
	 END;
/



----------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------Procédure d'insertion LANGUE----------------------------------------------------------
CREATE OR REPLACE PROCEDURE INSERT_LANGUES(ID_LANGUE VARCHAR2, Nom_langues VARCHAR2 , Pays_langues VARCHAR2) IS 
	 indicator BOOLEAN ;
	 anomalie_ID_LANGUE VARCHAR2(200) := ID_LANGUE;
	 anomalie_Nom_langues VARCHAR2(200) := Nom_langues;
     anomalie_Pays_langues VARCHAR2(200) := Pays_langues;
     CURSOR c_constraints is select*from METATABLE_LANGUES ;
     r_constraints c_constraints%ROWTYPE;
	
	 BEGIN
		 indicator := FALSE ;
     open c_constraints;
     FETCH c_constraints INTO r_constraints ;
     
      IF (NOT REGEXP_LIKE(ID_LANGUE  , r_constraints.CONSTRAINT_ID_LANGUE)) THEN
      indicator := TRUE;
      anomalie_ID_LANGUE := '<anomalie>'||' '|| ID_LANGUE  ;
      END IF;

      IF (NOT REGEXP_LIKE(Nom_langues , r_constraints.CONSTRAINT_Nom_langues)) THEN
       indicator := TRUE;
       anomalie_Nom_langues := '<anomalie>' || ' '|| Nom_langues;
      END IF;

      IF (NOT REGEXP_LIKE(Pays_langues , r_constraints.CONSTRAINT_Pays_langues)) THEN
       indicator := TRUE;
       anomalie_Pays_langues := '<anomalie>' || ' '|| Pays_langues;
      END IF;

      	--Si une violation_contrainte est détecté, on insère pas
		 IF indicator = TRUE THEN --- des anomalies existent 
             INSERT INTO LANGUES VALUES(anomalie_ID_LANGUE, anomalie_Nom_langues,anomalie_Pays_langues);
			 DBMS_OUTPUT.PUT_LINE('values violate constraints, marked by the keyword <anomalie>');
		 ELSE --- aucune anomalie n'a été détecté
			 INSERT INTO LANGUES VALUES(ID_LANGUE, Nom_langues, Pays_langues);
		 	 DBMS_OUTPUT.PUT_LINE('no constraints have been violated');
		 END IF;
	 END;
/

----------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------Procédure d'insertion PARLE_LANGUE----------------------------------------------------------
CREATE OR REPLACE PROCEDURE INSERT_PARLE_LANGUES(ID_LANGUE VARCHAR2, ID_CANDIDAT VARCHAR2 , SCORE VARCHAR2, NIVEAU VARCHAR2) IS 
	 indicator BOOLEAN ;
	 anomalie_ID_LANGUE VARCHAR2(200) := ID_LANGUE;
	 anomalie_ID_CANDIDAT VARCHAR2(200) := ID_CANDIDAT;
     anomalie_SCORE VARCHAR2(200) := SCORE;
      anomalie_NIVEAU VARCHAR2(200) := NIVEAU;
     CURSOR c_constraints is select*from METATABLE_PARLE_LANGUES ;
     r_constraints c_constraints%ROWTYPE;
	
	 BEGIN
		 indicator := FALSE ;
     open c_constraints;
     FETCH c_constraints INTO r_constraints ;
     
      IF (NOT REGEXP_LIKE(ID_LANGUE  , r_constraints.CONSTRAINT_ID_LANGUE)) THEN
      indicator := TRUE;
      anomalie_ID_LANGUE := '<anomalie>'||' '|| ID_LANGUE  ;
      END IF;

      IF (NOT REGEXP_LIKE(ID_CANDIDAT , r_constraints.CONSTRAINT_ID_CANDIDAT)) THEN
       indicator := TRUE;
       anomalie_ID_CANDIDAT := '<anomalie>' || ' '|| ID_CANDIDAT;
      END IF;

      IF (NOT REGEXP_LIKE(SCORE , r_constraints.CONSTRAINT_SCORE)) THEN
       indicator := TRUE;
       anomalie_SCORE := '<anomalie>' || ' '|| SCORE;
      END IF;

      IF (NOT REGEXP_LIKE(NIVEAU , r_constraints.CONSTRAINT_NIVEAU)) THEN
       indicator := TRUE;
       anomalie_NIVEAU := '<anomalie>' || ' '|| NIVEAU;
      END IF;

      	--Si une violation_contrainte est détecté, on insère pas
		 IF indicator = TRUE THEN --- des anomalies existent 
             INSERT INTO PARLE_LANGUES VALUES(anomalie_ID_LANGUE, anomalie_ID_CANDIDAT,anomalie_SCORE,anomalie_NIVEAU);
			 DBMS_OUTPUT.PUT_LINE('values violate constraints, marked by the keyword <anomalie>');
		 ELSE --- aucune anomalie n'a été détecté
			 INSERT INTO PARLE_LANGUES VALUES(ID_LANGUE, ID_CANDIDAT, SCORE, NIVEAU);
		 	 DBMS_OUTPUT.PUT_LINE('no constraints have been violated');
		 END IF;
	 END;
/

-- COMPETENCES_OPERATIONNELLES OK
CREATE OR REPLACE PROCEDURE INSERT_COMPETENCES_OPERATIONNELLES(ID_COMP_OP VARCHAR2,NOM_COMP_OP VARCHAR2,DESCRIPTION_OP VARCHAR2) IS 
     indicator BOOLEAN ;
     anomalie_ID_COMP_OP VARCHAR2(200) := ID_COMP_OP;   
     anomalie_NOM_COMP_OP VARCHAR2(200) := NOM_COMP_OP;
     anomalie_DESCRIPTION_OP VARCHAR2(200) := DESCRIPTION_OP;
     CURSOR c_constraints is select*from METATABLE_COMPETENCES_OPERATIONNELLES ;
     r_constraints c_constraints%ROWTYPE;
    
     BEGIN
         indicator := FALSE ;
     open c_constraints;
     FETCH c_constraints INTO r_constraints ;
     --EXIT WHEN c_constraints%NOTFOUND;
      IF (NOT REGEXP_LIKE(ID_COMP_OP  , r_constraints.CONSTRAINT_ID_COMP_OP)) THEN
      indicator := TRUE;
      anomalie_ID_COMP_OP := '<anomalie>'||' '|| ID_COMP_OP   ;
      END IF;
      IF (NOT REGEXP_LIKE(NOM_COMP_OP  , r_constraints.CONSTRAINT_NOM_COMP_OP)) THEN
       indicator := TRUE;
       anomalie_NOM_COMP_OP := '<anomalie>' || ' '|| NOM_COMP_OP;
      END IF;
      IF (NOT REGEXP_LIKE(DESCRIPTION_OP  , r_constraints.CONSTRAINT_DESCRIPTION_OP)) THEN
      indicator := TRUE;
       anomalie_DESCRIPTION_OP := '<anomalie>'||' '|| DESCRIPTION_OP;
      END IF;
        --Si une violation_contrainte est détecté, on insère pas
         IF indicator = TRUE THEN --- des anomalies existent 
             INSERT INTO COMPETENCES_OPERATIONNELLES VALUES(anomalie_ID_COMP_OP, anomalie_NOM_COMP_OP, anomalie_DESCRIPTION_OP);
             DBMS_OUTPUT.PUT_LINE('values violate constraints, marked by the keyword <anomalie>');
         ELSE --- aucune anomalie n'a été détecté
             INSERT INTO COMPETENCES_OPERATIONNELLES VALUES(ID_COMP_OP, NOM_COMP_OP, DESCRIPTION_OP);
             DBMS_OUTPUT.PUT_LINE('no constraints have been violated');
         END IF;
     END;
/

-- METATABLE_POSSEDER_COMP_OP OK
CREATE OR REPLACE PROCEDURE INSERT_POSSEDER_COMP_OP(ID_COMP_OP VARCHAR2,ID_CANDIDAT VARCHAR2,DATE_OBTENTION DATE) IS 
     indicator BOOLEAN ;
     anomalie_ID_COMP_OP VARCHAR2(200) := ID_COMP_OP;   
     anomalie_ID_CANDIDAT VARCHAR2(200) := ID_CANDIDAT;

     CURSOR c_constraints is select*from METATABLE_POSSEDER_COMP_OP ;
     r_constraints c_constraints%ROWTYPE;
    
     BEGIN
         indicator := FALSE ;
     open c_constraints;
     FETCH c_constraints INTO r_constraints ;
     --EXIT WHEN c_constraints%NOTFOUND;
      IF (NOT REGEXP_LIKE(ID_COMP_OP  , r_constraints.CONSTRAINT_ID_COMP_OP)) THEN
      indicator := TRUE;
      anomalie_ID_COMP_OP := '<anomalie>'||' '|| ID_COMP_OP   ;
      END IF;
      IF (NOT REGEXP_LIKE(ID_CANDIDAT  , r_constraints.CONSTRAINT_ID_CANDIDAT)) THEN
       indicator := TRUE;
       anomalie_ID_CANDIDAT := '<anomalie>' || ' '|| ID_CANDIDAT;
      END IF;
        --Si une violation_contrainte est détecté, on insère pas
         IF indicator = TRUE THEN --- des anomalies existent 
             INSERT INTO POSSEDER_COMP_OP VALUES(anomalie_ID_COMP_OP, anomalie_ID_CANDIDAT, DATE_OBTENTION);
             DBMS_OUTPUT.PUT_LINE('values violate constraints, marked by the keyword <anomalie>');
         ELSE --- aucune anomalie n'a été détecté
             INSERT INTO POSSEDER_COMP_OP VALUES(ID_COMP_OP, ID_CANDIDAT, DATE_OBTENTION);
             DBMS_OUTPUT.PUT_LINE('no constraints have been violated');
         END IF;
     END;
/

-- METATABLE_COMPETENCES_TECHNIQUES OK
CREATE OR REPLACE PROCEDURE INSERT_COMPETENCES_TECHNIQUES(ID_COMP_TECH VARCHAR2,NOM_COM VARCHAR2,TYPE_COM VARCHAR2) IS 
     indicator BOOLEAN ;
     anomalie_ID_COMP_TECH VARCHAR2(200) := ID_COMP_TECH;   
     anomalie_NOM_COM VARCHAR2(200) := NOM_COM;
     anomalie_TYPE_COM VARCHAR2(200) := TYPE_COM;
     CURSOR c_constraints is select*from METATABLE_COMPETENCES_TECHNIQUES ;
     r_constraints c_constraints%ROWTYPE;
    
     BEGIN
         indicator := FALSE ;
     open c_constraints;
     FETCH c_constraints INTO r_constraints ;
     --EXIT WHEN c_constraints%NOTFOUND;
      IF (NOT REGEXP_LIKE(ID_COMP_TECH  , r_constraints.CONSTRAINT_ID_COMP_TECH)) THEN
      indicator := TRUE;
      anomalie_ID_COMP_TECH := '<anomalie>'||' '|| ID_COMP_TECH   ;
      END IF;
      IF (NOT REGEXP_LIKE(NOM_COM  , r_constraints.CONSTRAINT_NOM_COM)) THEN
       indicator := TRUE;
       anomalie_NOM_COM := '<anomalie>' || ' '|| NOM_COM;
      END IF;
      IF (NOT REGEXP_LIKE(TYPE_COM  , r_constraints.CONSTRAINT_TYPE_COM)) THEN
      indicator := TRUE;
       anomalie_TYPE_COM := '<anomalie>'||' '|| TYPE_COM;
      END IF;
        --Si une violation_contrainte est détecté, on insère pas
         IF indicator = TRUE THEN --- des anomalies existent 
             INSERT INTO COMPETENCES_TECHNIQUES VALUES(anomalie_ID_COMP_TECH, anomalie_NOM_COM, anomalie_TYPE_COM);
             DBMS_OUTPUT.PUT_LINE('values violate constraints, marked by the keyword <anomalie>');
         ELSE --- aucune anomalie n'a été détecté
             INSERT INTO COMPETENCES_TECHNIQUES VALUES(ID_COMP_TECH, NOM_COM, TYPE_COM);
             DBMS_OUTPUT.PUT_LINE('no constraints have been violated');
         END IF;
     END;
/

-- METATABLE_POSSEDER_COMP_TECH OK
CREATE OR REPLACE PROCEDURE INSERT_POSSEDER_COMP_TECH(ID_COMP_TECH VARCHAR2,ID_CANDIDAT VARCHAR2,DATE_OBTENTION DATE, NIVEAU_MAITRISE VARCHAR2) IS 
     indicator BOOLEAN ;
     anomalie_ID_COMP_TECH VARCHAR2(200) := ID_COMP_TECH;   
     anomalie_ID_CANDIDAT VARCHAR2(200) := ID_CANDIDAT;
     anomalie_NIVEAU_MAITRISE VARCHAR2(200) := NIVEAU_MAITRISE;
     CURSOR c_constraints is select*from METATABLE_POSSEDER_COMP_TECH ;
     r_constraints c_constraints%ROWTYPE;
    
     BEGIN
         indicator := FALSE ;
     open c_constraints;
     FETCH c_constraints INTO r_constraints ;
     --EXIT WHEN c_constraints%NOTFOUND;
      IF (NOT REGEXP_LIKE(ID_COMP_TECH  , r_constraints.CONSTRAINT_ID_COMP_TECH)) THEN
      indicator := TRUE;
      anomalie_ID_COMP_TECH := '<anomalie>'||' '|| ID_COMP_TECH   ;
      END IF;
      IF (NOT REGEXP_LIKE(ID_CANDIDAT  , r_constraints.CONSTRAINT_ID_CANDIDAT)) THEN
       indicator := TRUE;
       anomalie_ID_CANDIDAT := '<anomalie>' || ' '|| ID_CANDIDAT;
      END IF;
      IF (NOT REGEXP_LIKE(NIVEAU_MAITRISE  , r_constraints.CONSTRAINT_NIVEAU_MAITRISE)) THEN
      indicator := TRUE;
       anomalie_NIVEAU_MAITRISE := '<anomalie>'||' '|| NIVEAU_MAITRISE;
      END IF;


        --Si une violation_contrainte est détecté, on insère pas
         IF indicator = TRUE THEN --- des anomalies existent 
             INSERT INTO POSSEDER_COMP_TECH VALUES(anomalie_ID_COMP_TECH, anomalie_ID_CANDIDAT, DATE_OBTENTION, anomalie_NIVEAU_MAITRISE);
             DBMS_OUTPUT.PUT_LINE('values violate constraints, marked by the keyword <anomalie>');
         ELSE --- aucune anomalie n'a été détecté
             INSERT INTO POSSEDER_COMP_TECH VALUES(ID_COMP_TECH, ID_CANDIDAT, DATE_OBTENTION,NIVEAU_MAITRISE);
             DBMS_OUTPUT.PUT_LINE('no constraints have been violated');
         END IF;
     END;
/

-- METATABLE_CENTRE_INTERET OK
CREATE OR REPLACE PROCEDURE INSERT_CENTRE_INTERET(ID_INTERET VARCHAR2, NOM_CENTRE_INTERET VARCHAR2) IS 
     indicator BOOLEAN ;
     anomalie_ID_INTERET VARCHAR2(200) := ID_INTERET;   
     anomalie_NOM_CENTRE_INTERET VARCHAR2(200) := NOM_CENTRE_INTERET;
     CURSOR c_constraints is select*from METATABLE_CENTRE_INTERET ;
     r_constraints c_constraints%ROWTYPE;
    
     BEGIN
         indicator := FALSE ;
     open c_constraints;
     FETCH c_constraints INTO r_constraints ;
     --EXIT WHEN c_constraints%NOTFOUND;
      IF (NOT REGEXP_LIKE(ID_INTERET  , r_constraints.CONSTRAINT_ID_INTERET)) THEN
      indicator := TRUE;
      anomalie_ID_INTERET := '<anomalie>'||' '|| ID_INTERET   ;
      END IF;
      IF (NOT REGEXP_LIKE(NOM_CENTRE_INTERET  , r_constraints.CONSTRAINT_NOM_CENTRE_INTERET)) THEN
       indicator := TRUE;
       anomalie_NOM_CENTRE_INTERET := '<anomalie>' || ' '|| NOM_CENTRE_INTERET;
      END IF;


        --Si une violation_contrainte est détecté, on insère pas
         IF indicator = TRUE THEN --- des anomalies existent 
             INSERT INTO CENTRE_INTERET VALUES(anomalie_ID_INTERET, anomalie_NOM_CENTRE_INTERET);
             DBMS_OUTPUT.PUT_LINE('values violate constraints, marked by the keyword <anomalie>');
         ELSE --- aucune anomalie n'a été détecté
             INSERT INTO CENTRE_INTERET VALUES(ID_INTERET, NOM_CENTRE_INTERET);
             DBMS_OUTPUT.PUT_LINE('no constraints have been violated');
         END IF;
     END;
/

-- METATABLE_AIMER_INTERET OK
CREATE OR REPLACE PROCEDURE INSERT_AIMER_INTERET(ID_INTERET VARCHAR2,ID_CANDIDAT VARCHAR2,DESCRIPTION VARCHAR2) IS 
     indicator BOOLEAN ;
     anomalie_ID_INTERET VARCHAR2(200) := ID_INTERET;   
     anomalie_ID_CANDIDAT VARCHAR2(200) := ID_CANDIDAT;
     anomalie_DESCRIPTION VARCHAR2(200) := DESCRIPTION;
     CURSOR c_constraints is select*from METATABLE_AIMER_INTERET ;
     r_constraints c_constraints%ROWTYPE;
    
     BEGIN
         indicator := FALSE ;
     open c_constraints;
     FETCH c_constraints INTO r_constraints ;
     --EXIT WHEN c_constraints%NOTFOUND;
      IF (NOT REGEXP_LIKE(ID_INTERET  , r_constraints.CONSTRAINT_ID_INTERET)) THEN
      indicator := TRUE;
      anomalie_ID_INTERET := '<anomalie>'||' '|| ID_INTERET   ;
      END IF;
      IF (NOT REGEXP_LIKE(ID_CANDIDAT  , r_constraints.CONSTRAINT_ID_CANDIDAT)) THEN
       indicator := TRUE;
       anomalie_ID_CANDIDAT := '<anomalie>' || ' '|| ID_CANDIDAT;
      END IF;
      IF (NOT REGEXP_LIKE(DESCRIPTION  , r_constraints.CONSTRAINT_DESCRIPTION)) THEN
      indicator := TRUE;
       anomalie_DESCRIPTION := '<anomalie>'||' '|| DESCRIPTION;
      END IF;
        --Si une violation_contrainte est détecté, on insère pas
         IF indicator = TRUE THEN --- des anomalies existent 
             INSERT INTO AIMER_INTERET VALUES(anomalie_ID_INTERET, anomalie_ID_CANDIDAT, anomalie_DESCRIPTION);
             DBMS_OUTPUT.PUT_LINE('values violate constraints, marked by the keyword <anomalie>');
         ELSE --- aucune anomalie n'a été détecté
             INSERT INTO AIMER_INTERET VALUES(ID_INTERET, ID_CANDIDAT, DESCRIPTION);
             DBMS_OUTPUT.PUT_LINE('no constraints have been violated');
         END IF;
     END;
/

-- METATABLE_REFERENCE OK
CREATE OR REPLACE PROCEDURE INSERT_REFERENCE(ID_REF VARCHAR2,NOM_REF VARCHAR2,PRENOM_REF VARCHAR2, POSTE VARCHAR2, ENTREPRISE_ETABLISSEMENT VARCHAR2) IS 
     indicator BOOLEAN ;
     anomalie_ID_REF VARCHAR2(200) := ID_REF;   
     anomalie_NOM_REF VARCHAR2(200) := NOM_REF;
     anomalie_PRENOM_REF VARCHAR2(200) := PRENOM_REF;
     anomalie_POSTE VARCHAR2(200) := POSTE;
     anomalie_ENTREPRISE_ETABLISSEMENT VARCHAR2(200) := ENTREPRISE_ETABLISSEMENT;
     
     CURSOR c_constraints is select*from METATABLE_REFERENCE ;
     r_constraints c_constraints%ROWTYPE;
    
     BEGIN
         indicator := FALSE ;
     open c_constraints;
     FETCH c_constraints INTO r_constraints ;
     --EXIT WHEN c_constraints%NOTFOUND;
      IF (NOT REGEXP_LIKE(ID_REF  , r_constraints.CONSTRAINT_ID_REF)) THEN
      indicator := TRUE;
      anomalie_ID_REF := '<anomalie>'||' '|| ID_REF   ;
      END IF;
      IF (NOT REGEXP_LIKE(NOM_REF  , r_constraints.CONSTRAINT_NOM_REF)) THEN
       indicator := TRUE;
       anomalie_NOM_REF := '<anomalie>' || ' '|| NOM_REF;
      END IF;
      IF (NOT REGEXP_LIKE(PRENOM_REF  , r_constraints.CONSTRAINT_PRENOM_REF)) THEN
      indicator := TRUE;
       anomalie_PRENOM_REF := '<anomalie>'||' '|| PRENOM_REF;
      END IF;
      IF (NOT REGEXP_LIKE(POSTE  , r_constraints.CONSTRAINT_POSTE)) THEN
      indicator := TRUE;
       anomalie_POSTE := '<anomalie>'||' '|| POSTE;
      END IF;
      IF (NOT REGEXP_LIKE(ENTREPRISE_ETABLISSEMENT  , r_constraints.CONSTRAINT_ENTREPRISE_ETABLISSEMENT)) THEN
      indicator := TRUE;
       anomalie_ENTREPRISE_ETABLISSEMENT := '<anomalie>'||' '|| ENTREPRISE_ETABLISSEMENT;
      END IF;

        --Si une violation_contrainte est détecté, on insère pas
         IF indicator = TRUE THEN --- des anomalies existent 
             INSERT INTO REFERENCE VALUES(anomalie_ID_REF, anomalie_NOM_REF, anomalie_PRENOM_REF, anomalie_POSTE, anomalie_ENTREPRISE_ETABLISSEMENT);
             DBMS_OUTPUT.PUT_LINE('values violate constraints, marked by the keyword <anomalie>');
         ELSE --- aucune anomalie n'a été détecté
             INSERT INTO REFERENCE VALUES(ID_REF, NOM_REF, PRENOM_REF, POSTE, ENTREPRISE_ETABLISSEMENT);
             DBMS_OUTPUT.PUT_LINE('no constraints have been violated');
         END IF;
     END;
/


--INSERTION CANDIDAT  OK
CREATE OR REPLACE PROCEDURE INSERT_CANDIDAT(ID_CANDIDAT VARCHAR2,NOM_CANDIDAT VARCHAR2,PRENOM_CANDIDAT VARCHAR2, AGE_CANDIDAT NUMBER, SEXE CHAR,DATE_NAISSANCE DATE,SITUATION_FAMILIALE CHAR,PERMIS CHAR,NATIONALITE VARCHAR2,MOBILITE VARCHAR2,PRESENTATION VARCHAR2) IS 
     indicator BOOLEAN ;
     anomalie_ID_CANDIDAT VARCHAR2(200) := ID_CANDIDAT;   
     anomalie_NOM_CANDIDAT VARCHAR2(200) := NOM_CANDIDAT;
     anomalie_PRENOM_CANDIDAT VARCHAR2(200) := PRENOM_CANDIDAT;
     anomalie_NATIONALITE VARCHAR2(200) := NATIONALITE;
     anomalie_MOBILITE VARCHAR2(200) := MOBILITE;
     anomalie_PRESENTATION VARCHAR2(200) := PRESENTATION;
     CURSOR c_constraints is select*from METATABLE_CANDIDAT ;
     r_constraints c_constraints%ROWTYPE;
    
     BEGIN
         indicator := FALSE ;
     open c_constraints;
     FETCH c_constraints INTO r_constraints ;
     --EXIT WHEN c_constraints%NOTFOUND;
      IF (NOT REGEXP_LIKE(ID_CANDIDAT  , r_constraints.CONSTRAINT_ID_CANDIDAT)) THEN
      indicator := TRUE;
      anomalie_ID_CANDIDAT := '<anomalie>'||' '|| ID_CANDIDAT   ;
      END IF;
      IF (NOT REGEXP_LIKE(NOM_CANDIDAT  , r_constraints.CONSTRAINT_NOM_CANDIDAT)) THEN
       indicator := TRUE;
       anomalie_NOM_CANDIDAT := '<anomalie>' || ' '|| NOM_CANDIDAT;
      END IF;
      IF (NOT REGEXP_LIKE(PRENOM_CANDIDAT  , r_constraints.CONSTRAINT_PRENOM_CANDIDAT)) THEN
      indicator := TRUE;
       anomalie_PRENOM_CANDIDAT := '<anomalie>'||' '|| PRENOM_CANDIDAT;
      END IF;
      IF (NOT REGEXP_LIKE(NATIONALITE  , r_constraints.CONSTRAINT_NATIONALITE)) THEN
      indicator := TRUE;
       anomalie_NATIONALITE := '<anomalie>'||' '|| NATIONALITE;
      END IF;
      IF (NOT REGEXP_LIKE(MOBILITE  , r_constraints.CONSTRAINT_MOBILITE)) THEN
      indicator := TRUE;
       anomalie_MOBILITE := '<anomalie>'||' '|| MOBILITE;
      END IF;
      IF (NOT REGEXP_LIKE(PRESENTATION  , r_constraints.CONSTRAINT_PRESENTATION)) THEN
      indicator := TRUE;
       anomalie_PRESENTATION := '<anomalie>'||' '|| PRESENTATION;
      END IF;
      

        --Si une violation_contrainte est détecté, on insère pas
         IF indicator = TRUE THEN --- des anomalies existent 
             INSERT INTO CANDIDAT VALUES(anomalie_ID_CANDIDAT, anomalie_NOM_CANDIDAT, anomalie_PRENOM_CANDIDAT, AGE_CANDIDAT, SEXE, DATE_NAISSANCE, SITUATION_FAMILIALE, PERMIS, anomalie_NATIONALITE, anomalie_MOBILITE, anomalie_PRESENTATION);
             DBMS_OUTPUT.PUT_LINE('values violate constraints, marked by the keyword <anomalie>');
         ELSE --- aucune anomalie n'a été détecté
             INSERT INTO CANDIDAT VALUES(ID_CANDIDAT, NOM_CANDIDAT, PRENOM_CANDIDAT, AGE_CANDIDAT, SEXE, DATE_NAISSANCE, SITUATION_FAMILIALE, PERMIS, NATIONALITE, MOBILITE, PRESENTATION);
             DBMS_OUTPUT.PUT_LINE('no constraints have been violated');
         END IF;
     END;
/

--CERTIFICAT OK
CREATE OR REPLACE PROCEDURE INSERT_CERTIFICAT(ID_CERTIFICAT VARCHAR2,CERTIFICATEUR VARCHAR2,TITRE VARCHAR2, DATE_DEBUT DATE, DATE_FIN DATE,MENTION VARCHAR2,ID_CANDIDAT VARCHAR2) IS 
     indicator BOOLEAN ;
     anomalie_ID_CERTIFICAT VARCHAR2(200) := ID_CERTIFICAT;   
     anomalie_CERTIFICATEUR VARCHAR2(200) := CERTIFICATEUR;
     anomalie_TITRE VARCHAR2(200) := TITRE;
     anomalie_MENTION VARCHAR2(200) := MENTION;
     anomalie_ID_CANDIDAT VARCHAR2(200) := ID_CANDIDAT;
    CURSOR c_constraints is select*from METATABLE_CERTIFICAT ;
     r_constraints c_constraints%ROWTYPE;
    
     BEGIN
         indicator := FALSE ;
     open c_constraints;
     FETCH c_constraints INTO r_constraints ;
     --EXIT WHEN c_constraints%NOTFOUND;
      IF (NOT REGEXP_LIKE(ID_CERTIFICAT  , r_constraints.CONSTRAINT_ID_CERTIFICAT)) THEN
      indicator := TRUE;
      anomalie_ID_CERTIFICAT := '<anomalie>'||' '|| ID_CERTIFICAT   ;
      END IF;
      IF (NOT REGEXP_LIKE(CERTIFICATEUR  , r_constraints.CONSTRAINT_CERTIFICATEUR)) THEN
       indicator := TRUE;
       anomalie_CERTIFICATEUR := '<anomalie>' || ' '|| CERTIFICATEUR;
      END IF;
      IF (NOT REGEXP_LIKE(TITRE  , r_constraints.CONSTRAINT_TITRE)) THEN
      indicator := TRUE;
       anomalie_TITRE := '<anomalie>'||' '|| TITRE;
      END IF;
      IF (NOT REGEXP_LIKE(MENTION  , r_constraints.CONSTRAINT_MENTION)) THEN
      indicator := TRUE;
       anomalie_MENTION := '<anomalie>'||' '|| MENTION;
      END IF;
      IF (NOT REGEXP_LIKE(ID_CANDIDAT  , r_constraints.CONSTRAINT_ID_CANDIDAT)) THEN
      indicator := TRUE;
       anomalie_ID_CANDIDAT := '<anomalie>'||' '|| ID_CANDIDAT;
      END IF;
      

        --Si une violation_contrainte est détecté, on insère pas
         IF indicator = TRUE THEN --- des anomalies existent 
             INSERT INTO CERTIFICAT VALUES(anomalie_ID_CERTIFICAT, anomalie_CERTIFICATEUR, anomalie_TITRE, DATE_DEBUT, DATE_FIN, anomalie_MENTION, anomalie_ID_CANDIDAT);
             DBMS_OUTPUT.PUT_LINE('values violate constraints, marked by the keyword <anomalie>');
         ELSE --- aucune anomalie n'a été détecté
             INSERT INTO CERTIFICAT VALUES(ID_CERTIFICAT, CERTIFICATEUR, TITRE, DATE_DEBUT, DATE_FIN, MENTION, ID_CANDIDAT);
             DBMS_OUTPUT.PUT_LINE('no constraints have been violated');
         END IF;
     END;
/
--BEGIN INSERT_CERTIFICAT(1,'PARIS 18','LICENCE 3','01-01-2020','01-09-2020','BIEN',1); END;

-- PHOTOS OK
CREATE OR REPLACE PROCEDURE INSERT_PHOTOS(ID_PHOTO VARCHAR2,PHOTO VARCHAR2,ID_CANDIDAT VARCHAR2) IS 
     indicator BOOLEAN ;
     anomalie_ID_PHOTO VARCHAR2(200) := ID_PHOTO;   
     anomalie_PHOTO VARCHAR2(200) := PHOTO;
     anomalie_ID_CANDIDAT VARCHAR2(200) := ID_CANDIDAT;
     CURSOR c_constraints is select*from METATABLE_PHOTOS ;
     r_constraints c_constraints%ROWTYPE;
    
     BEGIN
         indicator := FALSE ;
     open c_constraints;
     FETCH c_constraints INTO r_constraints ;
     --EXIT WHEN c_constraints%NOTFOUND;
      IF (NOT REGEXP_LIKE(ID_PHOTO  , r_constraints.CONSTRAINT_ID_PHOTO)) THEN
      indicator := TRUE;
      anomalie_ID_PHOTO := '<anomalie>'||' '|| ID_PHOTO   ;
      END IF;
      IF (NOT REGEXP_LIKE(PHOTO  , r_constraints.CONSTRAINT_PHOTO)) THEN
       indicator := TRUE;
       anomalie_PHOTO := '<anomalie>' || ' '|| PHOTO;
      END IF;
      IF (NOT REGEXP_LIKE(ID_CANDIDAT  , r_constraints.CONSTRAINT_ID_CANDIDAT)) THEN
      indicator := TRUE;
       anomalie_ID_CANDIDAT := '<anomalie>'||' '|| ID_CANDIDAT;
      END IF;
        --Si une violation_contrainte est détecté, on insère pas
         IF indicator = TRUE THEN --- des anomalies existent 
             INSERT INTO PHOTOS VALUES(anomalie_ID_PHOTO, anomalie_PHOTO, anomalie_ID_CANDIDAT);
             DBMS_OUTPUT.PUT_LINE('values violate constraints, marked by the keyword <anomalie>');
         ELSE --- aucune anomalie n'a été détecté
             INSERT INTO PHOTOS VALUES(ID_PHOTO, PHOTO, ID_CANDIDAT);
             DBMS_OUTPUT.PUT_LINE('no constraints have been violated');
         END IF;
     END;
/

-- CONTACTS OK
CREATE OR REPLACE PROCEDURE INSERT_CONTACTS(ID_CONTACT VARCHAR2,PAYS VARCHAR2,VILLE VARCHAR2,CODE_POSTALE NUMBER,NUMERO_RUE VARCHAR2,RUE VARCHAR2,TEL VARCHAR2,MAIL VARCHAR2, LIEN_FACEBOOK VARCHAR2, LIEN_LINKEDIN VARCHAR2, LIEN_SKYPE VARCHAR2, LIEN_INSTAGRAM VARCHAR2, LIEN_SITE_WEB VARCHAR2, ID_CANDIDAT VARCHAR2) IS 
     indicator BOOLEAN ;
     anomalie_ID_CONTACT VARCHAR2(200) := ID_CONTACT;   
     anomalie_PAYS VARCHAR2(200) := PAYS;
     anomalie_VILLE VARCHAR2(200) := VILLE;
     anomalie_NUMERO_RUE VARCHAR2(200) := NUMERO_RUE;
     anomalie_RUE VARCHAR2(200) := RUE;
     anomalie_TEL VARCHAR2(200) := TEL;
     anomalie_MAIL VARCHAR2(200) := MAIL;
     anomalie_LIEN_FACEBOOK VARCHAR2(200) := LIEN_FACEBOOK;
     anomalie_LIEN_LINKEDIN VARCHAR2(200) := LIEN_LINKEDIN;
     anomalie_LIEN_SKYPE VARCHAR2(200) := LIEN_SKYPE;
     anomalie_LIEN_INSTAGRAM VARCHAR2(200) := LIEN_INSTAGRAM;
     anomalie_LIEN_SITE_WEB VARCHAR2(200) := LIEN_SITE_WEB;
     anomalie_ID_CANDIDAT VARCHAR2(200) := ID_CANDIDAT;


     CURSOR c_constraints is select*from METATABLE_CONTACTS ;
     r_constraints c_constraints%ROWTYPE;
    
     BEGIN
         indicator := FALSE ;
     open c_constraints;
     FETCH c_constraints INTO r_constraints ;
     --EXIT WHEN c_constraints%NOTFOUND;
      IF (NOT REGEXP_LIKE(ID_CONTACT  , r_constraints.CONSTRAINT_ID_CONTACT)) THEN
      indicator := TRUE;
      anomalie_ID_CONTACT := '<anomalie>'||' '|| ID_CONTACT   ;
      END IF;
      IF (NOT REGEXP_LIKE(PAYS  , r_constraints.CONSTRAINT_PAYS)) THEN
      indicator := TRUE;
       anomalie_PAYS := '<anomalie>'||' '|| PAYS;
      END IF;
      IF (NOT REGEXP_LIKE(VILLE  , r_constraints.CONSTRAINT_VILLE)) THEN
      indicator := TRUE;
       anomalie_VILLE := '<anomalie>'||' '|| VILLE;
      END IF;
      IF (NOT REGEXP_LIKE(NUMERO_RUE  , r_constraints.CONSTRAINT_NUMERO_RUE)) THEN
      indicator := TRUE;
       anomalie_NUMERO_RUE := '<anomalie>'||' '|| NUMERO_RUE;
      END IF;
      IF (NOT REGEXP_LIKE(RUE  , r_constraints.CONSTRAINT_RUE)) THEN
      indicator := TRUE;
       anomalie_RUE := '<anomalie>'||' '|| RUE;
      END IF;
      IF (NOT REGEXP_LIKE(TEL  , r_constraints.CONSTRAINT_TEL)) THEN
      indicator := TRUE;
       anomalie_TEL := '<anomalie>'||' '|| TEL;
      END IF;
      IF (NOT REGEXP_LIKE(MAIL  , r_constraints.CONSTRAINT_MAIL)) THEN
      indicator := TRUE;
       anomalie_MAIL := '<anomalie>'||' '|| MAIL;
      END IF;
      IF (NOT REGEXP_LIKE(LIEN_FACEBOOK  , r_constraints.CONSTRAINT_LIEN_FACEBOOK)) THEN
      indicator := TRUE;
       anomalie_LIEN_FACEBOOK := '<anomalie>'||' '|| LIEN_FACEBOOK;
      END IF;
      IF (NOT REGEXP_LIKE(LIEN_LINKEDIN  , r_constraints.CONSTRAINT_LIEN_LINKEDIN)) THEN
      indicator := TRUE;
       anomalie_LIEN_LINKEDIN := '<anomalie>'||' '|| LIEN_LINKEDIN;
      END IF;
      IF (NOT REGEXP_LIKE(LIEN_SKYPE  , r_constraints.CONSTRAINT_LIEN_SKYPE)) THEN
      indicator := TRUE;
       anomalie_LIEN_SKYPE := '<anomalie>'||' '|| LIEN_SKYPE;
      END IF;
      IF (NOT REGEXP_LIKE(LIEN_INSTAGRAM  , r_constraints.CONSTRAINT_LIEN_INSTAGRAM)) THEN
      indicator := TRUE;
       anomalie_LIEN_INSTAGRAM := '<anomalie>'||' '|| LIEN_INSTAGRAM;
      END IF;
      IF (NOT REGEXP_LIKE(LIEN_SITE_WEB  , r_constraints.CONSTRAINT_LIEN_SITE_WEB)) THEN
      indicator := TRUE;
       anomalie_LIEN_SITE_WEB := '<anomalie>'||' '|| LIEN_SITE_WEB;
      END IF;
      IF (NOT REGEXP_LIKE(ID_CANDIDAT  , r_constraints.CONSTRAINT_ID_CANDIDAT)) THEN
      indicator := TRUE;
       anomalie_ID_CANDIDAT := '<anomalie>'||' '|| ID_CANDIDAT;
      END IF;

        --Si une violation_contrainte est détecté, on insère pas
         IF indicator = TRUE THEN --- des anomalies existent 
             INSERT INTO CONTACTS VALUES(anomalie_ID_CONTACT, anomalie_PAYS, anomalie_VILLE, CODE_POSTALE,anomalie_NUMERO_RUE,anomalie_RUE,anomalie_TEL,anomalie_MAIL,anomalie_LIEN_FACEBOOK,anomalie_LIEN_LINKEDIN,anomalie_LIEN_SKYPE,anomalie_LIEN_INSTAGRAM,anomalie_LIEN_SITE_WEB,anomalie_ID_CANDIDAT);
             DBMS_OUTPUT.PUT_LINE('values violate constraints, marked by the keyword <anomalie>');
         ELSE --- aucune anomalie n'a été détecté
             INSERT INTO CONTACTS VALUES(ID_CONTACT, PAYS, VILLE, CODE_POSTALE, NUMERO_RUE, RUE, TEL, MAIL,LIEN_FACEBOOK,LIEN_LINKEDIN,LIEN_SKYPE,LIEN_INSTAGRAM,LIEN_SITE_WEB,ID_CANDIDAT);
             DBMS_OUTPUT.PUT_LINE('no constraints have been violated');
         END IF;
     END;
/
-- BEGIN INSERT_CONTACTS(1,'FRANCE','PARIS',93300,93,' Rue de la mission',0612345678,'paris@france.com','','','','','',1); END;

-- EXPERIENCE_PROFESSIONNELLE OK
CREATE OR REPLACE PROCEDURE INSERT_EXPERIENCE_PROFESSIONNELLE(ID_EXP_PRO VARCHAR2,TITRE_POSTE VARCHAR2,ENTREPRISE VARCHAR2,PAYS VARCHAR2,VILLE VARCHAR2,DATE_DEBUT DATE,DATE_FIN DATE,MISSION VARCHAR2,TACHES VARCHAR2,ID_CANDIDAT VARCHAR2) IS 
     indicator BOOLEAN ;
     anomalie_ID_EXP_PRO VARCHAR2(200) := ID_EXP_PRO;   
     anomalie_TITRE_POSTE VARCHAR2(200) := TITRE_POSTE;
     anomalie_ENTREPRISE VARCHAR2(200) := ENTREPRISE;
     anomalie_PAYS VARCHAR2(200) := PAYS;
     anomalie_VILLE VARCHAR2(200) := VILLE;
     anomalie_MISSION VARCHAR2(200) := MISSION;
     anomalie_TACHES VARCHAR2(200) := TACHES;
     anomalie_ID_CANDIDAT VARCHAR2(200) := ID_CANDIDAT;

     CURSOR c_constraints is select*from METATABLE_EXPERIENCE_PROFESSIONNELLE ;
     r_constraints c_constraints%ROWTYPE;
    
     BEGIN
         indicator := FALSE ;
     open c_constraints;
     FETCH c_constraints INTO r_constraints ;
     --EXIT WHEN c_constraints%NOTFOUND;
      IF (NOT REGEXP_LIKE(ID_EXP_PRO  , r_constraints.CONSTRAINT_ID_EXP_PRO)) THEN
      indicator := TRUE;
      anomalie_ID_EXP_PRO := '<anomalie>'||' '|| ID_EXP_PRO   ;
      END IF;
      IF (NOT REGEXP_LIKE(TITRE_POSTE  , r_constraints.CONSTRAINT_TITRE_POSTE)) THEN
       indicator := TRUE;
       anomalie_TITRE_POSTE := '<anomalie>' || ' '|| TITRE_POSTE;
      END IF;
      IF (NOT REGEXP_LIKE(ENTREPRISE  , r_constraints.CONSTRAINT_ENTREPRISE)) THEN
      indicator := TRUE;
       anomalie_ENTREPRISE := '<anomalie>'||' '|| ENTREPRISE;
      END IF;

      IF (NOT REGEXP_LIKE(PAYS  , r_constraints.CONSTRAINT_PAYS)) THEN
      indicator := TRUE;
       anomalie_PAYS := '<anomalie>'||' '|| PAYS;
      END IF;
            IF (NOT REGEXP_LIKE(VILLE  , r_constraints.CONSTRAINT_VILLE)) THEN
      indicator := TRUE;
       anomalie_VILLE := '<anomalie>'||' '|| VILLE;
      END IF;
            IF (NOT REGEXP_LIKE(MISSION  , r_constraints.CONSTRAINT_MISSIONS)) THEN
      indicator := TRUE;
       anomalie_MISSION := '<anomalie>'||' '|| MISSION;
      END IF;
            IF (NOT REGEXP_LIKE(TACHES  , r_constraints.CONSTRAINT_TACHES)) THEN
      indicator := TRUE;
       anomalie_TACHES := '<anomalie>'||' '|| TACHES;
      END IF;
            IF (NOT REGEXP_LIKE(ID_CANDIDAT  , r_constraints.CONSTRAINT_ID_CANDIDAT)) THEN
      indicator := TRUE;
       anomalie_ID_CANDIDAT := '<anomalie>'||' '|| ID_CANDIDAT;
      END IF;

        --Si une violation_contrainte est détecté, on insère pas
         IF indicator = TRUE THEN --- des anomalies existent 
             INSERT INTO EXPERIENCE_PROFESSIONNELLE VALUES(anomalie_ID_EXP_PRO, anomalie_TITRE_POSTE, anomalie_ENTREPRISE, anomalie_PAYS, anomalie_VILLE,DATE_DEBUT,DATE_FIN,anomalie_MISSION,anomalie_TACHES,anomalie_ID_CANDIDAT);
             DBMS_OUTPUT.PUT_LINE('values violate constraints, marked by the keyword <anomalie>');
         ELSE --- aucune anomalie n'a été détecté
             INSERT INTO EXPERIENCE_PROFESSIONNELLE VALUES(ID_EXP_PRO, TITRE_POSTE, ENTREPRISE, PAYS, VILLE, DATE_DEBUT, DATE_FIN, MISSION, TACHES, ID_CANDIDAT);
             DBMS_OUTPUT.PUT_LINE('no constraints have been violated');
         END IF;
     END;
/
-- BEGIN INSERT_EXPERIENCE_PROFESSIONNELLE(1,'titre poste','PINEAPPLE','FRANCE','PARIS','01-01-2020','01-02-2020','la mission','realiser plan',1); END;

-- PROJETS OK
CREATE OR REPLACE PROCEDURE INSERT_PROJETS(ID_PROJET VARCHAR2,TITRE_PROJET VARCHAR2,TYPE_PROJET VARCHAR2,PAYS VARCHAR2,VILLE VARCHAR2,DATE_DEBUT DATE,DATE_FIN DATE,MISSION VARCHAR2,TACHES VARCHAR2,ID_CANDIDAT VARCHAR2) IS 
     indicator BOOLEAN ;
     anomalie_ID_PROJET VARCHAR2(200) := ID_PROJET;   
     anomalie_TITRE_PROJET VARCHAR2(200) := TITRE_PROJET;
     anomalie_TYPE_PROJET VARCHAR2(200) := TYPE_PROJET;
     anomalie_PAYS VARCHAR2(200) := PAYS;
     anomalie_VILLE VARCHAR2(200) := VILLE;
     anomalie_MISSION VARCHAR2(200) := MISSION;
     anomalie_TACHES VARCHAR2(200) := TACHES;
     anomalie_ID_CANDIDAT VARCHAR2(200) := ID_CANDIDAT;

     CURSOR c_constraints is select*from METATABLE_PROJETS ;
     r_constraints c_constraints%ROWTYPE;
    
     BEGIN
         indicator := FALSE ;
     open c_constraints;
     FETCH c_constraints INTO r_constraints ;
     --EXIT WHEN c_constraints%NOTFOUND;
      IF (NOT REGEXP_LIKE(ID_PROJET  , r_constraints.CONSTRAINT_ID_PROJET)) THEN
      indicator := TRUE;
      anomalie_ID_PROJET := '<anomalie>'||' '|| ID_PROJET   ;
      END IF;
      IF (NOT REGEXP_LIKE(TITRE_PROJET  , r_constraints.CONSTRAINT_TITRE_PROJET)) THEN
       indicator := TRUE;
       anomalie_TITRE_PROJET := '<anomalie>' || ' '|| TITRE_PROJET;
      END IF;
      IF (NOT REGEXP_LIKE(TYPE_PROJET  , r_constraints.CONSTRAINT_TYPE_PROJET)) THEN
      indicator := TRUE;
       anomalie_TYPE_PROJET := '<anomalie>'||' '|| TYPE_PROJET;
      END IF;

      IF (NOT REGEXP_LIKE(PAYS  , r_constraints.CONSTRAINT_PAYS)) THEN
      indicator := TRUE;
       anomalie_PAYS := '<anomalie>'||' '|| PAYS;
      END IF;
            IF (NOT REGEXP_LIKE(VILLE  , r_constraints.CONSTRAINT_VILLE)) THEN
      indicator := TRUE;
       anomalie_VILLE := '<anomalie>'||' '|| VILLE;
      END IF;
            IF (NOT REGEXP_LIKE(MISSION  , r_constraints.CONSTRAINT_MISSIONS)) THEN
      indicator := TRUE;
       anomalie_MISSION := '<anomalie>'||' '|| MISSION;
      END IF;
            IF (NOT REGEXP_LIKE(TACHES  , r_constraints.CONSTRAINT_TACHES)) THEN
      indicator := TRUE;
       anomalie_TACHES := '<anomalie>'||' '|| TACHES;
      END IF;
            IF (NOT REGEXP_LIKE(ID_CANDIDAT  , r_constraints.CONSTRAINT_ID_CANDIDAT)) THEN
      indicator := TRUE;
       anomalie_ID_CANDIDAT := '<anomalie>'||' '|| ID_CANDIDAT;
      END IF;

        --Si une violation_contrainte est détecté, on insère pas
         IF indicator = TRUE THEN --- des anomalies existent 
             INSERT INTO PROJETS VALUES(anomalie_ID_PROJET, anomalie_TITRE_PROJET, anomalie_TYPE_PROJET, anomalie_PAYS, anomalie_VILLE,DATE_DEBUT,DATE_FIN,anomalie_MISSION,anomalie_TACHES,anomalie_ID_CANDIDAT);
             DBMS_OUTPUT.PUT_LINE('values violate constraints, marked by the keyword <anomalie>');
         ELSE --- aucune anomalie n'a été détecté
             INSERT INTO PROJETS VALUES(ID_PROJET, TITRE_PROJET, TYPE_PROJET, PAYS, VILLE, DATE_DEBUT, DATE_FIN, MISSION, TACHES, ID_CANDIDAT);
             DBMS_OUTPUT.PUT_LINE('no constraints have been violated');
         END IF;
     END;
/
-- BEGIN INSERT_PROJETS(1,'PROJET UNO','PERSONELLE','FRANCE','PARIS','01-01-2020','01-02-2020','faire uno','realiser plan',1); END;