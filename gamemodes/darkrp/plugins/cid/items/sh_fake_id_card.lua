--[[
| This file was obtained through the combined efforts
| of Madbluntz & Plymouth Antiquarian Society.
|
| Credits: lifestorm, Gregory Wayne Rossel JR.,
| 	Maloy, DrPepper10 @ RIP, Atle!
|
| Visit for more: https://plymouth.thetwilightzone.ru/
--]]


ITEM.name = "Fausse Carte CID de #00000"
ITEM.model = Model("models/n7/props/n7_cid_card.mdl")
ITEM.description = "Une carte CID de citoyen, attribuée à %s | CID n°%s\n\nCID : %s\nDescription génétique :\n%s.\n\nCette carte est la propriété de l'UTC. La possession illégale et l'usurpation d'identité sont punies, et entraîneront des sanctions par la Protection Civile. Si trouvée, merci de remettre immédiatement cette carte à l'équipe de la Protection Civile la plus proche."ITEM.category = "Combine"
ITEM.category = "Combine"
ITEM.iconCam = {
	pos = Vector(0, 0, 10),
	ang = Angle(90, 90, 0),
	fov = 45,
}

if (CLIENT) then
	function ITEM:PaintOver(item, w, h)
		surface.SetDrawColor(110, 255, 110, 100)
		surface.DrawRect(w - 14, h - 14, 8, 8)
	end
end

function ITEM:GetName()
	return "# Carte CID n° : " .. self:GetData("cid", "00000") .. ""
end

function ITEM:GetDescription()
	return string.format(self.description,
		self:GetData("name", "personne"),
		self:GetData("cid", "00000"),
		self:GetData("cardNumber", "00-0000-0000-00"),
		self:GetData("geneticDesc", "N/A | N/A | YEUX N/A | CHEVEUX N/A"))
end

local prime = 9999999787 -- prime % 4 = 3! DO NOT CHANGE EVER
local offset = 100000 -- slightly larger than sqrt(prime) is ok. DO NOT CHANGE EVER
local block = 100000000
local function generateCardNumber(id)
	id = (id + offset) % prime

	local cardNum = 0

	for _ = 1, math.floor(id/block) do
		cardNum = (cardNum + (id * block) % prime) % prime
	end

	cardNum = (cardNum + (id * (id % block) % prime)) % prime

	if (2 * id < prime) then
		return cardNum
	else
		return prime - cardNum
	end
end

function ITEM:OnInstanced()
	local cardNum = Schema:ZeroNumber(generateCardNumber(self:GetID()), 10)

	self:SetData("cardNumber", string.utf8sub(cardNum, 1, 2) .. "-" .. string.utf8sub(cardNum, 3, 6) .. "-" .. string.utf8sub(cardNum, 7, 10) .. "-" .. Schema:ZeroNumber(cardNum % 97, 2))
end
