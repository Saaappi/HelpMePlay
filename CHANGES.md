## Version 3.0.2 - 2024/07/24

### Added
- Implemented support for the "new" Skyriding talents.
### Changed or Updated
- The Remix button to combine gems and use threads has been updated to process items based on left and right mouse clicks, incorporating modifier keys for additional item processing.
  - _**Author's Note:** The tooltip has been updated to reflect the combinations necessary to use the button. This is in light of a change made in 11.0, where secure buttons are now limited to 255 characters. ([ref](https://github.com/Stanzilla/WoWUIBugs/issues/552#issuecomment-2192109095))_
### Deprecated
### Removed
- Removed a debug print within the Mount subsystem; sorry about that.
### Fixed
- Resolved the issue where the Skyriding talent button was not appearing in the Skyriding talents frame.
- Addressed two issues within the Player Talent subsystem.
  - The talent button is now correctly displayed within the talent frame.
  - Hero Talents are currently ignored (for now), ensuring that talents enumerate as intended.