local addonName, addonTable = ...
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local PLAYER_TALENTS = {
	-- Death Knight
	[250] = { -- Blood
		["importString"] 	= "BoPAAAAAAAAAAAAAAAAAAAAAAACJBkkISJSkQSiECSSSkAAAAAAkIJBRSTiIBAAISSSCAAAA",
		["build"] 			= "47884",
	},
	[251] = { -- Frost
		["importString"] 	= "BsPAAAAAAAAAAAAAAAAAAAAAAkkEgAJJkUiEQSSSIkISSkISAkkERSSSSKBAAAAAAAAAAAAA",
		["build"] 			= "47884",
	},
	[252] = { -- Unholy
		["importString"] 	= "BwPAAAAAAAAAAAAAAAAAAAAAAAAEkkQSJSIkkEhQSiEBAAAAAAAAAAkkAJpBAikiUCJJJSSA",
		["build"] 			= "47884",
	},
	-- Demon Hunter
	[577] = { -- Havoc
		["importString"] 	= "BEkAAAAAAAAAAAAAAAAAAAAAAQCIhUik0SSkkIQAAAAAAA0SSgWKkkUQCpFpIJRSSC",
		["build"] 			= "47884",
	},
	[581] = { -- Vengeance
		["importString"] 	= "BUkAAAAAAAAAAAAAAAAAAAAAAAAQLCtkEJRARiAJlEQ0SkIkESSLJiEHIhSkEAAAAA",
		["build"] 			= "47884",
	},
	-- Druid
	[102] = { -- Balance
		["importString"] 	= "BYGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAKAkkIikkAkkIJSBaJSSSkSii4AJhUSKRIoAQAA",
		["build"] 			= "47884",
	},
	[103] = { -- Feral
		["importString"] 	= "BcGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAISapJhkkIpkyBQJJJRSAAAAAAoAgkAAkkkESiUSol4AAAAAAAQCoBA",
		["build"] 			= "47884",
	},
	[104] = { -- Guardian
		["importString"] 	= "BgGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAJSSSSJRJJJJCEkUoAQigAJIJJJJJSBaJAAAAAAICIAA",
		["build"] 			= "47884",
	},
	[105] = { -- Restoration
		["importString"] 	= "BkGAAAAAAAAAAAAAAAAAAAAAAQkkUKtkEJFplEEC0SJJAAAAAAAAAAAAgSASigAIBEkQJJplkAAAAAAEBAAA",
		["build"] 			= "47884",
	},
	-- Evoker
	[1467] = { -- Devastation
		["importString"] 	= "BsbBAAAAAAAAAAAAAAAAAAAAAIFCAAAAAAoolikISCJkEJtkk0CSLCSIJAJJJRIJJ",
		["build"] 			= "47884",
	},
	[1468] = { -- Preservation
		["importString"] 	= "BwbBAAAAAAAAAAAAAAAAAAAAAABtIgIJNJJJJCJJJhAAAAAAQiEJSIJQSSChIJB",
		["build"] 			= "47884",
	},
	-- Hunter
	[253] = { -- Beast Mastery
		["importString"] 	= "B0PAAAAAAAAAAAAAAAAAAAAAA4AgWCAQAAAAAAAAAAAoBIhWikIJkkDEpJkSikQkERasgEB",
		["build"] 			= "47884",
	},
	[254] = { -- Marksmanship
		["importString"] 	= "B4PAAAAAAAAAAAAAAAAAAAAAAUOQEaBgEIIAAAAAkERSSSCCRSDpRCUkSaCJSQiEpBAAAAA",
		["build"] 			= "47884",
	},
	[255] = { -- Survival
		["importString"] 	= "B8PAAAAAAAAAAAAAAAAAAAAAA4ABahkEIBBJHIRaJECRSKRIAAAAAQQUkiGkIhkIhGAAAAA",
		["build"] 			= "47884",
	},
	-- Mage
	[62] = { -- Arcane
		["importString"] 	= "B4DAAAAAAAAAAAAAAAAAAAAAAAkkkSikIJlAJNhIiIhkEcAJRIJAAAAAAAAAAAAkkkESSSSC",
		["build"] 			= "47884",
	},
	[63] = { -- Fire
		["importString"] 	= "B8DAAAAAAAAAAAAAAAAAAAAAAIJRgSSyBQSRESTiIiIJAAAAAAAAAkQSiEkGJJSkkkIFAAAA",
		["build"] 			= "47884",
	},
	[64] = { -- Frost
		["importString"] 	= "BAEAAAAAAAAAAAAAAAAAAAAAAIJSgWicgIJFISTIiISSAAAkkkEhEJJJSKJJJCAAAAAAAAAgA",
		["build"] 			= "47884",
	},
	-- Monk
	[268] = { -- Brewmaster
		["importString"] 	= "BwQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAAloUSSiQSSrRAAAASL0SiEJJJkkkkUkAaRi0SrEC",
		["build"] 			= "47884",
	},
	[270] = { -- Mistweaver
		["importString"] 	= "B4QAAAAAAAAAAAAAAAAAAAAAAIRUkkkQRLJSkDQSDiUEAAAAAAAAAAAAAIlgIRCkkkkUSCSAAE",
		["build"] 			= "47884",
	},
	[269] = { -- Windwalker
		["importString"] 	= "B0QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHAJRSSSTiEBAAAAkkkESASkItItkERSkIJJJSTCAAA",
		["build"] 			= "47884",
	},
	-- Paladin
	[65] = { -- Holy
		["importString"] 	= "BEEAAAAAAAAAAAAAAAAAAAAAAAAAAAAQSAAAAAAA0SCQJSiSTkiEJlEolIRTEJpIRSSUSRSQBRA",
		["build"] 			= "47884",
	},
	[66] = { -- Protection
		["importString"] 	= "BIEAAAAAAAAAAAAAAAAAAAAAA0iWikikiIJJKNJJEkQAAAAAAAAAAAAAAQTSSSkASUSJIJloEA",
		["build"] 			= "47884",
	},
	[70] = { -- Retribution
		["importString"] 	= "BYEAAAAAAAAAAAAAAAAAAAAAAAAAAAAgIBgolSSCJBJkSKJJpVCAAAAAAg0QSSkEiElUSSQJKB",
		["build"] 			= "47884",
	},
	-- Priest
	[256] = { -- Discipline
		["importString"] 	= "BAQAAAAAAAAAAAAAAAAAAAAAAAAkUIJQSQSSUSJJJJAAAAAAAAAAAASEKkiEJISRIRItSkIgWE",
		["build"] 			= "47884",
	},
	[257] = { -- Holy
		["importString"] 	= "BEQAAAAAAAAAAAAAAAAAAAAAAQTAAAAAAAAlEKpIkkIQkkIKJJAAAAAAQKSSCiUSIRQpFJJBaB",
		["build"] 			= "47884",
	},
	[258] = { -- Shadow
		["importString"] 	= "BIQAAAAAAAAAAAAAAAAAAAAAAISSLSAAAAAAAAAAAAAISiSkmUISSSJhEBaRSSiUIFSQQpFhkAA",
		["build"] 			= "47884",
	},
	-- Rogue
	[259] = { -- Assassination
		["importString"] 	= "BMQAAAAAAAAAAAAAAAAAAAAAAQLJSikIRLBAAAAAAQiAIJAAAAAAASJJCtkgkkEhkkAJRSiFE",
		["build"] 			= "47884",
	},
	[260] = { -- Outlaw
		["importString"] 	= "BQQAAAAAAAAAAAAAAAAAAAAAAAAAgEREAJJkIJJIJRSSiIkkkIAAAAAAARJSIlkASSKBAAAA",
		["build"] 			= "47884",
	},
	[261] = { -- Subtlety
		["importString"] 	= "BUQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAhAJJiIBIRSCSSSISSESSSLJhDUSCSSkSAAAA",
		["build"] 			= "47884",
	},
	-- Shaman
	[262] = { -- Elemental
		["importString"] 	= "BYQAAAAAAAAAAAAAAAAAAAAAAAAAAAAgUSpUSSJJ0i0SSDBNIBAAAAAAIApkEl0EFINSSTJBlkASA",
		["build"] 			= "47884",
	},
	[263] = { -- Enhancement
		["importString"] 	= "BcQAAAAAAAAAAAAAAAAAAAAAAIRSaASSSikkQiEJAAAAAAAAAAAAAICRIRLFBIlEJFEQkESA",
		["build"] 			= "47884",
	},
	[264] = { -- Restoration
		["importString"] 	= "BgQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIpJJkkWkAaBJlUSKkUSIkSSSLFBk0CBE0SCIB",
		["build"] 			= "47884",
	},
	-- Warlock
	[265] = { -- Affliction
		["importString"] 	= "BkQAAAAAAAAAAAAAAAAAAAAAAgQSSSiEINFCSLJJRaBAAAAapBAAAAAAIJakISSSS0SIAA",
		["build"] 			= "47884",
	},
	[266] = { -- Demonology
		["importString"] 	= "BoQAAAAAAAAAAAAAAAAAAAAAAggkEJSg0SJCSLJJkWAAAAAQLCSIkIJSSiItkIhAAAAAAA",
		["build"] 			= "47884",
	},
	[267] = { -- Destruction
		["importString"] 	= "BsQAAAAAAAAAAAAAAAAAAAAAAggkEJSg0SLCSLJJkWgkDoEJiWQr0IBAAAAAAAAAAAQCJlkE",
		["build"] 			= "47884",
	},
	-- Warrior
	[71] = { -- Arms 
		["importString"] 	= "BcEAAAAAAAAAAAAAAAAAAAAAAAIFJSSkQkkWpEJBAAAABRgCBUEBkIkEKSESAhECAAAAAAAAJKJIgQ0CB",
		["build"] 			= "47884",
	},
	[72] = { -- Fury
		["importString"] 	= "BgEAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAQggSAEBhIIRDSIJQkESSaJJSkggEJRapFgkkEAAAEQQA",
		["build"] 			= "47884",
	},
	[73] = { -- Protection
		["importString"] 	= "BkEAAAAAAAAAAAAAAAAAAAAAAIQAAAAgkkEJJk0SKJJpUQEINFJElkEgIkkQDJJAQIAAAAAAAQEAgSpBAC",
		["build"] 			= "47884",
	},
}
addonTable.PLAYER_TALENTS = PLAYER_TALENTS