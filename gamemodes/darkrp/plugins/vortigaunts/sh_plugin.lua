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
local ix = ix
local CAMI = CAMI

PLUGIN.name = "Vortigaunt Features"
PLUGIN.description = "Adds certain features to vortigaunt."
PLUGIN.author = "Fruity, Adolphus"

PLUGIN.BATCH = 50

PLUGIN.vortalEnergyPerAntlion = 5
PLUGIN.vortalEnergyPerPlayer = 15
PLUGIN.passiveVortalEnergyIncome = 0.1
PLUGIN.passiveVortalEnergyTime = 8

PLUGIN.vortalEnergyPerAntlion = 5
PLUGIN.vortalEnergyPerPlayer = 15
PLUGIN.passiveVortalEnergyIncome = 0.1
PLUGIN.passiveVortalEnergyTime = 8

PLUGIN.vortnotes = {}

PLUGIN.voidChar = 13827
PLUGIN.voidKey = 34217

game.AddParticles( "particles/wn_vortigaunt_fx_blue.pcf" )
game.AddParticles( "particles/wn7_vort_shield.pcf" )
PrecacheParticleSystem( "vort_shield_parent" )
PrecacheParticleSystem("vort_meditation")

CAMI.RegisterPrivilege({
	Name = "Helix - Manage Vortessence Menu",
	MinAccess = "admin"
})

CAMI.RegisterPrivilege({
	Name = "Helix - Set Vortigaunt Allow Reset Collar",
	MinAccess = "admin"
})

CAMI.RegisterPrivilege({
	Name = "Helix - Shackles Self Release",
	MinAccess = "superadmin"
})

ix.flag.Add("N", "Vortigaunt nulled", function(client, isGiven)
	client:SetNetVar("ixVortNulled", isGiven)
end)

ix.flag.Add("q", "Bouclier Vortigaunt", function(client, isGiven) return end)

ix.flag.Add("f", "Can unlock shackles.", function(client, isGiven)
	client:SetNetVar("ixVortUnlock", isGiven and isGiven or nil)
end)


ix.lang.AddTable("english", {
	optVortSensingDisable = "Désactiver la détection Vort",
	optdVortSensingDisable = "Si la detection vort doit être désactivé.",
})

ix.lang.AddTable("french", {
	optVortSensingDisable = "Désactiver la détection Vort",
	optdVortSensingDisable = "Si la detection vort doit être désactivé.",
})

ix.option.Add("vortSensingDisable", ix.type.bool, true, {
    category = "other",
    hidden = function()
		return !LocalPlayer():IsVortigaunt()
    end,
    bNetworked = true
})

ix.config.Add("maxVortalEnergy", 100, "Maximum vortal energy amount available for vortigaunts.", nil, {
	data = {min = 1, max = 500},
	category = "Vortigaunts"
})

ix.config.Add("maxVortEnergyPerMinuteOfDefaultMeditation", 10, "Default VE income per every minute of meditation in percents.", nil, {
	data = {min = 1, max = 100},
	category = "Vortigaunts"
})

ix.config.Add("maxVortEnergyPerMinuteOfAdvancedMeditation", 30, "Default VE income per every minute of meditation in percents for 50lvl vortessence vorts.", nil, {
	data = {min = 1, max = 100},
	category = "Vortigaunts"
})

ix.config.Add("additionalVortalEnergyDrainPerPointOfArmor", 1, "Additional VE drain per point of armor.", nil, {
	data = {min = 1, max = 100},
	category = "Vortigaunts"
})

ix.config.Add("vortalEnergyTickTime", 8, "How many seconds it takes to update vortal energy data for vorts.", nil, {
	data = {min = 1, max = 8},
	category = "Vortigaunts"
})

ix.config.Add("vortBeamAdditionalDamage", 1, "Vort beam damage.", function(oldValue, newValue)
		for _, v in ipairs(ents.FindByClass("ix_vortbeam"))	do
			v.Primary.Damage = newValue
		end
	end, {
	data = {min = 1, max = 250},
	category = "Vortigaunt Beam SWEP"
})

