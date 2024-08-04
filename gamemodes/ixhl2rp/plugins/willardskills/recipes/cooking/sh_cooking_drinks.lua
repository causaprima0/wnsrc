--[[
| This file was obtained through the combined efforts
| of Madbluntz & Plymouth Antiquarian Society.
|
| Credits: lifestorm, Gregory Wayne Rossel JR.,
| 	Maloy, DrPepper10 @ RIP, Atle!
|
| Visit for more: https://plymouth.thetwilightzone.ru/
--]]

local RECIPE = ix.recipe:New()
RECIPE.uniqueID = "cooking_tea"
RECIPE.name = "Kubek herbaty"
RECIPE.category = "Napoje"
RECIPE.description = "Zazwyczaj herbata ma gorzko-słodki smak, jak samo życie, ale ta napewno nie jest ani trochę słodka."
RECIPE.model = "models/props_junk/garbage_coffeemug001a.mdl"
RECIPE.station = {"tool_oven", "tool_oven_rusty"}
RECIPE.canUseCampfire = true
RECIPE.tools = {"tool_kettle"}
RECIPE.ingredients = {["crafting_water"] = 1, ["ing_herbs"] = 1}
RECIPE.result = {["drink_tea"] = 1}
RECIPE.hidden = false
RECIPE.skill = "cooking"
RECIPE.level = 0
RECIPE.experience = {
	{level = 10, exp = 200}, -- full xp
	{level = 14, exp = 100}, -- half xp
	{level = 15, exp = 0} -- no xp
}
RECIPE:Register()

local RECIPE = ix.recipe:New()
RECIPE.uniqueID = "cooking_coffee"
RECIPE.name = "Kubek kawy"
RECIPE.category = "Napoje"
RECIPE.description = "Kubek kawy, idealna na początek dnia."
RECIPE.model = "models/willardnetworks/food/coffee.mdl"
RECIPE.tools = {"tool_coffeemachine"}
RECIPE.ingredients = {["ing_coffee_powder"] = 1, ["junk_coffeecup"] = 1}
RECIPE.result = {["drink_coffee"] = 1}
RECIPE.hidden = false
RECIPE.skill = "cooking"
RECIPE.level = 0
RECIPE.experience = {
	{level = 10, exp = 200}, -- full xp
	{level = 14, exp = 100}, -- half xp
	{level = 15, exp = 0} -- no xp
}
RECIPE:Register()