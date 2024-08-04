--[[
| This file was obtained through the combined efforts
| of Madbluntz & Plymouth Antiquarian Society.
|
| Credits: lifestorm, Gregory Wayne Rossel JR.,
| 	Maloy, DrPepper10 @ RIP, Atle!
|
| Visit for more: https://plymouth.thetwilightzone.ru/
--]]


ITEM.uniqueID = "languagebox_bulgarian"
ITEM.name = "Bulgarski Audiobook Box"
ITEM.description = "Pudełko zawierające pełny zestaw audiobooków. Co za wygoda."
ITEM.category = "Boxes"
ITEM.model = "models/items/item_item_crate.mdl"
ITEM.width = 2
ITEM.height = 2

ITEM.functions.Convert = {
	name = "Konwertuj",
	icon = "icon16/wrench.png",
	OnRun = function(item)
		local client = item.player
		local inventory = client:GetCharacter():GetInventory()

		inventory:Add("audiobook_1bul", 1)
		inventory:Add("audiobook_2bul", 1)
		inventory:Add("audiobook_3bul", 1)
		inventory:Add("audiobook_4bul", 1)
		inventory:Add("audiobook_5bul", 1)		

		client:Notify("Przekonwertowałeś " .. item.name .. " w odpowiadający zestaw Audiobooków.")
	end
}
