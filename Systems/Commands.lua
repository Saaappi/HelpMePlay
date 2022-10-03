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
	if tonumber(gossip) then
		-- The player passed a gossip index
		-- to the command, so let's determine
		-- the appropriate text to insert to
		-- the table.
		local numOptions = C_GossipInfo.GetNumOptions()
		if numOptions > 0 and (tonumber(gossip) > 0 and tonumber(gossip) <= numOptions) then
			local options = C_GossipInfo.GetOptions()
			for i = 1, #options do
				if i == tonumber(gossip) then
					gossip = options[i].name
					break
				end
			end
		end
	end
	
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
				addonTable.Print(string.format(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": " .. L_GLOBALSTRINGS["Text.Output.DialogRemoved"], gossip))
			else
				table.insert(HelpMePlayPlayerDialogDB[npcId]["g"], gossip)
			end
		end
	else
		local index = ContainsByID(HelpMePlayPlayerDialogDB, gossip)
		if index ~= 0 then
			table.remove(HelpMePlayPlayerDialogDB, index)
			addonTable.Print(string.format(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": " .. L_GLOBALSTRINGS["Text.Output.DialogRemoved"], gossip))
		else
			table.insert(HelpMePlayPlayerDialogDB[0]["g"], gossip)
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
					addonTable.Print(string.format(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": " .. L_GLOBALSTRINGS["Text.Output.DialogRemoved"], gossip))
				else
					table.insert(HelpMePlayPlayerDialogDB[npcId]["c"], gossip)
				end
			end
		end
	else
		local index = ContainsByID(HelpMePlayPlayerDialogDB, gossip)
		if index ~= 0 then
			table.remove(HelpMePlayPlayerDialogDB, index)
			addonTable.Print(string.format(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": " .. L_GLOBALSTRINGS["Text.Output.DialogRemoved"], gossip))
		else
			table.insert(HelpMePlayPlayerDialogDB, gossip)
		end
	end
end

function HelpMePlay:SlashCommandHandler(cmd)
	local cmd, arg1, arg2 = string.split(" ", cmd)
	if not cmd or cmd == "" then
		if InterfaceOptionsFrame:IsVisible() then
			InterfaceOptionsFrameOkay:Click()
		else
			InterfaceAddOnsList_Update()
			InterfaceOptionsFrame_OpenToCategory(addonTable.mainOptions)
		end
	elseif cmd == "1" then
		if InterfaceOptionsFrame:IsVisible() then
			InterfaceOptionsFrameOkay:Click()
		else
			InterfaceAddOnsList_Update()
			InterfaceOptionsFrame_OpenToCategory(addonTable.generalOptions)
		end
	elseif cmd == "2" then
		if InterfaceOptionsFrame:IsVisible() then
			InterfaceOptionsFrameOkay:Click()
		else
			InterfaceAddOnsList_Update()
			InterfaceOptionsFrame_OpenToCategory(addonTable.featuresOptions)
		end
	elseif cmd == "3" then
		if InterfaceOptionsFrame:IsVisible() then
			InterfaceOptionsFrameOkay:Click()
		else
			InterfaceAddOnsList_Update()
			InterfaceOptionsFrame_OpenToCategory(addonTable.questOptions)
		end
	elseif cmd == "4" then
		if InterfaceOptionsFrame:IsVisible() then
			InterfaceOptionsFrameOkay:Click()
		else
			InterfaceAddOnsList_Update()
			InterfaceOptionsFrame_OpenToCategory(addonTable.expansionFeatures)
		end
	elseif cmd == "5" then
		if InterfaceOptionsFrame:IsVisible() then
			InterfaceOptionsFrameOkay:Click()
		else
			InterfaceAddOnsList_Update()
			InterfaceOptionsFrame_OpenToCategory(addonTable.junkerOptions)
		end
	elseif cmd == L_GLOBALSTRINGS["Command.Dialog"] and arg1 ~= nil then
		Dialog(arg1)
	elseif cmd == L_GLOBALSTRINGS["Command.Confirm"] and arg1 ~= nil then
		Confirm(arg1)
	elseif cmd == L_GLOBALSTRINGS["Command.Quest"] and arg1 ~= nil then
		-- A shorthand way to check if a given quest has
		-- been completed by the current player.
		--
		-- The argument must be a number, else silently
		-- fail out.
		if tonumber(arg1) then
			self:Print(tostring(C_QuestLog.IsQuestFlaggedCompleted(arg1)))
		end
	elseif cmd == L_GLOBALSTRINGS["Command.Ignore"] and arg1 ~= nil and arg2 ~= nil then
		if arg1 == L_GLOBALSTRINGS["Command.Subcommand.Ignore.NPC"] then
			local npcId = tonumber(arg2)
			if npcId then
				if HelpMePlayIgnoredCreaturesDB[npcId] == nil then
					HelpMePlayIgnoredCreaturesDB[npcId] = true
				else
					HelpMePlayIgnoredCreaturesDB[npcId] = nil
				end
			else
				if UnitIsPlayer("target") == false then
					local unitGUID = UnitGUID("target")
					if unitGUID then
						local _, _, _, _, _, npcId = strsplit("-", unitGUID); npcId = tonumber(npcId)
						if HelpMePlayIgnoredCreaturesDB[npcId] == nil then
							HelpMePlayIgnoredCreaturesDB[npcId] = true
						else
							HelpMePlayIgnoredCreaturesDB[npcId] = nil
						end
					end
				end
			end
		elseif arg1 == L_GLOBALSTRINGS["Command.Quest"] then
			local questId = tonumber(arg2)
			if questId then
				if HelpMePlayIgnoredQuestsDB[questId] == nil then
					HelpMePlayIgnoredQuestsDB[questId] = true
				else
					HelpMePlayIgnoredQuestsDB[questId] = nil
				end
			end
		end
	elseif cmd == L_GLOBALSTRINGS["Command.Junker"] and arg1 ~= nil and arg2 ~= nil then
		local count = 0
		arg2 = addonTable.StringToTable(arg2, " ")
		for _, item in ipairs(arg2) do
			if arg1 == L_GLOBALSTRINGS["Command.Subcommand.Junker.Add"] then
				if HelpMePlayJunkerDB[item] then
					HelpMePlayJunkerDB[item] = nil
				else
					HelpMePlayJunkerBlacklistDB[item] = nil
					HelpMePlayJunkerDB[item] = true
					count = count + 1
				end
			elseif arg1 == L_GLOBALSTRINGS["Command.Subcommand.Junker.Blacklist"] then
				if HelpMePlayJunkerBlacklistDB[item] then
					HelpMePlayJunkerBlacklistDB[item] = nil
				else
					HelpMePlayJunkerDB[item] = nil
					HelpMePlayJunkerBlacklistDB[item] = true
					count = count + 1
				end
			end
		end
		self:Print(string.format(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": " .. L_GLOBALSTRINGS["Imported To Junker From List Text"], count))
	elseif cmd == L_GLOBALSTRINGS["Help Command"] then
		self:Print(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ":" .. "\n" .. L_GLOBALSTRINGS["Confirm Command"] .. "\n" .. L_GLOBALSTRINGS["Dialog Command"] .. "\n" .. L_GLOBALSTRINGS["Help Command"] .. "\n" .. L_GLOBALSTRINGS["Ignore Command"] .. "\n" .. L_GLOBALSTRINGS["Quest Command"])
	end
end