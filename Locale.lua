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
		L["Slash HMP"]																= "/hmp"
		L["Abandon Command"]														= "abandon"
		-- Addon Messages															
		L["Locale Not Supported"]													= addonName .. " does NOT support " .. locale .. "! Please consider aiding in updating the addon to work for your language."
		-- Strings																	
		L["Abandon Command Description"]											= "Abandons all quests in the zone specified by the player (e.g. /hmq abandon Silverpine Forest)."
		L["Discord"]																= "Lightsky#0658"
		L["Red WARNING"]															= "|cffFF0000WARNING:|r "
		-- Skill Lines																
		L["Riding"]																	= "Riding"
		-- Speech																	
		L["Playful Trickster: Praise"]												= "Not so much as a word of praise!"
		L["Playful Trickster: Cheer"]												= "The other spriggans were all cheering my name for days!"
		L["Playful Trickster: Dance"]												= "Dance with me!"
		L["Playful Trickster: Introduce"]											= "Introductions are an important part of first impressions!"
		L["Playful Trickster: Thank"]												= "Some ask permission, and always thank us for our trouble."
		L["Playful Trickster: Flex"]												= "How strong he must have been!"
		-- Map Names																
			-- Eastern Kingdoms														
		L["ARATHI HIGHLANDS"]														= "ARATHI HIGHLANDS"
		L["BADLANDS"] 																= "BADLANDS"
		L["BLASTED LANDS"]  														= "BLASTED LANDS"
		L["BURNING STEPPES"]  			            								= "BURNING STEPPES"
		L["DUN MOROGH"]  				            								= "DUN MOROGH"
		L["DUSKWOOD"] 					            								= "DUSKWOOD"
		L["EASTERN PLAGUELANDS"]  		            								= "EASTERN PLAGUELANDS"
		L["ELWYNN FOREST"] 				            								= "ELWYNN FOREST"
		L["EVERSONG WOODS"] 			            								= "EVERSONG WOODS"
		L["GHOSTLANDS"] 				            								= "GHOSTLANDS"
		L["HILLSBRAD FOOTHILLS"] 		            								= "HILLSBRAD FOOTHILLS"
		L["LOCH MODAN"] 				            								= "LOCH MODAN"
		L["NORTHERN STRANGLETHORN"] 	            								= "NORTHERN STRANGLETHORN"
		L["REDRIDGE MOUNTAINS"] 		            								= "REDRIDGE MOUNTAINS"
		L["SEARING GORGE"] 				            								= "SEARING GORGE"
		L["SILVERPINE FOREST"] 			            								= "SILVERPINE FOREST"
		L["THE CAPE OF STRANGLETHORN"] 	            								= "THE CAPE OF STRANGLETHORN"
		L["TIRISFAL GLADES"] 			            								= "TIRISFAL GLADES"
		L["WESTERN PLAGUELANDS"] 		            								= "WESTERN PLAGUELANDS"
		L["WESTFALL"] 					            								= "WESTFALL"
		L["WETLANDS"] 					            								= "WETLANDS"
			-- Kalimdor								
		L["ASHENVALE"]					            								= "ASHENVALE"
		L["AZSHARA"]					            								= "AZSHARA"
		L["DARKSHORE"]					            								= "DARKSHORE"
		L["DESOLACE"]					            								= "DESOLACE"
		L["DUROTAR"]					            								= "DUROTAR"
		L["DUSTWALLOW MARSH"]			            								= "DUSTWALLOW MARSH"
		L["FELWOOD"]					            								= "FELWOOD"
		L["FERALAS"]					            								= "FERALAS"
		L["MULGORE"]					            								= "MULGORE"
		L["NORTHERN BARRENS"]			            								= "NORTHERN BARRENS"
		L["SOUTHERN BARRENS"]			            								= "SOUTHERN BARRENS"
		L["STONETALON MOUNTAINS"] 		            								= "STONETALON MOUNTAINS"
		L["UN'GORO CRATER"]				            								= "UN'GORO CRATER"
		L["WINTERSPRING"]				            								= "WINTERSPRING"
			-- Outlands																
		L["BLADE'S EDGE MOUNTAINS"] 	            								= "BLADE'S EDGE MOUNTAINS"
		L["HELLFIRE PENINSULA"] 		            								= "HELLFIRE PENINSULA"
		L["NAGRAND (OUTLAND)"] 			            								= "NAGRAND (OUTLAND)"
		L["NETHERSTORM"] 				            								= "NETHERSTORM"
		L["SHADOWMOON VALLEY (OUTLAND)"]            								= "SHADOWMOON VALLEY (OUTLAND)"
		L["TEROKKAR FOREST"] 			            								= "TEROKKAR FOREST"
		L["ZANGARMARSH"] 				            								= "ZANGARMARSH"
			-- Northrend															
		L["BOREAN TUNDRA"]				            								= "BOREAN TUNDRA"
		L["DRAGONBLIGHT"]				            								= "DRAGONBLIGHT"
		L["GRIZZLY HILLS"]				            								= "GRIZZLY HILLS"
		L["HOWLING FJORD"]				            								= "HOWLING FJORD"
		L["ICECROWN"]					            								= "ICECROWN"
		L["SHOLAZAR BASIN"]				            								= "SHOLAZAR BASIN"
		L["THE STORM PEAKS"]			            								= "THE STORM PEAKS"
		L["ZUL'DRAK"]					            								= "ZUL'DRAK"
			-- Pandaria																
		L["DREAD WASTES"]				            								= "DREAD WASTES"
		L["KRASARANG WILDS"]			            								= "KRASARANG WILDS"
		L["KUN-LAI SUMMIT"]				            								= "KUN-LAI SUMMIT"
		L["THE JADE FOREST"]			            								= "THE JADE FOREST"
		L["TOWNLONG STEPPES"]			            								= "TOWNLONG STEPPES"
		L["VALE OF ETERNAL BLOSSOMS"] 	            								= "VALE OF ETERNAL BLOSSOMS"
		L["VALLEY OF THE FOUR WINDS"] 	            								= "VALLEY OF THE FOUR WINDS"
			-- Draenor  								
		L["FROSTFIRE RIDGE"]			            								= "FROSTFIRE RIDGE"
		L["GORGROND"]					            								= "GORGROND"
		L["NAGRAND"]					            								= "NAGRAND"
		L["SHADOWMOON VALLEY"]			            								= "SHADOWMOON VALLEY"
		L["SPIRES OF ARAK"]				            								= "SPIRES OF ARAK"
		L["TALADOR"]					            								= "TALADOR"
			-- Broken Isles															
		L["AZSUNA"]						            								= "AZSUNA"
		L["HELHEIM"]					            								= "HELHEIM"
		L["HIGHMOUNTAIN"] 				            								= "HIGHMOUNTAIN"
		L["STORMHEIM"]					            								= "STORMHEIM"
		L["SURAMAR"]					            								= "SURAMAR"
		L["VAL'SHARAH"]					            								= "VAL'SHARAH"
			-- Kul Tiras															
		L["DRUSTVAR"] 					            								= "DRUSTVAR"
		L["MECHAGON"] 					            								= "MECHAGON"
		L["NAZJATAR"] 					            								= "NAZJATAR"
		L["STORMSONG VALLEY"] 			            								= "STORMSONG VALLEY"
		L["TIRAGARDE SOUND"] 			            								= "TIRAGARDE SOUND"
			-- Zandalar																
		L["NAZMIR"] 					            								= "NAZMIR"
		L["VOL'DUN"] 					            								= "VOL'DUN"
		L["ZULDAZAR"] 					            								= "ZULDAZAR"
			-- Shadowlands															
		L["ARDENWEALD"] 				            								= "ARDENWEALD"
		L["BASTION"] 					            								= "BASTION"
		L["MALDRAXXUS"] 				            								= "MALDRAXXUS"
		L["REVENDRETH"] 				            								= "REVENDRETH"
		L["THE MAW"]                                								= "THE MAW"      
		-- Dialog (TODO)
		L["Are you enjoying yourself?"]												= "Are you enjoying yourself?"
		L["Go hunt somewhere else!"]												= "Go hunt somewhere else!"
		L["There is no time left. Run!"]											= "There is no time left. Run!"
		L["Let's go!"]																= "Let's go!"
		L["I'm ready."]																= "I'm ready."
		L["Let's duel."]															= "Let's duel."
		L["I am ready."]															= "I am ready."
		L["Leave the Darkpens."]													= "Leave the Darkpens."
		L["Take us back to Zuldazar."]												= "Take us back to Zuldazar."
		L["<Reach inside and pull something out.>"] 								= "<Reach inside and pull something out.>"
		L["<Reach inside and pull out something that feels more like a building.>"] = "<Reach inside and pull out something that feels more like a building.>"
		L["Begin pet battle."]														= "Begin pet battle."
		L["Let's do battle!"]														= "Let's do battle!"
		L["I'd like to heal and revive my battle pets."] 							= "I'd like to heal and revive my battle pets."
		L["Yes!"]																	= "Yes!"
		L["Daelya Twilightsbane 1"]													= "What does the Light wish of me?"
		L["Daelya Twilightsbane 2"]													= "I will do my best to serve the Light. I swear to it."
		L["Herbert Gloomburst 1"]													= "I'll fight the harpies that come."
		L["Warlord Breka Grimaxe 1"]												= "Let's get out of the citadel and figure out how to get back home."
		L["Warlord Breka Grimaxe 2"]												= "I know my way around Orgrimmar."
		L["Archmage Khadgar 1"]														= "FOR AZEROTH!"
		L["Johnny Awesome 1"] 														= "Well, we are having some problems at the Sludge Fields, located northeast of here. Warden Stillwater could use your help."
		L["Johnny Awesome 2"]														= "That's all."
		L["Johnny Awesome 3"]														= "THAT'S ALL, JOHNNY AWESOME. TAKE IT OR LEAVE IT!"
		L["Kingslayer Orkus 1"] 													= "Um... Apparently there is some trouble at Southshore. Something about worgen insurgents. Maybe you could help with them?"
		L["Kingslayer Orkus 2"]														= "None."
		L["Kingslayer Orkus 3"]														= "Right, thanks. Just go ahead and head southeast. More south than east. Probably off the coast."
		L["Kingslayer Orkus 4"]														= "Your feet are touching the ground, Orkus."
		L["Dumass 1"] 																= "Maybe you should go take a nap or something."
		L["Dumass 2"] 																= "Wait a minute. It looks like something just came up."
		L["Bat Handler Maggotbreath 1"]												= "I need to take a bat to the Dawning Isles."
		L["Ambermill Dimensional Portal 1"]											= "<Use the Ambermill Dimensional Portal.>"
		L["Vanguard Battlemage 1"]													= "I must help Khadgar. Send me to the Blasted Lands!"
		L["Zidormi 1"]																= "Can you show me what Tirisfal Glades was like before the Battle for Lordaeron?"
		L["Holgar Stormaxe 1"]														= "I've heard this tale before..."
		L["Holgar Stormaxe 2"]														= "Are you sure you want to skip the Broken Shore introduction?"
		L["Nathanos Blightcaller 1"]												= "I have heard this story before."
		L["Chromie 1"]																= "Select a timeline."
		L["Chromie 2"]																= "Select a different timeline."
		L["Nazgrim 1"]																= "Tell me what happened."
		L["Baros Alexston 1"]														= "We have everything we need. It's time to build the garrison."
		L["Assistant Brightstone 1"]												= "Time to get back to work."
		L["Shelly Hamby 1"]															= "Gather Shelly's report."
		L["Skaggit 1"]																= "Get the peons back to work."
		L["Senior Peon II 1"]														= "Gazlowe needs you."
		L["Sergeant Grimjaw 1"]														= "Prepare to battle the Gorens."
		L["All-Seeing Eye 1"]														= "Begin the compulsion of the All-Seeing Eye."
		L["Ariok 1"]																= "Khadgar has asked us to go distract the Eye of Kilrogg."
		L["Spiritwalker Ebonhorn 1"]												= "Tell me the Story of Huln."
		L["Spiritwalker Ebonhorn 2"]												= "Tell me more of Huln Highmountain."
		L["Snazzle Shinyfinder 1"]													= "Go find shiny!"
		L["Snazzle Shinyfinder 2"]													= "You keep one. I keep rest."
		L["Trytooth Hardchisel 1"]													= "You kill basilisk!"
		L["Trytooth Hardchisel 2"]													= "Best kill job me seen!"
		L["Trytooth Hardchisel 3"]													= "Give Trytooth the boot."
		L["Kindle Candlecrafter 1"]													= "Make big candle! Lots of wax!"
		L["Kindle Candlecrafter 2"]													= "Me think me have just the right touch..."
		L["Dug Digger 1"]															= "Dig rocks, find pretties!"
		L["Windmaster Julan 1"]														= "Take the Windmaster's Totem."
		L["Navarrogg 1"]															= "Let's get out of here!"
		L["Addie Fizzlebog 1"]														= "Let's go hunting!"
end

if (isLocaleSupported == false) then
	print(L["Red WARNING"] .. L["Locale Not Supported"] .. " @" .. L["Discord"])
end

addonTable.L = L