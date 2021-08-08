-------------------------------------------------------------------------------------------------------------------
-- Initialization function that defines sets and variables to be used.
-------------------------------------------------------------------------------------------------------------------
-- Haste II has the same buff ID [33], so we have to use a toggle. 
-- gs c toggle hastemode -- Toggles whether or not you're getting Haste II or H.March
-- for Rune Fencer sub, you need to create two macros. One cycles runes, and gives you descrptive text in the log.
-- The other macro will use the actual rune you cycled to. 
-- Macro #1 //console gs c cycle Runes
-- Macro #2 //console gs c toggle UseRune
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    include('organizer-lib')
	ShadowType = 'None'
end


-- Setup vars that are user-independent.
function job_setup()

    state.Buff.Migawari = buffactive.migawari or false
    state.Buff.Sange = buffactive.sange or false
    state.Buff.Innin = buffactive.innin or false

	state.MagicBurst = M(false, 'MagicBurst')
	state.AttackBuffs = M{['description']='Attack Mode', 'Normal', 'MidAttack', 'MaxAttack'}
	state.Weapon = M{['description']='Weapon Mode', 'Dual Wield', 'Hand-to-Hand', 'Great Katana'}
	state.Evasion = M(false, 'Evasion')

    include('Mote-TreasureHunter')
    state.TreasureMode = M{['description']='Treasure Hunter Mode', 'None', 'SATA', 'Fulltime'}

    state.HasteMode = M{['description']='Haste Mode', 'Normal', 'Hi', 'SV'}
    state.Runes = M{['description']='Runes', "Ignis", "Gelus", "Flabra", "Tellus", "Sulpor", "Unda", "Lux", "Tenebrae"}
    state.UseRune = M(false, 'Use Rune')
    state.UseWarp = M(false, 'Use Warp')
    state.Adoulin = M(false, 'Adoulin')
    state.Moving  = M(false, "moving")

    run_sj = player.sub_job == 'RUN' or false

    select_ammo()
    LugraWSList = S{'Blade: Shun', 'Blade: Ku', 'Blade: Jin'}
    state.CapacityMode = M(false, 'Capacity Point Mantle')

    gear.RegularAmmo = 'Seki Shuriken'
	gear.EnmityAmmo = 'Date Shuriken'
    gear.SangeAmmo = 'Happo Shuriken'

    wsList = S{'Blade: Hi', 'Blade: Kamu', 'Blade: Ten'}
	AttackModdedWSList = S{'Blade: Hi', 'Blade: Kamu', 'Blade: Ten', 'Blade: Metsu', 'Blade: Ku', 'Blade: Shun',
							'Savage Blade', 'Evisceration', 'Asuran Fists', 'Raging Fists', 'Combo', 'Tachi: Kasha'}
	
    ninjutsuNukeList = S{'Katon: San', 'Doton: San', 'Suiton: San', 'Raiton: San', 'Hyoton: San', 'Huton: San', 
					'Katon: Ni', 'Doton: Ni', 'Suiton: Ni', 'Raiton: Ni', 'Hyoton: Ni', 'Huton: Ni',
					'Katon: Ichi', 'Doton: Ichi', 'Suiton: Ichi', 'Raiton: Ichi', 'Hyoton: Ichi', 'Huton: Ichi'}
					
	check_ws_day = {
	Firesday = S {'Liquefaction','Fusion','Light'},
	Earthsday= S {'Scission','Gravitation','Darkness'},
	Watersday = S {'Reverberation','Distortion','Darkness'},
	Windsday = S {'Detonation','Fragmentation','Light'},
	Iceday = S {'Induration','Distortion','Darkness'},
	Lightningsday = S {'Impaction','Fragmentation','Light'},
	Lightsday = S {'Transfixion','Fusion','Light'},
	Darksday = S {'Compression','Gravitation','Darkness'},}		

    Magic_Enmity = S {
        'Blank Gaze', 'Jettatura', 'Geist Wall', 'Sheep Song', 'Soporific', 'Stun', 'Flash', 'Absorb-TP'
    }	

    update_combat_form()

    state.warned = M(false)
    options.ammo_warning_limit = 25
    -- For th_action_check():
    -- JA IDs for actions that always have TH: Provoke, Animated Flourish
    info.default_ja_ids = S{35, 204}
    -- Unblinkable JA IDs for actions that always have TH: Quick/Box/Stutter Step, Desperate/Violent Flourish
    info.default_u_ja_ids = S{201, 202, 203, 205, 207}

end


-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    -- Options: Override default values
    state.OffenseMode:options('Normal', 'DT', 'Experimental', 'Acc')
    state.HybridMode:options('Normal', 'PDT')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Normal', 'Low', 'Mid', 'Acc')
    state.PhysicalDefenseMode:options('PDT')
    state.MagicalDefenseMode:options('MDT')

    select_default_macro_book()

	send_command('bind @w gs c cycle Weapon')
	send_command('bind @e gs c toggle Evasion')
	send_command('bind @q gs c cycle AttackBuffs')
    send_command('bind ^= gs c cycle treasuremode')
    send_command('bind ^[ gs c toggle UseWarp')
    send_command('bind ![ input /lockstyle off')
    send_command('bind != gs c toggle CapacityMode')
    send_command('bind @f9 gs c cycle HasteMode')
    send_command('bind @[ gs c cycle Runes')
    send_command('bind ^] gs c toggle UseRune')
    send_command('bind !- gs equip sets.crafting')
	send_command('bind !` gs c toggle MagicBurst')

end


function file_unload()
    send_command('unbind ^[')
    send_command('unbind ![')
    send_command('unbind ^=')
    send_command('unbind !=')
    send_command('unbind @f9')
    send_command('unbind @[')
	send_command('unbind @w')
	send_command('unbind @e')
	send_command('unbind @q')
end


-- Define sets and vars used by this job file.
-- visualized at http://www.ffxiah.com/node/194 (not currently up to date 10/29/2015)
-- Happo
-- Hachiya
-- sets.engaged[state.CombatForm][state.CombatWeapon][state.OffenseMode][state.HybridMode][classes.CustomMeleeGroups] (any number)

-- Ninjutsu tips
-- To stick Slow (Hojo) lower earth resist with Raiton: Ni
-- To stick poison (Dokumori) or Attack down (Aisha) lower resist with Katon: Ni
-- To stick paralyze (Jubaku) lower resistence with Huton: Ni

