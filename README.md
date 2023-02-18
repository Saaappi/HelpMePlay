# HelpMePlay

> Build and tailor an automated gaming experience that best fits your playstyle!

[<img src="https://i.ibb.co/VTWYW8S/HMPLogo.jpg" width="100%">](https://addons.wago.io/addons/helpmeplay)

HelpMePlay is a World of Warcraft addon built to automate as many tasks in the game as possible. Players should free up their time vendoring items one-by-one, accepting/completing quests, and even selecting gossip options from NPCs.

> *All options are disabled by default!* Use <kbd>/hmp</kbd> to open the options or configure a keybind!

Enter Azeroth, grab some ale, and let HelpMePlay take care of the heavy lifting. Read on to learn more!

## Table of Contents

- [General](#General)
- [Features](#Features)
- [Quests](#Quests)
- [Expansion Features](#Expansion-Features)
- [Systems](#Systems)
- [Zone Selection](#Zone-Selection)
- [Sounds](#Sounds)
- [Extras](#Extras)
- [Changes](#Changes)
- [Commands](#Commands)

## About
This is a small section of the addon that includes the current version, the author name, and his contact detail(s).

## Acknowledgments
This is a small section of the addon where people who contribute to the addon, either through feedback, pull requests, or financial support are given some notoriety for their contributions.

## Resources
- **Open Issue** - You can open an issue (bug report, feature suggestion, etc) by [clicking here](https://github.com/Saaappi/HelpMePlay/issues/new).

----

## General

### Toggles
- **Enable** - Toggles addon functionality without reloading the UI!
- **Minimap Icon** - Toggle a minimap icon to open or close the addon's options. *This is the same as using /hmp or opening the options through the in-game Options menu.*
- **Developer Mode** - Toggle a debug version of the addon. When enabled, HelpMePlay will output additional information about gossips and equipping gear. This mode also enables several new (and less useful) slash commands! *This is really for me... But you're welcome?*

----

## Features

### Toggles
- **Cinematics** - Toggle the cancellation of in-game cinematics and movies. *Some in-game cinematics and movies are ignored for technical reasons.*
- **Emotes** - Toggle the use of emotes. This will allow HelpMePlay to emote on specific NPCs on your behalf. *Best example are the Runestones in Maldraxxus.*
- **Equip Loot** - Toggle the consideration of equipping Bind-on-Pickup loot from rares. This seems to be the most common on the Dragon Isles.
   - **Ignore Bind** - Toggle to disregard the soulbound check when considering equipping loot. *This is only available when Equip Loot is checked!*
- **Flight Paths** - Toggle allowing HelpMePlay to sweep you off your feet and to your next destination! *Flight path automation is pre-programmed and is based entirely off Kraken Latte's leveling route.*
- **Groups** - Toggle accepting group invitations automatically.
- **Gossip** - Toggle automatically selecting gossip from NPCs. *Players can even add their own! Pre-programmed gossips are based on Kraken Latte's leveling route!*
- **Notes** - Toggle the addition of helpful notes to NPC tooltips. *Prime examples are which Gatamatos to click during for [Tactical Formation](https://www.wowhead.com/quest=57937/tactical-formation) and the Lever-Locked Chests in Torghast.
- **Queues** - Toggle automatically accepting queue popups so you can grab some ale, take a much-needed trip to the lavoratory, or cook yourself some Golden Carp Consomme.
   - **Holiday Queues** - Toggle the addition of a special holiday boss queue button! You can use this button to immediately queue for the active holiday boss!
- **Ready Checks** - Toggle the ability for HelpMePlay to tell your party or raid leader that you're always ready!
- **Repairs** - Toggle automatically repairing your items when speaking with a repair merchant.
- **Speech** - Toggle interacting with the in-game world through NPC and system speech. *Best example is the trickster during "[The Games We Play](https://www.wowhead.com/quest=57870/the-games-we-play)" in Ardenweald, simply target the trickster, and HelpMePlay will automatically react to the trickster's speech.!
- **Trainers** - Toggle automatically learning spells from any and all trainers. *HelpMePlay can learn it all and not break the bank!*
   - **Trainers Minimum Amount** - Input the absolute minimum amount of gold your character must possess before HelpMePlay will purchase the training. *The default is 50 gold.*
- **Vehicles** - Toggle automatically exiting specific vehicles on your behalf. *This is currently only used in Highmountain on Murky's egg.*
- **War Mode** - Toggle automatically entering War Mode when entering Orgrimmar or Stormwind City at level 20 or higher.
- **Waypoints** - Toggle the plotting of waypoints. *Waypoints are plotted based on pre-programmed quests.*

----

## Quests

### Dropdowns
- **Chromie Time** - Select which expansion to automatically enter when speaking with Chromie in Orgrimmar or Stormwind City.
- **Quest Rewards** - Select how HelpMePlay should determine which quest reward to take at completion.
   - **Sell Price** - This is self-explanatory.
   - **Item Level** - The quest reward is chosen based on whether or not its an item level increase over what your character has equipped.

### Toggles
- **Accept Quests** - Toggle accepting quests.
- **Adventure Maps** - Toggle accepting quests from adventure maps like those found in Oribos or Wingrest Embassy.
- **Complete Quests** - Toggle completing quests.
- **Purchase Quest Items** - Toggle purchasing quest items from merchants.
- **Equip Quest Rewards** - Toggle equipping quest rewards. *This only applies when Item Level is the selected option for Quest Rewards (detailed above).*
- **Threads of Fate** - Toggle entering Threads of Fate or Story for leveling in *Shadowlands*. *This toggle is still present, but is obsolete for most players.*
- **Show Quest Count** - Toggle whether or not to show the number of active quests of 35 above the quest log.

### Expansion Intros
- **Battle for Azeroth** - Toggle whether to enter or skip the Tol Dagor introduction.
- **The Maw** - Toggle whether to enter or skip The Maw introduction.

----

## Expansion Features

### Garrisons

#### Toggles
- **Architect Table** - Toggle allowing HelpMePlay to plot and construct your Garrison barracks. *This only applies to level 1 Garrisons!*
- **Garrison Outposts** - Toggle allowing HelpMePlay to select the Garrison outpost in Gorgrond.
- **Mission Table** - Toggle allowing HelpMePlay to automatically start your first Garrison mission. *This only applies to level 1 Garrisons!*

### Visions of N'Zoth

#### Toggles
- **Titanic Research** - Toggle a button on or off that will automatically learn traits for Horrific Visions.

### Covenants

#### Dropdowns
- **Covenant Choice** - Select how HelpMePlay should select your covenant. Do you want all your characters in one covenant or would you prefer HelpMePlay select the best covenant based on your class and specialization?

### Torghast

#### Toggles
- **The Box of Many Things** - Toggle a button on or off that will automatically learn traits for Torghast.

#### Dropdowns
- **Anima Powers** - Toggle different options for how HelpMePlay should handle Anima Powers. HelpMePlay can recommend powers or take them automatically!

----

## Systems

### Junker

#### Toggles
- **Safe Mode** - Toggle whether Junker should sell items in batches of 12.
- **Soulbound Mode** - Toggle whether Junker should automatically sell soulbound items that are well below your current item level. *The minimum item level value is configurable from -25 to -50.*
- **Auto Sell** - Toggle automatically selling items when a merchant window is opened.

#### Dropdowns
- **Rarity** - Select the minimum rarity that Junker should consider items for sale. *Setting the rarity to Epic, for example, would mean any item at or below Epic quality should be eligible for sale.*
   - **Preserve Transmog** is a special "rarity" that behaves like **Poor**, but won't sell item eligible for transmogrification. *This option does NOT distinguish between known and unknown transmogrification items!*

#### Buttons
- **Import** - If you want to move from another auto sell addon like Dejunk or want to import a list of item IDs, this button offers solutions to both!
   - *If you're interested in using Junker over other auto sell addons, but HelpMePlay doesn't support an import from your addon, feel free to open an issue!*

#### Sliders
- **Soulbound Mode Item Level** - The minimum item level value to subtract from your current item level when determining whether to sell a soulbound item. *For example, if you're item level is 300 and the slider is at 30, then any item with an item level of less than 270 will be sold to a merchant.*

### Talents

#### Toggles
- **Player Talents** - Toggle the "Learn" button in the talent interface. Using this button will automatically learn a talent from a popular leveling build. *All classes and specializations are supported!*

### Transmogrification

#### Toggles
- **Transmogrification** - Toggle a button to the inventory frame. Using this button will automatically learn all unknown and usable transmogrification items in your inventory. *Cosmetic items (those that need to be right-clicked to learn) are NOT supported!*

### Dragonriding

#### Toggles
- **Dragonriding** - Toggle a button to the Dragonriding interface. Using this button will automatically learn all Dragonriding traits. *Note that choice nodes can be changed at any time free of charge.*

### Party Play

#### Toggles
- **Enable** - Toggle Party Play functionality.
- **Announce** - Toggle whether to share quest progress to party chat. *This output is verbose!*
- **Auto Share** - Toggle sharing quests with party members. *For the best results, all party members should have HelpMePlay.*

### Barber Shop
There aren't any options for the Barber Shop system, but HelpMePlay can save up to 3 loadouts for each race, body type, and class combination to load on other characters of those same combinations!

----

## Zone Selection

### Dropdowns
- **Battle for Azeroth** - Select the first zone HelpMePlay should select from the maps in Boralus and Dazar'alor. *This setting is smart and will individually save your selection for both factions.*
- **Shadowlands** - Select the first zone HelpMePlay should select from the map in Oribos.
- **Dragonflight** - Select the first zone HelpMePlay should select from the map in Wingrest Embassy, The Waking Shores.

----

## Sounds

### Toggles
- **Enable** - Toggle whether HelpMePlay can mute sounds.

### Inputs
- **Sound ID** - Enter the sound ID you wish to mute or unmute. *Note that you will need to reload after entering an ID.*
   - *To find the appropriate sound ID, go to Wowhead and find the sound you wish to mute. For example, ID 8960 is the Ready Check sound.*
   - *Once you know the ID of the sound you wish to mute, you need the file ID of the sound now. For that, go here: https://wow.tools/dbc/?dbc=soundkitentry and enter the ID in the search box in the upper right.*
   - *Check for the SoundKitID column for the ID you entered in the search field. Use the value under the FileDataID column for the sound ID to mute.*

----

## Extras

### Toggles
- **Talking Head** - Toggle silencing the talking head popup.
- **Wave at Players** - Toggle a useless social experiment. When enabled, there's a (very) small chance your character will wave at the targeted player.

### Quest Mobs

#### Toggles
- **Quest Mobs** - Toggle whether or not to show a quest indicator on the nameplate of NPCs involved in an active quest.

#### Dropdowns
- **Icon** - Choose an icon to use as the indicator.
   - *This icon can be from Wowhead, look up a spell, achievement, item, etc, then either click its icon or select the Icon link under the Quick Facts section.*
   - *You can also use an atlas as your icon. Atlases are texture that contain sub-textures. You can go here: https://www.townlong-yak.com/framexml/live/Helix/AtlasInfo.lua to get a full list of atlases. Get the name of the atlas you want (it won't be a number), then in the popup put # in front of the atlas name.*
- **Position** - Select where on the nameplate the icon should be placed.

#### Sliders
- **X Offset** - Determine how far the icon should be shifted on the X-axis.
- **Y Offset** - Determine how far the icon should be shifted on the Y-axis.

### Personal Health

#### Toggles
- **Water Reminder** - Toggle if you want HelpMePlay to remind you to drink water.

#### Sliders
- **Minimum Delay** - The minimum number of minutes to wait before sending a reminder.
- **Maximum Delay** - The maximum number of minutes to wait before sending a reminder.

### Party Invitations

#### Inputs
- **Party Members** - Enter a list of player names and their realms to invite when issuing the /hmp inv command.
   - *Entries should be in the playername-realmname format.*

----

## Changes
This is where the author will document all the latest additions, changes, removals, etc. in the current release.

----

## Commands
- **<kbd>/hmp confirm</kbd>** - Adds a confirmation message to the addon's table. This will allow HelpMePlay to automatically accept the confirmation on the player's behalf. If you're not sure what a confirmation is, then please [check this out](https://wow.zamimg.com/uploads/screenshots/normal/962262.png).
- **<kbd>/hmp gossip</kbd>** - Adds a gossip to the addon's table. This will allow HelpMePlay to automatically select a gossip on the player's behalf. If you're not sure what gossips are, then please [check this out](https://static.icy-veins.com/images/wow/shadowlands/covenants/changing-covenant-rejoin.jpg).
   - *A cool trick is you can use <kbd>/hmp gossip X</kbd>, where X represents the placement on a list. For example, if an NPC has 6 dialogs, entering <kbd>/hmp gossip 2</kbd> will automatically enter the second gossip into the addon's table.*
- **<kbd>/hmp ignore</kbd>** - If you don't want HelpMePlay to interact with an NPC or accept a specific quest, you can use this command.
   - *<kbd>/hmp ignore npc id</kbd> can be used to add an NPC to the addon's table. An ID can be omitted if you're targeting the NPC you wish to ignore. HelpMePlay can get the NPC ID from your current target.*
   - *<kbd>/hmp ignore quest id</kbd> can be used to ignore a quest. 'id' should be replaced with the quest's ID. This will ONLY work for quests in a list.*
- **<kbd>/hmp quest id</kbd>** - If you're uncertain if you've completed a quest, HelpMePlay can let you know. You can alias the command using <kbd>/hmp q id</kbd>, as well.