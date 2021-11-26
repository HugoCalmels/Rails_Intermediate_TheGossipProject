# The Gossip Project, version #2 !

Amélioration du projet de base, la base de données est maintenant en Postgresql.
Création des premieres "views" statiques, et dynamiques, avec l'aide du routeur.

Globalement c'est un site, ou l'on :
- peut poster un article ( un gossip )
- peut poster un commentaire ( lié à un gossip en particulier )
- peut mettre un like ( sur un gossip )
- peut modifier/supprimer, les gossips, commentaires, et likes.
- doit être logged in pour poster
- ne peut pas modifier les gossips, commentaires, des autres utilisateurs
- a des messages d'alertes pour chaque action avec la Base De Données ( flash messages )

## Si vous voulez tester

- $ bundle install 
- $ rails db:create 
- $ rails db:migrate
- $ rails db:seed
- $ rails server

La page d'acceuil du site est sur l'url suivante :
```html
http://localhost:3000/
```

Disponible aussi directement en ligne à l'adresse ci-dessous :
```html
https://test-heroku-thegossipproject.herokuapp.com/
```

## Gems utilisées : 

- faker
- table_print
- bcrypt

