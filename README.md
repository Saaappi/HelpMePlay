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
- [Extras](#Extras)
- [Import](#Import)
- [Changelog](#Changelog)
- [About](#About)

## Resources
- **Open Issue** - You can open an issue (bug report, feature suggestion, etc.)

----

## General
- **Enable** - Toggles addon functionality without reloading the UI!
- **Minimap Icon** - Toggle a minimap icon to open or close the addon's options. *This is the same as using /hmp or opening the options through the in-game Options menu.*

----

## Features
- **Cinematics** - Toggle the cancellation of in-game cinematics and movies. *Some in-game cinematics and movies are ignored for technical reasons.*
- **Dragonriding** - Toggle a button to the Dragonriding interface. Using this button will automatically learn all Dragonriding traits. *Note that choice nodes can be changed at any time free of charge.*
- **Emotes** - Toggle the use of emotes. This will allow HelpMePlay to emote on specific NPCs on your behalf. *Best example are the Runestones in Maldraxxus.*
- **Equip Loot** - Toggle the consideration of equipping Bind-on-Pickup loot from rares. This seems to be the most common on the Dragon Isles.
   - **Ignore Bind** - Toggle to disregard the soulbound check when considering equipping loot. *This is only available when Equip Loot is checked!*
- **Flight Paths** - Toggle allowing HelpMePlay to sweep you off your feet and to your next destination! *Flight path automation is pre-programmed and is based entirely off Kraken Latte's leveling route.*
- **Group Invites** - Toggle accepting group invitations automatically.
- **Gossip** - Toggle automatically selecting gossip from NPCs. *Players can even add their own! Pre-programmed gossips are based on Kraken Latte's leveling route!*
- **Junker** - Toggle Junker functionality.
  - **Safe Mode** - Toggle whether Junker should sell items in batches of 12.
  - **Soulbound Mode** - Toggle whether Junker should automatically sell soulbound items that are well below your current item level. *The minimum item level value is configurable from -25 to -50.*
  - **Auto Sell** - Toggle automatically selling items when a merchant window is opened.
  - **Rarity** - Select the minimum rarity that Junker should consider items for sale. *Setting the rarity to Epic, for example, would mean any item at or below Epic quality should be eligible for sale.*
    - **Preserve Transmog** is a special "rarity" that behaves like **Poor**, but won't sell item eligible for transmogrification. *This option does NOT distinguish between known and unknown transmogrification items!*
  - **Import** - If you want to move from another auto sell addon like Dejunk or want to import a list of item IDs, this button offers solutions to both!
  - **Soulbound Mode Item Level** - The minimum item level value to subtract from your current item level when determining whether to sell a soulbound item. *For example, if you're item level is 300 and the slider is at 30, then any item with an item level of less than 270 will be sold to a merchant.*
- **Mute Talking Head** - Toggle muting the talking head popup.
- **Notes** - Toggle the addition of helpful notes to NPC tooltips. *Prime examples are which Gatamatos to click during for [Tactical Formation](https://www.wowhead.com/quest=57937/tactical-formation) and the Lever-Locked Chests in Torghast.
- **Party Play** - Toggle Party Play functionality.
  - **Announce** - Toggle whether to share quest progress to party chat. *This output is verbose!*
  - **Auto Share** - Toggle sharing quests with party members. *For the best results, all party members should have HelpMePlay.*
- **Player Talents** - Toggle the "Learn" button in the talent interface. Using this button will automatically learn a talent from a popular leveling build. *All classes and specializations are supported!*
- **Ready Checks** - Toggle the ability for HelpMePlay to tell your party or raid leader that you're always ready!
- **Repairs** - Toggle automatically repairing your items when speaking with a repair merchant.
- **Role Checks** - Toggle to allow the addon to accept role checks.
- **Speech** - Toggle interacting with the in-game world through NPC and system speech. *Best example is the trickster during "[The Games We Play](https://www.wowhead.com/quest=57870/the-games-we-play)" in Ardenweald, simply target the trickster, and HelpMePlay will automatically react to the trickster's speech.!
- **Trainers** - Toggle automatically learning spells from any and all trainers. *HelpMePlay can learn it all and not break the bank!*
   - **Trainers Minimum Amount** - Input the absolute minimum amount of gold your character must possess before HelpMePlay will purchase the training. *The default is 50 gold.*
- **Transmog** - Toggle a button to the inventory frame. Using this button will automatically learn all unknown and usable transmogrification items in your inventory. *Cosmetic items (those that need to be right-clicked to learn) are NOT supported!*
- **Vehicles** - Toggle automatically exiting specific vehicles on your behalf. *This is currently only used in Highmountain on Murky's egg.*
- **War Mode** - Toggle automatically entering War Mode when entering Orgrimmar or Stormwind City at level 20 or higher.
- **Waypoints** - Toggle the plotting of waypoints. *Waypoints are plotted based on pre-programmed quests.*

----

## Quests
- **Chromie Time** - Select which expansion to automatically enter when speaking with Chromie in Orgrimmar or Stormwind City.
- **Quest Rewards** - Select how HelpMePlay should determine which quest reward to take at completion.
   - **Sell Price** - This is self-explanatory.
   - **Item Level** - The quest reward is chosen based on whether or not its an item level increase over what your character has equipped.
- **Accept Quests** - Toggle accepting quests.
- **Adventure Maps** - Toggle accepting quests from adventure maps like those found in Oribos or Wingrest Embassy.
- **Complete Quests** - Toggle completing quests.
- **Equip Quest Rewards** - Toggle equipping quest rewards. *This only applies when Item Level is the selected option for Quest Rewards (detailed above).*
- **Purchase Quest Items** - Toggle purchasing quest items from merchants.
- **Threads of Fate** - Toggle entering Threads of Fate or Story for leveling in *Shadowlands*. *This toggle is still present, but is obsolete for most players.*

### Expansion Intros
- **Battle for Azeroth** - Toggle whether to enter or skip the Tol Dagor introduction.
- **Shadowlands** - Toggle whether to enter or skip The Maw introduction.

### Zone Selection
- **Battle for Azeroth** - Select the first zone HelpMePlay should select from the maps in Boralus and Dazar'alor. *This setting is smart and will individually save your selection for both factions.*
- **Shadowlands** - Select the first zone HelpMePlay should select from the map in Oribos.
- **Dragonflight** - Select the first zone HelpMePlay should select from the map in Wingrest Embassy, The Waking Shores.

### Quest Mobs
- **Quest Mobs** - Toggle whether or not to show a quest indicator on the nameplate of NPCs involved in an active quest.
- **Icon** - Choose an icon to use as the indicator.
   - *This icon can be from Wowhead, look up a spell, achievement, item, etc, then either click its icon or select the Icon link under the Quick Facts section.*
   - *You can also use an atlas as your icon. Atlases are texture that contain sub-textures. You can go here: https://www.townlong-yak.com/framexml/live/Helix/AtlasInfo.lua to get a full list of atlases. Get the name of the atlas you want (it won't be a number), then in the popup put # in front of the atlas name.*
- **Icon Position** - Select where on the nameplate the icon should be placed.
- **Icon Y Offset** - Determine how far the icon should be shifted on the Y-axis.
- **Icon X Offset** - Determine how far the icon should be shifted on the X-axis.
- **Criteria Position** - Select where on the nameplate the criteria text should be placed.
- **Criteria Y Offset** - Determine how far the criteria text should be shifted on the Y-axis.
- **Criteria X Offset** - Determine how far the criteria text should be shifted on the X-axis.

----

## Expansion Features

### Garrisons
- **Architect Table** - Toggle allowing HelpMePlay to plot and construct your Garrison barracks. *This only applies to level 1 Garrisons!*
- **Garrison Outposts** - Toggle allowing HelpMePlay to select the Garrison outpost in Gorgrond.
- **Mission Table** - Toggle allowing HelpMePlay to automatically start your first Garrison mission. *This only applies to level 1 Garrisons!*

### Visions of N'Zoth
- **Titanic Research** - Toggle a button on or off that will automatically learn traits for Horrific Visions.

### Covenants
- **Covenant Choice** - Select how HelpMePlay should select your covenant. Do you want all your characters in one covenant or would you prefer HelpMePlay select the best covenant based on your class and specialization?

### Torghast
- **The Box of Many Things** - Toggle a button on or off that will automatically learn traits for Torghast.
- **Anima Powers** - Toggle different options for how HelpMePlay should handle Anima Powers. HelpMePlay can recommend powers or take them automatically!

----

## Extras

### Personal Health
- **Water Reminder** - Toggle if you want HelpMePlay to remind you to drink water.
- **Minimum Delay** - The minimum number of minutes to wait before sending a reminder.
- **Maximum Delay** - The maximum number of minutes to wait before sending a reminder.

### Party Invitations
- **Auto Invite** - Toggle whether HelpMePlay should scan whispers for the invite keyword.
- **Party Members** - Enter a list of player names and their realms to invite when issuing the /hmp inv command.
   - *Entries should be in the playername-realmname format.*
- **Invite Keyword** - Enter a keyword, or keep the default, that players can whisper you to receive a party invitation.

----

## Import

### Player Talents
- **Class** - Select the class for the import.
- **Specialization** - Select the specialization for the import.

### Merchants
- **Merchant Strings** - Enter comma-delimited values in a string that represent an item to purchase from an NPC.

----

## Changelog
This is where the author will document all the latest additions, changes, removals, etc. in the current release.

----

## About
This is a small section of the addon that includes the current version, the author name, and acknowledgments.