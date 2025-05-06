local ESX = exports.es_extended:getSharedObject()
local webhookUrl = "https://discord.com/api/webhooks/1369019065397416116/tY36A2Wlbtx2Mi_WVPMIf3GwV_ihs4Iy10s91h_ygzzfHtt6cehTUTpDxwEXP34cuheb" -- ⚠️ remplace par ton webhook réel

local function SendToDiscord(title, description, color)
    local timestamp = os.date("!%d/%m/%Y à %H:%M:%S", os.time() + 2 * 3600) -- UTC+2 (France été)
    PerformHttpRequest(webhookUrl, function() end, "POST", json.encode({
        embeds = {{
            title = title,
            description = description .. "\n📅 **" .. timestamp .. "**",
            color = color or 16753920
        }}
    }), {["Content-Type"] = "application/json"})
end

local function GetPlayerFullIdentifiers(playerId)
    local steamId, discordId = "N/A", "N/A"
    for _, id in pairs(GetPlayerIdentifiers(playerId)) do
        if id:match("steam:") then
            steamId = id
        elseif id:match("discord:") then
            discordId = id
        end
    end
    return steamId, discordId
end

local allowedGroups = { admin = true, superadmin = true }

RegisterServerEvent('giveVehicleKeyToAdmin', function(plate, model)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    local group = xPlayer.getGroup()
    local playerName = GetPlayerName(source)
    local nameRP = xPlayer.getName()
    local steamId, discordId = GetPlayerFullIdentifiers(source)

    if allowedGroups[group] then
        xPlayer.addInventoryItem('carkeys', 1, {
            plate = plate,
            model = model,
            description = 'Plaque: ' .. plate .. ' | Modèle: ' .. model
        })

        SendToDiscord("🔑 Clé donnée (admin)", string.format(
            "**Joueur :** %s\n**Nom RP :** %s\n**Groupe :** %s\n**Steam ID :** `%s`\n**Discord ID :** `%s`\n\n**Plaque :** `%s`\n**Modèle :** `%s`",
            playerName, nameRP, group, steamId, discordId, plate, model
        ), 31456) -- Bleu 🔵
    else
        SendToDiscord("🚨 Tentative non autorisée", string.format(
            "**%s** (`%s`) a tenté de récupérer une clé sans permission.", playerName, xPlayer.identifier
        ), 16711680) -- Rouge 🔴
        DropPlayer(source, "Tentative non autorisée.")
    end
end)

RegisterServerEvent('admin:deleteVehicleLog', function(plate, model)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    local group = xPlayer.getGroup()
    local playerName = GetPlayerName(source)
    local nameRP = xPlayer.getName()
    local steamId, discordId = GetPlayerFullIdentifiers(source)

    if allowedGroups[group] then
        SendToDiscord("🗑️ Véhicule supprimé (admin)", string.format(
            "**Joueur :** %s\n**Nom RP :** %s\n**Groupe :** %s\n**Steam ID :** `%s`\n**Discord ID :** `%s`\n\n**Plaque :** `%s`\n**Modèle :** `%s`",
            playerName, nameRP, group, steamId, discordId, plate, model
        ), 15158332) -- Orange 🔶
    else
        SendToDiscord("🚨 Tentative non autorisée", string.format(
            "**%s** (`%s`) a tenté de supprimer un véhicule sans permission.", playerName, xPlayer.identifier
        ), 16711680) -- Rouge 🔴
        DropPlayer(source, "Tentative non autorisée.")
    end
end)

RegisterServerEvent("admin:logFixCleanVehicle", function(plate, model, vehicleCoords)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    local group = xPlayer.getGroup()
    local playerName = GetPlayerName(source)
    local nameRP = xPlayer.getName()
    local steamId, discordId = GetPlayerFullIdentifiers(source)

    if allowedGroups[group] then
        SendToDiscord("🔧 Véhicule réparé/nettoyé (admin)", string.format(
            "**Joueur :** %s\n**Nom RP :** %s\n**Groupe :** %s\n**Steam ID :** `%s`\n**Discord ID :** `%s`\n\n**Plaque :** `%s`\n**Modèle :** `%s`\n**Position véhicule :** `(%.2f, %.2f, %.2f)`",
            playerName, nameRP, group, steamId, discordId, plate, model, vehicleCoords.x, vehicleCoords.y, vehicleCoords.z
        ), 3066993) -- Vert ✅
    else
        SendToDiscord("🚨 Tentative non autorisée", string.format(
            "**%s** (`%s`) a tenté de réparer/nettoyer un véhicule sans permission.", playerName, xPlayer.identifier
        ), 16711680) -- Rouge 🔴
        DropPlayer(source, "Tentative non autorisée.")
    end
end)

RegisterServerEvent("admin:logRefuelVehicle", function(plate, model)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    local group = xPlayer.getGroup()
    local playerName = GetPlayerName(source)
    local nameRP = xPlayer.getName()
    local steamId, discordId = GetPlayerFullIdentifiers(source)

    if allowedGroups[group] then
        SendToDiscord("⛽ Véhicule ravitaillé (admin)", string.format(
            "**Joueur :** %s\n**Nom RP :** %s\n**Groupe :** %s\n**Steam ID :** `%s`\n**Discord ID :** `%s`\n\n**Plaque :** `%s`\n**Modèle :** `%s`",
            playerName, nameRP, group, steamId, discordId, plate, model
        ), 8311585) -- Vert clair 🍀
    else
        SendToDiscord("🚨 Tentative non autorisée", string.format(
            "**%s** (`%s`) a tenté de ravitailler un véhicule sans permission.", playerName, xPlayer.identifier
        ), 16711680) -- Rouge 🔴
        DropPlayer(source, "Tentative non autorisée.")
    end
end)

ESX.RegisterServerCallback('getPlayerGroup', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    cb(xPlayer and xPlayer.getGroup() or nil)
end)




