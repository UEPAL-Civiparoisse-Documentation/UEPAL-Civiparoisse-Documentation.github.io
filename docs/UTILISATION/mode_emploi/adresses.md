# Gérer les adresses dans CiviParoisse

Cette page explique comment utiliser les fonctionnalités de normalisation des adresses.  
Cette fonctionnalité s'adresse principalement aux paroisses qui **gèrent des listes de distribution par quartiers**. Elle peut aussi intéresser les paroisses qui veulent veiller à une saisie correcte et standardisée des adresses.

## :fontawesome-regular-address-card: Créer ou modifier une adresse normalisée

Lors de la création ou la modification d'une fiche, le bouton `Assistant de saisie de l'adresse` vous permet d'enregistrer une adresse normalisée.  
Après avoir cliqué sur ce bouton une nouvelle fenêtre va s'ouvrir. Choisissez dans les listes déroulantes :

* le département
* la ville
* le nom de la rue
* le numéro de la rue avec éventuellement le suffixe
* et enfin le code postal

En cliquant sur `Valider`, l'adresse normalisée va s'insérer dans les champs Adresses de la fiche concernée. Vous pouvez alors enregistrer la fiche.

!!! warning "Attention"
    Pour le moment, la saisie des adresses normalisées n'est possible que **pour les départements 25, 54, 55, 57, 67, 68, 88 et 90**.  
    Pour les autres départements, saisissez directement l'adresse dans les champs du formulaire.

## :material-text-box-check-outline: Valider les adresses saisies manuellement

Lorsque vous saisissez une adresse manuellement (ou pour les adresses saisies dans le passé), CiviParoisse va chercher à rapprocher votre saisie de la Base Nationale des Adresses. Il vous **appartient de vérifier que ce rapprochement soit correct**, en validant les adresses ainsi proposées. Cette validation se fait de la façon suivante :

1. Allez dans le menu `Paroisse`dans le menu en haut de l'écran
1. Allez dans le sous-menu `Gestion des adresses` et choississez `Validation des propositions d'adresses`
1. Un code couleur dans les colonnes *Saisie : rue* et *Saisie : ville* vous aide à repérer les différences.
    * Vert : la rue ou la ville saisies semblent correspondre à la proposition
    * Rouge : la rue ou la ville saisies semblent ne pas correspondre pas à la proposition
    * :fontawesome-solid-warning: Ce code couleur ne garantit pas que l'adresse proposée soit correcte. Il vous appartient de vérifier chaque adresse.
1. Comparez l'adresse que vous avez saisie (dans les colonnes ***Saisie***) et les propositions (dans les colonnes ***Propositions***).
1. Si l'adresse proposée est correcte
     1. Cochez la case au début de la ligne
     2. Cliquez sur le bouton `Actions` en haut de l'écran et cliquez sur `Valider l'adresse proposée`
1. Si l'adresse proposée n'est pas correcte
     1. Cliquez sur le nom de la fiche en fin de ligne
     2. Dans l'onglet qui s'ouvre, modifiez l'adresse de préférence en utilisant le bouton `Assistant de saisie de l'adresse`
     3. Revenez à la liste de validation, actualisez-la, et reprenez au point 3 ci-dessus.
