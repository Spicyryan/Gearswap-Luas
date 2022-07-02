-------------WARNING NOTE----------------------
----------No, really, are you reading this?-----

--THIS IS ESSENTIALLY AN ALPHA VERSION--
---I have been converting this over little by little from my RUN lua. It is just to a usable state so I wanted to share it.
----This is why most niche sets like Enmity have RUN gear in it. I just haven't needed to update or use it.

---There is still functionality I wish to add, but this handles the job at this point.
----Martial Arts for example. While I have Kenkonken and didn't really need to build this in yet, it is likely that I will eventually add it.

-----I also plan on chaning alt + f11 to equip sets (WS, Enmity+, MAB/Macc) based on frame combinations as the next additions. 

--There may be bugs or other issues. I will remove this whole note when this is not the case.
---Due to time constraints, I haven't fully vetted nor refined this, but its ready for general use.
-------------------------------------------------------------------------------------------------




--Built off of, well, all of my other gearswaps.
---Thanks to various sources such as the BlueGartr Forums and  LS members such as Thefoxdanger for the help building these GearSwaps.

--The goal of this .lua, is to be deep enough, but still fluid, flexible, and reactive with little automation, and still kept rather simple.
---This means keeping toggles limited, and overall feels similar to using any of my other luas.
----This goes for all of my .luas, but PUP tends to be more complicated, and for good reason.
--------------------------------------------------------------------------------------------------
--This lua starts off defaulted in Master TP gear. Press cntrl + F8 to toggle between Master, PetHybrid, and Pet modes:
---/console gs c toggle TPMode
----Pet mode will not use the idle sets, but keeps that pet gear on. Not sure how I feel about this, but it seems the most practical.

--Pressing F9 will toggle the currently active set.

--Alt + F9 will cycle sets backwards, F9 just cycles fowards.

--You may cycle DT sets with alt + f7 regardless of which TPing mode is active. This is useful for getting Meva or DT or a Hybrid ready ahead of time.

--F11 turns automatic puppet derp-ploying on or off. Once you engage a foe and the puppet is sitting around it deploys. Off by default.

--

--Augmented Gear--

function get_sets()
	maps()
	
	HerculeanHelm = {}
    HerculeanHelm.Refresh = { name = "Herculean Helm", augments = { 'Weapon skill damage +2%','Pet: Accuracy+11 Pet: Rng. Acc.+11','"Refresh"+2', } }
    HerculeanHelm.WSD = { name = "Herculean Helm", augments = { 'Accuracy+15','STR+11','Weapon skill damage +7%' } }
	
	HerculeanVest = {}
	HerculeanVest.Phalanx = { name="Herculean Vest", augments = {'Chance of successful block +3','Pet: Attack+4 Pet: Rng.Atk.+4','Phalanx +5','Mag. Acc.+10 "Mag.Atk.Bns."+10',}}
	
	TaeonBody = {}
	TaeonBody.FC = { name="Taeon Tabard", augments={'Accuracy+23','"Fast Cast"+5','HP+36',} }
	TaeonBody.Pet = { name="Taeon Tabard", augments = {'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',} }
	
	HerculeanGloves = {}
    HerculeanGloves.Refresh = { name = "Herculean Gloves", augments = { 'Spell interruption rate down -1%','"Repair" potency +4%','"Refresh"+2','Accuracy+9 Attack+9','Mag. Acc.+16 "Mag.Atk.Bns."+16', } }
    HerculeanGloves.Phalanx = { name="Herculean Gloves", augments={'INT+5','Pet: "Dbl. Atk."+3','Phalanx +4',}}
    HerculeanGloves.QA = { name="Herculean Gloves", augments={'"Mag.Atk.Bns."+30','Pet: DEX+7','Quadruple Attack +3','Accuracy+14 Attack+14','Mag. Acc.+12 "Mag.Atk.Bns."+12', } }
    HerculeanGloves.PetNuke = { name="Herculean Gloves", augments={'Pet: "Mag.Atk.Bns."+25','Pet: INT+7','Pet: Attack+10 Pet: Rng.Atk.+10', } }
	
	HerculeanLegs = {}
    HerculeanLegs.TH = { name = "Herculean Trousers", augments = { 'INT+5','MND+6','"Treasure Hunter"+1','Mag. Acc.+17 "Mag.Atk.Bns."+17', } }
    HerculeanLegs.FC = { name = "Herculean Trousers", augments = { 'STR+10','MND+10','"Fast Cast"+7','Accuracy+17 Attack+17' } }
	
	TaeonBoots = {}
	TaeonBoots.Pet = { name="Taeon Boots", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}}
	
	HerculeanFeet = {}
	HerculeanFeet.QA = { name = "Herculean Boots", augments = { 'Enmity-2','Crit.hit rate+1','Quadruple Attack +3','Accuracy+20 Attack+20','Mag. Acc.+16 "Mag.Atk.Bns."+16', } }
    HerculeanFeet.DT = { name = "Herculean Boots", augments = { 'Accuracy+23', 'Damage taken -3%' } }
    HerculeanFeet.Idle = { name = "Herculean Boots", augments = { 'Crit. hit damage +1%','STR+10','"Refresh"+2','Accuracy+15 Attack+15','Mag. Acc.+17 "Mag.Atk.Bns."+17', } }
    HerculeanFeet.Crit = { name = "Herculean Boots", augments = { 'Accuracy+25','Crit. hit damage +4%','STR+9', } }
    HerculeanFeet.WSD = { name = "Herculean Boots", augments = { 'INT+3','AGI+5','Weapon skill damage +9%','Accuracy+12 Attack+12','Mag. Acc.+13 "Mag.Atk.Bns."+13'} }
    HerculeanFeet.DW = { name = "Herculean Boots", augments = { 'Accuracy+3 Attack+3','"Dual Wield"+4','AGI+3','Accuracy+14', } }
    HerculeanFeet.Phalanx = { name = "Herculean Boots", augments = { '"Store TP"+1','INT+10','Phalanx +3','Accuracy+16 Attack+16','Mag. Acc.+19 "Mag.Atk.Bns."+19' } }
    HerculeanFeet.TH = { name="Herculean Boots", augments = { 'Phys. dmg. taken -2%','Pet: Phys. dmg. taken -2%','"Treasure Hunter"+2','Accuracy+16 Attack+16','Mag. Acc.+18 "Mag.Atk.Bns."+18', } }
	
	Visucius = {}
	Visucius.STP = { name="Visucius's Mantle", augments= { 'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10', 'Phys. dmg. taken-10%', } }
	Visucius.STRCrit = { name="Visucius's Mantle", augments = { 'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10', } }
	Visucius.STRDA = { name="Visucius's Mantle", augments= { 'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10', 'Phys. dmg. taken-10%', } }
	Visucius.PetTP = { name="Visucius's Mantle", augments= { 'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10','System: 1 ID: 1246 Val: 4', } }
	Visucius.PetDT = { name="Visucius's Mantle", augments= { 'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: Damage taken -5%', } }
	Visucius.PetNuke = { name="Visucius's Mantle", augments= { 'Pet: M.Acc.+20 Pet: M.Dmg.+20','Accuracy+20 Attack+20','Pet: Mag. Acc.+10','Pet: "Regen"+10', } }
	
