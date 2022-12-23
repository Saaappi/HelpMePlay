local addonName, addonTable = ...
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local zoneSelectionOptions = {
	name = L_GLOBALSTRINGS["Tabs.ZoneSelection"],
	handler = HelpMePlay,
	type = "group",
	args = {
		zoneSelection_BFA = {
			name = L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.BFA.Title"],
			order = 1,
			desc = L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.BFA.Desc"],
			type = "select",
			style = "dropdown",
			values = function()
				if UnitFactionGroup("player") == "Alliance" then
					values = {
						[0] = L_GLOBALSTRINGS["DropDowns.Disabled"],
						[47962] = "|T2065627:0|t " .. (C_Map.GetMapInfo(942)).name, -- Stormsong Valley
						[47960] = "|T2065630:0|t " .. (C_Map.GetMapInfo(895)).name, -- Tiragarde Sound
						[47961] = "|T2065567:0|t " .. (C_Map.GetMapInfo(896)).name, -- Drustvar
					}
				else
					values = {
						[0] = L_GLOBALSTRINGS["DropDowns.Disabled"],
						[47512] = "|T2032229:0|t " .. (C_Map.GetMapInfo(863)).name, -- Nazmir
						[47513] = "|T2065632:0|t " .. (C_Map.GetMapInfo(864)).name, -- Vol'dun
						[47514] = "|T2065640:0|t " .. (C_Map.GetMapInfo(862)).name, -- Zuldazar
					}
				end
				return values
			end,
			sorting = function()
				if UnitFactionGroup("player") == "Alliance" then
					values = {
						[1] = 0,
						[2] = 47961,
						[3] = 47960,
						[4] = 47962,
					}
				else
					values = {
						[1] = 0,
						[2] = 47512,
						[3] = 47513,
						[4] = 47514,
					}
				end
				return values
			end,
			get = function()
				local faction = UnitFactionGroup("player")
				if not HelpMePlayDB.ZoneId_BFA then
					HelpMePlayDB.ZoneId_BFA = {}
					HelpMePlayDB.ZoneId_BFA["Alliance"] = 0
					HelpMePlayDB.ZoneId_BFA["Horde"] = 0
				end
				return HelpMePlayDB.ZoneId_BFA[faction]
			end,
			set = function(_, zoneId)
				local faction = UnitFactionGroup("player")
				HelpMePlayDB.ZoneId_BFA[faction] = zoneId
			end,
		},
		zoneSelection_SL = {
			name = L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.SL.Title"],
			order = 2,
			desc = L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.SL.Desc"],
			type = "select",
			style = "dropdown",
			values = {
				[0] = L_GLOBALSTRINGS["DropDowns.Disabled"],
				[62275] = "|T3551337:0|t " .. (C_Map.GetMapInfo(1569)).name, -- Bastion
				[62277] = "|T3551336:0|t " .. (C_Map.GetMapInfo(1565)).name, -- Ardenweald
				[62278] = "|T3551338:0|t " .. (C_Map.GetMapInfo(1536)).name, -- Maldraxxus
				[62279] = "|T3551339:0|t " .. (C_Map.GetMapInfo(1525)).name, -- Revendreth
				[64846] = "|T3257863:0|t " .. (C_Map.GetMapInfo(1618)).name, -- Torghast
			},
			sorting = {
				[1] = 0,
				[2] = 62277,
				[3] = 62275,
				[4] = 62278,
				[5] = 62279,
				[6] = 64846,
			},
			get = function()
				if not HelpMePlayDB.ZoneId_SL then
					HelpMePlayDB.ZoneId_SL = 0
				end
				return HelpMePlayDB.ZoneId_SL
			end,
			set = function(_, zoneId) HelpMePlayDB.ZoneId_SL = zoneId end,
		},
		zoneSelection_DF = {
			name = L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.DF.Title"],
			order = 3,
			desc = L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.DF.Desc"],
			type = "select",
			style = "dropdown",
			values = {
				[0] = L_GLOBALSTRINGS["DropDowns.Disabled"],
				[72266] = "|T4672500:0|t " .. (C_Map.GetMapInfo(2022)).name, -- The Waking Shores
				[72267] = "|T4672498:0|t " .. (C_Map.GetMapInfo(2023)).name, -- Ohn'ahran Plains
				[72268] = "|T4672495:0|t " .. (C_Map.GetMapInfo(2024)).name, -- The Azure Span
				[72269] = "|T4672499:0|t " .. (C_Map.GetMapInfo(2025)).name, -- Thaldraszus
			},
			sorting = {
				[1] = 0,
				[2] = 72267,
				[3] = 72269,
				[4] = 72268,
				[5] = 72266,
			},
			get = function()
				if not HelpMePlayDB.ZoneID_DF then
					HelpMePlayDB.ZoneID_DF = 0
				end
				return HelpMePlayDB.ZoneID_DF
			end,
			set = function(_, zoneID) HelpMePlayDB.ZoneID_DF = zoneID end,
		},
	},
}
addonTable.zoneSelectionOptions = zoneSelectionOptions