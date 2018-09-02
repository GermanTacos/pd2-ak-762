------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
--                                                                                      --
--                          ||       ||   ||        |||  ||||||||                       --
--                         ||||      ||  ||        ||||        ||                       --
--                        ||  ||     || ||        || ||       ||                        --
--                       ||||||||    ||||        |||||||     ||                         --
--                      ||      ||   || ||           ||     ||                          --
--                     ||        ||  ||  ||          ||    ||                           --
--                    ||          || ||   ||         ||   ||                            --
--                                                                                      --
------------------------------------------------------------------------------------------
--																						--
--						  	 		   > [Functions]									--
--									   > [Arrays]		   								--
--									   > [Override]				    					--
--									   > [Adds] 										--
--									   > [Forbids] 										--
--									   > [Stance]										--
--									   > [Underbarrel] 							    	--
--									   > [Tweaks] 										--
--									   > [WIP] 											--
--																						--
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------


---------------------------------------------
----<A><K><4><7> -Functions- <A><K><4><7>----
---------------------------------------------

--- Forbid Setup ---
function WeaponFactoryTweakData:akpack_setup_forbid( mod_one, mod_two )
	if self.parts[mod_one] and self.parts[mod_two] then
		self.parts[mod_one].forbids = self.parts[mod_one].forbids or {}
		table.insert(self.parts[mod_one].forbids, mod_two)
		self.parts[mod_two].forbids = self.parts[mod_two].forbids or {}
		table.insert(self.parts[mod_two].forbids, mod_one)
	else
		if not self.parts[mod_one] then
			self:akpack_write_error( "forbid_setup", "fti", "part", mod_two )	
		end
		if not self.parts[mod_two] then
			self:akpack_write_error( "forbid_setup", "fti", "part", mod_two )	
		end
	end
end

--- Override Base ---
function WeaponFactoryTweakData:akpack_check_override( mod_type, mod_woa ) 
	if mod_type == "wpn" then
		if self[mod_woa] then
			self[mod_woa].override = self[mod_woa].override or {}
		else 
			self:akpack_write_error( "override_check", "fti", mod_type, mod_woa )
		end
	elseif mod_type == "part" then
		if self.parts[mod_woa] then
			self.parts[mod_woa].override = self.parts[mod_woa].override or {}
		else 
			self:akpack_write_error( "override_check", "fti", mod_type, mod_woa )
		end
	else
		self:akpack_write_error( "override_check", "fti", "mod_type", mod_type )
	end
end

--- Adds Base ---
function WeaponFactoryTweakData:akpack_check_adds( mod_type, mod_woa ) 
	if mod_type == "wpn" then
		if self[mod_woa] then
			self[mod_woa].adds = self[mod_woa].adds or {}
		else 
			self:akpack_write_error( "adds_check", "fti", mod_type, mod_woa )
		end
	elseif mod_type == "part" then
		if self.parts[mod_woa] then
			self.parts[mod_woa].adds = self.parts[mod_woa].adds or {}
		else 
			self:akpack_write_error( "adds_check", "fti", mod_type, mod_woa )
		end
	else
		self:akpack_write_error( "adds_check", "fti", "mod_type", mod_type )
	end
end

--- ERROR Base ---
function WeaponFactoryTweakData:akpack_write_error( func, cause, error_id, value  )
	if func and cause and error_id then 
		-- fti = failed to index
		if cause == "fti" and value then
			if error_id == "part" then
				log("AK47_ERROR: (" .. func .. ")Attempt to index Part ID: '" .. value .. "' (a nil value)")
			elseif error_id == "wpn" then
				log("AK47_ERROR: (" .. func .. ")Attempt to index Weapon ID: '" .. value .. "' (a nil value)")
			elseif error_id == "mod_type" then
				log("AK47_ERROR: (" .. func .. ")Attempt to index mod_type: '" .. value .. "' (a nil value)")
			end
		end
	end
end 

--- Part Copy Base ---
function WeaponFactoryTweakData:ak762_copy_part( att_og, att_cp )
	if self.parts[att_og] then
		self.parts[att_cp] = deep_clone(self.parts[att_og])
		self.parts[att_cp].pcs = {}
		self.parts[att_cp].is_a_unlockable = true
		table.insert(self.wpn_fps_ass_heffy_762.uses_parts, att_cp)
	else
		self:akpack_write_error( "copy_part", "fti", "part", att_og )	
	end
end

