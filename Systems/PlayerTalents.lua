local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local function TalentPurchased(entryInfo)
	local _, _, icon = GetSpellInfo(C_Traits.GetDefinitionInfo(entryInfo.definitionID).spellID)
	local spellLink = GetSpellLink(C_Traits.GetDefinitionInfo(entryInfo.definitionID).spellID)
	print(string.format(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": " .. L_GLOBALSTRINGS["Text.Output.TalentLearned"] .. " |T%s:0|t %s", icon, spellLink))
end

local function PurchaseTalents(configID, tbl, specID)
	C_Timer.After(0.25, function()
		if tbl[specID] then
			for _, traits in ipairs(tbl[specID]) do
				if C_Traits.CanPurchaseRank(configID, traits.n, traits.e) then
					local nodeInfo = C_Traits.GetNodeInfo(configID, traits.n)
					local entryInfo = C_Traits.GetEntryInfo(configID, traits.e)
					if #nodeInfo.entryIDs > 1 then
						local success = C_Traits.SetSelection(configID, traits.n, traits.e)
						if success then
							TalentPurchased(entryInfo)
						end
					else
						local success = C_Traits.PurchaseRank(configID, traits.n)
						if success then
							TalentPurchased(entryInfo)
						end
					end
				end
			end
		else
			return
		end
		C_Traits.StageConfig(configID)
		C_Traits.CommitConfig(configID)
	end)
end

local function ConvertToImportLoadoutEntryInfo(treeID, loadoutContent)
    local results = {}
    local treeNodes = C_Traits.GetTreeNodes(treeID)
    local configID = C_ClassTalents.GetActiveConfigID()
    local count = 1
    for i, treeNodeID in ipairs(treeNodes) do
        local indexInfo = loadoutContent[i]
        if (indexInfo.isNodeSelected) then
            local treeNode = C_Traits.GetNodeInfo(configID, treeNodeID)
            local result = {}
            result.nodeID = treeNode.ID
            result.ranksPurchased = indexInfo.isPartiallyRanked and indexInfo.partialRanksPurchased or treeNode.maxRanks
            -- minor change from default UI, only add in case of choice nodes
            result.selectionEntryID = indexInfo.isChoiceNode and treeNode.entryIDs[indexInfo.choiceNodeSelection] or nil
            results[count] = result
            count = count + 1
        end
    end

    return results
end

local function PurchaseLoadoutEntryInfo(configID, loadoutEntryInfo)
    local removed = 0
    for i, nodeEntry in pairs(loadoutEntryInfo) do
        local success = false
        if nodeEntry.selectionEntryID then
            success = C_Traits.SetSelection(configID, nodeEntry.nodeID, nodeEntry.selectionEntryID);
        elseif nodeEntry.ranksPurchased then
            for rank = 1, nodeEntry.ranksPurchased do
                success = C_Traits.PurchaseRank(configID, nodeEntry.nodeID);
            end
        end
        if success then
            removed = removed + 1
            loadoutEntryInfo[i] = nil
        end
    end

    return removed
end

local function Import(loadoutEntryInfo, treeID)
	local configID = C_ClassTalents.GetActiveConfigID()
    if not configID then
        return false
    end
	
    C_Traits.ResetTree(configID, treeID)
    while (true) do
        local removed = PurchaseLoadoutEntryInfo(configID, loadoutEntryInfo)
        if (removed == 0) then
            break
        end
    end
	
	C_Traits.StageConfig(configID)
	C_Traits.CommitConfig(configID)
    return true
end

