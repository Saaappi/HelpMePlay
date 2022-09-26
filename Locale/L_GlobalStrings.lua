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
	addonTable.Print(L_GLOBALSTRINGS["Red WARNING"] .. L_GLOBALSTRINGS["Locale Not Supported"] .. " @" .. L_GLOBALSTRINGS["Discord"])
end

if (isLocaleSupported) then
	-- Start: 	Commands
	L_GLOBALSTRINGS["Slash HMP"]																= "hmp"
	L_GLOBALSTRINGS["Confirm Command"]															= "confirm"
	L_GLOBALSTRINGS["Dialog Command"]															= "dialog"
	L_GLOBALSTRINGS["Ignore Command"]															= "ignore"
	L_GLOBALSTRINGS["Quest Command"]															= "quest"
	L_GLOBALSTRINGS["Junker Command"]															= "junker"
	L_GLOBALSTRINGS["Help Command"]																= "help"
	L_GLOBALSTRINGS["Reset Command"]															= "reset"
	L_GLOBALSTRINGS["Add Subcommand"]															= "add"
	L_GLOBALSTRINGS["Blacklist Subcommand"]														= "blacklist"
	L_GLOBALSTRINGS["Q"]																		= "q"
	-- End: 	Commands
	-- Start:	Subcommands
	L_GLOBALSTRINGS["Ignore NPC"]																= "npc"
	-- End:		Subcommands
	--
	-- Start:	Keybinds
	L_GLOBALSTRINGS["Open Settings"]															= "Open Settings"
	L_GLOBALSTRINGS["Calculate Reagents"]														= "Calculate Reagents"
	L_GLOBALSTRINGS["Add to Junker"]															= "Add to Junker"
	L_GLOBALSTRINGS["Add to Junker Global"]														= "Add to Junker Global"
	L_GLOBALSTRINGS["Add to Junker Blacklist"]													= "Add to Junker Blacklist"
	L_GLOBALSTRINGS["Add to Junker Global Blacklist"]											= "Add to Junker Global Blacklist"
	-- End:		Keybinds
	--
	-- Start:	DropDowns
	L_GLOBALSTRINGS["Stormsong Valley"]															= "Stormsong Valley"
	L_GLOBALSTRINGS["Tiragarde Sound"]															= "Tiragarde Sound"
	L_GLOBALSTRINGS["Drustvar"]																	= "Drustvar"
	L_GLOBALSTRINGS["Nazmir"]																	= "Nazmir"
	L_GLOBALSTRINGS["Vol'dun"]																	= "Vol'dun"
	L_GLOBALSTRINGS["Zuldazar"]																	= "Zuldazar"
	L_GLOBALSTRINGS["Random"]																	= "Random"
	L_GLOBALSTRINGS["Rarity: Poor"]																= "|cff9D9D9DPoor|r"
	L_GLOBALSTRINGS["Rarity: Common"]															= "|cffFFFFFFCommon|r"
	L_GLOBALSTRINGS["Rarity: Uncommon"]															= "|cff1EFF00Uncommon|r"
	L_GLOBALSTRINGS["Rarity: Rare"]																= "|cff0070DDRare|r"
	L_GLOBALSTRINGS["Rarity: Epic"]																= "|cffA335EEEpic|r"
	L_GLOBALSTRINGS["Automatic"]																= "Automatic"
	L_GLOBALSTRINGS["Automatic (No Epic)"]														= "Automatic (No Epic)"
	L_GLOBALSTRINGS["Notifications"]															= "Notifications"
	L_GLOBALSTRINGS["Item Level"]																= "Item Level"
	L_GLOBALSTRINGS["Sell Price"]																= "Sell Price"
	L_GLOBALSTRINGS["Disabled"]																	= "Disabled"
	-- End: 	DropDowns
	--
	-- Start: 	Tabs
	L_GLOBALSTRINGS["Tabs.General"] 															= "|T136243:0|t" .. " " .. "General" -- Icon: Engineering
	L_GLOBALSTRINGS["Tabs.Features"] 															= "|T134152:0|t" .. " " .. "Features" -- Icon: Hertz Locker (Achievement)
	L_GLOBALSTRINGS["Tabs.Quests"] 																= "|T464068:0|t" .. " " .. "Quests" -- Icon: That's a Lot of Turn Ins (Achievement)
	L_GLOBALSTRINGS["Tabs.ExpansionFeatures"] 													= "|T3257863:0|t" .. " " .. "Expansion Features" -- Icon: Hoarder of Torghast (Achievement)
	-- End: 	Tabs
	--
	-- Start: 	Headers
	L_GLOBALSTRINGS["Header.Toggles"] 															= "Toggles"
	L_GLOBALSTRINGS["Header.DropDowns"] 														= "DropDowns"
	L_GLOBALSTRINGS["Header.About"] 															= "About"
	L_GLOBALSTRINGS["Header.Resources"] 														= "Resources"
	L_GLOBALSTRINGS["Header.Garrisons"] 														= "Garrisons"
	L_GLOBALSTRINGS["Header.Torghast"] 															= "Torghast"
	-- End: 	Headers
	--
	-- Start: 	Descriptions
	L_GLOBALSTRINGS["MainOptions.Version"] 														= "|cffFFD100Version|r: " .. GetAddOnMetadata(addonName, "Version")
	L_GLOBALSTRINGS["MainOptions.Author"] 														= "|cffFFD100Author|r: Newtreants (AeriePeak-US) (aka Lightsky)"
	L_GLOBALSTRINGS["MainOptions.Contact"] 														= "|cffFFD100Contact|r: Lightsky#0658 (Discord)"
	-- End: 	Descriptions
	--
	-- Start: 	General Toggles
	L_GLOBALSTRINGS["General.Toggle.Enable"] 													= "Enable"
	L_GLOBALSTRINGS["General.Toggle.EnableDesc"] 												= "Enables and disables addon functionality.\n\nChecked: |cff218721Enabled|r\nUnchecked: |cffFF0000Disabled|r"
	L_GLOBALSTRINGS["General.Toggle.MinimapIcon"] 												= "Minimap Icon"
	L_GLOBALSTRINGS["General.Toggle.MinimapIconDesc"] 											= "Enables and disables the minimap icon.\n\nChecked: |cff218721Shown|r\nUnchecked: |cffFF0000Hidden|r"
	-- End: 	General Toggles
	--
	-- Start: 	General Buttons
	L_GLOBALSTRINGS["General.Button.OpenIssue"] 												= "Open Issue"
	L_GLOBALSTRINGS["General.Button.OpenIssue.Text"] 											= "|T236688:36|t\n\nCopy the link below, and thank you for opening an issue!"
	-- End: 	General Buttons
	--
	-- Start: 	Features Toggles
	L_GLOBALSTRINGS["Features.Toggle.Cinematics"] 												= "Cinematics"
	L_GLOBALSTRINGS["Features.Toggle.CinematicsDesc"] 											= "Automates skipping (most) cinematics and in-game movies.\n\nThere's a minor half-second delay before the automation triggers the skip."
	L_GLOBALSTRINGS["Features.Toggle.Dialog"] 													= "Dialog"
	L_GLOBALSTRINGS["Features.Toggle.DialogDesc"] 												= "Automates the selection of dialog options when speaking with NPCs.\n\nThis does |cffFF0000NOT|r apply to all dialogs!"
	L_GLOBALSTRINGS["Features.Toggle.Emotes"] 													= "Emotes"
	L_GLOBALSTRINGS["Features.Toggle.EmotesDesc"] 												= "Automates emotes for specific NPCs.\n\nExamples:\n- |cffFFD100Lake Frog|r: A Blade Fit For A Champion (Argent Tournament)\n- |cffFFD100Runestones|r: Repeat After Me (Maldraxxus)"
	L_GLOBALSTRINGS["Features.Toggle.Queues"] 													= "Queues"
	L_GLOBALSTRINGS["Features.Toggle.QueuesDesc"] 												= "Need to cook dinner but don't want to miss your queue? Check this button and let the addon worry about it."
	L_GLOBALSTRINGS["Features.Toggle.Speech"] 													= "Speech"
	L_GLOBALSTRINGS["Features.Toggle.SpeechDesc"] 												= "Automates interacting with specific NPC speech.\n\nExamples:\n|cffFFD100We'll Make an Aspirant Out of You|r: Bastion (World Quest)\n|cffFFD100The Games We Play|r: Ardenweald"
	L_GLOBALSTRINGS["Features.Toggle.Repairs"] 													= "Repairs"
	L_GLOBALSTRINGS["Features.Toggle.RepairsDesc"] 												= "Automates repairing at repair-capable merchants."
	L_GLOBALSTRINGS["Features.Toggle.Trainers"] 												= "Trainers"
	L_GLOBALSTRINGS["Features.Toggle.TrainersDesc"] 											= "Automates the purchase of skills from trainers.\n\nYou must have at least 50 gold more than the cost."
	L_GLOBALSTRINGS["Features.Toggle.Notes"] 													= "Notes"
	L_GLOBALSTRINGS["Features.Toggle.NotesDesc"] 												= "Adds notes to select NPC tooltips.\n\nExample:\n- |cffFFD100Lever-Locked Chests|r: Torghast"
	L_GLOBALSTRINGS["Features.Toggle.Waypoints"] 												= "Waypoints"
	L_GLOBALSTRINGS["Features.Toggle.WaypointsDesc"] 											= "If eligible, when a quest is accepted, the addon will automatically plot appropriate waypoints."
	L_GLOBALSTRINGS["Features.Toggle.Vehicles"] 												= "Vehicles"
	L_GLOBALSTRINGS["Features.Toggle.VehiclesDesc"] 											= "When enabled, your character will auto exit certain vehicles.\n\nVehicles are defined by the addon."
	L_GLOBALSTRINGS["Features.Toggle.WarMode"] 													= "War Mode"
	L_GLOBALSTRINGS["Features.Toggle.WarModeDesc"] 												= "Automates opting the player into War Mode when entering Orgrimmar or Stormwind City.\n\nDoes |cffFF0000NOT|r apply above level 50."
	-- End: 	Features Toggles
	--
	-- Start: 	Quests Toggles
	L_GLOBALSTRINGS["Quests.Toggle.AcceptQuests"] 												= "Accept Quests"
	L_GLOBALSTRINGS["Quests.Toggle.AcceptQuestsDesc"] 											= "Automatically accept all quests."
	L_GLOBALSTRINGS["Quests.Toggle.CompleteQuests"] 											= "Complete Quests"
	L_GLOBALSTRINGS["Quests.Toggle.CompleteQuestsDesc"] 										= "Automatically complete all quests."
	L_GLOBALSTRINGS["Quests.Toggle.PurchaseQuestItems"] 										= "Purchase Quest Items"
	L_GLOBALSTRINGS["Quests.Toggle.PurchaseQuestItemsDesc"] 									= "Automatically purchase quest items from merchants."
	L_GLOBALSTRINGS["Quests.Toggle.ThreadsOfFate"] 												= "Threads of Fate"
	L_GLOBALSTRINGS["Quests.Toggle.ThreadsOfFateDesc"] 											= "Opt in or out of Threads of Fate for Shadowlands.\n\n|cffFFD100Checked|r: Threads of Fate\n|cffFFD100Unchecked|r: Story"
	-- End: 	Quests Toggles
	--
	-- Start: 	Garrison Toggles
	L_GLOBALSTRINGS["Quests.Toggle.ArchitectTable"] 											= "Architect Table"
	L_GLOBALSTRINGS["Quests.Toggle.ArchitectTableDesc"] 										= "If enabled, allows the addon to automatically plot beginner buildings at the start of your Garrison."
	L_GLOBALSTRINGS["Quests.Toggle.MissionTable"] 												= "Mission Table"
	L_GLOBALSTRINGS["Quests.Toggle.MissionTableDesc"] 											= "If enabled, allows the addon to automatically start the first mission in your Garrison."
	L_GLOBALSTRINGS["Quests.Toggle.GarrisonOutposts"] 											= "Outposts"
	L_GLOBALSTRINGS["Quests.Toggle.GarrisonOutpostsDesc"] 										= "If enabled, allows the addon to automatically choose your Garrison outposts.\n\n|cffFFD100NOTE|r: Gorgrond is the only supported zone right now."
	-- End: 	Garrison Toggles
	--
	-- Start: 	DropDowns
	L_GLOBALSTRINGS["DropDowns.Disabled"]														= "Disabled"
	L_GLOBALSTRINGS["DropDowns.ChromieTime.Title"]												= "Chromie Time"
	L_GLOBALSTRINGS["DropDowns.ChromieTime.Desc"]												= "Automates the expansion to select when speaking with Chromie.\n\n|cffFFD100Default|r: Battle for Azeroth (Current Timeline)"
	L_GLOBALSTRINGS["DropDowns.ChromieTime.BC"]													= "The Burning Crusade"
	L_GLOBALSTRINGS["DropDowns.ChromieTime.WOTLK"]												= "Wrath of the Lich King"
	L_GLOBALSTRINGS["DropDowns.ChromieTime.CATA"]												= "Cataclysm"
	L_GLOBALSTRINGS["DropDowns.ChromieTime.MOP"]												= "Mists of Pandaria"
	L_GLOBALSTRINGS["DropDowns.ChromieTime.WOD"]												= "Warlords of Draenor"
	L_GLOBALSTRINGS["DropDowns.ChromieTime.LEGION"]												= "Legion"
	L_GLOBALSTRINGS["DropDowns.ChromieTime.BFA"]												= "Battle for Azeroth"
	L_GLOBALSTRINGS["DropDowns.ChromieTime.SL"]													= "Shadowlands"
	L_GLOBALSTRINGS["DropDowns.ChromieTime.DF"]													= "Dragonflight"
	-- End: 	DropDowns
	--
	-- Start: 	UI Text Elements
	L_GLOBALSTRINGS["Torghast Powers"]															= "Torghast Powers"
	L_GLOBALSTRINGS["Talents"]																	= "Talents"
	L_GLOBALSTRINGS["Party Play"]																= "Party Play"
	L_GLOBALSTRINGS["Enable"]																	= "Enable"
	L_GLOBALSTRINGS["Armor"]																	= "Armor"
	L_GLOBALSTRINGS["Consumable"]																= "Consumable"
	L_GLOBALSTRINGS["Recipe"]																	= "Recipe"
	L_GLOBALSTRINGS["Gem"]																		= "Gem"
	L_GLOBALSTRINGS["Tradeskill"]																= "Tradeskill"
	L_GLOBALSTRINGS["Weapon"]																	= "Weapon"
	L_GLOBALSTRINGS["Safe Mode"]																= "Safe Mode"
	L_GLOBALSTRINGS["Soulbound"]																= "Soulbound"
	L_GLOBALSTRINGS["Import"]																	= "Import"
	L_GLOBALSTRINGS["Add"]																		= "Add"
	L_GLOBALSTRINGS["Blacklist"]																= "Blacklist"
	L_GLOBALSTRINGS["Calculate"]																= "Calculate"
	L_GLOBALSTRINGS["Expand"]																	= "Expand"
	L_GLOBALSTRINGS["Collapse"]																	= "Collapse"
	L_GLOBALSTRINGS["Junker: Sell Item Text"]													= "|cffFFFFFFSELL|r"
	L_GLOBALSTRINGS["Junker: Sell Item Text Global"]											= "|cffFFFFFFSELL (GLOBAL)|r"
	L_GLOBALSTRINGS["Junker: Blacklisted Item Text"]											= "|cffFFFFFFBLACKLISTED|r"
	L_GLOBALSTRINGS["Junker: Blacklisted Item Text Global"]										= "|cffFFFFFFBLACKLISTED (GLOBAL)|r"
	L_GLOBALSTRINGS["Import from List"]															= "Import from List"
	L_GLOBALSTRINGS["Reagent Copy Message"]														= "Copy the string below to an external tool like Excel, Notepad, or Discord!\n\nNo, the addon can't add line breaks for you. Sorry. :("
	L_GLOBALSTRINGS["Junker Import Message"]													= "Would you like to import a list of item IDs or import from another addon?\n\nSupported AddOns:\n\nAutoVendor\nDejunk\n\n|cffFF6600Note|r: Only GLOBAL lists will be imported from these addons."
	L_GLOBALSTRINGS["Junker Import Item List Message"]											= "Please paste your comma-delimited list of items in the editbox below."
	L_GLOBALSTRINGS["Import from AddOn"]														= "Import from AddOn"
	-- End:		UI Text Elements
	--
	-- Start:	Tooltip Text Elements
	L_GLOBALSTRINGS["Minimap Icon Subtext"]														= "Configure the addon's settings.\nTailor an experience that best fits your playstyle!"
	L_GLOBALSTRINGS["Talents Check Button"]														= "Suggests talents for your current specialization upon\nreaching talent levels. This setting also applies to talent\nsystems like |cffFFFFFFThe Box of Many Things|r.\n\n|cffCB453DNote|r: This feature won't output info if Logging is disabled."
	L_GLOBALSTRINGS["Party Play Check Button"]													= "|cffCB453DNote|r: This feature has no affect outside groups.\n\nWoW is better with friends. If you play the game\nwith friends, and want to keep them in the loop\non your quest activity, then enable |cffFFFFFFParty Play|r!\n\n- Reports when quests are accepted\n- Reports when quests are completed\n- Reports quest activity (eg. X/Y harpies slain)\n- Auto shares quests"
	L_GLOBALSTRINGS["Party Play Announce Check Button"]											= "|cffFFFFFFParty Play: Announce|r\nIf you don't want to broadcast when you've\naccepted a quest, then keep this unchecked."
	L_GLOBALSTRINGS["Party Play Auto Share Check Button"]										= "|cffFFFFFFParty Play: Auto Share|r\nIf you don't want to auto share quests,\nthen keep this unchecked."
	L_GLOBALSTRINGS["Junker Check Button"]														= "Enables the addon's auto sell system, |cffFFFFFFJunker|r.\n\nBy default, |cffFFFFFFJunker|r will auto sell player-defined\nand POOR quality items. Use the buttons below\nto filter in additional items.\n\nAlternatively, use the Import button in the lower\nright to import items from another auto sell addon,\n or to import a comma-delimited list of item IDs.\n\n|cffFFFFFF/hmp junker add id|r\n\n|cffFFFFFF/hmp junker blacklist id|r\n\nThe commands above can be used to add/blacklist items\nyou don't have in your bags."
	L_GLOBALSTRINGS["Junker Safe Mode Check Button"]											= "When |cffFFFFFFSafe Mode|r is enabled, the |cffFFFFFFJunker|r system will\nsell items in batches of 12. This ensures the player can\nuse the buy back tab to repurchase accidentally\nsold items.\n\nDefault: |cffFFFFFFEnabled|r"
	L_GLOBALSTRINGS["Junker Soulbound Check Button"]											= "When enabled, Junker will automatically sell items that are\n-25+ item levels below your current item level.\n\nDefault: |cffFFFFFFEnabled|r"
	L_GLOBALSTRINGS["Guild Bank Sort Button"]													= "This button can be used to sort the current\nguild bank tab. This only works for the\nguild leader.\n\n|cffFFFFFFCurrently disabled, slated for a future release.|r"
	L_GLOBALSTRINGS["Junker Merchant Button"]													= "This button can be used to trigger the selling process."
	L_GLOBALSTRINGS["Transmog Button"]															= "|cffFFFFFFLearn All Transmog|r\nClick this button to learn all USABLE and UNKNOWN\ntransmog in your bags.\n\n|cffADD8E6Added by HelpMePlay|r"
	L_GLOBALSTRINGS["Quest Rewards DropDown"]													= "|cffFFFFFFQuest Rewards|r\nAutomates how quest rewards are selected.\n\n|cffFFFFFFItem Level:|r Selects a reward with a higher item level.\n|cffFFFFFFSell Price:|r Selects the reward with the highest sell price and automatically adds it to Junker."
	L_GLOBALSTRINGS["Torghast Powers DropDown"]													= "|cffFFFFFFTorghast Powers|r\nAutomates the behavior for Torghast Powers.\n\n|cffFFFFFFAutomatic|r: Powers are auto selected based on a\npriority list.\n|cffFFFFFFAutomatic (No Epic)|r: Powers are auto selected based on a\npriority list, but epic powers are ignored.\n|cffFFFFFFNotifications|r: Powers are suggested to the player using\nthe chat window. If only 1 Power is available, then it\n will be auto selected.\n|cffFFFFFFDisabled|r: HelpMePlay won't assist with Torghast Powers.\n\n|cffCB453DNote|r: This feature won't output info if Logging is disabled."
	L_GLOBALSTRINGS["BFA Zone Selection DropDown"]												= "|cffFFFFFFBattle for Azeroth Zone Selection|r\nPick the zone you want the automation to\nselect from the adventure map in Boralus\nor Zuldazar."
	L_GLOBALSTRINGS["SL Zone Selection DropDown"]												= "|cffFFFFFFShadowlands Zone Selection|r\nPick the zone you want the automation to\nselect from the adventure map in Oribos."
	L_GLOBALSTRINGS["Covenants DropDown"]														= "|cffFFFFFFCovenants|r\nAutomates the Covenant to select when interacting with\nthe Helm of Domination."
	L_GLOBALSTRINGS["Junker: Rarity DropDown"]													= "Select the maximum rarity threshold for filtering items. Items at\nthe quality you choose and below are considered.\n\nDefault: |cff9d9d9dPoor|r"
	L_GLOBALSTRINGS["Calculate Button"]															= "Calculates the amount of reagents required to craft all KNOWN\nrecipes for appearances you've yet to collect.\n\nDoes |cffFFFFFFNOT|r apply outside production professions.\n\n|cffADD8E6Added by HelpMePlay|r"
	L_GLOBALSTRINGS["Expand Button"]															= "Expands the headers below.\n\n|cffADD8E6Added by HelpMePlay|r"
	L_GLOBALSTRINGS["Collapse Button"]															= "Collapses the headers below.\n\n|cffADD8E6Added by HelpMePlay|r"
	-- End:		Tooltip Text Elements
	--
	-- Start: 	Text Output
	L_GLOBALSTRINGS["Colored Addon Name"]														= "|cff00FFFF"..addonName.."|r"
	L_GLOBALSTRINGS["Addon Short Name"]															= "HMP"
	L_GLOBALSTRINGS["Available Commands"]														= "|cffFFFFFFAvailable Commands|r"
	L_GLOBALSTRINGS["Added Item Text"]															= "Added %s to Junker!"
	L_GLOBALSTRINGS["Added Item Text Global"]													= "Added %s to Junker (Global)!"
	L_GLOBALSTRINGS["Blacklisted Item Text"]													= "Blacklisted %s in Junker!"
	L_GLOBALSTRINGS["Blacklisted Item Text Global"]												= "Blacklisted %s in Junker (Global)!"
	L_GLOBALSTRINGS["Imported To Junker From List Text"]										= "Imported %s item(s) to Junker!"
	L_GLOBALSTRINGS["Imported To Junker Text"]													= "Imported all items from %s to Junker!"
	L_GLOBALSTRINGS["Level Congrats Text"]														= "Congratulations on reaching level %s! Suggested talent: %s"
	L_GLOBALSTRINGS["Dialog Removed"]															= "Removed \"%s\" from database."
	L_GLOBALSTRINGS["Cinematic or Movie Not Skipped"]											= "The cinematic or movie was intentionally NOT skipped!"
	L_GLOBALSTRINGS["No Auto Sell AddOn Enabled"]												= "No auto sell addon enabled."
	L_GLOBALSTRINGS["Prequisite Talent Being Researched"]										= "There is a prerequisite talent being researched. Please come back later or research something else."
	L_GLOBALSTRINGS["Talent Purchase Text"]														= "Purchase the following talent: "
	L_GLOBALSTRINGS["Talent Not Enough Currency Text"]											= "You need more currency! Amount Needed"
	L_GLOBALSTRINGS["Party Play Enabled Warning Text"]											= "[|cffFF7900WARNING|r] You've joined a group with Party Play enabled."
	L_GLOBALSTRINGS["War Mode Reminder: Alliance"]												= "You leveled to 20! You should return to Stormwind City, so I can enable War Mode."
	L_GLOBALSTRINGS["War Mode Reminder: Horde"]													= "You leveled to 20! You should return to Orgrimmar, so I can enable War Mode."
	L_GLOBALSTRINGS["Quest Turned In Text"]														= "Turned in"
	L_GLOBALSTRINGS["Quest Removed Text"]														= "Removed"
	L_GLOBALSTRINGS["Quest Accepted Text"]														= "Accepted"
	L_GLOBALSTRINGS["Profession Reagents being Calculated"]										= "Reagent calculation in progress..."
	-- End:		Text Output
	--
	-- Start:	Warning Text Output
	L_GLOBALSTRINGS["Red WARNING"]																= "|cffFF0000WARNING:|r "
	L_GLOBALSTRINGS["Reagent Data Missing"]														= "[|cffFF7900WARNING|r] Critical reagent data wasn't processed successfully. Please try again."
	L_GLOBALSTRINGS["Locale Not Supported"]														= addonName .. " does NOT support " .. locale .. "! Please consider aiding in updating the addon to work for your language."
	-- End:		Warning Text Output
	--
	-- Start:	Speech Creatures
	L_GLOBALSTRINGS["Al'dalil"]																	= "Al'dalil"
	L_GLOBALSTRINGS["Playful Trickster"]														= "Playful Trickster"
	L_GLOBALSTRINGS["Trainer Ikaros"]															= "Trainer Ikaros"
	-- End:		Speech Creatures
	--
	-- Start:	In-Game Error Checks
	L_GLOBALSTRINGS["Already on that quest."]													= "already on that quest."
	-- End:		In-Game Error Checks
	--
	-- Start:	Speech Text Checks
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
	-- End:		Speech Text Checks
end

addonTable.L_GLOBALSTRINGS = L_GLOBALSTRINGS