--[[
| This file was obtained through the combined efforts
| of Madbluntz & Plymouth Antiquarian Society.
|
| Credits: lifestorm, Gregory Wayne Rossel JR.,
| 	Maloy, DrPepper10 @ RIP, Atle!
|
| Visit for more: https://plymouth.thetwilightzone.ru/
--]]

ITEM.name = "Sledge Hammer"
ITEM.description = "Heavy and powerful. Careful not to hit anyone with this."
ITEM.model = "models/weapons/tfa_nmrih/w_me_sledge.mdl"
ITEM.class = "tfa_nmrih_sledge"
ITEM.isMelee = true
ITEM.weaponCategory = "melee"
ITEM.balanceCat = "heavy"
ITEM.width = 1
ITEM.height = 4
ITEM.iconCam = {
  pos = Vector(-509.64, -427.61, 310.24),
  ang = Angle(24.76, 400, 0),
  fov = 0.77
}
ITEM.maxDurability = 50
ITEM.isTool = true

local color_green = Color(100, 255, 100)
local color_red = Color(200, 25, 25)

if (CLIENT) then
		function ITEM:PaintOver(item, w, h)
		if (item:GetData("equip")) then
			surface.SetDrawColor(110, 255, 110, 100)
			surface.DrawRect(w - 14, h - 20, 8, 8)
		end			
		local maxDurability = item:GetMaxDurability()
		local durability = item:GetDurability()
		local width = w - 8
		local cellWidth = math.Round(width / maxDurability)
		local color = ix.util.ColorLerp(1 - durability / maxDurability, color_green, color_red)
		surface.SetDrawColor(color)
		
		for i = 0, durability - 1 do
			surface.DrawRect(5 + i * cellWidth, h - 8, cellWidth - 1, 4)
		end
	end
end

ITEM.functions.SetMaxDurability = {
	name = "Set max durability",
	icon = "icon16/wrench.png",
	OnClick = function(itemTable)
		local client = itemTable.player
		Derma_StringRequest("Set durability", "Enter max durability value", itemTable:GetMaxDurability(), function(text)
			local amount = tonumber(text)

			if (amount and amount > 0) then
				netstream.Start("ixSetToolMaxDurability", itemTable:GetID(), math.floor(amount))
			else
				client:Notify("Geçersiz sayı")
			end
		end)
	end,
	OnRun = function(itemTable)
		return false
	end,
	OnCanRun = function(itemTable)
		if (IsValid(itemTable.entity)) then
			return false
		end

		if (!CAMI.PlayerHasAccess(itemTable.player, "Helix - Basic Admin Commands")) then
			return false
		end

		return true
	end
}

ITEM.functions.SetDurability = {
	name = "Set durability",
	icon = "icon16/wrench.png",
	OnClick = function(itemTable)
		local client = itemTable.player
		Derma_StringRequest("Set durability", "Enter durability value for this tool here", itemTable:GetDurability(), function(text)
			local amount = tonumber(text)

			if (amount and amount > 0 and amount <= itemTable:GetMaxDurability()) then
				netstream.Start("ixSetToolDurability", itemTable:GetID(), math.floor(amount))
			else
				client:Notify("Geçersiz sayı")
			end
		end)
	end,
	OnRun = function(itemTable)
		return false
	end,
	OnCanRun = function(itemTable)
		if (IsValid(itemTable.entity)) then
			return false
		end

		if (!CAMI.PlayerHasAccess(itemTable.player, "Helix - Basic Admin Commands")) then
			return false
		end

		return true
	end
}

function ITEM:GetDescription()
  local maxDurability = self:GetMaxDurability()
  local durability = self:GetDurability()
  return self.description .. "\n\nDayanıklılık: " .. durability .. "/" .. maxDurability
end

function ITEM:OnInstanced(index, x, y, item)
  self:SetData("durability", self:GetMaxDurability())
end

function ITEM:DamageDurability(amount)
  self:SetData("durability", math.max(0, self:GetDurability() - 1))

  if (self:GetDurability() == 0) then
    self:OnBreak()
  end
end

function ITEM:GetBreakSound()
  return "weapons/crowbar/crowbar_impact"..math.random(1, 2)..".wav"
end

function ITEM:OnBreak()
  local breakSound = self:GetBreakSound()

  if (IsValid(self.player)) then
    self.player:EmitSound(breakSound, 65)
  elseif (IsValid(self.entity)) then
    self.entity:EmitSound(breakSound, 65)
  end

  self:Remove()
end

function ITEM:GetDurability()
  return self:GetData("durability", self:GetMaxDurability())
end

function ITEM:GetMaxDurability()
  return self:GetData("maxDurability", self.maxDurability)
end
