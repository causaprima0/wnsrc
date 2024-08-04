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

PLUGIN.name = "Medical"
PLUGIN.author = "Gr4Ss"
PLUGIN.description = "Implements a heal-over-time medical system as well as bleedout before death."

-- Round healing to 5 digits
-- This should give at least 3 significant digits for passive health regen
PLUGIN.HEALING_PRECISION = 5

-- How often the medical system should update
-- Existing timers won't update until a charswap when lua refreshing this value
PLUGIN.TIMER_DELAY = PLUGIN.TIMER_DELAY or 5

ix.util.Include("cl_hooks.lua")
ix.util.Include("sv_hooks.lua")
ix.util.Include("sv_plugin.lua")

ix.lang.AddTable("english", {
	applyTip = "Zastosuj przedmiot na sobie",
	giveTip = "Zastosuj przedmiot na osobie, na którą patrzysz",

	allBandaged = "Wszystkie rany są zabandażowane",
	allBandagedDis = "Wszystkie rany są oczyszczone i zabandażowane",
	someBandaged = "Niektóre rany są zabandażowane",
	someBandagedDis = "Niektóre rany są oczyszczone i zabandażowane",

	bleedingOut = "Wykrwawia się na śmierć",
	unconscious = "Na nic nie reaguje",

	injDead = "Wygląda na to, że nie żyje",
	injWonder = "Jakimś cudem żyje",
	injNearDeath = "Jest w stanie bliskim śmierci",
	injCrit = "Jest w stanie krytycznym",
	injMaj = "Ma kilka poważnych ran",
	medicalRequiredLevel = "Aby to zrobić, potrzeba co najmniej %d poziom Medycyny!",

	cmdCharGetHealing = "Drukuje bieżące dane lecznicze dla postaci.",
	healingListEmpty = "%s nie ma żadnego aktywnego leczenia.",
	healingList = "Dane lecznicze %s: %d hp | %.2fHP bandaż | %is środek dezynfekujący | %.2fHP środek przeciwbólowy | %is czas działania środku przeciwbólowego | %.2fHP fałszywego zdrowia | %.3f ułamkowego HP",

	cmdCharStopBleedout = "Zatrzymuje krwawienie u danej postaci. Nie daje żadnego zdrowia.",
	bleedoutStopped = "Zatrzymałeś krwawienie u %s.",
	bleedoutStoppedTarget = "%s zatrzymał Twoje krwawienie.",
	bleedoutNotActive = "%s obecnie nie krwawi.",

	areBleeding = "WYKRWAWIASZ SIĘ",
	currentHP = "Obecne HP: %d",
	requiredHealth = "Potrzebujesz %dHP, aby się podnieść.",
	cannotChangeCharBleedout = "Nie możesz zmienić postaci podczas wykrwawiania się!"
})

ix.lang.AddTable("spanish", {
	giveTip = "Aplica el objeto a la persona que estás mirando",
	allBandagedDis = "Todas las heridas son limpiadas y vendadas",
	injWonder = "¿¡Todavía está vivo!? ¿Cómo?",
	bleedingOut = "Desangrándose hasta la muerte",
	injNearDeath = "Está al borde de la muerte",
	unconscious = "No responde a nada",
	allBandaged = "Todas las heridas están vendadas",
	applyTip = "Aplicarte el objeto a ti mismo",
	injDead = "Parece estar muerto",
	someBandaged = "Algunas heridas están vendadas",
	bleedoutStoppedTarget = "%s ha detenido tu hemorragia.",
	medicalRequiredLevel = "¡Necesitas al menos nivel %d de medicina para hacer esto!",
	healingListEmpty = "%s no tiene ninguna curación activa.",
	areBleeding = "TE ESTÁS DESANGRANDO",
	cmdCharStopBleedout = "Detiene la hemorragia del personaje. No añade salud.",
	injCrit = "En condición crítica",
	bleedoutNotActive = "%s no está sangrando actualmente.",
	bleedoutStopped = "Has detenido la hemorragia de %s.",
	cannotChangeCharBleedout = "¡No puedes cambiar de personaje mientras te desangras!",
	injMaj = "Tiene algunas heridas graves",
	requiredHealth = "Necesitas %d Puntos de Vida para levantarte.",
	currentHP = "Puntos de Vida actuales: %d",
	cmdCharGetHealing = "Imprime los datos de curación actuales de un personaje.",
	someBandagedDis = "Algunas heridas están limpias y vendadas",
	healingList = "Datos de curación de %s: %d hp | %.2fHP de vendaje | %is desinfectando | %.2fHP analgésico | %is duración del analgésico | %.2fHP falso | %3.f HP fraccional"
})

ix.lang.AddTable("polish", {
	applyTip = "Zastosuj przedmiot na sobie",
	giveTip = "Zastosuj przedmiot na osobie, na którą patrzysz",

	allBandaged = "Wszystkie rany są zabandażowane",
	allBandagedDis = "Wszystkie rany są oczyszczone i zabandażowane",
	someBandaged = "Niektóre rany są zabandażowane",
	someBandagedDis = "Niektóre rany są oczyszczone i zabandażowane",

	bleedingOut = "Wykrwawia się na śmierć",
	unconscious = "Na nic nie reaguje",

	injDead = "Wygląda na to, że nie żyje",
	injWonder = "Jakimś cudem żyje",
	injNearDeath = "Jest w stanie bliskim śmierci",
	injCrit = "Jest w stanie krytycznym",
	injMaj = "Ma kilka poważnych ran",
	medicalRequiredLevel = "Aby to zrobić, potrzeba co najmniej %d poziom Medycyny!",

	cmdCharGetHealing = "Drukuje bieżące dane lecznicze dla postaci.",
	healingListEmpty = "%s nie ma żadnego aktywnego leczenia.",
	healingList = "Dane lecznicze %s: %d hp | %.2fHP bandaż | %is środek dezynfekujący | %.2fHP środek przeciwbólowy | %is czas działania środku przeciwbólowego | %.2fHP fałszywego zdrowia | %.3f ułamkowego HP",

	cmdCharStopBleedout = "Zatrzymuje krwawienie u danej postaci. Nie daje żadnego zdrowia.",
	bleedoutStopped = "Zatrzymałeś krwawienie u %s.",
	bleedoutStoppedTarget = "%s zatrzymał Twoje krwawienie.",
	bleedoutNotActive = "%s obecnie nie krwawi.",

	areBleeding = "WYKRWAWIASZ SIĘ",
	currentHP = "Obecne HP: %d",
	requiredHealth = "Potrzebujesz %dHP, aby się podnieść.",
	cannotChangeCharBleedout = "Nie możesz zmienić postaci podczas wykrwawiania się!"
})


