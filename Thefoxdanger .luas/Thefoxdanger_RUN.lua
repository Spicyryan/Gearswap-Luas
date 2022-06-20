-- 
-- @author Thefoxdanger of Asura
-- RUN.lua v1.0
--
-- 
-- **Version Changelog**
--
-- V1.1
-- 
-- 
-- Note to users:
-- 
-- Intermediate RUN lua created to streamline play with as few toggles and other things to press as possible. Designed to be similar in 
-- function to the rest of Spicyryan's luas in the Github However, this is a job that naturally has a lot of levers to throw, so take time 
-- to get used to the keybinds below. It also has A LOT of gear fields, which is for a good reason. Make sure to read over comments, reviewing 
-- the current gear in slots to understand what goes there if you don't have my exact gearsets. Everything is very clearly labeled, and if 
-- a set seems to be a duplicate, check that it isn't a version that takes Melee_mode into account.
--
-- I plan to maintain this lua as a template, however if you get a hold of this it is YOUR responsibility to understand its use
-- and to troubleshoot issues within. I will not fix your lua if I do not know you (and probably wont if I do know you). 
-- Have fun~!
--
--
	
--binds--
-- 4 sets you will toggle frequently
send_command("bind F9 gs c toggle TP set") -- F9 switches between melee sets
send_command("bind !F9 gs c toggle TP set reverse") -- Alt+F9 switches between melee sets in reverse

send_command("bind F10 gs c toggle Weapon set") -- F10 switches between weapon sets
send_command("bind !F10 gs c toggle Weapon set reverse") -- Alt+F10 switches between weapon sets in reverse

send_command("bind F11 gs c toggle WS set") -- F11 switches between WS sets
send_command("bind !F11 gs c toggle WS set reverse") -- Alt+F11 switches between WS sets in reverse

send_command("bind F12 gs c toggle Idle set") -- F12 switches between idle sets
send_command("bind !F12 gs c toggle Idle set reverse") -- Alt+F12 switches between idle sets in reverse

send_command("bind !f8 gs c toggle Melee Mode") -- ALT+F8 swap between Tank and Melee modes (Tank is default)
send_command("bind f7 gs c toggle Tank sets") -- F7 swap between Tank sets without changing gear
send_command("bind !f7 gs c toggle Tank sets reverse") -- ALT+F7 swap between Tank sets in reverse without changing gear


-- less frequently changed/'setup' toggles
-- all of my luas are compatible with DW melee in addition to 2H melee, but it is only a "just in case" sort of thing
-- please have the appropriate expectations of SCH melee, however Melee_mode *does* lock your weapon during actions for Myrkr use
send_command("bind @f9 gs c toggle Haste Mode") -- WIN+F9 Toggles between SV/Bolster, HasteII and Low haste modes
send_command("bind @f8 gs c toggle DW set") -- WIN+F8 swap between DualWield and SingleWield for melee sets (can only be toggled if DW is available)
send_command("bind !` gs c toggle Burst Mode") -- Alt+` switches Magic Burst sets on/off


--numpad controls for WS's and magic
-- -- CTRL key for WS
send_command('bind ^numpad0 @input /ws "Dimidiation" <t>')
send_command('bind ^numpad1 @input /ws "Resolution" <t>')
send_command('bind ^numpad2 @input /ws "Ground Strike" <t>')
send_command('bind ^numpad3 @input /ws "Shockwave" <t>')
send_command('bind ^numpad4 @input /ws "Steel Cyclone" <t>')
send_command('bind ^numpad5 @input /ws "Upheaval" <t>')
send_command('bind ^numpad6 @input /ws "Fell Cleave" <t>')
send_command('bind ^numpad7 @input /ws "Armor Break" <t>')
send_command('bind ^numpad8 @input /ws "Savage Blade" <t>')
send_command('bind ^numpad9 @input /ws "Sanguine Blade" <t>')
-- -- Alt key for Runes
send_command('bind !numpad0 @input /ja "Liement" <me>')
send_command('bind !numpad1 @input /ja "Ignis" <me>')
send_command('bind !numpad2 @input /ja "Gelus" <me>')
send_command('bind !numpad3 @input /ja "Flabra" <me>')
send_command('bind !numpad4 @input /ja "Tellus" <me>')
send_command('bind !numpad5 @input /ja "Sulpor" <me>')
send_command('bind !numpad6 @input /ja "Unda" <me>')
send_command('bind !numpad7 @input /ja "Lux" <me>')
send_command('bind !numpad8 @input /ja "Tenebrae" <me>')
send_command('bind !numpad9 @input /ja "" <t>') --Blank


send_command('wait 180;input //gs validate')
	
function file_unload()
	--unbinds when job unloads--
	send_command("unbind F9")
	send_command("unbind !F9")
	
	send_command("unbind F10")
	send_command("unbind !F10")
	
	send_command("unbind F11")
	send_command("unbind !F11")	

	send_command("unbind F12")
	send_command("unbind !F12")	

	send_command("unbind f7")
	send_command("unbind !f7")
	
	send_command("unbind !f8")
	send_command("unbind @f8")
	send_command("unbind !`")	
	
	send_command('unbind ^numpad0')
	send_command('unbind ^numpad1')
	send_command('unbind ^numpad2')
	send_command('unbind ^numpad3')
	send_command('unbind ^numpad4')
	send_command('unbind ^numpad5')
	send_command('unbind ^numpad6')
	send_command('unbind ^numpad7')
	send_command('unbind ^numpad8')
	send_command('unbind ^numpad9')
	
	send_command('unbind !numpad0')
	send_command('unbind !numpad1')
	send_command('unbind !numpad2')
	send_command('unbind !numpad3')
	send_command('unbind !numpad4')
	send_command('unbind !numpad5')
	send_command('unbind !numpad6')
	send_command('unbind !numpad7')
	send_command('unbind !numpad8')
	send_command('unbind !numpad9')
end


