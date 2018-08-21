function PlayerStandard:_check_action_deploy_underbarrel(t, input)
	local new_action = nil
	local action_forbidden = false

	if not input.btn_deploy_bipod and not self._toggle_underbarrel_wanted then
		return new_action
	end

	action_forbidden = self:in_steelsight() or self:_is_throwing_projectile() or self:_is_meleeing() or self:is_equipping() or self:_changing_weapon() or self:shooting() or self:_is_reloading() or self:is_switching_stances() or self:_interacting() or self:running() and not self._equipped_unit:base():run_and_shoot_allowed()

	if self._running and not self._equipped_unit:base():run_and_shoot_allowed() and not self._end_running_expire_t then
		self:_interupt_action_running(t)

		self._toggle_underbarrel_wanted = true

		return
	end

	if not action_forbidden then
		self._toggle_underbarrel_wanted = false
		local weapon = self._equipped_unit:base()
		local underbarrel_names = managers.weapon_factory:get_parts_from_weapon_by_type_or_perk("underbarrel", weapon._factory_id, weapon._blueprint)

		if underbarrel_names and underbarrel_names[1] then
			local underbarrel = weapon._parts[underbarrel_names[1]]

			if underbarrel then
				local underbarrel_base = underbarrel.unit:base()
				local underbarrel_tweak = tweak_data.weapon[underbarrel_base.name_id]

				if weapon.record_fire_mode then
					weapon:record_fire_mode()
				end

				underbarrel_base:toggle()

				new_action = true

				if weapon.reset_cached_gadget then
					weapon:reset_cached_gadget()
				end

				if weapon._update_stats_values then
					weapon:_update_stats_values(true)
				end

				local anim_ids = nil
				local switch_delay = 1

				if underbarrel_base:is_on() then
					anim_ids = Idstring("underbarrel_enter_contraband")
					switch_delay = underbarrel_tweak.timers.equip_underbarrel

					self:set_animation_state("underbarrel")
				else
					anim_ids = Idstring("underbarrel_exit_contraband")
					switch_delay = underbarrel_tweak.timers.unequip_underbarrel

					self:set_animation_state("standard")
				end

				if weapon.name_id == "polymer" then
					anim_ids = nil
					switch_delay = 0
				end

				if anim_ids then
					self._ext_camera:play_redirect(anim_ids, 1)
				end

				self:set_animation_weapon_hold(nil)
				self:set_stance_switch_delay(switch_delay)

				if alive(self._equipped_unit) then
					managers.hud:set_ammo_amount(self._equipped_unit:base():selection_index(), self._equipped_unit:base():ammo_info())
					managers.hud:set_teammate_weapon_firemode(HUDManager.PLAYER_PANEL, self._unit:inventory():equipped_selection(), self._equipped_unit:base():fire_mode())
				end

				managers.network:session():send_to_peers_synched("sync_underbarrel_switch", self._equipped_unit:base():selection_index(), underbarrel_base.name_id, underbarrel_base:is_on())
			end
		end
	end

	return new_action
end