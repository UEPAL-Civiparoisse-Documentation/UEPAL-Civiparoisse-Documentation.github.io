# Intégration des rôles

Les rôles utilisateurs sont un sujet complexe. Un rôle regroupe un ensemble de permissions qui sont nécessaires à la réalisation d'une tâche.
On attribute ensuite à un utilisateur le ou les rôles qui lui sont nécessaires.


Au niveau de CiviCRM au-dessus de Drupal, on constate que les permissions utilisées sont intégrées dans Drupal, si bien que la gestion des rôles se ferait réellement au niveau de Drupal et pas au niveau de CiviCRM. On ne parle en revanche pas ici du système d'ACL proposé par CiviCRM.

!!! Danger "Attention : L'exception de l'utilisateur Drupal UID 1"

    Cet utilisateur est une exception dans Drupal, car il est prévu pour toujours se voir donner toutes les permissions.


## Schéma yaml

Les rôles sont stockés comme des objets de configuration, et se retrouvent de ce fait dans la table `config` de Drupal, et comment par `user.role`. Etant donné que ce sont des objets de configuration, ils sont décrits par un schéma (`/app/web/core/modules/user/config/schema/user.schema.yml`):

```yaml
user.role.*:
  type: config_entity
  label: 'User role settings'
  mapping:
    id:
      type: string
      label: 'ID'
    label:
      type: label
      label: 'Label'
    weight:
      type: integer
      label: 'User role weight'
    is_admin:
      type: boolean
      label: 'User is admin'
    permissions:
      type: sequence
      label: 'Permissions'
      sequence:
        type: string
        label: 'Permission'

```

Il devient de ce fait plus intéressant de coder les rôles dans des fichiers yaml, voire même de les créer sur une instance de développement, supprimer leur uuid, et de les récupérer pour les intégrer dans les autres instances, où le nom de fichier détermine le nom de l'objet de configuration.

## Export d'un rôle

```bash
drush config:get user.role.r1 >user.role.r1.yml
cat user.role.r1.yml
```

```yaml
uuid: b0d165ca-3a16-4996-9aa8-e57366a22a2c
langcode: fr
status: true
dependencies:
  module:
    - block
    - civicrm
id: r1
label: R1
weight: 4
is_admin: null
permissions:
  - 'administer blocks'
  - 'authenticate with password'
```

Pour supprimer au passage l'UUID :

```bash
cat user.role.r1.yml |grep -v uuid >TEST/user.role.r1.yml
```

##Import des rôles

Pour importer le fichier yaml, il faut faire attention de bien indiquer un import partiel (sans quoi les objets de configuration non existants sont supprimés). La source est le répertoire dans lequel sont stockés les fichiers à importer.

```bash
drush --no-interaction config:import --partial --source=/app/TEST -vvv
```

## Vérification de l'état

Pour vérifier la source de configuration pour les différents objets :

```bash
drush config:status
```

## Implémentation dans le SI
Le moyen le plus simple d'intégrer les rôles est de créer un package composer supplémentaire à l'aide d'un dépôt git, et d'appeler les commandes drush lors de l'installation initiale et lors des mises à jour. De ce fait, les packages de rôles seront versionnés et la correspondance de versions sera maîtrisée via le composer.json principal ; de plus, ces fichiers seront présents directement dans les images Docker, qui elles-mêmes peuvent être taggées, et donc versionnées.

## Stratégie à long terme
Il est probable que l'ensemble des rôles proposés avec Civiparoisse ne correspondra pas aux besoins de toutes les paroisses, et que des jeux de rôles vont venir remplacer ou compléter le jeu de rôles initial.

Toutefois, il faut assurer une certaine "compatibilité ascendante", de sorte à ne pas casser les droits et surtout les droits non donnés aux utilisateurs. Ainsi, si un rôle est crée, il ne devra pas être modifié, car il faut considérer qu'il a pu être utilisé par une paroisse, et qu'il ne faut pas interférer dans les droits donnés par une paroisse.

A ce sujet, comme les paroisses peuvent également créer des rôles, il faudra définir un préfixe utilisé pour les rôles préparés pour Civiparoisse. On pourrait donc arriver à un nom de rôle comme  `user.role.civiparoisse.<nom_jeu>_<nom_role>`.

Un cas particulier doit cependant être prévu : le cas où les permissions évoluent dans CiviCRM ou Drupal. Dans ce cas précis, on peut envisager de supprimer les droits des anciens rôles crées par Civiparoisse et préparer un nouveau jeu de rôles : l'utilisateur UID 1 pourra de toute manière intervenir pour mettre en place les nouveaux droits : c'est une approche sûre, dans la mesure où on ne donnera à aucun moment par mégarde des droits trop importants à des utilisateurs. En revanche, si l'utilisateur UID 1 n'est pas un utilisateur de la paroisse (équipe technique interne Civiparoisse), il faudra convenir d'une réunion de maintenance avec les responsables de la paroisse pour effectuer les actions qui conviennent.

