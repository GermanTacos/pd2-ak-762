Hooks:PostHook( WeaponTweakData, "_init_stats", "AK47Mod_init_stats", function(self)

if self.stats then

self.stats.extra_ammo_kw = {}

for i = -100, 100, 1 do
	table.insert(self.stats.extra_ammo_kw, i)
end

self.stats.total_ammo_mod_kw = {}

for i = -100, 500, 5 do
	table.insert(self.stats.total_ammo_mod_kw, i / 100)
end

end
end)

Hooks:PostHook( WeaponTweakData, "init", "AK47ModInit", function(self)

if ( self.heffy_762 ) then

	self.heffy_762.animations.bipod_enter = "bipod_enter"
	self.heffy_762.animations.bipod_exit = "bipod_exit"
	self.heffy_762.animations.bipod_recoil = "bipod_recoil"
	self.heffy_762.animations.bipod_recoil_enter = "bipod_recoil"
	self.heffy_762.animations.bipod_recoil_loop = "bipod_recoil_loop"
	self.heffy_762.animations.bipod_recoil_exit = "bipod_recoil_exit"

	self.heffy_762.animations.use_stance = "ak74"	
	
	self.heffy_762.spread.bipod = default_bipod_spread
	
	self.heffy_762.bipod_camera_spin_limit = 45
	self.heffy_762.bipod_camera_pitch_limit = 20
	self.heffy_762.bipod_weapon_translation = Vector3(-8.5,20,-7.5)
	self.heffy_762.bipod_deploy_multiplier = 1

	self.heffy_762.timers.deploy_bipod = 1
--[[
	self.heffy_762.stats = {
		zoom = 3,
		total_ammo_mod_kw = 21,
		damage = 80,
		alert_size = 7,
		spread = 16,
		spread_moving = 11,
		recoil = 16,
		value = 1,
		extra_ammo_kw = 101,
		reload = 11,
		suppression = 10,
		concealment = 16
	}
	--]]
    self.heffy_762.attachment_points = {
        {
            name = "a_os_ak47", 
            base_a_obj = "a_os",
            position = Vector3( 0, 1.5, 1.1 ), 
            rotation = Rotation( 0, 10, 0 )
        },
        {
            name = "a_s_ak47", 
            base_a_obj = "a_body",
            position = Vector3( 0, 1.5, 1.1 ), 
            rotation = Rotation( 0, 10, 0 )
        },
        {
            name = "a_m_ak47_nk64", 
            base_a_obj = "a_m",
            position = Vector3( 0.1, 12, 1.3 ), 
            rotation = Rotation( 0, 2, 0 )
        },
        {
            name = "a_m_ak47_drum75", 
            base_a_obj = "a_m",
            position = Vector3( 0, 0.8, 0.5 ), 
            rotation = Rotation( 0, 0, 0 )
        },
        {
            name = "a_sp_ak47_akmsu_tabuk", 
            base_a_obj = "a_body",
            position = Vector3( 0, 1, 0.5 ), 
            rotation = Rotation( 0, 5, 0 )
        },
        {
            name = "a_s_ak47_akmsu", 
            base_a_obj = "a_body", 
            position = Vector3( 0, 0.35, 0.275 ), 
            rotation = Rotation( 0, 2.5, 0 ) 
        },
        {
            name = "a_sp_ak47_tabuk", 
            base_a_obj = "a_body",
            position = Vector3( 0, 0, 0 ), 
            rotation = Rotation( 0, 10, 0 )
        },
        {
            name = "a_s_akm", 
            base_a_obj = "a_body", 
            position = Vector3( 0, -1.4, -1.1 ), 
            rotation = Rotation( 0, -10, 0 ) 
        },
        {
            name = "a_sp_akm_akmsu_tabuk", 
            base_a_obj = "a_body",
            position = Vector3( 0, -0.4, -0.6 ), 
            rotation = Rotation( 0, -5, 0 )
        },
        {
            name = "a_g_akm_ak47", 
            base_a_obj = "a_body",
            position = Vector3( 0, 0, 0.1 ), 
            rotation = Rotation( 0, 0, 0 )
        },
        {
            name = "a_s_akm_akmsu", 
            base_a_obj = "a_body", 
            position = Vector3( 0, -0.875, -0.6875 ), --0.7, 0.55 | 0.175, 0.1375
            rotation = Rotation( 0, -5, 0 ) 
        },
        {
            name = "a_g_akmsu", 
            base_a_obj = "a_body",
            position = Vector3( 0, 0.5, 0 ), 
            rotation = Rotation( 0, 0, 0 )
        },
        {
            name = "a_sp_akmsu_akmsu_tabuk", 
            base_a_obj = "a_body",
            position = Vector3( 0, 1.875, 1.1875 ), 
            rotation = Rotation( 0, 10, 0 )
        },
        {
            name = "a_s_akmsu_ak47", 
            base_a_obj = "a_body", 
            position = Vector3( 0, -0.35, -0.275 ), 
            rotation = Rotation( 0, -2.5, 0 ) 
        },
        {
            name = "a_s_akmsu_other", 
            base_a_obj = "a_body", 
            position = Vector3( 0, 0.875, 0.6875 ), --0.7, 0.55 | 0.175, 0.1375
            rotation = Rotation( 0, 5, 0 ) 
        },
        {
            name = "a_ns_ak47_akmsu", 
            base_a_obj = "a_ns", 
            position = Vector3( 0, 1.4, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_ns_rk62", 
            base_a_obj = "a_ns", 
            position = Vector3( 0, 0.9, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_ns_rk62_akmsu", 
            base_a_obj = "a_ns", 
            position = Vector3( 0, -3, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_ns_ak104", 
            base_a_obj = "a_ns", 
            position = Vector3( 0, -5.3, 0 ), 
            rotation = Rotation( 0, 0, 0 )
        },
        {
            name = "a_ns_ak104_akmsu", 
            base_a_obj = "a_ns", 
            position = Vector3( 0, -9.2, 0 ), 
            rotation = Rotation( 0, 0, 0 )
        },
        {
            name = "a_ns_md90", 
            base_a_obj = "a_ns", 
            position = Vector3( 0, -6.3, 0 ), 
            rotation = Rotation( 0, 0, 0 )
        },
        {
            name = "a_ns_md90_akmsu", 
            base_a_obj = "a_ns", 
            position = Vector3( 0, -10.2, 0 ), 
            rotation = Rotation( 0, 0, 0 )
        },
        {
            name = "a_ns_akmsu", 
            base_a_obj = "a_ns", 
            position = Vector3( 0, -13.3, 0 ), 
            rotation = Rotation( 0, 0, 0 )
        },
        {
            name = "a_ns_akmsu_akmsu", 
            base_a_obj = "a_ns", 
            position = Vector3( 0, -17.2, 0 ), 
            rotation = Rotation( 0, 0, 0 )
        },
        {
            name = "a_ns_rpk", 
            base_a_obj = "a_ns", 
            position = Vector3( 0, 24.8, 0 ), 
            rotation = Rotation( 0, 0, 0 )
        },
        {
            name = "a_ns_rpk_akmsu", 
            base_a_obj = "a_ns", 
            position = Vector3( 0, 20.9, 0 ), 
            rotation = Rotation( 0, 0, 0 )
        },
        {
            name = "a_ns_tabuk", 
            base_a_obj = "a_ns", 
            position = Vector3( 0, 13.3, 0 ), 
            rotation = Rotation( 0, 0, 0 )
        },
        {
            name = "a_ns_tabuk_akmsu", 
            base_a_obj = "a_ns", 
            position = Vector3( 0, 9.4, 0 ), 
            rotation = Rotation( 0, 0, 0 )
        },
        {
            name = "a_ns_vepr", 
            base_a_obj = "a_ns", 
            position = Vector3( 0, 7.3, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_ns_vepr_akmsu", 
            base_a_obj = "a_ns", 
            position = Vector3( 0, 3.4, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_fs_rpk", 
            base_a_obj = "a_body", 
            position = Vector3( 0, 19.5, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_fs_m92_rpk", 
            base_a_obj = "a_body", 
            position = Vector3( 0, 24.5, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_b_m70", 
            base_a_obj = "a_body", 
            position = Vector3( 0, 1.5, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_b_m70_a_tabuk", 
            base_a_obj = "a_body", 
            position = Vector3( 0, -0.1, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_fs_m70_a_rpk", 
            base_a_obj = "a_body", 
            position = Vector3( 0, 21, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_fs_m70_a_tabuk", 
            base_a_obj = "a_body", 
            position = Vector3( 0, 8.9, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_fh_m70_tabuk_tabuk", 
            base_a_obj = "a_body", 
            position = Vector3( 0, 0.4, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_fh_m70_tabuk", 
            base_a_obj = "a_body", 
            position = Vector3( 0, -8.7, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_b_tabuk", 
            base_a_obj = "a_body", 
            position = Vector3( 0, -1.6, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_fs_tabuk", 
            base_a_obj = "a_body", 
            position = Vector3( 0, 7.4, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_fh_tabuk_self", 
            base_a_obj = "a_body", 
            position = Vector3( 0, -1.1, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_fh_tabuk_other", 
            base_a_obj = "a_body", 
            position = Vector3( 0, -9.1, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_b_m92_self", 
            base_a_obj = "a_body", 
            position = Vector3( 0, 3.9, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_fs_md90_self", 
            base_a_obj = "a_body", 
            position = Vector3( 0, -11, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_b_akmsu_self", 
            base_a_obj = "a_body", 
            position = Vector3( 0, 3.9, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_b_akmsu_other", 
            base_a_obj = "a_body", 
            position = Vector3( 0, -3.9, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_b_akmsu_tabuk", 
            base_a_obj = "a_body", 
            position = Vector3( 0, -5.5, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_fh_akmsu_self", 
            base_a_obj = "a_body", 
            position = Vector3( 0, 19.5, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_fh_akmsu_others", 
            base_a_obj = "a_body", 
            position = Vector3( 0, -3.9, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_fh_akmsu_tabuk", 
            base_a_obj = "a_body", 
            position = Vector3( 0, -2.8, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_fh_akmsu_amd63", 
            base_a_obj = "a_body", 
            position = Vector3( 0, -2.5, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_fs_ak104_self", 
            base_a_obj = "a_body", 
            position = Vector3( 0, -10.5, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_fh_ak104_other", 
            base_a_obj = "a_body", 
            position = Vector3( 0, -10.5, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_fh_ak104_tabuk", 
            base_a_obj = "a_body", 
            position = Vector3( 0, -19.6, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_fh_ak104_amd63", 
            base_a_obj = "a_body", 
            position = Vector3( 0, -9.1, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_fs_rk62_self", 
            base_a_obj = "a_body", 
            position = Vector3( 0, -13.5, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_fs_akmsu_self", 
            base_a_obj = "a_body", 
            position = Vector3( 0, -18.5, 0.3 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_fs_akmsu_ak104", 
            base_a_obj = "a_body", 
            position = Vector3( 0, -22.4, 0 ),
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_fs_akmsu_rk62", 
            base_a_obj = "a_body", 
            position = Vector3( 0, -17.4, 0 ),
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_fs_akmsu_other", 
            base_a_obj = "a_body", 
            position = Vector3( 0, -22.4, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_fs_akmsu_rpk", 
            base_a_obj = "a_body", 
            position = Vector3( 0, 15.6, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_fs_akmsu_tabuk", 
            base_a_obj = "a_body", 
            position = Vector3( 0, 3.5, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_fh_amd63_other", 
            base_a_obj = "a_body", 
            position = Vector3( 0, 1.4, 0 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_g_ak47", 
            base_a_obj = "a_body", 
            position = Vector3( 0, 0, 2.85 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_o_ak47", 
            base_a_obj = "a_o", 
            position = Vector3( 0, -7, 0.5 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_gl_ak47", 
            base_a_obj = "a_fl", 
            position = Vector3( -0.6, 24.6, -3.1 ), 
            rotation = Rotation( 0, 0, 0 ) 
        },
        {
            name = "a_fl_ak47", 
            base_a_obj = "a_fl", 
            position = Vector3( 0, 0, -2 ), 
            rotation = Rotation( 0, 0, 0 ) 
        }
    }
	
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_ns", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, 5.3, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
end
		
end)



