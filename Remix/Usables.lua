local addonName, HelpMePlay = ...
local eventHandler = CreateFrame("Frame")
local remixItems = {210681, 210714, 210715, 210716, 210717, 210718, 211106, 211107, 211123, 211124, 216639, 216640, 216641, 216643, 216644, 219273, 220367, 220368, 220370, 220371, 220372, 220374, 226142, 226143, 226144, 226145, 210984, 217722, 219282, 219264, 219275, 219276, 219274, 219277, 219280, 210982, 219281, 210983, 219262, 219278, 219258, 219279, 219256, 219269, 219267, 210990, 210985, 219266, 219263, 210989, 219272, 219257, 219259, 219260, 219271, 219268, 210987, 210986, 219265, 219261, 219270}
local button
local lastTime
local cloak = "|cffe6cc80|Hitem:210333::::::::10:253:::::::::|h[Cloak of Infinite Potential]|h|r"

HelpMePlay.CreateRemixUsablesButton = function()
	if not button then
		button = HelpMePlay.CreateWidget("SecureButton", {
			name = format("%s%s", addonName, "RemixUseItemButton"),
			scale = 0.65,
			icon = 626190,
			isMovable = true,
			saveName = "RemixUseItemButton"
		})

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
			HelpMePlay.Tooltip_OnEnter(self, "Remix: Mists of Pandaria", format("Click to combine gems and add threads to your %s.\n\nYour cloak will be equipped if it's not already.\n\nClick and hold to drag.", cloak, cloak))
		end)
		button:SetScript("OnLeave", HelpMePlay.Tooltip_OnLeave)
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
		if PlayerGetTimerunningSeasonID() == 1 and HelpMePlayDB["ShowRemixUsablesButton"] then
			HelpMePlay.CreateRemixUsablesButton()
		end

		-- Unregister the event for performance.
		eventHandler:UnregisterEvent("PLAYER_LOGIN")
	end
end
)

hooksecurefunc(UIErrorsFrame, "TryDisplayMessage", function()
	if GetTime() == lastTime then
		UIErrorsFrame:Clear()
	end
end)