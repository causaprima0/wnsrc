--[[
| This file was obtained through the combined efforts
| of Madbluntz & Plymouth Antiquarian Society.
|
| Credits: lifestorm, Gregory Wayne Rossel JR.,
| 	Maloy, DrPepper10 @ RIP, Atle!
|
| Visit for more: https://plymouth.thetwilightzone.ru/
--]]

ITEM.name = "Jabłuszko"
ITEM.description = "Wygląda jak każde inne jabłko, choć z nieco zabawnym posmakiem..."
ITEM.category = "Drugs"
ITEM.model = "models/willardnetworks/food/apple.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
  pos = Vector(169.82, 142.5, 102.64),
  ang = Angle(24.79, 220.01, 0),
  fov = 1.76
}
ITEM.boosts = {
  strength = -2,
  perception = 3,
  agility = 2
}
ITEM.energyShift = -0.01 -- fatigue_system
ITEM.hunger = 12
ITEM.spoil = true
ITEM.useSound = "npc/barnacle/barnacle_crunch3.wav"
ITEM.outlineColor = Color(128, 200, 97, 255)
ITEM.colorAppendix = {["green"] = "[Narkotyk]: Nakłada efekty wizualne na ekran. Inni gracze mogą zauważyć, że jesteś naćpany.", ["blue"] = "[RP]: Możesz ignorować FearRP jeżeli jesteś naćpany."}
ITEM.drug = {
  ["green"] = 15, ["bloom"] = 15
}