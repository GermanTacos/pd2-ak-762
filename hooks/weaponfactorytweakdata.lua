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
		if not self.parts[mod_one].forbids then
			self.parts[mod_one].forbids = {}
		end
		table.insert(self.parts[mod_one].forbids, mod_two)
	end

	if self.parts[mod_two] and self.parts[mod_one] then
		if not self.parts[mod_two].forbids then
			self.parts[mod_two].forbids = {}
		end
		table.insert(self.parts[mod_two].forbids, mod_one)
	end
end

--- Override Base ---
function WeaponFactoryTweakData:akpack_check_override( mod_type, mod_woa ) 
	if mod_type == "wpn" then
		if self[mod_woa] then
			self[mod_woa].override = self[mod_woa].override or {}
		end
	elseif mod_type == "part" then
		if self.parts[mod_woa] then
			self.parts[mod_woa].override = self.parts[mod_woa].override or {}
		end
	end
end

--- Adds Base ---
function WeaponFactoryTweakData:akpack_check_adds( mod_type, mod_woa ) 
	if mod_type == "wpn" then
		if self[mod_woa] then
			self[mod_woa].adds = self[mod_woa].adds or {}
		end
	elseif mod_type == "part" then
		if self.parts[mod_woa] then
			self.parts[mod_woa].adds = self.parts[mod_woa].adds or {}
		end
	end
end

Hooks:PostHook( WeaponFactoryTweakData, "init", "AK47ModInit", function(self)

------------------------------------------
----<A><K><4><7> -Arrays- <A><K><4><7>----
------------------------------------------

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
	"wpn_fps_ass_heffy_762_ba_amd63"
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
	"wpn_fps_ass_heffy_762_ba_rk62"
}

