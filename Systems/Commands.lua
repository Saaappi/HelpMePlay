local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L
local slots = { 1, 3, 4, 5, 6, 7, 8, 9, 10, 15, 16, 17, 18, 19 }
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

-- Search a number-indexed table for a
-- specific text.
--
-- Return the index or 0.
--
-- If the table passed to the function
-- is nil, then instantiate an empty
-- table.
local function ContainsByID(tbl, str)
	if tbl == nil then
		tbl = {}
	end
	for index, text in ipairs(tbl) do
		if string.find(string.lower(text), string.lower(str)) then
			return index
		end
	end
	return 0
end

local function Dialog(gossip)
	local guid = UnitGUID("target")
	if guid then
		local _, _, _, _, _, npcId = string.split("-", guid); npcId = tonumber(npcId)
		if not HelpMePlayPlayerDialogDB[npcId] then
			HelpMePlayPlayerDialogDB[npcId] = {}
		end
		if not HelpMePlayPlayerDialogDB[npcId]["g"] then
			HelpMePlayPlayerDialogDB[npcId]["g"] = {}
			table.insert(HelpMePlayPlayerDialogDB[npcId]["g"], gossip)
		else
			local index = ContainsByID(HelpMePlayPlayerDialogDB[npcId]["g"], gossip)
			if index ~= 0 then
				table.remove(HelpMePlayPlayerDialogDB[npcId]["g"], index)
				if HelpMePlayOptionsDB.Logging then
					print(string.format(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. L_GLOBALSTRINGS["Dialog Removed"], gossip))
				end
			else
				table.insert(HelpMePlayPlayerDialogDB[npcId]["g"], gossip)
			end
		end
	else
		local index = ContainsByID(HelpMePlayPlayerDialogDB, gossip)
		if index ~= 0 then
			table.remove(HelpMePlayPlayerDialogDB, index)
			if HelpMePlayOptionsDB.Logging then
				print(string.format(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. L_GLOBALSTRINGS["Dialog Removed"], gossip))
			end
		else
			table.insert(HelpMePlayPlayerDialogDB, gossip)
		end
	end
end

local function Confirm(gossip)
	local guid = UnitGUID("target")
	if guid then
		local _, _, _, _, _, npcId = string.split("-", guid); npcId = tonumber(npcId)
		if not HelpMePlayPlayerDialogDB[npcId] then
			HelpMePlayPlayerDialogDB[npcId] = {}
		end
		if not HelpMePlayPlayerDialogDB[npcId]["c"] then
			HelpMePlayPlayerDialogDB[npcId]["c"] = {}
			table.insert(HelpMePlayPlayerDialogDB[npcId]["c"], gossip)
		else
			if HelpMePlayPlayerDialogDB[npcId]["c"] then
				local index = ContainsByID(HelpMePlayPlayerDialogDB[npcId]["c"], gossip)
				if index ~= 0 then
					table.remove(HelpMePlayPlayerDialogDB[npcId]["c"], index)
					if HelpMePlayOptionsDB.Logging then
						print(string.format(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. L_GLOBALSTRINGS["Dialog Removed"], gossip))
					end
				else
					table.insert(HelpMePlayPlayerDialogDB[npcId]["c"], gossip)
				end
			end
		end
	else
		local index = ContainsByID(HelpMePlayPlayerDialogDB, gossip)
		if index ~= 0 then
			table.remove(HelpMePlayPlayerDialogDB, index)
			if HelpMePlayOptionsDB.Logging then
				print(string.format(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. L_GLOBALSTRINGS["Dialog Removed"], gossip))
			end
		else
			table.insert(HelpMePlayPlayerDialogDB, gossip)
		end
	end
end

local function RequipOriginalItems(equippedItems)
	local currentlyEquippedItemLink
	
	-- Open the character frame, then close it
	-- 1 second later and run the remaining code.
	if not UnitAffectingCombat("player") then
		ToggleCharacter("PaperDollFrame")
		C_Timer.After(1, function()
			CharacterFrameCloseButton:Click()
			-- We need to rescan the equipped items
			-- so we can run comparisons to the original items.
			for _, item in ipairs(equippedItems) do
				currentlyEquippedItemLink = GetInventoryItemLink("player", item.id)
				if currentlyEquippedItemLink ~= item.link then -- The original item isn't equipped.
					EquipItemByName(item.link)
				end
			end
		end)
	end
end

