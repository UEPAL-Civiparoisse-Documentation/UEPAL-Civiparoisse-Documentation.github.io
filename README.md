# Dépôt de documentation de Civiparoisse

Ce dépôt a pour but de réunir la documentation de Civiparoisse, sous forme de fichiers Markdown qui sont processés ensuite pour générer un site web statique via mkdocs.

Le site est prévu pour utiliser le thème [material](https://squidfunk.github.io/mkdocs-material/) car ce thème propose des fonctionnalités intéressantes, comme notamment l'intégration du moteur LUNR pour les rechercehs dans les documents et un mode sombre. De plus, il propose directement une [image Docker](https://github.com/squidfunk/mkdocs-material.git) prête à être compilée (ou à l'emploi, en fonction des architectures matérielles de chacun), ce qui simplifie nettement la mise en oeuvre du thème et de mkdocs.

La prise en main par des débutants est également simplifiée car les commandes courantes de travail ont été préparées dans un Makefile, ce qui les rend très facilement accessibles.

## Prérequis
* Linux : nécessaire pour disposer de la variable CURDIR dans le GNU Make
* GNU Make : pour avoir en particulier la variable CURDIR écrite au-dessus
* Git : récupération de dépôt à la volée
* Docker : construction d'une image selon le Dockerfile et l'environnement récupérés via Git.

## Options et cibles pour Make
Un certain nombre de cibles ont été prévues. Elles sont simplement à lancer en se plaçant dans le répertoire où on a récupéré le dépôt Git de la documentation et en lançant 
```make <nom de la cible>```

Make supporte des options, en particulier : 

* -n : dry-run : voir ce que Make fera pour atteindre une cible
* -C `<dirpath>`: permet de changer le répertoire

Contrairement à une utilisation "classique" de Make, l'ensemble des cibles prévues sont des cibles factices (PHONY), ce qui fait qu'on se retrouve plutôt face à un appel rapide de commandes plutôt qu'à un processus de compilation optimisé.

Les cibles sont :

* all : crée l'image Docker et génère le site
* image: génération de l'image Docker
* build : génération du site statique (dans le répertoire site)
* serve: génération du site statique et présentation du site sur [http://127.0.0.1:8080](http://127.0.0.1:8080)
* clean: suppression du répertoire de build de l'image et des fichiers générés dans site

***Attention : il faut penser à préparer l'image (cible image ou all) avant de lancer la cible build ou serve.***