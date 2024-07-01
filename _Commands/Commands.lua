local addonName, addon = ...

SLASH_HelpMePlay1 = "/hmp"
SLASH_HelpMePlay2 = "/helpmeplay"
SlashCmdList["HelpMePlay"] = function(cmd)
	local command, subcommand, arg1 = string.split(" ", cmd)
	if not command or command == "" then
        if not InCombatLockdown() then
            Settings.OpenToCategory(addon.category:GetID())
        else
            addon.Print(addon.ErrorMessages["IN_COMBAT_LOCKDOWN"])
        end
    else
        addon.Print(addon.ErrorMessages["COMMAND_NOT_FOUND"])
	end
end