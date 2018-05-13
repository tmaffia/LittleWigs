if not C_ChatInfo then return end -- XXX Don't load outside of 8.0

--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Freehold Trash", 1754)
if not mod then return end
mod.displayName = CL.trash
mod:RegisterEnableMob(
	129743, -- Sharkbait
	129602, -- Irontide Enforcer
	129788, -- Irontide Bonesaw
	126918, -- Irontide Crackshot
	126928, -- Irontide Corsair
	129559, -- Cutwater Duelist
	127111, -- Irontide Oarsman
	129529, -- Blacktooth Scrapper
	129547, -- Blacktooth Knuckleduster
	129526, -- Bilge Rat Swabby
	130404, -- Vermin Trapper
	129527, -- Bilge Rat Ooker
	129550, -- Bilge Rat Padfoot
	130024, -- Soggy Shiprat
	130400, -- Irontide Crusher
	130099, -- Lightning
	129699, -- Ludwig Von Tortollen
	130011, -- Irontide Buccaneer
	130012, -- Irontide Ravager
	127106, -- Irontide Officer
	126919 -- Irontide Stormcaller
)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	L.sharkbait = "Sharkbait"
	L.enforcer = "Irontide Enforcer"
	L.bonesaw = "Irontide Bonesaw"
	L.crackshot = "Irontide Crackshot"
	L.corsair = "Irontide Corsair"
	L.duelist = "Cutwater Duelist"
	L.oarsman = "Irontide Oarsman"
	L.scrapper = "Blacktooth Scrapper"
	L.knuckleduster = "Blacktooth Knuckleduster"
	L.swabby = "Bilge Rat Swabby"
	L.trapper = "Vermin Trapper"
	L.ooker = "Bilge Rat Ooker"
	L.padfoot = "Bilge Rat Padfoot"
	L.rat = "Soggy Shiprat"
	L.crusher = "Irontide Crusher"
	L.lightning = "Lightning"
	L.lightning_caught = "Lightning caught!" -- XXX caught by %t?
	L.ludwig = "Ludwig Von Tortollen"
	L.buccaneer = "Irontide Buccaneer"
	L.ravager = "Irontide Ravager"
	L.officer = "Irontide Officer"
	L.stormcaller = "Irontide Stormcaller"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		-- Sharkbait
		257272, -- Vile Bombardment
		-- Irontide Enforcer
		257426, -- Brutal Backhand
		-- Irontide Bonesaw
		257397, -- Healing Balm
		258323, -- Infected Wound
		-- Irontide Crackshot
		258672, -- Azerite Grenade
		-- Irontide Corsair
		257437, -- Poisoning Strike
		-- Cutwater Duelist
		274400, -- Duelist Dash
		--Irontide Oarsman
		258777, -- Sea Spout
		-- Blacktooth Scrapper
		257739, -- Blind Rage
		-- Blacktooth Knuckleduster
		257732, -- Shattering Bellow
		-- Bilge Rat Swabby
		274507, -- Slippery Suds
		-- Vermin Trapper
		274383, -- Rat Traps
		-- Bilge Rat Ooker
		257756, -- Goin' Bananas
		-- Bilge Rat Padfoot
		257775, -- Plague Step
		-- Soggy Shiprat
		274555, -- Scabrous Bite
		-- Irontide Crusher
		258181, -- Boulder Throw
		258199, -- Ground Shatter
		-- Lightning
		257829, -- Greasy
		-- Ludwig Von Tortollen
		257904, -- Shell Bounce
		-- Irontide Buccaneer
		257870, -- Blade Barrage
		-- Irontide Ravager
		257899, -- Painful Motivation
		-- Irontide Officer
		257908, -- Oiled Blade
		-- Irontide Stormcaller
		257736, -- Thundering Squal
	}, {
		[257272] = L.sharkbait,
		[257426] = L.enforcer,
		[257397] = L.bonesaw,
		[258672] = L.crackshot,
		[257437] = L.corsair,
		[274400] = L.duelist,
		[258777] = L.oarsman,
		[257739] = L.scrapper,
		[257732] = L.knuckleduster,
		[274507] = L.swabby,
		[274383] = L.trapper,
		[257756] = L.ooker,
		[257775] = L.padfoot,
		[274555] = L.rat,
		[258181] = L.crusher,
		[257829] = L.lightning,
		[257904] = L.ludwig,
		[257870] = L.buccaneer,
		[257899] = L.ravager,
		[257908] = L.officer,
		[257736] = L.stormcaller,
	}
end

