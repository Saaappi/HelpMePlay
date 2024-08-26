## Version 3.1.0 - 2024/08/27

### Added
- Introduced a new **Water Reminder** feature to support player hydration!
- Implemented support for gossip and quest merchants across multiple zones.
- A new option, **Reduce Camera Obstruction**, has been added to the New Character Configuration section.
- Implemented a new button in the Gossip Frame that allows for the addition of custom gossip options for non-player characters.
### Changed or Updated
- The button next to the Micro Menu now adheres to the **Mouseover** setting in ElvUI. _(Closes #85)_
- Clarified the text in the popup when selecting a custom **Quest Mobs** icon.
- The collection icon for appearances will now evaluate all sources associated with an item to determine the appropriate icon to display. _(Closes #87)_
- The Gossip system is now more intelligent, and is capable of differentiating a Game Object from an NPC.
  - _**Author's Note**: Not every (currently supported) object-related gossip has been updated to support the new model._
- The Back to the Orphanage quest (for each faction) is now ignored.
### Deprecated
- Deprecated the **Keep Me Safe** feature.
### Removed
- Removed the Remix modules for Mists of Pandaria.
### Fixed
- Resolved an issue that inhibited equipping identical heirloom items (e.g., two Swift Hands of Justice) with a single click of the **Equip Heirlooms** button.
- Resolved an issue where heirlooms on max-level characters were being replaced by items with significantly lower item levels.
- The **Toggle All** button should now be operating as expected.
- Quests that are ignored will no longer be automatically completed.
  - _**Author's Note:** Previously, ignored quests would stop automation only before they were accepted. However, if the player returned to the quest giver with an ignored quest in a completed state, the addon would automatically turn in the quest. Moving forward, the addon will neither accept nor complete ignored quests.
- Resolved an issue with depositing gold to the Warbank.

## Superseded Updates
### 3.0.4H4 - 2024/08/16
- Resolved an issue that prevented the Settings from loading beyond **Chat Icons**.
### 3.0.4H3 - 2024/08/13
- Following the release of update 11.0.2, a minor adjustment was required to resolve an issue with the settings.
### 3.0.4H2 - 2024/08/11
- Resolved an issue where the Warband Bank automation performed duplicate transactions when the 'Keep Me Safe' feature was turned off.
### 3.0.4H1 - 2024/08/09
- Resolved an issue that caused the Warband Bank automation to fail when interacting with the Warband Bank Distance Inhibitor.