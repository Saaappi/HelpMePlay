local addonName, HelpMePlay = ...
local eventHandler = CreateFrame("Frame")
local classTalentsButton = {}
local classId = 0
local specId = 0
local LOADOUT_SERIALIZATION_VERSION = 2

--[[ Disabled - 9/7/2024
local function AreAllTalentNodeConditionsMet(activeConfigID, node)
    for _, conditionID in next, node.conditionIDs do
        local condition = C_Traits.GetConditionInfo(activeConfigID, conditionID)
        if not condition.isMet then
            return false
        end
    end
    return true
end]]

local function GetSpellLinkFromEntryID(activeConfigId, entryId)
    local entryInfo = C_Traits.GetEntryInfo(activeConfigId, entryId)
    if entryInfo and entryInfo.definitionID then
        local definitionInfo = C_Traits.GetDefinitionInfo(entryInfo.definitionID)
        if definitionInfo and definitionInfo.spellID then
            local spellLink = C_Spell.GetSpellLink(definitionInfo.spellID)
            if spellLink then
                return spellLink
            end
        end
    end
    return ""
end

local function ConvertToImportLoadoutEntryInfo(treeId, loadoutContent)
    local results = {}
    local treeNodes = C_Traits.GetTreeNodes(treeId)
    local configId = C_ClassTalents.GetActiveConfigID()
    local count = 1;
    for i, treeNodeId in ipairs(treeNodes) do
        local indexInfo = loadoutContent[i]
        if indexInfo.isNodeSelected then
            local treeNode = C_Traits.GetNodeInfo(configId, treeNodeId);
            local isChoiceNode = treeNode.type == Enum.TraitNodeType.Selection or treeNode.type == Enum.TraitNodeType.SubTreeSelection;
            local choiceNodeSelection = indexInfo.isChoiceNode and indexInfo.choiceNodeSelection or nil;
            if indexInfo.isNodeSelected and isChoiceNode ~= indexInfo.isChoiceNode then
                print(string.format(HelpMePlay.ErrorMessages["IMPORT_STRING_CORRUPTED"], treeNodeId, specId))
                choiceNodeSelection = 1
            end
            local result = {}
            result.nodeID = treeNode.ID
            result.ranksPurchased = indexInfo.isPartiallyRanked and indexInfo.partialRanksPurchased or treeNode.maxRanks;
            result.selectionEntryID = indexInfo.isNodeSelected and isChoiceNode and treeNode.entryIDs[choiceNodeSelection] or nil
            results[count] = result
            count = count + 1
        end

    end

    return results
end

--[[ Disabled - 9/7/2024
local function GetLoadoutConfigID()
    local lastSelected = specId and C_ClassTalents.GetLastSelectedSavedConfigID(specId)
    local selectionID = ClassTalentFrame and ClassTalentFrame.TalentsTab and ClassTalentFrame.TalentsTab.LoadoutDropDown and ClassTalentFrame.TalentsTab.LoadoutDropDown.GetSelectionID and ClassTalentFrame.TalentsTab.LoadoutDropDown:GetSelectionID()

    return selectionID or lastSelected or C_ClassTalents.GetActiveConfigID() or nil
end]]

local function PurchaseLoadoutEntryInfo(activeConfigId, loadoutEntryInfo, treeId)
    --[[local wasSuccessful = false
    for _, talent in next, loadoutEntryInfo do
        local node = C_Traits.GetNodeInfo(activeConfigID, talent.nodeID)
        if node.type == 0 and AreAllTalentNodeConditionsMet(activeConfigID, node) then
            if node.canPurchaseRank then
                wasSuccessful = C_Traits.PurchaseRank(activeConfigID, talent.nodeID)
            end
        elseif node.type == 2 and AreAllTalentNodeConditionsMet(activeConfigID, node) then
            if node.canPurchaseRank then
                wasSuccessful = C_Traits.SetSelection(activeConfigID, talent.nodeID, talent.selectionEntryID)
            end
        end
        if wasSuccessful then
            HelpMePlay.Print(string.format("Learned %s!", GetSpellLinkFromEntryID(activeConfigID, talent.selectionEntryID)))
            wasSuccessful = false
        end
    end

    local treeCurrencyInfo = C_Traits.GetTreeCurrencyInfo(activeConfigID, treeID, false)
    if treeCurrencyInfo then
        if treeCurrencyInfo[1].quantity > 0 or treeCurrencyInfo[2].quantity > 0 then
            C_Timer.After(0.1, function() PurchaseLoadoutEntryInfo(activeConfigID, loadoutEntryInfo, treeID) end)
        else
            local loadoutConfigID = GetLoadoutConfigID()
            if loadoutConfigID then
                C_ClassTalents.CommitConfig(loadoutConfigID)
            end
        end
    end]]
    local removed = 0
    for index, talent in pairs(loadoutEntryInfo) do
        local success = false
        if talent.selectionEntryID then
            success = C_Traits.SetSelection(activeConfigId, talent.nodeID, talent.selectionEntryID)
        elseif talent.ranksPurchased then
            for rank = 1, talent.ranksPurchased do
                success = C_Traits.PurchaseRank(activeConfigId, talent.nodeID)
            end
        end
        if success then
            removed = removed + 1
            loadoutEntryInfo[index] = nil
            --HelpMePlay.Print(string.format(HelpMePlay.Tooltips["LEARNED_TALENT"], GetSpellLinkFromEntryID(activeConfigId, talent.selectionEntryID)))
        end
    end

    return removed