------End of Augmented Gear-----------------------------------------------------------------------------------------------------------------------------
	--TP Mode Index--
	TPMode = {}
	TPMode.index = { 'MasterTP', 'PetHybridTP', 'PetTP'}
	TPMode_ind = 1

	--Idle Sets--
	sets.Idle = {}
	sets.Idle.index = { 'Standard', 'DT', 'Pet',}
	Idle_ind = 1

	sets.Idle.Standard = {
		head = "Nyame Helm",
		neck = "Loricate Torque +1",
		ear1 = "Brachyura Earring",
		ear2 = "Etiolation Earring",
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Gelatinous Ring +1",
		ring2 = "Shneddick Ring +1",
		back = Visucius.PetDT,
		waist = "Moonbow Belt +1",
		legs = "Nyame Flanchard",
		feet = "Mpaca's Boots"
	}
	
	sets.Idle.DT = {
		head = "Malignance Chapeau",
		neck = "Loricate Torque +1",
		ear1 = "Brachyura Earring",
		ear2 = "Etiolation Earring",
		body = "Malignance Tabard",
		hands = "Malignance Gloves",
		ring1 = "Gelatinous Ring +1",
		ring2 = "Epaminondas's Ring",
		back = "Moonlight Cape",
		waist = "Moonbow Belt +1",
		legs = "Malignance Tights",
		feet = "Mpaca's Boots"
	}
	
	sets.Idle.Pet = {
		head = "Mpaca's Cap",
		neck = "Loricate Torque +1",
		ear1 = "Enmerkar Earring",
		ear2 = "Domesticator's Earring",
		body = "Mpaca's Doublet",
		hands = "Mpaca's Gloves",
		ring1 = "Gelatinous Ring +1",
		ring2 = "Cath Palug Ring",
		back = Visucius.PetDT,
		waist = "Moonbow Belt +1",
		legs = "Mpaca's Hose",
		feet = "Mpaca's Boots"
	}

		--Dat Waifu--
	sets.Idle.Town = set_combine(sets.Idle.Standard, {
		ring1 = "Matrimony ring",
	})

