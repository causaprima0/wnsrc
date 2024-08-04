--[[
| This file was obtained through the combined efforts
| of Madbluntz & Plymouth Antiquarian Society.
|
| Credits: lifestorm, Gregory Wayne Rossel JR.,
| 	Maloy, DrPepper10 @ RIP, Atle!
|
| Visit for more: https://plymouth.thetwilightzone.ru/
--]]

local vgui = vgui

local PANEL = {}

function PANEL:Init()
	local parent = self:GetParent():GetParent()
	self:SetSize(parent.contentPanel:GetSize())

	-- Config
	self.firstTitle = "Receptury"
	self.secondTitle = "Stwórz"
	self.thirdTitle = "Podgląd"
	self.nothingSelected = "Nie wybrano przedmiotu/receptury"
	self.requirementsTitleText = "Wymagania: "
	self.ingredientsTitleText = "Składniki:"
	self.skill = "medicine"
	self.craftSound = "willardnetworks/skills/skill_medicine.wav"

	-- Create titles
	self:Add("CraftingBaseTopTitleBase")

	-- Create inner content
	self:Add("CraftingBaseInnerContent")

	-- Rebuild inner content
	self:Add("CraftingBaseRebuild")
end

function PANEL:Remove()
	if (self.model) then
		self.model:Remove()
	end
end

vgui.Register("MedicalBasePanel", PANEL, "EditablePanel")

local function CreateMedicalPanel(container)
	local panel = container:Add("MedicalBasePanel")

	ix.gui.medicalpanel = panel
	ix.gui.activeSkill = panel

	return container
end

hook.Add("CreateSkillPanels", "MedicalBasePanel", function(tabs)
    tabs[ix.skill.list["medicine"].uniqueID] = CreateMedicalPanel
end)