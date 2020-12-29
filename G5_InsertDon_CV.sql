--PROMPT =========================================================
--PROMPT >> Table : INSERTION METATABLE                                  
--PROMPT =========================================================

INSERT INTO METATABLE_CANDIDAT VALUES('^[0-9]+$',
								'^[A-Z]+((-| )?[A-Z]+)*$',
								'^[A-Z]+[(-| )?[A-Za-zàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]+]*$',
								'^([0-9]{1,2})|NULL$',
								'^(M|F)|NULL$',
								NULL,
								'^(M|C|V|P)|NULL$',
								'^(B|A)|NULL$',
								'^([A-Z]+[(-| )?[A-Za-zàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]+]*)|NULL$',
								'^([A-Z]+[(-| )?[A-Za-z]+]*)|NULL$',
								NULL);
								
					
INSERT INTO METATABLE_CERTIFICAT VALUES('^[0-9]+$',
									'^([A-Z]+[(-| )?[A-Z]+]*)|NULL$',
									'^[A-Za-z0-9 -]+$',
									NULL,
									NULL,
									'^([A-Z]+)|NULL$',
									'^[0-9]+$');
		
		
INSERT INTO METATABLE_PHOTOS VALUES('^[0-9]+$',
								'^((2020-12-10-PH_)[A-Z]+[(-| |_)?[A-Za-z]+]*\.(jpg|gif|png|jpeg))|NULL$',
								'^[0-9]+$');		
								
INSERT INTO METATABLE_CONTACTS VALUES('^[0-9]+$',
								'^([A-Z]+[(-| )?[A-Z]+]*)|NULL$',
								'^([A-Z]+[(-| )?[A-Z]+]*)|NULL$',
								'^([0-9]{5})|NULL$',
								'^([0-9]{1,5})|NULL$',
								'^([A-Z]+[(-| )?[A-Za-zàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]+]*)|NULL$',
								'^((([\+]|[0]{2})([3]{2}))[1-9]([0-9]{8}))|NULL$',
								'^([A-Za-z]+[A-Za-z0-9.]+@[A-Za-z0-9.-]+.[A-Za-z]{2,4})|NULL$',
								'^((http|https|ftp)?(:/)*[A-Za-z0-9/_]+\.[A-Za-z]{2,8}[A-Za-z0-9/]*)|NULL$',
								'^((http|https|ftp)?(:/)*[A-Za-z0-9/_]+\.[A-Za-z]{2,8}[A-Za-z0-9/]*)|NULL$',
								'^((http|https|ftp)?(:/)*[A-Za-z0-9/_]+\.[A-Za-z]{2,8}[A-Za-z0-9/]*)|NULL$',
								'^((http|https|ftp)?(:/)*[A-Za-z0-9/_]+\.[A-Za-z]{2,8}[A-Za-z0-9/]*)|NULL$',
								'^((http|https|ftp)?(:/)*[A-Za-z0-9/_]+\.[A-Za-z]{2,8}[A-Za-z0-9/]*)|NULL$',
								'^[0-9]+$');
								
								
INSERT INTO METATABLE_EXPERIENCE_PROFESSIONNELLE VALUES('^[0-9]+$',
								'^[a-zA-Zàáâãäåçèéêëìíîïðòóôõöùúûüýÿ -]+$',
								'^[A-Za-z0-9àáâãäåçèéêëìíîïðòóôõöùúûüýÿ -]+$',
								'^([A-Z]+[(-| )?[A-Z]+]*)|NULL$',
								'^([A-Z]+[(-| )?[A-Z]+]*)|NULL$',
								NULL,
								NULL,
								NULL,
								NULL,
								'^[0-9]+$');								
								
								
INSERT INTO METATABLE_PROJETS VALUES('^[0-9]+$',
								'^[a-zA-Z0-9àáâãäåçèéêëìíîïðòóôõöùúûüýÿ -]+$',
								'^([a-zA-Z]+)|NULL$',
								'^([A-Z]+[(-| )?[A-Z]+]*)|NULL$',
								'^([A-Z]+[(-| )?[A-Z]+]*)|NULL$',
								NULL,
								NULL,
								NULL,
								NULL,
								'^[0-9]+$');									
								

