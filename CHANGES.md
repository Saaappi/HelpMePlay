## Version 3.0.0B8.2 - 2024/06/22

### Added
- Gossip support to skip the quests on Timeless Isle for Timerunners.
- Gossip support for the Pandaria introduction experience for Horde.
- Players can now untoggle **Always Compare Items** in the settings if they don't want the item comparison tooltip to automatically show when hovering an item.
  - _**Author's Note:** Blizzard appears to have broken the **alwaysCompareItems** cvar. This is a workaround._
### Changed or Updated
- Heirloom automation has been reimplemented.
  - _**Author's Note:** The system has been redesigned. Players must now create all their heirlooms by hand, but they can use a new button anchored to the Collections Journal to quickly equip them all._
- The World Event queue button is no longer shown or hidden by condition.
  - _**Author's Note:** In a recent update, I made it possible to toggle the button from the settings. Given the ongoing complexity of detecting player state, and a design decision, I think it best that the button remain visible while the player has the setting enabled. If a player wishes to use the button repeatedly to queue Timewalking dungeons, they should have the ability to do so._
- The button used in Remix to combine gems and add threads to the Cloak of Infinite Potential has been redesigned.
  - _**Author's Note:** The button is no longer anchored to the inventory. Instead, it's anchored to the UI and will start in the center of your screen. Users can click and drag the button anywhere on their screen and the position is saved. Due to the redesign, the button's visibility is controlled by a check button in the settings under the temporary **Remix: Mists of Pandaria** section._
- The scrap button for Remix is now disabled by default. It can be enabled under the **Remix: Mists of Pandaria** section in the settings.
- The icon for Midsummer Fire Festival has been updated.
- The **Champion's Purse** from Argent Tournament dailies will now _always_ be selected.
  - _**Author's Note:** This can't be changed. If forcing this item to be selected becomes a problem, please open an issue._
- Cinematics will no longer skip in Silverpine Forest.
- ToC bump in preparation for _The War Within_'s pre-patch.
### Deprecated
- Deprecated a couple internal classes used to create UI widgets.
### Removed
- Removed the Syndicator addon dependency.
### Fixed
- Fixed a Lua error.
- The World Event Queue button will no longer show for Timerunners.
- The Remix gem/thread button should no longer get stuck on gems with an insufficient count in the inventory.
- The Remix gem/thread button should no longer not do anything on its first click.
  - _**Author's Note:** If you don't have sufficient gems or threads in your inventory, then the button won't do anything._
- Fixed an error thrown when two or more events are active and the player hovers the World Event queue button.