Hooks:PostHook( PlayerTweakData, "init", "AK47ModStanceTweakData", function(self)


--AK
	
	self.stances.akmsu_ads = deep_clone(self.stances.flint)
	local ironsight_translation = Vector3(0, -13, -0.4)
	self.stances.akmsu_ads.steelsight.shoulders.translation = self.stances.akmsu_ads.steelsight.shoulders.translation + ironsight_translation
	self.stances.akmsu_ads.steelsight.shoulders.rotation = Rotation(0, 0.5, 0)

	self.stances.vg_akpack = deep_clone(self.stances.flint)
	self.stances.vg_akpack.steelsight.shoulders.translation = Vector3(-10.657, 8.046, 2.82)
	self.stances.vg_akpack.steelsight.shoulders.rotation = Rotation(0.05, 0.05, 0)
	self.stances.vg_akpack.standard.shoulders.translation = self.stances.vg_akpack.standard.shoulders.translation + Vector3(0, 5, 0)

end )