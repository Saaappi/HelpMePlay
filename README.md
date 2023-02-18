# HelpMePlay

> Build and tailor an automated gaming experience that best fits your playstyle!

[<img src="https://i.ibb.co/VTWYW8S/HMPLogo.jpg" width="100%">](https://addons.wago.io/addons/helpmeplay)

HelpMePlay is a World of Warcraft addon built to automate as many tasks in the game as possible. Players should free up their time vendoring items one-by-one, accepting/completing quests, and even selecting gossip options from NPCs.

> *All options are disabled by default!* Use <kbd>/hmp</kbd> to open the options or configure a keybind!

Enter Azeroth, grab some ale, and let HelpMePlay take care of the heavy lifting. Read on to learn more!

## Table of Contents

- [General Features](#General)
- [Features](#Features)
- [Expansion Features](#Expansion-Features)
- [Junker Features](#Junker-Features)
- [Commands](#commands)
- [Resources](#resources)

## General

### Toggles
- **Enable** - Toggles addon functionality without reloading the UI!
- **Minimap Icon** - Toggle a minimap icon to open or close the addon's options. *This is the same as using /hmp or opening the options through the in-game Options menu.*
- **Developer Mode** - Toggle a debug version of the addon. When enabled, HelpMePlay will output additional information about gossips and equipping gear. This mode also enables several new (and less useful) slash commands! *This is really for me... But you're welcome?*


*Gossips and Flight Paths are based on Kraken Latte's leveling path!*

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





## Extras
- **Talking Head** - Silence the talking head popup. We can only handle so much Khadgar!

### Personal Health
- **Water Reminder** - Feel like you don't drink enough water while you play? Check this button and adjust the minimum and maximum delays to be notified to sip on water.

### Buttons
- **Transmog** - Do you dread learning transmog individually? Do you fear you may sell the upgrade you looted from raid last night? HelpMePlay solves both these problems. Open your inventory, find the purple mace icon and click it. HelpMePlay will keep track of your currently-equipped items, learn all **UNKNOWN AND USABLE** appearances, and then re-equip your original items. Cool, huh?
- **Talent** - Add a button to the Player Talent UI to quickly learn the next talent in a predefined build supplied by the addon. (The builds used are those recommended by the Wowhead team for leveling.)
- **Dragonriding** - Tired of clicking a Dragonriding trait, then selecting the "Yes" button? Enable the button for the Dragonriding UI and rapidly learn all of your Dragonriding traits with a single click of a button! (The automation is limited to the number of glyphs you've collected from the open world.)

### Dropdowns
- **BFA Zone Selection** - Pick the zone you want HelpMePlay to pick **FIRST** for *Battle for Azeroth*. (The remaining zones will be selected by HelpMePlay once the first is completed.)
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
2. Use the value of the key name prefixed with a **#**.

<img src="https://i.ibb.co/yP472nJ/Untitled.png" width="50%">

In the above example, **ShipMission_DangerousSkull**, is the atlas name. Thus, to use the atlas in game, we would put **#ShipMission_DangerousSkull** as our value.

##### Icons
1. Go to Wowhead and search for something that uses the icon you want.
2. Select the icon on the page.
3. Use the value in the name field.

<img src="https://i.ibb.co/k9J4JY2/icons.png" width="50%">

### Party Play
Play with friends? Tired of asking them if they completed the quest objective? Group up, both players enable Party Play, and let HelpMePlay keep track of who has completed what!

- **Announce** - Share your quest progress in Party chat. *This output is verbose.*
- **Auto Share** - Share quests with your party as you accept them. *For the best results, all party members should have HelpMePlay.*

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
- **<kbd>/hmp gossip</kbd>** - Adds a gossip to the addon's table. This will allow HelpMePlay to automatically select a gossip on the player's behalf. If you're not sure what gossips are, then please [check this out](https://static.icy-veins.com/images/wow/shadowlands/covenants/changing-covenant-rejoin.jpg).
   - *A cool trick is you can use <kbd>/hmp gossip X</kbd>, where X represents the placement on a list. For example, if an NPC has 6 dialogs, entering <kbd>/hmp gossip 2</kbd> will automatically enter the second gossip into the addon's table.*
- **<kbd>/hmp ignore</kbd>** - If you don't want HelpMePlay to interact with an NPC or accept a specific quest, you can use this command.
   - *<kbd>/hmp ignore npc id</kbd> can be used to add an NPC to the addon's table. An ID can be omitted if you're targeting the NPC you wish to ignore. HelpMePlay can get the NPC ID from your current target.*
   - *<kbd>/hmp ignore quest id</kbd> can be used to ignore a quest. 'id' should be replaced with the quest's ID. This will ONLY work for quests in a list.*
- **<kbd>/hmp quest id</kbd>** - If you're uncertain if you've completed a quest, HelpMePlay can let you know. You can alias the command using <kbd>/hmp q id</kbd>, as well.

## Resources
- **Issues** - You can open an issue (bug report, feature suggestion, etc) by [clicking here](https://github.com/Saaappi/HelpMePlay/issues/new).