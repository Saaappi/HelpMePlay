local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local talentsPrintedThisSession = {}

local function TalentPurchased(configID, entry)
	local entryInfo = ""
	local nodeInfo = C_Traits.GetNodeInfo(configID, entry.nodeID)
	if entry.selectionEntryID then
		entryInfo = C_Traits.GetEntryInfo(configID, entry.selectionEntryID)
	else
		entryInfo = C_Traits.GetEntryInfo(configID, nodeInfo.entryIDs[1])
	end
	
	if talentsPrintedThisSession[entry.nodeID] == nil then
		talentsPrintedThisSession[entry.nodeID] = true
		local _, _, icon = GetSpellInfo(C_Traits.GetDefinitionInfo(entryInfo.definitionID).spellID)
		local spellLink = GetSpellLink(C_Traits.GetDefinitionInfo(entryInfo.definitionID).spellID)
		print(string.format(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": " .. L_GLOBALSTRINGS["Text.Output.LearnedTalent"] .. " |T%s:0|t %s", icon, spellLink))
	end
	
	
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
            result.selectionEntryID = indexInfo.isChoiceNode and treeNode.entryIDs[indexInfo.choiceNodeSelection] or nil
            results[count] = result
            count = count + 1
        end
    end

    return results
end

local function PurchaseLoadoutEntryInfo(configID, loadoutEntryInfo)
    local removed = 0
    for i, entry in pairs(loadoutEntryInfo) do
        local success = false
        if entry.selectionEntryID then
            success = C_Traits.SetSelection(configID, entry.nodeID, entry.selectionEntryID)
        elseif entry.ranksPurchased then
            for rank = 1, entry.ranksPurchased do
                success = C_Traits.PurchaseRank(configID, entry.nodeID)
            end
        end
        if success then
            removed = removed + 1
            loadoutEntryInfo[i] = nil
			C_Timer.After(0.2, function()
				TalentPurchased(configID, entry)
			end)
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
				local specID = PlayerUtil.GetCurrentSpecID()
				local importStream = ExportUtil.MakeImportDataStream(addonTable.PLAYER_TALENTS[specID].importString)
				
				local headerValid, serializationVersion, specID, treeHash = ClassTalentImportExportMixin:ReadLoadoutHeader(importStream)
				if (not headerValid) then
					ClassTalentImportExportMixin:ShowImportError(LOADOUT_ERROR_BAD_STRING)
					return false
				end
				
				local patch = GetBuildInfo()
				if (patch ~= addonTable.PLAYER_TALENTS[specID].patch) then
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