--- Front Sights ---
local all_ak47fo = {
	"wpn_fps_ass_heffy_762_fo_akm",
	"wpn_fps_ass_heffy_762_fo_blops",
	"wpn_fps_ass_heffy_762_fo_ins"
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
self.parts.wpn_fps_ass_heffy_762_ba_amd63.override.wpn_fps_ass_heffy_762_fh_dummy = {a_obj = "a_ns", unit="units/mods/weapons/wpn_fps_ass_heffy_762_amd63_pts/wpn_fps_ass_heffy_762_fh_amd63"}


-- Other length barrel barrel extension overrides --
for i, ext_id in ipairs(all_ak47ext) do
	if ext_id == "wpn_fps_ass_heffy_762_fh_dummy" then
		self.parts.wpn_fps_ass_heffy_762_ba_tabuk.override[ext_id] = {a_obj = "a_ns_tabuk", unit="units/mods/weapons/wpn_fps_ass_heffy_762_tabuk_pts/wpn_fps_ass_heffy_762_fh_tabuk"}
		self.parts.wpn_fps_ass_heffy_762_ba_akmsu.override[ext_id] = {a_obj = "a_ns_akmsu", unit="units/mods/weapons/wpn_fps_ass_heffy_762_akmsu_pts/wpn_fps_ass_heffy_762_fh_akmsu"}
		self.parts.wpn_fps_ass_heffy_762_ba_m92.override[ext_id]   = {a_obj = "a_ns_akmsu", unit="units/mods/weapons/wpn_fps_ass_heffy_762_m92_pts/wpn_fps_ass_heffy_762_fh_m92"}
		self.parts.wpn_fps_ass_heffy_762_ba_ak104.override[ext_id] = {a_obj = "a_ns_ak104", unit="units/mods/weapons/wpn_fps_ass_heffy_762_ak104_pts/wpn_fps_ass_heffy_762_fh_ak104"}
		self.parts.wpn_fps_ass_heffy_762_ba_rk62.override[ext_id]  = {a_obj = "a_ns_rk62", unit="units/mods/weapons/wpn_fps_ass_heffy_762_rk62_pts/wpn_fps_ass_heffy_762_fh_rk62"}
		self.parts.wpn_fps_ass_heffy_762_ba_md90.override[ext_id]  = {a_obj = "a_ns_md90", unit="units/mods/weapons/wpn_fps_ass_heffy_762_md90_pts/wpn_fps_ass_heffy_762_fh_md90"}
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
self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_amd63.override.wpn_fps_ass_heffy_762_fh_dummy = {a_obj = "a_ns_m70_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_amd63_pts/wpn_fps_ass_heffy_762_fh_amd63"}

for i, ext_id in ipairs(all_ak47ext) do
	if ext_id == "wpn_fps_ass_heffy_762_fh_dummy" then
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_tabuk.override[ext_id] = {a_obj = "a_ns_m70_tabuk", unit="units/mods/weapons/wpn_fps_ass_heffy_762_tabuk_pts/wpn_fps_ass_heffy_762_fh_tabuk"}
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_akmsu.override[ext_id] = {a_obj = "a_ns_m70_akmsu", unit="units/mods/weapons/wpn_fps_ass_heffy_762_akmsu_pts/wpn_fps_ass_heffy_762_fh_akmsu"}
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_m92.override[ext_id]   = {a_obj = "a_ns_m70_m92", unit="units/mods/weapons/wpn_fps_ass_heffy_762_m92_pts/wpn_fps_ass_heffy_762_fh_m92"}
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_ak104.override[ext_id] = {a_obj = "a_ns_m70_ak104", unit="units/mods/weapons/wpn_fps_ass_heffy_762_ak104_pts/wpn_fps_ass_heffy_762_fh_ak104"}
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_rk62.override[ext_id]  = {a_obj = "a_ns_m70_rk62", unit="units/mods/weapons/wpn_fps_ass_heffy_762_rk62_pts/wpn_fps_ass_heffy_762_fh_rk62"}
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_md90.override[ext_id]  = {a_obj = "a_ns_m70_md90", unit="units/mods/weapons/wpn_fps_ass_heffy_762_md90_pts/wpn_fps_ass_heffy_762_fh_md90"}
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
--Stock overrides--
for i, st_id in ipairs(akmstock) do
	self.parts.wpn_fps_ass_heffy_762_lr_ak47.override[st_id]  = {a_obj = "a_s_ak47"}
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[st_id] = {a_obj = "a_s_akmsu"}
	if st_id ~= "wpn_fps_ass_heffy_762_st_ak103" then
		self.parts.wpn_fps_ass_heffy_762_lr_ak103.override[st_id] = {a_obj = "a_s_akmsu"}
	end
end
--Stock Pad overrides--
for i, sp_id in ipairs(akmstockpad) do
	self.parts.wpn_fps_ass_heffy_762_lr_ak47.override[sp_id]  = {a_obj = "a_s_ak47"}
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[sp_id] = {a_obj = "a_s_akmsu"}
	self.parts.wpn_fps_ass_heffy_762_lr_ak103.override[sp_id] = {a_obj = "a_s_akmsu"}
end

-- Barrel position override by lrs --
for i, ba_id in ipairs(all_ak47barrel) do
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[ba_id] = {a_obj = "a_b_akmsu"}	
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[ba_id].override = self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[ba_id].override or {}
end
-- Front sight overrides by lrs --
for i, ba_id in ipairs(ak47barrel) do
	for i, fo_id in ipairs(all_ak47fo) do
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[ba_id].override[fo_id] = {a_obj = "a_fo_akmsu_std"}
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
		end
	end
end
self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_akm.override.wpn_fps_ass_heffy_762_fh_dummy   = {a_obj = "a_ns_akmsu_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_akm_pts/wpn_fps_ass_heffy_762_fh_akm"}
self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_t56.override.wpn_fps_ass_heffy_762_fh_dummy   = {a_obj = "a_ns_akmsu_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_t56_pts/wpn_fps_ass_heffy_762_fh_t56"}
self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_amd63.override.wpn_fps_ass_heffy_762_fh_dummy = {a_obj = "a_ns_akmsu_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_amd63_pts/wpn_fps_ass_heffy_762_fh_amd63"}

for i, ext_id in ipairs(all_ak47ext) do
	if ext_id == "wpn_fps_ass_heffy_762_fh_dummy" then
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_tabuk.override[ext_id] = {a_obj = "a_ns_akmsu_tabuk", unit="units/mods/weapons/wpn_fps_ass_heffy_762_tabuk_pts/wpn_fps_ass_heffy_762_fh_tabuk"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_akmsu.override[ext_id] = {a_obj = "a_ns_akmsu_akmsu", unit="units/mods/weapons/wpn_fps_ass_heffy_762_akmsu_pts/wpn_fps_ass_heffy_762_fh_akmsu"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_m92.override[ext_id]   = {a_obj = "a_ns_akmsu_m92", unit="units/mods/weapons/wpn_fps_ass_heffy_762_m92_pts/wpn_fps_ass_heffy_762_fh_m92"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_ak104.override[ext_id] = {a_obj = "a_ns_akmsu_ak104", unit="units/mods/weapons/wpn_fps_ass_heffy_762_ak104_pts/wpn_fps_ass_heffy_762_fh_ak104"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_rk62.override[ext_id]  = {a_obj = "a_ns_akmsu_rk62", unit="units/mods/weapons/wpn_fps_ass_heffy_762_rk62_pts/wpn_fps_ass_heffy_762_fh_rk62"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_md90.override[ext_id]  = {a_obj = "a_ns_akmsu_md90", unit="units/mods/weapons/wpn_fps_ass_heffy_762_md90_pts/wpn_fps_ass_heffy_762_fh_md90"}
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

--- GP25 ---
if BeardLib.Utils:FindMod("Custom underbarrels for custom weapons") then
	self:cufcw_setup_underbarrel( 
		"wpn_fps_ass_heffy_762",
		"bm_w_heffy_762",
		"wpn_fps_ass_heffy_762_gl_gl25",
		"bm_w_contraband_m203",
		"units/mods/weapons/wpn_fps_ass_heffy_762_shared_pts/wpn_fps_ass_heffy_762_gl_gl25",
		"units/mods/weapons/wpn_fps_ass_heffy_762_shared_pts/wpn_fps_ass_heffy_762_gl_gl25",
		"gl25_gl",
		{
			translation = Vector3(-1.05, 0, -12.67),
			rotation = Rotation(0, 0, -45)
		}
	)
else
	self:akpack_check_override( "part", "wpn_fps_ass_heffy_762_gl_gl25" )

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
	self.parts.wpn_fps_ass_heffy_762_gl_gl25.override.wpn_fps_upg_o_45rds = {
		stance_mod = {
			wpn_fps_ass_heffy_762 = {
				translation = Vector3(-1.05, 0, -12.67),
				rotation = Rotation(0, 0, -45)
			}
		}
	}
	self.parts.wpn_fps_ass_heffy_762_gl_gl25.override.wpn_fps_upg_o_45rds_v2 = {
		stance_mod = {
			wpn_fps_ass_heffy_762 = {
				translation = Vector3(-1.05, 0, -12.67),
				rotation = Rotation(0, 0, -45)
			}
		}
	}
end

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
		log("(mat_config)Part ID wasn't found:" .. part_id)	
	end
end
--parts.wpn_fps_ass_heffy_762_st_ak47.material_config = Idstring("units/mods/weapons/wpn_fps_ass_heffy_762_ak47_pts/ak47_stock")
--parts.wpn_fps_ass_heffy_762_st_ak47.thq_material_config = Idstring("units/mods/weapons/wpn_fps_ass_heffy_762_ak47_pts/ak47_stock_thq")
end)