end

local function Import(activeConfigId, loadoutEntryInfo, treeId)
    --[[PurchaseLoadoutEntryInfo(activeConfigID, loadoutEntryInfo, treeID)

    return true]]
    C_Traits.ResetTree(activeConfigId, treeId)
    while true do
        local removed = PurchaseLoadoutEntryInfo(activeConfigId, loadoutEntryInfo, treeId)
        if removed == 0 then
            break
        end
    end

    return true
end

eventHandler:RegisterEvent("PLAYER_LOGIN")
eventHandler:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        classId = select(3, UnitClass("player"))
        specId = select(1, PlayerUtil.GetCurrentSpecID())
    end

    if event == "PLAYER_SPECIALIZATION_CHANGED" then
        specId = select(1, PlayerUtil.GetCurrentSpecID())
    end
end)

EventRegistry:RegisterCallback("PlayerSpellsFrame.TalentTab.Show", function()
    classTalentsButton = HelpMePlay.CreateWidget("IconButton", {
        name = string.format("%sClassTalentsButton", addonName),
        texture = 132222,
        parent = PlayerSpellsFrame.TalentsFrame.ApplyButton,
        anchor = "RIGHT",
        relativeAnchor = "LEFT",
        xOff = -20,
        yOff = 0,
        width = 24,
        height = 24,
        useFontString = false,
        fontStringText = ""
    })

    classTalentsButton:ClearAllPoints()
    classTalentsButton:SetPoint("RIGHT", classTalentsButton:GetParent(), "LEFT", -20, 0)

    classTalentsButton:SetScript("OnClick", function()
        if HelpMePlayDB["ClassTalents"][classId][specId] then
            -- Check if the imported string is from the current patch. If it's
            -- not, then we need to return an error and the player must import
            -- a new string.
            if not string.find(HelpMePlayDB["ClassTalents"][classId][specId].importPatch, (GetBuildInfo())) then
                ClassTalentImportExportMixin:ShowImportError(LOADOUT_ERROR_SERIALIZATION_VERSION_MISMATCH)
                return false
            end

            -- Use Blizzard's ExportUtil to make an import data stream from the
            -- exported string found online.
            local importStream = ExportUtil.MakeImportDataStream(HelpMePlayDB["ClassTalents"][classId][specId].importString)

            -- Using the new import data stream, determine the specID that is
            -- associated to the data stream. If it doesn't match the current
            -- class and specialization, then it can't be used.
            local headerValid, serializationVersion, loadoutSpecId, treeHash = ClassTalentImportExportMixin:ReadLoadoutHeader(importStream)

            if not headerValid then
                return false, LOADOUT_ERROR_BAD_STRING
            end

            if serializationVersion ~= LOADOUT_SERIALIZATION_VERSION then
                return false, LOADOUT_ERROR_SERIALIZATION_VERSION_MISMATCH
            end

            if loadoutSpecId ~= PlayerUtil.GetCurrentSpecID() then
                --ClassTalentImportExportMixin:ShowImportError(LOADOUT_ERROR_WRONG_SPEC)
                return false, LOADOUT_ERROR_WRONG_SPEC
            end

            -- Get the configID for the player's current specialization. This
            -- has nothing to do with an individual loadout's configID.
            local activeConfigId = C_ClassTalents.GetActiveConfigID()
            if not activeConfigId then return end

            -- Get the current tree's info.
            local treeId = C_ClassTalents.GetTraitTreeForSpec(specId)

            local loadoutContent = ClassTalentImportExportMixin:ReadLoadoutContent(importStream, treeId)
            local loadoutEntryInfo = ConvertToImportLoadoutEntryInfo(treeId, loadoutContent)

            Import(activeConfigId, loadoutEntryInfo, treeId)

            return true
        end
    end)
    classTalentsButton:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(classTalentsButton, "ANCHOR_CURSOR_RIGHT")
        GameTooltip:SetText("Class Talents")
        if HelpMePlayDB["ClassTalents"][classId][specId] and (HelpMePlayDB["ClassTalents"][classId][specId].importString ~= nil and HelpMePlayDB["ClassTalents"][classId][specId].importString ~= "") then
            --[[GameTooltip:AddLine(string.format("Click to learn a random talent from your loadout for |c%s%s %s|r.\n\n|cffFFD100Last Updated:|r %s (%s)",
            HelpMePlay.playerClassColor:GenerateHexColor(),
            HelpMePlay.playerSpecName,
            HelpMePlay.playerClassName,
            HelpMePlayDB["ClassTalents"][classID][specID].importDate,
            HelpMePlayDB["ClassTalents"][classID][specID].importPatch), 1, 1, 1, true)]]
            GameTooltip:AddLine(HelpMePlay.Tooltips["LEARN_RANDOM_TALENT"])
        else
            GameTooltip:AddLine(HelpMePlay.Tooltips["SPECIALIZATION_UNSUPPORTED"])
        end
        GameTooltip:Show()
    end)
    classTalentsButton:SetScript("OnLeave", HelpMePlay.Tooltip_OnLeave)

    if C_AddOns.IsAddOnLoaded("ZygorGuidesViewer") then
        classTalentsButton:SetPoint("RIGHT", PlayerSpellsFrame.TalentsFrame.ApplyButton, "LEFT", -60, 0)
    end
end)