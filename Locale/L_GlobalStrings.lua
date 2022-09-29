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

if (isLocaleSupported) then
	-- Start: 	Commands
	L_GLOBALSTRINGS["Command.Slash1"]															= "hmp"
	L_GLOBALSTRINGS["Command.Confirm"] 															= "confirm"
	L_GLOBALSTRINGS["Command.Dialog"] 															= "dialog"
	L_GLOBALSTRINGS["Command.Ignore"] 															= "ignore"
	L_GLOBALSTRINGS["Command.Quest"] 															= "quest"
	L_GLOBALSTRINGS["Command.Junker"] 															= "junker"
	L_GLOBALSTRINGS["Command.Help"] 															= "help"
	-- End: 	Commands
	--
	-- Start:	Subcommands
	L_GLOBALSTRINGS["Command.Subcommand.Ignore.NPC"]											= "npc"
	L_GLOBALSTRINGS["Command.Subcommand.Junker.Add"] 											= "add"
	L_GLOBALSTRINGS["Command.Subcommand.Junker.Blacklist"] 										= "blacklist"
	-- End:		Subcommands
	--
	-- Start:	Keybinds
	L_GLOBALSTRINGS["Keybind.OpenSettings"]														= "Open Settings"
	L_GLOBALSTRINGS["Keybind.Junker.Add"]														= "Add to Junker"
	L_GLOBALSTRINGS["Keybind.Junker.Add.Global"]												= "Add to Junker Global"
	L_GLOBALSTRINGS["Keybind.Junker.Blacklist"]													= "Add to Junker Blacklist"
	L_GLOBALSTRINGS["Keybind.Junker.Blacklist.Global"]											= "Add to Junker Global Blacklist"
	-- End:		Keybinds
	--
	-- Start: 	Tabs
	L_GLOBALSTRINGS["Tabs.General"] 															= "|T136243:0|t" .. " " .. "General" -- Icon: Engineering
	L_GLOBALSTRINGS["Tabs.Features"] 															= "|T134152:0|t" .. " " .. "Features" -- Icon: Hertz Locker (Achievement)
	L_GLOBALSTRINGS["Tabs.Quests"] 																= "|T464068:0|t" .. " " .. "Quests" -- Icon: That's a Lot of Turn Ins (Achievement)
	L_GLOBALSTRINGS["Tabs.ExpansionFeatures"] 													= "|T3257863:0|t" .. " " .. "Expansion Features" -- Icon: Hoarder of Torghast (Achievement)
	L_GLOBALSTRINGS["Tabs.Junker"] 																= "|T132281:0|t" .. " " .. "Junker" -- Icon: Repair
	-- End: 	Tabs
	--
	-- Start: 	Headers
	L_GLOBALSTRINGS["Header.Toggles"] 															= "Toggles"
	L_GLOBALSTRINGS["Header.DropDowns"] 														= "DropDowns"
	L_GLOBALSTRINGS["Header.About"] 															= "About"
	L_GLOBALSTRINGS["Header.Resources"] 														= "Resources"
	L_GLOBALSTRINGS["Header.Garrisons"] 														= "Garrisons"
	L_GLOBALSTRINGS["Header.VisionsOfNzoth"] 													= "Visions of N'Zoth"
	L_GLOBALSTRINGS["Header.Torghast"] 															= "Torghast"
	L_GLOBALSTRINGS["Header.PartyPlay"] 														= "Party Play"
	-- End: 	Headers
	--
	-- Start: 	Descriptions
	L_GLOBALSTRINGS["MainOptions.Festive.HallowsEnd"] 											= "|T236545:0|t" .. " " .. "Happy |cffF99943Hallow's End|r!" .. " " .. "Good luck on your" .. " " .. "|cffa335ee|Hitem:37012::::::::60:73:::::::::|h[The Horseman's Reins]|h|r" .. " " .. "this year!" .. " " .. "|T236545:0|t"
	L_GLOBALSTRINGS["MainOptions.Festive.WinterVeil"] 											= "|T133169:0|t" .. " " .. "Merry |cff3EA425Winter Veil|r!" .. " " .. "'Tis the season to be jolly! Fa-la-la-la-la-Ogri'la! Good luck on your" .. " " .. "|cffa335ee|Hitem:128671::::::::60:73:::::::::|h[Minion of Grumpus]|h|r" .. " " .. "this year!" .. " " .. "|T133170:0|t"
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
	-- Start: 	Features DropDowns
	L_GLOBALSTRINGS["DropDowns.Features.Covenant.Title"] 										= "Covenants"
	L_GLOBALSTRINGS["DropDowns.Features.Covenant.Desc"] 										= "Automates the Covenant to select when interacting with board in Oribos."
	L_GLOBALSTRINGS["DropDowns.Features.Covenant.Kyrian"] 										= "|T3257748:0|t" .. " " .. "Kyrian"
	L_GLOBALSTRINGS["DropDowns.Features.Covenant.Necrolord"] 									= "|T3257749:0|t" .. " " .. "Necrolord"
	L_GLOBALSTRINGS["DropDowns.Features.Covenant.NightFae"] 									= "|T3257750:0|t" .. " " .. "Night Fae"
	L_GLOBALSTRINGS["DropDowns.Features.Covenant.Venthyr"] 										= "|T3257751:0|t" .. " " .. "Venthyr"
	-- End: 	Features DropDowns
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
	L_GLOBALSTRINGS["Quests.Toggle.AdventureMaps"] 												= "Adventure Maps"
	L_GLOBALSTRINGS["Quests.Toggle.AdventureMapsDesc"] 											= "Toggles whether or not the addon should interact with Call Boards in the major cities, zone boards in Boralus and Dazar'alor, and the board in Oribos."
	-- End: 	Quests Toggles
	--
	-- Start: 	Quests DropDowns
	L_GLOBALSTRINGS["Quests.DropDowns.ChromieTime.Title"]										= "Chromie Time"
	L_GLOBALSTRINGS["Quests.DropDowns.ChromieTime.Desc"]										= "Automates the expansion to select when speaking with Chromie.\n\n|cffFFD100Default|r: Battle for Azeroth (Current Timeline)"
	L_GLOBALSTRINGS["Quests.DropDowns.ChromieTime.BC"]											= "The Burning Crusade"
	L_GLOBALSTRINGS["Quests.DropDowns.ChromieTime.WOTLK"]										= "Wrath of the Lich King"
	L_GLOBALSTRINGS["Quests.DropDowns.ChromieTime.CATA"]										= "Cataclysm"
	L_GLOBALSTRINGS["Quests.DropDowns.ChromieTime.MOP"]											= "Mists of Pandaria"
	L_GLOBALSTRINGS["Quests.DropDowns.ChromieTime.WOD"]											= "Warlords of Draenor"
	L_GLOBALSTRINGS["Quests.DropDowns.ChromieTime.LEGION"]										= "Legion"
	L_GLOBALSTRINGS["Quests.DropDowns.ChromieTime.BFA"]											= "Battle for Azeroth"
	L_GLOBALSTRINGS["Quests.DropDowns.ChromieTime.SL"]											= "Shadowlands"
	L_GLOBALSTRINGS["Quests.DropDowns.ChromieTime.DF"]											= "Dragonflight"
	L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.BFA.Title"]									= "BFA Zone Selection"
	L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.BFA.Desc"]									= "Automates the first zone to select in |cffFFD100Battle for Azeroth|r."
	L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.BFA.STORMSONGVALLEY"]						= "|T2065627:0|t" .. " " .. "Stormsong Valley"
	L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.BFA.TIRAGARDESOUND"]						= "|T2065630:0|t" .. " " .. "Tiragarde Sound"
	L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.BFA.DRUSTVAR"]								= "|T2065567:0|t" .. " " .. "Drustvar"
	L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.BFA.NAZMIR"]								= "|T2032229:0|t" .. " " .. "Nazmir"
	L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.BFA.VOLDUN"]								= "|T2065632:0|t" .. " " .. "Vol'dun"
	L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.BFA.ZULDAZAR"]								= "|T2065640:0|t" .. " " .. "Zuldazar"
	L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.SL.Title"]									= "SL Zone Selection"
	L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.SL.Desc"]									= "Automates the first zone to select in |cffFFD100Shadowlands|r."
	L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.SL.ARDENWEALD"]								= "|T3551336:0|t" .. " " .. "Ardenweald"
	L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.SL.BASTION"]								= "|T3551337:0|t" .. " " .. "Bastion"
	L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.SL.MALDRAXXUS"]								= "|T3551338:0|t" .. " " .. "Maldraxxus"
	L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.SL.REVENDRETH"]								= "|T3551339:0|t" .. " " .. "Revendreth"
	L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.SL.TORGHAST"]								= "|T3257863:0|t" .. " " .. "Torghast"
	L_GLOBALSTRINGS["Quests.DropDowns.QuestRewards.Title"]										= "Quest Rewards"
	L_GLOBALSTRINGS["Quests.DropDowns.QuestRewards.Desc"]										= "Automates how quest rewards are selected.\n\n|cffFFD100Item Level|r: Selects the item of the highest item level that would replace a non-heirloom item.\n|cffFFD100Sell Price|r: Selects the reward with the highest sell price and automatically adds it to Junker."
	L_GLOBALSTRINGS["Quests.DropDowns.QuestRewards.ItemLevel"]									= "Item Level"
	L_GLOBALSTRINGS["Quests.DropDowns.QuestRewards.SellPrice"]									= "Sell Price"
	-- End: 	Quests DropDowns
	--
	-- Start: 	Party Play Toggles
	L_GLOBALSTRINGS["Quests.Toggle.PartyPlayDesc"] 												= "|cffFFD100NOTE|r: This feature has no affect outside groups.\n\nWoW is better with friends. If you play the game with friends, and want to keep them in the loop on your quest activity, then enable |cffFFD100Party Play|r!\n\nWhat it does:\n- Reports when quests are accepted\n- Reports when quests are completed\n- Reports quest activity (eg. X/Y harpies slain)\n- Auto shares quests"
	L_GLOBALSTRINGS["Quests.Toggle.PartyPlayAnnounce"]											= "Announce"
	L_GLOBALSTRINGS["Quests.Toggle.PartyPlayAnnounceDesc"]										= "Automatically report quest-related activity like accepting or removing quests, slaying an enemy, collecting quest items around the quest area, etc.\n\n|cffFFD100Checked|r: Enabled\n|cffFFD100Unchecked|r: Disabled"
	L_GLOBALSTRINGS["Quests.Toggle.PartyPlayAutoShare"]											= "Auto Share"
	L_GLOBALSTRINGS["Quests.Toggle.PartyPlayAutoShareDesc"]										= "Automatically share quests with party members as you accept them. For best results, your party members should also have HelpMePlay with |cffFFD100Accept Quests|r enabled.\n\n|cffFFD100Checked|r: Enabled\n|cffFFD100Unchecked|r: Disabled"
	-- End: 	Party Play Toggles
	--
	-- Start: 	Party Play Output Text
	L_GLOBALSTRINGS["PartyPlay.Output.Text.EnabledWarningText"] 								= "[|cffFF7900WARNING|r] You've joined a group with Party Play enabled."
	L_GLOBALSTRINGS["PartyPlay.Output.Text.QuestTurnedInText"] 									= "Turned in"
	L_GLOBALSTRINGS["PartyPlay.Output.Text.QuestAcceptedText"] 									= "Accepted"
	L_GLOBALSTRINGS["PartyPlay.Output.Text.QuestRemovedText"] 									= "Removed"
	-- End: 	Party Play Output Text
	--
	-- Start: 	Party Play Input Text
	L_GLOBALSTRINGS["PartyPlay.Input.Text.AlreadyOnQuestText"] 									= "already on that quest."
	-- End: 	Party Play Input Text
	--
	-- Start: 	Expansion Features Toggles
	L_GLOBALSTRINGS["ExpansionFeatures.Toggle.ArchitectTable"] 									= "Architect Table"
	L_GLOBALSTRINGS["ExpansionFeatures.Toggle.ArchitectTableDesc"] 								= "If enabled, allows the addon to automatically plot beginner buildings at the start of your Garrison."
	L_GLOBALSTRINGS["ExpansionFeatures.Toggle.MissionTable"] 									= "Mission Table"
	L_GLOBALSTRINGS["ExpansionFeatures.Toggle.MissionTableDesc"] 								= "If enabled, allows the addon to automatically start the first mission in your Garrison."
	L_GLOBALSTRINGS["ExpansionFeatures.Toggle.GarrisonOutposts"] 								= "Outposts"
	L_GLOBALSTRINGS["ExpansionFeatures.Toggle.GarrisonOutpostsDesc"] 							= "If enabled, allows the addon to automatically choose your Garrison outposts.\n\n|cffFFD100NOTE|r: Gorgrond is the only supported zone right now."
	L_GLOBALSTRINGS["ExpansionFeatures.Toggle.BoxOfManyThings"] 								= "The Box of Many Things"
	L_GLOBALSTRINGS["ExpansionFeatures.Toggle.BoxOfManyThingsDesc"] 							= "Check this button if you want the addon to inform you of the best path through |cffFFD100The Box of Many Things|r."
	L_GLOBALSTRINGS["ExpansionFeatures.Toggle.TitanicResearch"] 								= "Titanic Research"
	L_GLOBALSTRINGS["ExpansionFeatures.Toggle.TitanicResearchDesc"] 							= "Check this button if you want the addon to inform you of the best path through |cffFFD100Titanic Research|r."
	-- End: 	Expansion Features Toggles
	--
	-- Start: 	Junker Toggles
	L_GLOBALSTRINGS["Junker.Toggle.EnableDesc"] 												= "Enables and disables the Junker subsystem.\n\nBy default, Junker will auto sell player-defined and poor quality items. Use the buttons below to filter in additional items.\n\nAlternatively, use the Import button to import items from another auto sell addon or a comma-delimited list of item IDs.\n\n|cffFFD100/hmp junker add id|r\n\n|cffFFD100/hmp junker blacklist id|r\n\nThe commands above can be used to add/blacklist items you don't have in your inventory."
	L_GLOBALSTRINGS["Junker.Toggle.SafeMode"] 													= "Safe Mode"
	L_GLOBALSTRINGS["Junker.Toggle.SafeModeDesc"] 												= "When |cffFFD100Safe Mode|r is enabled, Junker will sell items in batches of 12. This ensures the player can use the buy back tab to repurchase items."
	L_GLOBALSTRINGS["Junker.Toggle.SoulboundMode"] 												= "Soulbound Mode"
	L_GLOBALSTRINGS["Junker.Toggle.SoulboundModeDesc"] 											= "When enabled, Junker will automatically sell soulbound items that are at least 30 item levels below your current item level.\n\nThis is used to save the player time from adding legacy items to their sell list unnecessarily."
	L_GLOBALSTRINGS["Junker.Toggle.JunkerArmor"] 												= "Armor"
	L_GLOBALSTRINGS["Junker.Toggle.JunkerArmorDesc"] 											= "Automatically sell appropriate items of type |cffFFD100Armor|r."
	L_GLOBALSTRINGS["Junker.Toggle.JunkerConsumable"] 											= "Consumables"
	L_GLOBALSTRINGS["Junker.Toggle.JunkerConsumableDesc"] 										= "Automatically sell appropriate items of type |cffFFD100Consumable|r."
	-- End: 	Junker Toggles
	--
	-- Start: 	Junker Buttons
	L_GLOBALSTRINGS["Junker.Button.Import"] 													= "Import"
	L_GLOBALSTRINGS["Junker.Button.Import.InitialText"] 										= "|T132281:36|t\n\n" .. "Would you like to import a list of item IDs or import from another addon?\n\nSupported AddOns:\n\nAutoVendor\nDejunk\n\n|cffFFD100NOTE|r: Only account-wide lists will be imported from these addons."
	L_GLOBALSTRINGS["Junker.Button.Import.CancelText"] 											= "|T132281:36|t\n\n" .. "Please paste your comma-delimited list of items in the editbox below."
	L_GLOBALSTRINGS["Junker.Button.Import.AddText"] 											= "Add"
	L_GLOBALSTRINGS["Junker.Button.Import.BlacklistText"] 										= "Blacklist"
	L_GLOBALSTRINGS["Junker.Button.Import.FromAddOnText"] 										= "Import from AddOn"
	L_GLOBALSTRINGS["Junker.Button.Import.FromListText"] 										= "Import from List"
	-- End: 	Junker Buttons
	--
	-- Start: 	Junker UI Text Elements
	L_GLOBALSTRINGS["Junker.UI.Text.ButtonDesc"] 												= "This button can be used to trigger the selling process.\n\n|cffADD8E6Added by HelpMePlay|r"
	-- End: 	Junker UI Text Elements
	--
	-- Start: 	Junker Tooltip Text Elements
	L_GLOBALSTRINGS["Junker.Tooltip.Text.Sell"]													= "|cffFFFFFFSELL|r"
	L_GLOBALSTRINGS["Junker.Tooltip.Text.SellGlobal"]											= "|cffFFFFFFSELL (GLOBAL)|r"
	L_GLOBALSTRINGS["Junker.Tooltip.Text.Blacklisted"]											= "|cffFFFFFFBLACKLISTED|r"
	L_GLOBALSTRINGS["Junker.Tooltip.Text.BlacklistedGlobal"]									= "|cffFFFFFFBLACKLISTED (GLOBAL)|r"
	-- End: 	Junker Tooltip Text Elements
	--
	-- Start: 	Junker Output Text
	L_GLOBALSTRINGS["Junker.Output.Text.ImportedFromAddOnText"] 								= "Imported all items from %s to Junker!"
	L_GLOBALSTRINGS["Junker.Output.Text.ImportedFromListText"] 									= "Imported %s item(s) to Junker!"
	L_GLOBALSTRINGS["Junker.Output.Text.NoAddOnEnabledText"] 									= "No auto sell addon enabled."
	-- End: 	Junker Output Text
	--
	-- Start: 	DropDowns
	L_GLOBALSTRINGS["DropDowns.Disabled"]														= "Disabled"
	-- End: 	DropDowns
	--
	-- Start: 	Torghast DropDowns
	L_GLOBALSTRINGS["DropDowns.Torghast.AnimaPowers.Title"]										= "Anima Powers"
	L_GLOBALSTRINGS["DropDowns.Torghast.AnimaPowers.Desc"]										= "Choose how the addon should respond to Anima powers.\n\n|cffFFD100Automatic|r: Automatically select powers based on a static power list.\n|cffFFD100No Epics|r: Automatically select powers based on a static power list but ignore all epic powers.\n|cffFFD100Notify|r: Suggest powers to you via the in-game chat window."
	L_GLOBALSTRINGS["DropDowns.Torghast.AnimaPowers.Auto"]										= "Automatic"
	L_GLOBALSTRINGS["DropDowns.Torghast.AnimaPowers.NoEpics"]									= "No Epics (Automatic)"
	L_GLOBALSTRINGS["DropDowns.Torghast.AnimaPowers.Notify"]									= "Notify"
	-- End: 	Torghast DropDowns
	--
	-- Start: 	Junker DropDowns
	L_GLOBALSTRINGS["DropDowns.Junker.Rarity.Title"]											= "Rarity"
	L_GLOBALSTRINGS["DropDowns.Junker.Rarity.Desc"]												= "Select the minimum item rarity threshold for Junker |cffFFD100NOT|r to sell.\n\nSetting this rarity to Uncommon, for example, would tell rarity to sell all Poor and Common items without player input."
	L_GLOBALSTRINGS["DropDowns.Junker.Rarity.Poor"]												= "|cff9D9D9DPoor|r"
	L_GLOBALSTRINGS["DropDowns.Junker.Rarity.Common"]											= "|cffFFFFFFCommon|r"
	L_GLOBALSTRINGS["DropDowns.Junker.Rarity.Uncommon"]											= "|cff1EFF00Uncommon|r"
	L_GLOBALSTRINGS["DropDowns.Junker.Rarity.Rare"]												= "|cff0070DDRare|r"
	L_GLOBALSTRINGS["DropDowns.Junker.Rarity.Epic"]												= "|cffA335EEEpic|r"
	-- End: 	Junker DropDowns
	--
	-- Start: 	Trade Skill UI Buttons
	L_GLOBALSTRINGS["TradeSkill.UI.Button.ExpandCollapse.Text"] 								= "<->"
	L_GLOBALSTRINGS["TradeSkill.UI.Button.ExpandCollapse.Desc"] 								= "Expands or collapses the headers below.\n\n|cffADD8E6Added by HelpMePlay|r"
	L_GLOBALSTRINGS["TradeSkill.UI.Button.Calculate.PopupText"] 								= "Copy the string below to an external tool like Excel, Notepad, or Discord!\n\nNo, the addon can't add line breaks for you. Sorry. :("
	L_GLOBALSTRINGS["TradeSkill.UI.Button.Calculate.Text"] 										= "Calculate"
	L_GLOBALSTRINGS["TradeSkill.UI.Button.Calculate.Desc"] 										= "Calculates the amount of reagents required to craft all KNOWN\nrecipes for appearances you've yet to collect.\n\nDoes |cffFFFFFFNOT|r apply outside production professions.\n\n|cffADD8E6Added by HelpMePlay|r"
	-- End: 	Trade Skill UI Buttons
	--
	-- Start: 	Trade Skill UI Output Text
	L_GLOBALSTRINGS["TradeSkill.UI.Output.Text.CalculationInProgressText"] 						= "Reagent calculation in progress..."
	-- End: 	Trade Skill UI Output Text
	--
	-- Start: 	Inventory UI Buttons
	L_GLOBALSTRINGS["TradeSkill.UI.Button.Inventory.Desc"] 										= "|cffFFFFFFLearn All Transmog|r\nClick this button to learn all USABLE and UNKNOWN\ntransmog in your bags.\n\n|cffADD8E6Added by HelpMePlay|r"
	-- End: 	Inventory UI Buttons
	--
	-- Start: 	Minimap UI Buttons
	L_GLOBALSTRINGS["Minimap.UI.Button.SubText"] 												= "Configure the addon's settings.\nTailor an experience that best fits your playstyle!"
	-- End: 	Minimap UI Buttons
	--
	-- Start: 	Text Output
	L_GLOBALSTRINGS["Text.Output.Acronym"]														= "HMP"
	L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"]												= "|cff00FFFF"..addonName.."|r"
	L_GLOBALSTRINGS["Text.Output.DialogRemoved"]												= "Removed \"%s\" from database."
	L_GLOBALSTRINGS["Text.Output.NotEnoughCurrency"]											= "You need more currency! Amount Needed"
	L_GLOBALSTRINGS["Text.Output.PrerequisiteTalentBeingResearched"]							= "There is a prerequisite talent being researched. Please come back later or research something else."
	L_GLOBALSTRINGS["Text.Output.PurchaseTalentText"]											= "Purchase the following talent: "
	-- End:		Text Output
	--
	-- Start: 	Notifications
	L_GLOBALSTRINGS["Notifications.WarModeReminder.Alliance"] 									= "You leveled to 20! You should return to Stormwind City, so I can enable War Mode."
	L_GLOBALSTRINGS["Notifications.WarModeReminder.Horde"] 										= "You leveled to 20! You should return to Orgrimmar, so I can enable War Mode."
	-- End: 	Notifications
	--
	-- Start:	Speech Text Checks
	L_GLOBALSTRINGS["Speech.PlayfulTrickster.Praise"]											= "not so much as a word of praise!"
	L_GLOBALSTRINGS["Speech.PlayfulTrickster.Cheer"]											= "the other spriggans were all cheering my name for days!"
	L_GLOBALSTRINGS["Speech.PlayfulTrickster.Dance"]											= "dance with me!"
	L_GLOBALSTRINGS["Speech.PlayfulTrickster.Introduce"]										= "introductions are an important part of first impressions!"
	L_GLOBALSTRINGS["Speech.PlayfulTrickster.Thank"]											= "some ask permission, and always thank us for our trouble."
	L_GLOBALSTRINGS["Speech.PlayfulTrickster.Flex"]												= "how strong he must have been!"
	L_GLOBALSTRINGS["Speech.Al'dalil.Buttons1"]													= "buttons! quickly, the buttons!"
	L_GLOBALSTRINGS["Speech.Al'dalil.Buttons2"]													= "start pressing buttons!"
	L_GLOBALSTRINGS["Speech.Al'dalil.Lever1"]													= "use the lever, maw walker!"
	L_GLOBALSTRINGS["Speech.Al'dalil.Lever2"]													= "pull on one of the levers!"
	L_GLOBALSTRINGS["Speech.Al'dalil.Bonk1"]													= "a sharp strike to the head always works!"
	L_GLOBALSTRINGS["Speech.Al'dalil.Bonk2"]													= "there are no operating instructions! try hitting it!"
	L_GLOBALSTRINGS["Speech.TrainerIkaros.Dodge"]												= "dodge"
	L_GLOBALSTRINGS["Speech.TrainerIkaros.Strike"]												= "strike"
	L_GLOBALSTRINGS["Speech.TrainerIkaros.Jab"]													= "jab"
	L_GLOBALSTRINGS["Speech.TrainerIkaros.Sweep"]												= "sweep"
	L_GLOBALSTRINGS["Speech.TrainerIkaros.Kick"]												= "kick"
	L_GLOBALSTRINGS["Speech.TrainerIkaros.Parry"]												= "parry"
	L_GLOBALSTRINGS["Speech.SoulEater.Shake"]													= "the soul eater tries to shake you off! hold on tightly!"
	L_GLOBALSTRINGS["Speech.SoulEater.Veer"]													= "the soul eater tries to veer away. give it a kick in the right direction!"
	L_GLOBALSTRINGS["Speech.SoulEater.Writhe"]													= "the soul eater writhes about. pull the reins to tire it!"
	L_GLOBALSTRINGS["Speech.TalonedFlayedwing.Praise"]											= "the flayedwing is flying smoothly, praise them!"
	L_GLOBALSTRINGS["Speech.TalonedFlayedwing.Scared"]											= "the flayedwing is scared, soothe it with gentle pats!"
	L_GLOBALSTRINGS["Speech.TalonedFlayedwing.Shake"]											= "the flayedwing is trying to shake you off, hold on tight!"
	-- End:		Speech Text Checks
end

addonTable.L_GLOBALSTRINGS = L_GLOBALSTRINGS