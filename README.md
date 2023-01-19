# FoodLab

## Le 18/01 à 18h
Les favoris et la home page sont faits, je suis en train de faire la page d'ajout.

## Le 19/01 à 15h30
La page d'ajout est unique et paramétrable en fonction de qui la demande.

## Ce qui a été implémenté
- Page des favoris
    - Utilisation de l'`UITableView`
    - Suppression au slide
- Page d'accueil
    - `UICollectionView` unique avec deux types d'affichage
    - Des headers pour chaque section
    - Menu contextuel lors d'un appui fort
- Page d'ajout
    - Une seule implémentation, s'adapte au besoin
    - Le bouton d'ajout de photo affiche la bibliothèque
    - Le bouton pour choisir le `CookStyle` ou `Place` est un `UIButton` avec un menu

## Ce qui n'a pas été implémenté
- Page d'accueil
    - La première section de la vue n'a pas de slide horizontal
- Page d'ajout
    - Le titre ne s'affiche pas
    - Le bouton "Add" ne s'affiche pas
    - La description n'est pas sur plusieurs lignes
