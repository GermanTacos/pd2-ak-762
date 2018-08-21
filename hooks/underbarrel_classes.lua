WeaponUnderbarrelRaycast = WeaponUnderbarrelRaycast or class(WeaponUnderbarrel)
WeaponUnderbarrelRaycast.GADGET_TYPE = "underbarrel_launcher"

function WeaponUnderbarrelRaycast:init(unit)
	WeaponUnderbarrel.init(self, unit, false)

	self._unit = unit
	self._name_id = self.name_id or "test_raycast_weapon"
	self.name_id = nil

	self._can_shoot_through_shield = tweak_data.weapon[self._name_id].can_shoot_through_shield
	self._can_shoot_through_enemy = tweak_data.weapon[self._name_id].can_shoot_through_enemy
	self._can_shoot_through_wall = tweak_data.weapon[self._name_id].can_shoot_through_wall

	self._bullet_class = InstantBulletBase
	self._bullet_slotmask = self._bullet_class:bullet_slotmask()

	self._setup = {}
	self._setup.ignore_units = {
		unit
	}

	local stats = tweak_data.weapon[self._name_id].stats
	local weapon_stats = tweak_data.weapon.stats

	if stats then
		self._spread = self._spread or weapon_stats.spread[stats.spread]
	else
		self._spread = 1
	end

	self:update_damage()
end

function WeaponUnderbarrelRaycast:damage_multiplier()
	local multiplier = 1

	for _, category in ipairs(tweak_data.weapon[self._name_id].categories) do
		multiplier = multiplier * managers.player:upgrade_value(category, "damage_multiplier", 1)
	end

	multiplier = multiplier * managers.player:upgrade_value(self._name_id, "damage_multiplier", 1)

	return multiplier
end

function WeaponUnderbarrelRaycast:update_damage()
	self._damage = tweak_data.weapon[self._name_id].DAMAGE * self:damage_multiplier()
end

function WeaponUnderbarrelRaycast:spread_multiplier()
	local multiplier = 1

	for _, category in ipairs(tweak_data.weapon[self._name_id].categories) do
		multiplier = multiplier * managers.player:upgrade_value(category, "spread_multiplier", 1)
	end

	multiplier = multiplier * managers.player:upgrade_value("weapon", "single_spread_multiplier", 1)
	multiplier = multiplier * managers.player:upgrade_value(self._name_id, "spread_multiplier", 1)

	return multiplier
end

function WeaponUnderbarrelRaycast:_get_spread(user_unit)
	local spread_multiplier = self:spread_multiplier()
	local current_state = user_unit:movement()._current_state

	if current_state._moving then
		for _, category in ipairs(tweak_data.weapon[self._name_id].categories) do
			spread_multiplier = spread_multiplier * managers.player:upgrade_value(category, "move_spread_multiplier", 1)
		end
	end

	if current_state:in_steelsight() then
		return self._spread * tweak_data.weapon[self._name_id].spread[current_state._moving and "moving_steelsight" or "steelsight"] * spread_multiplier
	end

	for _, category in ipairs(tweak_data.weapon[self._name_id].categories) do
		spread_multiplier = spread_multiplier * managers.player:upgrade_value(category, "hip_fire_spread_multiplier", 1)
	end

	if current_state._state_data.ducking then
		return self._spread * tweak_data.weapon[self._name_id].spread[current_state._moving and "moving_crouching" or "crouching"] * spread_multiplier
	end

	return self._spread * tweak_data.weapon[self._name_id].spread[current_state._moving and "moving_standing" or "standing"] * spread_multiplier
end

function WeaponUnderbarrelRaycast:_get_current_damage(dmg_mul)
	local damage = self._damage * (dmg_mul or 1)
	damage = damage * managers.player:temporary_upgrade_value("temporary", "combat_medic_damage_multiplier", 1)

	return damage
end

