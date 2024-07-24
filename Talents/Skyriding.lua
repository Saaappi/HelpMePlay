local addonName, HelpMePlay = ...
local dynamicFlightTalentsButton = CreateFrame("Button")

local skyridingTalents = {
    { ["nodeID"] = 64066, ["entryID"] = 82387 }, 	-- Take to the Skies
    { ["nodeID"] = 64069, ["entryID"] = 82390 }, 	-- Dynamic Stretching
    { ["nodeID"] = 94579, ["entryID"] = 117167 }, 	-- Second Wind
    { ["nodeID"] = 64068, ["entryID"] = 82389 }, 	-- Thrill Chaser
    { ["nodeID"] = 64064, ["entryID"] = 82384 }, 	-- Restorative Travels
    { ["nodeID"] = 92672, ["entryID"] = 114806 }, 	-- Aerial Halt
    { ["nodeID"] = 92679, ["entryID"] = 114815 }, 	-- Ground Skimming
    { ["nodeID"] = 64061, ["entryID"] = 82380 }, 	-- Dragonriding Learner
    { ["nodeID"] = 64059, ["entryID"] = 82378 }, 	-- Beyond Infinity
    { ["nodeID"] = 64060, ["entryID"] = 82379 }, 	-- Yearning for the Sky
    { ["nodeID"] = 64058, ["entryID"] = 82377 }, 	-- At Home Aloft
    { ["nodeID"] = 100167, ["entryID"] = 123785 },  -- Riding Along Enabled
    { ["nodeID"] = 100168, ["entryID"] = 123787 }   -- Whirling Surge
}

local function PurchaseTalents()
    local treeID = GenericTraitFrame:GetTalentTreeID() -- 672 (Skyriding)
    local configID = C_Traits.GetConfigIDByTreeID(treeID)

    C_Traits.ResetTree(configID, treeID)

    C_Timer.After(HelpMePlay.Constants["TIMER_DELAY"], function()
        for _, node in pairs(skyridingTalents) do
            local nodeInfo = C_Traits.GetNodeInfo(configID, node.nodeID)
            if #nodeInfo.entryIDs > 1 then
                C_Traits.SetSelection(configID, node.nodeID, node.entryID)
            else
                C_Traits.PurchaseRank(configID, node.nodeID)
            end
        end
        C_Traits.CommitConfig(configID)
        --[[for talentButton in GenericTraitFrame:EnumerateAllTalentButtons() do
            local nodeInfo = talentButton:GetNodeInfo()
            if #nodeInfo.entryIDs > 1 then
                for _, entryID in next, nodeInfo.entryIDs do
                    local entryInfo = C_Traits.GetEntryInfo(configID, entryID)
                    local definitionInfo = C_Traits.GetDefinitionInfo(entryInfo.definitionID)
                    local spellName = C_Spell.GetSpellName(definitionInfo.spellID))
                    print(nodeInfo.ID .. "-" .. entryID .. " (" .. spellName .. ")")
                end
            else
                local entryInfo = C_Traits.GetEntryInfo(configID, nodeInfo.entryIDs[1])
                local definitionInfo = C_Traits.GetDefinitionInfo(entryInfo.definitionID)
                local spellName = C_Spell.GetSpellName(definitionInfo.spellID))
                print(nodeInfo.ID .. "-" .. nodeInfo.entryIDs[1] .. " (" .. spellName .. ")")
            end
        end]]
    end)
end

EventRegistry:RegisterCallback("GenericTraitFrame.OnShow", function()
    if HelpMePlayDB["UseDynamicFlightButton"] == false then return end

	if GenericTraitFrame.Header.Title:GetText() == GENERIC_TRAIT_FRAME_DRAGONRIDING_TITLE then
        dynamicFlightTalentsButton = HelpMePlay.CreateWidget("IconButton", {
            name = format("%sSkyridingTalentButton", addonName),
            texture = 4728198,
            parent = GenericTraitFrame.Currency,
            anchor = "TOPRIGHT",
            relativeAnchor = "BOTTOMRIGHT",
            xOff = 0,
            yOff = -15,
            width = 24,
            height = 24,
            useFontString = false,
            fontStringText = ""
        })

        dynamicFlightTalentsButton:ClearAllPoints()
        dynamicFlightTalentsButton:SetPoint("TOPRIGHT", GenericTraitFrame.Currency, "BOTTOMRIGHT", 0, -15)

        dynamicFlightTalentsButton:SetScript("OnClick", PurchaseTalents)
        dynamicFlightTalentsButton:SetScript("OnEnter", function(self)
            HelpMePlay.Tooltip_OnEnter(self, "Skyriding", "Click to learn your Skyriding talents.")
        end)
        dynamicFlightTalentsButton:SetScript("OnLeave", HelpMePlay.Tooltip_OnLeave)
	end
end)

EventRegistry:RegisterCallback("GenericTraitFrame.OnHide", function()
    dynamicFlightTalentsButton:Hide()
end)