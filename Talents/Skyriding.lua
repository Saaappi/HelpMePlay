local addonName, HelpMePlay = ...
local skyridingTalentsButton = CreateFrame("Button")

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
    local treeId = GenericTraitFrame:GetTalentTreeID() -- 672 (Skyriding)
    local configId = C_Traits.GetConfigIDByTreeID(treeId)

    C_Traits.ResetTree(configId, treeId)

    C_Timer.After(HelpMePlay.Constants["TIMER_DELAY"], function()
        for _, node in pairs(skyridingTalents) do
            local nodeInfo = C_Traits.GetNodeInfo(configId, node.nodeID)
            if #nodeInfo.entryIDs > 1 then
                C_Traits.SetSelection(configId, node.nodeID, node.entryID)
            else
                C_Traits.PurchaseRank(configId, node.nodeID)
            end
        end
        C_Traits.CommitConfig(configId)
    end)
end

EventRegistry:RegisterCallback("GenericTraitFrame.OnShow", function()
    if HelpMePlayDB["UseDynamicFlightButton"] == false then return end

	if GenericTraitFrame.Header.Title:GetText() == GENERIC_TRAIT_FRAME_DRAGONRIDING_TITLE then
        skyridingTalentsButton = HelpMePlay.CreateWidget("ActionButton", {
            name = string.format("%sSkyridingTalentButton", addonName),
            parent = GenericTraitFrame.Currency,
        })

        skyridingTalentsButton:ClearAllPoints()
        skyridingTalentsButton:SetPoint("TOPRIGHT", GenericTraitFrame.Currency, "BOTTOMRIGHT", 0, -15)

        skyridingTalentsButton.icon:SetTexture(4728198)

        skyridingTalentsButton:SetScale(0.6)

        skyridingTalentsButton:SetScript("OnClick", PurchaseTalents)
        skyridingTalentsButton:SetScript("OnEnter", function(self)
            HelpMePlay.Tooltip_OnEnter(self, "Skyriding", HelpMePlay.Tooltips["LEARN_SKYRIDING_TALENTS"])
        end)
        skyridingTalentsButton:SetScript("OnLeave", HelpMePlay.Tooltip_OnLeave)
	end
end)

EventRegistry:RegisterCallback("GenericTraitFrame.OnHide", function()
    skyridingTalentsButton:Hide()
end)