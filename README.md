# FoodLab

## Compte-rendu Gatien Mercredi 18H 


J'ai fini la liste des places favorites. <br>
Je me suis arrêté sur l'ajout de Place. <br>
Sur la 1ere Table view j'ai eu un petit blocage car j'avais mal register ma custom Cell. <br>
Au lieu d'enregistrer ma custom cell, j'ai enregistrer TableViewCell (la classe générique). <br>
C'est un soucis bête mais ça m'a cramé un peu de temps. <br>
Dans l'ensemble, c'était cool. Comme il y a beaucoup de chose, j'ai pris moins le temps de soigner la syntaxe.<br>
Tu remarqueras peut être que j'ai utilisé le linter ;) 


## Compte-rendu Gatien Samedi 28 janvier dans le tgv Paris -> Nancy 10h55

J'ai continuer en mode "quick and dirty", l'idée étant d'aller le plus loins possible dans ce projet et de découvrir comment faire une scroll view horizontal notamment. <br>
J'ai aussi mis en place le bouton keyboard "suivant"  sur le 1er text field de la vue ajout<br>
Il y a l'appareil photo aussi :), tu peux visualiser la photo que tu viens de prendre dans la todo list<br>
Bonne correction 

# Review

Hello Gatien !

Voici ma correction et mes remarques globales pour ton code (n'hésite pas à jeter un coup d'oeil à la branche de correction) 

**Points positifs**

Retours Globaux

- J'apprecie vraiment le fait que t'es continué en off sur son temps libre c'est comme ça que l'on progresse.
- SwiftLint bravo d'y avoir pensé c'est necessaire dans tous projets sérieux.
- Ton projet est plutot propre et lisible, on arrive à dérouler le fil de ta penssée facilement.


**Partie Home**

- Compositional Layout est là ! Bravo. T'es le seul à l'avoir fait, et pourtant je l'avait écrit au tableau. Tkt pas on aura le temps de debrief ça ensemble c'est pas easy du tout. Clairement ça faisait parti du lvl 3.
- La collection view est pas trop mal, petit conseil, les collections/tables view c'est très verbeux hésite pas à mettre ta layout dans un fichier externe que ce soit via une extension de HomeViewController, ou encore mieux une subclass de UICollectionViewCompositionalLayout.
- Pour la Home comme pour le Form, et comme pour la partie Favorites, le mieux pour aller vite était de ne pas hériter de UIViewController, mais soit de UITableViewController ou de UICollectionViewController. 
    (En cours on a apprit à le faire à la mano pour que vous voyez comment marche les differents protocols de la CollectionView/TableView (DataSource + Delegate) et qui ne sont pas vraiment visible si on hérite directement. Dans ce cas là fallait foncer c'est du temps precieux de gagné)
- Pour avoir une navigation bar sur ton AddPlaceViewController il fallait l'embed dans un navigationController :) `UINavigationController(rootController: AddPlacVC)`
- Ligne 188 le force unwrap 💩, tu avais fait un petit guard let juste au dessus en plus c'est dommage.
- Reste rigoureux dans ton nommage de dossier, cells -> Cells, dans la nommenclature subTitle -> subtitle
- Pour le reste bravo !

**Partie Favorites**

- Globalement le taff est là c'est bien !
- Dommage qu'il n'y ait pas d'empty state
- Warning : `var favoritesPlace: [Place]` n'a pas besoin d'etre internal, elle doit etre private. Je ne dois pas acceder à cette valeur depuis l'exterieur. Petit tips : initialiser cette variable dans l'init n'est pas super usefull, tu pouvais direct faire `var favoritesPlace = Place.all.filter(\.isFavorites) { didSet {...} }`
- Le delete est là c'est cool
- Meme retour que pour la partie Home -> You should have inherited from UITableViewController to waste less time bg.

**Form (AddPlace)**

Ça c'est le truc le plus chaud du controlle, et je dois avouer que tu t'en est vachement bien tiré meme si tu n'as fait que le AddPlace.

- You should have inherited from UITableViewController to avoid wasting time.
- Tu as voulu rendre ton code propre et c'est bien. (je parle des methods get pour les dequeues des cells)
- Good jobs pour le UIImagePicker (attention quand meme c'est obsolete use PHPicker instead) et pour les autres cells. ;)
- Tu maitrises le delegate pattern / datasource
- Petit tips -> Sur toute tes cells tu as la methode `awakeFromNib`, elle ne te sers pas, parce que tu n'as pas de Nib (Xib/Storyboards), du coup tu peux la tej comme on la fait pour nos cells en cours)
- `override func setSelected` -> same as awakeFromNib
- Pour toutes tes cells **tu as oublié l'encapsulation**, faut faire gaff avec ça vraiment.
(Imagine je suis un connard et j'appelle `configureUI()` depuis l'exterieur dans une forEach, j'explose le nombre de rendering de l'app :D)
- Dans la meme lignée pense au final devant les class si tu n'as pas prévu que d'autres personne les subclass.
- Pour finir dommage ta des fois mis du private lazy et des fois tu les as skip.



**Note** : 20/20

**Appreciation**:
Un sujet long et complexe, tu as su relever le défi et mieux encore tu y a pris goût.
Continue de bosser comme ça, c'est excellent.
