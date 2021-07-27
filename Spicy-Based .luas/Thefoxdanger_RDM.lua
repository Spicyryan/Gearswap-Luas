-- 
-- @author Thefoxdanger of Asura
-- RDM.lua v1.0
--
-- 
-- Intermediate RDM lua created to streamline play with as few toggles and other things to press as possible. Designed to be similar in 
-- fuction to the rest of Spicyryan's luas in the Github However, this is a job that naturally has a lot of levers to throw, so take time 
-- to get used to the keybinds below. It also has A LOT of gear fields, which is for a good reason. Make sure to read over comments, reviewing 
-- the current gear in slots to understand what goes there if you don't have my exact gearsets. Everything is very clearly labeled, and if 
-- a set seems to be a duplicate, check that it isn't a version that takes Melee_mode into account.
--
-- I plan to maintain this lua as a template, however if you get a hold of this it is YOUR responsibility to understand its use
-- and to troubleshoot issues within. I will not fix your lua if I do not know you (and probably wont if I do know you). 
-- Have fun~!
-- 	

	
--binds--
-- 4 sets you will toggle frequently
send_command("bind F9 gs c toggle TP set") -- F9 switches between melee sets
send_command("bind !F9 gs c toggle TP set reverse") -- Alt+F9 switches between melee sets in reverse

send_command("bind F10 gs c toggle Range set") -- F10 switches between range sets
send_command("bind !F10 gs c toggle Range set reverse") -- Alt+F10 switches between range sets in reverse

send_command("bind F11 gs c toggle WS set") -- F11 switches between WS sets
send_command("bind !F11 gs c toggle WS set reverse") -- Alt+F11 switches between WS sets in reverse

send_command("bind F12 gs c toggle Idle set") -- F12 switches between idle sets
send_command("bind !F12 gs c toggle Idle set reverse") -- Alt+F12 switches between idle sets in reverse

-- less frequently changed/'setup' toggles
send_command("bind @q gs c toggle Melee Weapon set") -- WIN+Q swap melee weapon combinations (defaults to Sacro Bulwark in offhand when mage mode)
send_command("bind @e gs c toggle Range Weapon set") -- WIN+E swap for Ullr use in melee/WS sets

