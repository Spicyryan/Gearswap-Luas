-- Built from RNG file as an initial template from the TRBrennan/FFXI-Lua github 
-- Refined functionalities/swapping between sets in line with Spicyryan's base lua functions
--
--
-- Additions/Changes/Updates made by Thefoxdanger of Asura
-- -- Added detection for TrueShot ranges
-- -- Added detection for Armageddon AM3
-- -- Added sets to support TrueShot and AM3 builds
-- -- Changed WS sets available and added day/weather hooks for Obi on all applicable WS's
-- -- Added toggles for Idle sets
-- -- Added toggles to allow for reverse-cycling through sets
-- -- Added unbinds when job unloads
-- -- Reduced unecessary toggles
-- -- Added automatic subjob detection to determine DW sets
-- -- Added section for augmented gear lists
-- -- Updated detection for "good" WS effective ranges
-- -- Added precast sets for spells and dances x
-- -- Added precast hooks for spells and dances x
-- -- Added macro book/lockstyle sets on load 
-- --
-- -- RNG is a fairly simple job, so the goal was to create a lua with very simple controls to streamline play.
-- -- Though I have rewritten major sections of this lua, it is originally not my own creation and therefore take no credit
-- -- other than the QoL improvments above.
-- -- I plan to maintain this lua as a template, however if you get a hold of this it is YOUR responsibility to understand its use
-- -- and to troubleshoot issues within. I will not fix your lua if I do not know you (and probably wont if I do know you). 
-- -- Have fun~! 
-- --
-- --

--binds--
	send_command("bind !f2 gs equip sets.CP; gs disable back; input /echo <----- CP mantle locked ----->") -- Alt F2 locks CP mantle
	send_command("bind ^f2 gs enable back; input /echo <----- CP mantle unlocked ----->") -- Ctrl F2 unlocks CP mantle

	send_command("bind !F9 gs c toggle TP set") -- Alt+F9 switches between melee sets
	send_command("bind ^F9 gs c toggle TP set reverse") -- Ctrl+F9 switches between melee sets in reverse
	
	send_command("bind !F10 gs c toggle Range set") -- Alt+F10 switches between melee sets
	send_command("bind ^F10 gs c toggle Range set reverse") -- Ctrl+F10 switches between melee sets in reverse
	
	send_command("bind !F12 gs c toggle Idle set") -- Alt+F12 switches between idle sets
	send_command("bind ^F12 gs c toggle Idle set reverse") -- Alt+F12 switches between idle sets in reverse
	
	send_command("bind @q gs c toggle Melee Weapon set") -- WIN+Q swap melee weapon combinations (defaults to Nusku Shield in offhand when not DW)
	send_command("bind @e gs c toggle Range Weapon set") -- WIN+E swap between ranged weapons
	
	send_command("bind !f8 gs c toggle DW set") -- Alt+F8 swap between DualWield and SingleWield for melee sets (can only be toggled if DW is available)


function file_unload()
	--unbinds when job unloads--
	send_command("unbind !f2")
	send_command("unbind ^f2")

	send_command("unbind !F9")
	send_command("unbind ^F9")
	
	send_command("unbind !F10")
	send_command("unbind ^F10")

	send_command("unbind !F12")
	send_command("unbind ^F12")	

	send_command("unbind @q")
	send_command("unbind @e")
	
	send_command("unbind !f8")
end

