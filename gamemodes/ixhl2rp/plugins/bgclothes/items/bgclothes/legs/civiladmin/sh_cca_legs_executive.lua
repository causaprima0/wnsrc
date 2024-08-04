--[[
| This file was obtained through the combined efforts
| of Madbluntz & Plymouth Antiquarian Society.
|
| Credits: lifestorm, Gregory Wayne Rossel JR.,
| 	Maloy, DrPepper10 @ RIP, Atle!
|
| Visit for more: https://plymouth.thetwilightzone.ru/
--]]

ITEM.name = "Spodnie Executive'a"
ITEM.description = "Para garniturowych spodni o wysokiej jakości, noszone przez członków CAB."
ITEM.category = "Clothing - CCA"
ITEM.model = "models/willardnetworks/clothingitems/legs_ca_suit_pants.mdl"
ITEM.outfitCategory = "Legs"
ITEM.width = 1
ITEM.height = 1

ITEM.adminCreation = true
ITEM.iconCam	=	{
		ang	=	Angle(90.5,1.25,0),
		pos	=	Vector(0,0,200),
		fov	=	5.75,
}
ITEM.proxy = {
	PantsColor = Vector(39 / 255, 39 / 255, 39 / 255)
}
ITEM.colorAppendix	=	{
		blue	=	"Posiadanie tego ubioru bez zgody CAB jest nielegalne.",
}
ITEM.bodyGroups	=	{
	legs	=	7
}