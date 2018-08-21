log( "test_ak762_1" )
WeaponDescription = WeaponDescription or class()
WeaponDescription._stats_shown = {
	{
		round_value = true,
		name = "magazine",
		stat_name = "extra_ammo" or "extra_ammo_kw"
	},
	{
		round_value = true,
		name = "totalammo",
		stat_name = "total_ammo_mod" or "total_ammo_mod_kw"
	},
	{
		round_value = true,
		name = "fire_rate"
	},
	{name = "damage"},
	{
		percent = true,
		name = "spread",
		offset = true,
		revert = true
	},
	{
		percent = true,
		name = "recoil",
		offset = true,
		revert = true
	},
	{
		index = true,
		name = "concealment"
	},
	{
		percent = false,
		name = "suppression",
		offset = true
	}
}


function WeaponDescription._get_stats(name, category, slot, blueprint)
	log( "test_ak762_2" )
	local equipped_mods = nil
	local silencer = false
	local single_mod = false
	local auto_mod = false
	local factory_id = managers.weapon_factory:get_factory_id_by_weapon_id(name)
	local blueprint = blueprint or slot and managers.blackmarket:get_weapon_blueprint(category, slot) or managers.weapon_factory:get_default_blueprint_by_factory_id(factory_id)
	local cosmetics = managers.blackmarket:get_weapon_cosmetics(category, slot)
	local bonus_stats = {}

	if cosmetics and cosmetics.id and cosmetics.bonus and not managers.job:is_current_job_competitive() and not managers.weapon_factory:has_perk("bonus", factory_id, blueprint) then
		bonus_stats = tweak_data:get_raw_value("economy", "bonuses", tweak_data.blackmarket.weapon_skins[cosmetics.id].bonus, "stats") or {}
	end

	if blueprint then
		equipped_mods = deep_clone(blueprint)
		local factory_id = managers.weapon_factory:get_factory_id_by_weapon_id(name)
		local default_blueprint = managers.weapon_factory:get_default_blueprint_by_factory_id(factory_id)

		if equipped_mods then
			silencer = managers.weapon_factory:has_perk("silencer", factory_id, equipped_mods)
			single_mod = managers.weapon_factory:has_perk("fire_mode_single", factory_id, equipped_mods)
			auto_mod = managers.weapon_factory:has_perk("fire_mode_auto", factory_id, equipped_mods)
		end
	end

	local base_stats = WeaponDescription._get_base_stats(name)
	local mods_stats = WeaponDescription._get_mods_stats(name, base_stats, equipped_mods, bonus_stats)
	local skill_stats = WeaponDescription._get_skill_stats(name, category, slot, base_stats, mods_stats, silencer, single_mod, auto_mod, blueprint)
	local clip_ammo, max_ammo, ammo_data = WeaponDescription.get_weapon_ammo_info(name, tweak_data.weapon[name].stats.extra_ammo or tweak_data.weapon[name].stats.extra_ammo_kw, base_stats.totalammo.index + mods_stats.totalammo.index) -- this is the line that is meantioned in the crash log
	base_stats.totalammo.value = ammo_data.base
	mods_stats.totalammo.value = ammo_data.mod
	skill_stats.totalammo.value = ammo_data.skill
	skill_stats.totalammo.skill_in_effect = ammo_data.skill_in_effect
	local my_clip = base_stats.magazine.value + mods_stats.magazine.value + skill_stats.magazine.value

	if max_ammo < my_clip then
		mods_stats.magazine.value = mods_stats.magazine.value + max_ammo - my_clip
	end

	return base_stats, mods_stats, skill_stats
end

