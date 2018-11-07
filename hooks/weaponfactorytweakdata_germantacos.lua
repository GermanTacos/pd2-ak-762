Hooks:PostHook(WeaponFactoryTweakData, "create_bonuses", "CAFCWMod_GermanTacos_Init", function(self)
---SECONDARY

--CZ-75B
if self.wpn_fps_pis_cz75b and self.wpn_fps_pis_x_cz75b then

	self.wpn_fps_pis_cz75b.adds = self.wpn_fps_pis_cz75b.adds or {}
	self.wpn_fps_pis_x_cz75b.adds = self.wpn_fps_pis_cz75b.adds or {}

	self:cafcw_add_to_parts("barrel_ext"          , "wpn_fps_pis_cz75b", "wpn_fps_ass_ns_g_sup1"                      )
	self:cafcw_add_to_parts("barrel_ext"          , "wpn_fps_pis_cz75b", "wpn_fps_ass_ns_g_sup2"                      )
	self:cafcw_add_to_parts("barrel_ext"          , "wpn_fps_pis_cz75b", "wpn_fps_ass_ns_g_sup6"                      )
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_cz75b", "wpn_fps_ass_ns_g_sup1" , "a_ns", "barrel")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_cz75b", "wpn_fps_ass_ns_g_sup2" , "a_ns", "barrel")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_cz75b", "wpn_fps_ass_ns_g_sup6" , "a_ns", "barrel")
	
	self:cafcw_add_to_parts("barrel_ext"          , "wpn_fps_pis_x_cz75b", "wpn_fps_ass_ns_g_sup1"                      )
	self:cafcw_add_to_parts("barrel_ext"          , "wpn_fps_pis_x_cz75b", "wpn_fps_ass_ns_g_sup2"                      )
	self:cafcw_add_to_parts("barrel_ext"          , "wpn_fps_pis_x_cz75b", "wpn_fps_ass_ns_g_sup6"                      )
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_x_cz75b", "wpn_fps_ass_ns_g_sup1" , "a_ns", "barrel")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_x_cz75b", "wpn_fps_ass_ns_g_sup2" , "a_ns", "barrel")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_x_cz75b", "wpn_fps_ass_ns_g_sup6" , "a_ns", "barrel")
	
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_pis_cz75b_ba_std", "wpn_fps_ass_ns_g_sup1" , "a_cz75bns")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_pis_cz75b_ba_std", "wpn_fps_ass_ns_g_sup2" , "a_cz75bns")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_pis_cz75b_ba_std", "wpn_fps_ass_ns_g_sup6" , "a_cz75bns")
	
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_pis_cz75b_b_ext", "wpn_fps_ass_ns_g_sup1" , "a_cz75bns_ext")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_pis_cz75b_b_ext", "wpn_fps_ass_ns_g_sup2" , "a_cz75bns_ext")
	self:cafcw_add_to_parts("part_a_obj_ovr", "wpn_fps_pis_cz75b_b_ext", "wpn_fps_ass_ns_g_sup6" , "a_cz75bns_ext")
	
	if self.parts.wpn_fps_upg_fl_unimax then
		table.insert(self.wpn_fps_pis_cz75b.uses_parts  , "wpn_fps_upg_fl_unimax" )
		table.insert(self.wpn_fps_pis_cz75b.uses_parts  , "wpn_fps_upg_fl_utg_pis")
		table.insert(self.wpn_fps_pis_x_cz75b.uses_parts, "wpn_fps_upg_fl_unimax" )
		table.insert(self.wpn_fps_pis_x_cz75b.uses_parts, "wpn_fps_upg_fl_utg_pis")
		self.wpn_fps_pis_cz75b.adds.wpn_fps_upg_fl_unimax    = {"wpn_fps_pis_beretta_body_rail"} 
		self.wpn_fps_pis_x_cz75b.adds.wpn_fps_upg_fl_unimax  = {"wpn_fps_pis_beretta_body_rail"} 
		self.wpn_fps_pis_cz75b.adds.wpn_fps_upg_fl_utg_pis   = {"wpn_fps_pis_beretta_body_rail"} 
		self.wpn_fps_pis_x_cz75b.adds.wpn_fps_upg_fl_utg_pis = {"wpn_fps_pis_beretta_body_rail"} 
		self.wpn_fps_pis_cz75b.override.wpn_fps_upg_fl_unimax    = {a_obj = "cz75bfl"}
		self.wpn_fps_pis_cz75b.override.wpn_fps_upg_fl_utg_pis   = {a_obj = "cz75bfl"}
		self.wpn_fps_pis_x_cz75b.override.wpn_fps_upg_fl_unimax  = {a_obj = "cz75bfl"}
		self.wpn_fps_pis_x_cz75b.override.wpn_fps_upg_fl_utg_pis = {a_obj = "cz75bfl"}
	end
	
	self:cafcw_add_modpack("ammo", "wpn_fps_pis_cz75b", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_modpack("ammo", "wpn_fps_pis_x_cz75b", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")

end

--Glock P80
if self.wpn_fps_pis_p80 then
	if self.parts.wpn_fps_ass_ns_g_sup1 and self.parts.wpn_fps_ass_ns_g_sup2 and self.parts.wpn_fps_ass_ns_g_sup6 then
		table.insert(self.wpn_fps_pis_p80.uses_parts, "wpn_fps_ass_ns_g_sup1")
			if self.wpn_fps_pis_p80.override then 
				self.wpn_fps_pis_p80.override.wpn_fps_ass_ns_g_sup1 = {parent = "barrel",a_obj = "a_p80nsm"}
				self.parts.wpn_fps_pis_p80_s_long.override.wpn_fps_ass_ns_g_sup1 = {a_obj = "a_p80nslm"}
		--	else
		--		self.wpn_fps_pis_p80.override = {wpn_fps_ass_ns_g_sup1 = {parent = "barrel",a_obj = "a_p80nsm"}}
		--		self.parts.wpn_fps_pis_p80_s_long.override = {wpn_fps_ass_ns_g_sup1 = {a_obj = "a_p80nslm"}}
			end
		table.insert(self.wpn_fps_pis_p80.uses_parts, "wpn_fps_ass_ns_g_sup2")
			if self.wpn_fps_pis_p80.override then 
				self.wpn_fps_pis_p80.override.wpn_fps_ass_ns_g_sup2 = {parent = "barrel",a_obj = "a_p80nsm"}
				self.parts.wpn_fps_pis_p80_s_long.override.wpn_fps_ass_ns_g_sup2 = {a_obj = "a_p80nslm"}
		--	else
		--		self.wpn_fps_pis_p80.override = {wpn_fps_ass_ns_g_sup2 = {parent = "barrel",a_obj = "a_p80nsm"}}
		--		self.parts.wpn_fps_pis_p80_s_long.override = {wpn_fps_ass_ns_g_sup2 = {a_obj = "a_p80nslm"}}
			end
		table.insert(self.wpn_fps_pis_p80.uses_parts, "wpn_fps_ass_ns_g_sup6")
			if self.wpn_fps_pis_p80.override then 
				self.wpn_fps_pis_p80.override.wpn_fps_ass_ns_g_sup6 = {parent = "barrel",a_obj = "a_p80nsm"}
				self.parts.wpn_fps_pis_p80_s_long.override.wpn_fps_ass_ns_g_sup6 = {a_obj = "a_p80nslm"}
		--	else
		--		self.wpn_fps_pis_p80.override = {wpn_fps_ass_ns_g_sup6 = {parent = "barrel",a_obj = "a_p80nsm"}}
		--		self.parts.wpn_fps_pis_p80_s_long.override = {wpn_fps_ass_ns_g_sup6 = {a_obj = "a_p80nslm"}}
			end
	end
	self:cafcw_add_modpack("ammo", "wpn_fps_pis_p80", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_modpack("forbids_add", "wpn_fps_pis_p80_a1_40sw", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_modpack("forbids_add", "wpn_fps_pis_p80_a2_10mm", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_modpack("forbids_add", "wpn_fps_pis_p80_a3_357sig", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_modpack("forbids_add", "wpn_fps_pis_p80_a4_45acp", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
	self:cafcw_add_modpack("forbids_add", "wpn_fps_pis_p80_a5_45gap", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")
end

--PM-63 RAK

if self.wpn_fps_smg_pm63 then

	self:cafcw_add_to_parts("gadget"       , "wpn_fps_smg_pm63", "wpn_fps_upg_fl_anpeq2"                     )
	self:cafcw_add_to_parts("gadget"       , "wpn_fps_smg_pm63", "wpn_fps_upg_fl_dbal_d2"                    )
	self:cafcw_add_to_parts("gadget"       , "wpn_fps_smg_pm63", "wpn_fps_upg_fl_m600p"                    )
	self:cafcw_add_to_parts("gadget"       , "wpn_fps_smg_pm63", "wpn_fps_upg_fl_utg"                        )
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_smg_pm63", "wpn_fps_upg_fl_anpeq2"         , "a_pm63fl")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_smg_pm63", "wpn_fps_upg_fl_dbal_d2"        , "a_pm63fl")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_smg_pm63", "wpn_fps_upg_fl_m600p"        , "a_pm63fl")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_smg_pm63", "wpn_fps_upg_fl_utg"            , "a_pm63fl")
	
	
	self:cafcw_add_to_parts("barrel_ext"   , "wpn_fps_smg_pm63", "wpn_fps_ass_ns_g_sup3"                     )
	self:cafcw_add_to_parts("barrel_ext"   , "wpn_fps_smg_pm63", "wpn_fps_ass_ns_g_sup4"                     )
	self:cafcw_add_to_parts("barrel_ext"   , "wpn_fps_smg_pm63", "wpn_fps_ass_ns_g_sup5"                     )
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_smg_pm63", "wpn_fps_ass_ns_g_sup3"         , "a_pm63ns")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_smg_pm63", "wpn_fps_ass_ns_g_sup4"         , "a_pm63ns")
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_smg_pm63", "wpn_fps_ass_ns_g_sup5"         , "a_pm63ns")
	
	self:cafcw_add_to_parts("barrel_ext"   , "wpn_fps_smg_pm63", "wpn_fps_upg_ns_ass_smg_tromix"             )
	self:cafcw_add_to_parts("wpn_a_obj_ovr", "wpn_fps_smg_pm63", "wpn_fps_upg_ns_ass_smg_tromix" , "a_pm63ns")

	self:cafcw_add_to_parts("part_unit_ovr", "wpn_fps_smg_pm63_ba_std", "wpn_fps_ass_ns_g_sup3", "units/mods/weapons/wpn_fps_smg_pm63_pts/wpn_fps_smg_pm63_ba_long")
	self:cafcw_add_to_parts("part_unit_ovr", "wpn_fps_smg_pm63_ba_std", "wpn_fps_ass_ns_g_sup4", "units/mods/weapons/wpn_fps_smg_pm63_pts/wpn_fps_smg_pm63_ba_long")
	self:cafcw_add_to_parts("part_unit_ovr", "wpn_fps_smg_pm63_ba_std", "wpn_fps_ass_ns_g_sup5", "units/mods/weapons/wpn_fps_smg_pm63_pts/wpn_fps_smg_pm63_ba_long")
	self:cafcw_add_to_parts("part_unit_ovr", "wpn_fps_smg_pm63_ba_std", "wpn_fps_upg_ns_ass_smg_tromix", "units/mods/weapons/wpn_fps_smg_pm63_pts/wpn_fps_smg_pm63_ba_long")
end

--CZ 75 Short Rail

if self.wpn_fps_pis_rally then

	self:cafcw_add_to_parts("barrel_ext"          , "wpn_fps_pis_rally", "wpn_fps_ass_ns_g_sup1"                         )
	self:cafcw_add_to_parts("barrel_ext"          , "wpn_fps_pis_rally", "wpn_fps_ass_ns_g_sup2"                         )
	self:cafcw_add_to_parts("barrel_ext"          , "wpn_fps_pis_rally", "wpn_fps_ass_ns_g_sup6"                         )
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_rally", "wpn_fps_ass_ns_g_sup1" , "a_cz75srns", "barrel")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_rally", "wpn_fps_ass_ns_g_sup2" , "a_cz75srns", "barrel")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_rally", "wpn_fps_ass_ns_g_sup6" , "a_cz75srns", "barrel")
	self:cafcw_add_modpack("ammo", "wpn_fps_pis_rally", "_9x19mm", "IncendiaryAmmo_MoreAmmoTypes")

end

--CZ-2

if self.wpn_fps_pis_cz2 and self.wpn_fps_pis_x_cz2 then

	self:cafcw_add_to_parts("barrel_ext"          , "wpn_fps_pis_cz2", "wpn_fps_ass_ns_g_sup1"                      )
	self:cafcw_add_to_parts("barrel_ext"          , "wpn_fps_pis_cz2", "wpn_fps_ass_ns_g_sup2"                      )
	self:cafcw_add_to_parts("barrel_ext"          , "wpn_fps_pis_cz2", "wpn_fps_ass_ns_g_sup6"                      )
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_cz2", "wpn_fps_ass_ns_g_sup1" , "a_cz2ns", "barrel")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_cz2", "wpn_fps_ass_ns_g_sup2" , "a_cz2ns", "barrel")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_cz2", "wpn_fps_ass_ns_g_sup6" , "a_cz2ns", "barrel")
	
	if self.parts.wpn_fps_upg_fl_unimax then
		table.insert(self.wpn_fps_pis_cz2.uses_parts  , "wpn_fps_upg_fl_unimax" )
		table.insert(self.wpn_fps_pis_cz2.uses_parts  , "wpn_fps_upg_fl_utg_pis")
		table.insert(self.wpn_fps_pis_x_cz2.uses_parts, "wpn_fps_upg_fl_unimax" )
		table.insert(self.wpn_fps_pis_x_cz2.uses_parts, "wpn_fps_upg_fl_utg_pis")
		self.wpn_fps_pis_cz2.adds.wpn_fps_upg_fl_unimax    = {"wpn_fps_pis_g26_fl_adapter"} 
		self.wpn_fps_pis_x_cz2.adds.wpn_fps_upg_fl_unimax  = {"wpn_fps_pis_g26_fl_adapter"} 
		self.wpn_fps_pis_cz2.adds.wpn_fps_upg_fl_utg_pis   = {"wpn_fps_pis_g26_fl_adapter"} 
		self.wpn_fps_pis_x_cz2.adds.wpn_fps_upg_fl_utg_pis = {"wpn_fps_pis_g26_fl_adapter"} 
		self.wpn_fps_pis_cz2.override.wpn_fps_upg_fl_unimax    = {a_obj = "cz2fl"}
		self.wpn_fps_pis_cz2.override.wpn_fps_upg_fl_utg_pis   = {a_obj = "cz2fl"}
		self.wpn_fps_pis_x_cz2.override.wpn_fps_upg_fl_unimax  = {a_obj = "cz2fl"}
		self.wpn_fps_pis_x_cz2.override.wpn_fps_upg_fl_utg_pis = {a_obj = "cz2fl"}
	end

end

--Seburo M5

if self.wpn_fps_pis_seburo and self.wpn_fps_pis_x_seburo then

	self:cafcw_add_to_parts("barrel_ext"          , "wpn_fps_pis_seburo", "wpn_fps_ass_ns_g_sup1"                         )
	self:cafcw_add_to_parts("barrel_ext"          , "wpn_fps_pis_seburo", "wpn_fps_ass_ns_g_sup2"                         )
	self:cafcw_add_to_parts("barrel_ext"          , "wpn_fps_pis_seburo", "wpn_fps_ass_ns_g_sup6"                         )
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_seburo", "wpn_fps_ass_ns_g_sup1" , "a_seburo5ns", "barrel")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_seburo", "wpn_fps_ass_ns_g_sup2" , "a_seburo5ns", "barrel")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_seburo", "wpn_fps_ass_ns_g_sup6" , "a_seburo5ns", "barrel")

	self:cafcw_add_to_parts("barrel_ext"          , "wpn_fps_pis_x_seburo", "wpn_fps_ass_ns_g_sup1"                         )
	self:cafcw_add_to_parts("barrel_ext"          , "wpn_fps_pis_x_seburo", "wpn_fps_ass_ns_g_sup2"                         )
	self:cafcw_add_to_parts("barrel_ext"          , "wpn_fps_pis_x_seburo", "wpn_fps_ass_ns_g_sup6"                         )
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_x_seburo", "wpn_fps_ass_ns_g_sup1" , "a_seburo5ns", "barrel")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_x_seburo", "wpn_fps_ass_ns_g_sup2" , "a_seburo5ns", "barrel")
	self:cafcw_add_to_parts("wpn_a_obj_parent_ovr", "wpn_fps_pis_x_seburo", "wpn_fps_ass_ns_g_sup6" , "a_seburo5ns", "barrel")

	if self.parts.wpn_fps_upg_o_barska then
		table.insert(self.wpn_fps_pis_seburo.uses_parts, "wpn_fps_upg_o_barska")
		self.wpn_fps_pis_seburo.override.wpn_fps_upg_o_barska = {parent = "slide", a_obj = "a_seburo5rds", override = {
		wpn_fps_pis_seburo_ro_std = {unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"},
		wpn_fps_pis_seburo_fo_std = {unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"}},
		stance_mod = {wpn_fps_pis_seburo = {translation = Vector3(0, 0, -1)}}}
	end
	
	if self.parts.wpn_fps_upg_o_deltapoint then
		table.insert(self.wpn_fps_pis_seburo.uses_parts, "wpn_fps_upg_o_deltapoint")
		self.wpn_fps_pis_seburo.override.wpn_fps_upg_o_deltapoint = {parent = "slide", a_obj = "a_seburo5rds", override = {
		wpn_fps_pis_seburo_ro_std = {unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"},
		wpn_fps_pis_seburo_fo_std = {unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"}},
		stance_mod = {wpn_fps_pis_seburo = {translation = Vector3(0, 0, -1)}}}
	end
	
	self:cafcw_add_modpack("ammo", "wpn_fps_pis_seburo", "_545x18mm_nonap", "MoreAmmoTypes")
	self:cafcw_add_modpack("ammo", "wpn_fps_pis_x_seburo", "_545x18mm_nonap", "MoreAmmoTypes")
end

---AK PACK
 
local akmodules = {
    "wpn_fps_ass_heffy_762",
    "wpn_fps_ass_heffy_545",
    "wpn_fps_ass_heffy_556"
}

local akpack_scopemounts = {
	"wpn_fps_upg_o_ak47_scopemount",
	"wpn_fps_upg_o_ak74_scopemount",
	"wpn_fps_upg_o_ak101_scopemount"
}
local akpack_ammo = {
	"_762x39mm",
	"_545x39mm",
	"_556x45mm"
}

 
local all_cafcw_sight = {
    "wpn_fps_upg_o_kobra",
    "wpn_fps_upg_o_compm4s",
    "wpn_fps_upg_o_m145",
    "wpn_fps_upg_o_pkas",
    "wpn_fps_upg_o_coyote",
    "wpn_fps_upg_o_acog_rmr",
    "wpn_fps_upg_o_hologram",
    "wpn_fps_upg_o_gitsch",
    "wpn_fps_upg_o_zeiss",
    "wpn_fps_upg_o_hd33",
    "wpn_fps_upg_o_prismatic",
    "wpn_fps_upg_o_srs",
    "wpn_fps_upg_o_st10",
    "wpn_fps_upg_o_hcog",
    "wpn_fps_upg_o_reflexholo",
    "wpn_fps_upg_o_aog",
    "wpn_fps_upg_o_rmr_riser",
    "wpn_fps_upg_o_elo",
    "wpn_fps_upg_o_po4",
    "wpn_fps_upg_o_susat",
    "wpn_fps_upg_o_kemper",
    "wpn_fps_upg_o_mepro",
    "wpn_fps_upg_o_rusak",
    "wpn_fps_upg_o_delta_rm55",
    "wpn_fps_upg_o_horzine",
    "wpn_fps_upg_o_eotech552",
    "wpn_fps_upg_o_visionking",
    "wpn_fps_upg_o_pka",
    "wpn_fps_upg_o_anpas13d"
}
local all_cafcw_gadget = {
	"wpn_fps_upg_fl_wml",
	"wpn_fps_upg_fl_ass_spotter",
	"wpn_fps_upg_fl_anpeq2",
	"wpn_fps_upg_fl_dbal_d2",
	"wpn_fps_upg_fl_m600p",
	"wpn_fps_upg_fl_utg"
}
local akpack_counter = 1
for i, wpn_id in ipairs(akmodules) do
    if self[wpn_id] then
        self:cafcw_add_to_parts("gadget", wpn_id, "wpn_fps_upg_fl_wml"        )
        self:cafcw_add_to_parts("gadget", wpn_id, "wpn_fps_upg_fl_ass_spotter")
        self:cafcw_add_to_parts("gadget", wpn_id, "wpn_fps_upg_fl_anpeq2"     )
        self:cafcw_add_to_parts("gadget", wpn_id, "wpn_fps_upg_fl_dbal_d2"    )
        self:cafcw_add_to_parts("gadget", wpn_id, "wpn_fps_upg_fl_m600p"      )
        self:cafcw_add_to_parts("gadget", wpn_id, "wpn_fps_upg_fl_utg"        )
		
        self:cafcw_add_to_parts("sight_vector_rail" , wpn_id, "wpn_fps_upg_o_kobra"     , "0,7,-3.7"              , akpack_scopemounts[akpack_counter])
        self:cafcw_add_to_parts("sight_vector_rail" , wpn_id, "wpn_fps_upg_o_compm4s"   , "0,7,-3.7"              , akpack_scopemounts[akpack_counter])
        self:cafcw_add_to_parts("sight_vector_rail" , wpn_id, "wpn_fps_upg_o_m145"      , "0,7,-3.7"              , akpack_scopemounts[akpack_counter])
        self:cafcw_add_to_parts("sight_vector_rail" , wpn_id, "wpn_fps_upg_o_pkas"      , "0,7,-3.7"              , akpack_scopemounts[akpack_counter])
        self:cafcw_add_to_parts("sight_vector_rail" , wpn_id, "wpn_fps_upg_o_coyote"    , "0,7,-3.7"              , akpack_scopemounts[akpack_counter])
        self:cafcw_add_to_parts("sight_vector_rail" , wpn_id, "wpn_fps_upg_o_acog_rmr"  , "0,5,-3.7"              , akpack_scopemounts[akpack_counter])
        self:cafcw_add_to_parts("sight_vector_rail" , wpn_id, "wpn_fps_upg_o_hologram"  , "0,7,-3.7"              , akpack_scopemounts[akpack_counter])
        self:cafcw_add_to_parts("sight_vector_rail" , wpn_id, "wpn_fps_upg_o_gitsch"    , "0,5,-3.7"              , akpack_scopemounts[akpack_counter])
        self:cafcw_add_to_parts("sight_vector_rail" , wpn_id, "wpn_fps_upg_o_zeiss"     , "0,7,-3.7"              , akpack_scopemounts[akpack_counter])
        self:cafcw_add_to_parts("sight_vector_rail" , wpn_id, "wpn_fps_upg_o_hd33"      , "0,7,-3.7"              , akpack_scopemounts[akpack_counter])
        self:cafcw_add_to_parts("sight_vector_rail" , wpn_id, "wpn_fps_upg_o_prismatic" , "0,7,-3.7"              , akpack_scopemounts[akpack_counter])
        self:cafcw_add_to_parts("sight_vector_rail" , wpn_id, "wpn_fps_upg_o_srs"       , "0,7,-3.7"              , akpack_scopemounts[akpack_counter])
        self:cafcw_add_to_parts("sight_vector_rail" , wpn_id, "wpn_fps_upg_o_st10"      , "0,-4,-3.7"     		, akpack_scopemounts[akpack_counter])
        self:cafcw_add_to_parts("sight_vector_rail" , wpn_id, "wpn_fps_upg_o_hcog"      , "0,7,-3.7"              , akpack_scopemounts[akpack_counter])
        self:cafcw_add_to_parts("sight_vector_rail" , wpn_id, "wpn_fps_upg_o_reflexholo", "0,7,-3.7"              , akpack_scopemounts[akpack_counter])
        self:cafcw_add_to_parts("sight_vector_rail" , wpn_id, "wpn_fps_upg_o_aog"       , "0,5,-3.7"       		, akpack_scopemounts[akpack_counter])
        self:cafcw_add_to_parts("sight_vector_rail" , wpn_id, "wpn_fps_upg_o_rmr_riser" , "0,7,-3.7"              , akpack_scopemounts[akpack_counter])
        self:cafcw_add_to_parts("sight_vector_rail" , wpn_id, "wpn_fps_upg_o_elo"       , "0,7,-3.7"              , akpack_scopemounts[akpack_counter])
        self:cafcw_add_to_parts("sight_vector_rail" , wpn_id, "wpn_fps_upg_o_po4"       , "0.2,7,-2.55"       	, akpack_scopemounts[akpack_counter])
        self:cafcw_add_to_parts("sight_vector_rail" , wpn_id, "wpn_fps_upg_o_susat"     , "0,7,-5.4"     			, akpack_scopemounts[akpack_counter])
        self:cafcw_add_to_parts("sight_vector_rail" , wpn_id, "wpn_fps_upg_o_kemper"    , "0,7,-3.7"              , akpack_scopemounts[akpack_counter])
        self:cafcw_add_to_parts("sight_vector_rail" , wpn_id, "wpn_fps_upg_o_mepro"     , "0,7,-3.7"              , akpack_scopemounts[akpack_counter])
        self:cafcw_add_to_parts("sight_vector_rail" , wpn_id, "wpn_fps_upg_o_rusak"     , "0,7,-3.7"              , akpack_scopemounts[akpack_counter])
        self:cafcw_add_to_parts("sight_vector_rail" , wpn_id, "wpn_fps_upg_o_horzine"   , "0,7,-3.7"              , akpack_scopemounts[akpack_counter])
        self:cafcw_add_to_parts("sight_vector_rail" , wpn_id, "wpn_fps_upg_o_eotech552" , "0,7,-3.365" 			, akpack_scopemounts[akpack_counter])
        self:cafcw_add_to_parts("sight_vector_rail" , wpn_id, "wpn_fps_upg_o_visionking", "0,4,-3.7"				, akpack_scopemounts[akpack_counter])
        self:cafcw_add_to_parts("sight_vector_rail" , wpn_id, "wpn_fps_upg_o_pka"       , "0,7,-3.7"              , akpack_scopemounts[akpack_counter])
        self:cafcw_add_to_parts("sight_vector_rail" , wpn_id, "wpn_fps_upg_o_anpas13d"  , "0,7,-3.7"              , akpack_scopemounts[akpack_counter])
		
		self:cafcw_add_to_parts("sight_rail" , wpn_id, "wpn_fps_upg_o_delta_rm55", "wpn_fps_upg_o_45rds"     , "wpn_fps_ass_flint", akpack_scopemounts[akpack_counter])
		
		self:cafcw_add_to_parts("sight_vector", wpn_id, "wpn_fps_upg_o_1p29", "0,6,-2.3")
		self:cafcw_add_to_parts("sight_vector", wpn_id, "wpn_fps_upg_o_ekp_1s_03", "0,2.5,-2.3")
		self:cafcw_add_to_parts("sight_vector", wpn_id, "wpn_fps_upg_o_pso1_rifle", "0,6,-2.3")
		self:cafcw_add_to_parts("sight_vector", wpn_id, "wpn_fps_upg_o_1pn93", "0,6,-2.3")
       
        self:cafcw_add_to_parts("other" , wpn_id, "wpn_fps_shield_lr"        )
        self:cafcw_add_to_parts("other" , wpn_id, "wpn_fps_shield_skin_ftp"  )
        self:cafcw_add_to_parts("other" , wpn_id, "wpn_fps_shield_skin_urban")
		
		self:cafcw_add_modpack("ammo", wpn_id, akpack_ammo[akpack_counter], "IncendiaryAmmo_MoreAmmoTypes")
		
		
    end
	akpack_counter = akpack_counter + 1 
end
for i, o_id in ipairs(all_cafcw_sight) do
	if self.parts[o_id] then
		if self.parts.wpn_fps_ass_heffy_all_sm_cover then
			self.parts.wpn_fps_ass_heffy_all_sm_cover.override[o_id] = {a_obj = "a_o_cover"}
		end
		if self.parts.wpn_fps_ass_heffy_762_lr_akmsu then
			self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[o_id] = {a_obj = "a_o_akmsu_acog", stance_mod = {wpn_fps_ass_heffy_762 = {translation = Vector3(0, 5, -2.8)}}}
			self.parts.wpn_fps_ass_heffy_762_lr_m92.override[o_id]   = {a_obj = "a_o_akmsu_acog", stance_mod = {wpn_fps_ass_heffy_762 = {translation = Vector3(0, 5, -2.8)}}}
			self:akpack_setup_forbid( "wpn_fps_ass_heffy_762_lr_akmsu", "wpn_fps_upg_o_visionking" )
			self:akpack_setup_forbid( "wpn_fps_ass_heffy_762_lr_akmsu", "wpn_fps_upg_o_st10" )
			self:akpack_setup_forbid( "wpn_fps_ass_heffy_762_lr_akmsu", "wpn_fps_upg_o_gitsch" )
			self:akpack_setup_forbid( "wpn_fps_ass_heffy_762_lr_m92", "wpn_fps_upg_o_visionking" )
			self:akpack_setup_forbid( "wpn_fps_ass_heffy_762_lr_m92", "wpn_fps_upg_o_st10" )
			self:akpack_setup_forbid( "wpn_fps_ass_heffy_762_lr_m92", "wpn_fps_upg_o_gitsch" )
			self:akpack_setup_forbid( "wpn_fps_ass_heffy_762_lr_akmsu", "wpn_fps_shield_lr" )
			self:akpack_setup_forbid( "wpn_fps_ass_heffy_762_lr_m92", "wpn_fps_shield_lr" )
		end
		if self.parts.wpn_fps_ass_heffy_545_lr_aks74u then
			self.parts.wpn_fps_ass_heffy_545_lr_aks74u.override[o_id] = {a_obj = "a_o_aks74u_acog", stance_mod = {wpn_fps_ass_heffy_545 = {translation = Vector3(0, 5, -2.8)}}}
			self:akpack_setup_forbid( "wpn_fps_ass_heffy_545_lr_aks74u", "wpn_fps_upg_o_visionking" )
			self:akpack_setup_forbid( "wpn_fps_ass_heffy_545_lr_aks74u", "wpn_fps_upg_o_st10" )
			self:akpack_setup_forbid( "wpn_fps_ass_heffy_545_lr_aks74u", "wpn_fps_upg_o_gitsch" )
			self:akpack_setup_forbid( "wpn_fps_ass_heffy_545_lr_aks74u", "wpn_fps_shield_lr" )
		end
	end
end
if self.parts.wpn_fps_ass_heffy_all_lfg_warrior then
	for i, fl_id in ipairs(all_cafcw_gadget) do
		self.parts.wpn_fps_ass_heffy_all_lfg_warrior.override[fl_id] = {a_obj = "a_fl_war"}
		self.parts.wpn_fps_ass_heffy_all_lfg_honor.override[fl_id]	 = {a_obj = "a_fl_honor"}
		self.parts.wpn_fps_ass_heffy_all_lfg_zenit.override[fl_id]	 = {a_obj = "a_fl_zenit"}
	end
end
end)