function get_sets() 
	--Calls spell mapping (don't remove)
	maps()


	-- Set Macro Book/Set Here	
	set_macros(1,12)
	---Set Lockstyle Here
	if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
		set_style(6)
	else
		set_style(6)
	end
	
	
	--Gear Sets Start Here
	--Augmented Gear
    Ogma = {}
	Ogma.Idle = { name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}}
	Ogma.Parry = { name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Parrying rate+5%',}}
	Ogma.FC = { name="Ogma's Cape", augments={'HP+60','HP+20','"Fast Cast"+10',}}
	Ogma.TP = { name="Ogma's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	Ogma.DEX_WSD = { name="Ogma's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	Ogma.STR_DA = { name="Ogma's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	
	TaeonHead = {}
	TaeonHead.DW = { name="Taeon Chapeau", augments={'Accuracy+22','"Dual Wield"+5','DEX+10',}}
	
	TaeonBody = {}
	TaeonBody.DW = { name="Taeon Tabard", augments={'Accuracy+20','"Dual Wield"+5','DEX+9',}}
	TaeonBody.SIR = { name="Taeon Tabard", augments={'Mag. Evasion+10','Spell interruption rate down -10%','Phalanx +3',}}
	
	TaeonHands = {}
	TaeonHands.DW = { name="Taeon Gloves", augments={'Accuracy+20','"Dual Wield"+5','DEX+10',}}
	
	TaeonLegs = {}
	TaeonLegs.DW = { name="Taeon Tights", augments={'Accuracy+23','"Dual Wield"+5','DEX+10',}}
	
	TaeonFeet = {}
	TaeonFeet.DW = { name="Taeon Boots", augments={'Accuracy+20 Attack+20','"Dual Wield"+5','Crit. hit damage +3%',}}
	TaeonFeet.SIR = { name="Taeon Boots", augments={'"Mag.Atk.Bns."+9','Spell interruption rate down -10%','Phalanx +3',}}
	
	HercHelm = {}
	HercHelm.FC = { name="Herculean Helm", augments={'"Fast Cast"+5','Mag. Acc.+11',}}
	
	HercVest = {}
	HercVest.Phalanx = { name="Herculean Vest", augments={'"Dbl.Atk."+2','MND+7','Phalanx +5',}}
	
	HercHands = {}
	HercHands.TH = { name="Herculean Gloves", augments={'VIT+3','"Store TP"+5','"Treasure Hunter"+2','Accuracy+6 Attack+6',}}
	HercHands.Phalanx = { name="Herculean Gloves", augments={'Accuracy+8','AGI+6','Phalanx +4','Accuracy+4 Attack+4',}}
	
	
	HercLegs = {}
	HercLegs.Phalanx = { name="Herculean Trousers", augments={'"Fast Cast"+2','Damage taken-4%','Phalanx +5','Accuracy+5 Attack+5','Mag. Acc.+10 "Mag.Atk.Bns."+10',}}
	
	HercFeet = {}
	HercFeet.TP = { name="Herculean Boots", augments={'CHR+1','Accuracy+10','Quadruple Attack +3','Accuracy+8 Attack+8',}}
	HercFeet.Phalanx = { name="Herculean Boots", augments={'"Mag.Atk.Bns."+24','"Fast Cast"+1','Phalanx +4','Mag. Acc.+17 "Mag.Atk.Bns."+17',}}
	
	AdhemarBody = {}
	AdhemarBody.FC = { name="Adhemar Jacket +1", augments={'HP+105','"Fast Cast"+10','Magic dmg. taken -4',}}
	AdhemarBody.TP = { name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}	
	

	--SubJob list--
	--Do not change these
	sets.SJ = {}
	sets.SJ.index = {"Other", "Ninja", "Dancer"}
	SJ_ind = 1	


	--Weapon Sets--
	sets.Weapon_melee = {} -- sets weapon combo for melee-mode
	sets.Weapon_melee.index = {"Custom", "Epeolatry", "Aettir", "Lycurgos", "Naegling"}
	Wm_ind = 1
	sets.Weapon_melee.Custom = {} --intentionally blank so weapons will not swap (allows for manual equipping)
	sets.Weapon_melee.Epeolatry = {
		main = "Epeolatry",
		sub = "Utu Grip"
	}
	sets.Weapon_melee.Aettir = {
		main = "Aettir",
		sub = "Utu Grip"
	}
	sets.Weapon_melee.Lycurgos = {
		main = "Lycurgos",
		sub = "Utu Grip"
	}
	sets.Weapon_melee.Naegling = {
		main = "Naegling",
		sub = "Malignance Sword"
	}


	sets.DW_mode = {}
	sets.DW_mode.index = {"DW", "notDW"}
	DW_mode_ind = 1

	sets.DW_mode.DW = {}
	sets.DW_mode.notDW = {sub = empty}


	--Idle Sets--
	sets.Idle = {}
	sets.Idle.index = {"Kite", "DT"}
	Idle_ind = 1
	sets.Idle.Kite = {
		ammo = "Staunch Tathlum +1",
		head = "Nyame Helm",
		neck = "Futhark Torque +1",
		ear1 = "Eabani Earring",
		ear2 = "Odnowa Earring +1",
		body = "Runeist's Coat +3",
		hands = "Nyame Gauntlets",
		ring1 = "Gelatinous Ring +1",
		ring2 = "Eihwaz Ring",
		back = Ogma.Idle,
		waist = "Engraved Belt",
		legs = "Carmine Cuisses +1",
		feet = "Nyame Sollerets"
	}
	sets.Idle.DT = {
		ammo = "Staunch Tathlum +1",
		head = "Nyame Helm",
		neck = "Futhark Torque +1",
		ear1 = "Eabani Earring",
		ear2 = "Odnowa Earring +1",
		body = "Runeist's Coat +3",
		hands = "Nyame Gauntlets",
		ring1 = "Sheltered Ring",
		ring2 = "Eihwaz Ring",
		back = Ogma.Idle,
		waist = "Engraved Belt",
		legs = "Nyame Flanchard",
		feet = "Nyame Sollerets"
	}
	sets.Idle.Pflug = { --intentionally unreachable by toggle, detected by having Pflug active
		ammo = "Staunch Tathlum +1",
		head = "Nyame Helm",
		neck = "Futhark Torque +1",
		ear1 = "Eabani Earring",
		ear2 = "Odnowa Earring +1",
		body = "Runeist's Coat +3",
		hands = "Nyame Gauntlets",
		ring1 = "Defending Ring",
		ring2 = "Eihwaz Ring",
		back = Ogma.Idle,
		waist = "Engraved Belt",
		legs = "Nyame Flanchard",
		feet = "Runeist's Boots +3"
	}


	--TP Sets--
	sets.TP = {}
	sets.TP.index = {"Standard", "DT"}
	TP_ind = 1

	sets.TP.Standard = {}
	sets.TP.Standard.index = {"Other", "Ninja", "Dancer"}
	sets.TP.Standard.Other = {
		ammo = "Coiste Bodhar",
		head = "Dampening Tam",
		neck = "Anu Torque",
		ear1 = "Sherida Earring",
		ear2 = "Telos Earring",
		body = AdhemarBody.TP,
		hands = "Adhemar Wristbands +1",
		ring1 = "Epona's ring",
		ring2 = "Niqmaddu Ring",
		back = Ogma.TP,
		waist = "Windbuffet Belt +1",
		legs = "Samnuha Tights",
		feet = HercFeet.TP
	}
	
	sets.TP.Standard.Ninja = {} -- DWIII (25%)
	sets.TP.Standard.Ninja.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45", "Haste_50", "Haste_55"}
	-- 49 DW needed
	sets.TP.Standard.Ninja.Haste_0 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW,
		neck = "Anu Torque",
		ear1 = "Eabani Earring",
		ear2 = "Suppanomimi",
		body = AdhemarBody.TP,
		hands = TaeonHands.DW,
		ring1 = "Epona's ring",
		ring2 = "Niqmaddu Ring",
		back = Ogma.TP,
		waist = "Reiki Yotai",
		legs = TaeonLegs.DW,
		feet = TaeonFeet.DW
	} -- 46 DW
	-- 47 DW needed
	sets.TP.Standard.Ninja.Haste_5 = {}
	-- 45 DW needed
	sets.TP.Standard.Ninja.Haste_10 = {} 
	-- 42 DW needed
	sets.TP.Standard.Ninja.Haste_15 = {} 
	-- 39 DW needed
	sets.TP.Standard.Ninja.Haste_20 = {}
	-- 35 DW needed
	sets.TP.Standard.Ninja.Haste_25 = {}
	-- 31 DW needed
	sets.TP.Standard.Ninja.Haste_30 = {
		ammo = "Coiste Bodhar",
		head = "Dampening Tam",
		neck = "Anu Torque",
		ear1 = "Eabani Earring",
		ear2 = "Telos Earring",
		body = AdhemarBody.TP,
		hands = "Adhemar Wristbands +1",
		ring1 = "Epona's ring",
		ring2 = "Niqmaddu Ring",
		back = Ogma.TP,
		waist = "Reiki Yotai",
		legs = TaeonLegs.DW,
		feet = TaeonFeet.DW
	} -- 31 DW
	-- 25 DW needed
	sets.TP.Standard.Ninja.Haste_35 = {} 
	-- 18 DW needed
	sets.TP.Standard.Ninja.Haste_40 = {}
	-- 11 DW needed
	sets.TP.Standard.Ninja.Haste_45 = {
		ammo = "Coiste Bodhar",
		head = "Dampening Tam",
		neck = "Anu Torque",
		ear1 = "Sherida Earring",
		ear2 = "Telos Earring",
		body = AdhemarBody.TP,
		hands = "Adhemar Wristbands +1",
		ring1 = "Epona's ring",
		ring2 = "Niqmaddu Ring",
		back = Ogma.TP,
		waist = "Reiki Yotai",
		legs = "Samnuha Tights",
		feet = HercFeet.TP
	} -- 11 DW
	-- 6 DW needed (Not currently possible to determine haste samba from outside source - this may become a toggle later)
	sets.TP.Standard.Ninja.Haste_50 = {}
	-- 0 DW needed (Not currently possible to determine haste samba from outside source - this may become a toggle later)
	sets.TP.Standard.Ninja.Haste_55 = {}	
		
	sets.TP.Standard.Dancer = {} -- DWII (15%)
	-- Note that sets for Haste_50 and Haste_55 exist for interactions with DNC JA Haste
	-- Currently, unless /DNC, we cannot track this buff provided from outside sources
	-- This lua is future-proofed in the event that this changes (a toggle may be implemented in the future as a work-around) 
	sets.TP.Standard.Dancer.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45", "Haste_50", "Haste_55"}
	-- 59 DW needed
	sets.TP.Standard.Dancer.Haste_0 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW,
		neck = "Anu Torque",
		ear1 = "Eabani Earring",
		ear2 = "Suppanomimi",
		body = AdhemarBody.TP,
		hands = TaeonHands.DW,
		ring1 = "Epona's ring",
		ring2 = "Niqmaddu Ring",
		back = Ogma.TP,
		waist = "Reiki Yotai",
		legs = TaeonLegs.DW,
		feet = TaeonFeet.DW
	} -- 46 DW 
	-- 57 DW needed
	sets.TP.Standard.Dancer.Haste_5 = sets.TP.Standard.Dancer.Haste_0
	-- 55 DW needed
	sets.TP.Standard.Dancer.Haste_10 = sets.TP.Standard.Dancer.Haste_0
	-- 52 DW needed
	sets.TP.Standard.Dancer.Haste_15 = sets.TP.Standard.Dancer.Haste_0
	-- 49 DW needed
	sets.TP.Standard.Dancer.Haste_20 = sets.TP.Standard.Dancer.Haste_0
	-- 45 DW needed
	sets.TP.Standard.Dancer.Haste_25 = sets.TP.Standard.Dancer.Haste_0
	-- 41 DW needed
	sets.TP.Standard.Dancer.Haste_30 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW,
		neck = "Anu Torque",
		ear1 = "Eabani Earring",
		ear2 = "Suppanomimi",
		body = AdhemarBody.TP,
		hands = "Adhemar Wristbands +1",
		ring1 = "Epona's ring",
		ring2 = "Niqmaddu Ring",
		back = Ogma.TP,
		waist = "Reiki Yotai",
		legs = TaeonLegs.DW,
		feet = TaeonFeet.DW
	} -- 31 DW
	-- 35 DW needed
	sets.TP.Standard.Dancer.Haste_35 = sets.TP.Standard.Dancer.Haste_30
	-- 28 DW needed
	sets.TP.Standard.Dancer.Haste_40 = sets.TP.Standard.Dancer.Haste_30
	-- 21 DW needed
	sets.TP.Standard.Dancer.Haste_45 = {
		ammo = "Coiste Bodhar",
		head = "Dampening Tam",
		neck = "Anu Torque",
		ear1 = "Sherida Earring",
		ear2 = "Suppanomimi",
		body = AdhemarBody.TP,
		hands = "Adhemar Wristbands +1",
		ring1 = "Epona's ring",
		ring2 = "Niqmaddu Ring",
		back = Ogma.TP,
		waist = "Reiki Yotai",
		legs = "Samnuha Tights",
		feet = TaeonFeet.DW
	} -- 21 DW 
	-- 15 DW needed
	sets.TP.Standard.Dancer.Haste_50 = sets.TP.Standard.Dancer.Haste_45
	-- 9 DW needed
	sets.TP.Standard.Dancer.Haste_55 = sets.TP.Standard.Dancer.Haste_45


	sets.TP.DT = {}
	sets.TP.DT.index = {"Other", "Ninja", "Dancer"}
	sets.TP.DT.Other = {
		ammo = "Coiste Bodhar",
		head = "Dampening Tam", -- 0/4/0
		neck = "Futhark Torque +1", -- 0/0/6
		ear1 = "Sherida Earring",
		ear2 = "Telos Earring",
		body = "Nyame Mail", -- 0/0/9
		hands = "Adhemar Wristbands +1",
		ring1 = "Defending Ring", -- 0/0/10
		ring2 = "Niqmaddu Ring",
		back = Ogma.TP, -- 10/0/0
		waist = "Windbuffet Belt +1",
		legs = "Samnuha Tights",
		feet = "Nyame Sollerets" -- 0/0/7
	} -- +37 sTP | 21DA/9TA/8QA | 10/4/32
		
	sets.TP.DT.Ninja = {}
	sets.TP.DT.Ninja.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45", "Haste_50", "Haste_55"}
	-- 49 DW needed
	sets.TP.DT.Ninja.Haste_0 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW,
		neck = "Futhark Torque +1",
		ear1 = "Eabani Earring",
		ear2 = "Suppanomimi",
		body = "Nyame Mail",
		hands = TaeonHands.DW,
		ring1 = "Defending Ring",
		ring2 = "Niqmaddu Ring",
		back = Ogma.TP,
		waist = "Reiki Yotai",
		legs = "Nyame Flanchard",
		feet = TaeonFeet.DW
	} -- 35 DW 
	-- 47 DW needed
	sets.TP.DT.Ninja.Haste_5 = sets.TP.DT.Ninja.Haste_0
	-- 45 DW needed
	sets.TP.DT.Ninja.Haste_10 = sets.TP.DT.Ninja.Haste_0
	-- 42 DW needed
	sets.TP.DT.Ninja.Haste_15 = sets.TP.DT.Ninja.Haste_0
	-- 39 DW needed
	sets.TP.DT.Ninja.Haste_20 = sets.TP.DT.Ninja.Haste_0
	-- 35 DW needed
	sets.TP.DT.Ninja.Haste_25 = sets.TP.DT.Ninja.Haste_0
	-- 31 DW needed
	sets.TP.DT.Ninja.Haste_30 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW,
		neck = "Futhark Torque +1",
		ear1 = "Sherida Earring",
		ear2 = "Suppanomimi",
		body = "Nyame Mail",
		hands = TaeonHands.DW,
		ring1 = "Defending Ring",
		ring2 = "Niqmaddu Ring",
		back = Ogma.TP,
		waist = "Reiki Yotai",
		legs = "Nyame Flanchard",
		feet = TaeonFeet.DW
	} -- 31 DW 
	-- 25 DW needed
	sets.TP.DT.Ninja.Haste_35 = sets.TP.DT.Ninja.Haste_30 
	-- 18 DW needed
	sets.TP.DT.Ninja.Haste_40 = sets.TP.DT.Ninja.Haste_30
	-- 11 DW needed
	sets.TP.DT.Ninja.Haste_45 = {
		ammo = "Coiste Bodhar",
		head = "Dampening Tam",
		neck = "Futhark Torque +1",
		ear1 = "Sherida Earring",
		ear2 = "Suppanomimi",
		body = "Nyame Mail",
		hands = "Adhemar Wristbands +1",
		ring1 = "Defending Ring",
		ring2 = "Niqmaddu Ring",
		back = Ogma.TP,
		waist = "Reiki Yotai",
		legs = "Nyame Flanchard",
		feet = HercFeet.TP
	} -- 11 DW 
	-- 6 DW needed (Not currently possible to determine haste samba from outside source - this may become a toggle later)
	sets.TP.DT.Ninja.Haste_50 = sets.TP.DT.Ninja.Haste_45
	-- 0 DW needed (Not currently possible to determine haste samba from outside source - this may become a toggle later)
	sets.TP.DT.Ninja.Haste_55 = sets.TP.DT.Ninja.Haste_45
		
	sets.TP.DT.Dancer = {}
	sets.TP.DT.Dancer.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45", "Haste_50", "Haste_55"}
	-- 59 DW needed
	sets.TP.DT.Dancer.Haste_0 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW,
		neck = "Futhark Torque +1",
		ear1 = "Eabani Earring",
		ear2 = "Suppanomimi",
		body = "Nyame Mail",
		hands = TaeonHands.DW,
		ring1 = "Defending Ring",
		ring2 = "Niqmaddu Ring",
		back = Ogma.TP,
		waist = "Reiki Yotai",
		legs = "Nyame Flanchard",
		feet = TaeonFeet.DW
	} -- 35 DW 
	-- 57 DW needed
	sets.TP.DT.Dancer.Haste_5 = sets.TP.DT.Dancer.Haste_0
	-- 55 DW needed
	sets.TP.DT.Dancer.Haste_10 = sets.TP.DT.Dancer.Haste_0
	-- 52 DW needed
	sets.TP.DT.Dancer.Haste_15 = sets.TP.DT.Dancer.Haste_0
	-- 49 DW needed
	sets.TP.DT.Dancer.Haste_20 = sets.TP.DT.Dancer.Haste_0
	-- 45 DW needed
	sets.TP.DT.Dancer.Haste_25 = sets.TP.DT.Dancer.Haste_0
	-- 41 DW needed
	sets.TP.DT.Dancer.Haste_30 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW,
		neck = "Futhark Torque +1",
		ear1 = "Eabani Earring",
		ear2 = "Suppanomimi",
		body = "Nyame Mail",
		hands = TaeonHands.DW,
		ring1 = "Defending Ring",
		ring2 = "Niqmaddu Ring",
		back = Ogma.TP,
		waist = "Reiki Yotai",
		legs = "Nyame Flanchard",
		feet = TaeonFeet.DW
	} -- 35 DW 
	-- 35 DW needed
	sets.TP.DT.Dancer.Haste_35 = sets.TP.DT.Dancer.Haste_30
	-- 28 DW needed
	sets.TP.DT.Dancer.Haste_40 = sets.TP.DT.Dancer.Haste_30
	-- 21 DW needed
	sets.TP.DT.Dancer.Haste_45 = {
		ammo = "Coiste Bodhar",
		head = "Dampening Tam",
		neck = "Futhark Torque +1",
		ear1 = "Sherida Earring",
		ear2 = "Suppanomimi",
		body = "Nyame Mail",
		hands = "Adhemar Wristbands +1",
		ring1 = "Defending Ring",
		ring2 = "Niqmaddu Ring",
		back = Ogma.TP,
		waist = "Reiki Yotai",
		legs = "Nyame Flanchard",
		feet = TaeonFeet.DW
	} -- 21 DW 
	-- 15 DW needed
	sets.TP.DT.Dancer.Haste_50 = sets.TP.DT.Dancer.Haste_45
	-- 9 DW needed
	sets.TP.DT.Dancer.Haste_55 = sets.TP.DT.Dancer.Haste_45
	
	
	--AM3 Sets--
	--Will only be applied when not in Tank_mode
	--I'm saving you from yourself.
	sets.AM3 = {}
	sets.AM3.index = {"Standard", "DT"}

	sets.AM3.Standard = {
		ammo = "Coiste Bodhar",
		head = "Dampening Tam",
		neck = "Anu Torque",
		ear1 = "Crepuscular Earring",
		ear2 = "Dedition Earring",
		body = AdhemarBody.TP,
		hands = "Adhemar Wristbands +1",
		ring1 = "Ilabrat Ring",
		ring2 = "Niqmaddu Ring",
		back = Ogma.TP,
		waist = "Windbuffet Belt +1",
		legs = "Meghanada Chausses +2",
		feet = HercFeet.TP
	}

	sets.AM3.DT = {
		ammo = "Coiste Bodhar",
		head = "Dampening Tam", -- 0/4/0
		neck = "Futhark Torque +1", -- 0/0/6
		ear1 = "Crepuscular Earring",
		ear2 = "Dedition Earring",
		body = "Nyame Mail", -- 0/0/9
		hands = "Adhemar Wristbands +1",
		ring1 = "Defending Ring", -- 0/0/10
		ring2 = "Niqmaddu Ring",
		back = Ogma.TP, -- 10/0/0
		waist = "Windbuffet Belt +1",
		legs = "Meghanada Chausses +2",
		feet = "Nyame Sollerets" -- 0/0/7
	} -- +37 sTP | 21DA/9TA/8QA | 10/4/32


	--Tank Sets--
	sets.Tank = {}
	sets.Tank.index = {"Resist", "Inq"}
	Tank_ind = 1

	sets.Tank.Resist = {}
	sets.Tank.Resist.index = {"Other", "Ninja", "Dancer"}
	sets.Tank.Resist.Other = {
		ammo = "Staunch Tathlum +1",
		head = "Nyame Helm",
		neck = "Futhark Torque +1",
		ear1 = "Eabani Earring",
		ear2 = "Odnowa Earring +1",
		body = "Runeist's Coat +3",
		hands = "Nyame Gauntlets",
		ring1 = "Eihwaz Ring",
		ring2 = "Gelatinous Ring +1",
		back = Ogma.Idle,
		waist = "Engraved Belt",
		legs = "Nyame Flanchard",
		feet = "Nyame Sollerets"
	}
	
	sets.Tank.Resist.Ninja = {} -- DWIII (25%)
	sets.Tank.Resist.Ninja.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45", "Haste_50", "Haste_55"}
	-- 49 DW needed
	sets.Tank.Resist.Ninja.Haste_0 = {
		ammo = "Staunch Tathlum +1",
		head = "Nyame Helm",
		neck = "Futhark Torque +1",
		ear1 = "Eabani Earring",
		ear2 = "Odnowa Earring +1",
		body = "Runeist's Coat +3",
		hands = "Nyame Gauntlets",
		ring1 = "Eihwaz Ring",
		ring2 = "Gelatinous Ring +1",
		back = Ogma.Idle,
		waist = "Engraved Belt",
		legs = "Nyame Flanchard",
		feet = "Nyame Sollerets"
	}
	-- 47 DW needed
	sets.Tank.Resist.Ninja.Haste_5 = sets.Tank.Resist.Ninja.Haste_0
	-- 45 DW needed
	sets.Tank.Resist.Ninja.Haste_10 = sets.Tank.Resist.Ninja.Haste_0
	-- 42 DW needed
	sets.Tank.Resist.Ninja.Haste_15 = sets.Tank.Resist.Ninja.Haste_0
	-- 39 DW needed
	sets.Tank.Resist.Ninja.Haste_20 = sets.Tank.Resist.Ninja.Haste_0
	-- 35 DW needed
	sets.Tank.Resist.Ninja.Haste_25 = sets.Tank.Resist.Ninja.Haste_0
	-- 31 DW needed
	sets.Tank.Resist.Ninja.Haste_30 = {
		ammo = "Staunch Tathlum +1",
		head = "Nyame Helm",
		neck = "Futhark Torque +1",
		ear1 = "Eabani Earring",
		ear2 = "Odnowa Earring +1",
		body = "Runeist's Coat +3",
		hands = "Nyame Gauntlets",
		ring1 = "Eihwaz Ring",
		ring2 = "Gelatinous Ring +1",
		back = Ogma.Idle,
		waist = "Engraved Belt",
		legs = "Nyame Flanchard",
		feet = "Nyame Sollerets"
	}
	-- 25 DW needed
	sets.Tank.Resist.Ninja.Haste_35 = sets.Tank.Resist.Ninja.Haste_30
	-- 18 DW needed
	sets.Tank.Resist.Ninja.Haste_40 = sets.Tank.Resist.Ninja.Haste_30
	-- 11 DW needed
	sets.Tank.Resist.Ninja.Haste_45 = {
		ammo = "Staunch Tathlum +1",
		head = "Nyame Helm",
		neck = "Futhark Torque +1",
		ear1 = "Eabani Earring",
		ear2 = "Odnowa Earring +1",
		body = "Runeist's Coat +3",
		hands = "Nyame Gauntlets",
		ring1 = "Eihwaz Ring",
		ring2 = "Gelatinous Ring +1",
		back = Ogma.Idle,
		waist = "Engraved Belt",
		legs = "Nyame Flanchard",
		feet = "Nyame Sollerets"
	}
	-- 6 DW needed (Not currently possible to determine haste samba from outside source - this may become a toggle later)
	sets.Tank.Resist.Ninja.Haste_50 = sets.Tank.Resist.Ninja.Haste_45
	-- 0 DW needed (Not currently possible to determine haste samba from outside source - this may become a toggle later)
	sets.Tank.Resist.Ninja.Haste_55 = sets.Tank.Resist.Ninja.Haste_45
		
	sets.Tank.Resist.Dancer = {} -- DWII (15%)
	-- Note that sets for Haste_50 and Haste_55 exist for interactions with DNC JA Haste
	-- Currently, unless /DNC, we cannot track this buff provided from outside sources
	-- This lua is future-proofed in the event that this changes (a toggle may be implemented in the future as a work-around) 
	sets.Tank.Resist.Dancer.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45", "Haste_50", "Haste_55"}
	-- 59 DW needed
	sets.Tank.Resist.Dancer.Haste_0 = {
		ammo = "Staunch Tathlum +1",
		head = "Nyame Helm",
		neck = "Futhark Torque +1",
		ear1 = "Eabani Earring",
		ear2 = "Odnowa Earring +1",
		body = "Runeist's Coat +3",
		hands = "Nyame Gauntlets",
		ring1 = "Eihwaz Ring",
		ring2 = "Gelatinous Ring +1",
		back = Ogma.Idle,
		waist = "Engraved Belt",
		legs = "Nyame Flanchard",
		feet = "Nyame Sollerets"
	}
	-- 57 DW needed
	sets.Tank.Resist.Dancer.Haste_5 = sets.Tank.Resist.Dancer.Haste_0
	-- 55 DW needed
	sets.Tank.Resist.Dancer.Haste_10 = sets.Tank.Resist.Dancer.Haste_0
	-- 52 DW needed
	sets.Tank.Resist.Dancer.Haste_15 = sets.Tank.Resist.Dancer.Haste_0
	-- 49 DW needed
	sets.Tank.Resist.Dancer.Haste_20 = sets.Tank.Resist.Dancer.Haste_0
	-- 45 DW needed
	sets.Tank.Resist.Dancer.Haste_25 = sets.Tank.Resist.Dancer.Haste_0
	-- 41 DW needed
	sets.Tank.Resist.Dancer.Haste_30 = {
		ammo = "Staunch Tathlum +1",
		head = "Nyame Helm",
		neck = "Futhark Torque +1",
		ear1 = "Eabani Earring",
		ear2 = "Odnowa Earring +1",
		body = "Runeist's Coat +3",
		hands = "Nyame Gauntlets",
		ring1 = "Eihwaz Ring",
		ring2 = "Gelatinous Ring +1",
		back = Ogma.Idle,
		waist = "Engraved Belt",
		legs = "Nyame Flanchard",
		feet = "Nyame Sollerets"
	}
	-- 35 DW needed
	sets.Tank.Resist.Dancer.Haste_35 = sets.Tank.Resist.Dancer.Haste_30 
	-- 28 DW needed
	sets.Tank.Resist.Dancer.Haste_40 = sets.Tank.Resist.Dancer.Haste_30
	-- 21 DW needed
	sets.Tank.Resist.Dancer.Haste_45 = {
		ammo = "Staunch Tathlum +1",
		head = "Nyame Helm",
		neck = "Futhark Torque +1",
		ear1 = "Eabani Earring",
		ear2 = "Odnowa Earring +1",
		body = "Runeist's Coat +3",
		hands = "Nyame Gauntlets",
		ring1 = "Eihwaz Ring",
		ring2 = "Gelatinous Ring +1",
		back = Ogma.Idle,
		waist = "Engraved Belt",
		legs = "Nyame Flanchard",
		feet = "Nyame Sollerets"
	} 
	-- 15 DW needed
	sets.Tank.Resist.Dancer.Haste_50 = sets.Tank.Resist.Dancer.Haste_45 
	-- 9 DW needed
	sets.Tank.Resist.Dancer.Haste_55 = sets.Tank.Resist.Dancer.Haste_45


	sets.Tank.Inq = {}
	sets.Tank.Inq.index = {"Other", "Ninja", "Dancer"}
	sets.Tank.Inq.Other = {
		ammo = "Yamarang",
		head = "Nyame Helm",
		neck = "Futhark Torque +1",
		ear1 = "Eabani Earring",
		ear2 = "Odnowa Earring +1",
		body = "Nyame Mail",
		hands = "Turms Mittens +1",
		ring1 = "Defending Ring",
		ring2 = "Gelatinous Ring +1",
		back = Ogma.Parry,
		waist = "Engraved Belt",
		legs = "Nyame Flanchard",
		feet = "Turms Leggings +1"
	}
		
	sets.Tank.Inq.Ninja = {}
	sets.Tank.Inq.Ninja.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45", "Haste_50", "Haste_55"}
	-- 49 DW needed
	sets.Tank.Inq.Ninja.Haste_0 = {
		ammo = "Yamarang",
		head = "Nyame Helm",
		neck = "Futhark Torque +1",
		ear1 = "Eabani Earring",
		ear2 = "Odnowa Earring +1",
		body = "Nyame Mail",
		hands = "Turms Mittens +1",
		ring1 = "Defending Ring",
		ring2 = "Gelatinous Ring +1",
		back = Ogma.Parry,
		waist = "Engraved Belt",
		legs = "Nyame Flanchard",
		feet = "Turms Leggings +1"
	}
	-- 47 DW needed
	sets.Tank.Inq.Ninja.Haste_5 = sets.Tank.Inq.Ninja.Haste_0
	-- 45 DW needed
	sets.Tank.Inq.Ninja.Haste_10 = sets.Tank.Inq.Ninja.Haste_0
	-- 42 DW needed
	sets.Tank.Inq.Ninja.Haste_15 = sets.Tank.Inq.Ninja.Haste_0
	-- 39 DW needed
	sets.Tank.Inq.Ninja.Haste_20 = sets.Tank.Inq.Ninja.Haste_0
	-- 35 DW needed
	sets.Tank.Inq.Ninja.Haste_25 = sets.Tank.Inq.Ninja.Haste_0
	-- 31 DW needed
	sets.Tank.Inq.Ninja.Haste_30 = {
		ammo = "Yamarang",
		head = "Nyame Helm",
		neck = "Futhark Torque +1",
		ear1 = "Eabani Earring",
		ear2 = "Odnowa Earring +1",
		body = "Nyame Mail",
		hands = "Turms Mittens +1",
		ring1 = "Defending Ring",
		ring2 = "Gelatinous Ring +1",
		back = Ogma.Parry,
		waist = "Engraved Belt",
		legs = "Nyame Flanchard",
		feet = "Turms Leggings +1"
	} 
	-- 25 DW needed
	sets.Tank.Inq.Ninja.Haste_35 = sets.Tank.Inq.Ninja.Haste_30
	-- 18 DW needed
	sets.Tank.Inq.Ninja.Haste_40 = sets.Tank.Inq.Ninja.Haste_30
	-- 11 DW needed
	sets.Tank.Inq.Ninja.Haste_45 = {
		ammo = "Yamarang",
		head = "Nyame Helm",
		neck = "Futhark Torque +1",
		ear1 = "Eabani Earring",
		ear2 = "Odnowa Earring +1",
		body = "Nyame Mail",
		hands = "Turms Mittens +1",
		ring1 = "Defending Ring",
		ring2 = "Gelatinous Ring +1",
		back = Ogma.Parry,
		waist = "Engraved Belt",
		legs = "Nyame Flanchard",
		feet = "Turms Leggings +1"
	} 
	-- 6 DW needed (Not currently possible to determine haste samba from outside source - this may become a toggle later)
	sets.Tank.Inq.Ninja.Haste_50 = sets.Tank.Inq.Ninja.Haste_45
	-- 0 DW needed (Not currently possible to determine haste samba from outside source - this may become a toggle later)
	sets.Tank.Inq.Ninja.Haste_55 = sets.Tank.Inq.Ninja.Haste_45
		
	sets.Tank.Inq.Dancer = {}
	sets.Tank.Inq.Dancer.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45", "Haste_50", "Haste_55"}
	-- 59 DW needed
	sets.Tank.Inq.Dancer.Haste_0 = {
		ammo = "Yamarang",
		head = "Nyame Helm",
		neck = "Futhark Torque +1",
		ear1 = "Eabani Earring",
		ear2 = "Odnowa Earring +1",
		body = "Nyame Mail",
		hands = "Turms Mittens +1",
		ring1 = "Defending Ring",
		ring2 = "Gelatinous Ring +1",
		back = Ogma.Parry,
		waist = "Engraved Belt",
		legs = "Nyame Flanchard",
		feet = "Turms Leggings +1"
	} 
	-- 57 DW needed
	sets.Tank.Inq.Dancer.Haste_5 = sets.Tank.Inq.Dancer.Haste_0 
	-- 55 DW needed
	sets.Tank.Inq.Dancer.Haste_10 = sets.Tank.Inq.Dancer.Haste_0
	-- 52 DW needed
	sets.Tank.Inq.Dancer.Haste_15 = sets.Tank.Inq.Dancer.Haste_0
	-- 49 DW needed
	sets.Tank.Inq.Dancer.Haste_20 = sets.Tank.Inq.Dancer.Haste_0
	-- 45 DW needed
	sets.Tank.Inq.Dancer.Haste_25 = sets.Tank.Inq.Dancer.Haste_0
	-- 41 DW needed
	sets.Tank.Inq.Dancer.Haste_30 = {
		ammo = "Yamarang",
		head = "Nyame Helm",
		neck = "Futhark Torque +1",
		ear1 = "Eabani Earring",
		ear2 = "Odnowa Earring +1",
		body = "Nyame Mail",
		hands = "Turms Mittens +1",
		ring1 = "Defending Ring",
		ring2 = "Gelatinous Ring +1",
		back = Ogma.Parry,
		waist = "Engraved Belt",
		legs = "Nyame Flanchard",
		feet = "Turms Leggings +1"
	}
	-- 35 DW needed
	sets.Tank.Inq.Dancer.Haste_35 = sets.Tank.Inq.Dancer.Haste_30 
	-- 28 DW needed
	sets.Tank.Inq.Dancer.Haste_40 = sets.Tank.Inq.Dancer.Haste_30
	-- 21 DW needed
	sets.Tank.Inq.Dancer.Haste_45 = {
		ammo = "Yamarang",
		head = "Nyame Helm",
		neck = "Futhark Torque +1",
		ear1 = "Eabani Earring",
		ear2 = "Odnowa Earring +1",
		body = "Nyame Mail",
		hands = "Turms Mittens +1",
		ring1 = "Defending Ring",
		ring2 = "Gelatinous Ring +1",
		back = Ogma.Parry,
		waist = "Engraved Belt",
		legs = "Nyame Flanchard",
		feet = "Turms Leggings +1"
	} 
	-- 15 DW needed
	sets.Tank.Inq.Dancer.Haste_50 = sets.Tank.Inq.Dancer.Haste_45
	-- 9 DW needed
	sets.Tank.Inq.Dancer.Haste_55 = sets.Tank.Inq.Dancer.Haste_45


	--Weaponskill Sets--
	sets.WS = {}
	sets.WS.index = {'Attack', 'AttackCapped', 'DT'}
	WS_ind = 1
	
	
	--Greatsword
	sets.Dimidiation = {}
	sets.Dimidiation.Attack = {
		ammo = "Knobkierrie",
		head = "Nyame Helm",
		neck = "Republican Platinum Medal", 
		ear1 = "Odr Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Niqmaddu Ring",
		back = Ogma.DEX_WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Lustratio Subligar +1", 
		feet = "Lustratio Leggings +1"	
	}
	sets.Dimidiation.AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Nyame Helm",
		neck = "Republican Platinum Medal", 
		ear1 = "Odr Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Niqmaddu Ring",
		back = Ogma.DEX_WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Lustratio Subligar +1", 
		feet = "Lustratio Leggings +1"	
	}
	sets.Dimidiation.DT = {
		ammo = "Knobkierrie",
		head = "Nyame Helm",
		neck = "Republican Platinum Medal", 
		ear1 = "Odr Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Niqmaddu Ring",
		back = Ogma.DEX_WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"	
	}
	
	sets.Resolution = {}
	sets.Resolution.Attack = {
		ammo = "Crepuscular Pebble",
		head = "Adhemar Bonnet +1",
		neck = "Fotia Gorget", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = AdhemarBody.TP,
		hands = "Adhemar Wristbands +1",
		ring1 = "Epona's Ring", 
		ring2 = "Niqmaddu Ring",
		back = Ogma.STR_DA, 
		waist = "Fotia Belt",	
		legs = "Samnuha Tights", 
		feet = "Lustratio Leggings +1"	
	}
	sets.Resolution.AttackCapped = {
		ammo = "Coiste Bodhar",
		head = "Adhemar Bonnet +1",
		neck = "Fotia Gorget", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = AdhemarBody.TP,
		hands = "Adhemar Wristbands +1",
		ring1 = "Epona's Ring", 
		ring2 = "Niqmaddu Ring",
		back = Ogma.STR_DA, 
		waist = "Fotia Belt",	
		legs = "Samnuha Tights", 
		feet = "Lustratio Leggings +1"	
	}
	sets.Resolution.DT = {
		ammo = "Coiste Bodhar",
		head = "Nyame Helm",
		neck = "Fotia Gorget", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Epona's Ring", 
		ring2 = "Niqmaddu Ring",
		back = Ogma.STR_DA, 
		waist = "Fotia Belt",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"	
	}
	
	sets.GroundStrike = {}
	sets.GroundStrike.Attack = {
		ammo = "Knobkierrie",
		head = "Nyame Helm",
		neck = "Republican Platinum Medal", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Niqmaddu Ring",
		back = Ogma.STR_DA, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"	
	}
	sets.GroundStrike.AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Nyame Helm",
		neck = "Republican Platinum Medal", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Niqmaddu Ring",
		back = Ogma.STR_DA, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"	
	}
	sets.GroundStrike.DT = {
		ammo = "Knobkierrie",
		head = "Nyame Helm",
		neck = "Republican Platinum Medal", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Niqmaddu Ring",
		back = Ogma.STR_DA, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"	
	}
	
	--Macc focus only
	sets.Shockwave = {
		ammo = "Pemphredo Tathlum",
		head = "Agwu's Cap",
		neck = "Sanctity Necklace", 
		ear1 = "Dignitary's Earring", 
		ear2 = "Crepuscular Earring", 		
		body = "Agwu's Robe",
		hands = "Agwu's Gages",
		ring1 = "Etana Ring", 
		ring2 = "Metamorph Ring +1",
		back = Ogma.TP, 
		waist = "Eschan Stone",	
		legs = "Agwu's Slops", 
		feet = "Agwu's Pigaches"	
	}
	
	
	--Greataxe
	sets.Upheaval = {}
	sets.Upheaval.Attack = {
		ammo = "Knobkierrie",
		head = "Nyame Helm",
		neck = "Republican Platinum Medal", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Niqmaddu Ring",
		back = Ogma.STR_DA, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"	
	}
	sets.Upheaval.AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Nyame Helm",
		neck = "Republican Platinum Medal", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Niqmaddu Ring",
		back = Ogma.STR_DA, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"	
	}
	sets.Upheaval.DT = {
		ammo = "Knobkierrie",
		head = "Nyame Helm",
		neck = "Republican Platinum Medal", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Niqmaddu Ring",
		back = Ogma.STR_DA, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"	
	}	
	
	sets.SteelCyclone = {}
	sets.SteelCyclone.Attack = {
		ammo = "Knobkierrie",
		head = "Nyame Helm",
		neck = "Republican Platinum Medal", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Niqmaddu Ring",
		back = Ogma.STR_DA, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"	
	}
	sets.SteelCyclone.AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Nyame Helm",
		neck = "Republican Platinum Medal", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Niqmaddu Ring",
		back = Ogma.STR_DA, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"	
	}
	sets.SteelCyclone.DT = {
		ammo = "Knobkierrie",
		head = "Nyame Helm",
		neck = "Republican Platinum Medal", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Niqmaddu Ring",
		back = Ogma.STR_DA, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"	
	}
	
	sets.FellCleave = {}
	sets.FellCleave.Attack = {
		ammo = "Knobkierrie",
		head = "Nyame Helm",
		neck = "Republican Platinum Medal", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Niqmaddu Ring",
		back = Ogma.STR_DA, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"	
	}
	sets.FellCleave.AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Nyame Helm",
		neck = "Republican Platinum Medal", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Niqmaddu Ring",
		back = Ogma.STR_DA, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"	
	}
	sets.FellCleave.DT = {
		ammo = "Knobkierrie",
		head = "Nyame Helm",
		neck = "Republican Platinum Medal", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Niqmaddu Ring",
		back = Ogma.STR_DA, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"	
	}
	
	--Macc focus only
	sets.ArmorBreak = {
		ammo = "Pemphredo Tathlum",
		head = "Agwu's Cap",
		neck = "Sanctity Necklace", 
		ear1 = "Dignitary's Earring", 
		ear2 = "Crepuscular Earring", 		
		body = "Agwu's Robe",
		hands = "Agwu's Gages",
		ring1 = "Etana Ring", 
		ring2 = "Metamorph Ring +1",
		back = Ogma.TP, 
		waist = "Eschan Stone",	
		legs = "Agwu's Slops", 
		feet = "Agwu's Pigaches"	
	}	
	
	--Sword
	sets.SavageBlade = {}
	sets.SavageBlade.Attack = {
		ammo = "Knobkierrie",
		head = "Nyame Helm",
		neck = "Futhark Torque +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Niqmaddu Ring",
		back = Ogma.STR_DA, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"	
	}
	sets.SavageBlade.AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Nyame Helm",
		neck = "Futhark Torque +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Niqmaddu Ring",
		back = Ogma.STR_DA, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"	
	}
	sets.SavageBlade.DT = {
		ammo = "Knobkierrie",
		head = "Nyame Helm",
		neck = "Futhark Torque +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Niqmaddu Ring",
		back = Ogma.STR_DA, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"	
	}

	sets.Requiescat = {}
	sets.Requiescat.Attack = {
		ammo = "Crepuscular Pebble",
		head = "Adhemar Bonnet +1",
		neck = "Fotia Gorget", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = AdhemarBody.TP,
		hands = "Adhemar Wristbands +1",
		ring1 = "Epona's Ring", 
		ring2 = "Niqmaddu Ring",
		back = Ogma.STR_DA, 
		waist = "Fotia Belt",	
		legs = "Samnuha Tights", 
		feet = "Lustratio Leggings +1"	
	}
	sets.Requiescat.AttackCapped = {
		ammo = "Coiste Bodhar",
		head = "Adhemar Bonnet +1",
		neck = "Fotia Gorget", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = AdhemarBody.TP,
		hands = "Adhemar Wristbands +1",
		ring1 = "Epona's Ring", 
		ring2 = "Niqmaddu Ring",
		back = Ogma.STR_DA, 
		waist = "Fotia Belt",	
		legs = "Samnuha Tights", 
		feet = "Lustratio Leggings +1"	
	}
	sets.Requiescat.DT = {
		ammo = "Coiste Bodhar",
		head = "Nyame Helm",
		neck = "Fotia Gorget", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Epona's Ring", 
		ring2 = "Niqmaddu Ring",
		back = Ogma.STR_DA, 
		waist = "Fotia Belt",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"	
	}
	
	--Macc focus only
	sets.FlatBlade = {
		ammo = "Pemphredo Tathlum",
		head = "Agwu's Cap",
		neck = "Sanctity Necklace", 
		ear1 = "Dignitary's Earring", 
		ear2 = "Crepuscular Earring", 		
		body = "Agwu's Robe",
		hands = "Agwu's Gages",
		ring1 = "Etana Ring", 
		ring2 = "Metamorph Ring +1",
		back = Ogma.TP, 
		waist = "Eschan Stone",	
		legs = "Agwu's Slops", 
		feet = "Agwu's Pigaches"	
	}	

	sets.SanguineBlade = {
		ammo = "Pemphredo Tathlum",
		head = "Agwu's Cap",
		neck = "Sanctity Necklace", 
		ear1 = "Friomisi Earring", 
		ear2 = "Crepuscular Earring", 		
		body = "Agwu's Robe",
		hands = "Agwu's Gages",
		ring1 = "Etana Ring", 
		ring2 = "Metamorph Ring +1",
		back = Ogma.TP, 
		waist = "Eschan Stone",	
		legs = "Agwu's Slops", 
		feet = "Agwu's Pigaches"	
	}
	
	
	--Axe
	sets.Decimation = {}
	sets.Decimation.Attack = {
		ammo = "Coiste Bodhar",
		head = "Adhemar Bonnet +1",
		neck = "Fotia Gorget", 
		ear1 = "Sherida Earring", 
		ear2 = "Telos Earring", 		
		body = "Nyame Mail",
		hands = "Futhark Mitons +3",
		ring1 = "Regal Ring", 
		ring2 = "Niqmaddu Ring",
		back = Ogma.STR_DA, 
		waist = "Fotia Belt",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"	
	}	
	sets.Decimation.AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Adhemar Bonnet +1",
		neck = "Fotia Gorget", 
		ear1 = "Sherida Earring", 
		ear2 = "Telos Earring", 		
		body = AdhemarBody.TP,
		hands = "Adhemar Wristbands +1",
		ring1 = "Epona's Ring", 
		ring2 = "Niqmaddu Ring",
		back = Ogma.STR_DA, 
		waist = "Fotia Belt",	
		legs = "Samnuha Tights", 
		feet = "Nyame Sollerets"	
	}
	sets.Decimation.DT = {
		ammo = "Coiste Bodhar",
		head = "Nyame Helm",
		neck = "Futhark Torque +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Niqmaddu Ring",
		back = Ogma.STR_DA, 
		waist = "Fotia Belt",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"	
	}	
	
	sets.Ruinator = {}
	sets.Ruinator.Attack = {
		ammo = "Coiste Bodhar",
		head = "Adhemar Bonnet +1",
		neck = "Fotia Gorget", 
		ear1 = "Sherida Earring", 
		ear2 = "Telos Earring", 		
		body = "Nyame Mail",
		hands = "Futhark Mitons +3",
		ring1 = "Regal Ring", 
		ring2 = "Niqmaddu Ring",
		back = Ogma.STR_DA, 
		waist = "Fotia Belt",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"	
	}	
	sets.Ruinator.AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Adhemar Bonnet +1",
		neck = "Fotia Gorget", 
		ear1 = "Sherida Earring", 
		ear2 = "Telos Earring", 		
		body = AdhemarBody.TP,
		hands = "Adhemar Wristbands +1",
		ring1 = "Epona's Ring", 
		ring2 = "Niqmaddu Ring",
		back = Ogma.STR_DA, 
		waist = "Fotia Belt",	
		legs = "Samnuha Tights", 
		feet = "Nyame Sollerets"	
	}
	sets.Ruinator.DT = {
		ammo = "Coiste Bodhar",
		head = "Nyame Helm",
		neck = "Futhark Torque +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Niqmaddu Ring",
		back = Ogma.STR_DA, 
		waist = "Fotia Belt",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"	
	}	
	
	
	--All Other
	sets.OtherWS = {}
	sets.OtherWS.Attack = {
		ammo = "Knobkierrie",
		head = "Nyame Helm",
		neck = "Futhark Torque +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Niqmaddu Ring",
		back = Ogma.STR_DA, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"	
	}
	sets.OtherWS.AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Nyame Helm",
		neck = "Futhark Torque +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Niqmaddu Ring",
		back = Ogma.STR_DA, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"	
	}
	sets.OtherWS.DT = {
		ammo = "Knobkierrie",
		head = "Nyame Helm",
		neck = "Futhark Torque +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Niqmaddu Ring",
		back = Ogma.STR_DA, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"	
	}


	--Job Ability Sets--
	--Sets will automatically combine with JA enmity sets, handled by the lua
	--Just put ability specific equip you have here
	sets.Sforzo = {legs = "Futhark Coat +3"}
	sets.Vallation = {body = "Runeist's Coat +3", "Futhark Trousers +3", back = Ogma.Idle}
	sets.Valliance = {body = "Runeist's Coat +3", "Futhark Trousers +3", back = Ogma.Idle}
	sets.Swordplay = {hands = "Futhark Mitons +3"}
	--Pflug feet must be worn to take effect. This lua will equip these while effect is active, but I choose not to use them myself.
	--The resistance effect is +4%, but specific sets are required for engaged/idle to properly use these.
	sets.Plfug = {} --feet = "Runeist's Boots +3"} 
	sets.Gambit = {hands = "Runeist's Mitons +2"}
	sets.Rayke = {feet = "Futhark Boots +3"}
	sets.Battuta = {head = "Futhark Bandeau +3"}
	sets.Liement = {body = "Futhark Coat +3"}	
	
	
	--Swipe/Lunge Sets
	--lua will detect the rune majority for day/weather consideration automatically
	sets.SwordMagic = {}
	sets.SwordMagic.index = {'Normal', 'MB', 'Dark'}
	
	sets.SwordMagic.Normal = {
		ammo = "Pemphredo Tathlum",
		head = "Agwu's Cap",
		neck = "Combatant's Torque", 
		ear1 = "Tuisto Earring", 
		ear2 = "Friomisi Earring",		
		body = "Agwu's Robe",
		hands = "Agwu's Gages",
		ring1 = "Etana Ring", 
		ring2 = "Metamorph Ring +1",
		back = Ogma.TP, 
		waist = "Eschan Stone",	
		legs = "Agwu's Slops", 
		feet = "Agwu's Pigaches"	
	}
	sets.SwordMagic.MB = {
		ammo = "Pemphredo Tathlum",
		head = "Agwu's Cap", -- 7/0
		neck = "Combatant's Torque", 
		ear1 = "Tuisto Earring", 
		ear2 = "Friomisi Earring", 		
		body = "Agwu's Robe", -- 10/0
		hands = "Agwu's Gages", --8/5
		ring1 = "Mujin Band", -- 0/5
		ring2 = "Metamorph Ring +1",
		back = Ogma.TP, 
		waist = "Eschan Stone",	
		legs = "Agwu's Slops", -- 9/0
		feet = "Agwu's Pigaches" -- 6/0
	} -- 40 MBB / 10 MBBII | +301 MAB / +310 Macc
	sets.SwordMagic.Dark = {
		ammo = "Pemphredo Tathlum",
		head = "Pixie Hairpin +1", -- (28)
		neck = "Combatant's Torque", 
		ear1 = "Static Earring", -- 5/0
		ear2 = "Friomisi Earring", 		
		body = "Agwu's Robe", -- 10/0
		hands = "Agwu's Gages", --8/5
		ring1 = "Mujin Band", -- 0/5
		ring2 = "Archon Ring", -- (5)
		back = Ogma.TP, 
		waist = "Eschan Stone",	
		legs = "Agwu's Slops", -- 9/0
		feet = "Agwu's Pigaches" -- 6/0
	} -- 38 MBB / 10 MBBII | +301 MAB / +310 Macc / +33% Dark Damage Affinity

	
	sets.Pulse = {
		ammo = "Staunch Tathlum +1",
		head = "Erilaz Galea +1", --removes aligned status (-na's)
		neck = "Futhark Torque +1", 
		ear1 = "Tuisto Earring", 
		ear2 = "Odnowa Earring +1", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Eihwaz Ring", 
		ring2 = "Supershear Ring",
		back = Ogma.Idle, 
		waist = "Engraved Belt",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"	
	}
	--sets the type for your rune majority if you want to build specific sets ('None' is default)
	--Tenebrae not listed as it is divine skill only (covered by base set)
	--Only add as much equipment as you want to replace in the main set, lua will handle the combines.
	--You can build stat-specific sets for each element if you want to, but I do not.
	--Divine skill is worthwhile, but watch for HP/MP fluctuations
	--Ignis: STR
	--Gelus: DEX
	--Flabra: VIT
	--Tellus: AGI
	--Sulpor: INT
	--Unda: MND
	--Lux: CHR
	sets.PulseType = {}
	sets.PulseType.index = {'None', 'Ignis', 'Gelus', 'Flabra', 'Tellus', 'Sulpor', 'Unda', 'Lux'}
	
	sets.PulseType.Ignis = {}
	sets.PulseType.Gelus = {}
	sets.PulseType.Flabra = {}
	sets.PulseType.Tellus = {}
	sets.PulseType.Sulpor = {}
	sets.PulseType.Unda = {}
	sets.PulseType.Lux = {}
	
	
	--This set must be equipped when receiving the buff for it to take effect.
	--Lua will detect and lock the back until a buff is received.
	sets.Embolden = {back = "Evasionist's Cape"}
	
	
	--Balance of Enmity+ and HP+
	--Note: the effect is based on the HP of the player effected, not the RUN providing it.
	-- -- With that said, HP+ is for *your* protection, not the party's.
	--Priority: Rampart < Shining Ruby < Wind’s Blessing < One for All
	sets.OneForAll = {
		ammo = "Sapience Orb",
		head = "Halitus Helm",
		neck = "Unmoving Collar +1",
		ear1 = "Tuisto Earring",
		ear2 = "Odnowa Earring +1",
		body = "Emet Harness +1",
		hands = "Kurys Gloves",
		ring1 = "Gelatinous Ring +1",
		ring2 = "Eihwaz Ring",
		back = Ogma.Idle,
		waist = "Trance Belt",
		legs = "Erilaz Leg Guards +1",
		feet = "Ahosi Leggings"
	} -- +81 Enmity (+134 Enmity w/ Epeo + Crusade) | 3104 HP = 610 reduction

	
	sets.Waltz ={
	-- Insert gear here as desired
	}
	
	--FastCast (FC) sets
	--Yes, there are 12 of these sets. Just don't fill out the sets for /sch (arts/wrong_arts) if you dont plan to use it.
	--Make sure you pay attention to how much HP you lose in these swaps
	--For /sch: LA/DA adds a -10% cast time reduction for aligned spell, and +20% cast time penalty for the opposite school

	--DO NOT factor Inspiration merits into the next 6 FC sets.
	sets.FastCast = {
		ammo = "Sapience Orb", --2
		head = "Runeist's Bandeau +3", --14
		neck = "Unmoving Collar +1",
		ear1= "Enchanter's Earring +1", --2
		ear2 = "Loquacious Earring", --2
		body = AdhemarBody.FC, --10
		hands = "Leyline Gloves", --8
		ring1 = "Gelatinous Ring +1",
		ring2 = "Kishar Ring", --4
		back = Ogma.FC, --10
		waist = "Engraved Belt",
		legs = "Agwu's Slops", --7
		feet = "Carmine Greaves +1" --8
	} -- 67% FC
	
	-- -10% casting time*, (72% FC needed)
	sets.FastCast_arts = {
		ammo = "Sapience Orb", --2
		head = "Runeist's Bandeau +3", --14
		neck = "Unmoving Collar +1",
		ear1= "Enchanter's Earring +1", --2
		ear2 = "Loquacious Earring", --2
		body = AdhemarBody.FC, --10
		hands = "Leyline Gloves", --8
		ring1 = "Gelatinous Ring +1",
		ring2 = "Kishar Ring", --4
		back = Ogma.FC, --10
		waist = "Engraved Belt",
		legs = "Agwu's Slops", --7
		feet = "Carmine Greaves +1" --8
	} -- 67% FC
	
	-- For casting opposite spells to active arts
	-- +20% casting time penalty (96% FC needed)
	sets.FastCast_wrong_arts = {
		ammo = "Sapience Orb", --2
		head = "Runeist's Bandeau +3", --14
		neck = "Unmoving Collar +1",
		ear1= "Enchanter's Earring +1", --2
		ear2 = "Loquacious Earring", --2
		body = AdhemarBody.FC, --10
		hands = "Leyline Gloves", --8
		ring1 = "Gelatinous Ring +1",
		ring2 = "Kishar Ring", --4
		back = Ogma.FC, --10
		waist = "Engraved Belt",
		legs = "Agwu's Slops", --7
		feet = "Carmine Greaves +1" --8
	} -- 67% FC
	
	sets.FastCast_enhancing = {
		ammo = "Impatiens",
		head = "Runeist's Bandeau +3", --14
		neck = "Unmoving Collar +1",
		ear1= "Etiolation Earring", --1
		ear2 = "Loquacious Earring", --2
		body = AdhemarBody.FC, --10
		hands = "Leyline Gloves", --8
		ring1 = "Gelatinous Ring +1",
		ring2 = "Kishar Ring", --4
		back = Ogma.FC, --10
		waist = "Siegel Sash", --(8)
		legs = "Futhark Trousers +3", --(15)
		feet = "Carmine Greaves +1" --8
	} -- 57% + (23%) = 80% FC / 2% QM
	
	-- -10% casting time*, (72% FC needed)
	sets.FastCast_enhancing_arts = {
		ammo = "Impatiens",
		head = "Runeist's Bandeau +3", --14
		neck = "Unmoving Collar +1",
		ear1= "Tuisto Earring", 
		ear2 = "Odnowa Earring +1", 
		body = AdhemarBody.FC, --10
		hands = "Leyline Gloves", --8
		ring1 = "Gelatinous Ring +1",
		ring2 = "Lebeche Ring",
		back = Ogma.FC, --10
		waist = "Siegel Sash", --(8)
		legs = "Futhark Trousers +3", --(15)
		feet = "Carmine Greaves +1" --8
	} -- 50% + (23%) = 73% FC / 4% QM
	
	-- For casting opposite spells to active arts
	-- +20% casting time penalty (96% FC needed)
	sets.FastCast_enhancing_wrong_arts = {
		ammo = "Sapience Orb", --2
		head = "Runeist's Bandeau +3", --14
		neck = "Unmoving Collar +1",
		ear1= "Enchanter's Earring +1", --2
		ear2 = "Loquacious Earring", --2
		body = AdhemarBody.FC, --10
		hands = "Leyline Gloves", --8
		ring1 = "Gelatinous Ring +1",
		ring2 = "Kishar Ring", --4
		back = Ogma.FC, --10
		waist = "Siegel Sash", --(8)
		legs = "Futhark Trousers +3", --(15)
		feet = "Carmine Greaves +1" --8
	} -- 60% + (23%) = 83% FC
	
	--For the next 6 FC sets, factor your Inspiration merits into the FC totals
	--I personally use 4/5 merits for 48% FC w/ relic pants bonus
	--32% FC needed to cap
	sets.FastCast_inspiration = {
		ammo = "Impatiens", 
		head = "Runeist's Bandeau +3", --14
		neck = "Unmoving Collar +1",
		ear1= "Etiolation Earring", --1 
		ear2 = "Odnowa Earring +1", 
		body = "Nyame Mail",
		hands = "Nyame Gauntlets", 
		ring1 = "Defending Ring",
		ring2 = "Lebeche Ring", 
		back = Ogma.FC, --10
		waist = "Engraved Belt",
		legs = "Agwu's Slops", --7
		feet = "Nyame Sollerets" 
	} -- 48% + 32% = 80% FC / 4% QM
	
	-- -10% casting time (48% base, 24% FC needed)
	sets.FastCast_arts_inspiration = {
		ammo = "Impatiens", 
		head = "Runeist's Bandeau +3", --14
		neck = "Unmoving Collar +1",
		ear1= "Tuisto Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Nyame Mail",
		hands = "Nyame Gauntlets", 
		ring1 = "Defending Ring",
		ring2 = "Lebeche Ring", 
		back = Ogma.FC, --10
		waist = "Engraved Belt",
		legs = "Nyame Flanchard",
		feet = "Nyame Sollerets" 
	} -- 48% + 24% = 72% FC / 4% QM
	
	-- For casting opposite spells to active arts
	-- +20% casting time penalty (96% FC needed)
	sets.FastCast_wrong_arts_inspiration = {
		ammo = "Sapience Orb", --2
		head = "Runeist's Bandeau +3", --14
		neck = "Unmoving Collar +1",
		ear1= "Etiolation Earring", --1
		ear2 = "Loquacious Earring", --2
		body = "Nyame Mail", 
		hands = "Nyame Gauntlets",
		ring1 = "Gelatinous Ring +1",
		ring2 = "Kishar Ring", --4
		back = Ogma.FC, --10
		waist = "Engraved Belt",
		legs = "Agwu's Slops", --7
		feet = "Carmine Greaves +1" --8
	} -- 48% + 48% = 96% FC	
	
	sets.FastCast_enhancing_inspiration = {
		ammo = "Impatiens", 
		head = "Runeist's Bandeau +3", --14
		neck = "Unmoving Collar +1",
		ear1= "Etiolation Earring", --1 
		ear2 = "Odnowa Earring +1", 
		body = "Nyame Mail",
		hands = "Nyame Gauntlets", 
		ring1 = "Defending Ring",
		ring2 = "Lebeche Ring", 
		back = Ogma.FC, --10
		waist = "Engraved Belt",
		legs = "Agwu's Slops", --7
		feet = "Nyame Sollerets" 
	} -- 48% + 32% = 80% FC / 4% QM
	
	-- -10% casting time (48%FC, 24% FC needed)
	sets.FastCast_enhancing_arts_inspiration = {
		ammo = "Impatiens", 
		head = "Runeist's Bandeau +3", --14
		neck = "Unmoving Collar +1",
		ear1= "Tuisto Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Nyame Mail", 
		hands = "Nyame Gauntlets", 
		ring1 = "Defending Ring",
		ring2 = "Lebeche Ring", 
		back = Ogma.FC, --10
		waist = "Engraved Belt",
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets" 
	} -- 48% + 24% = 72% FC / 4% QM
	
	-- For casting opposite spells to active arts
	-- +20% casting time penalty (48%FC, 48% FC needed)
	sets.FastCast_enhancing_wrong_arts_inspiration = {
		ammo = "Impatiens", 
		head = "Runeist's Bandeau +3", --14
		neck = "Unmoving Collar +1",
		ear1= "Etiolation Earring", --1 
		ear2 = "Odnowa Earring +1", 
		body = "Nyame Mail", 
		hands = "Nyame Gauntlets", 
		ring1 = "Defending Ring",
		ring2 = "Lebeche Ring", 
		back = Ogma.FC, --10
		waist = "Siegel Sash", --(8)
		legs = "Futhark Trousers +3", --(15)
		feet = "Nyame Sollerets" 
	} -- 48% + 25% + (23%) = 96% FC / 4% QM
	
	--This is here if you need it for Utsusemi
	sets.NinjutsuFastCast = set_combine(
		sets.FastCast, 
		{} --neck = "Magoraga Beads"}
	)
	
	
	sets.midcast = {}
	-- FC here will lower recasts until cap, but its a good idea to put -DT% in midcasts.
	-- While SCH JSE can play a huge role in reducing recasts, I opted to handle this on a spell-by-spell basis.
	-- As such, the generic recast reduction set here will not reflect JSE bonuses.
	--Inspiration 4/5 will add another 40% FC
	sets.FastRecast = {
		ammo = "Staunch Tathlum +1", 
		head = "Runeist's Bandeau +3", --14
		neck = "Futhark Torque +1",
		ear1= "Tuisto Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Nyame Mail", 
		hands = "Nyame Gauntlets",
		ring1 = "Defending Ring",
		ring2 = "Kishar Ring", --4
		back = Ogma.Idle,
		waist = "Engraved Belt",
		legs = "Agwu's Slops", --7
		feet = "Nyame Sollerets"
	} -- 25% FC (12~32% recast reduction) | 10/5/45


	--Enhancing Magic
	--Note that any amounts noted are generalization before calculation.
	-- --For example, if the "total duration+" is noted for a set this is not the calculated duration.
	--
	--
	--Duration Formula:
	-- -- (Base Duration + (6s × RDM Group 2 Merit Point Level) + (3s × RDM Relic Hands Group 2 Merit Point Level Augment) 
	-- -- + RDM Job Points + Gear that list Seconds) × (Augments Composure Bonus) × (Duration listed on Gear + Naturalist's Roll) 
	-- -- × (Duration Augments on Gear) × (Rune Fencer Gifts) = Duration
	
	-- Non-skill, non-regen spells
	sets.Enhancing_duration = {
		ammo = "Staunch Tathlum +1",
		head = "Erilaz Galea +1",
		neck = "Futhark Torque +1",
		ear1 = "Tuisto Earring",
		ear2 = "Odnowa Earring +1",
		body = "Nyame Mail",
		hands = "Regal Gauntlets",
		ring1 = "Defending Ring",
		ring2 = "Sheltered Ring",
		back = Ogma.Idle,
		waist = "Engraved Belt",
		legs = "Futhark Trousers +3",
		feet = "Nyame Sollerets"
	} -- Duration +65% | 3180 HP | 10/2/38 DT 
	
	--For Temper
	sets.Enhancing_skill = {
		ammo = "Staunch Tathlum +1",
		head = "Erilaz Galea +1",
		neck = "Incanter's Torque",
		ear1 = "Mimir Earring",
		ear2 = "Odnowa Earring +1",
		body = "Nyame Mail",
		hands = "Regal Gauntlets",
		ring1 = "Defending Ring",
		ring2 = "Eihwaz Ring",
		back = Ogma.Idle,
		waist = "Olympus Sash",
		legs = "Futhark Trousers +3",
		feet = "Nyame Sollerets"
	} -- Duration +65% | +17% (18% w/ LA) DA rate (24~25% possible, but I like the duration and not going into a glass set/losing HP)
	
	sets.Enhancing_regen = {
		ammo = "Staunch Tathlum +1",
		head = "Runeist's Bandeau +3",
		neck = "Sacro Gorget",
		ear1 = "Tuisto Earring",
		ear2 = "Odnowa Earring +1",
		body = "Nyame Mail",
		hands = "Regal Gauntlets",
		ring1 = "Defending Ring",
		ring2 = "Eihwaz Ring",
		back = Ogma.Idle,
		waist = "Sroda Belt",
		legs = "Futhark Trousers +3",
		feet = "Nyame Sollerets"
	} -- Duration +65% | 3180 HP | 10/2/32 DT 
	
	--Must hit 500 skill
	sets.Enhancing_barspells = {
		ammo = "Staunch Tathlum +1",
		head = "Carmine Mask +1",
		neck = "Futhark Torque +1",
		ear1 = "Tuisto Earring",
		ear2 = "Odnowa Earring +1",
		body = "Nyame Mail",
		hands = "Runeist's Mitons +2",
		ring1 = "Gelatinous Ring +1",
		ring2 = "Eihwaz Ring",
		back = Ogma.Idle,
		waist = "Engraved Belt",
		legs = "Carmine Cuisses +1",
		feet = "Nyame Sollerets"
	} -- 502 | 12/2/38
	
	-- For maximum potency when in wrong/no arts (@ML14 the set can change to wear full duration+ gear)
	sets.Enhancing_barspells_wrong_arts = {
		ammo = "Staunch Tathlum +1",
		head = "Carmine Mask +1",
		neck = "Futhark Torque +1",
		ear1 = "Mimir Earring",
		ear2 = "Odnowa Earring +1",
		body = "Nyame Mail",
		hands = "Runeist's Mitons +2",
		ring1 = "Gelatinous Ring +1",
		ring2 = "Eihwaz Ring",
		back = Ogma.Idle,
		waist = "Engraved Belt",
		legs = "Carmine Cuisses +1",
		feet = "Nyame Sollerets"
	} -- 501 | 12/2/38
	
	--SIR Set
	sets.Enhancing_aquaveil = {
		ammo = "Staunch Tathlum +1",
		head = "Agwu's Cap", 
		neck = "Loricate Torque +1", 
        body = TaeonBody.SIR, 
		ear1 = "Tuisto Earring", 
		ear2 = "Odnowa Earring +1", 
		hands = "Regal Gauntlets", 
		ring1 = "Defending Ring", 
		ring2 = "Gelatinous Ring +1", 
        back = Ogma.Idle, 
		waist = "Audumbla Sash", 
		legs = "Carmine Cuisses +1", 
		feet = TaeonFeet.SIR 
	} -- 106/102% SIR | 21/1/22
	
	-- For cast on self
	sets.Enhancing_phalanx = {
		ammo = "Staunch Tathlum +1",
		head = "Futhark Bandeau +3", 
		neck = "Unmoving Collar +1", 
        body = HercVest.Phalanx, 
		ear1 = "Tuisto Earring", 
		ear2 = "Odnowa Earring +1", 
		hands = HercHands.Phalanx, 
		ring1 = "Defending Ring", 
		ring2 = "Gelatinous Ring +1", 
        back = Ogma.Idle, 
		waist = "Olympus Sash", 
		legs = HercLegs.Phalanx, 
		feet = HercFeet.Phalanx
	}
	
	-- For cast on others (Accession, duration/skill focus)
	sets.Enhancing_phalanx_other = {
		ammo = "Staunch Tathlum +1",
		head = "Erilaz Galea +1",
		neck = "Incanter's Torque",
		ear1 = "Mimir Earring",
		ear2 = "Odnowa Earring +1",
		body = "Nyame Mail",
		hands = "Regal Gauntlets",
		ring1 = "Defending Ring",
		ring2 = "Stikini Ring",
		back = Ogma.Idle,
		waist = "Olympus Sash",
		legs = "Futhark Trousers +3",
		feet = "Nyame Sollerets"
	} -- Duration +65% | 3180 HP | 10/2/32 DT 
	
	sets.Enhancing_stoneskin = {
		ammo = "Staunch Tathlum +1",
		head = "Erilaz Galea +1",
		neck = "Futhark Torque +1",
		ear1 = "Tuisto Earring",
		ear2 = "Odnowa Earring +1",
		body = "Nyame Mail",
		hands = "Regal Gauntlets",
		ring1 = "Defending Ring",
		ring2 = "Eihwaz Ring",
		back = Ogma.Idle,
		waist = "Siegel Sash",
		legs = "Futhark Trousers +3",
		feet = "Nyame Sollerets"
	} -- Duration +65% | 3180 HP | 10/2/38 DT 
	
	sets.Enhancing_refresh = {
		ammo = "Staunch Tathlum +1",
		head = "Erilaz Galea +1",
		neck = "Futhark Torque +1",
		ear1 = "Tuisto Earring",
		ear2 = "Odnowa Earring +1",
		body = "Nyame Mail",
		hands = "Regal Gauntlets",
		ring1 = "Defending Ring",
		ring2 = "Eihwaz Ring",
		back = Ogma.Idle,
		waist = "Gishdubar Sash",
		legs = "Futhark Trousers +3",
		feet = "Nyame Sollerets"
	} -- Duration +65% | 3180 HP | 10/2/38 DT 
	
	--Cast on others
	sets.Enhancing_refresh_other = {
		ammo = "Staunch Tathlum +1",
		head = "Erilaz Galea +1",
		neck = "Futhark Torque +1",
		ear1 = "Tuisto Earring",
		ear2 = "Odnowa Earring +1",
		body = "Nyame Mail",
		hands = "Regal Gauntlets",
		ring1 = "Defending Ring",
		ring2 = "Eihwaz Ring",
		back = Ogma.Idle,
		waist = "Engraved Belt",
		legs = "Futhark Trousers +3",
		feet = "Nyame Sollerets"
	} -- Duration +65% | 3180 HP | 10/2/38 DT 


	--Enfeebles
	--Note that any amounts noted are generalization before calculation.
	-- --For example, if the "total duration+" is noted for a set this is not the calculated duration.
	-- --Sets will be calculated for totals in the notes below based on proper weapon combos (assumes mage-mode)
	--
	--
	-- Potency Formula:
	-- -- floor(floor((Base Potency × Saboteur) + {dStat Modifier}) × (Enfeebling Magic Effect+ Gear))
	--
	-- Duration Formula:
	-- -- floor[((Base Duration × Saboteur) + (6s × RDM Group 2 Merit Point Level) + (3s × RDM Relic Head Group 2 Merit Point Level Augment) 
	-- -- + RDM Enfeebling Job Points + RDM Stymie Job Points + Gear that list Seconds) × (Augments Composure Bonus) × (Duration listed on Gear) 
	-- -- × (Duration Augments on Gear)] = Duration
	
	--Light/Dark Arts makes this viable
	--Dont forget Epeo @R15 gives another +30 Macc
	sets.Enfeebling = {
        ammo="Pemphredo Tathlum", 
		head="Agwu's Cap",
        neck="Futhark Torque +1", 
        ear1="Tuisto Earring", 
        ear2="Odnowa Earring +1", 
		body="Nyame Mail",
        hands="Agwu's Gages", 
        ring1="Defending Ring",
        ring2="Metamorph Ring +1", 
        back=Ogma.Idle, --Will want a Macc cape eventually (+30)
		waist="Acuity Belt +1",
        legs="Agwu's Slops", 
        feet="Agwu's Pigaches" 	
	} -- +273 Macc | 10/2/37

	
	--Cures
	sets.Cure = {
		ammo="Staunch Tathlum +1",
		head="Runeist's Bandeau +3", 
		neck="Sacro Gorget", -- 10/0
		ear1="Tuisto Earring",
		ear2="Odnowa Earring +1",
        body="Nyame Mail", 
		hands="Agwu's Gages", -- 0/0 (10)
        ring1="Defending Ring",
        ring2="Menelaus's Ring", -- 5/0
        back=Ogma.Idle,
		waist="Sroda Belt", -- 35/0
		legs="Agwu's Slops",  
		feet="Nyame Sollerets" 
	} -- 50/0 CP (+10% CPRcv'd) | 10/2/41


	--Black Magic
	--Dark Arts will let you land a Helix if you really want to
	sets.Elemental = {
        ammo="Pemphredo Tathlum",
		head="Agwu's Cap", 
        neck="Sibyl Scarf", 
        ear1="Friomisi Earring", 
        ear2="Crematio Earring", 
        body="Agwu's Robe",
        hands="Agwu's Gages",
        ring1="Mujin Band", 
        ring2="Metamorph Ring +1", 
        back=Ogma.Idle, 
        waist="Acuity Belt +1", 
        legs="Agwu's Slops",
        feet="Agwu's Pigaches"
	} 
	sets.Elemental_noctohelix = {
        ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1", 
        neck="Sibyl Scarf", 
        ear1="Friomisi Earring", 
        ear2="Static Earring", 
        body="Agwu's Robe",
        hands="Agwu's Gages",
        ring1="Mujin Band", 
        ring2="Archon Ring", 
        back=Ogma.Idle, 
        waist="Acuity Belt +1", 
        legs="Agwu's Slops",
        feet="Agwu's Pigaches"
	}
	
	
	--Dark Magic
	--Dark Arts makes this viable
	sets.Aspir = {
        ammo="Pemphredo Tathlum",
		head="Agwu's Cap", 
        neck="Erra Pendant", 
        ear1="Tuisto Earring", 
        ear2="Odnowa Earring +1", 
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Defending Ring", 
        ring2="Evanescence Ring", -- All of this time, I can't believe I couldn't see~
        back=Ogma.Idle, 
        waist="Acuity Belt +1", 
        legs="Agwu's Slops",
        feet="Agwu's Pigaches"
	} -- +56% Potency | 10/2/36
	

	--Other special gear--
	--Enmity sets
	sets.Enmity = { --JA's
		ammo = "Sapience Orb", --2
		head = "Halitus Helm", --8
		neck = "Unmoving Collar +1", --10
        body = "Emet Harness +1", --10
		ear1 = "Tuisto Earring", 
		ear2 = "Odnowa Earring +1", 
		hands = "Kurys Gloves", --9
		ring1 = "Supershear Ring", --5
		ring2 = "Eihwaz Ring", --5
        back = Ogma.Idle, --10
		waist = "Trance Belt", --4 
		legs = "Erilaz Leg Guards +1", --11
		feet = "Erilaz Greaves +1" --6
	} -- +80 Enmity
	sets.Enmity_cast = { --Spells
		ammo = "Staunch Tathlum +1", 
		head = "Runeist's Bandeau +3",
		neck = "Warder's Charm +1",
		ear1 = "Tuisto Earring",
		ear2 = "Odnowa Earring +1", -- 0/2/3
		body = "Nyame Mail", -- 0/0/9
		hands = "Nyame Gauntlets", -- 0/0/7
		ring1 = "Defending Ring", -- 0/0/10
		ring2 = "Eihwaz Ring",
		back = Ogma.Parry,
		waist = "Trance Belt",
		legs = "Agwu's Slops", -- 0/0/9
		feet = "Nyame Sollerets" -- 0/0/7
	} -- +27 Enmity (+80 Enmity w/ Epeo + Crusade) | 21% FC for recasts | 3026 HP | 673 Meva | 0/2/48 DT (high meva/DT for breath damage from things like fetters)
	sets.Enmity_SIR = { --Add enmity+ to this set if you can, but tagging AoE without being interrupted is most important
		ammo = "Staunch Tathlum +1",
		head = "Agwu's Cap", 
		neck = "Loricate Torque +1", 
        body = TaeonBody.SIR, 
		ear1 = "Tuisto Earring", 
		ear2 = "Odnowa Earring +1", 
		hands = "Regal Gauntlets", 
		ring1 = "Defending Ring", 
		ring2 = "Gelatinous Ring +1", 
        back = Ogma.Idle, 
		waist = "Audumbla Sash", 
		legs = "Carmine Cuisses +1", 
		feet = TaeonFeet.SIR 
	} -- 106/102% SIR | 21/1/22
	
	sets.obi = {
		waist = "Hachirin-no-Obi"
	}
	
	sets.Doom = {
		neck = "Nicander's Necklace",
		ring1 = "Defending Ring",
		ring2 = "Purity Ring",
		waist = "Gishdubar Sash"
	} -- Actually get the gear for this set. It isnt hard and it makes Doom trivial to remove.
	
	-- Set to be enabled when you are unable to act
	-- Sleep / Terror / Stun / Petrification
	-- You can dance if you want to.
	sets.SafetyDance = {
		ammo = "Staunch Tathlum +1",
		head = "Nyame Helm",
		neck = "Futhark Torque +1",
		ear1 = "Eabani Earring",
		ear2 = "Odnowa Earring +1",
		body = "Runeist's Coat +3",
		hands = "Nyame Gauntlets",
		ring1 = "Sheltered Ring",
		ring2 = "Eihwaz Ring",
		back = Ogma.Idle,
		waist = "Engraved Belt",
		legs = "Nyame Flanchard",
		feet = "Nyame Sollerets"
	}


	
	--Determines SJ on load for later use, DO NOT REMOVE--
	determine_sub()	
	prep_startup()
end


------------------------------------------------------------------------------
------------------------------------------------------------------------------
--Do Not Adjust Anything Below This Point Unless You Know What You Are Doing--
------------------------------------------------------------------------------
------------------------------------------------------------------------------
function maps()
	--Mapping--	
	Enfeebles = S{
		'Dispel', 'Slow', 'Paralyze', 'Silence', 'Blind', 'Break', 'Bind', 'Sleep', 'Sleep II', 
		'Sleepga', 'Sleepga II', 'Gravity'}
		
	Cure_spells = S{
		'Cure', 'Cure II', 'Cure III', 'Cure IV', 'Curaga', 'Curaga II', 'Curaga III', 'Cura',
		'Healing Breeze', 'Wild Carrot'}
		
	Regen_spells = S{
		'Regen', 'Regen II', 'Regen III', 'Regen IV'}
	
    Skill_spells = S{
        'Temper', 'Temper II', 'Enfire', 'Enfire II', 'Enblizzard', 'Enblizzard II', 'Enaero', 'Enaero II',
        'Enstone', 'Enstone II', 'Enthunder', 'Enthunder II', 'Enwater', 'Enwater II', 'Gain-STR', 'Gain-DEX', 
		'Gain-VIT', 'Gain-AGI', 'Gain-INT', 'Gain-MND', 'Gain-CHR'}
		
	Duration_spells = S{
		'Haste', 'Flurry', 'Adloquium', 'Blink',
		'Protect', 'Protect II', 'Protect III', 'Protect IV', 'Protect V', 'Protectra', 'Protectra II', 'Protectra III', 
		'Shell', 'Shell II', 'Shell III', 'Shell IV', 'Shell V', 'Shellra', 'Shellra II',
		'Barsleep', 'Barpoison', 'Barparalyze', 'Barblind', 'Barsilence', 'Barpetrify', 'Barvirus', 'Baramnesia', 
		'Barsleepra', 'Barpoisonra', 'Barparalyzra', 'Barblindra', 'Barsilencera', 'Barpetra', 'Barvira', 'Baramnesra',
		'Aurorastorm', 'Voidstorm', 'Sandstorm', 'Rainstorm', 'Windstorm', 'Firestorm', 'Hailstorm', 'Thunderstorm'}
	
	Barspells = S{
		'Barthunder', 'Barblizzard', 'Barfire', 'Baraero', 'Barwater', 'Barstone', 
		'Barthundra', 'Barblizzara', 'Barfira', 'Baraera', 'Barwatera', 'Barstonra', }
		
	Nuke_spells = S{
		'Stone', 'Stone II', 'Stone III', 'Stone IV', 'Stone V', 'Stonega', 'Stonega II',  'Stonega III', 
		'Water', 'Water II', 'Water III', 'Water IV', 'Water V', 'Waterga', 'Waterga II', 'Waterga III', 
		'Aero', 'Aero II', 'Aero III', 'Aero IV', 'Aero V', 'Aeroga', 'Aeroga II', 'Aeroga III',
		'Fire', 'Fire II', 'Fire III', 'Fire IV', 'Fire V', 'Firaga', 'Firaga II', 'Firaga III', 
		'Blizzard', 'Blizzard II', 'Blizzard III', 'Blizzard IV', 'Blizzard V', 'Blizzaga', 'Blizzaga II', 'Blizzaga III', 
		'Thunder', 'Thunder II', 'Thunder III', 'Thunder IV', 'Thunder V', 'Thundaga', 'Thundaga II', 'Thundaga III',
		'Holy'}
		
	Helix_spells = S{
		'Geohelix', 'Hydrohelix', 'Anemohelix', 'Pyrohelix', 'Cryohelix', 'Ionohelix', 'Noctohelix', 'Luminohelix',
		'Geohelix II', 'Hydrohelix II', 'Anemohelix II', 'Pyrohelix II', 'Cryohelix II', 'Ionohelix II', 'Noctohelix II', 'Luminohelix II'}
		
	Addendum_white_spells = S{
		'Poisona', 'Paralyna', 'Blindna', 'Cursna', 'Silena', 'Viruna', 'Stona', 'Erase',
		'Raise II', 'Raise III', 'Reraise', 'Reraise II', 'Reraise III'}
		
	Addendum_black_spells = S{
		'Stone IV', 'Stone V', 'Water IV', 'Water V', 'Aero IV', 'Aero V', 'Fire IV', 'Fire V', 'Blizzard IV', 'Blizzard V', 'Thunder IV', 'Thunder V',
		'Sleep', 'Sleep II', 'Break', 'Dispel'}
		
	Elemental_WS = S{
		'Herculean Slash', 
		'Sanguine Blade'}	
		
	Unusable_buff = {
		spell={'Charm','Mute','Omerta','Petrification','Silence','Sleep','Stun','Terror'},
		ability={'Amnesia','Charm','Impairment','Petrification','Sleep','Stun','Terror'}}	

	Enmity_actions = S{'Sentinel', 'Shield Bash', 'Souleater', 'Weapon Bash', 
		'Vallation', 'Valiance', 'Swordplay', 'Pflug', 'Provoke', 'Animated Flourish'}
		
	Enmity_spells = S{
		'Stun', 'Flash', 'Foil', 'Geist Wall', 'Jettatura'}
		
	SIR_spells = S{ --Enmity Spells that need to have 102%+ SIR
		'Soporific', 'Sheep Song', 'Stinking Gas', 'Poisonga'} --Geist wall is intentionally excluded
		
	Runes = S{ --leave these lowercase
		'ignis', 'gelus', 'flabra', 'tellus', 'sulpor', 'unda', 'lux', 'tenebrae'}
	
	--Leave the Lethargy set in even if it isn't relevant to Geo.
	-- --Duration Timers depend on it, and while it can be removed
	-- --in the later code, it doesn't actually matter that it's here.
	LethargySet = S{
		'Lethargy Chappel', 'Leth. Chappel +1', 'Lethargy Sayon', 'Lethargy Sayon +1', 'Lethargy Gantherots', 'Lethargy Gantherots +1', 
		'Lethargy Fuseau', 'Leth. Fuseau +1', 'Lethargy Houseaux', 'Leth. Houseaux +1'}		

	--Master Base Enfeebling Duration Table (seconds)
	duration30 = S{
		'Break', 'Bind'} --No conclusive data found on min Bind duration
	duration60 = S{
		'Sleep', 'Sleepga', 'Addle', 'Dia'} --No conclusive data found on min Addle duration
	duration90 = S{
		'Sleep II', 'Sleepga II'}
	duration120 = S{
		'Paralyze', 'Silence', 'Gravity', 'Poison', 'Poison II', 'Dia II'}
	duration180 = S{
		'Slow', 'Blind'}
	duration300 = S{
		'Frazzle', 'Distract'}
	------------------------------------------------------------------------------		
end

--Variables
--
--buff IDs taken from: https://github.com/Windower/Resources/blob/master/resources_data/buffs.lua
hasteVal = 0
hastevalue = {}
hastevalue[580] = 30 -- GeoHaste/30~40% haste
hastevalue[228] = 30 -- Embrava/30% haste
hastevalue[33]  = 15 -- Haste/15% haste (HasteII/30% haste, but indistinguishable as a buffID)
hastevalue[604] = 15 -- MightyGuard/15% haste
hastevalue[370] = 5  -- HasteSamba/5~10% haste
hastevalue[214] = 15 -- March/15% (logic will assume HonorMarch since also indistinguishable as a buffID)

--Rune tracking
Rune_element_majority = "None"
Rune = {}
Rune[523] = 0 --Ignis
Rune[524] = 0 --Gelus
Rune[525] = 0 --Flabra
Rune[526] = 0 --Tellus
Rune[527] = 0 --Sulpor
Rune[528] = 0 --Unda
Rune[529] = 0 --Lux
Rune[530] = 0 --Tenebrae

--Haste_mode
Soul_voice = false
Haste_II = true -- RDM will always have access to Haste II, but this is here in case you dont for some reason


-- Sets the default mode for weapons swaps
-- -- Melee(true): Disallows weapon swaps during casts
-- -- Mage(false): Allows weapon swaps during casts
Melee_mode = false


-- Sets the default mode for magic bursts
Burst_mode = false


-- Sets default for Saboteur Mode between NM and regular mobs
Notorious_monster = false


-- This is from the RDM lua, but it still works with other jobs.
-- KEEP THE NEXT 3 VARIABLES SET TO "0".
-- Sets Merits/Job Gifts related to Enfeebling Duration for calculations later
-- -- Replace with the # of Merits you have in this cetegory (5 max)
EnfeeblingDurationMerits = 0
-- -- Replace with the # of Job Points you have in this cetegory (20 max)
EnfeeblingDurationGifts = 0
-- -- Replace with the # of Job Points you have in this cetegory (20 max)
StymieDurationGifts = 0


--Additional related variables
Category2 = 6.00 * EnfeeblingDurationMerits
Category2Head = 3.00 * EnfeeblingDurationMerits
Composure = 1.00
Stymie = 0.00
base = 0.00
FlatGearBonus = 0.00
GearAugments = 1.00
MultiplicativeGearBonus = 1.00
DurationTotal = 0.00

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

function buff_change(n,gain,buff_table)
	local name
    name = string.lower(n)
	if name == "doom" then
		if gain then
			equip(sets.Doom)
			disable('neck','ring1','ring2','waist')
			send_command("@input /p Doomed.")
		else
			enable('neck','ring1','ring2','waist')
			determine_haste_sets()
			send_command("@input /p Doom off.")
		end
	end
	--Ensures gear slots unlock if you die
	if name == "weakness" and gain then
		enable('neck','ring1','ring2','waist')
	end
	if S{"terror", "petrification", "sleep", "stun"}:contains(name) then
        if gain then
            equip(sets.SafetyDance)
        else
			if not has_any_buff_of({"terror", "petrification", "sleep", "stun"}) then
				determine_haste_sets()
			end
        end
	end
	if name == "charm" then
        if gain then
            send_command('@input /p Charmed!')
        else
            send_command('@input /p Charm off.')
        end	
	end
	if name == "embolden" then
		if gain then
			equip(sets.Embolden)
			disable('back')
		else
			enable(back)
		end
	end
	if Runes:contains(name) then
		if gain then
			--update the numeric rune majority
			if name == 'ignis' then
				Rune_ID = 523
			elseif name == 'gelus' then
				Rune_ID = 524
			elseif name == 'flabra' then
				Rune_ID = 525
			elseif name == 'tellus' then
				Rune_ID = 526
			elseif name == 'sulpor' then
				Rune_ID = 527
			elseif name == 'unda' then
				Rune_ID = 528
			elseif name == 'lux' then
				Rune_ID = 529
			elseif name == 'tenebrae' then
				Rune_ID = 530
			end
			Rune[Rune_ID] = Rune[Rune_ID] + 1
			if Rune[Rune_ID] > 3 then
				Rune[Rune_ID] = 3
			end
			if Rune[Rune_ID] >= 2 then --used to determine obi later in a day/weather hook
				if n == "Ignis" then
					Rune_element = 'Fire'
				elseif n == "Gelus" then
					Rune_element = 'Ice'
				elseif n == "Flabra" then
					Rune_element = 'Wind'
				elseif n == "Tellus" then
					Rune_element = 'Earth'
				elseif n == "Sulpor" then
					Rune_element = 'Thunder'
				elseif n == "Unda" then
					Rune_element = 'Water'
				elseif n == "Lux" then
					Rune_element = 'Light'
				elseif n == "Tenebrae" then
					Rune_element = 'Dark'
				end
				Rune_element_majority = tostring(Rune_element)
			end
		else -- when runes are lost
			if Rune[Rune_ID] == 2 then --if the rune was the majority but not totaling 3, set majority to none
				Rune_element_majority = "None"
				--Otherwise, logically the rune would still be the majority
			end
			Rune[Rune_ID] = Rune[Rune_ID] - 1
			if Rune[Rune_ID] < 0 then --failsafe to ensure we keep our rune values "real"
				Rune[Rune_ID] = 0
			end
		end
	end
	determine_haste_sets()
end

function buff_refresh(n,gain,buff_table)
	local name
    name = string.lower(n)
	if Runes:contains(name) then
		if gain then
			--update the numeric rune majority
			if name == 'Ignis' then
				Rune_ID = 523
			elseif name == 'gelus' then
				Rune_ID = 524
			elseif name == 'flabra' then
				Rune_ID = 525
			elseif name == 'tellus' then
				Rune_ID = 526
			elseif name == 'sulpor' then
				Rune_ID = 527
			elseif name == 'unda' then
				Rune_ID = 528
			elseif name == 'lux' then
				Rune_ID = 529
			elseif name == 'tenebrae' then
				Rune_ID = 530
			end
			Rune[Rune_ID] = Rune[Rune_ID] + 1
			if Rune[Rune_ID] > 3 then
				Rune[Rune_ID] = 3
			end
			if Rune[Rune_ID] >= 2 then --used to determine obi later in a day/weather hook
				if n == "Ignis" then
					Rune_element = 'Fire'
				elseif n == "Gelus" then
					Rune_element = 'Ice'
				elseif n == "Flabra" then
					Rune_element = 'Wind'
				elseif n == "Tellus" then
					Rune_element = 'Earth'
				elseif n == "Sulpor" then
					Rune_element = 'Thunder'
				elseif n == "Unda" then
					Rune_element = 'Water'
				elseif n == "Lux" then
					Rune_element = 'Light'
				elseif n == "Tenebrae" then
					Rune_element = 'Dark'
				end
				Rune_element_majority = tostring(Rune_element)
			end
		else -- when runes are lost
			if Rune[Rune_ID] == 2 then --if the rune was the majority but not totaling 3, set majority to none
				Rune_element_majority = "None"
				--Otherwise, logically the rune would still be the majority
			end
			Rune[Rune_ID] = Rune[Rune_ID] - 1
			if Rune[Rune_ID] < 0 then --failsafe to ensure we keep our rune values "real"
				Rune[Rune_ID] = 0
			end
		end
	end
end

function prep_startup()
	--Streamlines Variables on load
	-- --Redundant, but I like this to be available to 'standardize'
	-- --startup from one location.
	Melee_mode = false
	Burst_mode = false
	Notorious_monster = false
	DW_mode_ind = 2
	
	send_command('@input /echo RUN Loaded, Current Modes::: Tank_mode: ON | Burst_mode: OFF | DW_mode: SW')
end

function pretarget(spell)
	--Locks you in safety set when disabled
	if (spell.type == 'WhiteMagic' or spell.type == 'BlackMagic' or spell.type == 'Ninjutsu') then
		if has_any_buff_of({"terror", "petrification", "sleep", "stun", "silence", "mute"}) then
			cancel_spell()
		end
		if (spell.type == 'JobAbility' and has_any_buff_of({"terror", "petrification", "sleep", "stun", "amnesia"})) then
			cancel_spell()
		end
	end
end

-- Job Control Functions
function precast(spell)
	reset_enfeebling_variables()
	
	if (spell.type == 'WhiteMagic' or spell.type == 'BlackMagic') then
		if (buffactive['Light Arts'] and spell.type == 'WhiteMagic') or 
		(buffactive['Dark Arts'] and spell.type == 'BlackMagic') then
			if buffactive[574] then --if Inspiraiton is active
				if spell.skill == 'Enhancing Magic' then
					equip(sets.FastCast_enhancing_arts_inspiration)
				else
					equip(sets.FastCast_arts_inspiration)
				end
			else
				if spell.skill == 'Enhancing Magic' then
					equip(sets.FastCast_enhancing_arts)
				else
					equip(sets.FastCast_arts)
				end
			end
		elseif (buffactive['Dark Arts'] and spell.type == 'WhiteMagic') or (buffactive['Light Arts'] and spell.type == 'BlackMagic') then
			if buffactive[574] then --if Inspiraiton is active
				if spell.skill == 'Enhancing Magic' then
					equip(sets.FastCast_wrong_arts_inspiration)
				else
					equip(sets.FastCast_enhancing_wrong_arts_inspiration)
				end
			else
				if spell.skill == 'Enhancing Magic' then
					equip(sets.FastCast_enhancing_wrong_arts)
				else
					equip(sets.FastCast_wrong_arts)
				end
			end
		else
			if spell.skill == 'Enhancing Magic' then
				equip(sets.FastCast_enhancing)
			else
				equip(sets.FastCast)
			end
		end
	elseif spell.type == 'Ninjutsu' then
		equip(sets.NinjutsuFastCast)
	elseif spell.type == 'Waltz' then
		equip(sets.Waltz)
	elseif spell.type == "WeaponSkill" then
		if player.tp >= 1000 then
			--handles close-range WS's
			if (spell.target.distance <= 5.5 + spell.target.model_size) then			
				--Greatsword
				if spell.english == "Dimidiation" then
					equip(sets.Dimidiation[sets.WS.index[WS_ind]])
				end
				if spell.english == "Resolution" then
					equip(sets.Resolution[sets.WS.index[WS_ind]])
				end
				if spell.english == "Ground Strike" then
					equip(sets.GroundStrike[sets.WS.index[WS_ind]])
				end
				if spell.english == "Shockwave" then
					equip(sets.Shockwave)
				end
				
				--Sword
				if spell.english == "Savage Blade" then
					equip(sets.SavageBlade[sets.WS.index[WS_ind]])
				end
				if spell.english == "Requiescat" then
					equip(sets.Requiescat[sets.WS.index[WS_ind]])
				end
				if spell.english == "Flat Blade" then
					equip(sets.FlatBlade)
				end
				if spell.english == "Sanguine Blade" then
					equip(sets.SanguineBlade[sets.WS.index[WS_ind]])
					if world.day_element == "Dark" or world.weather_element == "Dark" then
						equip(sets.obi)
					end
				end
				
				--Greataxe
				if spell.english == "Upheaval" then
					equip(sets.Upheaval[sets.WS.index[WS_ind]])
				end
				if spell.english == "Steel Cyclone" then
					equip(sets.SteelCyclone[sets.WS.index[WS_ind]])
				end
				if spell.english == "Fell Cleave" then
					equip(sets.FellCleave[sets.WS.index[WS_ind]])
				end
				if spell.english == "Armor Break" then
					equip(sets.ArmorBreak)
				end
				
				--Axe
				if spell.english == "Decimation" then
					equip(sets.Decimation[sets.WS.index[WS_ind]])
				end
				if spell.english == "Ruinator" then
					equip(sets.Ruinator[sets.WS.index[WS_ind]])
				end
				
				--Generic WS's
				if spell.english == "Hard Slash" or 
						spell.english == "Power Slash" or 
						spell.english == "Fast Blade" or
						spell.english == "Circle Blade"
				then
					equip(sets.OtherWS[sets.WS.index[WS_ind]])
				end
			else
				cancel_spell()
				send_command("@input /echo Canceled " .. spell.name .. " " .. spell.target.name .. " is Too Far")
			end
			
		end
	elseif spell.english == "Elemental Sforzo" then
		equip(
			set_combine(
				set.Enmity,
				sets.Sforzo
			)
		)
	elseif spell.english == 'Vallation' then
		equip(
			set_combine(
				set.Enmity,
				sets.Vallation
			)
		)
	elseif spell.english == 'Valliance' then
		equip(
			set_combine(
				set.Enmity,
				sets.Valliance
			)
		)
	elseif spell.english == 'Swordplay' then
		equip(
			set_combine(
				set.Enmity,
				sets.Swordplay
			)
		)
	elseif spell.english == 'Gambit' then
		equip(
			set_combine(
				set.Enmity,
				sets.Gambit
			)
		)
	elseif spell.english == 'Rayke' then
		equip(
			set_combine(
				set.Enmity,
				sets.Rayke
			)
		)
	elseif spell.english == 'Battuta' then
		equip(
			set_combine(
				set.Enmity,
				sets.Battuta
			)
		)
	elseif spell.english == 'Liement' then
		equip(
			set_combine(
				set.Enmity,
				sets.Liement
			)
		)
	elseif spell.english == 'One For All' then
		equip(
			set_combine(
				set.Enmity,
				sets.OneForAll
			)
		)
	elseif spell.english == 'Vivacious Pulse' then
		equip(sets.Pulse)
		if Rune[523] > 1 then
			equip(sets.PulseType.Ignis)
		elseif Rune[524] > 1 then
			equip(sets.PulseType.Gelus)
		elseif Rune[525] > 1 then
			equip(sets.PulseType.Flabra)
		elseif Rune[526] > 1 then
			equip(sets.PulseType.Tellus)
		elseif Rune[527] > 1 then
			equip(sets.PulseType.Sulpor)
		elseif Rune[528] > 1 then
			equip(sets.PulseType.Unda)
		elseif Rune[529] > 1 then
			equip(sets.PulseType.Lux)
		end
	elseif Enmity_actions:contains(spell.english) then  
		equip(sets.Enmity)
	elseif spell.english == "Swipe" or spell.english == "Lunge" then  
		if Burst_mode == true then
			equip(sets.SwordMagic.MB)
			if (Rune_element_majority == world.day_element or Rune_element_majority == world.weather_element) then
				equip(sets.obi)
			end
		else
			equip(sets.SwordMagic.Normal)
			if (Rune_element_majority == world.day_element or Rune_element_majority == world.weather_element) then
				equip(sets.obi)
			end
		end
		if Rune[530] > 1 then --if the majority of runes are tenebrae
			equip(sets.SwordMagic.Dark)
			if (Rune_element_majority == world.day_element or Rune_element_majority == world.weather_element) then
				equip(sets.obi)
			end
		end
		if spell.english == 'Lunge' then --reset all runes to 0
			Rune[523] = 0 --Ignis
			Rune[524] = 0 --Gelus
			Rune[525] = 0 --Flabra
			Rune[526] = 0 --Tellus
			Rune[527] = 0 --Sulpor
			Rune[528] = 0 --Unda
			Rune[529] = 0 --Lux
			Rune[530] = 0 --Tenebrae
			--This may need to be expanded on if the buff_change function does not catch expending runes for swipe
			--This failsafe for lunge is more 'simple' to apply for now
		end
	end
	
	--Hooks for JA/WS Obi swaps
	--This is redundant with the statments above, but covers a list 
	--that can be edited if user wants to remove some for any reason
	if (Elemental_WS:contains(spell.english))
		and (spell.element == world.day_element or spell.element == world.weather_element)
	then
		equip(sets.obi)
	end
end

function midcast(spell, buff, act)
	--Handles generic recasts as a fallback
	if (spell.type == 'WhiteMagic' or spell.type == 'BlackMagic' or spell.type == 'Ninjutsu' or spell.type == 'Trust') then
		equip(sets.FastRecast)
	end
	
	
	--Enfeebling Magic
	if Enfeebles:contains(spell.english) or spell.english == 'Repose' then 
		equip(sets.Enfeebling)
	end	

	
	--Enhancing Magic
	if Skill_spells:contains(spell.english) then
		equip(sets.Enhancing_skill)
	elseif Duration_spells:contains(spell.english) then
		equip(sets.Enhancing_duration)
	elseif Regen_spells:contains(spell.english) then
		equip(sets.Enhancing_regen)
	elseif Barspells:contains(spell.english) then
		if buffactive['Light Arts'] then
			equip(sets.Enhancing_barspells)
		else
			equip(ets.Enhancing_barspells_wrong_arts)
		end
	elseif spell.english == 'Aquaveil' then
		equip(sets.Enhancing_aquaveil)
	elseif spell.english == 'Stoneskin' then
		equip(sets.Enhancing_stoneskin)
	elseif spell.english == 'Refresh' then
		if buffactive['Accession'] or spell.target.type == 'SELF' then
			equip(sets.Enhancing_refresh)			
		else
			equip(sets.Enhancing_refresh_other)
		end
	elseif spell.english == 'Phalanx' then
		if buffactive['Accession'] then
			equip(sets.Enhancing_phalanx_other)
		else
			equip(sets.Enhancing_phalanx)
		end
	end


	--Cures / Cursna / Banish Effect
	if Cure_spells:contains(spell.english) then
		equip(sets.Cure)
	end
	
	
	--Enmity
	if Enmity_spells:contains(spell.english) then
		equip(sets.Enmity_cast)
	end
	if SIR_spells:contains(spell.english) then
		equip(sets.Enmity_SIR)
	end

	
	--Nukes
	if Nuke_spells:contains(spell.english) then
		equip(sets.Elemental)
		if (spell.element == world.day_element or spell.element == world.weather_element) then
			equip(sets.obi)
		end
	elseif Helix_spells:contains(spell.english) then
		equip(sets.Elemental)
		if spell.english == 'Noctohelix' then
			equip(sets.Elemental_noctohelix)
		end
	end

	
	--Dark Magic
	if (spell.english == "Drain" or spell.english == "Aspir") then
		equip(sets.Aspir)
	end
	
	
	--Spell Hooks for Obi
	--Helix spells do not gain benefit from Obi (bonus is innate)
	if (Nuke_spells:contains(spell.english) or
		(spell.english == "Drain" or spell.english == "Aspir")) 
		and 
		(spell.element == world.day_element or spell.element == world.weather_element) 
	then
		equip(sets.obi)
	end
end

function aftercast(spell)
	if spell.skill == "Enfeebling Magic" and (spell.english ~= "Dispel" and spell.english ~= "Dispelga") then
		if not spell.interrupted then
			set_enfeebling_duration_timer(spell)
		end
	end
	determine_haste_sets()
end

function status_change(new, old)
	if new ~= 'Engaged' then
		determine_haste_sets()
	else
		determine_haste_sets()
	end
end

function job_pet_change(petparam, gain)
	if gain then
		determine_haste_sets()
	else
		determine_haste_sets()
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
		send_command("unbind @F8")
		send_command("@input /echo SJ is non-DW")
	end
	determine_equip_set()
end

function determine_equip_set()
	if player.status ~= 'Engaged' then
		idle_set()
	else 
		engaged_set()
	end
end

function idle_set()
	equip(sets.Idle[sets.Idle.index[Idle_ind]])
	if buffactive['Pflug'] then
		equip(sets.Idle.Pflug)
	end
end

function engaged_set()
	if Melee_mode == true then
		if player.equipment.main == 'Epeolatry' and buffactive["Aftermath: Lv.3"] then
			equip(	
				set_combine(
					sets.AM3[sets.AM3.index[TP_ind]],
					sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]]
				)
			)
		else
			equip(	
				set_combine(
					sets.TP[sets.TP.index[TP_ind]].Other,
					sets.TP[sets.TP.index[TP_ind]][sets.SJ.index[SJ_ind]]["Haste_"..hasteVal],
					sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]]
				)
			)

		end
	else
		equip(	
			set_combine(
				sets.Tank[sets.Tank.index[Tank_ind]].Other,
				sets.Tank[sets.Tank.index[Tank_ind]][sets.SJ.index[SJ_ind]]["Haste_"..hasteVal],
				sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]]
			)
		)
	end
	if buffactive['Pflug'] then
		equip(sets.Pflug)
	end
