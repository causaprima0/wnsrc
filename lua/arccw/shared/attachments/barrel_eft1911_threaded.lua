--[[
| This file was obtained through the combined efforts
| of Madbluntz & Plymouth Antiquarian Society.
|
| Credits: lifestorm, Gregory Wayne Rossel JR.,
| 	Maloy, DrPepper10 @ RIP, Atle!
|
| Visit for more: https://plymouth.thetwilightzone.ru/
--]]

att.PrintName = "Threaded barrel"
att.Icon = Material("vgui/entities/eft_attachments/1911_barrelthreaded_icon.png", "mips smooth")
att.Description = "Threaded barrel for M1911A1 .45 ACP, product by Colt."

att.SortOrder = 1

att.Desc_Pros = {
 "Allows for Muzzle Devices."
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = "eft_barrel_1911"

att.SortOrder = 15

att.Model = "models/weapons/arc_eft_1911/eft_1911_barrel_threaded/models/eft_1911_barrelthreaded.mdl"

att.GivesFlags = {"barrelthread"}

att.ModelScale = Vector(1, 1, 1)

att.Mult_SightTime = 1.04

att.Mult_Recoil = 0.97

att.Add_BarrelLength = 1