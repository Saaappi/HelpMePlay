local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local function InsertReagent(tbl, reagentName, recipeCount, playerCount)
	if tbl[reagentName] == nil then
		tbl[reagentName] = { count = 0, playerCount = playerCount }
	end
	tbl[reagentName]["count"] = tbl[reagentName]["count"] + recipeCount
end

local function Get(reagent)
	local reagentName
	local reagentPlayerCount
	for reagentId, reagentInfo in pairs(reagent) do
		reagentName = GetItemInfo(reagentId)
		if reagentInfo.crs then
		elseif reagentInfo.cr then
			local a = addonTable.REAGENTS[reagentInfo.cr]
			Get(a)
			--InsertReagent(reagents, reagentName, reagentInfo.c, GetItemCount(reagentId, true, nil))
		else
			reagentName = GetItemInfo(reagentId)
			InsertReagent(reagents, reagentName, reagentInfo.c, GetItemCount(reagentId, true, nil))
		end
	end
end

local function CalculateReagents()
	local itemId = 0
	local itemLink = ""
	local reagentItemLink = ""
	local sourceId = 0
	local recipeInfo = {}
	local sourceInfo = {}
	local reagents = {}
	local childReagent
	local reagentName
	local recipeReagentCount
	local currentReagentCount
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
			recipeInfo = C_TradeSkillUI.GetRecipeInfo(recipeId)
			-- If the recipe is known to the player, let's
			-- continue with the code.
			if recipeInfo.learned then
				itemLink = C_TradeSkillUI.GetRecipeItemLink(recipeId)
				if itemLink then
					_, sourceId = C_TransmogCollection.GetItemInfo(itemLink)
					if sourceId then
						sourceInfo = C_TransmogCollection.GetSourceInfo(sourceId)
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
								reagentItemLink = C_TradeSkillUI.GetRecipeReagentItemLink(recipeId, reagentIndex)
								if reagentItemLink then
									-- 'recipeReagentCount' represents the amount of the
									-- reagent required by the tradeskill.
									--
									-- 'currentReagentCount' represents the amount of the
									-- reagent currently in the player's possession.
									recipeReagentCount, currentReagentCount = select(3, C_TradeSkillUI.GetRecipeReagentInfo(recipeId, reagentIndex))
									_, itemId = strsplit(":", reagentItemLink); itemId = tonumber(itemId)
									reagentName = GetItemInfo(itemId)
									if reagentName then
										if addonTable.REAGENTS[itemId] then
											-- Insert the parent reagent first (e.g. Bronze Bar), then
											-- worry about children reagents (e.g. Copper/Tin Bar).
											InsertReagent(reagents, reagentName, recipeReagentCount, currentReagentCount)
											
											local reagent = addonTable.REAGENTS[itemId]
											Get(reagent)
											--InsertReagent(reagents, reagentName, count, currentReagentCount)
										else
											-- This is a standalone reagent that doesn't need
											-- an entry in the table (e.g. Tigerseye).
											InsertReagent(reagents, reagentName, recipeReagentCount, currentReagentCount)
										end
									else
										C_Timer.After(0.5, function()
											CalculateReagents()
										end)
										return
									end
								else
									addonTable.Print(L_GLOBALSTRINGS["Reagent Name is Nil"] .. " |cffe6cc80" .. date("%X") .. "|r")
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
			CalculateReagents()
		end)
	end
end)