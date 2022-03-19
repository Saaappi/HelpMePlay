local addonName, addonTable = ...
local locale = GAME_LOCALE or GetLocale()
local isLocaleSupported = false
local supportedLocales = {
	"enGB",
	"enUS",
	"deDE",
	"esMX",
	"ptBR",
	"esES",
	"frFR",
	"itIT",
	"ruRU",
	"koKR",
	"zhTW",
	"zhCN",
}
local L_GLOBALSTRINGS = setmetatable({}, { __index = function(t, k)
	local v = tostring(k)
	rawset(t, k, v)
	return v
end })

for i=1,#supportedLocales do
	if (supportedLocales[i] == locale) then
		isLocaleSupported = true
	end
end

if (isLocaleSupported == false) then
	if HelpMePlayOptionsDB.Logging then
		print(L_GLOBALSTRINGS["Red WARNING"] .. L_GLOBALSTRINGS["Locale Not Supported"] .. " @" .. L_GLOBALSTRINGS["Discord"])
	end
end

if (isLocaleSupported) then
	L_GLOBALSTRINGS["Slash HMP"]																= "/hmp"
	L_GLOBALSTRINGS["Confirm Command"]															= "confirm"
	L_GLOBALSTRINGS["Dialog Command"]															= "dialog"
	L_GLOBALSTRINGS["Quest Command"]															= "quest"
	L_GLOBALSTRINGS["Locale Not Supported"]														= addonName .. " does NOT support " .. locale .. "! Please consider aiding in updating the addon to work for your language."
	L_GLOBALSTRINGS["Q"]																		= "q"
	L_GLOBALSTRINGS["Already on that quest."]													= "already on that quest."
	L_GLOBALSTRINGS["Colored Addon Name"]														= "|cff00FFFF"..addonName.."|r"
	L_GLOBALSTRINGS["Addon Short Name"]															= "HMP"
	L_GLOBALSTRINGS["Minimap Icon Subtext"]														= "Configure the addon's settings.\nTailor an experience that best fits your playstyle!"
	L_GLOBALSTRINGS["Available Commands"]														= "|cffFFFFFFAvailable Commands|r"
	L_GLOBALSTRINGS["Red WARNING"]																= "|cffFF0000WARNING:|r "
	L_GLOBALSTRINGS["Open Settings"]															= "Open Settings"
	L_GLOBALSTRINGS["Talent Purchase Text"]														= "Purchase the following talent: "
	L_GLOBALSTRINGS["Talent Not Enough Currency Text"]											= "You need more currency! Amount Needed: "
	L_GLOBALSTRINGS["Prequisite Talent Being Researched"]										= "There is a prerequisite talent being researched. Please come back later or research something else." 
	L_GLOBALSTRINGS["Level Congrats Text"]														= "Congratulations on reaching level %s! Suggested talent: %s"
	L_GLOBALSTRINGS["Automatic"]																= "Automatic"
	L_GLOBALSTRINGS["Automatic (No Epic)"]														= "Automatic (No Epic)"
	L_GLOBALSTRINGS["Notifications"]															= "Notifications"
	L_GLOBALSTRINGS["Disabled"]																	= "Disabled"
	L_GLOBALSTRINGS["Dialog Removed"]															= "Removed \"%s\" from database."
	L_GLOBALSTRINGS["Cinematic or Movie Not Skipped"]											= "The cinematic or movie was intentionally NOT skipped!"
	L_GLOBALSTRINGS["Party Play Enabled Warning Text"]											= "[|cffFF7900WARNING|r] You've joined a group with Party Play enabled."
	L_GLOBALSTRINGS["War Mode Reminder: Alliance"]												= "You leveled to 20! You should return to Stormwind City, so I can enable War Mode."
	L_GLOBALSTRINGS["War Mode Reminder: Horde"]													= "You leveled to 20! You should return to Orgrimmar, so I can enable War Mode."
	L_GLOBALSTRINGS["Equipped Item Level is Nil"]												= "[|cffFF7900WARNING|r] Equipped item level is unavailable. Please open and close your character pane."
	L_GLOBALSTRINGS["Quest Turned In Text"]														= "Turned in"
	L_GLOBALSTRINGS["Quest Removed Text"]														= "Removed"
	L_GLOBALSTRINGS["Quest Accepted Text"]														= "Accepted"
	L_GLOBALSTRINGS["Burning Crusade"]															= "Burning Crusade"
	L_GLOBALSTRINGS["Lich King"]																= "Lich King"
	L_GLOBALSTRINGS["Cataclysm"]																= "Cataclysm"
	L_GLOBALSTRINGS["Mists of Pandaria"]														= "Mists of Pandaria"
	L_GLOBALSTRINGS["Draenor"]																	= "Draenor"
	L_GLOBALSTRINGS["Legion"]																	= "Legion"
	L_GLOBALSTRINGS["Battle for Azeroth"]														= "Battle for Azeroth"
	L_GLOBALSTRINGS["Stormsong Valley"]															= "Stormsong Valley"
	L_GLOBALSTRINGS["Tiragarde Sound"]															= "Tiragarde Sound"
	L_GLOBALSTRINGS["Drustvar"]																	= "Drustvar"
	L_GLOBALSTRINGS["Nazmir"]																	= "Nazmir"
	L_GLOBALSTRINGS["Vol'dun"]																	= "Vol'dun"
	L_GLOBALSTRINGS["Zuldazar"]																	= "Zuldazar"
	L_GLOBALSTRINGS["Random"]																	= "Random"
	L_GLOBALSTRINGS["Copyright Text"]															= "Crafted with |cffFF5C5C♥|r by Lightsky#0658"
	L_GLOBALSTRINGS["Adventure Maps"]															= "Adventure Maps"
	L_GLOBALSTRINGS["Dialog"]																	= "Dialog"
	L_GLOBALSTRINGS["Emotes"]																	= "Emotes"
	L_GLOBALSTRINGS["Garrison Tables"]															= "Garrison Tables"
	L_GLOBALSTRINGS["Merchants"]																= "Merchants"
	L_GLOBALSTRINGS["Mount Training"]															= "Trainers"
	L_GLOBALSTRINGS["Speech"]																	= "Speech"
	L_GLOBALSTRINGS["War Mode"]																	= "War Mode"
	L_GLOBALSTRINGS["Quests"]																	= "Quests"
	L_GLOBALSTRINGS["Threads of Fate"]															= "Threads of Fate"
	L_GLOBALSTRINGS["Chromie Time"]																= "Chromie Time"
	L_GLOBALSTRINGS["Current Expansion"]														= "Current Expansion"
	L_GLOBALSTRINGS["Torghast Powers"]															= "Torghast Powers"
	L_GLOBALSTRINGS["Notes"]																	= "Notes"
	L_GLOBALSTRINGS["Talents"]																	= "Talents"
	L_GLOBALSTRINGS["Cinematics"]																= "Cinematics"
	L_GLOBALSTRINGS["Queues"]																	= "Queues"
	L_GLOBALSTRINGS["Party Play"]																= "Party Play"
	L_GLOBALSTRINGS["Minimap Icon"]																= "Minimap Icon"
	L_GLOBALSTRINGS["Logging"]																	= "Logging"
	L_GLOBALSTRINGS["Disable All"]																= "Disable All"
	L_GLOBALSTRINGS["Disable All Check Button"]													= "Disables all the below settings and returns\nthem to their default state.\n\nThis check button affects all settings regardless\nof the tab you're on.\n\n|cffCB453DNote|r: The current state of your settings\nare saved; unchecking the button returns them\nto their saved state."
	L_GLOBALSTRINGS["Adventure Maps Check Button"]												= "Automates the Hero's Call Board and the selection of zones for the\nBattle for Azeroth and Shadowlands adventure maps."
	L_GLOBALSTRINGS["Dialog Check Button"]														= "Automates the selection of dialog options when speaking with creatures.\nThis does |cffFFFFFFNOT|r apply to all dialogs. Use the |cffFFFFFF/dialog|r command to add your own!"
	L_GLOBALSTRINGS["Emotes Check Button"]														= "Automates emotes for specific creatures. Examples include\nthe Lake Frog for the Argent Tournament daily and the\nrunestones in Maldraxxus."
	L_GLOBALSTRINGS["Garrison Tables Check Button"]												= "Automates the selection of Draenor zone outposts,\nthe start of the first Garrison missions, and the\nplotting of the Barracks building."
	L_GLOBALSTRINGS["Merchants Check Button"]													= "Automates repairing at merchants and the purchase\nof specific items."
	L_GLOBALSTRINGS["Trainers Check Button"]													= "Automates the purchase of skills from trainers.\nThe addon won't train if the purchase would\nbreak the bank. You must have at least\n50 gold more than the cost."
	L_GLOBALSTRINGS["Speech Check Button"]														= "Automates interacting with specific creature speech.\nExamples include \"|cffFFFFFFWe'll Make an Aspirant Out\nof You|r\" in Bastion and \"|cffFFFFFFThe Games We Play|r\" in\nArdenweald."
	L_GLOBALSTRINGS["War Mode Check Button"]													= "Automates opting the player into War Mode when entering Orgrimmar\nor Stormwind City.\n\n|cffCB453DNote|r: This does |cffFFFFFFNOT|r apply to players 50 or higher and this feature\nwon't output info if Logging is disabled."
	L_GLOBALSTRINGS["Quests Check Button"]														= "Automates accepting and completing quests, selecting\nquest rewards, and plotting waypoints.\n\nQuest reward selection is based on item level, then\nsell price. Heirloom items are ignored by the item\nlevel logic, so sell price is the only considered\nmetric.\n\n|cffCB453DNote|r: Waypoints will only plot if TomTom is installed.\nNot all quests are supported, nor will every quest\nbe supported. Also, this feature won't output info\nif Logging is disabled."
	L_GLOBALSTRINGS["Threads of Fate Check Button"]												= "Automates the selection of Threads of Fate.\nChecking the box will opt the player into\nThreads of Fate. Unchecked will opt\nthe player into Story Mode."
	L_GLOBALSTRINGS["Notes Check Button"]														= "Adds notes to select creatures. Examples include\nthe Lever-Locked Chests in Torghast, providing the\nshortest combination to solve the puzzle."
	L_GLOBALSTRINGS["Talents Check Button"]														= "Suggests talents for your current specialization upon\nreaching talent levels. This setting also applies to talent\nsystems like |cffFFFFFFThe Box of Many Things|r.\n\n|cffCB453DNote|r: This feature won't output info if Logging is disabled."
	L_GLOBALSTRINGS["Cinematics Check Button"]													= "Automates skipping (most) cinematics and in-game movies.\n\n|cffCB453DNote|r: This feature won't output info if Logging is disabled."
	L_GLOBALSTRINGS["Party Play Check Button"]													= "|cffCB453DNote|r: This feature has no affect outside groups.\n\nWoW is better with friends. If you play the game\nwith friends, and want to keep them in the loop\non your quest activity, then enable |cffFFFFFFParty Play|r!\n\n- Reports when quests are accepted\n- Reports when quests are completed\n- Reports quest activity (eg. X/Y harpies slain)\n- Auto shares quests"
	L_GLOBALSTRINGS["Party Play Announce Check Button"]											= "|cffFFFFFFParty Play: Announce|r\nIf you don't want to broadcast when you've\naccepted a quest, then keep this unchecked."
	L_GLOBALSTRINGS["Party Play Auto Share Check Button"]										= "|cffFFFFFFParty Play: Auto Share|r\nIf you don't want to auto share quests,\nthen keep this unchecked."
	L_GLOBALSTRINGS["Queues Check Button"]														= "Need to cook dinner but don't want to miss your\nqueue? Check this button and let the addon\nworry about it."
	L_GLOBALSTRINGS["Minimap Icon Check Button"]												= "Use this button to enable or disable the minimap icon."
	L_GLOBALSTRINGS["Logging Check Button"]														= "If you want to know when the addon is outputting\ninformation, then check this button."
	L_GLOBALSTRINGS["Chromie Time DropDown"]													= "|cffFFFFFFChromie Time|r\nAutomates the expansion to select when speaking\nwith Chromie."
	L_GLOBALSTRINGS["Torghast Powers DropDown"]													= "|cffFFFFFFTorghast Powers|r\nAutomates the behavior for Torghast Powers.\n\n|cffFFFFFFAutomatic|r: Powers are auto selected based on a\npriority list.\n|cffFFFFFFAutomatic (No Epic)|r: Powers are auto selected based on a\npriority list, but epic powers are ignored.\n|cffFFFFFFNotifications|r: Powers are suggested to the player using\nthe chat window. If only 1 Power is available, then it\n will be auto selected.\n|cffFFFFFFDisabled|r: HelpMePlay won't assist with Torghast Powers.\n\n|cffCB453DNote|r: This feature won't output info if Logging is disabled."
	L_GLOBALSTRINGS["BFA Zone Selection DropDown"]												= "|cffFFFFFFBattle for Azeroth Zone Selection|r\nPick the zone you want the automation to\nselect from the adventure map in Boralus\nor Zuldazar."
	L_GLOBALSTRINGS["SL Zone Selection DropDown"]												= "|cffFFFFFFShadowlands Zone Selection|r\nPick the zone you want the automation to\nselect from the adventure map in Oribos."
	L_GLOBALSTRINGS["Covenants DropDown"]														= "|cffFFFFFFCovenants|r\nAutomates the Covenant to select when interacting with\nthe Helm of Domination."
	L_GLOBALSTRINGS["Al'dalil"]																	= "Al'dalil"
	L_GLOBALSTRINGS["Playful Trickster"]														= "Playful Trickster"
	L_GLOBALSTRINGS["Trainer Ikaros"]															= "Trainer Ikaros"
	L_GLOBALSTRINGS["Playful Trickster: Praise"]												= "not so much as a word of praise!"
	L_GLOBALSTRINGS["Playful Trickster: Cheer"]													= "the other spriggans were all cheering my name for days!"
	L_GLOBALSTRINGS["Playful Trickster: Dance"]													= "dance with me!"
	L_GLOBALSTRINGS["Playful Trickster: Introduce"]												= "introductions are an important part of first impressions!"
	L_GLOBALSTRINGS["Playful Trickster: Thank"]													= "some ask permission, and always thank us for our trouble."
	L_GLOBALSTRINGS["Playful Trickster: Flex"]													= "how strong he must have been!"
	L_GLOBALSTRINGS["Al'dalil: Buttons 1"]														= "buttons! quickly, the buttons!"
	L_GLOBALSTRINGS["Al'dalil: Buttons 2"]														= "start pressing buttons!"
	L_GLOBALSTRINGS["Al'dalil: Lever 1"]														= "use the lever, maw walker!"
	L_GLOBALSTRINGS["Al'dalil: Lever 2"]														= "pull on one of the levers!"
	L_GLOBALSTRINGS["Al'dalil: Bonk 1"]															= "a sharp strike to the head always works!"
	L_GLOBALSTRINGS["Al'dalil: Bonk 2"]															= "there are no operating instructions! try hitting it!"
	L_GLOBALSTRINGS["Trainer Ikaros: Dodge"]													= "dodge"
	L_GLOBALSTRINGS["Trainer Ikaros: Strike"]													= "strike"
	L_GLOBALSTRINGS["Trainer Ikaros: Jab"]														= "jab"
	L_GLOBALSTRINGS["Trainer Ikaros: Sweep"]													= "sweep"
	L_GLOBALSTRINGS["Trainer Ikaros: Kick"]														= "kick"
	L_GLOBALSTRINGS["Trainer Ikaros: Parry"]													= "parry"
	L_GLOBALSTRINGS["Soul Eater: Shake"]														= "the soul eater tries to shake you off! hold on tightly!"
	L_GLOBALSTRINGS["Soul Eater: Veer"]															= "the soul eater tries to veer away. give it a kick in the right direction!"
	L_GLOBALSTRINGS["Soul Eater: Writhe"]														= "the soul eater writhes about. pull the reins to tire it!"
	L_GLOBALSTRINGS["Taloned Flayedwing: Praise"]												= "the flayedwing is flying smoothly, praise them!"
	L_GLOBALSTRINGS["Taloned Flayedwing: Scared"]												= "the flayedwing is scared, soothe it with gentle pats!"
	L_GLOBALSTRINGS["Taloned Flayedwing: Shake"]												= "the flayedwing is trying to shake you off, hold on tight!"
	L_GLOBALSTRINGS["Torghast"]																	= "Torghast"
	L_GLOBALSTRINGS["Kyrian"]																	= "Kyrian"
	L_GLOBALSTRINGS["Necrolord"]																= "Necrolord"
	L_GLOBALSTRINGS["Night Fae"]																= "Night Fae"
	L_GLOBALSTRINGS["Venthyr"]																	= "Venthyr"
	L_GLOBALSTRINGS["Tab: Automations"]															= "Automations"
	L_GLOBALSTRINGS["Tab: Systems"]																= "Systems"
	L_GLOBALSTRINGS["Tab: General"]																= "General"
	L_GLOBALSTRINGS["Tab Description: Automations"]												= "These are the features that take action\non your behalf."
	L_GLOBALSTRINGS["Tab Description: Systems"]													= "These are the features that offer information\nto the player or interact with a game system."
	L_GLOBALSTRINGS["Tab Description: General"]													= "These are addon settings, unrelated to the\nsettings in the other tabs."
end

addonTable.L_GLOBALSTRINGS = L_GLOBALSTRINGS