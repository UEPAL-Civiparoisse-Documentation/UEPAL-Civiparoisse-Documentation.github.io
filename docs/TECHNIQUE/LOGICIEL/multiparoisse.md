# Multiparoisse

Le multiparoisse est la possibilité de gérer plusieurs paroisses dans une seule instance de CiviCRM. Il a été rendu possible par le fait qu'un certain nombre de paroisses ont indiqué souhaité travailler ensemble en partageant toutes leurs informations entre elles, et travaillent en pratique déjà avec cette mise en commun des ressources, dans une mesure comme s'il s'agissait d'une seule paroisse.

## Notions fondamentales

### Le multiparoisse : conglomérat et bergeries

Dans ce contexte, on considère donc que l'identité principale mise en avant dans l'instance CiviCRM est l'identité du conglomérat :

- au niveau de la communication par mail, ce sera l'identité du conglomérat qui sera utilisée, que ce soit au niveau de l'adresse mail d'expéditeur, ou de la charte graphique
- les adhésions sont définies vis à vis du conglomérat
- étant donné que dans la plupart des cas, l'identité de la paroisse n'intervient pas dans les traitements, la plupart des écrans d'exploitation restent inchangés.

Toutefois, les textes juridiques de l'Eglise restant en vigueur et utilisant comme unité la paroisse, il est toutefois nécessaire pour certaines situations particulières de noter l'appartenance de chaque membre à ___sa___ paroisse - sans oublier que dans certaines paroisses il y a des situations particulières comme par exemple des annexes, et sans oublier non plus l'usage actuel qui prend en compte une certaine ___itinérance___/___versatilité___ des personnes.
De ce fait, il a été recherché, non sans difficulté, un terme générique qui pourrait convenir à la plupart des situations rencontrées pour exprimer l'attachement particulier d'une personne à une entité : c'est de là qu'est venue l'idée de la ***bergerie*** - puisque cette notion est présente dans la Bible, conjointement à l'existence de plusieurs troupeaux, et q'une brebis fait partie d'un seul troupeau, et que le troupeau est généralement rassemblé dans une zone géographique donnée.

### La bergerie

La bergerie est définie par plusieurs éléments :

- un identifiant numérique unique et obligatoire (ID de base de données), géré comme une séquence incrémentale par le système
- un nom, qui est également unique et obligatoire, et qui est prévu comme un mot clef d'identification de la bergerie
- un libellé optionnel, qui est à considérer comme une description plus détaillée de la bergerie
- optionnellement, une ou plusieurs villes qui sont incluses dans le territoire de la Bergerie
- optionnellement, une description géographique des territoires qui sont inclus dans le territoire de la Bergerie


## Mise en oeuvre des bergeries
### Structures de données
On retrouve la notion de bergerie à plusieurs endroits :

- il existe une bergerie non modifiable qui est installée automatiquement dans toutes les instances Civiparoisse : il s'agit de la bergerie ```DEFAULT``` qui est la ***bergerie par défaut***.
- il est prévu ***un champ stocké*** ```bergerie``` dans le contact, qui permet d'indiquer l'attachement d'une personne à une bergerie spécifique ; ce champ est par défaut vide (non renseigné)
- il existe un certain nombre de ***champs calculés*** sur le contact :
  - ```defaulted_bergerie```: l'identifiant numérique de la bergerie pour exploitation : ce champ a pour valeur la bergerie indiquée dans le champ ```bergerie``` ; si le champ ```bergerie``` n'est pas renseigné, on renvoie la bergerie par défault.
  
    !!! notice "Utilisation en af-field"
        Lorsqu'on utilise le champ dans le FormBuilder pour faire du filtrage, il convient d'activer l'option `multiple` et l'option `autoOpen` de l'af-field.
      
  - ```defaulted_bergerie.name```: c'est le nom de la Bergerie correspondant à ```defaulted_bergerie```.
   
    !!! Warning "Utilisation d'un glitch pour simuler une jointure"
        Attention, ce champ calculé est particulier : pour le moment, il semblerait normalement impossible d'utiliser un champ calculé pour une jointure, car la définition du champ calculé n'entrerait pas en compte dans les calculs des jointures disponibles. Toutefois, en utilisant un nom de champ dont la syntaxe est celle qui serait utilisée pour une jointure, les mécanismes d'interactions sont ceux de `EntityRef`, mais il est trouvé comme champ lors de la génération du code depuis l'expression Api4, et le rendu du champ intervient alors comme une expression - ce qui fait le travail lorsqu'on utilise le champ dans un select. Le seul inconvénient est que le champ lui-même est reconnu comme champ à part entière également dans formBuilder, qui chercher alors à utiliser un champ non existant `defaulted_bergerie.name.name', ce que le Form Builder signale lors de la construction du Form.  
  - ```villeBergerie```: une aide à la décision se basant sur l'enregistrement BANAddr lié à la mise en correspondance avec les données issues de la Base d'Adresses Nationale, en utilisant le code commune du BANAddr et les communes déclarées dans la bergerie
  - ```geomBergerie```: une aide à la décision se basant également sur l'enregistrement BANAddr lié à la mise en correspondance avec les données issues de la Base d'Adresses Nationale, en utilisant les coordonnées géographiques n projection légale, ainsi que la géométrie renseignée sur la bergerie

