Hooks:PostHook( PlayerTweakData, "init", "AK47ModStanceTweakData", function(self)


--AK
	
	self.stances.heffy_762_ads = deep_clone(self.stances.flint)
	local ironsight_translation = Vector3(0, -13, 0.518)
	self.stances.heffy_762_ads.steelsight.shoulders.translation = self.stances.heffy_762_ads.steelsight.shoulders.translation + ironsight_translation 

	self.stances.akmsu_ads = deep_clone(self.stances.flint)
	local ironsight_translation = Vector3(0, -13, -0.4)
	self.stances.akmsu_ads.steelsight.shoulders.translation = self.stances.akmsu_ads.steelsight.shoulders.translation + ironsight_translation
	self.stances.akmsu_ads.steelsight.shoulders.rotation = Rotation(0, 0.5, 0)

end )