## Version 3.0.4 - 2024/08/06

### Added
- The Architect Table in the Garrison will now automatically designate a plot for the Barracks, provided that the player's Garrison is at level 1 and they are currently on the [Build Your Barracks](https://www.wowhead.com/quest=34461/build-your-barracks) quest.
- The Mission Table in the Garrison will now have its first mission automated, provided the player has yet to send their first mission, the player's Garrison is level 1, and the player is currently on the [Delegating on Draenor](https://www.wowhead.com/quest=34692/delegating-on-draenor) (Alliance) or [Mission Probable](https://www.wowhead.com/quest=34775/mission-probable) (Horde) quest.
- Introduced a new feature that adds a **Pet Battles** button, designed to streamline the process of equipping your [Safari Hat](https://www.wowhead.com/item=92738/safari-hat) and healing any injured battle pets.
- Gossip support has been added for the [The Harbinger](https://www.wowhead.com/storyline/hunt-for-the-harbinger-5519) and [The War Within](https://www.wowhead.com/storyline/dalaran-intro-5638) questlines.
### Changed or Updated
- Users can now shift-click on the micro menu button to access the Talent Importer utility and control-click to reset their character configuration. The tooltip has been updated to indicate this new functionality.
- Renamed the **Guild Bank** section to **Warband Bank**.
  - _**Author's Note**: The add-on will now deposit gold into your Warband bank instead of the guild bank. Please note that there is no option to revert the setting to use the guild bank. The **Keep Me Safe** feature will remain in the add-on, allowing players to decline a transaction if desired._
- Renamed the **Party Play** setting to **Share Quests**.
  - _**Author's Note**: The setting previously served multiple functions, in a much earlier build, beyond quest-sharing. To clearly reflect its primary purpose, it is being renamed to provide immediate clarity._
- Combat lockdown no longer prevents the mount subsystem from dismounting the player.
### Deprecated
### Removed
- Removed the **Trial of Style** event from the World Event system.
### Fixed
- Addressed a bug where the confirmation dialog for selling items with unknown appearances was not being processed correctly.
- Resolved an issue where, after the creation of the whisper window, new whispers continued to appear in separate windows.
  - _**Author's Note**: A bug persists, but it originates from Blizzard's end, not from my add-on._
- Resolved an issue where items initiating a quest were being used each time the player looted.
- Resolved an issue where events were prematurely appearing in the World Event queue button.
- Fixed a bug with War Mode not enabling upon entering Orgrimmar or Stormwind City.