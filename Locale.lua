local addonName, addonTable = ...
local locale = GAME_LOCALE or GetLocale()

-- Identifies if the addon supports the player's language. If not, let's print a message to their chat box and give them a way to contact me.
local supportedLocales = {
	"enGB",
	"enUS",
}
local isLocaleSupported = false
for i = 1, #supportedLocales do
	if (supportedLocales[i] == locale) then
		isLocaleSupported = true
	end
end
if (isLocaleSupported == false) then
	print("|cffFF0000WARNING:|r " .. addonName .. " does NOT support " .. locale .. "! Please consider aiding in updating the addon to work for your language.")
end
--

-- The localized strings used by the addon.
local L = setmetatable({}, { __index = function(t, k)
	local v = tostring(k)
	rawset(t, k, v)
	return v
end })
if (locale == "enGB" or locale == "enUS") then
		-- Commands
		L["Slash LS"]								= "/ls"
		L["Slash LastSeen"]							= "/lastseen"
		L["Ignore Command"]							= "ignore"
		L["Remove Command"]							= "remove"
		-- Objects
		L["Abandoned Treasure Chest"]				= "Abandoned Treasure Chest"
		L["Alexstrasza's Gift"]						= "Alexstrasza's Gift"
		L["Ancient Treasure"]						= "Ancient Treasure"
		L["Cache of Heroic Storms"]					= "Cache of Heroic Storms"
		L["Cache of Living Stone"]					= "Cache of Living Stone"
		L["Cache of the Dreamwalker"]				= "Cache of the Dreamwalker"
		L["Cache of Eregos"]						= "Cache of Eregos"
		L["Cache of Storms"]						= "Cache of Storms"
		L["Cache of Winter"]						= "Cache of Winter"
		L["Cache of Toys"]							= "Cache of Toys"
		L["Cache of the Firelord"]					= "Cache of the Firelord"
		L["Cache of the Leviathan"]					= "Cache of the Leviathan"
		L["Cache of Innovation"]					= "Cache of Innovation"
		L["Cache of Pure Energy"]					= "Cache of Pure Energy"
		L["Cache of Heroic Innovation"]				= "Cache of Heroic Innovation"
		L["Chest of The Seven"]						= "Chest of The Seven"
		L["Champion's Cache"]						= "Champion's Cache"
		L["Confessor's Cache"]						= "Confessor's Cache"
		L["Damaged Binding"]						= "Damaged Binding"
		L["Deathbringer's Cache"]					= "Deathbringer's Cache"
		L["Domination Sealed Chest"]				= "Domination Sealed Chest"
		L["Dust Covered Chest"]						= "Dust Covered Chest"
		L["Eadric's Cache"]							= "Eadric's Cache"
		L["Fishing"]								= "Fishing"
		L["Freya's Gift"]							= "Freya's Gift"
		L["Freya's Heroic Gift"]					= "Freya's Heroic Gift"
		L["General's Cache"]						= "General's Cache"
		L["Gift of the Observer"]					= "Gift of the Observer"
		L["Glittering Nest Material"]				= "Glittering Nest Material"
		L["Gordok Tribute"]							= "Gordok Tribute"
		L["Gunship Armory"]							= "Gunship Armory"
		L["Helgarde Supply Cache"]					= "Helgarde Supply Cache"
		L["Invasive Mawshroom"]						= "Invasive Mawshroom"
		L["Iron Cache"]								= "Iron Cache"
		L["Large Battered Chest"]					= "Large Battered Chest"
		L["Lost Memento"]							= "Lost Memento"
		L["Mawsworn Cache"]							= "Mawsworn Cache"
		L["Nest of Unusual Materials"]				= "Nest of Unusual Materials"
		L["Pile of Rubble"]							= "Pile of Rubble"
		L["Quilboar Treasures"]						= "Quilboar Treasures"
		L["Rare Cache of Winter"]					= "Rare Cache of Winter"
		L["Relic Cache"]							= "Relic Cache"
		L["Reinforced Fel Iron Chest"]				= "Reinforced Fel Iron Chest"
		L["Riftbound Cache"]						= "Riftbound Cache"
		L["Rift Hidden Cache"]						= "Rift Hidden Cache"
		L["Spectral Bound Chest"]					= "Spectral Bound Chest"
		L["Spoils of Blackfathom"]					= "Spoils of Blackfathom"
		L["Stolen Supplies"]						= "Stolen Supplies"
		L["Sturdy Treasure Chest"]					= "Sturdy Treasure Chest"
		L["The Captain's Chest"]					= "The Captain's Chest"
		L["Titan's Cache"]							= "Titan's Cache"
		L["Treasure of the Shen'dralar"]			= "Treasure of the Shen'dralar"
		-- Strings
		L["Colored Addon Name"] 					= "|cff00CCFF" .. addonName .. "|r: "
		L["GUID Unavailable"]						= "GUID unavailable for an item."
		L["Ignored"]								= "Ignored"
		L["Info Source Unavailable"]				= "Please report the information below:"
		L["Item Has Been Ignored"]					= "An item has been ignored."
		L["Item Has Been Removed"]					= "An item has been removed."
		L["Item Is No Longer Ignored"]				= "Stopped ignoring an item."
		L["Red Warning Text"]						= "|cffFF0000WARNING|r: "
		L["Unknown Source"]							= "Unknown Source"
		-- Symbols
		L["Green Plus"]								= "|cff52D66C+|r "
		L["Red Minus"]								= "|cffEF5858-|r "
		-- Other
		L["Discord"]								= "Lightsky#0658"
end
--

addonTable.L = L