end

function self_command(command)
	if command == "toggle TP set" then
		if Melee_mode == true then
			TP_ind = TP_ind + 1
			if TP_ind > #sets.TP.index then
				TP_ind = 1
			end
			send_command("@input /echo <----- TP Set changed to " .. sets.TP.index[TP_ind] .. " ----->")
		else
			Tank_ind = Tank_ind + 1
			if Tank_ind > #sets.Tank.index then
				Tank_ind = 1
			end
			send_command("@input /echo <----- Tank Set changed to " .. sets.Tank.index[Tank_ind] .. " ----->")
		end
		determine_haste_sets()
	elseif command == "toggle TP set reverse" then
		if Melee_mode == true then
			TP_ind = TP_ind - 1
			if TP_ind < 1 then
				TP_ind = #sets.TP.index
			end
			send_command("@input /echo <----- TP Set changed to " .. sets.TP.index[TP_ind] .. " ----->")
		else
			Tank_ind = Tank_ind - 1
			if Tank_ind < 1 then
				Tank_ind = #sets.Tank.index
			end
			send_command("@input /echo <----- Tank Set changed to " .. sets.Tank.index[Tank_ind] .. " ----->")
		end
		determine_haste_sets()
	elseif command == "toggle Tank sets" then
		Tank_ind = Tank_ind + 1
		if Tank_ind > #sets.Tank.index then
			Tank_ind = 1
		end
		send_command("@input /echo <----- Tank Set changed to " .. sets.Tank.index[TP_ind] .. " ----->")
	elseif command == "toggle Tank sets reverse" then
		Tank_ind = Tank_ind - 1
		if Tank_ind < 1 then
			Tank_ind = #sets.Tank.index
		end
		send_command("@input /echo <----- Tank Set changed to " .. sets.Tank.index[Tank_ind] .. " ----->")
	elseif command == "toggle WS set" then
		WS_ind = WS_ind + 1
		if WS_ind > #sets.WS.index then
			WS_ind = 1
		end
		send_command("@input /echo <----- WS Set changed to " .. sets.WS.index[WS_ind] .. " ----->")
		determine_haste_sets()
	elseif command == "toggle WS set reverse" then
		WS_ind = WS_ind - 1
		if WS_ind < 1 then
			WS_ind = #sets.WS.index
		end
		send_command("@input /echo <----- WS Set changed to " .. sets.WS.index[WS_ind] .. " ----->")
		determine_haste_sets()	
	elseif command == "toggle Melee Weapon set" then
		Wm_ind = Wm_ind + 1
		if Wm_ind > #sets.Weapon_melee.index then
			Wm_ind = 1
		end
		send_command("@input /echo <----- Melee weapon changed to " .. sets.Weapon_melee.index[Wm_ind] .. " ----->")
		determine_haste_sets()
	elseif command == "toggle DW set" then
		DW_mode_ind = DW_mode_ind + 1
		
		if DW_mode_ind > #sets.DW_mode.index then
			DW_mode_ind = 1			
		end
		if (player.sub_job == 'DNC' and DW_mode_ind == 1) then
			SJ_ind = 3
		elseif (player.sub_job == 'NIN' and DW_mode_ind == 1) then
			SJ_ind = 2
		else
			SJ_ind = 1			
		end
		send_command("@input /echo <----- DW status changed to " .. sets.DW_mode.index[DW_mode_ind] .. " ----->")
		determine_haste_sets()
	elseif command == "toggle Idle set" then
		Idle_ind = Idle_ind + 1
		if Idle_ind > #sets.Idle.index then
			Idle_ind = 1		
		end
		send_command("@input /echo <----- Idle Set changed to " .. sets.Idle.index[Idle_ind] .. " ----->")
		determine_haste_sets()
	elseif command == "toggle Idle set reverse" then
		Idle_ind = Idle_ind - 1
		if Idle_ind < 1 then
			Idle_ind = #sets.Idle.index
		end
		send_command("@input /echo <----- Idle Set changed to " .. sets.Idle.index[Idle_ind] .. " ----->")
		determine_haste_sets()
	elseif command == "toggle Weapon set" then
		Wm_ind = Wm_ind + 1	
		if Wm_ind > #sets.Weapon_melee.index then
			Wm_ind = 1			
		end
		send_command("@input /echo <----- Weapon set changed to " .. sets.Weapon_melee.index[Wm_ind] .. " ----->")
		determine_haste_sets()
	elseif command == "toggle Weapon set reverse" then
		Wm_ind = Wm_ind - 1
		if Wm_ind < 1 then
			Wm_ind = #sets.Weapon_melee.index
		end
		send_command("@input /echo <----- Weapon Set changed to " .. sets.Weapon_melee.index[Wm_ind] .. " ----->")
		determine_haste_sets()
	elseif command == "toggle Burst Mode" then
		if Burst_mode == false then
			Burst_mode = true
			send_command("@input /echo <----- Burst Mode ON ----->")
		else
			Burst_mode = false
			send_command("@input /echo <----- Burst Mode OFF ----->")
		end
	elseif command == "toggle Melee Mode" then
		if Melee_mode == false then
			Melee_mode = true
			send_command("@input /echo <----- Melee Mode ----->")
		else
			Melee_mode = false
			send_command("@input /echo <----- Tank Mode ----->")
		end
		determine_haste_sets()
	elseif command == "toggle Haste Mode" then
		if Soul_voice == false then
			if Haste_II == false then
				Haste_II = true
				send_command("@input /echo <----- Haste Mode: Hi ----->")
				determine_haste_sets()
			elseif Haste_II == true then
				Haste_II = false
				Soul_voice = true
				send_command("@input /echo <----- Haste Mode: SV/Bolster ----->")
				determine_haste_sets()
			end
		elseif Soul_voice == true then
			Soul_voice = false
			send_command("@input /echo <----- Haste Mode: Low ----->")
			determine_haste_sets()
		end
		--Should be unreachable code (intentional)
		if (Soul_voice == true and Haste_II == true) then -- to prevent it from getting stuck in some unforseen way (packet drops, etc)
			Soul_voice = false
			Haste_II = false
			send_command("@input /echo <----- Haste Mode: Reset | Debug: Now All Haste Variables FALSE ----->")
			determine_haste_sets()
		end
	end