ix.config.Add("advancedBeamDamage", 1, "Advanced beam damage.", function(oldValue, newValue)
	for _, v in ipairs(ents.FindByClass("ix_vortbeam"))	do
		v.Primary.Damage = newValue
	end
end, {
data = {min = 1, max = 500},
category = "Advanced Vortigaunt Beam SWEP"
})

ix.config.Add("vortSlamBaseDamage", 40, "Vort slam damage.", function(oldValue, newValue)
		for _, v in ipairs(ents.FindByClass("ix_vortslam"))	do
			v.Primary.Damage = newValue
		end
	end, {
	data = {min = 40, max = 250},
	category = "Vortigaunt Slam SWEP"
})

ix.char.RegisterVar("collarID", {
	field = "collarID",
	fieldType = ix.type.string,
	default = nil,
	bNoDisplay = true,
	OnSet = function(self, value)
		local client = self:GetPlayer()

		if (IsValid(client)) then
			local character = client:GetCharacter()
			local genericdata = character:GetGenericdata()

			self.vars.collarID = value

			if (genericdata) then
				genericdata.collarID = value
				character:SetGenericdata(genericdata)
				character:Save()
			end
		end
	end,
	OnGet = function(self, default)
		local collarID = self.vars.collarID

		return collarID
	end
})

ix.char.RegisterVar("collarItemID", {
	field = "collarItemID",
	fieldType = ix.type.number,
	default = nil,
	bNoDisplay = true
})

ix.char.RegisterVar("vortalEnergy", {
	field = "vortalEnergy",
	fieldType = ix.type.number,
	default = ix.config.Get("maxVortalEnergy", 100),
	isLocal = true,
	bNoDisplay = true,
	OnSet = function(self, value)
		local client = self:GetPlayer()

		if !client:IsVortigaunt() then
			return "No."
		end

		if (IsValid(client)) then
			self.vars.vortalEnergy = value

			net.Start("ixCharacterVarChanged")
				net.WriteUInt(self:GetID(), 32)
				net.WriteString("vortalEnergy")
				net.WriteType(self.vars.vortalEnergy)
			net.Send(client)
		end
	end,
	OnAdjust = function(self, client, data, value, newData)
		if !client:IsVortigaunt() then return "No." end
		newData.vortalEnergy = value
	end
})

ix.char.RegisterVar("BioticPDA", {
	field = "BioticPDA",
	fieldType = ix.type.string,
	default = "N/A",
	bNoDisplay = true,
	OnSet = function(self, value)
		local client = self:GetPlayer()

		if (!client:IsVortigaunt()) then
			return
		end

		if (IsValid(client)) then
			self.vars.BioticPDA = value

			net.Start("ixCharacterVarChanged")
				net.WriteUInt(self:GetID(), 32)
				net.WriteString("BioticPDA")
				net.WriteType(self.vars.BioticPDA)
			net.Send(client)
		end
	end
})

ix.command.Add("ToggleVortalSensing", {
	description = "Toggle vortal sensing.",
	OnRun = function(self, client, arguments)
		local bDisabled = ix.option.Get(client, "vortSensingDisable", true)

		ix.option.Set(client, "vortSensingDisable", !bDisabled)

		client:Notify("Vous avez " .. (bDisabled and "activé" or "désactivé") .. " vortal-sensil.")
	end,
	OnCheckAccess = function(self, client)
		return client:IsVortigaunt()
	end
})

ix.command.Add("ToggleVortalVision", {
	description = "Toggle vortal vision.",
	OnRun = function(self, client, arguments)
		if !client:GetLocalVar("vortalVision") then
			client:SetLocalVar("vortalVision", true)
			client:Notify("You have enabled vortal vision.")

			netstream.Start(client, "ToggleVortalVision", true)
		else
			client:SetLocalVar("vortalVision", false)
			client:Notify("You have disabled vortal vision.")

			netstream.Start(client, "ToggleVortalVision", false)
		end
	end,
	OnCheckAccess = function(self, client)
		return client:IsVortigaunt()
	end
})

