local Furion = {}
local enemy
local myHero, myTeam
local mana

Furion.optionEnable = Menu.AddOptionBool({"Hero Specific", "Nature's Prophet"}, "Enabled", false)
Menu.AddMenuIcon({"Hero Specific", "Nature's Prophet"}, "panorama/images/heroes/icons/npc_dota_hero_furion_png.vtex_c")
Furion.optionToggleKey = Menu.AddKeyOption({"Hero Specific", "Nature's Prophet"}, "Combo Key", Enum.ButtonCode.KEY_SPACE)
Furion.optionBlock = Menu.AddOptionBool({"Hero Specific", "Nature's Prophet"}, "Treant Block", false)
-- Skills/Items Combo
Furion.optionEnableSprout = Menu.AddOptionBool({"Hero Specific", "Nature's Prophet", "Combo"}, "Sprout", false)
Furion.optionEnableHex = Menu.AddOptionBool({"Hero Specific", "Nature's Prophet", "Combo"}, "Hex", false)
Furion.optionEnableOrchid = Menu.AddOptionBool({"Hero Specific", "Nature's Prophet", "Combo"}, "Orchid", false)
Furion.optionEnableBloodthorn = Menu.AddOptionBool({"Hero Specific", "Nature's Prophet", "Combo"}, "Bloodthorn", false)
Furion.optionEnableHH = Menu.AddOptionBool({"Hero Specific", "Nature's Prophet", "Combo"}, "Heaven's Halberd", false)
Furion.optionEnableDiffusal = Menu.AddOptionBool({"Hero Specific", "Nature's Prophet", "Combo"}, "Diffusal", false)
Furion.optionEnableMedallion = Menu.AddOptionBool({"Hero Specific", "Nature's Prophet", "Combo"}, "Medallion of Courage", false)
Furion.optionEnableSolar= Menu.AddOptionBool({"Hero Specific", "Nature's Prophet", "Combo"}, "Solar Crest", false)
Furion.optionEnableNullifier = Menu.AddOptionBool({"Hero Specific", "Nature's Prophet", "Combo"}, "Nullifier", false)
Furion.optionEnableRod = Menu.AddOptionBool({"Hero Specific", "Nature's Prophet", "Combo"}, "Rod of Atos", false)
Furion.optionEnableUrn = Menu.AddOptionBool({"Hero Specific", "Nature's Prophet", "Combo"}, "Urn of Shadows", false)
Furion.optionEnableVessel = Menu.AddOptionBool({"Hero Specific", "Nature's Prophet", "Combo"}, "Spirit Vessel", false)

Furion.optionLinken = Menu.AddOptionBool({"Hero Specific", "Nature's Prophet"}, "Anti-Linken", false)
-- Items Anti-Linkens Protect
Furion.optionLinkenHex = Menu.AddOptionBool({"Hero Specific", "Nature's Prophet", "Linken"}, "Hex", false)
Furion.optionLinkenOrchid = Menu.AddOptionBool({"Hero Specific", "Nature's Prophet", "Linken"}, "Orchid", false)
Furion.optionLinkenBloodthorn = Menu.AddOptionBool({"Hero Specific", "Nature's Prophet", "Linken"}, "Bloodthorn", false)
Furion.optionLinkenEul = Menu.AddOptionBool({"Hero Specific", "Nature's Prophet", "Linken"}, "Eul", false)
Furion.optionLinkenHH = Menu.AddOptionBool({"Hero Specific", "Nature's Prophet", "Linken"}, "Heaven's Halberd", false)
Furion.optionLinkenDiffusal = Menu.AddOptionBool({"Hero Specific", "Nature's Prophet", "Linken"}, "Diffusal", false)
Furion.optionLinkenForce = Menu.AddOptionBool({"Hero Specific", "Nature's Prophet", "Linken"}, "Force Staff", false)
Furion.optionLinkenPike = Menu.AddOptionBool({"Hero Specific", "Nature's Prophet", "Linken"}, "Hurricane Pike", false)
Furion.optionLinkenMedallion = Menu.AddOptionBool({"Hero Specific", "Nature's Prophet", "Linken"}, "Medallion of Courage", false)
Furion.optionLinkenNullifier = Menu.AddOptionBool({"Hero Specific", "Nature's Prophet", "Linken"}, "Nullifier", false)
Furion.optionLinkenRod = Menu.AddOptionBool({"Hero Specific", "Nature's Prophet", "Linken"}, "Rod", false)
Furion.optionLinkenSolar = Menu.AddOptionBool({"Hero Specific", "Nature's Prophet", "Linken"}, "Solar Crest", false)
Furion.optionLinkenUrn = Menu.AddOptionBool({"Hero Specific", "Nature's Prophet", "Linken"}, "Urn of Shadows", false)
Furion.optionLinkenVessel = Menu.AddOptionBool({"Hero Specific", "Nature's Prophet", "Linken"}, "Spirit Vessel", false)

