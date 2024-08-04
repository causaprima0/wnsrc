--[[
| This file was obtained through the combined efforts
| of Madbluntz & Plymouth Antiquarian Society.
|
| Credits: lifestorm, Gregory Wayne Rossel JR.,
| 	Maloy, DrPepper10 @ RIP, Atle!
|
| Visit for more: https://plymouth.thetwilightzone.ru/
--]]


local PANEL = {}

function PANEL:Init()
	self:SetSize(ScrW(), ScrH())
	self:SetAlpha(0)
	self:AlphaTo(255, 0.5, 0)
	self.Paint = function(self, w, h)
		surface.SetDrawColor(Color(63, 58, 115, 220))
		surface.DrawRect(0, 0, w, h)

		Derma_DrawBackgroundBlur( self, 1 )
	end
	
	self.innerContent = self:Add("Panel")
	self.innerContent:SetSize(460, 360)
	self.innerContent:Center()
	self.innerContent:MakePopup()
	self.innerContent.Paint = function(self, w, h)
		surface.SetDrawColor(0, 0, 0, 130)
		surface.DrawRect(0, 0, w, h)
	end	
	
	local topbar = self.innerContent:Add("Panel")
	topbar:SetSize(self.innerContent:GetWide(), 50)
	topbar:Dock(TOP)
	topbar.Paint = function( self, w, h )
		surface.SetDrawColor(0, 0, 0, 130)
		surface.DrawRect(0, 0, w, h)
	end
	
	local titleText = topbar:Add("DLabel")
	titleText:SetFont("CharCreationBoldTitle")
	titleText:Dock(LEFT)
	titleText:SetText("Shipment")
	titleText:DockMargin(10, 0, 0, 0)
	titleText:SetContentAlignment(4)
	titleText:SizeToContents()
	
	local exit = topbar:Add("DImageButton")
	exit:SetImage("willardnetworks/tabmenu/navicons/exit.png")
	exit:SetSize(20, 20)
	exit:DockMargin(0, 15, 10, 15)
	exit:Dock(RIGHT)
	exit.DoClick = function()
		self:Close()
		surface.PlaySound("helix/ui/press.wav")
	end	

	self.scroll = self.innerContent:Add("DScrollPanel")
	self.scroll:Dock(FILL)

	self.list = self.scroll:Add("DListLayout")
	self.list:Dock(FILL)
end

function PANEL:SetItems(entity, items)
	self.entity = entity
	self.items = true
	self.itemPanels = {}

	for k, v in SortedPairs(items) do
		local itemTable = ix.item.list[k]

		if (itemTable) then
			local function ButtonPaint(self, w, h)
				surface.SetDrawColor(Color(0, 0, 0, 100))
				surface.DrawRect(0, 0, w, h)
				
				surface.SetDrawColor(Color(111, 111, 136, (255 / 100 * 30)))
				surface.DrawOutlinedRect(0, 0, w, h)
			end
			
			local item = self.list:Add("Panel")
			item:SetTall(36)
			item:Dock(TOP)
			item:DockMargin(4, 4, 4, 0)
			item.Paint = function(self, w, h) 
				surface.SetDrawColor(Color(0, 0, 0, 100))
				surface.DrawRect(0, 0, w, h)
			end

			item.icon = item:Add("SpawnIcon")
			item.icon:SetPos(5, 2)
			item.icon:SetSize(32, 32)
			item.icon:SetModel(itemTable:GetModel())
			item.icon:SetHelixTooltip(function(tooltip)
				ix.hud.PopulateItemTooltip(tooltip, itemTable)
			end)

			item.quantity = item.icon:Add("DLabel")
			item.quantity:SetSize(32, 32)
			item.quantity:SetContentAlignment(3)
			item.quantity:SetTextInset(0, 0)
			item.quantity:SetText(v)
			item.quantity:SetFont("DermaDefaultBold")
			item.quantity:SetExpensiveShadow(1, Color(0, 0, 0, 150))

			item.name = item:Add("DLabel")
			item.name:SetPos(45, 0)
			item.name:SetSize(200, 36)
			item.name:SetFont("ixSmallFont")
			item.name:SetText(L(itemTable.name))
			item.name:SetContentAlignment(4)
			item.name:SetTextColor(color_white)
			
			item.take = item:Add("DButton")
			item.take:Dock(RIGHT)
			item.take:SetText(L"take")
			item.take:SetWide(48)
			item.take:DockMargin(3, 3, 3, 3)
			item.take:SetTextColor(color_white)
			item.take.Paint = function(self, w, h) ButtonPaint(self, w, h) end
			item.take.DoClick = function(this)
				net.Start("ixShipmentUse")
					net.WriteString(k)
					net.WriteBool(false)
				net.SendToServer()

				items[k] = items[k] - 1

				item.quantity:SetText(items[k])

				if (items[k] <= 0) then
					item:Remove()
					items[k] = nil
				end

				if (table.IsEmpty(items)) then
					self:Remove()
				end
			end

			item.drop = item:Add("DButton")
			item.drop:Dock(RIGHT)
			item.drop:SetText(L"drop")
			item.drop:SetWide(48)
			item.drop:DockMargin(3, 3, 0, 3)
			item.drop:SetTextColor(color_white)
			item.drop.Paint = function(self, w, h) ButtonPaint(self, w, h) end 
			item.drop.DoClick = function(this)
				net.Start("ixShipmentUse")
					net.WriteString(k)
					net.WriteBool(true)
				net.SendToServer()

				items[k] = items[k] - 1

				item.quantity:SetText(items[k])

				if (items[k] <= 0) then
					item:Remove()
				end
			end

			self.itemPanels[k] = item
		end
	end
end

function PANEL:Close()
	net.Start("ixShipmentClose")
	net.SendToServer()

	self:Remove()
end

function PANEL:Think()
	if (self.items and !IsValid(self.entity)) then
		self:Remove()
	end
end

vgui.Register("ixShipment", PANEL, "Panel")
