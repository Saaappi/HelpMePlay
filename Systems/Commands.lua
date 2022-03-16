local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

-- Search a number-indexed table for a
-- specific text.
--
-- Return the index or 0.
--
-- If the table passed to the function
-- is nil, then instantiate an empty
-- table.
local function ContainsByID(tbl, str)
	if tbl == nil then
		tbl = {}
	end
	for index, text in ipairs(tbl) do
		if string.find(string.lower(text), string.lower(str)) then
			return index
		end
	end
	return 0
end

local function Dialog(gossip)
	local guid = UnitGUID("target")
	if guid then
		local _, _, _, _, _, npcId = string.split("-", guid); npcId = tonumber(npcId)
		if not HelpMePlayPlayerDialogDB[npcId] then
			HelpMePlayPlayerDialogDB[npcId] = {}
		end
		if not HelpMePlayPlayerDialogDB[npcId]["g"] then
			HelpMePlayPlayerDialogDB[npcId]["g"] = {}
			table.insert(HelpMePlayPlayerDialogDB[npcId]["g"], gossip)
		else
			local index = ContainsByID(HelpMePlayPlayerDialogDB[npcId]["g"], gossip)
			if index ~= 0 then
				table.remove(HelpMePlayPlayerDialogDB[npcId]["g"], index)
				if HelpMePlayOptionsDB.Logging then
					print(string.format(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. L_GLOBALSTRINGS["Dialog Removed"], gossip))
				end
			else
				table.insert(HelpMePlayPlayerDialogDB[npcId]["g"], gossip)
			end
		end
	else
		local index = ContainsByID(HelpMePlayPlayerDialogDB, gossip)
		if index ~= 0 then
			table.remove(HelpMePlayPlayerDialogDB, index)
			if HelpMePlayOptionsDB.Logging then
				print(string.format(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. L_GLOBALSTRINGS["Dialog Removed"], gossip))
			end
		else
			table.insert(HelpMePlayPlayerDialogDB, gossip)
		end
	end
end

local function Confirm(gossip)
	local guid = UnitGUID("target")
	if guid then
		local _, _, _, _, _, npcId = string.split("-", guid); npcId = tonumber(npcId)
		if not HelpMePlayPlayerDialogDB[npcId] then
			HelpMePlayPlayerDialogDB[npcId] = {}
		end
		if not HelpMePlayPlayerDialogDB[npcId]["c"] then
			HelpMePlayPlayerDialogDB[npcId]["c"] = {}
			table.insert(HelpMePlayPlayerDialogDB[npcId]["c"], gossip)
		else
			if HelpMePlayPlayerDialogDB[npcId]["c"] then
				local index = ContainsByID(HelpMePlayPlayerDialogDB[npcId]["c"], gossip)
				if index ~= 0 then
					table.remove(HelpMePlayPlayerDialogDB[npcId]["c"], index)
					if HelpMePlayOptionsDB.Logging then
						print(string.format(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. L_GLOBALSTRINGS["Dialog Removed"], gossip))
					end
				else
					table.insert(HelpMePlayPlayerDialogDB[npcId]["c"], gossip)
				end
			end
		end
	else
		local index = ContainsByID(HelpMePlayPlayerDialogDB, gossip)
		if index ~= 0 then
			table.remove(HelpMePlayPlayerDialogDB, index)
			if HelpMePlayOptionsDB.Logging then
				print(string.format(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. L_GLOBALSTRINGS["Dialog Removed"], gossip))
			end
		else
			table.insert(HelpMePlayPlayerDialogDB, gossip)
		end
	end
end

SLASH_HelpMePlay1 = L_GLOBALSTRINGS["Slash HMP"]
SlashCmdList["HelpMePlay"] = function(command, editbox)
	local _, _, command, arguments = string.find(command, "%s?(%w+)%s?(.*)") -- Using pattern matching the addon will be able to interpret subcommands.
	if not command or command == "" then
		if HMPOptionsFrame:IsVisible() then
			HMPOptionsFrame:Hide()
		else
			HelpMePlayLoadSettings()
		end
	elseif command == L_GLOBALSTRINGS["Dialog Command"] and arguments ~= "" then
		Dialog(arguments)
	elseif command == L_GLOBALSTRINGS["Confirm Command"] and arguments ~= "" then
		Confirm(arguments)
	elseif command == L_GLOBALSTRINGS["Quest Command"] or command == L_GLOBALSTRINGS["Q"] and arguments ~= "" then
		-- A shorthand way to check if a given quest has
		-- been completed by the current player.
		--
		-- The argument must be a number, else silently
		-- fail out.
		if tonumber(arguments) then
			if HelpMePlayOptionsDB.Logging then
				print(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. tostring(C_QuestLog.IsQuestFlaggedCompleted(arguments)))
			end
		end
	else
		print(L_GLOBALSTRINGS["Colored Addon Name"] .. ":" .. "\n" .. L_GLOBALSTRINGS["Confirm Command"] .. "\n" .. L_GLOBALSTRINGS["Dialog Command"] .. "\n" .. L_GLOBALSTRINGS["Quest Command"])
	end
end