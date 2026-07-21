<!-- D11 C6.15 OK, Peter le 11.07.2026 -->

# 12 - Gestion des contrôles et améliorations

## 001 - Test du bon fonctionnement des contrôles

1. Sur la page d’accueil, cliquez sur l’icône `Contrôles`.
2. Cliquez sur chaque case qui affiche un chiffre en rouge
3. CONFIRMEZ qu’une liste s’affiche dans un nouvel onglet.

## 002 - Test du bon fonctionnement des améliorations

1. Sur la page d’accueil, cliquez sur l’icône `Contrôles`.
2. Cliquez sur le lien des Améliorations.
3. CONFIRMEZ qu’un nouvel onglet *Améliorations des données de la base CiviParoisse* s’ouvre dans un nouvel onglet.
4. Cliquez sur chaque case qui affiche un chiffre en rouge
5. CONFIRMEZ qu’une liste s’affiche dans un nouvel onglet.

## 003 - Personnalisation du nom des Quartiers

1. Dans le menu `Paroisse` en haut de l'écran, cliquez sur `Paramètres`.
2. CONFIRMEZ que la page *Paramètres CiviParoisse* s'affiche, et qu'elle contient un lien `Modifier la liste des Quartiers`.
3. Cliquez sur ce lien, et CONFIRMEZ que la liste affiche 50 quartiers.
4. Modifiez le nom d'un de ces quartiers.
5. Passez un autre quartier à *Visible = Non*.
6. Allez sur une fiche Foyer.
7. CONFIRMEZ que le quartier modifié affiche bien le nouveau nom, et que le quartier "non visible" ne s'affiche pas dans la liste des Quartiers sur la fiche Foyer.
8. Retournez dans la modification des noms de quartier
9. Remettez en place le nom initial du quartier modifié ; et repassez la visibilité à Oui de l'autre quartier.
10. Allez sur une fiche Foyer.
11. CONFIRMEZ que le quartier modifié affiche bien le nom corrigé, et que le quartier non visible auparavant est maintenant visible à nouveau.

## 004 - Liste Distribution Inconnu

1. Créez une fiche Foyer en indiquant *Inconnu* dans le champ `Mode de distribution du journal`.
2. Retournez sur la page d’accueil.
3. Cliquez sur le lien `Contrôles` dans le menu CiviParoisse.
4. Allez sur la lien des Améliorations en cliquant sur le lien dans le paragraphe « Comment utiliser cette page ? ».
5. Dans les Améliorations sur les fiches Foyer, Ouvrez la partie `Foyers dont le mode de distribution est inconnu`.
6. CONFIRMEZ que le Foyer nouvellement crée est présent dans la liste.
7. Lisez les instructions décrites dans *Actions à mener*.
8. Déroulez ces instructions pour améliorer la fiche.
9. Affichez à nouveau la liste des Contrôles.
10. CONFIRMEZ que le Foyer a disparu de la liste.

## 005 - Détection d’une fiche Individu sans Genre

1. Créez une fiche Individu en utilisant le menu Contacts / Nouveau Particulier, et ne remplissez pas le Genre lors de la création.
2. Allez sur le menu d’accueil, et cliquez sur le bouton `Contrôles` du menu CiviParoisse.
3. Cliquez sur la case `Individus sans Genre`.
4. CONFIRMEZ que du texte s’affiche (avec des rubriques d’explications : Contextes, Risques, etc...).
5. CONFIRMEZ que la fiche que vous avez créée apparait dans le tableau sous la rubrique *Liste des Individus concernés*.
6. Lisez les instructions décrites dans *Actions à mener*.
7. Déroulez ces instructions pour corriger l’anomalie.
8. Affichez à nouveau la liste des Contrôles.
9. CONFIRMEZ que l’Individu a disparu de la liste.

## 006 - Détection d’une fiche Individu sans Civilité

1. Créez une fiche Individu en utilisant le menu Contacts / Nouveau Particulier, et ne remplissez pas la Civilité lors de la création.
2. Allez sur le menu d’accueil, et cliquez sur le bouton `Contrôles` du menu CiviParoisse.
3. Cliquez sur la case `Individus sans Civilité`.
4. CONFIRMEZ que du texte s’affiche (avec des rubriques d’explications : Contextes, Risques, etc...).
5. CONFIRMEZ que la fiche que vous avez créée apparait dans le tableau sous la rubrique *Liste des Individus concernés*.
6. Lisez les instructions décrites dans *Actions à mener*.
7. Déroulez ces instructions pour corriger l’anomalie.
8. Affichez à nouveau la liste des Contrôles.
9. CONFIRMEZ que l’Individu a disparu de la liste.

