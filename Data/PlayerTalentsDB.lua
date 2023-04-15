local addonName, addonTable = ...
local PLAYER_TALENTS = {
	-- Death Knight
	[250] = { -- Blood
		["importString"] 	= "BoPAAAAAAAAAAAAAAAAAAAAAAACJJCJJi0iEBJiECSSSkAAAAAAJSSOQEJNhIBAAESSSAAAAA",
		["patch"] 			= "10.0.7",
	},
	[251] = { -- Frost
		["importString"] 	= "BsPAAAAAAAAAAAAAAAAAAAAAAkkEgAJJkUiEQSSSIkISSEkggkERSSSSKJAAAAAAAAAAAAA",
		["patch"] 			= "10.0.7",
	},
	[252] = { -- Unholy
		["importString"] 	= "BwPAAAAAAAAAAAAAAAAAAAAAAAAEkkQSJSIkkEhQSiEBAAAAAAAAAAJJQSaAgIJSJkkkIJB",
		["patch"] 			= "10.0.7",
	},
	-- Demon Hunter
	[577] = { -- Havoc
		["importString"] 	= "BEkAAAAAAAAAAAAAAAAAAAAAAIBkQKRSaJJSSEIAAAAAAAaJJQLFSSKISLSRSSSSCB",
		["patch"] 			= "10.0.7",
	},
	[581] = { -- Vengeance
		["importString"] 	= "BUkAAAAAAAAAAAAAAAAAAAAAAAAoFhWSikIgIRgkSCIaJSESCJplERiDkQJSCAAAAA",
		["patch"] 			= "10.0.7",
	},
	-- Druid
	[102] = { -- Balance
		["importString"] 	= "BYGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFASSERSSASSkEpAtEJJJSJRRcgkQKJlIEUAIAA",
		["patch"] 			= "10.0.7",
	},
	[103] = { -- Feral
		["importString"] 	= "BcGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAkk0STCRSkUUCKJJJSCAAAAAAFAkEAISSSCJ5ApE0ScAAAAAAAIB0AA",
		["patch"] 			= "10.0.7",
	},
	[104] = { -- Guardian
		["importString"] 	= "BgGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgEJJJpkokkkEBCSKUAIRQgEkkkkkEpAtEAAAAAAEBEAA",
		["patch"] 			= "10.0.7",
	},
	[105] = { -- Restoration
		["importString"] 	= "BkGAAAAAAAAAAAAAAAAAAAAAAgkEtSSiki0SCENhWKJBAAAAAAAAAAAAUSAJRQAkACWQokk0SSAAAAAAiAAAA",
		["patch"] 			= "10.0.7",
	},
	-- Evoker
	[1467] = { -- Devastation
		["importString"] 	= "BsbBAAAAAAAAAAAAAAAAAAAAAQhAAAAAAAKapIJCJRCJRSLJJNIIiEJJESSSSCJJB",
		["patch"] 			= "10.0.7",
	},
	[1468] = { -- Preservation
		["importString"] 	= "BwbBAAAAAAAAAAAAAAAAAAAAAABtIESiUkkEiolkkESAAAAAAkIkIRSgkkECRSSA",
		["patch"] 			= "10.0.7",
	},
	-- Hunter
	[253] = { -- Beast Mastery
		["importString"] 	= "B0PAAAAAAAAAAAAAAAAAAAAAA4AgWCAQAAAAAAAAAAAoBIhWikIJkkDEpJkSikQkERasgEB",
		["patch"] 			= "10.0.7",
	},
	[254] = { -- Marksmanship
		["importString"] 	= "B4PAAAAAAAAAAAAAAAAAAAAAAUOQEaBgACCAAAAAJRkkkkgIRSLkGJhSRaaCJyBIJSoBAAAAA",
		["patch"] 			= "10.0.7",
	},
	[255] = { -- Survival
		["importString"] 	= "B8PAAAAAAAAAAAAAAAAAAAAAA4ABahkEIBBJHIRaJECRSKRIAAAAAQQUkiGkIhkIhGAAAAA",
		["patch"] 			= "10.0.7",
	},
	-- Mage
	[62] = { -- Arcane
		["importString"] 	= "B4DAAAAAAAAAAAAAAAAAAAAAAAkkkSikIJlAJNhIiIhkEcAJRIJAAAAAAAAAAAAkkkESSSSC",
		["patch"] 			= "10.0.7",
	},
	[63] = { -- Fire
		["importString"] 	= "B8DAAAAAAAAAAAAAAAAAAAAAAIJRgSSyBQSRESTiIiIJAAAAAAAAAkQSiEkGJJSkkkIFAAAA",
		["patch"] 			= "10.0.7",
	},
	[64] = { -- Frost
		["importString"] 	= "BAEAAAAAAAAAAAAAAAAAAAAAAIJSgWicgIJFISTIiISSAAAkkkEhEJJJSKJJJCAAAAAAAAAgA",
		["patch"] 			= "10.0.7",
	},
	-- Monk
	[268] = { -- Brewmaster
		["importString"] 	= "BwQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAAloUSSiQSSrRAAAASL0SiEJJJkkkkUkAaRi0SrEC",
		["patch"] 			= "10.0.7",
	},
	[270] = { -- Mistweaver
		["importString"] 	= "B4QAAAAAAAAAAAAAAAAAAAAAAIRUkkkQRLJSkDQSDiUEAAAAAAAAAAAAAIlgIRCkkkkUSCSAAEA",
		["patch"] 			= "10.0.7",
	},
	[269] = { -- Windwalker
		["importString"] 	= "B0QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHAJRSSSTiEBAAAAkkkUIBIRi0i0SSEJRikkkINJAAAA",
		["patch"] 			= "10.0.7",
	},
	-- Paladin
	[65] = { -- Holy
		["importString"] 	= "BEEAAAAAAAAAAAAAAAAAAAAAAAABAABAEBAAIAtkAUiko0EpIRSJBHolIaCSSRQSCRaBICAIQAFgA",
		["patch"] 			= "10.0.7",
	},
	[66] = { -- Protection
		["importString"] 	= "BIEAAAAAAAAAAAAAAAAAAAAAA0SaJSKSKIJJKNJJESiEAAAAAAAAAAAkEJJEIJkkiERCAgAAIgA",
		["patch"] 			= "10.0.7",
	},
	[70] = { -- Retribution
		["importString"] 	= "BYEAAAAAAAAAAAAAAAAAAAAAAAAAAQAgIUKtSSp0kokkkCJAAAAAAABkkQCEEpFhkQKploRCJIiSjGA",
		["patch"] 			= "10.0.7",
	},
	-- Priest
	[256] = { -- Discipline
		["importString"] 	= "BAQAAAAAAAAAAAAAAAAAAAAAAAAkUIJQSQSSUSJJJJAAAAAAAAAAAASEKkiEJISRIRItSkIgWE",
		["patch"] 			= "10.0.7",
	},
	[257] = { -- Holy
		["importString"] 	= "BEQAAAAAAAAAAAAAAAAAAAAAAQTAAAAAAAAlEKpIkkIQkkIKJJAAAAAAQKSSCiUSIRQpFJJBaB",
		["patch"] 			= "10.0.7",
	},
	[258] = { -- Shadow
		["importString"] 	= "BIQAAAAAAAAAAAAAAAAAAAAAAISSLSAAAAAAAAAAAAAISiSkmUISSSJhEBaRSSiUIFSQQpFhkAA",
		["patch"] 			= "10.0.7",
	},
	-- Rogue
	[259] = { -- Assassination
		["importString"] 	= "BMQAAAAAAAAAAAAAAAAAAAAAAQLJSikIRLBAAAAAAQiAIJAAAAAAASJJCtkgkkEhkkAJRSiFE",
		["patch"] 			= "10.0.7",
	},
	[260] = { -- Outlaw
		["importString"] 	= "BQQAAAAAAAAAAAAAAAAAAAAAAAAAgEREAJJkIJJIJRSSiIkkkIAAAAAAARJSIlkASSKBAAAA",
		["patch"] 			= "10.0.7",
	},
	[261] = { -- Subtlety
		["importString"] 	= "BUQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAhAJJiIBIRSCSSSISSESSSLJhDUSCSSkSAAAA",
		["patch"] 			= "10.0.7",
	},
	-- Shaman
	[262] = { -- Elemental
		["importString"] 	= "BYQAAAAAAAAAAAAAAAAAAAAAAAAAAAAgUSpUSSJJ0i0SSDBNIBAAAAAgWIkIJKhkCISapkDARSQA",
		["patch"] 			= "10.0.7",
	},
	[263] = { -- Enhancement
		["importString"] 	= "BcQAAAAAAAAAAAAAAAAAAAAAAIRSaASSSikkQiEJAAAAAAAAAAAAAICRIRLFBIlEJFEQkESA",
		["patch"] 			= "10.0.7",
	},
	[264] = { -- Restoration
		["importString"] 	= "BgQAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAAAgkmkkkkWCKSSLBNIpEESJJEhCSTCIiSSSIBC",
		["patch"] 			= "10.0.7",
	},
	-- Warlock
	[265] = { -- Affliction
		["importString"] 	= "BkQAAAAAAAAAAAAAAAAAAAAAAAikkkkAppRkWSSIFAAAAAAAAAAAAkk0IJRSSSiiEBAkA",
		["patch"] 			= "10.0.7",
	},
	[266] = { -- Demonology
		["importString"] 	= "BoQAAAAAAAAAAAAAAAAAAAAAAggkEJJQKKEpdgkESJAAAAAoEBJEaRSEJJpFJJBBAAAAAAJ",
		["patch"] 			= "10.0.7",
	},
	[267] = { -- Destruction
		["importString"] 	= "BsQAAAAAAAAAAAAAAAAAAAAAAggkEJJQKKEpdgkESJQSUSSEtgWpJAAAAAAAAAAAAIhkWSSC",
		["patch"] 			= "10.0.7",
	},
	-- Warrior
	[71] = { -- Arms 
		["importString"] 	= "BcEAAAAAAAAAAAAAAAAAAAAAAAIFJSSkQkkWpEJBAAAABRgCBRREQiQSoIRIBESIAAAAAAAAkokgACRDB",
		["patch"] 			= "10.0.7",
	},
	[72] = { -- Fury
		["importString"] 	= "BgEAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAQggSAEBhIIRDSIJQkESSaJJSkggEJRapFgkkEAAAEQQA",
		["patch"] 			= "10.0.7",
	},
	[73] = { -- Protection
		["importString"] 	= "BkEAAAAAAAAAAAAAAAAAAAAAAIQAAAAgkkEJJk0SKJJpUQEINFJElkEgIkkQDJJAQIAAAAAAAQEAgSpBAC",
		["patch"] 			= "10.0.7",
	},
}
addonTable.PLAYER_TALENTS = PLAYER_TALENTS