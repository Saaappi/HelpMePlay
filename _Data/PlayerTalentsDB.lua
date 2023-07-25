local addonName, addon = ...
local PLAYER_TALENTS = {
	-- Death Knight
	[250] = { -- Blood
		["importString"] 	= "BoPAAAAAAAAAAAAAAAAAAAAAAACJBkkIHIlIRQSiECSSSkAAAAAAJSiDQk0kISAAAikkkAAAAA",
		["patch"] 			= "10.1.5",
	},
	[251] = { -- Frost
		["importString"] 	= "BsPAAAAAAAAAAAAAAAAAAAAAAkIBIQSCJlIhQikEikISEBJQIJRkkkkkSCAAAAAAAAAAAAA",
		["patch"] 			= "10.1.5",
	},
	[252] = { -- Unholy
		["importString"] 	= "BwPAAAAAAAAAAAAAAAAAAAAAAAAEkkQSJSIkIRISSiEBAAAAAAAAAgkEJSSaAAkkUQSSOgkE",
		["patch"] 			= "10.1.5",
	},
	-- Demon Hunter
	[577] = { -- Havoc
		["importString"] 	= "BEkAAAAAAAAAAAAAAAAAAAAAAIBkEpERaJJSSEICAAAAAAolkAShkkCSSLJkkkkEA",
		["patch"] 			= "10.1.5",
	},
	[581] = { -- Vengeance
		["importString"] 	= "BUkAAAAAAAAAAAAAAAAAAAAAAAAoEhWSiICISEIplAiWIRikQSaJpkkQiUCJAAAAA",
		["patch"] 			= "10.1.5",
	},
	-- Druid
	[102] = { -- Balance
		["importString"] 	= "BYGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgCAJiIIJSQSIJSRol4AJJJKJI5AhQJpkEioBQBAE",
		["patch"] 			= "10.1.5",
	},
	[103] = { -- Feral
		["importString"] 	= "BcGAAAAAAAAAAAAAAAAAAAAAAAAAAAAACJNkolkEJlUCKJJJSCAAAAAgCAJCAQSSSIJUSolkAAAAAAAJAAA",
		["patch"] 			= "10.1.5",
	},
	[104] = { -- Guardian
		["importString"] 	= "BgGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQiIJJlElkIioQIJFKAkIIIhIJJJJJSRAAAAAAAICIIBA",
		["patch"] 			= "10.1.5",
	},
	[105] = { -- Restoration
		["importString"] 	= "BkGAAAAAAAAAAAAAAAAAAAAAAgkkWTSSSItkAJNaKpFBAAAAAAAAAAAAKJEkIIASSCRSCtQaJAAAAAAEBAAA",
		["patch"] 			= "10.1.5",
	},
	-- Evoker
	[1467] = { -- Devastation
		["importString"] 	= "BsbBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAikgkmESABikIRSItoEJJhcgkSCQk0ikkkEIQA",
		["patch"] 			= "10.1.5",
	},
	[1468] = { -- Preservation
		["importString"] 	= "BwbBAAAAAAAAAAAAAAAAAAAAAAAAAAASSSkWgIJRKSSEAAAkEJSICJBJJAAAgkkIJtkISAAA",
		["patch"] 			= "10.1.5",
	},
	-- Hunter
	[253] = { -- Beast Mastery
		["importString"] 	= "B0PAAAAAAAAAAAAAAAAAAAAAA4ACaJAoQAAAAAAAAAAAoRgEaJRCJikEaCRIJkkEhGJRA",
		["patch"] 			= "10.1.5",
	},
	[254] = { -- Marksmanship
		["importString"] 	= "B4PAAAAAAAAAAAAAAAAAAAAAA4ARoFACIIAAAAAkkEJJJCiEJtQakAFpkmQiEkIRaAAAAAA",
		["patch"] 			= "10.1.5",
	},
	[255] = { -- Survival
		["importString"] 	= "B8PAAAAAAAAAAAAAAAAAAAAAA4ABahkEQQQikkWicASEJRECAAAAAEhSRKIkIBJSEAAAAAA",
		["patch"] 			= "10.1.5",
	},
	-- Mage
	[62] = { -- Arcane
		["importString"] 	= "B4DAAAAAAAAAAAAAAAAAAAAAAIJIl0QiIpIQiERERSEIJJRSLJAAAAAAAAAAAgIJJJkkkIIA",
		["patch"] 			= "10.1.5",
	},
	[63] = { -- Fire
		["importString"] 	= "B8DAAAAAAAAAAAAAAAAAAAAAAkkgUSDJSSaCkIRERIBAAAAAAAAAiQiQJJtkkIJJJpBAAACB",
		["patch"] 			= "10.1.5",
	},
	[64] = { -- Frost
		["importString"] 	= "BAEAAAAAAAAAAAAAAAAAAAAAAIRANEJJpJgIRERkkAAAkAESkkkIJJJJBAAAAAAAAAIA",
		["patch"] 			= "10.1.5",
	},
	-- Monk
	[268] = { -- Brewmaster
		["importString"] 	= "BwQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAAAAQKUKJJESSKtDIAAAApEpkEJSoUQSJJpkA0aSkSKlEB",
		["patch"] 			= "10.1.5",
	},
	[270] = { -- Mistweaver
		["importString"] 	= "B4QAAAAAAAAAAAAAAAAAAAAAA0SShkkDIKaJhUCSaIRKCAAAAAAAAAAAAAkWkERiWRSSLJpREAAIA",
		["patch"] 			= "10.1.5",
	},
	[269] = { -- Windwalker
		["importString"] 	= "B0QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgDgkIJJpJRiAAAAASSSKkAkIRKRaJJiko1kk0SkmEAAAA",
		["patch"] 			= "10.1.5",
	},
	-- Paladin
	[65] = { -- Holy
		["importString"] 	= "BEEAAAAAAAAAAAAAAAAAAAAAAAABAABAEBAAIAlk0gSLSSpgUSClkEhmAIJkQSCRagkIAgAAFgQSSI",
		["patch"] 			= "10.1.5",
	},
	[66] = { -- Protection
		["importString"] 	= "BIEAAAAAAAAAAAAAAAAAAAAAA0SaJkiodAtkko0kkIRkIBAAIAAAAAAAACJJEIJkkigIAgIQCAgAE",
		["patch"] 			= "10.1.5",
	},
	[70] = { -- Retribution
		["importString"] 	= "BYEAAAAAAAAAAAAAAAAAAAAAAAAAAQAACKtSSp0kokkkCJAAAAAAQEkkQAJRkSESCpkWiGCJhIKNEAA",
		["patch"] 			= "10.1.5",
	},
	-- Priest
	[256] = { -- Discipline
		["importString"] 	= "BAQAAAAAAAAAAAAAAAAAAAAAAAAkSIBSCSiQKJJJRCAAAAAAAAAAAJ0ShUSIBRIICpViEBUiA",
		["patch"] 			= "10.1.5",
	},
	[257] = { -- Holy
		["importString"] 	= "BEQAAAAAAAAAAAAAAAAAAAAAAQBAAAAAAAoJRBSQSEikEJlkkSAAAAA0SJUSSEQKJSiIBSSSAA",
		["patch"] 			= "10.1.5",
	},
	[258] = { -- Shadow
		["importString"] 	= "BIQAAAAAAAAAAAAAAAAAAAAAAIiICAAAAAAAAAAAAgkoERSSBSSSSkIINSSSkGpQCCpItQSAkE",
		["patch"] 			= "10.1.5",
	},
	-- Rogue
	[259] = { -- Assassination
		["importString"] 	= "BMQAAAAAAAAAAAAAAAAAAAAAAQLJSSSiElEAAAAAAAJCACAAAAAAAtkEOQJJkkkkSgISSSSSCA",
		["patch"] 			= "10.1.5",
	},
	[260] = { -- Outlaw
		["importString"] 	= "BQQAAAAAAAAAAAAAAAAAAAAAAAAAUSQkEgDkkQSLJJIJRSkICgkAAAAAAAEkkItkgkkkSAAAA",
		["patch"] 			= "10.1.5",
	},
	[261] = { -- Subtlety
		["importString"] 	= "BUQAAAAAAAAAAAAAAAAAAAAAAAAABAAAAAAAESSSSIikASkEJJJJhARIJhI4AtIIJRKBAAAA",
		["patch"] 			= "10.1.5",
	},
	-- Shaman
	[262] = { -- Elemental
		["importString"] 	= "BYQAAAAAAAAAAAAAAAAAAAAAAAAAAAAgF0OQp0OwBOQ7AH4AgFwBOQDLQZBtDcgDwBcAAAAAAgWAJlkoFgIkkWIoFJhEA",
		["patch"] 			= "10.1.5",
	},
	[263] = { -- Enhancement
		["importString"] 	= "BcQAAAAAAAAAAAAAAAAAAAAAAIRSKAikkIJJRiEJAAAAAAAAAAAAARIJkgiASLJpECQSIBC",
		["patch"] 			= "10.1.5",
	},
	[264] = { -- Restoration
		["importString"] 	= "BgQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIpJJJJaJkik0kQLIRQIlkokCKINJpECKJRIh0A",
		["patch"] 			= "10.1.5",
	},
	-- Warlock
	[265] = { -- Affliction
		["importString"] 	= "BkQAAAAAAAAAAAAAAAAAAAAAAgISSkIQKKEplkESJAAAAg0AAAAAAAIJtI5AJikkoIJAAJ",
		["patch"] 			= "10.1.5",
	},
	[266] = { -- Demonology
		["importString"] 	= "BoQAAAAAAAAAAAAAAAAAAAAAAggkEJJQKKEpdgkESJAAAAAoEQiEpFBRSSaRSkQAAAAAAQC",
		["patch"] 			= "10.1.5",
	},
	[267] = { -- Destruction
		["importString"] 	= "BsQAAAAAAAAAAAAAAAAAAAAAAggkEJJQKKEpdgkESJQSUSSEtgWpJAAAAAAAAAAAAIhkWSSC",
		["patch"] 			= "10.1.5",
	},
	-- Warrior
	[71] = { -- Arms 
		["importString"] 	= "BcEAAAAAAAAAAAAAAAAAAAAAAAIlSiERCRSaKJJBAAAABRgCBRREQiIJhiEhEQ4AhAAAAAAAAQiSCCIENEA",
		["patch"] 			= "10.1.5",
	},
	[72] = { -- Fury
		["importString"] 	= "BgEAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAChAKBBRQICENQIJQkESSaJJSkggEJRapFgkkEAAAEQQA",
		["patch"] 			= "10.1.5",
	},
	[73] = { -- Protection
		["importString"] 	= "BkEAAAAAAAAAAAAAAAAAAAAAAIEBAAAASSSkkg0SKJJpVQEAkIJlkEACJJ0QSCCQkAAAAAAAARAAKlGAIA",
		["patch"] 			= "10.1.5",
	},
}
addon.PLAYER_TALENTS = PLAYER_TALENTS