function init_gear_sets()
    --------------------------------------
    -- Augments
    --------------------------------------
    Andartia = {}
    Andartia.TP = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	Andartia.TPLow = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	Andartia.WSD = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}
	Andartia.MAB = { name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}
	Andartia.Ten = { name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	Andartia.FC = { name="Andartia's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}}
	Andartia.Enmity = { name="Andartia's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Mag. Evasion+15',}}
	
	HercHelm = {}
	HercHelm.FC = { name="Herculean Helm", augments={'"Fast Cast"+5','Mag. Acc.+11',}}
	
	HercVest = {}
	
	HercHands = {}
	HercHands.WSD = { name="Herculean Gloves", augments={'"Store TP"+3','DEX+13','Weapon skill damage +8%','Accuracy+15 Attack+15',}}
	HercHands.Quad = { name="Herculean Gloves", augments={'Accuracy+14 Attack+14','Pet: Accuracy+15 Pet: Rng. Acc.+15','Quadruple Attack +3','Mag. Acc.+13 "Mag.Atk.Bns."+13',}}
	HercHands.TH = { name="Herculean Gloves", augments={'VIT+3','"Store TP"+5','"Treasure Hunter"+2','Accuracy+6 Attack+6',}}
	
	
	HercLegs = {}
	HercLegs.FC = { name="Herculean Trousers", augments={'Pet: STR+6','DEX+4','"Fast Cast"+7','Accuracy+7 Attack+7','Mag. Acc.+4 "Mag.Atk.Bns."+4',}}
	
	HercFeet = {}
	HercFeet.Quad = { name="Herculean Boots", augments={'CHR+1','Accuracy+10','Quadruple Attack +3','Accuracy+8 Attack+8',}}
	HercFeet.FC = { name="Herculean Boots", augments={'Pet: Haste+1','"Dual Wield"+3','"Fast Cast"+7','Mag. Acc.+4 "Mag.Atk.Bns."+4',}}
	
	AdhemarBody = {}
	AdhemarBody.FC = { name="Adhemar Jacket +1", augments={'HP+105','"Fast Cast"+10','Magic dmg. taken -4',}}
	AdhemarBody.TP = { name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}
	
	

    --------------------------------------
    -- Job Abilties
    --------------------------------------
    sets.precast.JA['Mijin Gakure'] = { legs="Mochizuki Hakama +3" }
    sets.precast.JA['Futae'] = { hands="Hattori Tekko +1" }
    sets.precast.JA['Provoke'] = { 
		ammo="Date Shuriken", -- 3
		head="Malignance Chapeau",
		neck="Unmoving Collar +1", -- 10
        ear1="Cryptic Earring", -- 4
        ear2="Trux Earring", -- 5
        body="Emet Harness +1", -- 10
		hands="Kurys Gloves", -- 9
        ring1="Eihwaz Ring", -- 5
        ring2="Supershear Ring", -- 5
		back=Andartia.Enmity, --10
		waist="Trance Belt", -- 4
		legs="Zoar Subligar +1", -- 6
        feet="Mochizuki Kyahan +3" -- 8
    } -- +79 enmity (+139 w/ yonin&gekka +30/+30, +164 with Tsuru/Shuhansadamune)
	
	--Sange isn't really used anymore
    sets.precast.JA.Sange = { ammo=gear.SangeAmmo, body="Mochizuki Chainmail +3" }

	sets.precast.JA['Yonin'] = sets.precast.JA['Provoke']	
	sets.precast.JA['Swordplay'] = sets.precast.JA['Provoke']
	sets.precast.JA['Vallation'] = sets.precast.JA['Provoke']
	sets.precast.JA['Pflug'] = sets.precast.JA['Provoke']
	sets.precast.JA['Sentinel'] = sets.precast.JA['Provoke']
	sets.precast.JA['Shield Bash'] = sets.precast.JA['Provoke']
	sets.precast.JA['Souleater'] = sets.precast.JA['Provoke']
	sets.precast.JA['Last Resort'] = sets.precast.JA['Provoke']
	
	
    -- Waltz (chr and vit)
    sets.precast.Waltz = {}
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    -- Set for acc on steps, since Yonin drops acc a fair bit
    sets.precast.Step = {}
    sets.midcast.Trust =  sets.precast.FC
    sets.midcast["Apururu (UC)"] = set_combine(sets.midcast.Trust, {
        body="Apururu Unity shirt",
    })
    sets.Warp = { ring1="Warp Ring" }

    --------------------------------------
    -- Utility Sets for rules below
    --------------------------------------
    sets.TreasureHunter = {}
    sets.CapacityMantle = { back="Mecistopins Mantle" }
    sets.WSDayBonus     = { head="Gavialis Helm" }
    sets.WSBack         = { back="Atheling Mantle" }
    sets.BrutalLugra    = { ear1="Lugra Earring +1", ear2="Brutal Earring" }
    sets.BrutalTrux     = { ear1="Trux Earring", ear2="Brutal Earring" }
    sets.BrutalMoon     = { ear1="Brutal Earring", ear2="Moonshade Earring" }
    sets.Rajas          = {  }

    sets.RegularAmmo    = { ammo=gear.RegularAmmo }
	sets.EnmityAmmo		= { ammo=gear.EnmityAmmo }
    sets.SangeAmmo      = { ammo=gear.SangeAmmo }

    sets.NightAccAmmo   = { ammo="Coiste Bodhar" }
    sets.DayAccAmmo     = { ammo="Coiste Bodhar" }

    --------------------------------------
    -- Ranged
    --------------------------------------

    sets.precast.RA = {}
    sets.midcast.RA = {}
    sets.midcast.RA.Acc = set_combine(sets.midcast.RA, {})
    sets.midcast.RA.TH = set_combine(sets.midcast.RA, sets.TreasureHunter)
	sets.TreasureHunter = {
		ammo="Perfect Lucky Egg",
		head="Volte Cap",
		hands=HercHands.TH,
		waist="Chaac Belt"
	}

    -- Fast cast sets for spells
    sets.precast.FC = {
        ammo="Sapience Orb", --2
		head=HercHelm.FC, --12
		neck="Baetyl Pendant", --5
        ear1="Loquacious Earring", --2
		ear2="Enchanter's Earring +1", --2
        body=AdhemarBody.FC, --10
		hands="Leyline Gloves", --8
		ring1="Kishar Ring", --4
		ring2="Rahab Ring", --2
		back=Andartia.FC, --10
		waist="Flume Belt +1",
		legs=HercLegs.FC, --5
		feet=HercFeet.FC --7
	} --69 nice!
	
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, { 
		body="Mochizuki Chainmail +3",
		back=Andartia.FC
	})
	

    -- Midcast Sets
    sets.midcast.FastRecast = {}

    -- skill ++ 
    sets.midcast.Ninjutsu = {
		ammo="Yamarang",
        head="Hachiya Hatsuburi +3",
        neck="Incanter's Torque",
		ear1="Dignitary's Earring",
		ear2="Enchanter's Earring +1",
		body="Malignance Tabard",
		hands="Malignance Gloves",
        ring1="Regal Ring",
        ring2="Stikini Ring",
		back=Andartia.MAB,
		legs="Malignance Tights",
        feet="Mochizuki Kyahan +3"
	}
	
	--Use a spell you won't cast to apply quick TH
	sets.midcast['Kurayami: Ichi'] = set_combine(sets.midcast.Ninjutsu, {
		ammo="Perfect Lucky Egg",
		head="Volte Cap",
		hands=HercHands.TH,
		waist="Chaac Belt" 
	})
	
    -- any ninjutsu cast on self
    sets.midcast.SelfNinjutsu = set_combine(sets.precast.JA['Provoke'], {})
    
	sets.midcast.Utsusemi = {
        ammo="Sapience Orb", --2
		head=HercHelm.FC, --10
		neck="Baetyl Pendant", --5
        ear1="Loquacious Earring", --2
		ear2="Enchanter's Earring +1", --2
        body=AdhemarBody.FC, --10
		hands="Leyline Gloves", --8
		ring1="Kishar Ring", --4
		ring2="Rahab Ring",--2
		back=Andartia.FC, --10
		waist="Flume Belt +1",
		legs=HercLegs.FC, --5
		feet="Hattori Kyahan +1"
	}
	
	sets.midcast.Utsusemi.Enmity = set_combine(sets.precast.JA['Provoke'], {
		back=Andartia.Enmity,
        feet="Hattori Kyahan +1"
	})
    
	sets.midcast.Migawari = set_combine(sets.midcast.SelfNinjutsu, {
        ammo="Sapience Orb", --2
		head="Hachiya Hatsuburi +3",
		neck="Incanter's Torque",
        ear1="Loquacious Earring", --2
		ear2="Enchanter's Earring +1", --2
        body=AdhemarBody.FC, --10
		hands="Leyline Gloves", --8
		ring1="Kishar Ring", --4
		ring2="Rahab Ring", --2
		back=Andartia.FC, --10
		waist="Trance Belt",
		legs=HercLegs.FC, --5
		feet="Mochizuki Kyahan +3"
	}) -- 53% FC

    -- Nuking Ninjutsu (skill & magic attack)
    sets.midcast.ElementalNinjutsu = {
		ammo="Pemphredo Tathlum",
        head="Mochizuki Hatsuburi +3",
		neck="Baetyl Pendant",
        ear1="Friomisi Earring",
		--ear2="Hnoss Earring",
        ear2="Crematio Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Acumen Ring",
        ring2="Dingir Ring",
		back=Andartia.MAB,
		waist="Eschan Stone",
		legs="Nyame Flanchard",
        --feet=HercFeet.Hyb
		feet="Mochizuki Kyahan +3"
	}
	
    sets.Burst = { 
		ammo="Pemphredo Tathlum",
        head="Mochizuki Hatsuburi +3",
		neck="Baetyl Pendant",
		ear1="Static Earring", --5/0
        ear2="Crematio Earring",
		body="Nyame Mail", --7/0
        hands="Nyame Gauntlets", --5/0
		ring1="Locus Ring", --5/0
		ring2="Mujin Band", --0/5
		back=Andartia.MAB,
		waist="Eschan Stone",
		legs="Nyame Flanchard", --6/0
		feet="Mochizuki Kyahan +3"		
	} --28/5
	
    sets.BurstWeather = { 
		ammo="Pemphredo Tathlum",
        head="Mochizuki Hatsuburi +3",
		neck="Baetyl Pendant",
		ear1="Static Earring", --5/0
        ear2="Crematio Earring",
		body="Nyame Mail", --7/0
        hands="Nyame Gauntlets", --5/0
		ring1="Locus Ring", --5/0
		ring2="Mujin Band", --0/5
		back=Andartia.MAB,
		waist="Hachirin-no-Obi",
		legs="Nyame Flanchard", --6/0
		feet="Mochizuki Kyahan +3"		
	} --28/5
	
    sets.BurstFutae = { 
		ammo="Pemphredo Tathlum",
        head="Mochizuki Hatsuburi +3",
		neck="Baetyl Pendant",
		ear1="Static Earring", --5/0
        ear2="Crematio Earring",
		body="Nyame Mail", --7/0
        hands="Hattori Tekko +1",
		ring1="Locus Ring", --5/0
		ring2="Mujin Band", --0/5
		back=Andartia.MAB,
		waist="Eschan Stone",
		legs="Nyame Flanchard", --6/0
		feet="Mochizuki Kyahan +3"		
	} --23/5

    sets.BurstFutaeWeather = { 
		ammo="Pemphredo Tathlum",
        head="Mochizuki Hatsuburi +3",
		neck="Baetyl Pendant",
		ear1="Static Earring", --5/0
        ear2="Crematio Earring",
		body="Nyame Mail", --7/0
        hands="Hattori Tekko +1",
		ring1="Locus Ring", --5/0
		ring2="Mujin Band", --0/5
		back=Andartia.MAB,
		waist="Hachirin-no-Obi",
		legs="Nyame Flanchard", --6/0
		feet="Mochizuki Kyahan +3"		
	} --23/5	

    --Set to be equipped when Day/Weather match current spell element
	sets.Obi = {waist="Hachirin-no-Obi"}
	
	--Set to equip empy hands during futae
	sets.Futae = {
		hands="Hattori Tekko +1"
	}
	
	-- Issekigan: CE boost per parry is increased by enmity
	-- This set overrides your engaged set if Yonin is active (assumes you are tanking)
	sets.Issekigan = {
		ammo="Date Shuriken", -- 3
		head="Malignance Chapeau",
		neck="Unmoving Collar +1", -- 10
        ear1="Cryptic Earring", -- 2
        ear2="Odnowa Earring +1",
        body="Emet Harness +1", -- 10
		hands="Hizamaru Kote +2",
        ring1="Defending Ring",
        ring2="Gelatinous Ring +1",
		back=Andartia.Enmity, --10
		waist="Trance Belt", -- 4
		legs="Nyame Flanchard",
        feet="Mochizuki Kyahan +3" -- 8
	}
	
    -- Effusions
    sets.precast.JA['Lunge'] = sets.midcast.ElementalNinjutsu
    sets.precast.JA['Swipe'] = sets.midcast.ElementalNinjutsu

    sets.idle = {
		ammo="Yamarang",
        head="Nyame Helm",
        neck="Unmoving Collar +1",
        ear1="Cryptic Earring",
        ear2="Odnowa Earring +1",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Defending Ring",
        ring2={name="Gelatinous Ring +1",priority=1},
        back=Andartia.Enmity,
        waist="Engraved Belt",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets"
	} -- 2900 HP | 11/1/39 PDT/MDT/DT | +31 idle enmity (+91 w/ Yonin/Gekka) 
	
    sets.idle.Tank = {
		ammo=gear.EnmityAmmo,
        head="Nyame Helm",
        neck={name="Unmoving Collar +1",priority=1},
        ear1={name="Cryptic Earring",priority=3},
        ear2="Trux Earring",
        body="Mpaca's Doublet",
        hands="Mpaca's Gloves",
        ring1="Eihwaz Ring",
        ring2={name="Gelatinous Ring +1",priority=2},
        back=Andartia.Enmity,
        waist="Engraved Belt",
        legs="Mpaca's Hose",
        feet="Nyame Sollerets"
	} -- 2900 HP | 11/1/39 PDT/MDT/DT | +31 idle enmity (+91 w/ Yonin/Gekka) 

    sets.idle.Eva = {
		ammo="Yamarang",
        head="Malignance Chapeau",
        neck="Bathy Choker +1",
        ear1="Eabani Earring",
        ear2="Infused Earring",
        body="Mpaca's Doublet",
        hands="Malignance Gloves",
        ring1="Defending Ring",
        ring2="Vengeful Ring",
        back=Andartia.Enmity,
        waist="Sveltesse Gouriz +1",
        legs="Mpaca's Hose",
        feet="Nyame Sollerets"
	}	

    sets.idle.Regen = set_combine(sets.idle, {
		--neck="Sanctity Necklace",
		--body="Hizamaru Haramaki +2"
	})
    sets.Adoulin = {
        body="Councilor's Garb"}
    sets.idle.Town = sets.idle.Tank
	
    --sets.idle.Town.Adoulin = set_combine(sets.idle.Town, {
    --    body="Councilor's Garb"
    --})
    
    sets.idle.Weak = sets.idle

    -- Defense sets
	-- No longer in use, retained for reference
    sets.defense.PDT = {
		ammo=gear.RegularAmmo,
        head="Malignance Chapeau",
        neck="Unmoving Collar +1",
        ear1="Cryptic Earring",
        ear2="Odnowa Earring +1",
        body="Malignance Tabard",
        hands="Macabre Gauntlets +1",
        ring1="Defending Ring",
        ring2="Gelatinous Ring +1",
        back=Andartia.Enmity,
        waist="Trance Belt",
        legs="Malignance Tights",
        feet="Malignance Boots"
	}

    sets.defense.MDT = set_combine(sets.defense.PDT, {})

    sets.DayMovement = {}
    sets.NightMovement = {feet="Hachiya Kyahan +2"}

    sets.Organizer = {
        shihei="Shihei",
        inoshi="Inoshishinofuda",
        shika="Shikanofuda",
        chono="Chonofuda"}

    -- Normal melee group without buffs
	-- ~39 DW to Cap
    sets.engaged = {
        ammo=gear.RegularAmmo,
        head="Ryuo Somen +1",
        neck="Ninja Nodowa +1",
        ear1="Eabani Earring",
        ear2="Suppanomimi",		
        body=AdhemarBody.TP,
        hands="Adhemar Wristbands +1",
        ring1="Epona's Ring",
        ring2="Gere Ring",
        back=Andartia.TPLow,
        waist="Reiki Yotai",
        legs="Samnuha Tights",
        feet="Hizamaru Sune-ate +2"
	}
    -- assumptions made about targe
    sets.engaged.DT = set_combine(sets.engaged, {
        ammo=gear.RegularAmmo,
		head="Malignance Chapeau",
        neck="Ninja Nodowa +1",
        ear1="Telos Earring",
        ear2="Suppanomimi",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        ring1="Defending Ring",
        ring2="Gelatinous Ring +1",
        back=Andartia.TP,
        waist="Reiki Yotai",
        legs="Hachiya Hakama +2",
        feet="Hizamaru Sune-ate +2"
	})

    sets.engaged.Experimental = {
        ammo=gear.EnmityAmmo,
        head="Nyame Helm",
        neck={name="Unmoving Collar +1",priority=1},
        ear1={name="Cryptic Earring",priority=3},
        ear2="Trux Earring",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Pernicious Ring",
        ring2={name="Gelatinous Ring +1",priority=2},
        back=Andartia.Enmity,
        waist="Engraved Belt",
        legs="Malignance Tights",
        feet="Nyame Sollerets"
	}

    sets.engaged.Acc = set_combine(sets.engaged.Experimental, {
        ammo=gear.RegularAmmo,
        head="Ryuo Somen +1",
        neck="Ninja Nodowa +1",
        ear1="Eabani Earring",
        ear2="Suppanomimi",		
        body=AdhemarBody.TP,
        hands="Adhemar Wristbands +1",
        ring1="Chirich Ring",
        ring2="Chirich Ring",
        back=Andartia.TPLow,
        waist="Reiki Yotai",
        legs="Samnuha Tights",
        feet="Hizamaru Sune-ate +2"
	})

    -- set for fooling around without dual wield
    -- using this as weak / proc set now
	-- Set is currently disabled (retained in lua for reference)
    sets.NoDW = set_combine(sets.engaged, {
        ammo=gear.RegularAmmo,
        head="Adhemar Bonnet +1",
        neck="Ninja Nodowa +1",
        ear1="Telos Earring",
        ear2="Cessance Earring",
        body=AdhemarBody.TP,
        hands="Adhemar Wristbands +1",
        ring1="Epona's Ring",
        ring2="Gere Ring",
        back=Andartia.TP,
        waist="Sailfi Belt +1",
        legs="Samnuha Tights",
        feet=HercFeet.Quad
	})

    sets.engaged.Innin = set_combine(sets.engaged, {
        ammo=gear.RegularAmmo,
        head="Ryuo Somen +1",
        neck="Ninja Nodowa +1",
        ear1="Eabani Earring",
        ear2="Suppanomimi",		
        body=AdhemarBody.TP,
        hands="Adhemar Wristbands +1",
        ring1="Epona's Ring",
        ring2="Gere Ring",
        back=Andartia.TP,
        waist="Reiki Yotai",
        legs="Samnuha Tights",
        feet="Hizamaru Sune-ate +2"
	})
	
    sets.engaged.Innin.DT = sets.engaged.DT
    sets.engaged.Innin.Experimental = sets.engaged.Experimental
    sets.engaged.Innin.Acc = sets.engaged.Acc

    -- Defenseive sets
	-- No longer used, retained for reference
    sets.NormalPDT = {
        head="Rao Kabuto",
        neck="Loricate Torque +1",
        ear1="Telos Earring",
        ear2="Brutal Earring",
        body="Emet Harness +1",
        hands=HercHands.Quad,
        ring1="Defending Ring",
        ring2="Fortified Ring",
        back=Andartia.TP,
        waist="Flume Belt +1",
        legs="Mummu Kecks +1",
        feet=HercFeet.Quad}
    sets.AccPDT = {
        head="Rao Kabuto",
        neck="Loricate Torque +1",
        ear1="Telos Earring",
        ear2="Brutal Earring",
        body="Emet Harness +1",
        hands=HercHands.Quad,
        ring1="Defending Ring",
        ring2="Fortified Ring",
        back=Andartia.TP,
        waist="Flume Belt +1",
        legs="Mummu Kecks +1",
        feet=HercFeet.Quad}

    sets.engaged.PDT = set_combine(sets.engaged, sets.NormalPDT)
    sets.engaged.DT.PDT = set_combine(sets.engaged.DT, sets.NormalPDT)
    sets.engaged.Experimental.PDT = set_combine(sets.engaged.Experimental, sets.NormalPDT)
	sets.engaged.Experimental.Issekigan = sets.Issekigan -- allows issekigan override in haste tiers
    sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, sets.AccPDT)

    sets.engaged.Innin.PDT = set_combine(sets.engaged.Innin, sets.NormalPDT, {})--head="Hattori Zukin +1"})
    sets.engaged.Innin.DT.PDT = sets.engaged.DT.PDT
    sets.engaged.Innin.Experimental.PDT = sets.engaged.Experimental.PDT
    sets.engaged.Innin.Acc.PDT = sets.engaged.Acc.PDT

    sets.engaged.HastePDT = {
        head="Rao Kabuto",
        neck="Loricate Torque +1",
        ear1="Telos Earring",
        ear2="Cessance Earring",
        body="Emet Harness +1",
        hands=HercHands.Quad,
        ring1="Defending Ring",
        ring2="Fortified Ring",
        back="Andartia.TP",
        waist="Flume Belt +1",
        legs="Samnuha Tights",
        feet=HercFeet.Quad}

    -- Delay Cap from spell + songs alone
	-- ~1% DW to cap
    sets.engaged.MaxHaste = set_combine(sets.engaged, {
        head="Dampening Tam",
        neck="Ninja Nodowa +1",
        ear1="Telos Earring",
        ear2="Cessance Earring",
        body="Kendatsuba Samue +1",
        hands="Adhemar Wristbands +1",
        ring1="Epona's Ring",
        ring2="Gere Ring",
        back=Andartia.TP,
        waist="Windbuffet Belt +1",
        legs="Samnuha Tights",
        feet=HercFeet.Quad
	})
    -- Base set for hard content
    sets.engaged.DT.MaxHaste = set_combine(sets.engaged.MaxHaste, {
        head="Malignance Chapeau",
        neck="Ninja Nodowa +1",
        ear1="Telos Earring",
        ear2="Brutal Earring",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        ring1="Defending Ring",
        ring2="Gere Ring",
        back=Andartia.TPLow,
        waist="Engraved Belt",
        legs="Malignance Tights",
        feet="Malignance Boots"
	})
	-- Tank set
    sets.engaged.Experimental.MaxHaste = set_combine(sets.engaged.Experimental, {
        head="Nyame Helm",
        neck={name="Unmoving Collar +1",priority=1},
        ear1={name="Cryptic Earring",priority=3},
        ear2="Trux Earring",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Pernicious Ring",
        ring2={name="Gelatinous Ring +1",priority=2},
        back=Andartia.Enmity,
        waist="Engraved Belt",
        legs="Malignance Tights",
        feet="Nyame Sollerets"
	})
	-- Acc set
    sets.engaged.Acc.MaxHaste = set_combine(sets.engaged.MaxHaste, {
        head="Malignance Chapeau",
        neck="Ninja Nodowa +1",
        ear1="Telos Earring",
        ear2="Dignitary's Earring",
        body="Kendatsuba Samue +1",
        hands="Adhemar Wristbands +1",
        ring1="Chirich Ring",
        ring2="Chirich Ring",
        back=Andartia.TP,
        waist="Sailfi Belt +1",
        legs="Mpaca's Hose",
        feet="Malignance Boots"
	})
    sets.engaged.Innin.MaxHaste = set_combine(sets.engaged.MaxHaste, {})--head="Hattori Zukin +1"})
    sets.engaged.Innin.DT.MaxHaste = sets.engaged.DT.MaxHaste
    sets.engaged.Innin.Experimental.MaxHaste = sets.engaged.Experimental.MaxHaste
    sets.engaged.Innin.Acc.MaxHaste = sets.engaged.Acc.MaxHaste

    -- Defensive sets
    sets.engaged.PDT.MaxHaste = set_combine(sets.engaged.MaxHaste, sets.engaged.HastePDT)
    sets.engaged.DT.PDT.MaxHaste = set_combine(sets.engaged.DT.MaxHaste, sets.engaged.HastePDT)
    sets.engaged.Experimental.PDT.MaxHaste = set_combine(sets.engaged.Experimental.MaxHaste, sets.engaged.HastePDT)
    sets.engaged.Acc.PDT.MaxHaste = set_combine(sets.engaged.Acc.MaxHaste, sets.AccPDT)

    sets.engaged.Innin.PDT.MaxHaste = set_combine(sets.engaged.Innin.MaxHaste, sets.NormalPDT)
    sets.engaged.Innin.DT.PDT.MaxHaste = sets.engaged.DT.PDT.MaxHaste
    sets.engaged.Innin.Experimental.PDT.MaxHaste = sets.engaged.Experimental.PDT.MaxHaste
    sets.engaged.Innin.Acc.PDT.MaxHaste = sets.engaged.Acc.PDT.MaxHaste

    -- 35% Haste 
	-- ~12% DW to cap
    sets.engaged.Haste_35 = set_combine(sets.engaged.MaxHaste, {
        head="Dampening Tam",
        neck="Ninja Nodowa +1",
        ear1="Telos Earring",
        ear2="Suppanomimi",
        body="Kendatsuba Samue +1",
        hands="Adhemar Wristbands +1",
        ring1="Epona's Ring",
        ring2="Gere Ring",
        back=Andartia.TPLow,
        waist="Reiki Yotai",
        legs="Samnuha Tights",
        feet=HercFeet.Quad
	})
    sets.engaged.DT.Haste_35 = set_combine(sets.engaged.DT.MaxHaste, {
        head="Malignance Chapeau",
        neck="Ninja Nodowa +1",
        ear1="Telos Earring",
        ear2="Cessance Earring",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        ring1="Defending Ring",
        ring2="Gere Ring",
        back=Andartia.TPLow,
        waist="Windbuffet Belt +1",
        legs="Malignance Tights",
        feet="Malignance Boots"
	})
    sets.engaged.Experimental.Haste_35 = set_combine(sets.engaged.Experimental.MaxHaste, {
        head="Nyame Helm",
        neck={name="Unmoving Collar +1",priority=1},
        ear1={name="Cryptic Earring",priority=3},
        ear2="Trux Earring",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Pernicious Ring",
        ring2={name="Gelatinous Ring +1",priority=2},
        back=Andartia.Enmity,
        waist="Engraved Belt",
        legs="Malignance Tights",
        feet="Nyame Sollerets"
	})
    sets.engaged.Acc.Haste_35 = set_combine(sets.engaged.Acc.MaxHaste, {
        head="Malignance chapeau",
        neck="Ninja Nodowa +1",
        ear1="Telos Earring",
        ear2="Suppanomimi",
        body="Kendatsuba Samue +1",
        hands="Adhemar Wristbands +1",
        ring1="Chirich Ring",
        ring2="Chirich Ring",
        back=Andartia.TPLow,
        waist="Reiki Yotai",
        legs="Mpaca's Hose",
        feet="Malignance Boots"
	})

    sets.engaged.Innin.Haste_35 = set_combine(sets.engaged.Haste_35, {
		--head="Hattori Zukin +1"
	})
    sets.engaged.Innin.DT.Haste_35 = sets.engaged.DT.Haste_35
    sets.engaged.Innin.Experimental.Haste_35 = sets.engaged.Experimental.Haste_35
    sets.engaged.Innin.Acc.Haste_35 = sets.engaged.Acc.Haste_35

    sets.engaged.PDT.Haste_35 = set_combine(sets.engaged.Haste_35, sets.engaged.HastePDT)
    sets.engaged.DT.PDT.Haste_35 = set_combine(sets.engaged.DT.Haste_35, sets.engaged.HastePDT)
    sets.engaged.Experimental.PDT.Haste_35 = set_combine(sets.engaged.Experimental.Haste_35, sets.engaged.HastePDT)
    sets.engaged.Acc.PDT.Haste_35 = set_combine(sets.engaged.Acc.Haste_35, sets.engaged.AccPDT)

    sets.engaged.Innin.PDT.Haste_35 = set_combine(sets.engaged.Innin.Haste_35, sets.engaged.HastePDT)
    sets.engaged.Innin.DT.PDT.Haste_35 = sets.engaged.DT.PDT.Haste_35
    sets.engaged.Innin.Experimental.PDT.Haste_35 = sets.engaged.Experimental.PDT.Haste_35
    sets.engaged.Innin.Acc.PDT.Haste_35 = sets.engaged.Acc.PDT.Haste_35

    -- 30% Haste 1626 / 798
	-- ~21% DW to cap
    sets.engaged.Haste_30 = set_combine(sets.engaged.Haste_35, {
        head="Ryuo Somen +1",
        neck="Ninja Nodowa +1",
        ear1="Telos Earring",
        ear2="Cessance Earring",
        body=AdhemarBody.TP,
        hands="Adhemar Wristbands +1",
        ring1="Epona's Ring",
        ring2="Gere Ring",
        back=Andartia.TPLow,
        waist="Reiki Yotai",
        legs="Samnuha Tights",
        feet=HercFeet.Quad
	})
    -- This can alternatively be used for high-def targets. 
    sets.engaged.DT.Haste_30 = set_combine(sets.engaged.Haste_30, {
        head="Malignance Chapeau",
        neck="Loricate Torque +1",
        ear1="Telos Earring",
        ear2="Genmei Earring",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        ring1="Defending Ring",
        ring2="Gelatinous Ring +1",
        back=Andartia.TP,
        waist="Flume Belt +1",
        legs="Malignance Tights",
        feet="Malignance Boots"
	})
    sets.engaged.Experimental.Haste_30 = set_combine(sets.engaged.Experimental.Haste_35, {
        head="Nyame Helm",
        neck={name="Unmoving Collar +1",priority=1},
        ear1={name="Cryptic Earring",priority=3},
        ear2="Trux Earring",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Pernicious Ring",
        ring2={name="Gelatinous Ring +1",priority=2},
        back=Andartia.Enmity,
        waist="Engraved Belt",
        legs="Malignance Tights",
        feet="Nyame Sollerets"
	})
    sets.engaged.Acc.Haste_30 = set_combine(sets.engaged.Acc.Haste_35, {
        head="Ryuo Somen +1",
        neck="Ninja Nodowa +1",
        ear1="Telos Earring",
        ear2="Dignitary's Earring",
        body=AdhemarBody.TP,
        hands="Adhemar Wristbands +1",
        ring1="Cacoethis Ring +1",
        ring2="Chirich Ring",
        back=Andartia.TPLow,
        waist="Reiki Yotai",
        legs="Mpaca's Hose",
        feet="Malignance Boots"
	})

    sets.engaged.Innin.Haste_30 = set_combine(sets.engaged.Haste_30, {
		--head="Hattori Zukin +1"
	})
    sets.engaged.Innin.DT.Haste_30 = sets.engaged.DT.Haste_30
    sets.engaged.Innin.Experimental.Haste_30 = sets.engaged.Experimental.Haste_30
    sets.engaged.Innin.Acc.Haste_30 = sets.engaged.Acc.Haste_30

    sets.engaged.PDT.Haste_30 = set_combine(sets.engaged.Haste_30, sets.engaged.HastePDT)
    sets.engaged.DT.PDT.Haste_30 = set_combine(sets.engaged.DT.Haste_30, sets.engaged.HastePDT)
    sets.engaged.Experimental.PDT.Haste_30 = set_combine(sets.engaged.Experimental.Haste_30, sets.engaged.HastePDT)
    sets.engaged.Acc.PDT.Haste_30 = set_combine(sets.engaged.Acc.Haste_30, sets.engaged.AccPDT)

    sets.engaged.Innin.PDT.Haste_30 = set_combine(sets.engaged.Innin.Haste_30, sets.engaged.HastePDT)
    sets.engaged.Innin.DT.PDT.Haste_30 = sets.engaged.DT.PDT.Haste_30
    sets.engaged.Innin.Experimental.PDT.Haste_30 = sets.engaged.Experimental.PDT.Haste_30
    sets.engaged.Innin.Acc.PDT.Haste_30 = sets.engaged.Acc.PDT.Haste_30


    -- haste spell - 139 dex | 275 acc | 1150 total acc (with shigi R15)
	-- ~32% DW to cap
    sets.engaged.Haste_15 = set_combine(sets.engaged.Haste_30, {
        head="Ryuo Somen +1",
        neck="Ninja Nodowa +1",
        ear1="Telos Earring",
        ear2="Suppanomimi",
        body="Mochizuki Chainmail +3",
        hands="Adhemar Wristbands +1",
        ring1="Epona's Ring",
        ring2="Gere Ring",
        back=Andartia.TPLow,
        waist="Reiki Yotai",
        legs="Hachiya Hakama +2",
        feet=HercFeet.Quad
	})
    sets.engaged.DT.Haste_15 = set_combine(sets.engaged.Haste_15, {
        head="Ryuo Somen +1",
        neck="Ninja Nodowa +1",
        ear1="Eabani Earring",
        ear2="Suppanomimi",
        body="Mochizuki Chainmail +3",
        hands="Malignance Gloves",
        ring1="Defending Ring",
        ring2="Gelatinous Ring +1",
        back=Andartia.TP,
        waist="Reiki Yotai",
        legs="Malignance Tights",
        feet="Malignance Boots"
	})
    sets.engaged.Experimental.Haste_15 = set_combine(sets.engaged.Experimental.Haste_30, {
        head="Nyame Helm",
        neck={name="Unmoving Collar +1",priority=1},
        ear1={name="Cryptic Earring",priority=3},
        ear2="Trux Earring",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Pernicious Ring",
        ring2={name="Gelatinous Ring +1",priority=2},
        back=Andartia.Enmity,
        waist="Engraved Belt",
        legs="Malignance Tights",
        feet="Nyame Sollerets"
	})
    sets.engaged.Acc.Haste_15 = set_combine(sets.engaged.Acc.Haste_30, {
        head="Ryuo Somen +1",
        neck="Ninja Nodowa +1",
        ear1="Telos Earring",
        ear2="Suppanomimi",
        body="Mochizuki Chainmail +3",
        hands="Adhemar Wristbands +1",
        ring1="Chirich Ring",
        ring2="Chirich Ring",
        back=Andartia.TPLow,
        waist="Reiki Yotai",
        legs="Hachiya Hakama +2",
        feet="Malignance Boots"
	})
    
    sets.engaged.Innin.Haste_15 = set_combine(sets.engaged.Haste_15, {
        --head="Hattori Zukin +1",
		--waist="Kentarch Belt +1"
    })
    sets.engaged.Innin.DT.Haste_15 = sets.engaged.DT.Haste_15
    sets.engaged.Innin.Experimental.Haste_15 = sets.engaged.Experimental.Haste_15
    sets.engaged.Innin.Acc.Haste_15 = sets.engaged.Acc.Haste_15
    
    sets.engaged.PDT.Haste_15 = set_combine(sets.engaged.Haste_15, sets.engaged.HastePDT)
    sets.engaged.DT.PDT.Haste_15 = set_combine(sets.engaged.DT.Haste_15, sets.engaged.HastePDT)
    sets.engaged.Experimental.PDT.Haste_15 = set_combine(sets.engaged.Experimental.Haste_15, sets.engaged.HastePDT)
    sets.engaged.Acc.PDT.Haste_15 = set_combine(sets.engaged.Acc.Haste_15, sets.engaged.AccPDT)
    
    sets.engaged.Innin.PDT.Haste_15 = set_combine(sets.engaged.Innin.Haste_15, sets.engaged.HastePDT)
    sets.engaged.Innin.DT.PDT.Haste_15 = sets.engaged.DT.PDT.Haste_15
    sets.engaged.Innin.Experimental.PDT.Haste_15 = sets.engaged.Experimental.PDT.Haste_15
    sets.engaged.Innin.Acc.PDT.Haste_15 = sets.engaged.Acc.PDT.Haste_15