function Furion.Init()
	myHero = nil
	enemy = nil
	mana = nil
	myTeam = nil
end

function Furion.OnGameStart()
	Furion.Init()
end

function Furion.OnUpdate()
	myHero = Heroes.GetLocal()
	myTeam = Entity.GetTeamNum(myHero)
	enemy = Input.GetNearestHeroToCursor(myTeam, Enum.TeamType.TEAM_ENEMY)
	mana = NPC.GetMana(myHero)
	if not myHero or NPC.GetUnitName(myHero) ~= "npc_dota_hero_furion" then return end
	if Menu.IsEnabled(Furion.optionEnable) and Menu.IsKeyDown(Furion.optionToggleKey) then
		Furion.Combo(myHero, enemy)
	end
end

function Furion.Combo(myHero, enemy)
	myHero = Heroes.GetLocal()
	myTeam = Entity.GetTeamNum(myHero)
	mana = NPC.GetMana(myHero)
	sprout = NPC.GetAbility(myHero, "furion_sprout")
	teleportation = NPC.GetAbility(myHero, "furion_teleportation")
	treants = NPC.GetAbility(myHero, "furion_force_of_nature")
	ultimate = NPC.GetAbility(myHero, "furion_wrath_of_nature")
	hex = NPC.GetItem(myHero, "item_sheepstick")
	orchid = NPC.GetItem(myHero, "item_orchid")
	bloodthorn = NPC.GetItem(myHero, "item_bloodthorn")
	eul = NPC.GetItem(myHero, "item_cyclone")
	hh = NPC.GetItem(myHero, "item_heavens_halberd")
	diffusal = NPC.GetItem(myHero, "item_diffusal_blade")
	force = NPC.GetItem(myHero, "item_force_staff")
	pike = NPC.GetItem(myHero, "item_hurricane_pike")
	medallion = NPC.GetItem(myHero, "item_medallion_of_courage")
	nullifier = NPC.GetItem(myHero, "item_nullifier")
	rod = NPC.GetItem(myHero, "item_rod_of_atos")
	solar = NPC.GetItem(myHero, "item_solar_crest")
	urn = NPC.GetItem(myHero, "item_urn_of_shadows")
	vessel = NPC.GetItem(myHero, "item_spirit_vessel")
	enemy = Input.GetNearestHeroToCursor(myTeam, Enum.TeamType.TEAM_ENEMY)
	
	if Furion.IsLinkensProtected(enemy) and Menu.IsEnabled(Furion.optionLinken) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
		Furion.PoopLinken()
	end

	if Entity.GetHealth(enemy) > 1 and not NPC.HasModifier(enemy, "modifier_item_lotus_orb_active") then
		if treants and Menu.IsEnabled(Furion.optionBlock) and Ability.GetLevel(treants) >=4 and Ability.IsReady(treants) then
			Furion.Block(myHero, enemy)
		end
		if orhid and Menu.IsEnabled(Furion.optionEnableOrchid) and Ability.IsCastable(orchid, mana) and Ability.IsReady(orchid) then
			Ability.CastTarget(orchid, enemy)
		end
		if hex and Menu.IsEnabled(Furion.optionEnableHex) and Ability.IsCastable(hex, mana) and Ability.IsReady(hex) then
			Ability.CastTarget(hex, enemy)
		end
		if bloodthorn and Menu.IsEnabled(Furion.optionEnableBloodthorn) and Ability.IsCastable(bloodthorn, mana) and Ability.IsReady(bloodthorn) then
			Ability.CastTarget(bloodthorn, enemy)
		end
		if hh and Menu.IsEnabled(Furion.optionEnableHH) and Ability.IsCastable(hh, mana) and Ability.IsReady(hh) then
			Ability.CastTarget(hh, enemy)
		end
		if diffusal and Menu.IsEnabled(Furion.optionEnableDiffusal) and Ability.IsCastable(diffusal, 0) and Ability.IsReady(diffusal) then
			Ability.CastTarget(diffusal, enemy)
		end
		if medallion and Menu.IsEnabled(Furion.optionEnableMedallion) and Ability.IsCastable(medallion, mana) and Ability.IsReady(medallion) then
			Ability.CastTarget(medallion, enemy)
		end
		if solar and Menu.IsEnabled(Furion.optionEnableSolar) and Ability.IsCastable(solar, mana) and Ability.IsReady(solar) then
			Ability.CastTarget(solar, enemy)
		end
		if nullifier and Menu.IsEnabled(Furion.optionEnableNullifier) and Ability.IsCastable(nullifier, mana) and Ability.IsReady(nullifier) then
			Ability.CastTarget(nullifier, enemy)
		end
		if rod and Menu.IsEnabled(Furion.optionEnableRod) and Ability.IsCastable(rod, mana) and Ability.IsReady(rod) then
			Ability.CastTarget(rod, enemy)
		end
		if urn and Menu.IsEnabled(Furion.optionEnableUrn) and Ability.IsCastable(urn, mana) and Ability.IsReady(urn) then
			Ability.CastTarget(urn, enemy)
		end
		if vessel and Menu.IsEnabled(Furion.optionEnableVessel) and Ability.IsCastable(vessel, mana) and Ability.IsReady(vessel) then
			Ability.CastTarget(vessel, enemy)
		end
	end
