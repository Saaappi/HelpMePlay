# HelpMePlay

> Build and tailor an automated gaming experience that best fits your playstyle!

[<img src="https://i.imgur.com/r8jBWCd.jpeg" width="100%">](https://addons.wago.io/addons/helpmeplay)

HelpMePlay is a World of Warcraft addon built to automate as many tasks in the game as possible. Players should free up their time vendoring items one-by-one, accepting/completing quests, and even selecting dialog options from NPCs.

> *All options are disabled by default!* Use <kbd>/hmp</kbd> to open the options or configure a keybind!

Enter Azeroth, grab some ale, and let HelpMePlay take care of the heavy lifting. Read on to learn more!

## Table of Contents

- [Features](#features)
- [Systems](#systems)
- [Commands](#commands)
- [Resources](#resources)

## General Features
*Gossips and Flight Paths are based on Kraken Latte's leveling path!*

### Toggles
- **Cinematics** - Gracefully cancel *most* in-game cinematics and movies.
- **Emotes** - Don't remember which emote to use on the stones in Maldraxxus? HelpMePlay is capable of using the appropriate emote simply by targeting these stones.
- **Flight Paths** - Let HelpMePlay sweep you off your feet, carrying you to the destinations you need to go!
- **Gossips** - Automates selecting appropriate gossip from NPCs. Players can even add their own!
- **Notes** - HelpMePlay can add helpful tips to NPC tooltips. Can't remember which Gatamatos to click during [Tactical Formation](https://www.wowhead.com/quest=57937/tactical-formation)? Me neither! HelpMePlay will let you know which to click if you hover over them.
- **Queues** - Tired of missing your queue pops while you're AFK? HelpMePlay will accept the queue at lightning speed, granting you precious time to take care of the important things in life (like grabbing a drink for your dungeon ventures.)
- **Ready Checks** - Toggle this handy feature on to always be ready when your raid leader sends out a ready check!
- **Repairs** - Automatically repair your items in town before you head out to slay more gnolls!
- **Speech** - HelpMePlay can interact with the in-game world through NPC and system speech. For example, the trickster during "[The Games We Play](https://www.wowhead.com/quest=57870/the-games-we-play)" in Ardenweald, simply target the trickster, and HelpMePlay will automatically react to the trickster's speech. Enjoy some much deserved rest and relaxation!
- **Trainers** - Don't want to select "Learn" for individual spells from trainers? HelpMePlay can learn everything for you without breaking the bank!
- **Vehicles** - Allows HelpMePlay to automatically exit vehicles on your behalf. *This is currently only used in Highmountain on Murky's egg.*
- **War Mode** - The free 10%, or higher, experience gain is undeniably a boon to the leveling experience. When enabled, HelpMePlay will automatically opt the player into War Mode upon their next visit to Orgrimmar or Stormwind.
- **Waypoints** - HelpMePlay, if configured, will automatically plot waypoints when specific quests are accepted.

## Quest Features

### Toggles
- **Accept Quests** - Automatically accept any quest.
- **Adventure Maps** - Automates accepting quests from "adventure maps". These are found in Oribos, Boralus Harbor, Dazar'alor, and more!
- **Complete Quests** - Automatically complete any quest.
- **Purchase Quest Items** - Automatically purchase quest items from vendors.
- **Threads of Fate** - Allow HelpMePlay to select Threads of Fate or Story Mode on your behalf for leveling in *Shadowlands*.
- **The Maw** - Toggle to opt in or out of playing through The Maw.

### Dropdowns
- **BFA Zone Selection** - Pick the zone you want HelpMePlay to pick **FIRST** for *Battle for Azeroth*. (The remaining zones will be selected by HelpMePlay once the first is completed.)
- **Chromie Time** - Automates entering Chromie Time. HelpMePlay will enter the expansion the player selects in the options!
- **Quest Rewards** - Pick how you wish HelpMePlay to select quest rewards. Options are by item level upgrade (heirlooms are ignored) and sell price.
- **SL Zone Selection** - Pick the zone you want HelpMePlay to pick **FIRST** for *Shadowlands*. (The remaining zones will be selected by HelpMePlay once the first is completed.)

### Party Play
Play with friends? Tired of asking them if they completed the quest objective? Group up, both players enable Party Play, and let HelpMePlay keep track of who has completed what!

- **Announce** - Share your quest progress in Party chat. *This output is verbose.*
- **Auto Share** - Share quests with your party as you accept them. *For the best results, all party members should have HelpMePlay.*

## Expansion Features

### Garrisons
- **Architect Table** - Allows HelpMePlay to plot and construct your Garrison barracks. *This only applies to level 1 Garrisons!*
- **Garrison Outposts** - HelpMePlay will automatically select the proper Garrison outpost in other Draenor zones. *Currently only Gorgrond is supported.*
- **Mission Table** - Allows HelpMePlay to automatically start your first Garrison mission.

### Visions of N'Zoth
- **Titanic Research** - HelpMePlay will provide you with the best path through Titanic Research for easier Visions!

### Covenants

#### Dropdowns
- **Covenant Choice** - If you want all your characters in one covenant, make the choice here. If you want HelpMePlay to choose your covenant for you, you can make that choice here!

### Torghast

#### Toggles
- **The Box of Many Things** - HelpMePlay will provide you with the best path through The Box of Many Things for easier Torghast completion!

#### Dropdowns
- **Anima Powers** - Players can instruct HelpMePlay to take powers on their behalf, suggest powers to them, or be silent and do nothing.

## Systems
- **Junker** - Junker is a full-scale inventory management system built directly into HelpMePlay. Junker can vendor any item at whatever quality YOU decide. It can also vendor items by their type (e.g. consumable, armor, etc). If that's not enough, players can import a full comma-delimited list of items, or even add them by hovering over them in the inventory and using a keybind! Visit a merchant and select the broom icon in the upper left of the vendor window.

- **Transmog** - Do you dread learning transmog individually? Do you fear you may sell the upgrade you looted from raid last night? HelpMePlay solves both these problems. Open your inventory, find the purple mace icon and click it. HelpMePlay will keep track of your currently-equipped items, learn all **UNKNOWN AND USABLE** appearances, and then re-equip your original items. Cool, huh?
- **Professions** - If you like collecting in World of Warcraft, then you probably enjoy professions. Perhaps not... BUT! There are many collectibles in production professions like Blacksmithing. It can be tough to calculate all the reagents you require to craft all the transmog. HelpMePlay can calculate all the reagents you would need to craft all KNOWN recipes for appearances you've yet to collect. Simply open a production profession (e.g. Blacksmithing) and locate the "Calculate" button in the upper right.

## Commands
- **<kbd>/hmp confirm</kbd>** - Adds a confirmation message to the addon's table. This will allow HelpMePlay to automatically accept the confirmation on the player's behalf. If you're not sure what a confirmation is, then please [check this out](https://wow.zamimg.com/uploads/screenshots/normal/962262.png).
- **<kbd>/hmp dialog</kbd>** - Adds a dialog to the addon's table. This will allow HelpMePlay to automatically select dialog on the player's behalf. If you're not sure what dialog is, then please [check this out](https://static.icy-veins.com/images/wow/shadowlands/covenants/changing-covenant-rejoin.jpg).
   - *A cool trick is you can use <kbd>/hmp dialog X</kbd>, where X represents the placement on a list. For example, if an NPC has 6 dialogs, entering <kbd>/hmp dialog 2</kbd> will automatically enter the second dialog into the addon's table.*
- **<kbd>/hmp ignore</kbd>** - If you don't want HelpMePlay to interact with an NPC or accept a specific quest, you can use this command.
   - *<kbd>/hmp ignore npc id</kbd> can be used to add an NPC to the addon's table. An ID can be omitted if you're targeting the NPC you wish to ignore. HelpMePlay can get the NPC ID from your current target.*
   - *<kbd>/hmp ignore quest id</kbd> can be used to ignore a quest. 'id' should be replaced with the quest's ID. This will ONLY work for quests in a list.*
- **<kbd>/hmp quest id</kbd>** - If you're uncertain if you've completed a quest, HelpMePlay can let you know. You can alias the command using <kbd>/hmp q id</kbd>, as well.

## Resources
- **Issues** - You can open an issue (bug report, feature suggestion, etc) by [clicking here](https://github.com/Saaappi/HelpMePlay/issues/new).