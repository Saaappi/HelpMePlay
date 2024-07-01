local addonName, addon = ...
local dynamicFlightTalentsButton = CreateFrame("Button")

local function PurchaseTalents()
    local treeID = 672
    local configID = C_Traits.GetConfigIDByTreeID(treeID)

    C_Traits.ResetTree(configID, treeID)

    C_Timer.After(addon.Constants["TIMER_DELAY"], function()
        for _, node in pairs(addon.DynamicFlightTalents) do
            local nodeInfo = C_Traits.GetNodeInfo(configID, node.nodeID)
            if #nodeInfo.entryIDs > 1 then
                C_Traits.SetSelection(configID, node.nodeID, node.entryID)
            else
                C_Traits.PurchaseRank(configID, node.nodeID)
            end
        end
        C_Traits.CommitConfig(configID)
    end)
end

EventRegistry:RegisterCallback("GenericTraitFrame.OnShow", function()
    if HelpMePlayDB["UseDynamicFlightButton"] == false then return end

	if GenericTraitFrame.Header.Title:GetText() == "Dragonriding" then
        dynamicFlightTalentsButton = addon.CreateWidget("IconButton", {
            name = format("%sDynamicFlightTalentsButton", addonName),
            texture = 4728198,
            parent = GenericTraitFrame.Currency,
            anchor = "TOPRIGHT",
            relativeAnchor = "BOTTOMRIGHT",
            oX = 0,
            oY = -15,
            width = 24,
            height = 24
        })

        dynamicFlightTalentsButton:SetScript("OnClick", PurchaseTalents())
        dynamicFlightTalentsButton:SetScript("OnEnter", function(self)
            addon.Tooltip_OnEnter(self, "Dynamic Flight Talents", "Click to automatically learn your Dynamic Flight talents.")
        end)
        dynamicFlightTalentsButton:SetScript("OnLeave", addon.Tooltip_OnLeave())
	end
end)

EventRegistry:RegisterCallback("GenericTraitFrame.OnHide", function()
    dynamicFlightTalentsButton:Hide()
end)