send_command("bind !f8 gs c toggle DW set") -- Alt+F8 swap between DualWield and SingleWield for melee sets (can only be toggled if DW is available)
send_command("bind @f8 gs c toggle Melee Mode") -- WIN+F8 swap between mage and melee modes (Determines if weapons swap with casts)
send_command("bind !` gs c toggle Burst Mode") -- Alt+` switches Magic Burst sets on/off
send_command("bind @W gs c toggle Weapon Lock") -- WIN+W manually overrides and prevents swaps for main/sub/range/ammo slots
send_command("bind != gs c toggle Saboteur Mode") -- Alt+= toggles Saboteur Mode between NM and Regular mobs to determine duration potencies


--numpad controls for WS's
-- -- CTRL key for Sword WS
send_command('bind ^numpad0 @input /ws "Savage Blade" <t>')
send_command('bind ^numpad1 @input /ws "Death Blossom" <t>')
send_command('bind ^numpad2 @input /ws "Requiescat" <t>')
send_command('bind ^numpad3 @input /ws "Chant du Cygne" <t>')
send_command('bind ^numpad4 @input /ws "Sanguine Blade" <t>')
send_command('bind ^numpad5 @input /ws "Seraph Blade" <t>')
send_command('bind ^numpad6 @input /ws "Knights of Round" <t>')
send_command('bind ^numpad7 @input /ws "Flat Blade" <t>')
send_command('bind ^numpad8 @input /ws "Shining Blade" <t>')
send_command('bind ^numpad9 @input /ws "Red Lotus Blade" <t>')
-- -- Alt key for Club / Dagger / Ranged WS
send_command('bind !numpad0 @input /ws "Black Halo" <t>')
send_command('bind !numpad1 @input /ws "Seraph Strike" <t>')
send_command('bind !numpad2 @input /ws "Shining Strike" <t>')
send_command('bind !numpad3 @input /ws "True Strike" <t>')
send_command('bind !numpad4 @input /ws "Evisceration" <t>')
send_command('bind !numpad5 @input /ws "Aeolian Edge" <t>')
send_command('bind !numpad6 @input /ws "Energy Drain" <t>')
send_command('bind !numpad7 @input /ws "Flaming Arrow" <t>')
send_command('bind !numpad8 @input /ws "Empyreal Arrow" <t>')
send_command('bind !numpad9 @input /ws "Moonlight" <t>')

	
function file_unload()
	--unbinds when job unloads--
	send_command("unbind F9")
	send_command("unbind !F9")
	
	send_command("unbind F10")
	send_command("unbind !F10")

	send_command("unbind F12")
	send_command("unbind !F12")	

	send_command("unbind @q")
	send_command("unbind @e")
	
	send_command("unbind !f8")
	send_command("unbind @f8")
	send_command("unbind !`")
	send_command("unbind @W")
	send_command("unbind !=")
	
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
	set_macros(1,1)
	---Set Lockstyle Here
	set_style(17)	
	
	
	--Gear Sets Start Here
	--Augmented Gear
	Grio = {}
	Grio.Skill = { name="Grioavolr", augments={'Enfb.mag. skill +16','Mag. Acc.+17',}}
	
	Colada = {}
	Colada.Enh = { name="Colada", augments={'Enh. Mag. eff. dur. +4','MND+5','Mag. Acc.+8',}}
	
	Sucellos = {}
	Sucellos.TP = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	Sucellos.Enfeeb = { name = "Sucellos's Cape", augments = { 'MND+20','Mag. Acc+10','Haste+9%','Mag. Acc+20/Mag. Dmg.+20' } }
	Sucellos.WSD = { name = "Sucellos's Cape", augments = { 'STR+20','Accuracy+20 Attack+20','Weapon Skill Damage +10%' } }
	Sucellos.Nuke = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}
	Sucellos.FC = { name="Sucellos's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%'}}
	Sucellos.DW = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Mag. Acc.+10','"Dual Wield"+10','Phys. dmg. taken-10%',}}
	
	TaeonHead ={}
	TaeonHead.Phalanx = { name="Taeon Chapeau", augments={'Accuracy+21','Spell interruption rate down -10%','Phalanx +3',}}
	
	TaeonBody = {}
	TaeonBody.Phalanx = { name="Taeon Tabard", augments={'Mag. Evasion+10','Spell interruption rate down -10%','Phalanx +3',}}
	
	TaeonHands = {}
	TaeonHands.Phalanx = { name="Taeon Gloves", augments={'Mag. Evasion+7','Spell interruption rate down -10%','Phalanx +3',}}
	
	TaeonLegs = {}
	TaeonLegs.Phalanx = { name="Taeon Tights", augments={'"Mag.Atk.Bns."+7','Spell interruption rate down -10%','Phalanx +3',}}
	
	TaeonFeet = {}
	TaeonFeet.Phalanx = { name="Taeon Boots", augments={'"Mag.Atk.Bns."+9','Spell interruption rate down -10%','Phalanx +3',}}
	
	TelchineHead = {}
	TelchineHead.Enh = { name="Telchine Cap", augments={'Mag. Evasion+23','"Conserve MP"+3','Enh. Mag. eff. dur. +10',}}
	
	TelchineBody = {}
	TelchineBody.Enh = { name="Telchine Chas.", augments={'Mag. Evasion+11','"Conserve MP"+4','Enh. Mag. eff. dur. +10',}}
	
	TelchineHands = {}
	TelchineHands.Enh = { name="Telchine Gloves", augments={'Mag. Evasion+17','"Conserve MP"+4','Enh. Mag. eff. dur. +10',}}
	
	TelchineLegs = {}
	TelchineLegs.Enh = { name="Telchine Braconi", augments={'Mag. Evasion+13','"Conserve MP"+4','Enh. Mag. eff. dur. +10',}}
	
	TelchineFeet = {}
	TelchineFeet.Enh = { name="Telchine Pigaches", augments={'Mag. Evasion+25','"Conserve MP"+4','Enh. Mag. eff. dur. +10',}}
	
	MerlinicHead = {}
	MerlinicHead.aspir = { name="Merlinic Hood", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','"Drain" and "Aspir" potency +9','MND+10','Mag. Acc.+9','"Mag.Atk.Bns."+8',}}
	
	MerlinicBody = {}
	
	
	MerlinicHands = {}
	MerlinicHands.aspir = { name="Merlinic Dastanas", augments={'Mag. Acc.+20','"Drain" and "Aspir" potency +7','CHR+1','"Mag.Atk.Bns."+12',}}
	
	MerlinicLegs = {}
	MerlinicLegs.nuke = { name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+29','INT+10','Accuracy+5 Attack+5','Mag. Acc.+20 "Mag.Atk.Bns."+20',}}
	MerlinicLegs.aspir = { name="Merlinic Shalwar", augments={'Mag. Acc.+19','"Drain" and "Aspir" potency +9','INT+2','"Mag.Atk.Bns."+4',}}
	MerlinicLegs.refresh = { name="Merlinic Shalwar", augments={'Accuracy+25','Accuracy+1 Attack+1','"Refresh"+2','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}

	MerlinicFeet = {}
	MerlinicFeet.aspir = { name="Merlinic Crackows", augments={'"Drain" and "Aspir" potency +11','Mag. Acc.+9','"Mag.Atk.Bns."+8',}}
	

	--SubJob list--
	--Do not change these
	sets.SJ = {}
	sets.SJ.index = {"Other", "Ninja", "Dancer"}
	SJ_ind = 1	


	--Weapon Sets--
	sets.Weapon_melee = {} -- sets weapon combo for melee-mode
	sets.Weapon_melee.index = {"Naegling", "LightDamage", "Enspell", "Excalibur", "Sequence", "Tauret", "lolRange", "Endagger"}
	Wm_ind = 1
	sets.Weapon_melee.Naegling = {
		main = "Naegling",
		sub = "Machaera +2",
		ammo = "Coiste Bodhar"
	}
	sets.Weapon_melee.LightDamage = {
		main = "Vitiation Sword",
		sub = "Daybreak",
		ammo = "Coiste Bodhar"
	}
	sets.Weapon_melee.Enspell = {
		main = "Vitiation Sword",
		sub = "Ternion Dagger +1",
		range = "Ullr"
	}
	sets.Weapon_melee.Excalibur = {
		main = "Excalibur",
		sub = "Ternion Dagger +1",
		ammo = "Coiste Bodhar"
	}
	sets.Weapon_melee.Sequence = {
		main = "Sequence",
		sub = "Machaera +2",
		ammo = "Coiste Bodhar"
	}	
	sets.Weapon_melee.Tauret = {
		main = "Tauret",
		sub = "Gleti's Knife",
		ammo = "Coiste Bodhar"
	}
	--Next two intended for use with Ullr toggle active
	sets.Weapon_melee.lolRange = {
		main = "Vitiation Sword",
		sub = "Bunzi's Rod"
	}
	sets.Weapon_melee.Endagger = {
		main = "Esikuva",
		sub = "Norgish Dagger"
	}	

	-- sets weapon combo for ranged use
	-- for SC compatibility, Enspell MAcc, and niche Flaming Arrow shenanigans
	sets.Weapon_range = {} 
	sets.Weapon_range.index = {"none", "Ullr"} 
	Wr_ind = 1
	sets.Weapon_range.Ullr = {
		range = "Ullr",
		ammo = "Beryllium Arrow"
	}
	sets.Weapon_range.none = {}


	sets.DW_mode = {}
	sets.DW_mode.index = {"DW", "notDW"}
	DW_mode_ind = 1

	sets.DW_mode.DW = {}
	sets.DW_mode.notDW = {sub = "Sacro Bulwark"} -- 0/0/10


	--Idle Sets--
	-- mage-mode
	sets.Idle = {}
	sets.Idle.index = {"Standard", "DT", "Refresh"}
	Idle_ind = 1
	sets.Idle.Standard = {
		main = "Daybreak",
		sub = "Sacro Bulwark", -- 0/0/10
		ammo = "Staunch Tathlum +1", -- 0/0/3
		head = "Vitiation Chapeau +3", 
		neck = "Warder's Charm +1", 
		ear1 = "Sanare Earring", 
		ear2 = "Etiolation Earring", -- 0/3/0
		body = "Shamash Robe", -- 10/0/0
		hands = "Nyame Gauntlets", -- 0/0/7
		ring1 = "Mephitas's Ring +1", 
		ring2 = "Mephitas's Ring",
		back = Sucellos.FC, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = "Carmine Cuisses +1",
		feet = "Nyame Sollerets" -- 0/0/7
	} -- 20/3/27
	sets.Idle.DT = {
		main = "Daybreak",
		sub = "Sacro Bulwark", -- 0/0/10
		ammo = "Staunch Tathlum +1", -- 0/0/3
		head = "Vitiation Chapeau +3", 
		neck = "Warder's Charm +1", 
		ear1 = "Sanare Earring", 
		ear2 = "Etiolation Earring", -- 0/3/0
		body = "Shamash Robe", -- 10/0/0
		hands = "Nyame Gauntlets", -- 0/0/7
		ring1 = "Mephitas's Ring +1", 
		ring2 = "Mephitas's Ring",
		back = Sucellos.FC, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = "Nyame Flanchard", -- 0/0/8
		feet = "Nyame Sollerets" -- 0/0/7
	} -- 20/3/35
	sets.Idle.Refresh = {
		main = "Daybreak",
		sub = "Sacro Bulwark", -- 0/0/10
		ammo = "Homiliary",
		head = "Vitiation Chapeau +3", -- 0/0/6
		neck = "Warder's Charm +1", 
		ear1 = "Sanare Earring", 
		ear2 = "Etiolation Earring", -- 0/3/0
		body = "Shamash Robe", -- 10/0/0
		hands = "Bunzi's Gloves", -- 0/0/8
		ring1 = "Mephitas's Ring +1", 
		ring2 = "Gelatinous Ring +1", -- 7/-1/0
		back = Sucellos.FC, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = MerlinicLegs.refresh,
		feet = "Volte Gaiters" 
	} -- 27/2/24
	
	-- melee-mode (DW)
	sets.Idle_melee_DW = {}
	sets.Idle_melee_DW.index = {"Standard", "DT", "Refresh"}
	Idle_melee_DW_ind = 1
	sets.Idle_melee_DW.Standard = {
		ammo = "Staunch Tathlum +1", -- 0/0/3
		head = "Vitiation Chapeau +3", 
		neck = "Loricate Torque +1", -- 0/0/6 
		ear1 = "Sanare Earring", 
		ear2 = "Etiolation Earring", -- 0/3/0
		body = "Shamash Robe", -- 10/0/0
		hands = "Nyame Gauntlets", -- 0/0/7
		ring1 = "Mephitas's Ring +1", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Sucellos.FC, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = "Carmine Cuisses +1",
		feet = "Nyame Sollerets" -- 0/0/7
	} -- 20/3/33
	sets.Idle_melee_DW.DT = {
		ammo = "Staunch Tathlum +1", -- 0/0/3
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Warder's Charm +1",
		ear1 = "Sanare Earring", 
		ear2 = "Etiolation Earring", -- 0/3/0
		body = "Shamash Robe", -- 10/0/0
		hands = "Nyame Gauntlets", -- 0/0/7
		ring1 = "Mephitas's Ring +1", 
		ring2 = "Mephitas's Ring", 
		back = Sucellos.FC, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = "Nyame Flanchard", -- 0/0/8
		feet = "Nyame Sollerets" -- 0/0/7
	} -- 20/3/31
	sets.Idle_melee_DW.Refresh = {
		ammo = "Staunch Tathlum +1", -- 0/0/3
		head = "Vitiation Chapeau +3", 
		neck = "Loricate Torque +1", -- 0/0/6 
		ear1 = "Sanare Earring", 
		ear2 = "Etiolation Earring", -- 0/3/0
		body = "Shamash Robe", -- 10/0/0
		hands = "Bunzi's Gloves", -- 0/0/8
		ring1 = "Mephitas's Ring +1",  
		ring2 = "Defending Ring", 
		back = Sucellos.FC, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = MerlinicLegs.refresh,
		feet = "Volte Gaiters" 
	} -- 20/3/27
	
	-- melee-mode (Single-Wield)
	sets.Idle_melee_SW = {}
	sets.Idle_melee_SW.index = {"Standard", "DT", "Refresh"}
	Idle_melee_SW_ind = 1
	sets.Idle_melee_SW.Standard = {
		ammo = "Staunch Tathlum +1", -- 0/0/3
		head = "Vitiation Chapeau +3", 
		neck = "Warder's Charm +1", 
		ear1 = "Sanare Earring", 
		ear2 = "Etiolation Earring", -- 0/3/0
		body = "Shamash Robe", -- 10/0/0
		hands = "Nyame Gauntlets", -- 0/0/7
		ring1 = "Mephitas's Ring +1", 
		ring2 = "Mephitas's Ring",
		back = Sucellos.FC, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = "Carmine Cuisses +1",
		feet = "Nyame Sollerets" -- 0/0/7
	} -- 20/3/24	
	sets.Idle_melee_SW.DT = {
		ammo = "Staunch Tathlum +1", -- 0/0/3
		head = "Vitiation Chapeau +3", 
		neck = "Warder's Charm +1", 
		ear1 = "Sanare Earring", 
		ear2 = "Etiolation Earring", -- 0/3/0
		body = "Shamash Robe", -- 10/0/0
		hands = "Nyame Gauntlets", -- 0/0/7
		ring1 = "Mephitas's Ring +1", 
		ring2 = "Mephitas's Ring",
		back = Sucellos.FC, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = "Nyame Flanchard", -- 0/0/8
		feet = "Nyame Sollerets" -- 0/0/7
	} -- 20/3/32
	sets.Idle_melee_SW.Refresh = {
		ammo = "Staunch Tathlum +1", -- 0/0/3
		head = "Vitiation Chapeau +3", -- 0/0/6
		neck = "Warder's Charm +1", 
		ear1 = "Sanare Earring", 
		ear2 = "Etiolation Earring", -- 0/3/0
		body = "Shamash Robe", -- 10/0/0
		hands = "Bunzi's Gloves", -- 0/0/8
		ring1 = "Mephitas's Ring +1", 
		ring2 = "Gelatinous Ring +1", -- 7/-1/0
		back = Sucellos.FC, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = MerlinicLegs.refresh,
		feet = "Volte Gaiters" 
	} -- 27/2/24	


	--TP Sets--
	sets.TP = {}
	sets.TP.index = {"Standard", "DT", "Enspells_high_damage"}
	TP_ind = 1

	sets.TP.Standard = {}
	sets.TP.Standard.index = {"Other", "Ninja", "Dancer"}
	sets.TP.Standard.Other = {
		head = "Malignance Chapeau", 
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Brutal Earring", 		
		body = "Malignance Tabard", 
		hands = "Bunzi's Gloves", 
		ring1 = "Ilabrat Ring", 
		ring2 = "Hetairoi Ring",	
		back = Sucellos.TP, 
		waist = "Windbuffet Belt +1",	
		legs = "Malignance Tights", 
		feet = "Malignance Boots"
	} -- 21DA/4TA/2QA | 69 sTP
	sets.TP.Standard.Ninja = {
		head = "Malignance Chapeau", 
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Brutal Earring", 		
		body = "Malignance Tabard", 
		hands = "Bunzi's Gloves", 
		ring1 = "Ilabrat Ring", 
		ring2 = "Hetairoi Ring",	
		back = Sucellos.DW, 
		waist = "Windbuffet Belt +1",	
		legs = "Malignance Tights", 
		feet = "Malignance Boots"
	} -- 21DA/4TA/2QA | 59 sTP
	sets.TP.Standard.Dancer = {
		head = "Malignance Chapeau", 
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", 		
		body = "Malignance Tabard", 
		hands = "Bunzi's Gloves", 
		ring1 = "Ilabrat Ring", 
		ring2 = "Hetairoi Ring",	
		back = Sucellos.DW, 
		waist = "Reiki Yotai",	
		legs = "Malignance Tights", 
		feet = "Malignance Boots"
	} -- 16DA/2TA/0QA | 58 sTP

	sets.TP.DT = {}
	sets.TP.DT.index = {"Other", "Ninja", "Dancer"}
	sets.TP.DT.Other = {
		head = "Malignance Chapeau", -- 0/0/6 
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Brutal Earring", 		
		body = "Malignance Tabard", -- 0/0/9
		hands = "Bunzi's Gloves", -- 0/0/8
		ring1 = "Ilabrat Ring", 
		ring2 = "Hetairoi Ring",	
		back = Sucellos.TP, -- 10/0/0
		waist = "Windbuffet Belt +1",	
		legs = "Malignance Tights", -- 0/0/7
		feet = "Malignance Boots" -- 0/0/4
	} -- 21DA/4TA/2QA | 69 sTP | 10/0/34
	sets.TP.DT.Ninja = {
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Brutal Earring", 		
		body = "Malignance Tabard", -- 0/0/9
		hands = "Bunzi's Gloves", -- 0/0/8
		ring1 = "Ilabrat Ring", 
		ring2 = "Defending Ring", -- 0/0/10	
		back = Sucellos.DW, -- 10/0/0
		waist = "Windbuffet Belt +1",	
		legs = "Malignance Tights", -- 0/0/7
		feet = "Malignance Boots" -- 0/0/4
	} -- 21DA/2TA/2QA | 59 sTP | 10/0/44
	sets.TP.DT.Dancer = {
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", 		
		body = "Malignance Tabard", -- 0/0/9
		hands = "Bunzi's Gloves", -- 0/0/8
		ring1 = "Ilabrat Ring", 
		ring2 = "Defending Ring", -- 0/0/10	
		back = Sucellos.DW, -- 10/0/0
		waist = "Reiki Yotai",	
		legs = "Malignance Tights", -- 0/0/7
		feet = "Malignance Boots" -- 0/0/4
	} -- 16DA/0TA/0QA | 58 sTP | 10/0/44

	-- Enspell-Focused sets
	sets.TP.Enspells_high_damage = {}
	sets.TP.Enspells_high_damage.index = {"Other", "Ninja", "Dancer"}
	sets.TP.Enspells_high_damage.Other = {
		head = "Umuthi Hat", 
		neck = "Duelist's Torque +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Crepuscular Earring", 		
		body = "Malignance Tabard", 
		hands = "Ayanmo Manopolas +2", 
		ring1 = "Etana Ring", 
		ring2 = "Hetairoi Ring",	
		back = "Ghostfyre Cape", 
		waist = "Eschan Stone",	
		legs = "Malignance Tights", 
		feet = "Malignance Boots" 
	} 
	sets.TP.Enspells_high_damage.Ninja = {
		head = "Umuthi Hat", 
		neck = "Duelist's Torque +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Crepuscular Earring", 		
		body = "Malignance Tabard", 
		hands = "Ayanmo Manopolas +2", 
		ring1 = "Etana Ring", 
		ring2 = "Hetairoi Ring",	
		back = Sucellos.DW, 
		waist = "Eschan Stone",	
		legs = "Malignance Tights", 
		feet = "Malignance Boots" 
	} 
	sets.TP.Enspells_high_damage.Dancer = {
		head = "Umuthi Hat", 
		neck = "Duelist's Torque +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Crepuscular Earring", 		
		body = "Malignance Tabard", 
		hands = "Ayanmo Manopolas +2", 
		ring1 = "Etana Ring", 
		ring2 = "Hetairoi Ring",	
		back = Sucellos.DW,
		waist = "Reiki Yotai",	
		legs = "Malignance Tights", 
		feet = "Malignance Boots" 
	} 
	

	sets.Ranged = {}
	sets.Ranged.index = {"Standard", "HighAccuracy"}
	Ranged_ind = 1
	
	sets.Ranged.Standard = {
		head = "Malignance Chapeau",
		neck = "Combatant's Torque",
		ear1 = "Sherida Earring",
		ear2 = "Telos Earring",
		body = "Malignance chapeau",
		hands = "Malignance Gloves",
		ring1= "Ilabrat Ring",
		ring2 = "Crepuscular Ring",
		waist = "Reiki Yotai",
		back = Sucellos.TP,
		legs = "Malignance Tights",
		feet = "Malignance Boots"
	}
	sets.Ranged.HighAccuracy = {
		head = "Malignance Chapeau",
		neck = "Combatant's Torque",
		ear1 = "Sherida Earring",
		ear2 = "Telos Earring",
		body = "Malignance chapeau",
		hands = "Malignance Gloves",
		ring1= "Ilabrat Ring",
		ring2 = "Crepuscular Ring",
		waist = "Reiki Yotai",
		back = Sucellos.TP,
		legs = "Malignance Tights",
		feet = "Malignance Boots"
	}


	--Weaponskill Sets--
	--Sword
	sets.WS = {}
	sets.WS.index = {"Attack", "AttackCapped"}
	WS_ind = 1

	sets.Knights = {}
	sets.Knights.Attack = {
		ammo= "Amar Cluster",
		head = "Vitiation Chapeau +3",
		neck = "Caro Necklace", 
		ear1 = "Sherida Earring", 
		ear2 = "Telos Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Shukuyu Ring", 
		ring2 = "Rufescent Ring",
		back = Sucellos.WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.Knights.AttackCapped = {
		ammo= "Crepuscular Pebble",
		head = "Vitiation Chapeau +3",
		neck = "Duelist's Torque +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Regal Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Shukuyu Ring", 
		ring2 = "Rufescent Ring",
		back = Sucellos.WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}

	sets.SavageBlade = {}
	sets.SavageBlade.Attack = {
		ammo= "Amar Cluster",
		head = "Vitiation Chapeau +3",
		neck = "Caro Necklace", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Shukuyu Ring", 
		ring2 = "Rufescent Ring",
		back = Sucellos.WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.SavageBlade.AttackCapped = {
		ammo= "Crepuscular Pebble",
		head = "Vitiation Chapeau +3",
		neck = "Duelist's Torque +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Shukuyu Ring", 
		ring2 = "Rufescent Ring",
		back = Sucellos.WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	
	sets.DeathBlossom = {}
	sets.DeathBlossom.Attack = {
		ammo= "Regal Gem",
		head = "Vitiation Chapeau +3",
		neck = "Caro Necklace", 
		ear1 = "Sherida Earring", 
		ear2 = "Telos Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Shukuyu Ring", 
		ring2 = "Rufescent Ring",
		back = Sucellos.WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.DeathBlossom.AttackCapped = {
		ammo= "Crepuscular Pebble",
		head = "Vitiation Chapeau +3",
		neck = "Duelist's Torque +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Regal Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Shukuyu Ring", 
		ring2 = "Rufescent Ring",
		back = Sucellos.WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	
	sets.CDC = {}
	sets.CDC.Attack = {
		ammo="Yetshila",
		head="Malignance Chapeau",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Mache Earring +1",
        body="Ayanmo Corazza +2",
		hands="Malignance Gloves",
		ring1="Ilabrat Ring",
		ring2="Petrov Ring",
        back=Sucellos.TP,
		waist="Fotia Belt",
		legs="Vitiation Tights +3",
		feet="Thereoid Greaves"
	}
	sets.CDC.AttackCapped = {
		ammo="Yetshila",
		head="Malignance Chapeau",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Mache Earring +1",
        body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Ilabrat Ring",
		ring2="Petrov Ring",
        back=Sucellos.TP,
		waist="Fotia Belt",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}

	sets.Requiescat = {}
	sets.Requiescat.Attack = {
		ammo="Coiste Bodhar",
		head="Vitiation Chapeau +3",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Brutal Earring",
        body="Ayanmo Corazza +2",
		hands="Bunzi's Gloves",
		ring1="Rufescent Ring",
		ring2="Freke Ring",
        back=Sucellos.TP,
		waist="Fotia Belt",
		legs="Vitiation Tights +3",
		feet="Nyame Sollerets"
	}
	sets.Requiescat.AttackCapped = {
		ammo="Crepuscular Pebble",
		head="Malignance Chapeau",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Brutal Earring",
        body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Rufescent Ring",
		ring2="Freke Ring",
        back=Sucellos.TP,
		waist="Fotia Belt",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}	
	
	sets.SanguineBlade = {}
	sets.SanguineBlade.Attack = {
		ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Crematio Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Archon Ring",
		ring2="Freke Ring",
        back=Sucellos.MAB,
		waist="Eschan Stone",
		legs=MerlinicLegs.MAB,
		feet="Nyame Sollerets"
	}
	sets.SanguineBlade.AttackCapped = {
		ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Crematio Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Archon Ring",
		ring2="Freke Ring",
        back=Sucellos.MAB,
		waist="Eschan Stone",
		legs=MerlinicLegs.MAB,
		feet="Nyame Sollerets"
	}

	sets.RedLotusBlade = {}
	sets.RedLotusBlade.Attack = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Crematio Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Rufescent Ring",
		ring2="Freke Ring",
        back=Sucellos.MAB,
		waist="Eschan Stone",
		legs=MerlinicLegs.MAB,
		feet="Nyame Sollerets"
	}
	sets.RedLotusBlade.AttackCapped = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Crematio Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Rufescent Ring",
		ring2="Freke Ring",
        back=Sucellos.MAB,
		waist="Eschan Stone",
		legs=MerlinicLegs.MAB,
		feet="Nyame Sollerets"
	}	
	
	sets.BurningBlade = {}
	sets.BurningBlade.Attack = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Crematio Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Rufescent Ring",
		ring2="Freke Ring",
        back=Sucellos.MAB,
		waist="Eschan Stone",
		legs=MerlinicLegs.MAB,
		feet="Nyame Sollerets"
	}
	sets.BurningBlade.AttackCapped = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Crematio Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Rufescent Ring",
		ring2="Freke Ring",
        back=Sucellos.MAB,
		waist="Eschan Stone",
		legs=MerlinicLegs.MAB,
		feet="Nyame Sollerets"
	}	
	
	sets.SeraphBlade = {}
	sets.SeraphBlade.Attack = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Crematio Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Rufescent Ring",
		ring2="Freke Ring",
        back=Sucellos.MAB,
		waist="Eschan Stone",
		legs=MerlinicLegs.MAB,
		feet="Nyame Sollerets"
	}
	sets.SeraphBlade.AttackCapped = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Crematio Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Rufescent Ring",
		ring2="Freke Ring",
        back=Sucellos.MAB,
		waist="Eschan Stone",
		legs=MerlinicLegs.MAB,
		feet="Nyame Sollerets"
	}

	sets.ShiningBlade = {}
	sets.ShiningBlade.Attack = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Crematio Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Rufescent Ring",
		ring2="Freke Ring",
        back=Sucellos.MAB,
		waist="Eschan Stone",
		legs=MerlinicLegs.MAB,
		feet="Nyame Sollerets"
	}
	sets.ShiningBlade.AttackCapped = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Crematio Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Rufescent Ring",
		ring2="Freke Ring",
        back=Sucellos.MAB,
		waist="Eschan Stone",
		legs=MerlinicLegs.MAB,
		feet="Nyame Sollerets"
	}	

	--Dagger
	sets.Evisceration = {}
	sets.Evisceration.Attack = {
		ammo="Yetshila",
		head="Malignance Chapeau",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Mache Earring +1",
        body="Ayanmo Corazza +2",
		hands="Malignance Gloves",
		ring1="Ilabrat Ring",
		ring2="Petrov Ring",
        back=Sucellos.TP,
		waist="Fotia Belt",
		legs="Vitiation Tights +3",
		feet="Thereoid Greaves"
	}
	sets.Evisceration.AttackCapped = {
		ammo="Yetshila",
		head="Malignance Chapeau",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Mache Earring +1",
        body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Ilabrat Ring",
		ring2="Petrov Ring",
        back=Sucellos.TP,
		waist="Fotia Belt",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}
	
	sets.AeolianEdge = {}
	sets.AeolianEdge.Attack = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Crematio Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Acumen Ring",
		ring2="Freke Ring",
        back=Sucellos.MAB,
		waist="Eschan Stone",
		legs=MerlinicLegs.MAB,
		feet="Nyame Sollerets"
	}
	sets.AeolianEdge.AttackCapped = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Crematio Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Acumen Ring",
		ring2="Freke Ring",
        back=Sucellos.MAB,
		waist="Eschan Stone",
		legs=MerlinicLegs.MAB,
		feet="Nyame Sollerets"
	}

	--Club
	sets.BlackHalo = {}
	sets.BlackHalo.Attack = {
		ammo= "Regal Gem",
		head = "Vitiation Chapeau +3",
		neck = "Caro Necklace", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Shukuyu Ring", 
		ring2 = "Rufescent Ring",
		back = Sucellos.WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.BlackHalo.AttackCapped = {
		ammo= "Crepuscular Pebble",
		head = "Vitiation Chapeau +3",
		neck = "Duelist's Torque +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Shukuyu Ring", 
		ring2 = "Rufescent Ring",
		back = Sucellos.WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	
	sets.TrueStrike = {}
	sets.TrueStrike.Attack = {
		ammo= "Amar Cluster",
		head = "Vitiation Chapeau +3",
		neck = "Caro Necklace", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Shukuyu Ring", 
		ring2 = "Rufescent Ring",
		back = Sucellos.WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.TrueStrike.AttackCapped = {
		ammo= "Crepuscular Pebble",
		head = "Vitiation Chapeau +3",
		neck = "Duelist's Torque +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Shukuyu Ring", 
		ring2 = "Rufescent Ring",
		back = Sucellos.WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}	
	
	sets.ShiningStrike = {}
	sets.ShiningStrike.Attack = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Crematio Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Rufescent Ring",
		ring2="Freke Ring",
        back=Sucellos.MAB,
		waist="Eschan Stone",
		legs=MerlinicLegs.MAB,
		feet="Nyame Sollerets"
	}
	sets.ShiningStrike.AttackCapped = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Crematio Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Rufescent Ring",
		ring2="Freke Ring",
        back=Sucellos.MAB,
		waist="Eschan Stone",
		legs=MerlinicLegs.MAB,
		feet="Nyame Sollerets"
	}	
	
	sets.SeraphStrike = {}
	sets.SeraphStrike.Attack = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Crematio Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Rufescent Ring",
		ring2="Freke Ring",
        back=Sucellos.MAB,
		waist="Eschan Stone",
		legs=MerlinicLegs.MAB,
		feet="Nyame Sollerets"
	}
	sets.SeraphStrike.AttackCapped = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Crematio Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Rufescent Ring",
		ring2="Freke Ring",
        back=Sucellos.MAB,
		waist="Eschan Stone",
		legs=MerlinicLegs.MAB,
		feet="Nyame Sollerets"
	}		
	
	--Ranged
	sets.FlamingArrow = {}
	sets.FlamingArrow.Attack = {
		head="Nyame Helm",
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
		ear2="Telos Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Rufescent Ring",
		ring2="Freke Ring",
        back=Sucellos.MAB,
		waist="Eschan Stone",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.FlamingArrow.AttackCapped = {
		head="Nyame Helm",
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
		ear2="Telos Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Rufescent Ring",
		ring2="Freke Ring",
        back=Sucellos.MAB,
		waist="Eschan Stone",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}	
	
	sets.EmpyrealArrow = {}
	sets.EmpyrealArrow.Attack = {
		head="Malignance Chapeau",
		neck="Combatant's Torque",
		ear1="Sherida Earring",
		ear2="Telos Earring",
        body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Ilabrat Ring",
		ring2="Crepuscular Ring",
        back=Sucellos.WSD,
		waist="Eschan Stone",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}
	sets.EmpyrealArrow.AttackCapped = {
		head="Nyame Helm",
		neck="Combatant's Torque",
		ear1="Sherida Earring",
		ear2="Telos Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Ilabrat Ring",
		ring2="Crepuscular Ring",
        back=Sucellos.WSD,
		waist="Eschan Stone",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
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
		ring1 = "Shukuyu Ring",
		ring2 = "Rufescent Ring",
		back = Sucellos.WSD,
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
		ring1 = "Shukuyu Ring",
		ring2 = "Rufescent Ring",
		back = Sucellos.WSD,
		waist = "Fotia Belt",
		legs = "Nyame Flanchard",
		feet = "Nyame Sollerets"
	}

	sets.RangedWS = {}
	sets.RangedWS.Attack = {
		Head = "Nyame Helm",
		neck = "Fotia gorget",
		ear1 = "Sherida Earring",
		ear2 = "Moonshade Earring",
		body = "Nayme Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Shukuyu Ring",
		ring2 = "Rufescent Ring",
		back = Sucellos.WSD,
		waist = "Fotia Belt",
		legs = "Nyame Flanchard",
		feet = "Nyame Sollerets"
	}
	sets.RangedWS.Accuracy = {
		Head = "Nyame Helm",
		neck = "Fotia gorget",
		ear1 = "Sherida Earring",
		ear2 = "Moonshade Earring",
		body = "Nayme Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Shukuyu Ring",
		ring2 = "Rufescent Ring",
		back = Sucellos.WSD,
		waist = "Fotia Belt",
		legs = "Nyame Flanchard",
		feet = "Nyame Sollerets"
	}


	--Job Ability Sets--
	sets.JA = {}
	sets.JA.Chainspell = {body = "Duelist's Tabard +3"}
	sets.JA.Convert = {main = "Murgeleis"}
	
	sets.Waltz ={
	-- Insert gear here as desired
	}
	
	sets.precast = {}
	-- you have +38% at job master, needing +42% in geaar to cap
	-- use the rest of your slots to minimize shifts in HP/MP between casts
	sets.precast.FastCast = {
		head = "Atrophy Chapeau +2", -- 14
		neck = "Sanctity Necklace",
		ear1 = "Malignance Earring", -- 4
		ear2 = "Loquacious Earring", -- 2
		body = "Vitiation Tabard +3", -- 15
		hands = "Regal Cuffs",
		ring1 = "Lebeche Ring", -- (2)
		ring2 = "Veneficum Ring", -- (1)
		waist = "Witful Belt", -- 3 (3)
		back = "Perimede Cape", -- (4)
		legs = "Amalric Slops",
		feet = "Amalric Nails +1" -- 6	
	} -- 44 (10)
	
	sets.precast.FastCast_impact = {
		head = "",
		neck = "Orunmila's Torque", -- 5
		ear1 = "Malignance Earring", -- 4
		ear2 = "Loquacious Earring", -- 2
		body = "Twilight Cloak", 
		hands = "Leyline Gloves", -- 8
		ring1 = "Kishar Ring", -- 4
		ring2 = "Veneficum Ring", -- (1)
		waist = "Witful Belt", -- 3 (3)
		back = "Perimede Cape", -- (4)
		legs = "Kaykaus Tights", -- 6
		feet = "Carmine Greaves" -- 8
	} -- 40 (8)
	
	--This is here if you need it for Utsusemi
	sets.precast.NinjutsuFastCast = set_combine(sets.precast.FastCast, {
		--neck = "Magoraga Beads",
	})
	
	sets.midcast = {}
	-- FC here will lower recasts until cap, but its a good idea to put -DT% in midcasts
	sets.midcast.FastRecast = {
		head = "Atrophy Chapeau +2", -- 14
		neck = "Sanctity Necklace",
		ear1 = "Malignance Earring", -- 4
		ear2 = "Loquacious Earring", -- 2
		body = "Vitiation Tabard +3", -- 15
		hands = "Regal Cuffs",
		ring1 = "Mephitas's Ring +1", 
		ring2 = "Mephitas's Ring", 
		waist = "Witful Belt", -- 3 
		back = Sucellos.enfeeb, 
		legs = "Amalric Slops",
		feet = "Amalric Nails +1" -- 6	
	} -- 44 


	--Weapon combos specific to mage-only mode
	sets.Weapon_magic = {}
	sets.Weapon_magic.Enhancing_skill_SW = {
		main = "Pukulatmuj +1",
		sub = "Ammurapi Shield",
		ammo = "Sapience Orb"
	} -- +11 Skill | +10% Duration
	sets.Weapon_magic.Enhancing_skill_DW = {
		main = "Pukulatmuj +1",
		sub = "Arendsi Fleuret",
		ammo = "Sapience Orb"
	} -- + 21 Skill
	sets.Weapon_magic.Enhancing_duration_SW = {
		main = Colada.Enh,
		sub = "Ammurapi Shield",
		ammo = "Sapience Orb"
	} -- +15% Duration
	sets.Weapon_magic.Enhancing_phalanx_SW = {
		main = "Sakpata's Sword",
		sub = "Ammurapi Shield",
		ammo = "Sapience Orb"
	} -- +5 Phalanx | +10% Duration
	sets.Weapon_magic.Enhancing_phalanx_DW = {
		main = "Sakpata's Sword",
		sub = "Egeking",
		ammo = "Sapience Orb"
	} -- +7 Phalanx
	sets.Weapon_magic.Enhancing_regen_SW = {
		main = "Bolelabunga",
		sub = "Ammurapi Shield",
		ammo = "Sapience Orb"
	} -- +10% Regen | +10% Duration


	--Enhancing Magic
	--Note that any amounts noted are generalization before calculation.
	-- --For example, if the "total duration+" is noted for a set this is not the calculated duration.
	-- --Sets will be calculated for totals in the notes below based on proper weapon combos (assumes mage-mode)
	--
	--
	--Duration Formula:
	-- -- (Base Duration + (6s × RDM Group 2 Merit Point Level) + (3s × RDM Relic Hands Group 2 Merit Point Level Augment) 
	-- -- + RDM Job Points + Gear that list Seconds) × (Augments Composure Bonus) × (Duration listed on Gear + Naturalist's Roll) 
	-- -- × (Duration Augments on Gear) × (Rune Fencer Gifts) = Duration
	
	
	--Skill -> Duration+ -> CMP
	--Uncapped Skill Spells: Enspells | Gain-spells | Temper | Temper II
	sets.midcast.Enhancing_skill = {
		head = "Befouled Crown", -- +16
		neck = "Incanter's Torque", -- +10
        body = "Vitiation Tabard +3", -- +23 (15)
		ear1 = "Mimir Earring", -- +10
		ear2 = "Andoaa Earring", -- +5
		hands = "Vitiation Gloves +3", -- +24
		ring1 = "Stikini Ring", -- +5
		ring2 = "Stikini Ring", -- +5
        back = "Ghostfyre Cape", -- +7(20**)
		waist = "Olympus Sash", -- +5
		legs = "Atrophy Tights +2", -- +19
		feet = "Lethargy Houseaux +1" -- +25 (30)
	} -- +154 skill | +65% Duration (** denotes augmented +% duration)
	
	--Skill -> Duration+ -> CMP
	--Uncapped Skill Spells (others): Enspells
	sets.midcast.Enhancing_skill_other = {
		head = "Befouled Crown", -- +16
		neck = "Incanter's Torque", -- +10
        body = "Vitiation Tabard +3", -- +23
		ear1 = "Mimir Earring", -- +10
		ear2 = "Andoaa Earring", -- +5
		hands = "Vitiation Gloves +3", -- +24
		ring1 = "Stikini Ring", -- +5
		ring2 = "Stikini Ring", -- +5
        back = "Ghostfyre Cape", -- +7(20)
		waist = "Olympus Sash", -- +5
		legs = "Atrophy Tights +2", -- +19
		feet = "Lethargy Houseaux +1" -- +25 (30)
	} -- +154 skill | +50% Duration
	
	-- Redundant set, left in for future gear considerations
	-- --Skill -> Duration+ -> CMP
	-- --Uncapped Skill Spells (others): Enspells
	-- sets.midcast.Enhancing_skill_other_composure = {
		-- head = "Lethargy Chappel +1", -- (35*)
		-- neck = "Incanter's Torque", -- +10
        -- body = "Lethargy Sayon +1", -- (35*)
		-- ear1 = "Mimir Earring", -- +10
		-- ear2 = "Andoaa Earring", -- +5
		-- hands = "Atrophy Gloves +3", -- (20)
		-- ring1 = "Stikini Ring", -- +5
		-- ring2 = "Stikini Ring", -- +5
        -- back = "Ghostfyre Cape", -- +7(20**)
		-- waist = "Olympus Sash", -- +5
		-- legs = "Leth. Fuseau +1", -- (35*)
		-- feet = "Lethargy Houseaux +1" -- +25 (30 + 35*)
	-- } -- +72 skill	| +105% Duration (* indicates set total - 4 pieces) (** denotes augmented +% duration)
	
	--Duration+ -> CMP
	--Skill-less spells: Haste / Protect / Shell / Storm
	sets.midcast.Enhancing_duration = {
		head = TelchineHead.Enh, -- (10**)
		neck = "Duelist's Torque +1", -- (20**)
        body = "Vitiation Tabard +3", -- (15)
		ear1 = "Mimir Earring", -- +10
		ear2 = "Andoaa Earring", -- +5
		hands = "Atrophy Gloves +3", -- (20)
		ring1 = "Stikini Ring", -- +5
		ring2 = "Stikini Ring", -- +5
        back = "Ghostfyre Cape", -- +7(20**)
		waist = "Embla Sash", -- (5)
		legs = TelchineLegs.Enh, -- (10**)
		feet = "Lethargy Houseaux +1" -- +25 (30)
	} -- +57 skill	| +130% Duration (** denotes augmented +% duration)
	
	--Duration+ -> CMP
	--Skill-less spells: Haste / Protect / Shell / Storm
	sets.midcast.Enhancing_duration_other = {
		head = "Lethargy Chappel +1", -- (35*)
		neck = "Duelist's Torque +1", -- (20)
        body = "Lethargy Sayon +1", -- (35*)
		ear1 = "Mimir Earring", -- +10
		ear2 = "Andoaa Earring", -- +5
		hands = "Atrophy Gloves +3", -- (20)
		ring1 = "Stikini Ring", -- +5
		ring2 = "Stikini Ring", -- +5
        back = "Ghostfyre Cape", -- +7(20)
		waist = "Embla Sash", -- (5)
		legs = "Lethargy Fuseau +1", -- (35*)
		feet = "Lethargy Houseaux +1" -- +25 (30 + 35*)
	} -- +57 skill | +130% Duration (* indicates set total - 4 pieces)
	
	--Composure duration is self buff only for this spell, nothing else affects this due to being Dark Magic
	-- -- This only exists as future-proofing in the unlikely event SE changes Klimaform 
	sets.midcast.Enhancing_duration_other_klimaform = {
		--head = "Lethargy Chappel +1", -- (50*)
        --body = "Lethargy Sayon +1", -- (50*)
		--hands = "Lethargy Gantherots +1", -- (50*)
		--legs = "Lethargy Fuseau +1", -- (50*)
		--feet = "Lethargy Houseaux +1" -- (50*)
	} -- +50% Duration (* indicates set total - 5 pieces)
	
	--Phalanx+ -> 500 Skill -> Duration+ -> CMP
	--Spells: Phalanx
	sets.midcast.Enhancing_phalanx = {
		head = TaeonHead.Phalanx, -- +3
		neck = "Duelist's Torque +1", -- (20**)
        body = TaeonBody.Phalanx, -- +3
		ear1 = "Mimir Earring", -- +10
		ear2 = "Andoaa Earring", -- +5
		hands = TaeonHands.Phalanx, -- +3
		ring1 = "Stikini Ring", -- +5
		ring2 = "Stikini Ring", -- +5
        back = "Ghostfyre Cape", -- +7(20**)
		waist = "Embla Sash", -- (5)
		legs = TaeonLegs.Phalanx, -- +3
		feet = TaeonFeet.Phalanx -- +3
	} -- +32 skill | +15 Phalanx | +45% Duration (** denotes augmented +% duration)
	
	--Hit 500 skill -> Duration+ -> CMP
	--Spells: Phalanx / Phalanx II
	sets.midcast.Enhancing_phalanx_other = {
		head = "Lethargy Chappel +1", -- (35*)
		neck = "Duelist's Torque +1", -- (20**)
        body = "Lethargy Sayon +1", -- (35*)
		ear1 = "Mimir Earring", -- +10
		ear2 = "Andoaa Earring", -- +5
		hands = "Atrophy Gloves +3", -- (20)
		ring1 = "Stikini Ring", -- +5
		ring2 = "Stikini Ring", -- +5
        back = "Ghostfyre Cape", -- +7(20**)
		waist = "Embla Sash", -- (5)
		legs = "Leth. Fuseau +1", -- (35*)
		feet = "Lethargy Houseaux +1" -- +25 (30 + 35*)
	} -- +57 skill | +105% Duration (* indicates set total - 4 pieces) (** denotes augmented +% duration)
	
	--Hit 355 Skill -> Aquaveil+ -> Duration+ -> CMP
	--Spells: Aquaveil
	sets.midcast.Enhancing_aquaveil = {
		head = "Amalric Coif", -- [+1]
		neck = "Duelist's Torque +1", -- (20**)
        body = "Vitiation Tabard +3", -- (15)
		ear1 = "Mimir Earring", -- +10
		ear2 = "Andoaa Earring", -- +5
		hands = "Regal Cuffs", -- [+2] 
		ring1 = "Stikini Ring", -- +5
		ring2 = "Stikini Ring", -- +5
        back = "Ghostfyre Cape", -- +7(20**)
		waist = "Emphatikos Rope", -- [+1]
		legs = "Shedir Seraweels", -- [+1]
		feet = "Lethargy Houseaux +1" -- +25 (30)
	} -- +57 skill | +5 Aquaveil | +85% Duration (** denotes augmented +% duration)
	
	--Stoneskin+ -> Duration+ -> CMP
	--Spells: Stoneskin
	sets.midcast.Enhancing_stoneskin = {
		head = TelchineHead.Enh, -- (10**)
		neck = "Nodens Gorget", -- [+30]
        body = "Vitiation Tabard +3", -- (15)
		ear1 = "Mimir Earring", -- +10
		ear2 = "Earthcry Earring", -- [+10]
		hands = "Stone Mufflers", -- [+30]
		ring1 = "Stikini Ring", -- +5
		ring2 = "Stikini Ring", -- +5
        back = "Ghostfyre Cape", -- +7(20**)
		waist = "Embla Sash", -- (5)
		legs = "Shedir Seraweels", -- [+35]
		feet = "Lethargy Houseaux +1" -- +25 (30)
	} -- +45 skill | +105 Stoneskin | +80% Duration (** denotes augmented +% duration)
	
	--Refresh+ -> Duration+ -> CMP
	--Spells: Refresh / Refresh II
	sets.midcast.Enhancing_refresh = {
		head = "Amalric Coif", -- [+1]
		neck = "Duelist's Torque +1", -- (20**)
        body = "Atrophy Tabard +3", -- [+2]
		ear1 = "Mimir Earring", -- +10
		ear2 = "Andoaa Earring", -- +5
		hands = "Atrophy Gloves +3", -- (20)
		ring1 = "Stikini Ring", -- +5
		ring2 = "Stikini Ring", -- +5
        back = "Grapevine Cape", -- [+30s]
		waist = "Gishdubar Sash", -- [+20s]
		legs = "Lethargy Fuseau +1", -- [+2]
		feet = "Lethargy Houseaux +1" -- +25 (30)
	} -- +50 skill | +5 Refresh | +70% / +50s Duration (** denotes augmented +% duration)
	
	--Refresh+ -> Duration+ -> CMP
	--Spells: Refresh / Refresh II
	sets.midcast.Enhancing_refresh_other = {
		head = "Amalric Coif", -- [+1]
		neck = "Duelist's Torque +1", -- (20**)
        body = "Atrophy Tabard +3", -- [+2]
		ear1 = "Mimir Earring", -- +10
		ear2 = "Andoaa Earring", -- +5
		hands = "Atrophy Gloves +3", -- (20)
		ring1 = "Stikini Ring", -- +5
		ring2 = "Stikini Ring", -- +5
        back = "Ghostfyre Cape", -- +7(20)
		waist = "Embla Sash", -- (5)
		legs = "Lethargy Fuseau +1", -- [+2] (10*)
		feet = "Lethargy Houseaux +1" -- +25 (30 + 10*)
	} -- +50 skill | +5 Refresh | +100% Duration (* indicates set total - 4 pieces) (** denotes augmented +% duration)	

	--500 Skill -> Barspell+ -> Duration+ -> CMP
	--Spells: Barstone / Barwater / Baraero / Barfire / Barblizzard / Barthunder
	sets.midcast.Enhancing_barspell = {
		head = TelchineHead.Enh, -- (10**)
		neck = "Duelist's Torque +1", -- (20**)
        body = "Vitiation Tabard +3", -- (15)
		ear1 = "Mimir Earring", -- +10
		ear2 = "Andoaa Earring", -- +5
		hands = "Atrophy Gloves +3", -- (20)
		ring1 = "Stikini Ring", -- +5
		ring2 = "Stikini Ring", -- +5
        back = "Ghostfyre Cape", -- +7(20**)
		waist = "Embla Sash", -- (5)
		legs = "Shedir Seraweels", -- [+15]
		feet = "Lethargy Houseaux +1" -- +25 (30)
	} -- +57 skill | +15 Barspell Potency | +120% Duration (** denotes augmented +% duration)
	
	--500 Skill -> Barspell+ -> Duration+ -> CMP
	--Spells: Barstone / Barwater / Baraero / Barfire / Barblizzard / Barthunder
	--			Barstonra / Barwatera / Baraera / Barfira / Barblizzara / Barthundra
	sets.midcast.Enhancing_barspell_other = {
		head = "Lethargy Chappel +1", -- (20*)
		neck = "Duelist's Torque +1", -- (20**)
        body = "Lethargy Sayon +1", -- (20*)
		ear1 = "Mimir Earring", -- +10
		ear2 = "Andoaa Earring", -- +5
		hands = "Atrophy Gloves +3", -- (20)
		ring1 = "Stikini Ring", -- +5
		ring2 = "Stikini Ring", -- +5
        back = "Ghostfyre Cape", -- +7(20**)
		waist = "Embla Sash", -- (5)
		legs = "Shedir Seraweels", -- [+15]
		feet = "Lethargy Houseaux +1" -- +25 (30 + 20*)
	} -- +57 skill | +15 Barspell Potency | +110% Duration (** denotes augmented +% duration)

	--Regen+ -> Duration+ -> CMP
	--Skill-less spells: Haste / Protect / Shell
	sets.midcast.Enhancing_regen = {
		head = TelchineHead.Enh, -- (10**)
		neck = "Duelist's Torque +1", -- (20**)
        body = TelchineBody.Enh, -- [+12s](10**)
		ear1 = "Mimir Earring", -- +10
		ear2 = "Andoaa Earring", -- +5
		hands = "Atrophy Gloves +3", -- (20)
		ring1 = "Stikini Ring", -- +5
		ring2 = "Stikini Ring", -- +5
        back = "Ghostfyre Cape", -- +7(20**)
		waist = "Embla Sash", -- (5)
		legs = TelchineLegs.Enh, -- (10**)
		feet = "Lethargy Houseaux +1" -- +25 (30)
	} -- +57 skill	| +120% / +12s Duration (** denotes augmented +% duration)	


	--Weapon combos specific to mage-only mode
	sets.Weapon_magic.Enfeebling_skill = {
		main = Grio.Skill, -- +16 
		sub = "Mephitis Grip", -- +5
		ammo = "Regal Gem" -- (10)
	} -- +21 Skill | +10% Effect
	sets.Weapon_magic.Enfeebling_accuracy = {
		main = "Bunzi's Rod",
		sub = "Ammurapi Shield",
		range = "Ullr"
	} -- +118 MAcc
	sets.Weapon_magic.Enfeebling_dispelga = {
		main = "Daybreak",
		sub = "Ammurapi Shield",
		range = "Ullr"
	} -- +118 MAcc


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
	
	
	--Effect+ -> 625 Skill -> MND -> MAcc -> Duration+
	--Spells: Frazzle III | Poison II
	--Theoretical max of -274 MEva possible vs NMs if 625 skill can be reached along with all potency+/Saboteur+ gear
	--Current max skill possible with potency+ is 616 (potential -267 MEva)
	--Capping skill with current sets available provides a max of only 44% potency+ (potential -256 MEva)
	sets.midcast.Enfeebling_skill_frazzle3 = {
        head="Vitiation Chapeau +3", -- +26 (37)
        neck="Duelist's Torque +1", -- (20)[20]{7}
        ear1="Enfeebling Earring", -- +3
        ear2="Vor Earring",	-- +10
        body="Lethargy Sayon +1", -- (27){14}
        hands="Lethargy Gantherots +1", -- +19 (20)
        ring1="Stikini Ring", -- +5 (8)
        ring2="Stikini Ring", -- +5 (8)
        back=Sucellos.Enfeeb, -- (30){10}
        waist="Rumination Sash", -- +7 (3)
        legs="Psycloth Lappas", -- +18 (30)
        feet="Vitiation Boots +3" -- +16 (43){10}	
	} -- +99 Skill (585) | +20% Duration | +41% Effect | +226 MAcc 
	--   (this set provides potential -256 MEva w/ Sab vs NMs [Bolster Languor w/ Idris is only -200])
	--   Poison II potency: 219/tick w/ Sab vs NMs
	
	--625 Skill -> Effect+ -> MND -> MAcc -> Duration+
	--Spells: Frazzle III | Poison II
	--Theoretical max of -274 MEva possible vs NMs if 625 skill can be reached along with all potency+/Saboteur+ gear
	--Current max skill possible with potency+ is 616 (potential -267 MEva)
	--Capping skill with current sets available provides a max of only 44% potency+ (potential -256 MEva)
	--This set lacks skill due to no weapon swaps on cast (meleemode)
	sets.midcast.Enfeebling_skill_frazzle3_melee = {
        head="Vitiation Chapeau +3", -- +26 (37)
        neck="Duelist's Torque +1", -- (20)[20]{7}
        ear1="Enfeebling Earring", -- +3
        ear2="Vor Earring",	-- +10
        body="Atrophy Tabard +3", -- +21 (55)
        hands="Lethargy Gantherots +1", -- +19 (20)
        ring1="Stikini Ring", -- +5 (8)
        ring2="Stikini Ring", -- +5 (8)
        back=Sucellos.Enfeeb, -- (30){10}
        waist="Rumination Sash", -- +7 (3)
        legs="Psycloth Lappas", -- +18 (30)
        feet="Vitiation Boots +3" -- +16 (43){10}	
	} -- +129 Skill (606) | +20% Duration | +27% Effect | +254 MAcc 
	--   (this set provides potential -198 MEva w/ Sab vs NMs [Bolster Languor w/ Idris is only -200])
	--   Poison II potency: 184/tick w/ Sab vs NMs	
	
	--MAcc -> Effect+ -> MND -> Duration+
	--Spells: Frazzle II
	sets.midcast.Enfeebling_skill_frazzle2 = {
        head="Vitiation Chapeau +3", -- +26 (37)
        neck="Duelist's Torque +1", -- (20)[20]{7}
        ear1="Regal Earring", -- (15)
        ear2="Snotra Earring", -- (10)[10]
		body="Atrophy Tabard +3", -- +21 (55)
        hands="Regal Cuffs", -- (45)[20]
        ring1="Stikini Ring", -- +5 (8)
        ring2="Stikini Ring", -- +5 (8)
        back=Sucellos.Enfeeb, -- (30){10}
		waist="Obstinate Sash", -- (15)[5]
        legs="Chironic Hose", -- +18 (50)
        feet="Vitiation Boots +3" -- +16 (43){10}	
	} -- +91 Skill | +65% Duration | +27% Effect | +336 (+100 Spell Bonus) = +446 MAcc (Not including Sab bonus for ~+586 MAcc)
	--   (land this first, then overwrite with Frazzle III. this set provides -79 MEva w/ Sab vs NMs)
	
	--Effect+ -> 610 Skill -> MND -> MAcc -> Duration+
	--Spells: Distract III
	sets.midcast.Enfeebling_skill_distract3 = {
        head="Vitiation Chapeau +3", -- +26 (37)
        neck="Duelist's Torque +1", -- (20)[20]{7}
        ear1="Enfeebling Earring", -- +3
        ear2="Vor Earring",	-- +10
        body="Atrophy Tabard +3", -- +21 (55)
        hands="Lethargy Gantherots +1", -- +19 (20)
        ring1="Stikini Ring", -- +5 (8)
        ring2="Kishar Ring", -- (5)[10]
        back=Sucellos.Enfeeb, -- (30){10}
        waist="Rumination Sash", -- +7 (3)
        legs="Psycloth Lappas", -- +18 (30)
        feet="Vitiation Boots +3" -- +16 (43){10}
	} -- +94 Skill | +30% Duration | +41% Effect | +223 MAcc 
	--   (this set provides potential -264 Eva w/ Sab vs NMs [Bolster Torpor w/ Idris is only -200])
	
	--610 Skill -> Effect+ -> MND -> MAcc -> Duration+
	--Spells: Distract III
	--This set lacks skill due to no weapon swaps on cast (meleemode)
	sets.midcast.Enfeebling_skill_distract3_melee = {
        head="Vitiation Chapeau +3", -- +26 (37)
        neck="Duelist's Torque +1", -- (20)[20]{7}
        ear1="Enfeebling Earring", -- +3
        ear2="Vor Earring",	-- +10
        body="Atrophy Tabard +3", -- (27){14}
        hands="Lethargy Gantherots +1", -- +19 (20)
        ring1="Stikini Ring", -- +5 (8)
        ring2="Kishar Ring", -- (5)[10]
        back=Sucellos.Enfeeb, -- (30){10}
        waist="Rumination Sash", -- +7 (3)
        legs="Psycloth Lappas", -- +18 (30)
        feet="Vitiation Boots +3" -- +16 (43){10}
	} -- +129 Skill (615) | +20% Duration | +27% Effect | +254 MAcc  
	--   (this set provides potential -205 Eva w/ Sab vs NMs [Bolster Torpor w/ Idris is only -200])
	
	--Effect+ -> MND -> MAcc -> Duration+
	--Spells: Slow II | Paralyze II | Addle II
	sets.midcast.Enfeebling_MND = {
        head="Vitiation Chapeau +3", -- +26 (37)
        neck="Duelist's Torque +1", -- (20)[20]{7}
        ear1="Regal Earring",
        ear2="Snotra Earring", -- (10)[10]
        body="Lethargy Sayon +1", -- (27){14}
        hands="Regal Cuffs", -- (45)[20]
        ring1="Stikini Ring", -- +5 (8)
        ring2="Kishar Ring", -- (5)[10]
        back=Sucellos.Enfeeb, -- (30){10}
        waist="Obstinate Sash", -- (15)[5]
        legs="Chironic Hose", -- +18 (50)
        feet="Vitiation Boots +3" -- +16 (43){10}
	} -- +65 Skill | +65% Duration | +41% Effect
	
	--Effect+ -> Duration+
	--Spells: Dia III | Inundation (Due to being longest duration normal set)
	sets.midcast.Enfeebling_effect = {
        head="Vitiation Chapeau +3", -- (37)
        neck="Duelist's Torque +1", -- (20)[20]{7}
        ear1="Regal Earring",
        ear2="Snotra Earring", -- (10)[10]
        body="Lethargy Sayon +1", -- (27)[10*]{14}
        hands="Regal Cuffs", -- (45)[20]
        ring1="Stikini Ring", -- (8)
        ring2="Kishar Ring", -- (5)[10]
        back=Sucellos.Enfeeb, -- (30){10}
        waist="Obstinate Sash", -- (15)[5]
        legs="Lethargy Fuseau +1", -- (22)[10*]
        feet="Vitiation Boots +3" -- +16 (43){10}
	} -- +75% Duration | +41% Effect
	
	--MAcc -> Duration+
	--Spells: Sleep | Sleep II | Sleepga | Bind | Break | Dispel | Dispelga
	--			Gravity | Gravity II | Blind* | Blind II* | Silence
	--			Burn | Choke | Shock | Drown | Rasp | Frost
	-- (*Technically dINT-Based, but landing is often more important than ~5-50 Acc Down lost)
	sets.midcast.Enfeebling_macc = {
        head="Vitiation Chapeau +3", -- +26 (37)
        neck="Duelist's Torque +1", -- (20)[20]{7}
        ear1="Regal Earring", -- (15)
        ear2="Snotra Earring", -- (10)[10]
		body="Atrophy Tabard +3", -- +21 (55)
        hands="Regal Cuffs", -- (45)[20]
        ring1="Stikini Ring", -- +5 (8)
        ring2="Kishar Ring", -- (5) [10]
        back=Sucellos.Enfeeb, -- (30){10}
		waist="Obstinate Sash", -- (15)[5]
        legs="Chironic Hose", -- +18 (50)
        feet="Vitiation Boots +3" -- +16 (43){10}
	} -- +91 Skill | +65% Duration | +27% Effect | +328 MAcc
	
	--MAcc -> CMP
	--Spells: Impact
	--Not Enfeebling Magic, but MAcc is paramount for the spell
	sets.midcast.Enfeebling_impact = {
        head="",
        neck="Duelist's Torque +1", -- (20)
        ear1="Malignance Earring", -- (10)
        ear2="Snotra Earring", -- (10)
		body="Twilight Cloak",
        hands="Regal Cuffs", -- (45)
        ring1="Stikini Ring", -- (8)
        ring2="Stikini Ring", -- (8)
        back=Sucellos.Enfeeb, -- (30)
		waist="Obstinate Sash", -- (15)
        legs="Chironic Hose", -- (50)
        feet="Vitiation Boots +3" -- (43)
	} -- +239 MAcc
	
	--Stymie / Elemental Seal
	--Effect+ -> Lethargy Set Bonus / Duration+ -> Skill -> Mods
	--Best used with Composure bonuses for long, long enfeebs aside from just ensuring something lands.
	-- --Not optimal for potency, Frazzle III / Distract III will be excluded from this set
	-- --in the rules below to stop players from landing bad enfeebles.
	sets.midcast.Enfeebling_stymie = {
        head="Lethargy Chappel +1", -- [35*]
        neck="Duelist's Torque +1", -- (20)[20]{7}
        ear1="Malignance Earring", -- (15)
        ear2="Snotra Earring", -- (10)[10]
		body="Lethargy Sayon +1", -- [35*]{14}
        hands="Regal Cuffs", -- [20]
        ring1="Stikini Ring", -- +5
        ring2="Kishar Ring", -- [10]
        back=Sucellos.Enfeeb, -- {10}
		waist="Obstinate Sash", -- [5]
        legs="Lethargy Fuseau +1", -- [35*]
        feet="Lethargy Houseaux +1" -- [35*]
	} -- +5 Skill | +100% Duration | +31% Effect
	--   (as an example: this set puts the target(s) into a coma, providing a 6:23 sleep vs NMs, 7:09 sleep vs non-NMs)

	
	--White Magic
	--Cures
	sets.midcast.Cure = {
        main="Daybreak", --30/0
		sub="Sacro Bulwark",		
		ammo="Regal Gem",
		head="Kaykaus Mitra", --10/0
		neck="Incanter's Torque",
		ear1="Malignance Earring",
		ear2="Regal Earring",
        body="Kaykaus Bliaut", --5/3
		hands="Vitiation Gloves +3",
        ring1="Janniston Ring +1", --0/6
        ring2="Naji's Loop", --1/1
        back=Sucellos.Enfeeb,
		waist="Luminary Sash",
		legs="Atrophy Tights +2", --11/0
		feet="Vanya Clogs" --12/0
	} -- 50/10
	
	sets.midcast.Cure_melee = {
		head="Kaykaus Mitra", --10/0
		neck="Incanter's Torque",
		ear1="Malignance Earring",
		ear2="Regal Earring",
        body="Kaykaus Bliaut", --5/3
		hands=TelchineHands.Enh, --10/0
        ring1="Janniston Ring +1", --0/6
        ring2="Naji's Loop", --1/1
        back=Sucellos.Enfeeb,
		waist="Luminary Sash",
		legs="Atrophy Tights +2", --11/0
		feet="Vanya Clogs" --12/0
	} -- 49/10
	
	--Cursna+ -> Healing Skill -> Haste -> FastCast
	sets.midcast.Cursna = {
		head="Kaykaus Mitra",
		neck="Debilis Medallion",
		ear1="Malignance Earring",
		ear2="Loquacious Earring",
		body="Vitiation Tabard +3",
		hands="Leyline Gloves",
		ring1="Menelaus's Ring",
		ring2="Haoma's Ring",
		back=Sucellos.enfeeb,
		waist="Embla Sash",
		legs="Carmine Cuisses +1",
		feet="Vanya Clogs"
	}

	--Banish Effect+
	sets.midcast.Banish_effect = {
		head="Ipoca Beret",
		neck="Jokushu Chain",
		back="Disperser's Cape"
	}


	--Black Magic
	--Elemental
	sets.Weapon_magic.Elemental_mab = {
		main = "Bunzi's Rod", -- 10 (40/40)
		sub = "Ammurapi Shield", -- (38/38)
		ammo = "Pemphredo Tathlum" -- (8/4)
	} -- +10 MBB | +78 MAcc / +72 MAB
	
	sets.midcast.Elemental_mab = {
        head="Jhakri Coronal +2", -- (44/41)
        neck="Baetyl Pendant", -- (0/13)
        ear1="Malignance Earring", -- (10/8) 
        ear2="Regal Earring", -- (0/7)
        body="Shamash Robe", -- (45/45)
        hands="Amalric Gages +1", -- (20/53)
        ring1="Freke Ring", -- (0/8)
        ring2="Acumen Ring", -- (0/4)
        back=Sucellos.Nuke, -- (20/10)
        waist="Eschan Stone", -- (7/7)
        legs=MerlinicLegs.nuke, -- (40/64)
        feet="Amalric Nails +1" -- (20/52)
	} -- +196 MAcc / +312 MAB
	
	sets.midcast.Elemental_burst = {
        head="Ea Hat", --6/6 (40/33)
        neck="Mizukage-no-Kubikazari", --10/0 (0/8)
        ear1="Malignance Earring", -- (10/8)
        ear2="Regal Earring", -- (0/7)
        body="Ea Houppelande", --8/8 (42/39)
        hands="Amalric Gages +1", --0/6 (20/53 + 10*)
        ring1="Freke Ring", -- (0/8)
        ring2="Mujin Band", --0/5
        back=Sucellos.Nuke, -- (20/10)
        waist="Eschan Stone", -- (7/7)
        legs="Ea Slops", -- 7/7 (41/36)
        feet="Amalric Nails +1" -- (20/52 + 10*)
	} -- 31 MBB / 32 MBBII | +208 MAcc / +271 MAB
	
	sets.midcast.Elemental_burst_melee = {
        head="Ea Hat", --6/6 (40/33)
        neck="Mizukage-no-Kubikazari", --10/0 (0/8)
        ear1="Malignance Earring", -- (0/8)
        ear2="Regal Earring", -- (0/7)
        body="Ea Houppelande", --8/8 (42/39)
        hands="Ea Cuffs", --5/5 (39/30)
        ring1="Freke Ring", -- (0/8)
        ring2="Mujin Band", --0/5
        back=Sucellos.Nuke, --(20/10)
        waist="Eschan Stone", -- (7/7)
        legs="Ea Slops", -- 7/7 (41/36)
        feet="Jhakri Pigaches +2" -- 7/0 (42/39)
	} -- 40 MBB / 25 MBBII | +221 MAcc / +230 MAB
	
	--Dark
	sets.Weapon_magic.Dark_drain = {
		main = "Rubicundity", -- +23 (28)[20]
		sub = "Ammurapi Shield", -- (38/38)
		ammo = "Pemphredo Tathlum" -- (8/4)
	} -- +20 Drain/Aspir Potency | +18 Skill | +66 MAcc	
	
	sets.midcast.Dark_drain = {
        head=MerlinicHead.aspir, -- (39)[+9]
        neck="Erra Pendant", -- +10 (17)[+5]
        ear1="Regal Earring", -- (15)
        ear2="Hirudinea Earring", -- [+5]
		body="Atrophy Tabard +3", -- (55)
        hands=MerlinicHands.aspir, -- (9)[+10]
        ring1="Archon Ring", -- (5)
        ring2="Evanescence Ring", -- +10 [+10]
        back=Sucellos.Enfeeb, -- (30)
		waist="Fucho-no-obi", -- [+8]
        legs=MerlinicLegs.aspir, -- (39)[+9]
        feet=MerlinicFeet.aspir	-- (9)[+11]
	} -- +20 Skill | +218 MAcc | +67 Potency
	sets.midcast.Dark_aspir = sets.midcast.Dark_drain
	
	--Macc -> Skill
	sets.midcast.Dark_stun = {
        head="Vitiation Chapeau +3", -- +26 (37)
        neck="Erra Pendant", -- +10 (17)
        ear1="Regal Earring", -- (15)
        ear2="Snotra Earring", -- (10)[10]
		body="Atrophy Tabard +3", -- +21 (55)
        hands="Regal Cuffs", -- (45)[20]
        ring1="Stikini Ring", -- +5 (8)
        ring2="Stikini Ring", -- +5 (8)
        back=Sucellos.Enfeeb, -- (30){10}
		waist="Obstinate Sash", -- (15)[5]
        legs="Chironic Hose", -- +18 (50)
        feet="Vitiation Boots +3" -- +16 (43){10}
	} -- +20 Skill | +325 MAcc

	--Macc -> Skill
	--Only here if you wish to customize these spells
	sets.midcast.Dark_absorb = {
        head="Vitiation Chapeau +3", -- +26 (37)
        neck="Erra Pendant", -- +10 (17)
        ear1="Regal Earring", -- (15)
        ear2="Snotra Earring", -- (10)[10]
		body="Atrophy Tabard +3", -- +21 (55)
        hands="Regal Cuffs", -- (45)[20]
        ring1="Stikini Ring", -- +5 (8)
        ring2="Kishar Ring", -- +5 (8)[+10]
        back=Sucellos.Enfeeb, -- (30){10}
		waist="Obstinate Sash", -- (15)[5]
        legs="Chironic Hose", -- +18 (50)
        feet="Vitiation Boots +3" -- +16 (43){10}
	} -- +20 Skill | +325 MAcc | +10% Duration / +5% Absorb Effect
	

	--Other special gear--
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
		ammo = "Staunch Tathlum +1", -- 0/0/3
		head = "Vitiation Chapeau +3", 
		neck = "Warder's Charm +1", 
		ear1 = "Sanare Earring", 
		ear2 = "Etiolation Earring", -- 0/3/0
		body = "Shamash Robe", -- 10/0/0
		hands = "Nyame Gauntlets", -- 0/0/7
		ring1 = "Mephitas's Ring +1", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Sucellos.FC, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = "Nyame Flanchard", -- 0/0/8
		feet = "Nyame Sollerets" -- 0/0/7		
	} -- 20/3/35
	
	sets.Enmity = {
		ammo = "Sapience Orb", 
		head = "Halitus Helm", 
		neck = "Unmoving Collar +1", 
		ear1 = "Cryptic Earring", 
		ear2 = "Trux Earring", 
		body = "Emet Harness +1", 
		hands = "Nyame Gauntlets", 
		ring1 = "Eihwaz Ring", 
		ring2 = "Supershear Ring", 
		back = Sucellos.FC, 
		waist = "Trance Belt",	
		legs = "Zoar Subligar +1", 
		feet = "Nyame Sollerets" 
	}
	
	sets.Swipe = {
        head="Jhakri Coronal +2", -- (44/41)
        neck="Baetyl Pendant", -- (0/13)
        ear1="Malignance Earring", -- (10/8) 
        ear2="Regal Earring", -- (0/7)
        body="Shamash Robe", -- (45/45)
        hands="Amalric Gages +1", -- (20/53)
        ring1="Freke Ring", -- (0/8)
        ring2="Acumen Ring", -- (0/4)
        back=Sucellos.Nuke, -- (20/10)
        waist="Eschan Stone", -- (7/7)
        legs=MerlinicLegs.nuke, -- (40/64)
        feet="Amalric Nails +1" -- (20/52)	
	} -- +196 MAcc / +312 MAB
	
	sets.Swipe_MB = {
        head="Ea Hat", --6/6 (40/33)
        neck="Mizukage-no-Kubikazari", --10/0 (0/8)
        ear1="Malignance Earring", -- (0/8)
        ear2="Regal Earring", -- (0/7)
        body="Ea Houppelande", --8/8 (42/39)
        hands="Ea Cuffs", --5/5 (39/30)
        ring1="Freke Ring", -- (0/8)
        ring2="Mujin Band", --0/5
        back=Sucellos.Nuke, --(20/10)
        waist="Eschan Stone", -- (7/7)
        legs="Ea Slops", -- 7/7 (41/36)
        feet="Jhakri Pigaches +2" -- 7/0 (42/39)
	} -- 40 MBB / 25 MBBII | +221 MAcc / +230 MAB

	--Precast Sets--
	--Expand on these sets as your needs require
	--Assumes no Flurry and 5/5 SS merits, +60 needed to cap
	sets.snapshot = {
		head=TaeonHead.SS, --10/0
        hands="Carmine Fin. Ga. +1", --8/11
		ring2="Crepuscular Ring" --3/0
    } --21/11
	--Assumes Flurry1 and 5/5 SS merits, +45 needed to cap
	sets.snapshotF1 = {
		head=TaeonHead.SS, --10/0
        hands="Carmine Fin. Ga. +1", --8/11
		ring2="Crepuscular Ring" --3/0
    } --21/11
	--Assumes Flurry2 and 5/5 SS merits, +30 needed to cap
	sets.snapshotF2 = {
		head=TaeonHead.SS, --10/0
        hands="Carmine Fin. Ga. +1", --8/11
		ring2="Crepuscular Ring" --3/0
    } --21/11

	
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
    Effect_enfeebles = S{
		'Dia', 'Dia II', 'Dia III', 'Diaga', 'Inundation'}
	
	Skill_enfeebles = S{
		'Frazzle III', 'Distract III'}
	
	MAcc_enfeebles = S{
		'Sleep', 'Sleep II', 'Sleepga', 'Silence', 'Dispel', 'Dispelga', 'Bind', 'Break', 'Gravity', 'Gravity II',
		'Blind', 'Blind II', 'Burn', 'Choke', 'Shock', 'Drown', 'Rasp', 'Frost', 'Repose'}
		
	MND_enfeebles = S{'Slow', 'Slow II', 'Paralyze', 'Paralyze II', 'Addle', 'Addle II'}
		
	Cure_spells = S{
		'Cure', 'Cure II', 'Cure III', 'Cure IV', 'Curaga', 'Curaga II', 'Cura',
		'Healing Breeze', 'Wild Carrot'}
	
    Skill_spells = S{
        'Temper', 'Temper II', 'Enfire', 'Enfire II', 'Enblizzard', 'Enblizzard II', 'Enaero', 'Enaero II',
        'Enstone', 'Enstone II', 'Enthunder', 'Enthunder II', 'Enwater', 'Enwater II', 'Gain-STR', 'Gain-DEX', 
		'Gain-VIT', 'Gain-AGI', 'Gain-INT', 'Gain-MND', 'Gain-CHR'}
		
	Duration_spells = S{
		'Haste', 'Haste II', 'Klimaform', 
		'Aurorastorm', 'Voidstorm', 'Sandstorm', 'Rainstorm', 'Windstorm', 'Firestorm', 'Hailstorm', 'Thunderstorm',
		'Protect', 'Protect II', 'Protect III', 'Protect IV', 'Protect V', 'Protectra', 'Protectra II', 'Protectra III', 
		'Shell', 'Shell II', 'Shell III', 'Shell IV', 'Shell V', 'Shellra', 'Shellra II'}
	
	Barspells = S{
		'Barthunder', 'Barblizzard', 'Barfire', 'Baraero', 'Barwater', 'Barstone', 
		'Barthundra', 'Barblizzara', 'Barfira', 'Baraera', 'Barwatera', 'Barstonra', }
	
	Absorb_spells = S{
		'Absorb-STR', 'Absorb-DEX', 'Absorb-VIT', 'Absorb-AGI', 'Absorb-INT', 'Absorb-MND', 'Absorb-CHR', 'Absorb-ACC'}
		
	Nuke_spells = S{
		'Stone', 'Stone II', 'Stone III', 'Stone IV', 'Stone V', 'Stonega', 'Stonega II', 
		'Water', 'Water II', 'Water III', 'Water IV', 'Water V', 'Waterga', 'Waterga II', 
		'Aero', 'Aero II', 'Aero III', 'Aero IV', 'Aero V', 'Aeroga', 'Aeroga II',
		'Fire', 'Fire II', 'Fire III', 'Fire IV', 'Fire V', 'Firaga', 
		'Blizzard', 'Blizzard II', 'Blizzard III', 'Blizzard IV', 'Blizzard V', 'Blizzaga', 
		'Thunder', 'Thunder II', 'Thunder III', 'Thunder IV', 'Thunder V', 'Thundaga'}
		
	Elemental_WS = S{
		'Sanguine Blade', 'Seraph Blade', 'Shining Blade', 'Red Lotus Blade', 'Burning Blade', 
		'Seraph Strike', 'Shining Strike', 'Flaming Arrow', 'Aeolian Edge'}
		
	LethargySet = S{
		'Lethargy Chappel', 'Leth. Chappel +1', 'Lethargy Sayon', 'Lethargy Sayon +1', 'Lethargy Gantherots', 'Lethargy Gantherots +1', 
		'Lethargy Fuseau', 'Leth. Fuseau +1', 'Lethargy Houseaux', 'Leth. Houseaux +1'}	
		
	Unusable_buff = {
		spell={'Charm','Mute','Omerta','Petrification','Silence','Sleep','Stun','Terror'},
		ability={'Amnesia','Charm','Impairment','Petrification','Sleep','Stun','Terror'}}	

	Enmity_actions = S{'Sentinel', 'Shield Bash', 'Souleater', 'Weapon Bash', 'Vallation', 'Swordplay', 'Pflug', 'Provoke'}

	--Master Base Enfeebling Duration Table (seconds)
	duration30 = S{
		'Break', 'Bind'} --No conclusive data found on min Bind duration
	duration60 = S{
		'Sleep', 'Sleepga', 'Gravity II', 'Dia'} --No conclusive data found on min Gravity II duration
	duration90 = S{
		'Sleep II'}
	duration120 = S{
		'Paralyze', 'Paralyze II', 'Silence', 'Gravity', 'Poison', 'Poison II', 'Dia II'}
	duration180 = S{
		'Slow', 'Slow II', 'Blind', 'Blind II', 'Dia III'}
	duration300 = S{
		'Frazzle', 'Frazzle II', 'Frazzle III', 'Distract', 'Distract II', 'Distract III', 'Inundation'}
	------------------------------------------------------------------------------		
end

--Variables
--
-- Sets the default mode for weapons swaps
-- -- Melee(true): Disallows weapon swaps during casts
-- -- Mage(false): Allows weapon swaps during casts
Melee_mode = false


-- Sets the default mode for magic bursts
Burst_mode = false


-- Sets the default mode for weapon lock
Weapon_lock = false 


-- Sets default for Saboteur Mode between NM and regular mobs
Notorious_monster = false


-- Sets Merits/Job Gifts related to Enfeebling Duration for calculations later
-- -- Replace with the # of Merits you have in this cetegory (5 max)
EnfeeblingDurationMerits = 5
-- -- Replace with the # of Job Points you have in this cetegory (20 max)
EnfeeblingDurationGifts = 20
-- -- Replace with the # of Job Points you have in this cetegory (20 max)
StymieDurationGifts = 20 


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
			determine_equip_set()
			send_command("@input /p Doom off.")
		end
	end
	--Ensures gear slots unlock if you die
	if name == "Weakness" and gain then
		enable('neck','ring1','ring2','waist')
	end
	if S{"terror", "petrification", "sleep", "stun"}:contains(name) then
        if gain then
            equip(sets.SafetyDance)
        else
			if not has_any_buff_of({"terror", "petrification", "sleep", "stun"}) then
				determine_equip_set()
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
end

function prep_startup()
	--Streamlines Variables on load
	-- --Redundant, but I like this to be available to 'standardize'
	-- --startup from one location.
	Melee_mode = false
	Burst_mode = false
	Notorious_monster = false
	Weapon_lock = false
	DW_mode_ind = 2
	
	send_command('@input /echo RDM Loaded, Current Modes::: Melee_mode: OFF | Burst_mode: OFF | Saboteur Mode: Normal | Weapon Lock: OFF | DW_mode: SW')
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
	if spell.english == "Ranged" then
		if buffactive['Flurry II'] then
			equip(sets.snapshotF2)
		elseif buffactive['Flurry'] then
			equip(sets.snapshotF1)
		else
			equip(sets.snapshot)
		end
	elseif (spell.type == 'WhiteMagic' or spell.type == 'BlackMagic') then
		if spell.english == "Dispelga" then
			equip(set_combine(sets.Weapon_magic.Enfeebling_dispelga, sets.precast.FastCast))
		elseif spell.english == "Impact" then
			if Melee_mode == true then
				equip(sets.precast.FastCast_impact)
			else
				equip(set_combine(sets.Weapon_magic.Enfeebling_accuracy, sets.precast.FastCast_impact))
			end
		else
			equip(sets.precast.FastCast)
		end
	elseif spell.type == 'Ninjutsu' then
		equip(sets.precast.NinjutsuFastCast)
	elseif spell.type == 'Waltz' then
		equip(sets.Waltz)
	elseif spell.type == "WeaponSkill" then
		if player.tp >= 1000 then
			--handles ranged WS's
			if spell.target.distance <= 21.5 then
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
				if spell.english == "Sidewinder" or
						spell.english == "Dulling Arrow" or
						spell.english == "Piercing Arrow" then
					equip(sets.RangedWS[sets.WS.index[WS_ind]])
				end						
			else
				cancel_spell()
				send_command("@input /echo Canceled " .. spell.name .. " " .. spell.target.name .. " is Too Far")
			end
			--handles close-range WS's
			if spell.target.distance <= 5.5 then			
				if spell.english == "Knights of Round" then
					equip(sets.Knights[sets.WS.index[WS_ind]])
				end
				if spell.english == "Savage Blade" then
					equip(sets.SavageBlade[sets.WS.index[WS_ind]])
				end
				if spell.english == "Chant du Cygne" then
					equip(sets.CDC[sets.WS.index[WS_ind]])
				end
				if spell.english == "Requiescat" then
					equip(sets.Requiescat[sets.WS.index[WS_ind]])
				end
				if spell.english == "Death Blossom" then
					equip(sets.DeathBlossom[sets.WS.index[WS_ind]])
				end
				if spell.english == "Sanguine Blade" then
					equip(sets.SanguineBlade[sets.WS.index[WS_ind]])
					if world.day_element == "Dark" or world.weather_element == "Dark" then
						equip(sets.obi)
					end
				end
				if spell.english == "Seraph Blade" then
					equip(sets.SeraphBlade[sets.WS.index[WS_ind]])
					if world.day_element == "Light" or world.weather_element == "Light" then
						equip(sets.obi)
					end
				end
				if spell.english == "Shining Blade" then
					equip(sets.ShiningBlade[sets.WS.index[WS_ind]])
					if world.day_element == "Light" or world.weather_element == "Light" then
						equip(sets.obi)
					end
				end
				if spell.english == "Red Lotus Blade" then
					equip(sets.RedLotusBlade[sets.WS.index[WS_ind]])
					if world.day_element == "Fire" or world.weather_element == "Fire" then
						equip(sets.obi)
					end
				end
				if spell.english == "Burning Blade" then
					equip(sets.BurningBlade[sets.WS.index[WS_ind]])
					if world.day_element == "Fire" or world.weather_element == "Fire" then
						equip(sets.obi)
					end
				end
				if spell.english == "Black Halo" then
					equip(sets.BlackHalo[sets.WS.index[WS_ind]])
				end
				if spell.english == "Seraph Strike" then
					equip(sets.SeraphStrike[sets.WS.index[WS_ind]])
					if world.day_element == "Light" or world.weather_element == "Light" then
						equip(sets.obi)
					end
				end
				if spell.english == "Shining Strike" then
					equip(sets.SeraphStrike[sets.WS.index[WS_ind]])
					if world.day_element == "Light" or world.weather_element == "Light" then
						equip(sets.obi)
					end
				end
				if spell.english == "Evisceration" then
					equip(sets.Evisceration[sets.WS.index[WS_ind]])
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
				if spell.english == "Fast Blade" or 
						spell.english == "Flat Blade" or 
						spell.english == "Circle Blade" or
						spell.english == "Vorpal Blade"
				then
					equip(sets.OtherWS[sets.WS.index[WS_ind]])
				elseif spell.type == "WeaponSkill" then
					equip(sets.OtherWS[sets.WS.index[WS_ind]])
				end
			else
				cancel_spell()
				send_command("@input /echo Canceled " .. spell.name .. " " .. spell.target.name .. " is Too Far")
			end
			
		end
	elseif (spell.english == "Convert" and Melee_mode == false) then
		equip(sets.JA.Convert)
	elseif spell.english == "Chainspell" then
		equip(sets.JA.Chainspell)
	elseif Enmity_actions:contains(spell.english) then  
		equip(sets.Enmity)
	elseif spell.english == "Swipe" then  
		if Burst_mode == true then
			equip(sets.Swipe_MB)
		else
			equip(sets.Swipe)
		end
	end
	
	--Hooks for JA/WS Obi swaps
	--This is redundant with the statments above, but covers a list 
	--that can be edited if user wants to remove some for any reason
	if (Elemental_WS:contains(spell.english) or spell.english == "Swipe")
		and 
		(spell.element == world.day_element or spell.element == world.weather_element)
	then
		equip(sets.Obi)
	end
end

function midcast(spell, buff, act)
	--Handles generic recasts as a fallback
	if (spell.type == 'WhiteMagic' or spell.type == 'BlackMagic' or spell.type == 'Ninjutsu' or spell.type == 'Trust') then
		equip(sets.midcast.FastRecast)
	end
	
	
	--Enfeebling Magic
	if (spell.english == "Frazzle III" or spell.english == "Poison II") then
		if Melee_mode == true then
			equip(sets.midcast.Enfeebling_skill_frazzle3_melee)
		else
			equip(set_combine(sets.Weapon_magic.Enfeebling_skill, sets.midcast.Enfeebling_skill_frazzle3))
		end
	end
	if spell.english == "Distract III" then
		if Melee_mode == true then
			equip(sets.midcast.Enfeebling_skill_distract3_melee)
		else
			equip(set_combine(sets.Weapon_magic.Enfeebling_skill, sets.midcast.Enfeebling_skill_distract3))
		end
	end
	if spell.english == "Frazzle II" then
		if Melee_mode == true then
			equip(sets.midcast.Enfeebling_skill_frazzle2)
		else
			equip(set_combine(sets.Weapon_magic.Enfeebling_accuracy, sets.midcast.Enfeebling_skill_frazzle2))
		end
	end
	if MND_enfeebles:contains(spell.english) then
		if Melee_mode == true then
			equip(sets.midcast.Enfeebling_MND)
		else
			equip(set_combine(sets.Weapon_magic.Enfeebling_accuracy, sets.midcast.Enfeebling_MND))
		end
	end
	if (Effect_enfeebles:contains(spell.english) or spell.english == "Inundation") then
		if Melee_mode == true then
			equip(sets.midcast.Enfeebling_effect)
		else
			equip(set_combine(sets.Weapon_magic.Enfeebling_accuracy, sets.midcast.Enfeebling_effect))
		end
	end
	if spell.english == 'Impact' then
		if Melee_mode == true then
			equip(sets.midcast.Enfeebling_impact)
		else
			equip(set_combine(sets.Weapon_magic.Enfeebling_accuracy, sets.midcast.Enfeebling_impact))
		end
	end
	if MAcc_enfeebles:contains(spell.english) then
		if spell.english == "Dispelga" then
			equip(set_combine(sets.Weapon_magic.Enfeebling_dispelga, sets.midcast.Enfeebling_macc))
		elseif Melee_mode == true then
			equip(sets.midcast.Enfeebling_macc)
		else
			equip(set_combine(sets.Weapon_magic.Enfeebling_accuracy, sets.midcast.Enfeebling_macc))
		end
	end

	
	--Enhancing Magic
	if Skill_spells:contains(spell.english) 
		and 
			spell.target.type == 'SELF' or
			(spell.target.type ~= 'SELF' and buffactive['Composure'] == false)
		then
		if Melee_mode == true then
			equip(sets.midcast.Enhancing_skill)
		else
			if DW_mode_ind ~= 1 then
				equip(set_combine(sets.Weapon_magic.Enhancing_skill_SW, sets.midcast.Enhancing_skill))
			else
				equip(set_combine(sets.Weapon_magic.Enhancing_skill_DW, sets.midcast.Enhancing_skill))
			end
		end
	end
	if Skill_spells:contains(spell.english) 
		and 
			buffactive['Composure']
		and
			(buffactive['Accession'] or spell.target.type ~= 'SELF')
		then
		if Melee_mode == true then
			equip(sets.midcast.Enhancing_skill_other)
		else
			if DW_mode_ind ~= 1 then
				equip(set_combine(sets.Weapon_magic.Enhancing_skill_SW, sets.midcast.Enhancing_skill_other))
			else
				equip(set_combine(sets.Weapon_magic.Enhancing_skill_DW, sets.midcast.Enhancing_skill_other))
			end
		end
	end
	
	if Duration_spells:contains(spell.english) 
		and 
			spell.target.type == 'SELF' or
			(spell.target.type ~= 'SELF' and buffactive['Composure'] == false)
		then
		if Melee_mode == true then
			equip(sets.midcast.Enhancing_duration)
		else
			equip(set_combine(sets.Weapon_magic.Enhancing_duration_SW, sets.midcast.Enhancing_duration))
		end
	end
	if Duration_spells:contains(spell.english) 
		and	
			buffactive['Composure']
		and
			((buffactive['Accession'] or spell.target.type ~= 'SELF') or
			(buffactive['Manifestation'] and spell.english == "Klimaform"))
		then
			if Melee_mode == true then
				equip(sets.midcast.Enhancing_duration_other)
			else
				equip(set_combine(sets.Weapon_magic.Enhancing_duration_SW, sets.midcast.Enhancing_duration_other))
			end
		if spell.english == "Klimaform" then
			equip(sets.midcast.Enhancing_duration_other_klimaform)
		end
	end	

	if (spell.english == "Phalanx" or spell.english == "Phalanx II") 
		and 
			spell.target.type == 'SELF' or
			(spell.target.type ~= 'SELF' and buffactive['Composure'] == false)
		then
		if Melee_mode == true then
			equip(sets.midcast.Enhancing_phalanx)
		else
			if DW_mode_ind ~= 1 then
				equip(set_combine(sets.Weapon_magic.Enhancing_phalanx_SW, sets.midcast.Enhancing_phalanx))
			else
				equip(set_combine(sets.Weapon_magic.Enhancing_phalanx_DW, sets.midcast.Enhancing_phalanx))
			end
		end
	end
	if (spell.english == "Phalanx" or spell.english == "Phalanx II")
		and 
			buffactive['Composure']
		and
			(buffactive['Accession'] or spell.target.type ~= 'SELF')
		then
		if Melee_mode == true then
			equip(sets.midcast.Enhancing_phalanx_other)
		else
			if DW_mode_ind ~= 1 then
				equip(set_combine(sets.Weapon_magic.Enhancing_duration_SW, sets.midcast.Enhancing_phalanx_other))
			else
				equip(set_combine(sets.Weapon_magic.Enhancing_duration_DW, sets.midcast.Enhancing_phalanx_other))
			end
		end
	end	
	
	if spell.english == "Aquaveil" 
		and 
			spell.target.type == 'SELF' or
			(spell.target.type ~= 'SELF' and buffactive['Composure'] == false)
		then
		if Melee_mode == true then
			equip(sets.midcast.Enhancing_aquaveil)
		else
			if DW_mode_ind ~= 1 then
				equip(set_combine(sets.Weapon_magic.Enhancing_duration_SW, sets.midcast.Enhancing_aquaveil))
			else
				equip(set_combine(sets.Weapon_magic.Enhancing_duration_SW, sets.midcast.Enhancing_aquaveil))
			end
		end
	end
	if spell.english == "Aquaveil"
		and 
			buffactive['Composure']
		and
			(buffactive['Accession'] or spell.target.type ~= 'SELF')
		then
		if Melee_mode == true then
			equip(sets.midcast.Enhancing_duration_other)
		else
			equip(set_combine(sets.Weapon_magic.Enhancing_duration_SW, sets.midcast.Enhancing_duration_other))
		end
	end	
	
	if spell.english == "Stoneskin" 
		and 
			spell.target.type == 'SELF' or
			(spell.target.type ~= 'SELF' and buffactive['Composure'] == false)
		then
		if Melee_mode == true then
			equip(sets.midcast.Enhancing_stoneskin)
		else
			equip(set_combine(sets.Weapon_magic.Enhancing_duration_SW, sets.midcast.Enhancing_stoneskin))
		end
	end
	if spell.english == "Stoneskin"
		and 
			buffactive['Composure']
		and
			(buffactive['Accession'] or spell.target.type ~= 'SELF')
		then
		if Melee_mode == true then
			equip(sets.midcast.Enhancing_duration_other)
		else
			equip(set_combine(sets.Weapon_magic.Enhancing_duration_SW, sets.midcast.Enhancing_duration_other))
		end
	end
	
	if (spell.english == "Refresh" or spell.english == "Refresh II" or spell.english == "Refresh III")
		and 
			spell.target.type == 'SELF' or
			(spell.target.type ~= 'SELF' and buffactive['Composure'] == false)
		then
		if Melee_mode == true then
			equip(sets.midcast.Enhancing_refresh)
		else
			equip(set_combine(sets.Weapon_magic.Enhancing_duration_SW, sets.midcast.Enhancing_refresh))
		end
	end
	if (spell.english == "Refresh" or spell.english == "Refresh II" or spell.english == "Refresh III")
		and 
			buffactive['Composure']
		and
			(buffactive['Accession'] or spell.target.type ~= 'SELF')
		then
		if Melee_mode == true then
			equip(sets.midcast.Enhancing_refresh_other)
		else
			equip(set_combine(sets.Weapon_magic.Enhancing_duration_SW, sets.midcast.Enhancing_refresh_other))
		end
	end

	if Barspells:contains(spell.english)
		and 
			spell.target.type == 'SELF' or
			(spell.target.type ~= 'SELF' and buffactive['Composure'] == false)
		then
		if Melee_mode == true then
			equip(sets.midcast.Enhancing_barspell)
		else
			equip(set_combine(sets.Weapon_magic.Enhancing_duration_SW, sets.midcast.Enhancing_barspell))
		end
	end
	if Barspells:contains(spell.english)
		and 
			buffactive['Composure']
		and
			(buffactive['Accession'] or spell.target.type ~= 'Self')
		then
		if Melee_mode == true then
			equip(sets.midcast.Enhancing_barspell_other)
		else
			equip(set_combine(sets.Weapon_magic.Enhancing_duration_SW, sets.midcast.Enhancing_barspell_other))
		end
	end

	if (spell.english == "Regen" or spell.english == "Regen II") then
		if Melee_mode == true then
			equip(sets.midcast.Enhancing_regen)
		else
			equip(set_combine(sets.Weapon_magic.Enhancing_regen_SW, sets.midcast.Enhancing_regen))
		end
	end


	--Cures / Cursna / Banish Effect
	if Cure_spells:contains(spell.english) then
		if Melee_mode == true then
			equip(sets.midcast.Cure_melee)
		else
			equip(sets.midcast.Cure)
		end
	end
	if spell.english == "Cursna" then
		equip(sets.midcast.Cursna)
	end
	if (spell.english == "Banish" or spell.english == "Banish II" or spell.english == "Banishga" or spell.english == "Banishga II") then
		equip(sets.midcast.Banish)
		if (spell.english == "Banish" or spell.english == "Banishga") then
			send_command('timers create "'.. spell.english .. ': ' .. spell.target.name .. '" 15 down')
		else
			send_command('timers create "'.. spell.english .. ': ' .. spell.target.name .. '" 30 down')
		end
	end
	if spell.english == "Flash" then
		equip(sets.Enmity)
	end
	

	
	--Nukes
	if Nuke_spells:contains(spell.english) then
		if Burst_mode == false then
			if Melee_mode == true then
				equip(sets.midcast.Elemental_mab)
			else
				equip(set_combine(sets.Weapon_magic.Elemental_mab, sets.midcast.Elemental_mab))
			end
		else
			if Melee_mode == true then
				equip(sets.midcast.Elemental_burst_melee)
			else
				equip(set_combine(sets.Weapon_magic.Elemental_mab, sets.midcast.Elemental_burst))
			end
		end
	end

	
	--Dark Magic
	if (spell.english == "Drain" or spell.english == "Aspir") then
		if Melee_mode == true then
			equip(sets.midcast.Dark_drain)
		else
			equip(set_combine(sets.Weapon_magic.Dark_drain, sets.midcast.Dark_drain))
		end
	end
	if spell.english == "Stun" then
		if Melee_mode == true then
			equip(sets.midcast.Dark_stun)
		else
			equip(set_combine(sets.Weapon_magic.Enfeebling_accuracy, sets.midcast.Dark_stun))
		end
	end
	if Absorb_spells:contains(spell.english) then
		if Melee_mode == true then
			equip(sets.midcast.Dark_absorb)
		else
			equip(set_combine(sets.Weapon_magic.Dark_drain, sets.midcast.Dark_absorb))
		end
	end
	
	
	--Spell Hooks for Obi
	if (Cure_spells:contains(spell.english) or 
		Nuke_spells:contains(spell.english) or 
		(spell.english == "Drain" or spell.english == "Aspir")) 
		and 
		(spell.element == world.day_element or spell.element == world.weather_element) 
	then
		equip(sets.Obi)
	end
	
	
	--Conditional Stymie / Elemental Seal override
	if (buffactive['Stymie'] or buffactive['Elemental Seal']) and (Skill_enfeebles:contains(spell.english) == false and buffactive['Composure']) then
		equip(set_combine(sets.Weapon_magic.Enfeebling_skill, sets.midcast.Enfeebling_stymie))
	end
end

function world.execute(me)
	-- package goddrinksjava;

	-- /**
	 -- * The program GodDrinksJava implements an application that
	 -- * creates an empty simulated world with no meaning or purpose.
	 -- * 
	 -- * @author momocashew
	 -- * @lyrics hibiyasleep
	 -- */
	 
	-- // Switch on the power line
	-- // Remember to put on
	-- // PROTECTION
	-- public class GodDrinksJava {
		-- // Lay down your pieces
		-- // And let's begin
		-- // OBJECT CREATION
		-- public static void main(String[] args) {
			-- // Fill in my data
			-- // parameters
			-- // INITIALIZATION
			-- Thing me = new Lovable("Me", 0, true, -1, false);
			-- Thing you = new Lovable("You", 0, false, -1, false);
			
			-- // Set up our new world
			-- World world = new World(5);
			-- world.addThing(me);
			-- world.addThing(you);
			-- // And let's begin the
			-- // SIMULATION
			-- world.startSimulation();



			-- // If I'm a set of points
			-- if(me instanceof PointSet){
				-- // Then I will give you my
				-- // DIMENSION
				-- you.addAttribute(me.getDimensions().toAttribute());
			-- }

			-- // If I'm a circle
			-- if(me instanceof Circle){
				-- // Then I will give you my
				-- // CIRCUMFERENCE
				-- you.addAttribute(me.getCircumference().toAttribute());
			-- }

			-- // If I'm a sine wave
			-- if(me instanceof SineWave){
				-- // Then you can sit on all my
				-- // TANGENTS
				-- you.addAction("sit", me.getTangent(you.getXPosition()));
			-- }

			-- // If I approach infinity
			-- if(me instanceof Sequence){
				-- // Then you can be my
				-- // LIMITATIONS
				-- me.setLimit(you.toLimit());
			-- }



			-- // Switch my current
			-- // To AC, to DC
			-- me.toggleCurrent();

			-- // And then blind my vision
			-- me.canSee(false);
			-- // So dizzy, so dizzy
			-- me.addFeeling("dizzy");

			-- // Oh, we can travel
			-- world.timeTravelForTwo("AD", 617, me, you);
			-- // To A.D., to B.C.
			-- world.timeTravelForTwo("BC", 3691, me, you);

			-- // And we can unite
			-- world.unite(me, you);
			-- // So deeply, so deeply



			-- // If I can
			-- // If I can give you all the
			-- // SIMULATIONS
			-- if(me.getNumSimulationsAvailable() >=
				-- you.getNumSimulationsNeeded()){
				-- // Then I can
				-- // Then I can be your only
				-- // SATISFACTION
				-- you.setSatisfaction(me.toSatisfaction());
			-- }

			-- // If I can make you happy
			-- if(you.getFeelingIndex("happy") != -1){
				-- // I will run the
				-- // EXECUTION
				-- me.requestExecution(world);
			-- }

			-- // Though we are trapped
			-- // In this strange, strange
			-- // SIMULATION
			-- world.lockThing(me);
			-- world.lockThing(you);



			-- // If I'm an eggplant
			-- if(me instanceof Eggplant){
				-- // Then I will give you my
				-- // NUTRIENTS
				-- you.addAttribute(me.getNutrients().toAttribute());
				-- me.resetNutrients();
			-- }
			-- // If I'm a tomato
			-- if(me instanceof Tomato){
				-- // Then I will give you
				-- // ANTIOXIDANTS
				-- you.addAttribute(me.getAntioxidants().toAttribute());
				-- me.resetAntioxidants();
			-- }
			-- // If I'm a tabby cat
			-- if(me instanceof TabbyCat){
				-- // Then I will purr for your
				-- // ENJOYMENT
				-- me.purr();
			-- }

			-- // If I'm the only god
			-- if(world.getGod().equals(me)){
				-- // Then you're the proof of my
				-- // EXISTENCE
				-- me.setProof(you.toProof());
			-- }



			-- // Switch my gender
			-- // To F, to M
			-- me.toggleGender();
			-- // And then do whatever
			-- // From AM to PM
			-- world.procreate(me, you);
			-- // Oh, switch my role
			-- // To S, to M
			-- me.toggleRoleBDSM();
			-- // So we can enter
			-- // The trance, the trance 
			-- world.makeHigh(me);
			-- world.makeHigh(you);



			-- // If I can
			-- // If I can feel your
			-- // VIBRATIONS
			-- if(me.getSenseIndex("vibration") != -1){
				-- // Then I can
				-- // Then I can finally be
				-- // COMPLETION
				-- me.addFeeling("complete");
			-- }
			-- // Though you have left
			-- world.unlock(you);
			-- world.removeThing(you);
			-- // You have left
			-- me.lookFor(you, world);
			-- // You have left
			-- me.lookFor(you, world);
			-- // You have left
			-- me.lookFor(you, world);
			-- // You have left
			-- me.lookFor(you, world);
			-- // You have left me in
			-- me.lookFor(you, world);
			-- // ISOLATION

			-- // If I can
			-- // If I can erase all the pointless
			-- // FRAGMENTS
			-- if(me.getMemory().isErasable()){
				-- // Then maybe
				-- // Then maybe you won't leave me so
				-- // DISHEARTENED
				-- me.removeFeeling("disheartened");
			-- }

			-- // Challenging your god
			-- try{
				-- me.setOpinion(me.getOpinionIndex("you are here"), false);
			-- }
			-- // You have made some
			-- catch(IllegalArgumentException e){
				-- // ILLEGAL ARGUMENTS
				-- world.announce("God is always true.");
			-- }



			-- // EXECUTION
			-- world.runExecution();
			-- // EXECUTION
			-- world.runExecution();
			-- // EXECUTION
			-- world.runExecution();
			-- // EXECUTION
			-- world.runExecution();
			-- // EXECUTION
			-- world.runExecution();
			-- // EXECUTION
			-- world.runExecution();
			-- // EXECUTION
			-- world.runExecution();
			-- // EXECUTION
			-- world.runExecution();
			-- // EXECUTION
			-- world.runExecution();
			-- // EXECUTION
			-- world.runExecution();
			-- // EXECUTION
			-- world.runExecution();
			-- // EXECUTION
			-- world.runExecution();
			-- // EIN
			-- world.announce("1", "de"); // ein; German
			-- // DOS
			-- world.announce("2", "es"); // dos; Español
			-- // TROIS
			-- world.announce("3", "fr"); // trois; French
			-- // NE
			-- world.announce("4", "kr"); // 넷; Korean
			-- // FEM
			-- world.announce("5", "se"); // fem; Swedish
			-- // LIU
			-- world.announce("6", "cn"); // 六; Chinese
			-- // EXECUTION
			-- world.runExecution();



			-- // If I can
			-- // If I can give them all the
			-- // EXECUTION
			-- if(world.isExecutableBy(me)){
				-- // Then I can
				-- // Then I can be your only
				-- // EXECUTION
				-- you.setExecution(me.toExecution());
			-- }

			-- // If I can have you back
			-- if(world.getThingIndex(you) != -1){
				-- // I will run the
				-- // EXECUTION
				-- world.runExecution();
			-- }

			-- // Though we are trapped
			-- // We are trapped, ah
			-- me.escape(world);



			-- // I've studied
			-- // I've studied how to properly
			-- // LO-O-OVE
			-- me.learnTopic("love");
			-- // Question me
			-- // Question me, I can answer all
			-- // LO-O-OVE
			-- me.takeExamTopic("love");
			-- // I know the
			-- // algebraic expression of
			-- // LO-O-OVE
			-- me.getAlgebraicExpression("love");
			-- // Though you are free
			-- // I am trapped, trapped in
			-- // LO-O-OVE
			-- me.escape("love");



			-- // EXECUTION
			-- world.execute(me);

		-- }

	-- }
end

function aftercast(spell)
	if spell.skill == "Enfeebling Magic" and (spell.english ~= "Dispel" and spell.english ~= "Dispelga") then
		if not spell.interrupted then
			set_enfeebling_duration_timer(spell)
		end
	end
	determine_equip_set()
end

function status_change(new, old)
	if new ~= 'Engaged' then
		if Melee_mode == true then
			if (SJ_ind == 2 or SJ_ind == 3) then
				melee_mode_idle_DW_set()
			else
				melee_mode_idle_SW_set()
			end
		else
			if (SJ_ind == 2 or SJ_ind == 3) then
				mage_mode_idle_DW_set()
			else
				mage_mode_idle_SW_set()
			end
		end
	else
		if Melee_mode == true then
			melee_mode_engaged_set()
		else
			mage_mode_engaged_set()
		end
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
	determine_equip_set()
end

function determine_equip_set()
	if player.status ~= 'Engaged' then
		if (SJ_ind == 2 or SJ_ind == 3) then -- handles nin and dnc SJ swaps
			if Melee_mode == true then -- melee mode
				melee_mode_idle_DW_set()
			else -- mage mode
				mage_mode_idle_DW_set()
			end
		else -- handles other SJ swaps
			if Melee_mode == true then -- melee mode SW idle
				melee_mode_idle_SW_set()
			else -- mage mode SW idle
				mage_mode_idle_SW_set()
			end
		end
	else 
		if Melee_mode == true then -- melee mode engaged
			melee_mode_engaged_set()
		else -- mage mode engaged
			mage_mode_engaged_set()
		end
	end
end

function melee_mode_idle_DW_set()
	equip(
		set_combine(
			sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]],
			sets.Weapon_range[sets.Weapon_range.index[Wr_ind]],
			sets.Idle_melee_DW[sets.Idle_melee_DW.index[Idle_melee_DW_ind]],
			sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
		)
	)
