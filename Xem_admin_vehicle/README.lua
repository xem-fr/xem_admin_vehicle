# ?? XEM - Admin Vehicle Tools

Ce script permet aux administrateurs de gérer rapidement les véhicules en jeu via le système `ox_target`, avec journalisation complète via webhook Discord.

## ?? Fonctionnalités

- ?? Récupération de clé de véhicule
- ??? Suppression instantanée de véhicule avec confirmation
- ?? Réparation et nettoyage du véhicule (avec log complet)
- ? Remplissage du réservoir (compatible `ox_fuel`)
- ??? Vérification des permissions (`admin`, `superadmin`)
- ?? Logs détaillés envoyés sur Discord :
  - Steam ID, Discord ID, Nom RP
  - Plaque, modèle, position, date/heure

## ? Dépendances

- [`ox_target`](https://overextended.github.io/docs/ox_target)
- [`ox_lib`](https://overextended.github.io/docs/ox_lib)
- [`es_extended`](https://github.com/esx-framework/es_extended)
- [`ox_inventory`](https://overextended.github.io/docs/ox_inventory) (optionnel pour les clés)

## ?? Installation

1. Déposer le dossier `xem_admin_vehicle` dans votre dossier `resources/`.
2. Ajouter dans `server.cfg` :