function get_sets()
    -- Set Macro Book/Set Here	
	set_macros(1,6)
	---Set Lockstyle Here
	set_style(58)
	
	--TrueShot Ranges--
	-- Added for ease of adjustment should you choose to 
	-- model size arguments are taken into account in the logic controlling the sets
	-- Current values shown were retested using in-game TrueShot messages
	
	--Guns
	GunUpper = 5	--Max Trueshot distance
	GunLower = 3.5 	--Min Trueshot distance
	--ShortBows
	SBowUpper = 7
	SBowLower = 5
	--LongBows
	LBowUpper = 10
	LBowLower = 6.5
	--CrossBows
	XBowUpper = 9
	XBowLower = 5.5
	
	

	--Lists--
	RangedWSList = S{'Trueflight', 'Coronach', 'Heavy Shot', 'Last Stand', 'Wildfire', 'Detonator', 'Slug Shot', 'Sniper Shot', 'Split Shot', 'Hot Shot',
						'Apex Arrow', "Jishnu's Radiance", 'Refulgent Arrow', 'Empyreal Arrow', 'Sidewinder', 'Dulling Arrow', 'Piercing Arrow', 'Flaming Arrow'}
						
	Guns = S{'Fomalhaut', 'Armageddon', 'Annihilator', 'Doomsday', 'Holiday', 'Exeter'}
	
	SBows = S{'Ullr', 'Kaja Bow', 'Raetic Bow', 'Raetic Bow +1'}
	
	LBows = S{'Fail-Not', 'Gandiva', 'Yoichinoyumi', "Mpaca's Bow", 'Teller', 'Hangaku-no-Yumi', "Artemis's Bow +1", 
				'Sparrowhawk', 'Sparrowhawk +1', 'Sparrowhawk +2', 'Sparrowhawk +3', 'Accipiter'}
	
	XBows = S{'Gastraphetes', "Scout's Crossbow", 'Arke Crossbow', 'Sharanga', "Gleti's Crossbow"}

	--Augmented Gear
	HercHelm = {}
	HercHelm.WSD = { name="Herculean Helm", augments={'Enmity-3','Pet: "Regen"+2','Weapon skill damage +7%','Accuracy+2 Attack+2','Mag. Acc.+20 "Mag.Atk.Bns."+20',}}
	
	HercVest = {}
	
	HercHands = {}
	HercHands.TH = { name="Herculean Gloves", augments={'VIT+3','"Store TP"+5','"Treasure Hunter"+2','Accuracy+6 Attack+6',}}
	
	HercLegs = {}
	HercLegs.FC = { name="Herculean Trousers", augments={'Pet: STR+6','DEX+4','"Fast Cast"+7','Accuracy+7 Attack+7','Mag. Acc.+4 "Mag.Atk.Bns."+4',}}
	
	HercFeet = {}
	HercFeet.TP = { name="Herculean Boots", augments={'CHR+1','Accuracy+10','Quadruple Attack +3','Accuracy+8 Attack+8',}}
	HercFeet.FC = { name="Herculean Boots", augments={'Pet: Haste+1','"Dual Wield"+3','"Fast Cast"+7','Mag. Acc.+4 "Mag.Atk.Bns."+4',}}
	
	TaeonHead = {}
	TaeonHead.SS = { name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+5',}}
	
	TaeonFeet = {}
	TaeonFeet.TP = { name="Taeon Boots", augments={'Accuracy+20 Attack+20','"Triple Atk."+1','STR+9',}}
	
	AdhemarBody = {}
	AdhemarBody.FC = { name="Adhemar Jacket +1", augments={'HP+105','"Fast Cast"+10','Magic dmg. taken -4',}}
	AdhemarBody.TP = { name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}
	
	Belenus = {}
	Belenus.SS = { name="Belenus's Cape", augments={'"Snapshot"+10',}}
	Belenus.TP = { name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	Belenus.WSD = { name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}}
	Belenus.SB = { name="Belenus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	Belenus.DW = { name="Belenus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10','Phys. dmg. taken-10%',}}
	Belenus.RACrit = { name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Crit.hit rate+10','Phys. dmg. taken-10%',}}	

	--SubJob list--
	sets.SJ = {}
	sets.SJ.index = {"Other", "Ninja", "Dancer"}
	SJ_ind = 1

	--Weapon Sets--
	sets.Weapon_melee = {}
	sets.Weapon_melee.index = {"Melee", "Crit", "Prange", "Mrange"}
	Wm_ind = 1
	sets.Weapon_melee.Melee = {
		main = "Naegling",
		sub = "Ternion Dagger +1"
	}
	sets.Weapon_melee.Crit = {
		main = "Oneiros Knife",
		sub = "Kustawi +1"
	}	
	sets.Weapon_melee.Prange = {
		main = "Perun +1",
		sub = "Kustawi +1"
	}
	sets.Weapon_melee.Mrange = {
		main = "Malevolence",
		sub = "Malevolence"
	}

	sets.Weapon_range = {}
	sets.Weapon_range.index = {"Armageddon", "Annihilator", "Fomalhaut", "FailNot", "Sparrowhawk"} -- 1gun/2xbow/3bow originally
	Wr_ind = 1
	sets.Weapon_range.Armageddon = {
		range = "Armageddon",
		ammo = "Chrono Bullet"
	}
	sets.Weapon_range.Annihilator = {
		range = "Annihilator",
		ammo = "Chrono Bullet"
	}
	sets.Weapon_range.Fomalhaut = {
		range = "Fomalhaut",
		ammo = "Chrono Bullet"
	}
	sets.Weapon_range.FailNot = {
		range = "Fail-not",
		ammo = "Chrono Arrow"
	}	
	sets.Weapon_range.Sparrowhawk = {
		range = "Sparrowhawk +2",
		ammo = "Chrono Arrow"
	}		

	sets.DW_mode = {}
	sets.DW_mode.index = {"DW", "notDW"}
	DW_mode_ind = 1

	sets.DW_mode.DW = {}
	sets.DW_mode.notDW = {sub = "Nusku Shield"}

	--Idle Sets--
	sets.Idle = {}
	sets.Idle.index = {"Standard", "DT"}
	Idle_ind = 1
	sets.Idle.Standard = {
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring", 		
		body = "Nyame Mail", -- 0/0/9
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Defending Ring", -- 0/0/10
		ring2 = "Purity Ring",	-- 0/4/0
		back = Belenus.TP, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = "Carmine Cuisses +1",
		feet = "Malignance Boots" -- 0/0/4
	} -- 10/4/40
	
	sets.Idle.DT = {
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Warder's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring", 		
		body = "Nyame Mail", -- 0/0/9
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Defending Ring", -- 0/0/10
		ring2 = "Purity Ring",	-- 0/4/0
		back = Belenus.TP, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = "Nyame Flanchard", -- 0/0/8
		feet = "Malignance Boots" -- 0/0/4
	} -- 10/4/42

	--CP mantle set--
	sets.CP = {
		--back = "Mecisto. Mantle"
	} -- removed due to job master

	--TP Sets--
	sets.TP = {}
	sets.TP.index = {"Standard", "DT", "HighAccuracy"}
	TP_ind = 1

	sets.TP.Standard = {}
	sets.TP.Standard.index = {"Other", "Ninja", "Dancer"}
	sets.TP.Standard.Other = {
		head = "Dampening Tam", 
		neck = "Sanctity Necklace", 
		ear1 = "Sherida Earring", 
		ear2 = "Telos Earring", 		
		body = AdhemarBody.TP, 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Chirich Ring", 
		ring2 = "Epona's Ring",	
		back = Belenus.TP, 
		waist = "Windbuffet Belt +1",	
		legs = "Samnuha Tights", 
		feet = HercFeet.TP
	} -- 7DA/18TA/8QA | 46 sTP
	sets.TP.Standard.Ninja = {
		head = "Dampening Tam", 
		neck = "Sanctity Necklace", 
		ear1 = "Sherida Earring", 
		ear2 = "Telos Earring", 		
		body = AdhemarBody.TP, 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Chirich Ring", 
		ring2 = "Epona's Ring",	
		back = Belenus.DW, 
		waist = "Windbuffet Belt +1",	
		legs = "Samnuha Tights", 
		feet = HercFeet.TP
	} -- 7DA/18TA/8QA | 36 sTP
	sets.TP.Standard.Dancer = {
		head = "Dampening Tam", 
		neck = "Sanctity Necklace", 
		ear1 = "Sherida Earring", 
		ear2 = "Telos Earring", 		
		body = AdhemarBody.TP, 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Chirich Ring", 
		ring2 = "Epona's Ring",	
		back = Belenus.DW, 
		waist = "Windbuffet Belt +1",	
		legs = "Samnuha Tights", 
		feet = HercFeet.TP
	} -- 7DA/18TA/8QA | 36 sTP

	sets.TP.DT = {}
	sets.TP.DT.index = {"Other", "Ninja", "Dancer"}
	sets.TP.DT.Other = {
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Iskur Gorget", 
		ear1 = "Sherida Earring", 
		ear2 = "Brutal Earring", 		
		body = "Malignance Tabard", -- 0/0/9
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Defending Ring", -- 0/0/10
		ring2 = "Epona's Ring",
		back = Belenus.TP, -- 10/0/0
		waist = "Windbuffet Belt +1",	
		legs = "Malignance Tights", -- 0/0/7
		feet = "Malignance Boots" -- 0/0/4
	} -- 10/0/41
	sets.TP.DT.Ninja = {
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Iskur Gorget", 
		ear1 = "Sherida Earring", 
		ear2 = "Brutal Earring", 		
		body = "Malignance Tabard", -- 0/0/9
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Defending Ring", -- 0/0/10
		ring2 = "Epona's Ring",
		back = Belenus.DW, -- 10/0/0
		waist = "Windbuffet Belt +1",	
		legs = "Malignance Tights", -- 0/0/7
		feet = "Malignance Boots" -- 0/0/4
	} -- 10/0/41
	sets.TP.DT.Dancer = {
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Iskur Gorget", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", 		
		body = "Malignance Tabard", -- 0/0/9
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Defending Ring", -- 0/0/10
		ring2 = "Epona's Ring",
		back = Belenus.DW, -- 10/0/0
		waist = "Windbuffet Belt +1",	
		legs = "Malignance Tights", -- 0/0/7
		feet = "Malignance Boots" -- 0/0/4
	} -- 10/0/41

	sets.TP.HighAccuracy = {}
	sets.TP.HighAccuracy.index = {"Other", "Ninja", "Dancer"}
	sets.TP.HighAccuracy.Other = {
		head = "Malignance Chapeau", 
		neck = "Combatant's Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Telos Earring", 		
		body = AdhemarBody.TP, 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",
		back = Belenus.TP, 
		waist = "Sailfi Belt +1",	
		legs = "Malignance Tights", 
		feet = "Malignance Boots" 
	} 
	sets.TP.HighAccuracy.Ninja = {
		head = "Malignance Chapeau", 
		neck = "Combatant's Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Telos Earring", 		
		body = AdhemarBody.TP, 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",
		back = Belenus.DW, 
		waist = "Sailfi Belt +1",	
		legs = "Malignance Tights", 
		feet = "Malignance Boots" 
	} 
	sets.TP.HighAccuracy.Dancer = {
		head = "Malignance Chapeau", 
		neck = "Combatant's Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", 		
		body = AdhemarBody.TP, 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",
		back = Belenus.DW, 
		waist = "Sailfi Belt +1",	
		legs = "Malignance Tights", 
		feet = "Malignance Boots" 
	}

	sets.Ranged = {}
	sets.Ranged.index = {"Standard", "HighAccuracy"}
	Ranged_ind = 1
	
	sets.Ranged.Standard = {
		head = "Arcadian Beret +3",
		neck = "Iskur Gorget",
		ear1 = "Telos Earring",
		ear2 = "Crepuscular Earring",
		body = "Nisroch Jerkin",
		hands = "Malignance Gloves",
		ring1= "Ilabrat Ring",
		ring2 = "Crepuscular Ring",
		waist = "Tellen Belt",
		back = Belenus.TP,
		legs = "Malignance Tights",
		feet = "Malignance Boots"
	}
	sets.Ranged.HighAccuracy = {
		head = "Orion Beret +3",
		neck = "Iskur Gorget",
		ear1 = "Telos Earring",
		ear2 = "Crepuscular Earring",
		body = "Orion Jerkin +3",
		hands = "Malignance Gloves",
		ring1= "Ilabrat Ring",
		ring2 = "Crepuscular Ring",
		waist = "Tellen Belt",
		back = Belenus.TP,
		legs = "Malignance Tights",
		feet = "Malignance Boots"
	}
	sets.Ranged.DoubleShot = {
		head = "Arcadian Beret +3",
		neck = "Iskur Gorget",
		ear1 = "Telos Earring",
		ear2 = "Crepuscular Earring",
		body = "Arcadian Jerkin +3",
		hands = "Malignance Gloves",
		ring1= "Ilabrat Ring",
		ring2 = "Crepuscular Ring",
		waist = "Tellen Belt",
		back = Belenus.TP,
		legs = "Malignance Tights",
		feet = "Malignance Boots"	
	}
	sets.Ranged.TrueShot = {
		head = "Arcadian Beret +3",
		neck = "Iskur Gorget",
		ear1 = "Telos Earring",
		ear2 = "Crepuscular Earring",
		body = "Nisroch Jerkin",
		hands = "Malignance Gloves",
		ring1= "Ilabrat Ring",
		ring2 = "Crepuscular Ring",
		waist = "Tellen Belt",
		back = Belenus.TP,
		legs = "Amini Brague +1",
		feet = "Malignance Boots"	
	} --Overrides when distance is optimal
	
	--Replaces normal RA sets during Arma AM3
	sets.RangedAM3 = {}
	sets.RangedAM3.index = {"Standard", "HighAccuracy"}
	RangedAM3_ind = 1
	
	sets.RangedAM3.Standard = {
		head = "Meghanada Visor +2",
		neck = "Iskur Gorget",
		ear1 = "Telos Earring",
		ear2 = "Odr Earring",
		body = "Nisroch Jerkin",
		hands = "Mummu Wrists +2",
		ring1 = "Mummu Ring",
		ring2 = "Crepuscular Ring",
		waist = "Tellen Belt",
		back = Belenus.RACrit,
		legs = "Darraigner's Brais",
		feet = "Oshosi Leggings"	
	}
	sets.RangedAM3.HighAccuracy = {
		head = "Meghanada Visor +2",
		neck = "Iskur Gorget",
		ear1 = "Telos Earring",
		ear2 = "Crepuscular Earring",
		body = "Nisroch Jerkin",
		hands = "Mummu Wrists +2",
		ring1 = "Ilabrat Ring",
		ring2 = "Crepuscular Ring",
		waist = "Tellen Belt",
		back = Belenus.RACrit,
		legs = "Malignance Tights",
		feet = "Oshosi Leggings"	
	}
	sets.RangedAM3.DoubleShot = {
		head = "Meghanada Visor +2",
		neck = "Iskur Gorget",
		ear1 = "Telos Earring",
		ear2 = "Odr Earring",
		body = "Arcadian Jerkin +3",
		hands = "Oshosi Gloves",
		ring1 = "Mummu Ring",
		ring2 = "Crepuscular Ring",
		waist = "Tellen Belt",
		back = Belenus.RACrit,
		legs = "Oshosi Trousers",
		feet = "Oshosi Leggings"	
	}
	sets.RangedAM3.TrueShot = {
		head = "Meghanada Visor +2",
		neck = "Iskur Gorget",
		ear1 = "Telos Earring",
		ear2 = "Odr Earring",
		body = "Nisroch Jerkin",
		hands = "Mummu Wrists +2",
		ring1 = "Mummu Ring",
		ring2 = "Crepuscular Ring",
		waist = "Tellen Belt",
		back = Belenus.RACrit,
		legs = "Amini Brague +1",
		feet = "Oshosi Leggings"	
	} --Overrides when distance is optimal

	--Defence Sets--
	set.PDT = {
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Warder's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring", 		
		body = "Nyame Mail", -- 0/0/9
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Defending Ring", -- 0/0/10
		ring2 = "Purity Ring",	-- 0/4/0
		back = Belenus.TP, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = "Nyame Flanchard", -- 0/0/8
		feet = "Malignance Boots" -- 0/0/4
	} -- 10/4/42
	set.MDT = {
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Warder's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring", 		
		body = "Nyame Mail", -- 0/0/9
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Defending Ring", -- 0/0/10
		ring2 = "Purity Ring",	-- 0/4/0
		back = Belenus.TP, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = "Nyame Flanchard", -- 0/0/8
		feet = "Malignance Boots" -- 0/0/4
	} -- 10/4/42


	--Weaponskill Sets--
	--Axe
	sets.WS = {}
	sets.WS.index = {"Attack", "AttackCapped"}
	WS_ind = 1

	sets.Ruinator = {}
	sets.Ruinator.Attack = {
		ammo= "Hauksbok Arrow",
		head = "Adhemar Bonnet +1",
		neck = "Fotia Gorget", 
		ear1 = "Sherida Earring", 
		ear2 = "Brutal Earring", 		
		body = "Nyame Mail",
		hands = "Adhemar Wristbands +1",
		ring1 = "Regal Ring", 
		ring2 = "Epona's Ring",
		back = Belenus.SB, 
		waist = "Fotia Belt",	
		legs = "Samnuha Tights", 
		feet = HercFeet.TP
	}
	sets.Ruinator.AttackCapped = {
		ammo= "Hauksbok Arrow",
		head = "Malignance Chapeau",
		neck = "Fotia Gorget", 
		ear1 = "Sherida Earring", 
		ear2 = "Brutal Earring", 	
		body = "Nyame Mail",
		hands = "Malignance Gloves",
		ring1 = "Regal Ring", 
		ring2 = "Epona's Ring",
		back = Belenus.SB, 
		waist = "Fotia Belt",	
		legs = "Nyame Flanchard", 
		feet = "Malignance Boots"
	}

	sets.Decimation = {}
	sets.Decimation.Attack = {
		ammo= "Hauksbok Arrow",
		head = "Adhemar Bonnet +1",
		neck = "Fotia Gorget", 
		ear1 = "Sherida Earring", 
		ear2 = "Brutal Earring", 		
		body = "Nyame Mail",
		hands = "Adhemar Wristbands +1",
		ring1 = "Regal Ring", 
		ring2 = "Epona's Ring",
		back = Belenus.SB, 
		waist = "Fotia Belt",	
		legs = "Samnuha Tights", 
		feet = HercFeet.TP
	}
	sets.Decimation.AttackCapped = {
		ammo= "Hauksbok Arrow",
		head = "Malignance Chapeau",
		neck = "Fotia Gorget", 
		ear1 = "Sherida Earring", 
		ear2 = "Brutal Earring", 	
		body = "Nyame Mail",
		hands = "Malignance Gloves",
		ring1 = "Regal Ring", 
		ring2 = "Epona's Ring",
		back = Belenus.SB, 
		waist = "Fotia Belt",	
		legs = "Nyame Flanchard", 
		feet = "Malignance Boots"
	}
	
	sets.OtherAxe = {}
	sets.OtherAxe.Attack = {
		head = "Nyame Helm",
		neck = "Fotia Gorget", 
		ear1 = "Sherida Earring", 
		ear2 = "Brutal Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Ilabrat Ring",
		back = Belenus.SB, 
		waist = "Fotia Belt",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.OtherAxe.AttackCapped = {
		head = "Nyame Helm",
		neck = "Fotia Gorget", 
		ear1 = "Sherida Earring", 
		ear2 = "Brutal Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Ilabrat Ring",
		back = Belenus.SB, 
		waist = "Fotia Belt",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}

	--Dagger
	sets.Evisceration = {}
	sets.Evisceration.Attack = {
		ammo= "Hauksbok Arrow",
		head = "Adhemar Bonnet +1",
		neck = "Fotia Gorget", 
		ear1 = "Sherida Earring", 
		ear2 = "Odr Earring", 		
		body = "Meghanada Cuirie +2",
		hands = "Mummu Wrists +2",
		ring1 = "Regal Ring", 
		ring2 = "Epona's Ring",
		back = Belenus.RACrit, 
		waist = "Fotia Belt",	
		legs = "Darraigner's Brais", 
		feet = "Mummu Gamashes +2"
	}
	sets.Evisceration.AttackCapped = {
		head = "Adhemar Bonnet +1",
		neck = "Fotia Gorget", 
		ear1 = "Sherida Earring", 
		ear2 = "Odr Earring", 		
		body = "Meghanada Cuirie +2",
		hands = "Adhemar Wristbands +1",
		ring1 = "Regal Ring", 
		ring2 = "Epona's Ring",
		back = Belenus.RACrit, 
		waist = "Fotia Belt",	
		legs = "Darraigner's Brais",
		feet = "Mummu Gamashes +2"
	}

	--Sword
	sets.SavageBlade = {}
	sets.SavageBlade.Attack = {
		ammo= "Hauksbok Arrow",
		head = "Nyame Helm",
		neck = "Caro Necklace", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Shukuyu Ring",
		back = Belenus.SB, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.SavageBlade.AttackCapped = {
		ammo= "Hauksbok Arrow",
		head = "Orion Beret +3",
		neck = "Caro Necklace", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = HercHands.WSD,
		ring1 = "Regal Ring", 
		ring2 = "Rufescent Ring",
		back = Belenus.SB, 
		waist = "Sailfi Belt +1",	
		legs = "Arcadian Braccae +3", 
		feet = "Nyame Sollerets"
	}	

	--Gun
	sets.Trueflight = {}
	sets.Trueflight.Attack = {
		ammo = "Devastating Bullet",
		head = "Nyame Helm",
		neck = "Baetyl Pendant",
		ear1 = "Friomisi earring",
		ear2 = "Crematio Earring",
		body = "Nyame Mail",
		hands= "Nyame Gauntlets",
		ring1 = "Acumen Ring",
		ring2 = "Dingir Ring",
		waist = "Eschan Stone",
		back = Belenus.WSD,
		Legs = "Nyame Flanchard",
		Feet = "Nyame Sollerets",
	}
	sets.Trueflight.AttackCapped = { --Accuracy Set
		ammo = "Devastating Bullet",
		head = "Nyame Helm",
		neck = "Sanctity Necklace",
		ear1 = "Friomisi earring",
		ear2 = "Crepuscular Earring",
		body = "Nyame Mail",
		hands= "Nyame Gauntlets",
		ring1 = "Dingir Ring",
		ring2 = "Crepuscular Ring",
		waist = "Eschan Stone",
		back = Belenus.WSD,
		Legs = "Nyame Flanchard",
		Feet = "Nyame Sollerets",
	}
	
	sets.Wildfire = {}
	sets.Wildfire.Attack = {
		ammo = "Devastating Bullet",
		head = "Nyame Helm",
		neck = "Baetyl Pendant",
		ear1 = "Friomisi earring",
		ear2 = "Crematio Earring",
		body = "Nyame Mail",
		hands= "Nyame Gauntlets",
		ring1 = "Acumen Ring",
		ring2 = "Dingir Ring",
		waist = "Eschan Stone",
		back = Belenus.WSD,
		Legs = "Nyame Flanchard",
		Feet = "Nyame Sollerets",
	}
	sets.Wildfire.AttackCapped = { --Accuracy Set
		ammo = "Devastating Bullet",
		head = "Nyame Helm",
		neck = "Sanctity Necklace",
		ear1 = "Friomisi earring",
		ear2 = "Crepuscular Earring",
		body = "Nyame Mail",
		hands= "Nyame Gauntlets",
		ring1 = "Dingir Ring",
		ring2 = "Crepuscular Ring",
		waist = "Eschan Stone",
		back = Belenus.WSD,
		Legs = "Nyame Flanchard",
		Feet = "Nyame Sollerets",
	}
	
	sets.HotShot = {}
	sets.HotShot.Attack = {
		ammo = "Devastating Bullet",
		head = "Nyame Helm",
		neck = "Baetyl Pendant",
		ear1 = "Friomisi earring",
		ear2 = "Crematio Earring",
		body = "Nyame Mail",
		hands= "Nyame Gauntlets",
		ring1 = "Acumen Ring",
		ring2 = "Dingir Ring",
		waist = "Eschan Stone",
		back = Belenus.WSD,
		Legs = "Nyame Flanchard",
		Feet = "Nyame Sollerets",
	}
	sets.HotShot.AttackCapped = { --Accuracy Set
		ammo = "Devastating Bullet",
		head = "Nyame Helm",
		neck = "Sanctity Necklace",
		ear1 = "Friomisi earring",
		ear2 = "Crepuscular Earring",
		body = "Nyame Mail",
		hands= "Nyame Gauntlets",
		ring1 = "Dingir Ring",
		ring2 = "Crepuscular Ring",
		waist = "Eschan Stone",
		back = Belenus.WSD,
		Legs = "Nyame Flanchard",
		Feet = "Nyame Sollerets",
	}		
	
	sets.LastStand = {}
	sets.LastStand.Attack = {
		ammo = "Chrono Bullet",
		head = "Orion Beret +3",
		neck = "Fotia Gorget",
		ear1 = "Telos earring",
		ear2 = "Moonshade Earring",
		body = "Nyame Mail",
		hands= "Nyame Gauntlets",
		ring1 = "Regal Ring",
		ring2 = "Dingir Ring",
		waist = "Fotia Belt",
		back = Belenus.WSD,
		Legs = "Arcadian Braccae +3",
		Feet = "Nyame Sollerets"
	}
	sets.LastStand.AttackCapped = {
		ammo = "Chrono Bullet",
		head = "Orion Beret +3",
		neck = "Fotia Gorget",
		ear1 = "Telos earring",
		ear2 = "Moonshade Earring",
		body = "Nyame Mail",
		hands= "Nyame Gauntlets",
		ring1 = "Regal Ring",
		ring2 = "Dingir Ring",
		waist = "Fotia Belt",
		back = Belenus.WSD,
		Legs = "Arcadian Braccae +3",
		Feet = "Nyame Sollerets"
	}

	sets.Coronach = {}
	sets.Coronach.Attack = {
		ammo = "Chrono Bullet",
		head = "Orion Beret +3",
		neck = "Iskur Gorget",
		ear1 = "Sherida earring",
		ear2 = "Ishvara Earring",
		body = "Nyame Mail",
		hands= "Nyame Gauntlets",
		ring1 = "Regal Ring",
		ring2 = "Dingir Ring",
		waist = "Sveltesse Gouriz +1",
		back = Belenus.WSD,
		Legs = "Arcadian Braccae +3",
		Feet = "Nyame Sollerets"
	}
	sets.Coronach.AttackCapped = {
		ammo = "Chrono Bullet",
		head = "Orion Beret +3",
		neck = "Fotia Gorget",
		ear1 = "Sherida earring",
		ear2 = "Ishvara Earring",
		body = "Nyame Mail",
		hands= "Nyame Gauntlets",
		ring1 = "Regal Ring",
		ring2 = "Dingir Ring",
		waist = "Sveltesse Gouriz +1",
		back = Belenus.WSD,
		Legs = "Arcadian Braccae +3",
		Feet = "Nyame Sollerets"
	}	
	
	sets.Detonator = {}
	sets.Detonator.Attack = {
		ammo = "Chrono Bullet",
		head = "Orion Beret +3",
		neck = "Iskur Gorget",
		ear1 = "Ishvara earring",
		ear2 = "Moonshade Earring",
		body = "Nyame Mail",
		hands= "Nyame Gauntlets",
		ring1 = "Regal Ring",
		ring2 = "Dingir Ring",
		waist = "Sveltesse Gouriz +1",
		back = Belenus.WSD,
		Legs = "Arcadian Braccae +3",
		Feet = "Nyame Sollerets"
	}
	sets.Detonator.AttackCapped = {
		ammo = "Chrono Bullet",
		head = "Orion Beret +3",
		neck = "Iskur Gorget",
		ear1 = "Ishvara earring",
		ear2 = "Moonshade Earring",
		body = "Nyame Mail",
		hands= "Nyame Gauntlets",
		ring1 = "Regal Ring",
		ring2 = "Dingir Ring",
		waist = "Sveltesse Gouriz +1",
		back = Belenus.WSD,
		Legs = "Arcadian Braccae +3",
		Feet = "Nyame Sollerets"
	}	

	--Bow
	sets.FlamingArrow = {}
	sets.FlamingArrow.Attack = {
		ammo = "Chrono Arrow",
		head = "Nyame Helm",
		neck = "Fotia Gorget",
		ear1 = "Friomisi earring",
		ear2 = "Moonshade Earring",
		body = "Nyame Mail",
		hands= "Nyame Gauntlets",
		ring1 = "Regal Ring",
		ring2 = "Dingir Ring",
		waist = "Fotia Belt",
		back = Belenus.WSD,
		Legs = "Nyame Flanchard",
		Feet = "Nyame Sollerets",
	}
	sets.FlamingArrow.AttackCapped = { --Accuracy Set
		ammo = "Chrono Arrow",
		head = "Nyame Helm",
		neck = "Sanctity Necklace",
		ear1 = "Friomisi earring",
		ear2 = "Moonshade Earring",
		body = "Nyame Mail",
		hands= "Nyame Gauntlets",
		ring1 = "Regal Ring",
		ring2 = "Dingir Ring",
		waist = "Eschan Stone",
		back = Belenus.WSD,
		Legs = "Nyame Flanchard",
		Feet = "Nyame Sollerets",
	}	
	
	sets.EmpyrealArrow = {}
	sets.EmpyrealArrow.Attack = {
		ammo = "Chrono Arrow",
		head = "Orion Beret +3",
		neck = "Iskur Gorget",
		ear1 = "Ishvara earring",
		ear2 = "Moonshade Earring",
		body = "Nyame Mail",
		hands= "Nyame Gauntlets",
		ring1 = "Regal Ring",
		ring2 = "Dingir Ring",
		waist = "Sveltesse Gouriz +1",
		back = Belenus.WSD,
		Legs = "Arcadian Braccae +3",
		Feet = "Nyame Sollerets"
	}
	sets.EmpyrealArrow.AttackCapped = {
		ammo = "Chrono Arrow",
		head = "Orion Beret +3",
		neck = "Iskur Gorget",
		ear1 = "Ishvara earring",
		ear2 = "Moonshade Earring",
		body = "Nyame Mail",
		hands= "Nyame Gauntlets",
		ring1 = "Regal Ring",
		ring2 = "Dingir Ring",
		waist = "Sveltesse Gouriz +1",
		back = Belenus.WSD,
		Legs = "Arcadian Braccae +3",
		Feet = "Nyame Sollerets"
	}
	
	sets.RefulgentArrow = {}
	sets.EmpyrealArrow.Attack = {
		ammo = "Chrono Arrow",
		head = "Orion Beret +3",
		neck = "Caro Necklace",
		ear1 = "Ishvara earring",
		ear2 = "Moonshade Earring",
		body = "Nyame Mail",
		hands= "Nyame Gauntlets",
		ring1 = "Regal Ring",
		ring2 = "Shukuyu Ring",
		waist = "Sailfi Belt +1",
		back = Belenus.WSD,
		Legs = "Arcadian Braccae +3",
		Feet = "Nyame Sollerets"
	}
	sets.RefulgentArrow.AttackCapped = {
		ammo = "Chrono Arrow",
		head = "Orion Beret +3",
		neck = "Caro Necklace",
		ear1 = "Ishvara earring",
		ear2 = "Moonshade Earring",
		body = "Nyame Mail",
		hands= "Nyame Gauntlets",
		ring1 = "Regal Ring",
		ring2 = "Shukuyu Ring",
		waist = "Sailfi Belt +1",
		back = Belenus.WSD,
		Legs = "Arcadian Braccae +3",
		Feet = "Nyame Sollerets"
	}
	
	sets.ApexArrow = {}
	sets.ApexArrow.Attack = {
		ammo = "Chrono Arrow",
		head = "Orion Beret +3",
		neck = "Iskur Gorget",
		ear1 = "Ishvara earring",
		ear2 = "Moonshade Earring",
		body = "Nyame Mail",
		hands= "Nyame Gauntlets",
		ring1 = "Regal Ring",
		ring2 = "Dingir Ring",
		waist = "Sveltesse Gouriz +1",
		back = Belenus.WSD,
		Legs = "Arcadian Braccae +3",
		Feet = "Nyame Sollerets"
	}
	sets.ApexArrow.AttackCapped = {
		ammo = "Chrono Arrow",
		head = "Orion Beret +3",
		neck = "Iskur Gorget",
		ear1 = "Ishvara earring",
		ear2 = "Moonshade Earring",
		body = "Nyame Mail",
		hands= "Nyame Gauntlets",
		ring1 = "Regal Ring",
		ring2 = "Dingir Ring",
		waist = "Sveltesse Gouriz +1",
		back = Belenus.WSD,
		Legs = "Arcadian Braccae +3",
		Feet = "Nyame Sollerets"
	}

	sets.Jishnu = {}
	sets.Jishnu.Attack = {
		ammo = "Chrono Arrow",
		head = "Orion Beret +3",
		neck = "Iskur Gorget",
		ear1 = "Ishvara earring",
		ear2 = "Moonshade Earring",
		body = "Nyame Mail",
		hands= "Nyame Gauntlets",
		ring1 = "Regal Ring",
		ring2 = "Dingir Ring",
		waist = "Sveltesse Gouriz +1",
		back = Belenus.WSD,
		Legs = "Arcadian Braccae +3",
		Feet = "Nyame Sollerets"
	}
	sets.Jishnu.AttackCapped = {
		ammo = "Chrono Arrow",
		head = "Orion Beret +3",
		neck = "Iskur Gorget",
		ear1 = "Ishvara earring",
		ear2 = "Moonshade Earring",
		body = "Nyame Mail",
		hands= "Nyame Gauntlets",
		ring1 = "Regal Ring",
		ring2 = "Dingir Ring",
		waist = "Sveltesse Gouriz +1",
		back = Belenus.WSD,
		Legs = "Arcadian Braccae +3",
		Feet = "Nyame Sollerets"
	}	
	
	--All Other
	sets.OtherWS = {}
	sets.OtherWS.Attack = {
		Head = "Nyame Helm",
		neck = "Fotia gorget",
		ear1 = "Sherida Earring",
		ear2 = "Moonshade Earring",
		body = "Nayme Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring",
		ring2 = "Shukuyu Ring",
		back = Belenus.SB,
		waist = "Fotia Belt",
		legs = "Nyame Flanchard",
		feet = "Nyame Sollerets"
	}
	sets.OtherWS.Accuracy = {
		Head = "Nyame Helm",
		neck = "Fotia gorget",
		ear1 = "Sherida Earring",
		ear2 = "Moonshade Earring",
		body = "Nayme Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring",
		ring2 = "Shukuyu Ring",
		back = Belenus.SB,
		waist = "Fotia Belt",
		legs = "Nyame Flanchard",
		feet = "Nyame Sollerets"
	}

	sets.RangedWS = {}
	sets.RangedWS.Attack = {
		ammo = "Chrono Bullet",
		head = "Orion Beret +3",
		neck = "Iskur Gorget",
		ear1 = "Ishvara earring",
		ear2 = "Moonshade Earring",
		body = "Nyame Mail",
		hands= "Nyame Gauntlets",
		ring1 = "Regal Ring",
		ring2 = "Dingir Ring",
		waist = "Sveltesse Gouriz +1",
		back = Belenus.WSD,
		Legs = "Arcadian Braccae +3",
		Feet = "Nyame Sollerets"
	}
	sets.RangedWS.Accuracy = {
		ammo = "Chrono Bullet",
		head = "Orion Beret +3",
		neck = "Iskur Gorget",
		ear1 = "Ishvara earring",
		ear2 = "Moonshade Earring",
		body = "Nyame Mail",
		hands= "Nyame Gauntlets",
		ring1 = "Regal Ring",
		ring2 = "Dingir Ring",
		waist = "Sveltesse Gouriz +1",
		back = Belenus.WSD,
		Legs = "Arcadian Braccae +3",
		Feet = "Nyame Sollerets"
	}

	sets.AeolianEdge = {}
	sets.AeolianEdge = {
		head = "Nyame Helm",
		neck = "Baetyl Pendant",
		ear2 = "Friomisi earring",
		ear1 = "Moonshade Earring",
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Acumen Ring",
		ring2 = "Dingir Ring",
		waist = "Eschan Stone",
		back = Belenus.WSD,
		Legs = "Nyame Flanchard",
		Feet = "Nyame Sollerets",
	}

	--Job Ability Sets--
	sets.JA = {}
	sets.JA.EES = {legs = "Arcadian Braccae +3"}
	sets.JA.Scavange = {}
	sets.JA.SBind = {hands = "Orion Bracers +2"}
	sets.JA.Camo = {body = "Orion Jerkin +3"}
	sets.JA.SShot = {legs = "Orion Braccae +3"}
	sets.JA.Barrage = {
		head = "Meghanada Visor +2",
		neck = "Iskur Gorget",
		ear1 = "Telos Earring",
		ear2 = "Odr Earring",
		body = "Nisroch Jerkin",
		hands = "Mummu Wrists +2",
		ring1 = "Mummu Ring",
		ring2 = "Crepuscular Ring",
		waist = "Tellen Belt",
		back = Belenus.RACrit,
		legs = "Darraigner's Brais",
		feet = "Oshosi Leggings"
	}
	sets.BarrageTrueShot = {
		head = "Meghanada Visor +2",
		neck = "Iskur Gorget",
		ear1 = "Telos Earring",
		ear2 = "Odr Earring",
		body = "Nisroch Jerkin",
		hands = "Mummu Wrists +2",
		ring1 = "Mummu Ring",
		ring2 = "Crepuscular Ring",
		waist = "Tellen Belt",
		back = Belenus.RACrit,
		legs = "Amini Brague +1",
		feet = "Oshosi Leggings"		
	}
	sets.JA.VShot = {body = "Amini Caban +1"}
	sets.JA.BShot = {
		hands = "Amini glovelettes +1",
		waist = "Chaac Belt"
	}
	
	sets.Waltz ={
	-- Insert gear here as desired
	}
	
	sets.precast = {}
	sets.precast.FastCast = {
		head = HercHelm.FC,
		neck = "Orunmila's Torque",
		ear1 = "Enchater's Earring +1",
		ear2 = "Loquacious Earring",
		body = AdhemarBody.FC,
		hands = "Leyline Gloves",
		ring1 = "Rahab Ring",
		ring2 = "Naji's Loop",
		waist = "Flume Belt +1",
		back = Belenus.TP,
		legs = HercLegs.FC,
		feet = HercFeet.FC	
	}
	
	sets.precast.NinjutsuFastCast = set_combine(sets.precast.FastCast, {
		neck = "Magoroga Beads",
		body = "Passion Jacket"
	})
	
	sets.midcast = {}
	-- FC here will lower recasts until cap, but its a good idea to put -DT% in midcasts
	sets.midcast.FastRecast = {
		head = HercHelm.FC,
		neck = "Orunmila's Torque",
		ear1 = "Odnowa Earring +1",
		ear2 = "Genmei Earring",
		body = AdhemarBody.FC,
		hands = "Leyline Gloves",
		ring1 = "Defending Ring",
		ring2 = "Gelatinous Ring +1",
		waist = "Flume Belt +1",
		back = Belenus.TP,
		legs = HercLegs.FC,
		feet = HercFeet.FC
	}

	--Other special gear--
	sets.obi = {
		waist = "Hachirin-no-Obi"
	}

	sets.lightnuke = {
		left_ring = "Weatherspoon Ring"
	}

	--Precast Sets--
	--Assumes no Flurry and 5/5 SS merits, +60 needed to cap
	sets.snapshot = {
		head=TaeonHead.SS, --10/0
		neck="Scout's Gorget +1", --3/0
        body="Amini Caban +1",
        hands="Carmine Fin. Ga. +1", --8/11
		ring2="Crepuscular Ring", --3/0
        legs="Adhemar Kecks", --9/10
        feet="Meghanada Jambeaux +2", --10/0
		back=Belenus.SS, --10/0
        waist="Impulse Belt", --3/0
    } --56/21
	--Assumes Flurry1 and 5/5 SS merits, +45 needed to cap
	sets.snapshotF1 = {
		head="Orion Beret +3", --0/18
		neck="Scout's Gorget +1", --3/0
        body="Amini Caban +1",
        hands="Carmine Fin. Ga. +1", --8/11
		ring2="Crepuscular Ring", --3/0
        legs="Adhemar Kecks", --9/10
        feet="Meghanada Jambeaux +2", --10/0
		back=Belenus.SS, --10/0
        waist="Impulse Belt", --3/0
    } --46/39
	--Assume Flurry2 and 5/5 SS merits, +30 needed to cap
	sets.snapshotF2 = {
		head="Orion Beret +3", --0/18
		neck="Scout's Gorget +1", --3/0
        body="Amini Caban +1",
        hands="Carmine Fin. Ga. +1", --8/11
		ring2="Crepuscular Ring", --3/0
        legs="Adhemar Kecks", --9/10
        feet="Meghanada Jambeaux +2", --10/0
		back=Belenus.SS, --10/0
        waist="Impulse Belt", --3/0
    } --46/39
	
	--Determines SJ on load for later use, DO NOT REMOVE--
	determine_sub()	
end


-- Select default macro book on initial load or subjob change.
function set_macros(sheet,book)
    if book then
        send_command('@input /macro book '..tostring(book)..';wait .1;input /macro set '..tostring(sheet))
        return
    end
end

function set_style(sheet)
    send_command('@input ;wait 5.0;input /lockstyleset '..sheet)
end


-- Job Control Functions
function precast(spell)
	if spell.english == "Ranged" then
		if buffactive['Flurry II'] then
			equip(sets.snapshotF2)
		elseif buffactive['Flurry'] then
			equip(sets.snapshotF1)
		else
			equip(sets.snapshot)
		end
	elseif (spell.type == 'WhiteMagic' or spell.type == 'BlackMagic') then
		equip(sets.precast.FastCast)
	elseif spell.type == 'Ninjutsu' then
		equip(sets.precast.NinjutsuFastCast)
	elseif spell.type == 'Waltz' then
		equip(sets.Waltz)
	elseif spell.type == "WeaponSkill" then
		if player.tp >= 1000 then
			--handles ranged WS's
			if spell.target.distance <= 21.5 then
				if spell.english == "Last Stand" then
					equip(sets.LastStand[sets.WS.index[WS_ind]])
				end
				if spell.english == "Coronach" then
					equip(sets.Coronach[sets.WS.index[WS_ind]])
				end
				if spell.english == "Wildfire" then
					equip(sets.Wildfire[sets.WS.index[WS_ind]])
					if world.day_element == "Fire" or world.weather_element == "Fire" then
						equip(sets.obi)
					end
				end
				if spell.english == "Trueflight" then
					equip(sets.Trueflight[sets.WS.index[WS_ind]])
					if world.day_element == "Light" or world.weather_element == "Light" then
						equip(sets.obi)
					end
				end	
				if spell.english == "Detonator" then
					equip(sets.Detonator[sets.WS.index[WS_ind]])
				end	
				if spell.english == "Hot Shot" then
					equip(sets.HotShot[sets.WS.index[WS_ind]])
					if world.day_element == "Fire" or world.weather_element == "Fire" then
						equip(sets.obi)
					end
				end
				if spell.english == "Jishnu's Radiance" then
					equip(sets.Jishnu[sets.WS.index[WS_ind]])
				end
				if spell.english == "Refulgent Arrow" then
					equip(sets.RefulgentArrow[sets.WS.index[WS_ind]])
				end
				if spell.english == "Empyreal Arrow" then
					equip(sets.EmpyrealArrow[sets.WS.index[WS_ind]])
				end
				if spell.english == "Flaming Arrow" then
					equip(sets.FlamingArrow[sets.WS.index[WS_ind]])
					if world.day_element == "Fire" or world.weather_element == "Fire" then
						equip(sets.obi)
					end
				end
				--generic ranged WS
				if spell.english == "Heavy Shot" or
						spell.english == "Slug Shot" or
						spell.english == "Sniper Shot" or
						spell.english == "Split Shot" or
						spell.english == "Arching Arrow" or
						spell.english == "Sidewinder" or
						spell.english == "Dulling Arrow" or
						spell.english == "Piercing Arrow" then
					equip(sets.RangedWS[sets.WS.index[WS_ind]])
				end						
			else
				cancel_spell()
				windower.add_to_chat(121, "Canceled " .. spell.name .. " " .. spell.target.name .. " is Too Far")
			end
			--handles close-range WS's
			if RangedWSList:contains(spell.english) then
				--Do Nothing
			else
				if spell.target.distance <= 5.5 then			
					if spell.english == "Blast Shot" or 
							spell.english == "Blast Arrow" or 
							spell.english == "Numbing Shot" then
						equip(sets.RangedWS[sets.WS.index[WS_ind]])
					end
					if spell.english == "Ruinator" then
						equip(sets.Ruinator[sets.WS.index[WS_ind]])
					end
					if spell.english == "Decimation" then
						equip(sets.Decimation[sets.WS.index[WS_ind]])
					end
					if spell.english == "Aeolian Edge" then
						equip(sets.AeolianEdge)
						if world.day_element == "Wind" or world.weather_element == "Wind" then
							equip(sets.obi)
						end
					end
					if spell.english == "Evisceration" then
						equip(sets.Evisceration[sets.WS.index[WS_ind]])
					end
					if spell.english == "Bora Axe" or spell.english == "Decimation" or spell.english == "Avalanche" or
							spell.english == "Gale Axe" or
							spell.english == "Smash Axe" or
							spell.english == "Raging Axe"
					 then
						equip(sets.OtherAxe[sets.WS.index[WS_ind]])
					elseif spell.type == "WeaponSkill" then
						equip(sets.OtherWS[sets.WS.index[WS_ind]])
					end
				else
					cancel_spell()
					windower.add_to_chat(121, "Canceled " .. spell.name .. " " .. spell.target.name .. " is Too Far")
				end
			end
		end
	elseif spell.english == "Scavange" then
		equip(sets.JA.Scavange)
	elseif spell.english == "Eagle Eye Shot" then
		equip(set_combine(sets.Ranged[sets.Ranged.index[WS_ind]], sets.JA.EES))
	elseif spell.english == "Shadowbind" then
		equip(sets.JA.SBind)
	elseif spell.english == "Camouflage" then
		equip(sets.JA.Camo)
	elseif spell.english == "Sharpshot" then
		equip(sets.JA.SShot)
	elseif spell.english == "Bounty Shot" then
		equip(sets.JA.BShot)
	end
end

function midcast(spell, act)
	if spell.english == "Ranged" then
		if player.equipment.range == 'Armageddon' and buffactive['Aftermath: Lv.3'] then
			if buffactive['Double Shot'] then
				equip(sets.RangedAM3.DoubleShot)
			else
				if ((spell.target.distance < (GunUpper + spell.target.model_size)) and (spell.target.distance > (GunLower + spell.target.model_size))) then					
					equip(sets.RangedAM3.TrueShot)
					send_command("@input /echo RangedAM3 TrueShot")
				else
					equip(sets.RangedAM3[sets.RangedAM3.index[WS_ind]])
					send_command("@input /echo RangedAM3")
				end
			end
		else
			if buffactive['Double Shot'] then
				equip(sets.Ranged.DoubleShot)
			else
				if ( Guns:contains(player.equipment.range) and (spell.target.distance < (GunUpper + spell.target.model_size)) and (spell.target.distance > (GunLower + spell.target.model_size)) ) or
					( SBows:contains(player.equipment.range) and (spell.target.distance < (SBowUpper + spell.target.model_size)) and (spell.target.distance > (SBowLower + spell.target.model_size)) ) or
					( LBows:contains(player.equipment.range) and (spell.target.distance < (LBowUpper + spell.target.model_size)) and (spell.target.distance > (LBowLower + spell.target.model_size)) ) or
					( XBows:contains(player.equipment.range) and (spell.target.distance < (XBowUpper + spell.target.model_size)) and (spell.target.distance > (XBowLower + spell.target.model_size)) ) then
					
					equip(sets.Ranged.TrueShot)
				else
					equip(sets.Ranged[sets.Ranged.index[WS_ind]])
				end
			end
		end
		
		if buffactive["Barrage"] then
			if ( Guns:contains(player.equipment.range) and (spell.target.distance < (GunUpper + spell.target.model_size)) and (spell.target.distance > (GunLower + spell.target.model_size)) ) or
				( SBows:contains(player.equipment.range) and (spell.target.distance < (SBowUpper + spell.target.model_size)) and (spell.target.distance > (SBowLower + spell.target.model_size)) ) or
				( LBows:contains(player.equipment.range) and (spell.target.distance < (LBowUpper + spell.target.model_size)) and (spell.target.distance > (LBowLower + spell.target.model_size)) ) or
				( XBows:contains(player.equipment.range) and (spell.target.distance < (XBowUpper + spell.target.model_size)) and (spell.target.distance > (XBowLower + spell.target.model_size)) ) then
					
				equip(sets.BarrageTrueShot)
			else			
				equip(sets.JA.Barrage)
			end
		end	
	end
	
	if (spell.type == 'WhiteMagic' or spell.type == 'BlackMagic' or spell.type == 'Ninjutsu') then
		equip(sets.midcast.FastRecast)
	end
end

function aftercast(spell)
	if player.status == "Engaged" then
		equip(
			set_combine(
				sets.TP[sets.TP.index[TP_ind]][sets.SJ.index[SJ_ind]],
				sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]],
				sets.Weapon_range[sets.Weapon_range.index[Wr_ind]],
				sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
			)
		)
	else
		equip(
			set_combine(
				sets.Idle[sets.Idle.index[Idle_ind]],
				sets.Weapon_range[sets.Weapon_range.index[Wr_ind]],
				sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
			)
		)
	end
end

function status_change(new, old)
	if new == "Engaged" then
		equip(
			set_combine(
				sets.TP[sets.TP.index[TP_ind]][sets.SJ.index[SJ_ind]],
				sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]],
				sets.Weapon_range[sets.Weapon_range.index[Wr_ind]],
				sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
			)
		)
	else
		equip(
			set_combine(
				sets.Idle[sets.Idle.index[Idle_ind]],
				sets.Weapon_range[sets.Weapon_range.index[Wr_ind]],
				sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
			)
		)
	end
end

function determine_sub()
	if player.sub_job == 'NIN' then 
		SJ_ind = 2 --DW25
		DW_mode_ind = 1
		send_command("@input /echo SJ is Ninja")
	elseif player.sub_job == 'DNC' then
		SJ_ind = 3 --DW15
		DW_mode_ind = 1
		send_command("@input /echo SJ is Dancer")
	else
		SJ_ind = 1 --No DW
		DW_mode_ind = 2
		send_command("unbind !f8")
		send_command("@input /echo SJ is non-DW")
	end
	equip(	
		set_combine(
			sets.TP[sets.TP.index[TP_ind]][sets.SJ.index[SJ_ind]],
			sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]],
			sets.Weapon_range[sets.Weapon_range.index[Wr_ind]],
			sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
		)
	)