-------TP Sets-------------------------------------------
	
	---------------------
	--Pet TP Sets   --
	--------------------- 
	--Pet DT Values--
	---------------------
	-- Stout Servant III:  9% DT
	--Frame: 
	-----------VE/SS        : 12.5%      + 9% = 21.5% base =   +66% needed
	-----------Harle         : 6.25%      +9%  = 15.25% base = +78.5% needed
	-----------Storm        : 25% MDT +9%  = 9% PDT 34% MDT base = +87.5% needed
	
	--Armor Plate 4 + Optic Fiber 1/2 + 1 light maneuver = -30% PDT
	--Armor Plate 4 + Optic Fiber 1/2 + 1 light maneuver + 1 earth maneuver = -37.5% PDT
	--Armor Plate 2/4 + Optic Fiber 1/2 + 1 light maneuver = -45% PDT
	--Armor Plate 3/4 + Optic Fiber 1/2 + 1 light maneuver = -52.5% PDT
	--Armor Plate 2/4 + Optic Fiber 1/2 + 1 light maneuver  + 1 earth maneuver = -60% PDT
	--Armor Plate 3/4 + Optic Fiber 1/2 + 1 light maneuver  + 1 earth maneuver = -67.5% PDT
	---Capped without gear.
	
	
	
	sets.PetTP = {}
	sets.PetTP.index = { 'TurtleTankDT', 'TurtleTankHP', 'DDValorEdge', 'DDSharpshot', 'Spiritreaver', 'TankandSpank' }
	PetTP_ind = 1
	
	sets.PetTP.TurtleTankDT = {
	
		main = petweapon,
		head = "Anwig Salade", 															--10DT
		neck = "Shepherd's Chain",														--2 DT
		ear1 = "Rimeice Earring", ear2 = "Domesticator's Earring",	--4 DT
		body = "Rao Togi +1",																--4 DT
		hands = "Rao Kote +1", 															--4 DT
		ring1 = "Varar Ring +1", ring2 = "Cath Palug Ring",
		back = Visucius.PetDT,																--5 DT
		waist = "Isa Belt", 																	--3 DT
		legs = "Rao Haidate +1", 														--4 DT
		feet = "Rao Sune-Ate +1"  														--4 DT
	}																									--37 DT --Essentially Caps AP4 and OF1/2 w/ earth + light
	
	sets.PetTP.TurtleTankHP = {
	
		main = petweapon,
		head = "Rao Kabuto +1",														--4 DT
		neck = "Shulmanu Collar",
		ear1 = "Rimeice Earring", ear2 = "Domesticator's Earring",	--1 DT
		body = "Rao Togi +1",																--4 DT
		hands = "Rao Kote +1",															--4 DT
		ring1 = "Varar Ring +1", ring2 = "Cath Palug Ring",
		back = Visucius.PetDT,																--5 DT
		waist = "Isa Belt",																	--3 DT
		legs = "Rao Haidate +1",															--4 DT
		feet = "Rao Sune-Ate +1"														--4 DT
	}																									--28 DT --Would Cap AP3/4 and OF1/2 w/ only light
																										--This is just a max HP Turtle Set
	sets.PetTP.DDValorEdge = {

--		main = "Ohtas",		
		head = "Anwig Salade",
		neck = "Shulmanu Collar",
		ear1 = "Rimeice Earring", ear2 = "Enmerkar Earring",
		body = TaeonBody.Pet,
		hands = "Taeon Gloves",
		ring1 = "Varar Ring +1", ring2 = "Cath Palug Ring",
		back = Visucius.PetTP,
		waist = "Incarnation Sash",
		legs = "Taeon Tights",
		feet = TaeonBoots.Pet
	}

	sets.PetTP.DDSharpshot = {

--		main = "Ohtas",		
		head = "Anwig Salade",
		neck = "Shulmanu Collar",
		ear1 = "Rimeice Earring", ear2 = "Enmerkar Earring",
		body = TaeonBody.Pet,
		hands = "Taeon Gloves",
		ring1 = "Varar Ring +1", ring2 = "Cath Palug Ring",
		back = Visucius.PetTP,
		waist = "Isa Belt",
		legs = "Taeon Tights",
		feet = TaeonBoots.Pet
	}
	
	sets.PetTP.Spiritreaver = {

		main = petweapon,		
		head = "Mpaca's Cap",
		neck = "Adad Amulet",
		ear1 = "Burana Earring", ear2 = "Enmerkar Earring",
		body = "Mpaca's Doublet",
		hands = HerculeanGloves.PetNuke,
		ring1 = "Defending Ring", ring2 = "Cath Palug Ring",
		back = Visucius.PetNuke,
		waist = "Incarnation Sash",
		legs = "Mpaca's Hose",
		feet = "Mpaca's Boots"
	}
	
	sets.PetTP.TankandSpank = {
		head = "Heyoka Cap +1",
		neck = "Shepherd's Chain",
--		ear1 = "Mache Earring +1",
		ear1 = "Dedition Earring",
--		ear1 = "Mache Earring +1",
		ear2 = "Enmerkar Earring",
		body = "Malignance Tabard",
--		body = "Rao Togi +1",
		hands = "Mpaca's Gloves",
--		hands = "Rao Kote +1",
		ring1 = "Defending Ring",
--		ring1 = "Gere Ring",
		ring2 = "Niqmaddu Ring",
--		back = Visucius.PetTP,
		back = Visucius.PetDT,
		waist = "Moonbow Belt +1",
		legs = "Heyoka Subligar +1",
		feet = "Mpaca's Boots"
	}
	
	---------------------
	--Master TP Sets--
	--------------------- 
	
	sets.MasterTP = {}
	sets.MasterTP.index = { 'CapHaste', 'AccuracyLite', 'AccuracyMid', 'AccuracyFull' }
	MasterTP_ind = 1

	sets.MasterTP.CapHaste = {
		head = "Mpaca's Cap",
		neck = "Shulmanu Collar",
		ear1 = "Schere Earring",
		ear2 = "Mache Earring +1",
	--	ear2 = "Telos Earring",
		body = "Mpaca's Doublet",
	--	hands = HerculeanGloves.QA,
		hands = "Mpaca's Gloves",
		ring1 = "Gere Ring",
		ring2 = "Niqmaddu Ring",
		back = Visucius.STRDA,
		waist = "Moonbow Belt +1",
		legs = "Samnuha Tights",
	--	feet = HerculeanFeet.QA
		feet = "Mpaca's Boots"
	}

	sets.MasterTP.AccuracyLite = {
		head = "Mpaca's Cap",
		neck = "Shulmanu Collar",
		ear1 = "Cessance Earring",
	--	ear2 = "Mache Earring +1",
		ear2 = "Telos Earring",
		body = "Mpaca's Doublet",
	--	hands = HerculeanGloves.QA,
		hands = "Mpaca's Gloves",
		ring1 = "Gere Ring",
		ring2 = "Niqmaddu Ring",
		back = Visucius.STRDA,
		waist = "Moonbow Belt +1",
		legs = "Samnuha Tights",
	--	feet = HerculeanFeet.QA
		feet = "Mpaca's Boots"
	}

	sets.MasterTP.AccuracyMid = {
		head = "Mpaca's Cap",
		neck = "Shulmanu Collar",
		ear1 = "Cessance Earring",
	--	ear2 = "Mache Earring +1",
		ear2 = "Telos Earring",
		body = "Mpaca's Doublet",
	--	hands = HerculeanGloves.QA,
		hands = "Mpaca's Gloves",
		ring1 = "Gere Ring",
		ring2 = "Niqmaddu Ring",
		back = Visucius.STRDA,
		waist = "Moonbow Belt +1",
		legs = "Samnuha Tights",
	--	feet = HerculeanFeet.QA
		feet = "Mpaca's Boots"
	}

	sets.MasterTP.AccuracyFull = {
		head = "Mpaca's Cap",
		neck = "Shulmanu Collar",
		ear1 = "Cessance Earring",
	--	ear2 = "Mache Earring +1",
		ear2 = "Telos Earring",
		body = "Mpaca's Doublet",
	--	hands = HerculeanGloves.QA,
		hands = "Mpaca's Gloves",
		ring1 = "Gere Ring",
		ring2 = "Niqmaddu Ring",
		back = Visucius.STRDA,
		waist = "Moonbow Belt +1",
		legs = "Samnuha Tights",
	--	feet = HerculeanFeet.QA
		feet = "Mpaca's Boots"
	}

	-------------------
	--Kenkonken AM3 TP Sets--
	------------------- 
	
	sets.KenkonkenAM3 = {}
	sets.KenkonkenAM3.index = { 'CapHaste', 'AccuracyLite', 'AccuracyMid', 'AccuracyFull' }
	KenkonkenAM3_ind = 1 -- In the same rule as the H2H TP Toggle so it toggles it at the same time

	sets.KenkonkenAM3.CapHaste = set_combine(sets.MasterTP.CapHaste, {
		head = "Malignance Chapeau",
		neck = "Combatant's Torque",
		ear1 = "Dedition Earring",
		ear2 = "Telos Earring",
		body = "Malignance Tabard",
		hands = "Malignance Gloves",
		back = Visucius.STP,
		legs = "Malignance Tights"
	})

	sets.KenkonkenAM3.AccuracyLite = set_combine(sets.MasterTP.AccuracyLite, {		
		head = "Malignance Chapeau",
		neck = "Combatant's Torque",
		body = "Malignance Tabard",
		hands = "Malignance Gloves",
		back = Visucius.STP,
		legs = "Malignance Tights"
	})

	sets.KenkonkenAM3.AccuracyMid = set_combine(sets.MasterTP.AccuracyMid, {		
		neck = "Combatant's Torque",
		body = "Malignance Tabard",
		hands = "Malignance Gloves",		
		back = Visucius.STP,		
		legs = "Malignance Tights"
	})

	sets.KenkonkenAM3.AccuracyFull = set_combine(sets.MasterTP.AccuracyFull, {		
		neck = "Combatant's Torque",
		body = "Malignance Tabard",
		hands = "Malignance Gloves",		
		back = Visucius.STP,		
		legs = "Malignance Tights"
	})
	
	
	-----------------------------
	-- Pet Hybrid TP Sets -- --add hybrid AM3
	----------------------------- 
	
	sets.PetHybridTP = {}
	sets.PetHybridTP.index = { 'CapHaste', 'AccuracyLite', 'AccuracyMid', 'AccuracyFull' }
	PetHybridTP_ind = 1

	sets.PetHybridTP.CapHaste = {
		head = "Heyoka Cap +1",
		neck = "Shulmanu Collar",
		ear1 = "Schere Earring",
	--	ear2 = "Mache Earring +1",
		ear2 = "Brutal Earring",
		body = "Mpaca's Doublet",
		hands = "Mpaca's Gloves",
		ring1 = "Gere Ring",
		ring2 = "Niqmaddu Ring",
		back = Visucius.PetTP,
		waist = "Moonbow Belt +1",
		legs = "Heyoka Subligar +1",
		feet = "Mpaca's Boots"
	}

	sets.PetHybridTP.AccuracyLite = {
		head = "Heyoka Cap +1",
		neck = "Shulmanu Collar",
		ear1 = "Schere Earring",
	--	ear2 = "Mache Earring +1",
		ear2 = "Telos Earring",
		body = "Mpaca's Doublet",
		hands = "Mpaca's Gloves",
		ring1 = "Gere Ring",
		ring2 = "Niqmaddu Ring",
		back = Visucius.PetTP,
		waist = "Moonbow Belt +1",
		legs = "Heyoka Subligar +1",
		feet = "Mpaca's Boots"
	}

	sets.PetHybridTP.AccuracyMid = {
		head = "Heyoka Cap +1",
		neck = "Shulmanu Collar",
		ear1 = "Schere Earring",
	--	ear2 = "Mache Earring +1",
		ear2 = "Telos Earring",
		body = "Mpaca's Doublet",
		hands = "Mpaca's Gloves",
		ring1 = "Gere Ring",
		ring2 = "Niqmaddu Ring",
		back = Visucius.PetTP,
		waist = "Moonbow Belt +1",
		legs = "Heyoka Subligar +1",
		feet = "Mpaca's Boots"
	}

	sets.PetHybridTP.AccuracyFull = {
		head = "Heyoka Cap +1",
		neck = "Shulmanu Collar",
		ear1 = "Schere Earring",
	--	ear2 = "Mache Earring +1",
		ear2 = "Telos Earring",
		body = "Mpaca's Doublet",
		hands = "Mpaca's Gloves",
		ring1 = "Gere Ring",
		ring2 = "Niqmaddu Ring",
		back = Visucius.PetTP,
		waist = "Moonbow Belt +1",
		legs = "Heyoka Subligar +1",
		feet = "Mpaca's Boots"
	}
	
	
	--------------------------------------------------
	-- Kenkonken Pet Hybrid AM3 TP Sets --
	--------------------------------------------------
	
	sets.KenkonkenPetHybridAM3 = {}
	sets.KenkonkenPetHybridAM3.index = { 'CapHaste', 'AccuracyLite', 'AccuracyMid', 'AccuracyFull' }
	KenkonkenPetHybridAM3_ind = 1 -- In the same rule as the H2H TP Toggle so it toggles it at the same time

	sets.KenkonkenPetHybridAM3.CapHaste = set_combine(sets.PetHybridTP.CapHaste, {
		neck = "Combatant's Torque",
--		neck = "Bathy Choker +1",
		ear1 = "Dedition Earring",
		ear2 = "Crepuscular Earring",
	})

	sets.KenkonkenPetHybridAM3.AccuracyLite = set_combine(sets.PetHybridTP.AccuracyLite, {		
		neck = "Combatant's Torque",
		ear1 = "Dedition Earring",
		ear2 = "Crepuscular Earring",
	})

	sets.KenkonkenPetHybridAM3.AccuracyMid = set_combine(sets.PetHybridTP.AccuracyMid, {		
		neck = "Combatant's Torque",
		ear1 = "Telos Earring",
		ear2 = "Crepuscular Earring",
	})

	sets.KenkonkenPetHybridAM3.AccuracyFull = set_combine(sets.PetHybridTP.AccuracyFull, {		
		neck = "Combatant's Torque",
		ear1 = "Telos Earring",
		ear2 = "Crepuscular Earring",
	})
	
	-------------------
	-- DT TP Sets --
	------------------- 
	
	sets.DT = {}
	sets.DT.index = { 'DT', 'Hybrid', 'MDT', 'Counter', 'DTSB', 'MasterPetDT'}
	DT_ind = 1
	
	sets.DT.DT = {	
		head = "Malignance Chapeau",
		neck = "Warder's Charm +1",
		ear1 = "Schere Earring",
		ear2 = "Mache Earring +1",
--		body = "Malignance Tabard",
		body = "Mpaca's Doublet",
		hands = "Malignance Gloves",
--		ring1 = "Gere Ring",
		ring1 = "Chirich Ring +1",
		ring2 = "Niqmaddu Ring",
		back = Visucius.STRDA,
		waist = "Engraved Belt",
		legs = "Mpaca's Hose",
--		feet = "Mpaca's Boots"
		feet = "Malignance Boots"
	}

	sets.DT.Hybrid = {
	
	}

	sets.DT.MDT = {
		
	
	}

	sets.DT.Counter = {
		head = "Mpaca's Cap",
		neck = "Bathy Choker +1",
		ear1 = "Mache Earring +1",
		ear2 = "Mache Earring +1",
		body = "Mpaca's Doublet",
		hands = "Mpaca's Gloves",
		ring1 = "Gere Ring",
		ring2 = "Niqmaddu Ring",
		back = Visucius.STRDA,
		waist = "Moonbow Belt +1",
		legs = "Mpaca's Hose",
		feet = "Mpaca's Boots"
	
	}
	
	sets.DT.DTSB = {	
		head = "Nyame Helm",
		neck = "Warder's Charm +1",
		ear1 = "Schere Earring",
		ear2 = "Mache Earring +1",
--		body = "Malignance Tabard",
		body = "Mpaca's Doublet",
		hands = "Malignance Gloves",
--		ring1 = "Gere Ring",
		ring1 = "Chirich Ring +1",
		ring2 = "Niqmaddu Ring",
		back = Visucius.STRDA,
		waist = "Moonbow Belt +1",
		legs = "Mpaca's Hose",
--		feet = "Mpaca's Boots"
		feet = "Malignance Boots"
	}
	
	sets.DT.MasterPetDT = {	
		head = "Malignance Chapeau",
		neck = "Warder's Charm +1",
		ear1 = "Eabani Earring",
		ear2 = "Rimeice Earring",
		body = "Malignance Tabard",
		hands = "Malignance Gloves",
		ring1 = "Defending ring",
		ring2 = "Gelatinous Ring +1",
		back = Visucius.PetDT,
		waist = "Isa Belt",
		legs = "Malignance Tights",
		feet = "Mpaca's Boots"
	}