INSERT INTO METATABLE_LANGUES VALUES('^[0-9]+$',
								'^[A-Za-z]+[(-| )?[A-Za-zàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]+]*$',
								'^([A-Z]+[(-| )?[A-Z]+]*)|NULL$');								
								
								
INSERT INTO METATABLE_PARLE_LANGUES VALUES('^[0-9]+$',
								'^[0-9]+$',
								'^([0-9]+(,|/|.)?[0-9]*)|NULL$',
								'^[0-9A-Za-z]+$');		

INSERT INTO METATABLE_FORMATIONS VALUES('^[0-9]+$','^[0-9]+$','^[A-Z0-9]+((-| )?[A-Z0-9]+)*$');

INSERT INTO METATABLE_ETABLISSEMENT VALUES('^[0-9]+$',
											'^[A-Z0-9]+((-| )?[A-Z0-9]+)*$',
											'^([A-Z]+((-| )?[A-Z]+)*)|NULL$',
											'^([A-Z]+[(-| )?[A-Z]+]*)|NULL$',
											'^([A-Z]+[(-| )?[A-Z]+]*)|NULL$');


INSERT INTO METATABLE_SUIVRE_FORMATION VALUES('^[0-9]+$',
								'^[0-9]+$',
								'^([0-9]+(,|/|.)?[0-9]*)|NULL$',
								'^([A-Za-z]+[(-| )?[A-Za-zàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]+]*)|NULL$',
								NULL,
								NULL);								
								
								
INSERT INTO METATABLE_RELATION VALUES('^[0-9]+$',
								'^[0-9]+$');									
								
								
-- '^[A-Z]+((-| )?[A-Z]+)*$' pour les nom/prenom et '^[[:alpha:]-[:space:]]+$' pour les descriptions								
INSERT INTO METATABLE_COMPETENCES_OPERATIONNELLES  VALUES('^[0-9]+$','^[A-Z]+((-| )?[A-Z]+)*$','^([a-zA-Z0-9àáâãäåçèéêëìíîïðòóôõöùúûüýÿ -]+)|NULL$');

INSERT INTO METATABLE_POSSEDER_COMP_OP  VALUES('^[0-9]+$','^[0-9]+$',NULL);

INSERT INTO METATABLE_COMPETENCES_TECHNIQUES  VALUES('^[0-9]+$','^[A-Z]+((-| )?[A-Z]+)*$','^([A-Z]+[(-| )?[A-Za-zàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]+]*)|NULL$');

INSERT INTO METATABLE_POSSEDER_COMP_TECH  VALUES('^[0-9]+$','^[0-9]+$',NULL,'^DEBUTANT|MOYEN|EXPERT$');

INSERT INTO METATABLE_CENTRE_INTERET  VALUES('^[0-9]+$','^[A-Z]+((-| )?[A-Z]+)*$');

-- juste des id
INSERT INTO METATABLE_AIMER_INTERET  VALUES('^[0-9]+$','^[0-9]+$',NULL);

INSERT INTO METATABLE_REFERENCE  VALUES('^[0-9]+$','^[A-Z]+((-| )?[A-Z]+)*$','^[A-Z]+[(-| )?[A-Za-zàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]+]*$','^([A-Z]+[(-| )?[A-Za-zàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]+]*)|NULL$','^([a-zA-Z0-9àáâãäåçèéêëìíîïðòóôõöùúûüýÿ -]+)|NULL$');




--POUR TESTER NOS INSERTIONS SUR APEX ORACLE, on a du mettre BEGIN et END  --
-- CE QUI PEUT ENGENDRER UNE ERREUR SUR ORACLE MONSIEUR -- 

