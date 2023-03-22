local addonName, addonTable = ...
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local controlOptions = {
	name = "Controls",
	handler = HelpMePlay,
	type = "group",
	args = {
		playerTalentsHeader = {
			name = "Player Talents",
			order = 1,
			type = "header",
		},
		playerClassDropdown = {
			name = "Class",
			order = 2,
			desc = "",
			type = "select",
			style = "dropdown",
			values = {
				[1] = CreateAtlasMarkup("classicon-warrior") .. " " .. "Warrior",
				[2] = CreateAtlasMarkup("classicon-paladin") .. " " .. "Paladin",
				[3] = CreateAtlasMarkup("classicon-hunter") .. " " .. "Hunter",
				[4] = CreateAtlasMarkup("classicon-rogue") .. " " .. "Rogue",
				[5] = CreateAtlasMarkup("classicon-priest") .. " " .. "Priest",
				[6] = CreateAtlasMarkup("classicon-deathknight") .. " " .. "Death Knight",
				[7] = CreateAtlasMarkup("classicon-shaman") .. " " .. "Shaman",
				[8] = CreateAtlasMarkup("classicon-mage") .. " " .. "Mage",
				[9] = CreateAtlasMarkup("classicon-warlock") .. " " .. "Warlock",
				[10] = CreateAtlasMarkup("classicon-monk") .. " " .. "Monk",
				[11] = CreateAtlasMarkup("classicon-druid") .. " " .. "Druid",
				[12] = CreateAtlasMarkup("classicon-demonhunter") .. " " .. "Demon Hunter",
				[13] = CreateAtlasMarkup("classicon-evoker") .. " " .. "Evoker",
			},
			sorting = {
				[1] = 6, 	-- DK
				[2] = 12, 	-- DH
				[3] = 11, 	-- Druid
				[4] = 13, 	-- Evoker
				[5] = 3, 	-- Hunter
				[6] = 8, 	-- Mage
				[7] = 10, 	-- Monk
				[8] = 2, 	-- Paladin
				[9] = 5, 	-- Priest
				[10] = 4, 	-- Rogue
				[11] = 7, 	-- Shaman
				[12] = 9, 	-- Warlock
				[13] = 1, 	-- Warrior
			},
			get = function()
				-- If not set, then set the default class to Warrior so the
				-- specialization dropdown can be populated.
				if not HelpMePlayDB.classID then
					HelpMePlayDB.classID = 1
				end
				return HelpMePlayDB.classID
			end,
			set = function(_, classID) HelpMePlayDB.classID = classID end,
		},
		classSpecializationDropdown = {
			name = "Specialization",
			order = 3,
			desc = "",
			type = "select",
			style = "dropdown",
			values = function()
				local specializations = {}
				local numSpecs = GetNumSpecializationsForClassID(HelpMePlayDB.classID)
				for specIndex = 1, numSpecs do
					local specID, specName, _, specIcon = GetSpecializationInfoForClassID(HelpMePlayDB.classID, specIndex)
					specializations[specID] = "|T" .. specIcon .. ":0|t" .. " " .. specName
				end
				return specializations
			end,
			get = function()
				if not HelpMePlayDB.specID then
					HelpMePlayDB.specID = 0
				end
				return HelpMePlayDB.specID
			end,
			set = function(_, specID) HelpMePlayDB.specID = specID end,
		},
	},
}
addonTable.controlOptions = controlOptions