ix.command.Add("VortStun", {
	description = "Stun someone in front of you.",
	OnRun = function(self, client)
		local percentage = 10 / 100
		if !client:HasVortalEnergy(10 + (percentage * client:Armor())) then
			return client:NotifyLocalized("You don't have enough vortal energy.")
		end
		local forward = client:EyeAngles():Forward()
		local tr = util.QuickTrace(client:EyePos(), forward * 128, client)
		if !IsValid(tr.Entity) or !tr.Entity:IsPlayer() or tr.Entity.ixRagdoll or !tr.Entity:Alive() then
			return client:NotifyLocalized("Invalid target!")
		end
		if tr.Entity:IsVortigaunt() and tr.Entity:GetNetVar("ixVortMeditation") then
			return client:NotifyLocalized("Can't stun meditating vort!")
		end
		if client:GetNetVar("ixVortMeditation") then
			return client:NotifyLocalized("Can't stun while meditating!")
		end
		ParticleEffectAttach("vortigaunt_charge_token", PATTACH_POINT_FOLLOW, client, client:LookupAttachment("rightclaw"))
		client:PlayGestureAnimation(client:LookupSequence("gest_heal"))
		timer.Simple(2.25, function()
			if (!IsValid(client) or !IsValid(tr.Entity) or tr.Entity.ixRagdoll) or !tr.Entity:Alive() then
				if IsValid(client) then
					client:StopParticles()
				end
				return
			end
			if tr.Entity:IsVortigaunt() and tr.Entity:GetNetVar("ixVortMeditation") then
				client:StopParticles()
				return client:NotifyLocalized("Can't stun meditating vort!")
			end
			if client:GetNetVar("ixVortMeditation") then
				client:StopParticles()
				return client:NotifyLocalized("Can't stun while meditating!")
			end
			client:TakeVortalEnergy(10 + (percentage * client:Armor()))
			tr.Entity:SetRagdolled(true, 30)
			client:GetCharacter():DoAction("vort_beam_practice")
			client:EmitSound( "npc/vort/health_charge.wav", 100, 150, 1, CHAN_AUTO )
			client:StopParticles()
		end)
	end,
	OnCheckAccess = function(self, client)
		if client:IsVortigaunt() and !client:GetNetVar("ixVortNulled") then return true end
	end
})

ix.command.Add("VortUnlock", {
	description = "Unlock someone's shackles.",
	OnRun = function(self, client)
		local forward = client:EyeAngles():Forward()
		local tr = util.QuickTrace(client:EyePos(), forward * 128, client)
		if !IsValid(tr.Entity) or !tr.Entity:IsPlayer() or !tr.Entity:IsVortigaunt() or !tr.Entity:Alive() then
			return client:NotifyLocalized("Invalid target!")
		end
		ParticleEffectAttach("vortigaunt_charge_token", PATTACH_POINT_FOLLOW, client, client:LookupAttachment("rightclaw"))
		client:PlayGestureAnimation(client:LookupSequence("gest_heal"))
		timer.Simple(2.25, function()
			if (!IsValid(client) or !IsValid(tr.Entity) or !tr.Entity:IsVortigaunt()) or !tr.Entity:Alive() then
				if IsValid(client) then
					client:StopParticles()
				end
				return
			end
			client:EmitSound( "npc/vort/health_charge.wav", 100, 150, 1, CHAN_AUTO )
			client:StopParticles()
			local character = tr.Entity:GetCharacter()
			local usedOnItems = {"Vortigaunt Collar", "Vortigaunt Shackles", "Vortigaunt Hooks"}
			local foundSomething = false
			local collarID = false
			for _, v in pairs(character:GetInventory():GetItems()) do
				if table.HasValue( usedOnItems, v.name ) and v:GetData("equip") == true and v:GetData("Locked") then
					if v:GetData("collarID") then
						collarID = v:GetData("collarID")
					end
					v:SetData("Locked", false)
					foundSomething = true
				end
			end

			if foundSomething then
				ix.combineNotify:AddImportantNotification(collarID and "WRN:// Vortigaunt shackles have received critical damage. Collar ID: #" .. collarID or "WRN:// Vortigaunt shackles have received critical damage. Collar ID: UNKNOWN.", Color(255, 81, 0), tr.Entity, tr.Entity:GetPos())
				tr.Entity:NotifyLocalized("Your shackles are no longer locked and can be taken off..")
			else
				tr.Entity:NotifyLocalized("You are not wearing any locked shackles..")
				return
			end
			client:GetCharacter():DoAction("vort_beam_practice")
		end)
	end,
	OnCheckAccess = function(self, client)
		if client:IsVortigaunt() and client:GetNetVar("ixVortUnlock") then return true end
	end
})

