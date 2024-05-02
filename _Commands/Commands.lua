local addonName, addon = ...

SLASH_HelpMePlay21 = "/hmp2"
SLASH_HelpMePlay22 = "/helpmeplay2"
SlashCmdList["HelpMePlay2"] = function(cmd)
	local command, subcommand, arg1 = string.split(" ", cmd)
	if not command or command == "" then
		InterfaceOptionsFrame_OpenToCategory(addonName)
    elseif command == "help" then
        print("har har")
    else
        HelpMePlay.Print("Unknown command detected. Use |cffFFD100help|r for assistance.")
	end
end