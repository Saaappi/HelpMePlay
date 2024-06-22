local addonName, addon = ...

addon.Tooltip_OnEnter = function(self, header, text)
    GameTooltip:SetOwner(self, "ANCHOR_CURSOR_RIGHT")
    GameTooltip:SetText(header)
    GameTooltip:AddLine(text, nil, nil, nil, true)
    GameTooltip:Show()
end

addon.Tooltip_OnLeave = function()
    GameTooltip:Hide()
end