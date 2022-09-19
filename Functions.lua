local addonName, addonTable = ...
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

-- Display a tooltip.
local function ShowTooltip(self, text)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	GameTooltip:SetText(text)
	GameTooltip:Show()
end

-- Hide a tooltip.
local function HideTooltip(self)
	if GameTooltip:GetOwner() == self then
		GameTooltip:Hide()
	end
end

-- Add the functions to the addon table.
addonTable.ShowTooltip = ShowTooltip
addonTable.HideTooltip = HideTooltip