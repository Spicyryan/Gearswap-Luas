--Built off of Spicy's BLU and RUN GS
--------------------------------------------------------------------------------------------------
--Instructions below for the prior RUN lua still function as expected for this new DRK lua (tanking TP sets have been replaced by Scythe TP sets)
--This lua starts off defaulted in tanking TP gear. Press alt + F8 or the following macro to disable tanking TP mode:
---/console gs c toggle ScytheTP
 
--Once that is taken off you will automatically be placed back in the TP set index. If you were previously in a set and put tanking gear back on it will resume the previous set in the index.
---Sets between 1H and 2H weapons are automatically activated after the tanking TP set is off, based on your equiped weapon. 2H weapons get the 2HTP sets and 1H the 1H set. Weapons cycle using win+E.
----This occasionally throws an error for the rule somewhere around line 1871 depending on what you edit, when you first load the lua. I have never bothered to address this bug as it doesnt impact anything.
 
--Pressing F9 (or a macro, similar to above for tanking) will toggle the currently active set. If tanking is on F9 will toggle tanking TP and ignore the other sets. If 1H TP is active F9 will toggle that and nothing else.
---If 2H TP is active then it will toggle that and AM for Verethragna, and vice versa.
 
--Alt + F9 will cycle backwards, F9 just cycles fowards. Useful for pressing buttons once instead of 3 times to cycle one set backwards.
 
--You may cycle tanking TP with alt + f7 regardless of which TPing mode is active. This is useful for using tanking TP sets like MDT or magic evasion as DT sets while DDing with alt + f8 to equip the tanking set back on.
 
 
--Augmented Gear--
 