--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
------------------Hand-To-Hand--------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------

    -- Delay Cap from spell + songs alone
	-- Need 200 MA to cap H2H delay (spoilers: you wont)
	-- All sets are the same throughout haste tiers (/mnk will not matter)
    sets.engaged.H2HMaxHaste = {
        head="Hizamaru Somen +2",
        neck="Ninja Nodowa +1",
        ear1="Mache Earring +1",
        ear2="Mache Earring +1",
        body="Kendatsuba Samue +1",
        hands="Malignance Gloves",
        ring1="Epona's Ring",
        ring2="Gere Ring",
        back=Andartia.TPLow,
        waist="Windbuffet Belt +1",
        legs="Samnuha Tights",
        feet=HercFeet.Quad
	}
    -- DT set
    sets.engaged.DT.H2HMaxHaste = set_combine(sets.engaged.H2HMaxHaste, {
        head="Hizamaru Somen +2",
        neck="Loricate Torque +1",
        ear1="Odnowa Earring +1",
        ear2="Genmei Earring",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        ring1="Defending Ring",
        ring2="Gelatinous Ring +1",
        back=Andartia.TPLow,
        waist="Engraved Belt",
        legs="Malignance Tights",
        feet="Malignance Boots"
	})
    sets.engaged.Experimental.H2HMaxHaste = set_combine(sets.engaged.Experimental, {
        head="Nyame Helm",
        neck={name="Unmoving Collar +1",priority=1},
        ear1={name="Cryptic Earring",priority=3},
        ear2="Trux Earring",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Pernicious Ring",
        ring2={name="Gelatinous Ring +1",priority=2},
        back=Andartia.Enmity,
        waist="Engraved Belt",
        legs="Malignance Tights",
        feet="Nyame Sollerets"
	})
	-- If this next set ever gets used, then there is some serious jank afoot
    sets.engaged.Acc.H2HMaxHaste = set_combine(sets.engaged.H2HMaxHaste, {
        head="Malignance Chapeau",
        neck="Ninja Nodowa +1",
        ear1="Mache Earring +1",
        ear2="Mache Earring +1",
        body="Mochizuki Chainmail +3",
        hands="Malignance Gloves",
        ring1="Regal Ring",
        ring2="Chirich Ring",
        back=Andartia.TPLow,
        waist="Sailfi Belt +1",
        legs="Hachiya Hakama +2",
        feet="Malignance Boots"
	})
    sets.engaged.Innin.H2HMaxHaste = set_combine(sets.engaged.H2HMaxHaste, {})--head="Hattori Zukin +1"})
    sets.engaged.Innin.DT.H2HMaxHaste = sets.engaged.DT.H2HMaxHaste
    sets.engaged.Innin.Experimental.H2HMaxHaste = sets.engaged.Experimental.H2HMaxHaste
    sets.engaged.Innin.Acc.H2HMaxHaste = sets.engaged.Acc.H2HMaxHaste

    -- Defensive sets
    sets.engaged.PDT.H2HMaxHaste = set_combine(sets.engaged.H2HMaxHaste, sets.engaged.HastePDT)
    sets.engaged.DT.PDT.H2HMaxHaste = set_combine(sets.engaged.DT.H2HMaxHaste, sets.engaged.HastePDT)
    sets.engaged.Experimental.PDT.H2HMaxHaste = set_combine(sets.engaged.Experimental.H2HMaxHaste, sets.engaged.HastePDT)
    sets.engaged.Acc.PDT.H2HMaxHaste = set_combine(sets.engaged.Acc.H2HMaxHaste, sets.AccPDT)

    sets.engaged.Innin.PDT.H2HMaxHaste = set_combine(sets.engaged.Innin.H2HMaxHaste, sets.NormalPDT)
    sets.engaged.Innin.DT.PDT.H2HMaxHaste = sets.engaged.DT.PDT.H2HMaxHaste
    sets.engaged.Innin.Experimental.PDT.H2HMaxHaste = sets.engaged.Experimental.PDT.H2HMaxHaste
    sets.engaged.Innin.Acc.PDT.H2HMaxHaste = sets.engaged.Acc.PDT.H2HMaxHaste

    -- Sets are the same as above due to how MA mechanics works and NIN limitations
    sets.engaged.H2HHaste_35 = set_combine(sets.engaged.H2HMaxHaste, {
        head="Hizamaru Somen +2",
        neck="Ninja Nodowa +1",
        ear1="Mache Earring +1",
        ear2="Mache Earring +1",
        body="Kendatsuba Samue +1",
        hands="Malignance Gloves",
        ring1="Epona's Ring",
        ring2="Gere Ring",
        back=Andartia.TPLow,
        waist="Windbuffet Belt +1",
        legs="Samnuha Tights",
        feet=HercFeet.Quad
	})
    sets.engaged.DT.H2HHaste_35 = set_combine(sets.engaged.DT.H2HMaxHaste, {
        head="Hizamaru Somen +2",
        neck="Loricate Torque +1",
        ear1="Odnowa Earring +1",
        ear2="Genmei Earring",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        ring1="Defending Ring",
        ring2="Gelatinous Ring +1",
        back=Andartia.TPLow,
        waist="Engraved Belt",
        legs="Malignance Tights",
        feet="Malignance Boots"
	})
    sets.engaged.Experimental.H2HHaste_35 = set_combine(sets.engaged.Experimental.H2HMaxHaste, {
        head="Nyame Helm",
        neck={name="Unmoving Collar +1",priority=1},
        ear1={name="Cryptic Earring",priority=3},
        ear2="Trux Earring",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Pernicious Ring",
        ring2={name="Gelatinous Ring +1",priority=2},
        back=Andartia.Enmity,
        waist="Engraved Belt",
        legs="Malignance Tights",
        feet="Nyame Sollerets"
	})
    sets.engaged.Acc.H2HHaste_35 = set_combine(sets.engaged.Acc.H2HMaxHaste, {
        head="Malignance Chapeau",
        neck="Ninja Nodowa +1",
        ear1="Mache Earring +1",
        ear2="Mache Earring +1",
        body="Mochizuki Chainmail +3",
        hands="Malignance Gloves",
        ring1="Regal Ring",
        ring2="Chirich Ring",
        back=Andartia.TPLow,
        waist="Sailfi Belt +1",
        legs="Hachiya Hakama +2",
        feet="Malignance Boots"
	})

    sets.engaged.Innin.H2HHaste_35 = set_combine(sets.engaged.H2HHaste_35, {
		--head="Hattori Zukin +1"
	})
    sets.engaged.Innin.DT.H2HHaste_35 = sets.engaged.DT.H2HHaste_35
    sets.engaged.Innin.Experimental.H2HHaste_35 = sets.engaged.Experimental.H2HHaste_35
    sets.engaged.Innin.Acc.H2HHaste_35 = sets.engaged.Acc.H2HHaste_35

    sets.engaged.PDT.H2HHaste_35 = set_combine(sets.engaged.H2HHaste_35, sets.engaged.HastePDT)
    sets.engaged.DT.PDT.H2HHaste_35 = set_combine(sets.engaged.DT.H2HHaste_35, sets.engaged.HastePDT)
    sets.engaged.Experimental.PDT.H2HHaste_35 = set_combine(sets.engaged.Experimental.H2HHaste_35, sets.engaged.HastePDT)
    sets.engaged.Acc.PDT.H2HHaste_35 = set_combine(sets.engaged.Acc.H2HHaste_35, sets.engaged.AccPDT)

    sets.engaged.Innin.PDT.H2HHaste_35 = set_combine(sets.engaged.Innin.H2HHaste_35, sets.engaged.HastePDT)
    sets.engaged.Innin.DT.PDT.H2HHaste_35 = sets.engaged.DT.PDT.H2HHaste_35
    sets.engaged.Innin.Experimental.PDT.H2HHaste_35 = sets.engaged.Experimental.PDT.H2HHaste_35
    sets.engaged.Innin.Acc.PDT.H2HHaste_35 = sets.engaged.Acc.PDT.H2HHaste_35

    -- Sets are the same as above due to how MA mechanics works and NIN limitations
    sets.engaged.H2HHaste_30 = set_combine(sets.engaged.H2HHaste_35, {
        head="Hizamaru Somen +2",
        neck="Ninja Nodowa +1",
        ear1="Mache Earring +1",
        ear2="Mache Earring +1",
        body="Kendatsuba Samue +1",
        hands="Malignance Gloves",
        ring1="Epona's Ring",
        ring2="Gere Ring",
        back=Andartia.TPLow,
        waist="Windbuffet Belt +1",
        legs="Samnuha Tights",
        feet=HercFeet.Quad
	})
    sets.engaged.DT.H2HHaste_30 = set_combine(sets.engaged.H2HHaste_30, {
        head="Hizamaru Somen +2",
        neck="Loricate Torque +1",
        ear1="Odnowa Earring +1",
        ear2="Genmei Earring",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        ring1="Defending Ring",
        ring2="Gelatinous Ring +1",
        back=Andartia.TPLow,
        waist="Engraved Belt",
        legs="Malignance Tights",
        feet="Malignance Boots"
	})
    sets.engaged.Experimental.H2HHaste_30 = set_combine(sets.engaged.Experimental.H2HHaste_35, {
        head="Nyame Helm",
        neck={name="Unmoving Collar +1",priority=1},
        ear1={name="Cryptic Earring",priority=3},
        ear2="Trux Earring",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Pernicious Ring",
        ring2={name="Gelatinous Ring +1",priority=2},
        back=Andartia.Enmity,
        waist="Engraved Belt",
        legs="Malignance Tights",
        feet="Nyame Sollerets"
	})
    sets.engaged.Acc.H2HHaste_30 = set_combine(sets.engaged.Acc.H2HHaste_35, {
        head="Malignance Chapeau",
        neck="Ninja Nodowa +1",
        ear1="Mache Earring +1",
        ear2="Mache Earring +1",
        body="Mochizuki Chainmail +3",
        hands="Malignance Gloves",
        ring1="Regal Ring",
        ring2="Chirich Ring",
        back=Andartia.TPLow,
        waist="Sailfi Belt +1",
        legs="Hachiya Hakama +2",
        feet="Malignance Boots"
	})

    sets.engaged.Innin.H2HHaste_30 = set_combine(sets.engaged.H2HHaste_30, {
		--head="Hattori Zukin +1"
	})
    sets.engaged.Innin.DT.H2HHaste_30 = sets.engaged.DT.H2HHaste_30
    sets.engaged.Innin.Experimental.H2HHaste_30 = sets.engaged.Experimental.H2HHaste_30
    sets.engaged.Innin.Acc.H2HHaste_30 = sets.engaged.Acc.H2HHaste_30

    sets.engaged.PDT.H2HHaste_30 = set_combine(sets.engaged.H2HHaste_30, sets.engaged.HastePDT)
    sets.engaged.DT.PDT.H2HHaste_30 = set_combine(sets.engaged.DT.H2HHaste_30, sets.engaged.HastePDT)
    sets.engaged.Experimental.PDT.H2HHaste_30 = set_combine(sets.engaged.Experimental.H2HHaste_30, sets.engaged.HastePDT)
    sets.engaged.Acc.PDT.H2HHaste_30 = set_combine(sets.engaged.Acc.H2HHaste_30, sets.engaged.AccPDT)

    sets.engaged.Innin.PDT.H2HHaste_30 = set_combine(sets.engaged.Innin.H2HHaste_30, sets.engaged.HastePDT)
    sets.engaged.Innin.DT.PDT.H2HHaste_30 = sets.engaged.DT.PDT.H2HHaste_30
    sets.engaged.Innin.Experimental.PDT.H2HHaste_30 = sets.engaged.Experimental.PDT.H2HHaste_30
    sets.engaged.Innin.Acc.PDT.H2HHaste_30 = sets.engaged.Acc.PDT.H2HHaste_30


    -- Sets are the same as above due to how MA mechanics works and NIN limitations
    sets.engaged.H2HHaste_15 = set_combine(sets.engaged.H2HHaste_30, {
        head="Hizamaru Somen +2",
        neck="Ninja Nodowa +1",
        ear1="Mache Earring +1",
        ear2="Mache Earring +1",
        body="Kendatsuba Samue +1",
        hands="Malignance Gloves",
        ring1="Epona's Ring",
        ring2="Gere Ring",
        back=Andartia.TPLow,
        waist="Windbuffet Belt +1",
        legs="Samnuha Tights",
        feet=HercFeet.Quad
	})
    sets.engaged.DT.H2HHaste_15 = set_combine(sets.engaged.H2HHaste_15, {
        head="Hizamaru Somen +2",
        neck="Loricate Torque +1",
        ear1="Odnowa Earring +1",
        ear2="Genmei Earring",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        ring1="Defending Ring",
        ring2="Gelatinous Ring +1",
        back=Andartia.TPLow,
        waist="Engraved Belt",
        legs="Malignance Tights",
        feet="Malignance Boots"
	})
    sets.engaged.Experimental.H2HHaste_15 = set_combine(sets.engaged.Experimental.H2HHaste_30, {
        head="Nyame Helm",
        neck={name="Unmoving Collar +1",priority=1},
        ear1={name="Cryptic Earring",priority=3},
        ear2="Trux Earring",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Pernicious Ring",
        ring2={name="Gelatinous Ring +1",priority=2},
        back=Andartia.Enmity,
        waist="Engraved Belt",
        legs="Malignance Tights",
        feet="Nyame Sollerets"
	})
    sets.engaged.Acc.H2HHaste_15 = set_combine(sets.engaged.Acc.H2HHaste_30, {
        head="Malignance Chapeau",
        neck="Ninja Nodowa +1",
        ear1="Mache Earring +1",
        ear2="Mache Earring +1",
        body="Mochizuki Chainmail +3",
        hands="Malignance Gloves",
        ring1="Regal Ring",
        ring2="Chirich Ring",
        back=Andartia.TPLow,
        waist="Sailfi Belt +1",
        legs="Hachiya Hakama +2",
        feet="Malignance Boots"
	})
    
    sets.engaged.Innin.H2HHaste_15 = set_combine(sets.engaged.H2HHaste_15, {
        --head="Hattori Zukin +1",
		--waist="Kentarch Belt +1"
    })
    sets.engaged.Innin.DT.H2HHaste_15 = sets.engaged.DT.Haste_15
    sets.engaged.Innin.Experimental.H2HHaste_15 = sets.engaged.Experimental.Haste_15
    sets.engaged.Innin.Acc.H2HHaste_15 = sets.engaged.Acc.Haste_15
    
    sets.engaged.PDT.H2HHaste_15 = set_combine(sets.engaged.H2HHaste_15, sets.engaged.HastePDT)
    sets.engaged.DT.PDT.H2HHaste_15 = set_combine(sets.engaged.DT.H2HHaste_15, sets.engaged.HastePDT)
    sets.engaged.Experimental.PDT.H2HHaste_15 = set_combine(sets.engaged.Experimental.H2HHaste_15, sets.engaged.HastePDT)
    sets.engaged.Acc.PDT.H2HHaste_15 = set_combine(sets.engaged.Acc.H2HHaste_15, sets.engaged.AccPDT)
    
    sets.engaged.Innin.PDT.H2HHaste_15 = set_combine(sets.engaged.Innin.H2HHaste_15, sets.engaged.HastePDT)
    sets.engaged.Innin.DT.PDT.H2HHaste_15 = sets.engaged.DT.PDT.H2HHaste_15
    sets.engaged.Innin.Experimental.PDT.H2HHaste_15 = sets.engaged.Experimental.PDT.H2HHaste_15
    sets.engaged.Innin.Acc.PDT.H2HHaste_15 = sets.engaged.Acc.PDT.H2HHaste_15

	
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
------------------Great Katana--------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------

    -- Delay Cap from spell + songs alone
	-- These sets will be very similar among haste groups due to low
	-- low amounts of interaction possible to lower delay further
	
	-- Standard TP set (5hit)
    sets.engaged.GKTMaxHaste = set_combine(sets.engaged, {
        head="Malignance Chapeau",
        neck="Ninja Nodowa +1",
        ear1="Telos Earring",
        ear2="Dedition Earring",
        body="Kendatsuba Samue +1",
        hands="Malignance Gloves",
        ring1="Epona's Ring",
        ring2="Gere Ring",
        back=Andartia.TP,
        waist="Sailfi Belt +1",
        legs="Samnuha Tights",
        feet="Malignance Boots"
	})
    -- Tank set
    sets.engaged.DT.GKTMaxHaste = set_combine(sets.engaged.GKTMaxHaste, {
        head="Malignance Chapeau",
        neck="Ninja Nodowa +1",
        ear1="Telos Earring",
        ear2="Genmei Earring",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        ring1="Defending Ring",
        ring2="Gelatinous Ring +1",
        back=Andartia.TP,
        waist="Engraved Belt",
        legs="Malignance Tights",
        feet="Malignance Boots"
	})
	-- Experimental Parry/Tank set (use w/ Yonin&Issikegan)
    sets.engaged.Experimental.GKTMaxHaste = set_combine(sets.engaged.Experimental, {
        head="Nyame Helm",
        neck={name="Unmoving Collar +1",priority=1},
        ear1={name="Cryptic Earring",priority=3},
        ear2="Trux Earring",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Pernicious Ring",
        ring2={name="Gelatinous Ring +1",priority=2},
        back=Andartia.Enmity,
        waist="Engraved Belt",
        legs="Malignance Tights",
        feet="Nyame Sollerets"
	})
	-- Max Accuracy
    sets.engaged.Acc.GKTMaxHaste = set_combine(sets.engaged.GKTMaxHaste, {
        head="Malignance Chapeau",
        neck="Ninja Nodowa +1",
        ear1="Telos Earring",
        ear2="Dedition Earring",
        body="Mochizuki Chainmail +3",
        hands="Malignance Gloves",
        ring1="Epona's Ring",
        ring2="Gere Ring",
        back=Andartia.TP,
        waist="Sailfi Belt +1",
        legs="Hachiya Hakama +2",
        feet="Malignance Boots"
	})
    sets.engaged.Innin.GKTMaxHaste = set_combine(sets.engaged.GKTMaxHaste, {})--head="Hattori Zukin +1"})
    sets.engaged.Innin.DT.GKTMaxHaste = sets.engaged.DT.GKTMaxHaste
    sets.engaged.Innin.Experimental.GKTMaxHaste = sets.engaged.Experimental.GKTMaxHaste
    sets.engaged.Innin.Acc.GKTMaxHaste = sets.engaged.Acc.GKTMaxHaste

    -- Defensive sets
    sets.engaged.PDT.GKTMaxHaste = set_combine(sets.engaged.GKTMaxHaste, sets.engaged.HastePDT)
    sets.engaged.DT.PDT.GKTMaxHaste = set_combine(sets.engaged.DT.GKTMaxHaste, sets.engaged.HastePDT)
    sets.engaged.Experimental.PDT.GKTMaxHaste = set_combine(sets.engaged.Experimental.GKTMaxHaste, sets.engaged.HastePDT)
    sets.engaged.Acc.PDT.GKTMaxHaste = set_combine(sets.engaged.Acc.GKTMaxHaste, sets.AccPDT)

    sets.engaged.Innin.PDT.GKTMaxHaste = set_combine(sets.engaged.Innin.GKTMaxHaste, sets.NormalPDT)
    sets.engaged.Innin.DT.PDT.GKTMaxHaste = sets.engaged.DT.PDT.GKTMaxHaste
    sets.engaged.Innin.Experimental.PDT.GKTMaxHaste = sets.engaged.Experimental.PDT.GKTMaxHaste
    sets.engaged.Innin.Acc.PDT.GKTMaxHaste = sets.engaged.Acc.PDT.GKTMaxHaste

	-- No real difference in these sets
    sets.engaged.GKTHaste_35 = set_combine(sets.engaged.GKTMaxHaste, {
        head="Malignance Chapeau",
        neck="Ninja Nodowa +1",
        ear1="Telos Earring",
        ear2="Dedition Earring",
        body="Kendatsuba Samue +1",
        hands="Malignance Gloves",
        ring1="Epona's Ring",
        ring2="Gere Ring",
        back=Andartia.TP,
        waist="Sailfi Belt +1",
        legs="Samnuha Tights",
        feet="Malignance Boots"
	})
    sets.engaged.DT.GKTHaste_35 = set_combine(sets.engaged.DT.GKTMaxHaste, {
        head="Malignance Chapeau",
        neck="Ninja Nodowa +1",
        ear1="Telos Earring",
        ear2="Genmei Earring",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        ring1="Defending Ring",
        ring2="Gelatinous Ring +1",
        back=Andartia.TP,
        waist="Engraved Belt",
        legs="Malignance Tights",
        feet="Malignance Boots"
	})
    sets.engaged.Experimental.GKTHaste_35 = set_combine(sets.engaged.Experimental.GKTMaxHaste, {
        head="Nyame Helm",
        neck={name="Unmoving Collar +1",priority=1},
        ear1={name="Cryptic Earring",priority=3},
        ear2="Trux Earring",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Pernicious Ring",
        ring2={name="Gelatinous Ring +1",priority=2},
        back=Andartia.Enmity,
        waist="Engraved Belt",
        legs="Malignance Tights",
        feet="Nyame Sollerets"
	})
    sets.engaged.Acc.GKTHaste_35 = set_combine(sets.engaged.Acc.GKTMaxHaste, {
        head="Malignance Chapeau",
        neck="Ninja Nodowa +1",
        ear1="Telos Earring",
        ear2="Dedition Earring",
        body="Mochizuki Chainmail +3",
        hands="Malignance Gloves",
        ring1="Epona's Ring",
        ring2="Gere Ring",
        back=Andartia.TP,
        waist="Sailfi Belt +1",
        legs="Hachiya Hakama +2",
        feet="Malignance Boots"
	})

    sets.engaged.Innin.GKTHaste_35 = set_combine(sets.engaged.GKTHaste_35, {
		--head="Hattori Zukin +1"
	})
    sets.engaged.Innin.DT.GKTHaste_35 = sets.engaged.DT.GKTHaste_35
    sets.engaged.Innin.Experimental.GKTHaste_35 = sets.engaged.Experimental.GKTHaste_35
    sets.engaged.Innin.Acc.GKTHaste_35 = sets.engaged.Acc.GKTHaste_35

    sets.engaged.PDT.GKTHaste_35 = set_combine(sets.engaged.GKTHaste_35, sets.engaged.HastePDT)
    sets.engaged.DT.PDT.GKTHaste_35 = set_combine(sets.engaged.DT.GKTHaste_35, sets.engaged.HastePDT)
    sets.engaged.Experimental.PDT.GKTHaste_35 = set_combine(sets.engaged.Experimental.GKTHaste_35, sets.engaged.HastePDT)
    sets.engaged.Acc.PDT.GKTHaste_35 = set_combine(sets.engaged.Acc.GKTHaste_35, sets.engaged.AccPDT)

    sets.engaged.Innin.PDT.GKTHaste_35 = set_combine(sets.engaged.Innin.GKTHaste_35, sets.engaged.HastePDT)
    sets.engaged.Innin.DT.PDT.GKTHaste_35 = sets.engaged.DT.PDT.GKTHaste_35
    sets.engaged.Innin.Experimental.PDT.GKTHaste_35 = sets.engaged.Experimental.PDT.GKTHaste_35
    sets.engaged.Innin.Acc.PDT.GKTHaste_35 = sets.engaged.Acc.PDT.GKTHaste_35

	-- No real difference in these sets
    sets.engaged.GKTHaste_30 = set_combine(sets.engaged.GKTHaste_35, {
        head="Malignance Chapeau",
        neck="Ninja Nodowa +1",
        ear1="Telos Earring",
        ear2="Dedition Earring",
        body="Kendatsuba Samue +1",
        hands="Malignance Gloves",
        ring1="Epona's Ring",
        ring2="Gere Ring",
        back=Andartia.TP,
        waist="Sailfi Belt +1",
        legs="Samnuha Tights",
        feet="Malignance Boots"
	})
    -- This can alternatively be used for high-def targets. 
    sets.engaged.DT.GKTHaste_30 = set_combine(sets.engaged.GKTHaste_30, {
        head="Malignance Chapeau",
        neck="Ninja Nodowa +1",
        ear1="Telos Earring",
        ear2="Genmei Earring",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        ring1="Defending Ring",
        ring2="Gelatinous Ring +1",
        back=Andartia.TP,
        waist="Engraved Belt",
        legs="Malignance Tights",
        feet="Malignance Boots"
	})
    sets.engaged.Experimental.GKTHaste_30 = set_combine(sets.engaged.Experimental.GKTHaste_35, {
        head="Nyame Helm",
        neck={name="Unmoving Collar +1",priority=1},
        ear1={name="Cryptic Earring",priority=3},
        ear2="Trux Earring",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Pernicious Ring",
        ring2={name="Gelatinous Ring +1",priority=2},
        back=Andartia.Enmity,
        waist="Engraved Belt",
        legs="Malignance Tights",
        feet="Nyame Sollerets"
	})
    sets.engaged.Acc.GKTHaste_30 = set_combine(sets.engaged.Acc.GKTHaste_35, {
        head="Malignance Chapeau",
        neck="Ninja Nodowa +1",
        ear1="Telos Earring",
        ear2="Dedition Earring",
        body="Mochizuki Chainmail +3",
        hands="Malignance Gloves",
        ring1="Epona's Ring",
        ring2="Gere Ring",
        back=Andartia.TP,
        waist="Sailfi Belt +1",
        legs="Hachiya Hakama +2",
        feet="Malignance Boots"
	})

    sets.engaged.Innin.GKTHaste_30 = set_combine(sets.engaged.GKTHaste_30, {
		--head="Hattori Zukin +1"
	})
    sets.engaged.Innin.DT.GKTHaste_30 = sets.engaged.DT.GKTHaste_30
    sets.engaged.Innin.Experimental.GKTHaste_30 = sets.engaged.Experimental.GKTHaste_30
    sets.engaged.Innin.Acc.GKTHaste_30 = sets.engaged.Acc.GKTHaste_30

    sets.engaged.PDT.GKTHaste_30 = set_combine(sets.engaged.GKTHaste_30, sets.engaged.HastePDT)
    sets.engaged.DT.PDT.GKTHaste_30 = set_combine(sets.engaged.DT.GKTHaste_30, sets.engaged.HastePDT)
    sets.engaged.Experimental.PDT.GKTHaste_30 = set_combine(sets.engaged.Experimental.GKTHaste_30, sets.engaged.HastePDT)
    sets.engaged.Acc.PDT.GKTHaste_30 = set_combine(sets.engaged.Acc.GKTHaste_30, sets.engaged.AccPDT)

    sets.engaged.Innin.PDT.GKTHaste_30 = set_combine(sets.engaged.Innin.GKTHaste_30, sets.engaged.HastePDT)
    sets.engaged.Innin.DT.PDT.GKTHaste_30 = sets.engaged.DT.PDT.GKTHaste_30
    sets.engaged.Innin.Experimental.PDT.GKTHaste_30 = sets.engaged.Experimental.PDT.GKTHaste_30
    sets.engaged.Innin.Acc.PDT.GKTHaste_30 = sets.engaged.Acc.PDT.GKTHaste_30


	-- No real difference in these sets
    sets.engaged.GKTHaste_15 = set_combine(sets.engaged.GKTHaste_30, {
        head="Malignance Chapeau",
        neck="Ninja Nodowa +1",
        ear1="Telos Earring",
        ear2="Dedition Earring",
        body="Kendatsuba Samue +1",
        hands="Malignance Gloves",
        ring1="Epona's Ring",
        ring2="Gere Ring",
        back=Andartia.TP,
        waist="Sailfi Belt +1",
        legs="Samnuha Tights",
        feet="Malignance Boots"
	})
    sets.engaged.DT.GKTHaste_15 = set_combine(sets.engaged.GKTHaste_15, {
        head="Malignance Chapeau",
        neck="Ninja Nodowa +1",
        ear1="Telos Earring",
        ear2="Genmei Earring",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        ring1="Defending Ring",
        ring2="Gelatinous Ring +1",
        back=Andartia.TP,
        waist="Engraved Belt",
        legs="Malignance Tights",
        feet="Malignance Boots"
	})
    sets.engaged.Experimental.GKTHaste_15 = set_combine(sets.engaged.Experimental.GKTHaste_30, {
        head="Nyame Helm",
        neck={name="Unmoving Collar +1",priority=1},
        ear1={name="Cryptic Earring",priority=3},
        ear2="Trux Earring",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Pernicious Ring",
        ring2={name="Gelatinous Ring +1",priority=2},
        back=Andartia.Enmity,
        waist="Engraved Belt",
        legs="Malignance Tights",
        feet="Nyame Sollerets"
	})
    sets.engaged.Acc.GKTHaste_15 = set_combine(sets.engaged.Acc.GKTHaste_30, {
        head="Malignance Chapeau",
        neck="Ninja Nodowa +1",
        ear1="Telos Earring",
        ear2="Dedition Earring",
        body="Mochizuki Chainmail +3",
        hands="Malignance Gloves",
        ring1="Epona's Ring",
        ring2="Gere Ring",
        back=Andartia.TP,
        waist="Sailfi Belt +1",
        legs="Hachiya Hakama +2",
        feet="Malignance Boots"
	})
    
    sets.engaged.Innin.GKTHaste_15 = set_combine(sets.engaged.GKTHaste_15, {
        --head="Hattori Zukin +1",
		--waist="Kentarch Belt +1"
    })
    sets.engaged.Innin.DT.GKTHaste_15 = sets.engaged.DT.GKTHaste_15
    sets.engaged.Innin.Experimental.GKTHaste_15 = sets.engaged.Experimental.GKTHaste_15
    sets.engaged.Innin.Acc.GKTHaste_15 = sets.engaged.Acc.GKTHaste_15
    
    sets.engaged.PDT.GKTHaste_15 = set_combine(sets.engaged.GKTHaste_15, sets.engaged.HastePDT)
    sets.engaged.DT.PDT.GKTHaste_15 = set_combine(sets.engaged.DT.GKTHaste_15, sets.engaged.HastePDT)
    sets.engaged.Experimental.PDT.GKTHaste_15 = set_combine(sets.engaged.Experimental.GKTHaste_15, sets.engaged.HastePDT)
    sets.engaged.Acc.PDT.GKTHaste_15 = set_combine(sets.engaged.Acc.GKTHaste_15, sets.engaged.AccPDT)
    
    sets.engaged.Innin.PDT.GKTHaste_15 = set_combine(sets.engaged.Innin.GKTHaste_15, sets.engaged.HastePDT)
    sets.engaged.Innin.DT.PDT.GKTHaste_15 = sets.engaged.DT.PDT.GKTHaste_15
    sets.engaged.Innin.Experimental.PDT.GKTHaste_15 = sets.engaged.Experimental.PDT.GKTHaste_15
    sets.engaged.Innin.Acc.PDT.GKTHaste_15 = sets.engaged.Acc.PDT.GKTHaste_15
    
    sets.buff.Migawari = {body="Hattori Ningi +1"}
    
    -- Weaponskills 
    sets.precast.WS = {}
    
    sets.precast.WS.Mid = set_combine(sets.precast.WS, {})
    sets.precast.WS.Low = set_combine(sets.precast.WS.Mid,{})
    sets.precast.WS.Acc = set_combine(sets.precast.WS.Mid, {})
	
	-- BLADE: KAMU
    sets.precast.WS['Blade: Kamu'] = {
		ammo="Voluspa Tathlum",
		head="Hachiya Hatsuburi +3",
		neck="Ninja Nodowa +1",
		ear1="Lugra Earring +1",
		ear2="Ishvara Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Fotia Belt",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}--attack capped
	
    sets.precast.WS['Blade: Kamu'].MidAttack = {
		ammo="Voluspa Tathlum",
		head="Hachiya Hatsuburi +3",
		neck="Fotia Gorget",
		ear1="Lugra Earring +1",
		ear2="Ishvara Earring",
		body="Nyame Mail",
		hands=HercHands.WSD,
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Fotia Belt",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}

    sets.precast.WS['Blade: Kamu'].MaxAttack = {
		ammo="Voluspa Tathlum",
		head="Hachiya Hatsuburi +3",
		neck="Fotia Gorget",
		ear1="Lugra Earring +1",
		ear2="Ishvara Earring",
		body="Mochizuki Chainmail +3",
		hands="Mochizuki Tekko +3",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Fotia Belt",
		legs="Mochizuki Hakama +3",
		feet="Mochizuki Kyahan +3"
	}	
    
    -- BLADE: JIN
    sets.precast.WS['Blade: Jin'] = {
        ammo="Yetshila",
		head="Adhemar Bonnet +1",
		neck="Ninja Nodowa +1",
		ear1="Odr Earring",
		ear2="Brutal Earring",
		body=AdhemarBody.TP,
		hands="Adhemar Wristbands +1",
		ring1="Regal Ring",
		ring2="Hetairoi Ring",
		back=Andartia.WSD,
		waist="Fotia Belt",
		legs="Jokushu Haidate",
		feet="Mpaca's Boots"
	}
    
    -- BLADE: HI
    sets.precast.WS['Blade: Hi'] = {
        ammo="Yetshila",
		head="Hachiya Hatsuburi +3",
		neck="Ninja Nodowa +1",
		ear1="Lugra Earring +1",
		ear2="Odr Earring",
		body="Malignance Tabard",
		hands="Ryuo Tekko",
		ring1="Regal Ring",
		ring2="Ilabrat Ring",
		back=Andartia.WSD,
		waist="Sveltesse Gouriz +1",
		legs="Mochizuki Hakama +3",
		feet="Malignance Boots"
	}
	
    sets.precast.WS['Blade: Hi'].MidAttack = {
        ammo="Yetshila",
		head="Adhemar Bonnet +1",
		neck="Ninja Nodowa +1",
		ear1="Lugra Earring +1",
		ear2="Odr Earring",
		body="Kendatsuba Samue +1",
		hands="Ryuo Tekko",
		ring1="Regal Ring",
		ring2="Ilabrat Ring",
		back=Andartia.WSD,
		waist="Sveltesse Gouriz +1",
		legs="Mochizuki Hakama +3",
		feet="Mpaca's Boots"
	}	

    sets.precast.WS['Blade: Hi'].MaxAttack = {
        ammo="Yetshila",
		head="Adhemar Bonnet +1",
		neck="Ninja Nodowa +1",
		ear1="Lugra Earring +1",
		ear2="Odr Earring",
		body="Mochizuki Chainmail +3",
		hands="Ryuo Tekko",
		ring1="Regal Ring",
		ring2="Ilabrat Ring",
		back=Andartia.WSD,
		waist="Sveltesse Gouriz +1",
		legs="Mochizuki Hakama +3",
		feet="Mochizuki Kyahan +3"
	}
    
    -- BLADE: SHUN
    sets.precast.WS['Blade: Shun'] = {
		ammo ="Coiste Bodhar",
		head="Adhemar Bonnet +1",
		neck="Ninja Nodowa +1",
		ear1="Lugra Earring +1",
		ear2="Odr Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.TPLow,
		waist="Fotia Belt",
		legs="Jokushu Haidate",
		feet="Mpaca's Boots"
	}--attack cap

    sets.precast.WS['Blade: Shun'].MidAttack = {
		ammo ="Coiste Bodhar",
		head="Mpaca's Cap",
		neck="Fotia Gorget",
		ear1="Lugra Earring +1",
		ear2="Odr Earring",
		body="Kendatsuba Samue +1",
		hands="Adhemar Wristbands +1",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.TPLow,
		waist="Fotia Belt",
		legs="Jokushu Haidate",
		feet="Mpaca's Boots"
	}
	
    sets.precast.WS['Blade: Shun'].MaxAttack = {
		ammo ="Coiste Bodhar",
		head="Mochizuki Hatsuburi +3",
		neck="Ninja Nodowa +1",
		ear1="Lugra Earring +1",
		ear2="Odr Earring",
		body="Mpaca's Doublet",
		hands="Mochizuki Tekko +3",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.TPLow,
		waist="Fotia Belt",
		legs="Mpaca's Hose",
		feet="Mochizuki Kyahan +3"
	}	
    
    -- BLADE: RIN
    sets.precast.WS['Blade: Rin'] = {
        ammo="Voluspa Tathlum",
		head="Hachiya Hatsuburi +3",
		neck="Ninja Nodowa +1",
		ear1="Lugra Earring +1",
		ear2="Odr Earring",
		body="Kendatsuba Samue +1",
		hands=HercHands.WSD,
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Fotia Belt",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}
    
    -- BLADE: RETSU
    sets.precast.WS['Blade: Retsu'] = {
        ammo="Yamarang",
		head="Hachiya Hatsuburi +3",
		neck="Ninja Nodowa +1",
		ear1="Lugra Earring +1",
		ear2="Odr Earring",
		body="Mochizuki Chainmail +3",
		hands="Mochizuki Tekko +3",
		ring1="Regal Ring",
		ring2="Ilabrat Ring",
		back=Andartia.WSD,
		waist="Fotia Belt",
		legs="Mochizuki Hakama +3",
		feet="Mochizuki Kyahan +3"
	}
	
    -- BLADE: KU 
    sets.precast.WS['Blade: Ku'] = {
		ammo="Coiste Bodhar",
		head="Malignance Chapeau",
		neck="Ninja Nodowa +1",
		ear1="Lugra Earring +1",
		ear2="Mache Earring +1",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.TPLow,
		waist="Fotia Belt",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots"
	}--attack capped

    sets.precast.WS['Blade: Ku'].MidAttack = {
		ammo="Coiste Bodhar",
		head="Mpaca's Cap",
		neck="Fotia Gorget",
		ear1="Lugra Earring +1",
		ear2="Mache Earring +1",
		body="Kendatsuba Samue +1",
		hands="Adhemar Wristbands +1",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.TPLow,
		waist="Fotia Belt",
		legs="Samnuha Tights",
		feet="Mpaca's Boots"
	}
	
    sets.precast.WS['Blade: Ku'].MaxAttack = {
		ammo="Coiste Bodhar",
		head="Mpaca's Cap",
		neck="Fotia Gorget",
		ear1="Lugra Earring +1",
		ear2="Mache Earring +1",
		body="Mpaca's Doublet",
		hands="Mpaca's Gloves",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.TPLow,
		waist="Fotia Belt",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots"
	}	
  
	-- BLADE: TEN  
    sets.precast.WS['Blade: Ten'] = {
		ammo="Voluspa Tathlum",
		head="Mpaca's Cap",
		neck="Ninja Nodowa +1",
		ear1="Moonshade Earring",
		ear2="Lugra Earring +1",
		body="Malignance Tabard",
		hands=HercHands.WSD,
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Sailfi Belt +1",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}--attack capped
	
    sets.precast.WS['Blade: Ten'].MidAttack = {
		ammo="Voluspa Tathlum",
		head="Mpaca's Cap",
		neck="Ninja Nodowa +1",
		ear1="Moonshade Earring",
		ear2="Lugra Earring +1",
		body="Nyame Mail",
		hands=HercHands.WSD,
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Sailfi Belt +1",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}
	
    sets.precast.WS['Blade: Ten'].MaxAttack = {
		ammo="Voluspa Tathlum",
		head="Mpaca's Cap",
		neck="Ninja Nodowa +1",
		ear1="Moonshade Earring",
		ear2="Lugra Earring +1",
		body="Mochizuki Chainmail +3",
		hands="Mochizuki Chainmail +3",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Sailfi Belt +1",
		legs="Mochizuki Hakama +3",
		feet="Mochizuki Kyahan +3"
	}

	-- BLADE: METSU    
    sets.precast.WS['Blade: Metsu'] = {
		ammo="Cath Palug Stone",
		head="Hachiya Hatsuburi +3",
		neck="Ninja Nodowa +1",
		ear1="Lugra Earring +1",
		ear2="Odr Earring",
		body="Malignance Tabard",
		hands=HercHands.WSD,
		ring1="Regal Ring",
		ring2="Ilabrat Ring",
		back=Andartia.WSD,
		waist="Sailfi Belt +1",
		legs="Mochizuki Hakama +3",
		feet="Malignance Boots"
	} --attack capped
	
	sets.precast.WS['Blade: Metsu'].MidAttack = {
		ammo="Cath Palug Stone",
		head="Hachiya Hatsuburi +3",
		neck="Ninja Nodowa +1",
		ear1="Lugra Earring +1",
		ear2="Odr Earring",
		body="Nyame Mail",
		hands=HercHands.WSD,
		ring1="Regal Ring",
		ring2="Ilabrat Ring",
		back=Andartia.WSD,
		waist="Sailfi Belt +1",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}
	
	sets.precast.WS['Blade: Metsu'].MaxAttack = {
		ammo="Voluspa Tathlum",
		head="Hachiya Hatsuburi +3",
		neck="Ninja Nodowa +1",
		ear1="Lugra Earring +1",
		ear2="Odr Earring",
		body="Mochizuki Chainmail +3",
		hands="Mochizuki Tekko +3",
		ring1="Regal Ring",
		ring2="Ilabrat Ring",
		back=Andartia.WSD,
		waist="Sailfi Belt +1",
		legs="Mochizuki Hakama +3",
		feet="Mochizuki Kyahan +3"	
	}
	
    sets.precast.WS['Blade: Chi'] = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
        ear2="Friomisi Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Gere Ring",
		ring2="Regal Ring",
		back=Andartia.Ten,
		waist="Fotia Belt",
        legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}	
	
    sets.precast.WS['Blade: To'] = sets.precast.WS['Blade: Chi']
	
	sets.precast.WS['Blade: Teki'] = sets.precast.WS['Blade: Chi']
	
	sets.precast.WS['Blade: Ei'] = set_combine(sets.precast.WS['Aeolian Edge'], {
		head="Pixie Hairpin +1",
		ring1="Archon Ring"
	})	
	
	sets.precast.WS['Blade: Yu'] = {
		ammo="Pemphredo Tathlum",
		head="Mochizuki Hatsuburi +3",
		neck="Baetyl Pendant",
		ear1="Crematio Earring",
        ear2="Friomisi Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Acumen Ring",
		ring2="Dingir Ring",
		back=Andartia.MAB,
		waist="Eschan Stone",
        legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	
    sets.precast.WS['Aeolian Edge'] = {
		ammo="Pemphredo Tathlum",
		head="Mochizuki Hatsuburi +3",
		neck="Baetyl Pendant",
		ear1="Crematio Earring",
        ear2="Friomisi Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Acumen Ring",
		ring2="Dingir Ring",
		back=Andartia.MAB,
		waist="Eschan Stone",
        legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}	
	
	-- SAVAGE BLADE
    sets.precast.WS['Savage Blade'] = {
		ammo="Voluspa Tathlum",
		head="Mpaca's Cap",
		neck="Ninja Nodowa +1",
		ear1="Moonshade Earring",
		ear2="Lugra Earring +1",
		body="Nyame Mail",
		hands=HercHands.WSD,
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Sailfi Belt +1",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}
	
    sets.precast.WS['Savage Blade'].MidAttack = {
		ammo="Voluspa Tathlum",
		head="Mpaca's Cap",
		neck="Ninja Nodowa +1",
		ear1="Moonshade Earring",
		ear2="Lugra Earring +1",
		body="Nyame Mail",
		hands=HercHands.WSD,
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Sailfi Belt +1",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}

    sets.precast.WS['Savage Blade'].MaxAttack = {
		ammo="Voluspa Tathlum",
		head="Mpaca's Cap",
		neck="Ninja Nodowa +1",
		ear1="Moonshade Earring",
		ear2="Lugra Earring +1",
		body="Nyame Mail",
		hands=HercHands.WSD,
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Sailfi Belt +1",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}	
	
	-- EVISCERATION
    sets.precast.WS['Evisceration'] = {
        ammo="Yetshila",
		head="Adhemar Bonnet +1",
		neck="Ninja Nodowa +1",
		ear1="Mache Earring +1",
		ear2="Odr Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Regal Ring",
		ring2="Mummu Ring",
		back=Andartia.TPLow,
		waist="Fotia Belt",
		legs="Jokushu Haidate",
		feet="Mpaca's Boots"
	}
	
    sets.precast.WS['Evisceration'].MidAttack = {
        ammo="Yetshila",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Mache Earring +1",
		ear2="Odr Earring",
		body="Kendatsuba Samue +1",
		hands="Ryuo Tekko",
		ring1="Regal Ring",
		ring2="Mummu Ring",
		back=Andartia.TPLow,
		waist="Fotia Belt",
		legs="Jokushu Haidate",
		feet="Mpaca's Boots"
	}
	
    sets.precast.WS['Evisceration'].MaxAttack = {
        ammo="Yetshila",
		head="Mpaca's Cap",
		neck="Fotia Gorget",
		ear1="Mache Earring +1",
		ear2="Odr Earring",
		body="Mpaca's Doublet",
		hands="Mochizuki Tekko +3",
		ring1="Regal Ring",
		ring2="Ilabrat Ring",
		back=Andartia.TPLow,
		waist="Fotia Belt",
		legs="Mpaca's Hose",
		feet="Mochizuki Kyahan +3"
	}	
	
    sets.precast.WS['Vorpal Blade'] = {
        ammo="Yetshila",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Mache Earring +1",
		ear2="Odr Earring",
		body="Kendatsuba Samue +1",
		hands="Ryuo Tekko",
		ring1="Epona's Ring",
		ring2="Hetairoi Ring",
		back=Andartia.TPLow,
		waist="Fotia Belt",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots"
	}

	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS['Aeolian Edge'], {
		head="Pixie Hairpin +1",
		neck="Baetyl Pendant",
		ring1="Archon Ring",
		back=Andartia.MAB
	})

    sets.precast.WS['Red Lotus Blade'] = sets.precast.WS['Aeolian Edge']

    sets.precast.WS['Burning Blade'] = sets.precast.WS['Aeolian Edge']
	
    sets.precast.WS['Flat Blade'] = {
		ammo="Voluspa Tathlum",
		head="Malignance Chapeau",
		neck="Sanctity Necklace",
		ear1="Telos Earring",
        ear2="Dignitary's Earring",
		body="Malignance Tabard",
        hands="Malignance Gloves",
        ring1="Chirich Ring",
		ring2="Etana Ring",
		back=Andartia.TPLow,
		waist="Eschan Stone",
        legs="Malignance Tights",
		feet="Malignance Boots"
	}
	
    sets.precast.WS['Tachi: Jinpu'] = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
        ear2="Friomisi Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Gere Ring",
		ring2="Regal Ring",
		back=Andartia.Ten,
		waist="Fotia Belt",
        legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	
    sets.precast.WS['Tachi: Ageha'] = {
		ammo="Pemphredo Tathlum",
		head="Malignance Chapeau",
		neck="Sanctity Necklace",
		ear1="Telos Earring",
        ear2="Dignitary's Earring",
		body="Malignance Tabard",
        hands="Malignance Gloves",
        ring1="Etana Ring",
		ring2="Chirich Ring",
		waist="Eschan Stone",
        legs="Malignance Tights",
		feet="Malignance Boots"
	}
	
	-- TACHI: KASHA
    sets.precast.WS['Tachi: Kasha'] = {
		ammo="Voluspa Tathlum",
		head="Mpaca's Cap",
		neck="Ninja Nodowa +1",
		ear1="Lugra Earring +1",
        ear2="Lugra Earring",
		body="Malignance Tabard",
        hands="Malignance Gloves",
        ring1="Regal Ring",
		ring2="Gere Ring",
		waist="Sailfi Belt +1",
        legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}
	
    sets.precast.WS['Tachi: Kasha'].MidAttack = {
		ammo="Voluspa Tathlum",
		head="Mpaca's Cap",
		neck="Caro Necklace",
		ear1="Lugra Earring +1",
        ear2="Moonshade Earring",
		body="Nyame Mail",
        hands=HercHands.WSD,
        ring1="Regal Ring",
		ring2="Gere Ring",
		waist="Sailfi Belt +1",
        legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}

    sets.precast.WS['Tachi: Kasha'].MaxAttack = {
		ammo="Voluspa Tathlum",
		head="Mpaca's Cap",
		neck="Caro Necklace",
		ear1="Lugra Earring +1",
        ear2="Moonshade Earring",
		body="Mochizuki Chainmail +3",
        hands="Mochizuki Tekko +3",
        ring1="Regal Ring",
		ring2="Gere Ring",
		waist="Sailfi Belt +1",
        legs="Mochizuki Hakama +3",
		feet="Mochizuki Kyahan +3"
	}	
	
    sets.precast.WS['Tachi: Kagero'] = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
        ear2="Friomisi Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Gere Ring",
		ring2="Regal Ring",
		back=Andartia.Ten,
		waist="Fotia Belt",
        legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}
	
    sets.precast.WS['Tachi: Enpi'] = {
		ammo="Valuspa Tathlum",
		head="Hachiya Hatsuburi +3",
		neck="Fotia Gorget",
		ear1="Lugra Earring +1",
        ear2="Lugra Earring",
		body="Nyame Mail",
        hands=HercHands.WSD,
        ring1="Regal Ring",
		ring2="Gere Ring",
		waist="Fotia Belt",
        legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}
	
    sets.precast.WS['Tachi: Hobaku'] = {
		ammo="Voluspa Tathlum",
		head="Malignance Chapeau",
		neck="Sanctity Necklace",
		ear1="Telos Earring",
        ear2="Dignitary's Earring",
		body="Malignance Tabard",
        hands="Malignance Gloves",
        ring1="Chirich Ring",
		ring2="Etana Ring",
		back=Andartia.TPLow,
		waist="Eschan Stone",
        legs="Malignance Tights",
		feet="Malignance Boots"
	}
	
	-- ASURAN FISTS
    sets.precast.WS['Asuran Fists'] = {
		ammo="Voluspa Tathlum",
		head="Malignance Chapeau",
		neck="Fotia Gorget",
		ear1="Lugra Earring +1",
		ear2="Lugra Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Fotia Belt",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}
	
    sets.precast.WS['Asuran Fists'].MidAttack = {
		ammo="Voluspa Tathlum",
		head="Hachiya Hatsuburi +3",
		neck="Fotia Gorget",
		ear1="Lugra Earring +1",
		ear2="Lugra Earring",
		body="Nyame Mail",
		hands=HercHands.WSD,
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Fotia Belt",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}

    sets.precast.WS['Asuran Fists'].MaxAttack = {
		ammo="Voluspa Tathlum",
		head="Mpaca's Cap",
		neck="Fotia Gorget",
		ear1="Lugra Earring +1",
		ear2="Lugra Earring",
		body="Mochizuki Chainmail +3",
		hands="Mochizuki Tekko +3",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Fotia Belt",
		legs="Mochizuki Hakama +3",
		feet="Mochizuki Kyahan +3"
	}	

	-- RAGING FISTS
    sets.precast.WS['Raging Fists'] = {
		ammo="Coiste Bodhar",
		head="Mpaca's Cap",
		neck="Fotia Gorget",
		ear1="Lugra Earring +1",
		ear2="Moonshade Earring",
		body="Kendatsuba Samue +1",
		hands="Adhemar Wristbands +1",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.TPLow,
		waist="Fotia Belt",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots"
	}	
	
    sets.precast.WS['Raging Fists'].MidAttack = {
		ammo="Coiste Bodhar",
		head="Mpaca's Cap",
		neck="Fotia Gorget",
		ear1="Lugra Earring +1",
		ear2="Moonshade Earring",
		body="Kendatsuba Samue +1",
		hands="Adhemar Wristbands +1",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.TPLow,
		waist="Fotia Belt",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots"
	}	

    sets.precast.WS['Raging Fists'].MaxAttack = {
		ammo="Coiste Bodhar",
		head="Mpaca's Cap",
		neck="Fotia Gorget",
		ear1="Lugra Earring +1",
		ear2="Moonshade Earring",
		body="Mpaca's Doublet",
		hands="Mochizuki Tekko +3",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.TPLow,
		waist="Fotia Belt",
		legs="Mpaca's Hose",
		feet="Mochizuki Kyahan +3"
	}		
	
	-- COMBO
    sets.precast.WS['Combo'] = {
		ammo="Coiste Bodhar",
		head="Mpaca's Cap",
		neck="Fotia Gorget",
		ear1="Lugra Earring +1",
		ear2="Moonshade Earring",
		body="Kendatsuba Samue +1",
		hands="Adhemar Wristbands +1",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.TPLow,
		waist="Fotia Belt",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots"
	}
	
    sets.precast.WS['Combo'].MidAttack = {
		ammo="Coiste Bodhar",
		head="Mpaca's Cap",
		neck="Fotia Gorget",
		ear1="Lugra Earring +1",
		ear2="Moonshade Earring",
		body="Kendatsuba Samue +1",
		hands="Adhemar Wristbands +1",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.TPLow,
		waist="Fotia Belt",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots"
	}	

    sets.precast.WS['Combo'].MaxAttack = {
		ammo="Coiste Bodhar",
		head="Mpaca's Cap",
		neck="Fotia Gorget",
		ear1="Lugra Earring +1",
		ear2="Moonshade Earring",
		body="Mpaca's Doublet",
		hands="Mochizuki Tekko +3",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.TPLow,
		waist="Fotia Belt",
		legs="Mpaca's Hose",
		feet="Mochizuki Kyahan +3"
	}		
	
    sets.precast.WS['Shoulder Tackle'] = {
		ammo="Voluspa Tathlum",
		head="Malignance Chapeau",
		neck="Sanctity Necklace",
		ear1="Telos Earring",
        ear2="Dignitary's Earring",
		body="Malignance Tabard",
        hands="Malignance Gloves",
        ring1="Chirich Ring",
		ring2="Etana Ring",
		back=Andartia.TPLow,
		waist="Eschan Stone",
        legs="Malignance Tights",
		feet="Malignance Boots"
	}	
	
    sets.precast.WS['Spinning Attack'] = {
		ammo="Voluspa Tathlum",
		head="Hachiya Hatsuburi +3",
		neck="Ninja Nodowa +1",
		ear1="Lugra Earring",
		ear2="Lugra Earring +1",
		body="Nyame Mail",
		hands=HercHands.WSD,
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Sailfi Belt +1",
		legs="Mochizuki Hakama +3",
		feet="Nyame Mail"
	}	
	
end



-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------
function job_pretarget(spell, action, spellMap, eventArgs)
    if state.Buff[spell.english] ~= nil then
        state.Buff[spell.english] = true
    end
    if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then
        cancel_spell()
        send_command('input /item "Echo Drops" <me>')
    end
end
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spell.skill == "Ninjutsu" and spell.target.type:lower() == 'self' and spellMap ~= "Utsusemi" then
        if spell.english == "Migawari: Ichi" then
            classes.CustomClass = "Migawari"
        else
            classes.CustomClass = "SelfNinjutsu"
        end
    end
    if spell.name == 'Spectral Jig' and buffactive.sneak then
        -- If sneak is active when using, cancel before completion
        send_command('cancel 71')
    end
    --if string.find(spell.english, 'Utsusemi') then
    --    if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
    --        cancel_spell()
    --        eventArgs.cancel = true
    --        return
    --    end
    --end
	
	

end

function job_post_precast(spell, action, spellMap, eventArgs)
    -- Ranged Attacks 
    if spell.action_type == 'Ranged Attack' and state.OffenseMode ~= 'Acc' then
        equip( sets.SangeAmmo )
    end
    -- protection for lag
    if spell.name == 'Sange' and (player.equipment.ammo == gear.RegularAmmo or player.equipment.ammo == gear.EnmityAmmo) then
        state.Buff.Sange = false
        eventArgs.cancel = true
    end
    if spell.type == 'WeaponSkill' then
        if spell.english == 'Aeolian Edge' and state.TreasureMode.value ~= 'None' then
            equip(sets.TreasureHunter)
        end
		
		if AttackModdedWSList:contains(spell.english) then --assumes attack cap unless toggled otherwise
			if state.AttackBuffs.value == 'MidAttack' then
				if spell.english == 'Blade: Metsu' then
					equip(sets.precast.WS['Blade: Metsu'].MidAttack)
				end
				if spell.english == 'Blade: Shun' then
					equip(sets.precast.WS['Blade: Shun'].MidAttack)
				end
				if spell.english == 'Blade: Ten' then
					equip(sets.precast.WS['Blade: Ten'].MidAttack)
				end
				if spell.english == 'Blade: Ku' then
					equip(sets.precast.WS['Blade: Ku'].MidAttack)
				end
				if spell.english == 'Blade: Kamu' then
					equip(sets.precast.WS['Blade: Kamu'].MidAttack)
				end
				if spell.english == 'Blade: Hi' then
					equip(sets.precast.WS['Blade: Hi'].MidAttack)
				end
				if spell.english == 'Tachi: Kasha' then
					equip(sets.precast.WS['Tachi: Kasha'].MidAttack)
				end	
				if spell.english == 'Evisceration' then
					equip(sets.precast.WS['Evisceration'].MidAttack)
				end	
				if spell.english == 'Asuran Fists' then
					equip(sets.precast.WS['Asuran Fists'].MidAttack)
				end	
				if spell.english == 'Raging Fists' then
					equip(sets.precast.WS['Raging Fists'].MidAttack)
				end
				if spell.english == 'Combo' then
					equip(sets.precast.WS['Combo'].MidAttack)
				end					
			elseif state.AttackBuffs.value == 'MaxAttack' then
				if spell.english == 'Blade: Metsu' then
					equip(sets.precast.WS['Blade: Metsu'].MaxAttack)
				end
				if spell.english == 'Blade: Shun' then
					equip(sets.precast.WS['Blade: Shun'].MaxAttack)
				end
				if spell.english == 'Blade: Ten' then
					equip(sets.precast.WS['Blade: Ten'].MaxAttack)
				end
				if spell.english == 'Blade: Ku' then
					equip(sets.precast.WS['Blade: Ku'].MaxAttack)
				end
				if spell.english == 'Blade: Kamu' then
					equip(sets.precast.WS['Blade: Kamu'].MaxAttack)
				end
				if spell.english == 'Blade: Hi' then
					equip(sets.precast.WS['Blade: Hi'].MaxAttack)
				end
				if spell.english == 'Tachi: Kasha' then
					equip(sets.precast.WS['Tachi: Kasha'].MaxAttack)
				end	
				if spell.english == 'Evisceration' then
					equip(sets.precast.WS['Evisceration'].MaxAttack)
				end	
				if spell.english == 'Asuran Fists' then
					equip(sets.precast.WS['Asuran Fists'].MaxAttack)
				end	
				if spell.english == 'Raging Fists' then
					equip(sets.precast.WS['Raging Fists'].MaxAttack)
				end
				if spell.english == 'Combo' then
					equip(sets.precast.WS['Combo'].MaxAttack)
				end					
			end
		end
		
        -- Mecistopins Mantle rule (if you kill with ws)
        if state.CapacityMode.value then
            equip(sets.CapacityMantle)
        end
		if spell.english == 'Blade: Ten' then
			if (player.equipment.main == 'Heishi Shinroken' and player.equipment.sub == 'Uzura +2') and player.tp > 1050 then
				if player.tp > 1250 then 
					equip({head="Hachiya Hitsuburi +3", ear1="Moonshade Earring"})
				end
				if player.tp > 1300 then 
					equip({head="Mpaca's Cap", ear1="Ishvara Earring"})
				end
				if player.tp > 1500 then 
					equip({head="Hachiya Hatsuburi +3", ear1="Ishvara Earring"})
				end
			end
			if player.equipment.main == 'Heishi Shinroken' and player.tp > 2050 then
				if player.tp > 2250 then 
					equip({head="Hachiya Hitsuburi +3", ear1="Moonshade Earring"})
				end
				if player.tp > 2300 then 
					equip({head="Mpaca's Cap", ear1="Ishvara Earring"})
				end
				if player.tp > 2500 then 
					equip({head="Hachiya Hatsuburi +3", ear1="Ishvara Earring"})
				end
			end
			if player.equipment.main ~= 'Heishi Shinroken' then
				if player.tp > 2750 then 
					equip({head="Hachiya Hitsuburi +3", ear1="Moonshade Earring"})
				end
				if player.tp > 2800 then 
					equip({head="Mpaca's Cap", ear1="Ishvara Earring"})
				end	
			end
		end	
		if spell.english == 'Savage Blade' and player.tp > 1550 then
			if player.tp > 1750 then 
				equip({head="Hachiya Hitsuburi +3", ear1="Moonshade Earring"})
			end
			if player.tp > 1800 then 
				equip({head="Mpaca's Cap", ear1="Ishvara Earring"})
			end
			if player.tp > 2000 then 
				equip({head="Hachiya Hitsuburi +3", ear1="Ishvara Earring"})
			end
		end	
		
		if (spell.english == 'Blade: Shun'
     		or spell.english == 'Evisceration' 
			or spell.english == 'Asuran Fists' or spell.english == 'Raging Fists' or spell.english == 'Combo') 
		and (check_ws_day[world.day]:contains(spell.skillchain_a)
			or check_ws_day[world.day]:contains(spell.skillchain_b)
			or check_ws_day[world.day]:contains(spell.skillchain_c)) then
			equip(sets.WSDayBonus)
		end	
        -- Swap in special ammo for WS in high Acc mode
        if state.OffenseMode.value == 'Acc' then
            equip(select_ws_ammo())
        end
        -- Lugra Earring for some WS
        if LugraWSList:contains(spell.english) then
            if world.time >= (17*60) or world.time <= (7*60) then
                equip(sets.BrutalLugra)
            else
                equip(sets.BrutalTrux)
            end
        elseif spell.english == 'Blade: Hi' or spell.english == 'Blade: Ten' then
            if world.time >= (17*60) or world.time <= (7*60) then
                equip(sets.BrutalLugra)
            else
                equip(sets.BrutalMoon)
            end
        end
		
		if ((spell.english == 'Blade: Chi' and (spell.element == world.day_element or spell.element == world.weather_element))
			or (spell.english == 'Blade: To' and (spell.element == world.day_element or spell.element == world.weather_element))
			or (spell.english == 'Blade: Teki' and (spell.element == world.day_element or spell.element == world.weather_element)) 
			or (spell.english == 'Blade: E1' and (spell.element == world.day_element or spell.element == world.weather_element))) then
			equip({waist="Hachirin-no-Obi"})
		end
    end
end

function job_midcast(spell, action, spellMap, eventArgs)
	if spell.name == 'Utsusemi: Ichi' and (ShadowType == 'Ni' or ShadowType == 'San') and 
	(buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)']) then
	
		send_command('@wait 0.15;cancel Copy Image;cancel Copy Image (2);cancel Copy Image (3);cancel Copy Image (4+)')
	
	elseif spell.name == 'Utsusemi: Ni' and ShadowType == 'San' and 
	(buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)']) then

		send_command('cancel Copy Image;cancel Copy Image (2);cancel Copy Image (3);cancel Copy Image (4+)')	
	
	end
	
	if (spell.english == 'Utsusemi: San' or spell.english == 'Utsusemi: Ni' or spell.english == 'Utsusemi: Ichi') and buffactive['Yonin'] then
		equip(sets.midcast.Utsusemi.Enmity)
	end
	
	if Magic_Enmity:contains(spell.english) then
		equip(sets.precast.JA['Provoke'])
	end
	
end	

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Run after the general midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    -- if spell.english == "Monomi: Ichi" then
        -- if buffactive['Sneak'] then
            -- send_command('@wait 1.7;cancel sneak')
        -- end
    -- end
	
	if ninjutsuNukeList:contains(spell.name) then
		if state.MagicBurst.value then
			if (spell.element == world.day_element or spell.element == world.weather_element) then
				equip(sets.BurstWeather)
			else
				equip(sets.Burst)
			end
		end	
		if buffactive['Futae'] then
			equip(sets.Futae)
		end
		if (spell.element == world.day_element or spell.element == world.weather_element) then
			equip({waist="Hachirin-no-Obi"})
		end
	end	
	
	if (spell.english == 'Utsusemi: San' or spell.english == 'Utsusemi: Ni' or spell.english == 'Utsusemi: Ichi') and buffactive['Yonin'] then
		equip(sets.midcast.Utsusemi.Enmity)
	end	
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    if midaction() then
        return
    end
    -- Aftermath timer creation
    aw_custom_aftermath_timers_aftercast(spell)
    --if spell.type == 'WeaponSkill' then
	
	if spell.name == 'Utsusemi: San' and spell.interrupted == false then
		ShadowType = 'San'
	elseif spell.name == 'Utsusemi: Ni' and spell.interrupted == false then
		ShadowType = 'Ni'
	elseif spell.name == 'Utsusemi: Ichi' and spell.interrupted == false then
		ShadowType = 'Ichi'
	end	
end

-------------------------------------------------------------------------------------------------------------------
-- Customization hooks for idle and melee sets, after they've been automatically constructed.
-------------------------------------------------------------------------------------------------------------------

-- Called before the Include starts constructing melee/idle/resting sets.
-- Can customize state or custom melee class values at this point.
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_handle_equipping_gear(status, eventArgs)
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.hpp < 80 then
        idleSet = set_combine(idleSet, sets.idle.Regen)
    end
    if state.CraftingMode then
        idleSet = set_combine(idleSet, sets.crafting)
    end
    if state.HybridMode.value == 'PDT' then
        if state.Buff.Migawari then
            idleSet = set_combine(idleSet, sets.buff.Migawari)
        else 
            idleSet = set_combine(idleSet, sets.defense.PDT)
        end
    else
        idleSet = set_combine(idleSet, select_movement())
    end
    --local res = require('resources')
    --local info = windower.ffxi.get_info()
    --local zone = res.zones[info.zone].name
    --if zone:match('Adoulin') then
    --    idleSet = set_combine(idleSet, sets.Adoulin)
    --end
	if player.equipment.main == 'Tsuru' then
		idleSet = set_combine(idleSet, {ring1="Pernicious Ring"})
	end
	if buffactive['Yonin'] then
		if state.Evasion.value == true then
			idleSet = set_combine(idleSet, sets.idle.Eva)
		else
			idleSet = set_combine(idleSet, sets.idle.Tank)
		end
	end
    return idleSet
end

-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    if state.TreasureMode.value == 'Fulltime' then
        meleeSet = set_combine(meleeSet, sets.TreasureHunter)
    end
    if state.CapacityMode.value then
        meleeSet = set_combine(meleeSet, sets.CapacityMantle)
    end
    if state.Buff.Migawari and state.HybridMode.value == 'PDT' then
        meleeSet = set_combine(meleeSet, sets.buff.Migawari)
    end
    if player.mp < 100 and state.OffenseMode.value ~= 'Acc' then
        -- use Rajas instead of Oneiros for normal + mid
        meleeSet = set_combine(meleeSet, sets.Rajas)
    end
    meleeSet = set_combine(meleeSet, select_ammo())
    return meleeSet
end

-------------------------------------------------------------------------------------------------------------------
-- General hooks for other events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)

    if state.Buff[buff] ~= nil then
        if not midaction() then
            handle_equipping_gear(player.status)
        end
    end

    if (buff == 'Innin' and gain or buffactive['Innin']) then
        state.CombatForm:set('Innin')
        if not midaction() then
            handle_equipping_gear(player.status)
        end
    else
        state.CombatForm:reset()
        if not midaction() then
            handle_equipping_gear(player.status)
        end
    end

    -- If we gain or lose any haste buffs, adjust which gear set we target. Issekigan added for tank functionality.
    if S{'haste', 'march', 'mighty guard', 'embrava', 'haste samba', 'geo-haste', 'indi-haste', 'issekigan'}:contains(buff:lower()) then
        determine_haste_group()
        if not midaction() then
            handle_equipping_gear(player.status)
        end
    end

end

function job_status_change(newStatus, oldStatus, eventArgs)
    if newStatus == 'Engaged' then
        update_combat_form()
    end
end


-- Called by the default 'update' self-command.
function job_update(cmdParams, eventArgs)
   -- local res = require('resources')
   -- local info = windower.ffxi.get_info()
   -- local zone = res.zones[info.zone].name
   -- if state.Moving.value == true then
   --     if zone:match('Adoulin') then
   --         equip(sets.Adoulin)
   --     end
   --     equip(select_movement())
   -- end
    select_ammo()
    determine_haste_group()
    update_combat_form()
    run_sj = player.sub_job == 'RUN' or false
    --select_movement()
    th_update(cmdParams, eventArgs)
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- State buff checks that will equip buff gear and mark the event as handled.
function check_buff(buff_name, eventArgs)
    if state.Buff[buff_name] then
        equip(sets.buff[buff_name] or {})
        if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
            equip(sets.TreasureHunter)
        end
        eventArgs.handled = true
    end
end
-- Check for various actions that we've specified in user code as being used with TH gear.
-- This will only ever be called if TreasureMode is not 'None'.
-- Category and Param are as specified in the action event packet.
function th_action_check(category, param)
    if category == 2 or -- any ranged attack
        --category == 4 or -- any magic action
        (category == 3 and param == 30) or -- Aeolian Edge
        (category == 6 and info.default_ja_ids:contains(param)) or -- Provoke, Animated Flourish
        (category == 14 and info.default_u_ja_ids:contains(param)) -- Quick/Box/Stutter Step, Desperate/Violent Flourish
        then 
            return true
    end
end

function select_movement()
    -- world.time is given in minutes into each day
    -- 7:00 AM would be 420 minutes
    -- 17:00 PM would be 1020 minutes
    if world.time >= (17*60) or world.time <= (7*60) then
        return sets.NightMovement
    else
        return sets.DayMovement
    end
end

function determine_haste_group()

    classes.CustomMeleeGroups:clear()
    -- assuming +4 for marches (ghorn has +5)
    -- Haste (white magic) is 14.65% (15%)
	-- Haste II[511] (white magic) is 29.98% (30%)
    -- Haste Samba (Sub) 5%
    -- Haste (Merited DNC) 10% (never account for this)
	-- Honor March is now considered in 'Hi'
	-- Honor March +0/+1/+2/+3/+4            ||  12.30% /13.48% / 14.65% / 15.82% / 16.99%
    -- Victory March +0/+3/+4/+5/+6/+7/+8    ||  15.92% /17.48% / 19.04% / 20.61% / 22.27% / 23.83% / 25.39% / 27.05% / 28.61%
    -- Advancing March +0/+3/+4/+5/+6/+7/+8  ||  10.55% /11.52% / 12.60% / 13.67% / 14.75% / 15.82% / 16.60% / 17.87% / 18.95%
    -- Embrava 30% with 500 enhancing skill
    -- buffactive[580] = geo haste - 30% (does not assume idris since it will not cap on its own w/o rare circumstance i.e /dnc)
    -- buffactive[33] = regular haste - 15%
    -- buffactive[604] = mighty guard - 15%
    -- state.HasteMode = toggle for when you know Haste II is being cast on you as well as 2hr buffs like SV and Bolster
    -- Hi = Haste II and/or H.M. is being cast. This is clunky to use when both haste II and haste I are being cast (default to Hi)
	-- SV = Accounts for Soul Voice and/or Bolster buffs
	-- WIN+F9 toggles
	-- Issekigan rule now overrides the weapon specific haste grouping while Yonin is active
	
	if (buffactive['Yonin'] and buffactive['Issekigan'] and state.OffenseMode.value == 'Experimental' and state.Weapon.value ~= 'Hand-to-Hand') then
		classes.CustomMeleeGroups:append('Issekigan')
	else
	
	if state.Weapon.value == 'Great Katana' then
		if state.HasteMode.value == 'SV' then
			if ( ( (buffactive[33] or buffactive[604] or buffactive.embrava) and (buffactive.march == 1 or buffactive[580]) ) or 
			    ( buffactive.march and (buffactive[580] or buffactive.embrava or buffactive[604] or buffactive[33]) ) or
				( buffactive[580] and (buffactive[march] or buffactive.embrava or buffactive[604] or buffactive[33]) ) or
				buffactive.march or buffactive[580] ) then
				add_to_chat(8, '-------------Max-Haste Mode Enabled--------------')
				classes.CustomMeleeGroups:append('GKTMaxHaste')
			elseif ( (buffactive[33] or buffactive.embrava or buffactive[580]) and buffactive['haste samba'] ) then --Assumes Haste2
				add_to_chat(8, '-------------Haste 35%-------------')
				classes.CustomMeleeGroups:append('GKTHaste_35')
			elseif ( buffactive[580] or buffactive[33] or buffactive.embrava ) then --Assumes Haste2
				add_to_chat(8, '-------------Haste 30%-------------')
				classes.CustomMeleeGroups:append('GKTHaste_30')
			elseif ( buffactive[604] ) then
				add_to_chat(8, '-------------Haste 15%-------------')
				classes.CustomMeleeGroups:append('GKTHaste_15')
			end
		elseif state.HasteMode.value == 'Hi' then
			if ( ( (buffactive[33] or buffactive[580] or buffactive.embrava) and (buffactive.march or buffactive[604]) ) or
				 ( buffactive[33] and (buffactive[580] or buffactive.embrava or buffactive.march == 1 or buffactive[604]) ) or
				   (buffactive.march == 2) ) then
				add_to_chat(8, '-------------Max-Haste Mode Enabled--------------')
				classes.CustomMeleeGroups:append('GKTMaxHaste')
			elseif ( (buffactive[33] or buffactive.embrava or buffactive[580]) and buffactive['haste samba'] ) then
				add_to_chat(8, '-------------Haste 35%-------------')
				classes.CustomMeleeGroups:append('GKTHaste_35')
			elseif ( buffactive[580] or buffactive[33] or (buffactive.march == 1 and buffactive[604]) ) then
				add_to_chat(8, '-------------Haste 30%-------------')
				classes.CustomMeleeGroups:append('GKTHaste_30')
			elseif ( buffactive.march == 1 or buffactive[604] ) then
				add_to_chat(8, '-------------Haste 15%-------------')
				classes.CustomMeleeGroups:append('GKTHaste_15')
			end
		else
			if ( buffactive[580] and (buffactive.march or buffactive[33] or buffactive.embrava or buffactive[604]) ) or  -- geo haste + anything
			   ( buffactive.embrava and (buffactive.march or buffactive[33] or buffactive[604]) ) or  -- embrava + anything
			   ( buffactive.march == 2 ) or  -- two marches
			   ( buffactive[33] and buffactive[604] and buffactive.march ) then -- haste + mighty guard + any marches
				add_to_chat(8, '-------------Max Haste Mode Enabled--------------')
				classes.CustomMeleeGroups:append('GKTMaxHaste')
			elseif ( buffactive[604] and buffactive[33] and buffactive['haste samba'] ) or -- MG + haste + samba
				   ( buffactive.march == 1 and buffactive[33] and buffactive['haste samba'] ) or
				   ( (buffactive[580] or buffactive.embrava) and buffactive['haste samba'] ) then 
				add_to_chat(8, '-------------Haste 35%-------------')
				classes.CustomMeleeGroups:append('GKTHaste_35')
			elseif ( (buffactive[33] or buffactive[604]) and buffactive.march == 1 ) or  -- MG or haste + 1 march
				   ( buffactive[580] ) or  -- geo haste
				   ( buffactive.embrava ) or -- embrava
				   ( buffactive[33] and buffactive[604] ) then  -- haste with MG
				add_to_chat(8, '-------------Haste 30%-------------')
				classes.CustomMeleeGroups:append('GKTHaste_30')
			elseif buffactive[33] or buffactive[604] or buffactive.march == 1 then
				add_to_chat(8, '-------------Haste 15%-------------')
				classes.CustomMeleeGroups:append('GKTHaste_15')
			end
		end

	elseif state.Weapon.value == 'Hand-to-Hand' then
		if state.HasteMode.value == 'SV' then
			if ( ( (buffactive[33] or buffactive[604] or buffactive.embrava) and (buffactive.march == 1 or buffactive[580]) ) or 
			    ( buffactive.march and (buffactive[580] or buffactive.embrava or buffactive[604] or buffactive[33]) ) or
				( buffactive[580] and (buffactive[march] or buffactive.embrava or buffactive[604] or buffactive[33]) ) or
				buffactive.march or buffactive[580] ) then
				add_to_chat(8, '-------------Max-Haste Mode Enabled--------------')
				classes.CustomMeleeGroups:append('H2HMaxHaste')
			elseif ( (buffactive[33] or buffactive.embrava or buffactive[580]) and buffactive['haste samba'] ) then --Assumes Haste2
				add_to_chat(8, '-------------Haste 35%-------------')
				classes.CustomMeleeGroups:append('H2HHaste_35')
			elseif ( buffactive[580] or buffactive[33] or buffactive.embrava ) then --Assumes Haste2
				add_to_chat(8, '-------------Haste 30%-------------')
				classes.CustomMeleeGroups:append('H2HHaste_30')
			elseif ( buffactive[604] ) then
				add_to_chat(8, '-------------Haste 15%-------------')
				classes.CustomMeleeGroups:append('H2HHaste_15')
			end
		elseif state.HasteMode.value == 'Hi' then
			if ( ( (buffactive[33] or buffactive[580] or buffactive.embrava) and (buffactive.march or buffactive[604]) ) or
				 ( buffactive[33] and (buffactive[580] or buffactive.embrava or buffactive.march == 1 or buffactive[604]) ) or
				   (buffactive.march == 2) ) then
				add_to_chat(8, '-------------Max-Haste Mode Enabled--------------')
				classes.CustomMeleeGroups:append('H2HMaxHaste')
			elseif ( (buffactive[33] or buffactive.embrava or buffactive[580]) and buffactive['haste samba'] ) then
				add_to_chat(8, '-------------Haste 35%-------------')
				classes.CustomMeleeGroups:append('H2HHaste_35')
			elseif ( buffactive[580] or buffactive[33] or (buffactive.march == 1 and buffactive[604]) ) then
				add_to_chat(8, '-------------Haste 30%-------------')
				classes.CustomMeleeGroups:append('H2HHaste_30')
			elseif ( buffactive.march == 1 or buffactive[604] ) then
				add_to_chat(8, '-------------Haste 15%-------------')
				classes.CustomMeleeGroups:append('H2HHaste_15')
			end
		else
			if ( buffactive[580] and (buffactive.march or buffactive[33] or buffactive.embrava or buffactive[604]) ) or  -- geo haste + anything
			   ( buffactive.embrava and (buffactive.march or buffactive[33] or buffactive[604]) ) or  -- embrava + anything
			   ( buffactive.march == 2 ) or  -- two marches
			   ( buffactive[33] and buffactive[604] and buffactive.march ) then -- haste + mighty guard + any marches
				add_to_chat(8, '-------------Max Haste Mode Enabled--------------')
				classes.CustomMeleeGroups:append('H2HMaxHaste')
			elseif ( buffactive[604] and buffactive[33] and buffactive['haste samba'] ) or -- MG + haste + samba
				   ( buffactive.march == 1 and buffactive[33] and buffactive['haste samba'] ) or
				   ( (buffactive[580] or buffactive.embrava) and buffactive['haste samba'] ) then 
				add_to_chat(8, '-------------Haste 35%-------------')
				classes.CustomMeleeGroups:append('H2HHaste_35')
			elseif ( (buffactive[33] or buffactive[604]) and buffactive.march == 1 ) or  -- MG or haste + 1 march
				   ( buffactive[580] ) or  -- geo haste
				   ( buffactive.embrava ) or -- embrava
				   ( buffactive[33] and buffactive[604] ) then  -- haste with MG
				add_to_chat(8, '-------------Haste 30%-------------')
				classes.CustomMeleeGroups:append('H2HHaste_30')
			elseif buffactive[33] or buffactive[604] or buffactive.march == 1 then
				add_to_chat(8, '-------------Haste 15%-------------')
				classes.CustomMeleeGroups:append('H2HHaste_15')
			end
		end
		
	else
		if state.HasteMode.value == 'SV' then
			if ( ( (buffactive[33] or buffactive[604] or buffactive.embrava) and (buffactive.march == 1 or buffactive[580]) ) or 
			    ( buffactive.march and (buffactive[580] or buffactive.embrava or buffactive[604] or buffactive[33]) ) or
				( buffactive[580] and (buffactive[march] or buffactive.embrava or buffactive[604] or buffactive[33]) ) or
				buffactive.march or buffactive[580] ) then
				add_to_chat(8, '-------------Max-Haste Mode Enabled--------------')
				classes.CustomMeleeGroups:append('MaxHaste')
			elseif ( (buffactive[33] or buffactive.embrava or buffactive[580]) and buffactive['haste samba'] ) then --Assumes Haste2
				add_to_chat(8, '-------------Haste 35%-------------')
				classes.CustomMeleeGroups:append('Haste_35')
			elseif ( buffactive[580] or buffactive[33] or buffactive.embrava ) then --Assumes Haste2
				add_to_chat(8, '-------------Haste 30%-------------')
				classes.CustomMeleeGroups:append('Haste_30')
			elseif ( buffactive[604] ) then
				add_to_chat(8, '-------------Haste 15%-------------')
				classes.CustomMeleeGroups:append('Haste_15')
			end
		elseif state.HasteMode.value == 'Hi' then
			if ( ( (buffactive[33] or buffactive[580] or buffactive.embrava) and (buffactive.march or buffactive[604]) ) or
				 ( buffactive[33] and (buffactive[580] or buffactive.embrava or buffactive.march == 1 or buffactive[604]) ) or
				   (buffactive.march == 2) ) then
				add_to_chat(8, '-------------Max-Haste Mode Enabled--------------')
				classes.CustomMeleeGroups:append('MaxHaste')
			elseif ( (buffactive[33] or buffactive.embrava or buffactive[580]) and buffactive['haste samba'] ) then
				add_to_chat(8, '-------------Haste 35%-------------')
				classes.CustomMeleeGroups:append('Haste_35')
			elseif ( buffactive[580] or buffactive[33] or (buffactive.march == 1 and buffactive[604]) ) then
				add_to_chat(8, '-------------Haste 30%-------------')
				classes.CustomMeleeGroups:append('Haste_30')
			elseif ( buffactive.march == 1 or buffactive[604] ) then
				add_to_chat(8, '-------------Haste 15%-------------')
				classes.CustomMeleeGroups:append('Haste_15')
			end
		else
			if ( buffactive[580] and (buffactive.march or buffactive[33] or buffactive.embrava or buffactive[604]) ) or  -- geo haste + anything
			   ( buffactive.embrava and (buffactive.march or buffactive[33] or buffactive[604]) ) or  -- embrava + anything
			   ( buffactive.march == 2 ) or  -- two marches
			   ( buffactive[33] and buffactive[604] and buffactive.march ) then -- haste + mighty guard + any marches
				add_to_chat(8, '-------------Max Haste Mode Enabled--------------')
				classes.CustomMeleeGroups:append('MaxHaste')
			elseif ( buffactive[604] and buffactive[33] and buffactive['haste samba'] ) or -- MG + haste + samba
				   ( buffactive.march == 1 and buffactive[33] and buffactive['haste samba'] ) or
				   ( (buffactive[580] or buffactive.embrava) and buffactive['haste samba'] ) then 
				add_to_chat(8, '-------------Haste 35%-------------')
				classes.CustomMeleeGroups:append('Haste_35')
			elseif ( (buffactive[33] or buffactive[604]) and buffactive.march == 1 ) or  -- MG or haste + 1 march
				   ( buffactive[580] ) or  -- geo haste
				   ( buffactive.embrava ) or -- embrava
				   ( buffactive[33] and buffactive[604] ) then  -- haste with MG
				add_to_chat(8, '-------------Haste 30%-------------')
				classes.CustomMeleeGroups:append('Haste_30')
			elseif buffactive[33] or buffactive[604] or buffactive.march == 1 then
				add_to_chat(8, '-------------Haste 15%-------------')
				classes.CustomMeleeGroups:append('Haste_15')
			end
		end
	end
	end
end

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Capacity Point Mantle' then
        gear.Back = newValue
    elseif stateField == 'Runes' then
        local msg = ''
        if newValue == 'Ignis' then
            msg = msg .. 'Increasing resistence against ICE and deals FIRE damage.'
        elseif newValue == 'Gelus' then
            msg = msg .. 'Increasing resistence against WIND and deals ICE damage.'
        elseif newValue == 'Flabra' then
            msg = msg .. 'Increasing resistence against EARTH and deals WIND damage.'
        elseif newValue == 'Tellus' then
            msg = msg .. 'Increasing resistence against LIGHTNING and deals EARTH damage.'
        elseif newValue == 'Sulpor' then
            msg = msg .. 'Increasing resistence against WATER and deals LIGHTNING damage.'
        elseif newValue == 'Unda' then
            msg = msg .. 'Increasing resistence against FIRE and deals WATER damage.'
        elseif newValue == 'Lux' then
            msg = msg .. 'Increasing resistence against DARK and deals LIGHT damage.'
        elseif newValue == 'Tenebrae' then
            msg = msg .. 'Increasing resistence against LIGHT and deals DARK damage.'
        end
        add_to_chat(123, msg)
   -- elseif stateField == 'moving' then
   --     if state.Moving.value then
   --         local res = require('resources')
   --         local info = windower.ffxi.get_info()
   --         local zone = res.zones[info.zone].name
   --         if zone:match('Adoulin') then
   --             equip(sets.Adoulin)
   --         end
   --         equip(select_movement())
   --     end
        
    elseif stateField == 'Use Rune' then
        send_command('@input /ja '..state.Runes.value..' <me>')
    elseif stateField == 'Use Warp' then
        add_to_chat(8, '------------WARPING-----------')
        --equip({ring1="Warp Ring"})
        send_command('input //gs equip sets.Warp;@wait 10.0;input /item "Warp Ring" <me>;')
    end
end

function job_get_spell_map(spell, default_spell_map)
    if spell.type == 'Trust' then
        return 'Trust'
    end	
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
    local msg = ''
    msg = msg .. 'Offense: '..state.OffenseMode.current
    msg = msg .. ', Hybrid: '..state.HybridMode.current

    if state.DefenseMode.value ~= 'None' then
        local defMode = state[state.DefenseMode.value ..'DefenseMode'].current
        msg = msg .. ', Defense: '..state.DefenseMode.value..' '..defMode
    end
    if state.HasteMode.value ~= 'Normal' then
        msg = msg .. ', Haste: '..state.HasteMode.current
    end
    if state.RangedMode.value ~= 'Normal' then
        msg = msg .. ', Rng: '..state.RangedMode.current
    end
    if state.Kiting.value then
        msg = msg .. ', Kiting'
    end
    if state.PCTargetMode.value ~= 'default' then
        msg = msg .. ', Target PC: '..state.PCTargetMode.value
    end
    if state.SelectNPCTargets.value then
        msg = msg .. ', Target NPCs'
    end

    add_to_chat(123, msg)
    eventArgs.handled = true
end

-- Call from job_precast() to setup aftermath information for custom timers.
function aw_custom_aftermath_timers_precast(spell)
    if spell.type == 'WeaponSkill' then
        info.aftermath = {}

        local empy_ws = "Blade: Hi"

        info.aftermath.weaponskill = empy_ws
        info.aftermath.duration = 0

        info.aftermath.level = math.floor(player.tp / 1000)
        if info.aftermath.level == 0 then
            info.aftermath.level = 1
        end

        if spell.english == empy_ws and player.equipment.main == 'Kannagi' then
            -- nothing can overwrite lvl 3
            if buffactive['Aftermath: Lv.3'] then
                return
            end
            -- only lvl 3 can overwrite lvl 2
            if info.aftermath.level ~= 3 and buffactive['Aftermath: Lv.2'] then
                return
            end

            -- duration is based on aftermath level
            info.aftermath.duration = 30 * info.aftermath.level
        end
    end
end

-- Call from job_aftercast() to create the custom aftermath timer.
function aw_custom_aftermath_timers_aftercast(spell)
    -- prevent gear being locked when it's currently impossible to cast 
    if not spell.interrupted and spell.type == 'WeaponSkill' and
        info.aftermath and info.aftermath.weaponskill == spell.english and info.aftermath.duration > 0 then

        local aftermath_name = 'Aftermath: Lv.'..tostring(info.aftermath.level)
        send_command('timers d "Aftermath: Lv.1"')
        send_command('timers d "Aftermath: Lv.2"')
        send_command('timers d "Aftermath: Lv.3"')
        send_command('timers c "'..aftermath_name..'" '..tostring(info.aftermath.duration)..' down abilities/aftermath'..tostring(info.aftermath.level)..'.png')

        info.aftermath = {}
    end
end

function select_ammo()
    if state.Buff.Sange then
        return sets.SangeAmmo
    else
        if state.OffenseMode.value == 'Experimental' then
			return sets.EnmityAmmo
		else
			return sets.RegularAmmo
		end
    end
end

function select_ws_ammo()
    if world.time >= (18*60) or world.time <= (6*60) then
        return sets.NightAccAmmo
    else
        return sets.DayAccAmmo
    end
end

function update_combat_form()
    if state.Buff.Innin then
        state.CombatForm:set('Innin')
    else
        state.CombatForm:reset()
    end
end
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(1, 20)
    elseif player.sub_job == 'WAR' then
        set_macro_page(1, 20)
    elseif player.sub_job == 'RUN' then
        set_macro_page(1, 20)
    else
        set_macro_page(1, 20)
    end
end