e:RegisterEvent("ADDON_LOADED")
e:SetScript("OnEvent", function(self, event, addon)
	if event == "ADDON_LOADED" and addon == "Blizzard_ClassTalentUI" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.TalentButtonEnabled == false or HelpMePlayDB.TalentButtonEnabled == nil then return false end
		
		ClassTalentFrame:HookScript("OnShow", function()
			local talentButton = _G.CreateFrame(
				"Button",
				"HMPTalentButton",
				ClassTalentFrame.TalentsTab.ApplyButton,
				"UIPanelButtonTemplate"
			)
		
			HMPTalentButton:SetSize(50, 20)
			HMPTalentButton:SetText(L_GLOBALSTRINGS["UI.Button.Learn"])

			HMPTalentButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
			
			HMPTalentButton:HookScript("OnClick", function(self)
				--local _, _, classID = UnitClass("player")
				local specID = PlayerUtil.GetCurrentSpecID()
				
				--[[if classID == 1 then -- Warrior
					PurchaseTalents(configID, addonTable.WARRIOR_TALENTS, specID)
				elseif classID == 2 then -- Paladin
					PurchaseTalents(configID, addonTable.PALADIN_TALENTS, specID)
				elseif classID == 3 then -- Hunter
					PurchaseTalents(configID, addonTable.HUNTER_TALENTS, specID)
				elseif classID == 4 then -- Rogue
					PurchaseTalents(configID, addonTable.ROGUE_TALENTS, specID)
				elseif classID == 5 then -- Priest
					PurchaseTalents(configID, addonTable.PRIEST_TALENTS, specID)
				elseif classID == 6 then -- Death Knight
					PurchaseTalents(configID, addonTable.DEATH_KNIGHT_TALENTS, specID)
				elseif classID == 7 then -- Shaman
					PurchaseTalents(configID, addonTable.SHAMAN_TALENTS, specID)
				elseif classID == 8 then -- Mage
					PurchaseTalents(configID, addonTable.MAGE_TALENTS, specID)
				elseif classID == 9 then -- Warlock
					PurchaseTalents(configID, addonTable.WARLOCK_TALENTS, specID)
				elseif classID == 10 then -- Monk
					PurchaseTalents(configID, addonTable.MONK_TALENTS, specID)
				elseif classID == 11 then -- Druid
					PurchaseTalents(configID, addonTable.DRUID_TALENTS, specID)
				elseif classID == 12 then -- Demon Hunter
					PurchaseTalents(configID, addonTable.DEMON_HUNTER_TALENTS, specID)
				elseif classID == 13 then -- Evoker
					PurchaseTalents(configID, addonTable.EVOKER_TALENTS, specID)
				end]]
				
				local importStream = ExportUtil.MakeImportDataStream(addonTable.PLAYER_TALENTS[specID].importString)
				local headerValid, serializationVersion, specID, treeHash = ClassTalentImportExportMixin:ReadLoadoutHeader(importStream)
				
				if (not headerValid) then
					ClassTalentImportExportMixin:ShowImportError(LOADOUT_ERROR_BAD_STRING)
					return false
				end
				
				local _, build = GetBuildInfo()
				if (build ~= addonTable.PLAYER_TALENTS[specID].build) then
					ClassTalentImportExportMixin:ShowImportError(LOADOUT_ERROR_SERIALIZATION_VERSION_MISMATCH)
					return false
				end
				
				if (specID ~= PlayerUtil.GetCurrentSpecID()) then
					ClassTalentImportExportMixin:ShowImportError(LOADOUT_ERROR_WRONG_SPEC)
					return false
				end
				
				local configID = C_ClassTalents.GetActiveConfigID()
				local treeInfo = C_Traits.GetTreeInfo(configID, C_Traits.GetConfigInfo(configID).treeIDs[1])

				local loadoutContent = ClassTalentImportExportMixin:ReadLoadoutContent(importStream, treeInfo.ID)
				local loadoutEntryInfo = ConvertToImportLoadoutEntryInfo(treeInfo.ID, loadoutContent)
				
				Import(loadoutEntryInfo, treeInfo.ID)
			end)
			
			HMPTalentButton:HookScript("OnEnter", function(self)
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:SetText(L_GLOBALSTRINGS["UI.Button.Talents.Desc"])
				GameTooltip:Show()
			end)

			HMPTalentButton:HookScript("OnLeave", function(self)
				if GameTooltip:GetOwner() == self then
					GameTooltip:Hide()
				end
			end)
			
			if HelpMePlayDB.TalentButtonEnabled then
				HMPTalentButton:SetPoint("RIGHT", ClassTalentFrame.TalentsTab.ApplyButton, "LEFT", -20, 0)
				HMPTalentButton:Show()
			end
		end)
	end
end)