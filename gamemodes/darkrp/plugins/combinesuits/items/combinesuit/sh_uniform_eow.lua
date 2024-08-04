--[[
| This file was obtained through the combined efforts
| of Madbluntz & Plymouth Antiquarian Society.
|
| Credits: lifestorm, Gregory Wayne Rossel JR.,
| 	Maloy, DrPepper10 @ RIP, Atle!
|
| Visit for more: https://plymouth.thetwilightzone.ru/
--]]

ITEM.name = "OTA Elite Uniform"
ITEM.model = Model("models/wn7new/metropolice/cpuniform.mdl")
ITEM.description = "Combine issued OTA Elite uniform."
ITEM.category = "Combine"
ITEM.replacement = "models/wn/ota_elite.mdl"
ITEM.iconCam = {
    pos = Vector(-1.96, 13.01, 199.57),
    ang = Angle(84.7, 279.39, 0),
    fov = 4.8
}
ITEM.isOTA = true
ITEM.maxArmor = 150
ITEM.channels = {"ota-tac", "tac-3", "tac-4", "tac-5", "cmb", "cca", "mcp"}

ITEM.replaceOnDeath = "broken_otauniform"