ix.command.Add("EnterMeditation", {
	description = "Toggle vortal meditation and restore your vortal energy.",
	OnRun = function(self, client)
		if client:GetNetVar("ixVortMeditation") then
			PLUGIN:ExitVortalMeditation(client)
		else
			PLUGIN:EnterVortalMeditation(client)
		end
	end,
	OnCheckAccess = function(self, client)
		if client:IsVortigaunt() and !client:GetNetVar("ixVortNulled") then return true end
	end
})

ix.command.Add("SetBioticPDA", {
    description = "Set access to either CWU or CMU datapad.",
    arguments = {
		ix.type.character,
		ix.type.string
    },
	adminOnly = true,
	OnRun = function(self, client, character, data)
		if character:IsVortigaunt() then
			if (data and data == "CWU" or data and data == "CMU") then
				character:SetBioticPDA(data)
				character:SetData("BioticPDA", data)

				client:NotifyLocalized("Biotic PDA access set to " .. data)
			else
				client:NotifyLocalized("You must specify either 'CMU' or 'CWU'!")
				return false
			end
		else
			client:NotifyLocalized("The character provided is not a vortigaunt!")
			return false
		end
    end,
	OnCheckAccess = function(self, client)
		return CAMI.PlayerHasAccess(client, "Helix - Manage Vortessence Menu")
	end
})

ix.command.Add("SetVortAllowResetCollar", {
    description = "Allows a Vortigaunt to reset their datafile from previous data after equipping a fake collar.",
    arguments = {
		ix.type.character,
		ix.type.bool
    },
	adminOnly = true,
	OnRun = function(self, client, character, bool)
		if (character:GetFaction() == FACTION_VORT and character:GetBackground() != "Biotic" and character:GetBackground() != "Collaborator") then
			if (bool) then
				character:SetData("CanResetFakeCollarDatafile", true)
			else
				character:SetData("CanResetFakeCollarDatafile", false)
			end

			ix.log.AddRaw("[FAKE COLLAR] " .. client:Nick() .. " changed SetVortAllowResetCollar for " .. character:GetName() .. " to " .. tostring(bool))
		end
    end,
	OnCheckAccess = function(self, client)
		return CAMI.PlayerHasAccess(client, "Helix - Set Vortigaunt Allow Reset Collar")
	end
})

ix.anim.SetModelClass("models/willardnetworks/vortigaunt.mdl", "vortigaunt")
ix.util.Include("sh_hooks.lua")
ix.util.Include("cl_hooks.lua")
ix.util.Include("cl_plugin.lua")
ix.util.Include("sv_hooks.lua")
ix.util.Include("meta/sh_character.lua")
ix.util.Include("meta/sh_player.lua")

ix.config.Add("VortHealMin", 5, "Valeur minimale pour la santé qui peut être guérie par Vortessence" , nil, {
	data = {min = 1, max = 100},
	category = "Soins - Vortigaunt"
})

ix.config.Add("VortHealMax", 20, "Valeur sanitaire maximale qui peut être guérie par Vortessence" , nil, {
	data = {min = 1, max = 100},
	category = "Soins - Vortigaunt"
})

ix.config.Add("VortShieldRecharge", 20, "Combien de temps faut-il pour recharger le bouclier anti-vortex" , nil, {
	data = {min = 1, max = 200},
	category = "Bouclier - Vortigaunt"
})