function mod:OnBossEnable()
	self:RegisterMessage("BigWigs_OnBossEngage", "Disable")

	-- Sharkbait
	self:Log("SPELL_CAST_SUCCESS", "VileBombardment", 257272)
	self:Log("SPELL_AURA_APPLIED", "VileCoating", 257274)
	self:Log("SPELL_PERIODIC_DAMAGE", "VileCoating", 257274)
	self:Log("SPELL_PERIODIC_MISSED", "VileCoating", 257274)
	-- Irontide Enforcer
	self:Log("SPELL_CAST_START", "BrutalBackhand", 257426)
	-- Irontide Bonesaw
	self:Log("SPELL_CAST_START", "HealingBalm", 257397)
	self:Log("SPELL_AURA_APPLIED", "HealingBalmApplied", 257397)
	self:Log("SPELL_AURA_APPLIED", "InfectedWoundApplied", 258323)
	-- Irontide Crackshot
	self:Log("SPELL_CAST_START", "AzeriteGrenade", 258672)
	-- Irontide Corsair
	self:Log("SPELL_AURA_APPLIED", "PoisoningStrikeApplied", 257437)
	self:Log("SPELL_AURA_APPLIED_DOSE", "PoisoningStrikeApplied", 257437)
	-- Cutwater Duelist
	self:Log("SPELL_CAST_START", "DuelistDash", 274400)
	-- Irontide Oarsman
	self:Log("SPELL_CAST_START", "SeaSpout", 258777)
	-- Blacktooth Scrapper
	self:Log("SPELL_AURA_APPLIED", "BlindRage", 257739)
	-- Blacktooth Knuckleduster
	self:Log("SPELL_CAST_START", "ShatteringBellow", 257732)
	-- Bilge Rat Swabby
	self:Log("SPELL_CAST_START", "SlipperySuds", 274507)
	self:Log("SPELL_AURA_APPLIED", "SlipperySudsApplied", 274507)
	-- Vermin Trapper
	self:Log("SPELL_CAST_START", "RatTraps", 274383)
	-- Bilge Rat Ooker
	self:Log("SPELL_CAST_START", "GoinBananas", 257756)
	-- Bilge Rat Padfoot
	self:Log("SPELL_AURA_APPLIED", "PlagueStepApplied", 257775)
	-- Soggy Shiprat
	self:Log("SPELL_AURA_APPLIED", "ScabrousBiteApplied", 274555)
	self:Log("SPELL_AURA_APPLIED_DOSE", "ScabrousBiteApplied", 274555)
	-- Irontide Crusher
	self:Log("SPELL_CAST_START", "BoulderThrow", 258181)
	self:Log("SPELL_CAST_START", "GroundShatter", 258199)
	-- Lightning
	self:Log("SPELL_AURA_REMOVED_DOSE", "GreasyRemoved", 257829)
	self:Log("SPELL_AURA_REMOVED", "GreasyRemoved", 257829)
	-- Ludwig Von Tortollen
	self:Log("SPELL_CAST_START", "ShellBounce", 257904)
	-- Irontide Buccaneer
	self:Log("SPELL_CAST_START", "BladeBarrage", 257870)
	-- Irontide Ravager
	self:Log("SPELL_CAST_START", "PainfulMotivation", 257899)
	self:Log("SPELL_AURA_APPLIED", "PainfulMotivationApplied", 257899)
	-- Irontide Officer
	self:Log("SPELL_AURA_APPLIED", "OiledBladeApplied", 257908)
	-- Irontide Stormcaller
	self:Log("SPELL_CAST_START", "ThunderingSquall", 257736)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

-- Sharkbait
function mod:VileBombardment(args)
	self:Bar(args.spellId, 16)
end

do
	local prev = 0
	function mod:VileCoating(args)
		if self:Me(args.destGUID) then
			local t = GetTime()
			if t-prev > 1.5 then
				prev = t
				self:Message(257272, "blue", nil, CL.underyou:format(args.spellName))
				self:PlaySound(257272, "alarm", "gtfo")
			end
		end
	end
end

-- Irontide Enforcer
function mod:BrutalBackhand(args)
	self:Message(args.spellId, "red")
	self:PlaySound(args.spellId, "alarm")
end

-- Irontide Bonesaw
function mod:HealingBalm(args)
	self:Message(args.spellId, "yellow")
	self:PlaySound(args.spellId, "warning")
end

function mod:HealingBalmApplied(args)
	self:TargetMessage2(args.spellId, "cyan", args.destName)
	self:PlaySound(args.spellId, "info")
