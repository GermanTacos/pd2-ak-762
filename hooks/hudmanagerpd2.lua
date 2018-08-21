local set_teammate_ammo_amount_orig = HUDManager.set_teammate_ammo_amount

function HUDManager:set_teammate_ammo_amount(id, selection_index, max_clip, current_clip, current_left, max)
	local new_selection_index = 2

	if ( selection_index == 1 ) or ( selection_index == 4 ) then
		new_selection_index = 1
	elseif ( selection_index == 2 ) or ( selection_index == 3 ) then
		new_selection_index = 2
	end
	
	return set_teammate_ammo_amount_orig(self, id, new_selection_index, max_clip, current_clip, current_left, max)
end