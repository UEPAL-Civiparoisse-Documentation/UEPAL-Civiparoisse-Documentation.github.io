# Présentation des livrables Civiparoisse
<!-- J'aimerai qu'on reparle de cette page. Je ne suis pas favorable à évoquer la possibilité de l'installer tout seul. Par contre la description des livrables me parait très utile -->
La philosophie du projet est de laisser les paroisses qui souhaitent utiliser Civiparoisse **libres et responsables** de leurs choix d'implémentation. De ce fait, Civiparoisse définit un certain nombre de **livrables** que les paroisses pourront utiliser si elles le souhaitent. Ces livrables correspondent à des niveaux d'intégration de Civiparoisse dans des environnements de plus en plus étendus. 


## Approches envisagées pour les paroisses
La mise en œuvre de la solution est envisageable sous trois formes, en fonction des souhaits des paroisses :

* le code développé étant sous licence de logiciel libre, les paroisses sont libres de réutiliser le code d’elles-mêmes et d’héberger la solution comme bon leur semble, voire même de créer leur propre solution ; toutefois, on constate en pratique que les ressources humaines ayant des compétences en informatique sont rares dans les paroisses, et donc, même si la possibilité d’indépendance des paroisses existe, cette solution est difficilement envisageable

* les paroisses peuvent souhaiter disposer d’un « package logiciel » et assurer les aspects infrastructures elles-mêmes : ceci permet aux paroisses qui désirent administrer leur solution de le faire comme bon leur semble, tout en profitant toutefois d’une solution logicielle commune. Ceci peut également être arrangeant pour une paroisse qui aurait déjà une infrastructure existante

* prévoir la possibilité d’une infrastructure d’hébergement « centralisée », où seront déployées les instances packagées décrites au-dessus : cette deuxième solution est la voie privilégiée, avec d’éventuelles économies d’échelles (en particulier, les moyens humains utilisés, mais également les matériels) ; en contrepartie, les paroisses perdent notamment la main mise sur le système : il s’agira donc de concevoir un « produit standardisé d’hébergement ».

## Livrables
On retrouve donc, dans un degré d'intégration croissant :
### Composants logiciels spécifiques

Ces composants sont pour l'heure au nombre de trois : 

* plugin pour l'authentification, au niveau de Drupal
* plugin d'installation de CiviCRM
** extension CiviCRM contenant le code de Civiparoisse.

### Images Docker

Si l’on regarde l’évolution des pratiques d’hébergement informatique, on est passé progressivement des serveurs physiques dédiés aux machines virtuelles, et depuis quelques années, avec l’avènement de la tendance devops, on assiste plutôt à un passage à des architectures microservices containarisés.

Dans le cadre du package logiciel pour la production, il semble plus judicieux de passer par des containers et l’infrastructure microservices. En effet, ce type d’architecture est conçue pour faciliter les mises à jour des infrastructures de manière rapide, en recréant les images des containers via des fichiers de build. De plus, on peut avoir une séparation plus nette entre les chemins qui sont en lecture écrite et ceux en lecture seule, avec en particulier la notion de volumes. Cette notion de volume peut d’ailleurs aussi être exploitée pour chercher à concentrer les éléments de configuration des environnements dans des endroits spécifiques (config map kubernetes par exemple), et les données sensibles (clefs par exemple) peuvent être stockés dans des volumes de secrets. Enfin, les logs peuvent être disponibles via les entrées sorties standard.

En revanche, pour des démonstrations, l’installation dans une machine virtuelle est plus accessible et plus simple à mettre en œuvre.

Les images tendent à s'affiner progressivement ; pour l'heure, on retrouve les images suivantes :

* composer_base : une image avec une version de composer dont les dépendances sont compatibles avec le code de CiviCRM


* composer_files : image qui va mettre en oeuvre un fichier composer.json permettant de récupérer l'ensemble des fichiers nécessaires à l'installation du système


* tools : image qui ajoute des outils d'usage général et qui va servir en tant qu'image "tout terrain" pour des images à utilisation "éphémère"


* init : image pour initialiser une instance (au niveau des fichiers et de la base de données) de CiviCRM, avec une configuration initiale basique


* cron : image pour exécuter les tâches périodiques


* selfkeys : image pour figer un ensemble de clefs autosignées pour faciliter les déploiements de démonstration

* httpd : le serveur web interne, qui est accédé indirectement pour répondre aux utilisateurs


* authenticator : un petit service d'authentification pour vérifier les identifiants d'un utilisateur


* proxy : reverse proxy qui va authentifier les requêtes des utilisateurs et les transmettre au serveur web interne.

Des docker-compose complètent ces images pour monter rapidement un environnement pour faire une démonstration ou des essais.

#### Prérequis
Les prérequis constituent des éléments que les paroisses qui souhaitent utiliser les images devront s’occuper elles-mêmes. On ne peut ni couvrir tous les sujets, ni les aborder spécifiquement, mais on peut citer en première intention les points suivants :

* les paroisses devront administrer civicrm et drupal, et savoir utiliser la solution : les paroisses devront avoir un responsable qui sera administrateur civicrm et drupal, poureffectuer les opérations courantes d’administration (création, désactivation de comptes, reset de mot de passe...)

* les paroisses devront savoir comment reconstruire une image : ceci est notamment nécessaire pour palier au cas où un patch de sécurité devrait rapidement appliqué

* les images, lorsqu’utilisées dans des containers, nécessitent des volumes de données pour les données persistantes. Ces volumes seront gérés par l’hôte. On aura besoin de plusieurs volumes, avec la particularité que les volumes de fichiers métiers seront partagés entre containers (cron, web, et sauvegarde, notamment). Les volumes devront être chiffrés, et la sauvegarde devra être chiffrée et déportée vers un site distant en France, qui offre des garanties quant à la sécurité des données

* l’hôte : il faut le voir comme un environnement d’exécution qui a été fiabilisé, de haute disponibilité, et le plus sécurisé possible 

* un nom de domaine est requis, car il est utile en particulier pour les enregistrements DNS spécifiques pour les techniques antispam (DKIM, SPF)

* de plus, il faudra gérer un service de messagerie lié au domaine, en particulier pour récupérer et traiter les retours en erreur des envois de mails en masse. Les envois de mails en masse devront d’ailleurs passer par un prestataire spécialisé, car normalement ces prestataires devraient mieux savoir gérer des problèmes de mails considérés comme spams, et peuvent éventuellement avoir des serveurs reconnus comme des sources de trafic légitime

* il faudra non seulement placer l’ensemble de l’infrastructure derrière un pare-feu, mais il faudra également prévoir un accès à CiviParoisse uniquement via un VPN, accédé via une authentification forte

* des certificats vont également être nécessaires, en particulier pour le serveur web, ce qui pose le problème de la gestion des clefs et d’une PKI. L’ensemble des flux réseaux devra être chiffré


* il faudra également mettre en place des outils de supervision / monitoring des containers, de même que la récupération et l’analyse des logs.

Vu la complexité, les compétences, et la disponibilité des ressources, autant matérielles qu’humaines, qui entrent en jeu, on peut a priori penser qu’il sera plus efficace de centraliser l’hébergement (et intrinsèquement l’administration) des instances.

### Intégration Kubernetes

un **package Helm** : le package permet de fournir un processus de déploiement dans des plateformes Kubernetes

### Hébergement

* un **hébergement dans une infrastructure** négociée par l'Uepal.

L'ensemble des codes seront livrés dans des dépôts Git à accès public. Il est à noter que ces dépôts à accès public ne sont pas les dépôts utilisés pour le développement, et ne contiendront que des ""versions numérotées" des codes.