end

function Furion.Block(myHero, enemy)
	sprout = NPC.GetAbility(myHero, "furion_sprout")
	treants = NPC.GetAbility(myHero, "furion_force_of_nature")
	myHero = Heroes.GetLocal()
	mana = NPC.GetMana(myHero)
	enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
	position = Entity.GetAbsOrigin(enemy)

	if Ability.IsCastable(sprout, mana) and Ability.IsReady(sprout) then
		Ability.CastTarget(sprout, enemy)
		if Ability.IsCastable(treants, mana) and Ability.IsReady(treants) then
			Ability.CastPosition(treants, position)
			return
		end
	end
end

function Furion.IsLinkensProtected(npc)
	if NPC.IsLinkensProtected(npc) then
		return true
	end
end

function Furion.PoopLinken(exception)
	if Menu.IsEnabled(Furion.optionLinkenHex) and hex and Ability.IsCastable(hex, mana) then
		Ability.CastTarget(hex, enemy)
		return
	end
	if Menu.IsEnabled(Furion.optionLinkenOrchid) and orchid and Ability.IsCastable(orchid, mana) then
		Ability.CastTarget(orchid, enemy)
		return
	end
	if Menu.IsEnabled(Furion.optionLinkenBloodthorn) and bloodthorn and Ability.IsCastable(bloodthorn, mana) then
		Ability.CastTarget(bloodthorn, enemy)
		return
	end
	if Menu.IsEnabled(Furion.optionLinkenEul) and eul and Ability.IsCastable(eul, mana) and eul ~= exception then
		Ability.CastTarget(eul, enemy)
		return
	end
	if Menu.IsEnabled(Furion.optionLinkenDiffusal) and diffusal and Ability.IsCastable(diffusal, 0) then
		Ability.CastTarget(diffusal, enemy)
		return
	end
	if Menu.IsEnabled(Furion.optionLinkenForce) and force and Ability.IsCastable(force, mana) then
		Ability.CastTarget(force, enemy)
		return
	end
	if Menu.IsEnabled(Furion.optionLinkenPike) and pike and Ability.IsCastable(pike, mana) then
		Ability.CastTarget(pike, enemy)
		return
	end
	if Menu.IsEnabled(Furion.optionLinkenMedallion) and medallion and Ability.IsCastable(medallion, mana) then
		Ability.CastTarget(medallion, enemy)
		return
	end
	if Menu.IsEnabled(Furion.optionLinkenNullifier) and nullifier and Ability.IsCastable(nullifier, mana) then
		Ability.CastTarget(nullifier, enemy)
		return
	end
	if Menu.IsEnabled(Furion.optionLinkenRod) and rod and Ability.IsCastable(rod, mana) then
		Ability.CastTarget(rod, enemy)
		return
	end
	if Menu.IsEnabled(Furion.optionLinkenSolar) and solar and Ability.IsCastable(solar, mana) then
		Ability.CastTarget(solar, enemy)
		return
	end
	if Menu.IsEnabled(Furion.optionLinkenUrn) and urn and Ability.IsCastable(urn, mana) then
		Ability.CastTarget(urn, enemy)
		return
	end
	if Menu.IsEnabled(Furion.optionLinkenVessel) and vessel and Ability.IsCastable(vessel, mana) then
		Ability.CastTarget(vessel, enemy)
		return
	end
	if Menu.IsEnabled(Furion.optionLinkenHH) and hh and Ability.IsCastable(hh, mana) then
		Ability.CastTarget(hh, enemy)
		return
	end
end

return Furion