end


------------------------------------------------------------------------------
------------------------------------------------------------------------------

function determine_haste_sets()
	-- assuming +8 for marches (HM has +4)
    -- Haste (white magic) is 14.65% (15%)
	-- Haste II[511] (white magic) is 29.98% (30%)
    -- Haste Samba (Sub) 5%
    -- Haste (Merited DNC) 10% (part of the Haste II rules)
	-- Honor March is now considered in Haste II
	-- Honor March +0/+1/+2/+3/+4            ||  12.30% /13.48% / 14.65% / 15.82% / 16.99%
    -- Victory March +0/+3/+4/+5/+6/+7/+8    ||  15.92% /17.48% / 19.04% / 20.61% / 22.27% / 23.83% / 25.39% / 27.05% / 28.61%
    -- Advancing March +0/+3/+4/+5/+6/+7/+8  ||  10.55% /11.52% / 12.60% / 13.67% / 14.75% / 15.82% / 16.60% / 17.87% / 18.95%
    -- Embrava 30% with 500 enhancing skill
    -- buffactive[580] = geo haste - 30% (does not assume idris since it will not cap on its own w/o rare circumstance i.e /dnc)
    -- buffactive[33] = regular haste - 15%
    -- buffactive[604] = mighty guard - 15%
    -- Haste_mode:
	-- -- if: 		Soul Voice, assumes Soul Voice buffs and Bolster
	-- -- elseif: 	Haste II, assumes RDM or SMN haste
	-- -- else: 	Low, assumes NQ haste and NQ BRD songs 
	-- WIN+F9 toggles
	
	if Soul_voice == true then -- for both SV and bolster and assumes high-tier haste
		hasteVal = math.min((buffmath(580) * 2) + buffmath(228) + (buffmath(33) * 2) + determine_marches() + buffmath(604), 45) + (buffmath(370) * 2)
	elseif Haste_II == true then
		hasteVal = math.min(buffmath(580) + buffmath(228) + (buffmath(33) * 2) + determine_marches() + buffmath(604), 45) + (buffmath(370) * 2)
	else	
		hasteVal = math.min(buffmath(580) + buffmath(228) + buffmath(33) + determine_marches() + buffmath(604), 45) + buffmath(370) 
	end
	determine_equip_set()
