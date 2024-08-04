--[[
| This file was obtained through the combined efforts
| of Madbluntz & Plymouth Antiquarian Society.
|
| Credits: lifestorm, Gregory Wayne Rossel JR.,
| 	Maloy, DrPepper10 @ RIP, Atle!
|
| Visit for more: https://plymouth.thetwilightzone.ru/
--]]


ITEM.name = "Lastik Kelepçe"
ITEM.description = "İnsanları kısıtlamak için kullanılan turuncu bir lastik kelepçe."
ITEM.price = 80
ITEM.model = "models/items/crossbowrounds.mdl"
ITEM.category = "Combine"
ITEM.maxStackSize = 10
ITEM.factions = {FACTION_CP, FACTION_OTA, FACTION_RESISTANCE}
ITEM.functions.Use = {
	OnRun = function(itemTable)
		local client = itemTable.player
		local data = {}
			data.start = client:GetShootPos()
			data.endpos = data.start + client:GetAimVector() * 96
			data.filter = client
		local target = util.TraceLine(data).Entity
		local ragdoll = nil

		if (target:IsRagdoll() and target.ixPlayer) then
			ragdoll = target
			target = target.ixPlayer
		end

		if (IsValid(target) and target:IsPlayer() and target:GetCharacter() and !target:GetNetVar("tying") and !target:IsRestricted()) then
			itemTable.bBeingUsed = true

			client:SetAction("@tying", 5)

			client:DoStaredAction(ragdoll or target, function()
				itemTable.bBeingUsed = false

				if (!(ix.fights and target:GetFight())) then
					target:SetRestricted(true)
					target:SetNetVar("tying")
					target:NotifyLocalized("fTiedUp")
					client:NotifyLocalized("Hedefe başarıyla bağlandı.")
					target:SetWalkSpeed(target:GetWalkSpeed()/3)
					itemTable:Remove()
				else
					target:SetAction()
					target:SetNetVar("tying")
				end
			end, 5, function()
				client:SetAction()

				target:SetAction()
				target:SetNetVar("tying")

				itemTable.bBeingUsed = false
			end)

			target:SetNetVar("tying", true)
			target:SetAction("@fBeingTied", 5)
		else
			itemTable.player:NotifyLocalized("plyNotValid")
		end

		return false
	end,
	OnCanRun = function(itemTable)
		return !IsValid(itemTable.entity) or itemTable.bBeingUsed
	end
}

function ITEM:CanTransfer(inventory, newInventory)
	return !self.bBeingUsed
end
