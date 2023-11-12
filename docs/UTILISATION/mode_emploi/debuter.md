# Débuter

!!! warning "Attention"
    Avant de créer une fiche "individu", vérifiez que la fiche "foyer" à laquelle elle sera liée existe déjà, sinon créez d'abord la fiche "foyer".

## Enregistrer un nouveau foyer

!!! warning "Attention"
    N'utilisez pas le menu `Contact` -> `Nouveau foyer` mais suivez la procédure ci-dessous.
    Elle utilise un formulaire spécialement élaboré pour les paroisses.

Pour créer un nouveau "foyer" vous devez passer par la page d'accueil (voir [Mode d'emploi#La page d'accueil](introduction.md#la-page-daccueil)) et cliquez sur l'icône "Nouveau Foyer".

Vous obtiendrez la fenêtre suivante :

![Ecran foyer](img/ecran_formulaire_foyer.png)

Les indications du formulaire devraient être suffisamment pour clair pour que vous sachiez comment le compléter.

Notez juste que nous entendons par quartier un secteur géographique utilisé pour la distribution de journaux paroissiaux, du Nouveau Messager, de courriers, etc...

## Enregistrer un nouvel individu

Contrairement à la fiche foyer, nous avons ici un large panel d'informations que nous pouvons enregistrer.

![ecran creation individu.png](img/ecran_formulaire_individu.png)

Le premier élément important est de relier l'individu à une fiche "foyer" en choisissant le foyer d'appartenance.

Si vous ajoutez un enfant, en choisissant ses parents et ses frères et soeurs, les relations seront automatiquement établies.

N'hésitez pas à consulter les recommandations sur le **lien avec la paroisse** si vous avez un doute sur le lien à établir.

Il est recommandé de noter les compétences lorsqu'elle sont connues, pour inviter par exemple la personne par la suite à venir renforcer la chorale ou un groupe de musique.

Les éléments sur la Sécurité sociale, le Guso, ou pour savoir si la personne est fonctionnaire, ne sont réellement utiles que pour la fiche d'un musicien rémunéré par la paroisse.

## Gérer les relations

Les relations explicitent le lien entre des individus mais aussi entre des individus et la paroisse ou des individus et des associations  (ou des entreprises) que vous aurez enregistrées.
CiviParoisse en propose de nombreuses, que nous pouvons classer par catégorie :

* Familiales :
  * Enfant de
  * Parent de
  * Conjoint de
  * Partenaire de
  * Grand parent de
  * (...)
* D'appartenance :
  * Chef de famille de
  * Membre du foyer
* De fonction ou élection :
  * est Membre élu.e de
  * est pasteur de
  * est Délégué.e de
  * est Président.e de
  * est Secrétaire de
  * est Trésorier.ère de
  * (...)

Ceci va vous permettre de tisser assez finement les liens entre les uns et les autres.

!!! warning "Attention"
    Il est important que chaque Individu soit en relation avec au moins un Foyer ou une Organisation.
    Au sein d'un Foyer, chaque Individu est à enregistrer comme *membre du Foyer* ; et **les parents sont également à enregistrer** comme *chef de famille de*.

!!! note "Conseil"
    Vous pouvez ainsi enregistrer la relation entre les membres du Conseil presbytéral et la paroisse.
    Pour des relations de ce genre, il est conseillé de mettre la date de l'élection ou de prise de fonction et la date de fin si elle est déjà connue.

Pour la **fin d'une relation**, deux cas possibles :

* Vous aviez indiqué une date de fin et la relation se désactivera automatiquement.
* Il n'y avait pas de date de fin, il suffit alors de cliquer à la fin de la ligne de la relation sur `plus` puis sur `modifier` et ajouter une date de fin.

CiviParoisse garde en mémoire toutes les relations présentes et passées, c'est ainsi que les relations qui ont pris fin se retrouvent en bas des relations actives, dans la rubrique `Relations inactives`.

## Inscrire dans les groupes

### Les groupes classiques

Après les relations, les groupes sont une autre façon d'établir un lien entre des personnes, de dire qu'elles partagent quelque chose, une activité par exemple.
Vous pouvez ainsi créer un groupe qui recense tous les membres de la chorale, un autre pour les catéchètes, ou encore pour les participants au groupe biblique.

Pour créer un groupe statique, il vous suffit d'aller dans le menu `Contacts`, puis `Gestion des groupes`.

En cliquant sur `Ajouter un groupe` vous obtenez la fenêtre suivante :

![ecran groupe](img/ecran_groupe.png)

Il est recommandé d'utiliser un nom explicite et d'ajouter une description pour que la personne qui n'identifie pas le groupe par son nom puisse retrouver le bon groupe par un texte plus long et détaillé.

!!! warning "Attention"
    Ne cochez pas `contrôle d'accès`
    En revanche, si vous envisagez d'envoyer des courriels aux membres du groupe, il sera indispensable de cocher `Liste de diffusion`.
    Si vous voulez juste visualiser les membres sans leur écrire, ne cocher aucun des deux.

Vous pouvez même, comme vous l'avez sans doute remarqué, créer des sous groupes en indiquant lors de la création du sous groupe quel est son groupe parent.

Vous ajoutez ensuite des membres au groupe depuis leur fiche, onglet `Groupes`.

C'est depuis la `Gestion des groupes` que vous pouvez visualiser les membres en cliquant sur `Contacts` à la fin de la ligne du groupe.

### Les groupes dynamiques

Il existe un autre type de groupes, les groupes dynamiques, où vous n'ajoutez pas les personnes manuellement mais où elles se retrouvent automatiquement dans ce groupe de par leur âge, une relation ou tout autre élément rechargeable.

Il s'agit donc tout d'abord d'effectuer une recherche (voir [Faire des recherches](faire_des_recherches_sur_les_contacts.md) pour des conseils pour vous aider à retrouver les fiches selon divers critères).

Une fois la liste des contacts obtenue, sélectionnez tout d'abord l'ensemble des contacts en cliquant sur `Sélection des enregistrements : Les x trouvés`. Puis cliquez sur `Actions` et choisissez `Groupe - créer un groupe dynamique`, donnez lui un nom, une description et cochez ou non `Liste de diffusion`
Désormais, dès qu'un contact rempli les critères de la recherche il est automatiquement ajouté au groupe dynamique, et inversement, si pour un contact du groupe un critère n'est plus rempli, il ne sera plus membre du groupe dynamique.