end

function melee_mode_idle_SW_set()
	equip(
		set_combine(
			sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]],
			sets.Weapon_range[sets.Weapon_range.index[Wr_ind]],
			sets.Idle_melee_SW[sets.Idle_melee_SW.index[Idle_melee_SW_ind]],
			sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
		)
	)
end

function mage_mode_idle_DW_set()
	equip(
		set_combine(
			sets.Weapon_range[sets.Weapon_range.index[Wr_ind]],			
			sets.Idle[sets.Idle.index[Idle_ind]],
			sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
		)
	)
end

function mage_mode_idle_SW_set()
	equip(
		set_combine(
			sets.Weapon_range[sets.Weapon_range.index[Wr_ind]],
			sets.Idle[sets.Idle.index[Idle_ind]],
			sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
		)
	)
end

function melee_mode_engaged_set()
	equip(	
		set_combine(
			sets.TP[sets.TP.index[TP_ind]][sets.SJ.index[SJ_ind]],
			sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]],
			sets.Weapon_range[sets.Weapon_range.index[Wr_ind]],
			sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
		)
	)
end

function mage_mode_engaged_set()
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
		determine_equip_set()
	elseif command == "toggle TP set reverse" then
		TP_ind = TP_ind - 1
		if TP_ind < 1 then
			TP_ind = #sets.TP.index
		end
		send_command("@input /echo <----- TP Set changed to " .. sets.TP.index[TP_ind] .. " ----->")
		determine_equip_set()
	elseif command == "toggle Range set" then
		Ranged_ind = Ranged_ind + 1
		if Ranged_ind > #sets.Ranged.index then
			Ranged_ind = 1
		end
		send_command("@input /echo <----- Ranged Set changed to " .. sets.Ranged.index[Ranged_ind] .. " ----->")		
		if player.status ~= 'Engaged' then
			if Melee_mode == true then
				if (SJ_ind == 2 or SJ_ind == 3) then
					melee_mode_idle_DW_set()
				else
					melee_mode_idle_SW_set()
				end
			else
				if (SJ_ind == 2 or SJ_ind == 3) then
					mage_mode_idle_DW_set()
				else
					mage_mode_idle_SW_set()
				end
			end
		else
			if Melee_mode == true then
				melee_mode_engaged_set()
			else
				mage_mode_engaged_set()
				equip(sets.Weapon_range[sets.Weapon_range.index[Wr_ind]])
			end
		end
	elseif command == "toggle Range set reverse" then
		Ranged_ind = Ranged_ind - 1
		if Ranged_ind < 1 then
			Ranged_ind = #sets.Ranged.index
		end
		send_command("@input /echo <----- Ranged Set changed to " .. sets.Range.index[Range_ind] .. " ----->")
		if player.status ~= 'Engaged' then
			if Melee_mode == true then
				if (SJ_ind == 2 or SJ_ind == 3) then
					melee_mode_idle_DW_set()
				else
					melee_mode_idle_SW_set()
				end
			else
				if (SJ_ind == 2 or SJ_ind == 3) then
					mage_mode_idle_DW_set()
				else
					mage_mode_idle_SW_set()
				end
			end
		else
			if Melee_mode == true then
				melee_mode_engaged_set()
			else
				mage_mode_engaged_set()
				equip(sets.Weapon_range[sets.Weapon_range.index[Wr_ind]])
			end
		end
	elseif command == "toggle WS set" then
		WS_ind = WS_ind + 1
		if WS_ind > #sets.WS.index then
			WS_ind = 1
		end
		send_command("@input /echo <----- WS Set changed to " .. sets.WS.index[WS_ind] .. " ----->")
		determine_equip_set()
	elseif command == "toggle WS set reverse" then
		WS_ind = WS_ind - 1
		if WS_ind < 1 then
			WS_ind = #sets.WS.index
		end
		send_command("@input /echo <----- WS Set changed to " .. sets.WS.index[WS_ind] .. " ----->")
		determine_equip_set()	
	elseif command == "toggle Melee Weapon set" then
		Wm_ind = Wm_ind + 1
		if Wm_ind > #sets.Weapon_melee.index then
			Wm_ind = 1
		end
		send_command("@input /echo <----- Melee weapon changed to " .. sets.Weapon_melee.index[Wm_ind] .. " ----->")
		determine_equip_set()
	elseif command == "toggle Range Weapon set" then
		Wr_ind = Wr_ind + 1
		if Wr_ind > #sets.Weapon_range.index then
			Wr_ind = 1
		end
		send_command("@input /echo <----- Range weapon changed to " .. sets.Weapon_range.index[Wr_ind] .. " ----->")
		if Wr_ind == 2 then
			equip(sets.Weapon_range[sets.Weapon_range.index[Wr_ind]])
			disable(range,ammo)
			determine_equip_set()
			send_command("@input /echo Range/Ammo disabled")
		else
			enable(range,ammo)
			determine_equip_set()
			send_command("@input /echo Range/Ammo enabled")
		end
	elseif command == "toggle DW set" then
		DW_mode_ind = DW_mode_ind + 1
		
		if DW_mode_ind > #sets.DW_mode.index then
			DW_mode_ind = 1
			
		end
		if (player.sub_job == 'DNC' and DW_mode_ind == 1) then
			SJ_ind = 3
			equip(sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]])
		elseif (player.sub_job == 'NIN' and DW_mode_ind == 1) then
			SJ_ind = 2
			equip(sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]])
		else
			SJ_ind = 1
			equip(
				sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]],
				sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
			)			
		end
		send_command("@input /echo <----- DW status changed to " .. sets.DW_mode.index[DW_mode_ind] .. " ----->")
		determine_equip_set()
	elseif command == "toggle Idle set" then
		Idle_ind = Idle_ind + 1
		Idle_melee_DW_ind = Idle_melee_DW_ind + 1
		Idle_melee_SW_ind = Idle_melee_SW_ind + 1		
		if Idle_ind > #sets.Idle.index then
			Idle_ind = 1
			Idle_melee_DW_ind = 1
			Idle_melee_SW_ind = 1			
		end
		send_command("@input /echo <----- Idle Set changed to " .. sets.Idle.index[Idle_ind] .. " ----->")
		determine_equip_set()
	elseif command == "toggle Idle set reverse" then
		Idle_ind = Idle_ind - 1
		Idle_melee_DW_ind = Idle_melee_DW_ind - 1
		Idle_melee_SW_ind = Idle_melee_SW_ind - 1
		if Idle_ind < 1 then
			Idle_ind = #sets.Idle.index
			Idle_melee_DW_ind = #sets.Idle_melee_DW.index
			Idle_melee_SW_ind = #sets.Idle_melee_SW.index
		end
		send_command("@input /echo <----- Idle Set changed to " .. sets.Idle.index[Idle_ind] .. " ----->")
		determine_equip_set()
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
			if (SJ_ind == 2 or SJ_ind == 3) then
				melee_mode_idle_DW_set()
			else
				melee_mode_idle_SW_set()
			end
			send_command("@input /echo <----- Melee Mode ----->")
		else
			Melee_mode = false
			if (SJ_ind == 2 or SJ_ind == 3) then
				mage_mode_idle_DW_set()
			else
				mage_mode_idle_SW_set()
			end
			send_command("@input /echo <----- Mage Mode ----->")
		end
	elseif command == "toggle Weapon Lock" then
		if Weapon_lock == false then
			Weapon_lock = true
			send_command("@input /echo <----- Weapon Lock ON ----->")
		else
			Weapon_lock = false
			send_command("@input /echo <----- Weapon Lock OFF ----->")
		end
	elseif command == "toggle Saboteur Mode" then
		if Notorious_monster == true then
			Notorious_monster = false
			send_command("@input /echo <----- Saboteur Mode: Normal ----->")
		else
			Notorious_monster = true
			send_command("@input /echo <----- Saboteur Mode: Notorious Monster ----->")
		end
	end
end


------------------------------------------------------------------------------
------------------------------------------------------------------------------


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
	send_command('timers create "'.. spell.english .. ': ' .. spell.target.name .. '" ' .. DurationTotal .. ' down')
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