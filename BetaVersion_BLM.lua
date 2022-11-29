-----------------------------------
---------PLEASE NOTE----------
----------------------------------

--I have been slapping this together from my time gearing up and playing BLM
---It is fully functional, but unfinished.       NOTE: THIS IS NOT A FINISHED LUA, BUT I PLAY WITH IT AND DO ANYTHING I NEED. USE AT YOUR OWN DISCRETION! 
----There are old pieces of code from my BLU and other luas still sitting in here. I rip it out over time as I add to the lua.
-----I didn't even proofread this before sharing it.

-------------------------
---What Is mising?---
------------------------
-----There is no mode for changing weapons or locking them in at the moment. I will add this, but on BLM I generally don't want to lose TP.
------Death Mode is automatically on or off based on being in the death idle.
-------Manawall feet are automatic based on the ability being on, and overwrite everything in all sets at all times.
--------Burst mode is Cntrl + ~
---------Occult Acumen superceeds burst mode, and is Cntrl + Spacebar
----------F11 for toggling AF Coat on or off.
-----------Hmm, I need to add the rule for DT nuking and DT Bursting. I haven't needed it yet enough to have it added.
------------Occult Acumen is overwritten by the -Ja stacking, I should add a rule if OA is on to just replace the pants over it and not the whole OA set. 
-------------It just has been working out in general as is though. I use other spells for TP.
-------------I have an entire Phalanx+ set I need to throw in here. I am just almost never /rdm so it hasn't come up for something cool like Sheol C Manawalling.

------------------------------------------------------------------------------------------------------------------------------------------

---Thanks to various sources such as LS members, BlueGartr, and Thefoxiestdanger for the help building this GearSwap.

-------------------------------------
---------                   ---------
------                         ------
---         Start of Gear         ---
------                         ------
---------                   ---------
------------------------------------- 