## 007 - Détection d’une fiche Individu sans lien avec la Paroisse

1. Créez une fiche Individu en utilisant le menu Contacts / Nouveau Particulier, et ne créez pas de statut Adhésion lors de la création.
2. Allez sur le menu d’accueil, et cliquez sur le bouton `Contrôles` du menu CiviParoisse.
3. Cliquez sur la case `Individus sans Lien avec la Paroisse`.
4. CONFIRMEZ que du texte s’affiche (avec des rubriques d’explications : Contextes, Risques, etc...).
5. CONFIRMEZ que la fiche que vous avez créée apparait dans le tableau sous la rubrique *Liste des Individus concernés*.
6. Lisez les instructions décrites dans *Actions à mener*.
7. Déroulez ces instructions pour corriger l’anomalie.
8. Affichez à nouveau la liste des Contrôles.
9. CONFIRMEZ que l’Individu a disparu de la liste.

## 008 - Détection d’une fiche Individu n’ayant pas de lien avec un Foyer ou une Organisation

1. Créez une fiche Individu en utilisant le menu Contacts / Nouveau Particulier, et ne créez pas de relation Membre de avec le Foyer lors de la création.
2. Allez sur le menu d’accueil, et cliquez sur le bouton `Contrôles` du menu CiviParoisse.
3. Cliquez sur la case *Individus sans lien avec un Foyer ou une Organisation*.
4. CONFIRMEZ que du texte s’affiche (avec des rubriques d’explications : Contextes, Risques, etc...).
5. CONFIRMEZ que la fiche que vous avez créée apparait dans le tableau sous la rubrique *Liste des Individus concernés*.
6. Lisez les instructions décrites dans *Actions à mener*.
7. Déroulez ces instructions pour corriger l’anomalie.
8. Affichez à nouveau la liste des Contrôles.
9. CONFIRMEZ que l’Individu a disparu de la liste.

## 009 - Détection des personnes de plus de 18 ans ayant le statut Inscrit Enfant

1. Créez une fiche Individu en utilisant le menu Contacts / Nouveau Particulier, en indiquant une date de naissance inférieure à 2000 (avant l’an 2000).
2. Allez sur la fiche ainsi créée.
3. Renseignez une Adhésion *Inscrit.e Enfant* sur la fiche.
4. Allez sur le menu d’accueil, et cliquez sur le bouton `Contrôles` du menu CiviParoisse.
5. Cliquez sur la case *Individus de plus de 18 ans ayant encore le Statut ‘Inscrit Enfant’*.
6. CONFIRMEZ que du texte s’affiche (avec des rubriques d’explications : Contextes, Risques, etc...).
7. CONFIRMEZ que la fiche que vous avez créée apparait dans le tableau sous la rubrique *Liste des Individus concernés*.
8. Lisez les instructions décrites dans *Actions à mener*.
9. Déroulez ces instructions pour corriger l’anomalie.
10. Affichez à nouveau la liste des Contrôles.
11. CONFIRMEZ que l’Individu a disparu de la liste.

## 010 - Détection des personnes ayant un Statut Enfant et une Relation Chef de famille

1. Créez une fiche Individu en utilisant le menu Contacts / Nouveau Particulier, en indiquant une date de naissance antérieure à 2000 (avant l’an 2000).
2. Allez sur la fiche ainsi créée.
3. Renseignez une Adhésion *Inscrit.e Enfant* sur la fiche.
4. Renseignez une Relation *Chef de famille* sur la fiche.
5. Allez sur le menu d’accueil, et cliquez sur le bouton `Contrôles` du menu CiviParoisse.
6. Cliquez sur la case *Individus Enfants avec Statut Chef de famille*.
7. CONFIRMEZ que du texte s’affiche (avec des rubriques d’explications : Contextes, Risques, etc...).
8. CONFIRMEZ que la fiche que vous avez créée apparait dans le tableau sous la rubrique *Liste des Individus concernés*.
9. Lisez les instructions décrites dans *Actions à mener*.
10. Déroulez ces instructions pour corriger l’anomalie.
11. Affichez à nouveau la liste des Contrôles.
12. CONFIRMEZ que l’Individu a disparu de la liste.

