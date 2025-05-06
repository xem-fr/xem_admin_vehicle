# 🚓 XEM - Admin Vehicle Tools

**Outils administrateur pour la gestion des véhicules dans FiveM (ESX + ox_target + ox_lib)**

## ✨ Fonctionnalités

- 🔑 Donner une clé de véhicule instantanément
- 🗑️ Supprimer un véhicule avec confirmation
- 🔧 Réparer & nettoyer un véhicule
- ⛽ Faire le plein du véhicule (ox_fuel compatible)
- 🛡️ Accès réservé aux groupes `admin` & `superadmin`
- 🧾 Logs complets vers Discord (nom RP, SteamID, DiscordID, position, plaque, modèle...)

## ⚙️ Dépendances

- [ox_lib](https://github.com/overextended/ox_lib)
- [ox_target](https://github.com/overextended/ox_target)
- [es_extended](https://github.com/esx-framework/es_extended)
- [ox_inventory](https://github.com/overextended/ox_inventory) (si tu utilises les clés)

## 📦 Installation

1. Dépose le dossier `xem_admin_vehicle` dans `resources/`
2. Ajoute dans ton `server.cfg` :

```cfg
ensure ox_lib
ensure ox_target
ensure xem_admin_vehicle
