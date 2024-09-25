The addon settings can be opened through the Escape menu (Options -> AddOns), via the `/hmp` or `/helpmeplay` slash commands, or using the button adjacent to Blizzard's micro menu.

## Features
<!--
### Remix: Mists of Pandaria Module

- Remix Usables Button
  - Add a button to your screen that facilitates efficient gem combination and thread integration for enhancing your Cloak of Infinite Potential.
- Remix Scrap Button
  - Implement a button adjacent to the Unraveling Sands interface for seamless addition of unwanted items to the scrapping frame.
-->

### General Module

- Chat Icons
  - Prefixes the icon of looted items in the chat frame.
- Emotes **[This feature is a work in progress!]**
  - Enable quick emote functionality for supported NPCs upon hovering over them in the game world.
- Gossip **[This feature is a work in progress!]**
  - Enable quick selection of gossip options for supported NPCs to quickly finish quests.
- Mute Talking Head
  - Disable the talking head popups permanently.
- Open Containers
  - Automatically open supported container items, such as the Handful of Treats, during Hallow's End.
- Skip Cutscenes
  - Automatically skip unwanted in-game cinematics and movies.
- Skyriding
  - Add a button within the Skyriding talent interface for streamlined talent selection.
- War Mode
  - When enabled, War Mode will automatically toggle upon entering Orgrimmar or Stormwind City while between levels 20 and 60.
- Automatic Innkeeper Bind
  - Automatically accepts the popup to set your hearthstone.
- Always Compare Items
  - By default, Blizzard displays the comparison tooltip when hovering over any equippable item. To toggle this functionality, uncheck this button.

### Quest Module

- Accept and Complete Quests
  - Toggle to accept and complete _any_ quest.
- Ignore Daily Quests
  - Toggle to have the addon ignore accepting daily quests. (_If a daily quest is already in your quest log, the addon will not ignore completing it._)
- Ignore Repeatable Quests
  - Toggle to have the addon ignore accepting repeatable quests. (_If a daily quest is already in your quest log, the addon will not ignore completing it._)
- Adventure Maps
  - Toggle support for accepting quests from adventure maps.
- Purchase Quest Items **[This feature is a work in progress!]**
  - Toggle support for expedited purchasing of quest-related items from merchants.
- Player Choice **[This feature is a work in progress!]**
  - Toggle support for the addon to make player decisions on your behalf. (_These are decisions like which Draenor Outpost to build in a zone._)
- Party Play
  - Toggle support for sharing quests in a group.
- Chromie Time
  - Select the expansion to use when speaking with Chromie in Orgrimmar or Stormwind City.
- Quest Rewards
  - Select how the addon should choose quest rewards. When using Item Level, if the reward is better than what you have equipped, the item will automatically equip.

### LFG Module

- Event Queue Button
  - Add a movable button to your screen that can be used to quickly queue for supported event activities.
- Accept Party Invites
  - Toggle to automatically accept _any_ party invitation.
- Ready Checks
  - Toggle to automatically accept ready checks.
- Role Checks
  - Toggle to automatically accept role checks.
- Quick Proposal
  - Select whether or not a left mouse click anywhere on the screen (not used by something else like an action button) will accept the queue.

### Merchant Module

- Automatic Repair
  - Toggle whether to automatically repair at merchants.
- Trainer Protection Value
  - If the addon is allowed to train on your behalf, select the **MINIMUM** amount of gold you must have before the addon can train for you. 0 will disable the feature.

### Warbank Module

- Deposit Keep Amount
  - To automatically deposit gold into your Warbank, specify the desired amount to retain after each transaction. If your balance falls below this threshold, the addon will withdraw gold from the bank to maintain this set amount.

### Quest Mobs Module

- Quest Mobs Icon
  - Select the icon that should appear on the nameplate for NPCs related to an active quest.
- Quest Mobs Icon Position
  - Select the position the icon should be placed relative to the nameplate.
- Quest Mobs Icon X Offset
  - Select the x offset for the icon.
- Quest Mobs Icon Y Offset
  - Select the y offset for the icon.

### Pet Battles Module

- Bandage Button
  - Activate the Pet Battles bandage button to quickly equip your Safari Hat toy and heal injured battle pets. The button will first use the **Revive Battle Pets** spell before applying any bandages.