ix.config.Add("VortShieldHealth", 500, "Quelle est la santé du vortex" , nil, {
	data = {min = 1, max = 1000},
	category = "Bouclier - Vortigaunt"
})

ix.config.Add("extractEffectDuration", 1800, "How many seconds stays extract effect." , nil, {
	data = {min = 1, max = 3800},
	category = "Vortigaunts"
})

ix.config.Add("blacklistSCAmount", 50, "If vort collar have a negative SC point and its below this value - vort collar being blacklisted." , nil, {
	data = {min = 1, max = 999},
	category = "Vortigaunts"
})

ix.command.Add("vortessence", {
	description = "Ouvrir le menu vortessence comme Vortessence.",
	OnCheckAccess = function(self, client)
		local faction = client:GetCharacter():GetFaction()
		if (faction == FACTION_VORT and !client:GetNetVar("ixVortNulled")) or CAMI.PlayerHasAccess(client, "Helix - Manage Vortessence Menu") then
			return true
		end

		return false
	end,
	OnRun = function(self, client)
		PLUGIN:RefreshVortessence(client)
	end
})

ix.command.Add("UnlockShackles", {
    description = "Silently unlock shackles of a certain vort.",
    arguments = {
		ix.type.character,
    },
	adminOnly = true,
	OnRun = function(self, client, character)
        local foundSomething = false
		local usedOnItems = {"Vortigaunt Collar", "Vortigaunt Shackles", "Vortigaunt Hooks"}
		if character:IsVortigaunt() then
			for _, v in pairs(character:GetInventory():GetItems()) do
				if table.HasValue( usedOnItems, v.name ) and v:GetData("equip") == true and v:GetData("Locked") then
					v:SetData("Locked", false)
					foundSomething = true
				end
			end

			if foundSomething then
				character:GetPlayer():NotifyLocalized("Your shackles are no longer locked and can be taken off..")
				return false
			else
				character:GetPlayer():NotifyLocalized("You are not wearing any locked shackles..")
				return false
			end
		else
			character:GetPlayer():NotifyLocalized("You are not a vortigaunt!")
			return false
		end
    end
})

ix.command.Add("SetVortalEnergy", {
    description = "Sets vortal energy to certain vortigaunt.",
    arguments = {
		ix.type.character,
		ix.type.number,
    },
	adminOnly = true,
	OnRun = function(self, client, character, value)
       if character:IsVortigaunt() then
			client:NotifyLocalized("You just setted " .. value .. " of vortal energy to " .. character:GetName())
			character:SetVortalEnergy(math.Clamp(value, 0, 100))
	   else
		client:NotifyLocalized("Your target is not a vortigaunt!")
	   end
    end
})

ix.command.Add("AddVortalEnergy", {
    description = "Adds vortal energy to certain vortigaunt.",
    arguments = {
		ix.type.character,
		ix.type.number,
    },
	adminOnly = true,
	OnRun = function(self, client, character, value)
       if character:IsVortigaunt() then
			client:NotifyLocalized("You just added " .. value .. " of vortal energy to " .. character:GetName())
			character:AddVortalEnergy(math.Clamp(value, 0, 100))
		else
			client:NotifyLocalized("Your target is not a vortigaunt!")
	   end
    end
})

ix.command.Add("TakeVortalEnergy", {
    description = "Takes vortal energy from certain vortigaunt.",
    arguments = {
		ix.type.character,
		ix.type.number,
    },
	adminOnly = true,
	OnRun = function(self, client, character, value)
       if character:IsVortigaunt() then
			client:NotifyLocalized("You just took " .. value .. " of vortal energy from " .. character:GetName())
			character:TakeVortalEnergy(math.Clamp(value, 0, 100))
	   else
			client:NotifyLocalized("Your target is not a vortigaunt!")
	   end
    end
})

function PLUGIN:CharacterLoaded(character)
	if (SERVER) then
		character:SetBioticPDA(character:GetData("BioticPDA", "N/A"))
	end
end