function get_sets()
    maps()
	
	MerlinicBody = {}
		MerlinicBody.FC = { name="Merlinic Jubbah", augments={'"Fast Cast"+6','Mag. Acc.+12','"Mag.Atk.Bns."+14',}}
		MerlinicBody.Phalanx = { name="Merlinic Jubbah", augments={'"Fast Cast"+6','Mag. Acc.+12','"Mag.Atk.Bns."+14',}}
	
	MerlinicHands = {}
		MerlinicHands.OA = { name="Merlinic Dastanas", augments={'Mag. Acc.+23','"Occult Acumen"+11','"Mag.Atk.Bns."+13',}}
	
	MerlinicFeet = {}
		MerlinicFeet.OA = { name="Merlinic Crackows", augments={'"Occult Acumen"+11','CHR+5','Mag. Acc.+8','"Mag.Atk.Bns."+12',}}
		MerlinicFeet.FC = { name="Merlinic Crackows", augments={'"Fast Cast"+6','Mag. Acc.+2','"Mag.Atk.Bns."+13',}}
		MerlinicFeet.Refresh = { name="Merlinic Crackows", augments={'Pet: "Dbl. Atk."+2','"Conserve MP"+1','"Refresh"+1',}}
		
    Taranus = {}
		Taranus.MAB = { name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}}
		Taranus.STP = { name = "Taranus's Cape", augments = { 'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10', }}
		Taranus.FC = { name = "Taranus's Cape", augments = { 'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Fast Cast"+10','Phys. dmg. taken-10%', }}
    
    sets.Idle = {}
    --Idle Sets--
    sets.Idle.index = { 'Standard', 'DT', 'Death' }
    Idle_ind = 1
    sets.Idle.Standard = {
		ammo = "Staunch Tathlum +1",
		head = "Nyame Helm",
		neck = "Warder's Charm +1",
		ear1 = "Brachyura Earring",
        ear2 = "Etiolation Earring",
		body = "Shamash Robe",
		hands = "Nyame Gauntlets",
		ring1 = "Stikini Ring +1",
        ring2 = "Shneddick Ring +1",
		back = Taranus.MAB,
		waist = "Embla Sash",	
		legs = "Agwu's Slops",
		feet = "Wicce Sabots +3"
    }

	sets.Idle.DT = {
		ammo = "Staunch Tathlum +1",
		head = "Nyame Helm",
		neck = "Warder's Charm +1",
		ear1 = "Brachyura Earring",
        ear2 = "Etiolation Earring",
		body = "Shamash Robe",
		hands = "Nyame Gauntlets",
		ring1 = "Defending Ring",
        ring2 = "Shneddick Ring +1",
		back = Taranus.MAB,
		waist = "Fucho-no-obi",	
		legs = "Agwu's Slops",
		feet = "Nyame Sollerets"
    }	
	
	sets.Idle.Death = {
		ammo = "Ghastly Tathlum +1",
		head = "Wicce Petasos +3",
		neck = "Warder's Charm +1",
		ear1 = "Loquacious Earring",
        ear2 = "Etiolation Earring",
		body = "Rosette Jaseran +1",
		hands = "Wicce Gloves +3",
		ring1 = "Mephitas's Ring +1",
        ring2 = "Shneddick Ring +1",
		back = Taranus.FC,
		waist = "Shinjutsu-no-Obi +1",	
		legs = "Wicce Chausses +3",
		feet = "Wicce Sabots +3"
    }
	
    sets.Idle.Town = set_combine(sets.Idle.Standard, {        
        ring1 = "Matrimony ring",
    })

    --TP Sets--
    sets.TP = {}
    sets.TP.index = {'TP', 'Accuracy' }
    TP_ind = 1 --Default set,  is Capped Haste, 2, AccLite, etc

    --+11 DW for capping with DW3 and capped magic haste--    
    sets.TP.TP = {
        ammo = "Amar Cluster",
        head = "Nyame Helm",
        neck = "Combatant's Torque",
        ear1 = "Telos Earring",
        ear2 = "Crepuscular Earring",
        body = "Nyame Mail",
        hands = "Gazu Bracelet +1",
        ring1 = "Chirich Ring +1",
        ring2 = "Chirich Ring +1",
        back = Taranus.STP,
        waist = "Windbuffet Belt +1",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets"
    }

    sets.TP.Accuracy = {
        ammo = "Aurgelmir Orb +1",
        head = "Adhemar Bonnet +1",
        neck = "Mirage Stole +2",
      ear1 = "Suppanomimi",
--        ear1 = "Telos Earring",
        ear2 = "Crepuscular Earring",
--        body = ,
--        hands = ,
        ring1 = "Epona's ring",
        ring2 = "Hetairoi Ring",
        back = Taranus.STP,
        waist = "Windbuffet Belt +1",
        legs = "Samnuha Tights",
--        feet = 
    }
    
	--DW Sets--
	sets.DW = {}
    sets.DW.index = {'Low', 'High'}
    DW_ind = 1

	--DW III with Haste II, +31 DW needed to cap with only Flutter on--
	
    sets.DW.Low = {
        ear1 = "Suppanomimi",
--		body = ,
        back = Taranus.DW,
        waist = "Reiki Yotai",
--        feet = 
    }
	--Essentially for being slowed, weakened, etc
	sets.DW.High = {
        ear1 = "Suppanomimi",
        ear2 = "Eabani Earring", -- Causes an ear slot (1 vs 2) conflict, but there was no actual way to avoid this, not a big deal anyway
--        body = ,
        back = Taranus.DW,
        waist = "Reiki Yotai",
        legs = "Carmine Cuisses +1",
--        feet = 
    }
	
    --DT Sets--
    sets.DT = {}
    sets.DT.index = { 'DT', 'MDT'}
    DT_ind = 1 

    sets.DT.DT = {
        ammo = "Amar Cluster",
        head = "Wicce Petasos +3",
        neck = "Warder's Charm +1",
        ear1 = "Telos Earring",
        ear2 = "Crepuscular Earring",
        body = "Nyame Mail",
        hands = "Wicce Gloves +3",
        ring1 = "Shadow Ring",
        ring2 = "Chirich Ring +1",
        back = Taranus.STP,
        waist = "Eschan Stone",
        legs = "Agwu's Slops",
        feet = "Wicce Sabots +3"
    }

    --Shell V on. Need 21% MDT, 19% with sheltered.
    sets.DT.MDT= {
        ammo = "Staunch Tathlum +1",
        head = "Malignance Chapeau",
        neck = "Warder's Charm +1",
        ear1 = "Eabani Earring",
        ear2 = "Etiolation Earring",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        ring2 = "Purity Ring",
        ring1 = "Shadow Ring",
        back = Taranus.MagicEva,
        waist = "Carrier's Sash",
        legs = "Malignance Tights",
--        feet = "Malignance Boots"
    }
	
    --Weaponskill Sets--
    sets.WS = {}

    sets.Requiescat = {}

    sets.Requiescat.index = { 'AttackUncap', 'AttackCap', 'Accuracy' }
    Requiescat_ind = 1

    sets.Requiescat.AttackUncap = {
        ammo = "Pemphredo Tathlum",
        head = "Luhlaza Keffiyeh +3",
        neck = "Fotia Gorget",
        ear1 = "Regal Earring",
        ear2 = "Brutal Earring",
        body = "Luhlaza Jubbah +3",
--        hands = ,
        ring1 = "Epona's ring",
        ring2 = "Rufescent Ring",
        back = Taranus.WSD,
        waist = "Fotia Belt",
        legs = "Luhlaza Shalwar +3",
--        feet = "Luhlaza Charuqs +3"
    }
	
	sets.Requiescat.AttackCap = set_combine(sets.Requiescat.AttackUncap, {
		head = "Carmine Mask +1"
		})
	
    sets.Requiescat.Accuracy = {
        ammo = "Aurgelmir Orb +1",
        head = "Carmine Mask +1",
        neck = "Fotia Gorget",
        ear1 = "Regal Earring",
        ear2 = "Brutal Earring",
        body = "Nyame Mail",
		hands = "Nyame Gauntlets",
        ring1 = "Epona's ring",
        ring2 = "Rufescent Ring",
        back = Taranus.STP,
        waist = "Fotia Belt",
        legs = "Nyame Flanchard",
--        feet = "Assim. Charuqs +3"
    }

    sets.Myrkr = {
		ammo = "Ghastly Tathlum +1",
		head = "Amalric Coif +1",
		neck = "Sanctity Necklace",
		ear1 = "Loquacious Earring",
		ear2 = "Etiolation Earring",
		body = "Rosette Jaseran +1",
		hands = "Spaekona's Gloves +3",
		ring1 = "Metamorph Ring +1",
		ring2 = "Mephitas's Ring +1",
		back = Taranus.FC,
		waist = "Shinjutsu-no-Obi +1",
		legs = "Spaekona's Tonban +3",
		feet = "Amalric Nails +1"
	}

    sets.Expiacion = {}

    sets.Expiacion.index = { 'AttackUncap', 'AttackCap', 'Accuracy' }
    Expiacion_ind = 1

    sets.Expiacion.AttackUncap = {
        ammo = "Aurgelmir Orb +1",
        head = "Nyame Helm",
        neck = "Mirage Stole +2",
        ear1 = "Moonshade Earring",
        ear2 = "Ishvara Earring",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        ring1 = "Rufescent Ring",
		ring2 = "Epaminondas's Ring",
        back = Taranus.WSD,
        waist = "Sailfi Belt +1",
        legs = "Nyame Flanchard",
--        feet = "Nyame Sollerets"
    }

	sets.Expiacion.AttackCap = set_combine(sets.Expiacion.AttackUncap, {
		ammo = "Crepuscular Pebble"
		})
	
    sets.Expiacion.Accuracy = {
		ammo = "Aurgelmir Orb +1",
        head = "Nyame Helm",
        neck = "Mirage Stole +2",
        ear1 = "Moonshade Earring",
        ear2 = "Regal Earring",
        body = "Assim. Jubbah +3",
        hands = "Nyame Gauntlets",
        ring1 = "Rufescent Ring",
		ring2 = "Epaminondas's Ring",
        back = Taranus.WSD,
        waist = "Sailfi Belt +1",
        legs = "Nyame Flanchard",
--        feet = "Nyame Sollerets"
    }

    sets.SanguineBlade = {
        ammo = "Pemphredo Tathlum",
        head = "Pixie Hairpin +1",
        neck = "Baetyl Pendant",
		ear1 = "Regal Earring",
        ear2 = "Friomisi Earring",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        ring1 = "Archon Ring",
        ring2 = "Shiva Ring +1",
        back = Taranus.Nuke,
        waist = "Sacro Cord",
        legs = "Luhlaza Shalwar +3",
--        feet = "Nyame Sollerets"
    }

    -----------
    --Clubs-- These indexs probably will never need to be toggled,
    ----------- but they exist anyway
    sets.Judgment = {}

    sets.Judgment.index = { 'AttackUncap', 'AttackCap', 'Accuracy' }
    Judgment_ind = 1
	
    sets.Judgment.AttackUncap = set_combine(sets.Expiacion.Attack, {})
	
    sets.Judgment.AttackCap = set_combine(sets.Expiacion.Attack, {})

    sets.Judgment.Accuracy = set_combine(sets.Expiacion.Accuracy, {})
    
    sets.BlackHalo = {}

    sets.BlackHalo.index = { 'AttackUncap', 'AttackCap', 'Accuracy' }
    BlackHalo_ind = 1
    sets.BlackHalo.AttackUncap = {
        ammo = "Aurgelmir Orb +1",
        head = "Nyame Helm",
        neck = "Mirage Stole +2",
        ear1 = "Moonshade Earring",
        ear2 = "Regal Earring",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        ring1 = "Rufescent Ring",
		ring2 = "Epaminondas's Ring",
        back = Taranus.WSD,
        waist = "Sailfi Belt +1",
        legs = "Nyame Flanchard",
--        feet = "Nyame Sollerets"
    }    
	
	sets.Shattersoul = {
        ammo = "Pemphredo Tathlum",
        head = "Nyame Helm",
        neck = "Fotia Gorget",
        ear1 = "Moonshade Earring",
        ear2 = "Regal Earring",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        ring1 = "Metamorph Ring +1",
        ring2 = "Freke Ring",
        back = "Aurist's Cape +1",
        waist = "Fotia Belt",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets"
    }
    
    sets.BlackHalo.AttackCap = set_combine(sets.BlackHalo.Attack, {})
	
    sets.BlackHalo.Accuracy = set_combine(sets.BlackHalo.Attack, {})
    
    sets.Vidohunir = {
        ammo = "Pemphredo Tathlum",
        head = "Pixie Hairpin +1",
        neck = "Sorcerer's Stole +2",
        ear1 = "Regal Earring",
        ear2 = "Friomisi Earring",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        ring1 = "Archon Ring",
        ring2 = "Freke Ring",
        back = Taranus.MAB,
        waist = "Sacro Cord",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets"
    }
	
    sets.EarthCrusher = {
        ammo = "Pemphredo Tathlum",
        head = "Nyame Helm",
        neck = "Quanpur Necklace",
        ear1 = "Regal Earring",
        ear2 = "Friomisi Earring",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        ring1 = "Metamorph Ring +1",
        ring2 = "Freke Ring",
        back = Taranus.MAB,
        waist = "Sacro Cord",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets"
    }
	
    sets.FlashNova = {
        ammo = "Pemphredo Tathlum",
        head = "Nyame Helm",
        neck = "Baetyl Pendant",
        ear1 = "Regal Earring",
        ear2 = "Friomisi Earring",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        ring1 = "Shiva Ring +1",
        ring2 = "Metamorph Ring +1",
        back = Taranus.Nuke,
        waist = "Sacro Cord",
        legs = "Nyame Flanchard",
--        feet = "Nyame Sollerets"
    }
	
    --------------------------------------------------
	--   Nuking Sets
    --------------------------------------------------
    sets.Nukes = {}
    sets.Nukes.index = { "MAB", "MACC", "MaxAcc" }
    Nukes_ind = 1

  sets.Nukes.MAB = {
		ammo="Ghastly Tathlum +1",
        head="Wicce Petasos +3", 
        neck="Sorcerer's Stole +2", 
        ear1="Malignance Earring", 
        ear2="Regal Earring", 
        body="Wicce Coat +3",
        hands="Wicce Gloves +3",
        ring1="Metamorph Ring +1", 
        ring2="Freke Ring", 
        back=Taranus.MAB, 
        waist="Sacro Cord", 
        legs="Wicce Chausses +3",
        feet="Wicce Sabots +3"
    }
    
    sets.Nukes.MACC = {
		ammo="Pemphredo Tathlum",
        head="Wicce Petasos +3", 
        neck="Sorcerer's Stole +2", 
        ear1="Malignance Earring", 
        ear2="Regal Earring", 
        body="Wicce Coat +3",
        hands="Wicce Gloves +3",
        ring1="Metamorph Ring +1", 
        ring2="Freke Ring", 
        back=Taranus.MAB, 
        waist="Sacro Cord", 
        legs="Wicce Chausses +3",
        feet="Wicce Sabots +3"
    }

	sets.Nukes.MaxAcc = {
		ammo="Pemphredo Tathlum",
        head="Wicce Petasos +3", 
        neck="Sorcerer's Stole +2", 
        ear1="Malignance Earring", 
        ear2="Regal Earring", 
        body="Wicce Coat +3",
        hands="Wicce Gloves +3",
        ring1="Metamorph Ring +1", 
        ring2="Freke Ring", 
        back=Taranus.MAB, 
        waist="Acuity Belt +1", 
        legs="Wicce Chausses +3",
        feet="Wicce Sabots +3"
    }
	
	sets.Bursts ={}
	sets.Bursts.index = { "MAB", "MACC", "MaxAcc" }
    Bursts_ind = 1
	
  sets.Bursts.MAB = {
		ammo="Ghastly Tathlum +1",
        head="Ea Hat +1", 
        neck="Sorcerer's Stole +2", 
        ear1="Malignance Earring", 
        ear2="Regal Earring", 
        body="Wicce Coat +3",
        hands="Agwu's Gages", 
 --       ring1="Mujin Band", 
        ring1="Metamorph Ring +1", 
        ring2="Freke Ring", 
        back=Taranus.MAB, 
        waist="Sacro Cord", 
        legs="Wicce Chausses +3",
        feet="Agwu's Pigaches"
    }
    
    sets.Bursts.MACC = {
		ammo="Ghastly Tathlum +1",
        head="Wicce Petasos +3", 
        neck="Sorcerer's Stole +2", 
        ear1="Malignance Earring", 
        ear2="Regal Earring", 
        body="Wicce Coat +3",
        hands="Agwu's Gages", 
        ring1="Metamorph Ring +1", 
        ring2="Freke Ring", 
        back=Taranus.MAB, 
        waist="Acuity Belt +1", 
        legs="Wicce Chausses +3",
        feet="Wicce Sabots +3"
    }

	sets.Bursts.MaxAcc = {
		ammo="Pemphredo Tathlum",
        head="Wicce Petasos +3", 
        neck="Sorcerer's Stole +2", 
        ear1="Malignance Earring", 
        ear2="Wicce Earring +1", 
        body="Wicce Coat +3",
        hands="Agwu's Gages", 
        ring1="Metamorph Ring +1", 
        ring2="Freke Ring",
        back=Taranus.MAB, 
        waist="Acuity Belt +1", 
        legs="Wicce Chausses +3",
        feet="Agwu's Pigaches"
    }
	
	--------------------------------------------------
	--   Occult Acumen
    --------------------------------------------------
    sets.OccultAcumen = {
		ammo="Seraphic Ampulla",
        head="Mallquis Chapeau +2", 
        neck="Combatant's Torque", 
        ear1="Dedition Earring", 
        ear2="Crepuscular Earring", 
        body="Spaekona's Coat +3",
        hands=MerlinicHands.OA,
        ring1="Chirich Ring +1", 
        ring2="Crepuscular Ring", 
        back=Taranus.STP, 
        waist="Oneiros Rope", 
        legs="Perdition Slops",
        feet=MerlinicFeet.OA,
	}
	--------------------------------------------------
	--   Dark Magic Sets
    --------------------------------------------------
	
	sets.DarkMagic ={}
	
	sets.DarkMagic.DrainAspir ={
		ammo = "Pemphredo Tathlum",
		head = "Agwu's Cap",
		neck = "Erra Pendant",
		ear1 = "Malignance Earring",
		ear2 = "Regal Earring",
		body = "Wicce Coat +3",
		hands = "Archmage's Gloves +3",
        ring1 = "Archon Ring",
		ring2 = "Metamorph Ring +1",
		back = "Aurist's Cape +1",
		waist = "Fucho-no-obi",
		legs = "Spaekona's Tonban +3",
		feet = "Agwu's Pigaches"
		}

	sets.DarkMagic.Stun ={
		ammo = "Pemphredo Tathlum",
		head = "Amalric Coif +1",
		neck = "Erra Pendant",
		ear1 = "Malignance Earring",
		ear2 = "Regal Earring",
		body = "Agwu's Robe",
		hands = "Agwu's Gages",
		ring1 = "Kishar Ring",
		ring2 = "Stikini Ring +1",
		back = Taranus.FC,
		waist = "Acuity Belt +1",
		legs = "Agwu's Slops",
		feet = "Agwu's Pigaches"	
		}		
		
	sets.DarkMagic.Absorb ={
		ammo = "Pemphredo Tathlum",
		head = "Amalric Coif +1",
		neck = "Erra Pendant",
		ear1 = "Malignance Earring",
		ear2 = "Regal Earring",
		body = "Agwu's Robe",
		hands = "Agwu's Gages",
		ring1 = "Kishar Ring",
		ring2 = "Stikini Ring +1",
		back = Taranus.FC,
		waist = "Acuity Belt +1",
		legs = "Spaekona's Tonban +3",
		feet = "Wicce Sabots +3"	
		}	
		
	sets.DarkMagic.Death ={
		ammo = "Ghastly Tathlum +1",
		head = "Amalric Coif +1",
		neck = "Sanctity Necklace",
		ear1 = "Barkarole Earring",
		ear2 = "Regal Earring",
		body = "Wicce Coat +3",
		hands = "Spaekona's Gloves +3",
		ring1= "Metamorph Ring +1",
		ring2 = "Archon Ring",
		back = Taranus.FC,
		waist = "Shinjutsu-no-Obi +1",
		legs = "Spaekona's Tonban +3",
		feet = "Wicce Sabots +3"
		}
		
	sets.DarkMagic.DeathBurst ={
		ammo = "Ghastly Tathlum +1",
		head = "Amalric Coif +1",
		neck = "Sorcerer's Stole +2",
		ear1 = "Barkarole Earring",
		ear2 = "Regal Earring",
		body = "Wicce Coat +3",
		hands = "Spaekona's Gloves +3",
		ring1= "Metamorph Ring +1",
		ring2 = "Archon Ring",
		back = Taranus.FC,
		waist = "Acuity Belt +1",
		legs = "Wicce Chausses +3",
		feet = "Spaekona's Sabots +3"
		}

	--------------------------------------------------
	--   Enfeebling Magic Sets
    --------------------------------------------------

	sets.Enfeebling = {
		ammo = "Pemphredo Tathlum",
		head = "Wicce Petasos +3",
		neck = "Sorcerer's Stole +2",
		ear1 = "Regal Earring",
		ear2 = "Malignance Earring",
		body = "Spaekona's Coat +3",
		hands = "Agwu's Gages",
		ring1 = "Kishar Ring",
		ring2 = "Metamorph Ring +1",
		back = "Aurist's Cape +1",
		waist = "Acuity Belt +1",
		legs = "Spaekona's Tonban +3",
		feet = "Agwu's Pigaches"
	}

    -----------------------------------------

    --CP cap 50%, CP Received cap 30%--
    sets.Cures = {
        ammo = "Staunch Tathlum +1",
        head = "Vanya Hood",
        neck = "Incanter's Torque", --4
        ear1 = "Mendicant's Earring", --5
        ear2 = "Magnetic Earring",
        body = "Vrikodara Jupon", --13
        hands = "Wicce Gloves +3", 
        ring1 = "Menelaus's Ring",
        ring2 = "Defending Ring",
        back = Taranus.Cure, --10
        waist = "Luminary Sash",
        legs = "Gyve Trousers",
        feet = "Vanya Clogs" --11
    }
    
    sets.SelfCures = {
        ammo = "Staunch Tathlum +1",
        head = "Carmine Mask +1",
        neck = "Phalaina Locket",
        ear1 = "Mendicant's Earring",
        ear2 = "Regal Earring",
        body = "Vrikodara Jupon",
        hands = "Telchine Gloves",
        ring1 = "Kunaji Ring",
        ring2 = "Menelaus's Ring",
        back = Taranus.Cure,
        waist = "Gishdubar Sash",
        legs = "Telchine Braconi",
        feet = "Vanya Clogs"
    }
	
    --Enhancing Sets--
    
    sets.Enhancing = {
		ammo = "Pemphredo Tathlum",
        head = "Telchine Cap",
        neck = "Incanter's Torque",
        ear1 = "Andoaa Earring",
        body = "Telchine Chasuble",
		hands = "Telchine Gloves",
        back = "Fi Follet Cape +1",
		waist = "Embla Sash",
		ring1 = "Defending Ring",
		ring2 = "Stikini Ring +1",
        legs = "Telchine Braconi",
		feet = "Nyame Sollerets"
		
    }
	    sets.Enhancing.Bar = set_combine(sets.Enhancing, {
        neck = "Incanter's Torque",
        ear1 = "Andoaa Earring",
		legs = "Shedir Seraweels"
    })
    
    sets.Enhancing.Phalanx = {
--        head = HerculeanHelm.Phalanx,
        neck = "Incanter's Torque",
        ear1 = "Andoaa Earring",
--        body = HerculeanVest.Phalanx,
--        hands = HerculeanGloves.Phalanx,
--        feet = HerculeanFeet.Phalanx,
        back = "Fi Follet Cape +1",
		ring2 = {"Stikini Ring +1", priortiy = 2},
--        legs = HerculeanLegs.Phalanx
    }

    sets.Enhancing.Refresh = set_combine (sets.Enhancing,{ 
		head = "Amalric Coif +1",
		neck = "Loricate Torque +1",
        waist = "Gishdubar Sash"
    })
    
    sets.Enhancing.Aquaveil = set_combine (sets.Enhancing,{
        head = "Amalric Coif +1",
		neck = "Loricate Torque +1",
		hands = "Regal Cuffs",
		waist = "Emphatikos Rope",
		legs = "Shedir Seraweels"
    })
    
	sets.ElementalDebuffs = {
		ammo = "Pemphredo Tathlum",
		head = "Wicce Petasos +3",
		body = "Spaekona's Coat +3",
		neck = "Incanter's Torque",
		ear1 = "Malignance Earring",
		ear2 = "Regal Earring",
		hands = "Archmage's Gloves +3",
        ring1 = "Stikini Ring +1",
        ring2 = "Metamorph Ring +1",
		back = "Aurist's Cape +1",
		legs = "Archmage's Tonban +3",
		waist = "Acuity Belt +1",
		feet = "Archmage's Sabots +3"
	}	
	
	sets.Impact = {
		ammo = "Pemphredo Tathlum",
		body = "Twilight Cloak",
		neck = "Incanter's Torque",
		ear1 = "Malignance Earring",
		ear2 = "Regal Earring",
		hands = "Archmage's Gloves +3",
        ring1 = "Stikini Ring +1",
        ring2 = "Metamorph Ring +1",
		back = "Aurist's Cape +1",
		legs = "Archmage's Tonban +3",
		waist = "Acuity Belt +1",
		feet = "Archmage's Sabots +3"
	}
    ----------------
    --Utility Sets--
    ----------------
    --These sets are either called in rules (like TH or Herp-a-Derp DT) or locked in manually
    --Manual locking macro
    --/console gs equip sets.  <name>
    --/console gs c LockGearIndex
    --Hit it again to take it off
    sets.Utility = {}
    
    sets.Utility.TH = {
        waist = "Chaac Belt",
    }
	--Comes on when slept, terrored, stunned, and petrified--
    --Capped DT and -42% MDT, assumes shell etc may be gone after being unable to act--
    sets.Utility.DerpDT = {
        ammo = "Staunch Tathlum +1",
        head = "Malignance Chapeau",
        neck = "Loricate Torque +1",
		ear1 = "Eabani Earring",
        ear2 = "Etiolation Earring",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        ring1 = "Defending ring",
        ring2 = "Purity Ring",
        back = Taranus.MagicEva,
        waist = "Flume belt",
        legs = "Malignance Tights",
        feet = "Wicce Sabots +3"
    }
    
    sets.Utility.Doom = {
		neck = "Nicander's Necklace",
		ring2 = "Saida Ring",
        ring1 = "Purity Ring",
        waist = "Gishdubar Sash"
    }
	
	sets.JA = {} 
	sets.JA.ManaWall = {
		feet = "Wicce Sabots +3"
	} 
	
	--Precast Sets--
    sets.precast = {}

    sets.precast.FC = {}

    sets.precast.FC.Standard = {
        ammo = "Sapience Orb",
        head = "Amalric Coif +1",
        neck = "Baetyl Pendant",
        ear1 = "Malignance Earring",
        ear2 = "Loquac. Earring",
		body = MerlinicBody.FC,
        hands = "Agwu's Gages",
        ring1 = "Kishar Ring",
        ring2 = "Rahab Ring",
        back = Taranus.FC,
        waist = "Witful Belt",
        legs = "Agwu's Slops",
        feet = MerlinicFeet.FC
    }

    --42% FC needed--
    sets.precast.FC.Elemental = {
        ammo = "Sapience Orb", --2
        head = "Amalric Coif +1", --11
        neck = "Baetyl Pendant", --4
        ear1 = "Malignance Earring", --4
        ear2 = "Loquac. Earring", --2
		body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        ring1 = "Defending Ring",
        ring2 = "Gelatinous Ring +1",
        back = Taranus.FC, --10
        waist = "Witful Belt", --3
        legs = "Agwu's Slops", --7 = 43
        feet = "Nyame Sollerets"
    }    
	
	--42% FC needed--
    sets.precast.FC.Impact = {
        ammo = "Sapience Orb", --2
        neck = "Baetyl Pendant", --4
        ear1 = "Malignance Earring", --4
        ear2 = "Loquac. Earring", --2
		body = "Twilight Cloak",
        hands = "Nyame Gauntlets",
        ring1 = "Defending Ring",
        ring2 = "Gelatinous Ring +1",
        back = Taranus.FC, --10
        waist = "Witful Belt", --3
        legs = "Agwu's Slops", --7 
        feet = MerlinicFeet.FC --11 =43
    } 
	
	sets.precast.FC.DeathStandard = {
        ammo = "Sapience Orb",
        head = "Amalric Coif +1",
        neck = "Baetyl Pendant",
        ear2 = "Etiolation Earring",
        ear1 = "Loquac. Earring",
		body = "Rosette Jaseran +1", --5
        hands = "Agwu's Gages",
        ring1 = "Mephitas's Ring +1",
        ring2 = "Rahab Ring",
        back = Taranus.FC,
        waist = "Shinjutsu-no-Obi +1", --5,
        legs = "Agwu's Slops",
        feet = "Amalric Nails +1"
    }

    --42% FC needed--
    sets.precast.FC.DeathElemental = {
        ammo = "Sapience Orb", --2
        head = "Amalric Coif +1", --11
        neck = "Baetyl Pendant", --4
        ear2 = "Etiolation Earring", --4
        ear1 = "Barkarole Earring", --3
		body = "Rosette Jaseran +1", --5
        hands = "Nyame Gauntlets",
        ring1 = "Mephitas's Ring +1",
        ring2 = "Rahab Ring",
        back = Taranus.FC, --10
        waist = "Shinjutsu-no-Obi +1", --5
        legs = "Agwu's Slops", --7 
        feet = "Amalric Nails +1" -- 6 = 
    }    
	
	--42% FC needed--
    sets.precast.FC.DeathImpact = {
        ammo = "Sapience Orb", --2
        neck = "Baetyl Pendant", --4
        ear2 = "Etiolation Earring", --4
        ear1 = "Loquac. Earring", --2
		body = "Twilight Cloak",
        hands = "Nyame Gauntlets",
        ring1 = "Mephitas's Ring +1",
        ring2 = "Gelatinous Ring +1",
        back = Taranus.FC, --10
        waist = "Shinjutsu-no-Obi +1", --5
        legs = "Agwu's Slops", --7 
        feet = "Amalric Nails +1" --6 =
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

	Elemental_Debuffs = S {'Shock', 'Rasp', 'Choke', 'Frost', 'Burn', 'Drown'}
	
	Elemental_Earth = S {'Stone', 'Stone II', 'Stone III', 'Stone IV', 'Stone V', 'Stone VI', 'Stonega', 'Stonega II', 'Stonega III', 'Stoneja', 'Quake', 'Quake II' }
   
	Elemental_Dark = S {'Comet', 'Death'}
	
	Elemental_Aja = S{'Stoneja', 'Waterja', 'Aeroja', 'Firaja', 'Blizzaja', 'Thundaja', 'Comet'}
	
	Mana_Wall_Staves = S{"Archmage's Staff","Kaumodaki"}
		
   
end

------------------------
--   Town Gear List   --
------------------------ 

Town = S {
    "Ru'Lude Gardens", "Upper Jeuno", "Lower Jeuno", "Port Jeuno",
    "Port Windurst", "Windurst Waters", "Windurst Woods", "Windurst Walls", "Heavens Tower",
    "Port San d'Oria", "Northern San d'Oria", "Southern San d'Oria", "Chateau d'Oraguille",
    "Port Bastok", "Bastok Markets", "Bastok Mines", "Metalworks",
    "Aht Urhgan Whitegate", "Nashmau", "Rabao",
    "Selbina", "Mhaura", "Norg", "Kazham", "Tavanazian Safehold",
    "Eastern Adoulin", "Western Adoulin", "Celennia Memorial Library"
}

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
    add_to_chat (21, 'Your Lockstyle looks like shit, and you should feel bad')
    add_to_chat (55, 'You are on '..('BLM '):color(5)..''..('btw. '):color(55)..''..('Macros set!'):color(121))
	add_to_chat (60, 'Blow shit up')
end


--Page, Book--
set_macros(1,2)
--Use the Lockstyle Number-- 
set_style(58)
-------------------------------
--         Variables         --
-------------------------------
SetLocked = false --Used to Check if set is locked before changing equipment
LockedEquipSet = {} --Placeholder to store desired lock set
LockGearSet = {}
equipSet = {} --Currently Equiped Gearset
LockGearIndex = false
TargetDistance = 0
TH = false
DT = false
DW = false
AutoDW = false
SIR = false
DeathMode = false
BurstMode = false
OccultAcumen = false
Aja_Duration_Boost = false
Aja_Table = {} --Holds the queue of -ja debuffed mobs
Aja_Table_ind = 0 --used to create "uniqueness" for each mob in queue
Aja_Current_Boost = ""--Stores current cumulative magic effect -- I took these three lines and logic from TheFoxDanger after telling him I suck at trying to create it.
ManaWall = false
Coat = false


--TH rule description--
--TH in this GS works as follows. alt T or macro the command in to turn it on and off
--It will equip when engaging, and after an action is performed by you it comes off until you re-engage or toggle it on and off.
---You can change this, but I found it silly to full time it.
--If you are idle, and cast either physical blue spells or offensive magical blue spells it will equip on top of your sets.
---Diaga and stuff don't apply. Feel free to add it.
--When you return to being strictly idle, it doesn't equip either, becuase that would be pointless.

--So basically, TH gear (add yours in where applicable) comes on when engaging unti a new action is performed, and while idle using physical or offensive magical nukes.

------------------------------------
--         Windower Hooks         --
------------------------------------

function buff_change(n, gain, buff_table)
    local name
    name = string.lower(n)
    if S{"terror","petrification","sleep","stun"}:contains(name) then
        if gain then
            ChangeGear(sets.Utility.DerpDT)
        elseif not has_any_buff_of({"terror","petrification","sleep","stun"}) then
            if player.status == 'Engaged' then
                if LockGearIndex then
                    ChangeGear(LockGearSet)
                elseif not LockGearIndex then
                    if DT == true then
						ChangeGear(sets.DT[sets.DT.index[DT_ind]])
					elseif DW == true then
						ChangeGear(set_combine(sets.TP[sets.TP.index[TP_ind]], sets.DW[sets.DW.index[DW_ind]]))
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
					elseif DW == true then
						ChangeGear(set_combine(sets.TP[sets.TP.index[TP_ind]], sets.DW[sets.DW.index[DW_ind]]))
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
	end
	
	if name == "manawall" then
		if gain then
			Manawall = true
		else
			Manawall = false
		end
	end

end

function has_any_buff_of(buff_set)--returns true if you have any of the buffs given
    for i,v in pairs(buff_set) do
        if buffactive[v] ~= nil then return true end
    end
end

counter = 0
windower.raw_register_event('prerender',function() --yoinked from Thefoxdanger
      counter = counter + 1;
      if counter > 15 then -- limit the frequency at which this updates (make the value larger if you want it to be less responsive, DO NOT MAKE IT 0)
          if not Mana_Wall_Staves:contains(player.equipment.main) and buffactive['Mana Wall'] then
              send_command('gs equip sets.JA.ManaWall')
          end
          counter = 0 
      end
end)  
---------------------------
--         Binds         --
---------------------------
send_command('bind f9 gs c toggle TP set') --This means if you hit f9 it toggles the sets
send_command('bind f10 gs c toggle WS sets')
send_command('bind f11 gs c toggle  Coat') --Nuke in AF body or not
send_command('bind f12 gs c toggle Idle set')
send_command('bind @f7 gs c toggle AutoDW') -- @ means windows key, you may change this to whatever you want. 
send_command('bind @f8 gs c toggle DW Mode') --Manually turns DW on or off. Not needed if AutoDW is on.
send_command('bind @f9 gs c toggle DW set') -- Toggle which DW set you are in. Used if manual is on.
send_command('bind ^` gs c toggle BurstMode') -- cntrl tilde
send_command('bind ^space gs c toggle OccultAcumen') -- cntrl spacebar
send_command('bind ^f7 gs c toggle SIR')
send_command('bind ^f8 input /ws "Cataclysm" <t>')
send_command('bind ^f9 input /ws "Shatter Soul" <t>') -- ^ means cntrl, so hit cntrl + f9
send_command('bind ^f10 input /ws "Vidohunir" <t>')
send_command('bind ^f11 input /ws "Earth Crusher" <t>')
send_command('bind ^f12 input /ws "Myrkr" <me>')
send_command('bind !f7 gs c toggle DT set') -- ! stands for the Alt key. this exists only for toggling outside of this mode being active, otherwise f9
send_command('bind !f8 gs c toggle DT') -- DT on or off
send_command('bind !f9 gs c toggle backwards')
send_command('bind !f10 gs c toggle Magic Set') -- Toggles macc and mab nuke sets
send_command('bind !f11 gs c toggle Death Mode')  
send_command('bind !f12 gs c LockGearIndex') --Locks gear on

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
	send_command('unbind ^`')
	send_command('unbind ^space')
	send_command('unbind @f8')
	send_command('unbind @f9')
	send_command('unbind !@')
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
    send_command('unbind !q')
    send_command('unbind !t')
end
--------------------------------------
--         Console Commands         --
--------------------------------------
function self_command(command)
    if command == 'togglelock' then
        if SetLocked == false then
            SetLocked = true
        msg("Equipment Set LOCKED !!!")
        else
            SetLocked = false
            msg("Equipment Set UNLOCKED!")
        end
    elseif command == 'LockGearIndex' then
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
        --        feet = player.equipment.feet
            }
            msg("Gear Index Locked")
        else
            LockGearIndex = false
            msg("Gear Index Unlocked")
            if player.status == 'Engaged' then
                if DT == true then
					ChangeGear(sets.DT[sets.DT.index[DT_ind]])
				elseif DW == true then
					ChangeGear(set_combine(sets.TP[sets.TP.index[TP_ind]], sets.DW[sets.DW.index[DW_ind]]))
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
				send_command('@input /echo <----- DT Set changed to ' .. sets.DT.index[DT_ind] .. '  ----->')
				if not LockGearIndex then
					ChangeGear(sets.DT[sets.DT.index[DT_ind]])
				else
					send_command('@input /echo <----- LockGear is on, not equiping ----->')
				end
			elseif DT == false then
			TP_ind = TP_ind + 1
			if TP_ind > #sets.TP.index then TP_ind = 1 end
				send_command('@input /echo <----- TP Set changed to ' .. sets.TP.index[TP_ind] .. ' ----->')
			if player.status == 'Engaged' then
				if DW == true then
					ChangeGear(set_combine(sets.TP[sets.TP.index[TP_ind]], sets.DW[sets.DW.index[DW_ind]]))
				else
					ChangeGear(sets.TP[sets.TP.index[TP_ind]])
				end
			end
        end
	elseif command == 'toggle DW set' then
		DW_ind = DW_ind + 1
		if DW_ind > #sets.DW.index then DW_ind = 1 end
			send_command('@input /echo <----- Dual Wield Set changed to ' .. sets.DW.index[DW_ind] .. ' ----->')
		if player.status == 'Engaged' then
			if DW == true and DT == false then
				ChangeGear(set_combine(sets.TP[sets.TP.index[TP_ind]], sets.DW[sets.DW.index[DW_ind]]))
			end
		end
    elseif command == 'toggle Idle set' then
        Idle_ind = Idle_ind + 1
        if Idle_ind > #sets.Idle.index then Idle_ind = 1 end
        send_command('@input /echo <----- Idle Set changed to ' .. sets.Idle.index[Idle_ind] .. ' ----->')
		if Idle_ind == 3 then
				DeathMode = true
			else
				DeathMode = false
		end
		if player.status == 'Idle' then
			ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
        end
    elseif command == 'toggle WS sets' then
        Expiacion_ind = Expiacion_ind + 1
        Requiescat_ind = Requiescat_ind + 1
		CDC_ind = CDC_ind + 1
		BlackHalo_ind = BlackHalo_ind + 1
        Judgment_ind = Judgment_ind + 1
        if Expiacion_ind > #sets.Expiacion.index then Expiacion_ind = 1 end
        if Requiescat_ind > #sets.Requiescat.index then Requiescat_ind = 1 end
		if CDC_ind > #sets.CDC.index then CDC_ind = 1 end
		if BlackHalo_ind > #sets.BlackHalo.index then BlackHalo_ind = 1 end
        if Judgment_ind > #sets.Judgment.index then Judgment_ind = 1 end
        send_command('@input /echo <----- WS Sets changed to ' .. sets.CDC.index[CDC_ind] .. ' ----->')
    elseif command == 'toggle DT set' then
        DT_ind = DT_ind + 1
        if DT_ind > #sets.DT.index then DT_ind = 1 end
        send_command('@input /echo <----- DT Set changed to ' .. sets.DT.index[DT_ind] .. '  ----->')
            if DT == true and LockGearIndex == false then
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
	elseif command == 'toggle AutoDW' then
        if AutoDW == true then
            AutoDW = false
            send_command('@input /echo <----- AUTOMATIC Dual Wield: [Off] ----->')
        else
            AutoDW = true
            send_command('@input /echo <----- AUTOMATIC Dual Wield: [On] ----->')
        end
        status_change(player.status)
	elseif command == 'toggle DW Mode' then
        if DW == true then
            DW = false
            send_command('@input /echo <----- Dual Wield TP: [Off] ----->')
        else
            DW = true
            send_command('@input /echo <----- Dual Wield TP: [On] ----->')
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
	elseif command == 'toggle BurstMode' then
		if BurstMode == true then
			BurstMode = false
			send_command('@input /echo <----- Magic Burst Mode: [Off] ----->')
        else
			BurstMode = true
			send_command('@input /echo <----- Magic Burst Mode: [On] ----->')
		end
	elseif command == 'toggle OccultAcumen' then
		if OccultAcumen == true then
			OccultAcumen = false
			send_command('@input /echo <----- Occult Acumen: [Off] ----->')
        else
			OccultAcumen = true
			send_command('@input /echo <----- Occult Acumen: [On] ----->')
		end
    elseif command == 'toggle TH' then
        if TH == true then
            TH = false
            send_command('@input /echo <----- Treasure Hunter TP: [Off] ----->')
        else
            TH = true
            send_command('@input /echo <----- Treasure Hunter TP: [On] ----->')
        end
    elseif command == 'toggle Coat' then
        if Coat == true then
            Coat = false
            send_command('@input /echo <----- Spaekona\'s Coat: [Off] ----->')
        else
            Coat = true
            send_command('@input /echo <----- Spaekona\'s Coat: [On] ----->')
        end
	elseif command == "reset Aja_Duration Timer" then
		send_command("@input /echo <----- ".. Aja_Table[1] ..": Cumulative Magic Effect Has Worn Off ----->")
		table.remove(Aja_Table,1)
		Aja_Table_ind = Aja_Table_ind - 1
		if Aja_Table[1] == nil then
			Aja_Duration_Boost = false
			send_command("@input /echo <----- All Cumulative Magic Duration Effects Have Expired ----->")
		end
    elseif command == 'toggle backwards' then
        if DT == true then
            DT_ind = DT_ind -1
            if DT_ind == 0 then
                DT_ind = #sets.DT.index
            end
