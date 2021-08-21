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

-- The localized strings used by the addon.
local L = setmetatable({}, { __index = function(t, k)
	local v = tostring(k)
	rawset(t, k, v)
	return v
end })
if (locale == "enGB" or locale == "enUS") then
		-- Commands
		L["Slash HMP"]								= "/hmp"
		L["Abandon Command"]						= "abandon"
		-- Addon Messages
		L["Locale Not Supported"]					= addonName .. " does NOT support " .. locale .. "! Please consider aiding in updating the addon to work for your language."
		-- Strings
		L["Red WARNING"]							= "|cffFF0000WARNING:|r "
		-- Item Names (TODO)
		-- Speech
		L["Playful Trickster: Praise"]				= "Not so much as a word of praise!"
		L["Playful Trickster: Cheer"]				= "The other spriggans were all cheering my name for days!"
		L["Playful Trickster: Dance"]				= "Dance with me!"
		L["Playful Trickster: Introduce"]			= "Introductions are an important part of first impressions!"
		L["Playful Trickster: Thank"]				= "Some ask permission, and always thank us for our trouble."
		L["Playful Trickster: Flex"]				= "How strong he must have been!"
		-- Emotes (TODO)
		-- Map Names (TODO)
		-- Dialog (TODO)
		-- Other
		L["Discord"]								= "Lightsky#0658"
end

if (isLocaleSupported == false) then
	print(L["Red WARNING"] .. L["Locale Not Supported"] .. " @" .. L["Discord"])
end

addonTable.L = L