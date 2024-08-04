--[[
| This file was obtained through the combined efforts
| of Madbluntz & Plymouth Antiquarian Society.
|
| Credits: lifestorm, Gregory Wayne Rossel JR.,
| 	Maloy, DrPepper10 @ RIP, Atle!
|
| Visit for more: https://plymouth.thetwilightzone.ru/
--]]

ITEM.name = "Zestaw do rozstawiania wieżyczek"
ITEM.description = "Zestaw służący do rozstawiania wieżyczek kombinatu."
ITEM.model = Model("models/combine_turrets/floor_turret.mdl")
ITEM.noBusiness = true
ITEM.width = 2
ITEM.height = 3

ITEM.functions.place = {
    name = "Rozstaw",
	tip = "Rozstaw wieżyczkę",
	icon = "icon16/brick_add.png",
	OnRun = function(item)
        local client = item.player

        if (!client:Alive()) then return false end
        client:EmitSound("physics/cardboard/cardboard_box_break3.wav")

        client.previousWep = client:GetActiveWeapon():GetClass()
        client:Give("weapon_turret_placer")
       	client:SelectWeapon("weapon_turret_placer")

        return true
    end,
    OnCanRun = function(item)
		return (!IsValid(item.entity))
	end
}