------End of TP--------------------------------------------------------------------------------------------------------------------	
	--WS Sets--
	sets.WS = {}

	sets.StringingPummel = {}

	sets.StringingPummel.index = { 'AttackUncap', 'AttackCap', 'Accuracy' }
	StringingPummel_ind = 1

	sets.StringingPummel.AttackUncap = {
		
		head = "Mpaca's Cap",
		neck = "Fotia Gorget",
		ear1="Schere Earring",
		ear2="Moonshade earring",
		body = "Mpaca's Doublet",
		hands = "Ryuo Tekko +1",
		ring1 = "Gere Ring",
		ring2 = "Niqmaddu Ring",
		back = Visucius.STRCrit,
		waist = "Fotia Belt",
		legs = "Mpaca's Hose",
		feet = "Mpaca's Boots"
	}

	sets.StringingPummel.AttackCap = {
		
		head = "Mpaca's Cap",
		neck = "Fotia Gorget",
		ear1="Schere Earring",
		ear2="Moonshade earring",
		body = "Mpaca's Doublet",
		hands = "Ryuo Tekko +1",
		ring1 = "Regal Ring",
		ring2 = "Niqmaddu Ring",
		back = Visucius.STRCrit,
		waist = "Fotia Belt",
		legs = "Samnuha Tights",
		feet = "Mpaca's Boots"
	}
	
	sets.StringingPummel.Accuracy = {
		
		head = "Mpaca's Cap",
		neck = "Fotia Gorget",
		ear1="Schere Earring",
		ear2="Moonshade earring",
		body = "Mpaca's Doublet",
		hands = "Ryuo Tekko +1",
		ring1 = "Regal Ring",
		ring2 = "Niqmaddu Ring",
		back = Visucius.STRCrit,
		waist = "Fotia Belt",
		legs = "Meghanada Chausses +2",
		feet = "Mpaca's Boots"
	}
	
	sets.HowlingFist = {}

	sets.HowlingFist.index = { 'AttackUncap', 'AttackCap', 'Accuracy' }
	HowlingFist_ind = 1

	sets.HowlingFist.AttackUncap = {
		
		head="Mpaca's Cap",
		neck="Fotia Gorget",
		ear1="Schere Earring",
		ear2="Moonshade earring",
		body="Mpaca's Doublet",
		hands="Mpaca's Gloves",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Visucius.DA,
		waist="Moonbow Belt +1",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots"
	}
					
	sets.HowlingFist.AttackCap = {
	
		head="Mpaca's Cap",
		neck="Fotia Gorget",
		ear1="Schere Earring",
		ear2="Moonshade earring",
		body="Mpaca's Doublet",
		hands="Mpaca's Gloves",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Visucius.DA,
		waist="Moonbow Belt +1",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots"
	}						   
							   
	sets.HowlingFist.Accuracy = {
		
		head="Mpaca's Cap",
		neck="Fotia Gorget",
		ear1="Schere Earring",
		ear2="Moonshade earring",
		body="Mpaca's Doublet",
		hands="Mpaca's Gloves",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Visucius.DA,
		waist="Moonbow Belt +1",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots"
	}

	--SC DMG Set--
	sets.SCDmg = {
		head = "Nyame Helm",			-- 5
		body = "Nyame Mail",				-- 7
		hands = "Nyame Gauntlets",	-- 5
		back = "Sacro Mantle",			-- 8
		legs = "Nyame Flanchard",		-- 6
		feet = "Nyame Sollerets"			-- 5
	}													--36   +8% if sub DNC
	
	sets.SCDmgAllies = { --assumed at +20%
		head = "Nyame Helm",			-- 5
		body = "Nyame Mail",				-- 7
		hands = "Nyame Gauntlets",	-- 5
		back = "Sacro Mantle",			-- 8
		feet = "Nyame Sollerets"			-- 5
	}													--30 +20 = 50

------End of WS------------------------------------------------------------------------------------------

	--Curing Sets--
	sets.Cures = {
		
		head = "",
		neck = "",
		ear1 = "Mendicant's Earring",
		ear2 = "Magnetic Earring",
		body = "Vrikodara Jupon",
		hands = "",
		ring1 = "Stikini Ring +1",
		ring2 = "Rufescent Ring",
		back = "",
		waist = "Luminary Sash",
		legs = "",
		feet = "Skaoi Boots"
	}
	
	sets.Cures.SelfCures = set_combine(sets.Cures, {
		ring1 = "Kunaji Ring",
		waist = "Gishdubar Sash",
	})