Hooks:PostHook( WeaponFactoryTweakData, "init", "AK47ModInit", function(self)

------------------------------------------
----<A><K><4><7> -Arrays- <A><K><4><7>----
------------------------------------------

--- Lower ---
local all_ak47lower = {
	"wpn_fps_ass_heffy_762_lr_akm",
	"wpn_fps_ass_heffy_762_lr_ak103",
	"wpn_fps_ass_heffy_762_lr_ak47",
	"wpn_fps_ass_heffy_762_lr_akmsu",
	"wpn_fps_ass_heffy_762_lr_m92"
}

--- Stocks ---
local all_ak47stock = {
	"wpn_fps_ass_heffy_762_st_ak47",
	"wpn_fps_ass_heffy_762_st_akm",
	"wpn_fps_ass_heffy_762_st_akms",
	"wpn_fps_ass_heffy_762_st_akmsu",
	"wpn_fps_ass_heffy_762_st_rpk",
	"wpn_fps_ass_heffy_762_st_ak103",
	"wpn_fps_ass_heffy_762_st_vepr",
	"wpn_fps_ass_heffy_762_st_bl_t56",
	"wpn_fps_ass_heffy_762_st_br_t56",
	"wpn_fps_ass_heffy_762_st_mpi",
	"wpn_fps_ass_heffy_762_st_2_mpi",
	"wpn_fps_ass_heffy_762_st_3_mpi",
	"wpn_fps_ass_heffy_762_st_amd63",
	"wpn_fps_ass_heffy_762_st_amd65",
	"wpn_fps_ass_heffy_762_st_tabuk",
	"wpn_fps_ass_heffy_762_st_rk62"
}
local akmstock = {
	"wpn_fps_ass_heffy_762_st_akm",
	"wpn_fps_ass_heffy_762_st_akms",
	"wpn_fps_ass_heffy_762_st_rpk",
	"wpn_fps_ass_heffy_762_st_ak103",
	"wpn_fps_ass_heffy_762_st_vepr",
	"wpn_fps_ass_heffy_762_st_bl_t56",
	"wpn_fps_ass_heffy_762_st_br_t56",
	"wpn_fps_ass_heffy_762_st_mpi",
	"wpn_fps_ass_heffy_762_st_2_mpi",
	"wpn_fps_ass_heffy_762_st_3_mpi",
	"wpn_fps_ass_heffy_762_st_amd63",
	"wpn_fps_ass_heffy_762_st_amd65",
	"wpn_fps_ass_heffy_762_st_tabuk",
	"wpn_fps_ass_heffy_762_st_rk62"
}
--- Stock Pads ---
local akmstockpad = {
	"wpn_fps_ass_heffy_762_sp_mpi",
	"wpn_fps_ass_heffy_762_sp_2_mpi",
	"wpn_fps_ass_heffy_762_sp_akm",
	"wpn_fps_ass_heffy_762_sp_tabuk",
	"wpn_fps_ass_heffy_762_stp_mpi",
	"wpn_fps_ass_heffy_762_sp_amd63"
}
--- Fore Grip ---
-- Default length --
local all_ak47lowerforegrip = {
	"wpn_fps_ass_heffy_762_lfg_ak47",
	"wpn_fps_ass_heffy_762_lfg_akm",
	"wpn_fps_ass_heffy_762_lfg_akmsu",
	"wpn_fps_ass_heffy_762_lfg_rpk",
	"wpn_fps_ass_heffy_762_lfg_ak103",
	"wpn_fps_ass_heffy_762_lfg_vepr",
	"wpn_fps_ass_heffy_762_lfg_bl_t56",
	"wpn_fps_ass_heffy_762_lfg_br_t56",
	"wpn_fps_ass_heffy_762_lfg_mpi",
	"wpn_fps_ass_heffy_762_lfg_amd63",
	"wpn_fps_ass_heffy_762_lfg_m70",
	"wpn_fps_ass_heffy_762_lfg_m92",
	"wpn_fps_ass_heffy_762_lfg_none"
}
local ak47foregrip = {
	"wpn_fps_ass_heffy_762_lfg_ak47",
	"wpn_fps_ass_heffy_762_lfg_akm",
	"wpn_fps_ass_heffy_762_lfg_rpk",
	"wpn_fps_ass_heffy_762_lfg_ak103",
	"wpn_fps_ass_heffy_762_lfg_vepr",
	"wpn_fps_ass_heffy_762_lfg_bl_t56",
	"wpn_fps_ass_heffy_762_lfg_br_t56",
	"wpn_fps_ass_heffy_762_lfg_mpi",
	"wpn_fps_ass_heffy_762_lfg_amd63"
}

--- Barrel ---
-- Default length --
local ak47barrel = {
	"wpn_fps_ass_heffy_762_ba_ak47",
	"wpn_fps_ass_heffy_762_ba_akm",
	"wpn_fps_ass_heffy_762_ba_t56",
	"wpn_fps_ass_heffy_762_ba_amd63",
	"wpn_fps_ass_heffy_762_ba_ak109"
}
local all_ak47barrel = {
	"wpn_fps_ass_heffy_762_ba_ak47",
	"wpn_fps_ass_heffy_762_ba_akm",
	"wpn_fps_ass_heffy_762_ba_akmsu",
	"wpn_fps_ass_heffy_762_ba_rpk",
	"wpn_fps_ass_heffy_762_ba_ak104",
	"wpn_fps_ass_heffy_762_ba_md90",
	"wpn_fps_ass_heffy_762_ba_vepr",
	"wpn_fps_ass_heffy_762_ba_t56",
	"wpn_fps_ass_heffy_762_ba_amd63",
	"wpn_fps_ass_heffy_762_ba_amd65",
	"wpn_fps_ass_heffy_762_ba_m92",
	"wpn_fps_ass_heffy_762_ba_tabuk",
	"wpn_fps_ass_heffy_762_ba_rk62",
	"wpn_fps_ass_heffy_762_ba_ak109"
}

--- Front Sights ---
local all_ak47fo = {
	"wpn_fps_ass_heffy_762_fo_akm"
}

--- Barrel Extensions --
local all_ak47ext = {
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
	"wpn_fps_ass_heffy_762_fh_rk62",
	"wpn_fps_ass_heffy_762_fh_dummy"
}

--- Gadgets (Flashlights/Lasers) ---
local all_ak47fl = {
	"wpn_fps_upg_fl_ass_smg_sho_peqbox",
	"wpn_fps_upg_fl_ass_smg_sho_surefire",
	"wpn_fps_upg_fl_ass_peq15",
	"wpn_fps_upg_fl_ass_laser",
	"wpn_fps_upg_fl_ass_utg",
	"wpn_fps_addon_ris"
}

--- Sights ---
local all_ak47sight = {
	"wpn_fps_upg_o_specter",
	"wpn_fps_upg_o_aimpoint",
	"wpn_fps_upg_o_aimpoint_2",
	"wpn_fps_upg_o_docter",
	"wpn_fps_upg_o_eotech",
	"wpn_fps_upg_o_t1micro",
	"wpn_fps_upg_o_cmore",
	"wpn_fps_upg_o_acog",
	"wpn_fps_upg_o_cs",
	"wpn_fps_upg_o_eotech_xps",
	"wpn_fps_upg_o_reflex",
	"wpn_fps_upg_o_rx01",
	"wpn_fps_upg_o_rx30",
	"wpn_fps_upg_o_spot"
}
local nonacog_aksight = {
	"wpn_fps_upg_o_specter",
	"wpn_fps_upg_o_aimpoint",
	"wpn_fps_upg_o_aimpoint_2",
	"wpn_fps_upg_o_docter",
	"wpn_fps_upg_o_eotech",
	"wpn_fps_upg_o_t1micro",
	"wpn_fps_upg_o_cmore",
	"wpn_fps_upg_o_cs",
	"wpn_fps_upg_o_eotech_xps",
	"wpn_fps_upg_o_reflex",
	"wpn_fps_upg_o_rx01",
	"wpn_fps_upg_o_rx30",
	"wpn_fps_upg_o_spot"
}

--- Grips ---
local akmgrips = {
	"wpn_fps_ass_heffy_762_pg_akm",
	"wpn_fps_ass_heffy_762_pg_ak103",
	"wpn_fps_ass_heffy_762_pg_bl_t56",
	"wpn_fps_ass_heffy_762_pg_br_t56",
	"wpn_fps_ass_heffy_762_pg_mpi",
	"wpn_fps_ass_heffy_762_pg_amd63",
	"wpn_fps_ass_heffy_762_pg_amd65",
	"wpn_fps_ass_heffy_762_pg_m92",
	"wpn_fps_ass_heffy_762_pg_rk62"
}
--------------------------------------------
----<A><K><4><7> -Override- <A><K><4><7>----
--------------------------------------------

--- Gun ---

--- Barrel ---
for i, ba_id in ipairs(all_ak47barrel) do
	self:akpack_check_override( "part", ba_id )
end
--self.parts.wpn_fps_ass_heffy_762_ba_akm.override.wpn_fps_ass_heffy_762_fh_dummy = {unit="units/mods/weapons/wpn_fps_ass_heffy_762_akm_pts/wpn_fps_ass_heffy_762_fh_akm"}
-- Default length barrel barrel extension and front sight override --
for i, ba_id in ipairs(ak47barrel) do
	for i, ext_id in ipairs(all_ak47ext) do
		if ext_id ~= "wpn_fps_ass_heffy_762_fh_dummy" then
			self.parts[ba_id].override[ext_id] = {a_obj = "a_ns"}
		end
	end
	for i, fo_id in ipairs(all_ak47fo) do
		self.parts[ba_id].override[fo_id] = {}
	end
end
self.parts.wpn_fps_ass_heffy_762_ba_akm.override.wpn_fps_ass_heffy_762_fh_dummy   = {a_obj = "a_ns", unit="units/mods/weapons/wpn_fps_ass_heffy_762_akm_pts/wpn_fps_ass_heffy_762_fh_akm"}
self.parts.wpn_fps_ass_heffy_762_ba_t56.override.wpn_fps_ass_heffy_762_fh_dummy   = {a_obj = "a_ns", unit="units/mods/weapons/wpn_fps_ass_heffy_762_t56_pts/wpn_fps_ass_heffy_762_fh_t56"}
self.parts.wpn_fps_ass_heffy_762_ba_amd63.override.wpn_fps_ass_heffy_762_fh_dummy = {a_obj = "a_ns", unit="units/mods/weapons/wpn_fps_ass_heffy_762_ak47_pts/wpn_fps_ass_heffy_762_fh_ak47"}
self.parts.wpn_fps_ass_heffy_762_ba_ak109.override.wpn_fps_ass_heffy_762_fh_dummy = {a_obj = "a_ns", unit="units/mods/weapons/wpn_fps_ass_heffy_762_ak103_pts/wpn_fps_ass_heffy_762_fh_ak103"}


-- Other length barrel barrel extension overrides --
for i, ext_id in ipairs(all_ak47ext) do
	if ext_id == "wpn_fps_ass_heffy_762_fh_dummy" then
		self.parts.wpn_fps_ass_heffy_762_ba_tabuk.override[ext_id] = {a_obj = "a_ns_tabuk", unit="units/mods/weapons/wpn_fps_ass_heffy_762_tabuk_pts/wpn_fps_ass_heffy_762_fh_tabuk"}
		self.parts.wpn_fps_ass_heffy_762_ba_akmsu.override[ext_id] = {a_obj = "a_ns_akmsu", unit="units/mods/weapons/wpn_fps_ass_heffy_762_akmsu_pts/wpn_fps_ass_heffy_762_fh_akmsu"}
		self.parts.wpn_fps_ass_heffy_762_ba_m92.override[ext_id]   = {a_obj = "a_ns_akmsu", unit="units/mods/weapons/wpn_fps_ass_heffy_762_m92_pts/wpn_fps_ass_heffy_762_fh_m92"}
		self.parts.wpn_fps_ass_heffy_762_ba_ak104.override[ext_id] = {a_obj = "a_ns_ak104", unit="units/mods/weapons/wpn_fps_ass_heffy_762_ak104_pts/wpn_fps_ass_heffy_762_fh_ak104"}
		self.parts.wpn_fps_ass_heffy_762_ba_rk62.override[ext_id]  = {a_obj = "a_ns_rk62", unit="units/mods/weapons/wpn_fps_ass_heffy_762_rk62_pts/wpn_fps_ass_heffy_762_fh_rk62"}
		self.parts.wpn_fps_ass_heffy_762_ba_md90.override[ext_id]  = {a_obj = "a_ns_md90", unit="units/mods/weapons/wpn_fps_ass_heffy_762_md90_pts/wpn_fps_ass_heffy_762_fh_md90"}
		self.parts.wpn_fps_ass_heffy_762_ba_amd65.override[ext_id]  = {a_obj = "a_ns_amd65", unit="units/mods/weapons/wpn_fps_ass_heffy_762_ak47_pts/wpn_fps_ass_heffy_762_fh_ak47"}
		self.parts.wpn_fps_ass_heffy_762_ba_rpk.override[ext_id]  = {a_obj = "a_ns_rpk", unit="units/mods/weapons/wpn_fps_ass_heffy_762_ak47_pts/wpn_fps_ass_heffy_762_fh_ak47"}
	else
		self.parts.wpn_fps_ass_heffy_762_ba_ak104.override[ext_id]	= {a_obj = "a_ns_ak104"}
		self.parts.wpn_fps_ass_heffy_762_ba_akmsu.override[ext_id] 	= {a_obj = "a_ns_akmsu"}
		self.parts.wpn_fps_ass_heffy_762_ba_m92.override[ext_id] 	= {a_obj = "a_ns_akmsu"}
		self.parts.wpn_fps_ass_heffy_762_ba_md90.override[ext_id] 	= {a_obj = "a_ns_md90"}
		self.parts.wpn_fps_ass_heffy_762_ba_rk62.override[ext_id] 	= {a_obj = "a_ns_rk62"}
		self.parts.wpn_fps_ass_heffy_762_ba_rpk.override[ext_id] 	= {a_obj = "a_ns_rpk"}
		self.parts.wpn_fps_ass_heffy_762_ba_tabuk.override[ext_id] 	= {a_obj = "a_ns_tabuk"}
		self.parts.wpn_fps_ass_heffy_762_ba_vepr.override[ext_id] 	= {a_obj = "a_ns_vepr"}
		self.parts.wpn_fps_ass_heffy_762_ba_amd65.override[ext_id] 	= {a_obj = "a_ns_amd65"}
	end
end
-- Other length barrel Front Sight overrides --
for i, fo_id in ipairs(all_ak47fo) do
	self.parts.wpn_fps_ass_heffy_762_ba_ak104.override[fo_id] = {a_obj = "a_fo_ak104"}
	self.parts.wpn_fps_ass_heffy_762_ba_akmsu.override[fo_id] = {a_obj = "a_fo_akmsu"}
	self.parts.wpn_fps_ass_heffy_762_ba_m92.override[fo_id]   = {a_obj = "a_fo_akmsu"}
	self.parts.wpn_fps_ass_heffy_762_ba_rk62.override[fo_id]  = {a_obj = "a_fo_rk62"}
	self.parts.wpn_fps_ass_heffy_762_ba_rpk.override[fo_id]   = {a_obj = "a_fo_rpk"}
	self.parts.wpn_fps_ass_heffy_762_ba_tabuk.override[fo_id] = {a_obj = "a_fo_tabuk"}
	self.parts.wpn_fps_ass_heffy_762_ba_vepr.override[fo_id]  = {a_obj = "a_fo_vepr"}
	self.parts.wpn_fps_ass_heffy_762_ba_amd65.override[fo_id] = {a_obj = "a_fo_amd65"}
	self.parts.wpn_fps_ass_heffy_762_ba_md90.override[fo_id]  = {unit  = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"}
end

--- Fore Grip ---
-- Default length fg barrel position override --
for i, fg_id in ipairs(ak47foregrip) do
	self:akpack_check_override( "part", fg_id )
	for i, ba_id in ipairs(ak47barrel) do
		self.parts[fg_id].override[ba_id] = {}
	end
end
-- Barrel position override by lfgs --
self:akpack_check_override( "part", "wpn_fps_ass_heffy_762_lfg_m70" )
for i, ba_id in ipairs(all_ak47barrel) do
	self.parts.wpn_fps_ass_heffy_762_lfg_m70.override[ba_id]   = {a_obj = "a_b_m70"}
	self.parts.wpn_fps_ass_heffy_762_lfg_m70.override[ba_id].override   = self.parts.wpn_fps_ass_heffy_762_lfg_m70.override[ba_id].override or {}
end
-- Front sight overrides by lfgs --
for i, ba_id in ipairs(ak47barrel) do
	for i, fo_id in ipairs(all_ak47fo) do
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override[ba_id].override[fo_id]   = {a_obj = "a_fo_m70_std"}
	end
end
for i, fo_id in ipairs(all_ak47fo) do
	self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_rpk.override[fo_id] 	 = {a_obj = "a_fo_m70_rpk"}
	self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_tabuk.override[fo_id] = {a_obj = "a_fo_m70_tabuk"}
	self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_akmsu.override[fo_id] = {a_obj = "a_fo_m70_akmsu"}
	self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_m92.override[fo_id] 	 = {a_obj = "a_fo_m70_m92"}
	self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_ak104.override[fo_id] = {a_obj = "a_fo_m70_ak104"}
	self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_rk62.override[fo_id]  = {a_obj = "a_fo_m70_rk62"}
	self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_md90.override[fo_id]  = {a_obj = "a_fo_m70_md90"}
	self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_vepr.override[fo_id]  = {a_obj = "a_fo_m70_vepr"}
	self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_amd65.override[fo_id] = {a_obj = "a_fo_m70_amd65"}
end
-- Barrel Extensions position override by lfgs --
for i, ba_id in ipairs(ak47barrel) do
	for i, ext_id in ipairs(all_ak47ext) do
		if ext_id ~= "wpn_fps_ass_heffy_762_fh_dummy" then
			self.parts.wpn_fps_ass_heffy_762_lfg_m70.override[ba_id].override[ext_id] = {a_obj = "a_ns_m70_std"}
		end
	end
end
self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_akm.override.wpn_fps_ass_heffy_762_fh_dummy 	 = {a_obj = "a_ns_m70_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_akm_pts/wpn_fps_ass_heffy_762_fh_akm"}
self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_t56.override.wpn_fps_ass_heffy_762_fh_dummy 	 = {a_obj = "a_ns_m70_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_t56_pts/wpn_fps_ass_heffy_762_fh_t56"}
self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_amd63.override.wpn_fps_ass_heffy_762_fh_dummy = {a_obj = "a_ns_m70_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_ak47_pts/wpn_fps_ass_heffy_762_fh_ak47"}
self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_ak47.override.wpn_fps_ass_heffy_762_fh_dummy = {a_obj = "a_ns_m70_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_ak47_pts/wpn_fps_ass_heffy_762_fh_ak47"}
self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_ak109.override.wpn_fps_ass_heffy_762_fh_dummy = {a_obj = "a_ns_m70_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_ak103_pts/wpn_fps_ass_heffy_762_fh_ak103"}

for i, ext_id in ipairs(all_ak47ext) do
	if ext_id == "wpn_fps_ass_heffy_762_fh_dummy" then
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_tabuk.override[ext_id] = {a_obj = "a_ns_m70_tabuk", unit="units/mods/weapons/wpn_fps_ass_heffy_762_tabuk_pts/wpn_fps_ass_heffy_762_fh_tabuk"}
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_akmsu.override[ext_id] = {a_obj = "a_ns_m70_akmsu", unit="units/mods/weapons/wpn_fps_ass_heffy_762_akmsu_pts/wpn_fps_ass_heffy_762_fh_akmsu"}
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_m92.override[ext_id]   = {a_obj = "a_ns_m70_m92", unit="units/mods/weapons/wpn_fps_ass_heffy_762_m92_pts/wpn_fps_ass_heffy_762_fh_m92"}
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_ak104.override[ext_id] = {a_obj = "a_ns_m70_ak104", unit="units/mods/weapons/wpn_fps_ass_heffy_762_ak104_pts/wpn_fps_ass_heffy_762_fh_ak104"}
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_rk62.override[ext_id]  = {a_obj = "a_ns_m70_rk62", unit="units/mods/weapons/wpn_fps_ass_heffy_762_rk62_pts/wpn_fps_ass_heffy_762_fh_rk62"}
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_md90.override[ext_id]  = {a_obj = "a_ns_m70_md90", unit="units/mods/weapons/wpn_fps_ass_heffy_762_md90_pts/wpn_fps_ass_heffy_762_fh_md90"}
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_rpk.override[ext_id]   = {a_obj = "a_ns_m70_rpk", unit="units/mods/weapons/wpn_fps_ass_heffy_762_ak47_pts/wpn_fps_ass_heffy_762_fh_ak47"}
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_amd65.override[ext_id] = {a_obj = "a_ns_m70_amd65", unit="units/mods/weapons/wpn_fps_ass_heffy_762_ak47_pts/wpn_fps_ass_heffy_762_fh_ak47"}
	else
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_rpk.override[ext_id]   = {a_obj = "a_ns_m70_rpk"}
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_tabuk.override[ext_id] = {a_obj = "a_ns_m70_tabuk"}
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_akmsu.override[ext_id] = {a_obj = "a_ns_m70_akmsu"}
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_m92.override[ext_id]   = {a_obj = "a_ns_m70_m92"}
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_ak104.override[ext_id] = {a_obj = "a_ns_m70_ak104"}
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_rk62.override[ext_id]  = {a_obj = "a_ns_m70_rk62"}
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_md90.override[ext_id]  = {a_obj = "a_ns_m70_md90"}
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_vepr.override[ext_id]  = {a_obj = "a_ns_m70_vepr"}
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_amd65.override[ext_id] = {a_obj = "a_ns_m70_amd65"}
	end
end
--- Receiver aka Lower ---
self:akpack_check_override( "part", "wpn_fps_ass_heffy_762_lr_akm" )
self:akpack_check_override( "part", "wpn_fps_ass_heffy_762_lr_ak103" )
self:akpack_check_override( "part", "wpn_fps_ass_heffy_762_lr_ak47" )
self:akpack_check_override( "part", "wpn_fps_ass_heffy_762_lr_akmsu" )
self:akpack_check_override( "part", "wpn_fps_ass_heffy_762_lr_m92" )
--Stock overrides--
for i, st_id in ipairs(akmstock) do
	self.parts.wpn_fps_ass_heffy_762_lr_ak47.override[st_id]  = {a_obj = "a_s_ak47"}
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[st_id] = {a_obj = "a_s_akmsu"}
	self.parts.wpn_fps_ass_heffy_762_lr_m92.override[st_id]   = {a_obj = "a_s_akmsu"}
	if st_id ~= "wpn_fps_ass_heffy_762_st_ak103" then
		self.parts.wpn_fps_ass_heffy_762_lr_ak103.override[st_id] = {a_obj = "a_s_akmsu"}
	end
end
--Stock Pad overrides--
for i, lr_id in ipairs(all_ak47lower) do
	for i, st_id in ipairs(akmstock) do
		self.parts[lr_id].override[st_id] = self.parts[lr_id].override[st_id] or {}
		self.parts[lr_id].override[st_id].override = self.parts[lr_id].override[st_id].override or {}
	end
end
for i, lr_id in ipairs(all_ak47lower) do
	self.parts[lr_id].override.wpn_fps_ass_heffy_762_st_ak47 = self.parts[lr_id].override.wpn_fps_ass_heffy_762_st_ak47 or {}
	self.parts[lr_id].override.wpn_fps_ass_heffy_762_st_ak47.override = self.parts[lr_id].override.wpn_fps_ass_heffy_762_st_ak47.override or {}
end
for i, st_id in ipairs(akmstock) do
	for i, sp_id in ipairs(akmstockpad) do
		self.parts.wpn_fps_ass_heffy_762_lr_ak47.override[st_id].override[sp_id]  = {a_obj = "a_s_ak47"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[st_id].override[sp_id] = {a_obj = "a_s_akmsu"}
		self.parts.wpn_fps_ass_heffy_762_lr_ak103.override[st_id].override[sp_id] = {a_obj = "a_s_akmsu"}
		self.parts.wpn_fps_ass_heffy_762_lr_m92.override[st_id].override[sp_id]   = {a_obj = "a_s_akmsu"}
	end
end
-- Barrel position override by lrs --
for i, ba_id in ipairs(all_ak47barrel) do
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[ba_id] = {a_obj = "a_b_akmsu"}	
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[ba_id].override = self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[ba_id].override or {}
--	self.parts.wpn_fps_ass_heffy_762_lr_m92.override[ba_id] = {a_obj = "a_b_m92"}	
--	self.parts.wpn_fps_ass_heffy_762_lr_m92.override[ba_id].override = self.parts.wpn_fps_ass_heffy_762_lr_m92.override[ba_id].override or {}
end
-- Front sight overrides by lrs --
for i, ba_id in ipairs(ak47barrel) do
	for i, fo_id in ipairs(all_ak47fo) do
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[ba_id].override[fo_id] = {a_obj = "a_fo_akmsu_std"}
--		self.parts.wpn_fps_ass_heffy_762_lr_m92.override[ba_id].override[fo_id]   = {a_obj = "a_fo_m92_std"}
	end
end
for i, fo_id in ipairs(all_ak47fo) do
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_rpk.override[fo_id]   = {a_obj = "a_fo_akmsu_rpk"}
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_tabuk.override[fo_id] = {a_obj = "a_fo_akmsu_tabuk"}
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_akmsu.override[fo_id] = {a_obj = "a_fo_akmsu_akmsu"}
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_m92.override[fo_id]   = {a_obj = "a_fo_akmsu_m92"}
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_ak104.override[fo_id] = {a_obj = "a_fo_akmsu_ak104"}
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_rk62.override[fo_id]  = {a_obj = "a_fo_akmsu_rk62"}
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_md90.override[fo_id]  = {a_obj = "a_fo_akmsu_md90"}
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_vepr.override[fo_id]  = {a_obj = "a_fo_akmsu_vepr"}
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_amd65.override[fo_id] = {a_obj = "a_fo_akmsu_amd65"}
end
-- Barrel Extensions position override by lrs --
for i, ba_id in ipairs(ak47barrel) do
	for i, ext_id in ipairs(all_ak47ext) do
		if ext_id ~= "wpn_fps_ass_heffy_762_fh_dummy" then
			self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[ba_id].override[ext_id] = {a_obj = "a_ns_akmsu_std"}
--			self.parts.wpn_fps_ass_heffy_762_lr_m92.override[ba_id].override[ext_id]   = {a_obj = "a_ns_m92_std"}
		end
	end
end
self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_akm.override.wpn_fps_ass_heffy_762_fh_dummy   = {a_obj = "a_ns_akmsu_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_akm_pts/wpn_fps_ass_heffy_762_fh_akm"}
self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_t56.override.wpn_fps_ass_heffy_762_fh_dummy   = {a_obj = "a_ns_akmsu_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_t56_pts/wpn_fps_ass_heffy_762_fh_t56"}
self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_amd63.override.wpn_fps_ass_heffy_762_fh_dummy = {a_obj = "a_ns_akmsu_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_ak47_pts/wpn_fps_ass_heffy_762_fh_ak47"}
self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_ak109.override.wpn_fps_ass_heffy_762_fh_dummy = {a_obj = "a_ns_akmsu_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_ak103_pts/wpn_fps_ass_heffy_762_fh_ak103"}
--self.parts.wpn_fps_ass_heffy_762_lr_m92.override.wpn_fps_ass_heffy_762_ba_akm.override.wpn_fps_ass_heffy_762_fh_dummy   = {a_obj = "a_ns_akmsu_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_akm_pts/wpn_fps_ass_heffy_762_fh_akm"}
--self.parts.wpn_fps_ass_heffy_762_lr_m92.override.wpn_fps_ass_heffy_762_ba_t56.override.wpn_fps_ass_heffy_762_fh_dummy   = {a_obj = "a_ns_akmsu_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_t56_pts/wpn_fps_ass_heffy_762_fh_t56"}
--self.parts.wpn_fps_ass_heffy_762_lr_m92.override.wpn_fps_ass_heffy_762_ba_amd63.override.wpn_fps_ass_heffy_762_fh_dummy = {a_obj = "a_ns_akmsu_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_amd63_pts/wpn_fps_ass_heffy_762_fh_amd63"}

for i, ext_id in ipairs(all_ak47ext) do
	if ext_id == "wpn_fps_ass_heffy_762_fh_dummy" then
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_tabuk.override[ext_id] = {a_obj = "a_ns_akmsu_tabuk", unit="units/mods/weapons/wpn_fps_ass_heffy_762_tabuk_pts/wpn_fps_ass_heffy_762_fh_tabuk"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_akmsu.override[ext_id] = {a_obj = "a_ns_akmsu_akmsu", unit="units/mods/weapons/wpn_fps_ass_heffy_762_akmsu_pts/wpn_fps_ass_heffy_762_fh_akmsu"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_m92.override[ext_id]   = {a_obj = "a_ns_akmsu_m92", unit="units/mods/weapons/wpn_fps_ass_heffy_762_m92_pts/wpn_fps_ass_heffy_762_fh_m92"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_ak104.override[ext_id] = {a_obj = "a_ns_akmsu_ak104", unit="units/mods/weapons/wpn_fps_ass_heffy_762_ak104_pts/wpn_fps_ass_heffy_762_fh_ak104"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_rk62.override[ext_id]  = {a_obj = "a_ns_akmsu_rk62", unit="units/mods/weapons/wpn_fps_ass_heffy_762_rk62_pts/wpn_fps_ass_heffy_762_fh_rk62"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_md90.override[ext_id]  = {a_obj = "a_ns_akmsu_md90", unit="units/mods/weapons/wpn_fps_ass_heffy_762_md90_pts/wpn_fps_ass_heffy_762_fh_md90"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_rpk.override[ext_id]   = {a_obj = "a_ns_akmsu_rpk", unit="units/mods/weapons/wpn_fps_ass_heffy_762_ak47_pts/wpn_fps_ass_heffy_762_fh_ak47"}
	else
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_rpk.override[ext_id]   = {a_obj = "a_ns_akmsu_rpk"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_tabuk.override[ext_id] = {a_obj = "a_ns_akmsu_tabuk"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_akmsu.override[ext_id] = {a_obj = "a_ns_akmsu_akmsu"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_m92.override[ext_id]   = {a_obj = "a_ns_akmsu_m92"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_ak104.override[ext_id] = {a_obj = "a_ns_akmsu_ak104"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_rk62.override[ext_id]  = {a_obj = "a_ns_akmsu_rk62"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_md90.override[ext_id]  = {a_obj = "a_ns_akmsu_md90"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_vepr.override[ext_id]  = {a_obj = "a_ns_akmsu_vepr"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_amd65.override[ext_id] = {a_obj = "a_ns_akmsu_amd65"}
	end
end
--self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_lfg_ak47 = {unit="units/mods/weapons/wpn_fps_ass_heffy_762_akmsu_pts/wpn_fps_ass_heffy_762_lfg_akmsu"}

-- Barrel Override --
self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_ak109 = {override = {wpn_fps_ass_heffy_762_ro_ak47 = {a_obj="a_ro_ak109_akmsu"}}}
--- Magazines ---
self.parts.wpn_fps_ass_heffy_762_m_steel_75.weapon_reload_override 	 = {bm_w_heffy_762 = "tecci"}

----------------------------------------
----<A><K><4><7> -Adds- <A><K><4><7>----
----------------------------------------
--- Gun ---
self:akpack_check_adds( "wpn", "wpn_fps_ass_heffy_762" )
for i, o_id in ipairs(all_ak47sight) do
	self.wpn_fps_ass_heffy_762.adds[o_id] = {"wpn_fps_upg_o_ak47_scopemount"}
end
	
-------------------------------------------
----<A><K><4><7> -Forbids- <A><K><4><7>----
-------------------------------------------

--- Pistol grips ---
-- AKM grips forbids --
for i, g_id in ipairs(akmgrips) do
	self:akpack_setup_forbid( g_id, "wpn_fps_ass_heffy_762_st_vepr" )
end
for i, lfg_id in ipairs(all_ak47lowerforegrip) do
	if lfg_id ~= "wpn_fps_ass_heffy_762_lfg_ak47" then
		self:akpack_setup_forbid( lfg_id, "wpn_fps_ass_heffy_762_ba_vepr" )
	end
end

------------------------------------------
----<A><K><4><7> -Stance- <A><K><4><7>----
------------------------------------------

--- Stance overrides by barrels ---
self.parts.wpn_fps_ass_heffy_762_ba_akmsu.weapon_stance_override = {bm_w_heffy_762 = "akmsu_ads"}
self.parts.wpn_fps_ass_heffy_762_ba_m92.weapon_stance_override   = {bm_w_heffy_762 = "akmsu_ads"}

--- Vanilla sights ---
-- non-acoc, default sights --
for i, o_id in ipairs(nonacog_aksight) do
	self.parts[o_id].stance_mod.wpn_fps_ass_heffy_762 = {translation = Vector3(0, 7, -3.7)}
end
-- other sights --
self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_heffy_762 			   = deep_clone(self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_flint)
self.parts.wpn_fps_upg_o_45rds.stance_mod.wpn_fps_ass_heffy_762 		   = deep_clone(self.parts.wpn_fps_upg_o_45rds.stance_mod.wpn_fps_ass_flint)
self.parts.wpn_fps_upg_o_xpsg33_magnifier.stance_mod.wpn_fps_ass_heffy_762 = deep_clone(self.parts.wpn_fps_upg_o_xpsg33_magnifier.stance_mod.wpn_fps_ass_flint)
self.parts.wpn_fps_upg_o_45rds_v2.stance_mod.wpn_fps_ass_heffy_762 		   = deep_clone(self.parts.wpn_fps_upg_o_45rds_v2.stance_mod.wpn_fps_ass_flint)

-----------------------------------------------
----<A><K><4><7> -Underbarrel- <A><K><4><7>----
-----------------------------------------------

------------------------------------------
----<A><K><4><7> -Tweaks- <A><K><4><7>----
------------------------------------------

--- Barrel Extensions ---
self.parts.wpn_fps_ass_heffy_762_fh_dummy.pcs = nil

---------------------------------------
----<A><K><4><7> -WIP- <A><K><4><7>----
---------------------------------------

---- Override ----


--- Gadget positions ---
--[[ 
for i, part_id in ipairs(all_ak47fl) do
	self.parts.wpn_fps_ass_heffy_762_flp_<insert_flashlight_position_name>.override[part_id] = {a_obj = "a_fl_ak47"}
end
--]]

------------------------------------------------------
----<A><K><4><7> -Other modules code- <A><K><4><7>----
------------------------------------------------------

if self.wpn_fps_ass_heffy_545 then
local ak74parts = {
    "wpn_fps_ass_heffy_545_lfg_ak74",
    "wpn_fps_ass_heffy_545_ufg_ak74",
    "wpn_fps_ass_heffy_545_pg_ak74",
    "wpn_fps_ass_heffy_545_st_ak74",
    "wpn_fps_ass_heffy_545_lfg_rpk74",
    "wpn_fps_ass_heffy_545_ufg_rpk74",
    "wpn_fps_ass_heffy_545_st_rpk74",
    "wpn_fps_ass_heffy_545_lfg_mpi",
    "wpn_fps_ass_heffy_545_ufg_mpi",
    "wpn_fps_ass_heffy_545_pg_mpi",
    "wpn_fps_ass_heffy_545_st_mpi",
    "wpn_fps_ass_heffy_545_stp_ak74",
    "wpn_fps_ass_heffy_545_stp_ak74_2",
    "wpn_fps_ass_heffy_545_ufg_tantal"
}
    for i, part_id in ipairs(ak74parts) do
        if self.parts[part_id].pcs then
			table.insert(self.wpn_fps_ass_heffy_762.uses_parts, part_id)
		end
    end
	--Stock overrides--
	self:akpack_check_adds( "wpn", "wpn_fps_ass_heffy_762" )
	for i, st_id in ipairs(ak74parts) do
		if self.parts[st_id].type == "stock" or self.parts[st_id].type == "stock_part" then
			self.parts.wpn_fps_ass_heffy_762_lr_ak47.override[st_id]  = {a_obj = "a_s_ak47"}
			self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[st_id] = {a_obj = "a_s_akmsu"}
			self.parts.wpn_fps_ass_heffy_762_lr_m92.override[st_id]   = {a_obj = "a_s_akmsu"}
			self.parts.wpn_fps_ass_heffy_762_lr_ak103.override[st_id] = {a_obj = "a_s_akmsu"}
			-- Fuck off payday why does nothing FUCKING WORK
			--if self.parts[st_id].type == "stock" then
			--	self.wpn_fps_ass_heffy_762.adds[st_id] = {"wpn_fps_ass_heffy_545_stp_ak74"}
			--	self:akpack_check_override( "part", st_id )
			--	self.parts[st_id].override.wpn_fps_ass_heffy_762_sp_ak47 = {unit="units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"}
			--end
			-- stupid bullshit "solution"
			self:akpack_setup_forbid( "wpn_fps_ass_heffy_762_lr_ak47", st_id)
		end
	end
	--self:ak762_copy_part("wpn_fps_ass_heffy_545_lfg_ak74", "wpn_fps_ass_heffy_762_lfg_ak74")
	--[[
	self.parts.wpn_fps_ass_heffy_762_lfg_ak74 = deep_clone(self.parts.wpn_fps_ass_heffy_545_lfg_ak74)
	self.parts.wpn_fps_ass_heffy_762_lfg_ak74.pcs = {}
	self.parts.wpn_fps_ass_heffy_762_lfg_ak74.is_a_unlockable = true
	table.insert(self.wpn_fps_ass_heffy_762.uses_parts, "wpn_fps_ass_heffy_762_lfg_ak74")
	--]]
end







end )

Hooks:PostHook( WeaponFactoryTweakData, "_init_cc_material_config", "AK47ModInit_cc_material_config", function(self)
local parts = self.parts
----------------------------------------------------
----<A><K><4><7> -Matconfig_Arrays- <A><K><4><7>----
----------------------------------------------------

local ak47_body = {
	"wpn_fps_ass_heffy_762_ba_ak47",
	"wpn_fps_ass_heffy_762_ch_ak47",
	"wpn_fps_ass_heffy_762_sp_ak47",
	"wpn_fps_ass_heffy_762_ufgc_ak47",
	"wpn_fps_ass_heffy_762_ur_ak47",
	"wpn_fps_ass_heffy_762_fgc_ak47",
	"wpn_fps_ass_heffy_762_fh_ak47",
	"wpn_fps_ass_heffy_762_lfgc_ak47",
	"wpn_fps_ass_heffy_762_lr_ak47"
}

--------------------------------------------------------
----<A><K><4><7> -Matconfig_Definition- <A><K><4><7>----
--------------------------------------------------------

--- AK47 ---
-- Body --
for i, part_id in ipairs(ak47_body) do
	if parts[part_id] then
		parts[part_id].material_config = Idstring("units/mods/weapons/wpn_fps_ass_heffy_762_ak47_pts/ak47_body")
		parts[part_id].thq_material_config = Idstring("units/mods/weapons/wpn_fps_ass_heffy_762_ak47_pts/ak47_body_thq")
	else
		log("AK47_ERROR: (mat_config)Attempt to index Part ID: '" .. part_id .. "' (a nil value)")	
	end
end
--parts.wpn_fps_ass_heffy_762_st_ak47.material_config = Idstring("units/mods/weapons/wpn_fps_ass_heffy_762_ak47_pts/ak47_stock")
--parts.wpn_fps_ass_heffy_762_st_ak47.thq_material_config = Idstring("units/mods/weapons/wpn_fps_ass_heffy_762_ak47_pts/ak47_stock_thq")
end)
