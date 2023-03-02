local addonName, addonTable = ...
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local soundsOptions = {
	name = "Sounds",
	handler = HelpMePlay,
	type = "group",
	args = {
		enable = {
			name = "Enable",
			order = 1,
			desc = "Toggle to enable the ability for the addon to mute sounds.",
			type = "toggle",
			get = function(_) return HelpMePlayDB.SoundsEnabled end,
			set = function(_, val) HelpMePlayDB.SoundsEnabled = val end,
		},
		soundsHeader = {
			name = "Sounds",
			order = 2,
			type = "header",
		},
		soundInput = {
			name = "Sounds",
			order = 3,
			desc = "Input a list of sound IDs for the addon to mute. Each sound ID should be on its own line.\n\n|cffFFD100NOTE|r: You must reload after adding the sound IDs.",
			type = "input",
			multiline = true,
			get = function(_) return HelpMePlayDB.Sounds end,
			set = function(_, val)
				local sounds = {}
				for soundID in val:gmatch("[^\r\n]+") do
					table.insert(sounds, soundID)
				end
				for _, soundID in ipairs(sounds) do
					if tonumber(soundID) then
						soundID = tonumber(soundID)
						if HelpMePlayDB.Sounds[soundID] then
							HelpMePlayDB.Sounds[soundID] = nil
							UnmuteSoundFile(soundID)
						else
							HelpMePlayDB.Sounds[soundID] = true
						end
					else
						print(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": |cffFFD100" .. soundID .. "|r isn't a valid sound ID.")
					end
				end
			end,
		},
	},
}
addonTable.soundsOptions = soundsOptions