------End of Magic-------------------------------------------------------------------------------------
	--Enmity Set--
	
	sets.Enmity = {
		head = "Halitus Helm",
		neck = "Moonlight Necklace",
		ear1 = "Friomisi Earring",
		ear2 = "Cryptic Earring",
		body = "Emet Harness +1",
		hands = "Kurys Gloves",
		ring1 = "Supershear Ring",
		ring2 = "Eihwaz Ring",
		back = Visucius.STRDA,
		waist = "Kasiri Belt",
		legs = "Malignance Tights",
		feet = "Ahosi Leggings"
	}
	
	--Utility Sets--
	
	sets.Utility = {}

    sets.Utility.TH = {
		head = "Volte Cap",
        waist = "Chaac Belt",
		legs = HerculeanLegs.TH,
        feet = HerculeanFeet.TH
    }
	
	sets.Utility.Derp = {
		head = "Malignance Chapeau",
		neck = "Warder's Charm +1",
		ear1 = "Genmei Earring",
		ear2 = "Eabani Earring",
		body = "Malignance Tabard",
		hands = "Malignance Gloves",
		ring1 = "Defending ring",
		ring2 = "Gelatinous Ring +1",
		back = Visucius.STRDA,
		waist = "Engraved Belt",
		legs = "Malignance Tights",
		feet = "Erilaz Greaves +1"
	}
	
	sets.Utility.MDTTank =  {
		head = "Erilaz Galea +1",
		neck = "Warder's Charm +1",
		ear2 = "Etiolation Earring",
		ear2 = "Odnowa Earring +1",
		body = "Runeist's Coat +3",
		hands = HerculeanGloves.DT,
		ring1 = "Defending ring",
		ring2 = "Shadow Ring",
		back = Visucius.STRDA,
		waist = "Engraved Belt",
		legs = "Malignance Tights",
		feet = "Erilaz Greaves +1"
	}

	sets.Utility.DDandPetTank = { --something random for fighting up close to a magical AoE foe while your pet tries to hold its attention
	
		main = "Gnafron's Adragas",
		head = "Malignance Chapeau",
		neck = "Warder's Charm +1",
		ear1 = "Rimeice Earring",
		ear2 = "Enmerkar Earring",
		body = "Malignance Tabard",
		hands = "Malignance Gloves",
		ring1 = "Defending ring",
		ring2 = "Gelatinous Ring +1",
		back = Visucius.PetDT,
		waist = "Isa Belt",
		legs = "Malignance Tights",
		feet = "Mpaca's Boots"
	
	}
	
    --Shell V on. Need 21% MDT, 19% with sheltered.
	sets.Utility.MDTV = {
	}

	--Shell II only--
	sets.Utility.MDTII = {
	}

	--No Shell--
	sets.Utility.MDTNO = {
	}

	---------------------------------------------------------------
	--Enhancing Sets--
	---Update this stuff one day---
	
	sets.Enhancing = {}
	
	sets.Enhancing.Skill = {
		head = "Carmine Mask +1",
		neck = "Incanter's Torque",
		ear1 = "Andoaa Earring",
		ear2 = "Loquacious Earring",
		body = "Manasa Chasuble",
		hands = "Runeist's Mitons +3",
		ring1 = "Defending Ring",
		ring2 = "Stikini Ring +1",
		back = "Moonlight Cape",
		waist = "Flume Belt",
		legs = "Carmine Cuisses +1",
		feet = "Erilaz Greaves +1"
	}
	
	sets.Enhancing.Duration = {	
		head = "Erilaz Galea +1",
		neck = "Incanter's Torque",
		ear1 = "Andoaa Earring",
		ear2 = "Loquacious Earring",
		body = "Futhark Coat +3",
		hands = "Runeist's Mitons +3",
		ring1 = "Defending Ring",
		ring2 = "Stikini Ring +1",
		back = "Moonlight Cape",
		waist = "Flume Belt",
		legs = "Futhark Trousers +2",
		feet = "Erilaz Greaves +1"
	}
	
	sets.Enhancing.Phalanx = set_combine(sets.Enhancing.Duration, {
		head = "Futhark Bandeau +2",
		body = HerculeanVest.Phalanx,
		hands = HerculeanGloves.Phalanx,
		feet = HerculeanFeet.Phalanx
	})
	
	sets.Enhancing.Refresh = set_combine(sets.Enhancing.Duration, {
		waist = "Gishdubar Sash",
	})
	
	sets.Enhancing.ProShell = set_combine(sets.Enhancing.Duration, {
		ear1 = "Brachyura Earring",
	})
	
	--Job Ability Sets--

	sets.JA = {}
	
	sets.JA.Lunge = {
		head = HerculeanHelm.Nuke,
		neck = "Baetyl Pendant",
		ear1 = "Friomisi Earring",
		ear2 = "Hermetic Earring",
		body = "Samnuha Coat",
		hands = "Leyline Gloves",
		ring1 = "Shiva Ring +1",
		ring2 = "Shiva Ring +1",
		back = "Evasionist's Cape",
		waist = "Eschan Stone",
		legs = HerculeanLegs.Magic,
		feet = "Adhemar Gamashes +1"
	}
	
	--Precast Sets--
	sets.precast = {}

	sets.precast.FC = {
		head = "Herculean Helm",
		neck = "Baetyl Pendant",
		ear2 = "Etiolation Earring",
		ear1 = "Loquac. Earring",
		body = "Taeon Tabard",
		hands = "Nyame Gauntlets",
		ring1 = "Prolix Ring",
		ring2 = "Rahab Ring",
		back = "Fi Follet Cape +1",
		waist = "Moonbow Belt +1",
		legs = HerculeanLegs.FC,
		feet = "Nyame Sollerets"
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

function maps()
	
	BlueMagic_Healing = S {
		'Healing Breeze', 'Pollen', 'Wild Carrot'
	}

	BlueMagic_Enmity = S {
		'Blank Gaze', 'Jettatura', 'Geist Wall', 'Sheep Song', 'Soporific', 'Cocoon', 'Stinking Gas', 'Flash', 'Stun'
	}
	
end

------------------------
--   Town Gear List   --
------------------------

Town = S {
    "Ru'Lude Gardens", "Upper Jeuno", "Lower Jeuno", "Port Jeuno",
    "Port Windurst", "Windurst Waters", "Windurst Woods", "Windurst Walls", "Heavens Tower",
    "Port San d'Oria", "Northern San d'Oria", "Southern San d'Oria", "Chateau d'Oraguille",
	"Port Bastok", "Bastok Markets", "Bastok Mines", "Metalworks", "Rabao",
    "Aht Urhgan Whitegate", "Nashmau",
    "Selbina", "Mhaura", "Norg",  "Kazham", "Tavanazian Safehold",
    "Eastern Adoulin", "Western Adoulin", "Celennia Memorial Library", "Mog Garden"
}

---End of Maps----------------------------------------------------------------------------------------------------------------------------------------------------------

function msg(str)
	send_command('@input /echo <----- ' .. str .. ' ----->')
end

------------------------------------------
-- Macro and Style Change on Job Change
------------------------------------------
function set_macros(sheet,book)
    if book then 
        send_command('@input /macro book '..tostring(book)..';wait .1;input /macro set '..tostring(sheet))
        return
    end
    send_command('@input /macro set '..tostring(sheet))
end

function set_style(sheet)
    send_command('@input ;wait 5.0;input /lockstyleset '..sheet)
	add_to_chat (21, 'Your Lockstyle looks like shit, and you should feel bad')
	add_to_chat (55, 'You are on '..('PUP '):color(5)..''..('btw. '):color(55)..''..('Macros set!'):color(121))
--	add_to_chat (60, 'Eat tendies in moderation')
end

--Page, Book--
set_macros(1,1)
--Use the Lockstyle Number-- 
set_style(88) 
------------------------------------------
-- Variables
------------------------------------------
SetLocked = false --Used to Check if set is locked before changing equipment
LockedEquipSet = {} --Placeholder to store desired lock set
LockGearSet = {}
equipSet = {} --Currently Equiped Gearset
LockGearIndex = false
TargetDistance = 0
SkillchainPending = false 
AllowSkillchainGear = false   --Whether or not hte skillchainPending system should be disabled
TH = false 
DT = false 
AutoDeploy = false
SkillchainTimer = 0
------------------------------------------
-- Windower Hooks              --
------------------------------------------

function buff_change(n, gain, buff_table)
	local name
	name = string.lower(n)
	if S{"terror","petrification","sleep","stun"}:contains(name) then
        if gain then
            ChangeGear(sets.Utility.Derp)
        elseif not has_any_buff_of({"terror","petrification","sleep","stun"}) then
            if player.status == 'Engaged' then
                if LockGearIndex then
                    ChangeGear(LockGearSet)
                elseif not LockGearIndex then
					if DT == true then
						ChangeGear(sets.DT[sets.DT.index[DT_ind]])
					elseif KenkonkenAM3 == true then
						ChangeGear(sets.KenkonkenAM3[sets.KenkonkenAM3.index[KenkonkenAM3_ind]])
					elseif MasterTP == true then
						ChangeGear(sets.MasterTP[sets.MasterTP.index[MasterTP_ind]])
					else
						ChangeGear(sets.PetTP[sets.PetTP.index[PetTP_ind]])
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
					elseif KenkonkenAM3 == true then
						ChangeGear(sets.KenkonkenAM3[sets.KenkonkenAM3.index[KenkonkenAM3_ind]])
					elseif MasterTP == true then
						ChangeGear(sets.MasterTP[sets.MasterTP.index[MasterTP_ind]])
					else
						ChangeGear(sets.PetTP[sets.PetTP.index[PetTP_ind]])
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
	end
	
	if name == "aftermath: lv.3" and player.equipment.main == 'Kenkonken' then -- Mythic AM3
		if gain then
			KenkonkenAM3 = true
			send_command('timers create "Mythic AM3" 180 down')
			 if LockGearIndex then
			    ChangeGear(LockGearSet)
			elseif DT == true then
				ChangeGear(sets.DT[sets.DT.index[DT_ind]])
			elseif TPMode_ind == 1 then
				ChangeGear(sets.KenkonkenAM3[sets.KenkonkenAM3.index[KenkonkenAM3_ind]])
			elseif TPMode_ind == 2 then
				ChangeGear(sets.KenkonkenPetHybridAM3[sets.KenkonkenPetHybridAM3.index[KenkonkenPetHybridAM3_ind]])
			elseif TPMode_ind == 3 then
				KenkonkenAM3 = false
			end 
		else
			KenkonkenAM3 = false
			send_command('timers delete "Mythic AM3";gs c -cd AM3 Lost!!!')
		end
	end
end

------------------------------------------
--               Binds                  --
------------------------------------------
-------------------
--F9,10,11,12--
-------------------
send_command('bind f9 gs c toggle TP set') --This means if you hit f9 it toggles the sets
send_command('bind f10 gs c toggle WS set') 
send_command('bind f11 gs c toggle Auto Deploy') --You will deploy your pet if its not already engaged and you become engaged.
send_command('bind f12 gs c toggle Idle set') --Pet TP sets bypass idle sets.
----------------
--Cntrl Key--
----------------
send_command('bind ^f8 gs c toggle TP Mode') -- Toggles Master TP, Hybrid TP, Pet TP
send_command('bind ^f9 input /ws "Stringing Pummel" <t>') 
send_command('bind ^f10 input /ws "Howling Fist" <t>')
send_command('bind ^f11 input /ws "Victory Smite" <t>')
send_command('bind ^f12 input /ws "Raging Fists" <t>')
-------------
--Alt Key--
-------------
send_command('bind !f7 gs c toggle DT set') --! means alt, this exists only for toggling outside of this mode being active, otherwise f9
send_command('bind !f8 gs c toggle DT') --! turns tanking tp off
send_command('bind !f9 gs c toggle backwards')
send_command('bind !f10 gs c AllowSkillchainGear')
send_command('bind !f11 ') --Empty
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
	send_command('unbind ^f9')
	send_command('unbind ^f10')
	send_command('unbind ^f11')
	send_command('unbind ^f12')
	send_command('unbind @f9')
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
	send_command('unbind !q')
	send_command('unbind !t')
end

------------------------------------------
-- Console Commands             --
------------------------------------------
function self_command(command)
	if command == 'togglelock' then
		if SetLocked == false then
			msg("Equipment Set LOCKED!")
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
			msg("Gear Index Locked")
		else
			LockGearIndex = false
			msg("Gear Index Unlocked")
			if player.status == 'Engaged' then
				if DT == true then
					ChangeGear(sets.DT[sets.DT.index[DT_ind]])
				elseif KenkonkenAM3 == true then
						ChangeGear(sets.KenkonkenAM3[sets.KenkonkenAM3.index[KenkonkenAM3_ind]])
				elseif TPMode_ind == 1 then
					ChangeGear(sets.MasterTP[sets.MasterTP.index[MasterTP_ind]])
				elseif TPMode_ind == 2 then
					ChangeGear(sets.PetHybridTP[sets.PetHybridTP.index[PetHybridTP_ind]])
				else
					ChangeGear(sets.PetTP[sets.PetTP.index[PetTP_ind]])
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
			if player.status == 'Engaged' then
				ChangeGear(sets.DT[sets.DT.index[DT_ind]])
			end
		elseif DT == false then 
			if TPMode_ind == 1 then
				MasterTP_ind = MasterTP_ind + 1
				KenkonkenAM3_ind = KenkonkenAM3_ind +1
				if MasterTP_ind > #sets.MasterTP.index then MasterTP_ind = 1 end
				if KenkonkenAM3_ind > #sets.KenkonkenAM3.index then KenkonkenAM3_ind = 1 end
					send_command('@input /echo <----- Master TP Set changed to ' .. sets.MasterTP.index[MasterTP_ind] .. ' ----->')	
				if player.status == 'Engaged' then
					if KenkonkenAM3 == true then
						ChangeGear(sets.KenkonkenAM3[sets.KenkonkenAM3.index[KenkonkenAM3_ind]])
					else
						ChangeGear(sets.MasterTP[sets.MasterTP.index[MasterTP_ind]])
					end
				end
			elseif TPMode_ind == 2 then
				PetHybridTP_ind = PetHybridTP_ind + 1
				KenkonkenPetHybridAM3_ind = KenkonkenPetHybridAM3_ind +1
				if PetHybridTP_ind > #sets.PetHybridTP.index then PetHybridTP_ind = 1 end
				if KenkonkenPetHybridAM3_ind > #sets.KenkonkenPetHybridAM3.index then KenkonkenPetHybridAM3_ind = 1 end
					send_command('@input /echo <----- Pet Hybrid TP Set changed to ' .. sets.PetHybridTP.index[PetHybridTP_ind] .. ' ----->')	
				if player.status == 'Engaged' then
					if KenkonkenAM3 == true then
						ChangeGear(sets.KenkonkenPetHybridAM3[sets.KenkonkenPetHybridAM3.index[KenkonkenPetHybridAM3_ind]])
					else
						ChangeGear(sets.PetHybridTP[sets.PetHybridTP.index[PetHybridTP_ind]])
					end
				end
			elseif TPMode_ind == 3 then
				PetTP_ind = PetTP_ind + 1
				if PetTP_ind > #sets.PetTP.index then PetTP_ind = 1 end
				send_command('@input /echo <----- Pet TP Set changed to ' .. sets.PetTP.index[PetTP_ind] .. ' ----->')
				ChangeGear(sets.PetTP[sets.PetTP.index[PetTP_ind]])
			end
		end
	elseif command == 'toggle TP Mode' then
		TPMode_ind = TPMode_ind + 1
		if TPMode_ind > #TPMode.index then TPMode_ind = 1 end
		send_command('@input /echo <----- TP Mode changed to ' .. TPMode.index[TPMode_ind] .. ' ----->')
		ac_Global()
	elseif command == 'toggle Idle set' then
		Idle_ind = Idle_ind + 1
		if Idle_ind > #sets.Idle.index then Idle_ind = 1 end
		send_command('@input /echo <----- Idle Set changed to ' .. sets.Idle.index[Idle_ind] .. ' ----->')
		ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
	elseif command == 'toggle WS set' then
		StringingPummel_ind = StringingPummel_ind + 1
		HowlingFist_ind = HowlingFist_ind + 1
		if StringingPummel_ind > #sets.StringingPummel.index then StringingPummel_ind = 1 end
		if HowlingFist_ind > #sets.HowlingFist.index then HowlingFist_ind = 1 end
		send_command('@input /echo <----- WS Sets changed to ' .. sets.StringingPummel.index[StringingPummel_ind] .. ' ----->')
	elseif command == 'toggle DT set' then
		DT_ind = DT_ind + 1
		if DT_ind > #sets.DT.index then DT_ind = 1 end
		send_command('@input /echo <----- DT Set changed to ' .. sets.DT.index[DT_ind] .. ' ----->')
		if player.status == 'Engaged' then
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
	elseif command == 'toggle Auto Deploy' then
		if AutoDeploy == true then
			AutoDeploy = false
			send_command('@input /echo <----- Auto Derp-ploy: [Off] ----->')
        else
			AutoDeploy = true
			send_command('@input /echo <----- Auto Deploy: [On] ----->')
		end
		status_change(player.status)
	elseif command == 'toggle backwards' then
		if DT == true then
			DT_ind = DT_ind -1
			if DT_ind == 0 then
				DT_ind = #sets.DT.index
			end
			send_command('@input /echo <----- DT Set changed to ' .. sets.DT.index[DT_ind] .. ' ----->')
			if player.status == 'Engaged' then
				ChangeGear(sets.DT[sets.DT.index[DT_ind]])
			end
		elseif DT == false then
			if TPMode_ind == 1 then
				MasterTP_ind = MasterTP_ind -1
				KenkonkenAM3_ind = KenkonkenAM3_ind -1
				if MasterTP_ind == 0 then MasterTP_ind = #sets.MasterTP.index end
				if KenkonkenAM3_ind == 0 then KenkonkenAM3_ind = #sets.KenkonkenAM3.index end
				send_command('@input /echo <----- H2H TP Set changed to ' .. sets.MasterTP.index[MasterTP_ind] .. ' ----->')	
				if player.status == 'Engaged' then
					if KenkonkenAM3 == true then
						ChangeGear(sets.KenkonkenAM3[sets.KenkonkenAM3.index[KenkonkenAM3_ind]])
					else
						ChangeGear(sets.MasterTP[sets.MasterTP.index[MasterTP_ind]])
					end
				end
			elseif TPMode_ind == 2 then
				PetHybridTP_ind = PetHybridTP_ind -1
				KenkonkenPetHybridAM3_ind = KenkonkenPetHybridAM3_ind -1
				if PetHybridTP_ind == 0 then PetHybridTP_ind = #sets.PetHybridTP.index end
				if KenkonkenPetHybridAM3_ind == 0 then KenkonkenPetHybridAM3_ind = #sets.KenkonkenPetHybridAM3.index end
				send_command('@input /echo <----- Pet Hybrid TP Set changed to ' .. sets.PetHybridTP.index[PetHybridTP_ind] .. ' ----->')	
				if player.status == 'Engaged' then
					if KenkonkenAM3 == true then
						ChangeGear(sets.KenkonkenPetHybridAM3[sets.KenkonkenPetHybridAM3.index[KenkonkenPetHybridAM3_ind]])
					else
						ChangeGear(sets.PetHybridTP[sets.PetHybridTP.index[PetHybridTP_ind]])
					end
				end
			elseif TPMode_ind == 3 then
				PetTP_ind = PetTP_ind -1
				if PetTP_ind == 0 then PetTP_ind = #sets.PetTP.index end
				send_command('@input /echo <----- Pet TP Set changed to ' .. sets.PetTP.index[PetTP_ind] .. ' ----->')
				ChangeGear(sets.PetTP[sets.PetTP.index[TP_ind]])
				ac_Global()				
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

------------------------------------------
-- Character States                     --
------------------------------------------
function IdleState()
    if LockGearIndex then
		ChangeGear(LockGearSet)
	elseif not LockGearIndex then
		if pet.isvalid and TPMode_ind == 3 and pet.status == 'Engaged' then
			ChangeGear(sets.PetTP[sets.PetTP.index[PetTP_ind]])
		else
			ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
		end
	end
	
    --if player.mpp <= 50 and Idle_ind == 2 then --standard idle
       -- ChangeGear({head = HerculeanHelm.Refresh, waist = "Fucho-no-obi"})
	--elseif player.mpp <= 50 and Idle_ind == 3 then -- buff duration
	--	ChangeGear({waist = "Fucho-no-obi"})
   -- end
		
	if Town:contains(world.area) and player.mpp < 75 then
        ChangeGear(set_combine(sets.Idle.Town, sets.Idle.Refresh))
		elseif Town:contains(world.area) then
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
		elseif buffactive["Aftermath: Lv.3"] and player.equipment.main == 'Kenkonken' and TPMode_ind ~= 3 then --am3
			KenkonkenAM3 = true
			if TPMode_ind == 1 then
				ChangeGear(sets.KenkonkenAM3[sets.KenkonkenAM3.index[KenkonkenAM3_ind]])	
			elseif TPMode_ind == 2 then
				ChangeGear(sets.KenkonkenPetHybridAM3[sets.KenkonkenPetHybridAM3.index[KenkonkenPetHybridAM3_ind]])
			end
		elseif TPMode_ind == 1 then
			KenkonkenAM3 = false
			ChangeGear(sets.MasterTP[sets.MasterTP.index[MasterTP_ind]])
		elseif TPMode_ind == 2 then
			KenkonkenAM3 = false
			ChangeGear(sets.PetHybridTP[sets.PetHybridTP.index[PetHybridTP_ind]])
		elseif TPMode_ind == 3 then
			KenkonkenAM3 = false
			ChangeGear(sets.PetTP[sets.PetTP.index[PetTP_ind]])
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
	elseif spell.action_type == 'Ability' and spell.type ~= 'WeaponSkill' and spell.type ~= 'Scholar' and (has_any_buff_of(unusable_buff.ability) or not check_recast('ability',spell.recast_id)) then
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
	elseif spell.mp_cost and spell.mp_cost > player.mp and not has_any_buff_of({'Manawell','Manafont'}) and not spell.action_type == 'Ability' then
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
	if spell.name == 'Utsusemi: Ichi' and overwrite and buffactive['Copy Image (3)'] then
		return true
	end
	if player.tp >= 1000 and player.target and player.target.distance and player.target.distance > 7 and spell.type == 'WeaponSkill' then
		msg("Weapon Skill Canceled  Target Out of Range")
		return true
	end
end

------------------------------------------
--              Precast                 --
------------------------------------------
function has_any_buff_of(buff_set)--returns true if you have any of the buffs given
    for i,v in pairs(buff_set) do
        if buffactive[v] ~= nil then return true end
    end
end
--JA Sets--
function pc_JA(spell, act)
	if spell.english == 'Overdrive' then
		ChangeGear({body="Pitre Tobe"})
	elseif spell.english == 'Repair' then
		ChangeGear({
			head="Rao Kabuto +1",
			body="Rao Togi +1",
			hands=HerculeanGloves.Refresh,
			ear1="Pratik Earring",
			ear2="Guignol Earring",
			hands = "Rao Kote +1",
			legs = "Rao Haidate +1",
			feet = "Rao Sune-Ate +1"})
	elseif spell.english == 'Ventriloquy' then
		ChangeGear(set_combine(sets.DT.DT, {legs="Pitre Churidars"}))
	elseif spell.english == 'Vallation' then
		ChangeGear(set_combine(sets.Enmity, {}))
	elseif spell.english == 'Pflug' then
		ChangeGear(set_combine(sets.Enmity, {}))
	elseif spell.english == 'Lunge' or spell.english == 'Swipe' then
		ChangeGear(sets.JA.Lunge)
	elseif spell.english == 'Meditate' then
		ChangeGear(set_combine(sets.Enmity, {}))
	elseif spell.english == 'Provoke' or spell.english == 'Warcry' then
		ChangeGear(set_combine(sets.Enmity, {}))
	end
	
	if string.find(spell.english,'Maneuver') and DT == false then
		if TPMode_ind == 3 and DT then
			ChangeGear({ main = "Kenkonkenn", body = "Karagoz Farsetto", ear1="Burana Earring", hands="Foire Dastanas +3" })
		else
			ChangeGear({ body = "Karagoz Farsetto", ear1="Burana Earring", hands="Foire Dastanas +3" })
		end
	end

	IgnoreWS = S { "Sanguine Blade", "Red Lotus Blade", "Flash Nova", "Realmrazer" }  -- Excluded from Moonshade TP override rule.
	BrutalWS = S { "Stringing Pummel"}
	STRWS = S {"Vorpal Blade", "Fell Cleave", "Circle Blade", "Swift Blade", "Shockwave" } -- Just uses the Stringing Pummel Set
	
	
	if spell.type == 'WeaponSkill' then
		if spell.english == 'Requiescat' then
			ChangeGear(sets.Requiescat[sets.Requiescat.index[Requiescat_ind]])
		elseif spell.english == 'Howling Fist' or spell.english == 'Raging Fists' then
			ChangeGear(sets.HowlingFist[sets.HowlingFist.index[HowlingFist_ind]])
		elseif spell.english == 'Stringing Pummel' or spell.english == 'Victory Smite' then
			ChangeGear(sets.StringingPummel[sets.StringingPummel.index[StringingPummel_ind]])
		end
		if player.tp > 2025 and player.equipment.main == 'Godhands' and buffactive['TP Bonus'] then
            if IgnoreWS:contains(spell.english) then
                return
            elseif BrutalWS:contains(spell.english) then
                equip(set_combine(equipSet, { ear1 = "Brutal Earring" })) --Watch for ear conflicts between TP sets and WS sets
                msg("Brutal Earring equiped !!!!")
            else
                equip(set_combine(equipSet, { ear1 = "Ishvara Earring" }))
                msg("Ishvara Earring equiped !!!!")
            end
        elseif player.tp > 2275 and player.equipment.main == 'Godhands' then
            if IgnoreWS:contains(spell.english) then
                return
			elseif BrutalWS:contains(spell.english) then
                equip(set_combine(equipSet, { ear1 = "Brutal Earring" })) --Watch for ear conflicts between TP sets and WS sets
                msg("Brutal Earring equiped !!!!")
            else
                equip(set_combine(equipSet, { ear1 = "Ishvara Earring" }))
                msg("Ishvara Earring equiped !!!!")
            end
        elseif player.tp > 2550 and buffactive['TP Bonus'] then
            if IgnoreWS:contains(spell.english) then
                return
            elseif BrutalWS:contains(spell.english) then
                equip(set_combine(equipSet, { ear1 = "Brutal Earring" })) --Watch for ear conflicts between TP sets and WS sets
                msg("Brutal Earring equiped !!!!")
            else
                equip(set_combine(equipSet, { ear1 = "Ishvara Earring" }))
                msg("Ishvara Earring equiped !!!!")
            end
        elseif player.tp > 2775 then
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

	if string.find(spell.english,'Step') then
		--ChangeGear(set_combine(sets.MasterTP.AccuracyFull, sets.Utility.TH))
		ChangeGear(sets.MasterTP.AccuracyFull)
	elseif spell.english == 'Animated Flourish' then
		ChangeGear(sets.Enmity)
	end
end

function pc_Magic(spell, act)
	if spell.action_type == 'Magic' then
		ChangeGear(sets.precast.FC)
	end
end

function pc_Item(spell, act)
end


------------------------------------------
-- Midcast                 --
------------------------------------------
function mc_JA(spell, act)
end

function mc_Magic(spell, act)
	if spell.skill == 'Enhancing Magic' then
		if spell.english == 'Phalanx' then
			ChangeGear(sets.Enhancing.Phalanx)
			elseif string.find(spell.english,'Shell') or string.find(spell.english,'Protect') then
				ChangeGear(sets.Enhancing.ProShell)
			else
				ChangeGear(sets.Enhancing.Duration)
			end
		elseif spell.english == 'Aquaveil' then
			ChangeGear(sets.SIR)
		elseif spell.english == 'Refresh' then
			ChangeGear(sets.Enhancing.Refresh)
		elseif string.find(spell.english,'Regen')then
			ChangeGear(sets.Enhancing.Regen)
		elseif string.find(spell.english,'Bar') then
			ChangeGear(sets.Enhancing.Skill)
		elseif spell.english == 'Phalanx' then
			ChangeGear(sets.Enhancing.Phalanx)
		elseif string.find(spell.english,'Shell') or string.find(spell.english,'Protect') then
			ChangeGear(sets.Enhancing.ProShell)
		else
			ChangeGear(sets.Enhancing.Duration)
		end
			
	if spell.skill == 'Healing Magic' then
		if spell.target and spell.target.type == 'SELF' then
			ChangeGear(sets.Cures.SelfCures)
		else
			ChangeGear(sets.Cures)
		end
	elseif spell.skill == 'Enfeebling Magic' then 
		if spell.english == 'Sleepga' or spell.english == 'Poisonga' and TH == true then --To TH tag everything
			ChangeGear(set_combine(equipSet, sets.Utility.TH))
		end
	end

	if BlueMagic_Enmity:contains(spell.english) then
		ChangeGear(sets.Enmity)
	elseif BlueMagic_Healing:contains(spell.english) then 
		if spell.target and spell.target.type == 'SELF' then
			ChangeGear(sets.Cures.SelfCures)
		else
			ChangeGear(sets.Cures)
		end
	end
	
	if buffactive['Tenebrae'] and spell.english == 'Lunge' or spell.english == 'Swipe' then
		equip(sets.JA.Lunge,{head="Pixie Hairpin +1"})
	end
	
end

function mc_Item(spell, act)
end


------------------------------------------
-- After Cast               --
------------------------------------------
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
        if pet.status == 'Engaged' then
            EngagedState()
        elseif  pet.status == 'Idle' and player.status == 'Idle' then
            IdleState()
        end
    end
end

------------------------------------------
-- Framework Core            --
------------------------------------------
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
	
	if player.status == 'Engaged' and pet.status ~= 'Engaged'  and AutoDeploy == true then 
		send_command('@wait 1.9;input /ja "Deploy" <t>')
	end
end

function precast(spell, act)
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

function aftercast(spell, act)
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
		if spell.english == "Repair" then
			send_command('wait 80;gs c -cd '..spell.name..': [Ready In 10 Seconds!];wait 10;gs c -cd '..spell.name..': [Ready !]')
		elseif spell.english == "Maintenance" then
			send_command('wait 50;gs c -cd '..spell.name..': [Ready In 10 Seconds!];wait 10;gs c -cd '..spell.name..': [Ready !]')	
		elseif spell.english == "Tactical Switch" then
			send_command('wait 170;gs c -cd '..spell.name..': [Ready In 10 Seconds!];wait 10;gs c -cd '..spell.name..': [Ready !]')
		elseif spell.english == "Ventriloquy" then
			send_command('wait 170;gs c -cd '..spell.name..': [Ready In 10 Seconds!];wait 10;gs c -cd '..spell.name..': [Ready !]')
		elseif spell.english == "Role Reversal" then
			send_command('wait 110;gs c -cd '..spell.name..': [Ready In 10 Seconds!];wait 10;gs c -cd '..spell.name..': [Ready !]')
		elseif spell.english == "Cooldown" then
			send_command('wait 290;gs c -cd '..spell.name..': [Ready In 10 Seconds!];wait 10;gs c -cd '..spell.name..': [Ready !]')
        elseif spell.type == "WeaponSkill" then
            SkillchainPending = true
            SkillchainTimer = os.time()    -- sets SkillchainTimer variable to the current time of the operating system (in seconds)
        end 
	end
	
	--Dont think ill ever need this rule in the aftercast as well, but im leaving it here for now.--
	--if not pet.isvalid and player.status == 'Engaged' then
		--TPMode_ind = 1
      --  ac_Global()
	--end
	
end

           -- elseif check_recast('ability',114) and buffactive['Overload'] then send_command('input /ja "Cooldown" <t>')

function pet_change(pet,gain)
     if not gain and player.status == Engaged then --Rule that resets your mode if you lose the puppet. 
          TPMode_ind = 1 --This will not change your index, aka the last set you were in under MasterTP.
          ac_Global()
     end
end
	
function pet_status_change(new,old)
    if new == 'Idle' then
        IdleState()
    elseif new == 'Engaged' then
        EngagedState()
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