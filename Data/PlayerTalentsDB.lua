local addonName, addonTable = ...
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local PLAYER_TALENTS = {
	-- Death Knight
	[250] = { -- Blood
		["importString"] 	= "BoPAAAAAAAAAAAAAAAAAAAAAAACJBkkISJSkQSiECSSSkAAAAAAkIJBRSTiIBAAISSSCAAAA",
		["patch"] 			= "10.0.5",
	},
	[251] = { -- Frost
		["importString"] 	= "BsPAAAAAAAAAAAAAAAAAAAAAAkkEgAJJkUiEQSSSIkISSkISAkkERSSSSKBAAAAAAAAAAAAA",
		["patch"] 			= "10.0.5",
	},
	[252] = { -- Unholy
		["importString"] 	= "BwPAAAAAAAAAAAAAAAAAAAAAAAAEkkQSJSIkkEhQSiEBAAAAAAAAAAkkAJpBAikiUCJJJSSA",
		["patch"] 			= "10.0.5",
	},
	-- Demon Hunter
	[577] = { -- Havoc
		["importString"] 	= "BEkAAAAAAAAAAAAAAAAAAAAAAQCIhUik0SSkkIQAAAAAAA0SSgWKkkUQCpFpIJRSSC",
		["patch"] 			= "10.0.5",
	},
	[581] = { -- Vengeance
		["importString"] 	= "BUkAAAAAAAAAAAAAAAAAAAAAAAAQLCtkEJRARiAJlEQ0SkIkESSLJiEHIhSkEAAAAA",
		["patch"] 			= "10.0.5",
	},
	-- Druid
	[102] = { -- Balance
		["importString"] 	= "BYGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAKAkkIikkAkkIJSBaJSSSkSii4AJhUSKRIoAQAA",
		["patch"] 			= "10.0.5",
	},
	[103] = { -- Feral
		["importString"] 	= "BcGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAISapJhkkIpkyBQJJJRSAAAAAAoAgkAAkkkESiUSol4AAAAAAAQCoBA",
		["patch"] 			= "10.0.5",
	},
	[104] = { -- Guardian
		["importString"] 	= "BgGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAJSSSSJRJJJJCEkUoAQigAJIJJJJJSBaJAAAAAAICIAA",
		["patch"] 			= "10.0.5",
	},
	[105] = { -- Restoration
		["importString"] 	= "BkGAAAAAAAAAAAAAAAAAAAAAAQkkUKtkEJFplEEC0SJJAAAAAAAAAAAAgSASigAIBEkQJJplkAAAAAAEBAAA",
		["patch"] 			= "10.0.5",
	},
	-- Evoker
	[1467] = { -- Devastation
		["importString"] 	= "BsbBAAAAAAAAAAAAAAAAAAAAAIFCAAAAAAoolikISCJkEJtkk0CSLCSIJAJJJRIJJ",
		["patch"] 			= "10.0.5",
	},
	[1468] = { -- Preservation
		["importString"] 	= "BwbBAAAAAAAAAAAAAAAAAAAAAABtIgIJNJJJJCJJJhAAAAAAQiEJSIJQSSChIJB",
		["patch"] 			= "10.0.5",
	},
	-- Hunter
	[253] = { -- Beast Mastery
		["importString"] 	= "B0PAAAAAAAAAAAAAAAAAAAAAA4AgWCAQAAAAAAAAAAAoBIhWikIJkkDEpJkSikQkERasgEB",
		["patch"] 			= "10.0.5",
	},
	[254] = { -- Marksmanship
		["importString"] 	= "B4PAAAAAAAAAAAAAAAAAAAAAA4ARoFASCCCAAAAQERkkkkgIRSLkGRQRKaCJJhESoBAAAAA",
		["patch"] 			= "10.0.5",
	},
	[255] = { -- Survival
		["importString"] 	= "B8PAAAAAAAAAAAAAAAAAAAAAA4ABahkEIBBJHIRaJECRSKRIAAAAAQQUkiGkIhkIhGAAAAA",
		["patch"] 			= "10.0.5",
	},
	-- Mage
	[62] = { -- Arcane
		["importString"] 	= "B4DAAAAAAAAAAAAAAAAAAAAAAQCRokkkkEFQSTIiIkIBolEJtkAAAAAAAAAAAAIJJJhkkkIA",
		["patch"] 			= "10.0.5",
	},
	[63] = { -- Fire
		["importString"] 	= "B8DAAAAAAAAAAAAAAAAAAAAAAIJRgSSyBQSRESTiIiIJAAAAAAAAAkQSiEkGJJSkkkIFAAAA",
		["patch"] 			= "10.0.5",
	},
	[64] = { -- Frost
		["importString"] 	= "BAEAAAAAAAAAAAAAAAAAAAAAAIJSgWicgIJFISTIiISSAAAkkkEhEJJJSKJJJCAAAAAAAAAgA",
		["patch"] 			= "10.0.5",
	},
	-- Monk
	[268] = { -- Brewmaster
		["importString"] 	= "BwQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAAloUSSiQSSrRAAAASL0SiEJJJkkkkUkAaRi0SrEC",
		["patch"] 			= "10.0.5",
	},
	[270] = { -- Mistweaver
		["importString"] 	= "B4QAAAAAAAAAAAAAAAAAAAAAAIRUkkkQRLJSkDQSDiUEAAAAAAAAAAAAAIlgIRCkkkkUSCSAAE",
		["patch"] 			= "10.0.5",
	},
	[269] = { -- Windwalker
		["importString"] 	= "B0QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHAJRSSSTiEBAAAAkkkESASkItItkERSkIJJJSTCAAA",
		["patch"] 			= "10.0.5",
	},
	-- Paladin
	[65] = { -- Holy
		["importString"] 	= "BEEAAAAAAAAAAAAAAAAAAAAAAAAAAAAQSAAAAAAA0SCQJSiSTkiEJlEolIRTEJpIRSSUSRSQBRA",
		["patch"] 			= "10.0.5",
	},
	[66] = { -- Protection
		["importString"] 	= "BIEAAAAAAAAAAAAAAAAAAAAAA0iWikikiIJJKNJJEkQAAAAAAAAAAAAAAQTSSSkASUSJIJloEA",
		["patch"] 			= "10.0.5",
	},
	[70] = { -- Retribution
		["importString"] 	= "BYEAAAAAAAAAAAAAAAAAAAAAAAAAAAAgIBgolSSCJBJkSKJJpVCAAAAAAg0QSSkEiElUSSQJKB",
		["patch"] 			= "10.0.5",
	},
	-- Priest
	[256] = { -- Discipline
		["importString"] 	= "BAQAAAAAAAAAAAAAAAAAAAAAAAAkUIJQSQSSUSJJJJAAAAAAAAAAAASEKkiEJISRIRItSkIgWE",
		["patch"] 			= "10.0.5",
	},
	[257] = { -- Holy
		["importString"] 	= "BEQAAAAAAAAAAAAAAAAAAAAAAQTAAAAAAAAlEKpIkkIQkkIKJJAAAAAAQKSSCiUSIRQpFJJBaB",
		["patch"] 			= "10.0.5",
	},
	[258] = { -- Shadow
		["importString"] 	= "BIQAAAAAAAAAAAAAAAAAAAAAAISSLSAAAAAAAAAAAAAISiSkmUISSSJhEBaRSSiUIFSQQpFhkAA",
		["patch"] 			= "10.0.5",
	},
	-- Rogue
	[259] = { -- Assassination
		["importString"] 	= "BMQAAAAAAAAAAAAAAAAAAAAAAQLJSikIRLBAAAAAAQiAIJAAAAAAASJJCtkgkkEhkkAJRSiFE",
		["patch"] 			= "10.0.5",
	},
	[260] = { -- Outlaw
		["importString"] 	= "BQQAAAAAAAAAAAAAAAAAAAAAAAAAgEREAJJkIJJIJRSSiIkkkIAAAAAAARJSIlkASSKBAAAA",
		["patch"] 			= "10.0.5",
	},
	[261] = { -- Subtlety
		["importString"] 	= "BUQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAhAJJiIBIRSCSSSISSESSSLJhDUSCSSkSAAAA",
		["patch"] 			= "10.0.5",
	},
	-- Shaman
	[262] = { -- Elemental
		["importString"] 	= "BYQAAAAAAAAAAAAAAAAAAAAAAAAAAAAgUSpUSSJJ0i0SSDBNIBAAAAAAIApkEl0EFINSSTJBlkASA",
		["patch"] 			= "10.0.5",
	},
	[263] = { -- Enhancement
		["importString"] 	= "BcQAAAAAAAAAAAAAAAAAAAAAAIRSaASSSikkQiEJAAAAAAAAAAAAAICRIRLFBIlEJFEQkESA",
		["patch"] 			= "10.0.5",
	},
	[264] = { -- Restoration
		["importString"] 	= "BgQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIpJJkkWkAaBJlUSKkUSIkSSSLFBk0CBE0SCIB",
		["patch"] 			= "10.0.5",
	},
	-- Warlock
	[265] = { -- Affliction
		["importString"] 	= "BkQAAAAAAAAAAAAAAAAAAAAAAgQSSSiEINFCSLJJRaBAAAAapBAAAAAAIJakISSSS0SIAA",
		["patch"] 			= "10.0.5",
	},
	[266] = { -- Demonology
		["importString"] 	= "BoQAAAAAAAAAAAAAAAAAAAAAAggkEJSg0SJCSLJJkWAAAAAQLCSIkIJSSiItkIhAAAAAAA",
		["patch"] 			= "10.0.5",
	},
	[267] = { -- Destruction
		["importString"] 	= "BsQAAAAAAAAAAAAAAAAAAAAAAggkEJSg0SLCSLJJkWgkDoEJiWQr0IBAAAAAAAAAAAQCJlkE",
		["patch"] 			= "10.0.5",
	},
	-- Warrior
	[71] = { -- Arms 
		["importString"] 	= "BcEAAAAAAAAAAAAAAAAAAAAAAAIFJSSkQkkWpEJBAAAABRgCBUEBkIkEKSESAhECAAAAAAAAJKJIgQ0CB",
		["patch"] 			= "10.0.5",
	},
	[72] = { -- Fury
		["importString"] 	= "BgEAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAQggSAEBhIIRDSIJQkESSaJJSkggEJRapFgkkEAAAEQQA",
		["patch"] 			= "10.0.5",
	},
	[73] = { -- Protection
		["importString"] 	= "BkEAAAAAAAAAAAAAAAAAAAAAAIQAAAAgkkEJJk0SKJJpUQEINFJElkEgIkkQDJJAQIAAAAAAAQEAgSpBAC",
		["patch"] 			= "10.0.5",
	},
}
addonTable.PLAYER_TALENTS = PLAYER_TALENTS