### Cardinalité des bergeries

Etant donné que le système contiendra, après installation, toujours au minimum la bergerie ```DEFAULT```, il y aura dans tout système au moins une bergerie.

S'il n'y a qu'une seule bergerie dans le système, il est alors inutile de présenter des choix spécifiques à l'utilisateur, ni même d'affecter la bergerie aux paroissiens (puisqu'il s'agira de toute manière de la bergerie par défaut) : dans ce contexte, les éléments liés à l'exploitation des bergeries seront masqués : c'est le typique des instances monoparoisses.

S'il y a au moins deux bergeries, alors il est nécessaire d'effectuer les affectations, au minimum pour les paroissiens qui ne seront pas affectés à la bergerie par défaut. Néanmoins, un mode de fonctionnement avec deux bergeries uniquement présente un inconvénient : il faudra regarder sur la valeur du champ ```bergerie``` pour vérifier si une valeur a été définie. Ce type d'exploitation multiparoisse n'est donc pas tellement recommandable, même s'il reste possible.

Le mode d'exploitation multiparoisse prévu est donc d'utiliser de créer chaque bergerie nécessaire, et de considérer les personnes dont la bergerie d'exploitation est la bergerie par défaut comme des personnes qui restent à assigner dans la bonne bergerie.

A noter que le fichier CSS chargé change en fonction du nombre de bergeries déclarées. La mise à jour du fichier chargé se fait grâce à un vidage (flush) du cache CiviCRM.

## Aides territoriales à la décision d'affectation à une bergerie
On a vu que la notion de paroisse intègre une notion de délimitation de zone géographique. C'est pourquoi il y a les deux mécanismes d'aide à la décision qui peuvent être utilisés pour affecter une bergerie à un paroissien : en utilisant le code commune, ou en utilisant la géométrie fournie par l'enregistrement de la Base d'Adresse Nationale mis en correspondance avec l'adresse du contact.