end

function mod:InfectedWoundApplied(args)
	if self:Me(args.destGUID) then
		self:TargetMessage2(args.spellId, "blue", args.destName)
		self:PlaySound(args.spellId, "alert")
	end
end

-- Irontide Crackshot
function mod:AzeriteGrenade(args)
	self:Message(args.spellId, "orange")
	self:PlaySound(args.spellId, "alarm")
end

-- Irontide Corsair
function mod:PoisoningStrikeApplied(args)
	if self:Me(args.destGUID) then
		self:StackMessage(args.spellId, args.destName, args.amount, "blue")
		self:PlaySound(args.spellId, "alert")
	end
end

-- Cutwater Duelist
function mod:DuelistDash(args)
	self:Message(args.spellId, "red")
	self:PlaySound(args.spellId, "alarm")
end

-- Irontide Oarsman
function mod:SeaSpout(args)
	self:Message(args.spellId, "yellow")
	self:PlaySound(args.spellId, "alert")
end

-- Blacktooth Scrapper
do
	local prev = 0
	function mod:BlindRage(args)
		if self:Me(args.destGUID) then
			local t = GetTime()
			if t-prev > 2 then
				prev = t
				self:TargetMessage2(args.spellId, "blue", args.destName)
				self:PlaySound(args.spellId, "alarm")
			end
		end
	end
end

-- Blacktooth Knuckleduster
function mod:ShatteringBellow(args)
	self:Message(args.spellId, "orange")
	self:PlaySound(args.spellId, "warning")
end

-- Bilge Rat Swabby
function mod:SlipperySuds(args)
	self:Message(args.spellId, "red")
	self:PlaySound(args.spellId, "long")
end

function mod:SlipperySudsApplied(args)
	if self:Me(args.destGUID) then
		self:TargetMessage2(args.spellId, "blue", args.destName)
		self:PlaySound(args.spellId, "alarm")
	end
end

-- Vermin Trapper
function mod:RatTraps(args)
	self:Message(args.spellId, "yellow")
	self:PlaySound(args.spellId, "alert")
end

-- Bilge Rat Ooker
function mod:GoinBananas(args)
	self:Message(args.spellId, "orange")
	self:PlaySound(args.spellId, "warning")
end

-- Bilge Rat Padfoot
function mod:PlagueStepApplied(args)
	if self:Me(args.destGUID) then
		self:TargetMessage2(args.spellId, "blue", args.destName)
		self:PlaySound(args.spellId, "alert")
	end
end

-- Soggy Shiprat
function mod:ScabrousBiteApplied(args)
	if self:Me(args.destGUID) then
		self:StackMessage(args.spellId, args.destName, args.amount, "blue")
		self:PlaySound(args.spellId, "alert")
	end
end

-- Irontide Crusher
function mod:BoulderThrow(args)
	self:Message(args.spellId, "orange")
	self:PlaySound(args.spellId, "alarm")
end

function mod:GroundShatter(args)
	self:Message(args.spellId, "yellow")
	self:PlaySound(args.spellId, "alert")
end

-- Lightning
function mod:GreasyRemoved(args)
	if args.amount then -- Slippery when oily
		self:StackMessage(args.spellId, args.destName, args.amount, "cyan")
		self:PlaySound(args.spellId, "info")
	else -- Caught!
		self:Message(args.spellId, "green", nil, CL.lightning_caught)
		self:PlaySound(args.spellId, "long")
	end
end

-- Ludwig Von Tortollen
function mod:ShellBounce(args)
	self:Message(args.spellId, "yellow")
	self:PlaySound(args.spellId, "alert")
end

-- Irontide Buccaneer
function mod:BladeBarrage(args)
	self:Message(args.spellId, "yellow")
	self:PlaySound(args.spellId, "alert")
end

-- Irontide Ravager
function mod:PainfulMotivation(args)
	self:Message(args.spellId, "yellow")
	self:PlaySound(args.spellId, "warning")
end

function mod:PainfulMotivationApplied(args)
	self:TargetMessage2(args.spellId, "red", args.destName)
	self:PlaySound(args.spellId, "alarm")
end

-- Irontide Officer
function mod:OiledBladeApplied(args)
	if self:Me(args.destGUID) then
		self:TargetMessage2(args.spellId, "blue", args.destName)
		self:PlaySound(args.spellId, "warning")
	end
end

-- Irontide Stormcaller
function mod:ThunderingSquall(args)
	self:Message(args.spellId, "orange")
	self:PlaySound(args.spellId, "long")
end