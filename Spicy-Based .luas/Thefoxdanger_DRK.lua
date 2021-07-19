--Built off of Spicy's BLU and RUN GS
--------------------------------------------------------------------------------------------------
--Instructions below for the prior RUN lua still function as expected for this new DRK lua (tanking TP sets have been replaced by Scythe TP sets)
--This lua starts off defaulted in tanking TP gear. Press alt + F8 or the following macro to disable tanking TP mode:
---/console gs c toggle ScytheTP
 
--Once that is taken off you will automatically be placed back in the TP set index. If you were previously in a set and put tanking gear back on it will resume the previous set in the index.
---Sets between 1H and 2H weapons are automatically activated after the tanking TP set is off, based on your equiped weapon. 2H weapons get the 2HTP sets and 1H the 1H set. Weapons cycle using win+E.
----This occasionally throws an error for the rule somewhere around line 1871 depending on what you edit, when you first load the lua. I have never bothered to address this bug as it doesnt impact anything.
 
--Pressing F9 (or a macro, similar to above for tanking) will toggle the currently active set. If tanking is on F9 will toggle tanking TP and ignore the other sets. If 1H TP is active F9 will toggle that and nothing else.
---If 2H TP is active then it will toggle that and AM for Apoc, and vice versa.
 
--Alt + F9 will cycle backwards, F9 just cycles fowards. Useful for pressing buttons once instead of 3 times to cycle one set backwards.
 
--You may cycle tanking TP with alt + f7 regardless of which TPing mode is active. This is useful for using tanking TP sets like MDT or magic evasion as DT sets while DDing with alt + f8 to equip the tanking set back on.
 
 
--Augmented Gear--
 
