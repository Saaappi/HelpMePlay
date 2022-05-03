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

function HelpMePlay_CalculateReagents()
	if TradeSkillFrame then
		local itemLink = ""
		local sourceId = 0
		local recipeInfo = {}
		local appearanceInfo = {}
		local reagents = {}
		local reagentName
		local reagentIcon
		local reagentCount
		local reagentPlayerCount
		local recipes = C_TradeSkillUI.GetAllRecipeIDs()
		local _, _, _, _, _, _, parentSkillLine = C_TradeSkillUI.GetTradeSkillLine()
		
		-- Iterate through all the known recipes for the currently
		-- open trade skill.
		--
		-- Ensure the current recipe is KNOWN by the current player.
		-- If so, then continue.
		--
		-- Get the item link using the recipe id. If the item link
		-- is valid, then continue.
		--
		-- Get the source id of the item using the item link. If the
		-- source id is valid, then it's an item with an appearance.
		-- If a valid appearance, then continue.
		--
		-- Get the appearance info (table) for the given source id.
		-- If the table is valid, then check if the appearance has
		-- been collected. If not, then continue.
		--
		-- If the appearance hasn't been collected, then return the
		-- number of reagents it takes to craft the recipe. The number
		-- represents an index beginning at 1.
		--
		-- Get the reagent info for each reagent in the recipe. We're
		-- interested in the name and the amount necessary to craft the
		-- recipe.
		--
		-- Once we have the number, archive it in an in-memory table.
		--
		-- Once all known recipes and unknown appearances have been
		-- calculated, churn through, and spit out the totals. If
		-- the total is negative, then the player has more than enough
		-- so don't print that reagent.
		for _, recipeId in pairs(recipes) do
			recipeInfo = C_TradeSkillUI.GetRecipeInfo(recipeId)
			if recipeInfo.learned then
				itemLink = C_TradeSkillUI.GetRecipeItemLink(recipeId)
				if itemLink then
					_, sourceId = C_TransmogCollection.GetItemInfo(itemLink)
					if sourceId then
						appearanceInfo = C_TransmogCollection.GetAppearanceInfoBySource(sourceId)
						if appearanceInfo then
							if appearanceInfo.sourceIsCollected == false then
								local numReagents = C_TradeSkillUI.GetRecipeNumReagents(recipeId)
								for reagentIndex = 1, numReagents do
									reagentName, reagentIcon, reagentCount, reagentPlayerCount = C_TradeSkillUI.GetRecipeReagentInfo(recipeId, reagentIndex)
									if reagentName then
										if reagents[reagentName] == nil then
											reagents[reagentName] = { count = 0, playerCount = reagentPlayerCount }
										end
										reagents[reagentName]["count"] = reagents[reagentName]["count"] + reagentCount
									else
										if HelpMePlayOptionsDB.Logging then
											print(L_GLOBALSTRINGS["Reagent Name is Nil"] .. " |cffe6cc80" .. date("%X") .. "|r")
										end
									end
								end
							end
						end
					end
				end
			end
		end
		
		local reagentString = ""
		for reagent, reagentData in pairs(reagents) do
			local amountNeeded = (reagentData.count - reagentData.playerCount)
			if amountNeeded > 0 then
				reagentString = reagentString .. reagent .. ": " .. amountNeeded
			end
		end
		
		StaticPopupDialogs["HELPMEPLAY_REAGENTSTRING_POPUP"] = {
			text = L_GLOBALSTRINGS["Reagent Copy Message"],
			button1 = "OK",
			OnShow = function(self, data)
				self.editBox:SetText(reagentString)
				self.editBox:HighlightText()
			end,
			timeout = 15,
			showAlert = true,
			whileDead = false,
			hideOnEscape = true,
			enterClicksFirstButton = true,
			hasEditBox = true,
			preferredIndex = 3,
		}
		StaticPopup_Show("HELPMEPLAY_REAGENTSTRING_POPUP")
	else
		if HelpMePlayOptionsDB.Logging then
			print(L_GLOBALSTRINGS["Trade Skill Window Invisible"])
		end
	end
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
		HelpMePlay_CalculateReagents()
	elseif command == L_GLOBALSTRINGS["Help Command"] or command == L_GLOBALSTRINGS["Help Command Alias"] then
		print(L_GLOBALSTRINGS["Colored Addon Name"] .. ":" .. "\n" .. L_GLOBALSTRINGS["Calculate Command"] .. "\n" .. L_GLOBALSTRINGS["Confirm Command"] .. "\n" .. L_GLOBALSTRINGS["Dialog Command"] .. "\n" .. L_GLOBALSTRINGS["Help Command"] .. "(" .. L_GLOBALSTRINGS["Help Command Alias"] .. ")\n" .. L_GLOBALSTRINGS["Ignore Command"] .. "\n" .. L_GLOBALSTRINGS["Quest Command"] .. "\n" .. L_GLOBALSTRINGS["Transmog Command"])
	end
end