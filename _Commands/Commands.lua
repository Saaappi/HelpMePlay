local addonName, addon = ...

local function SetValue(variable, value)
    if tonumber(value, 10) then
        value = tonumber(value, 10)
        HelpMePlayDB[variable] = value
    end
end

SLASH_HelpMePlay1 = "/hmp"
SLASH_HelpMePlay2 = "/helpmeplay"
SlashCmdList["HelpMePlay"] = function(cmd)
	local command, subcommand, arg1 = string.split(" ", cmd)
	if not command or command == "" then
        if not UnitAffectingCombat("player") then
            Settings.OpenToCategory(addon.category:GetID())
        else
            HelpMePlay.Print("The settings cannot be opened in combat.")
        end
    else
        HelpMePlay.Print("Unknown command detected.")
	end
end