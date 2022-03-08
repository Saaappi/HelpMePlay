local addonName, addonTable = ...
local locale = GAME_LOCALE or GetLocale()

-- Identifies if the addon supports the player's language. If not, let's print a message to their chat box and give them a way to contact me.
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
local isLocaleSupported = false
for i=1,#supportedLocales do
	if (supportedLocales[i] == locale) then
		isLocaleSupported = true
	end
end

-- The localized strings used by the addon.
local L_NOTES = setmetatable({}, { __index = function(t, k)
	local v = tostring(k)
	rawset(t, k, v)
	return v
end })
if (isLocaleSupported) then
	-- Mouseover Target Notes
	L_NOTES["Note: CLICK ME!"]		= "CLICK ME!"
	L_NOTES["Note: Torghast Lever"]	= "Order:\n|cffFFFFFF1, 2, 1, 3, 1, 2, 1, 4, 1, 2, 1, 3, 1, 2, 1|r"
end

if (isLocaleSupported == false) then
	print(L["Red WARNING"] .. L["Locale Not Supported"] .. " @" .. L["Discord"])
end

addonTable.L_NOTES = L_NOTES