### Avec le code commune
L'UEPAL étant située sur plusieurs départements, avec des noms de ville quui ne sont pas uniques, il a été nécessaire de passer par le code commune affecté à chaque commune par l'Insee (voir [https://github.com/BaseAdresseNationale/adresse.data.gouv.fr/blob/master/public/schemas/adresses-csv.md](https://github.com/BaseAdresseNationale/adresse.data.gouv.fr/blob/master/public/schemas/adresses-csv.md){:target="_blank"})

Lors de la définition des villes, le mécanisme de recherche va interroger les différents noyaux du moteur de recherche SOLR de Civiparoisse pour récupérer les correspondances code-ville pour chaque département, et l'instance va stocker l'ensemble des correspondances en base de données, dans un cache, comme c'est une opération coûteuse en ressources. Ce cache a une durée de vie limitée (20 minutes au moment de la rédaction de la documentation), et peut également être supprimé lors du vidage des caches.

La bergerie retournée est la bergerie dont l'ID est minimum, et dont le code code commune du BanAddr est contenu dans les codes de la bergerie.

### Avec la géométrie
Lorsqu'on regarde dans le schéma de données de la Base d'Adresses Nationale ( [https://github.com/BaseAdresseNationale/adresse.data.gouv.fr/blob/master/public/schemas/adresses-csv.md](https://github.com/BaseAdresseNationale/adresse.data.gouv.fr/blob/master/public/schemas/adresses-csv.md){:target="_blank"})), on constate la présence de coordonnées dans le référentiel GPS (WGS84 / [https://epsg.io/4326](https://epsg.io/4326){:target="_blank"}, ce référentiel étant un ), ainsi que la présence de coordonnées en projection dite légale.

La projection légale est documentée à [https://github.com/etalab/project-legal/blob/master/README.md](https://github.com/etalab/project-legal/blob/master/README.md), et plus précisément à [https://github.com/etalab/project-legal/blob/master/projections.json](https://github.com/etalab/project-legal/blob/master/projections.json). On y voit en particulier que la projection légale utilisée pour la France Métropolitaine est le référentiel Lambert 93, qui est également référencé au niveau de [https://epsg.io/2154](https://epsg.io/2154){:target="_blank"}.
***De ce fait, il est requis que les coordonnées dans les descriptions géographiques soient exprimées dans le référence 2154,*** comme on peut le voir dans le calcul d'aide à la décision géométrique :

```php
  public static function renderSQL(array $field): string
  {
    $alias=self::computeAlias($field);

    return <<<EOF
    (
    select min(ber.id)
    from
    civicrm_contact ct
    inner join civicrm_address addr on ct.id={$alias}id and addr.contact_id = ct.id and addr.is_primary=1
    inner join civicrm_location_type lt on addr.location_type_id = lt.id and lt.name='Home'
    inner join civicrm_banaddr ban on ban.addr_id=addr.id
    inner join civicrm_bergerie ber on  ber.wkt is not null and ber.wkt<>'' and ST_Contains(ST_GeomFromText(ber.wkt,2154),ST_GeomFromText(CONCAT('POINT(',ban.proj_leg_x,' ',ban.proj_leg_y,')'),2154))=1
    )
    EOF;
  }

```

La projection Lambert 93 est une projection cartésienne, ce qui facilite les calculs pour vérifier si un point est contenu dans un polygône - même si les calculs sont effectués directement par les fonctions spatiales de MySQL (ST_Contains).

La description géographique à fournir au niveau de la bergerie est une description au format Well Known Text (voir [https://dev.mysql.com/doc/refman/8.4/en/gis-data-formats.html](https://dev.mysql.com/doc/refman/8.4/en/gis-data-formats.html){:target="_blank"}).

En pratique, on utilisera un logiciel comme par exemple QGIS [https://qgis.org/](https://qgis.org/){:target="_blank"} pour utiliser des ressources géographiques comme la BD TOPO de l'IGN (voir [https://www.data.gouv.fr/datasets/bd-topo-r](https://www.data.gouv.fr/datasets/bd-topo-r){:target="_blank"}), ou le Plan de l'IGN (voir [https://www.data.gouv.fr/datasets/plan-ign](https://www.data.gouv.fr/datasets/plan-ign){:target="_blank"} ), ou l'Admin Express de l'IGN (voir [https://www.data.gouv.fr/datasets/admin-express-admin-express-cog-admin-express-cog-carto-admin-express-cog-carto-pe-admin-express-cog-carto-plus-pe](https://www.data.gouv.fr/datasets/admin-express-admin-express-cog-admin-express-cog-carto-admin-express-cog-carto-pe-admin-express-cog-carto-plus-pe){:target="_blank"} ). L'idée est d'importer des couches qui seront des sources de données, comme par exemple le plan global avec rendu, les limites administratives des communes, les voies, et ensuite de rajouter une couche qui contiendra un polygône qui sera une sélection du territoire de la bergerie, puis on utilisera par exemple le calcul de l'intersection entre le polygone et les limites administratives d'une commune pour définir plus précisément la couverture géographique de la bergerie. 

On pourra aussi éventuellement utiliser [https://cartes.gouv.fr/explorer-les-cartes/](https://cartes.gouv.fr/explorer-les-cartes/){:target="_blank"}. 

Il reste ensuite à retranscrire en format WKT, que l'on peut retrouver éventullement facilement à partir du format geojson, ou alors en utilisant sqlite3 et l'extension spatialite : extrait de code pour une extraction de données depuis Admin Express: - sachant que le Geopackage est en fait aussi une base de données Sqlite3.

```sqlite
.load /usr/lib/aarch64-linux-gnu/mod_spatialite.so
select enablegpkgmode();
select getgpkgmode();
select AsText(geometrie) from commune where nom_officiel='Illkirch-Graffenstaden';
. mode list
. output test.txt
 select code_insee_du_departement as departement ,code_insee as insee ,nom_officiel as nom,AsText(geometrie) as geometrie from commune where nom_officiel='Illkirch-Graffenstaden';

```

La bergerie retournée est celle d'ID minimum dont la description géométrique contient le point représentant de l'adresse.

## En pratique

### Configuration initiale
La configuration des bergeries se fait via l'écran `Gestion des bergeries`, que l'on retrouve dans le menu `Paroisse`/`Multiparoisse`/`Gestion des bergeries`. Cet écran permet de voir, créer, modifier, et supprimer les bergeries.
Rappel si le cardinal passe à plus que un, alors il faut penser à vider les caches pour que les intégrations du multiparoisse dans les écrans apparaissent.

### Affectation aux bergeries
Vient ensuite l'affectation à une bergerie. L'affectation peut être réalisée de plusieurs manières :

- lors de l'utilisation du formulaire Civiparoisse de création d'un individu/particulier, un champ de choix apparaît

- on peut utiliser le formulaire d'édition natif de contact de CiviCRM pour positionner la bergerie - là, la liste des bergeries n'apparaît pas directement on peut saisir le caractère `%` pour déclencher la recherche et déclencher un affichage des premières bergeries disponibles

- on peut utiliser l'écran `Paroisse`/`Multiparoisse`/`Affectation aux bergeries` pour disposer d'une liste des individus qui ne sont pas affectés à une bergerie alors que le cardinal des bergeries est supérieur à 1. Cet écran indique le résultat des aides à la décision basées sur les villes et sur la géométrie. Des actions de masse peuvent permettre d'affecter la bergerie, en utilisant l'une des aides à la décision ou en modifiant en masse les contacts depuis la fonction native de modification.

### Exploitation : considérations générales
L'exploitation va intervenir dans la restitution des données, et de ce fait, va impacter les éléments de SearchKit. Pour tenir compte du niveau d'aggrégat qu'implique les bergeries, deux types de solutions sont envisageables :

- soit on utilise un SearchDisplay de type DisplayPaged, en le configurant de manière adéquate pour intégrer le champ `defaulted_bergerie_name` dans l'ordre de tri, et faire en sorte qu'il soit exploité pour le découpage en morceaux des résultats
- soit on continue à utiliser les SearchDisplays usuels, en les modifiants pour intégrer le champ du nom de la bergerie :
  - savedSearch : ajouter le champ `defaulted_bergerie.name` dans la liste des champs
  - searchDisplay : ajouter la configuration de la colonne :
  ```json
   [
     'type' => 'field',
     'key' => 'defaulted_bergerie.name',
     'dataType' => 'String',
     'label' => E::ts('defaulted_bergerie_name_header'),
     'sortable' => true,
     'cssRules' =>[['bergerie']]
   ],
  ```
  - afform : ajouter le champ pour le filtrage dans le code html :
  ```angularjs
   <af-field class='bergerie' name="defaulted_bergerie" defn="{input_type: 'EntityRef', fk_entity:'Bergerie', input_attrs: {multiple:true}}" />
  ```


### Exploitation : en pratique

Le degré d'exploitation va dépendre en bonne partie du mode de fonctionnement et du degré d'intégration du conglomérat. Néanmoins, il y a un certain nombre de listes où la prise en compte des différentes bergeries semble de toute manière nécessaire :

- la numération des membres
- la composition des conseils presbytéraux
- la liste électorale

Ensuite, il semble intéressant que certaines listes puissent fournir un filtrage sur les bergeries, en particulier au cas où plusieurs pasteurs travaillent dans le conglomérat :

- Bénédictions Nuptiales
- Naissances
- Nouveaux arrivants
- Décès
- Présentations
- Dates d'anniversaires
- Confirmations
- Baptêmes
- Anniversaires dans les 7 prochains jours



