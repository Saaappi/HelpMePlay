local addonName, HelpMePlay = ...
local eventHandler = CreateFrame("Frame")
local button
local lastTime
local cloak = "|cffe6cc80|Hitem:210333::::::::10:253:::::::::|h[Cloak of Infinite Potential]|h|r"
local macroText = ""

-- Remix item tables.
local uncommonGems = {210681, 210714, 210715, 210716, 210717, 220367, 220371}
local rareGems = {216644, 220372, 216643, 216640, 216639, 220368, 216641}
local epicGems = {220374, 220370, 210718, 211123, 211106, 211124, 211107}
local commonThreads = {210984, 217722, 210982, 210983, 210990, 210985, 210989, 210987, 210986}
local uncommonThreads = {226145, 219264, 219262, 219258, 219256, 219263, 219261, 219257, 219260, 219259}
local rareThreads = {219273, 226144, 219269, 219267, 219266, 219272, 219271, 219268, 219265, 219270}
local epicThreads = {226142, 226143, 219282, 219275, 219276, 219274, 219277, 219280, 219281, 219278, 219279}

local stringDescriptions = {
	"|cff94CEA8Left Click (No Modifier)|r: Gems (|cff1EFF00Uncommon|r)",
	"|cff94CEA8Left Click (Shift)|r: Gems (|cff0070DDRare|r)",
	"|cff94CEA8Left Click (Ctrl)|r: Gems (|cffA335EEEpic|r)",
	"",
	"|cff9CDCFERight Click (No Modifier)|r: Threads (Common)",
	"|cff9CDCFERight Click (Shift)|r: Threads (|cff1EFF00Uncommon|r)",
	"|cff9CDCFERight Click (Ctrl)|r: Threads (|cff0070DDRare|r)",
	"|cff9CDCFERight Click (Alt)|r: Threads (|cffA335EEEpic|r/|cffFF8000Legendary|r)"
}

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

		button:SetScript("PreClick", function(_, btn)
			-- Reset macroText back to a blank string.
			macroText = ""

			-- Set the attribute of the button based on which button is used.
			if btn == "LeftButton" and (not IsModifierKeyDown()) then
				for _, itemID in next, uncommonGems do
					macroText = macroText .. format("/use item:%s\n", itemID)
				end
			elseif btn == "LeftButton" and IsShiftKeyDown() then
				for _, itemID in next, rareGems do
					macroText = macroText .. format("/use item:%s\n", itemID)
				end
			elseif btn == "LeftButton" and IsControlKeyDown() then
				for _, itemID in next, epicGems do
					macroText = macroText .. format("/use item:%s\n", itemID)
				end
			elseif btn == "RightButton" and (not IsModifierKeyDown()) then
				for _, itemID in next, commonThreads do
					macroText = macroText .. format("/use item:%s\n", itemID)
				end
			elseif btn == "RightButton" and IsShiftKeyDown() then
				for _, itemID in next, uncommonThreads do
					macroText = macroText .. format("/use item:%s\n", itemID)
				end
			elseif btn == "RightButton" and IsControlKeyDown() then
				for _, itemID in next, rareThreads do
					macroText = macroText .. format("/use item:%s\n", itemID)
				end
			elseif btn == "RightButton" and IsAltKeyDown() then
				for _, itemID in next, epicThreads do
					macroText = macroText .. format("/use item:%s\n", itemID)
				end
			end
			button:SetAttribute("macrotext", macroText)

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
		--[[for _, itemID in next, remixItems do
			macroText = macroText .. format("/use item:%s\n", itemID)
		end]]
		--local macroText = "/use item:" .. table.concat(remixItems, "\n/use item:")
		--button:SetAttribute("macrotext", macroText)

		button:SetScript("OnEnter", function(self)
			local combinedString = ""
			for _, description in next, stringDescriptions do
				combinedString = combinedString .. description .. "\n"
			end
			HelpMePlay.Tooltip_OnEnter(self, "Remix: Mists of Pandaria", format("Click to combine gems and add threads to your %s.\n\nYour cloak will be equipped if it's not already.\n\n%s\n\nClick and hold to drag.", cloak, combinedString))
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