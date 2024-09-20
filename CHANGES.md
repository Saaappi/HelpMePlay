## Version 3.2.0 - 2024/09/24

### Author's Notes
- The issue involving quests without rewards not completing in combat has been deemed _not a bug_.

### Added
- Added several additional Khaz Algar gossips that were missed.
- Implemented a setting to toggle accepting innkeeper binds.
### Changed or Updated
- Hero Talents are now integrated into the talent system automation.
- The Skyriding Talents sub-system has been rebranded as the **Generic Talents** sub-system.
  - _**Author's Note**: The setting has been updated and reset to **false** for all users._
- The Talent Importer utility has undergone a small visual update, resulting in a more condensed interface.
- The Talent Importer utility's position is now saved.
- The Talent Importer utility can no longer be opened in combat.
  - _**Author's Note**: If the utility is open when entering combat, it will be hidden automatically._
- The **Deposit Keep Amount** and **Trainer Protection Value** sliders are now CVar sliders, complete with a companion check button.
  - _**Author's Note**: The check button now serves as the primary method to toggle functionality on and off. Setting the sliders to 0 will no longer disable their effects. For example, setting the 'Deposit Keep Amount' to 0 will cause the addon to deposit all of your gold into the Warbank and prevent any withdrawals._
- The tooltip for the chevrons on the World Event Queue button now updates immediately upon clicking, eliminating the need to leave and re-enter the region for the tooltip to refresh.
- Quests can now be quickly abandoned from the Objective Tracker.
### Deprecated
_No changes_
### Removed
- The Talents system will no longer display learned talents in the chat window.
- Removed the **Keep Me Safe** feature.
### Fixed
- Fixed an issue that caused the talent system to become stuck on top-row talent selection.

## Superseded Updates
_No superseded updates_