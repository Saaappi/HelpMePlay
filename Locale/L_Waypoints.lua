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

if (isLocaleSupported) then
	L_WAYPOINTS["Waypoint: Treasure"]														= "Treasure"
	L_WAYPOINTS["Waypoint: Explorer Doc"]													= "Explorer Doc"
end

addonTable.L_WAYPOINTS = L_WAYPOINTS