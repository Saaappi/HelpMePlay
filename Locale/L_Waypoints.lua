local addonName, addonTable = ...
local locale = GAME_LOCALE or GetLocale()
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local isLocaleSupported = false
local supportedLocales = {
	"enGB",
	"enUS",
	"deDE",
	"esMX",
	"ptBR",
	"esES",
	"frFR",
	"itIT",
	"ruRU",
	"koKR",
	"zhTW",
	"zhCN",
}
local L_WAYPOINTS = setmetatable({}, { __index = function(t, k)
	local v = tostring(k)
	rawset(t, k, v)
	return v
end })

for i=1,#supportedLocales do
	if (supportedLocales[i] == locale) then
		isLocaleSupported = true
	end
end

if (isLocaleSupported == false) then
	if HelpMePlayOptionsDB.Logging then
		print(L["Red WARNING"] .. L["Locale Not Supported"] .. " @" .. L["Discord"])
	end
end

if (isLocaleSupported) then
	L_WAYPOINTS["Waypoint: Explorer Doc"]													= "Explorer Doc"
	L_WAYPOINTS["Waypoint: Lord Everblaze"]													= "Lord Everblaze"
	L_WAYPOINTS["Waypoint: Maiden of Winter's Breath Lake"]									= "Maiden of Winter's Breath Lake"
	L_WAYPOINTS["Waypoint: Winter Hyacinth"]												= "Winter Hyacinth"
	L_WAYPOINTS["Waypoint: Maiden of Drak'Mar"]												= "Maiden of Drak'Mar"
	L_WAYPOINTS["Waypoint: Maiden of Ashwood Lake"]											= "Maiden of Ashwood Lake"
	L_WAYPOINTS["Waypoint: Debris"]															= "Debris"
	L_WAYPOINTS["Waypoint: Composition Mote"]												= "Composition Mote"
	L_WAYPOINTS["Waypoint: Compilation Nodule"]												= "Compilation Nodule"
	L_WAYPOINTS["Waypoint: Leashkeeper Helzid"]												= "Leashkeeper Helzid"
	L_WAYPOINTS["Waypoint: Nexus of Actualization"]											= "Nexus of Actualization"
	L_WAYPOINTS["Waypoint: Gaiagantic"]														= "Gaiagantic"
	L_WAYPOINTS["Waypoint: Cipherclad"]														= "Cipherclad"
	L_WAYPOINTS["Waypoint: Bitterbeak"]														= "Bitterbeak"
	L_WAYPOINTS["Waypoint: Runefur"]														= "Runefur"
	L_WAYPOINTS["Waypoint: Dominated Jiro"]													= "Dominated Jiro"
	L_WAYPOINTS["Waypoint: Overgrown Geomental"]											= "Overgrown Geomental"
	L_WAYPOINTS["Waypoint: Punisher Makaris"]												= "Punisher Makaris"
	L_WAYPOINTS["Waypoint: Sacred Relics"]													= "Sacred Relics"
	L_WAYPOINTS["Waypoint: Neomotes"]														= "Neomotes"
	L_WAYPOINTS["Waypoint: Eidolic Fragment"]												= "Eidolic Fragment"
	L_WAYPOINTS["Waypoint: Minor Enigmet"]													= "Minor Enigmet"
	L_WAYPOINTS["Waypoint: Custodian Taj"]													= "Custodian Taj"
	L_WAYPOINTS["Waypoint: Terraforming Record"]											= "Terraforming Record"
	L_WAYPOINTS["Waypoint: Catalyst Magic Sensor"]											= "Catalyst Magic Sensor"
	L_WAYPOINTS["Waypoint: Fruit of the Bloom (Daily)"]										= "Fruit of the Bloom"
	L_WAYPOINTS["Waypoint: Circle of Strife (Daily)"]										= "Automa Constructors"
	L_WAYPOINTS["Waypoint: Cluck, Cluck, Boom (Daily)"]										= "Malfunctioned Poultrids"
	L_WAYPOINTS["Waypoint: Buried Remnants (Daily)"]										= "Strange Artifacts"
	L_WAYPOINTS["Waypoint: Super Jiro (Daily)"]												= "Super Jiro (right click to mount)"
	L_WAYPOINTS["Waypoint: Forcing the Cycle (Daily) 1"]									= "Defeat Mawtouched enemies"
	L_WAYPOINTS["Waypoint: Forcing the Cycle (Daily) 2"]									= "Coalesced Corruption (Purify orb)"
	L_WAYPOINTS["Waypoint: Portal Play (Daily)"]											= "Use the Portal Initiator item and collect research"
	L_WAYPOINTS["Waypoint: Operation: Relocation (Daily) 1"]								= "Ropes"
	L_WAYPOINTS["Waypoint: Operation: Relocation (Daily) 2"]								= "Gorgers, Breachers, & Avians"
	L_WAYPOINTS["Waypoint: Not Safe for Work (Daily)"]										= "Escort Rana in the area and collect relics"
	L_WAYPOINTS["Waypoint: Not of the Body (Daily)"]										= "Use item on Automa in the area"
	L_WAYPOINTS["Waypoint: Necessary Resourcing (Daily)"]									= "Defeat enemies in the area"
	L_WAYPOINTS["Waypoint: Rana"]															= "Rana"
	L_WAYPOINTS["Waypoint: The Broken Crown"]												= "The Broken Crown"
	L_WAYPOINTS["Waypoint: Elder Eru"]														= "Elder Eru"
	L_WAYPOINTS["Waypoint: Outmoded Servitor"]												= "Outmoded Servitor"
	L_WAYPOINTS["Waypoint: Native Cervid"]													= "Native Cervid"
	L_WAYPOINTS["Waypoint: Native Poultrid"]												= "Native Poultrid"
	L_WAYPOINTS["Waypoint: Primus"]															= "Primus"
	L_WAYPOINTS["Waypoint: One Half of the Equation"]										= "One Half of the Equation"
	L_WAYPOINTS["Waypoint: Where the Memory Resides"]										= "Where the Memory Resides"
	L_WAYPOINTS["Waypoint: Something Wonderful"]											= "Something Wonderful"
	L_WAYPOINTS["Waypoint: What A Long Strange Trip"]										= "What A Long Strange Trip"
	L_WAYPOINTS["Waypoint: Match Made in Zereth Mortis"]									= "Match Made in Zereth Mortis"
	L_WAYPOINTS["Waypoint: A Monumental Discovery"]											= "A Monumental Discovery"
	L_WAYPOINTS["Waypoint: Help From Beyond"]												= "Help From Beyond"
	L_WAYPOINTS["Waypoint: Kbato"]															= "Kbato"
	L_WAYPOINTS["Waypoint: Venthyr Forces"]													= "Venthyr Forces"
	L_WAYPOINTS["Waypoint: Night Fae Forces"]												= "Night Fae Forces"
	L_WAYPOINTS["Waypoint: Necrolord Forces"]												= "Necrolord Forces"
	L_WAYPOINTS["Waypoint: Kyrian Forces"]													= "Kyrian Forces"
end

addonTable.L_WAYPOINTS = L_WAYPOINTS