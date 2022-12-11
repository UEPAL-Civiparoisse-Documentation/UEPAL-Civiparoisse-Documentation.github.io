# Civiparoisse : Aspects fonctionnels

Le projet CiviParoisse est un projet récent, qui fournit aux paroisses un outil de gestion opérationnelle. Le projet a été conforté par le virage numérique dû à la crise sanitaire (en particulier lors des confinements). Ce document présente les différents aspects du projet (notamment fonctionnels, techniques, organisationnels).

Les fonctionnalités qui sont requises par les paroisses peuvent être globalement regroupées en 4 familles :

* la connaissance des acteurs de la paroisse
* la communication avec les acteurs
* les statistiques de la paroisse
* une aide pour certains sujets de gestion liés à la paroisse.

## La connaissance des acteurs de la paroisse
La connaissance des acteurs de la paroisse est un élément essentiel : une paroisse est en premier lieu une communauté de personnes, dont les interactions vont contribuer à la vie de la paroisse. Cette connaissance requiert de connaître et de mettre à jour des données personnelles usuelles (nom, prénom, adresse, téléphone, mail…), mais également des données plus intimes (filiation), de même que des données sensibles (ayant trait à la religion).

On parle ici d’acteurs de la paroisse, car des personnes de différents profils peuvent y figurer :  les **paroissiens**, c’est à dire les membres de la paroisse, ainsi que des personnes ressources pour la paroisse (exemple : contact du trésorier de la paroisse), des **personnes externes** mais dont il faut conserver les données pour des situations particulières (ex : informations sur les parents séparés d’un catéchumène). Des **personnes morales** peuvent également être représentées (associations, institutions locales comme la municipalité ou une communauté de communes), de même que des **groupes** (ex : activités paroissiales : chorale, catéchumènes, sacristains, organistes, ouvroir…).

Outre les données sur les acteurs en eux-mêmes, il est également important de pouvoir disposer de précisions sur la **relation entre les acteurs** : par exemple, dans le cadre d’une activité, savoir qui est le responsable de l’activité. Ces relations peuvent d’ailleurs évoluer dans le temps (ex : les conseillers presbytéraux, qui ont des mandats limités dans la durée), mais peuvent également être multiples (ex : certains conseillers presbytéraux sont en plus membre du bureau ; des paroissiens peuvent être des membres consultatifs du conseil presbytéral pour des domaines d’expertise spécifique, ...).

## La communication avec les acteurs de la paroisse
La communication des paroisses repose traditionnellement sur plusieurs vecteurs :

* les annonces lors des cultes
* le journal paroissial papier
* le bouche à oreille.
    
Ces méthodes sont peu adaptées aux évolutions technologiques :

* le mail
* les appels téléphoniques
* les réseaux sociaux
* les sites web.

Civiparoisse cherche à optimiser la communication par mail envers les différents acteurs. On peut distinguer plusieurs cas d’utilisation :

* la newsletter : c’est le pendant électronique du journal paroissial, avec des informations « générales ». Il est nécessaire de proposer également une possibilité de se désabonner de la newsletter 
<!-- Pas sûr qu'on ait besoin de préciser le désabonnement ici -->
* les campagnes de mails ciblés : on envoie des mails avec des informations sur des sujets précis à des personnes sélectionnées en fonction des critères liés à la connaissance des acteurs
* la communication vers une personne : Civiparoisse peut afficher les coordonnées d’une personne, et même permettre l'envoi de mails individuels.
<!-- PAS SUR D'AVOIR BIEN COMPRIS CETTE PHRASE : Il est facile de forger des URL (telURI, par exemple) qui peuvent ensuite être exploitées sur le poste de l’utilisateur accédant à CiviParoisse -->
* les mails système d’administration : logs, alertes,…

<!-- Pas sûr qu'on ait besoin d'évoquer ce point. Il faut que nous le gérions dans le cadre du projet -->
Il y a un cas d’utilisation lié, mais qui est en périphérie du projet : le stockage des médias référencés par les mails. Le plus simple serait :

* soit d’inclure les médias via des pièces jointes, ou des data URI
* soit de stocker les médias dans un serveur web tiers, ou un CDN.

Dans le cas d’une communication pour le compte de la paroisse, il y a des besoins complémentaires, mais qui sortent du cadre du projet :

* identité de la paroisse sur internet : son site web
* identité visuelle de la paroisse, dont découlent des chartes graphiques pour les différents médias
* connaissances et compétences en webmarketing, notamment pour les communications de masse
* organisation à un niveau plus global : projet de paroisse (équivalent d’un business plan), organisation interne de la paroisse pour réaliser le projet de paroisse...

Enfin, le projet Civiparoisse n’a pas vocation à héberger un site web de paroisse, en raison de la nature des données opérationnelles déjà hébergées, qui ne sont pas publiques. De même, les réseaux sociaux sont des outils externes qui se situent plutôt sur des plateformes hébergées tierces (YouTube, Facebook, Twitter, LinkedIn…) avec d’éventuelles intégrations sur un site web (non prévu dans ce projet).

## Les statistiques de la paroisse
Les paroisses sont consommatrices de statistiques, pour des fins diverses :

* rapport sur les différents évènements : les baptêmes, confirmations, mariage, décès sur l’année écoulée
* rapports opérationnels : liste des personnes ayant un anniversaire proche, liste des données qui commencent à dater et doivent donc être vérifiées, les paroissiens présents sur un secteur donné, etc...
* data mining sur les données collectées, pour mieux ajuster le projet de paroisse : rapports démographiques, rapports sur les compétences… <!-- Voir si on peut reformuler Le minage sera donc léger et réalisé au sein de l’outil CiviCRM, sans chercher à utiliser des outils de data mining poussés comme Weka par exemple. -->
<!-- Formulation peut-être à retravailler pour être plus explicite sur ce qu'on ne veut pas faire de suite -->
Il n’est pas encore prévu d’utiliser des outils de reporting spécialisés (Jasper Report Server par exemple) pour ce besoin, mais ceci pourra changer par la suite.

## Aide pour certains besoins de gestion
La paroisse est tenue de maintenir le registre paroissial, duquel on doit pouvoir sortir au besoin une proposition de liste des électeurs. La gestion de ces documents nécessite le traitement d’informations précises, que ce soit sur les croyances, le baptême, le lieu de résidence.
 
Un autre pôle de ce besoin est la génération de reçus de dons, ce qui implique donc le traitement de données comptables.

On comprendra que le besoin d’aide pour certaines nécessités de gestion s’intègre dans les autres besoins évoqués, mais sera amener à évoluer pour s’adapter aux évolutions des textes (droit local, règlement intérieur des églises, décisions du Directoire de l’UEPAL, décisions préfectorales…).