## 011 - Détection des Individus de plus de 27 ans encore rattachés au foyer parental

1. Créez un Individu en utilisant le formulaire Nouvel Individu, en indiquant une date de naissance antérieure à 1996 (avant l’an 1996), et en rattachant l’Individu à un Foyer existant.
2. Allez sur le menu d’accueil, et cliquez sur le bouton `Contrôles` du menu CiviParoisse.
3. Cliquez sur la case *Individus Majeur chez leurs Parents*.
4. CONFIRMEZ que du texte s’affiche (avec des rubriques d’explications : Contextes, Risques, etc...).
5. CONFIRMEZ que la fiche que vous avez créée apparait dans le tableau sous la rubrique *Liste des Individus concernés*.
6. Lisez les instructions décrites dans *Actions à mener*.
7. Déroulez ces instructions pour corriger l’anomalie.
8. Affichez à nouveau la liste des Contrôles.
9. CONFIRMEZ que l’Individu a disparu de la liste.

## 012 - Détection des Foyers ayant un statut Membre

1. Ouvrez une fiche Foyer.
2. Rajouter une Adhésion à la paroisse (Electeur, Ami de, …).
3. Allez sur le menu d’accueil, et cliquez sur le bouton `Contrôles` du menu CiviParoisse.
4. Cliquez sur la case *Foyers ayant le statut Adhésion*.
5. CONFIRMEZ que du texte s’affiche (avec des rubriques d’explications : Contextes, Risques, etc...).
6. CONFIRMEZ que la fiche que vous avez créée apparait dans le tableau sous la rubrique Nom du Foyer.
7. Lisez les instructions décrites dans *Actions à mener*.
8. Déroulez ces instructions pour corriger l’anomalie.
9. Affichez à nouveau la liste des Contrôles.
10. CONFIRMEZ que le Foyer a disparu de la liste.

## 013 - Détection des Foyers n’ayant pas de relation Chef de famille

1. Ouvrez une fiche Foyer.
2. Faites une copie écran des Relations existantes.
3. Supprimez toutes les Relations *Chef de famille*, et uniquement ces relations.
4. Allez sur le menu d’accueil, et cliquez sur le bouton `Contrôles` du menu CiviParoisse..
5. Cliquez sur la case *Foyers n’ayant pas de relations Chef de famille*.
6. CONFIRMEZ que du texte s’affiche (avec des rubriques d’explications : Contextes, Risques, etc...).
7. CONFIRMEZ que la fiche que vous avez créée apparait dans le tableau sous la rubrique Nom du Foyer.
8. Lisez les instructions décrites dans *Actions à mener*.
9. Déroulez ces instructions pour corriger l’anomalie.
10. Affichez à nouveau la liste des Contrôles.
11. CONFIRMEZ que le Foyer a disparu de la liste.

## 014 - Détection des Foyers n’ayant pas de relation Membre du Foyer

1. Ouvrez une fiche Foyer.
2. Faites une copie écran des Relations existantes.
3. Supprimez toutes les Relations *Membre du Foyer*, et uniquement ces relations.
4. Allez sur le menu d’accueil, et cliquez sur le bouton `Contrôles` du menu CiviParoisse.
5. Cliquez sur la case *Foyers n’ayant pas de relations Membre du Foyer*.
6. CONFIRMEZ que du texte s’affiche (avec des rubriques d’explications : Contextes, Risques, etc...).
7. CONFIRMEZ que la fiche que vous avez créée apparait dans le tableau sous la rubrique Nom du Foyer.
8. Lisez les instructions décrites dans *Actions à mener*.
9. Déroulez ces instructions pour corriger l’anomalie.
10. Affichez à nouveau la liste des Contrôles.
11. CONFIRMEZ que le Foyer a disparu de la liste.

## 015 - Détection des Foyers n’ayant pas de Mode de distribution du journal

