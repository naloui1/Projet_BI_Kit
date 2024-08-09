I- INSTALLATION DES OUTILS

1- Installation docker

Suivre les points 1. 2. et 3. du paragraphe "Install using the apt repository"

2- Installation PostGresSQL

sudo docker pull postgres
  
3- Création d'un container postgres, nommé postgres_db, avec docker

  sudo docker run -d \
        --name postgres_db -p 5431:5432 \
        -e POSTGRES_PASSWORD=mysecretpassword \
        -v data_DB:/var/lib/postgresql/data \      
        postgres    

Note:

- data_DB : dossier qu'on crée dans le pc (mkdir data_DB) pour mettre les données/fichiers,
  comme ça, si on supprime docker, nos données ne seront pas supprimées
  
- Si le container, postgres_db, est arrêté (i.e., il ne figure plus dans le résultat de la commande : sudo docker container ls), 
pour le lancer, on écrit:
sudo docker start postgres_db

  4- Installation  dbeaver
   
sudo snap install dbeaver-ce

Note : pour lancer dbeaver à travers le terminal, on écrit : dbeaver-ce &
       Sinon, on le lance manuellement
       
Note: Lancer dbeaver et se connecter à la BD postgres en précisant le numéro de port 5431, le mot de passe de la BD mysecretpassword,..
  
  
 5- Installation dbt
 
  Tout en étant dans lenvironnent virtuel,
  
     5-a commande d'installation 
     
     pip install dbt-postgres
     
     5-b checker l'installation 
     
     dbt –version

     5-c initialiser un projet dbt (création d'un projet dbt avec ses fichiers .yml)
     
     dbt init
     
     =>
     on saisit le nom du projet dbt : dbt_tuto (par exemple)
     on précise la database à laquelle on veut connecter, number: 1, pour postgres
     on précise le port: 5431
     on précise le username: postgres
     on précise le mot de passe pour se connecter à la BD: mysecretpassword
     la BD à laquelle dbt va faire des modifications: postgres
     Le nom du schéma auquel dbt va faire des modifications: staging (par exemple)

     5-d dans le projet dbt, bdt_tuto, on écrit
     
     dbt debug
     
  6- Installation de superset (outil de visualisation)
  
  6-a Clone Superset's GitHub repository
  
  git clone --depth=1  https://github.com/apache/superset.git
  
  Once that command completes successfully, you should see a new superset folder in your current directory.

  6-b build a set of immutable images from the local branch
  
  Dans le dossier superset créé à la suite de la commande 6-a, se mettre là où il y a le fichier docker-compose-non-dev.yml et écrire:
  
  docker compose -f docker-compose-non-dev.yml up

  6-c pour se connecter aux exemples de superset, ouvrir un onglet et écrire !!!!!!!!!

  6-d pour se connecter à notre BD postgres,  ouvrir un onglet et écrire !!!!!!!!!

  

  