/*
BEGIN

INSERT_ETABLISSEMENT(1,'PARIS NORD','TYPE ETABLISSEMENT','VILLETANEUSE','FRANCE');
INSERT_ETABLISSEMENT(2,'PARIS DES CARTES','TYPE ETABLISSEMENT','PARIS','FRANCE');
INSERT_ETABLISSEMENT(3,'HARVARD','TYPE ETABLISSEMENT','CAMBRIDGE','ETATS-UNIS');
INSERT_ETABLISSEMENT(4,'STANFORD','TYPE ETABLISSEMENT','CALIFORNIE','ETATS-UNIS');
INSERT_ETABLISSEMENT(5,'PARIS HUIT','TYPE ETABLISSEMENT','SAINT-DENIS','FRANCE');

INSERT_CANDIDAT(1,'SMITH','JOHN',25,'M','24-12-1995','M','B','FR','oui','En recherche de stage pour une durée de 6 mois dans le domaine informatique');
INSERT_CANDIDAT(2,'SMITH','MARIE',18,'F','24-12-2002','C','B','FR','oui','En recherche de stage pour une durée de 4 mois dans le domaine informatique');
INSERT_CANDIDAT(3,'CAGE','LUKE',19,'M','24-12-2001','C','B','FR','non','En recherche de stage pour une durée de 3 mois dans le commerce');
INSERT_CANDIDAT(4,'SNOW','MAXIME',24,'M','24-12-1996','C','B','FR','non','En recherche de travail dans le domaine informatique décisionnel');
INSERT_CANDIDAT(5,'SUN','ROBIN',24,'F','24-12-1996','P','B','FR','oui','En recherche de stage pour une durée de 6 mois dans le domaine de la constuction immobilière');
INSERT_CANDIDAT(6,'IVANENKO','KATARINA',36,'F','24-12-1984','M','B','FR','oui','En recherche de stage pour une durée de 6 mois');
INSERT_CANDIDAT(7,'DOLOVE','JEAN',34,'M','24-12-1986','V','B','FR','non','En recherche de travail dans le domaine informatique');
INSERT_CANDIDAT(8,'STARKY','TONY',45,'M','14-02-1975','C','B','FR','oui','En recherche de travail dans le domaine intelligence artificiel');
INSERT_CANDIDAT(9,'PARKER','PETER',25,'M','24-12-1995','M','B','FR','oui','En recherche de stage pour une durée de 6 mois dans le domaine du bio-informatique');

-- FORMATION A ETE CHANGER 3 ARG MNT
INSERT_FORMATIONS(1,1,'Formation data engineer');
INSERT_FORMATIONS(2,2,'Formation data scientist');
INSERT_FORMATIONS(3,3,'Formation programmation python');
INSERT_FORMATIONS(4,4,'Formation programmation c++');
INSERT_FORMATIONS(5,5,'Formation entrepreneur');

INSERT_SUIVRE_FORMATION(1,1,'88/100','TB','01-01-1999','01-02-1999');
INSERT_SUIVRE_FORMATION(1,3,'59/100','P','05-08-1999','05-12-1999');
INSERT_SUIVRE_FORMATION(2,1,'74/100','B','01-01-1999','01-02-1999');
INSERT_SUIVRE_FORMATION(2,4,'51/100','P','01-01-2002','01-04-2002');
INSERT_SUIVRE_FORMATION(3,1,'77/100','B','01-01-1999','01-09-1999');
INSERT_SUIVRE_FORMATION(4,7,'67/100','AB','01-01-2004','01-01-2005');
INSERT_SUIVRE_FORMATION(5,6,'69/100','AB','01-01-2002','01-01-2003');
INSERT_SUIVRE_FORMATION(5,4,'55/100','P','01-04-1999','01-09-2001');

INSERT_COMPETENCES_OPERATIONNELLES(1,'programmation langage c++','savoir programmer dans le langage c++');
INSERT_COMPETENCES_OPERATIONNELLES(2,'programmation langage python','savoir programmer dans le langage python');
INSERT_COMPETENCES_OPERATIONNELLES(3,'programmation langage java','savoir programmer dans le langage java');
INSERT_COMPETENCES_OPERATIONNELLES(4,'formation sécurite informatique','savoir former les employés a la sécuriter informatique');
INSERT_COMPETENCES_OPERATIONNELLES(5,'rediger documentation','savoir rediger des documentations');

INSERT_POSSEDER_COMP_OP(1,1,'30-01-2020');
INSERT_POSSEDER_COMP_OP(1,2,'01-05-2020');
INSERT_POSSEDER_COMP_OP(3,1,'01-07-2020');
INSERT_POSSEDER_COMP_OP(4,2,'01-09-2020');
INSERT_POSSEDER_COMP_OP(5,8,'01-08-2020');
INSERT_POSSEDER_COMP_OP(5,7,'01-03-2020');
INSERT_POSSEDER_COMP_OP(2,7,'01-03-2020');

INSERT_CERTIFICAT(1,'PARIS 53','titre certificat 1','01-01-1999','01-07-2020','TB',1);
INSERT_CERTIFICAT(2,'PARIS 53','titre certificat 2','01-01-1999','01-01-2020','TB',1);
INSERT_CERTIFICAT(3,'PARIS 53','titre certificat 3','01-01-1999','01-08-2020','B',5);
INSERT_CERTIFICAT(4,'PARIS 53','titre certificat 4','01-01-1999','01-07-2020','AS',3);
INSERT_CERTIFICAT(5,'PARIS 53','titre certificat 5','01-01-1999','01-01-2020','B',1);
INSERT_CERTIFICAT(6,'PARIS 53','titre certificat 6','01-01-1999','01-01-2020','TB',1);
INSERT_CERTIFICAT(7,'PARIS 53','titre certificat 7','01-01-1999','01-05-2020','P',1);
INSERT_CERTIFICAT(8,'PARIS 53','titre certificat 8','01-01-1999','01-05-2020','P',6);
INSERT_CERTIFICAT(9,'PARIS 53','titre certificat 9','01-01-1999','01-08-2020','P',4);
INSERT_CERTIFICAT(10,'PARIS 53','titre certificat 10','01-01-1999','01-07-2020','P',8);

INSERT_COMPETENCES_TECHNIQUES(1,'Travail d’équipe','2');
INSERT_COMPETENCES_TECHNIQUES(2,'Analyse de la menace','3');
INSERT_COMPETENCES_TECHNIQUES(3,'Résolution de problèmes','2');
INSERT_COMPETENCES_TECHNIQUES(4,'Oratoire','1');
INSERT_COMPETENCES_TECHNIQUES(5,'Organisation','1');

-- all above OK

-- OK
INSERT_POSSEDER_COMP_TECH(1,1,'01-01-2020','DEBUTANT');
INSERT_POSSEDER_COMP_TECH(2,2,'01-01-2020','MOYEN');
INSERT_POSSEDER_COMP_TECH(3,3,'01-07-2020','DEBUTANT');
INSERT_POSSEDER_COMP_TECH(4,4,'01-07-2020','EXPERT');
INSERT_POSSEDER_COMP_TECH(5,5,'01-03-2020','EXPERT');
INSERT_POSSEDER_COMP_TECH(2,6,'01-06-2019','DEBUTANT');
INSERT_POSSEDER_COMP_TECH(1,7,'01-07-2019','MOYEN');
INSERT_POSSEDER_COMP_TECH(4,8,'01-09-2018','MOYEN');

--ok
INSERT_LANGUES(1,'FRANCAIS','FRANCE');
INSERT_LANGUES(2,'ANGLAIS','ANGLETERRE');
INSERT_LANGUES(3,'ESPAGNOL','ESPAGE');
INSERT_LANGUES(4,'PORTUGAIS','PORTUGAL');
INSERT_LANGUES(5,'POLONAIS','POLOGNE');
INSERT_LANGUES(6,'CHINOIS','CHINE');

--ok
INSERT_PARLE_LANGUES(1,1,'81/100','C1');
INSERT_PARLE_LANGUES(2,2,'76/100','B2');
INSERT_PARLE_LANGUES(3,3,'63/100','B1');
INSERT_PARLE_LANGUES(4,4,'77/100','B2');
INSERT_PARLE_LANGUES(5,5,'68/100','B1');
INSERT_PARLE_LANGUES(6,6,'89/100','C1');
INSERT_PARLE_LANGUES(6,7,'85/100','C1');
INSERT_PARLE_LANGUES(1,2,'85/100','C1');
INSERT_PARLE_LANGUES(1,3,'62/100','B1');
INSERT_PARLE_LANGUES(1,4,'63/100','B1');
INSERT_PARLE_LANGUES(1,5,'88/100','C1');
INSERT_PARLE_LANGUES(1,6,'71/100','B2');
INSERT_PARLE_LANGUES(1,7,'83/100','C1');
INSERT_PARLE_LANGUES(1,8,'77/100','B2');
INSERT_PARLE_LANGUES(1,9,'79/100','B2');
INSERT_PARLE_LANGUES(4,9,'88/100','C1');

--ok
INSERT_PHOTOS(1,'Lien photo 1',1);
INSERT_PHOTOS(2,'Lien photo 2',2);
INSERT_PHOTOS(3,'Lien photo 3',3);
INSERT_PHOTOS(4,'Lien photo 4',4);
INSERT_PHOTOS(5,'Lien photo 5',5);
INSERT_PHOTOS(6,'Lien photo 6',6);
INSERT_PHOTOS(7,'Lien photo 7',7);
INSERT_PHOTOS(8,'Lien photo 8',8);
INSERT_PHOTOS(9,'Lien photo 9',9);
--INSERT_PHOTOS(10,'Lien photo 10',10);

--ok
INSERT_CENTRE_INTERET(1,'jouer au foot');
INSERT_CENTRE_INTERET(2,'jouer au jeu video');
INSERT_CENTRE_INTERET(3,'faire de escalade');
INSERT_CENTRE_INTERET(4,'danser');
INSERT_CENTRE_INTERET(5,'faire du tenis');
INSERT_CENTRE_INTERET(6,'musculation');
INSERT_CENTRE_INTERET(7,'Ecouter music');
INSERT_CENTRE_INTERET(8,'Lire des livres');

--ok
INSERT_AIMER_INTERET(1,1,'');
INSERT_AIMER_INTERET(2,2,'');
INSERT_AIMER_INTERET(3,3,'');
INSERT_AIMER_INTERET(4,4,'');
INSERT_AIMER_INTERET(5,5,'');
INSERT_AIMER_INTERET(6,6,'');
INSERT_AIMER_INTERET(7,7,'');
INSERT_AIMER_INTERET(8,8,'');
INSERT_AIMER_INTERET(2,1,'');
INSERT_AIMER_INTERET(2,9,'');
INSERT_AIMER_INTERET(2,7,'');
INSERT_AIMER_INTERET(2,4,'');
INSERT_AIMER_INTERET(2,3,'');

--ok
INSERT_REFERENCE(1,'MALID','RICARDO','PROFESSEUR','PARIS 18');
INSERT_REFERENCE(2,'POTTER','HARRY','CHEF DE PROJET','SORCIER CO');
INSERT_REFERENCE(3,'DUNCAT','LAURE','PROFESSEUR','POUDLARD');
INSERT_REFERENCE(4,'ROGER','NAM','ARCHITECT','NIMURA R');

--ok
INSERT_RELATION(1,1);
INSERT_RELATION(2,5);
INSERT_RELATION(3,9);
INSERT_RELATION(4,3);

--ok
INSERT_CONTACTS(1,'FRANCE','PARIS',75003,19,'Rue du moulin',0612345678,'contact1@gmail.com','LIEN_FACEBOOK','LIEN_LINKEDIN','LIEN_SKYPE','LIEN_INSTAGRAM','LIEN_SITE_WEB',1);
INSERT_CONTACTS(2,'FRANCE','PARIS',75009,15,'Rue du chantier',0712345678,'contact2@gmail.com','LIEN_FACEBOOK','LIEN_LINKEDIN','LIEN_SKYPE','LIEN_INSTAGRAM','LIEN_SITE_WEB',2);
INSERT_CONTACTS(3,'FRANCE','PARIS',75008,19,'Rue du poulet frit',0622345678,'contact3@gmail.com','LIEN_FACEBOOK','LIEN_LINKEDIN','LIEN_SKYPE','LIEN_INSTAGRAM','LIEN_SITE_WEB',3);
INSERT_CONTACTS(4,'FRANCE','PARIS',75089,15,'Rue du loup',0732345678,'contact4@gmail.com','LIEN_FACEBOOK','LIEN_LINKEDIN','LIEN_SKYPE','LIEN_INSTAGRAM','LIEN_SITE_WEB',4);
INSERT_CONTACTS(5,'FRANCE','PARIS',75503,19,'Rue du chavre',0614545678,'contact5@gmail.com','LIEN_FACEBOOK','LIEN_LINKEDIN','LIEN_SKYPE','LIEN_INSTAGRAM','LIEN_SITE_WEB',5);
INSERT_CONTACTS(6,'FRANCE','PARIS',75059,15,'Avenue de la république',0712345679,'contact6@gmail.com','LIEN_FACEBOOK','LIEN_LINKEDIN','LIEN_SKYPE','LIEN_INSTAGRAM','LIEN_SITE_WEB',6);
INSERT_CONTACTS(7,'FRANCE','PARIS',75203,19,'Rue pasteur',0612345677,'contact7@gmail.com','LIEN_FACEBOOK','LIEN_LINKEDIN','LIEN_SKYPE','LIEN_INSTAGRAM','LIEN_SITE_WEB',7);
INSERT_CONTACTS(8,'FRANCE','PARIS',75009,15,'Rue du loire',0712345675,'contact8@gmail.com','LIEN_FACEBOOK','LIEN_LINKEDIN','LIEN_SKYPE','LIEN_INSTAGRAM','LIEN_SITE_WEB',8);
INSERT_CONTACTS(9,'FRANCE','PARIS',75093,19,'Rue du coq',0612345674,'contact9@gmail.com','LIEN_FACEBOOK','LIEN_LINKEDIN','LIEN_SKYPE','LIEN_INSTAGRAM','LIEN_SITE_WEB',9);
--INSERT_CONTACTS(10,'FRANCE','PARIS',75809,15,'Rue maléfique',0722345677,'contact10@gmail.com','LIEN_FACEBOOK','LIEN_LINKEDIN','LIEN_SKYPE','LIEN_INSTAGRAM','LIEN_SITE_WEB',10);

--ok
INSERT_EXPERIENCE_PROFESSIONNELLE(1,'Manager de rayon','CARREFOUR','FRANCE','PARIS','01-01-2020','01-12-2020','gerer les rayon','amenager les rayons et les remplir',1);
INSERT_EXPERIENCE_PROFESSIONNELLE(5,'Vendeur en boulangerie','PAUL','FRANCE','LYON','01-05-2018','01-02-2020','vente','vente du pain',5);
INSERT_EXPERIENCE_PROFESSIONNELLE(6,'Vendeur','STYLEMIX','FRANCE','PARIS','01-01-2019','01-06-2020','vente','promouvoire les produits au client et conseil',6);
INSERT_EXPERIENCE_PROFESSIONNELLE(9,'Stagiaire bio engineer','BIOTECH','USA','NEW YORK','01-01-2020','01-06-2020','AIDER LE CHEF DE PROJET','faire des photocopies',9);

--ok
INSERT_PROJETS(1,'SHOGI','ACADEMIQUE','FRANCE','PARIS','01-01-2020','01-02-2020','programmer jeu shogi','programmation du plateau',1);
INSERT_PROJETS(2,'ECHEC','ACADEMIQUE','FRANCE','PARIS','01-02-2020','01-03-2020','programmer jeu echec','programmation du plateau ',2);
INSERT_PROJETS(3,'BIBLIOTHEQUE','ACADEMIQUE','FRANCE','LYON','01-07-2020','01-09-2020','creer site web pour une bibliotheque','creation site web(front end);',3);
INSERT_PROJETS(4,'PRODUCT X','PROFESSIONNEL','RUSSIE','MOSCOU','01-01-2020','01-05-2020','programmer un produit x pour un client','programmation x',4);
INSERT_PROJETS(5,'PRODUCT Y','PROFESSIONNEL','FRANCE','TOULOUSE','01-01-2020','01-04-2020','programmer un produit y pour un client','programmation y',5);
INSERT_PROJETS(6,'PRODUCT Z','PROFESSIONNEL','FRANCE','MARSEILLE','01-01-2020','01-03-2020','programmer un produit z pour un client','programmation z',6);
INSERT_PROJETS(7,'SITE WEB GEO','ACADEMIQUE','FRANCE','TOULOUSE','01-02-2020','01-03-2020','creer site web avec une carte du monde','creation site web(front et back end);',7);
INSERT_PROJETS(8,'TRIEUR','PERSONNEL','ITALIE','ROME','01-08-2020','01-12-2020','programmer un trieur','programmation du trieur',8);
INSERT_PROJETS(9,'JARVIS','PERSONNEL','FRANCE','PARIS','01-10-2020','01-11-2020','creation intelligence artificiel','programmer jarvis',9);
INSERT_PROJETS(10,'VOLCAN','ACADEMIQUE','ESPAGNE','MADRID','01-11-2020','01-12-2020','faire maquette du volcan','realiser la base du volcan',9);



INSERT_CANDIDAT(11,'SATHIANATHAN','SAYANTHAN',22,'M','07-10-1998','C','B','FR','oui','Recherche contrat CDD / Job d’été');
INSERT_FORMATIONS(6,1,'M1 Informatique');
INSERT_SUIVRE_FORMATION(6,11,'12','AB','05-10-2019','01-06-2020');
INSERT_COMPETENCES_OPERATIONNELLES(6,'Gestion de projet','WBS,RACI,GANTT');
INSERT_COMPETENCES_OPERATIONNELLES(7,'Expression-Communication','Bon rédactionnel');
INSERT_POSSEDER_COMP_OP(6,11,'');
INSERT_POSSEDER_COMP_OP(7,11,'');
INSERT_COMPETENCES_TECHNIQUES(6,'Java','Langage informatique');
INSERT_COMPETENCES_TECHNIQUES(7,'PHP','Langage informatique');
INSERT_COMPETENCES_TECHNIQUES(8,'JavaScript','Langage informatique');
INSERT_COMPETENCES_TECHNIQUES(9,'SQL','Langage informatique');
INSERT_COMPETENCES_TECHNIQUES(10,'HTML','Langage informatique');
INSERT_COMPETENCES_TECHNIQUES(11,'CSS','Langage informatique');
INSERT_COMPETENCES_TECHNIQUES(12,'C','Langage informatique');
INSERT_COMPETENCES_TECHNIQUES(13,'C++','Langage informatique');
INSERT_COMPETENCES_TECHNIQUES(14,'Python','Langage informatique');
INSERT_COMPETENCES_TECHNIQUES(15,'Android','Langage informatique');
INSERT_POSSEDER_COMP_TECH(6,11,'01-07-2020','MOYEN');
INSERT_POSSEDER_COMP_TECH(7,11,'01-07-2020','MOYEN');
INSERT_POSSEDER_COMP_TECH(8,11,'01-07-2020','MOYEN');
INSERT_POSSEDER_COMP_TECH(9,11,'01-07-2020','DEBUTANT');
INSERT_POSSEDER_COMP_TECH(10,11,'01-07-2020','DEBUTANT');
INSERT_POSSEDER_COMP_TECH(11,11,'01-07-2020','DEBUTANT');
INSERT_POSSEDER_COMP_TECH(12,11,'01-07-2020','EXPERT');
INSERT_POSSEDER_COMP_TECH(13,11,'01-07-2020','EXPERT');
INSERT_POSSEDER_COMP_TECH(14,11,'01-07-2020','EXPERT');
INSERT_POSSEDER_COMP_TECH(15,11,'01-07-2020','EXPERT');
INSERT_LANGUES(7,'Francais','France');
INSERT_LANGUES(8,'Anglais','');
INSERT_LANGUES(9,'Espagnol','');
INSERT_LANGUES(10,'Tamoul','');
INSERT_PARLE_LANGUES(7,11,'','Bilingue');
INSERT_PARLE_LANGUES(8,11,'','B1');
INSERT_PARLE_LANGUES(9,11,'','A1');
INSERT_PARLE_LANGUES(10,11,'','Bilingue');
INSERT_PHOTOS(12,'https://www.waibe.fr/sites/adwaibe/medias/images/blog/suivez-nous-facebook.jpg',11);
INSERT_CENTRE_INTERET(9,'LECTURE');
INSERT_CENTRE_INTERET(10,'SPORT');
INSERT_AIMER_INTERET(9,11,'Détectve Conan – roman policier à énigme');
INSERT_AIMER_INTERET(10,11,'Football amateur et renforcement musculaire');
INSERT_CONTACTS(11,'FRANCE','BOBIGNY',93000,2,'Rue gare',0695105742,'sayan.sath@gmail.com','LIEN_FACEBOOK','LIEN_LINKEDIN','LIEN_SKYPE','LIEN_INSTAGRAM','https://www.google.com/intl/fr_tg/drive/',11);
INSERT_EXPERIENCE_PROFESSIONNELLE(10,'STAGIAIRE Développeur Web','SICEM','FRANCE','PARIS','01-05-2020','01-07-2020','Développement d’une applicaton de geston sur Eclipse en Java','Architecture MVC (Modèle-vue-contrôleur)',11);
INSERT_PROJETS(11,'Intégraton contnue & test auto','PROFESSIONNEL','FRANCE','PARIS','01-07-2020','01-09-2020','pour Share Concepton, avec une équipe de 5 personnes, configuration de teamcity, tests sur Visual Studio, gestion de projet','',11);


END;
*/