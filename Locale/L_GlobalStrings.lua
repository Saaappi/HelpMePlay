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
	L_GLOBALSTRINGS["Cinematic or Movie Not Skipped"]											= "The cinematic or movie was intentionally NOT skipped!"
	L_GLOBALSTRINGS["War Mode Reminder: Alliance"]												= "You leveled to 20! You should return to Stormwind City, so I can enable War Mode."
	L_GLOBALSTRINGS["War Mode Reminder: Horde"]													= "You leveled to 20! You should return to Orgrimmar, so I can enable War Mode."
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
	L_GLOBALSTRINGS["Copyright Text"]															= "Crafted with |cffFF5C5C♥|r by Lightsky#0658"
	L_GLOBALSTRINGS["Adventure Maps"]															= "Adventure Maps"
	L_GLOBALSTRINGS["Dialog"]																	= "Dialog"
	L_GLOBALSTRINGS["Emotes"]																	= "Emotes"
	L_GLOBALSTRINGS["Garrison Tables"]															= "Garrison Tables"
	L_GLOBALSTRINGS["Mail"]																		= "Mail"
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
	L_GLOBALSTRINGS["Disable All"]																= "Disable All"
	L_GLOBALSTRINGS["Disable All Check Button"]													= "Disables all the below settings and returns\nthem to their default state.\n\n|cffCB453DNote|r: The current state of your settings\nare saved; unchecking the button returns them\nto their saved state."
	L_GLOBALSTRINGS["Adventure Maps Check Button"]												= "Automates the Hero's Call Board and the selection of zones for the\nBattle for Azeroth and Shadowlands adventure maps."
	L_GLOBALSTRINGS["Dialog Check Button"]														= "Automates the selection of dialog options when speaking with creatures.\nThis does |cffFFFFFFNOT|r apply to all dialogs. Use the |cffFFFFFF/dialog|r command to add your own!"
	L_GLOBALSTRINGS["Emotes Check Button"]														= "Automates emotes for specific creatures. Examples include\nthe Lake Frog for the Argent Tournament daily and the\nrunestones in Maldraxxus."
	L_GLOBALSTRINGS["Garrison Tables Check Button"]												= "Automates the selection of Draenor zone outposts,\nthe start of the first Garrison missions, and the\nplotting of the Barracks building."
	L_GLOBALSTRINGS["Mail Check Button"]														= "Automates the collection of gold and items from your mailbox."
	L_GLOBALSTRINGS["Merchants Check Button"]													= "Automates repairing at merchants and the purchase\nof specific items."
	L_GLOBALSTRINGS["Trainers Check Button"]													= "Automates the purchase of skills from trainers.\nThe addon won't train if the purchase would\nbreak the bank. You must have at least\n50 gold more than the cost."
	L_GLOBALSTRINGS["Speech Check Button"]														= "Automates interacting with specific creature speech.\nExamples include \"|cffFFFFFFWe'll Make an Aspirant Out\nof You|r\" in Bastion and \"|cffFFFFFFThe Games We Play|r\" in\nArdenweald."
	L_GLOBALSTRINGS["War Mode Check Button"]													= "Automates opting the player into War Mode when entering Orgrimmar\nor Stormwind City.\n\n|cffCB453DNote|r: This does |cffFFFFFFNOT|r apply to players 50 or higher."
	L_GLOBALSTRINGS["Quests Check Button"]														= "Automates accepting and completing quests, selecting\nquest rewards, and plotting waypoints.\n\nQuest reward selection is based on item level,\nthen sell price.\n\n|cffCB453DNote|r: Waypoints will only plot if TomTom is installed.\nNot all quests are supported, nor will every quest\nbe supported."
	L_GLOBALSTRINGS["Threads of Fate Check Button"]												= "Automates the selection of Threads of Fate.\nChecking the box will opt the player into\nThreads of Fate. Unchecked will opt\nthe player into Story Mode."
	L_GLOBALSTRINGS["Notes Check Button"]														= "Adds notes to select creatures. Examples include\nthe Lever-Locked Chests in Torghast, providing the\nshortest combination to solve the puzzle."
	L_GLOBALSTRINGS["Talents Check Button"]														= "Suggests talents for your current specialization upon\nreaching talent levels. This setting also applies to talent\nsystems like |cffFFFFFFThe Box of Many Things|r."
	L_GLOBALSTRINGS["Cinematics Check Button"]													= "Automates skipping (most) cinematics and in-game movies."
	L_GLOBALSTRINGS["Party Play Check Button"]													= "|cffCB453DNote|r: This feature has no affect outside groups.\n\nWoW is better with friends. If you play the game\nwith friends, and want to keep them in the loop\non your quest activity, then enable |cffFFFFFFParty Play|r!\n\n- Reports when quests are accepted\n- Reports when quests are completed\n- Reports quest activity (eg. X/Y harpies slain)\n- Auto shares quests"
	L_GLOBALSTRINGS["Queues Check Button"]														= "Need to cook dinner but don't want to miss your\nqueue? Check this button and let the addon\nworry about it."
	L_GLOBALSTRINGS["Minimap Icon Check Button"]												= "Use this button to enable or disable the minimap icon."
	L_GLOBALSTRINGS["Chromie Time DropDown"]													= "|cffFFFFFFChromie Time|r\nAutomates the expansion to select when speaking\nwith Chromie."
	L_GLOBALSTRINGS["Torghast Powers DropDown"]													= "|cffFFFFFFTorghast Powers|r\nAutomates the behavior for Torghast Powers.\n\n|cffFFFFFFAutomatic|r: Powers are auto selected based on a\npriority list.\n|cffFFFFFFAutomatic (No Epic)|r: Powers are auto selected based on a\npriority list, but epic powers are ignored.\n|cffFFFFFFNotifications|r: Powers are suggested to the player using\nthe chat window. If only 1 Power is available, then it\n will be auto selected.\n|cffFFFFFFDisabled|r: HelpMePlay won't assist with Torghast Powers."
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
	L_GLOBALSTRINGS["Waypoint: Lord Everblaze"]													= "Lord Everblaze"
	L_GLOBALSTRINGS["Waypoint: Maiden of Winter's Breath Lake"]									= "Maiden of Winter's Breath Lake"
	L_GLOBALSTRINGS["Waypoint: Winter Hyacinth"]												= "Winter Hyacinth"
	L_GLOBALSTRINGS["Waypoint: Maiden of Drak'Mar"]												= "Maiden of Drak'Mar"
	L_GLOBALSTRINGS["Waypoint: Maiden of Ashwood Lake"]											= "Maiden of Ashwood Lake"
	L_GLOBALSTRINGS["Waypoint: Composition Mote"]												= "Composition Mote"
	L_GLOBALSTRINGS["Waypoint: Compilation Nodule"]												= "Compilation Nodule"
	L_GLOBALSTRINGS["Waypoint: Leashkeeper Helzid"]												= "Leashkeeper Helzid"
	L_GLOBALSTRINGS["Waypoint: Nexus of Actualization"]											= "Nexus of Actualization"
	L_GLOBALSTRINGS["Waypoint: Gaiagantic"]														= "Gaiagantic"
	L_GLOBALSTRINGS["Waypoint: Cipherclad"]														= "Cipherclad"
	L_GLOBALSTRINGS["Waypoint: Bitterbeak"]														= "Bitterbeak"
	L_GLOBALSTRINGS["Waypoint: Runefur"]														= "Runefur"
	L_GLOBALSTRINGS["Waypoint: Dominated Jiro"]													= "Dominated Jiro"
	L_GLOBALSTRINGS["Waypoint: Overgrown Geomental"]											= "Overgrown Geomental"
	L_GLOBALSTRINGS["Waypoint: Punisher Makaris"]												= "Punisher Makaris"
	L_GLOBALSTRINGS["Waypoint: Sacred Relics"]													= "Sacred Relics"
	L_GLOBALSTRINGS["Waypoint: Eidolic Fragment"]												= "Eidolic Fragment"
	L_GLOBALSTRINGS["Waypoint: Minor Enigmet"]													= "Minor Enigmet"
	L_GLOBALSTRINGS["Waypoint: Custodian Taj"]													= "Custodian Taj"
	L_GLOBALSTRINGS["Waypoint: Terraforming Record"]											= "Terraforming Record"
	L_GLOBALSTRINGS["Waypoint: Catalyst Magic Sensor"]											= "Catalyst Magic Sensor"
	L_GLOBALSTRINGS["Waypoint: Fruit of the Bloom (Daily)"]										= "Fruit of the Bloom"
	L_GLOBALSTRINGS["Waypoint: Circle of Strife (Daily)"]										= "Automa Constructors"
	L_GLOBALSTRINGS["Waypoint: Cluck, Cluck, Boom (Daily)"]										= "Malfunctioned Poultrids"
	L_GLOBALSTRINGS["Waypoint: Buried Remnants (Daily)"]										= "Strange Artifacts"
	L_GLOBALSTRINGS["Waypoint: Super Jiro (Daily)"]												= "Super Jiro (right click to mount)"
	L_GLOBALSTRINGS["Waypoint: Forcing the Cycle (Daily) 1"]									= "Defeat Mawtouched enemies"
	L_GLOBALSTRINGS["Waypoint: Forcing the Cycle (Daily) 2"]									= "Coalesced Corruption (Purify orb)"
	L_GLOBALSTRINGS["Waypoint: Portal Play (Daily)"]											= "Use the Portal Initiator item and collect research"
	L_GLOBALSTRINGS["Waypoint: Operation: Relocation (Daily) 1"]								= "Ropes"
	L_GLOBALSTRINGS["Waypoint: Operation: Relocation (Daily) 2"]								= "Gorgers, Breachers, & Avians"
	L_GLOBALSTRINGS["Waypoint: Not Safe for Work (Daily)"]										= "Escort Rana in the area and collect relics"
	L_GLOBALSTRINGS["Waypoint: Not of the Body (Daily)"]										= "Use item on Automa in the area"
	L_GLOBALSTRINGS["Waypoint: Necessary Resourcing (Daily)"]									= "Defeat enemies in the area"
	L_GLOBALSTRINGS["Waypoint: Rana"]															= "Rana"
	L_GLOBALSTRINGS["Waypoint: The Broken Crown"]												= "The Broken Crown"
	L_GLOBALSTRINGS["Waypoint: Elder Eru"]														= "Elder Eru"
	L_GLOBALSTRINGS["Waypoint: Outmoded Servitor"]												= "Outmoded Servitor"
	L_GLOBALSTRINGS["Waypoint: Native Cervid"]													= "Native Cervid"
	L_GLOBALSTRINGS["Waypoint: Native Poultrid"]												= "Native Poultrid"
	L_GLOBALSTRINGS["Waypoint: Primus"]															= "Primus"
	L_GLOBALSTRINGS["Waypoint: One Half of the Equation"]										= "One Half of the Equation"
	L_GLOBALSTRINGS["Waypoint: Where the Memory Resides"]										= "Where the Memory Resides"
	L_GLOBALSTRINGS["Kyrian"]																	= "|T3257748:0|t Kyrian"
	L_GLOBALSTRINGS["Necrolord"]																= "|T3257749:0|t Necrolord"
	L_GLOBALSTRINGS["Night Fae"]																= "|T3257750:0|t Night Fae"
	L_GLOBALSTRINGS["Venthyr"]																	= "|T3257751:0|t Venthyr"
end

addonTable.L_GLOBALSTRINGS = L_GLOBALSTRINGS