function get_sets()
    maps()
   
	Ankou = {}
	Ankou.TP = { name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	Ankou.Mag = { name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}
	Ankou.Torc = { name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+9','Weapon skill damage +10%',}}
	Ankou.WSD = { name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	Ankou.Reso = { name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}
	
	ValorousHead = {}
	ValorousHead.TP = { name="Valorous Mask", augments={'"Mag.Atk.Bns."+22','Phys. dmg. taken -3%','Quadruple Attack +2','Accuracy+17 Attack+17',}}
	
	ValorousBody = {}
	
	OdysseanHands = {}
	OdysseanHands.WSD = { name="Odyssean Gauntlets", augments={'Pet: "Dbl.Atk."+2 Pet: Crit.hit rate +2','"Occult Acumen"+7','Weapon skill damage +8%','Accuracy+12 Attack+12','Mag. Acc.+15 "Mag.Atk.Bns."+15',}}
	
	ValorousHands = {}
	ValorousHands.TP = { name="Valorous Mitts", augments={'Pet: "Mag.Atk.Bns."+19','MND+2','Quadruple Attack +3','Accuracy+12 Attack+12',}}
	
	ValorousLegs = {}
	ValorousLegs.TP = { name="Valorous Hose", augments={'DEX+1','"Store TP"+5','Quadruple Attack +1','Accuracy+11 Attack+11','Mag. Acc.+13 "Mag.Atk.Bns."+13',}}
	
	ValorousFeet = {}
	ValorousFeet.TP = { name="Valorous Greaves", augments={'Sklchn.dmg.+1%','Enmity+5','Quadruple Attack +3','Mag. Acc.+16 "Mag.Atk.Bns."+16',}}
	ValorousFeet.WSD = { name="Valorous Greaves", augments={'"Cure" potency +5%','Accuracy+29','Weapon skill damage +9%','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}
	
	
------End of Augmented Gear-----------------------------------------------------------------------------------------------------------------------------
	--Weapon Toggle sets will go here (GSWD / DW / Single)
	sets.Weapon = {}
    sets.Weapon.index = { 'ZantetsukenX', 'Lycurgos', 'Drepanum', 'SavageTernion', 'DoliTernion', 'SavageFencer', 'DoliFencer' }
    Weapon_ind = 1	
	
	sets.Weapon.ZantetsukenX = {main='Zantetsuken X', sub='Utu Grip'}
	sets.Weapon.Lycurgos = {main='Lycurgos', sub='Utu Grip'}
	sets.Weapon.Drepanum = {main='Drepanum', sub='Utu Grip'}
	sets.Weapon.SavageTernion = {main='Naegling', sub='Ternion Dagger +1'}
	sets.Weapon.DoliTernion = {main='Dolichenus', sub='Ternion Dagger +1'}
	sets.Weapon.SavageFencer = {main='Naegling', sub='Blurred Shield +1'}
	sets.Weapon.DoliFencer = {main='Dolichenus', sub='Blurred Shield +1'}	

    --Idle Sets--
    sets.Idle = {}
    sets.Idle.index = { 'DT', 'Kite' }
    Idle_ind = 1
    sets.Idle.DT = {
		ammo = "Staunch Tathlum +1", -- 0/0/3
        head = "Sakpata's Helm", -- 0/0/7
        neck = "Warder's Charm +1", 
        ear1 = "Eabani Earring", 
        ear2 = "Sanare Earring",
        body = "Sakpata's Breastplate", -- 0/0/10
        hands = "Macabre Gauntlets +1", -- 4/0/0
        ring1 = "Vengeful Ring", 
        ring2 = "Purity Ring", -- 0/4/0
        back = Ankou.TP, -- 10/0/0
        waist = "Carrier's Sash",
        legs = "Sakpata's Cuisses", -- 0/0/9
        feet = "Sakpata's Leggings" -- 0/0/6
    } -- 14/4/35
	
    sets.Idle.Kite = {	
		ammo = "Staunch Tathlum +1", -- 0/0/3
        head = "Sakpata's Helm", -- 0/0/7
        neck = "Warder's Charm +1", 
        ear1 = "Eabani Earring", 
        ear2 = "Sanare Earring",
        body = "Sakpata's Breastplate", -- 0/0/10
        hands = "Macabre Gauntlets +1", -- 4/0/0
        ring1 = "Defending Ring", --0/0/10 
        ring2 = "Purity Ring", -- 0/4/0
        back = Ankou.TP, -- 10/0/0
        waist = "Carrier's Sash",
        legs = "Carmine Cuisses +1",
        feet = "Sakpata's Leggings" -- 0/0/6
    } -- 14/4/36
	
	sets.Idle.Town = {
		ammo = "Staunch Tathlum +1", -- 0/0/3
        head = "Sakpata's Helm", -- 0/0/7
        neck = "Warder's Charm +1", 
        ear1 = "Eabani Earring", 
        ear2 = "Sanare Earring",
        body = "Sakpata's Breastplate", -- 0/0/10
        hands = "Macabre Gauntlets +1", -- 4/0/0
        ring1 = "Defending Ring", --0/0/10 
        ring2 = "Purity Ring", -- 0/4/0
        back = Ankou.TP, -- 10/0/0
        waist = "Carrier's Sash",
        legs = "Carmine Cuisses +1",
        feet = "Sakpata's Leggings" -- 0/0/6
    } -- 14/4/36

 
-------TP Sets-------------------------------------------
   
    ---------------------
    --OneHanded TP Sets--
    ---------------------
   
    sets.OneHandedTP = {}
    sets.OneHandedTP.index = { 'DualWield', 'CappedHaste' }
    OneHandedTP_ind = 1

	--Will need to manually equip these weapons until toggle is implemented
    --LR will not provide JA haste when Dual Wield or Single Wield
	sets.OneHandedTP.DualWield = {
		ammo = "Coiste Bodhar",
        head = "Flamma Zucchetto +2",
        neck = "Vim Torque +1",
        ear1 = "Suppanomimi",
        ear2 = "Eabani Earring",
        body = "Dagon Breastplate",
        hands = ValorousHands.TP,
        ring1 = "Hetairoi Ring",
        ring2 = "Niqmaddu Ring",
        back = Ankou.TP,
        waist = "Sailfi Belt +1",
        legs = ValorousLegs.TP,
        feet = "Flamma Gambieras +2"
    } 
   
    sets.OneHandedTP.CappedHaste = {
		ammo = "Coiste Bodhar",
        head = "Flamma Zucchetto +2",
        neck = "Vim Torque +1",
        ear1 = "Cessance Earring",
        ear2 = "Brutal Earring",
        body = "Dagon Breastplate",
        hands = ValorousHands.TP,
        ring1 = "Hetairoi Ring",
        ring2 = "Niqmaddu Ring",
        back = Ankou.TP,
        waist = "Sailfi Belt +1",
        legs = ValorousLegs.TP,
        feet = "Flamma Gambieras +2"
    } 

   
    ---------------------
    --Greatsword TP Sets--
    ---------------------
    
    sets.GreatswordTP = {}
    sets.GreatswordTP.index = { 'CappedHaste', 'DT', 'AccuracyFull', 'SubtleBlow' } --keep the same number of sets as greataxe
    GreatswordTP_ind = 1
	
    sets.GreatswordTP.CappedHaste = {
		ammo = "Coiste Bodhar",
        head = "Flamma Zucchetto +2",
        neck = "Vim Torque +1",
        ear1 = "Cessance Earring",
        ear2 = "Brutal Earring",
        body = "Dagon Breastplate",
        hands = ValorousHands.TP,
        ring1 = "Hetairoi Ring",
        ring2 = "Niqmaddu Ring",
        back = Ankou.TP,
        waist = "Windbuffet Belt +1",
        legs = ValorousLegs.TP,
        feet = "Flamma Gambieras +2"
    } 

    sets.GreatswordTP.DT = {
		ammo = "Coiste Bodhar",
        head = "Sakpata's Helm",
        neck = "Abyssal Bead Necklace +1",
        ear1 = "Telos Earring",
        ear2 = "Dedition Earring",
        body = "Sakpata's Breastplate",
        hands = "Acro Gauntlets",
        ring1 = "Chirich Ring",
        ring2 = "Chirich Ring",
        back = Ankou.TP,
        waist = "Sailfi Belt +1",
        legs = "Sakpata's Cuisses",
        feet = "Sakpata's Leggings"
    } 	

    sets.GreatswordTP.AccuracyFull = {
		ammo = "Coiste Bodhar",
        head = "Flamma Zucchetto +2",
        neck = "Abyssal Bead Necklace +1",
        ear1 = "Telos Earring",
        ear2 = "Mache Earring +1",
        body = "Sakpata's Breastplate",
        hands = "Flamma Manopolas +2",
        ring1 = "Flamma Ring",
        ring2 = "Niqmaddu Ring",
        back = Ankou.TP,
        waist = "Windbuffet Belt +1",
        legs = "Sakpata's Cuisses",
        feet = "Flamma Gambieras +2"
    }
	
    sets.GreatswordTP.SubtleBlow = {
		ammo = "Coiste Bodhar",
        head = "Sakpata's Helm",
        neck = "Bathy Choker +1",
        ear1 = "Telos Earring",
        ear2 = "Dignitary's Earring",
        body = "Sacro Breastplate",
        hands = "Sakpata's Gauntlets",
        ring1 = "Defending Ring",
        ring2 = "Niqmaddu Ring",
        back = Ankou.TP,
        waist = "Sailfi Belt +1",
        legs = "Sakpata's Cuisses",
        feet = "Sakpata's Leggings"
    }	
	
    sets.GreatswordTPLR = {}
    sets.GreatswordTPLR.index = { 'CappedHaste', 'DT', 'AccuracyFull', 'SubtleBlow' } --keep the same number of sets as greataxe
    GreatswordTPLR_ind = 1	
	
    sets.GreatswordTPLR.CappedHaste = {
		ammo = "Coiste Bodhar",
        head = "Flamma Zucchetto +2",
        neck = "Vim Torque +1",
        ear1 = "Cessance Earring",
        ear2 = "Brutal Earring",
        body = "Dagon Breastplate",
        hands = ValorousHands.TP,
        ring1 = "Hetairoi Ring",
        ring2 = "Niqmaddu Ring",
        back = Ankou.TP,
        waist = "Windbuffet Belt +1",
        legs = ValorousLegs.TP,
        feet = "Flamma Gambieras +2"
    } 

    sets.GreatswordTPLR.DT = {
		ammo = "Coiste Bodhar",
        head = "Sakpata's Helm",
        neck = "Vim Torque +1",
        ear1 = "Telos Earring",
        ear2 = "Dedition Earring",
        body = "Sakpata's Breastplate",
        hands = "Acro Gauntlets",
        ring1 = "Chirich Ring",
        ring2 = "Chirich Ring",
        back = Ankou.TP,
        waist = "Sailfi Belt +1",
        legs = "Sakpata's Cuisses",
        feet = "Sakpata's Leggings"
    } 	

    sets.GreatswordTPLR.AccuracyFull = {
		ammo = "Coiste Bodhar",
        head = "Flamma Zucchetto +2",
        neck = "Abyssal Bead Necklace +1",
        ear1 = "Telos Earring",
        ear2 = "Mache Earring +1",
        body = "Sakpata's Breastplate",
        hands = "Sakpata's Gauntlets",
        ring1 = "Flamma Ring",
        ring2 = "Niqmaddu Ring",
        back = Ankou.TP,
        waist = "Windbuffet Belt +1",
        legs = "Sakpata's Cuisses",
        feet = "Flamma Gambieras +2"
    }
	
    sets.GreatswordTPLR.SubtleBlow = {
		ammo = "Coiste Bodhar",
        head = "Sakpata's Helm",
        neck = "Bathy Choker +1",
        ear1 = "Telos Earring",
        ear2 = "Dignitary's Earring",
        body = "Dagon Breastplate",
        hands = "Sakpata's Gauntlets",
        ring1 = "Chirich Ring",
        ring2 = "Niqmaddu Ring",
        back = Ankou.TP,
        waist = "Sailfi Belt +1",
        legs = "Sakpata's Cuisses",
        feet = "Fallen's Sollerets +3"
    }	
	
    ---------------------
    --Greataxe TP Sets--
    ---------------------
    
    sets.GreataxeTP = {}
    sets.GreataxeTP.index = { 'CappedHaste', 'DT', 'AccuracyFull', 'SubtleBlow' } --keep the same number of sets as greatsword
    GreataxeTP_ind = 1
	
    sets.GreataxeTP.CappedHaste = {
		ammo = "Coiste Bodhar",
        head = "Flamma Zucchetto +2",
        neck = "Vim Torque +1",
        ear1 = "Cessance Earring",
        ear2 = "Brutal Earring",
        body = "Dagon Breastplate",
        hands = ValorousHands.TP,
        ring1 = "Hetairoi Ring",
        ring2 = "Niqmaddu Ring",
        back = Ankou.TP,
        waist = "Sailfi Belt +1",
        legs = ValorousLegs.TP,
        feet = "Flamma Gambieras +2"
    } 
	
    sets.GreataxeTP.DT = {
		ammo = "Coiste Bodhar",
        head = "Sakpata's Helm",
        neck = "Abyssal Bead Necklace +1",
        ear1 = "Cessance Earring",
        ear2 = "Dedition Earring",
        body = "Sakpata's Breastplate",
        hands = "Acro Gauntlets",
        ring1 = "Chirich Ring",
        ring2 = "Chirich Ring",
        back = Ankou.TP,
        waist = "Sailfi Belt +1",
        legs = "Sakpata's Cuisses",
        feet = "Sakpata's Leggings"
    } 	

    sets.GreataxeTP.AccuracyFull = {
		ammo = "Coiste Bodhar",
        head = "Flamma Zucchetto +2",
        neck = "Abyssal Bead Necklace +1",
        ear1 = "Telos Earring",
        ear2 = "Mache Earring +1",
        body = "Sakpata's Breastplate",
        hands = "Flamma Manopolas +2",
        ring1 = "Flamma Ring",
        ring2 = "Niqmaddu Ring",
        back = Ankou.TP,
        waist = "Sailfi Belt +1",
        legs = "Sakpata's Cuisses",
        feet = "Flamma Gambieras +2"
    }	
	
    sets.GreataxeTP.SubtleBlow = {
		ammo = "Coiste Bodhar",
        head = "Sakpata's Helm",
        neck = "Bathy Choker +1",
        ear1 = "Telos Earring",
        ear2 = "Dignitary's Earring",
        body = "Sacro Breastplate",
        hands = "Sakpata's Gauntlets",
        ring1 = "Defending Ring",
        ring2 = "Niqmaddu Ring",
        back = Ankou.TP,
        waist = "Sailfi Belt +1",
        legs = "Sakpata's Cuisses",
        feet = "Sakpata's Leggings"
    }		

    sets.GreataxeTPLR = {}
    sets.GreataxeTPLR.index = { 'CappedHaste', 'DT', 'AccuracyFull', 'SubtleBlow' } --keep the same number of sets as greatsword
    GreataxeTPLR_ind = 1

    sets.GreataxeTPLR.CappedHaste = {
		ammo = "Coiste Bodhar",
        head = "Flamma Zucchetto +2",
        neck = "Vim Torque +1",
        ear1 = "Cessance Earring",
        ear2 = "Brutal Earring",
        body = "Sakpata's Breastplate",
        hands = ValorousHands.TP,
        ring1 = "Hetairoi Ring",
        ring2 = "Niqmaddu Ring",
        back = Ankou.TP,
        waist = "Sailfi Belt +1",
        legs = ValorousLegs.TP,
        feet = "Flamma Gambieras +2"
    } 
	
    sets.GreataxeTPLR.DT = {
		ammo = "Coiste Bodhar",
        head = "Sakpata's Helm",
        neck = "Abyssal Bead Necklace +1",
        ear1 = "Cessance Earring",
        ear2 = "Dedition Earring",
        body = "Sakpata's Breastplate",
        hands = "Acro Gauntlets",
        ring1 = "Chirich Ring",
        ring2 = "Chirich Ring",
        back = Ankou.TP,
        waist = "Sailfi Belt +1",
        legs = "Sakpata's Cuisses",
        feet = "Sakpata's Leggings"
    } 	

    sets.GreataxeTPLR.AccuracyFull = {
		ammo = "Coiste Bodhar",
        head = "Flamma Zucchetto +2",
        neck = "Abyssal Bead Necklace +1",
        ear1 = "Telos Earring",
        ear2 = "Mache Earring +1",
        body = "Sakpata's Breastplate",
        hands = "Flamma Manopolas +2",
        ring1 = "Flamma Ring",
        ring2 = "Niqmaddu Ring",
        back = Ankou.TP,
        waist = "Sailfi Belt +1",
        legs = "Sakpata's Cuisses",
        feet = "Flamma Gambieras +2"
    }
	
    sets.GreataxeTPLR.SubtleBlow = {
		ammo = "Coiste Bodhar",
        head = "Sakpata's Helm",
        neck = "Bathy Choker +1",
        ear1 = "Telos Earring",
        ear2 = "Dignitary's Earring",
        body = "Dagon Breastplate",
        hands = "Sakpata's Gauntlets",
        ring1 = "Chirich Ring",
        ring2 = "Niqmaddu Ring",
        back = Ankou.TP,
        waist = "Sailfi Belt +1",
        legs = "Sakpata's Cuisses",
        feet = "Fallen's Sollerets +3"
    }	
   
    -------------------
    --Scythe TP Sets--
    -------------------
   
    sets.ScytheTP = {}
    sets.ScytheTP.index = { 'Tank', 'Meva', 'Normal', 'SubtleBlow' }
    ScytheTP_ind = 1

	sets.ScytheTP.Tank = {
		main= "Apocalypse",
		sub = "Utu Grip",
		ammo = "Coiste Bodhar",
        head = "Sakpata's Helm",
        neck = "Abyssal Bead Necklace +1",
        ear1 = "Cessance Earring",
        ear2 = "Dedition Earring",
        body = "Sakpata's Breastplate",
        hands = "Acro Gauntlets",
        ring1 = "Defending Ring",
        ring2 = "Niqmaddu Ring",
        back = Ankou.TP,
        waist = "Sailfi Belt +1",
        legs = "Sakpata's Cuisses",
        feet = "Sakpata's Leggings"
    } 
	  
    sets.ScytheTP.Meva = {
		main= "Apocalypse",
		sub = "Utu Grip",
		ammo = "Staunch Tathlum +1",
        head = "Sakpata's Helm",
        neck = "Abyssal Bead Necklace +1",
        ear1 = "Telos Earring",
        ear2 = "Odnowa Earring +1",
        body = "Sakpata's Breastplate",
        hands = "Acro Gauntlets",
        ring1 = "Defending Ring",
        ring2 = "Niqmaddu Ring",
        back = Ankou.TP,
        waist = "Carrier's Sash",
        legs = "Sakpata's Cuisses",
        feet = "Sakpata's Leggings"
    } 
	  
    sets.ScytheTP.Normal = {
		main= "Apocalypse",
		sub = "Utu Grip",
		ammo = "Coiste Bodhar",
        head = "Flamma Zucchetto +2",
        neck = "Vim Torque +1",
        ear1 = "Cessance Earring",
        ear2 = "Brutal Earring",
        body = "Sakpata's Breastplate",
        hands = ValorousHands.TP,
        ring1 = "Hetairoi Ring",
        ring2 = "Niqmaddu Ring",
        back = Ankou.TP,
        waist = "Windbuffet Belt +1",
        legs = ValorousLegs.TP,
        feet = "Flamma Gambieras +2"
    } 
	
    sets.ScytheTP.SubtleBlow = {
		main= "Apocalypse",
		sub = "Utu Grip",		
		ammo = "Coiste Bodhar",
        head = "Flamma Zucchetto +2",
        neck = "Bathy Choker +1",
        ear1 = "Telos Earring",
        ear2 = "Dignitary's Earring",
        body = "Sacro Breastplate",
        hands = "Sakpata's Gauntlets",
        ring1 = "Chirich Ring",
        ring2 = "Chirich Ring",
        back = Ankou.TP,
        waist = "Sailfi Belt +1",
        legs = "Sakpata's Cuisses",
        feet = "Flamma Gambieras +2"
    }	
	
    sets.ScytheTPLR = {}
    sets.ScytheTPLR.index = { 'Tank', 'Meva', 'Normal', 'SubtleBlow' }
    ScytheTPLR_ind = 1	
	
	sets.ScytheTPLR.Tank = {
		main= "Apocalypse",
		sub = "Utu Grip",
		ammo = "Coiste Bodhar",
        head = "Sakpata's Helm",
        neck = "Abyssal Bead Necklace +1",
        ear1 = "Cessance Earring",
        ear2 = "Dedition Earring",
        body = "Sakpata's Breastplate",
        hands = "Acro Gauntlets",
        ring1 = "Defending Ring",
        ring2 = "Niqmaddu Ring",
        back = Ankou.TP,
        waist = "Wndbuffet Belt +1",
        legs = "Sakpata's Cuisses",
        feet = "Sakpata's Leggings"
    } 
	  
    sets.ScytheTPLR.Meva = {
		main= "Apocalypse",
		sub = "Utu Grip",
		ammo = "Staunch Tathlum +1",
        head = "Sakpata's Helm",
        neck = "Abyssal Bead Necklace +1",
        ear1 = "Telos Earring",
        ear2 = "Odnowa Earring +1",
        body = "Sakpata's Breastplate",
        hands = "Acro Gauntlets",
        ring1 = "Defending Ring",
        ring2 = "Niqmaddu Ring",
        back = Ankou.TP,
        waist = "Carrier's Sash",
        legs = "Sakpata's Cuisses",
        feet = "Sakpata's Leggings"
    } 
	  
    sets.ScytheTPLR.Normal = {
		main= "Apocalypse",
		sub = "Utu Grip",
		ammo = "Coiste Bodhar",
        head = "Sakpata's Helm",
        neck = "Vim Torque +1",
        ear1 = "Cessance Earring",
        ear2 = "Brutal Earring",
        body = "Sakpata's Breastplate",
        hands = ValorousHands.TP,
        ring1 = "Hetairoi Ring",
        ring2 = "Niqmaddu Ring",
        back = Ankou.TP,
        waist = "Windbuffet Belt +1",
        legs = ValorousLegs.TP,
        feet = "Flamma Gambieras +2"
    }
	
    sets.ScytheTPLR.SubtleBlow = {
		main= "Apocalypse",
		sub = "Utu Grip",
		ammo = "Coiste Bodhar",
        head = "Sulevia's Mask +2",
        neck = "Bathy Choker +1",
        ear1 = "Telos Earring",
        ear2 = "Dignitary's Earring",
        body = "Dagon Breastplate",
        hands = "Sakpata's Gauntlets",
        ring1 = "Chirich Ring",
        ring2 = "Niqmaddu Ring",
        back = Ankou.TP,
        waist = "Sailfi Belt +1",
        legs = "Sulevia's Cuisses +2",
        feet = "Fallen's Sollerets +3"
    }	


    -------------------
    --AM3 TP Sets--
    -------------------
   
    sets.AM3 = {}
    sets.AM3.index = { 'Tank', 'Meva', 'Normal', 'SubtleBlow' }
    AM3_ind = 1 -- In the same rule as the Scythe TP Toggle so it toggles it at the same time
 
	--20% JA Haste w/ Hasso
	--Intended to cap w/o Hasso (Seigan/TE, /drg, etc)
    sets.AM3.Tank = set_combine(sets.ScytheTP.Tank, {
		main= "Apocalypse",
		ammo = "Coiste Bodhar",
        head = "Sakpata's Helm",
        neck = "Abyssal Bead Necklace +1",
        ear1 = "Cessance Earring",
        ear2 = "Dedition Earring",
        body = "Sakpata's Breastplate",
        hands = "Acro Gauntlets",
        ring1 = "Defending Ring",
        ring2 = "Niqmaddu Ring",
        back = Ankou.TP,
        waist = "Wndbuffet Belt +1",
        legs = "Sakpata's Cuisses",
        feet = "Sakpata's Leggings"	
	})
 
	--20% JA Haste w/ Hasso
	--Intended to cap w/o Hasso (Seigan/TE, /drg, etc)
    sets.AM3.Meva = set_combine(sets.ScytheTP.Meva, {
		main= "Apocalypse",
		ammo = "Staunch Tathlum +1",
        head = "Sakpata's Helm",
        neck = "Abyssal Bead Necklace +1",
        ear1 = "Telos Earring",
        ear2 = "Odnowa Earring +1",
        body = "Sakpata's Breastplate",
        hands = "Flamma Manopolas +2",
        ring1 = "Moonbeam Ring",
        ring2 = "Niqmaddu Ring",
        back = Ankou.TP,
        waist = "Carrier's Sash",
        legs = "Sakpata's Cuisses",
        feet = "Sakpata's Leggings"	
	})

	--20% JA Haste w/ Hasso
	--Assumes Hasso is used since not the focus of target
    sets.AM3.Normal = set_combine(sets.ScytheTP.Normal, {
		main= "Apocalypse",
		ammo = "Coiste Bodhar",
        head = "Sakpata's Helm",
        neck = "Vim Torque +1",
        ear1 = "Cessance Earring",
        ear2 = "Brutal Earring",
        body = "Sakpata's Breastplate",
        hands = ValorousHands.TP,
        ring1 = "Flamma Ring",
        ring2 = "Niqmaddu Ring",
        back = Ankou.TP,
        waist = "Sailfi Belt +1",
        legs = ValorousLegs.TP,
        feet = "Flamma Gambieras +2"	
	})

    sets.AM3.SubtleBlow = {
		ammo = "Coiste Bodhar",
        head = "Sulevia's Mask +2",
        neck = "Bathy Choker +1",
        ear1 = "Telos Earring",
        ear2 = "Dignitary's Earring",
        body = "Dagon Breastplate",
        hands = "Sakpata's Gauntlets",
        ring1 = "Chirich Ring",
        ring2 = "Niqmaddu Ring",
        back = Ankou.TP,
        waist = "Sailfi Belt +1",
        legs = "Sulevia's Cuisses +2",
        feet = "Fallen's Sollerets +3"
    }	

	
------End of TP--------------------------------------------------------------------------------------------------------------------
    --WS Sets--
    sets.WS = {}

	--Sword
    sets.Requiescat = {}
 
    sets.Requiescat.index = { 'Attack', 'Accuracy' }
    Requiescat_ind = 1
 
    sets.Requiescat.Attack = {
		ammo="Coiste Bodhar",
		head="Sakpata's Helm", 
		neck="Fotia Gorget",
		ear1="Cessance Earring", 
		ear2="Moonshade Earring",		
		body="Sakpata's Breastplace",
		hands="Sakpata's Gauntlets",		
		ring1="Regal Ring", 
		ring2="Niqmaddu Ring",
		back=Ankou.DA, 
		waist="Fotia Belt",
		legs="Sakpata's Cuisses", 
		feet="Sakpata's Leggings"
    }
 
    sets.Requiescat.Accuracy = {
		ammo="Coiste Bodhar",
		head="Flamma Zucchetto +2", 
		neck="Fotia Gorget",
		ear1="Cessance Earring", 
		ear2="Moonshade Earring",		
		body="Dagon Breastplace",
		hands="Sakpata's Gauntlets",		
		ring1="Regal Ring", 
		ring2="Niqmaddu Ring",
		back=Ankou.DA, 
		waist="Fotia Belt",
		legs="Sakpata's Cuisses", 
		feet="Flamma Gambieras +2"
    }

    sets.SavageBlade = {}
 
    sets.SavageBlade.index = { 'Attack', 'Accuracy' }
    SavageBlade_ind = 1
    sets.SavageBlade.Attack = {
		ammo="Knobkierrie",
		head="Nyame Helm", 
		neck="Abyssal Bead Necklace +1",
		ear1="Thrud Earring", 
		ear2="Moonshade Earring",		
		body="Ignominy Cuirass +3",
		hands=OdysseanHands.WSD,		
		ring1="Regal Ring", 
		ring2="Niqmaddu Ring",
		back=Ankou.WSD, 
		waist="Sailfi Belt +1",
		legs="Fallen's Flanchard +3", 
		feet=ValorousFeet.WSD
    }
 
    sets.SavageBlade.Accuracy = {
		ammo="Knobkierrie",
		head="Nyame Helm", 
		neck="Abyssal Bead Necklace +1",
		ear1="Thrud Earring", 
		ear2="Moonshade Earring",		
		body="Ignominy Cuirass +3",
		hands=OdysseanHands.WSD,		
		ring1="Regal Ring", 
		ring2="Niqmaddu Ring",
		back=Ankou.WSD, 
		waist="Sailfi Belt +1",
		legs="Fallen's Flanchard +3", 
		feet=ValorousFeet.WSD
    }

    sets.SanguineBlade = {}
 
    sets.SanguineBlade.index = { 'Attack', 'Accuracy' }
    SanguineBlade_ind = 1 
    sets.SanguineBlade.Attack = {
		ammo="Knobkierrie",
		head="Pixie Hairpin +1", 
		neck="Baetyl Pendant",
		ear1="Friomisi Earring", 
		ear2="Malignance Earring",		
		body="Nyame Mail",
		hands="Nyame Gauntlets",		
		ring1="Archon Ring", 
		ring2="Acumen Ring",
		back=Ankou.WSD, 
		waist="Eschan Stone",
		legs="Nyame Flanchard", 
		feet="Nyame Sollerets"
    }
	
    sets.SanguineBlade.Accuracy = {
		ammo="Knobkierrie",
		head="Pixie Hairpin +1", 
		neck="Baetyl Pendant",
		ear1="Friomisi Earring", 
		ear2="Malignance Earring",		
		body="Nyame Mail",
		hands="Nyame Gauntlets",		
		ring1="Archon Ring", 
		ring2="Acumen Ring",
		back=Ankou.WSD, 
		waist="Eschan Stone",
		legs="Nyame Flanchard", 
		feet="Nyame Sollerets"
    }	


	--Greatsword
    sets.Resolution = {}
 
    sets.Resolution.index = { 'Attack', 'Accuracy', 'Killer' }
    Resolution_ind = 1
 
    sets.Resolution.Attack = {
		ammo="Coiste Bodhar",
		head="Sakpata's Helm", 
		neck="Abyssal Bead Necklace +1",
		ear1="Thrud Earring", 
		ear2="Moonshade Earring",		
		body="Sakpata's Breastplate",
		hands="Sakpata's Gauntlets",		
		ring1="Regal Ring", 
		ring2="Niqmaddu Ring",
		back=Ankou.Reso, 
		waist="Fotia Belt",
		legs="Sakpata's Cuisses", 
		feet="Sakpata's Leggings"
    }
 
    sets.Resolution.Accuracy = {
		ammo="Coiste Bodhar",
		head="Flamma Zucchetto +2", 
		neck="Fotia Gorget",
		ear1="Thrud Earring", 
		ear2="Moonshade Earring",		
		body="Dagon Breastplate",
		hands="Sakpata's Gauntlets",		
		ring1="Regal Ring", 
		ring2="Niqmaddu Ring",
		back=Ankou.Reso, 
		waist="Fotia Belt",
		legs="Sakpata's Cuisses", 
		feet="Flamma Gambieras +2"
    }
   
    sets.Resolution.Killer = {
		ammo="Coiste Bodhar",
		head="Sakpata's Helm", 
		neck="Fotia Gorget",
		ear1="Thrud Earring", 
		ear2="Moonshade Earring",		
		body="Founder's Breastplate",
		hands="Sakpata's Gauntlets",		
		ring1="Regal Ring", 
		ring2="Niqmaddu Ring",
		back=Ankou.Reso, 
		waist="Fotia Belt",
		legs="Sakpata's Cuisses", 
		feet="Sakpata's Leggings"
    }

    sets.Torcleaver = {}
 
    sets.Torcleaver.index = { 'Attack', 'Accuracy', 'Killer'  }
    Torcleaver_ind = 1
 
    sets.Torcleaver.Attack = {
		ammo="Knobkierrie",
		head="Nyame Helm", 
		neck="Abyssal Bead Necklace +1",
		ear1="Thrud Earring", 
		ear2="Moonshade Earring",		
		body="Ignominy Cuirass +3",
		hands=OdysseanHands.WSD,		
		ring1="Regal Ring", 
		ring2="Niqmaddu Ring",
		back=Ankou.Torc, 
		waist="Sailfi Belt +1",
		legs="Fallen's Flanchard +3", 
		feet=ValorousFeet.WSD
    }
                   
    sets.Torcleaver.Accuracy = {
		ammo="Knobkierrie",
		head="Nyame Helm", 
		neck="Abyssal Bead Necklace +1",
		ear1="Thrud Earring", 
		ear2="Moonshade Earring",		
		body="Ignominy Cuirass +3",
		hands=OdysseanHands.WSD,		
		ring1="Regal Ring", 
		ring2="Niqmaddu Ring",
		back=Ankou.Torc, 
		waist="Sailfi Belt +1",
		legs="Fallen's Flanchard +3", 
		feet="Sulevia's Leggings +2"
    }
                               
    sets.Torcleaver.Killer = {
		ammo="Knobkierrie",
		head="Nyame Helm", 
		neck="Abyssal Bead Necklace +1",
		ear1="Thrud Earring", 
		ear2="Moonshade Earring",		
		body="Founder's Breastplate",
		hands=OdysseanHands.WSD,		
		ring1="Regal Ring", 
		ring2="Niqmaddu Ring",
		back=Ankou.Torc, 
		waist="Sailfi Belt +1",
		legs="Fallen's Flanchard +3", 
		feet=ValorousFeet.WSD
    } 
	
    sets.GroundStrike = {}
 
    sets.GroundStrike.index = { 'Attack', 'Accuracy', 'Killer'  }
    GroundStrike_ind = 1
 
    sets.GroundStrike.Attack = {
		ammo="Knobkierrie",
		head="Nyame Helm", 
		neck="Abyssal Bead Necklace +1",
		ear1="Thrud Earring", 
		ear2="Moonshade Earring",		
		body="Ignominy Cuirass +3",
		hands=OdysseanHands.WSD,		
		ring1="Regal Ring", 
		ring2="Niqmaddu Ring",
		back=Ankou.Torc, 
		waist="Sailfi Belt +1",
		legs="Fallen's Flanchard +3", 
		feet=ValorousFeet.WSD
    }
                   
    sets.GroundStrike.Accuracy = {
		ammo="Knobkierrie",
		head=ValorousHead.WSD, 
		neck="Abyssal Bead Necklace +1",
		ear1="Thrud Earring", 
		ear2="Moonshade Earring",		
		body="Ignominy Cuirass +3",
		hands=OdysseanHands.WSD,		
		ring1="Regal Ring", 
		ring2="Niqmaddu Ring",
		back=Ankou.Torc, 
		waist="Sailfi Belt +1",
		legs="Fallen's Flanchard +3", 
		feet="Sulevia's Leggings +2"
    }
                               
    sets.GroundStrike.Killer = {
		ammo="Knobkierrie",
		head=ValorousHead.WSD, 
		neck="Abyssal Bead Necklace +1",
		ear1="Thrud Earring", 
		ear2="Moonshade Earring",		
		body="Founder's Breastplate",
		hands=OdysseanHands.WSD,		
		ring1="Regal Ring", 
		ring2="Niqmaddu Ring",
		back=Ankou.Torc, 
		waist="Sailfi Belt +1",
		legs="Fallen's Flanchard +3", 
		feet=ValorousFeet.WSD
    } 	
	
    sets.Shockwave = {}
 
    sets.Shockwave.index = { 'Attack', 'Accuracy', 'Killer'  }
    Shockwave_ind = 1
 
    sets.Shockwave.Attack = {
		ammo="Seething Bomblet +1",
		head="Sakpata's Helm", 
		neck="Sanctity Necklace",
		ear1="Dignitary's Earring", 
		ear2="Malignance Earring",		
		body="Sakpata's Breastplate",
		hands="Sakpata's Gauntlets",	
		ring1="Flamma Ring", 
		ring2="Etana Ring",
		back=Ankou.Mag, 
		waist="Eschan Stone",
		legs="Sakpata's Cuisses", 
		feet="Sakpata's Leggings"
    }
                   
    sets.Shockwave.Accuracy = {
		ammo="Seething Bomblet +1",
		head="Sakpata's Helm", 
		neck="Sanctity Necklace",
		ear1="Dignitary's Earring", 
		ear2="Malignance Earring",		
		body="Sakpata's Breastplate",
		hands="Sakpata's Gauntlets",	
		ring1="Flamma Ring", 
		ring2="Etana Ring",
		back=Ankou.Mag, 
		waist="Eschan Stone",
		legs="Sakpata's Cuisses", 
		feet="Sakpata's Leggings"
    }
                               
    sets.Shockwave.Killer = {
		ammo="Seething Bomblet +1",
		head="Sakpata's Helm", 
		neck="Sanctity Necklace",
		ear1="Dignitary's Earring", 
		ear2="Malignance Earring",		
		body="Sakpata's Breastplate",
		hands="Sakpata's Gauntlets",	
		ring1="Flamma Ring", 
		ring2="Etana Ring",
		back=Ankou.Mag, 
		waist="Eschan Stone",
		legs="Sakpata's Cuisses", 
		feet="Sakpata's Leggings"
    } 	
	
    sets.Herculean = {}
 
    sets.Herculean.index = { 'Attack', 'Accuracy', 'Killer'  }
    Herculean_ind = 1
 
    sets.Herculean.Attack = {
		ammo="Knobkierrie",
		head="Nyame Helm", 
		neck="Baetyl Pendant",
		ear1="Friomisi Earring", 
		ear2="Malignance Earring",		
		body="Nyame Mail",
		hands="Nyame Gauntlets",	
		ring1="Regal Ring", 
		ring2="Niqmaddu Ring",
		back=Ankou.WSD, 
		waist="Eschan Stone",
		legs="Nyame Flanchard", 
		feet="Nyame Sollerets"
    }
                   
    sets.Herculean.Accuracy = {
		ammo="Knobkierrie",
		head="Nyame Helm", 
		neck="Baetyl Pendant",
		ear1="Friomisi Earring", 
		ear2="Malignance Earring",		
		body="Nyame Mail",
		hands="Nyame Gauntlets",	
		ring1="Regal Ring", 
		ring2="Niqmaddu Ring",
		back=Ankou.WSD, 
		waist="Eschan Stone",
		legs="Nyame Flanchard", 
		feet="Nyame Sollerets"
    }
                               
    sets.Herculean.Killer = {
		ammo="Knobkierrie",
		head="Nyame Helm", 
		neck="Baetyl Pendant",
		ear1="Friomisi Earring", 
		ear2="Malignance Earring",		
		body="Nyame Mail",
		hands="Nyame Gauntlets",	
		ring1="Regal Ring", 
		ring2="Niqmaddu Ring",
		back=Ankou.WSD, 
		waist="Eschan Stone",
		legs="Nyame Flanchard", 
		feet="Nyame Sollerets"
    } 		
 
    --Great Axe
    sets.Upheaval = {}
 
    sets.Upheaval.index = { 'Attack', 'Accuracy', 'Killer' }
    Upheaval_ind = 1
    sets.Upheaval.Attack = {
		ammo="Knobkierrie",
		head="Nyame Helm", 
		neck="Abyssal Bead Necklace +1",
		ear1="Thrud Earring", 
		ear2="Moonshade Earring",		
		body="Ignominy Cuirass +3",
		hands=OdysseanHands.WSD,	
		ring1="Regal Ring", 
		ring2="Niqmaddu Ring",
		back=Ankou.Torc, 
		waist="Sailfi Belt +1",
		legs="Fallen's Flanchard +3", 
		feet=ValorousFeet.WSD
    }
 
    sets.Upheaval.Accuracy = set_combine(sets.Upheaval.Attack, {
		ammo="Knobkierrie",
		head="Sakpata's Helm", 
		neck="Abyssal Bead Necklace +1",
		ear1="Thrud Earring", 
		ear2="Moonshade Earring",		
		body="Ignominy Cuirass +3",
		hands="Sakpata's Gauntlets",	
		ring1="Defending Ring", 
		ring2="Niqmaddu Ring",
		back=Ankou.WSD, 
		waist="Sailfi Belt +1",
		legs="Fallen's Flanchard +3", 
		feet="Sakpata's Leggings"	
	})
    sets.Upheaval.Killer = set_combine(sets.Upheaval.Accuracy, {body="Founder's Breastplate"})	
	
    sets.SteelCyclone = {}
 
    sets.SteelCyclone.index = { 'Attack', 'Accuracy', 'Killer' }
    SteelCyclone_ind = 1
    sets.SteelCyclone.Attack = {
		ammo="Knobkierrie",
		head="Nyame Helm", 
		neck="Abyssal Bead Necklace +1",
		ear1="Thrud Earring", 
		ear2="Moonshade Earring",		
		body="Ignominy Cuirass +3",
		hands=OdysseanHands.WSD,	
		ring1="Regal Ring", 
		ring2="Niqmaddu Ring",
		back=Ankou.WSD, 
		waist="Sailfi Belt +1",
		legs="Fallen's Flanchard +3", 
		feet=ValorousFeet.WSD	
    }
 
    sets.SteelCyclone.Accuracy = set_combine(sets.SteelCyclone.Attack, {
		ammo="Knobkierrie",
		head="Sakpata's Helm", 
		neck="Abyssal Bead Necklace +1",
		ear1="Thrud Earring", 
		ear2="Moonshade Earring",		
		body="Ignominy Cuirass +3",
		hands="Sakpata's Gauntlets",	
		ring1="Defending Ring", 
		ring2="Niqmaddu Ring",
		back=Ankou.WSD, 
		waist="Sailfi Belt +1",
		legs="Fallen's Flanchard +3", 
		feet="Sakpata's Leggings"	
	})
    sets.SteelCyclone.Killer = set_combine(sets.SteelCyclone.Accuracy, {body="Founder's Breastplate"})	
   
    sets.FellCleave = {}
 
    sets.FellCleave.index = { 'Attack', 'Accuracy', 'Killer' }
    FellCleave_ind = 1
    sets.FellCleave.Attack = {
		ammo="Knobkierrie",
		head="Nyame Helm", 
		neck="Abyssal Bead Necklace +1",
		ear1="Thrud Earring", 
		ear2="Ishvara Earring",		
		body="Ignominy Cuirass +3",
		hands=OdysseanHands.WSD,	
		ring1="Regal Ring", 
		ring2="Niqmaddu Ring",
		back=Ankou.WSD, 
		waist="Sailfi Belt +1",
		legs="Fallen's Flanchard +3", 
		feet=ValorousFeet.WSD
    }
 
    sets.FellCleave.Accuracy = set_combine(sets.FellCleave.Attack, {
		ammo="Knobkierrie",
		head="Sakpata's Helm", 
		neck="Abyssal Bead Necklace +1",
		ear1="Thrud Earring", 
		ear2="Moonshade Earring",		
		body="Ignominy Cuirass +3",
		hands="Sakpata's Gauntlets",	
		ring1="Defending Ring", 
		ring2="Niqmaddu Ring",
		back=Ankou.WSD, 
		waist="Sailfi Belt +1",
		legs="Fallen's Flanchard +3", 
		feet="Sakpata's Leggings"	
	})
    sets.FellCleave.Killer = set_combine(sets.FellCleave.Accuracy, {body="Founder's Breastplate"})	
	
    sets.ArmorBreak = {}
 
    sets.ArmorBreak.index = { 'Attack', 'Accuracy', 'Killer' }
    ArmorBreak_ind = 1
    sets.ArmorBreak.Attack = {
		ammo="Seething Bomblet +1",
		head="Sakpata's Helm", 
		neck="Sanctity Necklace",
		ear1="Dignitary's Earring", 
		ear2="Malignance Earring",		
		body="Sakpata's Breastplate",
		hands="Sakpata's Gauntlets",	
		ring1="Flamma Ring", 
		ring2="Etana Ring",
		back=Ankou.Mag, 
		waist="Eschan Stone",
		legs="Sakpata's Cuisses", 
		feet="Sakpata's Leggings"
    }
 
    sets.ArmorBreak.Accuracy = set_combine(sets.ArmorBreak.Attack, {})
    sets.ArmorBreak.Killer = set_combine(sets.ArmorBreak.Attack, {})	
	
	
	--Scythe
    sets.Catastrophe = {}
 
    sets.Catastrophe.index = { 'Attack', 'Accuracy', 'Killer' }
    Catastrophe_ind = 1
    sets.Catastrophe.Attack = {
		ammo="Knobkierrie",
		head="Ratri Sallet", 
		neck="Abyssal Bead Necklace +1",
		ear1="Thrud Earring", 
		ear2="Lugra Earring +1",		
		body="Ignominy Cuirass +3",
		hands=OdysseanHands.WSD,		
		ring1="Regal Ring", 
		ring2="Niqmaddu Ring",
		back=Ankou.WSD, 
		waist="Sailfi Belt +1",
		legs="Ratri Cuisses", 
		feet=ValorousFeet.WSD
    }
 
    sets.Catastrophe.Accuracy = set_combine(sets.Catastrophe.Attack, {})	
	sets.Catastrophe.Killer = set_combine(sets.Catastrophe.Attack, {body="Founder's Breastplate"})

    sets.Insurgency = {}
 
    sets.Insurgency.index = { 'Attack', 'Accuracy', 'Killer' }
    Insurgency_ind = 1
    sets.Insurgency.Attack = {
		ammo="Knobkierrie",
		head="Ratri Sallet", 
		neck="Abyssal Bead Necklace +1",
		ear1="Thrud Earring", 
		ear2="Moonshade Earring",		
		body="Ignominy Cuirass +3",
		hands=OdysseanHands.WSD,			
		ring1="Regal Ring", 
		ring2="Niqmaddu Ring",
		back=Ankou.WSD, 
		waist="Sailfi Belt +1",
		legs="Fallen's Flanchard +3", 
		feet="Ratri Sollerets"
    }
 
    sets.Insurgency.Accuracy = set_combine(sets.Insurgency.Attack, {})
	sets.Insurgency.Killer = set_combine(sets.Insurgency.Attack, {body="Founder's Breastplate"})
	
    sets.CrossReaper = {}
 
    sets.CrossReaper.index = { 'Attack', 'Accuracy', 'Killer' }
    CrossReaper_ind = 1
    sets.CrossReaper.Attack = {
		ammo="Knobkierrie",
		head="Ratri Sallet", 
		neck="Abyssal Bead Necklace +1",
		ear1="Thrud Earring", 
		ear2="Moonshade Earring",		
		body="Ignominy Cuirass +3",
		hands=OdysseanHands.WSD,		
		ring1="Regal Ring", 
		ring2="Niqmaddu Ring",
		back=Ankou.WSD, 
		waist="Sailfi Belt +1",
		legs="Ratri Cuisses", 
		feet=ValorousFeet.WSD
    }
 
    sets.CrossReaper.Accuracy = set_combine(sets.CrossReaper.Attack, {})
    sets.CrossReaper.Killer = set_combine(sets.CrossReaper.Attack, {body="Founder's Breastplate"})	

    sets.Entropy = {}
 
    sets.Entropy.index = { 'Attack', 'Accuracy', 'Killer' }
    Entropy_ind = 1
    sets.Entropy.Attack = {
		ammo="Coiste Bodhar",
		head="Sakpata's Helm", 
		neck="Fotia Gorget",
		ear1="Lugra Earring +1", 
		ear2="Moonshade Earring",		
		body="Sakpata's Breastplate",
		hands="Sakpata's Gauntlets",
		ring1="Regal Ring", 
		ring2="Niqmaddu Ring",
		back=Ankou.Reso, 
		waist="Fotia Belt",
		legs="Sakpata's Cuisses", 
		feet="Sakpata's Leggings"
    }
 
    sets.Entropy.Accuracy = set_combine(sets.Entropy.Attack, {})	
    sets.Entropy.Killer = set_combine(sets.Entropy.Attack, {body="Founder's Breastplate"})
	
    sets.Quietus = {}
 
    sets.Quietus.index = { 'Attack', 'Accuracy', 'Killer' }
    Quietus_ind = 1
    sets.Quietus.Attack = {
		ammo="Knobkierrie",
		head="Ratri Sallet", 
		neck="Abyssal Bead Necklace +1",
		ear1="Thrud Earring", 
		ear2="Moonshade Earring",		
		body="Ignominy Cuirass +3",
		hands=OdysseanHands.WSD,		
		ring1="Regal Ring", 
		ring2="Niqmaddu Ring",
		back=Ankou.WSD, 
		waist="Sailfi Belt +1",
		legs="Ratri Cuisses", 
		feet=ValorousFeet.WSD
    }
 
    sets.Quietus.Accuracy = set_combine(sets.Quietus.Attack, {})
    sets.Quietus.Killer = set_combine(sets.Quietus.Attack, {body="Founder's Breastplate"})	
	
    sets.Guillotine = {}
 
    sets.Guillotine.index = { 'Attack', 'Accuracy', 'Killer' }
    Guillotine_ind = 1
    sets.Guillotine.Attack = {
		ammo="Seething Bomblet +1",
		head="Sakpata's Helm",
		neck="Sanctity Necklace",
		ear1="Dignitary's Earring", 
		ear2="Malignance Earring",		
		body="Sakpata's Breastplate",
		hands="Sakpata's Gauntlets",		
		ring1="Flamma Ring", 
		ring2="Etana Ring",
		back=Ankou.Mag, 
		waist="Eschan Stone",
		legs="Sakpata's Cuisses", 
		feet="Sakpata's Leggings"	
    }
 
    sets.Guillotine.Accuracy = set_combine(sets.Guillotine.Attack, {})
	sets.Guillotine.Killer = set_combine(sets.Guillotine.Attack, {body="Founder's Breastplate"})
	
    sets.InfernalScythe = {}
 
    sets.InfernalScythe.index = { 'Attack', 'Accuracy', 'Killer' }
    InfernalScythe_ind = 1
    sets.InfernalScythe.Attack = {
		ammo="Knobkierrie",
		head="Pixie Hairpin +1", 
		neck="Baetyl Pendant",
		ear1="Friomisi Earring", 
		ear2="Malignance Earring",		
		body="Nyame Mail",
		hands="Nyame Gauntlets",		
		ring1="Archon Ring", 
		ring2="Acumen Ring",
		back=Ankou.WSD, 
		waist="Eschan Stone",
		legs="Nyame Flanchard",  
		feet="Nyame Sollerets"
    }
 
    sets.InfernalScythe.Accuracy = set_combine(sets.InfernalScythe.Attack, {})
	sets.InfernalScythe.Killer = set_combine(sets.InfernalScythe.Attack, {body="Founder's Breastplate"})
	
    sets.ShadowOfDeath = {}
 
    sets.ShadowOfDeath.index = { 'Attack', 'Accuracy', 'Killer' }
    ShadowOfDeath_ind = 1
    sets.ShadowOfDeath.Attack = {
		ammo="Knobkierrie",
		head="Pixie Hairpin +1", 
		neck="Baetyl Pendant",
		ear1="Friomisi Earring", 
		ear2="Malignance Earring",		
		body="Nyame Mail",
		hands="Nyame Gauntlets",		
		ring1="Archon Ring", 
		ring2="Acumen Ring",
		back=Ankou.WSD, 
		waist="Eschan Stone",
		legs="Nyame Flanchard", 
		feet="Nyame Sollerets"
    }
 
    sets.ShadowOfDeath.Accuracy = set_combine(sets.ShadowOfDeath.Attack, {})
	sets.ShadowOfDeath.Killer = set_combine(sets.ShadowOfDeath.Attack, {body="Founder's Breastplate"})	
	
    sets.SpinningScythe = {}
 
    sets.SpinningScythe.index = { 'Attack', 'Accuracy', 'Killer' }
    SpinningScythe_ind = 1
    sets.SpinningScythe.Attack = {
		ammo="Knobkierrie",
		head="Nyame Helm", 
		neck="Abyssal Bead Necklace +1",
		ear1="Thrud Earring", 
		ear2="Moonshade Earring",		
		body="Ignominy Cuirass +3",
		hands=OdysseanHands.WSD,		
		ring1="Regal Ring", 
		ring2="Niqmaddu Ring",
		back=Ankou.WSD, 
		waist="Sailfi Belt +1",
		legs="Fallen's Flanchard", 
		feet="Sulevia's Leggings +2"
    }
 
    sets.SpinningScythe.Accuracy = set_combine(sets.SpinningScythe.Attack, {})
	sets.SpinningScythe.Killer = set_combine(sets.SpinningScythe.Attack, {body="Founder's Breastplate"})
	
    sets.SpiralHell = {}
 
    sets.SpiralHell.index = { 'Attack', 'Accuracy', 'Killer' }
    SpiralHell_ind = 1
    sets.SpiralHell.Attack = {
		ammo="Knobkierrie",
		head="Nyame Helm", 
		neck="Abyssal Bead Necklace +1",
		ear1="Thrud Earring", 
		ear2="Moonshade Earring",		
		body="Ignominy Cuirass +3",
		hands=OdysseanHands.WSD,		
		ring1="Regal Ring", 
		ring2="Niqmaddu Ring",
		back=Ankou.WSD, 
		waist="Sailfi Belt +1",
		legs="Fallen's Flanchard +3", 
		feet=ValorousFeet.WSD
    }
 
    sets.SpiralHell.Accuracy = set_combine(sets.SpiralHell.Attack, {})
	sets.SpiralHell.Killer = set_combine(sets.SpiralHell.Attack, {body="Founder's Breastplate"})

	--Axe
    sets.Decimation = {}
 
    sets.Decimation.index = { 'Attack', 'Accuracy' }
    Decimation_ind = 1
    sets.Decimation.Attack = {
		ammo="Coiste Bodhar",
		head="Sakpata's Helm", 
		neck="Fotia Gorget",
		ear1="Thrud Earring", 
		ear2="Moonshade Earring",		
		body="Sakpata's Breastplate",
		hands="Sakpata's Gauntlets",		
		ring1="Regal Ring", 
		ring2="Niqmaddu Ring",
		back=Ankou.Reso, 
		waist="Fotia Belt",
		legs="Sakpata's Cuisses", 
		feet="Sakpata's Leggings"
    }
 
    sets.Decimation.Accuracy = set_combine(sets.Decimation.Attack, {})	
	
------End of WS------------------------------------------------------------------------------------------
------Magic Sets---
    --BlueMagic and Cures are unlikely to be needed
	--Leftovers from prior Luas
	sets.BlueMagic = {}
 
    sets.BlueMagic.STR = set_combine(sets.Resolution.AttackCapped, {})
 
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
        hands = "Macabre Gauntlets +1",
        ring1 = "Pernicious Ring",
        ring2 = "Supershear Ring",
        back = "Moonbeam Cape",
        waist = "Trance Belt",
        legs = "Zoar Subligar +1",
        feet = "Eschite Greaves"
    }
   
    --Utility Sets--
   
    sets.Utility = {}
 
    sets.Utility.TH = {
        ammo = "Perfect Lucky Egg",
		head = "Volte Cap",
		waist = "Chaac Belt"
    }
   
    sets.Utility.Derp = {
		ammo = "Staunch Tathlum +1", -- 0/0/3
        head = "Sakpata's Helm", -- 3/7/0
        neck = "Vim Torque +1", 
        ear1 = "Tuisto Earring", 
        ear2 = "Odnowa Earring +1", -- 0/2/3
        body = "Sakpata's Breastplate", 
        hands = "Macabre Gauntlets +1", -- 4/0/0
        ring1 = "Defending Ring", -- 0/0/10
        ring2 = "Gelatinous Ring +1", -- 7/-1/0
        back = Ankou.TP, -- 10/0/0
        waist = "Carrier's Sash",
        legs = "Sakpata's Cuisses", -- 7/3/0
        feet = "Sakpata's Leggings" -- 4/6/0
    } -- 35/17/16
   
    sets.Utility.MDTTank =  {
		ammo = "Staunch Tathlum +1", -- 0/0/3
        head = "Sakpata's Helm", -- 3/7/0
        neck = "Warder's Charm +1", 
        ear1 = "Tuisto Earring", 
        ear2 = "Odnowa Earring +1", -- 0/2/3
        body = "Sakpata's Breastplate", 
        hands = "Macabre Gauntlets +1", -- 4/0/0
        ring1 = "Defending Ring", -- 0/0/10
        ring2 = "Gelatinous Ring +1", -- 7/-1/0
        back = Ankou.TP, -- 10/0/0
        waist = "Carrier's Sash",
        legs = "Sakpata's Cuisses", -- 7/3/0
        feet = "Sakpata's Leggings" -- 4/6/0
    }
   
    --Shell V on. Need 23% when 5/5 with pants, 21% with sheltered (24% with sheltered and trust/self cast)--
    sets.Utility.MDTV = {
		ammo = "Staunch Tathlum +1", -- 0/0/3
        head = "Sakpata's Helm", -- 3/7/0
        neck = "Warder's Charm +1", 
        ear1 = "Tuisto Earring", 
        ear2 = "Odnowa Earring +1", -- 0/2/3
        body = "Sakpata's Breastplate", 
        hands = "Macabre Gauntlets +1", -- 4/0/0
        ring1 = "Defending Ring", -- 0/0/10
        ring2 = "Gelatinous Ring +1", -- 7/-1/0
        back = Ankou.TP, -- 10/0/0
        waist = "Carrier's Sash",
        legs = "Sakpata's Cuisses", -- 7/3/0
        feet = "Sakpata's Leggings" -- 4/6/0
    }
 
    --Shell II only--
    sets.Utility.MDTII = {
		ammo = "Staunch Tathlum +1", -- 0/0/3
        head = "Sakpata's Helm", -- 3/7/0
        neck = "Warder's Charm +1", 
        ear1 = "Tuisto Earring", 
        ear2 = "Odnowa Earring +1", -- 0/2/3
        body = "Sakpata's Breastplate", 
        hands = "Macabre Gauntlets +1", -- 4/0/0
        ring1 = "Defending Ring", -- 0/0/10
        ring2 = "Gelatinous Ring +1", -- 7/-1/0
        back = Ankou.TP, -- 10/0/0
        waist = "Carrier's Sash",
        legs = "Sakpata's Cuisses", -- 7/3/0
        feet = "Sakpata's Leggings" -- 4/6/0
    }
 
    --No Shell--
    sets.Utility.MDTNO = {
		ammo = "Staunch Tathlum +1", -- 0/0/3
        head = "Sakpata's Helm", -- 3/7/0
        neck = "Warder's Charm +1", 
        ear1 = "Tuisto Earring", 
        ear2 = "Odnowa Earring +1", -- 0/2/3
        body = "Sakpata's Breastplate", 
        hands = "Macabre Gauntlets +1", -- 4/0/0
        ring1 = "Defending Ring", -- 0/0/10
        ring2 = "Gelatinous Ring +1", -- 7/-1/0
        back = Ankou.TP, -- 10/0/0
        waist = "Carrier's Sash",
        legs = "Sakpata's Cuisses", -- 7/3/0
        feet = "Sakpata's Leggings" -- 4/6/0
    }
 
    --Telchine with proper ball busting augments is the best for magic evasion--
    sets.Utility.MEVA = {
		ammo = "Staunch Tathlum +1", -- 0/0/3
        head = "Sakpata's Helm", -- 3/7/0
        neck = "Warder's Charm +1", 
        ear1 = "Tuisto Earring", 
        ear2 = "Odnowa Earring +1", -- 0/2/3
        body = "Sakpata's Breastplate", 
        hands = "Macabre Gauntlets +1", -- 4/0/0
        ring1 = "Defending Ring", -- 0/0/10
        ring2 = "Gelatinous Ring +1", -- 7/-1/0
        back = Ankou.TP, -- 10/0/0
        waist = "Carrier's Sash",
        legs = "Sakpata's Cuisses", -- 7/3/0
        feet = "Sakpata's Leggings" -- 4/6/0
    }
 
    ---------------------------------------------------------------
   
    sets.Utility.Charm = {
		ammo = "Staunch Tathlum +1", -- 0/0/3
        head = "Sakpata's Helm", -- 3/7/0
        neck = "Warder's Charm +1", 
        ear1 = "Tuisto Earring", 
        ear2 = "Odnowa Earring +1", -- 0/2/3
        body = "Sakpata's Breastplate", 
        hands = "Macabre Gauntlets +1", -- 4/0/0
        ring1 = "Defending Ring", -- 0/0/10
        ring2 = "Gelatinous Ring +1", -- 7/-1/0
        back = Ankou.TP, -- 10/0/0
        waist = "Carrier's Sash",
        legs = "Sakpata's Cuisses", -- 7/3/0
        feet = "Sakpata's Leggings" -- 4/6/0	
	}
   
    sets.Utility.Doom = {
        neck  = "Nicander's Necklace",
		ring1 = "Haoma's Ring",
		ring2 = "Purity Ring",
		waist = "Gishdubar Sash"
    }
	
	sets.WSDayBonus = (set_combine(equipSet,{head="Gavialis Helm"}))
   
    --DarkMagic Sets--
   
    sets.Dark = {}
   
    sets.Dark.Skill = {
		ammo="Pemphredo Tathlum",
		head="Ignominy Burgeonet +1", 
		neck="Incanter's Torque",		
		ear1="Malignance Earring", 
		ear2="Loquacious Earring",		
		body="Fallen's Cuirass +3",
		hands="Fallen's Finger Gauntlets +3", 
		ring1="Stikini Ring", 
		ring2="Evanescence Ring", -- WAKE ME UP
		back="Niht Mantle",
		waist="Austerity Belt",
		legs="Fallen's Flanchard +3", 
		feet="Ratri Sollerets"
    }

	--Max HP + Spikes Effect gear
    sets.Dark.Dread = {
		ammo="Sapience Orb",
		head="Ratri Sallet", 
		neck="Unmoving Collar +1",		
		ear1="Odnowa Earring +1", 
		ear2="Tuisto Earring",		
		body="Heathen's Cuirass +1",
		hands="Ratri Gadlings", 
		ring1="Moonbeam Ring", 
		ring2="Gelatinous Ring +1",
		back="Moonbeam Cape",
		waist="Eschan Stone",
		legs="Ratri Cuisses", 
		feet="Ratri Sollerets"
	}
	
	--Stun set
    sets.Dark.Macc = {
		ammo="Pemphredo Tathlum",
		head="Carmine Mask +1", 
		neck="Erra Pendant",		
		ear1="Malignance Earring", 
		ear2="Dignitary's Earring",		
		body="Sakpata's Breastplate",
		hands="Fallen's Finger Gauntlets +3", 
		ring1="Stikini Ring", 
		ring2="Stikini Ring",
		back=Ankou.Mag,
		waist="Eschan Stone",
		legs="Fallen's Flanchard +3", 
		feet="Flamma Gambieras +2"
	}
   
    sets.Dark.Absorb = {
		ammo="Pemphredo Tathlum",
		head="Flamma Zucchetto +2", 
		neck="Erra Pendant",		
		ear1="Malignance Earring", 
		ear2="Dignitary's Earring",		
		body="Nyame Mail",
		hands="Fallen's Finger Gauntlets +3", 
		ring1="Stikini Ring", 
		ring2="Kishar Ring",
		back="Chuparrosa Mantle",
		waist="Eschan Stone",
		legs="Fallen's Flanchard +3", 
		feet="Ratri Sollerets"
    }
	
    sets.Dark.Drain = {
		range="Ullr",
		ammo="",
		head="Pixie Hairpin +1", 
		neck="Erra Pendant",		
		ear1="Malignance Earring", 
		ear2="Hirudinea Earring",		
		body="Nyame Mail",
		hands="Fallen's Finger Gauntlets +3", 
		ring1="Evanescence Ring", -- I CAN'T WAKE UP
		ring2="Archon Ring",
		back="Niht Mantle",
		waist="Eschan Stone",
		legs="Fallen's Flanchard +3", 
		feet="Ratri Sollerets"
    }	
	
    sets.Dark.Aspir = {
		ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1", 
		neck="Erra Pendant",		
		ear1="Malignance Earring", 
		ear2="Hirudinea Earring",		
		body="Nyame Mail",
		hands="Fallen's Finger Gauntlets +3", 
		ring1="Evanescence Ring", -- SAAAVVVEEE MEEEEE~!
		ring2="Archon Ring",
		back="Niht Mantle",
		waist="Eschan Stone",
		legs="Fallen's Flanchard +3", 
		feet="Sakpata's Leggings"
    }	

	sets.Enfeebling = {}
   
    sets.Enfeebling.Macc = {
		ammo="Pemphredo Tathlum",
		head="Carmine Mask +1", 
		neck="Erra Pendant",		
		ear1="Malignance Earring", 
		ear2="Dignitary's Earring",		
		body="Ignominy Cuirass +3",
		hands="Nyame Gauntlets", 
		ring1="Stikini Ring", 
		ring2="Kishar Ring",
		back=Ankou.Mag,
		waist="Sailfi Belt +1",
		legs="Nyame Flanchard", 
		feet="Nyame Sollerets"
    } 
	
	sets.Elemental = {}
	
	sets.Elemental.Nuke = {
		ammo="Pemphredo Tathlum",
		head="Jumalik Helm", 
		neck="Baetyl Pendant",		
		ear1="Malignance Earring", 
		ear2="Friomisi Earring",		
		body="Sacro Breastplate",
		hands="Carmine Finger Gauntlets +1", 
		ring1="Stikini Ring", 
		ring2="Acumen Ring",
		back=Ankou.Mag,
		waist="Eschan Stone",
		legs="Eschite Cuisses", 
		feet="Flamma Gambieras +2"
    }

	sets.Elemental.Impact = {
		ammo="Pemphredo Tathlum",
		head="", 
		neck="Erra Pendant",		
		ear1="Malignance Earring", 
		ear2="Dignitary's Earring",		
		body="Twilight Cloak",
		hands="Nyame Gauntlets", 
		ring1="Stikini Ring", 
		ring2="Mephitas's Ring +1",
		back=Ankou.Mag,
		waist="Eschan Stone",
		legs="Nyame Flanchard", 
		feet="Nyame Sollerets"
    } 	
	
   
    --Job Ability Sets--
	--DRK--
	sets.JA = {}
	
    sets.JA.BloodWeapon = {body = "Fallen's Cuirass +3"} 
	sets.JA.SoulEater = {head="Ignominy Burgonet +1"}
	sets.JA.LastResort = {feet = "Fallen's Sollerets +3"}
	
	sets.JA.WeaponBash = {
		ammo = "Pemphredo Tathlum",
        head = "Carmine Mask +1",
        neck = "Erra Pendant",
        ear1 = "Malignance Earring",
        ear2 = "Dignitary's Earring",
        body = "Sacro Breastplate",
        hands = "Ignominy Gauntlets +2",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring",
        back = Ankou.Mag,
        waist = "Eschan Stone",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets"
    }

	sets.JA.DarkSeal = {head = "Fallen's Burgeonet +3"}
	sets.JA.NetherVoid = {legs = "Heathen's Flanchard +1"}	
	sets.JA.ScarletDelirium = {}
	sets.JA.ArcaneCircle = {feet = "Ignominy Sollerets +1"}	
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
		ammo="Pemphredo Tathlum",
		head="Jumalik Helm", 
		neck="Baetyl Pendant",		
		ear1="Malignance Earring", 
		ear2="Friomisi Earring",		
		body="Sacro Breastplate",
		hands="Carmine Finger Gauntlets +1", 
		ring1="Stikini Ring", 
		ring2="Acumen Ring",
		back=Ankou.Mag,
		waist="Eschan Stone",
		legs="Eschite Cuisses", 
		feet="Eschite Greaves"
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
		head="Carmine Mask +1", 
		neck="Orunmila's Torque",		
		ear1="Malignance Earring", 
		ear2="Loquacious Earring",		
		body="Sacro Breastplate",
		hands="Leyline Gloves", 
		ring1="Rahab Ring", 
		ring2="Kishar Ring",
		back=Ankou.Mag,
		waist="Austerity Belt",
		legs="Eschite Cuisses", 
		feet="Carmine Greaves +1"
	}
 
    sets.precast.FastCast.Standard = {
		ammo="Sapience Orb",
		head="Carmine Mask +1", 
		neck="Orunmila's Torque",		
		ear1="Malignance Earring", 
		ear2="Loquacious Earring",		
		body="Sacro Breastplate",
		hands="Leyline Gloves", 
		ring1="Rahab Ring", 
		ring2="Kishar Ring",
		back=Ankou.Mag,
		waist="Austerity Belt",
		legs="Eschite Cuisses", 
		feet="Carmine Greaves +1"
	}
   
    sets.precast.FastCast.Impact = {
		ammo="Sapience Orb",
		head="", 
		neck="Orunmila's Torque",		
		ear1="Malignance Earring", 
		ear2="Loquacious Earring",		
		body="Twilight Cloak",
		hands="Leyline Gloves", 
		ring1="Rahab Ring", 
		ring2="Kishar Ring",
		back=Ankou.Mag,
		waist="Austerity Belt",
		legs="Eschite Cuisses", 
		feet="Carmine Greaves +1"
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
    add_to_chat (55, 'Currently on: '..('DRK '):color(5)..''..('Macros set!'):color(121))
end
 
--Page, Book--
set_macros(3,10)
--Use the Lockstyle Number--
set_style(65)
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
ScytheTP = true -- If true, default set is tanking TP array.
GreatswordTP = true -- TP set order, looks for Tanking TP set before 2H TP before 1H DW TP.
WeaponLock = true -- Locks Weapon/sub to avoid swaps
GreataxeWeapons = S{'Lycurgos'}
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
                    if ScytheTP == true then
						if AM3 == true then
							ChangeGear(sets.AM3[sets.AM3.index[AM3_ind]])
						else
							if buffactive['Last Resort'] then
								ChangeGear(sets.ScytheTPLR[sets.ScytheTPLR.index[ScytheTPLR_ind]])							
							else
								ChangeGear(sets.ScytheTP[sets.ScytheTP.index[ScytheTP_ind]])
							end							
						end
                    elseif GreatswordTP == true then
                        if GreataxeWeapons:contains(player.equipment.main) then
							if buffactive['Last Resort'] then
								ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
								ChangeGear(sets.GreataxeTPLR[sets.GreataxeTPLR.index[GreataxeTPLR_ind]])							
							else
								ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
								ChangeGear(sets.GreataxeTP[sets.GreataxeTP.index[GreataxeTP_ind]])
							end
						else
							if buffactive['Last Resort'] then
								ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
								ChangeGear(sets.GreatswordTPLR[sets.GreatswordTPLR.index[GreatswordTPLR_ind]])							
							else
								ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
								ChangeGear(sets.GreatswordTP[sets.GreatswordTP.index[GreatswordTP_ind]])
							end													
						end
					else
                        ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
						ChangeGear(sets.OneHandedTP[sets.OneHandedTP.index[OneHandedTP_ind]])
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
                    if ScytheTP == true then
						if AM3 == true then
							ChangeGear(sets.AM3[sets.AM3.index[AM3_ind]])
						else
							if buffactive['Last Resort'] then
								ChangeGear(sets.ScytheTPLR[sets.ScytheTPLR.index[ScytheTPLR_ind]])							
							else
								ChangeGear(sets.ScytheTP[sets.ScytheTP.index[ScytheTP_ind]])
							end	
						end
                    elseif GreatswordTP == true then
                        if GreataxeWeapons:contains(player.equipment.main) then
							if buffactive['Last Resort'] then
								ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
								ChangeGear(sets.GreataxeTPLR[sets.GreataxeTPLR.index[GreataxeTPLR_ind]])							
							else
								ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
								ChangeGear(sets.GreataxeTP[sets.GreataxeTP.index[GreataxeTP_ind]])
							end
						else
							if buffactive['Last Resort'] then
								ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
								ChangeGear(sets.GreatswordTPLR[sets.GreatswordTPLR.index[GreatswordTPLR_ind]])							
							else
								ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
								ChangeGear(sets.GreatswordTP[sets.GreatswordTP.index[GreatswordTP_ind]])
							end							
						end				
					else
                        ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
						ChangeGear(sets.OneHandedTP[sets.OneHandedTP.index[OneHandedTP_ind]])
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
                    if ScytheTP == true then
						if AM3 == true then
							ChangeGear(sets.AM3[sets.AM3.index[AM3_ind]])
						else
							if buffactive['Last Resort'] then
								ChangeGear(sets.ScytheTPLR[sets.ScytheTPLR.index[ScytheTPLR_ind]])							
							else
								ChangeGear(sets.ScytheTP[sets.ScytheTP.index[ScytheTP_ind]])
							end	
						end
                    elseif GreatswordTP == true then
                        if GreataxeWeapons:contains(player.equipment.main) then
							if buffactive['Last Resort'] then
								ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
								ChangeGear(sets.GreataxeTPLR[sets.GreataxeTPLR.index[GreataxeTPLR_ind]])							
							else
								ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
								ChangeGear(sets.GreataxeTP[sets.GreataxeTP.index[GreataxeTP_ind]])
							end
						else
							if buffactive['Last Resort'] then
								ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
								ChangeGear(sets.GreatswordTPLR[sets.GreatswordTPLR.index[GreatswordTPLR_ind]])							
							else
								ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
								ChangeGear(sets.GreatswordTP[sets.GreatswordTP.index[GreatswordTP_ind]])
							end							
						end				
					else
                        ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
						ChangeGear(sets.OneHandedTP[sets.OneHandedTP.index[OneHandedTP_ind]])
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
    elseif name == "hasso" then
        if gain then
        do return end
	else
		send_command('gs c -cd Hasso Lost!')
		end
    end
	
    if name == "last resort" then
        if gain then
        do return end
    else
        send_command('gs c -cd Last Resort Lost!')
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
            elseif ScytheTP == true then
                ChangeGear(sets.AM3[sets.AM3.index[AM3_ind]])
            end
        else
            AM3 = false
            send_command('timers delete "Aftermath";gs c -cd AM Lost!!!')
        end
    end
end
 
------------------------------------------
--               Binds                  --
------------------------------------------
send_command('bind f9 gs c toggle TP set') --This means if you hit f9 it toggles the sets
send_command('bind @e gs c toggle Weapon set')
send_command('bind @w gs c toggle WeaponLock')
send_command('bind f10 gs c toggle GS WS set') --Changes Reso and Torcleaver sets
send_command('bind f11 gs c ') --Empty
send_command('bind f12 gs c toggle Idle set')
send_command('bind ^f8 gs c toggle SIR') -- Turns Spell Interruption Rate set on
send_command('bind ^f9 input /ws "Resolution" <t>') --^ means cntrl
send_command('bind ^f10 input /ws "Torcleaver" <t>')
send_command('bind ^f11 input /ws "Ground Strike" <t>')
send_command('bind ^f12 input /ws "Savage Blade" <t>')
send_command('bind !f7 gs c toggle ScytheTP set') --! means alt, this exists only for toggling outside of this mode being active, otherwise f9
send_command('bind !f8 gs c toggle ScytheTP') --! turns tanking tp off
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
                if ScytheTP == true then
					if buffactive['Last Resort'] then
						ChangeGear(sets.ScytheTPLR[sets.ScytheTPLR.index[ScytheTPLR_ind]])							
					else
						ChangeGear(sets.ScytheTP[sets.ScytheTP.index[ScytheTP_ind]])
					end	
                elseif AM3 == true then
                        ChangeGear(sets.AM3[sets.AM3.index[AM3_ind]])
                elseif GreatswordTP == true then
                    if GreataxeWeapons:contains(player.equipment.main) then
						if buffactive['Last Resort'] then
							ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
							ChangeGear(sets.GreataxeTPLR[sets.GreataxeTPLR.index[GreataxeTPLR_ind]])							
						else
							ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
							ChangeGear(sets.GreataxeTP[sets.GreataxeTP.index[GreataxeTP_ind]])
						end			
					else
						if buffactive['Last Resort'] then
							ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
							ChangeGear(sets.GreatswordTPLR[sets.GreatswordTPLR.index[GreatswordTPLR_ind]])							
						else
							ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
							ChangeGear(sets.GreatswordTP[sets.GreatswordTP.index[GreatswordTP_ind]])
						end				
					end
                else
                    ChangeGear(sets.OneHandedTP[sets.OneHandedTP.index[OneHandedTP_ind]])
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
        if ScytheTP == true then
            ScytheTP_ind = ScytheTP_ind + 1
			ScytheTPLR_ind = ScytheTPLR_ind + 1
            AM3_ind = AM3_ind +1			
            if ScytheTP_ind > #sets.ScytheTP.index then ScytheTP_ind = 1 end
			if ScytheTPLR_ind > #sets.ScytheTPLR.index then ScytheTPLR_ind = 1 end
            if AM3_ind > #sets.AM3.index then AM3_ind = 1 end			
            send_command('@input /echo <----- ScytheTP Set changed to ' .. sets.ScytheTP.index[ScytheTP_ind] .. ' ----->')
            if player.status == 'Engaged' then
				if AM3 == true then
                    ChangeGear(sets.AM3[sets.AM3.index[AM3_ind]])
				else	
					if buffactive['Last Resort'] then
						ChangeGear(sets.ScytheTPLR[sets.ScytheTPLR.index[ScytheTPLR_ind]])							
					else
						ChangeGear(sets.ScytheTP[sets.ScytheTP.index[ScytheTP_ind]])
					end	
				end
            end
        elseif ScytheTP == false then
            if GreatswordTP == true then
                GreatswordTP_ind = GreatswordTP_ind + 1
				GreatswordTPLR_ind = GreatswordTPLR_ind + 1
                GreataxeTP_ind = GreataxeTP_ind + 1	
				GreataxeTPLR_ind = GreataxeTPLR_ind + 1					
                if GreatswordTP_ind > #sets.GreatswordTP.index then GreatswordTP_ind = 1 end
				if GreatswordTPLR_ind > #sets.GreatswordTPLR.index then GreatswordTPLR_ind = 1 end
				if GreataxeTP_ind > #sets.GreataxeTP.index then GreataxeTP_ind = 1 end
				if GreataxeTPLR_ind > #sets.GreataxeTPLR.index then GreataxeTPLR_ind = 1 end
                send_command('@input /echo <----- 2H TP Set changed to ' .. sets.GreatswordTP.index[GreatswordTP_ind] .. ' ----->')  
                if player.status == 'Engaged' then					
					ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
					if GreataxeWeapons:contains(player.equipment.main) then
						if buffactive['Last Resort'] then
							ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
							ChangeGear(sets.GreataxeTPLR[sets.GreataxeTPLR.index[GreataxeTPLR_ind]])							
						else
							ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
							ChangeGear(sets.GreataxeTP[sets.GreataxeTP.index[GreataxeTP_ind]])
						end	
					else
						if buffactive['Last Resort'] then
							ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
							ChangeGear(sets.GreatswordTPLR[sets.GreatswordTPLR.index[GreatswordTPLR_ind]])							
						else
							ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
							ChangeGear(sets.GreatswordTP[sets.GreatswordTP.index[GreatswordTP_ind]])
						end	
					end
                end
            elseif GreatswordTP == false then
                OneHandedTP_ind = OneHandedTP_ind + 1
                if OneHandedTP_ind > #sets.OneHandedTP.index then OneHandedTP_ind = 1 end
                send_command('@input /echo <----- 1H|DW TP Sets changed to ' .. sets.OneHandedTP.index[OneHandedTP_ind] .. ' ----->')
                if player.status == 'Engaged' then
                    ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
					ChangeGear(sets.OneHandedTP[sets.OneHandedTP.index[OneHandedTP_ind]])
                end
            end    
        end
    elseif command == 'toggle Idle set' then
        Idle_ind = Idle_ind + 1
        if Idle_ind > #sets.Idle.index then Idle_ind = 1 end
        send_command('@input /echo <----- Idle Set changed to ' .. sets.Idle.index[Idle_ind] .. ' ----->')
        ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
    elseif command == 'toggle GS WS set' then
        Resolution_ind = Resolution_ind + 1
        Torcleaver_ind = Torcleaver_ind + 1
		GroundStrike_ind = GroundStrike_ind + 1
		Shockwave_ind = Shockwave_ind + 1
		Herculean_ind = Herculean_ind + 1		
        Upheaval_ind = Upheaval_ind + 1
        FellCleave_ind = FellCleave_ind + 1
		SteelCyclone_ind = SteelCyclone_ind + 1
		ArmorBreak_ind = ArmorBreak_ind + 1		
        Catastrophe_ind = Catastrophe_ind + 1
		Insurgency_ind = Insurgency_ind + 1
        CrossReaper_ind = CrossReaper_ind + 1
		Entropy_ind = Entropy_ind + 1
		SpiralHell_ind = SpiralHell_ind + 1
        Guillotine_ind = Guillotine_ind + 1
        InfernalScythe_ind = InfernalScythe_ind + 1
		ShadowOfDeath_ind = ShadowOfDeath_ind + 1
		SpinningScythe_ind = SpinningScythe_ind + 1
		Quietus_ind = Quietus_ind + 1
        if Resolution_ind > #sets.Resolution.index then Resolution_ind = 1 end
        if Torcleaver_ind > #sets.Torcleaver.index then Torcleaver_ind = 1 end
		if GroundStrike_ind > #sets.GroundStrike.index then GroundStrike_ind = 1 end
		if Shockwave_ind > #sets.Shockwave.index then Shockwave_ind = 1 end
		if Herculean_ind > #sets.Herculean.index then Herculean_ind = 1 end		
        if Upheaval_ind > #sets.Upheaval.index then Upheaval_ind = 1 end
        if FellCleave_ind > #sets.FellCleave.index then FellCleave_ind = 1 end
		if SteelCyclone_ind > #sets.SteelCyclone.index then SteelCyclone_ind = 1 end
		if ArmorBreak_ind > #sets.ArmorBreak.index then ArmorBreak_ind = 1 end
        if Catastrophe_ind > #sets.Catastrophe.index then Catastrophe_ind = 1 end
		if Insurgency_ind > #sets.Insurgency.index then Insurgency_ind = 1 end
        if CrossReaper_ind > #sets.CrossReaper.index then CrossReaper_ind = 1 end
		if Entropy_ind > #sets.Entropy.index then Entropy_ind = 1 end
		if SpiralHell_ind > #sets.SpiralHell.index then SpiralHell_ind = 1 end		
        if Guillotine_ind > #sets.Guillotine.index then Guillotine_ind = 1 end
        if InfernalScythe_ind > #sets.InfernalScythe.index then InfernalScythe_ind = 1 end
		if ShadowOfDeath_ind > #sets.ShadowOfDeath.index then ShadowOfDeath_ind = 1 end
		if SpinningScythe_ind > #sets.SpinningScythe.index then SpinningScythe_ind = 1 end
		if Quietus_ind > #sets.Quietus.index then Quietus_ind = 1 end
        send_command('@input /echo <----- 2H Sets changed to ' .. sets.Resolution.index[Resolution_ind] .. ' ----->')
    elseif command == 'toggle Other WS set' then
        SavageBlade_ind = SavageBlade_ind + 1
		SanguineBlade_ind = SanguineBlade_ind +1
        Requiescat_ind = Requiescat_ind + 1
        Decimation_ind = Decimation_ind + 1
        if SavageBlade_ind > #sets.SavageBlade.index then SavageBlade_ind = 1 end
        if SanguineBlade_ind > #sets.SanguineBlade.index then SanguineBlade_ind = 1 end		
        if Requiescat_ind > #sets.Requiescat.index then Requiescat_ind = 1 end
        if Decimation_ind > #sets.Decimation.index then Decimation_ind = 1 end		
        send_command('@input /echo <----- Sword/Axe WS Set changed to ' .. sets.SavageBlade.index[SavageBlade_ind] .. ' ----->')
    elseif command == 'toggle ScytheTP set' then
        ScytheTP_ind = ScytheTP_ind + 1
        if ScytheTP_ind > #sets.ScytheTP.index then ScytheTP_ind = 1 end
        send_command('@input /echo <----- ScytheTP Set changed to ' .. sets.ScytheTP.index[ScytheTP_ind] .. ' ----->')
        if player.status == 'Engaged' then
			if buffactive['Last Resort'] then
				ChangeGear(sets.ScytheTPLR[sets.ScytheTPLR.index[ScytheTPLR_ind]])							
			else
				ChangeGear(sets.ScytheTP[sets.ScytheTP.index[ScytheTP_ind]])
			end	
        end
    elseif command == 'toggle ScytheTP' then
        if ScytheTP == true then
            ScytheTP = false
            ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
			send_command('@input /echo <----- Scythe TP: [Off] ----->')
        else
            ScytheTP = true
			ChangeGear({main="Apocalypse",sub="Utu Grip"})
            send_command('@input /echo <----- Scythe TP: [On] ----->')
        end
        status_change(player.status)
    elseif command == 'toggle GreatswordTP' then
        if GreatswordTP == true then
            GreatswordTP = false
            send_command('@input /echo <----- 2H TP: [Off] ----->')
        else
            GreatswordTP = true
            ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
			send_command('@input /echo <----- 2H TP: [On] ----->')
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
        if ScytheTP == true then
            ScytheTP_ind = ScytheTP_ind -1
			ScytheTPLR_ind = ScytheTPLR_ind -1
            AM3_ind = AM3_ind -1
            if ScytheTP_ind == 0 then
                ScytheTP_ind = #sets.ScytheTP.index
				ScytheTPLR_ind = #sets.ScytheTPLR.index
				AM3_ind = #sets.AM3.index
            end
            send_command('@input /echo <----- ScytheTP Set changed to ' .. sets.ScytheTP.index[ScytheTP_ind] .. ' ----->')
            if player.status == 'Engaged' then
				if buffactive['Last Resort'] then
					ChangeGear(sets.ScytheTPLR[sets.ScytheTPLR.index[ScytheTPLR_ind]])							
				else
					ChangeGear(sets.ScytheTP[sets.ScytheTP.index[ScytheTP_ind]])
				end	
            end
        elseif ScytheTP == false then
            if GreatswordTP == true then
                GreatswordTP_ind = GreatswordTP_ind -1
				GreatswordTPLR_ind = GreatswordTPLR_ind -1
				GreataxeTP_ind = GreataxeTP_ind -1
				GreataxeTPLR_ind = GreataxeTPLR_ind -1
                if GreatswordTP_ind == 0 then
                    GreatswordTP_ind = #sets.GreatswordTP.index
					GreatswordTPLR_ind = #sets.GreatswordTPLR.index
					GreataxeTP_ind = #sets.GreataxeTP.index
					GreataxeTPLR_ind = #sets.GreataxeTPLR.index
                end
                send_command('@input /echo <----- 2H TP Set changed to ' .. sets.GreatswordTP.index[GreatswordTP_ind] .. ' ----->')  
                if player.status == 'Engaged' then
                    if AM3 == true then
                        ChangeGear(sets.AM3[sets.AM3.index[AM3_ind]])
                    elseif GreatswordTP == true then
                        if GreataxeWeapons:contains(player.equipment.main) then
							if buffactive['Last Resort'] then
								ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
								ChangeGear(sets.GreataxeTPLR[sets.GreataxeTPLR.index[GreataxeTPLR_ind]])							
							else
								ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
								ChangeGear(sets.GreataxeTP[sets.GreataxeTP.index[GreataxeTP_ind]])
							end
						else
							if buffactive['Last Resort'] then
								ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
								ChangeGear(sets.GreatswordTPLR[sets.GreatswordTPLR.index[GreatswordTPLR_ind]])							
							else
								ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
								ChangeGear(sets.GreatswordTP[sets.GreatswordTP.index[GreatswordTP_ind]])
							end	
						end
                    end
                end
            elseif GreatswordTP == false then
                OneHandedTP_ind = OneHandedTP_ind -1
                if OneHandedTP_ind == 0 then
                    OneHandedTP_ind = #sets.OneHandedTP.index
                end
                if player.status == 'Engaged' then
                    ChangeGear(sets.OneHandedTP[sets.OneHandedTP.index[TP_ind]])
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
   
    if player.mpp <= 50 and Idle_ind == 2 then --standard idle
        ChangeGear({body = "Runeist's Coat +3"})
    elseif player.mpp <= 50 and Idle_ind == 3 then -- buff duration
        ChangeGear({})
    end
       
    if Town:contains(world.area) and player.mpp < 75 then
        ChangeGear(set_combine(sets.Idle.Town, sets.Idle.Refresh))
        elseif Town:contains(world.area) then
        ChangeGear(sets.Idle.Town)
    end
   
    if buffactive['Dark Seal'] then
        ChangeGear(set_combine(equipSet, {head="Fallen's Burgeonet +3"}))
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
        if ScytheTP == true then
            if buffactive["aftermath"] and player.equipment.main == 'Apocalypse' then --aftermath
				AM3 = true
				ChangeGear(sets.AM3[sets.AM3.index[AM3_ind]])				
			else
				if buffactive['Last Resort'] then
					ChangeGear(sets.ScytheTPLR[sets.ScytheTPLR.index[ScytheTPLR_ind]])							
				else
					ChangeGear(sets.ScytheTP[sets.ScytheTP.index[ScytheTP_ind]])
				end	
			end  
        elseif GreatswordTP == true then
            AM3 = false
            if GreataxeWeapons:contains(player.equipment.main) then
				if buffactive['Last Resort'] then
					ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
					ChangeGear(sets.GreataxeTPLR[sets.GreataxeTPLR.index[GreataxeTPLR_ind]])							
				else
					ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
					ChangeGear(sets.GreataxeTP[sets.GreataxeTP.index[GreataxeTP_ind]])
				end
			else
				if buffactive['Last Resort'] then
					ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
					ChangeGear(sets.GreatswordTPLR[sets.GreatswordTPLR.index[GreatswordTPLR_ind]])							
				else
					ChangeGear(sets.Weapon[sets.Weapon.index[Weapon_ind]])
					ChangeGear(sets.GreatswordTP[sets.GreatswordTP.index[GreatswordTP_ind]])
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
    if spell.english == 'Blood Weapon' then
        ChangeGear(sets.JA.BloodWeapon)
    elseif spell.english == 'Last Resort' then
        ChangeGear(sets.JA.LastResort)
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
    elseif spell.english == 'Dark Seal' then
        ChangeGear(sets.JA.DarkSeal)
    elseif spell.english == 'Nether Void' then
        ChangeGear(sets.JA.NetherVoid)		
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
 
    IgnoreWS = S { "Sanguine Blade", "Red Lotus Blade", "Flash Nova", "Realmrazer" }  -- Excluded from Moonshade TP override rule.
    BrutalWS = S { "Resolution"}
    STRWS = S {"Vorpal Blade", "Fell Cleave", "Circle Blade", "Swift Blade", "Shockwave" } -- Just uses the Resolution Set
   
   
    if spell.type == 'WeaponSkill' then
        if spell.english == 'Requiescat' then
            ChangeGear(sets.Requiescat[sets.Requiescat.index[Requiescat_ind]])
        elseif spell.english == 'Savage Blade' then
            ChangeGear(sets.SavageBlade[sets.SavageBlade.index[SavageBlade_ind]])
        elseif spell.english == 'Saguine Blade' then
            if (world.weather_element == 'Dark' or world.day_element == 'Dark' or buffactive['Voidstorm']) then	
				ChangeGear(sets.SanguineBlade[sets.SanguineBlade.index[SanguineBlade_ind]], {waist="Hachirin-no-Obi"})
			else	
				ChangeGear(sets.SanguineBlade[sets.SanguineBlade.index[SanguineBlade_ind]])
			end  
        elseif (spell.english == 'Red Lotus Blade' or spell.english == 'Burning Blade') then
            if (world.weather_element == 'Fire' or world.day_element == 'Fire' or buffactive['Firestorm']) then	
				ChangeGear(sets.SanguineBlade[sets.SanguineBlade.index[SanguineBlade_ind]], {waist="Hachirin-no-Obi"})
			else	
				ChangeGear(sets.SanguineBlade[sets.SanguineBlade.index[SanguineBlade_ind]])
			end
        elseif (spell.english == 'Seraph Blade' or spell.english == 'Shining Blade') then
            if (world.weather_element == 'Light' or world.day_element == 'Light' or buffactive['Aurorastorm']) then	
				ChangeGear(sets.SanguineBlade[sets.SanguineBlade.index[SanguineBlade_ind]], {waist="Hachirin-no-Obi"})
			else	
				ChangeGear(sets.SanguineBlade[sets.SanguineBlade.index[SanguineBlade_ind]])
			end			
        elseif spell.english == 'Decimation' then
            ChangeGear(sets.Decimation[sets.Decimation.index[Decimation_ind]])
        elseif spell.english == 'Resolution' then
            ChangeGear(sets.Resolution[sets.Resolution.index[Resolution_ind]])
        elseif spell.english == 'Torcleaver' then
            ChangeGear(sets.Torcleaver[sets.Torcleaver.index[Torcleaver_ind]])
        elseif spell.english == 'Ground Strike' then
            ChangeGear(sets.GroundStrike[sets.GroundStrike.index[GroundStrike_ind]])
        elseif spell.english == 'Shockwave' then
            ChangeGear(sets.Shockwave[sets.Shockwave.index[Shockwave_ind]])	
        elseif spell.english == 'Herculean Slash' then
            if (world.weather_element == 'Ice' or world.day_element == 'Ice' or buffactive['Hailstorm']) then	
				ChangeGear(sets.Herculean[sets.Herculean.index[Herculean_ind]], {waist="Hachirin-no-Obi"})
			else	
				ChangeGear(sets.Herculean[sets.Herculean.index[Herculean_ind]])
			end            			
        elseif spell.english == 'Upheaval' then
            ChangeGear(sets.Upheaval[sets.Upheaval.index[Upheaval_ind]])
        elseif spell.english == 'Steel Cyclone' then
            ChangeGear(sets.SteelCyclone[sets.SteelCyclone.index[SteelCyclone_ind]])
        elseif spell.english == 'Fell Cleave' then
            ChangeGear(sets.FellCleave[sets.FellCleave.index[FellCleave_ind]])
        elseif (spell.english == 'Armor Break' or spell.english == 'Flat Blade') then
            ChangeGear(sets.ArmorBreak[sets.ArmorBreak.index[ArmorBreak_ind]])
        elseif spell.english == 'Catastrophe' then
            ChangeGear(sets.Catastrophe[sets.Catastrophe.index[Catastrophe_ind]])
        elseif spell.english == 'Insurgency' then
            ChangeGear(sets.Insurgency[sets.Insurgency.index[Insurgency_ind]])
        elseif spell.english == 'Cross Reaper' then
            ChangeGear(sets.CrossReaper[sets.CrossReaper.index[CrossReaper_ind]])
        elseif spell.english == 'Entropy' then
            ChangeGear(sets.Entropy[sets.Entropy.index[Entropy_ind]])
        elseif spell.english == 'Quietus' then
            ChangeGear(sets.Quietus[sets.Quietus.index[Quietus_ind]])
        elseif spell.english == 'Guillotine' then
            ChangeGear(sets.Guillotine[sets.Guillotine.index[Guillotine_ind]])
        elseif spell.english == 'Infernal Scythe' then
            if (world.weather_element == 'Dark' or world.day_element == 'Dark' or buffactive['Voidstorm']) then	
				ChangeGear(sets.InfernalScythe[sets.InfernalScythe.index[InfernalScythe_ind]], {waist="Hachirin-no-Obi"})
			else	
				ChangeGear(sets.InfernalScythe[sets.InfernalScythe.index[InfernalScythe_ind]])
			end
        elseif spell.english == 'Shadow of Death' then
            if (world.weather_element == 'Dark' or world.day_element == 'Dark' or buffactive['Voidstorm']) then	
				ChangeGear(sets.ShadowOfDeath[sets.ShadowOfDeath.index[ShadowOfDeath_ind]], {waist="Hachirin-no-Obi"})
			else	
				ChangeGear(sets.ShadowOfDeath[sets.ShadowOfDeath.index[ShadowOfDeath_ind]])
			end            
        elseif spell.english == 'Spinning Scythe' then
            ChangeGear(sets.SpinningScythe[sets.SpinningScythe.index[SpinningScythe_ind]])
        elseif spell.english == 'Spiral Hell' then
            ChangeGear(sets.SpiralHell[sets.SpiralHell.index[SpiralHell_ind]])
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
	
	if (spell.english == 'Resolution' or spell.english == 'Decimation' or spell.english == 'Requiescat' or spell.english == 'Entropy') 
	and Resolution_ind ~= 2 and (check_ws_day[world.day]:contains(spell.skillchain_a) -- Change the and _ind ~=2 if you want to exclude other ws sets (currently set to exclude acc)
		or check_ws_day[world.day]:contains(spell.skillchain_b)
		or check_ws_day[world.day]:contains(spell.skillchain_c)) then
		ChangeGear(sets.WSDayBonus)
	end	
 
    if string.find(spell.english,'Step') then
        ChangeGear(set_combine(sets.GreatswordTP.AccuracyFull, sets.Utility.TH))
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
    if spell.skill == 'Dark Magic' then
        if buffactive['Dark Seal'] then
            if (spell.english == 'Drain' or spell.english == 'Drain II' or spell.english == 'Drain III') then
				if (world.weather_element == 'Dark' or world.day_element == 'Dark' or buffactive['Voidstorm']) then	
					ChangeGear(set_combine(sets.Dark.Drain, {head="Fallen's Burgeonet +3", waist="Hachirin-no-Obi"}))
				else	
					ChangeGear(set_combine(sets.Dark.Drain, {head="Fallen's Burgeonet +3"}))
				end
            elseif spell.english == 'Absorb-Attri' then
                ChangeGear(set_combine(sets.Dark.Absorb, {back="Fallen's Burgeonet +3"}))
            end	
		elseif spell.english == 'Stun' then
			ChangeGear(sets.Dark.Macc)
		elseif spell.english == 'Dread Spikes' then
			ChangeGear(sets.Dark.Dread)
		elseif (spell.english == 'Endark' or spell.english == 'Endark II') then
			ChangeGear(sets.Dark.Skill)
		elseif AbsorbSpells:contains(spell.english) then
			ChangeGear(sets.Dark.Absorb)
		elseif DrainSpells:contains(spell.english) then
			if (world.weather_element == 'Dark' or world.day_element == 'Dark' or buffactive['Voidstorm']) then	
				ChangeGear(set_combine(sets.Dark.Drain, {waist="Hachirin-no-Obi"}))
			else	
				ChangeGear(sets.Dark.Drain)
			end
		elseif AspirSpells:contains(spell.english) then
			if (world.weather_element == 'Dark' or world.day_element == 'Dark' or buffactive['Voidstorm']) then	
				ChangeGear(set_combine(sets.Dark.Aspir, {waist="Hachirin-no-Obi"}))
			else	
				ChangeGear(sets.Dark.Aspir)
			end
		end
    elseif spell.skill == 'Enfeebling Magic' then
         ChangeGear(sets.Enfeebling.Macc)
    elseif spell.skill == 'Elemental Magic' then
        if spell.english == 'Impact' then
            ChangeGear(sets.Elemental.Impact)
		else
			ChangeGear(sets.Elemental.Nuke)
        end
    end
 
    if BlueMagic_Enmity:contains(spell.english) then
        ChangeGear(sets.Enmity)
	elseif BlueMagic_AoEEnmity:contains(spell.english) then
        ChangeGear(sets.SIR)
    elseif BlueMagic_Buffs:contains(spell.english) then
        ChangeGear(sets.ScytheTP.Tank)
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
        GreatswordTP = true
	else
        GreatswordTP = false
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
        ac_JA(spell)
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
   
    if S{4,6,7,8,10,12}:contains(gearswap.res.items:with('en', player.equipment.main).skill) then --Checks mainhand weapon for TP set choice. See bottom for notes on #s
        GreatswordTP = true
	else
        GreatswordTP = false
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