end


function determine_marches()
	if (buffactive.march == 2 and (Soul_voice == true or Haste_II == true)) then -- checks for soulvoice active of high-haste toggles (haste I vs haste II)
		return 45 -- assumes capped haste
	elseif ((buffactive[214] and Soul_voice == true) or buffactive.march == 2) then
		return 30
	end
	return buffmath(214) -- assumes single march is HM
end


function buffmath(buffID)
 --Lookup haste value for buffID and return it's haste value or 0 otherwise.
	if buffactive[buffID] ~= nil then
		return hastevalue[buffID]
	else
		return 0
	end
end

------------------------------------------------------------------------------
------------------------------------------------------------------------------
	

--Duration Formula:
-- -- floor[((Base Duration × Saboteur) + (6s × RDM Group 2 Merit Point Level) + (3s × RDM Relic Head Group 2 Merit Point Level Augment) 
-- -- + RDM Enfeebling Job Points + RDM Stymie Job Points + Gear that list Seconds) × (Augments Composure Bonus) × (Duration listed on Gear)
-- -- × (Duration Augments on Gear)] = Duration
-- Base
-- Category2
-- Category2Head
-- JobGiftsAndGear (gear is only gear displaying seconds)
-- ComposureBonus
-- GearDuration
-- GearDurationAugments

