Hooks:PostHook( WeaponTweakData, "init", "AK47ModInit", function(self)

if ( self.heffy_762 ) then

---- Bipod Stuff ----
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
	
---- CAP aka YEEET ----	

--- Base stuff ---	
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_ns", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, 5.3, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_fl", 
        base_a_obj = "a_fl", 
        position = Vector3( 0, 0, -2 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_gl", 
        base_a_obj = "a_fl", 
        position = Vector3( -0.6, 24.6, -3.1 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_o", 
        base_a_obj = "a_o", 
        position = Vector3( 0, -7, 0.5 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_os", 
        base_a_obj = "a_os", 
        position = Vector3( 0, 1.5, 1.1 ), 
        rotation = Rotation( 0, 10, 0 )
	})
--- Fire Selector ---
-- Override by mechanism --
self:SetupAttachmentPoint("heffy_762", {
		name = "a_fsl_tabuk_std", 
        base_a_obj = "a_body", 
        position = Vector3( 0, -0.8, 0 ), 
        rotation = Rotation( 0, -6, 0 ) 
	})	
--- Scope Mount ---
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_o_mount", 
        base_a_obj = "a_body", 
        position = Vector3( 0, 0, 2.85 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
--- Front sights ---
-- Override by lfg ---
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_fo_akmsu_std", 
        base_a_obj = "a_body", 
        position = Vector3( 0, -3.9, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_fo_akmsu_tabuk", 
        base_a_obj = "a_body", 
        position = Vector3( 0, 3.5, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_fo_akmsu_rpk", 
        base_a_obj = "a_body", 
        position = Vector3( 0, 15.6, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_fo_akmsu_m92", 
        base_a_obj = "a_body", 
        position = Vector3( 0, -22.4, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_fo_akmsu_akmsu", 
        base_a_obj = "a_body", 
        position = Vector3( 0, -22.4, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_fo_akmsu_rk62", 
        base_a_obj = "a_body", 
        position = Vector3( 0, -17.4, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_fo_akmsu_ak104", 
        base_a_obj = "a_body", 
        position = Vector3( 0, -14.4, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_fo_m70_std", 
        base_a_obj = "a_body", 
        position = Vector3( 0, 1.5, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_fo_m70_m92", 
        base_a_obj = "a_body", 
        position = Vector3( 0, -9.5, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_fo_m70_akmsu", 
        base_a_obj = "a_body", 
        position = Vector3( 0, -17, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_fo_m70_rk62", 
        base_a_obj = "a_body", 
        position = Vector3( 0, -12, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_fo_m70_ak104", 
        base_a_obj = "a_body", 
        position = Vector3( 0, -9, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_fo_m70_tabuk", 
        base_a_obj = "a_body", 
        position = Vector3( 0, 8.9, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_fo_m70_rpk", 
        base_a_obj = "a_body", 
        position = Vector3( 0, 21, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
-- Barrel fo positions --
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_fo_akmsu", 
        base_a_obj = "a_body", 
        position = Vector3( 0, -18.5, 0.3 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_fo_rk62", 
        base_a_obj = "a_body", 
        position = Vector3( 0, -13.5, 0.3 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_fo_ak104", 
        base_a_obj = "a_body", 
        position = Vector3( 0, -10.5, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_fo_md90", 
        base_a_obj = "a_body", 
        position = Vector3( 0, -11, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_fo_amd65", 
        base_a_obj = "a_body", 
        position = Vector3( 0, -13, -0.1 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_fo_tabuk", 
        base_a_obj = "a_body", 
        position = Vector3( 0, 7.4, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_fo_rpk", 
        base_a_obj = "a_body", 
        position = Vector3( 0, 19.5, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
--- Barrel positions with different FGs ---
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_b_akmsu", 
        base_a_obj = "a_body", 
        position = Vector3( 0, -3.9, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_b_m70", 
        base_a_obj = "a_body", 
        position = Vector3( 0, 1.5, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_b_war", 
        base_a_obj = "a_body", 
        position = Vector3( 0, 10.5, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
--- Barrel extensions ---
-- Default positions --
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_ns_vepr", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, 7.3, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_ns_tabuk", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, 13.3, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_ns_rpk", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, 24.8, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_ns_akmsu", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, -13.3, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_ns_amd65", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, -7.2, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_ns_md90", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, -6.3, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_ns_ak104", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, -5.3, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_ns_rk62", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, 0.9, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
-- Overide positions --
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_ns_akmsu_std", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, 1.5, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_ns_akmsu_tabuk", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, 9.5, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_ns_akmsu_rpk", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, 21, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_ns_akmsu_akmsu", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, -17.2, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_ns_akmsu_md90", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, -10.1, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_ns_akmsu_ak104", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, -9.1, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_ns_akmsu_rk62", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, -2.9, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_ns_m70_std", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, 6.8, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_ns_m70_tabuk", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, 20.1, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_ns_m70_rpk", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, 31.6, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_ns_m70_akmsu", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, -6.5, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_ns_m70_md90", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, 0.5, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_ns_m70_ak104", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, 1.5, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_ns_m70_rk62", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, 7.7, 0 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
--- Stocks ---
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_s_ak47", 
        base_a_obj = "a_body",
        position = Vector3( 0, 1.5, 1.1 ), 
        rotation = Rotation( 0, 10, 0 )
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_s_akm", 
        base_a_obj = "a_body", 
        position = Vector3( 0, -1.4, -1.1 ), 
        rotation = Rotation( 0, -10, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_s_akmsu", 
        base_a_obj = "a_body", 
        position = Vector3( 0, 0.875, 0.6875 ), --0.7, 0.55 | 0.175, 0.1375
        rotation = Rotation( 0, 5, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_s_akm_akmsu", 
        base_a_obj = "a_body", 
        position = Vector3( 0, -0.875, -0.6875 ),
        rotation = Rotation( 0, 5, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_s_akmsu_ak47", 
        base_a_obj = "a_body", 
        position = Vector3( 0, -0.35, -0.275 ), 
        rotation = Rotation( 0, -2.5, 0 ) 
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_s_ak47_akmsu", 
        base_a_obj = "a_body", 
        position = Vector3( 0, 0.35, 0.275 ), 
        rotation = Rotation( 0, 2.5, 0 ) 
	})
--- Pistol Grips ---
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_g_akm", 
        base_a_obj = "a_body", 
        position = Vector3( 0, 0, 0.1 ), 
        rotation = Rotation( 0, 0, 0 )
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_g_akmsu", 
        base_a_obj = "a_body", 
        position = Vector3( 0, 0.5, 0.1 ), 
        rotation = Rotation( 0, 0, 0 )
	})
--- Stock Pads ---
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_sp_akmsu_tabuk", 
        base_a_obj = "a_body",
        position = Vector3( 0, 1, 0.5 ), 
        rotation = Rotation( 0, 5, 0 )
	})
--- Magazines ---
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_m_ak47_drum75", 
        base_a_obj = "a_m",
        position = Vector3( 0, 0.8, 0.5 ), 
        rotation = Rotation( 0, 0, 0 )
	})
	self:SetupAttachmentPoint("heffy_762", {
		name = "a_m_ak47_nk64", 
        base_a_obj = "a_m",
        position = Vector3( 0.1, 12, 1.3 ), 
        rotation = Rotation( 0, 2, 0 )
	})
end
end)



