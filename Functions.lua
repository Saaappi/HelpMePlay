local addonName, addonTable = ...
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

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

local function StartsWith(text, prefix)
	return text:find(prefix, 1, true) == 1
end

-- Add the functions to the addon table.
addonTable.Print 			= Print
addonTable.StringToTable 	= StringToTable
addonTable.StartsWith 		= StartsWith