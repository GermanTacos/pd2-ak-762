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
	"wpn_fps_ass_heffy_762_lr_rpk",
	"wpn_fps_ass_heffy_762_lr_vepr",
	"wpn_fps_ass_heffy_762_lr_ak103",
	"wpn_fps_ass_heffy_762_lr_ak47",
	"wpn_fps_ass_heffy_762_lr_akmsu",
	"wpn_fps_ass_heffy_762_lr_m92"
}
local akmlower = {
	"wpn_fps_ass_heffy_762_lr_akm",
	"wpn_fps_ass_heffy_762_lr_rpk",
	"wpn_fps_ass_heffy_762_lr_vepr"
}
local akmsulower = {
	"wpn_fps_ass_heffy_762_lr_ak103",
	"wpn_fps_ass_heffy_762_lr_akmsu",
	"wpn_fps_ass_heffy_762_lr_m92"
}

--- Stocks ---
local all_ak47stock = {
	"wpn_fps_ass_heffy_762_st_ak47",
	"wpn_fps_ass_heffy_762_st_akm",
	"wpn_fps_ass_heffy_762_st_akm_worn",
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
	"wpn_fps_ass_heffy_762_st_rk62",
	"wpn_fps_ass_heffy_762_st_none"
}
local akmstock = {
	"wpn_fps_ass_heffy_762_st_akm",
	"wpn_fps_ass_heffy_762_st_akm_worn",
	"wpn_fps_ass_heffy_762_st_akms",
	"wpn_fps_ass_heffy_762_st_rpk",
	"wpn_fps_ass_heffy_762_st_ak103",
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
	"wpn_fps_ass_heffy_762_sp_amd63",
	"wpn_fps_ass_heffy_762_str_rpk",
	"wpn_fps_ass_heffy_762_stp_rpk"
}
--- Fore Grip ---
-- Default length --
local all_ak47lowerforegrip = {
	"wpn_fps_ass_heffy_762_lfg_ak47",
	"wpn_fps_ass_heffy_762_lfg_akm",
	"wpn_fps_ass_heffy_762_lfg_akm_worn",
	"wpn_fps_ass_heffy_762_lfg_akmsu",
	"wpn_fps_ass_heffy_762_lfg_rpk",
	"wpn_fps_ass_heffy_762_lfg_ak103",
	"wpn_fps_ass_heffy_762_lfg_vepr",
	"wpn_fps_ass_heffy_762_lfg_bl_t56",
	"wpn_fps_ass_heffy_762_lfg_br_t56",
	"wpn_fps_ass_heffy_762_lfg_mpi",
	"wpn_fps_ass_heffy_762_lfg_mpi_wood",
	"wpn_fps_ass_heffy_762_lfg_amd63",
	"wpn_fps_ass_heffy_762_lfg_m70",
	"wpn_fps_ass_heffy_762_lfg_m92",
	"wpn_fps_ass_heffy_762_lfg_none"
}
local ak47foregrip = {
	"wpn_fps_ass_heffy_762_lfg_ak47",
	"wpn_fps_ass_heffy_762_lfg_akm",
	"wpn_fps_ass_heffy_762_lfg_akm_worn",
	"wpn_fps_ass_heffy_762_lfg_rpk",
	"wpn_fps_ass_heffy_762_lfg_ak103",
	"wpn_fps_ass_heffy_762_lfg_vepr",
	"wpn_fps_ass_heffy_762_lfg_bl_t56",
	"wpn_fps_ass_heffy_762_lfg_br_t56",
	"wpn_fps_ass_heffy_762_lfg_mpi",
	"wpn_fps_ass_heffy_762_lfg_mpi_wood",
	"wpn_fps_ass_heffy_762_lfg_amd63"
}
local all_ak47upperforegrip = {
	"wpn_fps_ass_heffy_762_ufg_ak47",
	"wpn_fps_ass_heffy_762_ufg_akm",
	"wpn_fps_ass_heffy_762_ufg_akm_worn",
	"wpn_fps_ass_heffy_762_ufg_akmsu",
	"wpn_fps_ass_heffy_762_ufg_rpk",
	"wpn_fps_ass_heffy_762_ufg_ak103",
	"wpn_fps_ass_heffy_762_ufg_bl_t56",
	"wpn_fps_ass_heffy_762_ufg_br_t56",
	"wpn_fps_ass_heffy_762_ufg_mpi",
	"wpn_fps_ass_heffy_762_ufg_mpi_wood",
	"wpn_fps_ass_heffy_762_ufg_m70",
	"wpn_fps_ass_heffy_762_ufg_m92",
	"wpn_fps_ass_heffy_762_ufg_none"
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
	"wpn_fps_ass_heffy_762_bap_md90",
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
local all_ak47grips = {
	"wpn_fps_ass_heffy_762_pg_ak47",
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

local all_ak47bipod = {
	"wpn_fps_ass_heffy_762_bp_rpk",
	"wpn_fps_ass_heffy_762_bp_rpk_folded"
}

self:akpack_check_override( "wpn", "wpn_fps_ass_heffy_762" )

--https://i.imgur.com/YUjAAWR.png

--- Compatibility Array Insertion ---

if self.wpn_fps_ass_heffy_545 then

	local ak74stocks = {
		"wpn_fps_ass_heffy_all_st_ak74",
		"wpn_fps_ass_heffy_545_st_rpk74",
		"wpn_fps_ass_heffy_545_st_mpi",
	}
	
	for id, part_id in pairs(ak74stocks) do
		table.insert(all_ak47stock, part_id)
		table.insert(akmstock, part_id)
	end
	
	local ak74stockparts = {
		"wpn_fps_ass_heffy_545_stp_ak74",
		"wpn_fps_ass_heffy_545_stp_ak74_2",
		"wpn_fps_ass_heffy_545_stp_rpk74",
		"wpn_fps_ass_heffy_545_str_rpk74",
		"wpn_fps_ass_heffy_545_stp_mpi",
	}
	
	for id, part_id in pairs(ak74stockparts) do
		table.insert(akmstockpad, part_id)
	end
	
	local ak74grips = {
		"wpn_fps_ass_heffy_all_pg_ak74",
		"wpn_fps_ass_heffy_545_pg_mpi",
	}
	
	for id, part_id in pairs(ak74grips) do
		table.insert(all_ak47grips, part_id)
		table.insert(akmgrips, part_id)
	end

	local ak74lfg = {
		"wpn_fps_ass_heffy_all_lfg_ak74",
		"wpn_fps_ass_heffy_545_lfg_rpk74",
		"wpn_fps_ass_heffy_545_lfg_mpi"
	}
	
	for id, part_id in pairs(ak74lfg) do
		table.insert(all_ak47lowerforegrip, part_id)
		table.insert(ak47foregrip, part_id)
	end

	local ak74ufg = {
		"wpn_fps_ass_heffy_all_ufg_ak74",
		"wpn_fps_ass_heffy_545_ufg_rpk74",
		"wpn_fps_ass_heffy_545_ufg_mpi",
		"wpn_fps_ass_heffy_545_ufg_tantal"
	}
	
	for id, part_id in pairs(ak74ufg) do
		table.insert(all_ak47upperforegrip, part_id)
	end

	local all_ak74parts = {
		"wpn_fps_ass_heffy_all_lfg_ak74",
		"wpn_fps_ass_heffy_all_ufg_ak74",
		"wpn_fps_ass_heffy_all_pg_ak74",
		"wpn_fps_ass_heffy_all_st_ak74",
		"wpn_fps_ass_heffy_545_lfg_rpk74",
		"wpn_fps_ass_heffy_545_ufg_rpk74",
		"wpn_fps_ass_heffy_545_st_rpk74",
		"wpn_fps_ass_heffy_545_lfg_mpi",
		"wpn_fps_ass_heffy_545_ufg_mpi",
		"wpn_fps_ass_heffy_545_pg_mpi",
		"wpn_fps_ass_heffy_545_st_mpi",
		"wpn_fps_ass_heffy_545_ufg_tantal",
	}
	
    for id, part_id in pairs(all_ak74parts) do
		if self.parts[part_id].pcs then
			table.insert(self.wpn_fps_ass_heffy_762.uses_parts, part_id)
		end
    end
	self.parts.wpn_fps_ass_heffy_762_st_vepr.override.wpn_fps_ass_heffy_all_pg_ak74 = {unit="units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"}
	self.parts.wpn_fps_ass_heffy_762_st_vepr.override.wpn_fps_ass_heffy_545_pg_ak74 = {unit="units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"}
end
if self.wpn_fps_ass_heffy_556 then
	self.parts.wpn_fps_ass_heffy_762_st_vepr.override.wpn_fps_ass_heffy_556_pg_ak101 = {unit="units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"}
end
if self.wpn_fps_sho_heffy_12g then
	self.parts.wpn_fps_ass_heffy_762_st_vepr.override.wpn_fps_sho_heffy_12g_pg_saiga12 = {unit="units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"}
end
-----------------------------------------
----<A><K><4><7> -CAFCW- <A><K><4><7>----
-----------------------------------------
if BeardLib.Utils:FindMod("gsup") then
	local AK47SneakySuppressorPack = {
		"wpn_fps_ass_ns_g_sup3",
		"wpn_fps_ass_ns_g_sup4",
		"wpn_fps_ass_ns_g_sup5"
	}
	for id, part_id in pairs(AK47SneakySuppressorPack) do
		table.insert(self.wpn_fps_ass_heffy_762.uses_parts, part_id)
		table.insert(all_ak47ext, part_id)
	end
end

if BeardLib.Utils:FindMod("Tromix Barrel-Ext") then
	table.insert(self.wpn_fps_ass_heffy_762.uses_parts, "wpn_fps_upg_ns_ass_smg_tromix")	
	table.insert(all_ak47ext, "wpn_fps_upg_ns_ass_smg_tromix")
end

if BeardLib.Utils:FindMod("M82 Muzzle Brake") then
	table.insert(all_ak47ext, "wpn_fps_upg_ns_m82")
	table.insert(all_ak47ext, "wpn_fps_upg_ns_aw50")
end


--------------------------------------------
----<A><K><4><7> -Override- <A><K><4><7>----
--------------------------------------------

--- Gun ---

--- Barrel ---
for id, ba_id in pairs(all_ak47barrel) do
	self:akpack_check_override( "part", ba_id )
end
--self.parts.wpn_fps_ass_heffy_762_ba_akm.override.wpn_fps_ass_heffy_762_fh_dummy = {unit="units/mods/weapons/wpn_fps_ass_heffy_762_akm_pts/wpn_fps_ass_heffy_762_fh_akm"}
-- Default length barrel barrel extension and front sight override --
for id, ba_id in pairs(ak47barrel) do
	for id, ext_id in pairs(all_ak47ext) do
		if ext_id ~= "wpn_fps_ass_heffy_762_fh_dummy" then
			self.parts[ba_id].override[ext_id] = {a_obj = "a_ns"}
		end
	end
	for id, fo_id in pairs(all_ak47fo) do
		self.parts[ba_id].override[fo_id] = {}
	end
end
self.parts.wpn_fps_ass_heffy_762_ba_akm.override.wpn_fps_ass_heffy_762_fh_dummy   = {a_obj = "a_ns", unit="units/mods/weapons/wpn_fps_ass_heffy_762_akm_pts/wpn_fps_ass_heffy_762_fh_akm"}
self.parts.wpn_fps_ass_heffy_762_ba_t56.override.wpn_fps_ass_heffy_762_fh_dummy   = {a_obj = "a_ns", unit="units/mods/weapons/wpn_fps_ass_heffy_762_t56_pts/wpn_fps_ass_heffy_762_fh_t56"}
self.parts.wpn_fps_ass_heffy_762_ba_amd63.override.wpn_fps_ass_heffy_762_fh_dummy = {a_obj = "a_ns", unit="units/mods/weapons/wpn_fps_ass_heffy_762_ak47_pts/wpn_fps_ass_heffy_762_fh_ak47"}
self.parts.wpn_fps_ass_heffy_762_ba_ak109.override.wpn_fps_ass_heffy_762_fh_dummy = {a_obj = "a_ns", unit="units/mods/weapons/wpn_fps_ass_heffy_762_ak103_pts/wpn_fps_ass_heffy_762_fh_ak103"}


-- Other length barrel barrel extension overrides --
for id, ext_id in pairs(all_ak47ext) do
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
for id, fo_id in pairs(all_ak47fo) do
	self.parts.wpn_fps_ass_heffy_762_ba_ak104.override[fo_id] = {a_obj = "a_fo_ak104"}
	self.parts.wpn_fps_ass_heffy_762_ba_akmsu.override[fo_id] = {a_obj = "a_fo_akmsu"}
	self.parts.wpn_fps_ass_heffy_762_ba_m92.override[fo_id]   = {a_obj = "a_fo_akmsu"}
	self.parts.wpn_fps_ass_heffy_762_ba_rk62.override[fo_id]  = {a_obj = "a_fo_rk62"}
	self.parts.wpn_fps_ass_heffy_762_ba_rpk.override[fo_id]   = {a_obj = "a_fo_rpk"}
	self.parts.wpn_fps_ass_heffy_762_ba_tabuk.override[fo_id] = {a_obj = "a_fo_tabuk"}
--	self.parts.wpn_fps_ass_heffy_762_ba_vepr.override[fo_id]  = {a_obj = "a_fo_vepr"}
	self.parts.wpn_fps_ass_heffy_762_ba_amd65.override[fo_id] = {a_obj = "a_fo_amd65"}
	self.parts.wpn_fps_ass_heffy_762_ba_md90.override[fo_id]  = {a_obj = "a_fo_md90"}
end

--- Fore Grip ---
-- Default length fg barrel position override --
for id, fg_id in pairs(ak47foregrip) do
	self:akpack_check_override( "part", fg_id )
	for id, ba_id in pairs(ak47barrel) do
		self.parts[fg_id].override[ba_id] = {}
	end
end
-- Barrel position override by lfgs --
self:akpack_check_override( "part", "wpn_fps_ass_heffy_762_lfg_m70" )
for id, ba_id in pairs(all_ak47barrel) do
	self.parts.wpn_fps_ass_heffy_762_lfg_m70.override[ba_id]   = {a_obj = "a_b_m70"}
	self.parts.wpn_fps_ass_heffy_762_lfg_m70.override[ba_id].override   = self.parts.wpn_fps_ass_heffy_762_lfg_m70.override[ba_id].override or {}
end
-- Front sight overrides by lfgs --
for id, ba_id in pairs(ak47barrel) do
	for id, fo_id in pairs(all_ak47fo) do
		self.parts.wpn_fps_ass_heffy_762_lfg_m70.override[ba_id].override[fo_id]   = {a_obj = "a_fo_m70_std"}
	end
end
for id, fo_id in pairs(all_ak47fo) do
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
for id, ba_id in pairs(ak47barrel) do
	for id, ext_id in pairs(all_ak47ext) do
		if ext_id ~= "wpn_fps_ass_heffy_762_fh_dummy" then
			self.parts.wpn_fps_ass_heffy_762_lfg_m70.override[ba_id].override[ext_id] = {a_obj = "a_ns_m70_std"}
		end
	end
end
self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_ak47.override.wpn_fps_ass_heffy_762_fh_dummy  = {a_obj = "a_ns_m70_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_ak47_pts/wpn_fps_ass_heffy_762_fh_ak47"}
self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_akm.override.wpn_fps_ass_heffy_762_fh_dummy 	 = {a_obj = "a_ns_m70_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_akm_pts/wpn_fps_ass_heffy_762_fh_akm"}
self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_t56.override.wpn_fps_ass_heffy_762_fh_dummy 	 = {a_obj = "a_ns_m70_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_t56_pts/wpn_fps_ass_heffy_762_fh_t56"}
self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_amd63.override.wpn_fps_ass_heffy_762_fh_dummy = {a_obj = "a_ns_m70_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_ak47_pts/wpn_fps_ass_heffy_762_fh_ak47"}
self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_ak47.override.wpn_fps_ass_heffy_762_fh_dummy  = {a_obj = "a_ns_m70_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_ak47_pts/wpn_fps_ass_heffy_762_fh_ak47"}
self.parts.wpn_fps_ass_heffy_762_lfg_m70.override.wpn_fps_ass_heffy_762_ba_ak109.override.wpn_fps_ass_heffy_762_fh_dummy = {a_obj = "a_ns_m70_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_ak103_pts/wpn_fps_ass_heffy_762_fh_ak103"}

for id, ext_id in pairs(all_ak47ext) do
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
self:akpack_check_override( "part", "wpn_fps_ass_heffy_762_lr_vepr" )
self:akpack_check_override( "part", "wpn_fps_ass_heffy_762_lr_ak47" )
self:akpack_check_override( "part", "wpn_fps_ass_heffy_762_lr_akmsu" )
self:akpack_check_override( "part", "wpn_fps_ass_heffy_762_lr_rpk" )
self:akpack_check_override( "part", "wpn_fps_ass_heffy_762_lr_m92" )
--Stock overrides--
for id, st_id in pairs(akmstock) do
	if st_id ~= "wpn_fps_ass_heffy_762_st_akms" then
		self.parts.wpn_fps_ass_heffy_762_lr_ak47.override[st_id]  = {a_obj = "a_s_ak47"}
	end
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[st_id] = {a_obj = "a_s_akmsu"}
	if st_id ~= "wpn_fps_ass_heffy_762_st_ak103" then
		self.parts.wpn_fps_ass_heffy_762_lr_ak103.override[st_id] = {a_obj = "a_s_akmsu"}
	end
end
self:akpack_check_override( "part", "wpn_fps_ass_heffy_762_st_vepr" )
for id, lr_id in pairs(all_ak47lower) do
	self.parts[lr_id].override.wpn_fps_ass_heffy_762_st_vepr  = {}
	self.parts[lr_id].override.wpn_fps_ass_heffy_762_st_vepr.override = self.parts[lr_id].override.wpn_fps_ass_heffy_762_st_vepr.override or {}
	self.parts[lr_id].override.wpn_fps_ass_heffy_762_st_vepr.override.wpn_fps_ass_heffy_762_sp_ak47   = {a_obj="a_s_vepr"}
	self.parts[lr_id].override.wpn_fps_ass_heffy_762_st_vepr.override.wpn_fps_ass_heffy_762_pg_ak47	  = {unit="units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"}
	self.parts[lr_id].override.wpn_fps_ass_heffy_762_st_vepr.override.wpn_fps_ass_heffy_762_sad_ak103 = {unit="units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"}
end

--Stock Pad overrides--
for id, lr_id in pairs(all_ak47lower) do
	for id, st_id in pairs(all_ak47stock) do
		self.parts[lr_id].override[st_id] = self.parts[lr_id].override[st_id] or {}
		self.parts[lr_id].override[st_id].override = self.parts[lr_id].override[st_id].override or {}
	end
end
--for id, lr_id in pairs(all_ak47lower) do
--	self.parts[lr_id].override.wpn_fps_ass_heffy_762_st_ak47 = self.parts[lr_id].override.wpn_fps_ass_heffy_762_st_ak47 or {}
--	self.parts[lr_id].override.wpn_fps_ass_heffy_762_st_ak47.override = self.parts[lr_id].override.wpn_fps_ass_heffy_762_st_ak47.override or {}
--end
for id, st_id in pairs(akmstock) do
	for id, sp_id in pairs(akmstockpad) do
		self.parts.wpn_fps_ass_heffy_762_lr_ak47.override[st_id].override[sp_id]  = {a_obj = "a_s_ak47"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[st_id].override[sp_id] = {a_obj = "a_s_akmsu"}
		self.parts.wpn_fps_ass_heffy_762_lr_ak103.override[st_id].override[sp_id] = {a_obj = "a_s_akmsu"}
--		self.parts.wpn_fps_ass_heffy_762_lr_m92.override[st_id].override[sp_id]   = {a_obj = "a_s_akm"}
	end
end
--[[
for id, st_id in pairs(all_ak47stock)
	if st_id ~= "wpn_fps_ass_heffy_762_st_vepr" then
		for id, g_id in pairs(akmgrips) do
			self.parts.wpn_fps_ass_heffy_762_lr_akm.override[st_id].override[g_id]   = {a_obj = "a_g_akm"}
			self.parts.wpn_fps_ass_heffy_762_lr_vepr.override[st_id].override[g_id]   = {a_obj = "a_g_akm"}
			self.parts.wpn_fps_ass_heffy_762_lr_rpk.override[st_id].override[g_id]   = {a_obj = "a_g_akm"}
			self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[st_id].override[g_id] = {a_obj = "a_g_akmsu"}
			self.parts.wpn_fps_ass_heffy_762_lr_ak103.override[st_id].override[g_id] = {a_obj = "a_g_akmsu"}
			self.parts.wpn_fps_ass_heffy_762_lr_m92.override[st_id].override[g_id]   = {a_obj = "a_g_akmsu"}
		end
		self.parts.wpn_fps_ass_heffy_762_lr_akm.override[st_id].override.wpn_fps_ass_heffy_762_sp_ak47   = {a_obj = "a_s_akm"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[st_id].override.wpn_fps_ass_heffy_762_sp_ak47 = {a_obj = "a_s_akmsu_ak47"}
		self.parts.wpn_fps_ass_heffy_762_lr_rpk.override[st_id].override.wpn_fps_ass_heffy_762_sp_ak47 	 = {a_obj = "a_s_akm"}
		self.parts.wpn_fps_ass_heffy_762_lr_ak103.override[st_id].override.wpn_fps_ass_heffy_762_sp_ak47 = {a_obj = "a_s_akmsu_ak47"}
		self.parts.wpn_fps_ass_heffy_762_lr_vepr.override[st_id].override.wpn_fps_ass_heffy_762_sp_ak47  = {a_obj = "a_s_akm"}
		self.parts.wpn_fps_ass_heffy_762_lr_m92.override[st_id].override.wpn_fps_ass_heffy_762_sp_ak47   = {a_obj = "a_s_akmsu_ak47"}
	end
end
--]]
for id, lr_id in pairs(akmsulower) do
	for id, st_id in pairs(all_ak47stock) do
		if st_id ~= "wpn_fps_ass_heffy_762_st_vepr" then
			for id, g_id in pairs(all_ak47grips) do
				self.parts[lr_id].override[st_id].override[g_id] = {a_obj = "a_g_akmsu"}
			end
			self.parts[lr_id].override[st_id].override.wpn_fps_ass_heffy_762_sp_ak47 = {a_obj = "a_s_akmsu_ak47"}
		end
	end
end
for id, lr_id in pairs(akmlower) do
	for id, st_id in pairs(all_ak47stock) do
		if st_id ~= "wpn_fps_ass_heffy_762_st_vepr" then
			for id, g_id in pairs(all_ak47grips) do
				self.parts[lr_id].override[st_id].override[g_id] = {a_obj = "a_g_akm"}
			end
			self.parts[lr_id].override[st_id].override.wpn_fps_ass_heffy_762_sp_ak47 = {a_obj = "a_s_akm"}
		end
	end
end
-- Barrel position override by lrs --
for id, ba_id in pairs(all_ak47barrel) do
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[ba_id] = {a_obj = "a_b_akmsu"}	
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[ba_id].override = self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[ba_id].override or {}
--	self.parts.wpn_fps_ass_heffy_762_lr_m92.override[ba_id] = {a_obj = "a_b_m92"}	
--	self.parts.wpn_fps_ass_heffy_762_lr_m92.override[ba_id].override = self.parts.wpn_fps_ass_heffy_762_lr_m92.override[ba_id].override or {}
end
-- Front sight overrides by lrs --
for id, ba_id in pairs(ak47barrel) do
	for id, fo_id in pairs(all_ak47fo) do
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[ba_id].override[fo_id] = {a_obj = "a_fo_akmsu_std"}
--		self.parts.wpn_fps_ass_heffy_762_lr_m92.override[ba_id].override[fo_id]   = {a_obj = "a_fo_m92_std"}
	end
end
for id, fo_id in pairs(all_ak47fo) do
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
for id, ba_id in pairs(ak47barrel) do
	for id, ext_id in pairs(all_ak47ext) do
		if ext_id ~= "wpn_fps_ass_heffy_762_fh_dummy" then
			self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[ba_id].override[ext_id] = {a_obj = "a_ns_akmsu_std"}
--			self.parts.wpn_fps_ass_heffy_762_lr_m92.override[ba_id].override[ext_id]   = {a_obj = "a_ns_m92_std"}
		end
	end
end
self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_ak47.override.wpn_fps_ass_heffy_762_fh_dummy  = {a_obj = "a_ns_akmsu_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_ak47_pts/wpn_fps_ass_heffy_762_fh_ak47"}
self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_akm.override.wpn_fps_ass_heffy_762_fh_dummy   = {a_obj = "a_ns_akmsu_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_akm_pts/wpn_fps_ass_heffy_762_fh_akm"}
self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_t56.override.wpn_fps_ass_heffy_762_fh_dummy   = {a_obj = "a_ns_akmsu_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_t56_pts/wpn_fps_ass_heffy_762_fh_t56"}
self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_amd63.override.wpn_fps_ass_heffy_762_fh_dummy = {a_obj = "a_ns_akmsu_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_ak47_pts/wpn_fps_ass_heffy_762_fh_ak47"}
self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_ak109.override.wpn_fps_ass_heffy_762_fh_dummy = {a_obj = "a_ns_akmsu_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_ak103_pts/wpn_fps_ass_heffy_762_fh_ak103"}
--self.parts.wpn_fps_ass_heffy_762_lr_m92.override.wpn_fps_ass_heffy_762_ba_akm.override.wpn_fps_ass_heffy_762_fh_dummy   = {a_obj = "a_ns_akmsu_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_akm_pts/wpn_fps_ass_heffy_762_fh_akm"}
--self.parts.wpn_fps_ass_heffy_762_lr_m92.override.wpn_fps_ass_heffy_762_ba_t56.override.wpn_fps_ass_heffy_762_fh_dummy   = {a_obj = "a_ns_akmsu_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_t56_pts/wpn_fps_ass_heffy_762_fh_t56"}
--self.parts.wpn_fps_ass_heffy_762_lr_m92.override.wpn_fps_ass_heffy_762_ba_amd63.override.wpn_fps_ass_heffy_762_fh_dummy = {a_obj = "a_ns_akmsu_std", unit="units/mods/weapons/wpn_fps_ass_heffy_762_amd63_pts/wpn_fps_ass_heffy_762_fh_amd63"}

for id, ext_id in pairs(all_ak47ext) do
	if ext_id == "wpn_fps_ass_heffy_762_fh_dummy" then
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_tabuk.override[ext_id] = {a_obj = "a_ns_akmsu_tabuk", unit="units/mods/weapons/wpn_fps_ass_heffy_762_tabuk_pts/wpn_fps_ass_heffy_762_fh_tabuk"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_akmsu.override[ext_id] = {a_obj = "a_ns_akmsu_akmsu", unit="units/mods/weapons/wpn_fps_ass_heffy_762_akmsu_pts/wpn_fps_ass_heffy_762_fh_akmsu"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_m92.override[ext_id]   = {a_obj = "a_ns_akmsu_m92", unit="units/mods/weapons/wpn_fps_ass_heffy_762_m92_pts/wpn_fps_ass_heffy_762_fh_m92"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_ak104.override[ext_id] = {a_obj = "a_ns_akmsu_ak104", unit="units/mods/weapons/wpn_fps_ass_heffy_762_ak104_pts/wpn_fps_ass_heffy_762_fh_ak104"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_rk62.override[ext_id]  = {a_obj = "a_ns_akmsu_rk62", unit="units/mods/weapons/wpn_fps_ass_heffy_762_rk62_pts/wpn_fps_ass_heffy_762_fh_rk62"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_md90.override[ext_id]  = {a_obj = "a_ns_akmsu_md90", unit="units/mods/weapons/wpn_fps_ass_heffy_762_md90_pts/wpn_fps_ass_heffy_762_fh_md90"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_rpk.override[ext_id]   = {a_obj = "a_ns_akmsu_rpk", unit="units/mods/weapons/wpn_fps_ass_heffy_762_ak47_pts/wpn_fps_ass_heffy_762_fh_ak47"}
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override.wpn_fps_ass_heffy_762_ba_amd65.override[ext_id] = {a_obj = "a_ns_akmsu_amd65", unit="units/mods/weapons/wpn_fps_ass_heffy_762_ak47_pts/wpn_fps_ass_heffy_762_fh_ak47"}
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
-- Scope override --
for id, o_id in pairs(all_ak47sight) do
	if o_id ~= "wpn_fps_upg_o_acog" then
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[o_id] = {a_obj = "a_o_akmsu"}
		self.parts.wpn_fps_ass_heffy_762_lr_m92.override[o_id]   = {a_obj = "a_o_akmsu"}
		self.parts.wpn_fps_ass_heffy_762_ro_m92.override[o_id]   = {a_obj = "a_o_akmsu"}
	else
		self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[o_id] = {a_obj = "a_o_akmsu_acog"}
		self.parts.wpn_fps_ass_heffy_762_lr_m92.override[o_id]   = {a_obj = "a_o_akmsu_acog"}
		self.parts.wpn_fps_ass_heffy_762_ro_m92.override[o_id]   = {a_obj = "a_o_akmsu_acog"}
	end
end
--- Magazines ---
self.parts.wpn_fps_ass_heffy_762_m_steel_75.weapon_reload_override 	 = {bm_w_heffy_762 = "tecci"} --tecci

--- Stocks ---

--- Bipods ---
for id, bp_id in pairs(all_ak47bipod) do
	self.parts.wpn_fps_ass_heffy_762_lr_akmsu.override[bp_id] = {a_obj = "a_bp_akmsu"}
	self.parts.wpn_fps_ass_heffy_762_lfg_m70.override[bp_id]  = {a_obj = "a_bp_m70"}
end

----------------------------------------
----<A><K><4><7> -Adds- <A><K><4><7>----
----------------------------------------
--- Gun ---
self:akpack_check_adds( "wpn", "wpn_fps_ass_heffy_762" )
for id, o_id in pairs(all_ak47sight) do
	self.wpn_fps_ass_heffy_762.adds[o_id] = {"wpn_fps_upg_o_ak47_scopemount"}
end
	
-------------------------------------------
----<A><K><4><7> -Forbids- <A><K><4><7>----
-------------------------------------------

--- Pistol grips ---
-- AKM grips forbids --
for id, g_id in pairs(all_ak47grips) do
	if g_id ~= "wpn_fps_ass_heffy_762_pg_ak47" and g_id ~= "wpn_fps_ass_heffy_all_pg_ak74" then
		self:akpack_setup_forbid( g_id, "wpn_fps_ass_heffy_762_st_vepr" )
	end
end
for id, lfg_id in pairs(all_ak47lowerforegrip) do
	if lfg_id ~= "wpn_fps_ass_heffy_762_lfg_ak47" then
		self:akpack_setup_forbid( lfg_id, "wpn_fps_ass_heffy_762_ba_vepr" )
	end
end
--- UFG ---
for id, ufg_id in pairs(all_ak47upperforegrip) do
	if ufg_id ~= "wpn_fps_ass_heffy_762_ufg_ak47" then
		self:akpack_setup_forbid( "wpn_fps_ass_heffy_762_lfg_m70", ufg_id )
	end
end

--- Barrels ---
for id, ba_id in pairs(all_ak47barrel) do
	if ba_id ~= "wpn_fps_ass_heffy_762_ba_rpk" then
		self:akpack_setup_forbid( ba_id, "wpn_fps_ass_heffy_762_bp_rpk" )
		self:akpack_setup_forbid( ba_id, "wpn_fps_ass_heffy_762_bp_rpk_folded" )
	end
end
self.parts.wpn_fps_ass_heffy_762_bp_rpk.forbids = nil
self.parts.wpn_fps_ass_heffy_762_bp_rpk_folded.forbids = nil

for id, lfg_id in pairs(all_ak47lowerforegrip) do
	if lfg_id ~= "wpn_fps_ass_heffy_762_lfg_ak47" then
		self:akpack_setup_forbid( "wpn_fps_ass_heffy_762_ba_vepr", lfg_id )
	end
end
for id, ufg_id in pairs(all_ak47upperforegrip) do
	if ufg_id ~= "wpn_fps_ass_heffy_762_ufg_ak47" then
		self:akpack_setup_forbid( "wpn_fps_ass_heffy_762_ba_vepr", ufg_id )
	end
end
for id, lr_id in pairs(akmsulower) do
	if lr_id ~= "wpn_fps_ass_heffy_762_lr_ak103" then
		self:akpack_setup_forbid( "wpn_fps_ass_heffy_762_ba_vepr", lr_id )
	end
end
--- Lower ---
for id, lr_id in pairs(akmsulower) do
	self:akpack_setup_forbid( lr_id, "wpn_fps_ass_heffy_762_st_vepr" )
end
for id, lr_id in pairs(akmsulower) do
	if lr_id ~= "wpn_fps_ass_heffy_762_lr_ak103" then
		for id, lfg_id in pairs(all_ak47lowerforegrip) do
			if lfg_id ~= "wpn_fps_ass_heffy_762_lfg_ak47" then
				self:akpack_setup_forbid( lr_id, lfg_id )
			end
		end
		for id, ufg_id in pairs(all_ak47upperforegrip) do
			if ufg_id ~= "wpn_fps_ass_heffy_762_ufg_ak47" then
				self:akpack_setup_forbid( lr_id, ufg_id )
			end
		end
		self:akpack_setup_forbid( lr_id, "wpn_fps_upg_o_cs" )
	end
end
------------------------------------------
----<A><K><4><7> -Stance- <A><K><4><7>----
------------------------------------------

--- Vanilla sights ---
for id, o_id in pairs(all_ak47sight) do
	if self.parts[o_id].stance_mod.wpn_fps_ass_flint then
		self.parts[o_id].stance_mod.wpn_fps_ass_heffy_762 = deep_clone(self.parts[o_id].stance_mod.wpn_fps_ass_flint)
	else
		log("[AK_Pack] [ERROR] WHO THE FUCK MESSED WITH SIGHT STANCES THIS TIME!? " .. o_id)
	end
end
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
for id, part_id in pairs(all_ak47fl) do
	self.parts.wpn_fps_ass_heffy_762_flp_<insert_flashlight_position_name>.override[part_id] = {a_obj = "a_fl_ak47"}
end
--]]

------------------------------------------------------
----<A><K><4><7> -Other modules code- <A><K><4><7>----
------------------------------------------------------

----------------------------------------------------
----<A><K><4><7> -Matconfig_Arrays- <A><K><4><7>----
----------------------------------------------------

local ak47_body_mat = {
	"wpn_fps_ass_heffy_762_ba_ak47",
	"wpn_fps_ass_heffy_762_ch_ak47",
	"wpn_fps_ass_heffy_762_sp_ak47",
	"wpn_fps_ass_heffy_762_ufgc_ak47",
	"wpn_fps_ass_heffy_762_ur_ak47",
	"wpn_fps_ass_heffy_762_fgc_ak47",
	"wpn_fps_ass_heffy_762_fh_ak47",
	"wpn_fps_ass_heffy_762_lfgc_ak47",
	"wpn_fps_ass_heffy_762_lr_ak47",
	"wpn_fps_ass_heffy_762_tr_ak47",
	"wpn_fps_ass_heffy_762_rsb_ak47",
	"wpn_fps_ass_heffy_762_fsl_ak47"
}

local ak47_furniture_mat = { 
"wpn_fps_ass_heffy_762_pg_ak47",
"wpn_fps_ass_heffy_762_lfg_ak47",
"wpn_fps_ass_heffy_762_pg_ak47"
}
local ak103_body_mat = {
"wpn_fps_ass_heffy_762_fsl_ak103",
"wpn_fps_ass_heffy_762_lr_ak103",
"wpn_fps_ass_heffy_762_tr_ak103",
"wpn_fps_ass_heffy_762_ur_ak103"
}
local ak103_furniture_mat = {
"wpn_fps_ass_heffy_762_lfg_ak103",
"wpn_fps_ass_heffy_762_pg_ak103",
"wpn_fps_ass_heffy_762_sad_ak103",
"wpn_fps_ass_heffy_762_st_ak103",
"wpn_fps_ass_heffy_762_ufg_ak103"
}
local ak104_body_mat = {
"wpn_fps_ass_heffy_762_ba_ak104",
"wpn_fps_ass_heffy_762_fh_ak104"
}
--------------------------------------------------------
----<A><K><4><7> -Matconfig_Definition- <A><K><4><7>----
--------------------------------------------------------
--[[
--- AK47 ---
-- Body --
local ak47_matconfig = "units/mods/weapons/wpn_fps_ass_heffy_762_ak47_pts/ak47_body"
for id, part_id in pairs(ak47_body_mat) do
	if self.parts[part_id] then
		self.parts[part_id].material_config 	= Idstring(ak47_matconfig)
		self.parts[part_id].thq_material_config = Idstring(ak47_matconfig .. "_thq")
	else
		log("AK47_ERROR: (mat_config)Attempt to index Part ID: '" .. part_id .. "' (a nil value)")	
	end
end
-- Furniture --
ak47_matconfig = "units/mods/weapons/wpn_fps_ass_heffy_762_ak47_pts/ak47_furniture"
for id, part_id in pairs(ak47_furniture_mat) do
	if self.parts[part_id] then
		self.parts[part_id].material_config 	= Idstring(ak47_matconfig)
		self.parts[part_id].thq_material_config = Idstring(ak47_matconfig .. "_thq")
	else
		log("AK47_ERROR: (mat_config)Attempt to index Part ID: '" .. part_id .. "' (a nil value)")	
	end
end
self.parts.wpn_fps_ass_heffy_762_st_ak47.material_config = Idstring("units/mods/weapons/wpn_fps_ass_heffy_762_ak47_pts/ak47_stock")
self.parts.wpn_fps_ass_heffy_762_st_ak47.thq_material_config = Idstring("units/mods/weapons/wpn_fps_ass_heffy_762_ak47_pts/ak47_stock_thq")

--- AK103 ---
-- Body --
local ak103_matconfig = "units/mods/weapons/wpn_fps_ass_heffy_762_ak103_pts/ak103_body"
for id, part_id in pairs(ak103_body_mat) do
	if self.parts[part_id] then
		self.parts[part_id].material_config 	= Idstring(ak103_matconfig)
		self.parts[part_id].thq_material_config = Idstring(ak103_matconfig .. "_thq")
	else
		log("AK47_ERROR: (mat_config)Attempt to index Part ID: '" .. part_id .. "' (a nil value)")	
	end
end
ak103_matconfig = "units/mods/weapons/wpn_fps_ass_heffy_762_ak103_pts/ak103_furniture"
for id, part_id in pairs(ak103_furniture_mat) do
	if self.parts[part_id] then
		self.parts[part_id].material_config 	= Idstring(ak103_matconfig)
		self.parts[part_id].thq_material_config = Idstring(ak103_matconfig .. "_thq")
	else
		log("AK47_ERROR: (mat_config)Attempt to index Part ID: '" .. part_id .. "' (a nil value)")	
	end
end
--- AK104 ---
-- Body --
local ak104_matconfig = "units/mods/weapons/wpn_fps_ass_heffy_762_ak104_pts/ak104_body"
for id, part_id in pairs(ak104_body_mat) do
	if self.parts[part_id] then
		self.parts[part_id].material_config 	= Idstring(ak104_matconfig)
		self.parts[part_id].thq_material_config = Idstring(ak104_matconfig .. "_thq")
	else
		log("AK47_ERROR: (mat_config)Attempt to index Part ID: '" .. part_id .. "' (a nil value)")	
	end
end]]--
end)
