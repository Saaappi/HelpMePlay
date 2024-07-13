local addonName, HelpMePlay = ...

HelpMePlay.Tooltip_OnEnter = function(self, header, text)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText(header, nil, nil, nil, 1, true)
    GameTooltip:AddLine(text, 1, 1, 1, true)
    GameTooltip:Show()
end

HelpMePlay.Tooltip_OnLeave = function()
    GameTooltip:Hide()
end