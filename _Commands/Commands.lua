local addonName, HelpMePlay = ...

SLASH_HelpMePlay1 = "/hmp"
SLASH_HelpMePlay2 = "/helpmeplay"
SlashCmdList["HelpMePlay"] = function(cmd)
	local command, subcommand, arg1 = string.split(" ", cmd)
	if not command or command == "" then
        if not InCombatLockdown() then
            Settings.OpenToCategory(HelpMePlay.category:GetID())
        else
            HelpMePlay.Print(HelpMePlay.ErrorMessages["IN_COMBAT_LOCKDOWN"])
        end
    else
        HelpMePlay.Print(HelpMePlay.ErrorMessages["COMMAND_NOT_FOUND"])
	end
end