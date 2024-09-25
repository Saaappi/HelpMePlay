local addonName, HelpMePlay = ...
local genericTalentsButton = CreateFrame("Button")

local function PurchaseTalents(treeId)
    if not treeId then return end
    local configId = C_Traits.GetConfigIDByTreeID(treeId)
    if not configId then return end

    C_Traits.ResetTree(configId, treeId)

    C_Timer.After(0.1, function()
        for _, node in pairs(HelpMePlay.GenericTalentsFrame[treeId].talents) do
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
    if HelpMePlayDB["UseGenericTalentsButton"] == false then return end

    local treeId = GenericTraitFrame:GetTalentTreeID()
    if treeId and HelpMePlay.GenericTalentsFrame[treeId] then
        genericTalentsButton = HelpMePlay.CreateWidget("ActionButton", {
            name = string.format("%sGenericTalentsButton", addonName),
            parent = GenericTraitFrame.Currency,
        })

        genericTalentsButton:ClearAllPoints()
        genericTalentsButton:SetPoint("TOPRIGHT", GenericTraitFrame.Currency, "BOTTOMRIGHT", 0, -15)

        genericTalentsButton.icon:SetTexture(HelpMePlay.GenericTalentsFrame[treeId].texture)

        genericTalentsButton:SetScale(0.6)

        genericTalentsButton:SetScript("OnClick", function() PurchaseTalents(treeId) end)
        genericTalentsButton:SetScript("OnEnter", function(self)
            HelpMePlay.Tooltip_OnEnter(self, "Generic Talents", string.format(HelpMePlay.Tooltips["LEARN_GENERIC_TALENTS"], GenericTraitFrame.Header.Title:GetText()))
        end)
        genericTalentsButton:SetScript("OnLeave", HelpMePlay.Tooltip_OnLeave)
    end
end)

EventRegistry:RegisterCallback("GenericTraitFrame.OnHide", function()
    genericTalentsButton:Hide()
end)