send_command('@input /echo <----- DT Set changed to ' .. sets.DT.index[DT_ind] .. '  ----->')
			if not LockGearIndex then
				ChangeGear(sets.DT[sets.DT.index[DT_ind]])
			end
        elseif DT == false then
            TP_ind = TP_ind -1
            if TP_ind == 0 then
                TP_ind = #sets.TP.index
            end
            send_command('@input /echo <----- TP Set changed to ' .. sets.TP.index[TP_ind] .. ' ----->')
            if player.status == 'Engaged' then
				if DW == true then
					ChangeGear(set_combine(sets.TP[sets.TP.index[TP_ind]], sets.DW[sets.DW.index[DW_ind]]))
                else
                    ChangeGear(sets.TP[sets.TP.index[TP_ind]])
                end
            end
        end
    elseif command == 'ZoneChange' then
        IdleState()
    elseif command == 'toggle Magic Set' then
        Nukes_ind = Nukes_ind + 1
        Bursts_ind = Bursts_ind + 1
        if Nukes_ind > #sets.Nukes.index then Nukes_ind = 1 end
        if Bursts_ind > #sets.Bursts.index then Bursts_ind = 1 end
        send_command('@input /echo <----- Nuke Type Changed To: ' .. sets.Nukes.index[Nukes_ind] .. '----->')
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
    
    --if Idle_ind == 1 and DT == false and player.status == 'Idle' and not then
		--if player.mpp <= 50 then
			--ChangeGear({})
		--elseif player.mpp <= 65 then
		--	ChangeGear({})
		--elseif player.mpp <= 75 then
		--	ChangeGear({})
		--elseif player.mpp <= 85 then
		--	ChangeGear({})
		--end
    --end
    
	if Idle_ind == 1 and buffactive['Protect'] and buffactive['Shell'] then
		ChangeGear({ear1 = "Infused Earring"})
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
		elseif DW == true then
			ChangeGear(set_combine(sets.TP[sets.TP.index[TP_ind]], sets.DW[sets.DW.index[DW_ind]]))
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
	elseif spell.action_type == 'Ability' and spell.type ~= 'WeaponSkill'  and spell.type ~= 'Scholar' and (has_any_buff_of(unusable_buff.ability) or not check_recast('ability',spell.recast_id)) then
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
	if player.tp >= 1000 and player.target and player.target.distance and player.target.distance > 7 and spell.type == 'WeaponSkill' then
		msg("Weapon Skill Canceled  Target Out of Range")
		return true
	end
