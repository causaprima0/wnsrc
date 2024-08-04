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

ITEM.name = "Çıra Kutusu"
ITEM.uniqueID = "tinderbox"
ITEM.model = "models/willardnetworks/props/tinderbox.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
  pos = Vector(509.64, 427.61, 310.24),
  ang = Angle(24.83, 219.94, 0),
  fov = 0.75
}
ITEM.description = "Bir kamp ateşini yakmak için bir Çıra Kutusu."
ITEM.category = "Tools"

ITEM.functions.Light = {
	sound = "ambient/fire/mtov_flame2.wav",
	OnRun = function(itemTable)
		local client = itemTable.player
		if client.CantPlace then
			client:NotifyLocalized("Bunu yakmadan önce beklemeniz gerekiyor!")
			return false
		end

		client.CantPlace = true

		timer.Simple(3, function()
			if client then
				client.CantPlace = false
			end
		end)

		local entity = ents.Create("ix_campfire")
		local trace = client:GetEyeTraceNoCursor()

		if (trace.HitPos:Distance( client:GetShootPos() ) <= 192) then
			entity:SetPos(trace.HitPos)
			entity:Spawn()

			if (IsValid(entity)) then
				entity:SetAngles(Angle(0, client:EyeAngles().yaw + 270, 0))

				client:NotifyLocalized("Bir kamp ateşi yaktınız...")
			end

			ix.saveEnts:SaveEntity(entity)
			PLUGIN:SaveCampfires()
		else
			client:NotifyLocalized("O kadar uzak bir kamp ateşini yakamazsınız!")
			return false
		end
	end
}