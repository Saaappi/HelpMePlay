local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local DIALOG_CLASSIC = {
	-- Supported Maps: 12 (Kalimdor), 13 (Eastern Kingdoms)
	-- Blasted Lands
	[78423] = { -- Archmage Khadgar
		["g"] = {
			L_DIALOG["Archmage Khadgar 1"],
		},
		["c"] = {
			L_DIALOG["Archmage Khadgar 2"],
		},
	},
	[88206] = { -- Zidormi
		["g"] = {
			L_DIALOG["Zidormi 4"],
			L_DIALOG["Zidormi 5"],
		},
	},
	-- End of Blasted Lands
	-- Loch Modan
	[9989] = { -- Lina Hearthstove
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	[43979] = { -- Gravin Steelbeard
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	[44123] = { -- Emily Jackson
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	-- End of Loch Modan
	-- Eastern Plaguelands
	[28406] = { -- Death Knight Initiate
		["g"] = {
			L_DIALOG["I challenge you, death knight!"],
		},
	},
	[29173] = { -- Highlord Darion Mograine
		["g"] = {
			L_DIALOG["I am ready."],
		},
	},
	[150987] = { -- Sean Wilkers
		["g"] = {
			L_DIALOG["Sean Wilkers 1"],
		},
	},
	-- End of Eastern Plaguelands
	-- Elwynn Forest
	[240] = { -- Marshal Dughan
		["g"] = {
			L_DIALOG["Marshal Dughan 1"],
		},
	},
	[6749] = { -- Erma
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	[64330] = { -- Julia Stevens
		["g"] = {
			L_DIALOG["Think you can take me in a pet battle?"],
		},
		["c"] = {
			L_DIALOG["Let's rumble!"],
		},
	},
	-- End of Elwynn Forest
	-- Dun Morogh
	[46293] = { -- Torben Zapblast
		["g"] = {
			L_DIALOG["Torben Zapblast 1"],
		},
	},
	[40991] = { -- Mountaineer Dunstan
		["g"] = {
			L_DIALOG["Mountaineer Dunstan 1"],
		},
	},
	[40994] = { -- Mountaineer Lewin
		["g"] = {
			L_DIALOG["Mountaineer Lewin 1"],
		},
	},
	[41056] = { -- Mountaineer Valgrum
		["g"] = {
			L_DIALOG["Mountaineer Valgrum 1"],
		},
	},
	-- End of Dun Morogh
	-- Gnomeregan
	[124617] = { -- Environeer Bert
		["g"] = {
			L_DIALOG["Think you can take me in a pet battle?"],
		},
		["c"] = {
			L_DIALOG["Let's rumble!"],
		},
	},
	[147070] = { -- Micro Zoox
		["g"] = {
			L_DIALOG["Micro Zoox 1"],
		},
	},
	[146932] = { -- Door Control Console
		["g"] = {
			L_DIALOG["Door Control Console 1"],
		},
	},
	-- End of Gnomeregan
	-- Redridge Mountains
	[9982] = { -- Penny
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	[162591] = { -- Ben Howell
		["g"] = {
			L_DIALOG["Ben Howell 1"],
		},
	},
	[167281] = { -- Jamin
		["g"] = {
			L_DIALOG["The bells tell us to go to the town hall to be safe."],
			L_DIALOG["The magistrate has ordered our retreat."],
			L_DIALOG["The magistrate ordered our retreat."],
			L_DIALOG["The Scourge are incoming."],
			L_DIALOG["Everything will be okay."],
			L_DIALOG["We must get to the town hall."],
			L_DIALOG["Don't be a hero."],
			L_DIALOG["We're all going to go hide in the town hall."],
			L_DIALOG["We will survive this."],
			L_DIALOG["Get to the town hall."],
			L_DIALOG["The Scourge are coming!"],
		},
	},
	[167282] = { -- Roger
		["g"] = {
			L_DIALOG["The bells tell us to go to the town hall to be safe."],
			L_DIALOG["The magistrate has ordered our retreat."],
			L_DIALOG["The magistrate ordered our retreat."],
			L_DIALOG["The Scourge are incoming."],
			L_DIALOG["Everything will be okay."],
			L_DIALOG["We must get to the town hall."],
			L_DIALOG["Don't be a hero."],
			L_DIALOG["We're all going to go hide in the town hall."],
			L_DIALOG["We will survive this."],
			L_DIALOG["Get to the town hall."],
			L_DIALOG["The Scourge are coming!"],
		},
	},
	[777] = { -- Amy Davenport
		["g"] = {
			L_DIALOG["The bells tell us to go to the town hall to be safe."],
			L_DIALOG["The magistrate has ordered our retreat."],
			L_DIALOG["The magistrate ordered our retreat."],
			L_DIALOG["The Scourge are incoming."],
			L_DIALOG["Everything will be okay."],
			L_DIALOG["We must get to the town hall."],
			L_DIALOG["Don't be a hero."],
			L_DIALOG["We're all going to go hide in the town hall."],
			L_DIALOG["We will survive this."],
			L_DIALOG["Get to the town hall."],
			L_DIALOG["The Scourge are coming!"],
		},
	},
	[789] = { -- Kimberly Hiett
		["g"] = {
			L_DIALOG["The bells tell us to go to the town hall to be safe."],
			L_DIALOG["The magistrate has ordered our retreat."],
			L_DIALOG["The magistrate ordered our retreat."],
			L_DIALOG["The Scourge are incoming."],
			L_DIALOG["Everything will be okay."],
			L_DIALOG["We must get to the town hall."],
			L_DIALOG["Don't be a hero."],
			L_DIALOG["We're all going to go hide in the town hall."],
			L_DIALOG["We will survive this."],
			L_DIALOG["Get to the town hall."],
			L_DIALOG["The Scourge are coming!"],
		},
	},
	[790] = { -- Karen Taylor
		["g"] = {
			L_DIALOG["The bells tell us to go to the town hall to be safe."],
			L_DIALOG["The magistrate has ordered our retreat."],
			L_DIALOG["The magistrate ordered our retreat."],
			L_DIALOG["The Scourge are incoming."],
			L_DIALOG["Everything will be okay."],
			L_DIALOG["We must get to the town hall."],
			L_DIALOG["Don't be a hero."],
			L_DIALOG["We're all going to go hide in the town hall."],
			L_DIALOG["We will survive this."],
			L_DIALOG["Get to the town hall."],
			L_DIALOG["The Scourge are coming!"],
		},
	},
	[791] = { -- Lindsay Ashlock
		["g"] = {
			L_DIALOG["The bells tell us to go to the town hall to be safe."],
			L_DIALOG["The magistrate has ordered our retreat."],
			L_DIALOG["The magistrate ordered our retreat."],
			L_DIALOG["The Scourge are incoming."],
			L_DIALOG["Everything will be okay."],
			L_DIALOG["We must get to the town hall."],
			L_DIALOG["Don't be a hero."],
			L_DIALOG["We're all going to go hide in the town hall."],
			L_DIALOG["We will survive this."],
			L_DIALOG["Get to the town hall."],
			L_DIALOG["The Scourge are coming!"],
		},
	},
	[793] = { -- Kara Adams
		["g"] = {
			L_DIALOG["The bells tell us to go to the town hall to be safe."],
			L_DIALOG["The magistrate has ordered our retreat."],
			L_DIALOG["The magistrate ordered our retreat."],
			L_DIALOG["The Scourge are incoming."],
			L_DIALOG["Everything will be okay."],
			L_DIALOG["We must get to the town hall."],
			L_DIALOG["Don't be a hero."],
			L_DIALOG["We're all going to go hide in the town hall."],
			L_DIALOG["We will survive this."],
			L_DIALOG["Get to the town hall."],
			L_DIALOG["The Scourge are coming!"],
		},
	},
	[812] = { -- Alma Jainrose
		["g"] = {
			L_DIALOG["The bells tell us to go to the town hall to be safe."],
			L_DIALOG["The magistrate has ordered our retreat."],
			L_DIALOG["The magistrate ordered our retreat."],
			L_DIALOG["The Scourge are incoming."],
			L_DIALOG["Everything will be okay."],
			L_DIALOG["We must get to the town hall."],
			L_DIALOG["Don't be a hero."],
			L_DIALOG["We're all going to go hide in the town hall."],
			L_DIALOG["We will survive this."],
			L_DIALOG["Get to the town hall."],
			L_DIALOG["The Scourge are coming!"],
		},
	},
	[956] = { -- Dorin Songblade
		["g"] = {
			L_DIALOG["The bells tell us to go to the town hall to be safe."],
			L_DIALOG["The magistrate has ordered our retreat."],
			L_DIALOG["The magistrate ordered our retreat."],
			L_DIALOG["The Scourge are incoming."],
			L_DIALOG["Everything will be okay."],
			L_DIALOG["We must get to the town hall."],
			L_DIALOG["Don't be a hero."],
			L_DIALOG["We're all going to go hide in the town hall."],
			L_DIALOG["We will survive this."],
			L_DIALOG["Get to the town hall."],
			L_DIALOG["The Scourge are coming!"],
		},
	},
	[1678] = { -- Vernon Hale
		["g"] = {
			L_DIALOG["The bells tell us to go to the town hall to be safe."],
			L_DIALOG["The magistrate has ordered our retreat."],
			L_DIALOG["The magistrate ordered our retreat."],
			L_DIALOG["The Scourge are incoming."],
			L_DIALOG["Everything will be okay."],
			L_DIALOG["We must get to the town hall."],
			L_DIALOG["Don't be a hero."],
			L_DIALOG["We're all going to go hide in the town hall."],
			L_DIALOG["We will survive this."],
			L_DIALOG["Get to the town hall."],
			L_DIALOG["The Scourge are coming!"],
		},
	},
	[1680] = { -- Matthew Hooper
		["g"] = {
			L_DIALOG["The bells tell us to go to the town hall to be safe."],
			L_DIALOG["The magistrate has ordered our retreat."],
			L_DIALOG["The magistrate ordered our retreat."],
			L_DIALOG["The Scourge are incoming."],
			L_DIALOG["Everything will be okay."],
			L_DIALOG["We must get to the town hall."],
			L_DIALOG["Don't be a hero."],
			L_DIALOG["We're all going to go hide in the town hall."],
			L_DIALOG["We will survive this."],
			L_DIALOG["Get to the town hall."],
			L_DIALOG["The Scourge are coming!"],
		},
	},
	[3086] = { -- Gretchen Vogel
		["g"] = {
			L_DIALOG["The bells tell us to go to the town hall to be safe."],
			L_DIALOG["The magistrate has ordered our retreat."],
			L_DIALOG["The magistrate ordered our retreat."],
			L_DIALOG["The Scourge are incoming."],
			L_DIALOG["Everything will be okay."],
			L_DIALOG["We must get to the town hall."],
			L_DIALOG["Don't be a hero."],
			L_DIALOG["We're all going to go hide in the town hall."],
			L_DIALOG["We will survive this."],
			L_DIALOG["Get to the town hall."],
			L_DIALOG["The Scourge are coming!"],
		},
	},
	[3087] = { -- Crystal Boughman
		["g"] = {
			L_DIALOG["The bells tell us to go to the town hall to be safe."],
			L_DIALOG["The magistrate has ordered our retreat."],
			L_DIALOG["The magistrate ordered our retreat."],
			L_DIALOG["The Scourge are incoming."],
			L_DIALOG["Everything will be okay."],
			L_DIALOG["We must get to the town hall."],
			L_DIALOG["Don't be a hero."],
			L_DIALOG["We're all going to go hide in the town hall."],
			L_DIALOG["We will survive this."],
			L_DIALOG["Get to the town hall."],
			L_DIALOG["The Scourge are coming!"],
		},
	},
	[9982] = { -- Penny
		["g"] = {
			L_DIALOG["The bells tell us to go to the town hall to be safe."],
			L_DIALOG["The magistrate has ordered our retreat."],
			L_DIALOG["The magistrate ordered our retreat."],
			L_DIALOG["The Scourge are incoming."],
			L_DIALOG["Everything will be okay."],
			L_DIALOG["We must get to the town hall."],
			L_DIALOG["Don't be a hero."],
			L_DIALOG["We're all going to go hide in the town hall."],
			L_DIALOG["We will survive this."],
			L_DIALOG["Get to the town hall."],
			L_DIALOG["The Scourge are coming!"],
		},
	},
	[162953] = { -- Sarah Howell
		["g"] = {
			L_DIALOG["Sarah Howell 1"],
		},
	},
	[167279] = { -- Rachel
		["g"] = {
			L_DIALOG["The bells tell us to go to the town hall to be safe."],
			L_DIALOG["The magistrate has ordered our retreat."],
			L_DIALOG["The magistrate ordered our retreat."],
			L_DIALOG["The Scourge are incoming."],
			L_DIALOG["Everything will be okay."],
			L_DIALOG["We must get to the town hall."],
			L_DIALOG["Don't be a hero."],
			L_DIALOG["We're all going to go hide in the town hall."],
			L_DIALOG["We will survive this."],
			L_DIALOG["Get to the town hall."],
			L_DIALOG["The Scourge are coming!"],
		},
	},
	[167280] = { -- Nathan
		["g"] = {
			L_DIALOG["The bells tell us to go to the town hall to be safe."],
			L_DIALOG["The magistrate has ordered our retreat."],
			L_DIALOG["The magistrate ordered our retreat."],
			L_DIALOG["The Scourge are incoming."],
			L_DIALOG["Everything will be okay."],
			L_DIALOG["We must get to the town hall."],
			L_DIALOG["Don't be a hero."],
			L_DIALOG["We're all going to go hide in the town hall."],
			L_DIALOG["We will survive this."],
			L_DIALOG["Get to the town hall."],
			L_DIALOG["The Scourge are coming!"],
		},
	},
	[167283] = { -- Hannah
		["g"] = {
			L_DIALOG["The bells tell us to go to the town hall to be safe."],
			L_DIALOG["The magistrate has ordered our retreat."],
			L_DIALOG["The magistrate ordered our retreat."],
			L_DIALOG["The Scourge are incoming."],
			L_DIALOG["Everything will be okay."],
			L_DIALOG["We must get to the town hall."],
			L_DIALOG["Don't be a hero."],
			L_DIALOG["We're all going to go hide in the town hall."],
			L_DIALOG["We will survive this."],
			L_DIALOG["Get to the town hall."],
			L_DIALOG["The Scourge are coming!"],
		},
	},
	[167284] = { -- Madison
		["g"] = {
			L_DIALOG["The bells tell us to go to the town hall to be safe."],
			L_DIALOG["The magistrate has ordered our retreat."],
			L_DIALOG["The magistrate ordered our retreat."],
			L_DIALOG["The Scourge are incoming."],
			L_DIALOG["Everything will be okay."],
			L_DIALOG["We must get to the town hall."],
			L_DIALOG["Don't be a hero."],
			L_DIALOG["We're all going to go hide in the town hall."],
			L_DIALOG["We will survive this."],
			L_DIALOG["Get to the town hall."],
			L_DIALOG["The Scourge are coming!"],
		},
	},
	[167285] = { -- Erin
		["g"] = {
			L_DIALOG["The bells tell us to go to the town hall to be safe."],
			L_DIALOG["The magistrate has ordered our retreat."],
			L_DIALOG["The magistrate ordered our retreat."],
			L_DIALOG["The Scourge are incoming."],
			L_DIALOG["Everything will be okay."],
			L_DIALOG["We must get to the town hall."],
			L_DIALOG["Don't be a hero."],
			L_DIALOG["We're all going to go hide in the town hall."],
			L_DIALOG["We will survive this."],
			L_DIALOG["Get to the town hall."],
			L_DIALOG["The Scourge are coming!"],
		},
	},
	-- End of Redridge Mountains
	-- Duskwood
	[10062] = { -- Steven Black
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	-- End of Duskwood
	-- Wetlands
	[10046] = { -- Bethaine Flinthammer
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	[43994] = { -- Salustred
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	[44007] = { -- Shep Goldtend
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	-- End of Wetlands
	-- Deadwind Pass
	[113986] = { -- Archmage Khadgar
		["g"] = {
			L_DIALOG["I am ready."],
		},
	},
	-- End of Deadwind Pass
	-- Stratholme
	[155145] = { -- Plagued Critters
		["g"] = {
			L_DIALOG["Plagued Critters 1"],
		},
	},
	[155413] = { -- Postmaster Malown
		["g"] = {
			L_DIALOG["Begin pet battle."],
		},
	},
	[155414] = { -- Ezra Grimm
		["g"] = {
			L_DIALOG["Begin pet battle."],
		},
	},
	-- End of Stratholme
	-- Burning Steppes
	[161782] = { -- Burt Macklyn
		["g"] = {
			L_DIALOG["I'm ready."],
		},
	},
	-- End of Burning Steppes
	-- Blackrock Depths
	[160209] = { -- Horu Cloudwatcher
		["g"] = {
			L_DIALOG["Begin pet battle."],
		},
	},
	[160207] = { -- Therin Skysong
		["g"] = {
			L_DIALOG["Begin pet battle."],
		},
	},
	[160206] = { -- Alran Heartshade
		["g"] = {
			L_DIALOG["Begin pet battle."],
		},
	},
	[160208] = { -- Zuna Skullcrush
		["g"] = {
			L_DIALOG["Begin pet battle."],
		},
	},
	[160210] = { -- Tasha Riley
		["g"] = {
			L_DIALOG["Begin pet battle."],
		},
	},
	[160205] = { -- Pixy Wizzle
		["g"] = {
			L_DIALOG["Begin pet battle."],
		},
	},
	-- End of Blackrock Depths
	-- Westfall
	[119390] = { -- Marcus "Bagman" Brown
		["g"] = {
			L_DIALOG["Marcus \"Bagman\" Brown 1"],
		},
	},
	[42383] = { -- Transient
		["g"] = {
			L_DIALOG["Maybe a couple copper will loosen your tongue."],
		},
		["c"] = {
			L_DIALOG["Are you sure you want to give this hobo money?"],
		},
	},
	[42384] = { -- Homeless Stormwind Citizen
		["g"] = {
			L_DIALOG["Maybe a couple copper will loosen your tongue."],
		},
		["c"] = {
			L_DIALOG["Are you sure you want to give this hobo money?"],
		},
	},
	[42386] = { -- Homeless Stormwind Citizen
		["g"] = {
			L_DIALOG["Maybe a couple copper will loosen your tongue."],
		},
		["c"] = {
			L_DIALOG["Are you sure you want to give this hobo money?"],
		},
	},
	[42391] = { -- West Plains Drifter
		["g"] = {
			L_DIALOG["Maybe a couple copper will loosen your tongue."],
		},
		["c"] = {
			L_DIALOG["Are you sure you want to give this hobo money?"],
		},
	},
	[523] = { -- Thor
		["g"] = {
			L_DIALOG["I need a ride."],
		},
	},
	[10045] = { -- Kirk Maxwell
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	-- End of Westfall
	-- Hillsbrad Foothills
	[47442] = { -- Johnny Awesome
		["g"] = {
			L_DIALOG["Johnny Awesome 1"],
			L_DIALOG["Johnny Awesome 2"],
			L_DIALOG["Johnny Awesome 3"],
		},
	},
	[47443] = { -- Kingslayer Orkus
		["g"] = {
			L_DIALOG["Kingslayer Orkus 1"],
			L_DIALOG["Kingslayer Orkus 2"],
			L_DIALOG["Kingslayer Orkus 3"],
		},
	},
	[47444] = { -- Dumass
		["g"] = {
			L_DIALOG["Dumass 1"],
			L_DIALOG["Dumass 2"],
		},
	},
	[48218] = { -- Kingslayer Orkus
		["g"] = {
			L_DIALOG["Kingslayer Orkus 4"]
		},
	},
	-- End of Hillsbrad Foothills
	-- Mount Hyjal
	[43408] = { -- Aili Greenwillow
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	-- End of Mount Hyjal
	-- Winterspring
	[11119] = { -- Azzleby
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	-- End of Winterspring
	-- Desolace
	[11105] = { -- Aboda
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	-- End of Desolace
	-- Silithus
	[128607] = { -- Zidormi
		["g"] = {
			L_DIALOG["Zidormi 3"],
			L_DIALOG["Zidormi 6"],
		},
	},
	-- End of Silithus
	-- Uldum
	[48887] = { -- Darwishi
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	-- End of Uldum
	-- Deepholm
	[45297] = { -- Beast-Handler Rustclamp
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	[49956] = { -- Pebble
		["g"] = {
			L_DIALOG["Pebble 1"],
		},
	},
	-- End of Deepholm
	-- Silverpine Forest
	[44825] = { -- Bat Handler Maggotbreath
		["g"] = {
			L_DIALOG["Bat Handler Maggotbreath 1"],
		},
	},
	[45752] = { -- Ambermill Dimensional Portal
		["g"] = {
			L_DIALOG["Ambermill Dimensional Portal 1"],
		},
	},
	-- End of Silverpine Forest
	-- Ironforge
	[1573] = { -- Gryth Thurden
		["g"] = {
			L_DIALOG["Gryth Thurden 1"],
		},
	},
	-- End of Ironforge
	-- Stormwind City
	[107934] = { -- Recruiter Lee
		["g"] = {
			L_DIALOG["I've heard this tale before..."],
		},
		["c"] = {
			L_DIALOG["Are you sure you want to skip the Broken Shore introduction?"],
		},
	},
	[120590] = { -- Lady Jaina Proudmoore
		["g"] = {
			L_DIALOG["I'm ready to set sail!"],
		},
	},
	[149626] = { -- Vanguard Battlemage (Alliance)
		["g"] = {
			L_DIALOG["Vanguard Battlemage 1"],
		},
	},
	[171789] = { -- High Inquisitor Whitemane
		["g"] = {
			L_DIALOG["I have heard this tale before."],
		},
		["c"] = {
			L_DIALOG["Are you sure?"],
		},
	},
	[100429] = { -- Anduin Wrynn
		["g"] = {
			L_DIALOG["Anduin Wrynn 1"],
		},
	},
	[149616] = { -- Kirin Tor Emissary
		["g"] = {
			L_DIALOG["Kirin Tor Emissary 1"],
		},
	},
	[163095] = { -- Kirin Tor Emissary
		["g"] = {
			L_DIALOG["Lindie Springstock 1"],
		},
	},
	[154169] = { -- Captain Garrick
		["g"] = {
			L_DIALOG["Captain Garrick 1"],
		},
	},
	[11069] = { -- Jenova Stoneshield
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	-- End of Stormwind City
	-- Tirisfal Glades
	[141488] = { -- Zidormi
		["g"] = {
			L_DIALOG["Zidormi 1"],
		},
	},
	-- End of Tirisfal Glades
	-- Twilight Highlands
	[164012] = { -- Alexstrasza, the Life-Binder
		["g"] = {
			L_DIALOG["Alexstrasza, the Life-Binder 1"],
		},
	},
	[49767] = { -- Rukh Zumtarg
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	-- End of Twilight Highlands
	-- Durotar
	[4311] = { -- Holgar Stormaxe
		["g"] = {
			L_DIALOG["I've heard this tale before..."],
		},
		["c"] = {
			L_DIALOG["Are you sure you want to skip the Broken Shore introduction?"],
		},
	},
	-- End of Durotar
	-- Northern Barrens
	[116781] = { -- Muyani
		["g"] = {
			L_DIALOG["Muyani 1"],
		}
	},
	-- End of Northern Barrens
	-- Orgrimmar
	[135205] = { -- Nathanos Blightcaller
		["g"] = {
			L_DIALOG["Nathanos Blightcaller 1"],
		}
	},
	[167032] = { -- Chromie
		["g"] = {
			L_DIALOG["Chromie 1"],
			L_DIALOG["Chromie 2"],
		}
	},
	[168431] = { -- Warlord Breka Grimaxe
		["g"] = {
			L_DIALOG["Warlord Breka Grimaxe 2"],
		},
	},
	[171791] = { -- Nazgrim
		["g"] = {
			L_DIALOG["I have heard this tale before."],
		},
		["c"] = {
			L_DIALOG["Are you sure?"],
		},
	},
	-- End of Orgrimmar
	-- Darkshore
	[141489] = { -- Zidormi
		["g"] = {
			L_DIALOG["Zidormi 2"],
			L_DIALOG["Zidormi 3"],
		}
	},
	-- End of Darkshore
	-- Chamber of Heart
	[152194] = { -- MOTHER
		["g"] = {
			L_DIALOG["Quest"],
			L_DIALOG["MOTHER 1"],
		}
	},
	[151964] = { -- Spiritwalker Ebonhorn
		["g"] = {
			L_DIALOG["Spiritwalker Ebonhorn 4"],
		}
	},
	-- End of Chamber of Heart
	-- Shadowfang Keep (Dungeon)
	[36296] = { -- Apothecary Hummel
		["g"] = {
			L_DIALOG["Begin the battle."],
		},
	},
	-- End of Shadowfang Keep
}

addonTable.DIALOG_CLASSIC = DIALOG_CLASSIC