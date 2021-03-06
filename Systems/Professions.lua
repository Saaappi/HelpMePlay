local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

function HelpMePlay_CalculateReagents()
	if TradeSkillFrame then
		local itemId = 0
		local itemLink = ""
		local reagentItemLink = ""
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
		-- Use the documented REAGENTS table from the addon to recursively
		-- identify child reagents from parent reagents. For example, a
		-- Bolt of Linen Cloth has a child reagent of 2x Linen Cloth. This
		-- needs to be considered when writing out the complete list of
		-- reagents. This is only supported to children, grandchildren
		-- reagents wouldn't be supported.
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
									reagentItemLink = C_TradeSkillUI.GetRecipeReagentItemLink(recipeId, reagentIndex)
									if reagentItemLink then
										reagentName, _, reagentCount, reagentPlayerCount = C_TradeSkillUI.GetRecipeReagentInfo(recipeId, reagentIndex)
										if reagentName then
											_, itemId = strsplit(":", reagentItemLink); itemId = tonumber(itemId)
											if addonTable.REAGENTS[itemId] then
												InsertReagent(reagents, reagentName, reagentPlayerCount, reagentCount)
												local reagent = addonTable.REAGENTS[itemId]
												for parentReagent, parentReagentValue in pairs(reagent) do
													if type(parentReagentValue) == "table" then
														InsertReagent(reagents, parentReagent, reagentPlayerCount, parentReagentValue.count)
														for childReagent, childReagentValue in pairs(parentReagentValue.childReagents) do
															InsertReagent(reagents, childReagent, reagentPlayerCount, (childReagentValue*parentReagentValue.count))
														end
													else
														InsertReagent(reagents, parentReagent, reagentPlayerCount, (parentReagentValue*reagentCount))
													end
												end
											else
												InsertReagent(reagents, reagentName, reagentPlayerCount, reagentCount)
											end
										else
											if HelpMePlayOptionsDB.Logging then
												print(L_GLOBALSTRINGS["Reagent Name is Nil"] .. " |cffe6cc80" .. date("%X") .. "|r")
											end
										end
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

local function InsertReagent(tbl, reagentName, playerCount, reagentValue)
	if tbl[reagentName] == nil then
		tbl[reagentName] = { count = 0, playerCount = playerCount }
	end
	tbl[reagentName]["count"] = tbl[reagentName]["count"] + reagentValue
end