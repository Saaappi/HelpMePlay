## Version 3.0.0B8.2 - 2024/06/22

### Added
- Gossip support to skip the quests on Timeless Isle for Timerunners.
- Gossip support for the Pandaria introduction experience for Horde.
### Changed or Updated
- Heirloom automation has been reimplemented.
  - _**Author's Note:** You must enable Heirlooms under the **General** section of the settings. You must teach the addon which heirlooms it should use for new characters by creating them once. The addon will remember your choices for each class and specialization._
- The icon for Midsummer Fire Festival has been updated.
- The condition for showing the Midsummer Fire Festival event is now an account-wide quest.
  - _**Author's Note:** The icon will appear for every character until one of them has defeated Frost Lord Ahune and opened their satchel. The icon is hidden for every character thereafter until daily reset._
- Quests with non-armor or weapon rewards will no longer be completed.
  - _**Author's Note:** This includes quests like the Argent Tournament dailies and Shards of Ahune from the Midsummer holiday. This is to respect the opportunity for the player to make the decisions on their own, and for the addon to not pillage their chance at specific rewards._
- ToC update for Patch 11.0 (10.2.7 is still supported.)
### Deprecated
- Deprecated a couple internal classes used to create dropdown menus and sliders.
### Removed
- Removed the Syndicator addon dependency.
### Fixed
- Squashed a bug that was throwing a Lua error.
- Squashed a bug that allowed the Event Queue button to show for Timerunners.
- Squashed a bug that caused the Remix button to get stuck on a gem after combining the available amount for that gem.