function WeaponUnderbarrelRaycast:_collect_hits(from, to)
	local can_shoot_through = self._can_shoot_through_wall or self._can_shoot_through_shield or self._can_shoot_through_enemy
	local ray_hits = nil
	local hit_enemy = false
	local enemy_mask = managers.slot:get_mask("enemies")
	local wall_mask = managers.slot:get_mask("world_geometry", "vehicles")
	local shield_mask = managers.slot:get_mask("enemy_shield_check")
	local ai_vision_ids = Idstring("ai_vision")
	ray_hits = self._can_shoot_through_wall and World:raycast_wall("ray", from, to, "slot_mask", self._bullet_slotmask, "ignore_unit", self._setup.ignore_units, "thickness", 40, "thickness_mask", wall_mask) or World:raycast_all("ray", from, to, "slot_mask", self._bullet_slotmask, "ignore_unit", self._setup.ignore_units)
	local units_hit = {}
	local unique_hits = {}

	for i, hit in ipairs(ray_hits) do
		if not units_hit[hit.unit:key()] then
			units_hit[hit.unit:key()] = true
			unique_hits[#unique_hits + 1] = hit
			hit.hit_position = hit.position
			hit_enemy = hit_enemy or hit.unit:in_slot(enemy_mask)
			local weak_body = hit.body:has_ray_type(ai_vision_ids)

			if not self._can_shoot_through_enemy and hit_enemy then
				break
			elseif not self._can_shoot_through_wall and hit.unit:in_slot(wall_mask) and weak_body then
				break
			elseif not self._can_shoot_through_shield and hit.unit:in_slot(shield_mask) then
				break
			end
		end
	end

	return unique_hits, hit_enemy
end

function WeaponUnderbarrelRaycast:get_name_id()
	return self._name_id
end

local mvec_to = Vector3()
local mvec_spread_direction = Vector3()

function WeaponUnderbarrelRaycast:_fire_raycast(weapon_base, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
	local result = {}
	local spread_x = self:_get_spread(user_unit) or 1
	local spread_y = spread_x
	local ray_distance = self._weapon_range or 20000
	local right = direction:cross(Vector3(0, 0, 1)):normalized()
	local up = direction:cross(right):normalized()
	local theta = math.random() * 360
	local ax = math.sin(theta) * math.random() * spread_x * (spread_mul or 1)
	local ay = math.cos(theta) * math.random() * spread_y * (spread_mul or 1)

	mvector3.set(mvec_spread_direction, direction)
	mvector3.add(mvec_spread_direction, right * math.rad(ax))
	mvector3.add(mvec_spread_direction, up * math.rad(ay))
	mvector3.set(mvec_to, mvec_spread_direction)
	mvector3.multiply(mvec_to, ray_distance)
	mvector3.add(mvec_to, from_pos)

	local damage = self:_get_current_damage(dmg_mul)
	local ray_hits, hit_enemy = self:_collect_hits(from_pos, mvec_to)
	local hit_anyone = false

	local hit_count = 0
	local cop_kill_count = 0
	local hit_through_wall = false
	local hit_through_shield = false
	local hit_result = nil

	for _, hit in ipairs(ray_hits) do
		hit_result = self._bullet_class:on_collision(hit, self._unit, user_unit, damage)

		if hit_result and hit_result.type == "death" then
			local unit_type = hit.unit:base() and hit.unit:base()._tweak_table
			local is_civilian = unit_type and CopDamage.is_civilian(unit_type)

			if not is_civilian then
				cop_kill_count = cop_kill_count + 1
			end
		end

		if hit_result then
			hit.damage_result = hit_result
			hit_anyone = true
			hit_count = hit_count + 1
		end

		if hit.unit:in_slot(managers.slot:get_mask("world_geometry")) then
			hit_through_wall = true
		elseif hit.unit:in_slot(managers.slot:get_mask("enemy_shield_check")) then
			hit_through_shield = hit_through_shield or alive(hit.unit:parent())
		end

		if hit_result and hit_result.type == "death" and cop_kill_count > 0 then
			local unit_type = hit.unit:base() and hit.unit:base()._tweak_table
			local multi_kill, enemy_pass, obstacle_pass, weapon_pass, weapons_pass, weapon_type_pass = nil
		end
	end

	result.hit_enemy = hit_anyone

	self:on_shot()

	return result
end

WeaponUnderbarrelShotgun = WeaponUnderbarrelShotgun or class(WeaponUnderbarrelRaycast)
WeaponUnderbarrelShotgun.GADGET_TYPE = "underbarrel_launcher"

function WeaponUnderbarrelShotgun:init(unit)
	WeaponUnderbarrelRaycast.init(self, unit)

	self._rays = tweak_data.weapon[self._name_id].rays or 6
end

function WeaponUnderbarrelShotgun:_collect_hits(from, to, shoot_through_data)
	local can_shoot_through = self._can_shoot_through_wall or self._can_shoot_through_shield or self._can_shoot_through_enemy
	local ray_hits = nil
	local hit_enemy = false
	local enemy_mask = managers.slot:get_mask("enemies")
	local wall_mask = managers.slot:get_mask("world_geometry", "vehicles")
	local shield_mask = managers.slot:get_mask("enemy_shield_check")
	local ai_vision_ids = Idstring("ai_vision")

	local ray_from_unit = shoot_through_data and alive(shoot_through_data.ray_from_unit) and shoot_through_data.ray_from_unit or nil
	ray_hits = self._can_shoot_through_wall and (ray_from_unit or World):raycast_wall("ray", from, to, "slot_mask", self._bullet_slotmask, "ignore_unit", self._setup.ignore_units, "thickness", 40, "thickness_mask", wall_mask) or (ray_from_unit or World):raycast_all("ray", from, to, "slot_mask", self._bullet_slotmask, "ignore_unit", self._setup.ignore_units)
	
	local units_hit = {}
	local unique_hits = {}

	for i, hit in ipairs(ray_hits) do
		if not units_hit[hit.unit:key()] then
			units_hit[hit.unit:key()] = true
			unique_hits[#unique_hits + 1] = hit
			hit.hit_position = hit.position
			hit_enemy = hit_enemy or hit.unit:in_slot(enemy_mask)
			local weak_body = hit.body:has_ray_type(ai_vision_ids)

			if not self._can_shoot_through_enemy and hit_enemy then
				break
			elseif not self._can_shoot_through_wall and hit.unit:in_slot(wall_mask) and weak_body then
				break
			elseif not self._can_shoot_through_shield and hit.unit:in_slot(shield_mask) then
				break
			end
		end
	end

	return unique_hits, hit_enemy
end

local mvec_temp = Vector3()
local mvec_to = Vector3()
local mvec_direction = Vector3()
local mvec_spread_direction = Vector3()

function WeaponUnderbarrelShotgun:_fire_raycast(weapon_base, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
	local result = {}
	local spread_x = self:_get_spread(user_unit) or 1
	local spread_y = spread_x
	local ray_distance = self._weapon_range or 20000
	local right = direction:cross(Vector3(0, 0, 1)):normalized()
	local up = direction:cross(right):normalized()

	local hit_enemies = {}
	local damaged_enemies = {}
	local hit_objects = {}

	local hit_anyone = false

	for i = 1, shoot_through_data and 1 or self._rays, 1 do
		local theta = math.random() * 360
		local ax = math.sin(theta) * math.random() * spread_x * (spread_mul or 1)
		local ay = math.cos(theta) * math.random() * spread_y * (spread_mul or 1)

		mvector3.set(mvec_spread_direction, direction)
		mvector3.add(mvec_spread_direction, right * math.rad(ax))
		mvector3.add(mvec_spread_direction, up * math.rad(ay))
		mvector3.set(mvec_to, mvec_spread_direction)
		mvector3.multiply(mvec_to, ray_distance)
		mvector3.add(mvec_to, from_pos)

		local damage = self:_get_current_damage(dmg_mul)
		local ray_hits, hit_enemy = self:_collect_hits(from_pos, mvec_to, shoot_through_data)

		local hit_count = 0
		local cop_kill_count = 0
		local hit_through_wall = false
		local hit_through_shield = false
		local hit_result = nil

		local function hit_enemy(col_ray)
			if col_ray.unit:character_damage() then
				local enemy_key = col_ray.unit:key()

				if not hit_enemies[enemy_key] or col_ray.unit:character_damage().is_head and col_ray.unit:character_damage():is_head(col_ray.body) then
					hit_enemies[enemy_key] = col_ray
				end

				if not col_ray.unit:character_damage().is_head then
					self._bullet_class:on_collision_effects(col_ray, self._unit, user_unit, damage)
				end

				hit_anyone = true
			else
				local add_shoot_through_bullet = self._can_shoot_through_shield or self._can_shoot_through_wall

				if add_shoot_through_bullet then
					hit_objects[col_ray.unit:key()] = hit_objects[col_ray.unit:key()] or {}

					table.insert(hit_objects[col_ray.unit:key()], col_ray)
				else
					self._bullet_class:on_collision(col_ray, self._unit, user_unit, damage)
				end
			end
		end

		for _, hit in ipairs(ray_hits) do
			hit_enemy(hit)
		end

		for _, col_ray in pairs(hit_enemies) do
			if damage > 0 then
				if not damaged_enemies[col_ray.unit:key()] then
					damaged_enemies[col_ray.unit:key()] = col_ray
					local my_result = nil
					local add_shoot_through_bullet = self._can_shoot_through_shield or self._can_shoot_through_enemy or self._can_shoot_through_wall
					my_result = add_shoot_through_bullet and WeaponUnderbarrelRaycast.super._fire_raycast(self, weapon_base, user_unit, from_pos, center_ray.ray, dmg_mul, shoot_player, 0, autohit_mul, suppr_mul, shoot_through_data) or self._bullet_class:on_collision(col_ray, self._unit, user_unit, damage)
					my_result = managers.mutators:modify_value("WeaponUnderbarrelRaycast:_fire_raycast", my_result)

					if my_result and my_result.type == "death" then
						managers.game_play_central:do_shotgun_push(col_ray.unit, col_ray.position, col_ray.ray, col_ray.distance, user_unit)

						kill_data.kills = kill_data.kills + 1

						if col_ray.body and col_ray.body:name() == Idstring("head") then
							kill_data.headshots = kill_data.headshots + 1
						end

						if col_ray.unit and col_ray.unit:base() and (col_ray.unit:base()._tweak_table == "civilian" or col_ray.unit:base()._tweak_table == "civilian_female") then
							kill_data.civilian_kills = kill_data.civilian_kills + 1
						end
					end
				end
			end
		end

		for _, col_rays in pairs(hit_objects) do
			local center_ray = col_rays[1]

			if #col_rays > 1 then
				mvector3.set_static(mvec_temp, center_ray)

				for _, col_ray in ipairs(col_rays) do
					mvector3.add(mvec_temp, col_ray.position)
				end

				mvector3.divide(mvec_temp, #col_rays)

				local closest_dist_sq = mvector3.distance_sq(mvec_temp, center_ray.position)
				local dist_sq = nil

				for _, col_ray in ipairs(col_rays) do
					dist_sq = mvector3.distance_sq(mvec_temp, col_ray.position)

					if dist_sq < closest_dist_sq then
						closest_dist_sq = dist_sq
						center_ray = col_ray
					end
				end
			end
		end
	end

	result.hit_enemy = hit_anyone

	self:on_shot()

	return result
end