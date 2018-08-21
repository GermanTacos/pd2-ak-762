Hooks:PostHook( NewRaycastWeaponBase, "_update_stats_values", "AK47Mod_update_stats_values", function(self)
	if not self._current_stats then
		return
	end
	
	self._extra_ammo = self._current_stats.extra_ammo_kw or self._current_stats.extra_ammo or self._extra_ammo
	self._total_ammo_mod = self._current_stats.total_ammo_mod_kw or self._current_stats.total_ammo_mod or self._total_ammo_mod
end)