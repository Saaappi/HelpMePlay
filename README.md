# HelpMePlay

> Build and tailor an automated gaming experience that best fits your playstyle!

[<img src="https://i.ibb.co/VTWYW8S/HMPLogo.jpg" width="100%">](https://addons.wago.io/addons/helpmeplay)

HelpMePlay is a World of Warcraft addon built to automate as many tasks in the game as possible. Players should free up their time vendoring items one-by-one, accepting/completing quests, and even selecting gossip options from NPCs.

> *All options are disabled by default!* Use <kbd>/hmp</kbd> to open the options or configure a keybind!

Enter Azeroth, grab some ale, and let HelpMePlay take care of the heavy lifting. Read on to learn more!

## Table of Contents

- [General Features](#General-Features)
- [Quest Features](#Quest-Features)
- [Expansion Features](#Expansion-Features)
- [Junker Features](#Junker-Features)
- [Commands](#commands)
- [Resources](#resources)

## General Features
*Gossips and Flight Paths are based on Kraken Latte's leveling path!*

### Toggles
- **Cinematics** - Gracefully cancel *most* in-game cinematics and movies.
- **Emotes** - Don't remember which emote to use on the stones in Maldraxxus? HelpMePlay is capable of using the appropriate emote simply by targeting these stones.
- **Flight Paths** - Let HelpMePlay sweep you off your feet, carrying you to the destinations you need to go!
- **Gossip** - Automates selecting appropriate gossip from NPCs. Players can even add their own!
- **Notes** - HelpMePlay can add helpful tips to NPC tooltips. Can't remember which Gatamatos to click during [Tactical Formation](https://www.wowhead.com/quest=57937/tactical-formation)? Me neither! HelpMePlay will let you know which to click if you hover over them.
- **Queues** - Tired of missing your queue pops while you're AFK? HelpMePlay will accept the queue at lightning speed, granting you precious time to take care of the important things in life (like grabbing a drink for your dungeon ventures.)
   - **Holiday Queues** - Use a special queue button to immediately queue for the active holiday boss.
- **Ready Checks** - Toggle this handy feature on to always be ready when your raid leader sends out a ready check!
- **Repairs** - Automatically repair your items in town before you head out to slay more gnolls!
- **Speech** - HelpMePlay can interact with the in-game world through NPC and system speech. For example, the trickster during "[The Games We Play](https://www.wowhead.com/quest=57870/the-games-we-play)" in Ardenweald, simply target the trickster, and HelpMePlay will automatically react to the trickster's speech. Enjoy some much deserved rest and relaxation!
- **Trainers** - Don't want to select "Learn" for individual spells from trainers? HelpMePlay can learn everything for you without breaking the bank!
- **Vehicles** - Allows HelpMePlay to automatically exit vehicles on your behalf. *This is currently only used in Highmountain on Murky's egg.*
- **War Mode** - The free 10%, or higher, experience gain is undeniably a boon to the leveling experience. When enabled, HelpMePlay will automatically opt the player into War Mode upon their next visit to Orgrimmar or Stormwind.
- **Waypoints** - HelpMePlay, if configured, will automatically plot waypoints when specific quests are accepted.

### Extras
- **Talking Head** - Silence the talking head popup. We can only handle so much Khadgar!
- **Holiday Queues** - Add a button above the LFD icon to queue for the current holiday boss. *This button will only appear if you're level 50+, your character isn't saved, and you don't have the mount(s) associated to the event.*

### Personal Health
- **Water Reminder** - Feel like you don't drink enough water while you play? Check this button and adjust the minimum and maximum delays to be notified to sip on water.

### Buttons
- **Transmog** - Do you dread learning transmog individually? Do you fear you may sell the upgrade you looted from raid last night? HelpMePlay solves both these problems. Open your inventory, find the purple mace icon and click it. HelpMePlay will keep track of your currently-equipped items, learn all **UNKNOWN AND USABLE** appearances, and then re-equip your original items. Cool, huh?

## Quest Features

### Toggles
- **Accept Quests** - Automatically accept any quest.
- **Adventure Maps** - Automates accepting quests from "adventure maps". These are found in Oribos, Boralus Harbor, Dazar'alor, and more!
- **Complete Quests** - Automatically complete any quest.
- **Purchase Quest Items** - Automatically purchase quest items from vendors.
- **Equip Quest Rewards** - When you choose Item Level as your quest reward option, the addon can automatically equip these rewards once selected.

### Expansion Intros
- **The Maw** - Toggle to opt in or out of playing through The Maw.

### Dropdowns
- **BFA Zone Selection** - Pick the zone you want HelpMePlay to pick **FIRST** for *Battle for Azeroth*. (The remaining zones will be selected by HelpMePlay once the first is completed.)
- **Chromie Time** - Automates entering Chromie Time. HelpMePlay will enter the expansion the player selects in the options!
- **Quest Rewards** - Pick how you wish HelpMePlay to select quest rewards. Options are by item level upgrade (heirlooms are ignored) and sell price.
- **SL Zone Selection** - Pick the zone you want HelpMePlay to pick **FIRST** for *Shadowlands*. (The remaining zones will be selected by HelpMePlay once the first is completed.)

### Quest Mobs
- **Quest Mobs** - Add an icon over the nameplate of enemies required for your quests.
- **Quest Mobs Icon** - Either keep the default icon or change it to something you want!
- **Quest Mobs Icon Position** - Place the icon practically anywhere on the nameplate.
- **Quest Mobs Icon Offsets** - Shift the icon on the X and Y offsets.

#### Custom Icons
A custom icon can either be those used for spells, items, achievements, etc, or they can be atlases too! Here's how to do both.

##### Atlas
An atlas in _World of Warcraft_ is a texture containing subtextures. [see example](https://static.wikia.nocookie.net/wowpedia/images/d/d1/AtlasID_ClassTrialThanksFrame.png/revision/latest?cb=20190528205129)

1. Go to [this](https://www.townlong-yak.com/framexml/10.0.2/Helix/AtlasInfo.lua) page and find the name of the atlas you want.
2. Use the value of the key name.

<img src="https://i.ibb.co/yP472nJ/Untitled.png" width="50%">

##### Icons
1. Go to Wowhead and search for something that uses the icon you want.
2. Select the icon on the page.
3. Use the value in the name field.

<img src="https://i.ibb.co/k9J4JY2/icons.png" width="50%">

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

## Junker Features

### Toggles
- **Safe Mode** - Tell the Junker subsystem to sell items in batches of 12, allowing you to use the buyback tab in case something is sold by mistake.
- **Soulbound Mode** - If enabled, the Junker subsystem will sell any soulbound and equipable item that is 30 or more item levels below your current item level.
- **Auto Sell** - If enabled, Junker will auto sell items from your inventory when the merchant window is opened.
- **Armor** - If enabled, the Junker subsystem will sell any item of type "Armor".
- **Consumables** - If enabled, the Junker subsystem will sell any item of type "Consumable".

### Dropdowns
- **Rarity** - Select a rarity for Junker to filter items. Any item with a rarity at or below the chosen threshold will be sold to a merchant. *It's recommended to keep this on the default option.*

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