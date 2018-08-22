Hooks:PostHook( WeaponFactoryTweakData, "init", "AK47ModInit", function(self)
	
self.parts.wpn_fps_ass_heffy_762_ro_blops.override = {
		wpn_fps_ass_heffy_762_fo_akm = { unit = "units/mods/weapons/wpn_fps_ass_heffy_762_shared_pts/wpn_fps_ass_heffy_762_fo_blops"},
	}
self.parts.wpn_fps_ass_heffy_762_ro_ins.override = {
		wpn_fps_ass_heffy_762_fo_akm = { unit = "units/mods/weapons/wpn_fps_ass_heffy_762_shared_pts/wpn_fps_ass_heffy_762_fo_ins"},
	}
self.parts.wpn_fps_ass_heffy_762_ro_m92.override = {
	wpn_fps_upg_o_ak47_l_scopemount = {unit = "units/mods/weapons/wpn_fps_ass_heffy_762_shared_pts/wpn_fps_upg_o_ak47_lc_scopemount"},
	wpn_fps_upg_o_ak47_scopemount = {unit = "units/mods/weapons/wpn_fps_ass_heffy_762_shared_pts/wpn_fps_upg_o_ak47_c_scopemount"}
}
	
	
-- Receiver   move to main xml
self.parts.wpn_fps_ass_heffy_762_lr_akm.override = {
	wpn_fps_ass_heffy_762_st_ak47 	= {a_obj = "a_s_akm"},
	wpn_fps_ass_heffy_762_sp_ak47 	= {a_obj = "a_s_akm"},
	wpn_fps_ass_heffy_762_st_akmsu 	= {a_obj = "a_s_akm_akmsu"},
	wpn_fps_ass_heffy_762_ba_akmsu 	= {a_obj = "a_b_akmsu_self"},
	wpn_fps_ass_heffy_762_pg_ak47 	= {a_obj = "a_g_akm_ak47"},
	wpn_fps_ass_heffy_762_ba_m92 	= {a_obj = "a_b_m92_self"}
}
self.parts.wpn_fps_ass_heffy_762_lr_ak47.override = {
	wpn_fps_ass_heffy_762_st_akm 	= {a_obj = "a_s_ak47"},
	wpn_fps_ass_heffy_762_st_akms 	= {a_obj = "a_s_ak47"},
	wpn_fps_ass_heffy_762_st_rpk 	= {a_obj = "a_s_ak47"},
	wpn_fps_ass_heffy_762_st_ak103 	= {a_obj = "a_s_ak47"},
	wpn_fps_ass_heffy_762_st_vepr	= {a_obj = "a_s_ak47"},
	wpn_fps_ass_heffy_762_st_bl_t56	= {a_obj = "a_s_ak47"},
	wpn_fps_ass_heffy_762_st_br_t56 = {a_obj = "a_s_ak47"},
	wpn_fps_ass_heffy_762_st_mpi 	= {a_obj = "a_s_ak47"},
	wpn_fps_ass_heffy_762_st_2_mpi 	= {a_obj = "a_s_ak47"},
	wpn_fps_ass_heffy_762_st_3_mpi 	= {a_obj = "a_s_ak47"},
	wpn_fps_ass_heffy_762_st_amd65 	= {a_obj = "a_s_ak47"},
	wpn_fps_ass_heffy_762_st_tabuk 	= {a_obj = "a_s_ak47"},
	wpn_fps_ass_heffy_762_sp_mpi 	= {a_obj = "a_s_ak47"},
	wpn_fps_ass_heffy_762_sp_2_mpi 	= {a_obj = "a_s_ak47"},
	wpn_fps_ass_heffy_762_sp_akm 	= {a_obj = "a_s_ak47"},
	wpn_fps_ass_heffy_762_sp_tabuk 	= {a_obj = "a_s_ak47"},
	wpn_fps_ass_heffy_762_stp_mpi 	= {a_obj = "a_s_ak47"},
	wpn_fps_ass_heffy_762_st_rk62 	= {a_obj = "a_s_ak47"},
	wpn_fps_ass_heffy_762_st_akmsu 	= {a_obj = "a_s_ak47_akmsu"},
	wpn_fps_ass_heffy_762_ba_akmsu 	= {a_obj = "a_b_akmsu_self"},
	wpn_fps_ass_heffy_762_ba_m92 	= {a_obj = "a_b_m92_self"}
}


-- Stocks
self.parts.wpn_fps_ass_heffy_762_st_vepr.override = {
	wpn_fps_ass_heffy_762_pg_ak47 	= {unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"}
}
self.parts.wpn_fps_ass_heffy_762_st_akmsu.override = {
	wpn_fps_ass_heffy_762_sp_tabuk 	= {a_obj = "a_sp_ak47_akmsu_tabuk"}
}


-- Barrels
self.parts.wpn_fps_ass_heffy_762_ba_dummy.override = {}
self.parts.wpn_fps_ass_heffy_762_ba_ak47.override = {}
self.parts.wpn_fps_ass_heffy_762_ba_akm.override = {}
self.parts.wpn_fps_ass_heffy_762_ba_t56.override = {}
self.parts.wpn_fps_ass_heffy_762_ba_amd63.override = {}
self.parts.wpn_fps_ass_heffy_762_ba_md90.override = {
	wpn_fps_ass_heffy_762_fo_akm 	= {unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy", weapon_stance_override = {bm_w_ak47 = "akmsu_ads"}},
	wpn_fps_ass_heffy_762_fo_blops 	= {unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy", weapon_stance_override = {bm_w_ak47 = "akmsu_ads"}}
}
self.parts.wpn_fps_ass_heffy_762_ba_m92.override = {
	wpn_fps_ass_heffy_762_fo_akm 	= {a_obj = "a_fs_akmsu_self", weapon_stance_override = {bm_w_ak47 = "akmsu_ads"}},
	wpn_fps_ass_heffy_762_fo_blops 	= {a_obj = "a_fs_akmsu_self", weapon_stance_override = {bm_w_ak47 = "akmsu_ads"}}
}
self.parts.wpn_fps_ass_heffy_762_ba_akmsu.override = {
	wpn_fps_ass_heffy_762_fo_akm 	= {a_obj = "a_fs_akmsu_self", weapon_stance_override = {bm_w_ak47 = "akmsu_ads"}},
	wpn_fps_ass_heffy_762_fo_blops 	= {a_obj = "a_fs_akmsu_self", weapon_stance_override = {bm_w_ak47 = "akmsu_ads"}}
}
self.parts.wpn_fps_ass_heffy_762_ba_ak104.override = {
	wpn_fps_ass_heffy_762_fo_akm 	= {a_obj = "a_fs_ak104_self"},
	wpn_fps_ass_heffy_762_fo_blops 	= {a_obj = "a_fs_ak104_self"},
	wpn_fps_ass_heffy_762_fh_tabuk 	= {a_obj = "a_fh_ak104_tabuk"},
	wpn_fps_ass_heffy_762_fh_ak103 	= {a_obj = "a_fh_ak104_other"},
	wpn_fps_ass_heffy_762_fh_md90 	= {a_obj = "a_fh_ak104_other"},
	wpn_fps_ass_heffy_762_fh_amd63 	= {a_obj = "a_fh_ak104_amd63"},
	wpn_fps_ass_heffy_762_fh_m70 	= {a_obj = "a_fh_ak104_other"}
}
self.parts.wpn_fps_ass_heffy_762_ba_rk62.override = {
	wpn_fps_ass_heffy_762_fo_akm 	= {a_obj = "a_fs_rk62_self"},
	wpn_fps_ass_heffy_762_fo_blops 	= {a_obj = "a_fs_rk62_self"}
}
self.parts.wpn_fps_ass_heffy_762_ba_rpk.override = {
	wpn_fps_ass_heffy_762_fo_akm 	= {a_obj = "a_fs_rpk"},
	wpn_fps_ass_heffy_762_fo_blops 	= {a_obj = "a_fs_rpk"}
}

self.parts.wpn_fps_ass_heffy_762_ba_tabuk.a_obj = "a_b_tabuk"
self.parts.wpn_fps_ass_heffy_762_ba_tabuk.override = {
	wpn_fps_ass_heffy_762_fo_akm 	= {a_obj = "a_fs_tabuk"},
	wpn_fps_ass_heffy_762_fo_blops 	= {a_obj = "a_fs_tabuk"},
	wpn_fps_ass_heffy_762_fh_tabuk 	= {a_obj = "a_fh_tabuk_self"}
}

self.parts.wpn_fps_ass_heffy_762_ba_vepr.override = {
	wpn_fps_ass_heffy_762_ufg_ak47 	= {unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"},
	wpn_fps_ass_heffy_762_lfg_ak47 	= {unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"}
}

-- Fore grip
self.parts.wpn_fps_ass_heffy_762_lfg_m70.override =  {
	wpn_fps_ass_heffy_762_ufg_ak47 	= {unit = "units/mods/weapons/wpn_fps_ass_heffy_762_m70_pts/wpn_fps_ass_heffy_762_ufg_m70"},
	wpn_fps_ass_heffy_762_ba_ak47 	= {a_obj = "a_b_m70"},
	wpn_fps_ass_heffy_762_ba_vepr 	= {a_obj = "a_b_m70"},
	wpn_fps_ass_heffy_762_ba_t56 	= {a_obj = "a_b_m70"},
	wpn_fps_ass_heffy_762_ba_amd63 	= {a_obj = "a_b_m70"},
	wpn_fps_ass_heffy_762_ba_akm 	= {a_obj = "a_b_m70"},
	wpn_fps_ass_heffy_762_fo_akm 	= {a_obj = "a_b_m70"},
	wpn_fps_ass_heffy_762_fo_blops 	= {a_obj = "a_b_m70"},
	wpn_fps_ass_heffy_762_ba_rpk 	= {a_obj = "a_b_m70", override = {
		wpn_fps_ass_heffy_762_fo_akm 	= {a_obj = "a_fs_m70_a_rpk"},
		wpn_fps_ass_heffy_762_fo_blops 	= {a_obj = "a_fs_m70_a_rpk"}}},
	wpn_fps_ass_heffy_762_ba_tabuk 	= {a_obj = "a_b_m70_a_tabuk", override = {
		wpn_fps_ass_heffy_762_fo_akm 	= {a_obj = "a_fs_m70_a_tabuk"},
		wpn_fps_ass_heffy_762_fo_blops 	= {a_obj = "a_fs_m70_a_tabuk"},
		wpn_fps_ass_heffy_762_fh_tabuk 	= {a_obj = "a_fh_m70_tabuk_tabuk"}}},
	wpn_fps_ass_heffy_762_fh_tabuk 	= {a_obj = "a_fh_m70_tabuk"},
	wpn_fps_ass_heffy_762_fh_ak103 	= {a_obj = "a_b_m70"},
	wpn_fps_ass_heffy_762_fh_md90 	= {a_obj = "a_b_m70"},
	wpn_fps_ass_heffy_762_fh_amd63 	= {a_obj = "a_fh_amd63_other"},
	wpn_fps_ass_heffy_762_fh_m70 	= {a_obj = "a_b_m70"}
} 
self.parts.wpn_fps_ass_heffy_762_lfg_m92.override = {wpn_fps_ass_heffy_762_lr_akmsu = {override = {
	wpn_fps_ass_heffy_762_ufg_ak47 	= {unit = "units/mods/weapons/wpn_fps_ass_heffy_762_m92_pts/wpn_fps_ass_heffy_762_ufg_m92"},
	wpn_fps_ass_heffy_762_ba_ak47 	= {a_obj = "a_body"},
	wpn_fps_ass_heffy_762_ba_vepr 	= {a_obj = "a_body"},
	wpn_fps_ass_heffy_762_ba_t56 	= {a_obj = "a_body"},
	wpn_fps_ass_heffy_762_ba_amd63 	= {a_obj = "a_body"},
	wpn_fps_ass_heffy_762_ba_akm 	= {a_obj = "a_body"},
	wpn_fps_ass_heffy_762_fo_akm 	= {a_obj = "a_body"},
	wpn_fps_ass_heffy_762_fo_blops 	= {a_obj = "a_body"},
	wpn_fps_ass_heffy_762_fh_ak103 	= {a_obj = "a_body"},
	wpn_fps_ass_heffy_762_fh_md90 	= {a_obj = "a_body"},
	wpn_fps_ass_heffy_762_fh_amd63 	= {a_obj = "a_fh_amd63_other"},
	wpn_fps_ass_heffy_762_fh_m70 	= {a_obj = "a_body"},
	wpn_fps_ass_heffy_762_pg_ak47 	= {a_obj = "a_g_akm_ak47"},
	wpn_fps_ass_heffy_762_fh_tabuk 	= {a_obj = "a_fh_tabuk_other"}}},
	wpn_fps_ass_heffy_762_ba_rpk 	= {a_obj = "a_body", override = {
		wpn_fps_ass_heffy_762_fo_akm 	= {a_obj = "a_fs_rpk"},
		wpn_fps_ass_heffy_762_fo_blops 	= {a_obj = "a_fs_rpk"}}},
	wpn_fps_ass_heffy_762_ba_akmsu 	= {override = {
		wpn_fps_ass_heffy_762_fo_akm 	= {a_obj = "a_fs_akmsu_self"},
		wpn_fps_ass_heffy_762_fo_blops 	= {a_obj = "a_fs_akmsu_self"}}},
	wpn_fps_ass_heffy_762_ba_m92 	= {a_obj = "a_body", override = {
		wpn_fps_ass_heffy_762_fo_akm 	= {a_obj = "a_fs_akmsu_self"},
		wpn_fps_ass_heffy_762_fo_blops 	= {a_obj = "a_fs_akmsu_self"}}},
	wpn_fps_ass_heffy_762_ba_ak104 	= {override = {
		wpn_fps_ass_heffy_762_fo_akm 	= {a_obj = "a_fs_ak104_self"},
		wpn_fps_ass_heffy_762_fo_blops 	= {a_obj = "a_fs_ak104_self"}}},
	wpn_fps_ass_heffy_762_ba_rk62 	= {override = {
		wpn_fps_ass_heffy_762_fo_akm 	= {a_obj = "a_fs_rk62_self"},
		wpn_fps_ass_heffy_762_fo_blops 	= {a_obj = "a_fs_rk62_self"}}},
	wpn_fps_ass_heffy_762_ba_tabuk 	= {a_obj = "a_b_tabuk", override = {
		wpn_fps_ass_heffy_762_fo_akm 	= {a_obj = "a_fs_tabuk"},
		wpn_fps_ass_heffy_762_fo_blops 	= {a_obj = "a_fs_tabuk"},
		wpn_fps_ass_heffy_762_fh_tabuk 	= {a_obj = "a_fh_tabuk_self"}}}}

self.parts.wpn_fps_ass_heffy_762_lfg_vepr.override = {
	wpn_fps_ass_heffy_762_ufg_ak47 	= {unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"}
}

-- Scope Mount
self.parts.wpn_fps_upg_o_ak47_scopemount.a_obj = "a_g_ak47"

self.parts.wpn_fps_upg_o_ak47_l_scopemount.a_obj = "a_g_ak47"
self.parts.wpn_fps_upg_o_ak47_l_scopemount.forbids = {
	"wpn_fps_upg_o_ak47_scopemount"
}

-- Underbarrel sight
self.parts.wpn_fps_ass_heffy_762_gl_gl25_sight_up.stance_mod = {
			wpn_fps_ass_heffy_762 = {
				translation = Vector3(5.3, -2, 4.9),
				rotation = Rotation(0, -5, 0)
			}
		}
self.parts.wpn_fps_ass_heffy_762_gl_gl25_sight_up.override = {
		wpn_fps_ass_heffy_762_gl_gl25 = { unit = "units/mods/weapons/wpn_fps_ass_heffy_762_shared_pts/wpn_fps_ass_heffy_762_gl_gl25_sight"},
	}
		
-- Sights
self.wpn_fps_ass_heffy_762.adds = {
			wpn_fps_upg_o_specter = {"wpn_fps_upg_o_ak47_scopemount"},
			wpn_fps_upg_o_aimpoint = {"wpn_fps_upg_o_ak47_scopemount"},
			wpn_fps_upg_o_aimpoint_2 = {"wpn_fps_upg_o_ak47_scopemount"},
			wpn_fps_upg_o_docter = {"wpn_fps_upg_o_ak47_scopemount"},
			wpn_fps_upg_o_eotech = {"wpn_fps_upg_o_ak47_scopemount"},
			wpn_fps_upg_o_t1micro = {"wpn_fps_upg_o_ak47_scopemount"},
			wpn_fps_upg_o_cmore = {"wpn_fps_upg_o_ak47_scopemount"},
			wpn_fps_upg_o_acog = {"wpn_fps_upg_o_ak47_scopemount"},
			wpn_fps_upg_o_cs = {"wpn_fps_upg_o_ak47_scopemount"},
			wpn_fps_upg_o_eotech_xps = {"wpn_fps_upg_o_ak47_scopemount"},
			wpn_fps_upg_o_reflex = {"wpn_fps_upg_o_ak47_scopemount"},
			wpn_fps_upg_o_rx01 = {"wpn_fps_upg_o_ak47_scopemount"},
			wpn_fps_upg_o_rx30 = {"wpn_fps_upg_o_ak47_scopemount"},
			wpn_fps_upg_o_spot = {"wpn_fps_upg_o_ak47_scopemount"}
		}
		
-- Gun
self.wpn_fps_ass_heffy_762.override = {
	wpn_fps_upg_ns_ass_smg_large = {a_obj = "a_body",parent = nil},
	wpn_fps_ass_heffy_762_m_helical_64 = {a_obj = "a_m_ak47_nk64"},
	wpn_fps_ass_heffy_762_m_steel_75 = {a_obj = "a_m_ak47_drum75"},
	wpn_fps_ass_heffy_762_fh_tabuk = {a_obj = "a_fh_tabuk_other"},
--	wpn_fps_ass_heffy_762_gl_gl25_sight_up = {a_obj = "a_os_ak47"},
	wpn_fps_upg_o_reflex 		= {a_obj = "a_o_ak47",stance_mod = {wpn_fps_ass_heffy_762 = {translation = Vector3(0, 7, -3.7)}}},
	wpn_fps_upg_o_aimpoint 		= {a_obj = "a_o_ak47",stance_mod = {wpn_fps_ass_heffy_762 = {translation = Vector3(0, 7, -3.7)}}},
	wpn_fps_upg_o_aimpoint_2 	= {a_obj = "a_o_ak47",stance_mod = {wpn_fps_ass_heffy_762 = {translation = Vector3(0, 7, -3.7)}}},
	wpn_fps_upg_o_docter 		= {a_obj = "a_o_ak47",stance_mod = {wpn_fps_ass_heffy_762 = {translation = Vector3(0, 7, -3.7)}}},
	wpn_fps_upg_o_eotech 		= {a_obj = "a_o_ak47",stance_mod = {wpn_fps_ass_heffy_762 = {translation = Vector3(0, 7, -3.7)}}},
	wpn_fps_upg_o_t1micro 		= {a_obj = "a_o_ak47",stance_mod = {wpn_fps_ass_heffy_762 = {translation = Vector3(0, 7, -3.7)}}},
	wpn_fps_upg_o_cmore 		= {a_obj = "a_o_ak47",stance_mod = {wpn_fps_ass_heffy_762 = {translation = Vector3(0, 7, -3.7)}}},
	wpn_fps_upg_o_acog 			= {a_obj = "a_o_ak47",stance_mod = {wpn_fps_ass_heffy_762 = {translation = Vector3(0, 7, -3.7)}}},
	wpn_fps_upg_o_cs	 		= {a_obj = "a_o_ak47",stance_mod = {wpn_fps_ass_heffy_762 = {translation = Vector3(0, 7, -3.7)}}},
	wpn_fps_upg_o_eotech_xps	= {a_obj = "a_o_ak47",stance_mod = {wpn_fps_ass_heffy_762 = {translation = Vector3(0, 7, -3.7)}}},
	wpn_fps_upg_o_rx01	 		= {a_obj = "a_o_ak47",stance_mod = {wpn_fps_ass_heffy_762 = {translation = Vector3(0, 7, -3.7)}}},
	wpn_fps_upg_o_rx30	 		= {a_obj = "a_o_ak47",stance_mod = {wpn_fps_ass_heffy_762 = {translation = Vector3(0, 7, -3.7)}}},
	wpn_fps_upg_o_spot	 		= {a_obj = "a_o_ak47",stance_mod = {wpn_fps_ass_heffy_762 = {translation = Vector3(0, 7, -3.7)}}}
}
-- Barrel Extensions
--[[ 
	local ak47_exts = {
	}
	--]]
	local ak762_exts = {
	"wpn_fps_upg_ns_ass_smg_large",
	"wpn_fps_upg_ns_ass_smg_medium",
	"wpn_fps_upg_ns_ass_smg_small",
	"wpn_fps_upg_ns_ass_smg_firepig",
	"wpn_fps_upg_ns_ass_smg_stubby",
	"wpn_fps_upg_ns_ass_smg_tank",
	"wpn_fps_upg_ns_ass_pbs1",
	"wpn_fps_upg_ass_ns_jprifles",
	"wpn_fps_upg_ass_ns_linear",
	"wpn_fps_upg_ass_ns_surefire",
	"wpn_fps_upg_ass_ns_battle",
	"wpn_fps_ass_heffy_762_fh_ak47",
	"wpn_fps_ass_heffy_762_fh_akm",
	"wpn_fps_ass_heffy_762_fh_akmsu",
	"wpn_fps_ass_heffy_762_fh_ak103",
	"wpn_fps_ass_heffy_762_fh_ak104",
	"wpn_fps_ass_heffy_762_fh_md90",
	"wpn_fps_ass_heffy_762_fh_t56",
	"wpn_fps_ass_heffy_762_fh_amd63",
	"wpn_fps_ass_heffy_762_fh_m70",
	"wpn_fps_ass_heffy_762_fh_m92",
	"wpn_fps_ass_heffy_762_fh_tabuk",
	"wpn_fps_ass_heffy_762_fh_rk62"
	}
	
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override = {
			wpn_fps_ass_heffy_762_lfg_ak47 	= {unit = "units/mods/weapons/wpn_fps_ass_heffy_762_akmsu_pts/wpn_fps_ass_heffy_762_lfg_akmsu"},
			wpn_fps_ass_heffy_762_ufg_ak47 	= {unit = "units/mods/weapons/wpn_fps_ass_heffy_762_akmsu_pts/wpn_fps_ass_heffy_762_ufg_akmsu"},
			wpn_fps_ass_heffy_762_lfgc_ak47 	= {unit = "units/mods/weapons/wpn_fps_ass_heffy_762_akmsu_pts/wpn_fps_ass_heffy_762_lfgc_akmsu"},
			wpn_fps_ass_heffy_762_ufgc_ak47 	= {unit = "units/mods/weapons/wpn_fps_ass_heffy_762_akmsu_pts/wpn_fps_ass_heffy_762_ufgc_akmsu"},
			wpn_fps_ass_heffy_762_st_ak47 	= {a_obj = "a_s_akmsu_ak47"},
			wpn_fps_ass_heffy_762_st_akm 	= {a_obj = "a_s_akmsu_other"},
			wpn_fps_ass_heffy_762_st_akms 	= {a_obj = "a_s_akmsu_other"},
			wpn_fps_ass_heffy_762_st_rpk 	= {a_obj = "a_s_akmsu_other"},
			wpn_fps_ass_heffy_762_st_ak103 	= {a_obj = "a_s_akmsu_other"},
			wpn_fps_ass_heffy_762_st_vepr	= {a_obj = "a_s_akmsu_other"},
			wpn_fps_ass_heffy_762_st_bl_t56	= {a_obj = "a_s_akmsu_other"},
			wpn_fps_ass_heffy_762_st_br_t56 	= {a_obj = "a_s_akmsu_other"},
			wpn_fps_ass_heffy_762_st_mpi 	= {a_obj = "a_s_akmsu_other"},
			wpn_fps_ass_heffy_762_st_2_mpi 	= {a_obj = "a_s_akmsu_other"},
			wpn_fps_ass_heffy_762_st_3_mpi 	= {a_obj = "a_s_akmsu_other"},
			wpn_fps_ass_heffy_762_st_amd65 	= {a_obj = "a_s_akmsu_other"},
			wpn_fps_ass_heffy_762_st_tabuk 	= {a_obj = "a_s_akmsu_other"},
			wpn_fps_ass_heffy_762_sp_mpi 	= {a_obj = "a_s_akmsu_other"},
			wpn_fps_ass_heffy_762_sp_2_mpi 	= {a_obj = "a_s_akmsu_other"},
			wpn_fps_ass_heffy_762_sp_akm 	= {a_obj = "a_s_akmsu_other"},
			wpn_fps_ass_heffy_762_sp_tabuk 	= {a_obj = "a_s_akmsu_other"},
			wpn_fps_ass_heffy_762_stp_mpi 	= {a_obj = "a_s_akmsu_other"},
			wpn_fps_ass_heffy_762_sp_ak47 	= {a_obj = "a_s_akmsu_ak47"},
			wpn_fps_ass_heffy_762_ba_ak47 	= {a_obj = "a_b_akmsu_other"},
			wpn_fps_ass_heffy_762_ba_t56 	= {a_obj = "a_b_akmsu_other"},
			wpn_fps_ass_heffy_762_ba_amd63 	= {a_obj = "a_b_akmsu_other"},
			wpn_fps_ass_heffy_762_ba_akm 	= {a_obj = "a_b_akmsu_other"},
			wpn_fps_ass_heffy_762_fo_akm 	= {a_obj = "a_b_akmsu_other"},
			wpn_fps_ass_heffy_762_fo_blops 	= {a_obj = "a_b_akmsu_other"},
			wpn_fps_ass_heffy_762_ba_m92 	= {a_obj = "a_b_akmsu_other", override = {
				wpn_fps_ass_heffy_762_fo_akm 	= {a_obj = "a_fs_akmsu_other"},
				wpn_fps_ass_heffy_762_fo_blops 	= {a_obj = "a_fs_akmsu_other"}}},
			wpn_fps_ass_heffy_762_pg_ak47 	= {a_obj = "a_g_akm_ak47"}
		}
	
	for i, part_id in ipairs(ak762_exts) do
		self.wpn_fps_ass_heffy_762.override[part_id] = {a_obj = "a_ns"}
		self.parts.wpn_fps_ass_heffy_762_ba_ak104.override[part_id] = {a_obj = "a_ns_ak104"}
		self.parts.wpn_fps_ass_heffy_762_ba_akmsu.override[part_id] = {a_obj = "a_ns_akmsu"}
		self.parts.wpn_fps_ass_heffy_762_ba_m92.override[part_id] = {a_obj = "a_ns_akmsu"}
		self.parts.wpn_fps_ass_heffy_762_ba_md90.override[part_id] = {a_obj = "a_ns_md90"}
		self.parts.wpn_fps_ass_heffy_762_ba_rk62.override[part_id] = {a_obj = "a_ns_rk62"}
		self.parts.wpn_fps_ass_heffy_762_ba_rpk.override[part_id] = {a_obj = "a_ns_rpk"}
		self.parts.wpn_fps_ass_heffy_762_ba_tabuk.override[part_id] = {a_obj = "a_ns_tabuk"}
		self.parts.wpn_fps_ass_heffy_762_ba_vepr.override[part_id] = {a_obj = "a_ns_vepr"}
	--	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[part_id] = {a_obj = "a_ns_ak47"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_vepr 	= {a_obj = "a_b_akmsu_other", override = {
			[part_id] = {a_obj = "a_ns_vepr_akmsu"}}}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_rpk 	= {a_obj = "a_b_akmsu_other", override = {
			wpn_fps_ass_heffy_762_fo_akm 	= {a_obj = "a_fs_akmsu_rpk"},
			wpn_fps_ass_heffy_762_fo_blops 	= {a_obj = "a_fs_akmsu_rpk"},
			[part_id] = {a_obj = "a_ns_vepr_akmsu"}}}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_akmsu 	= {override = {
			wpn_fps_ass_heffy_762_fo_akm 	= {a_obj = "a_fs_akmsu_other"},
			wpn_fps_ass_heffy_762_fo_blops 	= {a_obj = "a_fs_akmsu_other"},
			[part_id] = {a_obj = "a_ns_akmsu_akmsu"}}}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_ak104 	= {override = {
			wpn_fps_ass_heffy_762_fo_akm 	= {a_obj = "a_fs_akmsu_ak104"},
			wpn_fps_ass_heffy_762_fo_blops 	= {a_obj = "a_fs_akmsu_ak104"},
			[part_id] = {a_obj = "a_ns_ak104_akmsu"}}}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_rk62 	= {override = {
			wpn_fps_ass_heffy_762_fo_akm 	= {a_obj = "a_fs_akmsu_rk62"},
			wpn_fps_ass_heffy_762_fo_blops 	= {a_obj = "a_fs_akmsu_rk62"},
			[part_id] = {a_obj = "a_ns_rk62_akmsu"}}}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_tabuk 	= {a_obj = "a_b_akmsu_tabuk", override = {
			wpn_fps_ass_heffy_762_fo_akm 	= {a_obj = "a_fs_akmsu_tabuk"},
			wpn_fps_ass_heffy_762_fo_blops 	= {a_obj = "a_fs_akmsu_tabuk"},
			[part_id] = {a_obj = "a_ns_tabuk_akmsu"}}}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_md90 	= {a_obj = "a_b_akmsu_other", override = {
			[part_id] = {a_obj = "a_ns_md90_akmsu"}}}
	end

-- Magazine 
self.parts.wpn_fps_ass_heffy_762_m_helical_64.weapon_hold_override = {
			bm_w_ak47 = "contraband"
		}
		

self.parts.wpn_fps_ass_heffy_762_m_helical_64.weapon_stance_override = {
			bm_w_ak47 = "gl25_gl"
		}
		
self.parts.wpn_fps_ass_heffy_762_m_steel_75.weapon_reload_override = {
			bm_w_ak47 = "tecci"
		}


--Gadgets

	local ak762fls = {
	"wpn_fps_upg_fl_ass_smg_sho_peqbox",
	"wpn_fps_upg_fl_ass_smg_sho_surefire",
	"wpn_fps_upg_fl_ass_peq15",
	"wpn_fps_upg_fl_ass_laser",
	"wpn_fps_upg_fl_ass_utg",
	"wpn_fps_addon_ris"
	}
	for i, part_id in ipairs(ak762fls) do
		self.wpn_fps_ass_heffy_762.override[part_id] = {a_obj = "a_fl_ak47"}
	end
	
-- Bipod
self.parts.wpn_fps_ass_heffy_762_bp_rpk.adds = {"wpn_fps_upg_bp_lmg_lionbipod"}

-- Grenade Launcher
	--	self.parts.wpn_fps_ass_heffy_762_gl_gl25.sub_type = "grenade_launcher"
		
		self.wpn_fps_ass_heffy_762.override.wpn_fps_ass_heffy_762_gl_gl25 = {a_obj = "a_gl_ak47"}
		
	--	self.parts.wpn_fps_ass_heffy_762_gl_gl25.bullet_objects = {
	--		amount = 1,
	--		prefix = "g_grenade_"
	--	}

	--	self.parts.wpn_fps_ass_heffy_762_gl_gl25.custom_stats = {
	--		ammo_pickup_max_mul = 0.7,
	--		ammo_pickup_min_mul = 0.8
	--	}

		self.parts.wpn_fps_ass_heffy_762_gl_gl25.perks = {"underbarrel"}

		self.parts.wpn_fps_ass_heffy_762_gl_gl25.weapon_hold_override = {
			bm_w_ak47 = "contraband",
			bm_w_contraband_m203 = "contraband"
		}
		self.parts.wpn_fps_ass_heffy_762_gl_gl25.weapon_stance_override = {
			bm_w_ak47 = "gl25_gl",
			bm_w_contraband_m203 = "gl25_gl"
		}
		self.parts.wpn_fps_ass_heffy_762_gl_gl25.weapon_reload_override = {
			bm_w_contraband_m203 = "contraband"
		}

		self.parts.wpn_fps_ass_heffy_762_gl_gl25.override = {
			wpn_fps_upg_o_45rds = {
				stance_mod = {
					wpn_fps_ass_heffy_762 = {
						translation = Vector3(-1.05, 0, -12.67),
						rotation = Rotation(0, 0, -45)
					}
				}
			},
			wpn_fps_upg_o_45rds_v2 = {
				stance_mod = {
					wpn_fps_ass_heffy_762 = {
						translation = Vector3(-1.05, 0, -12.67),
						rotation = Rotation(0, 0, -45)
					}
				}
			}
		}

local ak762_def_ads_brls = {
	"wpn_fps_ass_heffy_762_ba_ak47",
	"wpn_fps_ass_heffy_762_ba_akm",
	"wpn_fps_ass_heffy_762_ba_ak104",
	"wpn_fps_ass_heffy_762_ba_rpk",
	"wpn_fps_ass_heffy_762_ba_t56",
	"wpn_fps_ass_heffy_762_ba_tabuk",
	"wpn_fps_ass_heffy_762_ba_vepr"
}

for i, part_id in ipairs(ak762_def_ads_brls) do
	self.parts[part_id].weapon_stance_override = {bm_w_ak47 = "heffy_762_ads"}
	self.parts.wpn_fps_ass_heffy_762_gl_gl25.override[part_id] = {weapon_stance_override = {bm_w_ak47 = "gl25_gl"}}
end
	
self.parts.wpn_fps_ass_heffy_762_ba_akmsu.weapon_stance_override = {bm_w_ak47 = "akmsu_ads"}
	
--[[ 
--Front Sight 
self.parts.wpn_fps_ass_heffy_762_fo_akm.weapon_stance_override = {
            bm_w_ak47 = "heffy_762_ads"
        }
self.parts.wpn_fps_ass_heffy_762_fo_blops.weapon_stance_override = {
            bm_w_ak47 = "heffy_762_ads"
        }
	--]]
	
end )