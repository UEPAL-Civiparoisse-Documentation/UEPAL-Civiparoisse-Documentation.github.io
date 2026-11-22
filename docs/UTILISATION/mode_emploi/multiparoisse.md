# Multiparoisse

CiviParoisse vous permet de gérer plusieurs paroisses dans le même outil. C'est le "multi-paroisse".

## Notions fondamentales

* Le mode *Multiparoisse* est optionnel. Il peut être activé à tout moment par l'administrateur général CiviParoisse.
    * Si le Multiparoisse est activé, plusieurs écrans sont modifiés pour permettre de gérer le rattachement à la paroisse.
    * Et inversement, si le Multiparoisse n'est pas activé, les écrans restent paramétrés pour du "mono-paroisse".
* Chaque Individu peut être rattaché à une seule et unique paroisse.
* Les fiches Foyers ne sont pas rattachées à une paroisse.

## Configuration initiale

La configuration des paroisses se fait via l'écran `Gestion des paroisses`, que l'on retrouve dans le menu `Paroisse`/`Multiparoisse`/`Gestion des paroisses`. Cet écran permet de voir, créer, modifier, et supprimer les paroisses.

!!! info "Configuration initiale et évolutions futures"
    La configuration initiale est paramétrable uniquement par un administrateur CiviParoisse.  
    Si vous souhaitez faire évoluer la configuration en place, adressez-vous à l'UEPAL.

## Affectation d'un Individu à une paroisse

L'affectation peut être réalisée de plusieurs façons :

- Lors de l'utilisation du formulaire Civiparoisse de création d'un individu/particulier, un champ de choix `Paroisse` est proposé dans la partie `Lien avec la paroisse`.

- Lors de la modification d'une fiche Individu, un champ de choix `Paroisse` est proposé dans la partie `Multiparoisse`.

- Le menu `Paroisse`/`Multiparoisse`/`Affectation aux paroisses` propose une liste des individus qui ne sont pas affectés à une paroisse.
     - Cet écran indique le résultat des outils d'aides à la décision.
     - Des actions de masse peuvent permettre d'affecter à la bonne paroisse, en utilisant les actions proposées : validation de la paroisse proposée ou modifications en masse des coordonnées des fiches.

Si vous n'affectez pas un Individu à une paroisse, il sera considéré comme rattaché à la *paroisse par défaut*.  

## Utilisation au quotidien

Les listes proposées dans le bouton `Listes` prennent en compte le mode Multiparoisse lorsque c'est pertinent.

Vous avez alors la possibilité de filtrer sur une ou plusieurs paroisses, en renseignant les critères de choix. Les listes affichées proposent alors une colonne indiquant le nom de la paroisse de rattachement (ou l'indication *Paroisse par défaut* si aucun rattachement n'a été saisi).

## Pour en savoir plus

La documentation disponible dans la partie Technique vous donnera plus de détails sur les configurations techniques de cette fonctionnalité, [en cliquant ici](https://uepal-civiparoisse-documentation.github.io/TECHNIQUE/LOGICIEL/multiparoisse.html).