end

function gearchang_stopper(spell)--returns true if a spell will be blocked by a buff
    if spell then
        if spell.action_type == "Ability" and has_any_buff_of(unusable_buff.ability) then
            return true
        elseif spell.action_type == "Magic" and has_any_buff_of(unusable_buff.spell) then
            return true
        end
    end
    if ((S{"pet_midcast","pet_aftercast"}:contains(_global.current_event) and false or Watch_pet_midaction) and pet_midaction() or false) 
      or ((S{"midcast","aftercast"}:contains(_global.current_event) and false or Watch_midaction) and midaction() or false) then
        return true
    end
end
-----------------------------
--         Precast         --
-----------------------------
function pc_JA(spell, act)
    if spell.english == 'Manafont' then
        ChangeGear({body="Archmage's Coat"})
    end
    
    IgnoreWS = S { "Sanguine Blade", "Red Lotus Blade", "Seraph Blade", "Flash Nova", "Vidohunir", "Chant du Cygne" } -- Excluded from Moonshade TP override rule. CDC is now as well, it no longer needs Moonshade with 2 +1 Mache
	RegalWS = S {"Savage Blade", "Expiacion"}
	
	if spell.type == 'WeaponSkill' then
		if spell.english == 'Requiescat' then
            ChangeGear(sets.Requiescat[sets.Requiescat.index[Requiescat_ind]])
        elseif spell.english == 'Myrkr' then
            ChangeGear(sets.Myrkr)
        elseif spell.english == 'Shattersoul' then
            ChangeGear(sets.Shattersoul)	    
		elseif spell.english == 'Black Halo' then
            ChangeGear(sets.BlackHalo[sets.BlackHalo.index[BlackHalo_ind]])			
        elseif spell.english == 'Vidohunir' or spell.english == 'Cataclysm' then
			if world.day_element == 'Dark' or world.weather_element == 'Dark' then
					ChangeGear(set_combine(sets.Vidohunir,{waist = 'Hachirin-no-Obi'}))
			else
				ChangeGear(sets.Vidohunir)
			end
        elseif spell.english == 'Rock Crusher' or spell.english == 'Earth Crusher' then
			if world.day_element == 'Earth' or world.weather_element == 'Earth' then
					ChangeGear(set_combine(sets.EarthCrusher,{waist = 'Hachirin-no-Obi'}))
			else
				ChangeGear(sets.EarthCrusher)
			end
        end
		
		--WS TP Rules, so you dont use moonshade when you have TP overflow--
        if player.tp > 1525 and player.equipment.sub == 'Thibron' and buffactive['TP Bonus'] then 
            if IgnoreWS:contains(spell.english) then
                return
            elseif IgnoreWS:contains(spell.english) then
			    equip(set_combine(equipSet, { ear1 = "Regal Earring" }))
                msg("Regal Earring equiped !!!!")
			else
                equip(set_combine(equipSet, { ear1 = "Ishvara Earring" }))
                msg("Ishvara Earring equiped !!!!")
            end
		elseif player.tp > 1775 and player.equipment.sub == 'Thibron' then
            if IgnoreWS:contains(spell.english) then
                return
			elseif IgnoreWS:contains(spell.english) then
			    equip(set_combine(equipSet, { ear1 = "Regal Earring" }))
                msg("Regal Earring equiped !!!!")
            else
                equip(set_combine(equipSet, { ear1 = "Ishvara Earring" }))
                msg("Ishvara Earring equiped !!!!")
            end
        elseif player.tp > 2025 and player.equipment.main == 'Sequence' and buffactive['TP Bonus'] then
            if IgnoreWS:contains(spell.english) then
                return
			elseif IgnoreWS:contains(spell.english) then
			    equip(set_combine(equipSet, { ear1 = "Regal Earring" }))
                msg("Regal Earring equiped !!!!")
            else
                equip(set_combine(equipSet, { ear1 = "Ishvara Earring" }))
                msg("Ishvara Earring equiped !!!!")
            end
        elseif player.tp > 2275 and player.equipment.main == 'Sequence' then
            if IgnoreWS:contains(spell.english) then
                return
			elseif IgnoreWS:contains(spell.english) then
			    equip(set_combine(equipSet, { ear1 = "Regal Earring" }))
                msg("Regal Earring equiped !!!!")
            else
                equip(set_combine(equipSet, { ear1 = "Ishvara Earring" }))
                msg("Ishvara Earring equiped !!!!")
            end
        elseif player.tp > 2550 and buffactive['TP Bonus'] then
            if IgnoreWS:contains(spell.english) then
                return
			elseif spell.english == 'Expiacion' or spell.english == 'Savage Blade' then
			    equip(set_combine(equipSet, { ear1 = "Regal Earring" }))
                msg("Regal Earring equiped !!!!")
            else
                equip(set_combine(equipSet, { ear1 = "Ishvara Earring" }))
                msg("Ishvara Earring equiped !!!!")
            end
        elseif player.tp > 2775 then
            if IgnoreWS:contains(spell.english) then
                return
			elseif IgnoreWS:contains(spell.english) then
			    equip(set_combine(equipSet, { ear1 = "Regal Earring" }))
                msg("Regal Earring equiped !!!!")
            else
                equip(set_combine(equipSet, { ear1 = "Ishvara Earring" }))
                msg("Ishvara Earring equiped !!!!")
            end
        end
   end

