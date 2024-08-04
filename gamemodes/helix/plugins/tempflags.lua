--[[
| This file was obtained through the combined efforts
| of Madbluntz & Plymouth Antiquarian Society.
|
| Credits: lifestorm, Gregory Wayne Rossel JR.,
| 	Maloy, DrPepper10 @ RIP, Atle!
|
| Visit for more: https://plymouth.thetwilightzone.ru/
--]]


local PLUGIN = PLUGIN

PLUGIN.name = "Temporary Flags"
PLUGIN.author = "Gr4Ss"
PLUGIN.description = "Allows temporary flags to be given to characters or players. Based on SleepyMode's Player Flags plugin."

CAMI.RegisterPrivilege({
	Name = "Helix - Manage Temp Flags",
	MinAccess = "admin"
})

ix.lang.AddTable("english", {
    cmdCharGiveTempFlags = "Donnez des permissionstemporaires à un personnage. Temps spécifié en minutes.",
    cmdCharExtendTempFlags = "Étendre (ou réduire) les permissions temporaires actuels d'un personnage. Ils expireront après le temps imparti.",
    flagTempGiveTitle = "Donner des permissions temporaires",
    flagTempGive = "%s a donné %s permissions '%s' pendant %d minutes.",
    flagAlreadyGiven = "%s a déjà les permissions '%s', ou ces drapeaux n'existent pas.",
    cmdCharTakeTempFlags = "Prendre des permissions temporaires à un personnage.",
    flagAlreadyTaken = "%s n'a pas la permissions '%s'.",
    flagTempTake = "%s has taken the '%s' temporary flags from %s.",
    cmdCharClearTempFlag = "Prendre toutes les permissions temporaires d'un personnage.",
    flagNoClear = "%s n'a pas de permissions temporaires.",
    flagExpired = "Les permissions temporaires '%s' de %s ont expiré.",
    flagExpireWarn = "Vos permissions temporaires '%s' expireront dans 5 minutes."
})

ix.lang.AddTable("french", {
    cmdCharGiveTempFlags = "Donnez des permissionstemporaires à un personnage. Temps spécifié en minutes.",
    cmdCharExtendTempFlags = "Étendre (ou réduire) les permissions temporaires actuels d'un personnage. Ils expireront après le temps imparti.",
    flagTempGiveTitle = "Donner des permissions temporaires",
    flagTempGive = "%s a donné %s permissions '%s' pendant %d minutes.",
    flagAlreadyGiven = "%s a déjà les permissions '%s', ou ces drapeaux n'existent pas.",
    cmdCharTakeTempFlags = "Prendre des permissions temporaires à un personnage.",
    flagAlreadyTaken = "%s n'a pas la permissions '%s'.",
    flagTempTake = "%s has taken the '%s' temporary flags from %s.",
    cmdCharClearTempFlag = "Prendre toutes les permissions temporaires d'un personnage.",
    flagNoClear = "%s n'a pas de permissions temporaires.",
    flagExpired = "Les permissions temporaires '%s' de %s ont expiré.",
    flagExpireWarn = "Vos permissions temporaires '%s' expireront dans 5 minutes."
})

ix.lang.AddTable("spanish", {
	cmdCharGiveTempFlags = "Da permisos temporales a un personaje. Tiempo especificado en minutos.",
	flagTempGive = "%s ha dado &s '%s' permisos por %d minutos.",
	flagTempGiveTitle = "Dar Permisos Temporales",
	cmdCharExtendTempFlags = "Extiende (o reduce) los permisos temporales de un personaje. Se acabarán después de la cantidad de tiempo.",
	cmdCharTakeTempFlags = "Quita los permisos temporales de un personaje.",
	flagTempTake = "%s ha quitado los permisos temporales '%s' de %s.",
	flagAlreadyTaken = "%s no tiene los permisos '%s'.",
	flagNoClear = "%s no tiene ningún permiso temporal.",
	cmdCharClearTempFlag = "Quita todos los permisos temporales de un personaje.",
	flagExpireWarn = "Tus permisos temporales '%s' expirarán en 5 minutos.",
	flagAlreadyGiven = "%s ya tiene los permisos '%s', o estos permisos no existen.",
	flagExpired = "Los permisos de %s de tipo '%s' han expirado."
})

ix.config.Add("TempFlagsRemoveOnCharSwap", true, "Should all temporary flags be removed when a player changes character.", nil, {category = "Administration"})

function PLUGIN:CharacterHasFlags(character, flags)
    local client = character:GetPlayer()
    if (!IsValid(client)) then return end

    local tempFlags = client:GetLocalVar("tempFlags")
    if (!tempFlags) then return end

	for i = 1, #flags do
		if (tempFlags[flags[i]] and tempFlags[flags[i]] > os.time()) then
			return true
		end
	end
end

if (SERVER) then
    function PLUGIN:InitializedPlugins()
        timer.Create("ixTempFlags", 61, 0, function()
            local time = os.time()
            local players = player.GetAll()
            for _, client in ipairs(players) do
                local flags = client:GetLocalVar("tempFlags")
                if (!flags) then continue end

                local expired = ""
                local warn = ""
                for flag, expire in pairs(flags) do
                    if (expire < time) then
                        flags[flag] = nil
                        expired = expired..flag

                        local info = ix.flag.list[flag]
                        if (!info or !info.callback or client:GetCharacter():HasFlags(flag)) then continue end

                        info.callback(client, false)
                    elseif (expire - 300 >= time and expire - 361 < time) then
                        warn = warn..flag
                    end
                end

                if (warn != "") then
                    client:NotifyLocalized("flagExpireWarn", warn)
                end

                if (expired == "") then continue end

                for _, v in ipairs(players) do
                    if (CAMI.PlayerHasAccess(v, "Helix - Manage Temp Flags") or v == client) then
                        v:NotifyLocalized("flagExpired", client:SteamName(), expired)
                    end
                end

                if (table.IsEmpty(flags)) then
                    client:SetLocalVar("tempFlags", nil)
                else
                    client:SetLocalVar("tempFlags", flags)
                end
            end
        end)
    end
