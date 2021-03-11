--Built off of my BLU, RUN, and DRG GSs.
---Thanks to various sources such as LS members and BlueGartr for the help building this GearSwap.

-------------------------------------
---------                   ---------
------                         ------
---         Start of Gear         ---
------                         ------
---------                   ---------
------------------------------------- 

---------------------------------
--   Start of Augmented Gear   --
---------------------------------

function get_sets()
	maps()

	AdhemarJacket = {}
	AdhemarJacket.TP = { name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}
	AdhemarJacket.FC = { name="Adhemar Jacket +1", augments={'HP+105','"Fast Cast"+10','Magic dmg. taken -4',}}
	
	HerculeanHelm = {}
    HerculeanHelm.Nuke = { name = "Herculean Helm", augments = { 'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Fast Cast"+1','INT+9','Mag. Acc.+9','"Mag.Atk.Bns."+12', } }
    HerculeanHelm.DT = { name = "Herculean Helm", augments = { 'Attack+12', 'Phys. dmg. taken -4%', 'STR+9', 'Accuracy+8', } }
    HerculeanHelm.Refresh = { name = "Herculean Helm", augments = { 'Weapon skill damage +2%','Pet: Accuracy+11 Pet: Rng. Acc.+11','"Refresh"+2', } }
    HerculeanHelm.WSD = { name = "Herculean Helm", augments = { 'Attack+18','Weapon skill damage +4%','STR+10','Accuracy+12', } }
    HerculeanHelm.WSDAcc = { name = "Herculean Helm", augments = { 'Accuracy+23 Attack+23','Weapon skill damage +3%','STR+3','Accuracy+13','Attack+11', } }
    
    HerculeanVest = {}
    HerculeanVest.CDC  = { name="Herculean Vest", augments={'Accuracy+19 Attack+19','Crit. hit damage +3%','DEX+14','Accuracy+3',}}
    
	AdhemarWrists = {}
	AdhemarWrists.Attack = { name="Adhemar Wrist. +1", augments = {'STR+12','DEX+12','Attack+20',} }
	AdhemarWrists.Accuracy = { name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',} }
	
    HerculeanGloves = {}
    HerculeanGloves.WSD = { name = "Herculean Gloves", augments = { 'Accuracy+21 Attack+21', 'Weapon skill damage +4%', 'Accuracy+9', 'Attack+10', } }
    HerculeanGloves.MABWSD = { name = "Herculean Gloves", augments = { '"Drain" and "Aspir" potency +1','STR+8','Weapon skill damage +7%','Mag. Acc.+10 "Mag.Atk.Bns."+10', } }
    HerculeanGloves.DT = { name = "Herculean Gloves", augments = { 'Accuracy+13', 'Damage taken-3%', 'AGI+1', 'Attack+5', } }
    HerculeanGloves.Refresh = { name = "Herculean Gloves", augments = { 'Spell interruption rate down -1%','"Repair" potency +4%','"Refresh"+2','Accuracy+9 Attack+9','Mag. Acc.+16 "Mag.Atk.Bns."+16', } }
    HerculeanGloves.Crit = { name = "Herculean Gloves", augments = { 'Attack+23', 'Crit. hit damage +4%', 'DEX+8', 'Accuracy+11', } }
	HerculeanGloves.HighAcc = { name = "Herculean Gloves", augments = { 'Accuracy+23 Attack+23', '"Triple Atk."+2', 'DEX+15', 'Accuracy+11', 'Attack+13', } }

	
    HerculeanLegs = {}
    HerculeanLegs.DT = { name = "Herculean Trousers", augments = { 'Accuracy+22', 'Damage taken-2%', 'VIT+6', } }
    HerculeanLegs.WSD = { name = "Herculean Trousers", augments = { 'Attack+28', 'Weapon skill damage +3%', 'STR+10', 'Accuracy+9', } }
    HerculeanLegs.TH = { name = "Herculean Trousers", augments = { 'INT+5','MND+6','"Treasure Hunter"+1','Mag. Acc.+17 "Mag.Atk.Bns."+17', } }
	HerculeanLegs.MAB = { name="Herculean Trousers", augments={'"Mag.Atk.Bns."+15','Weapon skill damage +4%','STR+4','Mag. Acc.+15', } }
	
    HerculeanFeet = {}
    HerculeanFeet.Idle = { name = "Herculean Boots", augments = { 'Crit. hit damage +1%','STR+10','"Refresh"+2','Accuracy+15 Attack+15','Mag. Acc.+17 "Mag.Attack.Bns."+17', } }
    HerculeanFeet.CritDmg = { name = "Herculean Boots", augments = { 'Accuracy+28', 'Crit. hit damage +5%', 'DEX+9' } }
	HerculeanFeet.WSD = { name = "Herculean Boots", augments = { 'INT+3','AGI+5','Weapon skill damage +9%','Accuracy+12 Attack+12','Mag. Acc.+13 "Mag.Atk.Bns."+13'} }
    HerculeanFeet.DW = { name = "Herculean Boots", augments = { 'Accuracy+3 Attack+3','"Dual Wield"+4','AGI+3','Accuracy+14', } }
    HerculeanFeet.TH = { name="Herculean Boots", augments = { 'Phys. dmg. taken -2%','Pet: Phys. dmg. taken -2%','"Treasure Hunter"+2','Accuracy+16 Attack+16','Mag. Acc.+18 "Mag.Attack.Bns."+18', } }
	
	LustFeet = {}
	LustFeet.STRDEX = { name="Lustra. Leggings +1", augments={'HP+65','STR+15','DEX+15',}}
	LustFeet.STRDA = { name="Lustra. Leggings +1", augments={'Attack+20','STR+8','"Dbl.Attack."+3',}}

	Toutatis = {}
	Toutatis.STP = { name="Toutatis's Cape", augments = {'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%', }}
	Toutatis.DW = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10', }}
	Toutatis.DEXWSD = { name="Toutatis's Cape", augments={ 'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%', }}
	Toutatis.Crit = { name="Toutatis's Cape", augments={ 'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10', }}
	Toutatis.Eva = { name="Toutatis's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Store TP"+10','Parrying rate+5%', }}
	
	
-------------------------------	
--   End of Augmented Gear   --
-------------------------------

	sets.Idle = {}
	--Idle Sets--
	sets.Idle.index = { 'Standard', 'DT', 'Refresh' }
	Idle_ind = 1
	sets.Idle.Standard = {
		ammo = "Staunch Tathlum +1",
		head = "Turms Cap +1",
		neck = "Loricate Torque +1",
		ear1 = "Odnowa Earring +1",
		ear2 = "Brachyura Earring",
		body = "Malignance Tabard",
		hands = "Turms Mittens +1",
		ring1 = "Gelatinous Ring +1",
		ring2 = "Karieyh Ring +1",
		back = "Moonbeam Cape",
		waist = "Flume Belt",
		legs = "Malignance Tights",
		feet = "Pillager's Poulaines +3"
	}
	
	sets.Idle.DT = {
		ammo = "Staunch Tathlum +1",
		head = "Malignance Chapeau",
		neck = "Loricate Torque +1",
		ear1 = "Odnowa Earring +1",
		ear2 = "Etiolation Earring",
		body = "Malignance Tabard",
		hands = "Malignance Gloves",
		ring1 = "Defending Ring",
		ring2 = "Karieyh Ring +1",
		back = "Moonbeam Cape",
		waist = "Flume Belt",
		legs = "Malignance Tights",
		feet = "Pillager's Poulaines +3"
	}
	
	--For THF/DRK poisonga TH in Divergence, etc
		sets.Idle.Refresh = {
		ammo = "Staunch Tathlum +1",
		head = HerculeanHelm.Refresh,
		neck = "Loricate Torque +1",
		ear1 = "Odnowa Earring +1",
		ear2 = "Etiolation Earring",
		body = "Malignance Tabard",
		hands = HerculeanGloves.Refresh,
		ring1 = "Stikini Ring +1",
		ring2 = "Karieyh Ring +1",
		back = "Engulfer Cape +1",
		waist = "Flume Belt",
		legs = "Malignance Tights",
		feet = "Pillager's Poulaines +3"
	}
	
	--Dat Waifu--
	sets.Idle.Town = set_combine(sets.Idle.Standard, {
		ring1 = "Matrimony ring",
	})
	
	-----------
	--TP Sets--
	-----------
	sets.TP = {}
	sets.TP.index = {'DualWield', 'CapHaste', 'AccuracyLite', 'AccuracyMid', 'AccuracyFull' }
	TP_ind = 1

	--Excluding the 5% at 550JP:
	--+31 DW needed to cap with only Haste II on--
	--+42 DW needed to cap with only Haste on--
	sets.TP.DualWield = {
		ammo = "Aurgelmir Orb +1",
		--ammo = "Yamarang",
		head = "Adhemar Bonnet +1",
		neck = "Assassin's Gorget +2",
		ear1 = "Eabani Earring", --4
		--ear2 = "Sherida Earring",
		ear2 = "Suppanomimi",
		body = AdhemarJacket.TP, --6
		hands = AdhemarWrists.Accuracy,
		ring1 = "Gere Ring",
		ring2 = "Petrov Ring",
		back = Toutatis.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Pillager's Culottes +3",
		---legs = "Samnuha Tights",
		feet = "Plunderer's Poulaines +3"
	}
	
	sets.TP.CapHaste = {
		--ammo = "Yetshila +1",
		ammo = "Aurgelmir Orb +1",
		head = "Adhemar Bonnet +1",
		neck = "Assassin's Gorget +2",
		ear1 = "Telos Earring",
		ear2 = "Sherida Earring",
		body = "Pillager's Vest +3",
		hands = AdhemarWrists.Attack,
		ring1 = "Gere Ring",
		ring2 = "Hetairoi Ring",
		back = Toutatis.STP,
		--waist = "Reiki Yotai",
		waist = "Windbuffet Belt +1",
		--legs = "Pillager's Culottes +3",
		legs = "Samnuha Tights",
		feet = "Plunderer's Poulaines +3"
	}
	
	sets.TP.AccuracyLite = {
		--ammo = "Aurgelmir Orb +1",
		ammo = "Yamarang",
		head = "Adhemar Bonnet +1",
		neck = "Assassin's Gorget +2",
		ear1 = "Telos Earring",
		ear2 = "Sherida Earring",
		body = "Pillager's Vest +3",
		hands = AdhemarWrists.Attack,
		ring1 = "Gere Ring",
		ring2 = "Hetairoi Ring",
		back = Toutatis.STP,
		waist = "Reiki Yotai",
		--waist = "Windbuffet Belt +1",
		legs = "Pillager's Culottes +3",
		feet = "Plunderer's Poulaines +3"
	}

	sets.TP.AccuracyMid = {
		--ammo = "Aurgelmir Orb +1",
		ammo = "Yamarang",
		head = "Adhemar Bonnet +1",
		neck = "Assassin's Gorget +2",
		ear1 = "Telos Earring",
		ear2 = "Sherida Earring",
		body = "Pillager's Vest +3",
		hands = AdhemarWrists.Accuracy,
		ring1 = "Gere Ring",
		ring2 = "Hetairoi Ring",
		back = Toutatis.STP,
		waist = "Reiki Yotai",
		legs = "Samnuha Tights",
		feet = "Plunderer's Poulaines +3"
	}

	sets.TP.AccuracyFull = {
		ammo = "Yamarang",
		head = "Pillager's Bonnet +3",
		neck = "Assassin's Gorget +2",
		ear1 = "Telos Earring",
		ear2 = "Sherida Earring",
		body = "Pillager's Vest +3",
		hands = AdhemarWrists.Accuracy,
		ring1 = "Ilabrat Ring",
		ring2 = "Regal Ring",
		back = Toutatis.STP,
		waist = "Reiki Yotai",
		legs = "Pillager's Culottes +3",
		feet = "Plunderer's Poulaines +3"
	}
	
	 --DT Sets--
    sets.DT = {}
    sets.DT.index = { 'DT', 'DTHybrid', 'MDTV', 'MEVA', 'Evasion' }
    DT_ind = 1 
	
	sets.DT.DT = {
		ammo = "Yamarang",
		head = "Malignance Chapeau",
		neck = "Loricate Torque +1",
		ear1 = "Odnowa Earring +1",
		ear2 = "Sherida Earring",
		body = "Malignance Tabard",
		hands = "Malignance Gloves",
		ring1 = "Gere Ring",
		ring2 = "Hetairoi Ring",
		back = Toutatis.STP,
		waist = "Reiki Yotai",
		--waist = "Windbuffet Belt +1",
		legs = "Malignance Tights",
		feet = "Malignance Boots"
	}
	
	sets.DT.DTHybrid = {
		ammo = "Aurgelmir Orb +1",
		head = "Adhemar Bonnet +1",
		neck = "Assassin's Gorget +2",
		ear1 = "Telos Earring",
		--ear1 = "Eabani Earring",
		ear2 = "Sherida Earring",
		--ear2 = "Suppanomimi",
		body = "Malignance Tabard",
		hands = "Malignance Gloves",
		ring1 = "Gere Ring",
		ring2 = "Hetairoi Ring",
		back = Toutatis.STP,
		waist = "Reiki Yotai",
		--waist = "Windbuffet Belt +1",
		legs = "Malignance Tights",
		feet = "Plunderer's Poulaines +3"
	}
    --Shell V on. Need 21% MDT, 19% with sheltered.
		sets.DT.MDTV = {
		ammo = "Staunch Tathlum +1",
		head = "Malignance Chapeau",
		neck = "Warder's Charm +1",
		ear1 = "Eabani Earring",
		ear2 = "Odnowa Earring +1",
		body = "Malignance Tabard",
		hands = "Malignance Gloves",
		ring1 = "Purity Ring",
		ring2 = "Shadow Ring",
		back = "Moonbeam Cape",
		waist = "Reiki Yotai",
		legs = "Malignance Tights",
		feet = "Malignance Boots"
	}
	
	sets.DT.MEVA = {
		ammo = "Staunch Tathlum +1",
		head = "Adhemar Bonnet +1",
		neck = "Loricate Torque +1",
		ear1 = "",
		ear2 = "Eabani Earring",
		body = "",
		hands = "Leyline Gloves",
		ring1 = "Defending Ring",
		ring2 = "Purity Ring",
		back = "",
		waist = "Carrier's Sash",
		legs = "Malignance Tights",
		feet = LustFeet.STRDEX
	}
	
	sets.DT.Evasion = {
		ammo = "Yamarang",
		head = "Malignance Chapeau",
		neck = "Assassin's Gorget +2",
		ear1 = "Odnowa Earring +1",
		ear2 = "Sherida Earring",
		body = "Malignance Tabard",
		hands = "Turms Mittens +1",
		ring1 = "Defending Ring",
		ring2 = "Gelatinous Ring +1",
		back = Toutatis.Eva,
		waist = "Reiki Yotai",
		--waist = "Windbuffet Belt +1",
		legs = "Malignance Tights",
		feet = "Turms Leggings +1"
	}
	
	sets.WS = {}

	sets.RudrasUnstacked = {}

	sets.RudrasUnstacked.index = { 'AttackUncap', 'AttackCap', 'Accuracy' }
	RudrasUnstacked_ind = 1
	
	sets.RudrasUnstacked.AttackUncap = {
		ammo = "Seething Bomblet +1",
		head = "Plunderer's Bonnet +3",
		neck = "Assassin's Gorget +2",
		ear1 = "Moonshade Earring",
		ear2 = "Sherida Earring",
		body = "Plunderer's Vest +3",
		hands = "Meghanada Gloves +2",
		ring1 = "Ilabrat Ring",
		ring2 = "Regal Ring",
		back = Toutatis.DEXWSD,
		waist = "Grunfeld Rope",
		legs = "Plunderer's Culottes +3",
		feet = "Plunderer's Poulaines +3"
	}

	sets.RudrasUnstacked.AttackCap = {
		ammo = "Cath Palug Stone",
		head = "Pillager's Bonnet +3",
		neck = "Assassin's Gorget +2",
		ear1 = "Moonshade Earring",
		ear2 = "Odr Earring",
		body = "Pillager's Vest +3",
		hands = "Meghanada Gloves +2",
		ring1 = "Ilabrat Ring",
		ring2 = "Karieyh Ring +1",
		back = Toutatis.DEXWSD,
		waist = "Grunfeld Rope",
		legs = "Lustratio Subligar +1",
		feet = LustFeet.STRDEX
	}
	
	sets.RudrasUnstacked.Accuracy = {
		ammo = "Cath Palug Stone",
		head = "Pillager's Bonnet +3",
		neck = "Assassin's Gorget +2",
		ear1 = "Moonshade Earring",
		ear2 = "Odr Earring",
		body = "Meghanada Cuirie +2",
		hands = "Meghanada Gloves +2",
		ring1 = "Ilabrat Ring",
		ring2 = "Regal Ring",
		back = Toutatis.DEXWSD,
		waist = "Grunfeld Rope",
		legs = "Lustratio Subligar +1",
		feet = LustFeet.STRDEX
	}

	sets.RudrasStacked = {}

	sets.RudrasStacked.index = { 'AttackUncap', 'AttackCap', 'Accuracy' }
	RudrasStacked_ind = 1
	
	sets.RudrasStacked.AttackUncap = set_combine(sets.RudrasUnstacked.AttackUncap, {
		ammo = "Yetshila +1",
		ear2 = "Odr Earring",
		hands = "Meghanada Gloves +2",
		legs = "Pillager's Culottes +3",
		feet = LustFeet.STRDEX
	})

	sets.RudrasStacked.AttackCap = set_combine(sets.RudrasUnstacked.AttackCap, {
		ammo = "Yetshila +1",
		head = "Pillager's Bonnet +3",
		neck = "Fotia Gorget",
		ear1 = "Moonshade Earring",
		ear2 = "Sherida Earring",
		body = "Pillager's Vest +3",
		hands = "Meghanada Gloves +2",
		ring1 = "Karieyh Ring +1",
		ring2 = "Regal Ring",
		back = Toutatis.DEXWSD,
		waist = "Fotia Belt",
		legs = "Lustratio Subligar +1",
		feet = LustFeet.STRDEX
	})
	
	sets.RudrasStacked.Accuracy = set_combine(sets.RudrasUnstacked.Accuracy, {
		ammo = "Yetshila +1",
		head = "Pillager's Bonnet +3",
		neck = "Fotia Gorget",
		ear1 = "Moonshade Earring",
		ear2 = "Sherida Earring",
		body = "",
		hands = "Meghanada Gloves +2",
		ring1 = "Gere Ring",
		ring2 = "Regal Ring",
		back = Toutatis.DEXWSD,
		waist = "Fotia Belt",
		legs = "Pillager's Culottes +3",
		feet = LustFeet.STRDEX
	})

	sets.ExenteratorUnstacked = {}

	sets.ExenteratorUnstacked.index = { 'AttackUncap', 'AttackCap', 'Accuracy' }
	ExenteratorUnstacked_ind = 1
	sets.ExenteratorUnstacked.AttackUncap = {
		ammo = "Seething Bomblet +1",
		head = "Adhemar Bonnet +1",
		neck = "Assassin's Gorget +2",
		ear1 = "Moonshade Earring",
		ear2 = "Sherida Earring",
		body = "Plunderer's Vest +3",
		hands = "Meghanada Gloves +2",
		ring1 = "Ilabrat Ring",
		ring2 = "Regal Ring",
		back = Toutatis.DEXWSD,
		waist = "Grunfeld Rope",
		legs = "Meghanada Chausses +2",
		feet = LustFeet.STRDEX
	}

	sets.ExenteratorUnstacked.AttackCap = {
		ammo = "Cath Palug Stone",
		head = "Adhemar Bonnet +1",
		neck = "Fotia Gorget",
		ear1 = "Brutal Earring",
		ear2 = "Sherida Earring",
		body = "Plunderer's Vest +3",
		hands = "Meghanada Gloves +2",
		ring1 = "Gere Ring",
		ring2 = "Regal Ring",
		back = Toutatis.DEXWSD,
		waist = "Fotia Belt",
		legs = "Meghanada Chausses +2",
		feet = LustFeet.STRDEX
	}

	sets.ExenteratorUnstacked.Accuracy = {
		ammo = "Cath Palug Stone",
		head = "Pillager's Bonnet +3",
		neck = "Fotia Gorget",
		ear1 = "Brutal Earring",
		ear2 = "Sherida Earring",
		body = "Plunderer's Vest +3",
		hands = "Meghanada Gloves +2",
		ring1 = "Gere Ring",
		ring2 = "Regal Ring",
		back = Toutatis.DEXWSD,
		waist = "Fotia Belt",
		legs = "Meghanada Chausses +2",
		feet = LustFeet.STRDEX
	}
	
	sets.ExenteratorStacked = {}

	sets.ExenteratorStacked.index = { 'AttackUncap', 'AttackCap', 'Accuracy' }
	ExenteratorStacked_ind = 1
	sets.ExenteratorStacked.AttackUncap = {
		ammo = "Yetshila +1",
		head = "Adhemar Bonnet +1",
		neck = "Assassin's Gorget +2",
		ear1 = "Moonshade Earring",
		ear2 = "Sherida Earring",
		body = "Plunderer's Vest +3",
		hands = "Meghanada Gloves +2",
		ring1 = "Ilabrat Ring",
		ring2 = "Regal Ring",
		back = Toutatis.DEXWSD,
		waist = "Grunfeld Rope",
		legs = "Pillager's Culottes +3",
		feet = LustFeet.STRDEX
	}

	sets.ExenteratorStacked.AttackCap = {
		ammo = "Cath Palug Stone",
		head = "Adhemar Bonnet +1",
		neck = "Fotia Gorget",
		ear1 = "Brutal Earring",
		ear2 = "Sherida Earring",
		body = "Plunderer's Vest +3",
		hands = "Meghanada Gloves +2",
		ring1 = "Gere Ring",
		ring2 = "Regal Ring",
		back = Toutatis.DEXWSD,
		waist = "Fotia Belt",
		legs = "Pillager's Culottes +3",
		feet = LustFeet.STRDEX
	}

	sets.ExenteratorStacked.Accuracy = {
		ammo = "Cath Palug Stone",
		head = "Pillager's Bonnet +3",
		neck = "Fotia Gorget",
		ear1 = "Brutal Earring",
		ear2 = "Sherida Earring",
		body = "Plunderer's Vest +3",
		hands = "Meghanada Gloves +2",
		ring1 = "Gere Ring",
		ring2 = "Regal Ring",
		back = Toutatis.DEXWSD,
		waist = "Fotia Belt",
		legs = "Pillager's Culottes +3",
		feet = LustFeet.STRDEX
	}

sets.EviscerationUnstacked = {}

	sets.EviscerationUnstacked.index = { 'AttackUncap', 'AttackCap', 'Accuracy' }
	EviscerationUnstacked_ind = 1

	sets.EviscerationUnstacked.AttackUncap = {
		ammo = "Yetshila +1",
		head = "Adhemar Bonnet +1",
		neck = "Fotia Gorget",
		ear1 = "Moonshade Earring",
		ear2 = "Odr Earring",
		body = "Plunderer's Vest +3",
		hands = AdhemarWrists.Attack,
		ring1 = "Ilabrat Ring",
		ring2 = "Regal Ring",
		back = Toutatis.Crit,
		waist = "Fotia Belt",
		legs = "Pillager's Culottes +3",
		feet = "Adhemar Gamashes +1"
	}
	
	sets.EviscerationUnstacked.AttackCap = {
		ammo = "Yetshila +1",
		head = "Adhemar Bonnet +1",
		neck = "Fotia Gorget",
		ear1 = "Moonshade Earring",
		ear2 = "Odr Earring",
		body = "Plunderer's Vest +3",
		hands = AdhemarWrists.Attack,
		ring1 = "Ilabrat Ring",
		ring2 = "Regal Ring",
		back = Toutatis.Crit,
		waist = "Fotia Belt",
		legs = "Pillager's Culottes +3",
		feet = LustFeet.STRDEX
	}	   
							   
	sets.EviscerationUnstacked.Accuracy = {
		ammo = "Cath Palug Stone",
		head = "Pillager's Bonnet +3",
		neck = "Fotia Gorget",
		ear1 = "Telos Earring",
		ear2 = "Odr Earring",
		body = "Plunderer's Vest +3",
		hands = AdhemarWrists.Accuracy,
		ring1 = "Regal Ring",
		ring2 = "Karieyh Ring +1",
		back = Toutatis.Crit,
		waist = "Fotia Belt",
		legs = "Pillager's Culottes +3",
		feet = LustFeet.STRDEX
	}

	sets.EviscerationStacked = {}

	sets.EviscerationStacked.index = { 'AttackUncap', 'AttackCap', 'Accuracy' }
	EviscerationStacked_ind = 1

	sets.EviscerationStacked.AttackUncap = {
		ammo = "Yetshila +1",
		head = "Adhemar Bonnet +1",
		neck = "Fotia Gorget",
		ear1 = "Moonshade Earring",
		ear2 = "Odr Earring",
		body = "Plunderer's Vest +3",
		hands = AdhemarWrists.Attack,
		ring1 = "Ilabrat Ring",
		ring2 = "Regal Ring",
		back = Toutatis.Crit,
		waist = "Fotia Belt",
		legs = "Pillager's Culottes +3",
		feet = LustFeet.STRDEX
	}
	
	sets.EviscerationStacked.AttackCap = {
		ammo = "Yetshila +1",
		head = "Adhemar Bonnet +1",
		neck = "Fotia Gorget",
		ear1 = "Moonshade Earring",
		ear2 = "Odr Earring",
		body = "Plunderer's Vest +3",
		hands = AdhemarWrists.Attack,
		ring1 = "Ilabrat Ring",
		ring2 = "Regal Ring",
		back = Toutatis.Crit,
		waist = "Fotia Belt",
		legs = "Pillager's Culottes +3",
		feet = LustFeet.STRDEX
	}	   
							   
	sets.EviscerationStacked.Accuracy = {
		ammo = "Cath Palug Stone",
		head = "Pillager's Bonnet +3",
		neck = "Fotia Gorget",
		ear1 = "Telos Earring",
		ear2 = "Odr Earring",
		body = "Plunderer's Vest +3",
		hands = AdhemarWrists.Accuracy,
		ring1 = "Ilabrat Ring",
		ring2 = "Regal Ring",
		back = Toutatis.Crit,
		waist = "Fotia Belt",
		legs = "Pillager's Culottes +3",
		feet = LustFeet.STRDEX
	}
	
	sets.AeolianEdge = {
		ammo = "Seething Bomblet +1",
		head = HerculeanHelm.Nuke,
		neck = "Baetyl Pendant",
		ear1 = "Moonshade Earring",
		ear2 = "Friomisi Earring",
		body = "Samnuha Coat",
		hands = HerculeanGloves.MABWSD,
		ring1 = "Shiva Ring +1",
		ring2 = "Karieyh Ring +1",
		back = Toutatis.DEXWSD,
		waist = "Eschan Stone",
		legs = HerculeanLegs.MAB,
		feet = HerculeanFeet.WSD
	}
	
	--SC DMG Set--
	sets.SCDmg = {
		head = "Adhemar Bonnet +1",
		body = "",
		hands = HerculeanGloves.WSD,
		legs = "Lustratio Subligar +1",
		feet = ""
	}
	
	sets.SCDmgAllies = {
		head = "Adhemar Bonnet +1",
		body = "",
		hands = HerculeanGloves.WSD,
		legs = "Lustratio Subligar +1",
		feet = ""
	}
		
--------------------------
--   Curing Magic Set   --
--------------------------
	
	sets.Cures = {
		ammo = "",
		head = "",
		neck = "",
		ear1 = "",
		ear2 = "",
		body = "",
		hands = "",
		ring1 = "",
		ring2 = "",
		back = "",
		waist = "",
		legs = "",
		feet = ""
	}
----------------------
--   Utility Sets   --
-----------------------
--   Sets for one thing or another.
--   Macro in game with: 

--   /console gs equip sets.butts.andfronts
--   /console gs c lockgearindex

	sets.Utility = {}
	
	sets.Utility.Doom = {
		ring1 = "Purity Ring",
		ring2 = "Saida Ring",
		waist = "Gishdubar Sash"
	}
	
	sets.Utility.TH = {
		head = "Volte Cap",
		hands = "Plunderer's Armlets +1",
		waist = "Chaac Belt",
		legs = HerculeanLegs.TH,
		feet = "Skulker's Poulaines +1"
	}
	
	sets.Utility.DerpDT = {
		ammo = "Yamarang",
		head = "Malignance Chapeau",
		neck = "Warder's Charm +1",
		ear1 = "Odnowa Earring +1",
		ear2 = "Etiolation Earring",
		body = "Malignance Tabard",
		hands = "Malignance Gloves",
		ring1 = "Defending Ring",
		ring2 = "Shadow Ring",
		back = Toutatis.STP,
		waist = "Engraved Belt",
		legs = "Malignance Tights",
		feet = "Malignance Boots"
	}
	
	--Shell II only--
	sets.Utility.MDTII = {
		ammo = "",
		head = "",
		neck = "",
		ear1 = "",
		ear2 = "",
		body = "",
		hands = "",
		ring1 = "",
		ring2 = "",
		back = "",
		waist = "",
		legs = "",
		feet = ""
	}

	--No Shell--
	sets.Utility.MDTNO = {
		ammo = "",
		head = "",
		neck = "",
		ear1 = "",
		ear2 = "",
		body = "",
		hands = "",
		ring1 = "",
		ring2 = "",
		back = "",
		waist = "",
		legs = "",
		feet = ""
	}

---------------------
--   Enmity Set   --
---------------------

	sets.Enmity = {
		ammo = "Sapience Orb",
		head = "Halitus Helm",
		neck = "Loricate Torque +1",
		ear1 = "Cryptic Earring",
		ear2 = "Friomisi Earring",
		body = "Plunderer's Vest +3",
		hands = "Kurys Gloves",
		ring1 = "Eihwaz Ring",
		ring2 = "Supershear Ring",
		--back = "",
		waist = "Flume Belt",
		legs = "Malignance Tights",
		feet = "Ahosi Leggings"
	}
	
------------------------
--   Enhancing Sets   --
------------------------
	
	sets.Enhancing = {}
	
	sets.Enhancing.Skill = {
		ammo = "",
		head = "",
		neck = "",
		ear1 = "",
		ear2 = "",
		body = "",
		hands = "",
		ring1 = "",
		ring2 = "",
		back = "",
		waist = "",
		legs = "",
		feet = ""
	}
	
	sets.Enhancing.Phalanx = set_combine(sets.Enhancing.Skill, {
	})
	
	sets.Enhancing.Refresh = set_combine(sets.Enhancing.Skill, {
		waist = "Gishdubar Sash",
	})
	
	sets.Enhancing.ProShell = set_combine(sets.Enhancing.Skill, {
		ear1 = "Brachyura Earring",
	})
	
--------------------------	
--   Job Ability Sets   --
--------------------------
	sets.JA = {}

	sets.JA.PerfectDodge = { hands = "Plunderer's Armlets +1" }

	sets.JA.Steal = { feet = "Pillager's Poulaines +3" }
	
	sets.JA.Mug = {}
	
	sets.JA.Despoil = {}
	
	sets.JA.Hide = { body = "Pillager's Vest +3" }
	
	sets.JA.Flee = { feet = "Pillager's Poulaines +3" }
	
	sets.JA.Feint = { legs = "Plunderer's Culottes +3" }
	
	sets.JA.AccompliceCollaborator = { head = "Raider's Bonnet +2" }
	
	sets.JA.Provoke = set_combine(sets.Enmity, {})

	
----------------------
--   Precast Sets   --
----------------------
	sets.precast = {}
	
	sets.precast.FC = {}

	sets.precast.FC.Standard = {
		ammo = "Sapience Orb",
		head = "Herculean Helm",
		neck = "Orunmila's Torque",
		ear1 = "Loquac. Earring",
		ear2 = "Etiolation Earring",
		body = AdhemarJacket.FC,
		hands = "Leyline Gloves",
		ring1 = "Prolix Ring",
		ring2 = "Rahab Ring",
		back = "",
		legs = "",
		feet = ""
	}
	
end

---End of Gear---------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------
---------                   ---------
------                         ------
---         Start of Maps         ---
------                         ------
---------                   ---------
------------------------------------- 

------------------------
--   Town Gear List   --
------------------------

function maps()

Town = S {
    "Ru'Lude Gardens", "Upper Jeuno", "Lower Jeuno", "Port Jeuno",
    "Port Windurst", "Windurst Waters", "Windurst Woods", "Windurst Walls", "Heavens Tower",
    "Port San d'Oria", "Northern San d'Oria", "Southern San d'Oria", "Chateau d'Oraguille",
	"Port Bastok", "Bastok Markets", "Bastok Mines", "Metalworks",
    "Aht Urhgan Whitegate", "Nashmau",
    "Selbina", "Mhaura", "Norg",  "Kazham", "Tavanazian Safehold",
    "Eastern Adoulin", "Western Adoulin", "Celennia Memorial Library", "Mog Garden"
}

end

---End of Maps----------------------------------------------------------------------------------------------------------------------------------------------------------


--------------------------------------
---------                    ---------
------                          ------
---         Start of Rules         ---
------                          ------
---------                    ---------
-------------------------------------- 

----------------------------------------------
--   Macro and Style Change on Job Change   --
----------------------------------------------
function set_macros(sheet,book)
    if book then 
        send_command('@input /macro book '..tostring(book)..';wait .1;input /macro set '..tostring(sheet))
        return
    end
    send_command('@input /macro set '..tostring(sheet))
end

function set_style(sheet)
    send_command('@input ;wait 5.0;input /lockstyleset '..sheet)
	add_to_chat (56, 'Your lockstyle looks like shit, and you should feel bad.')
	add_to_chat (55, 'You are on '..('THF '):color(5)..''..('btw. '):color(55)..''..('Macros set!'):color(121))
--	add_to_chat (23, '""')
end

--Page, Book--
set_macros(1,3)
--Use the Lockstyle Number-- 
set_style(2)
-------------------------------
--         Variables         --
-------------------------------
SetLocked = false --Used to Check if set is locked before changing equipment
LockedEquipSet = {} --Placeholder to store desired lock set
LockGearSet = {}
equipSet = {} --Currently Equiped Gearset
LockGearIndex = false
LockGearIndex = false
TargetDistance = 0
TH = false --TH rule default
DT = false
SkillchainPending = false 
AllowSkillchainGear = false   --Whether or not hte skillchainPending system should be disabled
SkillchainTimer = 0
StackWS = false

------------------------------------
--         Windower Hooks         --
------------------------------------

function buff_change(n, gain, buff_table)
	local name
    name = string.lower(n)
	
	if name == "sneak attack" or name == "trick attack" then
		if gain then
			StackWS  = true
		end
	end
	
    if S{"terror","petrification","sleep","stun"}:contains(name) then
        if gain and  DT_ind ~= 5  then
            ChangeGear(sets.Utility.DerpDT)
        elseif not has_any_buff_of({"terror","petrification","sleep","stun"}) then
            if player.status == 'Engaged' then
                if LockGearIndex then
                    ChangeGear(LockGearSet)
                elseif not LockGearIndex then
					if DT == true then
                        ChangeGear(sets.DT[sets.DT.index[DT_ind]])
                    else
                        ChangeGear(sets.TP[sets.TP.index[TP_ind]])
                    end
                end
            elseif player.status == 'Idle' then
                if LockGearIndex then
                    ChangeGear(LockGearSet)
                elseif not LockGearIndex then
                    ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
                end
            end
        end
    elseif name == "doom" then
        if gain then
            ChangeGear(sets.Utility.Doom)
            send_command('@input /p Doomed {~o~:} !')
            disable('neck','ring1','ring2','waist')
        else
            if player.status == 'Engaged' then
                if LockGearIndex then
                    send_command('@input /p Doom is off {^_^}')
                    enable('neck','ring1','ring2','waist')
                    ChangeGear(LockGearSet)
                else
                    send_command('@input /p Doom is off {^_^}')
                    enable('neck','ring1','ring2','waist')
					if DT == true then
                        ChangeGear(sets.DT[sets.DT.index[DT_ind]])
                    else
                        ChangeGear(sets.TP[sets.TP.index[TP_ind]])
                    end
                end
            elseif player.status == 'Idle' then
                if LockGearIndex then
                    send_command('@input /p Doom is off {^_^}')
                    enable('neck','ring1','ring2','waist')
                    ChangeGear(LockGearSet)
                else
                    send_command('@input /p Doom is off {^_^}')
                    enable('neck','ring1','ring2','waist')
                    ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
                end
            end
        end
    elseif name == "charm" then
        if gain then
            send_command('@input /p Charmed {<3_<3:} !')
        else
            send_command('@input /p Charm is off {~_^}')
        end
	elseif name == "weakness" then
		if gain then
			enable('neck','ring1','ring2','waist')
		end
	elseif name == "feint" then
		if gain then
		ChangeGear(set_combine(equipSet, {legs="Plunderer's Culottes +3"}))
		end		
	end
end

function has_any_buff_of(buff_set)--returns true if you have any of the buffs given
    for i,v in pairs(buff_set) do
        if buffactive[v] ~= nil then return true end
    end
end

---------------------------
--         Binds         --
---------------------------
send_command('bind f9 gs c toggle TP set') -- Hit f9, toggles the sets
send_command('bind f10 gs c toggle Dagger Set')
send_command('bind f11 gs c toggle Evisceration set')
send_command('bind f12 gs c toggle Idle set')
send_command('bind ^f8 input /ws "Aeolian Edge" <t>')
send_command('bind ^f9 input /ws "Rudra\'s Storm" <t>') -- ^ means cntrl, so hit cntrl + f9
send_command('bind ^f10 input /ws "Evisceration"] <t>')
send_command('bind ^f11 input /ws "Mandalic Stab" <t>')
send_command('bind ^f12 input /ws "Exenterator" <t>')
send_command('bind !f7 gs c toggle DT set') -- ! means alt. this exists only for toggling outside of this mode being active, otherwise f9
send_command('bind !f8 gs c toggle DT') -- ! means alt.  DT on or off
send_command('bind !f9 gs c toggle backwards')
send_command('bind !f10 gs c AllowSkillchainGear')
send_command('bind !f11 empty')
send_command('bind !f12 gs c lockgearindex')

send_command('bind !e input /item "Echo Drops" <me>')
send_command('bind !r input /item "Remedy" <me>')
send_command('bind !p input /item "Panacea" <me>')
send_command('bind !h input /item "Holy Water" <me>')
send_command('bind !w input /equip ring2 "Warp Ring"; /echo Warping; wait 11; input /item "Warp Ring" <me>;')
send_command('bind !q input /equip ring2 "Dim. Ring (Holla)"; /echo Reisenjima; wait 11; input /item "Dim. Ring (Holla)" <me>;')
send_command('bind !t gs c toggle TH') -- alt + t toggles TH mode

--Unload Binds
function file_unload()
	send_command('unbind ^f8')
	send_command('unbind ^f9')
	send_command('unbind ^f10')
	send_command('unbind ^f11')
	send_command('unbind ^f12')
	send_command('unbind !f7')
	send_command('unbind !f8')
	send_command('unbind !f9')
	send_command('unbind !f10')
	send_command('unbind !f11')
	send_command('unbind !f12')
	send_command('unbind f9')
	send_command('unbind f10')
	send_command('unbind f11')
	send_command('unbind f12')
	
	send_command('unbind !e')
	send_command('unbind !r')
	send_command('unbind !p')
	send_command('unbind !h')
	send_command('unbind !w')
	send_command('unbind !t')
end

--------------------------------------
--         Console Commands         --
--------------------------------------
function self_command(command)
	if command == 'togglelock' then
		if SetLocked == false then
			msg("Equipment Set LOCKED !!!")
		else
			SetLocked = false
			msg("Equipment Set UNLOCKED!")
		end
	elseif command == 'lockgearindex' then
		if LockGearIndex == false then
			LockGearIndex = true
			LockGearSet = {
				ammo = player.equipment.ammo,
				head = player.equipment.head,
				neck = player.equipment.neck,
				ear1 = player.equipment.left_ear,
				ear2 = player.equipment.right_ear,
				body = player.equipment.body,
				hands = player.equipment.hands,
				ring1 = player.equipment.left_ring,
				ring2 = player.equipment.right_ring,
				back = player.equipment.back,
				waist = player.equipment.waist,
				legs = player.equipment.legs,
				feet = player.equipment.feet
			}
			msg("Gear Index Locked !!!")
		else
			LockGearIndex = false
			msg("Gear Index Unlocked")
			if player.status == 'Engaged' then
                if DT == true then
                    ChangeGear(sets.DT[sets.DT.index[DT_ind]])
                else
                    ChangeGear(sets.TP[sets.TP.index[TP_ind]])
                end
            else
                ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
            end
        end
    end
	if command == 'toggle TP set' then
		if DT == true then
            DT_ind = DT_ind + 1
            if DT_ind > #sets.DT.index then DT_ind = 1 end
            send_command('@input /echo <----- DT Set changed to ' .. sets.DT.index[DT_ind] .. ' ----->')
            ChangeGear(sets.DT[sets.DT.index[DT_ind]])
        elseif DT == false then
        TP_ind = TP_ind + 1
        if TP_ind > #sets.TP.index then TP_ind = 1 end
        send_command('@input /echo <----- TP Set changed to ' .. sets.TP.index[TP_ind] .. ' ----->')
			if player.status == 'Engaged' then
                    ChangeGear(sets.TP[sets.TP.index[TP_ind]])
            end
		end
	elseif command == 'toggle Idle set' then
        Idle_ind = Idle_ind + 1
        if Idle_ind > #sets.Idle.index then Idle_ind = 1 end
        send_command('@input /echo <----- Idle Set changed to ' .. sets.Idle.index[Idle_ind] .. ' ----->')
        if player.status == 'Idle' then
            ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
        end
	elseif command == 'toggle Dagger Set' then
		RudrasUnstacked_ind = RudrasUnstacked_ind + 1
		RudrasStacked_ind = RudrasStacked_ind + 1
		EviscerationUnstacked_ind = EviscerationUnstacked_ind +1
		EviscerationStacked_ind = EviscerationStacked_ind +1
		ExenteratorUnstacked_ind = ExenteratorUnstacked_ind + 1
		ExenteratorStacked_ind = ExenteratorStacked_ind + 1
		if RudrasUnstacked_ind > #sets.RudrasUnstacked.index then RudrasUnstacked_ind = 1 end
		if RudrasStacked_ind > #sets.RudrasStacked.index then RudrasStacked_ind = 1 end
		if EviscerationUnstacked_ind > #sets.EviscerationUnstacked.index then EviscerationUnstacked_ind = 1 end
		if EviscerationStacked_ind > #sets.EviscerationStacked.index then EviscerationStacked_ind = 1 end
		if ExenteratorUnstacked_ind > #sets.ExenteratorUnstacked.index then ExenteratorUnstacked_ind = 1 end
		if ExenteratorStacked_ind > #sets.ExenteratorStacked.index then ExenteratorStacked_ind = 1 end
		send_command('@input /echo <----- Dagger Sets changed to ' .. sets.RudrasStacked.index[RudrasStacked_ind] .. ' ----->')
	elseif command == 'toggle DT set' then
		DT_ind = DT_ind + 1
		if DT_ind > #sets.DT.index then DT_ind = 1 end
		send_command('@input /echo <----- DT Set changed to ' .. sets.DT.index[DT_ind] .. ' ----->')
			if DT == true then
				ChangeGear(sets.DT[sets.DT.index[DT_ind]])
			end
    elseif command == 'toggle DT' then
        if DT == true then
            DT = false
            send_command('@input /echo <----- DT TP: [Off] ----->')
        else
            DT = true
            send_command('@input /echo <----- DT TP: [On] ----->')
        end
        status_change(player.status)
	elseif command == 'toggle TH' then
		if TH == true then
			TH = false
			send_command('@input /echo <----- Treasure Hunter TP: [Off] ----->')
        else
			TH = true
			send_command('@input /echo <----- Treasure Hunter TP: [On] ----->')
		end
		status_change(player.status)
	elseif command == 'toggle backwards' then
        if DT == true then
            DT_ind = DT_ind -1
            if DT_ind == 0 then
                DT_ind = #sets.DT.index
            end
        send_command('@input /echo <----- DT Set changed to ' .. sets.DT.index[DT_ind] .. ' ----->')
        ChangeGear(sets.DT[sets.DT.index[DT_ind]])
        elseif DT == false then
            TP_ind = TP_ind -1
            if TP_ind == 0 then
                TP_ind = #sets.TP.index
            end
            send_command('@input /echo <----- TP Set changed to ' .. sets.TP.index[TP_ind] .. ' ----->')
            if player.status == 'Engaged' then
                    ChangeGear(sets.TP[sets.TP.index[TP_ind]])
            end
        end
	elseif command == 'ZoneChange' then
		IdleState()
    elseif command == 'AllowSkillchainGear' then
        AllowSkillchainGear = not AllowSkillchainGear
        add_to_chat (56, 'Allow use of skillchain damage gear: ' ..tostring(AllowSkillchainGear))
    elseif string.sub(command, 0, 4) == '-cd ' then     --If the first 4 characters of the command are '-cd '
        add_to_chat (30, string.sub(command, 5, string.len(command)))      --add everything after '-cd ' to a message in the chat
	end
	
end

--------------------------------------
--         Character States         --
--------------------------------------
function IdleState()
	if LockGearIndex then
		ChangeGear(LockGearSet)
	elseif DT == true then
        ChangeGear(sets.DT[sets.DT.index[DT_ind]])
    else
        ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
    end
	
	if Town:contains(world.area) then
		ChangeGear(sets.Idle.Town)
	end
	
end

windower.raw_register_event('zone change',function()
windower.send_command('@wait 9; input //gs c ZoneChange')
end)

function RestingState()

end

function EngagedState()
	if LockGearIndex then
        ChangeGear(LockGearSet)
    elseif not LockGearIndex then
		if DT == true then
            ChangeGear(sets.DT[sets.DT.index[DT_ind]])
        else
            ChangeGear(sets.TP[sets.TP.index[TP_ind]])
        end
    end
end

-----------------------------
--      Spell control      --
-----------------------------
unusable_buff = {
	spell={'Charm','Mute','Omerta','Petrification','Silence','Sleep','Stun','Terror'},
    ability={'Amnesia','Charm','Impairment','Petrification','Sleep','Stun','Terror'}}
  --check_recast('ability',spell.recast_id)  check_recast('spell',spell.recast_id)
function check_recast(typ,id) --if spell can be cast(not in recast) return true
    local recasts = windower.ffxi['get_'..typ..'_recasts']()
    if id and recasts[id] and recasts[id] == 0 then
        return true
    else
        return false
    end
end
 --return true if spell/ability is unable to be used at this time
function spell_control(spell)
	if spell.type == "Item" then
		return false
	--Stops spell if you do not have a target
	elseif spell.target.name == nil and not spell.target.raw:contains("st") then
		return true
	--Stops spell if a blocking buff is active
	elseif spell.action_type == 'Ability' and spell.type ~= 'WeaponSkill' and (has_any_buff_of(unusable_buff.ability) or not check_recast('ability',spell.recast_id)) then
		return true
	elseif spell.type == 'WeaponSkill' and player.tp < 1000 then
		return true
	elseif spell.type == 'WeaponSkill' and (has_any_buff_of(unusable_buff.ability)) then
		msg("Weapon Skill Canceled, Can't")
		return true
	elseif spell.action_type == 'Magic' and (has_any_buff_of(unusable_buff.spell)
      or not check_recast('spell',spell.recast_id)) then
		return true
    --Stops spell if you do not have enuf mp/tp to use
	elseif spell.mp_cost and spell.mp_cost > player.mp and not has_any_buff_of({'Manawell','Manafont'}) then
        msg("Spell Canceled, Not Enough MP")
		return true
	end
    --Calculate how many finishing moves your char has up to 6
	local fm_count = 0
	for i, v in pairs(buffactive) do
		if tostring(i):startswith('finishing move') or tostring(i):startswith('?????????') then
			fm_count = tonumber(string.match(i, '%d+')) or 1
		end
	end
    --Stops flourishes if you do not have enough finishing moves
	local min_fm_for_flourishes = {['Animated Flourish']=1,['Desperate Flourish']=1,['Violent Flourish']=1,['Reverse Flourish']=1,['Building Flourish']=1,
                                   ['Wild Flourish']=2,['Climactic Flourish']=1,['Striking Flourish']=2,['Ternary Flourish']=3,}
	if min_fm_for_flourishes[spell.en] then
		if min_fm_for_flourishes[spell.en] > fm_count and not buffactive[507] then
			return true
		end
	end
	--Reomves Sneak when casting Spectral Jig
	if spell.en == 'Spectral Jig' then
		send_command('cancel 71')
	end
	if spell.english == 'Utsusemi: Ichi' and overwrite and buffactive['Copy Image (3)'] then
		return true
	end
	if player.tp >= 1000 and player.target and player.target.distance and player.target.distance > 7 and spell.type == 'WeaponSkill' then
		msg("Weapon Skill Canceled  Target Out of Range")
		return true
	end

end

-----------------------------
--         Precast         --
-----------------------------
function pc_JA(spell, act, StackWS)
    if spell.english == 'Perfect Dodge' then
        ChangeGear(sets.JA.PerfectDodge)
    elseif spell.english == 'Steal' then
        ChangeGear(sets.JA.Steal)
    elseif spell.english == 'Mug' then
        ChangeGear(sets.JA.Mug)
    elseif spell.english == 'Despoil' then
        ChangeGear(sets.JA.Despoil)
    elseif spell.english == 'Hide' then
        ChangeGear(sets.JA.Hide)
    elseif spell.english == 'Flee' then
        ChangeGear(sets.JA.Flee)
    elseif spell.english == 'Feint' then
        ChangeGear(sets.JA.Feint)
	elseif spell.english =='Accomplice' or spell.english =='Collaborator' then
		ChangeGear(sets.JA.AccompliceCollaborator)
	elseif spell.english == 'Provoke' or spell.english == 'Vallation' or spell.english == 'Pflug' or spell.english == 'Swordplay' then
        ChangeGear(sets.Enmity)
	end
	
	IgnoreWS = S {"Aeolian Edge"}  -- Excluded from Moonshade TP override rule.
	BrutalWS = S {"Rudra's Storm", "Exenterator", "Shark Bite"}
	
	if spell.type == 'WeaponSkill' then
        if spell.english == "Rudra's Storm" or spell.english == 'Mandalic Stab' or spell.english == 'Shark Bite' then
			if buffactive['Sneak Attack'] or buffactive ['Trick Attack'] then
				ChangeGear(sets.RudrasStacked[sets.RudrasStacked.index[RudrasStacked_ind]])
			else
				ChangeGear(sets.RudrasUnstacked[sets.RudrasUnstacked.index[RudrasUnstacked_ind]])
			end
        elseif spell.english == "Evisceration" then
			if buffactive['Sneak Attack'] or buffactive ['Trick Attack'] then
				ChangeGear(sets.EviscerationStacked[sets.EviscerationStacked.index[EviscerationStacked_ind]])
			else
				ChangeGear(sets.EviscerationUnstacked[sets.EviscerationUnstacked.index[EviscerationUnstacked_ind]])
			end
        elseif spell.english == 'Exenterator' then
			if StackWS == true then
				ChangeGear(sets.ExenteratorStacked[sets.ExenteratorStacked.index[ExenteratorStacked_ind]])
			else
				ChangeGear(sets.ExenteratorUnstacked[sets.ExenteratorUnstacked.index[ExenteratorUnstacked_ind]])
			end
        elseif spell.english == 'Aeolian Edge' or spell.english == 'Cyclone' then
            ChangeGear(sets.AeolianEdge)
        end
		--WS TP Rules, so you dont use moonshade when you have TP overflow--
        if player.tp > 2025 and player.equipment.main == 'Aeneas' and buffactive['TP Bonus'] and not buffactive['Sekkanoki'] then
            if IgnoreWS:contains(spell.english) then
                return
            elseif BrutalWS:contains(spell.english) then
                equip(set_combine(equipSet, { ear1 = "Brutal Earring" })) --Watch for ear conflicts between TP sets and WS sets
                msg("Brutal Earring equiped !!!!")
            else
                equip(set_combine(equipSet, { ear1 = "Ishvara Earring" }))
                msg("Ishvara Earring equiped !!!!")
            end
        elseif player.tp > 2275 and player.equipment.main == 'Aeneas' and not buffactive['Sekkanoki'] then
            if IgnoreWS:contains(spell.english) then
                return
			elseif BrutalWS:contains(spell.english) then
                equip(set_combine(equipSet, { ear1 = "Brutal Earring" })) --Watch for ear conflicts between TP sets and WS sets
                msg("Brutal Earring equiped !!!!")
            else
                equip(set_combine(equipSet, { ear1 = "Ishvara Earring" }))
                msg("Ishvara Earring equiped !!!!")
            end
        elseif player.tp > 2550 and buffactive['TP Bonus'] and not buffactive['Sekkanoki'] then
            if IgnoreWS:contains(spell.english) then
                return
            elseif BrutalWS:contains(spell.english) then
                equip(set_combine(equipSet, { ear1 = "Brutal Earring" })) --Watch for ear conflicts between TP sets and WS sets
                msg("Brutal Earring equiped !!!!")
            else
                equip(set_combine(equipSet, { ear1 = "Ishvara Earring" }))
                msg("Ishvara Earring equiped !!!!")
            end
        elseif player.tp > 2775 and not buffactive['Sekkanoki'] then
            if IgnoreWS:contains(spell.english) then
                return
            elseif BrutalWS:contains(spell.english) then
                equip(set_combine(equipSet, { ear1 = "Brutal Earring" })) --Watch for ear conflicts between TP sets and WS sets
                msg("Brutal Earring equiped !!!!")
            else
                equip(set_combine(equipSet, { ear1 = "Ishvara Earring" }))
                msg("Ishvara Earring equiped !!!!")
            end
        end
	end

	if spell.type == 'Step' then
		ChangeGear(set_combine(sets.TP.AccuracyFull, sets.Utility.TH))
	elseif spell.english == 'Animated Flourish' then
		ChangeGear(sets.Enmity)
	elseif spell.type == 'Waltz' then
		ChangeGear(set_combine(sets.Utility.DerpDT, {ammo = "Yamarang"} ))
	end
end

function pc_Magic(spell, act)
	if spell.action_type == 'Magic' then
		ChangeGear(sets.precast.FC.Standard)
	end
end

function pc_Item(spell, act)
end


-----------------------------
--         Midcast         --
-----------------------------
function mc_JA(spell, act)
end

function mc_Magic(spell, act)
	if spell.skill == 'Enhancing Magic' then
		if spell.english == 'Refresh' then
			ChangeGear(sets.Enhancing.Refresh)
		elseif string.find(spell.english,'Bar') then
			ChangeGear(sets.Enhancing.Skill)
		elseif spell.english=="Phalanx" then
			ChangeGear(sets.Enhancing.Phalanx)
		elseif spell.english == 'Flash' then
			ChangeGear(sets.Enmity)
		elseif string.find(spell.english,'Shell') or string.find(spell.english,'Protect') then
			ChangeGear(sets.Enhancing.ProShell)
		end
		elseif spell.skill == 'Enfeebling Magic' then 
			if spell.english == 'Sleepga' or string.find(spell.english,'Poison') then --For Divergence to TH tag everything
				ChangeGear(set_combine(sets.Enmity, sets.Utility.TH))
			end
		end
	end

function mc_Item(spell, act)
end


--------------------------------
--         After Cast         --
--------------------------------
function ac_JA(spell)
end

function ac_Magic(spell)
end

function ac_Item(spell)
end

function ac_Global()
    if LockGearIndex == true then
        ChangeGear(LockGearSet)
        msg("Lock Gear is ON -- Swapping Gear")
    else
        if player.status == 'Engaged' then
            EngagedState()
        else
            IdleState()
        end
    end
end

------------------------------------
--         Framework Core         --
------------------------------------
function status_change(new, old)
	if new == 'Idle' then
		IdleState()
	elseif new == 'Resting' then
		RestingState()
	elseif new == 'Engaged' then
		EngagedState()
	end
	
	if player.status == 'Engaged' and TH == true then
		ChangeGear(set_combine(equipSet, sets.Utility.TH))	
	end
	
	if DT == true and LockGearIndex == false then
        ChangeGear(sets.DT[sets.DT.index[DT_ind]])
    end
	
end
		
function precast(spell, act, spellMap, eventArgs)
	if spell_control(spell) then
        cancel_spell()
        return
    end
	if spell.action_type == 'Ability' then
		pc_JA(spell, act)
	elseif spell.action_type == 'Magic' then
		pc_Magic(spell, act)
	else
		pc_Item(spell, act)
	end
	
if spell.type:lower() == "weaponskill" and SkillchainPending == true then           
        if (os.time() - SkillchainTimer) <= 9 and AllowSkillchainGear == true then
			if buffactive["Allies' Roll"] then
				equip(sets.SCDmgAllies)
			else
				equip(sets.SCDmg)			-- If the current operating system time (in seconds) 
			end								-- minus SkillchainTimer variable is less than 9, equip skillchain gear 
		else
			SkillchainPending = false
		end                                      
    end
end

function midcast(spell, act)
	if spell.action_type == 'Ability' and TH == true then
		ChangeGear(set_combine(equipSet, sets.Utility.TH))
	elseif spell.action_type == 'Ability' then
		mc_JA(spell, act)
	elseif spell.action_type == 'Magic' then
		mc_Magic(spell, act)
	else
		mc_Item(spell, act)
	end
end

function aftercast(spell, act, spellMap, eventArgs)
	if spell.action_type == 'Ability' then
		ac_JA(spell)
	elseif spell.action_type == 'Magic' then
		ac_Magic(spell)
	else
		ac_Item(spell)
	end
	ac_Global()
	
	--Countdowns--
	if not spell.interrupted then
		if spell.english == "Berserk" then
			send_command('wait 169;gs c -cd '..spell.name..': [Ready In 10 Seconds!];wait 10;gs c -cd '..spell.name..': [Ready !]')
		elseif spell.english == "Aggressor" then
			send_command('wait 169;gs c -cd '..spell.name..': [Ready In 10 Seconds!];wait 10;gs c -cd '..spell.name..': [Ready !]')
		elseif spell.english == "Meditate" then
			send_command('wait 169;gs c -cd '..spell.name..': [Ready In 10 Seconds!];wait 10;gs c -cd '..spell.name..': [Ready !]')
		elseif spell.english == "Sekkanoki" then
			send_command('wait 289;gs c -cd '..spell.name..': [Ready In 10 Seconds!];wait 10;gs c -cd '..spell.name..': [Ready !]')
		elseif spell.english == "Feint" then
			send_command('timers create "Feint Duration" 30 down')
		elseif spell.english == "Bully" then
			send_command('timers create "Bully Duration" 30 down')
        elseif spell.type == "WeaponSkill" then
            SkillchainPending = true
            SkillchainTimer = os.time()    -- sets SkillchainTimer variable to the current time of the operating system (in seconds)
			StackWS = false
		end 
    end

    if not spell.interrupted then
        if spell.english == 'Utsusemi: Ichi' then
            overwrite = false
        elseif spell.english == 'Utsusemi: Ni' then
            overwrite = true
        end
    end
	
end

function ChangeGear(GearSet)
	equipSet = GearSet
	equip(GearSet)
end

function LockGearSet(GearSet)
	LockedEquipSet = GearSet
	equip(GearSet)
	SetLocked = true
end

function UnlockGearSet()
	locked = false
	equip(equipSet)
end

function msg(str)
	send_command('@input /echo <----- ' .. str .. ' ----->')
end

---End of Rules-------------------------------------------------------------------------------------------------------------------------------------------------------