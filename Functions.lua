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

-- A basic print function with string interpolation.
local function Print(text)
	print(string.format("%s", text))
end

local function StringToTable(str, delimiter)
	-- Create an empty table.
	--
	-- Split the string by the delimiter, then
	-- insert each value into the table, then
	-- return the table to the caller.
	local tbl = {}
	for match in (str .. delimiter):gmatch("(.-)" .. delimiter) do
		if tonumber(match) == nil then
			_, match = string.split(":", match)
			match = tonumber(match)
		end
		table.insert(tbl, match)
	end
	return tbl
end

-- Add the functions to the addon table.
addonTable.ShowTooltip 		= ShowTooltip
addonTable.HideTooltip 		= HideTooltip
addonTable.Print 			= Print
addonTable.StringToTable 	= StringToTable