end

function PLUGIN:PostPlayerLoadout(client)
    if (ix.config.Get("TempFlagsRemoveOnCharSwap")) then
        client:SetLocalVar("tempFlags", nil)
        return
    end

    local tempFlags = client:GetLocalVar("tempFlags", {})

	for flag in pairs(tempFlags) do
		local info = ix.flag.list[flag]
		if (info and info.callback) then
			info.callback(client, true)
		end
	end
end

ix.command.Add("CharGiveTempFlags", {
	description = "@cmdCharGiveTempFlags",
	privilege = "Manage Temp Flags",
	arguments = {
		ix.type.player,
		ix.type.string,
        ix.type.number
	},
    argumentNames = {"target", "flags", "time (10 to 120)"},
	OnRun = function(self, client, target, toGive, time)
        local flags = target:GetLocalVar("tempFlags", {})
        local newTime = os.time() + math.Clamp(math.floor(time), 10, 120) * 60
        local character = target:GetCharacter()
        local given = ""
		for i = 1, #toGive do
            local flag = toGive[i]
            local info = ix.flag.list[flag]
            if (!info) then continue end
            if (!flags[flag] and character:HasFlags(flag)) then continue end

            flags[flag] = newTime
            given = given..flag

            if (info.callback) then
                info.callback(target, true)
            end
        end

        if (given == "") then
            client:NotifyLocalized("flagAlreadyGiven", target:SteamName(), toGive)
            return
        end

        target:SetLocalVar("tempFlags", flags)

		for _, v in ipairs(player.GetAll()) do
			if (self:OnCheckAccess(v) or v == target) then
				v:NotifyLocalized("flagTempGive", client:SteamName(), target:SteamName(), given, math.Clamp(math.floor(time), 10, 120))
			end
		end
	end
})

ix.command.Add("CharExtendTempFlags", {
	description = "@cmdCharExtendTempFlags",
	privilege = "Manage Temp Flags",
	arguments = {
		ix.type.player,
        ix.type.number
	},
    argumentNames = {"target", "time (10 to 120)"},
	OnRun = function(self, client, target, time)
        local flags = target:GetLocalVar("tempFlags", {})
        local newTime = os.time() + math.Clamp(math.floor(time), 10, 120) * 60
        local given = ""
		for flag in pairs(flags) do
            flags[flag] = newTime
            given = given..flag
        end

        if (given == "") then
            client:NotifyLocalized("flagNoClear", target:SteamName())
            return
        end

        target:SetLocalVar("tempFlags", flags)

		for _, v in ipairs(player.GetAll()) do
			if (self:OnCheckAccess(v) or v == target) then
				v:NotifyLocalized("flagTempGive", client:SteamName(), target:SteamName(), given, math.Clamp(math.floor(time), 10, 120))
			end
		end
	end
})

ix.command.Add("CharTakeTempFlag", {
	description = "@cmdCharTakeTempFlags",
	privilege = "Manage Temp Flags",
	arguments = {
		ix.type.player,
		ix.type.string
	},
	OnRun = function(self, client, target, toTake)
        local flags = target:GetLocalVar("tempFlags")
        if (!flags) then
            client:NotifyLocalized("flagNoClear", target:SteamName())
            return
        end

        local character = target:GetCharacter()
        local taken = ""
		for i = 1, #toTake do
            local flag = toTake[i]
            local info = ix.flag.list[flag]
            if (!info) then continue end
            if (!flags[flag]) then continue end

            flags[flag] = nil
            taken = taken..flag

            if (info.callback and !character:HasFlags(flag)) then
                info.callback(target, false)
            end
        end

        if (!table.IsEmpty(flags)) then
            target:SetLocalVar("tempFlags", flags)
        else
            target:SetLocalVar("tempFlags", nil)
        end

        if (taken == "") then
            client:NotifyLocalized("flagAlreadyTaken", target:SteamName(), toTake)
            return
        end

		for _, v in ipairs(player.GetAll()) do
			if (self:OnCheckAccess(v) or v == target) then
				v:NotifyLocalized("flagTempTake", client:SteamName(), taken, target:SteamName())
			end
		end
	end
})

ix.command.Add("CharClearTempFlag", {
	description = "@cmdCharClearTempFlag",
	privilege = "Manage Temp Flags",
	arguments = {
		ix.type.player,
	},
	OnRun = function(self, client, target)
        local flags = target:GetLocalVar("tempFlags")
        if (!flags) then
            client:NotifyLocalized("flagNoClear", target:SteamName())
            return
        end

        target:SetLocalVar("tempFlags", nil)

        local character = target:GetCharacter()
        local taken = ""
		for flag in pairs(flags) do
            taken = taken..flag

            local info = ix.flag.list[flag]
            if (info and info.callback and !character:HasFlags(flag)) then
                info.callback(target, false)
            end
        end

        if (taken == "") then
            client:NotifyLocalized("flagNoClear", target:SteamName())
            return
        end

		for _, v in ipairs(player.GetAll()) do
			if (self:OnCheckAccess(v) or v == target) then
				v:NotifyLocalized("flagTempTake", client:SteamName(), taken, target:SteamName())
			end
		end
	end
})