function WeaponDescription._get_base_stats(name)
	local base_stats = {}
	local index = nil
	local tweak_stats = tweak_data.weapon.stats
	local modifier_stats = tweak_data.weapon[name].stats_modifiers

	for _, stat in pairs(WeaponDescription._stats_shown) do
		base_stats[stat.name] = {}

		if stat.name == "magazine" then
			base_stats[stat.name].index = 0
			base_stats[stat.name].value = tweak_data.weapon[name].CLIP_AMMO_MAX
		elseif stat.name == "totalammo" then
			index = math.clamp(tweak_data.weapon[name].stats.total_ammo_mod or tweak_data.weapon[name].stats.total_ammo_mod_kw, 1, #tweak_stats.total_ammo_mod or #tweak_stats.total_ammo_mod_kw)
			base_stats[stat.name].index = tweak_data.weapon[name].stats.total_ammo_mod or tweak_data.weapon[name].stats.total_ammo_mod_kw
			base_stats[stat.name].value = tweak_data.weapon[name].AMMO_MAX
		elseif stat.name == "fire_rate" then
			local fire_rate = 60 / tweak_data.weapon[name].fire_mode_data.fire_rate
			base_stats[stat.name].value = fire_rate / 10 * 10
		elseif stat.name == "reload" then
			index = math.clamp(tweak_data.weapon[name].stats[stat.name], 1, #tweak_stats[stat.name])
			base_stats[stat.name].index = tweak_data.weapon[name].stats[stat.name]
			local reload_time = managers.blackmarket:get_reload_time(name)
			local mult = 1 / tweak_data.weapon.stats[stat.name][index]
			base_stats[stat.name].value = reload_time * mult
		elseif tweak_stats[stat.name] then
			index = math.clamp(tweak_data.weapon[name].stats[stat.name], 1, #tweak_stats[stat.name])
			base_stats[stat.name].index = index
			base_stats[stat.name].value = stat.index and index or tweak_stats[stat.name][index] * tweak_data.gui.stats_present_multiplier
			local offset = math.min(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier

			if stat.offset then
				base_stats[stat.name].value = base_stats[stat.name].value - offset
			end

			if stat.revert then
				local max_stat = math.max(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier

				if stat.offset then
					max_stat = max_stat - offset
				end

				base_stats[stat.name].value = max_stat - base_stats[stat.name].value
			end

			if modifier_stats and modifier_stats[stat.name] then
				local mod = modifier_stats[stat.name]

				if stat.revert and not stat.index then
					local real_base_value = tweak_stats[stat.name][index]
					local modded_value = real_base_value * mod
					local offset = math.min(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]])

					if stat.offset then
						modded_value = modded_value - offset
					end

					local max_stat = math.max(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]])

					if stat.offset then
						max_stat = max_stat - offset
					end

					local new_value = (max_stat - modded_value) * tweak_data.gui.stats_present_multiplier

					if mod ~= 0 and (tweak_stats[stat.name][1] < modded_value or modded_value < tweak_stats[stat.name][#tweak_stats[stat.name]]) then
						new_value = (new_value + base_stats[stat.name].value / mod) / 2
					end

					base_stats[stat.name].value = new_value
				else
					base_stats[stat.name].value = base_stats[stat.name].value * mod
				end
			end

			if stat.percent then
				local max_stat = stat.index and #tweak_stats[stat.name] or math.max(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier

				if stat.offset then
					max_stat = max_stat - offset
				end

				local ratio = base_stats[stat.name].value / max_stat
				base_stats[stat.name].value = ratio * 100
			end
		end
	end

	return base_stats
end

function WeaponDescription._get_mods_stats(name, base_stats, equipped_mods, bonus_stats)
	local mods_stats = {}
	local modifier_stats = tweak_data.weapon[name].stats_modifiers

	for _, stat in pairs(WeaponDescription._stats_shown) do
		mods_stats[stat.name] = {
			index = 0,
			value = 0
		}
	end

	if equipped_mods then
		local tweak_stats = tweak_data.weapon.stats
		local tweak_factory = tweak_data.weapon.factory.parts
		local factory_id = managers.weapon_factory:get_factory_id_by_weapon_id(name)
		local default_blueprint = managers.weapon_factory:get_default_blueprint_by_factory_id(factory_id)

		if bonus_stats then
			for _, stat in pairs(WeaponDescription._stats_shown) do
				if stat.name == "magazine" then
					local ammo = mods_stats[stat.name].index
					ammo = ammo and ammo + (tweak_data.weapon[name].stats.extra_ammo or tweak_data.weapon[name].stats.extra_ammo_kw or 0)
					mods_stats[stat.name].value = mods_stats[stat.name].value + (ammo and tweak_data.weapon.stats.extra_ammo[ammo] or tweak_data.weapon.stats.extra_ammo_kw[ammo] or 0)
				elseif stat.name == "totalammo" then
					local ammo = bonus_stats.total_ammo_mod or bonus_stats.total_ammo_mod_kw
					mods_stats[stat.name].index = mods_stats[stat.name].index + (ammo or 0)
				else
					mods_stats[stat.name].index = mods_stats[stat.name].index + (bonus_stats[stat.name] or 0)
				end
			end
		end

		local part_data = nil

		for _, mod in ipairs(equipped_mods) do
			part_data = managers.weapon_factory:get_part_data_by_part_id_from_weapon(mod, factory_id, default_blueprint)

			if part_data then
				for _, stat in pairs(WeaponDescription._stats_shown) do
					if part_data.stats then
						if stat.name == "magazine" then
							local ammo = part_data.stats.extra_ammo or part_data.stats.extra_ammo_kw
							ammo = ammo and ammo + (tweak_data.weapon[name].stats.extra_ammo or tweak_data.weapon[name].stats.extra_ammo_kw or 0)
							mods_stats[stat.name].value = mods_stats[stat.name].value + (ammo and tweak_data.weapon.stats.extra_ammo[ammo] or tweak_data.weapon.stats.extra_ammo_kw[ammo] or 0)
						elseif stat.name == "totalammo" then
							local ammo = part_data.stats.total_ammo_mod or part_data.stats.total_ammo_mod_kw
							mods_stats[stat.name].index = mods_stats[stat.name].index + (ammo or 0)
						elseif stat.name == "reload" then
							if not base_stats[stat.name].index then
								debug_pause("weapon is missing reload stat", name)
							end

							local chosen_index = part_data.stats.reload or 0
							chosen_index = math.clamp(base_stats[stat.name].index + chosen_index, 1, #tweak_stats[stat.name])
							local mult = 1 / tweak_data.weapon.stats[stat.name][chosen_index]
							mods_stats[stat.name].value = base_stats[stat.name].value * mult
							mods_stats[stat.name].index = chosen_index
						else
							mods_stats[stat.name].index = mods_stats[stat.name].index + (part_data.stats[stat.name] or 0)
						end
					end
				end
			end
		end

		local index, stat_name = nil

		for _, stat in pairs(WeaponDescription._stats_shown) do
			stat_name = stat.name

			if mods_stats[stat.name].index and tweak_stats[stat_name] then
				index = stat.name == "concealment" and base_stats[stat.name].index + mods_stats[stat.name].index or math.clamp(base_stats[stat.name].index + mods_stats[stat.name].index, 1, #tweak_stats[stat_name])

				if stat.name ~= "reload" then
					mods_stats[stat.name].value = stat.index and index or tweak_stats[stat_name][index] * tweak_data.gui.stats_present_multiplier
				end

				local offset = math.min(tweak_stats[stat_name][1], tweak_stats[stat_name][#tweak_stats[stat_name]]) * tweak_data.gui.stats_present_multiplier

				if stat.offset then
					mods_stats[stat.name].value = mods_stats[stat.name].value - offset
				end

				if stat.revert then
					local max_stat = math.max(tweak_stats[stat_name][1], tweak_stats[stat_name][#tweak_stats[stat_name]]) * tweak_data.gui.stats_present_multiplier

					if stat.offset then
						max_stat = max_stat - offset
					end

					mods_stats[stat.name].value = max_stat - mods_stats[stat.name].value
				end

				if modifier_stats and modifier_stats[stat.name] then
					local mod = modifier_stats[stat.name]

					if stat.revert and not stat.index then
						local real_base_value = tweak_stats[stat_name][index]
						local modded_value = real_base_value * mod
						local offset = math.min(tweak_stats[stat_name][1], tweak_stats[stat_name][#tweak_stats[stat_name]])

						if stat.offset then
							modded_value = modded_value - offset
						end

						local max_stat = math.max(tweak_stats[stat_name][1], tweak_stats[stat_name][#tweak_stats[stat_name]])

						if stat.offset then
							max_stat = max_stat - offset
						end

						local new_value = (max_stat - modded_value) * tweak_data.gui.stats_present_multiplier

						if mod ~= 0 and (tweak_stats[stat_name][1] < modded_value or modded_value < tweak_stats[stat_name][#tweak_stats[stat_name]]) then
							new_value = (new_value + mods_stats[stat.name].value / mod) / 2
						end

						mods_stats[stat.name].value = new_value
					else
						mods_stats[stat.name].value = mods_stats[stat.name].value * mod
					end
				end

				if stat.percent then
					local max_stat = stat.index and #tweak_stats[stat.name] or math.max(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier

					if stat.offset then
						max_stat = max_stat - offset
					end

					local ratio = mods_stats[stat.name].value / max_stat
					mods_stats[stat.name].value = ratio * 100
				end

				mods_stats[stat.name].value = mods_stats[stat.name].value - base_stats[stat.name].value
			end
		end
	end

	return mods_stats
end