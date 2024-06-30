## Version 3.0.0B8.3 - 2024/06/25

### Added
- Added a new **Toggle All** button to the top of the settings. This button can be used to quickly toggle all settings off and on.
- Added Jade Forest campaign gossips for Horde.
### Changed or Updated
- The chevron icons for the World Event queue button have received a visual and functionality update.
  - _**Author's Note:** The chevrons no longer have the button frame beneath them, they now have a glow on hover, and will display the next event in the table for their direction, respectively._
- Players can now use SHIFT+Right Click to scrap all armor and weapons regardless of the item level.
- Cutscene automation now has condition support.
- If Zygor is loaded, the talent button is shifted further to the left.
  - _**Author's Note:** For whatever reason, their button refuses to hide (even when disabled), so I just need to add a workaround..._
### Deprecated
### Removed
### Fixed
- The ready check window should no longer remain on screen when **Ready Checks** is enabled.
- Opening the Collections Journal on a max Remix character will no longer throw an error.
- Fixed an error when the icon's position for Quest Mobs was ever 0.
  - _**Author's Note:** This was unlikely to ever occur prior to B8.3, but with the introduction of the **Toggle All** button it would manifest itself in average play._
- Quests will no longer be completed while in combat.
- Current talent loadouts should no longer report that they're outdated.
- The Heirloom button should no longer appear for other tabs of the Collections Journal.
- Mounts of the opposing faction should no longer be used on the current faction.
- Fixed the missing 241 mount type.