ix.config.Add("HealthRegenTime", 6, "How many hours it takes for someone to passively regain full health.", nil, {
	data = {min = 0, max = 24},
	category = "Medical"
})

ix.config.Add("HealingRegenRate", 5, "How much health healing items will restore per minute.", nil, {
	data = {min = 1, max = 100},
	category = "Medical"
})

ix.config.Add("HealingRegenBoostFactor", 2,
	"How much faster someone heals when using healing boosters (e.g. disinfectant).", nil, {
	data = {min = 0, max = 100, decimals = 1},
	category = "Medical"
})

ix.config.Add("HealingPainkillerRate", 30, "How much health per minute painkillers temporarily restore.", nil, {
	data = {min = 1, max = 100},
	category = "Medical"
})

ix.config.Add("HealingPainkillerDuration", 15, "How long painkillers will last in minutes.", nil, {
	data = {min = 1, max = 100},
	category = "Medical"
})

ix.config.Add("HealingPainkillerDecayRate", 10,
	"How fast painkillers decay after their duration ran out in HP per minute.", nil, {
	data = {min = 1, max = 100},
	category = "Medical"
})

ix.config.Add("BleedoutTime", 10, "How many minutes it takes for someone to bleedout and die.", nil, {
	data = {min = 1, max = 100},
	category = "Medical"
})

ix.config.Add("WakeupTreshold", 33,
	"How much health someone needs to wake up after being knocked unconscious into bleedout.", nil, {
	data = {min = 1, max = 100},
	category = "Medical"
})

ix.config.Add("ExperienceBandageScale", 1,
	"Scale how much experience is gained from bandaging a wound. 1 means 1 exp per HP healed, 2 is 2 exp per HP healed, etc.", nil, {
	data = {min = 0, max = 10, decimals = 1},
	category = "Medical"
})

ix.config.Add("ExperienceDisinfectantScale", 1,
	"Scale how much experience is gained from speeding up bandage health-regen with disinfectant. 1 means 1 exp per HP sped up, 2 is 2 exp per HP sped up, etc.", nil, {
	data = {min = 0, max = 10, decimals = 1},
	category = "Medical"
})

ix.config.Add("ExperiencePainkillerScale", 1,
	"Scale how much experience is gained from giving painkillers to temporarily replenish health. 1 means 1 exp per HP replenished, 2 is 2 exp per HP replenished, etc.", nil, {
	data = {min = 0, max = 10, decimals = 1},
	category = "Medical"
})

ix.config.Add("bleedoutGodmode", false,
	"Determines if all damage is blocked against players who are ragdolled due to bleedout. This protection stops once the player is no longer ragdolled, or the player's bleedout is stopped (even if they are still ragdolled).", nil, {
	category = "Medical"
})

ix.config.Add("AdditionalBleedoutGrace", 30,
	"How long the additional bleedout grace timer lasts.", nil, {
	data = {min = 0, max = 600},
	category = "Medical"
})

ix.command.Add("CharGetHealing", {
	description = "@cmdCharGetHealing",
	adminOnly = true,
	arguments = {
	  ix.type.character
	},
	OnRun = function(self, client, target)
		local healingData = target:GetHealing()
		if (!healingData) then
			client:ChatNotifyLocalized("healingListEmpty", target:GetPlayer():Name())
			return
		end

		client:ChatNotifyLocalized(
			"healingList",
			target:GetPlayer():Name(),
			target:GetPlayer():Health(),
			healingData.bandage,
			healingData.disinfectant,
			healingData.painkillers,
			healingData.painkillersDuration,
			healingData.fakeHealth,
			healingData.healingAmount
		)
	end
})

ix.command.Add("CharStopBleedout", {
	description = "@cmdCharStopBleedout",
	adminOnly = true,
	arguments = {
	  ix.type.character
	},
	OnRun = function(self, client, target)
		if (target:GetBleedout() > 0) then
			target:SetBleedout(-1)

			netstream.Start("BleedoutScreen", false)
			client:NotifyLocalized("bleedoutStopped", target:GetPlayer():Name())
			if (target:GetPlayer() != client) then
				target:GetPlayer():NotifyLocalized("bleedoutStoppedTarget", client:Name())
			end
		else
			client:NotifyLocalized("bleedoutNotActive", target:GetPlayer():Name())
		end
	end
})

ix.char.RegisterVar("bleedout", {
	bNoDisplay = true,
	default = -1
})

ix.char.RegisterVar("healing", {
	default = {},
	field = "healing",
	fieldType = ix.type.text,
	OnSet = PLUGIN.OnSetHealing,
	OnGet = function(character, healType)
		local healing = character.vars.healing

		if (healType) then
			return (healing and healing[healType] != nil and healing[healType]) or 0
		else
			return healing
		end
	end
})
