local addonName, addon = ...

SLASH_HelpMePlay1 = "/hmp"
SLASH_HelpMePlay2 = "/helpmeplay"
SlashCmdList["HelpMePlay"] = function(cmd)
	local command, subcommand, arg1 = string.split(" ", cmd)
	if not command or command == "" then
        Settings.OpenToCategory(addon.category:GetID())
    else
        HelpMePlay.Print("Unknown command detected.")
	end
end