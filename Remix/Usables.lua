local addonName, addon = ...
local eventHandler = CreateFrame("Frame")
local remixItems = {210681, 210714, 210715, 210716, 210717, 210718, 211106, 211107, 211123, 211124, 216639, 216640, 216641, 216643, 216644, 219273, 220367, 220368, 220370, 220371, 220372, 220374, 226142, 226143, 226144, 226145, 210984, 217722, 219282, 219264, 219275, 219276, 219274, 219277, 219280, 210982, 219281, 210983, 219262, 219278, 219258, 219279, 219256, 219269, 219267, 210990, 210985, 219266, 219263, 210989, 219272, 219257, 219259, 219260, 219271, 219268, 210987, 210986, 219265, 219261, 219270}
local button
local lastTime
local cloak = "|cffe6cc80|Hitem:210333::::::::10:253:::::::::|h[Cloak of Infinite Potential]|h|r"

addon.CreateRemixUsablesButton = function()
	if not button then
		button = addon.CreateWidget("SecureButton", {
			name = format("%s%s", addonName, "RemixUseItemButton"),
			scale = 0.65,
			icon = 626190,
			isMovable = true,
			saveName = "RemixUseItemButton"
		})

		-- TODO: Remove before official launch.
		-- There was a new scaling solution implemented into this widget type
		-- so reset the button's position to its default so as not to potentially
		-- have it hidden when B8.4 is installed.
		if not HelpMePlayDB["ButtonReset_RemixUsables"] then
			HelpMePlayDB["ButtonReset_RemixUsables"] = true
			addon.ResetWidgetPosition("RemixUseItemButton", {
				anchor = "CENTER",
				parent = UIParent,
				relativeAnchor = "CENTER",
				xOff = 0,
				yOff = 0
			})
		end

		button:ClearAllPoints()
		if HelpMePlayDB.Positions["RemixUseItemButton"] then
			local pos = HelpMePlayDB.Positions["RemixUseItemButton"]
			button:SetPoint(pos.anchor, pos.parent, pos.relativeAnchor, pos.xOff, pos.yOff)
		else
			button:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
		end

		button:SetScript("PreClick", function()
			lastTime = GetTime()

			-- Equip the cloak if it's not equipped.
			if not GetInventoryItemLink("player", 15) then
				local hasItem = C_Item.GetItemCount(210333, false)
				if hasItem > 0 then
					C_Item.EquipItemByName(210333, 15)
				end
			end
		end)

		button:SetAttribute("type", "macro")
		local macrotext = "/use item:" .. table.concat(remixItems, "\n/use item:")
		button:SetAttribute("macrotext", macrotext)

		button:SetScript("OnEnter", function(self)
			addon.Tooltip_OnEnter(self, "Remix: Mists of Pandaria", format("Click to combine gems and add threads to your %s.\n\nYour %s will be equipped if it's not already.\n\nClick and hold to drag.", cloak, cloak))
		end)
		button:SetScript("OnLeave", addon.Tooltip_OnLeave)
	end

	if HelpMePlayDB["ShowRemixUsablesButton"] then
		button:Show()
	else
		button:Hide()
	end
end

eventHandler:RegisterEvent("PLAYER_LOGIN")
eventHandler:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_LOGIN" then
		C_Timer.After(1, function()
			if PlayerGetTimerunningSeasonID() == 1 and HelpMePlayDB["ShowRemixUsablesButton"] then
				addon.CreateRemixUsablesButton()
				--[[if C_AddOns_IsAddOnLoaded("Baganator") then -- Baganator
					if BAGANATOR_CONFIG["view_type"] == "single" then
						Baganator_SingleViewBackpackViewFrame:HookScript("OnShow", function()
							MakeButton("TOPRIGHT", Baganator_SingleViewBackpackViewFrame, "TOPLEFT", -5, 0)
						end)
					else
						Baganator_CategoryViewBackpackViewFrame:HookScript("OnShow", function()
							MakeButton("TOPRIGHT", Baganator_CategoryViewBackpackViewFrame, "TOPLEFT", -5, 0)
						end)
					end
				else -- Base UI
					if C_CVar_GetCVar("combinedBags") == "1" then
						EventRegistry:RegisterCallback("ContainerFrame.OpenAllBags", function() MakeButton("TOPRIGHT", ContainerFrameCombinedBags, "TOPLEFT", -10, 0) end)
					else
						EventRegistry:RegisterCallback("ContainerFrame.OpenAllBags", function() MakeButton("TOPRIGHT", ContainerFrame5, "TOPLEFT", -10, 0) end)
					end
				end]]
			end

			-- Unregister the event for performance.
			eventHandler:UnregisterEvent("PLAYER_LOGIN")
		end)
	end
end
)

hooksecurefunc(UIErrorsFrame, "TryDisplayMessage", function()
	if GetTime() == lastTime then
		UIErrorsFrame:Clear()
	end
end)