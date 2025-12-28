# Gestion des adresses

Historiquement, il a été décidé dans Civiparoisse de faire saisir aux utilisateurs les adresses en stockant dans un seul champ à la fois le nom de la rue, le numéro de bâtiment, et l'éventuel suffixe (répéteur) du numéro. Toutefois, un besoin de séparation et de normalisation des adresses a émergé, en particulier pour créer des listes de distribution pour des médias "physiques" (par exemple, le Nouveau Messager). De plus, il peut être intéressant de fournir une aide à la saisie des adresses, afin de minimiser les risques d'erreur d'orthographe.

L'approche qui a été choisie pour atteindre ces objectifs a été d'exploiter la [Base Adresse Nationale](https://www.data.gouv.fr/datasets/base-adresse-nationale/){:target="_blank"} et d'exploiter ces données au travers d'un moteur de recherche pour mettre en correspondance une adresse saisie par un utilisateur de Civiparoisse et un enregistrement de la Base Adresse Nationale. Cette mise en correspondance est faite "au plus approchant", mais ne peut pas être garantie, d'où la fourniture d'un mécanisme de validation de la correspondance à destination des utilisateurs.

Enfin, en ce qui concerne l'exploitation proprement dite des données mises en correspondance, on pourra considérer un dispositif d'affichage qui a été spécialement développé pour Civiparoisse pour faciliter une édition papier de listes ayant des critères de regroupement : le ___Display Paged___.

Il est donc opportun de voir successivement plus en détail les différents aspects que l'on vient d'évoquer.

## Données de la Base Adresse Nationale

La [Base Adresse Nationale](https://www.data.gouv.fr/datasets/base-adresse-nationale/){:target="_blank} est une base qui est accessible au moment de l'écriture de ces lignes sous une [Licence Ouverte 2.0](https://www.etalab.gouv.fr/wp-content/uploads/2017/04/ETALAB-Licence-Ouverte-v2.0.pdf){:target="_blank}. Chaque département peut être récupéré séparément, et les données sont mises à jour très régulièrement. Le format des données est décrit dans un [schéma de données](https://github.com/BaseAdresseNationale/adresse.data.gouv.fr/blob/master/public/schemas/adresses-csv.md
){:target="_blank"} : il s'agit synthétiquement de fichiers texte brut avec un enregistrement par ligne dans le fichier, où les champs sont délimités les uns des autres à l'aide d'un séparateur (format CSV).

Les données récupérées de la Base Adresse Nationale sont augmentées avec des données complémentaires utiles ensuite pour les tris (par exemple, des calculs sur les numéros dans les rues), et des données pour respecter la licence (date des données qui est fournie dans la requête HTTP lors de la récupération d'un fichier). Ces données sont ensuite fournies au moteur de recherche, et analysées et exploitées en fonction des directives qui ont été configurées (on fait référence ici à la description du schéma de données d'un core de SOLR).

Il a semblé judicieux de préserver la séparation en départements dans le moteur de recherche : en effet, il existe des noms de ville qui sont utilisés dans plusieurs départements (exemple : ___Bouxwiller___, dans le Bas-Rhin et le Haut-Rhin). De plus, il a été décidé de limiter les départements disponibles à ceux de l'___Alsace-Lorraine___, du fait de la territorialité de l'Union des Eglises Protestantes d'Alsace-Lorraine, ce qui limite les ressources utilisées.

## Aide à la saisie

L'aide à la saisie est une fenêtre de saisie hiérarchique des données, où les choix effectués déterminent les possibilités des choix suivants dans la fenêtre de saisie. L'utilisateur est invité à saisir / sélectionner successivement le département, la ville, la rue, le numéro et le suffixe, et enfin le code postal.

Ce module sert uniquement à saisir des données, sans pouvoir réutiliser d'anciennes données déjà saisies au préalable.

Par ailleurs, ce module n'influe pas sur la mise en correspondance, si ce n'est que d'avoir des données écrites exactement de la même manière que dans le moteur de recherche devrait intuitivement augmenter la probabilité de bonne mise en correspondance entre l'adresse et l'enregistrement de la Base Adresse Nationale sélectionné par le moteur de recherche.

!!! Warning "Saisie avec le caractère 'œ'"
    Pour les villes comportant le caractère "œ" (exemple : Hœerdt, Hœnheim), ce caractère doit être saisi explicitement dans les champs de l'assistant pour pouvoir reconnaître ces villes. La combinaison Ctrl+Maj+U suivi de 0153 et de espace peut dans certains cas permettre de saisir ce caractère. De plus, le caractère "œ" étant un caractère étendu, son code de caractère est supérieur aux caractères usuels, et se place donc après ceux-ci dans le cadre d'un tri croissant.

## Mise en correspondance

La mise en correspondance entre une adresse et un enregistrement dans le moteur de recherche se fait en plusieurs étapes :

- identification du pays : obligatoirement France
- identification du département : soit l'information est renseignée dans l'adresse, soit l'information est déduite du code postal (les deux premiers chiffres)
- identification de la ville : le nom de la ville est cherchée dans le département. Si le nom de la ville ne correspond pas exactement au contenu du moteur, le moteur peut fournir des suggestions de ville ou une correction orthographique. La mise en correspondance va prendre le premier choix proposé par le moteur.
- recherche de l'adresse : on cherche l'adresse dans les enregistrements du département en spécifiant le nom de la ville d'une part, et le reste de l'adresse dans la ville d'autre part : on considère alors le premier enregistrement proposé par le moteur de recherche (le plus pertinent selon les résultats de la requête).

Comme cela a déjà été évoqué, il s'agit donc d'une recherche où on tend à récupérer l'enregistrement le plus pertinent possible. Toutefois, l'enregistrement le plus pertinent possible ne veut pas dire que ce soit le bon enregistrement : c'est là qu'intervient la notion de validation de la mise en correspondance.

La mise en correspondance survient lors de l'enregistrement d'une adresse, et périodiquement sur les adresses éligibles qui n'ont pas été mises en correspondance ou dont l'état de validation est "obsolète" ou "erroné".

## Données et validation de la mise en correspondance

Une table liée à une entité appelée dans la programmation **Banaddr** contient :

- un identifiant (id, clef primaire)
- l'identifiant de l'adresse en relation (addr_id, clef étrangère vers la table des adresses), qui doit être en plus unique et non null (d'où un candidat supplémentaire de clef primaire)
- les données issues de la Base Adresse Nationale
- des données stockées supplémentaires, qui sont calculées et stockées pour pouvoir les indexer en base de données (et ainsi pouvoir effectuer des tris efficaces) : si le numéro est pair, s'il est impair, le calcul d'un numéro pair négatif, le calcul d'un numéro impair négatif
- un état de validation : valide (valid), erroné (invalid), non vérifié (unchecked), obsolète (stale)

Lorsqu'un enregistrement Banaddr est crée ou remplacé, son état est par défaut en "non vérifié". C'est à l'utilisateur de décider s'il est valide ou erroné.
L'état obsolète est un état qui est normalement transitoire : il permet de marquer que le Banaddr associé à une adresse n'a pas encore été mis à jour alors que l'adresse saisie par l'utilisateur dans Civiparoisse a été modifiée. Cet état peut être en particulier constaté si l'utilisation du moteur de recherche a été désactivée.

CiviCRM permet la création de champs "calculés dynamiquement" (en particulier grâce à des sous-requêtes SQL) dans l'APIv4 qui est sous-jacente aux rapports searchkits et à l'afform. Cette possibilité est exploitée pour faciliter le travail de validation de l'utilisateur, puisque deux champs ___match_street___ et ___match_city___ ont été prévus. Le premier vérifie que la proposition de rue est contenue dans la saisie de la ligne d'adresse, tandis que le deuxième vérifie l'égalité des villes. Etant donné que les champs de la table d'adresse et Banaddr de CiviCRM sont marqués avec "COLLATE utf8mb4_unicode_ci", les comparaisons seront insensibles à la casse (majuscule/minuscule) - par ailleurs, la collation par défaut est également insensible à la casse. 

En pratique, le rapprochement peut se faire à l'aide de l'écran ___Validation des propositions d'adresses___. Cet écran utilise les résultats de match_street et de match_city pour le surlignage de la saisie de la rue et de la ville. Des actions de masse sont proposées pour changer d'état. Etant donné que l'écran en question ne fait apparaître que les données non vérifiées, il est normal que les données que l'on a marquées comme valides ou erronées disparaissent de cet écran.

Si on constate une anomalie dans la mise en correspondance, il y a lieu de vérifier la cohérence et l'orthographe des données (d'abord département et code postal, puis ville, puis rue, puis numéro de rue et suffixe), éventuellement en faisant des tests à l'aide de l'Assistant de Saisie, et en corrigeant la saisie si nécessaire. Il peut arriver que les données disponibles ne soient pas complètes, auquel cas il peut être utile de chercher à vérifier les données depuis <https://adresse.data.gouv.fr/>{:target="_blank"}. Si les données y sont mais ne sont pas dans le moteur SOLR, on peut mettre en invalide pour espérer qu'au prochain passage il y aura eu une mise à jour des données du moteur, et alors réussir à obtenir une mise en correspondance (et si ce n'est pas le cas après plusieurs tentatives, il sera bon de contacter l'UEPAL). En revanche, si les données ne sont pas sur <https://adresse.data.gouv.fr/>{:target="_blank"}, il peut alors être judicieux de se rapprocher des services administratifs locaux compétents.

!!! Warning "A propos de la saisie des adresses"
    Le programme n'est pas prévu pour modifier la saisie des utilisateurs de lui-même : l'utilisateur reste donc entièrement et uniquement responsable de ce qu'il saisit.


## Exploitation des données

L'exploitation des données est rendue possible grâce à la liaison avec la table des adresses via une clef étrangère, comme décrit précédemment. L'idée est alors de sélectionner dans les requêtes les champs de Banaddr en lieu et place des champs Adresse - tout en gardant à l'esprit la notion de validation et le périmètre restreint d'application de Banaddr.

La plupart des colonnes de Banaddr sont pourvues d'index, ce qui devrait pouvoir faciliter les opérations de tri. De plus, l'idée derrière les calculs de parité est de pouvoir d'abord parcourir le côté des numéros avec une parité, puis l'autre parité. L'utilisation des nombres négatifs d'une partie permet, après avoir parcouru une rue, de revenir sur ses pas dans l'autre sens après avoir traversé la rue, puisqu'on a pour x<y<0, |x|>|y|>0. Ceci n'est qu'un exemple dont l'utilisateur peut tirer parti ensuite dans la présentation des données, en fonction du type de parcours dans une rue que l'utilisateur souhaite privilégier.

## Présentation des données

Une fonctionnalité demandée par les utilisateurs est de pouvoir imprimer des données groupées, en insérant des sauts de page entre les groupes. C'est à cet effet qu'a été crée le type d'affichage ___paged___.

Ce type fournit un sélecteur de critères de tri pour choisir dans l'ordre les critères à utiliser (clic simple pour le critère principal, maj+clic pour les critères auxiliaires), ce qui va effectivement trier les données dans l'ordre demandé.

Le groupement va correspondre à une certaine numération de critères principaux de tri dont les données doivent être identiques dans un groupement (dans la présentation : ___Nombre de critères pris en compte pour le regroupement des tableaux___) : en analysant les données ligne à ligne on peut détecter la cohérence des données entre deux lignes, et ainsi ajouter au besoin un séparateur de groupement lorsque la cohérence est rompue.

En ce qui concerne l'impression, le CSS dispose de directives relatives au media ___print___ pour insérer des sauts de page. C'est ainsi que les sauts sont insérés.

!!! Warning "Implications de la fonctionnalité sur la cohérence des données"
    La description de la fonctionnalité implique une cohérence entre les colonnes utilisées pour le tri et les colonnes fournies par un searchkit, ainsi qu'une cohérence entre la numération de critères de tri sélectionnés et la numération de critères de tri utilisés pour le regroupement. La rupture de cohérence peut entraîner l'affichage de messages d'erreur.
