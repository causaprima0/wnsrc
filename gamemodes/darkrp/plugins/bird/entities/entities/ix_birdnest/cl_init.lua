--[[
| This file was obtained through the combined efforts
| of Madbluntz & Plymouth Antiquarian Society.
|
| Credits: lifestorm, Gregory Wayne Rossel JR.,
| 	Maloy, DrPepper10 @ RIP, Atle!
|
| Visit for more: https://plymouth.thetwilightzone.ru/
--]]


include("shared.lua")

ENT.PopulateEntityInfo = true

function ENT:OnPopulateEntityInfo(container)
	local name = container:AddRow("name")
	name:SetImportant()
	name:SetText("Nid d'oiseau")
	name:SizeToContents()

	local description = container:AddRow("description")
	description:SetText("Un petit nid d'oiseau, composé de batons et de feuilles...")
	description:SizeToContents()

	local progress = container:AddRow("progress")
	progress:SetText("Batons : " .. self:GetNetVar("progress", 0) .. "/30")
	progress:SetBackgroundColor(derma.GetColor("Info", container))
	progress:SizeToContents()
end