function get_sets()
    maps()
   
	-- Augmented Gear
		HercHelm = {}
		HercHelm.FC = { name="Herculean Helm", augments={'"Fast Cast"+5','Mag. Acc.+11',}}
		
		HercVest = {}
		
		HercGloves = {}
		HercGloves.WSD = { name="Herculean Gloves", augments={'"Store TP"+3','DEX+13','Weapon skill damage +8%','Accuracy+15 Attack+15',}}
		HercGloves.TP = { name="Herculean Gloves", augments={'Accuracy+14 Attack+14','Pet: Accuracy+15 Pet: Rng. Acc.+15','Quadruple Attack +3','Mag. Acc.+13 "Mag.Atk.Bns."+13',}}
		HercGloves.TH = { name="Herculean Gloves", augments={'VIT+3','"Store TP"+5','"Treasure Hunter"+2','Accuracy+6 Attack+6',}}
		HercGloves.DW = { name="Herculean Gloves", augments={'"Dual Wield"+6','DEX+6',}}
		
		HercLegs = {}
		HercLegs.FC = { name="Herculean Trousers", augments={'Pet: STR+6','DEX+4','"Fast Cast"+7','Accuracy+7 Attack+7','Mag. Acc.+4 "Mag.Atk.Bns."+4',}}
		HercLegs.DW = { name="Herculean Trousers", augments={'"Dual Wield"+6','AGI+3','Attack+7',}}
		
		HercFeet = {}
		HercFeet.TP = { name="Herculean Boots", augments={'CHR+1','Accuracy+10','Quadruple Attack +3','Accuracy+8 Attack+8',}}
		HercFeet.FC = { name="Herculean Boots", augments={'Pet: Haste+1','"Dual Wield"+3','"Fast Cast"+7','Mag. Acc.+4 "Mag.Atk.Bns."+4',}}
		
		AdhemarBody = {}
		AdhemarBody.FC = { name="Adhemar Jacket +1", augments={'HP+105','"Fast Cast"+10','Magic dmg. taken -4',}}
		AdhemarBody.TP = { name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}
		
		TaeonFeet = {}
		TaeonFeet.DW = { name="Taeon Boots", augments={'Accuracy+20 Attack+20','"Dual Wield"+5','Crit. hit damage +3%',}}

		Segomo = {}
		Segomo.TP = { name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
		Segomo.WSD = { name="Segomo's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
		Segomo.Crit = { name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Crit.hit rate+10','Phys. dmg. taken-10%',}}
		Segomo.Counter = { name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','System: 1 ID: 640 Val: 4',}}
		Segomo.Util = { name="Segomo's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','"Fast Cast"+10','Phys. dmg. taken-10%',}}
		Segomo.DA = { name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
		Segomo.DW = { name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10','Phys. dmg. taken-10%',}}
	
------End of Augmented Gear-----------------------------------------------------------------------------------------------------------------------------
	--Weapon Toggle sets will got here (GSWD / DW / Single)
	sets.Weapon = {}
    sets.Weapon.index = { 'Godhands', 'Spharai' }
    Weapon_ind = 1	
	
	sets.Weapon.Godhands = {main='Godhands'}
	sets.Weapon.Spharai = {main='Spharai'}
	

     sets.Idle = {}
    --Idle Sets--
    sets.Idle.index = { 'DT', 'Regen', 'Kite' }
    Idle_ind = 1
    sets.Idle.DT = {
        ammo = "Staunch Tathlum +1", -- 0/0/3
        head = "Malignance Chapeau", -- 0/0/6
        neck = "Warder's Charm +1",
        ear1 = "Eabani Earring", 
        ear2 = "Odnowa Earring +1", --0/2/3
        body = "Malignance Tabard", --0/0/9
        hands = "Malignance Gloves", -- 0/0/5
        ring1 = "Shadow Ring",
        ring2 = "Purity Ring", -- 0/4/0
        back = Segomo.TP, -- 10/0/0
        waist = "Moonbow Belt", -- 0/0/5
        legs = "Malignance Tights", -- 0/0/7
        feet = "Malignance Boots" -- 0/0/4
    } -- 10/6/42
 
    sets.Idle.Regen = {
        ammo = "Staunch Tathlum +1", -- 0/0/3
        head = "Malignance Chapeau", -- 0/0/6
        neck = "Warder's Charm +1",
        ear1 = "Eabani Earring", 
        ear2 = "Odnowa Earring +1", --0/2/3
        body = "Hizamaru Haramaki +2",
        hands = "Malignance Gloves", -- 0/0/5
        ring1 = "Chirich Ring",
        ring2 = "Chirich Ring",
        back = Segomo.TP, -- 10/0/0
        waist = "Moonbow Belt", -- 0/0/5
        legs = "Malignance Tights", -- 0/0/7
        feet = "Malignance Boots" -- 0/0/4
    } -- 10/2/33
	
    sets.Idle.Kite = {
        ammo = "Staunch Tathlum +1", -- 0/0/3
        head = "Malignance Chapeau", -- 0/0/6
        neck = "Warder's Charm +1",
        ear1 = "Eabani Earring", 
        ear2 = "Odnowa Earring +1", --0/2/3
        body = "Malignance Tabard", --0/0/9
        hands = "Malignance Gloves", -- 0/0/5
        ring1 = "Shadow Ring",
        ring2 = "Purity Ring", -- 0/4/0
        back = Segomo.TP, -- 10/0/0
        waist = "Moonbow Belt", -- 0/0/5
        legs = "Malignance Tights", -- 0/0/7
        feet = "Herald's Gaiters"
    } -- 10/6/38
 
    sets.Idle.Town = set_combine(sets.Idle.Kite, {        
    })

 
-------TP Sets-------------------------------------------
   
    ---------------------
    --OneHanded TP Sets--
    ---------------------
   
    sets.OneHandedTP = {}
    sets.OneHandedTP.index = { 'DualWield', 'CappedHaste' }
    OneHandedTP_ind = 1

	--Will need to manually equip these weapons until toggle is implemented
	--Only useful for breaking attack speed cap during Hundred Fists
	sets.OneHandedTP.DualWield = {
		ammo = "Coiste Bodhar",
        head = "Ryuo Somen +1",
        neck = "Monk's Nodowa +1",
        ear1 = "Eabani Earring",
        ear2 = "Suppanomimi",
        body = AdhemarBody.TP,
        hands = HercGloves.DW,
        ring1 = "Gere Ring",
        ring2 = "Niqmaddu Ring",
        back = Segomo.DW,
        waist = "Reiki Yotai",
        legs = HercLegs.DW,
        feet = TaeonFeet.DW
    } 
   
    sets.OneHandedTP.CappedHaste = {
		ammo = "Coiste Bodhar",
        head = "Dampening Tam",
        neck = "Combatant's Torque",
        ear1 = "Sherida Earring",
        ear2 = "Brutal Earring",
        body = "Kendatsuba Samue +1",
        hands = HercGloves.TP,
        ring1 = "Gere Ring",
        ring2 = "Niqmaddu Ring",
        back = Segomo.TP,
        waist = "Moonbow Belt",
        legs = "Samnuha Tights",
        feet = HercFeet.TP
    } 

   
    ---------------------
    --H2H TP Sets--
    ---------------------
    
    sets.H2HTP = {}
    sets.H2HTP.index = {'Normal', 'Resist', 'SB'} --keep the same number of sets as staff
    H2HTP_ind = 1
	
    sets.H2HTP.Normal = {
        ammo = "Coiste Bodhar",
        head = "Adhemar Bonnet +1",
        neck = "Monk's Nodowa +1",
        ear1 = "Sherida Earring",
        ear2 = "Telos Earring",
        body= "Kendatsuba Samue +1",
        hands= "Adhemar Wristbands +1",
        ring1 = "Gere Ring",
        ring2 = "Niqmaddu Ring",
        back = Segomo.TP,
        waist = "Moonbow Belt",
        legs = "Hesychast's Hose +3",
        feet = "Anchorite's Gaiters +3"
    } -- 
	
    sets.H2HTP.Resist = {
		ammo="Coiste Bodhar",
        head="Malignance Chapeau",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Telos Earring",
        body="Kendatsuba Samue +1",
		hands="Malignance Gloves",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
        back=Segomo.TP,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Malignance Boots"
    } -- 
	
    sets.H2HTP.SB = {
        ammo = "Coiste Bodhar",
        head = "Dampening Tam",
        neck = "Monk's Nodowa +1",
        ear1 = "Sherida Earring",
        ear2 = "Telos Earring",
        body= "Kendatsuba Samue +1",
        hands= HercGloves.TP,
        ring1 = "Gere ring",
        ring2 = "Niqmaddu Ring",
        back = Segomo.TP,
        waist = "Moonbow Belt",
        legs = "Mpaca's Hose",
        feet = HercFeet.TP
    } -- 
	
	--H2H Impetus
    sets.H2HTPImpetus = {}
    sets.H2HTPImpetus.index = {'Normal', 'Resist', 'SB'} --keep the same number of sets as staff
    H2HTPImpetus_ind = 1	
	
    sets.H2HTPImpetus.Normal = {
        ammo = "Coiste Bodhar",
        head = "Adhemar Bonnet +1",
        neck = "Monk's Nodowa +1",
        ear1 = "Sherida Earring",
        ear2 = "Telos Earring",
        body= "Bhikku Cyclas +1",
        hands= "Adhemar Wristbands +1",
        ring1 = "Gere Ring",
        ring2 = "Niqmaddu Ring",
        back = Segomo.TP,
        waist = "Moonbow Belt",
        legs = "Hesychast's Hose +3",
        feet = "Anchorite's Gaiters +3"
    } -- 
	
    sets.H2HTPImpetus.Resist = {
		ammo="Coiste Bodhar",
        head="Malignance Chapeau",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Telos Earring",
        body="Bhikku Cyclas +1",
		hands="Malignance Gloves",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
        back=Segomo.TP,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Malignance Boots"
    } -- 
	
    sets.H2HTPImpetus.SB = {
        ammo = "Coiste Bodhar",
        head = "Adhemar Bonnet +1",
        neck = "Monk's Nodowa +1",
        ear1 = "Sherida Earring",
        ear2 = "Telos Earring",
        body= "Bhikku Cyclas +1",
        hands= HercGloves.TP,
        ring1 = "Gere ring",
        ring2 = "Niqmaddu Ring",
        back = Segomo.TP,
        waist = "Moonbow Belt",
        legs = "Mpaca's Hose",
        feet = HercFeet.TP
    } -- 
	
    ---------------------
    --Staff TP Sets--
    ---------------------
    
    sets.StaffTP = {}
    sets.StaffTP.index = {'Normal', 'Resist', 'SB'} --keep the same number of sets as h2h
    StaffTP_ind = 1
	
    sets.StaffTP.Normal = {
		ammo = "Coiste Bodhar",
        head = "Dampening Tam",
        neck = "Combatant's Torque",
        ear1 = "Sherida Earring",
        ear2 = "Brutal Earring",
        body = "Kendatsuba Samue +1",
        hands = HercGloves.TP,
        ring1 = "Gere Ring",
        ring2 = "Niqmaddu Ring",
        back = Segomo.TP,
        waist = "Moonbow Belt",
        legs = "Samnuha Tights",
        feet = HercFeet.TP
    } 
	
    sets.StaffTP.Resist = {
		ammo = "Coiste Bodhar",
        head = "Malignance Chapeau",
        neck = "Combatant's Torque",
        ear1 = "Sherida Earring",
        ear2 = "Brutal Earring",
        body = "Kendatsuba Samue +1",
        hands = "Malignance Gloves",
        ring1 = "Gere Ring",
        ring2 = "Niqmaddu Ring",
        back = Segomo.TP,
        waist = "Moonbow Belt",
        legs = "Mpaca's Hose",
        feet = "Malignance Boots"
    } 	

    sets.StaffTP.SB = {
		ammo = "Coiste Bodhar",
        head = "Dampening Tam",
        neck = "Combatant's Torque",
        ear1 = "Sherida Earring",
        ear2 = "Brutal Earring",
        body = "Kendatsuba Samue +1",
        hands = HercGloves.TP,
        ring1 = "Gere Ring",
        ring2 = "Niqmaddu Ring",
        back = Segomo.TP,
        waist = "Moonbow Belt",
        legs = "Mpaca's Hose",
        feet = HercFeet.TP
    }		

    sets.StaffTPImpetus = {}
    sets.StaffTPImpetus.index = {'Normal', 'Resist', 'SB'} --keep the same number of sets as h2h
    StaffTPImpetus_ind = 1

    sets.StaffTPImpetus.Normal = {
		ammo = "Coiste Bodhar",
        head = "Adhemar Bonnet +1",
        neck = "Combatant's Torque",
        ear1 = "Sherida Earring",
        ear2 = "Brutal Earring",
        body = "Bhikku Cyclas +1",
        hands = HercGloves.TP,
        ring1 = "Gere Ring",
        ring2 = "Niqmaddu Ring",
        back = Segomo.TP,
        waist = "Moonbow Belt",
        legs = "Samnuha Tights",
        feet = HercFeet.TP
    } 
	
    sets.StaffTPImpetus.Resist = {
		ammo = "Coiste Bodhar",
        head = "Malignance Chapeau",
        neck = "Combatant's Torque",
        ear1 = "Sherida Earring",
        ear2 = "Brutal Earring",
        body = "Bhikku Cyclas +1",
        hands = "Malignance Gloves",
        ring1 = "Gere Ring",
        ring2 = "Niqmaddu Ring",
        back = Segomo.TP,
        waist = "Moonbow Belt",
        legs = "Mpaca's Hose",
        feet = "Malignance Boots"
    } 	

    sets.StaffTPImpetus.SB = {
		ammo = "Coiste Bodhar",
        head = "Adhemar Bonnet +1",
        neck = "Combatant's Torque",
        ear1 = "Sherida Earring",
        ear2 = "Brutal Earring",
        body = "Bhikku Cyclas +1",
        hands = HercGloves.TP,
        ring1 = "Gere Ring",
        ring2 = "Niqmaddu Ring",
        back = Segomo.TP,
        waist = "Moonbow Belt",
        legs = "Mpaca's Hose",
        feet = HercFeet.TP
    }
   
    -------------------
    --Counter TP Sets--
    -------------------
   
    sets.CounterTP = {}
    sets.CounterTP.index = { 'Counter', 'Counterstance', 'DT' }
    CounterTP_ind = 1

	sets.CounterTP.Counter = {
		ammo="Amar Cluster", --2
        head="Malignance Chapeau",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Cryptic Earring", --3
        body="Mpaca's Doublet", --10
		hands="Malignance Gloves",
		ring1="Defending Ring",
		ring2="Niqmaddu Ring",
        back=Segomo.Counter, --10
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Hesychast's Gaiters +3" 
    } 
	  
    sets.CounterTP.Counterstance = {
		ammo="Voluspa Tathlum",
        head="Malignance Chapeau",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Odnowa Earring +1", 
        body="Hesychast's Cyclas +3",
		hands="Malignance Gloves",
		ring1="Defending Ring",
		ring2="Niqmaddu Ring",
        back=Segomo.TP,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Hesychast's Gaiters +3"
    } 
	  
    sets.CounterTP.DT = {
		ammo="Coiste Bodhar",
        head="Malignance Chapeau", --0/0/6
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Odnowa Earring +1", -- 0/2/3
        body="Mpaca Doublet", -- 10/0/0
		hands="Malignance Gloves", -- 0/0/5
		ring1="Defending Ring", -- 0/0/10
		ring2="Niqmaddu Ring",
        back=Segomo.Counter,
		waist="Moonbow Belt", -- 0/0/5
		legs="Mpaca's Hose", -- 9/0/0
		feet="Malignance Boots" -- 0/0/4
    } 
	
    sets.CounterTPImpetus = {}
    sets.CounterTPImpetus.index = { 'Counter', 'Counterstance', 'DT' }
    CounterTPImpetus_ind = 1	
	
	sets.CounterTPImpetus.Counter = {
		ammo="Amar Cluster", --2
        head="Adhemar Bonnet +1",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Cryptic Earring", --3
        body="Bhikku Cyclas +1",
		hands="Malignance Gloves",
		ring1="Defending Ring",
		ring2="Niqmaddu Ring",
        back=Segomo.Counter, --10
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Hesychast's Gaiters +3" 
    } 
	  
    sets.CounterTPImpetus.Counterstance = {
		ammo="Voluspa Tathlum",
        head="Adhemar Bonnet +1",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Odnowa Earring +1", 
        body="Bhikku Cyclas +1",
		hands="Malignance Gloves",
		ring1="Defending Ring",
		ring2="Niqmaddu Ring",
        back=Segomo.TP,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Hesychast's Gaiters +3"
    } 
	  
    sets.CounterTPImpetus.DT = {
		ammo="Coiste Bodhar",
        head="Malignance Chapeau", --0/0/6
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Odnowa Earring +1", -- 0/2/3
        body="Bhikku Cyclas +1", 
		hands="Malignance Gloves", -- 0/0/5
		ring1="Defending Ring", -- 0/0/10
		ring2="Niqmaddu Ring",
        back=Segomo.TP, -- 10/0/0
		waist="Moonbow Belt", -- 0/0/5
		legs="Mpaca's Hose", -- 9/0/0
		feet="Malignance Boots" -- 0/0/4
    }


    -------------------
    --AM3 TP Sets--
    -------------------
    
	--Un-needed at the moment, but future-proofing for Spharai
    sets.AM3 = {}
    sets.AM3.index = { 'Counter', 'Counterstance', 'DT' }
    AM3_ind = 1 -- In the same rule as the Counter TP Toggle so it toggles it at the same time
 
	--20% JA Haste w/ Hasso
	--Intended to cap w/o Hasso (Seigan/TE, /drg, etc)
    sets.AM3.Counter = set_combine(sets.CounterTP.Counter, {})
 
	--20% JA Haste w/ Hasso
	--Intended to cap w/o Hasso (Seigan/TE, /drg, etc)
    sets.AM3.CounterStance = set_combine(sets.CounterTP.Counterstance, {})

	--20% JA Haste w/ Hasso
	--Assumes Hasso is used since not the focus of target
    sets.AM3.DT = set_combine(sets.CounterTP.DT, {})
	
    sets.AM3Impetus = {}
    sets.AM3Impetus.index = { 'Counter', 'Counterstance', 'DT' }
    AM3Impetus_ind = 1 -- In the same rule as the Counter TP Toggle so it toggles it at the same time
 
	--20% JA Haste w/ Hasso
	--Intended to cap w/o Hasso (Seigan/TE, /drg, etc)
    sets.AM3Impetus.Counter = set_combine(sets.CounterTPImpetus.Counter, {})
 
	--20% JA Haste w/ Hasso
	--Intended to cap w/o Hasso (Seigan/TE, /drg, etc)
    sets.AM3Impetus.CounterStance = set_combine(sets.CounterTPImpetus.Counterstance, {})

	--20% JA Haste w/ Hasso
	--Assumes Hasso is used since not the focus of target
    sets.AM3Impetus.DT = set_combine(sets.CounterTPImpetus.DT, {})	

	
------End of TP--------------------------------------------------------------------------------------------------------------------
    --WS Sets--
    sets.WS = {}
 
    sets.HowlingFist = {}
 
    sets.HowlingFist.index = { 'Attack', 'Accuracy' }
    HowlingFist_ind = 1
 
    sets.HowlingFist.Attack = {
		ammo="Knobkierrie",
        head="Mpaca's Cap",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
        body="Mpaca's Doublet",
		hands=HercGloves.TP,
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
        back=Segomo.WSD,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet=HercFeet.TP
    }
 
    sets.HowlingFist.Accuracy = {
		ammo="Knobkierrie",
        head="Mpaca's Cap",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
        body="Mpaca's Doublet",
		hands=HercGloves.TP,
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
        back=Segomo.WSD,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet=HercFeet.TP
    }
 
    sets.RagingFists = {}
 
    sets.RagingFists.index = { 'Attack', 'Accuracy' }
    RagingFists_ind = 1
 
    sets.RagingFists.Attack = {
		ammo="Knobkierrie",
        head="Mpaca's Cap",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
        body="Mpaca's Doublet",
		hands="Adhemar Wristbands +1",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
        back=Segomo.DA,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet=HercFeet.TP
    }
   
    sets.RagingFists.Accuracy = {
		ammo="Knobkierrie",
        head="Mpaca's Cap",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
        body="Mpaca's Doublet",
		hands="Adhemar Wristbands +1",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
        back=Segomo.DA,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet=HercFeet.TP
    }
 
    sets.AsuranFists = {}
 
    sets.AsuranFists.index = { 'Attack', 'Accuracy' }
    AsuranFists_ind = 1
 
    sets.AsuranFists.Attack = {
		ammo="Knobkierrie",
        head="Hesychast's Crown +3",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Odnowa Earring +1",
        body="Hesychast's Cyclas +3",
		hands="Regal Captain's Gloves",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
        back=Segomo.WSD,
		waist="Moonbow Belt",
		legs="Hizamaru Hizayoroi +2",
		feet="Hesychast's Gaiters +3"
    }
 
    sets.AsuranFists.Accuracy = {
		ammo="Knobkierrie",
        head="Hesychast's Crown +3",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Odnowa Earring +1",
        body="Hesychast's Cyclas +3",
		hands="Regal Captain's Gloves",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
        back=Segomo.WSD,
		waist="Moonbow Belt",
		legs="Hizamaru Hizayoroi +2",
		feet="Hesychast's Gaiters +3"
    }
 
    sets.ShijinSpiral = {}
 
    sets.ShijinSpiral.index = { 'Attack', 'Accuracy' }
    ShijinSpiral_ind = 1
	
    sets.ShijinSpiral.Attack = {
		ammo="Knobkierrie",
        head="Mpaca's Cap",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Mache Earring +1",
        body="Mpaca's Doublet",
		hands="Malignance Gloves",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
        back=Segomo.TP,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Malignance Boots"
    }
 
    sets.ShijinSpiral.Accuracy = {
		ammo="Knobkierrie",
        head="Mpaca's Cap",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Mache Earring +1",
        body="Mpaca's Doublet",
		hands="Malignance Gloves",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
        back=Segomo.TP,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Malignance Boots"
	}
 
    sets.VictorySmite = {}
 
    sets.VictorySmite.index = { 'Attack', 'Accuracy' }
    VictorySmite_ind = 1
	
    sets.VictorySmite.Attack = {
		ammo="Knobkierrie",
        head="Mpaca's Cap",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Mache Earring +1",
        body="Mpaca's Doublet",
		hands="Ryuo Tekko",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
        back=Segomo.TP,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Malignance Boots"
    }
 
    sets.VictorySmite.Accuracy = {
		ammo="Knobkierrie",
        head="Mpaca's Cap",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Mache Earring +1",
        body="Mpaca's Doublet",
		hands="Ryuo Tekko",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
        back=Segomo.TP,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Malignance Boots"
	}
	
    sets.VictorySmite.Impetus = {
		ammo="Knobkierrie",
        head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Mache Earring +1",
        body="Bhikku Cyclas +1",
		hands="Malignance Gloves",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
        back=Segomo.TP,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Malignance Boots"
	}	
	
    sets.AsceticsFury = {}
 
    sets.AsceticsFury.index = { 'Attack', 'Accuracy' }
    AsceticsFury_ind = 1
	
    sets.AsceticsFury.Attack = {
		ammo="Coiste Bodhar",
        head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
        body="Kendatsuba Samue +1",
		hands="Ryuo Tekko",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
        back=Segomo.DA,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet=HercFeet.TP
    }
 
    sets.AsceticsFury.Accuracy = {
		ammo="Coiste Bodhar",
        head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
        body="Kendatsuba Samue +1",
		hands="Ryuo Tekko",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
        back=Segomo.DA,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet=HercFeet.TP
	}
	
    sets.AsceticsFury.Impetus = {
		ammo="Coiste Bodhar",
        head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
        body="Bhikku Cyclas +1",
		hands="Ryuo Tekko",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
        back=Segomo.DA,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet=HercFeet.TP
	}	

    sets.FinalHeaven = {}
 
    sets.FinalHeaven.index = { 'Attack', 'Accuracy' }
    FinalHeaven_ind = 1
	
    sets.FinalHeaven.Attack = {
		ammo="Knobkierrie",
        head="Hesychast's Crown +3",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Ishvara Earring",
        body="Nyame Mail",
		hands=HercGloves.WSD,
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
        back=Segomo.WSD,
		waist="Moonbow Belt",
		legs="Hizamaru Hizayoroi +2",
		feet=HercFeet.WSD
    }
 
    sets.FinalHeaven.Accuracy = {
		ammo="Knobkierrie",
        head="Hesychast's Crown +3",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Ishvara Earring",
        body="Nyame Mail",
		hands=HercGloves.WSD,
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
        back=Segomo.WSD,
		waist="Moonbow Belt",
		legs="Hizamaru Hizayoroi +2",
		feet=HercFeet.WSD
	}	
	
    sets.ShoulderTackle = {}
 
    sets.ShoulderTackle.index = { 'Attack', 'Accuracy' }
    ShoulderTackle_ind = 1
	
    sets.ShoulderTackle.Attack = {
        ammo="Pemphredo Tathlum",
		head="Malignance Chapeau",
		neck="Sanctity Necklace",
		ear1="Dignitary's Earring",
		ear2="Telos Earring",
        body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Stikini Ring",
		ring2="Stikini Ring",
        back=Segomo.WSD,
		waist="Luminary Sash",
		legs="Malignance Tights",
		feet="Malignance Boots"
    }
 
    sets.ShoulderTackle.Accuracy = {
        ammo="Pemphredo Tathlum",
		head="Malignance Chapeau",
		neck="Sanctity Necklace",
		ear1="Dignitary's Earring",
		ear2="Telos Earring",
        body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Stikini Ring",
		ring2="Stikini Ring",
        back=Segomo.WSD,
		waist="Luminary Sash",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}

    sets.SpinningAttack = {}
 
    sets.SpinningAttack.index = { 'Attack', 'Accuracy' }
    SpinningAttack_ind = 1
	
    sets.SpinningAttack.Attack = {
		ammo="Knobkierrie",
        head="Hesychast's Crown +3",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Ishvara Earring",
        body="Nyame Mail",
		hands=HercGloves.WSD,
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
        back=Segomo.WSD,
		waist="Moonbow Belt",
		legs="Hizamaru Hizayoroi +2",
		feet=HercFeet.WSD
    }
 
    sets.SpinningAttack.Accuracy = {
		ammo="Knobkierrie",
        head="Hesychast's Crown +3",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Ishvara Earring",
        body="Nyame Mail",
		hands=HercGloves.WSD,
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
        back=Segomo.WSD,
		waist="Moonbow Belt",
		legs="Hizamaru Hizayoroi +2",
		feet=HercFeet.WSD
	}	
	
    sets.DragonKick = {}
 
    sets.DragonKick.index = { 'Attack', 'Accuracy' }
    DragonKick_ind = 1
	
    sets.DragonKick.Attack = {
		ammo="Knobkierrie",
        head="Mpaca's Cap",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
        body="Mpaca's Doublet",
		hands=HercGloves.TP,
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
        back=Segomo.WSD,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Anchorite's Gaiters +3"
    }
 
    sets.DragonKick.Accuracy = {
		ammo="Knobkierrie",
        head="Mpaca's Cap",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
        body="Mpaca's Doublet",
		hands=HercGloves.TP,
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
        back=Segomo.WSD,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Anchorite's Gaiters +3"
	}		

    sets.TornadoKick = {}
 
    sets.TornadoKick.index = { 'Attack', 'Accuracy' }
    TornadoKick_ind = 1
	
    sets.TornadoKick.Attack = {
		ammo="Knobkierrie",
        head="Mpaca's Cap",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
        body="Mpaca's Doublet",
		hands=HercGloves.TP,
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
        back=Segomo.WSD,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Anchorite's Gaiters +3"
    }
 
    sets.TornadoKick.Accuracy = {
		ammo="Knobkierrie",
        head="Mpaca's Cap",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
        body="Mpaca's Doublet",
		hands=HercGloves.TP,
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
        back=Segomo.WSD,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Anchorite's Gaiters +3"
	}	

     sets.Cataclysm = {}
 
    sets.Cataclysm.index = { 'Attack', 'Accuracy' }
    Cataclysm_ind = 1
	
    sets.Cataclysm.Attack = {
        ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Moonshade Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Archon Ring",
		ring2="Acumen Ring",
        back=Segomo.WSD,
		waist="Eschan Stone",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
    }
 
    sets.Cataclysm.Accuracy = {
        ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Moonshade Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Archon Ring",
		ring2="Acumen Ring",
        back=Segomo.WSD,
		waist="Eschan Stone",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}	
	
     sets.ShellCrusher = {}
 
    sets.ShellCrusher.index = { 'Attack', 'Accuracy' }
    ShellCrusher_ind = 1
	
    sets.ShellCrusher.Attack = {
        ammo="Pemphredo Tathlum",
		head="Malignance Chapeau",
		neck="Sanctity Necklace",
		ear1="Dignitary's Earring",
		ear2="Telos Earring",
        body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Stikini Ring",
		ring2="Stikini Ring",
        back=Segomo.WSD,
		waist="Luminary Sash",
		legs="Malignance Tights",
		feet="Malignance Boots"
    }
 
    sets.ShellCrusher.Accuracy = {
        ammo="Pemphredo Tathlum",
		head="Malignance Chapeau",
		neck="Sanctity Necklace",
		ear1="Dignitary's Earring",
		ear2="Telos Earring",
        body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Stikini Ring",
		ring2="Stikini Ring",
        back=Segomo.WSD,
		waist="Luminary Sash",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}

     sets.Shattersoul = {}
 
    sets.Shattersoul.index = { 'Attack', 'Accuracy' }
    Shattersoul_ind = 1
	
    sets.Shattersoul.Attack = {
        ammo="Pemphredo Tathlum",
		head="Malignance Chapeau",
		neck="Sanctity Necklace",
		ear1="Dignitary's Earring",
		ear2="Telos Earring",
        body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Stikini Ring",
		ring2="Stikini Ring",
        back=Segomo.WSD,
		waist="Luminary Sash",
		legs="Malignance Tights",
		feet="Malignance Boots"
    }
 
    sets.Shattersoul.Accuracy = {
        ammo="Pemphredo Tathlum",
		head="Malignance Chapeau",
		neck="Sanctity Necklace",
		ear1="Dignitary's Earring",
		ear2="Telos Earring",
        body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Stikini Ring",
		ring2="Stikini Ring",
        back=Segomo.WSD,
		waist="Luminary Sash",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}	

	
	
------End of WS------------------------------------------------------------------------------------------
------Magic Sets---
    --BlueMagic and Cures are unlikely to be needed
	--Leftovers from prior Luas
	sets.BlueMagic = {}
 
    sets.BlueMagic.STR = {}
 
    --Curing Sets--
    sets.Cures = {}
   
    sets.Cures.SelfCures = set_combine(sets.Cures, {})
	
    --Spell Interruption Rate--
    sets.SIR = {} 
	
------End of Magic-------------------------------------------------------------------------------------
    --Enmity Set--
   
    sets.Enmity = {
		ammo = "Sapience Orb",
        head = "Halitus Helm",
        neck = "Unmoving Collar +1",
        ear1 = "Trux Earring",
        ear2 = "Cryptic Earring",
        body = "Emet Harness +1",
        hands = "Kurys Gloves",
        ring1 = "Pernicious Ring",
        ring2 = "Supershear Ring",
        back = "Moonbeam Cape",
        waist = "Moonbow Belt",
        legs = "Malignance Tights",
        feet = "Ahosi Leggings"
    }
   
    --Utility Sets--
   
    sets.Utility = {}
 
    sets.Utility.TH = {
        ammo = "Perfect Lucky Egg",
		head = "Volte Cap",
		hands = HercGloves.TH,
		waist = "Chaac Belt"
    }
   
    sets.Utility.Derp = {
		ammo="Coiste Bodhar",
        head="Malignance Chapeau",
		neck="Warder's Charm +1",
		ear1="Eabani Earring",
		ear2="Sanare Earring",
        body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Defending Ring",
		ring2="Purity Ring",
        back=Segomo.TP,
		waist="Engraved Belt",
		legs="Malignance Tights",
		feet="Malignance Boots"
    } 
   
    sets.Utility.MDTTank =  {}
   
    --Shell V--
    sets.Utility.MDTV = {}
 
    --Shell II only--
    sets.Utility.MDTII = {}
 
    --No Shell--
    sets.Utility.MDTNO = {}
 
    --MEva Focused--
    sets.Utility.MEVA = {}
 
    ---------------------------------------------------------------
   
    sets.Utility.Charm = {
		ammo="Coiste Bodhar",
        head="Malignance Chapeau",
		neck="Warder's Charm +1",
		ear1="Eabani Earring",
		ear2="Sanare Earring",
        body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Defending Ring",
		ring2="Purity Ring",
        back=Segomo.TP,
		waist="Engraved Belt",
		legs="Malignance Tights",
		feet="Malignance Boots"	
	}
   
    sets.Utility.Doom = {
        neck  = "Nicander's Necklace",
		ring1 = "Purity Ring",
		ring2 = "Haoma's Ring",
		waist = "Gishdubar Sash"
    }
	
	sets.WSDayBonus = (set_combine(equipSet,{head="Gavialis Helm"}))
   
    --DarkMagic Sets--
   
    sets.Dark = {}
   
    sets.Dark.Skill = {}

	--Max HP + Spikes Effect gear
    sets.Dark.Dread = {}
	
	--Stun set
    sets.Dark.Macc = {}
   
    sets.Dark.Absorb = {}
	
    sets.Dark.Drain = {}	
	
    sets.Dark.Aspir = {}	

	sets.Enfeebling = {}
   
    sets.Enfeebling.Macc = {} 
	
	sets.Elemental = {}
	
	sets.Elemental.Nuke = {}

	sets.Elemental.Impact = {} 	
	
   
    --Job Ability Sets--
	sets.JA = {}
	
	--MNK--
	sets.JA.HundredFists = {legs="Hesychast's Hose +3"}
	sets.JA.HundredFistsTP = {
		ammo="Coiste Bodhar",
        head="Dampening Tam",
		neck="Combatant's Torque",
		ear1="Sherida Earring",
		ear2="Brutal Earring",
        body="Mpaca's Doublet",
		hands=HercGloves.TP,
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
        back=Segomo.TP,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet=HercFeet.TP	
	}
	sets.JA.HundredFistsTPImpetus = {
		ammo="Coiste Bodhar",
        head="Adhemar Bonnet +1",
		neck="Combatant's Torque",
		ear1="Sherida Earring",
		ear2="Brutal Earring",
        body="Bhikku Cyclas +1",
		hands=HercGloves.TP,
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
        back=Segomo.TP,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet=HercFeet.TP	
	}	
	sets.JA.Boost = {hands="Anchorite's Gloves +2", waist="Ask Sash"}
	sets.JA.Chakra = {
		ammo="Staunch Tathlum +1",
        head="Hesychast's Crown +3",
		neck="Unmoving Collar +1",
		ear1="Odnowa Earring +1",
		ear2="Tuisto Earring",
        body="Anchorite's Cyclas +1",
		hands="Hesychast's Gloves +3",
		ring1="Regal Ring",
		ring2="Gelatinous Ring +1",
        back=Segomo.WSD,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Hizamaru Sune-ate +2"
	}
	sets.JA.Dodge = {feet="Anchorite's Gaiters +3"}
	sets.JA.Focus = {head="Anchorite's Crown +1"}
	sets.JA.Counterstance = {feet="Hesychast's Gaiters +3"}
	sets.JA.ChiBlast = {
		head="Hesychast's Crown +3",
	}
	sets.JA.Mantra = {feet="Hesychast's Gaiters +3"}
	sets.JA.FormlessStrikes = {body="Hesychast's Cyclas +3"}
	sets.JA.Footwork = {feet="Shukuyu Sune-ate"}
	sets.JA.PerfectCounter = {}
	sets.JA.Impetus = {}
	
	--DRK--
	sets.JA.SoulEater = {}
	sets.JA.LastResort = {}
	sets.JA.WeaponBash = {}
	sets.JA.DarkSeal = {}
	sets.JA.NetherVoid = {}	
	sets.JA.ScarletDelirium = {}
	sets.JA.ArcaneCircle = {}	
	sets.JA.ArcaneCrest = {}	
	sets.JA.ConsumeMana = {}	
	
	--RUN--
	sets.JA.Ignis = sets.Enmity
	sets.JA.Gelus = sets.Enmity
	sets.JA.Flabra = sets.Enmity
	sets.JA.Tellus = sets.Enmity
	sets.JA.Sulpor = sets.Enmity
	sets.JA.Unda = sets.Enmity
	sets.JA.Lux = sets.Enmity
	sets.JA.Tenebrae = sets.Enmity
   
    sets.JA.Swipe = {
	
	}    
 
    sets.JA.Swordplay = set_combine(sets.Enmity, {})   
    sets.JA.Vallation = set_combine(sets.Enmity, {})   
    sets.JA.Pflug = set_combine(sets.Enmity, {})   
    sets.JA.Valiance = set_combine(sets.Enmity, {})   
   
    ---SAM---
    sets.JA.Meditate = set_combine(sets.Enmity, {})
   
    ---WAR---
    sets.JA.Provoke = set_combine(sets.Enmity, {})
    sets.JA.Warcry = set_combine(sets.Enmity, {})
	
	--PLD--
	sets.JA.Sentinel = sets.Enmity
	sets.JA['Shield Bash'] = sets.Enmity
   
    --Precast Sets--
    sets.precast = {}
 
    sets.precast.FastCast = {
		ammo="Sapience Orb",
        head=HercHelm.FC,
		neck="Orunmila's Torque",
		ear1="Loquacious Earring",
		ear2="Enchanter's Earring +1",
        body=AdhemarBody.FC,
		hands="Leyline Gloves",
		ring1="Rahab Ring",
		ring2="Naji's Loop",
        back=Segomo.Util,
		waist="Moonbow Belt",
		legs=HercLegs.FC,
		feet=HercFeet.FC
	}
 
    sets.precast.FastCast.Standard = {
		ammo="Sapience Orb",
        head=HercHelm.FC,
		neck="Orunmila's Torque",
		ear1="Loquacious Earring",
		ear2="Enchanter's Earring +1",
        body=AdhemarBody.FC,
		hands="Leyline Gloves",
		ring1="Rahab Ring",
		ring2="Naji's Loop",
        back=Segomo.Util,
		waist="Moonbow Belt",
		legs=HercLegs.FC,
		feet=HercFeet.FC
	}
   
    sets.precast.FastCast.Impact = {}
end
 
---End of Gear---------------------------------------------------------------------------------------------------------------------------------------------------------
 
-------------------------------------
---------                   ---------
------                         ------
---         Start of Maps         ---
------                         ------
---------                   ---------
-------------------------------------
 
-------------------------
--   Weapons List   --
-------------------------
 
TwoHandedWeapons = S {
    'Zantetsuken X', 'Lycurgos'
}

-------------------------
--   DRK Spells List   --
------------------------- 
 
AbsorbSpells = S {
    'Absorb-STR', 'Absorb-DEX', 'Absorb-VIT', 'Absorb-AGI', 'Absorb-INT', 'Absorb-MND', 'Absorb-CHR', 'Absorb-TP', 'Absorb-ACC', 'Absorb-Attri'
}

DrainSpells = S {
	'Drain', 'Drain II', 'Drain III'
}

AspirSpells = S {
	'Aspir', 'Aspir II'
}
 
-------------------------
--   BLU Spells List   --
-------------------------
 
function maps()
    PhysicalSpells = S {
        'Bludgeon', 'Body Slam', 'Feather Storm', 'Mandibular Bite', 'Queasyshroom',
        'Power Attack', 'Screwdriver', 'Sickle Slash', 'Smite of Rage',
        'Terror Touch', 'Battle Dance', 'Claw Cyclone', 'Foot Kick', 'Grand Slam',
        'Sprout Smack', 'Helldive', 'Jet Stream', 'Pinecone Bomb', 'Wild Oats', 'Uppercut'
    }
   
    BlueMagic_Buffs = S {
        'Refueling',
    }
 
    BlueMagic_Healing = S {
        'Healing Breeze', 'Pollen', 'Wild Carrot'
    }
 
    BlueMagic_Enmity = S {
        'Blank Gaze', 'Jettatura', 'Geist Wall', 'Sheep Song'
    }
	
    BlueMagic_AoEEnmity = S { --Automatic SIR spells
        'Soporific', 'Cocoon', 'Stinking Gas', 'Poisonga'
    }
   
    RUNMagic_Enmity = S {
        'Flash'
    }
end

-------------------------------
--   WS Chart For Gavialis   --
-------------------------------
 
check_ws_day = {
Firesday = S {'Liquefaction','Fusion','Light'},
Earthsday= S {'Scission','Gravitation','Darkness'},
Watersday = S {'Reverberation','Distortion','Darkness'},
Windsday = S {'Detonation','Fragmentation','Light'},
Iceday = S {'Induration','Distortion','Darkness'},
Lightningsday = S {'Impaction','Fragmentation','Light'},
Lightsday = S {'Transfixion','Fusion','Light'},
Darksday = S {'Compression','Gravitation','Darkness'},}
 
------------------------
--   Town Gear List   --
------------------------
 
Town = S {
    "Ru'Lude Gardens", "Upper Jeuno", "Lower Jeuno", "Port Jeuno",
    "Port Windurst", "Windurst Waters", "Windurst Woods", "Windurst Walls", "Heavens Tower",
    "Port San d'Oria", "Northern San d'Oria", "Southern San d'Oria", "Chateau d'Oraguille",
    "Port Bastok", "Bastok Markets", "Bastok Mines", "Metalworks",
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
    add_to_chat (55, 'Currently on: '..('MNK '):color(5)..''..('Macros set!'):color(121))
end
 
--Page, Book--
set_macros(1,19)
--Use the Lockstyle Number--
set_style(67)
------------------------------------------
-- Variables
------------------------------------------
SetLocked = false --Used to Check if set is locked before changing equipment
LockedEquipSet = {} --Placeholder to store desired lock set
LockGearSet = {}
equipSet = {} --Currently Equiped Gearset
LockGearIndex = false
LockGearIndex = false
TargetDistance = 0
TH = false -- Defaults
SIR = false -- Spell Interruption Rate
CounterTP = true -- If true, default set is tanking TP array.
H2HTP = true -- TP set order, looks for Tanking TP set before 2H TP before 1H DW TP.
WeaponLock = true -- Locks Weapon/sub to avoid swaps
StaffWeapons = S{'Malignance Pole', 'Xoanon'}
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
                    if CounterTP == true then
						if AM3 == true then
							ChangeGear(sets.AM3[sets.AM3.index[AM3_ind]])
						else
							if buffactive['Impetus'] then
								ChangeGear(sets.CounterTPImpetus[sets.CounterTPImpetus.index[CounterTPImpetus_ind]])							
							else
								ChangeGear(sets.CounterTP[sets.CounterTP.index[CounterTP_ind]])
							end							
						end
                    elseif H2HTP == true then
                        if StaffWeapons:contains(player.equipment.main) then
							if buffactive['Impetus'] then
								ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
								ChangeGear(sets.StaffTPImpetus[sets.StaffTPImpetus.index[StaffTPImpetus_ind]])							
							else
								ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
								ChangeGear(sets.StaffTP[sets.StaffTP.index[StaffTP_ind]])
							end
						else
							if buffactive['Impetus'] then
								ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
								ChangeGear(sets.H2HTPImpetus[sets.H2HTPImpetus.index[H2HTPImpetus_ind]])							
							else
								ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
								ChangeGear(sets.H2HTP[sets.H2HTP.index[H2HTP_ind]])
							end													
						end
					else
                        ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
						ChangeGear(sets.OneHandedTP[sets.OneHandedTP.index[OneHandedTP_ind]])
                    end
                end
				if buffactive['Hundred Fists'] then
					if buffactive['Impetus'] then
						ChangeGear(sets.JA.HundredFistsTPImpetus)
					else
						ChangeGear(sets.JA.HundredFistsTP)
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
            send_command('@input /p Doomed.')
            disable('neck','ring1','ring2','waist')
        else
            if player.status == 'Engaged' then
                if LockGearIndex then
                    send_command('@input /p Doom off.')
                    enable('neck','ring1','ring2','waist')
                    ChangeGear(LockGearSet)
                else
                    send_command('@input /p Doom off.')
                    enable('neck','ring1','ring2','waist')
                    if CounterTP == true then
						if AM3 == true then
							ChangeGear(sets.AM3[sets.AM3.index[AM3_ind]])
						else
							if buffactive['Impetus'] then
								ChangeGear(sets.CounterTPImpetus[sets.CounterTPImpetus.index[CounterTPImpetus_ind]])							
							else
								ChangeGear(sets.CounterTP[sets.CounterTP.index[CounterTP_ind]])
							end	
						end
                    elseif H2HTP == true then
                        if StaffWeapons:contains(player.equipment.main) then
							if buffactive['Impetus'] then
								ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
								ChangeGear(sets.StaffTPImpetus[sets.StaffTPImpetus.index[StaffTPImpetus_ind]])							
							else
								ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
								ChangeGear(sets.StaffTP[sets.StaffTP.index[StaffTP_ind]])
							end
						else
							if buffactive['Impetus'] then
								ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
								ChangeGear(sets.H2HTPImpetus[sets.H2HTPImpetus.index[H2HTPImpetus_ind]])							
							else
								ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
								ChangeGear(sets.H2HTP[sets.H2HTP.index[H2HTP_ind]])
							end							
						end				
					else
                        ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
						ChangeGear(sets.OneHandedTP[sets.OneHandedTP.index[OneHandedTP_ind]])
					end
                end
				if buffactive['Hundred Fists'] then
					if buffactive['Impetus'] then
						ChangeGear(sets.JA.HundredFistsTPImpetus)
					else
						ChangeGear(sets.JA.HundredFistsTP)
					end
				end
            elseif player.status == 'Idle' then
                if LockGearIndex then
                    send_command('@input /p Doom off.')
                    enable('neck','ring1','ring2','waist')
                    ChangeGear(LockGearSet)
                else
                    send_command('@input /p Doom off.')
                    enable('neck','ring1','ring2','waist')
                    ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
                end
            end
        end
    elseif name == "charm" then
        if gain then
            send_command('@input /p Charmed!')
        else
            send_command('@input /p Charm off.')
        end
    elseif name == "weakness" then
        if gain then
            enable('neck','ring1','ring2','waist')
        end
    elseif name ==  "dark seal" then
        if gain then
        ChangeGear(set_combine(equipSet, {head="Fallen's Burgeonet +3"}))
        else
            if player.status == 'Engaged' then
                if LockGearIndex then
                    ChangeGear(LockGearSet)
                elseif not LockGearIndex then
                    if CounterTP == true then
						if AM3 == true then
							ChangeGear(sets.AM3[sets.AM3.index[AM3_ind]])
						else
							if buffactive['Impetus'] then
								ChangeGear(sets.CounterTPImpetus[sets.CounterTPImpetus.index[CounterTPImpetus_ind]])							
							else
								ChangeGear(sets.CounterTP[sets.CounterTP.index[CounterTP_ind]])
							end	
						end
                    elseif H2HTP == true then
                        if StaffWeapons:contains(player.equipment.main) then
							if buffactive['Impetus'] then
								ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
								ChangeGear(sets.StaffTPImpetus[sets.StaffTPImpetus.index[StaffTPImpetus_ind]])							
							else
								ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
								ChangeGear(sets.StaffTP[sets.StaffTP.index[StaffTP_ind]])
							end
						else
							if buffactive['Impetus'] then
								ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
								ChangeGear(sets.H2HTPImpetus[sets.H2HTPImpetus.index[H2HTPImpetus_ind]])							
							else
								ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
								ChangeGear(sets.H2HTP[sets.H2HTP.index[H2HTP_ind]])
							end							
						end				
					else
                        ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
						ChangeGear(sets.OneHandedTP[sets.OneHandedTP.index[OneHandedTP_ind]])
					end
                end
				if buffactive['Hundred Fists'] then
					if buffactive['Impetus'] then
						ChangeGear(sets.JA.HundredFistsTPImpetus)
					else
						ChangeGear(sets.JA.HundredFistsTP)
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
    end
	
    if name == "Impetus" then
        if gain then
			ac_Global()
        do return end
    else
        send_command('gs c -cd Impetus Lost!')
		ac_Global()
        end
    end	
	
    if name == "souleater" then
        if gain then
        do return end
    else
        send_command('gs c -cd Souleater Lost!')
        end
    end	
	
    if name == "arcane circle" then
        if gain then
        do return end
    else
        send_command('gs c -cd Arcane Circle Lost!')
        end
    end

    if name == "warding circle" then
        if gain then
        do return end
    else
        send_command('gs c -cd Warding Circle Lost!')
        end
    end		
   
    if name == "aftermath" and player.equipment.main == 'Apocalypse' then -- Accounts for 10% JA Haste
        if gain then
            AM3 = true
            send_command('timers create "Aftermath" 180 down')
            if LockGearIndex then
                ChangeGear(LockGearSet)
            elseif CounterTP == true then
                ChangeGear(sets.AM3[sets.AM3.index[AM3_ind]])
            end
        else
            AM3 = false
            send_command('timers delete "Aftermath";gs c -cd AM Lost!!!')
        end
    end
	
	if name == 'boost' then
		if gain then
			equip(sets.JA.Boost)
			disable('waist')
		else
			enable('waist')
			ac_Global()
		end	
	end	
	
	-- logic for Hundred Fists use
	if name == 'hundred fists' then
		--hook for HF added into engaged set logic
		if gain then
			if buffactive['Impetus'] then
				ChangeGear(sets.JA.HundredFistsTPImpetus)
			else
				ChangeGear(sets.JA.HundredFistsTP)
			end
		else
			send_command('gs c -cd Hundred Fists Lost!')
			ac_Global()
		end
	end		
end
 
------------------------------------------
--               Binds                  --
------------------------------------------
send_command('bind f9 gs c toggle TP set') --This means if you hit f9 it toggles the sets
send_command('bind @e gs c toggle Weapon set')
send_command('bind @w gs c toggle WeaponLock')
send_command('bind f10 gs c toggle WS set') --Changes Reso and Torcleaver sets
send_command('bind f11 gs c ') --Empty
send_command('bind f12 gs c toggle Idle set')
send_command('bind ^f8 gs c toggle SIR') -- Turns Spell Interruption Rate set on
send_command('bind ^f9 input /ws "Resolution" <t>') --^ means cntrl
send_command('bind ^f10 input /ws "Torcleaver" <t>')
send_command('bind ^f11 input /ws "Ground Strike" <t>')
send_command('bind ^f12 input /ws "Savage Blade" <t>')
send_command('bind !f7 gs c toggle CounterTP set') --! means alt, this exists only for toggling outside of this mode being active, otherwise f9
send_command('bind !f8 gs c toggle CounterTP') --! turns tanking tp off
send_command('bind !f9 gs c toggle backwards')
send_command('bind !f10 gs c toggle Other WS set') -- Changes affiliated sword ws sets
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
	send_command('unbind @e')
	send_command('unbind @w')
    send_command('unbind ^f10')
    send_command('unbind ^f11')
    send_command('unbind ^f12')
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
                if CounterTP == true then
					if buffactive['Impetus'] then
						ChangeGear(sets.CounterTPImpetus[sets.CounterTPImpetus.index[CounterTPImpetus_ind]])							
					else
						ChangeGear(sets.CounterTP[sets.CounterTP.index[CounterTP_ind]])
					end	
                elseif AM3 == true then
                        ChangeGear(sets.AM3[sets.AM3.index[AM3_ind]])
                elseif H2HTP == true then
                    if StaffWeapons:contains(player.equipment.main) then
						if buffactive['Impetus'] then
							ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
							ChangeGear(sets.StaffTPImpetus[sets.StaffTPImpetus.index[StaffTPImpetus_ind]])							
						else
							ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
							ChangeGear(sets.StaffTP[sets.StaffTP.index[StaffTP_ind]])
						end			
					else
						if buffactive['Impetus'] then
							ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
							ChangeGear(sets.H2HTPImpetus[sets.H2HTPImpetus.index[H2HTPImpetus_ind]])							
						else
							ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
							ChangeGear(sets.H2HTP[sets.H2HTP.index[H2HTP_ind]])
						end				
					end
                else
                    ChangeGear(sets.OneHandedTP[sets.OneHandedTP.index[OneHandedTP_ind]])
                end
				if buffactive['Hundred Fists'] then
					if buffactive['Impetus'] then
						ChangeGear(sets.JA.HundredFistsTPImpetus)
					else
						ChangeGear(sets.JA.HundredFistsTP)
					end
				end
            else
                ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
            end
        end
    end
	if command == 'toggle WeaponLock' then
		if WeaponLock == true then
			WeaponLock = false
			disable('main','sub')
			send_command('@input /echo <----- Weapon/Sub Swaps Disabled ----->')
		elseif WeaponLock == false then
			WeaponLock = true
			enable('main','sub')
			send_command('@input /echo <----- Weapon/Sub Swaps Enabled ----->')
		end
	end
    if command == 'toggle Weapon set' then
        Weapon_ind = Weapon_ind + 1
        if Weapon_ind > #sets.Weapon.index then Weapon_ind = 1 end
        send_command('@input /echo <----- Weapon changed to ' .. sets.Weapon.index[Weapon_ind] .. ' ----->')
        ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])	
	end
    if command == 'toggle TP set' then
        if CounterTP == true then
            CounterTP_ind = CounterTP_ind + 1
			CounterTPImpetus_ind = CounterTPImpetus_ind + 1
            AM3_ind = AM3_ind +1			
            if CounterTP_ind > #sets.CounterTP.index then CounterTP_ind = 1 end
			if CounterTPImpetus_ind > #sets.CounterTPImpetus.index then CounterTPImpetus_ind = 1 end
            if AM3_ind > #sets.AM3.index then AM3_ind = 1 end			
            send_command('@input /echo <----- CounterTP Set changed to ' .. sets.CounterTP.index[CounterTP_ind] .. ' ----->')
            if player.status == 'Engaged' then
				if AM3 == true then
                    ChangeGear(sets.AM3[sets.AM3.index[AM3_ind]])
				else	
					if buffactive['Impetus'] then
						ChangeGear(sets.CounterTPImpetus[sets.CounterTPImpetus.index[CounterTPImpetus_ind]])							
					else
						ChangeGear(sets.CounterTP[sets.CounterTP.index[CounterTP_ind]])
					end	
				end
				if buffactive['Hundred Fists'] then
					if buffactive['Impetus'] then
						ChangeGear(sets.JA.HundredFistsTPImpetus)
					else
						ChangeGear(sets.JA.HundredFistsTP)
					end
				end
            end
        elseif CounterTP == false then
            if H2HTP == true then
                H2HTP_ind = H2HTP_ind + 1
				H2HTPImpetus_ind = H2HTPImpetus_ind + 1
                StaffTP_ind = StaffTP_ind + 1	
				StaffTPImpetus_ind = StaffTPImpetus_ind + 1					
                if H2HTP_ind > #sets.H2HTP.index then H2HTP_ind = 1 end
				if H2HTPImpetus_ind > #sets.H2HTPImpetus.index then H2HTPImpetus_ind = 1 end
				if StaffTP_ind > #sets.StaffTP.index then StaffTP_ind = 1 end
				if StaffTPImpetus_ind > #sets.StaffTPImpetus.index then StaffTPImpetus_ind = 1 end
                send_command('@input /echo <----- H2H TP Set changed to ' .. sets.H2HTP.index[H2HTP_ind] .. ' ----->')  
                if player.status == 'Engaged' then					
					ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
					if StaffWeapons:contains(player.equipment.main) then
						if buffactive['Impetus'] then
							ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
							ChangeGear(sets.StaffTPImpetus[sets.StaffTPImpetus.index[StaffTPImpetus_ind]])							
						else
							ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
							ChangeGear(sets.StaffTP[sets.StaffTP.index[StaffTP_ind]])
						end	
					else
						if buffactive['Impetus'] then
							ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
							ChangeGear(sets.H2HTPImpetus[sets.H2HTPImpetus.index[H2HTPImpetus_ind]])							
						else
							ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
							ChangeGear(sets.H2HTP[sets.H2HTP.index[H2HTP_ind]])
						end	
					end
					if buffactive['Hundred Fists'] then
						if buffactive['Impetus'] then
							ChangeGear(sets.JA.HundredFistsTPImpetus)
						else
							ChangeGear(sets.JA.HundredFistsTP)
						end
					end
                end
            elseif H2HTP == false then
                OneHandedTP_ind = OneHandedTP_ind + 1
                if OneHandedTP_ind > #sets.OneHandedTP.index then OneHandedTP_ind = 1 end
                send_command('@input /echo <----- 1H|DW TP Sets changed to ' .. sets.OneHandedTP.index[OneHandedTP_ind] .. ' ----->')
                if player.status == 'Engaged' then
                    ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
					ChangeGear(sets.OneHandedTP[sets.OneHandedTP.index[OneHandedTP_ind]])
                end
				if buffactive['Hundred Fists'] then
					if buffactive['Impetus'] then
						ChangeGear(sets.JA.HundredFistsTPImpetus)
					else
						ChangeGear(sets.JA.HundredFistsTP)
					end
				end
            end    
        end
    elseif command == 'toggle Idle set' then
        Idle_ind = Idle_ind + 1
        if Idle_ind > #sets.Idle.index then Idle_ind = 1 end
        send_command('@input /echo <----- Idle Set changed to ' .. sets.Idle.index[Idle_ind] .. ' ----->')
        ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
    elseif command == 'toggle WS set' then
        HowlingFist_ind = HowlingFist_ind + 1
        RagingFists_ind = RagingFists_ind + 1
		AsuranFists_ind = AsuranFists_ind + 1
		ShijinSpiral_ind = ShijinSpiral_ind + 1
		VictorySmite_ind = VictorySmite_ind + 1		
        AsceticsFury_ind = AsceticsFury_ind + 1
        ShoulderTackle_ind = ShoulderTackle_ind + 1
		FinalHeaven_ind = FinalHeaven_ind + 1
		SpinningAttack_ind = SpinningAttack_ind + 1
		TornadoKick_ind = TornadoKick_ind + 1
		DragonKick_ind = DragonKick_ind + 1		
        Cataclysm_ind = Cataclysm_ind + 1
		Shattersoul_ind = Shattersoul_ind + 1
        ShellCrusher_ind = ShellCrusher_ind + 1

        if HowlingFist_ind > #sets.HowlingFist.index then HowlingFist_ind = 1 end
        if RagingFists_ind > #sets.RagingFists.index then RagingFists_ind = 1 end
		if AsuranFists_ind > #sets.AsuranFists.index then AsuranFists_ind = 1 end
		if ShijinSpiral_ind > #sets.ShijinSpiral.index then ShijinSpiral_ind = 1 end
		if VictorySmite_ind > #sets.VictorySmite.index then VictorySmite_ind = 1 end		
        if AsceticsFury_ind > #sets.AsceticsFury.index then AsceticsFury_ind = 1 end
        if ShoulderTackle_ind > #sets.ShoulderTackle.index then ShoulderTackle_ind = 1 end
		if FinalHeaven_ind > #sets.FinalHeaven.index then FinalHeaven_ind = 1 end
		if SpinningAttack_ind > #sets.SpinningAttack.index then SpinningAttack_ind = 1 end
        if TornadoKick_ind > #sets.TornadoKick.index then TornadoKick_ind = 1 end
		if DragonKick_ind > #sets.DragonKick.index then DragonKick_ind = 1 end
        if Cataclysm_ind > #sets.Cataclysm.index then Cataclysm_ind = 1 end
		if Shattersoul_ind > #sets.Shattersoul.index then Shattersoul_ind = 1 end
		if ShellCrusher_ind > #sets.ShellCrusher.index then ShellCrusher_ind = 1 end		
        send_command('@input /echo <----- H2H Sets changed to ' .. sets.Resolution.index[Resolution_ind] .. ' ----->')
    elseif command == 'toggle Other WS set' then
		--add when 1h WS are added (if ever)
        send_command('@input /echo <----- Sword/Axe WS Set changed to ' .. sets.SavageBlade.index[SavageBlade_ind] .. ' ----->')
    elseif command == 'toggle CounterTP set' then
        CounterTP_ind = CounterTP_ind + 1
        if CounterTP_ind > #sets.CounterTP.index then CounterTP_ind = 1 end
        send_command('@input /echo <----- CounterTP Set changed to ' .. sets.CounterTP.index[CounterTP_ind] .. ' ----->')
        if player.status == 'Engaged' then
			if buffactive['Impetus'] then
				ChangeGear(sets.CounterTPImpetus[sets.CounterTPImpetus.index[CounterTPImpetus_ind]])							
			else
				ChangeGear(sets.CounterTP[sets.CounterTP.index[CounterTP_ind]])
			end	
			if buffactive['Hundred Fists'] then
				if buffactive['Impetus'] then
					ChangeGear(sets.JA.HundredFistsTPImpetus)
				else
					ChangeGear(sets.JA.HundredFistsTP)
				end
			end
        end
    elseif command == 'toggle CounterTP' then
        if CounterTP == true then
            CounterTP = false
            ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
			send_command('@input /echo <----- Counter TP: [Off] ----->')
        else
            CounterTP = true
			ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
            send_command('@input /echo <----- Counter TP: [On] ----->')
        end
		if buffactive['Hundred Fists'] then
			if buffactive['Impetus'] then
				ChangeGear(sets.JA.HundredFistsTPImpetus)
			else
				ChangeGear(sets.JA.HundredFistsTP)
			end
		end		
        status_change(player.status)
    elseif command == 'toggle H2HTP' then
        if H2HTP == true then
            H2HTP = false
            send_command('@input /echo <----- H2H TP: [Off] ----->')
        else
            H2HTP = true
            ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
			send_command('@input /echo <----- H2H TP: [On] ----->')
        end
		if buffactive['Hundred Fists'] then
			if buffactive['Impetus'] then
				ChangeGear(sets.JA.HundredFistsTPImpetus)
			else
				ChangeGear(sets.JA.HundredFistsTP)
			end
		end		
        status_change(player.status)		
    elseif command == 'toggle SIR' then
        if SIR == true then
            SIR = false
            send_command('@input /echo <----- Spell Interruption Rate: [Off] ----->')
        else
            SIR = true
            send_command('@input /echo <----- Spell Interruption Rate: [On] ----->')
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
        if CounterTP == true then
            CounterTP_ind = CounterTP_ind -1
			CounterTPImpetus_ind = CounterTPImpetus_ind -1
            AM3_ind = AM3_ind -1
            if CounterTP_ind == 0 then
                CounterTP_ind = #sets.CounterTP.index
				CounterTPImpetus_ind = #sets.CounterTPImpetus.index
				AM3_ind = #sets.AM3.index
            end
            send_command('@input /echo <----- CounterTP Set changed to ' .. sets.CounterTP.index[CounterTP_ind] .. ' ----->')
            if player.status == 'Engaged' then
				if buffactive['Impetus'] then
					ChangeGear(sets.CounterTPImpetus[sets.CounterTPImpetus.index[CounterTPImpetus_ind]])							
				else
					ChangeGear(sets.CounterTP[sets.CounterTP.index[CounterTP_ind]])
				end	
				if buffactive['Hundred Fists'] then
					if buffactive['Impetus'] then
						ChangeGear(sets.JA.HundredFistsTPImpetus)
					else
						ChangeGear(sets.JA.HundredFistsTP)
					end
				end				
            end
        elseif CounterTP == false then
            if H2HTP == true then
                H2HTP_ind = H2HTP_ind -1
				H2HTPImpetus_ind = H2HTPImpetus_ind -1
				StaffTP_ind = StaffTP_ind -1
				StaffTPImpetus_ind = StaffTPImpetus_ind -1
                if H2HTP_ind == 0 then
                    H2HTP_ind = #sets.H2HTP.index
					H2HTPImpetus_ind = #sets.H2HTPImpetus.index
					StaffTP_ind = #sets.StaffTP.index
					StaffTPImpetus_ind = #sets.StaffTPImpetus.index
                end
                send_command('@input /echo <----- H2H TP Set changed to ' .. sets.H2HTP.index[H2HTP_ind] .. ' ----->')  
                if player.status == 'Engaged' then
                    if AM3 == true then
                        ChangeGear(sets.AM3[sets.AM3.index[AM3_ind]])
                    elseif H2HTP == true then
                        if StaffWeapons:contains(player.equipment.main) then
							if buffactive['Impetus'] then
								ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
								ChangeGear(sets.StaffTPImpetus[sets.StaffTPImpetus.index[StaffTPImpetus_ind]])							
							else
								ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
								ChangeGear(sets.StaffTP[sets.StaffTP.index[StaffTP_ind]])
							end
						else
							if buffactive['Impetus'] then
								ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
								ChangeGear(sets.H2HTPImpetus[sets.H2HTPImpetus.index[H2HTPImpetus_ind]])							
							else
								ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
								ChangeGear(sets.H2HTP[sets.H2HTP.index[H2HTP_ind]])
							end	
						end
						if buffactive['Hundred Fists'] then
							if buffactive['Impetus'] then
								ChangeGear(sets.JA.HundredFistsTPImpetus)
							else
								ChangeGear(sets.JA.HundredFistsTP)
							end
						end
                    end
                end
            elseif H2HTP == false then
                OneHandedTP_ind = OneHandedTP_ind -1
                if OneHandedTP_ind == 0 then
                    OneHandedTP_ind = #sets.OneHandedTP.index
                end
                if player.status == 'Engaged' then
                    ChangeGear(sets.OneHandedTP[sets.OneHandedTP.index[TP_ind]])
                end
				if buffactive['Hundred Fists'] then
					if buffactive['Impetus'] then
						ChangeGear(sets.JA.HundredFistsTPImpetus)
					else
						ChangeGear(sets.JA.HundredFistsTP)
					end
				end				
            end
        end
    elseif command == 'ZoneChange' then
        IdleState()
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
        ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
    end
       
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
        if CounterTP == true then
            if buffactive["aftermath"] and player.equipment.main == 'Apocalypse' then --aftermath
				AM3 = true
				ChangeGear(sets.AM3[sets.AM3.index[AM3_ind]])				
			else
				if buffactive['Impetus'] then
					ChangeGear(sets.CounterTPImpetus[sets.CounterTPImpetus.index[CounterTPImpetus_ind]])							
				else
					ChangeGear(sets.CounterTP[sets.CounterTP.index[CounterTP_ind]])
				end	
			end  
        elseif H2HTP == true then
            AM3 = false
            if StaffWeapons:contains(player.equipment.main) then
				if buffactive['Impetus'] then
					ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
					ChangeGear(sets.StaffTPImpetus[sets.StaffTPImpetus.index[StaffTPImpetus_ind]])							
				else
					ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
					ChangeGear(sets.StaffTP[sets.StaffTP.index[StaffTP_ind]])
				end
			else
				if buffactive['Impetus'] then
					ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
					ChangeGear(sets.H2HTPImpetus[sets.H2HTPImpetus.index[H2HTPImpetus_ind]])							
				else
					ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
					ChangeGear(sets.H2HTP[sets.H2HTP.index[H2HTP_ind]])
				end	
			end
        else
            AM3 = false
            ChangeGear(sets.OneHandedTP[sets.OneHandedTP.index[OneHandedTP_ind]])
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
    if spell.english == 'Hundred Fists' then
        ChangeGear(sets.JA.HundredFists)
    elseif spell.english == 'Impetus' then
        ChangeGear(sets.JA.Impetus)
    elseif spell.english == 'Souleater' then
        ChangeGear(sets.JA.Souleater)
    elseif spell.english == 'Weapon Bash' then
        ChangeGear(sets.JA.WeaponBash)
    elseif spell.english == 'Arcane Circle' then
        ChangeGear(sets.JA.ArcaneCircle)		
    elseif spell.english == 'Swordplay' then
        ChangeGear(sets.JA.Swordplay)
    elseif spell.english == 'Vallation' or spell.english == 'Valiance' then
        ChangeGear(sets.JA.Vallation)
    elseif spell.english == 'Pflug' then
        ChangeGear(sets.JA.Pflug)		
    elseif spell.english == 'Swipe' then
        ChangeGear(sets.JA.Swipe)
    elseif spell.english == 'Meditate' then
        ChangeGear(sets.JA.Meditate)
    elseif spell.english == 'Provoke' then
        ChangeGear(sets.JA.Provoke)
    elseif spell.english == 'Warcry' then
        ChangeGear(sets.JA.Warcry)
	elseif spell.english == 'Sentinel' then
        ChangeGear(sets.Enmity)
	elseif spell.english == 'Shield Bash' then
        ChangeGear(sets.Enmity)
	elseif spell.english == 'Chakra' then
        ChangeGear(sets.JA.Chakra)
	elseif spell.english == 'Focus' then
        ChangeGear(sets.JA.Focus)
	elseif spell.english == 'Dodge' then
        ChangeGear(sets.JA.Dodge)
	elseif spell.english == 'Counterstance' then
        ChangeGear(sets.JA.Counterstance)
	elseif spell.english == 'Formless Strikes' then
        ChangeGear(sets.JA.FormlessStrikes)
	elseif spell.english == 'Footwork' then
        ChangeGear(sets.JA.Footwork)
	elseif spell.english == 'Mantra' then
        ChangeGear(sets.JA.Mantra)
	elseif spell.english == 'Chi Blast' then
        ChangeGear(sets.JA.ChiBlast)
	elseif spell.english == 'Boost' then
		ChangeGear(sets.JA.Boost)
    end
	
   
    --These spells can't override each other, and must be canceled--
    if spell.name == 'Valiance' or spell.name == 'Vallation' or spell.name == 'Liement' then
        if buffactive['Valiance'] then
            cast_delay(0.2)
            windower.ffxi.cancel_buff(535)
        elseif buffactive['Vallation'] then
            cast_delay(0.2)
            windower.ffxi.cancel_buff(531)
        elseif buffactive['Liement'] then
            cast_delay(0.2)
            windower.ffxi.cancel_buff(537)
        end
    end
 
    IgnoreWS = S {"Asuran Fists"}  -- Excluded from Moonshade TP override rule.
    BrutalWS = S {"Raging Fists"}
    STRWS = S {"Combo"} -- Just uses the Resolution Set
   
   
    if spell.type == 'WeaponSkill' then
        if spell.english == 'Howling Fist' then
            ChangeGear(sets.HowlingFist[sets.HowlingFist.index[HowlingFist_ind]])
        elseif spell.english == 'Asuran Fists' then
            ChangeGear(sets.AsuranFists[sets.AsuranFists.index[AsuranFists_ind]])
        elseif spell.english == 'Cataclysm' then
            if (world.weather_element == 'Dark' or world.day_element == 'Dark' or buffactive['Voidstorm']) then	
				ChangeGear(sets.Cataclysm[sets.Cataclysm.index[Catamclysm_ind]], {waist="Hachirin-no-Obi"})
			else	
				ChangeGear(sets.Cataclysm[sets.Cataclysm.index[Cataclysm_ind]])
			end  		
        elseif spell.english == 'Raging Fists' then
            ChangeGear(sets.RagingFists[sets.RagingFists.index[RagingFists_ind]])
        elseif spell.english == 'Shijin Spiral' then
            ChangeGear(sets.ShijinSpiral[sets.ShijinSpiral.index[ShijinSpiral_ind]])
        elseif spell.english == 'Spinning Attack' then
            ChangeGear(sets.SpinningAttack[sets.SpinningAttack.index[SpinningAttack_ind]])			
        elseif spell.english == 'Victory Smite' then
			if buffactive['Impetus'] then
				ChangeGear(sets.VictorySmite.Impetus)
			else
				ChangeGear(sets.VictorySmite[sets.VictorySmite.index[VictorySmite_ind]])
			end	
        elseif spell.english == "Ascetic's Fury" then
			if buffactive['Impetus'] then
				ChangeGear(sets.AsceticsFury.Impetus)
			else		
				ChangeGear(sets.AsceticsFury[sets.AsceticsFury.index[AsceticsFury_ind]])
			end
        elseif spell.english == 'Final Heaven' then
            ChangeGear(sets.FinalHeaven[sets.FinalHeaven.index[FinalHeaven_ind]])	
        elseif spell.english == 'Shattersoul' then
			ChangeGear(sets.Shattersoul[sets.Shattersoul.index[Shattersoul_ind]])
        elseif spell.english == 'Shell Crusher' then
			ChangeGear(sets.ShellCrusher[sets.ShellCrusher.index[ShellCrusher_ind]])			
        elseif spell.english == 'Shoulder Tackle' then
			ChangeGear(sets.ShoulderTackle[sets.ShoulderTackle.index[ShoulderTackle_ind]])	
        elseif spell.english == 'Tornado Kick' then
			ChangeGear(sets.TornadoKick[sets.TornadoKick.index[TornadoKick_ind]])
        elseif spell.english == 'Dragon Kick' then
			ChangeGear(sets.DragonKick[sets.DragonKick.index[DragonKick_ind]])			
        end
        if player.tp > 2025 and player.equipment.main == 'Anguta' and buffactive['TP Bonus'] then
            if IgnoreWS:contains(spell.english) then
                do return end
            elseif BrutalWS:contains(spell.english) then
                equip(set_combine(equipSet, { ear1 = "Brutal Earring" })) --Watch for ear conflicts between TP sets and WS sets
                msg("Brutal Earring equiped !!!!")
            else
                equip(set_combine(equipSet, { ear1 = "Ishvara Earring" }))
                msg("Ishvara Earring equiped !!!!")
            end
        elseif player.tp > 2275 and player.equipment.main == 'Anguta' then
            if IgnoreWS:contains(spell.english) then
                do return end
            elseif BrutalWS:contains(spell.english) then
                equip(set_combine(equipSet, { ear1 = "Brutal Earring" })) --Watch for ear conflicts between TP sets and WS sets
                msg("Brutal Earring equiped !!!!")
            else
                equip(set_combine(equipSet, { ear1 = "Ishvara Earring" }))
                msg("Ishvara Earring equiped !!!!")
            end
        elseif player.tp > 2550 and buffactive['TP Bonus'] then
            if IgnoreWS:contains(spell.english) then
                do return end
            elseif BrutalWS:contains(spell.english) then
                equip(set_combine(equipSet, { ear1 = "Brutal Earring" })) --Watch for ear conflicts between TP sets and WS sets
                msg("Brutal Earring equiped !!!!")
            else
                equip(set_combine(equipSet, { ear1 = "Ishvara Earring" }))
                msg("Ishvara Earring equiped !!!!")
            end
        elseif player.tp > 2775 then
            if IgnoreWS:contains(spell.english) then
                do return end
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
        ChangeGear(set_combine(sets.H2HTP.AccuracyFull, sets.Utility.TH))
    elseif spell.english == 'Animated Flourish' then
        ChangeGear(sets.Enmity)
    end
end
 
function pc_Magic(spell, act)
    if (spell.skill == 'Dark Magic' or spell.skill == 'Enfeebling Magic') then
        ChangeGear(sets.precast.FastCast.Standard)
	elseif spell.skill == 'Elemental Magic' then
		if spell.english == 'Impact' then
			ChangeGear(sets.precast.FastCast.Impact)
		else
			ChangeGear(sets.precast.FastCast.Standard)
		end	
	else
		ChangeGear(sets.precast.FastCast.Standard)
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
    if BlueMagic_Enmity:contains(spell.english) then
        ChangeGear(sets.Enmity)
	elseif BlueMagic_AoEEnmity:contains(spell.english) then
        ChangeGear(sets.SIR)
    elseif BlueMagic_Buffs:contains(spell.english) then
        ChangeGear(sets.CounterTP.Tank)
    elseif PhysicalSpells:contains(spell.english) then
        ChangeGear(sets.BlueMagic.STR)
    elseif BlueMagic_Healing:contains(spell.english) then
        if spell.target and spell.target.type == 'SELF' then
            ChangeGear(sets.Cures.SelfCures)
        else
            ChangeGear(sets.Cures)
        end
    elseif RUNMagic_Enmity:contains(spell.english) then
        ChangeGear(sets.Enmity)
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
   
    if S{1,4,6,7,8,10,12}:contains(gearswap.res.items:with('en', player.equipment.main).skill) then --Checks mainhand weapon for TP set choice. See below for notes on #s
        H2HTP = true
	else
        H2HTP = false
    end
   
end
 
--Numbers in the 1H 2H TP mode rule:
--1 = Hand-to-Hand
--2 = Dagger
--3 = Sword
--4 = Great Sword
--5 = Axe
--6 = Great Axe
--7 = Scythe
--8 = Polearm
--9 = Katana
--10 = Great Katana
--11 = Club
--12 = Staff
 
 
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
end
 
function midcast(spell, act)
    IgnoreSIRSpell = S { "Phalanx", "Temper", "Refresh", "Regen"}  -- Excluded from Spell Interruption Rate override rule.
    if spell.action_type == 'Ability' then
        mc_JA(spell, act)
    elseif spell.action_type == 'Magic' then
        if SIR == true then
            if IgnoreSIRSpell:contains(spell.english) and not string.find(spell.english,'Bar') then
                mc_Magic(spell, act)
            else
                ChangeGear(sets.SIR)
            end
        else
            mc_Magic(spell, act)
        end
    else
        mc_Item(spell, act)
    end
end
 
function aftercast(spell, act)
    if spell.action_type == 'Ability' then
		if spell.name == 'Boost' then
		else
			ac_JA(spell)
		end
    elseif spell.action_type == 'Magic' then
        ac_Magic(spell)
    else
        ac_Item(spell)
    end
    ac_Global()
   
    --Countdowns--
    if not spell.interrupted then
        if spell.english == "Meditate" then
            send_command('wait 170;gs c -cd '..spell.name..': [Ready In 10 Seconds!];wait 10;gs c -cd '..spell.name..': [Ready !]')
        elseif spell.english == "Sekkanoki" then
            send_command('wait 290;gs c -cd '..spell.name..': [Ready In 10 Seconds!];wait 10;gs c -cd '..spell.name..': [Ready !]')
        elseif spell.english == "Swordplay" then
            send_command('wait 290;gs c -cd '..spell.name..': [Ready In 10 Seconds!];wait 10;gs c -cd '..spell.name..': [Ready !]')
        elseif spell.english == "One for All" then
            send_command('wait 290;gs c -cd '..spell.name..': [Ready In 10 Seconds!];wait 10;gs c -cd '..spell.name..': [Ready !]')
        elseif spell.english == "Battuta" then
            send_command('wait 290;gs c -cd '..spell.name..': [Ready In 10 Seconds!];wait 10;gs c -cd '..spell.name..': [Ready !]')
        elseif spell.english == "Liement" then
            send_command('wait 170;gs c -cd '..spell.name..': [Ready In 10 Seconds!];wait 10;gs c -cd '..spell.name..': [Ready !]')
        end
    end
   
    if S{1,4,6,7,8,10,12}:contains(gearswap.res.items:with('en', player.equipment.main).skill) then --Checks mainhand weapon for TP set choice. See bottom for notes on #s
        H2HTP = true
	else
        H2HTP = false
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