end

function pc_Magic(spell, act)

	if spell.action_type == 'Magic' then
		if DeathMode == true then 
			if spell.skill == 'Elemental Magic' then
				if spell.english == 'Impact' then
					ChangeGear(sets.precast.FC.DeathImpact)
				else
					ChangeGear(sets.precast.FC.DeathElemental)
				end
			else
				ChangeGear(sets.precast.FC.DeathStandard)
			end
		elseif DeathMode == false and spell.skill == 'Elemental Magic' then
			if spell.english == 'Impact' then
				ChangeGear(sets.precast.FC.Impact)
			else
				ChangeGear(sets.precast.FC.Elemental)
			end
		else
			ChangeGear(sets.precast.FC.Standard)
		end
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

    if spell.skill == 'Healing Magic' then
        if spell.target and spell.target.type == 'SELF' then
            ChangeGear(sets.SelfCures)
        else
            ChangeGear(sets.Cures)
        end
    end
    if spell.skill == 'Enhancing Magic' then
        if string.find(spell.english,'Shell') or string.find(spell.english,'Protect') then
            ChangeGear(set_combine(sets.Enhancing, {ear1 = "Brachyura Earring"}))
        elseif spell.english=="Phalanx" then
            ChangeGear(sets.Enhancing.Phalanx)
        elseif spell.english=="Haste" then
            ChangeGear(sets.Enhancing)
        elseif string.find(spell.english,'storm') then
			ChangeGear(sets.Enhancing)
        elseif spell.english=="Aquaveil" or "Stoneskin" then
            ChangeGear(sets.Enhancing.Aquaveil)
		elseif string.find(spell.english,'Bar') then
			ChangeGear(sets.Enhancing.Bar)
        elseif spell.english == 'Refresh' then
            ChangeGear(sets.Enhancing.Refresh)
		else
            ChangeGear(sets.Enhancing)
        end
    end
    if spell.skill == 'Enfeebling Magic' then
		ChangeGear(sets.Enfeebling)
    end
    if spell.skill == 'Dark Magic' then
		if string.find(spell.english,'Aspir') or string.find(spell.english,'Drain') then
			ChangeGear(sets.DarkMagic.DrainAspir)
		elseif spell.english == 'Stun' then
			ChangeGear(sets.DarkMagic.Stun)
		elseif spell.english == 'Death' then
			if BurstMode == true then
				ChangeGear(sets.DarkMagic.DeathBurst) --Death generally caps dmg if unreisted on bursts, no need for an array of sets
			else
				ChangeGear(sets.DarkMagic.Death)
			end
		elseif string.find(spell.english,'Absorb') then
			ChangeGear(sets.DarkMagic.Absorb)
		elseif string.find(spell.english,'Bio') or spell.english == 'Tractor' then
			ChangeGear(sets.Nukes[sets.Nukes.index[Nukes_ind]]) --update needed
		end
	end
	if spell.skill == 'Elemental Magic' then
		if spell.english == 'Impact' then
			ChangeGear(sets.Impact)
		elseif Elemental_Debuffs:contains(spell.english)then
			ChangeGear(sets.ElementalDebuffs)
		elseif OccultAcumen == true then
			ChangeGear(sets.OccultAcumen)
		elseif BurstMode == true then
			if Elemental_Dark:contains(spell.english) then
				ChangeGear(set_combine(sets.Bursts[sets.Bursts.index[Bursts_ind]],{head = "Pixie Hairpin +1", ring1 = "Metamorph Ring +1", ring2 = "Archon Ring"	}))
			else
				ChangeGear(sets.Bursts[sets.Bursts.index[Bursts_ind]])
			end
		elseif Elemental_Earth:contains(spell.english)  then
			ChangeGear(set_combine(sets.Nukes[sets.Nukes.index[Nukes_ind]],{neck = "Quanpur Necklace"}))
		elseif Elemental_Dark:contains(spell.english) then
				ChangeGear(set_combine(sets.Nukes[sets.Nukes.index[Nukes_ind]],{head = "Pixie Hairpin +1", ring1 = "Metamorph Ring +1", ring2 = "Archon Ring"	}))
		else
			ChangeGear(sets.Nukes[sets.Nukes.index[Nukes_ind]])
		end
	end
			--Obi rule--
	if world.day_element == spell.element or world.weather_element == spell.element and spell.english ~= 'Impact' then
		if spell.skill == 'Elemental Magic' and not Elemental_Debuffs:contains(spell.english) and OccultAcumen == false then
				ChangeGear({waist = 'Hachirin-no-Obi'})
		end
	end
	
	if Coat == true and spell.skill == 'Elemental Magic' and spell.english ~= 'Impact' then
			equip(set_combine(equipSet, { body = "Spaekona's Coat +3" }))
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
    
    if DT == true and LockGearIndex == false then
		ChangeGear(sets.DT[sets.DT.index[DT_ind]])
	end
