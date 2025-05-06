# ?? XEM - Admin Vehicle Tools

Ce script permet aux administrateurs de g�rer rapidement les v�hicules en jeu via le syst�me `ox_target`, avec journalisation compl�te via webhook Discord.

## ?? Fonctionnalit�s

- ?? R�cup�ration de cl� de v�hicule
- ??? Suppression instantan�e de v�hicule avec confirmation
- ?? R�paration et nettoyage du v�hicule (avec log complet)
- ? Remplissage du r�servoir (compatible `ox_fuel`)
- ??? V�rification des permissions (`admin`, `superadmin`)
- ?? Logs d�taill�s envoy�s sur Discord :
  - Steam ID, Discord ID, Nom RP
  - Plaque, mod�le, position, date/heure

## ? D�pendances

- [`ox_target`](https://overextended.github.io/docs/ox_target)
- [`ox_lib`](https://overextended.github.io/docs/ox_lib)
- [`es_extended`](https://github.com/esx-framework/es_extended)
- [`ox_inventory`](https://overextended.github.io/docs/ox_inventory) (optionnel pour les cl�s)

## ?? Installation

1. D�poser le dossier `xem_admin_vehicle` dans votre dossier `resources/`.
2. Ajouter dans `server.cfg` :