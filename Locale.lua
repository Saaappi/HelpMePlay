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
		L["Slash HMP"]										= "/hmp"
		L["Abandon Command"]								= "abandon"
		-- Addon Messages		
		L["Locale Not Supported"]							= addonName .. " does NOT support " .. locale .. "! Please consider aiding in updating the addon to work for your language."
		-- Strings		
		L["Abandon Command Description"]					= "Abandons all quests in the zone specified by the player (e.g. /hmq abandon Silverpine Forest)."
		L["Discord"]										= "Lightsky#0658"
		L["Red WARNING"]									= "|cffFF0000WARNING:|r "
		-- Item Names		
		L["Bottle of Airspark"]								= "Bottle of Airspark"
		L["Elysian Thread"]									= "Elysian Thread"
		L["Necessary Enhancers"]							= "Necessary Enhancers"
		-- Speech		
		L["Playful Trickster: Praise"]						= "Not so much as a word of praise!"
		L["Playful Trickster: Cheer"]						= "The other spriggans were all cheering my name for days!"
		L["Playful Trickster: Dance"]						= "Dance with me!"
		L["Playful Trickster: Introduce"]					= "Introductions are an important part of first impressions!"
		L["Playful Trickster: Thank"]						= "Some ask permission, and always thank us for our trouble."
		L["Playful Trickster: Flex"]						= "How strong he must have been!"
		-- Map Names
			-- Eastern Kingdoms
		L["ARATHI HIGHLANDS"]								= "ARATHI HIGHLANDS"
		L["BADLANDS"] 										= "BADLANDS"
		L["BLASTED LANDS"]  								= "BLASTED LANDS"
		L["BURNING STEPPES"]  			            		= "BURNING STEPPES"
		L["DUN MOROGH"]  				            		= "DUN MOROGH"
		L["DUSKWOOD"] 					            		= "DUSKWOOD"
		L["EASTERN PLAGUELANDS"]  		            		= "EASTERN PLAGUELANDS"
		L["ELWYNN FOREST"] 				            		= "ELWYNN FOREST"
		L["EVERSONG WOODS"] 			            		= "EVERSONG WOODS"
		L["GHOSTLANDS"] 				            		= "GHOSTLANDS"
		L["HILLSBRAD FOOTHILLS"] 		            		= "HILLSBRAD FOOTHILLS"
		L["LOCH MODAN"] 				            		= "LOCH MODAN"
		L["NORTHERN STRANGLETHORN"] 	            		= "NORTHERN STRANGLETHORN"
		L["REDRIDGE MOUNTAINS"] 		            		= "REDRIDGE MOUNTAINS"
		L["SEARING GORGE"] 				            		= "SEARING GORGE"
		L["SILVERPINE FOREST"] 			            		= "SILVERPINE FOREST"
		L["THE CAPE OF STRANGLETHORN"] 	            		= "THE CAPE OF STRANGLETHORN"
		L["TIRISFAL GLADES"] 			            		= "TIRISFAL GLADES"
		L["WESTERN PLAGUELANDS"] 		            		= "WESTERN PLAGUELANDS"
		L["WESTFALL"] 					            		= "WESTFALL"
		L["WETLANDS"] 					            		= "WETLANDS"
			-- Kalimdor		
		L["ASHENVALE"]					            		= "ASHENVALE"
		L["AZSHARA"]					            		= "AZSHARA"
		L["DARKSHORE"]					            		= "DARKSHORE"
		L["DESOLACE"]					            		= "DESOLACE"
		L["DUROTAR"]					            		= "DUROTAR"
		L["DUSTWALLOW MARSH"]			            		= "DUSTWALLOW MARSH"
		L["FELWOOD"]					            		= "FELWOOD"
		L["FERALAS"]					            		= "FERALAS"
		L["MULGORE"]					            		= "MULGORE"
		L["NORTHERN BARRENS"]			            		= "NORTHERN BARRENS"
		L["SOUTHERN BARRENS"]			            		= "SOUTHERN BARRENS"
		L["STONETALON MOUNTAINS"] 		            		= "STONETALON MOUNTAINS"
		L["UN'GORO CRATER"]				            		= "UN'GORO CRATER"
		L["WINTERSPRING"]				            		= "WINTERSPRING"
			-- Outlands		
		L["BLADE'S EDGE MOUNTAINS"] 	            		= "BLADE'S EDGE MOUNTAINS"
		L["HELLFIRE PENINSULA"] 		            		= "HELLFIRE PENINSULA"
		L["NAGRAND (OUTLAND)"] 			            		= "NAGRAND (OUTLAND)"
		L["NETHERSTORM"] 				            		= "NETHERSTORM"
		L["SHADOWMOON VALLEY (OUTLAND)"]            		= "SHADOWMOON VALLEY (OUTLAND)"
		L["TEROKKAR FOREST"] 			            		= "TEROKKAR FOREST"
		L["ZANGARMARSH"] 				            		= "ZANGARMARSH"
			-- Northrend		
		L["BOREAN TUNDRA"]				            		= "BOREAN TUNDRA"
		L["DRAGONBLIGHT"]				            		= "DRAGONBLIGHT"
		L["GRIZZLY HILLS"]				            		= "GRIZZLY HILLS"
		L["HOWLING FJORD"]				            		= "HOWLING FJORD"
		L["ICECROWN"]					            		= "ICECROWN"
		L["SHOLAZAR BASIN"]				            		= "SHOLAZAR BASIN"
		L["THE STORM PEAKS"]			            		= "THE STORM PEAKS"
		L["ZUL'DRAK"]					            		= "ZUL'DRAK"
			-- Pandaria		
		L["DREAD WASTES"]				            		= "DREAD WASTES"
		L["KRASARANG WILDS"]			            		= "KRASARANG WILDS"
		L["KUN-LAI SUMMIT"]				            		= "KUN-LAI SUMMIT"
		L["THE JADE FOREST"]			            		= "THE JADE FOREST"
		L["TOWNLONG STEPPES"]			            		= "TOWNLONG STEPPES"
		L["VALE OF ETERNAL BLOSSOMS"] 	            		= "VALE OF ETERNAL BLOSSOMS"
		L["VALLEY OF THE FOUR WINDS"] 	            		= "VALLEY OF THE FOUR WINDS"
			-- Draenor  		
		L["FROSTFIRE RIDGE"]			            		= "FROSTFIRE RIDGE"
		L["GORGROND"]					            		= "GORGROND"
		L["NAGRAND"]					            		= "NAGRAND"
		L["SHADOWMOON VALLEY"]			            		= "SHADOWMOON VALLEY"
		L["SPIRES OF ARAK"]				            		= "SPIRES OF ARAK"
		L["TALADOR"]					            		= "TALADOR"
			-- Broken Isles		
		L["AZSUNA"]						            		= "AZSUNA"
		L["HELHEIM"]					            		= "HELHEIM"
		L["HIGHMOUNTAIN"] 				            		= "HIGHMOUNTAIN"
		L["STORMHEIM"]					            		= "STORMHEIM"
		L["SURAMAR"]					            		= "SURAMAR"
		L["VAL'SHARAH"]					            		= "VAL'SHARAH"
			-- Kul Tiras		
		L["DRUSTVAR"] 					            		= "DRUSTVAR"
		L["MECHAGON"] 					            		= "MECHAGON"
		L["NAZJATAR"] 					            		= "NAZJATAR"
		L["STORMSONG VALLEY"] 			            		= "STORMSONG VALLEY"
		L["TIRAGARDE SOUND"] 			            		= "TIRAGARDE SOUND"
			-- Zandalar		
		L["NAZMIR"] 					            		= "NAZMIR"
		L["VOL'DUN"] 					            		= "VOL'DUN"
		L["ZULDAZAR"] 					            		= "ZULDAZAR"
			-- Shadowlands		
		L["ARDENWEALD"] 				            		= "ARDENWEALD"
		L["BASTION"] 					            		= "BASTION"
		L["MALDRAXXUS"] 				            		= "MALDRAXXUS"
		L["REVENDRETH"] 				            		= "REVENDRETH"
		L["THE MAW"]                                		= "THE MAW"      
		-- Dialog (TODO)
		L["Are you enjoying yourself?"]						= "Are you enjoying yourself?"
		L["Go hunt somewhere else!"]						= "Go hunt somewhere else!"
		L["There is no time left. Run!"]					= "There is no time left. Run!"
		L["Let's go!"]										= "Let's go!"
		L["I'm ready."]										= "I'm ready."
		L["Let's duel."]									= "Let's duel."
		L["I am ready."]									= "I am ready."
		L["Leave the Darkpens."]							= "Leave the Darkpens."
		L["Take us back to Zuldazar."]						= "Take us back to Zuldazar."
		L["<Reach inside and pull something out.>"] 		= "<Reach inside and pull something out.>"
		L["<Reach inside and pull out something that feels more like a building.>"] = "<Reach inside and pull out something that feels more like a building.>"
		L["Begin pet battle."]								= "Begin pet battle."
		L["Let's do battle!"]								= "Let's do battle!"
		L["I'd like to heal and revive my battle pets."] 	= "I'd like to heal and revive my battle pets."
end

if (isLocaleSupported == false) then
	print(L["Red WARNING"] .. L["Locale Not Supported"] .. " @" .. L["Discord"])
end

addonTable.L = L