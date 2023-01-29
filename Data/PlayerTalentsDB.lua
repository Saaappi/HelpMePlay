local addonName, addonTable = ...
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local PLAYER_TALENTS = {
	-- Death Knight
	[250] = { -- Blood
		["importString"] 	= "BoPAAAAAAAAAAAAAAAAAAAAAAACJBkkISJSkQSiECSSSkAAAAAAkIJBRSTiIBAAISSSCAAAA",
		["build"] 			= "47871",
	},
	[251] = { -- Frost
		["importString"] 	= "BsPAAAAAAAAAAAAAAAAAAAAAAkkEgAJJkUiEQSSSIkISSkISAkkERSSSSKBAAAAAAAAAAAAA",
		["build"] 			= "47871",
	},
	[252] = { -- Unholy
		["importString"] 	= "BwPAAAAAAAAAAAAAAAAAAAAAAAAEkkQSJSIkkEhQSiEBAAAAAAAAAAkkAJpBAikiUCJJJSSA",
		["build"] 			= "47871",
	},
	-- Demon Hunter
	[577] = { -- Havoc
		["importString"] 	= "BEkAAAAAAAAAAAAAAAAAAAAAAQCIhUik0SSkkIQAAAAAAA0SSgWKkkUQCpFpIJRSSC",
		["build"] 			= "47871",
	},
	[581] = { -- Vengeance
		["importString"] 	= "BUkAAAAAAAAAAAAAAAAAAAAAAAAQLCtkEJRARiAJlEQ0SkIkESSLJiEHIhSkEAAAAA",
		["build"] 			= "47871",
	},
	-- Druid
	[102] = { -- Balance
		["importString"] 	= "BYGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAKAkkIikkAkkIJSBaJSSSkSii4AJhUSKRIoAQAA",
		["build"] 			= "47871",
	},
	[103] = { -- Feral
		["importString"] 	= "BcGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAISapJhkkIpkyBQJJJRSAAAAAAoAgkAAkkkESiUSol4AAAAAAAQCoBA",
		["build"] 			= "47871",
	},
	[104] = { -- Guardian
		["importString"] 	= "BgGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAJSSSSJRJJJJCEkUoAQigAJIJJJJJSBaJAAAAAAICIAA",
		["build"] 			= "47871",
	},
	[105] = { -- Restoration
		["importString"] 	= "BkGAAAAAAAAAAAAAAAAAAAAAAQkkUKtkEJFplEEC0SJJAAAAAAAAAAAAgSASigAIBEkQJJplkAAAAAAEBAAA",
		["build"] 			= "47871",
	},
	-- Evoker
	[1467] = { -- Devastation
		["importString"] 	= "BsbBAAAAAAAAAAAAAAAAAAAAAIFCAAAAAAoolikISCJkEJtkk0CSLCSIJAJJJRIJJ",
		["build"] 			= "47871",
	},
	[1468] = { -- Preservation
		["importString"] 	= "BwbBAAAAAAAAAAAAAAAAAAAAAABtIgIJNJJJJCJJJhAAAAAAQiEJSIJQSSChIJB",
		["build"] 			= "47871",
	},
	-- Hunter
	[253] = { -- Beast Mastery
		["importString"] 	= "B0PAAAAAAAAAAAAAAAAAAAAAA4AgWCAQAAAAAAAAAAAoBIhWikIJkkDEpJkSikQkERasgEB",
		["build"] 			= "47871",
	},
	[254] = { -- Marksmanship
		["importString"] 	= "B4PAAAAAAAAAAAAAAAAAAAAAAUOQEaBgEIIAAAAAkERSSSCCRSDpRCUkSaCJSQiEpBAAAAA",
		["build"] 			= "47871",
	},
	[255] = { -- Survival
		["importString"] 	= "B8PAAAAAAAAAAAAAAAAAAAAAA4ABahkEIBBJHIRaJECRSKRIAAAAAQQUkiGkIhkIhGAAAAA",
		["build"] 			= "47871",
	},
	-- Mage
	[62] = { -- Arcane
		["importString"] 	= "B4DAAAAAAAAAAAAAAAAAAAAAAAkkkSikIJlAJNhIiIhkEcAJRIJAAAAAAAAAAAAkkkESSSSC",
		["build"] 			= "47871",
	},
	[63] = { -- Fire
		["importString"] 	= "B8DAAAAAAAAAAAAAAAAAAAAAAIJRgSSyBQSRESTiIiIJAAAAAAAAAkQSiEkGJJSkkkIFAAAA",
		["build"] 			= "47871",
	},
	[64] = { -- Frost
		["importString"] 	= "BAEAAAAAAAAAAAAAAAAAAAAAAIJSgWicgIJFISTIiISSAAAkkkEhEJJJSKJJJCAAAAAAAAAgA",
		["build"] 			= "47871",
	},
	-- Monk
	[268] = { -- Brewmaster
		["importString"] 	= "BwQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAAloUSSiQSSrRAAAASL0SiEJJJkkkkUkAaRi0SrEC",
		["build"] 			= "47871",
	},
	[270] = { -- Mistweaver
		["importString"] 	= "B4QAAAAAAAAAAAAAAAAAAAAAAIRUkkkQRLJSkDQSDiUEAAAAAAAAAAAAAIlgIRCkkkkUSCSAAE",
		["build"] 			= "47871",
	},
	[269] = { -- Windwalker
		["importString"] 	= "B0QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHAJRSSSTiEBAAAAkkkESASkItItkERSkIJJJSTCAAA",
		["build"] 			= "47871",
	},
	-- Paladin
	[65] = { -- Holy
		["importString"] 	= "BEEAAAAAAAAAAAAAAAAAAAAAAAAAAAAQSAAAAAAA0SCQJSiSTkiEJlEolIRTEJpIRSSUSRSQBRA",
		["build"] 			= "47871",
	},
	[66] = { -- Protection
		["importString"] 	= "BIEAAAAAAAAAAAAAAAAAAAAAA0iWikikiIJJKNJJEkQAAAAAAAAAAAAAAQTSSSkASUSJIJloEA",
		["build"] 			= "47871",
	},
	[70] = { -- Retribution
		["importString"] 	= "BYEAAAAAAAAAAAAAAAAAAAAAAAAAAAAgIBgolSSCJBJkSKJJpVCAAAAAAg0QSSkEiElUSSQJKB",
		["build"] 			= "47871",
	},
	-- Priest
	[256] = { -- Discipline
		["importString"] 	= "BAQAAAAAAAAAAAAAAAAAAAAAAAAkUIJQSQSSUSJJJJAAAAAAAAAAAASEKkiEJISRIRItSkIgWE",
		["build"] 			= "47871",
	},
	[257] = { -- Holy
		["importString"] 	= "BEQAAAAAAAAAAAAAAAAAAAAAAQTAAAAAAAAlEKpIkkIQkkIKJJAAAAAAQKSSCiUSIRQpFJJBaB",
		["build"] 			= "47871",
	},
	[258] = { -- Shadow
		["importString"] 	= "BIQAAAAAAAAAAAAAAAAAAAAAAISSLSAAAAAAAAAAAAAISiSkmUISSSJhEBaRSSiUIFSQQpFhkAA",
		["build"] 			= "47871",
	},
	-- Rogue
	[259] = { -- Assassination
		["importString"] 	= "BMQAAAAAAAAAAAAAAAAAAAAAAQLJSikIRLBAAAAAAQiAIJAAAAAAASJJCtkgkkEhkkAJRSiFE",
		["build"] 			= "47871",
	},
	[260] = { -- Outlaw
		["importString"] 	= "BQQAAAAAAAAAAAAAAAAAAAAAAAAAgEREAJJkIJJIJRSSiIkkkIAAAAAAARJSIlkASSKBAAAA",
		["build"] 			= "47871",
	},
	[261] = { -- Subtlety
		["importString"] 	= "BUQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAhAJJiIBIRSCSSSISSESSSLJhDUSCSSkSAAAA",
		["build"] 			= "47871",
	},
	-- Shaman
	[262] = { -- Elemental
		["importString"] 	= "BYQAAAAAAAAAAAAAAAAAAAAAAAAAAAAgUSpUSSJJ0i0SSDBNIBAAAAAAIApkEl0EFINSSTJBlkASA",
		["build"] 			= "47871",
	},
	[263] = { -- Enhancement
		["importString"] 	= "BcQAAAAAAAAAAAAAAAAAAAAAAIRSaASSSikkQiEJAAAAAAAAAAAAAICRIRLFBIlEJFEQkESA",
		["build"] 			= "47871",
	},
	[264] = { -- Restoration
		["importString"] 	= "BgQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIpJJkkWkAaBJlUSKkUSIkSSSLFBk0CBE0SCIB",
		["build"] 			= "47871",
	},
	-- Warlock
	[265] = { -- Affliction
		["importString"] 	= "BkQAAAAAAAAAAAAAAAAAAAAAAgQSSSiEINFCSLJJRaBAAAAapBAAAAAAIJakISSSS0SIAA",
		["build"] 			= "47871",
	},
	[266] = { -- Demonology
		["importString"] 	= "BoQAAAAAAAAAAAAAAAAAAAAAAggkEJSg0SJCSLJJkWAAAAAQLCSIkIJSSiItkIhAAAAAAA",
		["build"] 			= "47871",
	},
	[267] = { -- Destruction
		["importString"] 	= "BsQAAAAAAAAAAAAAAAAAAAAAAggkEJSg0SLCSLJJkWgkDoEJiWQr0IBAAAAAAAAAAAQCJlkE",
		["build"] 			= "47871",
	},
	-- Warrior
	[71] = { -- Arms 
		["importString"] 	= "BcEAAAAAAAAAAAAAAAAAAAAAAAIFJSSkQkkWpEJBAAAABRgCBUEBkIkEKSESAhECAAAAAAAAJKJIgQ0CB",
		["build"] 			= "47871",
	},
	[72] = { -- Fury
		["importString"] 	= "BgEAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAQggSAEBhIIRDSIJQkESSaJJSkggEJRapFgkkEAAAEQQA",
		["build"] 			= "47871",
	},
	[73] = { -- Protection
		["importString"] 	= "BkEAAAAAAAAAAAAAAAAAAAAAAIQAAAAgkkEJJk0SKJJpUQEINFJElkEgIkkQDJJAQIAAAAAAAQEAgSpBAC",
		["build"] 			= "47871",
	},
}
addonTable.PLAYER_TALENTS = PLAYER_TALENTS