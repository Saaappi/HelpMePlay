local addonName, addonTable = ...
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local icon = ""

function HelpMePlay:MinimapIcon(bool)
	HelpMePlayDB.MinimapIconEnabled = bool
	if bool then
		if icon ~= "" then
			icon:Show(addonName)
		else
			icon = LibStub("LibDBIcon-1.0")
			-- Create a Lib DB first to hold all the
			-- information for the minimap icon.
			local iconLDB = LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject(addonName, {
				type = "launcher",
				icon = "236688", -- 100 Exalted Reputations (Achievement)
				OnTooltipShow = function(tooltip)
					tooltip:SetText(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. " |cffFFFFFF" .. GetAddOnMetadata(addonName, "Version") .. "|r")
					tooltip:AddLine(L_GLOBALSTRINGS["Minimap.UI.Button.SubText"])
					tooltip:Show()
				end,
				OnClick = function() HelpMePlay:SlashCommandHandler("") end,
			})
			
			-- Register the minimap button with the
			-- LDB.
			icon:Register(addonName, iconLDB, HelpMePlayDB)
			icon:Show(addonName)
		end
	else
		if icon ~= "" then
			icon:Hide(addonName)
		end
	end
end

local generalOptions = {
	name = L_GLOBALSTRINGS["Tabs.General"],
	handler = HelpMePlay,
	type = "group",
	args = {
		toggleHeader = {
			name = L_GLOBALSTRINGS["Header.Toggles"],
			order = 0,
			type = "header",
		},
		enable = {
			name = L_GLOBALSTRINGS["General.Toggle.Enable"],
			order = 1,
			desc = L_GLOBALSTRINGS["General.Toggle.EnableDesc"],
			type = "toggle",
			get = function(_) return HelpMePlayDB.Enabled end,
			set = function(_, val) HelpMePlayDB.Enabled = val end,
		},
		minimapIcon = {
			name = L_GLOBALSTRINGS["General.Toggle.MinimapIcon"],
			order = 2,
			desc = L_GLOBALSTRINGS["General.Toggle.MinimapIconDesc"],
			type = "toggle",
			get = function(_) return HelpMePlayDB.MinimapIconEnabled end,
			set = function(_, val) HelpMePlay:MinimapIcon(val) end,
		},
		devMode = {
			name = L_GLOBALSTRINGS["General.Toggle.DevMode"],
			order = 3,
			desc = L_GLOBALSTRINGS["General.Toggle.DevModeDesc"],
			type = "toggle",
			get = function(_) return HelpMePlayDB.DevModeEnabled end,
			set = function(_, val) HelpMePlayDB.DevModeEnabled = val end,
		},
		buttonHeader = {
			name = L_GLOBALSTRINGS["Header.Buttons"],
			order = 10,
			type = "header",
		},
		transmogButton = {
			name = L_GLOBALSTRINGS["General.Toggle.TransmogButton"],
			order = 11,
			desc = L_GLOBALSTRINGS["General.Toggle.TransmogButtonDesc"],
			type = "toggle",
			get = function(_)
				if not HelpMePlayDB.TransmogButtonEnabled then
					HelpMePlayDB.TransmogButtonEnabled = false
				end
				return HelpMePlayDB.TransmogButtonEnabled
			end,
			set = function(_, val) HelpMePlayDB.TransmogButtonEnabled = val end,
		},
		soulbindButton = {
			name = L_GLOBALSTRINGS["General.Toggle.SoulbindButton"],
			order = 12,
			desc = L_GLOBALSTRINGS["General.Toggle.SoulbindButtonDesc"],
			type = "toggle",
			get = function(_)
				if not HelpMePlayDB.SoulbindButtonEnabled then
					HelpMePlayDB.SoulbindButtonEnabled = false
				end
				return HelpMePlayDB.SoulbindButtonEnabled
			end,
			set = function(_, val) HelpMePlayDB.SoulbindButtonEnabled = val end,
		},
	},
}
addonTable.generalOptions = generalOptions