1. Si l'adresse proposée est toujours incorrecte
    1. Cochez la case au début de la ligne
    2. Cliquez sur le bouton `Actions` en haut de l'écran et cliquez sur `Déclarer erronée une proposition d'adresse`

<!-- PARTIE A FINIR 
Que faire si l'adresse est erronée? Comment corriger ?-->

## :fontawesome-regular-contact-book: Consulter l'ensemble des adresses

A tout moment, il est possible de consulter l'ensemble des adresses de vos fiches, et de visualiser si vous devez encore les modifier.

1. Allez dans le menu `Paroisse`dans le menu en haut de l'écran
2. Allez dans le sous-menu `Gestion des adresses` et choississez `Adresse : toutes les propositions`
3. La première colonne vous indique l'état de l'adresse :
    * Valide (fond vert) : vous avez déjà indiqué que cette adresse était correctement restituée
    * Non vérifié (fond jaune) : vous n'avez pas encore indiqué si cette adresse était correctement restituée par l'outil. Vous pouvez le faire en suivant les explications ci-dessus (*Valider les adresses saisies manuellement*)
    * Erroné (fond rouge) : vous avez indiqué précédemment que cette adresse était incorrectement restituée par l'outil
    * Obsolète (fond rouge) : l'outil a rencontré une difficulté technique et n'a pas pu identifier l'adresse

<!--TO DO (rajouter des critères de filtre dans le formulaire : l'état de l'adresse -->

## :material-mailbox-up: Editer la liste de distribution par Quartier

La `Liste de distribution par Quartier` est disponible dans le menu Listes de la page d'accueil, dans la partie Communication -> Distribution. 

Lorsque vous imprimez la liste, **chaque Quartier est imprimé sur une page à part**, ce qui vous permet de donner facilement une liste à chacun de vos porteurs.  
En haut de l'écran, vous pouvez modifier le nombre de critères pris en compte pour le découpage des tableaux. Par défaut, un seul critère est pris en compte : le premier indiqué dans la partie *Critères de tri sélectionnés*. En augmentant le nombre de critères, vous pouvez imprimer plus de listes.

Si vous n'avez pas encore finalisé la validation des adresses (cf explications ci-dessous), pensez à rajouter le critère `Non vérifié` dans le filtre *Validation* en haut de l'écran.  
Un signe d'avertissement (:fontawesome-solid-warning:) est alors visible devant les adresses non vérifiées. Ce signe permet à vos porteurs de savoir qu'ils doivent vérifier ces adresses lors de leur tournée.

La page vous indique les critères de tri de votre liste. **Vous pouvez modifier les critères choisis par défaut**. Pour cela, cliquez sur la colonne que vous triez en premier (cliquez une deuxième fois si vous voulez inverser l'ordre de tri).  
Pour rajouter des critères de tri supplémentaires, appuyez sur la touche `Maj` de votre clavier en même temps que vous cliquez sur la colonne choisie. Cliquez une deuxième fois (toujours avec la touche `Maj` enfoncée) si vous voulez inverser l'ordre de tri.

!!! info "Imprimer la liste de distribution"
    Pour imprimer la liste de distribution par Quartier, utilisez les fonctionnalités d'impression de votre navigateur (généralement via le menu `Fichier` puis `Imprimer` ou via le raccourci clavier `Ctrl+P` / `Cmd+P`).

## :material-help-box-multiple: Que faire si ?

### :material-map-search: Une adresse correcte n'est pas reconnue
 
Si vous constatez une anomalie dans la mise en correspondance entre , il y a lieu de vérifier la cohérence et l'orthographe des données (d'abord département et code postal, puis ville, puis rue, puis numéro de rue et suffixe), éventuellement en faisant des tests à l'aide de l'Assistant de Saisie, et en corrigeant la saisie si nécessaire. 

Il peut arriver que les données disponibles ne soient pas complètes. Dans ce cas nous vous conseillons de chercher à vérifier les données depuis le site <https://adresse.data.gouv.fr/>{:target="_blank"}.

* Si le site adresse.data restitue correctement l'adresse, mais que cette adresse n'est pas disponible dans CiviParoisse, vous pouvez déclarer l'adresse comme étant **invalide**. Cela permettra, dès qu'il y aura eu une mise à jour des données du moteur, de réussir à obtenir une mise en correspondance. Si ce n'est pas le cas après plusieurs tentatives, il sera bon de contacter l'UEPAL.
* En revanche, si les données ne sont pas sur <https://adresse.data.gouv.fr/>{:target="_blank"}, il peut alors être judicieux de se rapprocher des services administratifs locaux compétents pour leur demander l'ajout de cette adresse dans la Base Nationale des Adresses.

