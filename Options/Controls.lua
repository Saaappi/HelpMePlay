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
		talentImportButton = {
			name = "Import",
			order = 4,
			desc = function()
				local className = select(1, GetClassInfo(HelpMePlayDB.classID)); local upperClassName = string.upper(className:gsub("%s+", ""))
				local classColor = "|c" .. select(4, GetClassColor(upperClassName))
				local _, specName = GetSpecializationInfoForSpecID(HelpMePlayDB.specID)
				return "If you want to use a custom talent loadout for " .. classColor .. specName .. " " .. className .. "|r, then click here.\n\n" ..
				"Paste your import string from an online talent calculator or the in-game talent interface.\n\n" ..
				"|cffFFD100NOTE|r: Importing a custom loadout will override the loadout provided by HelpMePlay. To revert this behavior, click the button and select |cffFFD100Delete|r."
			end,
			type = "execute",
			func = function(_, _)
				StaticPopupDialogs["HELPMEPLAY_TALENT_IMPORT"] = {
					text = "Paste the talent share code into the field below and select |cffFFD100OK|r.\n\n" ..
					"If you would like to use the talent loadout provided by HelpMePlay, then select |cffFFD100Delete|r.\n\n" ..
					"If you don't want to continue, please select |cffFFD100Cancel|r.",
					button1 = "OK",
					button2 = "Delete",
					button3 = CANCEL,
					-- This is confusing, but I don't want Cancel
					-- as the second button. Thus, OnAlt is used
					-- for cancels and OnCancel is used for deleting
					-- talent loadouts for the class/spec.
					OnButton1 = function(self, data)
						local _, _, classID = UnitClass("player")
						local currentSpecID = PlayerUtil.GetCurrentSpecID()
						local importString = self.editBox:GetText()
						
						if ClassTalentImportExportMixin then
							local importStream = ExportUtil.MakeImportDataStream(importString)
							local headerValid, serializationVersion, specID, treeHash = ClassTalentImportExportMixin:ReadLoadoutHeader(importStream)
							
							-- If the import string isn't valid, then return an error.
							if (not headerValid) then
								ClassTalentImportExportMixin:ShowImportError(LOADOUT_ERROR_BAD_STRING)
								return false
							end
							
							-- If the import string doesn't match the player's current class/spec, then
							-- return an error.
							--[[if (specID ~= currentSpecID) then
								ClassTalentImportExportMixin:ShowImportError(LOADOUT_ERROR_WRONG_SPEC)
								return false
							end]]
							
							-- If the import stream is a loadout from a previous patch, then return
							-- an error.
							if LOADOUT_SERIALIZATION_VERSION ~= nil and (serializationVersion ~= LOADOUT_SERIALIZATION_VERSION) then
								ClassTalentImportExportMixin:ShowImportError(LOADOUT_ERROR_SERIALIZATION_VERSION_MISMATCH)
								return false
							end
							
							-- If the PlayerTalents table is nil, then populate it with some empty
							-- data.
							if HelpMePlayDB.PlayerTalents[classID] == nil then
								HelpMePlayDB.PlayerTalents[classID] = {}
							end
							if HelpMePlayDB.PlayerTalents[classID][specID] == nil then
								HelpMePlayDB.PlayerTalents[classID][specID] = ""
							end
							
							-- The import string should be valid and all is right in the world, so put
							-- the import string into the database.
							HelpMePlayDB.PlayerTalents[classID][specID] = importString
						else
							print(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": Please open the talent interface once before trying to import a custom loadout.")
							return false
						end
					end,
					OnCancel = function(self, data)
						local _, _, classID = UnitClass("player")
						local currentSpecID = PlayerUtil.GetCurrentSpecID()
						
						if HelpMePlayDB.PlayerTalents[classID] ~= nil then
							if HelpMePlayDB.PlayerTalents[classID][currentSpecID] ~= "" then
								HelpMePlayDB.PlayerTalents[classID][currentSpecID] = ""
							end
						end
					end,
					OnAlt = function() end, -- Cancel Button
					showAlert = true,
					hasEditBox = true,
					whileDead = false,
					hideOnEscape = true,
					preferredIndex = 3,
				}
				StaticPopup_Show("HELPMEPLAY_TALENT_IMPORT")
			end,
		},
	},
}
addonTable.controlOptions = controlOptions