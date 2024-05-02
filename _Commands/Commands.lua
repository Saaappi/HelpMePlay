local addonName, addon = ...

SLASH_HelpMePlay1 = "/hmp"
SLASH_HelpMePlay2 = "/helpmeplay"
SlashCmdList["HelpMePlay2"] = function(cmd)
	local command, subcommand, arg1 = string.split(" ", cmd)
	if not command or command == "" then
		InterfaceOptionsFrame_OpenToCategory(addonName)
    elseif command == "help" then
        HelpMePlay.Print("This command hasn't been implemented yet.")
    else
        HelpMePlay.Print("Unknown command detected. Use |cffFFD100help|r for assistance.")
	end
end