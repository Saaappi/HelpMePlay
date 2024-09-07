local addonName, HelpMePlay = ...
local eventHandler = CreateFrame("Frame")
local classTalentsButton = {}
local classID = 0
local specID = 0

local function AreAllTalentNodeConditionsMet(activeConfigID, node)
    for _, conditionID in next, node.conditionIDs do
        local condition = C_Traits.GetConditionInfo(activeConfigID, conditionID)
        if not condition.isMet then
            return false
        end
    end
    return true
end

local function GetSpellLinkFromEntryID(activeConfigID, entryID)
    local entryInfo = C_Traits.GetEntryInfo(activeConfigID, entryID)
    if entryInfo then
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

local function GetLoadoutConfigID()
    local lastSelected = specID and C_ClassTalents.GetLastSelectedSavedConfigID(specID)
    local selectionID = ClassTalentFrame and ClassTalentFrame.TalentsTab and ClassTalentFrame.TalentsTab.LoadoutDropDown and ClassTalentFrame.TalentsTab.LoadoutDropDown.GetSelectionID and ClassTalentFrame.TalentsTab.LoadoutDropDown:GetSelectionID()

    return selectionID or lastSelected or C_ClassTalents.GetActiveConfigID() or nil
end

local function PurchaseLoadoutEntryInfo(activeConfigID, loadoutEntryInfo, treeID)
    local wasSuccessful = false
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
    end
end

local function Import(activeConfigID, loadoutEntryInfo, treeID)
    PurchaseLoadoutEntryInfo(activeConfigID, loadoutEntryInfo, treeID)

    return true
end

eventHandler:RegisterEvent("PLAYER_LOGIN")
eventHandler:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        classID = select(3, UnitClass("player"))
        specID = select(1, PlayerUtil.GetCurrentSpecID())
    end

    if event == "PLAYER_SPECIALIZATION_CHANGED" then
        specID = select(1, PlayerUtil.GetCurrentSpecID())
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
        if HelpMePlayDB["ClassTalents"][classID][specID] then
            -- Check if the imported string is from the current patch. If it's
            -- not, then we need to return an error and the player must import
            -- a new string.
            if not string.find(HelpMePlayDB["ClassTalents"][classID][specID].importPatch, (GetBuildInfo())) then
                ClassTalentImportExportMixin:ShowImportError(LOADOUT_ERROR_SERIALIZATION_VERSION_MISMATCH)
                return false
            end

            -- Use Blizzard's ExportUtil to make an import data stream from the
            -- exported string found online.
            local importStream = ExportUtil.MakeImportDataStream(HelpMePlayDB["ClassTalents"][classID][specID].importString)

            -- Using the new import data stream, determine the specID that is
            -- associated to the data stream. If it doesn't match the current
            -- class and specialization, then it can't be used.
            local loadoutSpecID = select(3, ClassTalentImportExportMixin:ReadLoadoutHeader(importStream))
            if loadoutSpecID ~= PlayerUtil.GetCurrentSpecID() then
                ClassTalentImportExportMixin:ShowImportError(LOADOUT_ERROR_WRONG_SPEC)
                return false
            end

            -- Get the configID for the player's current specialization. This
            -- has nothing to do with an individual loadout's configID.
            local activeConfigID = C_ClassTalents.GetActiveConfigID()
            if not activeConfigID then return end

            -- Get the current tree's info.
            local treeID = C_ClassTalents.GetTraitTreeForSpec(specID)

            local loadoutContent = ClassTalentImportExportMixin:ReadLoadoutContent(importStream, treeID)
            local loadoutEntryInfo = ClassTalentImportExportMixin:ConvertToImportLoadoutEntryInfo(activeConfigID, treeID, loadoutContent)

            Import(activeConfigID, loadoutEntryInfo, treeID)

            return true
        end
    end)
    classTalentsButton:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(classTalentsButton, "ANCHOR_CURSOR_RIGHT")
        GameTooltip:SetText("Class Talents")
        if HelpMePlayDB["ClassTalents"][classID][specID] and (HelpMePlayDB["ClassTalents"][classID][specID].importString ~= nil and HelpMePlayDB["ClassTalents"][classID][specID].importString ~= "") then
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