end

IgnoreSIRSpell = S { "Placeholder"}

function precast(spell, act)
	if spell_control(spell) then
        cancel_spell()
        return
    end
	if spell.action_type == 'Ability' then
		pc_JA(spell, act)
	elseif not midaction() and spell.action_type == 'Magic' then
		pc_Magic(spell, act)
	else
		pc_Item(spell, act)
	end
end

function midcast(spell, act)

    if spell.action_type == 'Ability' then
        mc_JA(spell, act)
    elseif spell.action_type == 'Magic' then 
		if SIR == true then
			if IgnoreSIRSpell:contains(spell.english) then
				mc_Magic(spell, act)
			else
				ChangeGear(set_combine(sets.Idle.Evasion, {ammo = "Sapience Orb", ring1 = "Kishar Ring", ring2 = "Rahab Ring"})) -- create a SIR set
			end
		elseif (Elemental_Aja:contains(spell.english) and (Aja_Duration_Boost == false or Aja_Current_Boost ~= spell.english)) then -- applies Wicce duration boost
			if spell.english == 'Comet' then
				if Nukes_ind == 1 then
					if Coat  == true then
						ChangeGear(set_combine(sets.Nukes[sets.Nukes.index[Nukes_ind]],{
						head = "Pixie Hairpin +1", body = "Spaekona's Coat +3", legs = "Wicce Chausses +3", ring1 = "Archon Ring"}))
					else
						ChangeGear(set_combine(sets.Nukes[sets.Nukes.index[Nukes_ind]],{
						head = "Pixie Hairpin +1", legs = "Wicce Chausses +3", ring1 = "Archon Ring"}))
					end
				elseif Nukes_ind == 2 or Nukes_ind == 3 then
					if Coat == true then
						ChangeGear(set_combine(sets.Nukes[sets.Nukes.index[Nukes_ind]], {body = "Spaekona's Coat +3", legs = "Wicce Chausses +3"}))
					else
						ChangeGear(set_combine(sets.Nukes[sets.Nukes.index[Nukes_ind]], {legs = "Wicce Chausses +3"}))
					end
				end
			elseif Coat == true then 
					ChangeGear(set_combine(sets.Nukes[sets.Nukes.index[Nukes_ind]], {body = "Spaekona's Coat +3", legs = "Wicce Chausses +3"}))
				else
					ChangeGear(set_combine(sets.Nukes[sets.Nukes.index[Nukes_ind]], {legs = "Wicce Chausses +3"}))
			end
        elseif TH == true and player.status == 'Idle' then
            if spell.skill == 'Enhancing Magic' or spell.skill == 'Healing Magic' then
				mc_Magic(spell, act)
            elseif MagicalSpells:contains(spell.english) then
				if Elemental_Earth:contains(spell.english) then
					ChangeGear(set_combine(sets.Nukes[sets.Nukes.index[Nukes_ind]], sets.Utility.TH,{neck = "Quanpur Necklace"}))
				end
			elseif Elemental_Dark:contains(spell.english) then
				if Nukes_ind == 1 then
					ChangeGear(set_combine(sets.Nukes[sets.Nukes.index[Nukes_ind]], sets.Utility.TH,{
					head = "Pixie Hairpin +1", ring1 = "Archon Ring"}))
				elseif Nukes_ind == 2 or Nukes_ind == 3 then
					send_command('@input /echo <----- else TH rule ----->')
					ChangeGear(set_combine(sets.Nukes[sets.Nukes.index[Nukes_ind]], sets.Utility.TH))
				end
			end
        else 
            mc_Magic(spell, act)
        end
    else
        mc_Item(spell, act)
    end

