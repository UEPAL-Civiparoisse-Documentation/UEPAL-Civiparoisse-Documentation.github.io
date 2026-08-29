<!-- D11 C6.15 OK, Peter le 11.07.2026 -->

# 18 - Gestion des rôles et profils

## 001 - Menu Administrer non visible

1. Dans la barre de menu en haut de l'écran, le menu `Administrer` ne doit pas être présent.
1. CONFIRMEZ que le menu `Administrer` n’est pas visible.

## 002 - Option Import non visible

1. Ouvrir le menu `Contacts` dans la barre de menu en haut de l'écran.
2. CONFIRMEZ que les menus suivants **ne sont pas** visibles : `Importer des Contacts`, `Importer des Activités` et `Importer (valeurs multiples)`.

## 003 - Menu Rapports non visible

1. Dans la barre de menu en haut de l'écran, le menu `Rapports` ne doit pas être présent.
1. CONFIRMEZ que le menu `Rapports` n’est pas visible.

## 004 - Menu Support non visible

1. Dans la barre de menu en haut de l'écran, le menu `Support` ne doit pas être présent.
1. CONFIRMEZ que le menu `Support` n’est pas visible.

## 005 - Mettre en place l’accès pour un nouvel utilisateur

1. Choisissez une fiche Individu, et renseigner une adresse mail dans le champ Mail.
2. Suivez les instructions (à partir du point 2) décrites dans le Mode d’Emploi : <https://uepal-civiparoisse-documentation.github.io/UTILISATION/mode_emploi/gestion_base_donnees.html#donner-acces-a-la-base-de-donnees-pour-un-nouvel-utilisateur>.
3. Notez soigneusement le nom d’utilisateur et le mot de passe.
4. Déconnectez-vous de CiviParoisse.
5. Connectez-vous avec le nom d’utilisateur et le mot de passe crée ci-dessus.
6. CONFIRMEZ que vous avez bien accès à CiviParoisse, avec les droits relatifs au rôle que vous avez choisi.
7. Conservez le nom d’utilisateur et le mot de passe pour les tests suivants.
8. Déconnectez-vous.
9. Reconnectez-vous avec votre nom d’utilisateur et mot de passe de départ.
10. CONFIRMEZ que vous bien à nouveau accès à CiviParoisse.

## 006 - Supprimer l’accès à un utilisateur

*Ce test est à réaliser après avoir effectué le test « Mettre en place l’accès pour un nouvel utilisateur » décrit ci-dessus.*

1. Connectez-vous avec votre Utilisateur et Mot de passe (et pas avec celui que vous avez créé dans le test ci-dessus)
2. Suivez les instructions décrites dans le Mode d’Emploi : <https://uepal-civiparoisse-documentation.github.io/UTILISATION/mode_emploi/gestion_base_donnees.html#supprimer-lacces-a-la-base-de-donnees-a-un-utilisateur-existant>. 
3. Déconnectez-vous de CiviParoisse.
4. Connectez-vous avec le nom d’utilisateur et le mot de passe crée dans le test ci-dessus.
5. CONFIRMEZ que la connexion n’est pas autorisée.

## 007 - Lister les utilisateurs de votre CiviParoisse

1. Sur la page d'accueil, cliquez sur le bouton `Listes`.
1. Dans la partie `Gestion` / `Administration`, cliquez sur `Liste des Utilisateurs`.
1. CONFIRMEZ qu'une liste s'ouvre avec votre nom dans la colonne *Nom de l'utilisateur*.
1. CONFIRMEZ que votre dernière connexion est indiquée comme *Inférieur à 3 mois* (voir la colonne *Dernière connexion*).
1. Si vous avez effectué les tests ci-dessus, CONFIRMEZ que l'utilisateur que vous avez supprimé est indiqué comme *Bloqué* dans la colonne *Statut*.