1. Ouvrez une fiche Foyer.
2. Supprimez le Mode de distribution du Journal.
3. Allez sur le menu d’accueil, et cliquez sur le bouton `Contrôles` du menu CiviParoisse.
4. Cliquez sur la case *Foyers n’ayant pas de Mode de distribution du journal*.
5. CONFIRMEZ que du texte s’affiche (avec des rubriques d’explications : Contextes, Risques, etc...).
6. CONFIRMEZ que la fiche que vous avez créée apparait dans le tableau sous la rubrique Nom du Foyer.
7. Lisez les instructions décrites dans *Actions à mener*.
8. Déroulez ces instructions pour corriger l’anomalie.
9. Affichez à nouveau la liste des Contrôles.
10. CONFIRMEZ que le Foyer a disparu de la liste.

## 016 - Détection des Organisations ayant un Statut Membre

1. Ouvrez une fiche Organisation (au besoin en créer une dans le formulaire de création).
2. Rajoutez une Adhésion à la paroisse (Electeur, Ami de, …).
3. Allez sur le menu d’accueil, et cliquez sur le bouton `Contrôles` du menu CiviParoisse.
4. Cliquez sur la case *Organisations ayant le statut Membre*.
5. CONFIRMEZ que du texte s’affiche (avec des rubriques d’explications : Contextes, Risques, etc...).
6. CONFIRMEZ que la fiche que vous avez créée apparait dans le tableau sous la rubrique Nom de l’Organisation.
7. Lisez les instructions décrites dans *Actions à mener*.
8. Déroulez ces instructions pour corriger l’anomalie.
9. Affichez à nouveau la liste des Contrôles.
10. CONFIRMEZ que l’Organisation a disparu de la liste.

## 017 - Détection des e-mails en erreur

> 🚧 Test en cours d'écriture

## 018 - Détection des Individus sans Date de naissance

1. Choisissez une fiche Individu.
2. Supprimez la date de naissance si elle est déjà présente.
3. Allez sur le menu d’accueil, et cliquez sur le bouton `Contrôles` du menu CiviParoisse.
4. Cliquez sur le lien accessible en haut de la page, pour aller vers la page Améliorations.
5. Cliquez sur la case *Individus sans Date de Naissance*.
6. CONFIRMEZ que du texte s’affiche (avec des rubriques d’explications : Contextes, Risques, etc...).
7. CONFIRMEZ que la fiche que vous avez modifiée apparait dans le tableau sous la rubrique *Liste des Individus concernés*.
8. Lisez les instructions décrites dans *Actions à mener*.
9. Déroulez ces instructions pour corriger l’anomalie.
10. Affichez à nouveau la liste des Contrôles.
11. CONFIRMEZ que l’Individu a disparu de la liste.

## 019 - Détection des Foyers sans adresse

1. Ouvrez une fiche Foyer.
2. Supprimez l’adresse, y compris la ville, le code postal, le département et le pays.
3. Allez sur le menu d’accueil, et cliquez sur le bouton `Contrôles` du menu CiviParoisse.
4. Cliquez sur le lien accessible en haut de la page, pour aller vers la page Améliorations.
5. Cliquez sur la case *Foyers n’ayant pas d’adresse*.
6. CONFIRMEZ que du texte s’affiche (avec des rubriques d’explications : Contextes, Risques, etc...).
7. CONFIRMEZ que la fiche que vous avez créée apparait dans le tableau sous la rubrique Nom du Foyer.
8. Lisez les instructions décrites dans *Actions à mener*.
9. Déroulez ces instructions pour corriger l’anomalie.
10. Affichez à nouveau la liste des Contrôles.
11. CONFIRMEZ que le Foyer a disparu de la liste.

## 020 - Détection des Foyers ayant participé à un Evénement

1. Ouvrez une fiche Foyer.
2. Inscrivez le Foyer à un événement (si besoin créer un événement auparavant).
3. Allez sur le menu d’accueil, et cliquez sur le bouton `Contrôles` du menu CiviParoisse.
4. Cliquez sur le lien accessible en haut de la page, pour aller vers la page Améliorations.
5. Cliquez sur la case *Foyers ayant participés à un Evénement*.
6. CONFIRMEZ que du texte s’affiche (avec des rubriques d’explications : Contextes, Risques, etc...).
7. CONFIRMEZ que la fiche que vous avez créée apparait dans le tableau sous la rubrique Nom du Foyer.
8. Lisez les instructions décrites dans *Actions à mener*.
9. Déroulez ces instructions pour corriger l’anomalie.
10. Affichez à nouveau la liste des Contrôles.
11. CONFIRMEZ que le Foyer a disparu de la liste.