end

function aftercast(spell, act, spellMap, eventArgs)
    if spell.action_type == 'Ability' then
        ac_JA(spell)
    elseif spell.action_type == 'Magic' then
		if Elemental_Aja:contains(spell.english) then	
			if (Aja_Duration_Boost == false or Aja_Current_Boost ~= spell.english) then
				Aja_Current_Boost = spell.english
				Aja_Table_ind = Aja_Table_ind + 1
				table.insert(Aja_Table, tostring(spell.target.name .. " #" .. Aja_Table_ind))
				send_command('timers create "'.. spell.english .. ': ' .. Aja_Table[Aja_Table_ind] .. '" 105 down spells/01015.png')
				Aja_Duration_Boost = true
				send_command('wait 105;input //gs c reset Aja_Duration Timer')
			end
		else
			ac_Magic(spell)
		end
    else
        ac_Item(spell)
    end
    ac_Global()
	
    --Countdowns--
    if not spell.interrupted then
        if spell.english == "Sleep" then
            send_command('wait 50;gs c -cd '..spell.name..': [Off In 10~30 Seconds!];wait 10;gs c -cd '..spell.name..': [Off In 0~20 Seconds!]')
            send_command('timers create "Sleep" 50 down')
        elseif spell.english == "Sleep" then
            send_command('wait 80;gs c -cd '..spell.name..': [Off In 10~30 Seconds!];wait 10;gs c -cd '..spell.name..': [Off In 0~20 Seconds!]')
            send_command('timers create "Sleep II" 70 down')
		elseif spell.english == 'Impact' then
				send_command('timers create "Impact ' ..tostring(spell.target.name).. ' " 180 down')
        elseif Elemental_Debuffs:contains(spell.english) then
			if spell.english == 'Burn' then
				send_command('timers create "Burn ' ..tostring(spell.target.name).. ' " 180 down')
			elseif spell.english == 'Choke' then
				send_command('timers create "Choke ' ..tostring(spell.target.name).. ' " 180 down')
			elseif spell.english == 'Shock' then
				send_command('timers create "Shock ' ..tostring(spell.target.name).. ' " 180 down')
			elseif spell.english == 'Frost' then
				send_command('timers create "Frost ' ..tostring(spell.target.name).. ' " 180 down')
			elseif spell.english == 'Drown' then
				send_command('timers create "Drown ' ..tostring(spell.target.name).. ' " 180 down')
			elseif spell.english == 'Rasp' then
				send_command('timers create "Rasp ' ..tostring(spell.target.name).. ' " 180 down')
			end
       elseif spell.english == "Breakga" then
            send_command('timers create "Breakga Petrification" 33 down')
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

---End of Rules---------------------------------------------------------------------------------------------------------------------------------------------------------