function reset_enfeebling_variables()
	Category2 = 6.00 * EnfeeblingDurationMerits
	Category2Head = 3.00 * EnfeeblingDurationMerits
	Composure = 1.00
	Stymie = 0.00
	base = 0.00
	FlatGearBonus = 0.00
	GearAugments = 1.00
	MultiplicativeGearBonus = 1.00
	DurationTotal = 0.00		
end

function create_custom_timer(DurationTotal, spell)
	send_command('timers create "'.. spell.english .. ': ' .. spell.target.name .. '" ' .. DurationTotal .. ' down spells/01015.png')
end

function set_enfeebling_duration_timer(spell, buff)
	if duration30:contains(spell.english) then
		base = 30.00
	end
	if duration60:contains(spell.english) then
		base = 60.00
	end
	if duration90:contains(spell.english) then
		base = 90.00
	end
	if duration120:contains(spell.english) then
		base = 120.00
	end
	if duration180:contains(spell.english) then
		base = 180.00
	end
	if duration300:contains(spell.english) then
		base = 300.00
	end
	if buffactive['Saboteur'] then -- need to find a way to distinguish NMs (currently uses a toggle; Default: NM)
		if Notorious_monster == false then
			if player.equipment.hands == "Lethargy Gantherots" or player.equipment.hands == "Lethargy Gantherots +1" then
				base = base * 2.12
			else
				base = base * 2.00
			end
		else
			if player.equipment.hands == "Lethargy Gantherots" or player.equipment.hands == "Lethargy Gantherots +1" then
				base = base * 1.37
			else
				base = base * 1.25
			end
		end
	end
	--5/5 bonus
	if LethargySet:contains(player.equipment.head) and
		LethargySet:contains(player.equipment.body) and
		LethargySet:contains(player.equipment.hands) and
		LethargySet:contains(player.equipment.legs) and
		LethargySet:contains(player.equipment.feet)
	then
		Composure = 1.50
	--2/5 bonus
	elseif (
		(LethargySet:contains(player.equipment.head) and
		(LethargySet:contains(player.equipment.body) or
		LethargySet:contains(player.equipment.hands) or
		LethargySet:contains(player.equipment.legs) or
		LethargySet:contains(player.equipment.feet)))
		or
		(LethargySet:contains(player.equipment.body) and
		(LethargySet:contains(player.equipment.head) or
		LethargySet:contains(player.equipment.hands) or
		LethargySet:contains(player.equipment.legs) or
		LethargySet:contains(player.equipment.feet)))
		or
		(LethargySet:contains(player.equipment.hands) and
		(LethargySet:contains(player.equipment.head) or
		LethargySet:contains(player.equipment.body) or
		LethargySet:contains(player.equipment.legs) or
		LethargySet:contains(player.equipment.feet)))
		or
		(LethargySet:contains(player.equipment.legs) and
		(LethargySet:contains(player.equipment.head) or
		LethargySet:contains(player.equipment.body) or
		LethargySet:contains(player.equipment.hands) or
		LethargySet:contains(player.equipment.feet)))
		or
		(LethargySet:contains(player.equipment.feet) and
		(LethargySet:contains(player.equipment.head) or
		LethargySet:contains(player.equipment.body) or
		LethargySet:contains(player.equipment.hands) or
		LethargySet:contains(player.equipment.legs)))
		)
	then
		Composure = 1.10
	--3/5 bonus
	elseif (
		((LethargySet:contains(player.equipment.head) and LethargySet:contains(player.equipment.body)) and
		(LethargySet:contains(player.equipment.hands) or
		LethargySet:contains(player.equipment.legs) or
		LethargySet:contains(player.equipment.feet)))
		or
		((LethargySet:contains(player.equipment.body) and LethargySet:contains(player.equipment.hands)) and
		(LethargySet:contains(player.equipment.head) or
		LethargySet:contains(player.equipment.legs) or
		LethargySet:contains(player.equipment.feet)))
		or
		((LethargySet:contains(player.equipment.hands) and LethargySet:contains(player.equipment.legs)) and
		(LethargySet:contains(player.equipment.head) or
		LethargySet:contains(player.equipment.body) or
		LethargySet:contains(player.equipment.feet)))
		or
		((LethargySet:contains(player.equipment.legs) and LethargySet:contains(player.equipment.feet)) and
		(LethargySet:contains(player.equipment.head) or
		LethargySet:contains(player.equipment.body) or
		LethargySet:contains(player.equipment.hands)))
		or
		((LethargySet:contains(player.equipment.feet) and LethargySet:contains(player.equipment.head)) and
		(LethargySet:contains(player.equipment.body) or
		LethargySet:contains(player.equipment.hands) or
		LethargySet:contains(player.equipment.legs)))
		or
		((LethargySet:contains(player.equipment.head) and LethargySet:contains(player.equipment.hands)) and
		(LethargySet:contains(player.equipment.body) or
		LethargySet:contains(player.equipment.legs) or
		LethargySet:contains(player.equipment.feet)))
		or
		((LethargySet:contains(player.equipment.head) and LethargySet:contains(player.equipment.legs)) and
		(LethargySet:contains(player.equipment.body) or
		LethargySet:contains(player.equipment.hands) or
		LethargySet:contains(player.equipment.feet)))
		or
		((LethargySet:contains(player.equipment.body) and LethargySet:contains(player.equipment.feet)) and
		(LethargySet:contains(player.equipment.head) or
		LethargySet:contains(player.equipment.hands) or
		LethargySet:contains(player.equipment.legs)))
		or
		((LethargySet:contains(player.equipment.hands) and LethargySet:contains(player.equipment.feet)) and
		(LethargySet:contains(player.equipment.head) or
		LethargySet:contains(player.equipment.body) or
		LethargySet:contains(player.equipment.legs)))
		) 
	then
		Composure = 1.20
	--4/5 bonus	
	elseif (
		((LethargySet:contains(player.equipment.head) and LethargySet:contains(player.equipment.body) and LethargySet:contains(player.equipment.hands)) and
		(LethargySet:contains(player.equipment.legs) or
		LethargySet:contains(player.equipment.feet)))
		or
		((LethargySet:contains(player.equipment.body) and LethargySet:contains(player.equipment.hands) and LethargySet:contains(player.equipment.legs)) and
		(LethargySet:contains(player.equipment.head) or
		LethargySet:contains(player.equipment.feet)))
		or
		((LethargySet:contains(player.equipment.hands) and LethargySet:contains(player.equipment.legs) and LethargySet:contains(player.equipment.feet)) and
		(LethargySet:contains(player.equipment.head) or
		LethargySet:contains(player.equipment.body)))
		or
		((LethargySet:contains(player.equipment.legs) and LethargySet:contains(player.equipment.feet) and LethargySet:contains(player.equipment.head)) and
		(LethargySet:contains(player.equipment.body) or
		LethargySet:contains(player.equipment.hands)))
		or
		((LethargySet:contains(player.equipment.feet) and LethargySet:contains(player.equipment.head) and LethargySet:contains(player.equipment.body)) and
		(LethargySet:contains(player.equipment.hands) or
		LethargySet:contains(player.equipment.legs)))
		or
		((LethargySet:contains(player.equipment.head) and LethargySet:contains(player.equipment.hands) and LethargySet:contains(player.equipment.feet)) and
		(LethargySet:contains(player.equipment.body) or
		LethargySet:contains(player.equipment.legs)))
		or
		((LethargySet:contains(player.equipment.head) and LethargySet:contains(player.equipment.hands) and LethargySet:contains(player.equipment.legs)) and
		(LethargySet:contains(player.equipment.body) or
		LethargySet:contains(player.equipment.feet)))
		or
		((LethargySet:contains(player.equipment.body) and LethargySet:contains(player.equipment.legs) and LethargySet:contains(player.equipment.feet)) and
		(LethargySet:contains(player.equipment.head) or
		LethargySet:contains(player.equipment.hands)))
		or
		((LethargySet:contains(player.equipment.body) and LethargySet:contains(player.equipment.hands) and LethargySet:contains(player.equipment.feet)) and
		(LethargySet:contains(player.equipment.head) or
		LethargySet:contains(player.equipment.legs)))
		or
		((LethargySet:contains(player.equipment.head) and LethargySet:contains(player.equipment.body) and LethargySet:contains(player.equipment.legs)) and
		(LethargySet:contains(player.equipment.hands) or
		LethargySet:contains(player.equipment.feet)))
		)
	then
		composure = 1.35
	end
	if player.equipment.neck == "Dls. Torque" then
		GearAugments = GearAugments + 0.15
	elseif player.equipment.neck == "Dls. Torque +1" then
		GearAugments = GearAugments + 0.20
	elseif player.equipment.neck == "Dls. Torque +2" then
		GearAugments = GearAugments + 0.25
	end
	if (player.equipment.left_ear == "Snotra Earring" or player.equipment.right_ear == "Snotra Earring") then
		MultiplicativeGearBonus = MultiplicativeGearBonus + 0.10
	end
	if player.equipment.hands == "Regal Cuffs" then
		MultiplicativeGearBonus = MultiplicativeGearBonus + 0.20
	end
	if (player.equipment.left_ring == "Kishar Ring" or player.equipment.right_ring == "Kishar Ring") then
		MultiplicativeGearBonus = MultiplicativeGearBonus + 0.10
	end
	if player.equipment.waist == "Obstin. Sash" then
		MultiplicativeGearBonus = MultiplicativeGearBonus + 0.05
	end
	if buffactive['Stymie'] then
		Stymie = StymieDurationGifts
	end
	if player.equipment.head == "Vitiation Chapeau" or 
		player.equipment.head == "Vitiation Chapeau +1" or 
		player.equipment.head == "Vitiation Chapeau +2" or 
		player.equipment.head == "Vitiation Chapeau +3" 
	then
		Category2Head = 3.00 * EnfeeblingDurationMerits
	end
	
	DurationTotal = (base + Category2 + Category2Head + EnfeeblingDurationGifts + Stymie + FlatGearBonus) * Composure * MultiplicativeGearBonus * GearAugments	
	create_custom_timer(DurationTotal, spell)
end


function has_any_buff_of(buff_set)
    for i,v in pairs(buff_set) do
        if buffactive[v] ~= nil then 
			return true 
		end
    end
end