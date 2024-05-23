local addonName, addon = ...

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
    elseif command == "set" then
        if subcommand == "TrainerProtectionValue" then
            if tonumber(arg1) then
                local value = tonumber(arg1, 10)
                HelpMePlayDB[subcommand] = value
            end
        end
    else
        HelpMePlay.Print("Unknown command detected.")
	end
end