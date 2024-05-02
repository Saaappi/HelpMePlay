local addonName, addon = ...
local eventHandler = CreateFrame("Frame")
local classTalentsButton = {}
local classID = 0
local specID = 0

local function GetSpellLinkFromEntryID(activeConfigID, entryID)
    local entryInfo = C_Traits.GetEntryInfo(activeConfigID, entryID)
    if entryInfo then
        local definitionInfo = C_Traits.GetDefinitionInfo(entryInfo.definitionID)
        if definitionInfo and definitionInfo.spellID then
            local spellLink = GetSpellLink(definitionInfo.spellID)
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
    local node = {}
    for _, talent in pairs(loadoutEntryInfo) do
        node = C_Traits.GetNodeInfo(activeConfigID, talent.nodeID)
        if node.type == 0 and node.canPurchaseRank then
            wasSuccessful = C_Traits.PurchaseRank(activeConfigID, talent.nodeID)
        elseif node.type == 2 and node.canPurchaseRank then
            wasSuccessful = C_Traits.SetSelection(activeConfigID, talent.nodeID, talent.selectionEntryID)
        end
        if wasSuccessful then
            HelpMePlay.Print(format("Learned %s!", GetSpellLinkFromEntryID(activeConfigID, node.entryIDs[1])))
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

EventRegistry:RegisterCallback("TalentFrame.TalentTab.Show", function()
    classTalentsButton = {
        name = addonName .. "ClassTalentsButton",
        texture = 132222,
        parent = ClassTalentFrame.TalentsTab.ApplyButton,
        anchor = "RIGHT",
        relativeAnchor = "LEFT",
        oX = -20,
        oY = 0,
        width = 24,
        height = 24,
        onEnter = function()
            GameTooltip:SetOwner(classTalentsButton, "ANCHOR_CURSOR_RIGHT")
            GameTooltip:SetText("Class Talents")
            if HelpMePlayDB["ClassTalents"][classID][specID] and (HelpMePlayDB["ClassTalents"][classID][specID].importString ~= nil and HelpMePlayDB["ClassTalents"][classID][specID].importString ~= "") then
                GameTooltip:AddLine(format("Click to learn a random talent for |c%s%s %s|r.", addon.playerClassColor:GenerateHexColor(), addon.playerSpecName, addon.playerClassName), 1, 1, 1, true)
            else
                GameTooltip:AddLine("|cff56585DYour current specialization is unsupported.|r")
            end
            GameTooltip:Show()
        end,
        onClick = function()
            if HelpMePlayDB["ClassTalents"][classID][specID] then
                -- Check if the imported string is from the current patch. If it's
                -- not, then we need to return an error and the player must import
                -- a new string.
                if not string.find(HelpMePlayDB["ClassTalents"][classID][specID].importDate, (GetBuildInfo())) then
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
        end
    }
    setmetatable(classTalentsButton, { __index = HelpMePlay.Button })
    classTalentsButton = classTalentsButton:IconButtonSelfTooltip()
end)