local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local function InsertReagent(tbl, reagentName, itemId, count)
	-- If < count > turns out to be negative, then the
	-- player clearly has enough of said reagent.
	if count and count < 0 then return end
	
	-- If the < reagentName > is nil in the table,
	-- then the reagent has yet to be documented.
	-- Let's assign a default value of 0 to alleviate
	-- any Lua errors.
	if tbl[reagentName] == nil then
		tbl[reagentName] = { count = 0, itemId = itemId }
	end
	
	-- Increment the count from its current value,
	-- 0 or otherwise, to its new value based on
	-- the value of < count > (function argument).
	tbl[reagentName]["count"] = tbl[reagentName]["count"] + count
end

local function CalculateReagents()
	local reagents = {}
	local recipes = C_TradeSkillUI.GetAllRecipeIDs()

	-- Only show the Calculate button for PRODUCTION
	-- trade skills (e.g. Blacksmithing).
	--
	-- Thus, get the parent skill ID and conduct a
	-- sanity check to confirm.
	--
	-- The skill line ID to names can be found @
	-- https://wowpedia.fandom.com/wiki/TradeSkillLineID
	local _, _, _, _, _, parentSkillId = C_TradeSkillUI.GetTradeSkillLine()
	if (parentSkillId == 164) or (parentSkillId == 165) or (parentSkillId == 197) or (parentSkillId == 202) or (parentSkillId == 755) then
		for _, recipeId in pairs(recipes) do
			local recipeInfo = C_TradeSkillUI.GetRecipeInfo(recipeId)
			-- If the recipe is known to the player, let's
			-- continue with the code.
			if recipeInfo.learned then
				local itemLink = C_TradeSkillUI.GetRecipeItemLink(recipeId)
				if itemLink then
					local _, sourceId = C_TransmogCollection.GetItemInfo(itemLink)
					if sourceId then
						local sourceInfo = C_TransmogCollection.GetSourceInfo(sourceId)
						-- If the appearance is NOT collected by
						-- the player, then let's continue with
						-- the code.
						if sourceInfo.isCollected == false then
							-- Get the total number of reagents used
							-- to craft the item.
							local numReagents = C_TradeSkillUI.GetRecipeNumReagents(recipeId)
							-- Iterate over each reagent used to
							-- craft the item. We'll use this number
							-- as an index to gather information about
							-- each reagent.
							for reagentIndex = 1, numReagents do
								local reagentItemLink = C_TradeSkillUI.GetRecipeReagentItemLink(recipeId, reagentIndex)
								if reagentItemLink then
									-- 'recipeReagentCount' represents the amount of the
									-- reagent required by the tradeskill.
									--
									-- 'currentReagentCount' represents the amount of the
									-- reagent currently in the player's possession.
									local recipeReagentCount, currentReagentCount = select(3, C_TradeSkillUI.GetRecipeReagentInfo(recipeId, reagentIndex))
									local _, itemId = strsplit(":", reagentItemLink); itemId = tonumber(itemId)
									-- The reagent is in the table. Let's continue.
									--if addonTable.REAGENTS[itemId] then
									local reagentName = GetItemInfo(itemId)
									-- Continue only if the reagent's name isn't nil.
									if reagentName then
										-- Insert the primary reagent (the one listed
										-- in the recipe) into the < reagents > table.
										InsertReagent(reagents, reagentName, itemId, (recipeReagentCount-currentReagentCount))
									else
										C_Timer.After(0.5, function()
											CalculateReagents()
										end)
										return
									end
								else
									addonTable.Print(L_GLOBALSTRINGS["Reagent Data Missing"] .. " |cffe6cc80" .. date("%X") .. "|r")
									return
								end
							end
						end
					end
				end
			end
		end
	
		local reagentString = ""
		for reagent, reagentData in pairs(reagents) do
			local amountNeeded = (reagentData.count - (GetItemCount(reagentData.itemId, true, false)))
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
	end
end

e:RegisterEvent("ADDON_LOADED")
e:SetScript("OnEvent", function(self, event, addon)
	if event == "ADDON_LOADED" and addon == "Blizzard_TradeSkillUI" then
		-- Set the size and point of the Calculate button.
		-- Ideally, it sits to the left of the Filter
		-- dropdown.
		local calculateButton = _G.CreateFrame(
			"Button",
			"HMPProfessionCalculateButton",
			TradeSkillFrame,
			"UIPanelButtonTemplate"
		)
		HMPProfessionCalculateButton:SetSize(80, 22)
		HMPProfessionCalculateButton:SetText(L_GLOBALSTRINGS["Calculate"])
		HMPProfessionCalculateButton:SetPoint("RIGHT", TradeSkillFrame.FilterButton, "LEFT", -10, 0)
		HMPProfessionCalculateButton:Show()
		
		-- Give the Calculate button some life by adding
		-- a script for the OnEnter (hover), OnLeave, and
		-- OnClick handlers.
		HMPProfessionCalculateButton:SetScript("OnEnter", function(self)
			addonTable.ShowTooltip(self, L_GLOBALSTRINGS["Calculate Button"])
		end)
		HMPProfessionCalculateButton:SetScript("OnLeave", function(self)
			addonTable.HideTooltip(self)
		end)
		HMPProfessionCalculateButton:SetScript("OnClick", function(self)
			addonTable.Print(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. L_GLOBALSTRINGS["Profession Reagents being Calculated"])
			CalculateReagents()
		end)
	end
end)