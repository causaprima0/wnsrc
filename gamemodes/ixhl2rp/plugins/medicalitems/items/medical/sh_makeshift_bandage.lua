--[[
| This file was obtained through the combined efforts
| of Madbluntz & Plymouth Antiquarian Society.
|
| Credits: lifestorm, Gregory Wayne Rossel JR.,
| 	Maloy, DrPepper10 @ RIP, Atle!
|
| Visit for more: https://plymouth.thetwilightzone.ru/
--]]


ITEM.name = "Własnoręczny bandaż"
ITEM.model = Model("models/stuff/bandages_dirty.mdl")
ITEM.description = "Własnoręcznie zrobiony bandaż, zatrzymuje krawienie ale nic poza tym..."
ITEM.category = "Medical"
ITEM.width = 1
ITEM.height = 1
ITEM.maxStackSize = 3
ITEM.healing = {
	bandage = 10
}
ITEM.useSound = "willardnetworks/inventory/inv_bandage.wav"
ITEM.holdData = {
    vectorOffset = {
        right = 1.5,
        up = 0,
        forward = 1
    },
    angleOffset = {
        right = 0,
        up = 90,
        forward = -90
    },
}