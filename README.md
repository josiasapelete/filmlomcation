# filmlomcation
Base de donnée pour une maison de location de film

La base de donnée actuelle sert à stocker les informations du client, des films, des payements, films loués et autre. 
Pour ajouter un client, il faut entrer la requête suivante :
Insert into client (nom, prenom, email) values (‘nom_du_client’,’prenom_du_client’,’email_du_client’) ;
-------Et comme chaque requête on termine avec  un point virgule ( ;). Pour ajouter plusieurs clients à la fois , il suffit juste de séparer les valeurs par une virgule :
Insert into client (nom, prenom, email) values (‘nom_du_client’,’prenom_du_client’,’email_du_client) ,
(‘nom_du_client2’,’prenom_du_client2’,’email_du_client2’),
(‘nom_du_client3’,’prenom_du_client3’,’email_du_client3’) ; 
De même pour ajouter un film ,on fait la même procédure sauf que là où il y a ‘clien’, il va avoir ‘film’ et on remplace les (nom, prenom et email )par les champs de la table film et on donne les valeurs.
Pour avoir accès au cinq derniers entré, on passe la commande suivante :
SELECT * from `dbname`.`table` ORDER BY primarykey DESC LIMIT X;
dbname est le nom de la base de donnée ;
table est le nom de la table dont on cherche les contenu
primarykey est la clé primaire de la table choisie
X est le nombre limite qu’on veut avoir (Ici pour les 5 derniers entrés, on met 5 à la place de X)

