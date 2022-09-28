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
local L_NOTES = setmetatable({}, { __index = function(t, k)
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
	-- Mouseover Target Notes
	L_NOTES["Note: CLICK ME!"]		= "CLICK ME!"
	L_NOTES["Note: Torghast Lever"]	= "Order:\n|cffFFFFFF1, 2, 1, 3, 1, 2, 1, 4, 1, 2, 1, 3, 1, 2, 1|r"
end

addonTable.L_NOTES = L_NOTES