### Wardrobe Module

- Wardrobe Button
  - Toggle the Wardrobe (transmogrification) button that will anchor to the Character Frame. Using the button will quickly learn all unknown appearances in your inventory, then re-equip your original gear.

### Character Module

#### New Character Configuration

New Character Configuration serves as a comprehensive template outlining the configuration specifications for each new character. The objective is to minimize the setup time required for new characters.

- Action Bar 2-8
  - Toggle the action bars that should be enabled during New Character Configuration.
- Clear All Tracking
  - Toggle whether minimap tracking should be disabled during New Character Configuration.
- Auto Loot
  - Toggle whether Auto Loot should be enabled during New Character Configuration.
- Disable Tutorials
  - Toggle whether tutorial popups should be disabled during New Character Configuration.
- Auto Push Spells
  - Toggle whether new spells should be pushed to the action bar during New Character Configuration. (You should leave this checked if you want new spells pushed to your action bar, otherwise uncheck it.)
- Class Color Frames
  - Toggle PvP and PvE frames being colored by class during New Character Configuration.
- Loot Under Mouse
  - Toggle whether the loot window should open under the mouse during New Character Configuration.
- Disable Dialog
  - Toggle whether dialog should be disabled during New Character Configuration.
- Reduce Camera Obstruction
  - Toggle to not allow the camera to collide with objects like trees, lamps, and more.
- Create Whisper Window
  - Toggle the creation (or destruction) of a Whisper window on the chat frame during New Character Configuration.
- Create Loot Window
  - Toggle the creation (or destruction) of a Loot window on the chat frame during New Character Configuration.
- Edit Mode
  - Select which Edit Mode layout should be used during New Character Configuration.

### Health Module

The Health module was implemented to introduce features to the addon to help maintain the player's health.

- Water Reminder
  - Toggle a text reminder to drink water. Optionally, you can also choose a sound to play with the text message if that will help you drink more water!

#### Heirlooms

HelpMePlay introduces a new button positioned next to the Heirloom journal, facilitating swift equipping of any generated heirlooms. This effectively cuts down the setup process for heirlooms by approximately 50%.

#### Queue

In contrast to the World Event queue button, the Character Queue button is ad-hoc, appearing conditionally to facilitate quickly queuing for a specific dungeon.

### Mount Module

The mount subsystem is a comprehensive and intelligent solution for selecting a random mount based on the character's environment and properties. For example, a level 5 character will use the chauffered chopper mount appropriate for the player's faction, whereas a level 70 character in Northern Stranglethorn would use a Skyriding mount. However, if your character is submerged underwater, then an aquatic mount is selected.

Another characteristic of the mount subsystem is that it will try to use each mount in a category once before reusing previous mounts. (Mount categories can be seen below. Used mounts are **NOT** remembered between sessions!)

To use the mount subsystem, open the Mount Journal and use the **Categorize Mounts** button at the top of the journal. Additionally, open your keybindings, scroll down to the **HelpMePlay** section, and set a keybind for the "Mount Up" bind. (This binding is used for both mounting and dismounting.)

Categories:
- AQ
- Aquatic
- Flying
- Ground
- Skyriding
- Vashj'ir

### Keybindings Module
- Mount Up: _This keybinding is explained in the Mount Module section above._
- Delete Cursor Item: To swiftly delete an item, set a keybind, pick up the item from your inventory, and use the keybind. (**WARNING**: This keybind does NOT have a confirmation, so be careful!)
- Quick Quest Abandon: Abandon quests by zone or individually by setting a keybind, hovering the zone or quest in your quest log (or in the Objective Tracker), and using the keybind. (There is NOT a confirmation when abandoning individual quests, but there is confirmation when abandoning quests for an entire zone or section.)
- World Event Queue: This keybind is used to click the World Event queue button. (This button is explained in the LFG section.)

### Utilities

- Open Issue
  - Click to quickly snatch the URL for the Github page to open an issue.
- Talent Importer
  - Click to launch the Talent Importer utility, where you can save talent loadouts to quickly use on alts at the click of a button! (The button to select a random talent from your saved loadout is in the talent interface.)
- Randomize Adventurer
  - If you're an altoholic and don't know what to play next, click the button and the addon will make a random selection for you. Click as many times as you need.