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

## Features

- **Adventure Maps** - Automates accepting quests from "adventure maps". These are found in Oribos, Boralus Harbor, Dazar'alor, and more!
- **Anima Powers** - Players can instruct HelpMePlay to take powers on their behalf, suggest powers to them, or be silent and do nothing.
- **Chromie Time** - Automates entering Chromie Time. HelpMePlay will enter the expansion the player selects in the options!
- **Cinematics** - Gracefully cancel *most* in-game cinematics and movies.
- **Dialog** - Automates selecting appropriate dialog from NPCs both at and before max level. Players can even add their own!
- **Emotes** - Don't remember which emote to use on the stones in Maldraxxus? HelpMePlay is capable of using the appropriate emote simply by targeting these stones.
- **Garrison Tables** - HelpMePlay can both build your Garrison outposts AND plot important BEGINNER structures in your Garrison. Not only that, it can also start the initial mission you receive shortly after starting Frostfire Ridge or Shadowmoon Valley.
- **Merchants** - Don't want to select "Learn" for individual spells from trainers? HelpMePlay can learn everything for you without breaking the bank! Additionally, HelpMePlay can automatically purchase quest items for you!
- **Player Choice** - There are moments in the game where players are given a choice (e.g. Story .vs. Threads of Fate), and HelpMePlay can make the decision for you. Take Threads of Fate as an example, HelpMePlay will automatically select Threads of Fate and enter "FATE" so you don't have to!
- **Quests** - HelpMePlay can accept and complete quests. In addition to that common feature, HelpMePlay can also automatically select quest rewards based on sell price OR item level upgrade. *Heirloom slots are automatically ignored.*
- **Queues** - Tired of missing your queue pops while you're AFK? HelpMePlay will accept the queue at lightning speed, granting you precious time to take care of the important things in life (like grabbing a drink for your dungeon ventures.)
- **Repairs** - Automatically repair your items in town before you head out to slay more gnolls!
- **Speech** - HelpMePlay can interact with the in-game world through NPC and system speech. For example, the trickster during "[The Games We Play](https://www.wowhead.com/quest=57870/the-games-we-play)" in Ardenweald, simply target the trickster, and HelpMePlay will automatically react to the trickster's speech. Enjoy some much deserved rest and relaxation!
- **War Mode** - The free 10%, or higher, experience gain is undeniably a boon to the leveling experience. When enabled, HelpMePlay will automatically opt the player into War Mode upon their next visit to Orgrimmar or Stormwind.

## Systems
- **Talent Systems** - Want to know the best path for [**The Box of Many Things**](https://www.wowhead.com/guides/box-of-many-things-torghast-talent-system-shadowlands) or the [**Cyphers of the First Ones**](https://www.wowhead.com/guides/cypher-of-the-first-ones-research-zereth-mortis-progression)? HelpMePlay can not only provide that path, but can also let you know when you're missing currency (and how much!)
- **Junker** - Junker is a full-scale inventory management system built directly into HelpMePlay. Junker can vendor any item at whatever quality YOU decide. It can also vendor items by their type (e.g. consumable, armor, etc). If that's not enough, players can import a full comma-delimited list of items, or even add them by hovering over them in the inventory and using a keybind! Visit a merchant and select the broom icon in the upper left of the vendor window.
- **Notes** - HelpMePlay can add helpful tips to NPC tooltips. Can't remember which Gatamatos to click during [Tactical Formation](https://www.wowhead.com/quest=57937/tactical-formation)? Me neither! HelpMePlay will let you know which to click if you hover over them.
- **Transmog** - Do you dread learning transmog individually? Do you fear you may sell the upgrade you looted from raid last night? HelpMePlay solves both these problems. Enter <kbd>/hmp transmog</kbd> OR use the icon next to your inventory. HelpMePlay will keep track of your currently-equipped items, learn all **UNKNOWN AND USABLE** appearances, and then re-equip your original items. Cool, huh?
- **Party Play** - Play with friends? Tired of asking them if they completed the quest objective? Group up, both players enable Party Play, and let HelpMePlay keep track of who has completed what! Oh, and Party Play can also enable the auto-sharing of quests with your friend(s)!
- **Professions** - If you like collecting in World of Warcraft, then you probably enjoy professions. Perhaps not... BUT! There are many collectibles in production professions like Blacksmithing. It can be tough to calculate all the reagents you require to craft all the transmog. HelpMePlay can calculate all the reagents you would need to craft all KNOWN recipes for appearances you've yet to collect. Wicked!
- **Weights** - Interested to know how much an NPC is worth toward an objective? HelpMePlay can keep track of all that for you! Hover over the NPC while on the appropriate quest and read the tooltip.

## Commands
- **<kbd>/hmp calculate</kbd>** - Calculates the amount of reagents required to craft all KNOWN recipes for appearances the player has yet to collect. **[Requires a profession window to be open!]**
- **<kbd>/hmp confirm</kbd>** - Adds a confirmation message to the addon's table. This will allow HelpMePlay to automatically accept the confirmation on the player's behalf. If you're not sure what a confirmation is, then please [check this out](https://wow.zamimg.com/uploads/screenshots/normal/962262.png).
- **<kbd>/hmp dialog</kbd>** - Adds a dialog to the addon's table. This will allow HelpMePlay to automatically select dialog on the player's behalf. If you're not sure what dialog is, then please [check this out](https://static.icy-veins.com/images/wow/shadowlands/covenants/changing-covenant-rejoin.jpg).
   - *A cool trick is you can use <kbd>/hmp dialog X</kbd>, where X represents the placement on a list. For example, if an NPC has 6 dialogs, entering <kbd>/hmp dialog 2</kbd> will automatically enter the second dialog into the addon's table.*
- **<kbd>/hmp reset</kbd>** - The options menu can be dragged around the screen. If you're unhappy with its position later, simply enter this command to reset its position to the center of the screen.
- **<kbd>/hmp ignore</kbd>** - If you don't want HelpMePlay to interact with an NPC or accept a specific quest, you can use this command.
   - *<kbd>/hmp ignore npc id</kbd> can be used to add an NPC to the addon's table. An ID can be omitted if you're targeting the NPC you wish to ignore. HelpMePlay can get the NPC ID from your current target.*
   - *<kbd>/hmp ignore quest id</kbd> can be used to ignore a quest. 'id' should be replaced with the quest's ID. This will ONLY work for quests in a list.*
- **<kbd>/hmp quest id</kbd>** - If you're uncertain if you've completed a quest, HelpMePlay can let you know. You can alias the command using <kbd>/hmp q id</kbd>, as well.
- **<kbd>/hmp transmog</kbd>** - HelpMePlay will keep track of your currently-equipped items, learn all **UNKNOWN AND USABLE** appearances, and then re-equip your original items.

## Resources
- **Issues** - You can open an issue (bug report, feature suggestion, etc) by [clicking here](https://github.com/Saaappi/HelpMePlay/issues/new).