## 021 - Détection des foyers avec distribution inconnue

1. Ouvrez une fiche Foyer.
2. Modifiez le mode de distribution à *Inconnu*.
3. Allez sur le menu d’accueil, et cliquez sur le bouton `Contrôles` du menu CiviParoisse.
4. Cliquez sur le lien accessible en haut de la page, pour aller vers la page Améliorations.
5. Cliquez sur la case *Foyers avec Distribution Inconnu*.
6. CONFIRMEZ que du texte s’affiche (avec des rubriques d’explications : Contextes, Risques, etc...).
7. CONFIRMEZ que la fiche que vous avez créée apparait dans le tableau sous la rubrique Nom du Foyer.
8. Lisez les instructions décrites dans *Actions à mener*.
9. Déroulez ces instructions pour corriger l’anomalie.
10. Affichez à nouveau la liste des Améliorations.
11. CONFIRMEZ que le Foyer a disparu de la liste.

## 022 - Détection des Organisations sans adresse

1. Créez une fiche Organisation en passant par le menu Contacts / Nouvelle organisation.
2. Ne remplissez aucun élément d’adresse pour cette nouvelle fiche.
3. Retournez sur la page d’accueil.
4. Cliquez sur le lien `Contrôles` dans le menu CiviParoisse.
5. Allez sur la page des Améliorations en cliquant sur le lien dans le paragraphe « Comment utiliser cette page ? ».
6. Dans les Améliorations sur les fiches Organisation, ouvrez la case *Organisations n’ayant pas d’adresse*.
7. CONFIRMEZ que l’Organisation nouvellement créée est présente dans la liste.
8. Lisez les instructions décrites dans *Actions à mener*.
9. Déroulez ces instructions pour améliorer la fiche.
10. Affichez à nouveau la liste des Contrôles.
11. CONFIRMEZ que l’Organisation a disparu de la liste.

## 023 - Détection des Organisations n’ayant pas de relation

1. Créez une fiche Organisation en passant par le menu Contacts / Nouvelle organisation.
2. Ne remplissez aucun élément de relations pour cette nouvelle fiche.
3. Retournez sur la page d’accueil.
4. Cliquez sur le lien `Contrôles` dans le menu CiviParoisse.
5. Aller sur la page des Améliorations en cliquant sur le lien dans le paragraphe « Comment utiliser cette page ? ».
6. Dans les Améliorations sur les fiches Organisation, ouvrez la case *Organisations n’ayant pas de relations*.
7. CONFIRMEZ que l’Organisation nouvellement créée est présente dans la liste.
8. Lisez les instructions décrites dans *Actions à mener*.
9. Déroulez ces instructions pour améliorer la fiche.
10. Affichez à nouveau la liste des Contrôles.
11. CONFIRMEZ que l’Organisation a disparu de la liste.

## 024 - Détection des Organisations ayant participé à un Evénement

1. Créez une fiche Organisation en passant par le menu Nouvelle Entreprise ou Organisation sur la page d'accueil.
2. Une fois la fiche créée, la réouvrir.
3. Cliquez sur le bouton `Actions` en haut de la fiche.
4. Choisissez `Inscrire à un événement`.
5. Remplissez la fenêtre qui s’ouvre en choisissant un événement.
6. Enregistrez l’inscription.
7. Retournez sur la page d’accueil.
8. Cliquez sur le lien `Contrôles` dans le menu CiviParoisse.
9. Allez sur la page des Améliorations en cliquant sur le lien dans le paragraphe « Comment utiliser cette page ? ».
10. Dans les Améliorations sur les fiches Organisation, ouvrez la case *Organisations ayant participées à un Evénement*.
11. CONFIRMEZ que l’Organisation nouvellement créée est présente dans la liste.
12. Lissez les instructions décrites dans *Actions à mener*.
13. Déroulez ces instructions pour améliorer la fiche.
14. Affichez à nouveau la liste des Contrôles.
15. CONFIRMEZ que l’Organisation a disparu de la liste.

## 025 - Détection des Individus sans Courriel

> 🚧 Test en cours d'écriture