end

function self_command(command)
	if command == "toggle TP set" then
		TP_ind = TP_ind + 1
		if TP_ind > #sets.TP.index then
			TP_ind = 1
		end
		send_command("@input /echo <----- TP Set changed to " .. sets.TP.index[TP_ind] .. " ----->")
		if player.status ~= 'engaged' then
			equip(
				set_combine(
					sets.Idle[sets.Idle.index[Idle_ind]],
					sets.Weapon_range[sets.Weapon_range.index[Wr_ind]],
					sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
				)
			)
		else
			equip(	
				set_combine(
					sets.TP[sets.TP.index[TP_ind]][sets.SJ.index[SJ_ind]],
					sets.Weapon_range[sets.Weapon_range.index[Wr_ind]],
					sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
				)
			)
		end
	elseif command == "toggle TP set reverse" then
		TP_ind = TP_ind - 1
		if TP_ind < 1 then
			TP_ind = #sets.TP.index
		end
		send_command("@input /echo <----- TP Set changed to " .. sets.TP.index[TP_ind] .. " ----->")
		if player.status ~= 'engaged' then
			equip(
				set_combine(
					sets.Idle[sets.Idle.index[Idle_ind]],
					sets.Weapon_range[sets.Weapon_range.index[Wr_ind]],
					sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
				)
			)
		else
			equip(	
				set_combine(
					sets.TP[sets.TP.index[TP_ind]][sets.SJ.index[SJ_ind]],
					sets.Weapon_range[sets.Weapon_range.index[Wr_ind]],
					sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
				)
			)
		end
	elseif command == "toggle Range set" then
		Ranged_ind = Ranged_ind + 1
		RangedAM3_ind = RangedAM3_ind + 1
		if Ranged_ind > #sets.Ranged.index then
			Ranged_ind = 1
			RangedAM3_ind = 1
		end
		send_command("@input /echo <----- Ranged Set changed to " .. sets.Ranged.index[Ranged_ind] .. " ----->")
		if player.status ~= 'engaged' then
			equip(
				set_combine(
					sets.Idle[sets.Idle.index[Idle_ind]],
					sets.Weapon_range[sets.Weapon_range.index[Wr_ind]],
					sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
				)
			)
		else
			equip(	
				set_combine(
					sets.TP[sets.TP.index[TP_ind]][sets.SJ.index[SJ_ind]],
					sets.Weapon_range[sets.Weapon_range.index[Wr_ind]],
					sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
				)
			)
		end
	elseif command == "toggle Range set reverse" then
		Ranged_ind = Ranged_ind - 1
		RangedAM3_ind = Ranged_indAM3 - 1
		if Ranged_ind < 1 then
			Ranged_ind = #sets.Ranged.index
			RangedAM3_ind = #sets.RangedAM3.index
		end
		send_command("@input /echo <----- Ranged Set changed to " .. sets.Range.index[Range_ind] .. " ----->")
		if player.status ~= 'engaged' then
			equip(
				set_combine(
					sets.Idle[sets.Idle.index[Idle_ind]],
					sets.Weapon_range[sets.Weapon_range.index[Wr_ind]],
					sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
				)
			)
		else
			equip(	
				set_combine(
					sets.TP[sets.TP.index[TP_ind]][sets.SJ.index[SJ_ind]],
					sets.Weapon_range[sets.Weapon_range.index[Wr_ind]],
					sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
				)
			)		
		end
	elseif command == "toggle WS set" then
		WS_ind = WS_ind + 1
		if WS_ind > #sets.WS.index then
			WS_ind = 1
		end
		if player.status ~= 'engaged' then
			equip(
				set_combine(
					sets.Idle[sets.Idle.index[Idle_ind]],
					sets.Weapon_range[sets.Weapon_range.index[Wr_ind]],
					sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
				)
			)
		else
			equip(	
				set_combine(
					sets.TP[sets.TP.index[TP_ind]][sets.SJ.index[SJ_ind]],
					sets.Weapon_range[sets.Weapon_range.index[Wr_ind]],
					sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
				)
			)
		end
	elseif command == "toggle Melee Weapon set" then
		Wm_ind = Wm_ind + 1
		if Wm_ind > #sets.Weapon_melee.index then
			Wm_ind = 1
		end
		send_command("@input /echo <----- Melee weapon changed to " .. sets.Weapon_melee.index[Wm_ind] .. " ----->")
		if player.status ~= 'engaged' then
			equip(
				set_combine(
					sets.Idle[sets.Idle.index[Idle_ind]],
					sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]],
					sets.Weapon_range[sets.Weapon_range.index[Wr_ind]],
					sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
				)
			)
		else
			equip(	
				set_combine(
					sets.TP[sets.TP.index[TP_ind]][sets.SJ.index[SJ_ind]],
					sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]],
					sets.Weapon_range[sets.Weapon_range.index[Wr_ind]],
					sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
				)
			)
		end
	elseif command == "toggle Range Weapon set" then
		Wr_ind = Wr_ind + 1
		if Wr_ind > #sets.Weapon_range.index then
			Wr_ind = 1
		end
		send_command("@input /echo <----- Range weapon changed to " .. sets.Weapon_range.index[Wr_ind] .. " ----->")
		if player.status ~= 'engaged' then
			equip(
				set_combine(
					sets.Idle[sets.Idle.index[Idle_ind]],
					sets.Weapon_range[sets.Weapon_range.index[Wr_ind]],
					sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
				)
			)
		else
			equip(	
				set_combine(
					sets.TP[sets.TP.index[TP_ind]][sets.SJ.index[SJ_ind]],
					sets.Weapon_range[sets.Weapon_range.index[Wr_ind]],
					sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
				)
			)
		end
	elseif command == "toggle DW set" then
		DW_mode_ind = DW_mode_ind + 1
		if DW_mode_ind > #sets.DW_mode.index then
			DW_mode_ind = 1
		end
		send_command("@input /echo <----- DW status changed to " .. sets.DW_mode.index[DW_mode_ind] .. " ----->")
		if player.status ~= 'engaged' then
			equip(
				set_combine(
					sets.Idle[sets.Idle.index[Idle_ind]],
					sets.Weapon_range[sets.Weapon_range.index[Wr_ind]],
					sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
				)
			)
		else
			equip(	
				set_combine(
					sets.TP[sets.TP.index[TP_ind]][sets.SJ.index[SJ_ind]],
					sets.Weapon_range[sets.Weapon_range.index[Wr_ind]],
					sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
				)
			)
		end
	elseif command == "toggle Idle set" then
		Idle_ind = Idle_ind + 1
		if Idle_ind > #sets.Idle.index then
			Idle_ind = 1
		end
		send_command("@input /echo <----- Idle Set changed to " .. sets.Idle.index[Idle_ind] .. " ----->")
		if player.status ~= 'engaged' then
			equip(
				set_combine(
					sets.Idle[sets.Idle.index[Idle_ind]],
					sets.Weapon_range[sets.Weapon_range.index[Wr_ind]],
					sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
				)
			)
		else
			equip(	
				set_combine(
					sets.TP[sets.TP.index[TP_ind]][sets.SJ.index[SJ_ind]],
					sets.Weapon_range[sets.Weapon_range.index[Wr_ind]],
					sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
				)
			)
		end
	elseif command == "toggle Idle set reverse" then
		Idle_ind = Idle_ind - 1
		if Idle_ind < 1 then
			Idle_ind = #sets.Idle.index
		end
		send_command("@input /echo <----- Idle Set changed to " .. sets.Idle.index[Idle_ind] .. " ----->")
		if player.status ~= 'engaged' then
			equip(
				set_combine(
					sets.Idle[sets.Idle.index[Idle_ind]],
					sets.Weapon_range[sets.Weapon_range.index[Wr_ind]],
					sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
				)
			)
		else
			equip(	
				set_combine(
					sets.TP[sets.TP.index[TP_ind]][sets.SJ.index[SJ_ind]],
					sets.Weapon_range[sets.Weapon_range.index[Wr_ind]],
					sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
				)
			)
		end
	end
end