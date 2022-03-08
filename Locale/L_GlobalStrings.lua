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
	print(L_GLOBALSTRINGS["Red WARNING"] .. L_GLOBALSTRINGS["Locale Not Supported"] .. " @" .. L_GLOBALSTRINGS["Discord"])
end

if (isLocaleSupported) then
	L_GLOBALSTRINGS["Slash HMP"]																= "/hmp"
	L_GLOBALSTRINGS["Abandon Command"]															= "abandon"
	L_GLOBALSTRINGS["Dialog Command"]															= "dialog"
	L_GLOBALSTRINGS["Quest Command"]															= "quest"
	L_GLOBALSTRINGS["Locale Not Supported"]														= addonName .. " does NOT support " .. locale .. "! Please consider aiding in updating the addon to work for your language."
	L_GLOBALSTRINGS["Q"]																		= "q"
	L_GLOBALSTRINGS["Already on that quest."]													= "already on that quest."																
	L_GLOBALSTRINGS["Abandon Command Description"]												= "Abandons all quests in the zone specified by the player."
	L_GLOBALSTRINGS["Colored Addon Name"]														= "|cff00FFFF"..addonName.."|r"
	L_GLOBALSTRINGS["Addon Short Name"]															= "HMP"
	L_GLOBALSTRINGS["Minimap Icon Subtext"]														= "Configure the addon's settings.\nTailor an experience that best fits your playstyle!"
	L_GLOBALSTRINGS["Available Commands"]														= "|cffFFFFFFAvailable Commands|r"
	L_GLOBALSTRINGS["Discord"]																	= "Lightsky#0658"
	L_GLOBALSTRINGS["Red WARNING"]																= "|cffFF0000WARNING:|r "
	L_GLOBALSTRINGS["Open Settings"]															= "Open Settings"
	L_GLOBALSTRINGS["Do you really want to abandon all quests?"]								= "|cff00FFFF"..addonName.."|r\n".."Do you really want to abandon all quests?"
	L_GLOBALSTRINGS["Yes"]																		= "Yes"
	L_GLOBALSTRINGS["No"]																		= "No"
	L_GLOBALSTRINGS["Talent Purchase Text"]														= "Purchase the following talent: "
	L_GLOBALSTRINGS["Talent Not Enough Currency Text"]											= "You need more currency! Amount Needed: "
	L_GLOBALSTRINGS["Prequisite Talent Being Researched"]										= "There is a prerequisite talent being researched. Please come back later or research something else." 
	L_GLOBALSTRINGS["Level Congrats Text"]														= "Congratulations on reaching level %s! Suggested talent: %s"
	L_GLOBALSTRINGS["Automatic"]																= "Automatic"
	L_GLOBALSTRINGS["Automatic (No Epic)"]														= "Automatic (No Epic)"
	L_GLOBALSTRINGS["Notifications"]															= "Notifications"
	L_GLOBALSTRINGS["Disabled"]																	= "Disabled"
	L_GLOBALSTRINGS["Cinematic or Movie Not Skipped"]											= "The cinematic or movie was intentionally NOT skipped!"
	L_GLOBALSTRINGS["War Mode Reminder"]														= "You leveled to 20! You should return to Orgrimmar (Horde) or Stormwind City (Alliance), so I can enable War Mode."
	L_GLOBALSTRINGS["Equipped Item Level is Nil"]												= "[|cffFF7900WARNING|r] Equipped item level is unavailable. Please open and close your character pane."
	L_GLOBALSTRINGS["Quest Turned In Text"]														= "Turned in"
	L_GLOBALSTRINGS["Quest Accepted Text"]														= "Accepted"
	L_GLOBALSTRINGS["Burning Crusade"]															= "Burning Crusade"
	L_GLOBALSTRINGS["Lich King"]																= "Lich King"
	L_GLOBALSTRINGS["Cataclysm"]																= "Cataclysm"
	L_GLOBALSTRINGS["Mists of Pandaria"]														= "Mists of Pandaria"
	L_GLOBALSTRINGS["Draenor"]																	= "Draenor"
	L_GLOBALSTRINGS["Legion"]																	= "Legion"
	L_GLOBALSTRINGS["Battle for Azeroth"]														= "Battle for Azeroth"
	L_GLOBALSTRINGS["CR Text"]																	= "Crafted with |cffFF5C5C♥|r by LightskyGG"
	L_GLOBALSTRINGS["Adventure Maps"]															= "Adventure Maps"
	L_GLOBALSTRINGS["Dialog"]																	= "Dialog"
	L_GLOBALSTRINGS["Emotes"]																	= "Emotes"
	L_GLOBALSTRINGS["Garrison Tables"]															= "Garrison Tables"
	L_GLOBALSTRINGS["Mail"]																		= "Mail"
	L_GLOBALSTRINGS["Merchants"]																= "Merchants"
	L_GLOBALSTRINGS["Mount Training"]															= "Trainers"
	L_GLOBALSTRINGS["Speech"]																	= "Speech"
	L_GLOBALSTRINGS["War Mode"]																	= "War Mode"
	L_GLOBALSTRINGS["Accept/Complete Quests"]													= "Quests"
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
	L_GLOBALSTRINGS["Disable All"]																= "Disable All"
	L_GLOBALSTRINGS["Disable All Check Button"]													= "Disables all the below settings and returns\nthem to their default state.\n\n|cffCB453DNote|r: The current state of your settings\nare saved; unchecking the button returns them\nto their saved state."
	L_GLOBALSTRINGS["Adventure Maps Check Button"]												= "Automates the Hero's Call Board and the selection of zones for the\nBattle for Azeroth and Shadowlands adventure maps.\n\nYou can view the full list on CurseForge."
	L_GLOBALSTRINGS["Dialog Check Button"]														= "Automates the selection of dialog options when speaking with NPCs.\nThis does |cffFFFFFFNOT|r apply to all dialogs.\nUse the |cffFFFFFF/dialog|r command to add your own automation."
	L_GLOBALSTRINGS["Emotes Check Button"]														= "Automates emoting at specific NPCs."
	L_GLOBALSTRINGS["Garrison Tables Check Button"]												= "Automates the start of the first Garrison mission for both factions, as well as\nthe plotting of the Barracks building for Level 1 Garrisons.\nGorgrond, Talador, and Spires of Arak outposts are auto selected.\n\nIf checked:\n\n|cffFFFFFFGorgrond|r: Sparring Arena\n|cffFFFFFFTalador|r: Arsenal\n|cffFFFFFFSpires of Arak|r: Brewery"
	L_GLOBALSTRINGS["Mail Check Button"]														= "Automates the collection of gold and items from your mailbox."
	L_GLOBALSTRINGS["Merchants Check Button"]													= "Automates the purchase of specific items from merchants, as well\nas automatic repairs."
	L_GLOBALSTRINGS["Trainers Check Button"]													= "Automates the purchase of skills from trainers.\nThe player must have either double the cost of the\nskill OR at least 300 more gold than the cost of the\nskill."
	L_GLOBALSTRINGS["Speech Check Button"]														= "Automates interacting with specific NPC speech.\nThis setting controls the glow effect on vehicle quests\nlike \"We'll Make an Aspirant Out of You\" in Bastion."
	L_GLOBALSTRINGS["War Mode Check Button"]													= "Automates opting the player into War Mode when entering Orgrimmar or Stormwind City.\nThis only applies to players above level 20, but below 50."
	L_GLOBALSTRINGS["Quests Check Button"]														= "Automates accepting and completing quests and\nselecting quest rewards."
	L_GLOBALSTRINGS["Threads of Fate Check Button"]												= "Automates the selection of Threads of Fate.\nChecking the box will opt the player into\nThreads of Fate. Unchecked will do nothing."
	L_GLOBALSTRINGS["Notes Check Button"]														= "Adds notes to select creatures.\nThis setting also controls achievement criteria in tooltips."
	L_GLOBALSTRINGS["Talents Check Button"]														= "Suggests talents for your current specialization upon\nreaching talent levels. This setting also applies to talent\nNPCs like |cffFFFFFFThe Box of Many Things|r."
	L_GLOBALSTRINGS["Cinematics Check Button"]													= "Automates skipping (most) cinematics and in-game movies."
	L_GLOBALSTRINGS["Party Play Check Button"]													= "|cffCB453DNote|r: This feature has no affect outside groups.\n\nWoW is better with friends. If you play the game\nwith friends, and want to keep them in the loop\non your quest activity, then enable |cffFFFFFFParty Play|r!\n\n- Reports when quests are accepted\n- Reports when quests are completed\n- Reports quest activity (eg. X/Y harpies slain)\n- Auto shares quests"
	L_GLOBALSTRINGS["Queues Check Button"]														= "Need to relieve yourself but don't want to miss your queue?\nCheck this button and worry no more."
	L_GLOBALSTRINGS["Minimap Icon Check Button"]												= "Use this button to enable or disable the minimap icon."
	L_GLOBALSTRINGS["Chromie Time DropDown"]													= "|cffFFFFFFChromie Time|r\n\nAutomates the expansion to select when speaking\nwith Chromie."
	L_GLOBALSTRINGS["Torghast Powers DropDown"]													= "|cffFFFFFFTorghast Powers|r\n\nAutomates the behavior for Torghast Powers.\n\n|cffFFFFFFAutomatic|r: Powers are auto selected based on a\npriority list.\n|cffFFFFFFAutomatic (No Epic)|r: Powers are auto selected based on a\npriority list, but epic powers are ignored.\n|cffFFFFFFNotifications|r: Powers are suggested to the player using\nthe chat window. If only 1 Power is available, then it\n will be auto selected.\n|cffFFFFFFDisabled|r: HelpMePlay won't assist with Torghast Powers."
	L_GLOBALSTRINGS["Covenants DropDown"]														= "|cffFFFFFFCovenants|r\n\nAutomates the Covenant to select when interacting with\nthe Helm of Domination."
	L_GLOBALSTRINGS["Al'dalil"]																	= "Al'dalil"
	L_GLOBALSTRINGS["Playful Trickster"]														= "Playful Trickster"
	L_GLOBALSTRINGS["Trainer Ikaros"]															= "Trainer Ikaros"
	L_GLOBALSTRINGS["Playful Trickster: Praise"]												= "Not so much as a word of praise!"
	L_GLOBALSTRINGS["Playful Trickster: Cheer"]													= "The other spriggans were all cheering my name for days!"
	L_GLOBALSTRINGS["Playful Trickster: Dance"]													= "Dance with me!"
	L_GLOBALSTRINGS["Playful Trickster: Introduce"]												= "Introductions are an important part of first impressions!"
	L_GLOBALSTRINGS["Playful Trickster: Thank"]													= "Some ask permission, and always thank us for our trouble."
	L_GLOBALSTRINGS["Playful Trickster: Flex"]													= "How strong he must have been!"
	L_GLOBALSTRINGS["Al'dalil: Buttons 1"]														= "Buttons! Quickly, the buttons!"
	L_GLOBALSTRINGS["Al'dalil: Buttons 2"]														= "Start pressing buttons!"
	L_GLOBALSTRINGS["Al'dalil: Lever 1"]														= "Use the lever, Maw Walker!"
	L_GLOBALSTRINGS["Al'dalil: Lever 2"]														= "Pull on one of the levers!"
	L_GLOBALSTRINGS["Al'dalil: Bonk 1"]															= "A sharp strike to the head always works!"
	L_GLOBALSTRINGS["Al'dalil: Bonk 2"]															= "There are no operating instructions! Try hitting it!"
	L_GLOBALSTRINGS["Trainer Ikaros: Dodge"]													= "Dodge"
	L_GLOBALSTRINGS["Trainer Ikaros: Strike"]													= "Strike"
	L_GLOBALSTRINGS["Trainer Ikaros: Jab"]														= "Jab"
	L_GLOBALSTRINGS["Trainer Ikaros: Sweep"]													= "Sweep"
	L_GLOBALSTRINGS["Trainer Ikaros: Kick"]														= "Kick"
	L_GLOBALSTRINGS["Trainer Ikaros: Parry"]													= "Parry"
	L_GLOBALSTRINGS["Soul Eater: Shake"]														= "The Soul Eater tries to shake you off! Hold on tightly!"
	L_GLOBALSTRINGS["Soul Eater: Veer"]															= "The Soul Eater tries to veer away. Give it a kick in the right direction!"
	L_GLOBALSTRINGS["Soul Eater: Writhe"]														= "The Soul Eater writhes about. Pull the reins to tire it!"
	L_GLOBALSTRINGS["Taloned Flayedwing: Praise"]												= "The flayedwing is flying smoothly, praise them!"
	L_GLOBALSTRINGS["Taloned Flayedwing: Scared"]												= "The flayedwing is scared, soothe it with gentle pats!"
	L_GLOBALSTRINGS["Taloned Flayedwing: Shake"]												= "The flayedwing is trying to shake you off, hold on tight!"
	L_GLOBALSTRINGS["Torghast"]																	= "Torghast"
	L_GLOBALSTRINGS["Red X Raid Target"]														= "|TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_7:0|t"
	L_GLOBALSTRINGS["Kyrian"]																	= "|T3257748:0|t Kyrian"
	L_GLOBALSTRINGS["Necrolord"]																= "|T3257749:0|t Necrolord"
	L_GLOBALSTRINGS["Night Fae"]																= "|T3257750:0|t Night Fae"
	L_GLOBALSTRINGS["Venthyr"]																	= "|T3257751:0|t Venthyr"
end

addonTable.L_GLOBALSTRINGS = L_GLOBALSTRINGS