local function LearnAllUnknownTransmog(equippedItems)
	local itemLink
	local sourceId
	local canCollectSource
	local appearanceInfo = {}
	
	-- Open the player bags, then close them
	-- 1 second later and run the remaining code.
	if not UnitAffectingCombat("player") then
		OpenAllBags()
		C_Timer.After(1, function()
			CloseAllBags()
			for i=0, NUM_BAG_SLOTS do -- We iterate through the inventory, bags 0 to 4.
				for j=1, GetContainerNumSlots(i) do -- We iterate through the bag slots for each bag.
					_, _, _, _, _, _, itemLink = GetContainerItemInfo(i, j)
					if itemLink then -- If we return a valid item link, then continue.
						_, sourceId = C_TransmogCollection.GetItemInfo(itemLink)
						if sourceId then -- If we return a valid source ID, then continue.
							_, canCollectSource = C_TransmogCollection.PlayerCanCollectSource(sourceId)
							if canCollectSource then -- The player can learn the source on the current character.
								appearanceInfo = C_TransmogCollection.GetAppearanceInfoBySource(sourceId)
								if appearanceInfo then
									if appearanceInfo.sourceIsCollected == false then -- If the player hasn't already learned the source, then continue.
										EquipItemByName(itemLink)
										if StaticPopup1:IsVisible() then -- The "soulbind" popup is visible. Click the okay button.
											StaticPopup1Button1:Click("LeftButton")
										end
									end
								end
							else
								local _, _, itemQuality, _, _, _, _, _, _, _, _, _, _, bindType = GetItemInfo(itemLink)
								
								if bindType ~= 1 and itemQuality >= 2 then -- The item isn't soulbound, so it can be mailed. The quality is at least green.
									-- The player can't use the transmog, so let's
									-- check if it's unknown so we can inform them.
									appearanceInfo = C_TransmogCollection.GetAppearanceInfoBySource(sourceId)
									if appearanceInfo then
										if appearanceInfo.sourceIsCollected == false then
											local _, _, _, _, _, _, itemSubType = GetItemInfo(itemLink)
											if itemSubType then
												if HelpMePlayOptionsDB.Logging then
													print(L_GLOBALSTRINGS["Unlearnable Appearance"] .. ": " .. itemLink .. " (" .. itemSubType .. ")")
												end
											else
												if HelpMePlayOptionsDB.Logging then
													print(L_GLOBALSTRINGS["Unlearnable Appearance"] .. ": " .. itemLink)
												end
											end
										end
									else
										print(string.format(L_GLOBALSTRINGS["Unknown Source ID"], itemLink, i, j))
									end
								end
							end
						end
					end
				end
			end

			RequipOriginalItems(equippedItems)
		end)
	end
end

function HelpMePlay_GetEquippedItems()
	local equippedItems = {}
	local itemLink
	
	-- Open the character frame, then close it
	-- 1 second later and run the remaining code.
	if not UnitAffectingCombat("player") then
		ToggleCharacter("PaperDollFrame")
		C_Timer.After(1, function()
			CharacterFrameCloseButton:Click()
			-- Get the players currently equipped items
			-- in transmog-capable slots and store them
			-- in a separate table.
			--
			-- We'll use this separate table to re-equip
			-- items once we're done.
			for _, v in ipairs(slots) do
				itemLink = GetInventoryItemLink("player", v)
				if itemLink then
					table.insert(equippedItems, { id = v, link = itemLink})
				end
			end
			
			LearnAllUnknownTransmog(equippedItems)
		end)
	end
	
	return
end

SLASH_HelpMePlay1 = L_GLOBALSTRINGS["Slash HMP"]
SlashCmdList["HelpMePlay"] = function(command, editbox)
	local _, _, command, arguments = string.find(command, "%s?(%w+)%s?(.*)") -- Using pattern matching the addon will be able to interpret subcommands.
	if not command or command == "" then
		if HMPOptionsFrame:IsVisible() then
			HMPOptionsFrame:Hide()
		else
			HelpMePlayLoadSettings()
		end
	elseif command == L_GLOBALSTRINGS["Dialog Command"] and arguments ~= "" then
		Dialog(arguments)
	elseif command == L_GLOBALSTRINGS["Confirm Command"] and arguments ~= "" then
		Confirm(arguments)
	elseif command == L_GLOBALSTRINGS["Quest Command"] or command == L_GLOBALSTRINGS["Q"] and arguments ~= "" then
		-- A shorthand way to check if a given quest has
		-- been completed by the current player.
		--
		-- The argument must be a number, else silently
		-- fail out.
		if tonumber(arguments) then
			if HelpMePlayOptionsDB.Logging then
				print(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. tostring(C_QuestLog.IsQuestFlaggedCompleted(arguments)))
			end
		end
	elseif command == L_GLOBALSTRINGS["Transmog Command"] or command == L_GLOBALSTRINGS["T"] then
		HelpMePlay_GetEquippedItems()
	elseif command == L_GLOBALSTRINGS["Ignore Command"] then
		if tonumber(arguments) then
			local npcId = tonumber(arguments)
			if HelpMePlayIgnoredCreaturesDB[npcId] == nil then
				HelpMePlayIgnoredCreaturesDB[npcId] = true
			else
				HelpMePlayIgnoredCreaturesDB[npcId] = nil
			end
		else
			if UnitIsPlayer("target") == false then
				local unitGUID = UnitGUID("target")
				if unitGUID then
					local _, _, _, _, _, npcId = strsplit("-", unitGUID); npcId = tonumber(npcId)
					if HelpMePlayIgnoredCreaturesDB[npcId] == nil then
						HelpMePlayIgnoredCreaturesDB[npcId] = true
					else
						HelpMePlayIgnoredCreaturesDB[npcId] = nil
					end
				end
			end
		end
	elseif command == L_GLOBALSTRINGS["Calculate Command"] or command == L_GLOBALSTRINGS["Calculate Command Shorthand"] then
		if TradeSkillFrame:IsVisible() then
			local recipes = C_TradeSkillUI.GetAllRecipeIDs()
			for _, recipeId in pairs(recipes) do
				print(C_TradeSkillUI.GetRecipeItemLink(recipeId))
			end
		else
			print(L_GLOBALSTRINGS["Trade Skill Window Invisible"])
		end
	else
		print(L_GLOBALSTRINGS["Colored Addon Name"] .. ":" .. "\n" .. L_GLOBALSTRINGS["Calculate Command"] .. "\n" .. L_GLOBALSTRINGS["Confirm Command"] .. "\n" .. L_GLOBALSTRINGS["Dialog Command"] .. "\n" .. L_GLOBALSTRINGS["Ignore Command"] .. "\n" .. L_GLOBALSTRINGS["Quest Command"] .. "\n" .. L_GLOBALSTRINGS["Transmog Command"])
	end
end