local addonName, t = ...;

local quests = {
	[10] = { -- Northern Barrens
		["In Defense of Far Watch"] = {
			["id"] = 871,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
	},
	[21] = { -- Silverpine Forest
		["The Warchief Cometh"] = {
			["id"] = 26965,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Warchief's Command: Hillsbrad Foothills!"] = {
			["id"] = 28089,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Guts and Gore"] = {
			["id"] = 26995,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["The Gilneas Liberation Front"] = {
			["id"] = 26989,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Agony Abounds"] = {
			["id"] = 26992,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Iterating Upon Success"] = {
			["id"] = 26998,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Dangerous Intentions"] = {
			["id"] = 27039,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Waiting to Exsanguinate"] = {
			["id"] = 27045,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Belmont's Report"] = {
			["id"] = 27056,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["The Warchief's Fleet"] = {
			["id"] = 27065,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Steel Thunder"] = {
			["id"] = 27069,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Give 'em Hell!"] = {
			["id"] = 27073,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Playing Dirty"] = {
			["id"] = 27082,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["It's Only Poisonous if You Ingest It"] = {
			["id"] = 27088,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Lost in the Darkness"] = {
			["id"] = 27093,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Skitterweb Menace"] = {
			["id"] = 27095,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Deeper into Darkness"] = { -- Auto Accepted
			["id"] = 27094,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Orcs are in Order"] = {
			["id"] = 27096,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = 645, -- Forsaken High Command, Silverpine Forest
		},
		["Rise, Forsaken"] = {
			["id"] = 27097,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["No Escape"] = { -- Auto Accepted
			["id"] = 27099,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Lordaeron"] = {
			["id"] = 27098,
			["reward"] = 0,
			["cancelCinematic"] = true,
			["flightPath"] = nil,
		},
		["Honor the Dead"] = {
			["id"] = 27180,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Hair of the Dog"] = {
			["id"] = 27226,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Reinforcements from Fenris"] = {
			["id"] = 27231,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Excising the Taint"] = { -- Auto Accepted
			["id"] = 27181,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Seek and Destroy"] = { -- Auto Accepted
			["id"] = 27193,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Cornered and Crushed!"] = { -- Auto Accepted
			["id"] = 27194,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Nowhere to Run"] = {
			["id"] = 27195,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["The Waters Run Red..."] = {
			["id"] = 27232,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["To Forsaken Forward Command"] = {
			["id"] = 27290,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["In Time, All Will Be Revealed"] = {
			["id"] = 27342,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Losing Ground"] = {
			["id"] = 27333,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["The F.C.D."] = {
			["id"] = 27345,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Korok the Colossus"] = { -- Drops from Korok the Colossus, Starts from an Item
			["id"] = 27322,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Break in Communications: Dreadwatch Outpost"] = {
			["id"] = 27349,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Break in Communications: Rutsak's Outpost"] = { -- Auto Accepted
			["id"] = 27350,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Vengeance for Our Soldiers"] = {
			["id"] = 27360,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["On Whose Orders?"] = { -- Auto Accepted
			["id"] = 27364,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["What Tomorrow Brings"] = { -- Auto Accepted
			["id"] = 27401,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Fall Back!"] = {
			["id"] = 27405,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["A Man Named Godfrey"] = {
			["id"] = 27406,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Resistance is Futile"] = { -- Auto Accepted
			["id"] = 27423,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["The Great Escape"] = {
			["id"] = 27438,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Rise, Godfrey"] = {
			["id"] = 27472,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Breaking the Barrier"] = {
			["id"] = 27474,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		[""] = {
			["id"] = ,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Unyielding Servitors"] = {
			["id"] = 27475,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Dalar Dawnweaver"] = {
			["id"] = 27476,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Relios the Relic Keeper"] = {
			["id"] = 27478,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Practical Vengeance"] = {
			["id"] = 27483,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Ley Energies"] = { -- Drops from Arcane Remnants, Starts from an Item
			["id"] = 27480,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Only One May Enter"] = {
			["id"] = 27484,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Transdimensional Warfare: Chapter I"] = {
			["id"] = 27512,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["A Wolf in Bear's Clothing"] = {
			["id"] = 27510,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Transdimensional Warfare: Chapter II"] = {
			["id"] = 27513,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Transdimensional Warfare: Chapter III"] = { -- Auto Accepted
			["id"] = 27518,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Taking the Battlefront"] = {
			["id"] = 27542,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Pyrewood's Fall"] = {
			["id"] = 27550,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Lessons in Fear"] = {
			["id"] = 27548,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Of No Consequence"] = {
			["id"] = 27547,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["I Never Forget a Face"] = { -- Drops from Marsh Crocolisks, Starts from an Item
			["id"] = 27574,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["From the Belly of the Beast"] = {
			["id"] = 27575,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["7th Legion Battle Plans"] = {
			["id"] = 27577,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
		["Sowing Discord"] = {
			["id"] = 27580,
			["reward"] = 0,
			["cancelCinematic"] = false,
			["flightPath"] = nil,
		},
	},
	[22] = { -- Western Plaguelands
	
	},
	[25] = { -- Hillsbrad Foothills
	
	},
	[65] = { -- Stonetalon Mountains
	
	},
	[70] = { -- Dustwallow Marsh
	
	},
	[199] = { -- Southern Barrens
	
	},
};

t.quests = quests;