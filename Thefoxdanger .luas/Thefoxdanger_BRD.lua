-- 
-- @author Thefoxdanger of Asura
-- BRD.lua v1.0
--
--
-- Note to users:
-- 
-- Intermediate BRD lua created to streamline play with as few toggles and other things to press as possible. Designed to be similar in 
-- function to the rest of Spicyryan's luas in the Github However, this is a job that naturally has a lot of levers to throw, so take time 
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

send_command("bind F10 gs c toggle Weapon set") -- F10 switches between weapon sets
send_command("bind !F10 gs c toggle Weapon set reverse") -- Alt+F10 switches between weapon sets in reverse

send_command("bind F11 gs c toggle WS set") -- F11 switches between WS sets
send_command("bind !F11 gs c toggle WS set reverse") -- Alt+F11 switches between WS sets in reverse

send_command("bind F12 gs c toggle Idle set") -- F12 switches between idle sets
send_command("bind !F12 gs c toggle Idle set reverse") -- Alt+F12 switches between idle sets in reverse

-- less frequently changed/'setup' toggles
send_command("bind @s gs c toggle Extra Song Mode") -- WIN+S toggles Extra Song Mode
send_command("bind !f8 gs c toggle DW set") -- Alt+F8 swap between DualWield and SingleWield for melee sets (can only be toggled if DW is available)
send_command("bind @f8 gs c toggle Melee Mode") -- WIN+F8 swap between mage and melee modes (Determines if weapons swap with casts)


--numpad controls for WS's
-- -- CTRL key for Sword WS
send_command('bind ^numpad0 @input /ws "" <t>')
send_command('bind ^numpad1 @input /ws "" <t>')
send_command('bind ^numpad2 @input /ws "" <t>')
send_command('bind ^numpad3 @input /ws "" <t>')
send_command('bind ^numpad4 @input /ws "" <t>')
send_command('bind ^numpad5 @input /ws "" <t>')
send_command('bind ^numpad6 @input /ws "" <t>')
send_command('bind ^numpad7 @input /ws "" <t>')
send_command('bind ^numpad8 @input /ws "" <t>')
send_command('bind ^numpad9 @input /ws "" <t>')
-- -- Alt key for Club / Dagger / Ranged WS
send_command('bind !numpad0 @input /ws "" <t>')
send_command('bind !numpad1 @input /ws "" <t>')
send_command('bind !numpad2 @input /ws "" <t>')
send_command('bind !numpad3 @input /ws "" <t>')
send_command('bind !numpad4 @input /ws "" <t>')
send_command('bind !numpad5 @input /ws "" <t>')
send_command('bind !numpad6 @input /ws "" <t>')
send_command('bind !numpad7 @input /ws "" <t>')
send_command('bind !numpad8 @input /ws "" <t>')
send_command('bind !numpad9 @input /ws "" <t>')

	
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

	send_command("unbind @s")	
	send_command("unbind !f8")
	send_command("unbind @f8")
	
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
	set_macros(1,17)
	---Set Lockstyle Here
	if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
		set_style(21)
	else
		set_style(21)
	end
	
	
	--Gear Sets Start Here
	--Augmented Gear
	Intarabus = {}
	Intarabus.Idle = { name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}
	Intarabus.TP = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	Intarabus.DW = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10','Phys. dmg. taken-10%',}}
	Intarabus.STR_WS = { name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	Intarabus.DEX_WS = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	Intarabus.Macc = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}


	ChironicHead = {}
	ChironicHead.SIR = { name="Chironic Hat", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','Spell interruption rate down -10%','Mag. Acc.+10',}}
	
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
	

	--SubJob list--
	--Do not change these
	sets.SJ = {}
	sets.SJ.index = {"Other", "Ninja", "Dancer"}
	SJ_ind = 1	


	--Weapon Sets--
	sets.Weapon_melee = {} -- sets weapon combo for melee-mode
	sets.Weapon_melee.index = {"Custom", "Naegling", "Carnwenhan", "Tauret"}
	Wm_ind = 1
	sets.Weapon_melee.Custom={ --intentionally blank so weapons will not swap aside from ammo (allows for manual equipping)
		ammo = "Coiste Bodhar"
	}
	sets.Weapon_melee.Naegling = {
		main = "Naegling",
		sub = "Fusetto +2",
		range = "Linos"
	}
	sets.Weapon_melee.Carnwenhan = {
		main = "Carnwenhan",
		sub = "Gleti's Knife",
		range = "Linos"
	}
	sets.Weapon_melee.Tauret = {
		main = "Tauret",
		sub = "Gleti's Knife",
		range = "Linos"
	}

	-- sets instrument for extra songs
	-- this lua does not use "dummy songs" strictly, but instead will toggle between
	-- the extra song instrument and the normal casting instruments
	sets.Extra_song = {} 
	sets.Extra_song.index = {"none", "Dummy"} 
	Es_ind = 1
	sets.Extra_song.Dummy = {
		range = "Daurdabla"
	}
	sets.Extra_song.none = {}


	sets.DW_mode = {}
	sets.DW_mode.index = {"DW", "notDW"}
	DW_mode_ind = 1

	sets.DW_mode.DW = {}
	sets.DW_mode.notDW = {sub = "Genmei Shield"} -- 10/0/0


	--Idle Sets--
	-- mage-mode
	sets.Idle = {}
	sets.Idle.index = {"Standard", "DT", "Refresh"}
	Idle_ind = 1
	sets.Idle.Standard = {
		main = "Daybreak",
		sub = "Genmei Shield", -- 10/0/0
		range = "Terpander", -- 0/0/3
		head = "Nyame Helm", -- 0/0/7 
		neck = "Loricate Torque +1", -- 0/0/6 
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring", 
		body = "Volte Doublet", 
		hands = "Nyame Gauntlets", -- 0/0/7
		ring1 = "Mephitas's Ring +1", 
		ring2 = "Sheltered Ring",
		back = Intarabus.Idle, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = "Nyame Flanchard", -- 0/0/8
		feet = "Fili Cothurnes +1" 
	} -- 20/0/31
	sets.Idle.DT = {
		main = "Daybreak",
		sub = "Genmei Shield", -- 10/0/0
		range = "Terpander", -- 0/0/3
		head = "Nyame Helm", -- 0/0/7 
		neck = "Warder's Charm +1",  
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring", 
		body = "Volte Doublet", 
		hands = "Nyame Gauntlets", -- 0/0/7
		ring1 = "Mephitas's Ring +1", 
		ring2 = "Sheltered Ring",
		back = Intarabus.Idle, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = "Nyame Flanchard", -- 0/0/8
		feet = "Nyame Sollerets" -- 0/0/7 
	} -- 20/0/32
	sets.Idle.Refresh = {
		main = "Daybreak",
		sub = "Genmei Shield", -- 10/0/0
		range = "Terpander", -- 0/0/3
		head = "Inyanga Tiara +2", -- 0/5/0 
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring", 
		body = "Volte Doublet", 
		hands = "Bunzi's Gloves", -- 0/0/8
		ring1 = "Inyanga Ring", -- 0/2/0
		ring2 = "Defending Ring", -- 0/0/10
		back = Intarabus.Idle, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = "Inyanga Shalwar +2", -- 0/6/0
		feet = "Fili Cothurnes +1" 
	} -- 20/13/27
	
	-- melee-mode (DW)
	sets.Idle_melee_DW = {}
	sets.Idle_melee_DW.index = {"Standard", "DT", "MEva"}
	Idle_melee_DW_ind = 1
	sets.Idle_melee_DW.Standard = {
		range = "Terpander", -- 0/0/3
		head = "Nyame Helm", -- 0/0/7 
		neck = "Loricate Torque +1", -- 0/0/6 
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring", 
		body = "Nyame Mail", -- 0/0/9 
		hands = "Nyame Gauntlets", -- 0/0/7
		ring1 = "Inyanga Ring", -- 0/2/0
		ring2 = "Sheltered Ring",
		back = Intarabus.Idle, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = "Nyame Flanchard", -- 0/0/8
		feet = "Fili Cothurnes +1" 
	} -- 10/2/40
	sets.Idle_melee_DW.DT = {
		range = "Terpander", -- 0/0/3
		head = "Nyame Helm", -- 0/0/7 
		neck = "Warder's Charm +1",
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring", 
		body = "Nyame Mail", -- 0/0/9 
		hands = "Nyame Gauntlets", -- 0/0/7
		ring1 = "Inyanga Ring", -- 0/2/0
		ring2 = "Sheltered Ring",
		back = Intarabus.Idle, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = "Nyame Flanchard", -- 0/0/8
		feet = "Nyame Sollerets" -- 0/0/7 
	} -- 10/2/41
	sets.Idle_melee_DW.Refresh = {
		range = "Terpander", -- 0/0/3
		head = "Nyame Helm", -- 0/0/7 
		neck = "Loricate Torque +1", -- 0/0/6 
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring", 
		body = "Nyame Mail", -- 0/0/9 
		hands = "Nyame Gauntlets", -- 0/0/7
		ring1 = "Inyanga Ring", -- 0/2/0
		ring2 = "Sheltered Ring",
		back = Intarabus.Idle, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = "Nyame Flanchard", -- 0/0/8
		feet = "Fili Cothurnes +1" 
	} -- 10/2/40
	
	-- melee-mode (Single-Wield)
	sets.Idle_melee_SW = {}
	sets.Idle_melee_SW.index = {"Standard", "DT", "Refresh"}
	Idle_melee_SW_ind = 1
	sets.Idle_melee_SW.Standard = {
		range = "Terpander", -- 0/0/3
		head = "Nyame Helm", -- 0/0/7 
		neck = "Warder's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring", 
		body = "Nyame Mail", -- 0/0/9 
		hands = "Nyame Gauntlets", -- 0/0/7
		ring1 = "Inyanga Ring", -- 0/2/0
		ring2 = "Sheltered Ring",
		back = Intarabus.Idle, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = "Nyame Flanchard", -- 0/0/8
		feet = "Fili Cothurnes +1" 
	} -- 10/2/34	
	sets.Idle_melee_SW.DT = {
		range = "Terpander", -- 0/0/3
		head = "Nyame Helm", -- 0/0/7 
		neck = "Warder's Charm +1",
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring", 
		body = "Nyame Mail", -- 0/0/9 
		hands = "Nyame Gauntlets", -- 0/0/7
		ring1 = "Inyanga Ring", -- 0/2/0
		ring2 = "Sheltered Ring",
		back = Intarabus.Idle, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = "Nyame Flanchard", -- 0/0/8
		feet = "Nyame Sollerets" -- 0/0/7 
	} -- 10/2/41
	sets.Idle_melee_SW.Refresh = {
		range = "Terpander", -- 0/0/3
		head = "Inyanga Tiara +2", -- 0/5/0 
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring", 
		body = "Volte Doublet", 
		hands = "Bunzi's Gloves", -- 0/0/8
		ring1 = "Inyanga Ring", -- 0/2/0
		ring2 = "Defending Ring", -- 0/0/10
		back = Intarabus.Idle, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = "Inyanga Shalwar +2", -- 0/6/0
		feet = "Fili Cothurnes +1" 
	} -- 10/13/27	



	--TP Sets--
	sets.TP = {}
	sets.TP.index = {"Standard", "DT", "Enspells_high_damage"}
	TP_ind = 1

	sets.TP.Standard = {}
	sets.TP.Standard.index = {"Other", "Ninja", "Dancer"}
	sets.TP.Standard.Other = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Crepuscular Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.TP, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 38DA/2TA/5QA | 33 sTP
	
	-- I use the same set throughout DW tiers for this job
	-- If your BRD is not haste capped then you are probably doing it wrong
	sets.TP.Standard.Ninja = {} -- DWIII (25%)
	sets.TP.Standard.Ninja.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45", "Haste_50", "Haste_55"}
	-- 49 DW needed
	sets.TP.Standard.Ninja.Haste_0 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.TP, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 11 DW
	-- 47 DW needed
	sets.TP.Standard.Ninja.Haste_5 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.TP, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 11 DW
	-- 45 DW needed
	sets.TP.Standard.Ninja.Haste_10 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.TP, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 11 DW
	-- 42 DW needed
	sets.TP.Standard.Ninja.Haste_15 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.TP, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 11 DW
	-- 39 DW needed
	sets.TP.Standard.Ninja.Haste_20 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.TP, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 11 DW
	-- 35 DW needed
	sets.TP.Standard.Ninja.Haste_25 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.TP, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 11 DW
	-- 31 DW needed
	sets.TP.Standard.Ninja.Haste_30 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.TP, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 11 DW
	-- 25 DW needed
	sets.TP.Standard.Ninja.Haste_35 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.TP, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 11 DW
	-- 18 DW needed
	sets.TP.Standard.Ninja.Haste_40 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.TP, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 11 DW
	-- 11 DW needed
	sets.TP.Standard.Ninja.Haste_45 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.TP, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 11 DW
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
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.DW, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 21 DW
	-- 57 DW needed
	sets.TP.Standard.Dancer.Haste_5 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.DW, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 21 DW
	-- 55 DW needed
	sets.TP.Standard.Dancer.Haste_10 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.DW, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 21 DW
	-- 52 DW needed
	sets.TP.Standard.Dancer.Haste_15 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.DW, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 21 DW
	-- 49 DW needed
	sets.TP.Standard.Dancer.Haste_20 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.DW, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 21 DW
	-- 45 DW needed
	sets.TP.Standard.Dancer.Haste_25 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.DW, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 21 DW
	-- 41 DW needed
	sets.TP.Standard.Dancer.Haste_30 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.DW, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 21 DW
	-- 35 DW needed
	sets.TP.Standard.Dancer.Haste_35 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.DW, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 21 DW
	-- 28 DW needed
	sets.TP.Standard.Dancer.Haste_40 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.DW, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 21 DW
	-- 21 DW needed
	sets.TP.Standard.Dancer.Haste_45 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.DW, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 21 DW
	-- 15 DW needed
	sets.TP.Standard.Dancer.Haste_50 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.DW, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 21 DW
	-- 9 DW needed
	sets.TP.Standard.Dancer.Haste_55 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.DW, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 21 DW



	sets.TP.DT = {}
	sets.TP.DT.index = {"Other", "Ninja", "Dancer"}
	sets.TP.DT.Other = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Crepuscular Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.TP, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 38DA/2TA/5QA | 33 sTP		
	
	sets.TP.DT.Ninja = {}
	sets.TP.DT.Ninja.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45", "Haste_50", "Haste_55"}
	-- 49 DW needed
	sets.TP.DT.Ninja.Haste_0 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.TP, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 11 DW | 10/0/32 PDT/MDT/DT
	-- 47 DW needed
	sets.TP.DT.Ninja.Haste_5 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.TP, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 11 DW | 10/0/32 PDT/MDT/DT
	-- 45 DW needed
	sets.TP.DT.Ninja.Haste_10 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.TP, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 11 DW | 10/0/32 PDT/MDT/DT
	-- 42 DW needed
	sets.TP.DT.Ninja.Haste_15 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.TP, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 11 DW | 10/0/32 PDT/MDT/DT
	-- 39 DW needed
	sets.TP.DT.Ninja.Haste_20 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.TP, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 11 DW | 10/0/32 PDT/MDT/DT
	-- 35 DW needed
	sets.TP.DT.Ninja.Haste_25 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.TP, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 11 DW | 10/0/32 PDT/MDT/DT
	-- 31 DW needed
	sets.TP.DT.Ninja.Haste_30 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.TP, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 11 DW | 10/0/32 PDT/MDT/DT
	-- 25 DW needed
	sets.TP.DT.Ninja.Haste_35 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.TP, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 11 DW | 10/0/32 PDT/MDT/DT
	-- 18 DW needed
	sets.TP.DT.Ninja.Haste_40 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.TP, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 11 DW | 10/0/32 PDT/MDT/DT
	-- 11 DW needed
	sets.TP.DT.Ninja.Haste_45 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.TP, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 11 DW | 10/0/32 PDT/MDT/DT
	-- 6 DW needed (Not currently possible to determine haste samba from outside source - this may become a toggle later)
	sets.TP.DT.Ninja.Haste_50 = sets.TP.DT.Ninja.Haste_45
	-- 0 DW needed (Not currently possible to determine haste samba from outside source - this may become a toggle later)
	sets.TP.DT.Ninja.Haste_55 = sets.TP.DT.Ninja.Haste_45
	
	
	
	sets.TP.DT.Dancer = {}
	sets.TP.DT.Dancer.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45", "Haste_50", "Haste_55"}
	-- 59 DW needed
	sets.TP.DT.Dancer.Haste_0 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.DW, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 21 DW
	-- 57 DW needed
	sets.TP.DT.Dancer.Haste_5 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.DW, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 21 DW
	-- 55 DW needed
	sets.TP.DT.Dancer.Haste_10 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.DW, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 21 DW
	-- 52 DW needed
	sets.TP.DT.Dancer.Haste_15 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.DW, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 21 DW
	-- 49 DW needed
	sets.TP.DT.Dancer.Haste_20 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.DW, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 21 DW
	-- 45 DW needed
	sets.TP.DT.Dancer.Haste_25 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.DW, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 21 DW
	-- 41 DW needed
	sets.TP.DT.Dancer.Haste_30 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.DW, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 21 DW
	-- 35 DW needed
	sets.TP.DT.Dancer.Haste_35 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.DW, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 21 DW
	-- 28 DW needed
	sets.TP.DT.Dancer.Haste_40 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.DW, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 21 DW
	-- 21 DW needed
	sets.TP.DT.Dancer.Haste_45 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.DW, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 21 DW
	-- 15 DW needed
	sets.TP.DT.Dancer.Haste_50 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.DW, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 21 DW
	-- 9 DW needed
	sets.TP.DT.Dancer.Haste_55 = {
		head = "Ayanmo Zucchetto +2", 
		neck = "Bard's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Ayanmo Corrazza +2", 
		hands = "Bunzi's Gloves", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Intarabus.DW, 
		waist = "Reiki Yotai",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	} -- 33DA/0TA/5QA | 29 sTP | 21 DW


	--Weaponskill Sets--
	--Sword
	sets.WS = {}
	sets.WS.index = {"Attack", "AttackCapped"}
	WS_ind = 1

	sets.SavageBlade = {}
	sets.SavageBlade.Attack = {
		range = "Linos",
		head = "Nyame Helm",
		neck = "Caro Necklace", 
		ear1 = "Regal Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Bihu Justaucorps +3",
		hands = "Nyame Gauntlets",
		ring1 = "Shukuyu Ring", 
		ring2 = "Rufescent Ring",
		back = Intarabus.STR_WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.SavageBlade.AttackCapped = {
		range = "Linos",
		head = "Nyame Helm",
		neck = "Bard's Charm +1", 
		ear1 = "Regal Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Bunzi's Robe",
		hands = "Nyame Gauntlets",
		ring1 = "Shukuyu Ring", 
		ring2 = "Rufescent Ring",
		back = Intarabus.STR_WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}	
	
	sets.SanguineBlade = {}
	sets.SanguineBlade.Attack = {
		range = "Linos",
		head = "Pixie Hairpin +1",
		neck = "Baetyl Pendant", 
		ear1 = "Regal Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Rufescent Ring",
		back = Intarabus.STR_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.SanguineBlade.AttackCapped = {
		range = "Linos",
		head = "Pixie Hairpin +1",
		neck = "Baetyl Pendant", 
		ear1 = "Regal Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Rufescent Ring",
		back = Intarabus.STR_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}

	sets.RedLotusBlade = {}
	sets.RedLotusBlade.Attack = {
		range = "Linos",
		head = "Nyame Helm",
		neck = "Baetyl Pendant", 
		ear1 = "Regal Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Rufescent Ring",
		back = Intarabus.STR_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.RedLotusBlade.AttackCapped = {
		range = "Linos",
		head = "Nyame Helm",
		neck = "Baetyl Pendant", 
		ear1 = "Regal Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Rufescent Ring",
		back = Intarabus.STR_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}	
	
	sets.BurningBlade = {}
	sets.BurningBlade.Attack = { --commented out for SC purposes in Omen
		-- range = "Linos",
		-- head = "Nyame Helm",
		-- neck = "Baetyl Pendant", 
		-- ear1 = "Regal Earring", 
		-- ear2 = "Moonshade Earring", 		
		-- body = "Nyame Mail",
		-- hands = "Nyame Gauntlets",
		-- ring1 = "Metamorph Ring +1", 
		-- ring2 = "Rufescent Ring",
		-- back = Intarabus.STR_WSD, 
		-- waist = "Eschan Stone",	
		-- legs = "Nyame Flanchard", 
		-- feet = "Nyame Sollerets"
	}
	sets.BurningBlade.AttackCapped = { --commented out for SC purposes in Omen
		-- range = "Linos",
		-- head = "Nyame Helm",
		-- neck = "Baetyl Pendant", 
		-- ear1 = "Regal Earring", 
		-- ear2 = "Moonshade Earring", 		
		-- body = "Nyame Mail",
		-- hands = "Nyame Gauntlets",
		-- ring1 = "Metamorph Ring +1", 
		-- ring2 = "Rufescent Ring",
		-- back = Intarabus.STR_WSD, 
		-- waist = "Eschan Stone",	
		-- legs = "Nyame Flanchard", 
		-- feet = "Nyame Sollerets"
	}	
	
	sets.SeraphBlade = {}
	sets.SeraphBlade.Attack = {
		range = "Linos",
		head = "Nyame Helm",
		neck = "Baetyl Pendant", 
		ear1 = "Regal Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Rufescent Ring",
		back = Intarabus.STR_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.SeraphBlade.AttackCapped = {
		range = "Linos",
		head = "Nyame Helm",
		neck = "Baetyl Pendant", 
		ear1 = "Regal Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Rufescent Ring",
		back = Intarabus.STR_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}

	sets.ShiningBlade = {}
	sets.ShiningBlade.Attack = { --commented out for SC purposes in Omen
		-- range = "Linos",
		-- head = "Nyame Helm",
		-- neck = "Baetyl Pendant", 
		-- ear1 = "Regal Earring", 
		-- ear2 = "Moonshade Earring", 		
		-- body = "Nyame Mail",
		-- hands = "Nyame Gauntlets",
		-- ring1 = "Metamorph Ring +1", 
		-- ring2 = "Rufescent Ring",
		-- back = Intarabus.STR_WSD, 
		-- waist = "Eschan Stone",	
		-- legs = "Nyame Flanchard", 
		-- feet = "Nyame Sollerets"
	}
	sets.ShiningBlade.AttackCapped = { --commented out for SC purposes in Omen
		-- range = "Linos",
		-- head = "Nyame Helm",
		-- neck = "Baetyl Pendant", 
		-- ear1 = "Regal Earring", 
		-- ear2 = "Moonshade Earring", 		
		-- body = "Nyame Mail",
		-- hands = "Nyame Gauntlets",
		-- ring1 = "Metamorph Ring +1", 
		-- ring2 = "Rufescent Ring",
		-- back = Intarabus.STR_WSD, 
		-- waist = "Eschan Stone",	
		-- legs = "Nyame Flanchard", 
		-- feet = "Nyame Sollerets"
	}	

	--Dagger
	sets.MordantRime = {}
	sets.MordantRime.Attack = {
		range = "Linos",
		head = "Nyame Helm",
		neck = "Bard's Charm +1", 
		ear1 = "Mache Earring +1", 
		ear2 = "Regal Earring", 		
		body = "Bihu Justaucorps +3",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Ilabrat Ring",
		back = Intarabus.DEX_WSD, 
		waist = "Grunfeld Rope",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.MordantRime.AttackCapped = {
		range = "Linos",
		head = "Nyame Helm",
		neck = "Bard's Charm +1",
		ear1 = "Mache Earring +1", 
		ear2 = "Regal Earring", 		
		body = "Bunzi's Robe",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Ilabrat Ring",
		back = Intarabus.DEX_WSD, 
		waist = "Grunfeld Rope",
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}

	sets.Rudra = {}
	sets.Rudra.Attack = {
		range = "Linos",
		head = "Nyame Helm",
		neck = "Bard's Charm +1", 
		ear1 = "Mache Earring +1", 
		ear2 = "Moonshade Earring", 		
		body = "Bihu Justaucorps +3",
		hands = "Nyame Gauntlets",
		ring1 = "Petrov Ring", 
		ring2 = "Ilabrat Ring",
		back = Intarabus.DEX_WSD, 
		waist = "Grunfeld Rope",
		legs = "Lustratio Subligar +1", 
		feet = "Lustratio Leggings +1"
	}
	sets.Rudra.AttackCapped = {
		range = "Linos",
		head = "Nyame Helm",
		neck = "Bard's Charm +1", 
		ear1 = "Mache Earring +1", 
		ear2 = "Moonshade Earring", 		
		body = "Bunzi's Robe",
		hands = "Nyame Gauntlets",
		ring1 = "Petrov Ring", 
		ring2 = "Ilabrat Ring",
		back = Intarabus.DEX_WSD, 
		waist = "Grunfeld Rope",
		legs = "Lustratio Subligar +1", 
		feet = "Lustratio Leggings +1"
	}	
	
	sets.Evisceration = {}
	sets.Evisceration.Attack = {
		range = "Linos",
		head = "Nyame Helm",
		neck = "Fotia Gorget", 
		ear1 = "Mache Earring +1", 
		ear2 = "Mache Earring +1", 		
		body = "Ayanmo Corrazza +2",
		hands = "Bunzi's Gloves",
		ring1 = "Petrov Ring", 
		ring2 = "Ilabrat Ring",
		back = Intarabus.TP, 
		waist = "Fotia Belt",	
		legs = "Lustratio Subligar +1", 
		feet = "Lustrtio Leggings +1"
	}
	sets.Evisceration.AttackCapped = {
		range = "Linos",
		head = "Nyame Helm",
		neck = "Bard's Charm +1", 
		ear1 = "Mache Earring +1", 
		ear2 = "Mache Earring +1", 		
		body = "Bunzi's Robe",
		hands = "Bunzi's Gloves",
		ring1 = "Petrov Ring", 
		ring2 = "Ilabrat Ring",
		back = Intarabus.TP, 
		waist = "Fotia Belt",	
		legs = "Lustratio Subligar +1", 
		feet = "Lustrtio Leggings +1"
	}
	
	sets.AeolianEdge = {}
	sets.AeolianEdge.Attack = {
		range = "Linos",
		head = "Nyame Helm",
		neck = "Baetyl Pendant",
		ear1 = "Friomisi Earring",
		ear2 = "Moonshade Earring",
        body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1",
		ring2 = "Ilabrat Ring",
        back = Intarabus.DEX_WSD,
		waist = "Eschan Stone",
		legs = "Nyame Flanchard",
		feet = "Nyame Sollerets"
	}
	sets.AeolianEdge.AttackCapped = {
		range = "Linos",
		head = "Nyame Helm",
		neck = "Baetyl Pendant",
		ear1 = "Friomisi Earring",
		ear2 = "Moonshade Earring",
        body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1",
		ring2 = "Ilabrat Ring",
        back = Intarabus.DEX_WSD,
		waist = "Eschan Stone",
		legs = "Nyame Flanchard",
		feet = "Nyame Sollerets"
	}

	--Club	
	sets.TrueStrike = {}
	sets.TrueStrike.Attack = {
		range = "Linos",
		head = "Nyame Helm",
		neck = "Caro Necklace", 
		ear1 = "Regal Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Bihu Justaucorps +3",
		hands = "Nyame Gauntlets",
		ring1 = "Shukuyu Ring", 
		ring2 = "Rufescent Ring",
		back = Intarabus.STR_WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.TrueStrike.AttackCapped = {
		range = "Linos",
		head = "Nyame Helm",
		neck = "Bard's Charm +1", 
		ear1 = "Regal Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Bunzi's Robe",
		hands = "Nyame Gauntlets",
		ring1 = "Shukuyu Ring", 
		ring2 = "Rufescent Ring",
		back = Intarabus.STR_WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}	
	
	sets.ShiningStrike = {}
	sets.ShiningStrike.Attack = {
		range = "Linos",
		head = "Nyame Helm",
		neck = "Baetyl Pendant", 
		ear1 = "Regal Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Rufescent Ring",
		back = Intarabus.STR_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.ShiningStrike.AttackCapped = {
		range = "Linos",
		head = "Nyame Helm",
		neck = "Baetyl Pendant", 
		ear1 = "Regal Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Rufescent Ring",
		back = Intarabus.STR_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}	
	
	sets.SeraphStrike = {}
	sets.SeraphStrike.Attack = {
		range = "Linos",
		head = "Nyame Helm",
		neck = "Baetyl Pendant", 
		ear1 = "Regal Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Rufescent Ring",
		back = Intarabus.STR_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.SeraphStrike.AttackCapped = {
		range = "Linos",
		head = "Nyame Helm",
		neck = "Baetyl Pendant", 
		ear1 = "Regal Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Rufescent Ring",
		back = Intarabus.STR_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}		

	
	--All Other
	sets.OtherWS = {}
	sets.OtherWS.Attack = {
		range = "Linos",
		head = "Nyame Helm",
		neck = "Caro Necklace", 
		ear1 = "Regal Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Bihu Justaucorps +3",
		hands = "Nyame Gauntlets",
		ring1 = "Shukuyu Ring", 
		ring2 = "Rufescent Ring",
		back = Intarabus.STR_WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.OtherWS.AttackCapped = {
		range = "Linos",
		head = "Nyame Helm",
		neck = "Bard's Charm +1", 
		ear1 = "Regal Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Bunzi's Robe",
		hands = "Nyame Gauntlets",
		ring1 = "Shukuyu Ring", 
		ring2 = "Rufescent Ring",
		back = Intarabus.STR_WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}


	--Job Ability Sets--
	sets.SoulVoice = {legs = "Bihu Cannions +1"}
	sets.Troubador = {body = "Bihu Justaucorps +3"}
	sets.Nightingale = {feet = "Bihu Slippers +1"}
	
	sets.Waltz ={
	-- Insert gear here as desired
	}
	
	sets.precast = {}
	sets.precast.FastCast = {
		main = "Kali", -- 7
		sub = "Genmei Shield",
		head = "Bunzi's Hat", -- 10
		neck = "Orunmila's Torque", -- 5
		ear1 = "Enchanter's Earring +1", -- 2
		ear2 = "Loquacious Earring", -- 2
		body = "Inyanga Jubbah +2", -- 14
		hands = "Leyline Gloves", -- 8
		ring1 = "Kishar Ring", -- 4
		ring2 = "Rahab Ring", -- 2
		waist = "Witful Belt", -- 3 (3)
		back = Intarabus.Idle, -- 10
		legs = "Kaykaus Tights +1", -- 7
		feet = "Volte Gaiters" -- 6	
	} -- 80% FC (3 QM)
	
	sets.precast.FastCast_melee = {
		head = "Bunzi's Hat", -- 10
		neck = "Orunmila's Torque", -- 5
		ear1 = "Enchanter's Earring +1", -- 2
		ear2 = "Loquacious Earring", -- 2
		body = "Inyanga Jubbah +2", -- 14
		hands = "Leyline Gloves", -- 8
		ring1 = "Kishar Ring", -- 4
		ring2 = "Rahab Ring", -- 2
		waist = "Witful Belt", -- 3 (3)
		back = Intarabus.Idle, -- 10
		legs = "Kaykaus Tights +1", -- 7
		feet = "Volte Gaiters" -- 6	
	} -- 73% FC (3 QM)

	sets.precast.FastCast_song = {
		head = "Fili Calot +1", -- 14
		neck = "Orunmila's Torque", -- 5
		ear1 = "Enchanter's Earring +1", -- 2
		ear2 = "Loquacious Earring", -- 2
		body = "Inyanga Jubbah +2", -- 14
		hands = "Leyline Gloves", -- 8
		ring1 = "Kishar Ring", -- 4
		ring2 = "Rahab Ring", -- 2
		waist = "Embla Sash", -- 5
		back = Intarabus.Idle, -- 10
		legs = "Kaykaus Tights +1", -- 7
		feet = "Bihu Slippers +1" -- 8	
	} -- 81% FC

	
	--This is here if you need it for Utsusemi
	sets.precast.NinjutsuFastCast = set_combine(sets.precast.FastCast, {
		--neck = "Magoraga Beads",
	})
	
	sets.midcast = {}
	-- FC here will lower recasts until cap, but its a good idea to put -DT% in midcasts
	sets.midcast.FastRecast = {
		range = "Terpander",
		head = "Bunzi's Hat", -- 10
		neck = "Orunmila's Torque", -- 5
		ear1 = "Enchanter's Earring +1", -- 2
		ear2 = "Loquacious Earring", -- 2
		body = "Inyanga Jubbah +2", -- 14
		hands = "Leyline Gloves", -- 8
		ring1 = "Kishar Ring", -- 4
		ring2 = "Rahab Ring", -- 2
		waist = "Embla Sash", -- 5
		back = Intarabus.Idle, -- 10
		legs = "Kaykaus Tights +1", -- 7
		feet = "Volte Gaiters" -- 6	
	} -- 75% FC | 21% Haste


	--Weapon combos specific to mage-only mode
	sets.Weapon_magic = {}
	sets.Weapon_magic.Enhancing_skill = {
		main = "Pukulatmuj +1",
		sub = "Forfend +1",
		range = "Terpander"
	} -- +11 Skill | +10% Duration


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
	
	
	--For spells that don't have a skill requirement
	sets.midcast.Enhancing = {
		head = TelchineHead.Enh, 
		neck = "Loricate Torque +1", 
        body = TelchineBody.Enh, 
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring", 
		hands = TelchineHands.Enh, 
		ring1 = "Gelatinous Ring +1", 
		ring2 = "Defending Ring", 
        back = Intarabus.Idle, 
		waist = "Embla Sash", 
		legs = TelchineLegs.Enh, 
		feet = TelchineFeet.Enh 
	}  
	
	--Use defined phalanx pieces here if you have them
	sets.midcast.Enhancing_phalanx = {
		-- head = "",  
        -- body = "", 
		-- hands = "", 
		-- legs = "", 
		-- feet = "" 	
	} 
	
	sets.midcast.Enhancing_aquaveil = {
		head = ChironicHead.SIR, 
		neck = "Loricate Torque +1", 
        body = TelchineBody.Enh, 
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring", 
		hands = TelchineHands.Enh, 
		ring1 = "Gelatinous Ring +1", 
		ring2 = "Defending Ring", 
        back = Intarabus.Idle, 
		waist = "Embla Sash", 
		legs = "Shedir Seraweels", 
		feet = TelchineFeet.Enh
	} 
	
	sets.midcast.Enhancing_stoneskin = {
		head = TelchineHead.Enh, 
		neck = "Loricate Torque +1", 
        body = TelchineBody.Enh, 
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring", 
		hands = TelchineHands.Enh, 
		ring1 = "Gelatinous Ring +1", 
		ring2 = "Defending Ring", 
        back = Intarabus.Idle, 
		waist = "Embla Sash", 
		legs = "Shedir Seraweels", 
		feet = TelchineFeet.Enh
	} 
	
	sets.midcast.Enhancing_refresh = {
		head = TelchineHead.Enh, 
		neck = "Loricate Torque +1", 
        body = TelchineBody.Enh, 
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring", 
		hands = TelchineHands.Enh, 
		ring1 = "Gelatinous Ring +1", 
		ring2 = "Defending Ring", 
        back = "Grapevine Cape", 
		waist = "Gishdubar Sash", 
		legs = TelchineLegs.Enh, 
		feet = TelchineFeet.Enh 
	} 
	
	sets.midcast.Enhancing_refresh_other = {
		head = TelchineHead.Enh, 
		neck = "Loricate Torque +1", 
        body = TelchineBody.Enh, 
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring", 
		hands = TelchineHands.Enh, 
		ring1 = "Gelatinous Ring +1", 
		ring2 = "Defending Ring", 
        back = Intarabus.Idle, 
		waist = "Embla Sash", 
		legs = TelchineLegs.Enh, 
		feet = TelchineFeet.Enh 
	}	

	sets.midcast.Enhancing_barspell = {
		head = "Umuthi Hat", 
		neck = "Incanter's Torque", 
        body = TelchineBody.Enh, 
		ear1 = "Mimir Earring", 
		ear2 = "Andoaa Earring", 
		hands = "Inyanga Dastanas +2", 
		ring1 = "Stikini Ring", 
		ring2 = "Stikini Ring", 
        back = "Fi Follet Cape +1", 
		waist = "Embla Sash",
		legs = "Shedir Seraweels", 
		feet = "Kaykaus Boots +1"
	} 


	--Weapon combos specific to mage-only mode
	--Do not put an instrument in these sets
	sets.Weapon_magic.Song_macc = {
		main = "Carnwehnhan",  
		sub = "Ammurapi Shield"
	} 
	sets.Weapon_magic.Song_buff = {
		main = "Carnwehnhan",  
		sub = "Genmei Shield"
	}
	sets.Weapon_magic.MAcc = {
		main = "Gleti's Knife",  
		sub = "Ammurapi Shield"
	}	
	sets.Weapon_magic.Dispelga = {
		main = "Daybreak",
		sub = "Ammurapi Shield"
	}
	
	
	--Songs
	--Instruments
	sets.Instrument = {}
	sets.Instrument.Buff = {range = "Gjallarhorn"}
	sets.Instrument.HonorMarch = {range = "Marsyas"}
	sets.Instrument.Enfeeble_macc = {range = "Terpander"}
	sets.Instrument.AoE_Lullaby1 = {range = "Blurred Harp +1"}
	sets.Instrument.AoE_Lullaby2 = {range = "Blurred Harp +1"} --use Daurdabla here if you cant hit 486 string skill without it
	sets.Instrument.Song_macc = {range = "Gjallarhorn"}
	
	
	--Buffs
	sets.midcast.Song_buff = {
        head="Bunzi's Hat", 
        neck="Moonbow Whistle +1", 
        ear1="Enchanter's Earring +1", 
        ear2="Loquacious Earring", 
		body="Fili Hongreline +1", 
        hands="Bunzi's Gloves", 
        ring1="Gelatinous Ring +1", 
        ring2="Defending Ring", 
        back=Intarabus.Idle, 
		waist="Embla Sash", 
        legs="Inyanga Shalwar +1", 
        feet="Brioso Slippers +3" 
	}
	--Sets to augment buff song types
	sets.March = {
		hands = "Fili Manchettes +1"
	}
	sets.Paeon = {
		head = "Brioso Roundlet +2"
	}
	sets.Ballad = {
		legs = "Fili Rhingrave +1"
	}
	sets.Minne = {
		legs = "Mousai Seraweels +1"
	}	
	sets.Minuet = {
	}
	sets.Madrigal = {
		head = "Fili Calot +1"
	}
	sets.Prelude = {
	}
	sets.Mambo = {
		feet = "Mousai Crackows +1"
	}
	sets.Etude = {
		head = "Mousai Turban +1"
	}
	sets.Carol = {
		hands = "Mousai Gages +1"
	}
	sets.Scherzo = {
		--feet = "Fili Cothurnes +1"
	}
	

	--Enfeebles
	--MAcc (mostly for songs and dispel/dispelga, but BRD can also land stuff like silence too)
	sets.midcast.Song_macc = {
        head="Brioso Roundlet +2", 
        neck="Moonbow Whistle +1", 
        ear1="Enchanter's Earring +1",
		ear2="Regal Earring", 
		body="Fili Hongreline +1", 
        hands="Brioso Cuffs +2", 
        ring1="Metamorph Ring +1", 
        ring2="Stikini Ring", 
        back=Intarabus.Macc, 
		waist="Obstinate Sash", 
        legs="Inyanga Shalwar +2", 
        feet="Brioso Slippers +3"
	}
	
	--Sets to augment song types
	sets.Lullaby = {
		hands = "Brioso Cuffs +2"
	}
	sets.Threnody = {
		body = "Mousai Manteel +1"
	}	
	--the next set is only laid out to help you build for the string skill requirement
	--Shoot for 486 string skill in this set (Horde Lullaby II: 6 yalm radius)
	sets.AoE_Lullaby2 = { 
        head="Brioso Roundlet +2", 
        neck="Moonbow Whistle +1", 
        ear1="Enchanter's Earring +1",
		ear2="Gersemi Earring", 
		body="Brioso Justaucorps +2", 
        hands="Brioso Cuffs +2", 
        ring1="Stikini Ring", 
        ring2="Stikini Ring", 
        back=Intarabus.Macc, 
		waist="Obstinate Sash", 
        legs="Inyanga Shalwar +2", 
        feet="Brioso Slippers +3"
	}
	sets.MAcc = {
        head="Brioso Roundlet +2", 
        neck="Moonbow Whistle +1", 
        ear1="Enchanter's Earring +1",
		ear2="Regal Earring", 
		body="Brioso Justaucorps +2",  
        hands="Brioso Cuffs +2", 
        ring1="Metamorph Ring +1", 
        ring2="Stikini Ring", 
        back=Intarabus.Macc, 
		waist="Obstinate Sash", 
        legs="Brioso Cannions +2", 
        feet="Brioso Slippers +3"	
	}

	
	--White Magic	
	sets.Weapon_magic.Cure = {
	    main="Daybreak",
		sub="Ammurapi Shield", 	
		range="Terpander",
	}
	
	
	--Cures
	sets.midcast.Cure = {
		head="Kaykaus Mitra +1", --11/2
		neck="Incanter's Torque",
		ear1="Meili Earring",
		ear2="Regal Earring",
        body="Kaykaus Bliaut +1", --6/4
		hands="Kaykaus Cuffs +1", -- 11/2
        ring1="Janniston Ring +1", --0/6
        ring2="Menelaus's Ring", 
        back=Intarabus.Idle,
		waist="Luminary Sash",
		legs="Kaykaus Tights +1", --11/2
		feet="Kaykaus Boots +1" --11/2
	} -- 50% CPI | 18% CPII
	
	--Cursna+ -> Healing Skill (until new %-tier) -> Haste -> FastCast
	sets.midcast.Cursna = {
		head="Vanya Hood",
		neck="Debilis Medallion",
		ear1="Meili Earring",
		ear2="Etiolation Earring",
		body="Inyanga Jubbah +2",
		hands="Inyanga Dastanas +2",
		ring1="Haoma's Ring",
		ring2="Menelaus's Ring",
		back="Oretania's Cape +1",
		waist="Witful Belt",
		legs="Kaykaus Tights +1",
		feet="Vanya Clogs"
	} -- 45% Doom removal rate when /sch

	--Banish Effect+
	sets.midcast.Banish_effect = {
		head="Ipoca Beret",
		neck="Jokushu Chain",
		back="Disperser's Cape"
	} -- Effect +37
	

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
		range = "Terpander", -- 0/0/3
		head = "Nyame Helm", -- 0/0/7 
		neck = "Warder's Charm +1",
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring", 
		body = "Nyame Mail", -- 0/0/9 
		hands = "Nyame Gauntlets", -- 0/0/7
		ring1 = "Inyanga Ring", -- 0/2/0
		ring2 = "Sheltered Ring",
		back = Intarabus.Idle, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = "Nyame Flanchard", -- 0/0/8
		feet = "Nyame Sollerets" -- 0/0/7 		
	} -- 10/2/41
	
	sets.Enmity = {
		range = "Terpander", 
		head = "Halitus Helm", 
		neck = "Unmoving Collar +1", 
		ear1 = "Cryptic Earring", 
		ear2 = "Trux Earring", 
		body = "Emet Harness +1", 
		hands = "Bunzi's Gloves", 
		ring1 = "Eihwaz Ring", 
		ring2 = "Supershear Ring", 
		back = Intarabus.Idle, 
		waist = "Trance Belt",	
		legs = "Zoar Subligar +1", 
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
	'Dia', 'Dia II', 'Diaga', 'Sleep', 'Sleep II', 'Sleepga', 'Silence', 'Dispel', 
	'Dispelga', 'Bind', 'Break', 'Gravity', 'Gravity II', 'Blind', 'Slow', 'Paralyze', 
	'Addle', 'Burn', 'Choke', 'Shock', 'Drown', 'Rasp', 'Frost', 'Repose'}
		
	Cure_spells = S{
		'Cure', 'Cure II', 'Cure III', 'Cure IV', 'Curaga', 'Curaga II', 'Curaga III', 'Cura',
		'Healing Breeze', 'Wild Carrot'}
		
	Duration_spells = S{
		'Haste', 'Haste II', 'Flurry', 'Regen', 'Regen II',
		'Aurorastorm', 'Voidstorm', 'Sandstorm', 'Rainstorm', 'Windstorm', 'Firestorm', 'Hailstorm', 'Thunderstorm',
		'Protect', 'Protect II', 'Protect III', 'Protect IV', 'Protectra', 'Protectra II', 'Protectra III', 
		'Shell', 'Shell II', 'Shell III', 'Shell IV', 'Shellra', 'Shellra II', 'Shellra III',
		'Barsleep', 'Barpoison', 'Barparalyze', 'Barblind', 'Barsilence', 'Barpetrify', 'Barvirus', 'Baramnesia', 
		'Barsleepra', 'Barpoisonra', 'Barparalyzra', 'Barblindra', 'Barsilencera', 'Barpetra', 'Barvira', 'Baramnesra',
		'Enfire', 'Enblizzard', 'Enaero', 'Enstone', 'Enthunder', 'Enwater'}
	
	Barspells = S{
		'Barthunder', 'Barblizzard', 'Barfire', 'Baraero', 'Barwater', 'Barstone', 
		'Barthundra', 'Barblizzara', 'Barfira', 'Baraera', 'Barwatera', 'Barstonra'}
	
	Absorb_spells = S{
		'Absorb-STR', 'Absorb-DEX', 'Absorb-VIT', 'Absorb-AGI', 'Absorb-INT', 'Absorb-MND', 'Absorb-CHR', 'Absorb-ACC'}
		
	Nuke_spells = S{
		'Stone', 'Stone II', 'Stone III', 'Stone IV', 'Stone V', 'Stonega', 'Stonega II', 
		'Water', 'Water II', 'Water III', 'Water IV', 'Water V', 'Waterga', 'Waterga II', 
		'Aero', 'Aero II', 'Aero III', 'Aero IV', 'Aero V', 'Aeroga', 'Aeroga II',
		'Fire', 'Fire II', 'Fire III', 'Fire IV', 'Fire V', 'Firaga', 
		'Blizzard', 'Blizzard II', 'Blizzard III', 'Blizzard IV', 'Blizzard V', 'Blizzaga', 
		'Thunder', 'Thunder II', 'Thunder III', 'Thunder IV', 'Thunder V', 'Thundaga',
		'Holy', 
		'Geohelix', 'Hydrohelix', 'Anemohelix', 'Pyrohelix', 'Cryohelix', 'Ionohelix', 'Noctohelix', 'Luminohelix'}
		
	--Songs
	Ballads = S{
		"Mage's Ballad", "Mage's Ballad II", "Mage's Ballad III"}
	
	Carols = S{
		"Fire Carol", "Ice Carol", "Wind Carol", "Earth Carol", "Lightning Carol", "Water Carol", "Light Carol", "Dark Carol",
		"Fire Carol II", "Ice Carol II", "Wind Carol II", "Earth Carol II", "Lightning Carol II", "Water Carol II", "Light Carol II", "Dark Carol II"}
	
	Etudes = S{
		"Sinewy Etude", "Dextrous Etude", "Vivacious Etude", "Quick Etude", "Learned Etude", "Spirited Etude", "Enchanting Etude",
		"Herculean Etude", "Uncanny Etude", "Vital Etude", "Swift Etude", "Sage Etude", "Logical Etude", "Bewitching Etude"}
	
	Madrigals = S{
		"Sword Madrigal", "Blade Madrigal"}
	
	Mambos = S{
		"Sheefoe Mambo", "Dragonfoe Mambo"}
	
	Marches = S{
		"Honor March", "Advancing March", "Victory March"}
	
	Minnes = S{
		"Knight's Minne", "Knight's Minne II", "Knight's Minne III", "Knight's Minne IV", "Knight's Minne V"}
	
	Minuets = S{
		"Valor Minuet", "Valor Minuet II", "Valor Minuet III", "Valor Minuet IV", "Valor Minuet V"}
	
	Paeons = S{
		"Army's Paeon", "Army's Paeon II", "Army's Paeon III", "Army's Paeon IV", "Army's Paeon V", "Army's Paeon VI"}
	
	Preludes = S{
		"Hunter's Prelude", "Archere's Prelude"}
	
	Scherzos = S{
		"Sentinel's Scherzo"}
	
	Misc_buffs = S{
		"Foe Sirvente", "Adventurer's Dirge", "Goddess's Hymnus", "Raptor Mazurka", "Chocobo Mazurka", 
		"Fowl Aubade", "Goblin Gavotte", "Gold Capriccio", "Herb Pastoral", "Puppet's Opretta", "Scop's Opretta", "Shining Fantasia", "Warding Round"}
	
	Buff_song = S{
		"Mage's Ballad", "Mage's Ballad II", "Mage's Ballad III", "Sword Madrigal", "Blade Madrigal", "Sheefoe Mambo", "Dragonfoe Mambo",
		"Fire Carol", "Ice Carol", "Wind Carol", "Earth Carol", "Lightning Carol", "Water Carol", "Light Carol", "Dark Carol",
		"Fire Carol II", "Ice Carol II", "Wind Carol II", "Earth Carol II", "Lightning Carol II", "Water Carol II", "Light Carol II", "Dark Carol II",
		"Sinewy Etude", "Dextrous Etude", "Vivacious Etude", "Quick Etude", "Learned Etude", "Spirited Etude", "Enchanting Etude",
		"Herculean Etude", "Uncanny Etude", "Vital Etude", "Swift Etude", "Sage Etude", "Logical Etude", "Bewitching Etude",
		"Honor March", "Advancing March", "Victory March", "Knight's Minne", "Knight's Minne II", "Knight's Minne III", "Knight's Minne IV", "Knight's Minne V",
		"Valor Minuet", "Valor Minuet II", "Valor Minuet III", "Valor Minuet IV", "Valor Minuet V", "Hunter's Prelude", "Archere's Prelude",
		"Army's Paeon", "Army's Paeon II", "Army's Paeon III", "Army's Paeon IV", "Army's Paeon V", "Army's Paeon VI", "Sentinel's Scherzo"}
	
	Threnodies = S{
		'Fire Threnody', 'Ice Threnody', 'Wind Threnody', 'Earth Threnody', 'Lightning Threnody', 'Water Threnody', 'Light Threnody', 'Dark Threnody',
		'Fire Threnody II', 'Ice Threnody II', 'Wind Threnody II', 'Earth Threnody II', 'Lightning Threnody II', 'Water Threnody II', 'Light Threnody II', 'Dark Threnody II'}
	
	Lullabies = S{
		"Foe Lullaby", "Foe Lullaby II"}
	
	AoE_Lullabies = S{
		"Horde Lullaby", "Horde Lullaby II"}
	
	Macc_songs = S{
		"Magic Finale", "Maiden's Virelai", "Pinning Nocturne",
		"Foe Requiem", "Foe Requiem II", "Foe Requiem III", "Foe Requiem IV", "Foe Requiem V", "Foe Requiem VI", "Foe Requiem VII"}
	
	
	Elemental_WS = S{
		'Sanguine Blade', 'Seraph Blade', 'Shining Blade', 'Red Lotus Blade', 'Burning Blade', 
		'Seraph Strike', 'Shining Strike', 'Flaming Arrow', 'Aeolian Edge'}
		
	Unusable_buff = {
		spell={'Charm','Mute','Omerta','Petrification','Silence','Sleep','Stun','Terror'},
		ability={'Amnesia','Charm','Impairment','Petrification','Sleep','Stun','Terror'}}	

	Enmity_actions = S{'Sentinel', 'Shield Bash', 'Souleater', 'Weapon Bash', 'Vallation', 'Valiance', 'Swordplay', 'Pflug', 'Provoke', 'Flash'}

	--Master Base Enfeebling Song Duration Table (seconds)
	duration30 = S{
		"Foe Lullaby", "Horde Lullaby", "Maiden's Virelai"} 
	duration60 = S{
		'Foe Lullaby II', 'Horde Lullaby II', 
		'Foe Requiem', 'Foe Requiem II', 'Foe Requiem III', 'Foe Requiem IV', 'Foe Requiem V', 'Foe Requiem VI', 'Foe Requiem VII',
		'Fire Threnody', 'Ice Threnody', 'Wind Threnody', 'Earth Threnody', 'Lightning Threnody', 'Water Threnody', 'Light Threnody', 'Dark Threnody'} 
	duration90 = S{
		'Fire Threnody II', 'Ice Threnody II', 'Wind Threnody II', 'Earth Threnody II', 'Lightning Threnody II', 'Water Threnody II', 'Light Threnody II', 'Dark Threnody II'}
	duration120 = S{
		'Battlefield Elegy'}
	duration180 = S{
		'Carnage Elegy'}
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
--Haste_mode
Soul_voice = false
Haste_II = true -- BRD will always have access to High Tier Haste, but this is here in case you dont for some reason


-- Sets the default mode for weapons swaps
-- -- Melee(true): Disallows weapon swaps during casts
-- -- Mage(false): Allows weapon swaps during casts
Melee_mode = false


-- Sets Merits/Job Gifts related to Enfeebling Duration for calculations later
-- -- Replace with the # of Job Points you have in this category (20 max)
ClarionCallGifts = 20
-- -- Replace with the # of Job Points you have in this category (20 max)
TenutoGifts = 20
-- -- Replace with the # of Job Points you have in this category (20 max)
MarcatoGifts = 20
-- -- Replace with the # of Job Points you have in this category (20 max)
LullabyGifts = 20 
-- -- Replace with current JP Total (0~2100)
JPTotal = 2100


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
	if name == "Weakness" and gain then
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
	determine_haste_sets()
end

function prep_startup()
	--Streamlines Variables on load
	-- --Redundant, but I like this to be available to 'standardize'
	-- --startup from one location.
	Melee_mode = false
	DW_mode_ind = 2
	
	send_command('@input /echo BRD Loaded, Current Modes::: Melee_mode: OFF | ExtraSong_mode: OFF | DW_mode: SW')
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

--Pianissimo detection from original motes code
function auto_pianissimo(spell)
	if (((spell.target.type == 'PLAYER' or spell.target.type ~= 'SELF') and not spell.target.charmed) or (spell.target.type == 'NPC' and spell.target.in_party)) and
        not buffactive['Pianissimo'] then
            
		local spell_recasts = windower.ffxi.get_spell_recasts()
		if windower.ffxi.get_ability_recasts()[409] < 1 then
			send_command('@input /ja "Pianissimo" <me>; wait .5; input /ma "'..spell.name..'" '..spell.target.name)
			return
		end
	end
end

-- Job Control Functions
function precast(spell)
	reset_enfeebling_variables()
	if (spell.type == 'WhiteMagic' or spell.type == 'BlackMagic') then
		if spell.english == "Dispelga" then
			equip(set_combine(sets.Weapon_magic.Dispelga, sets.precast.FastCast))
		else
			if player.status == 'Engaged' then
				equip(sets.precast.FastCast_melee)
			else
				equip(sets.precast.FastCast)
			end
		end
	elseif (spell.type == 'BardSong' and Buff_song:contains(spell.english)) then --buffs
		auto_pianissimo(spell)	
		if Melee_mode == true then
			if (spell.english == "Honor March" or (spell.english == "Victory March" and buffactive['Soul Voice'])) then
				equip(
					set_combine(
						sets.precast.Song,
						sets.Instrument.HonorMarch
					)
				)
			else
				equip(
					set_combine(
						sets.precast.Song,
						sets.Instrument.Buff,
						sets.Extra_song[sets.Extra_song.index[Es_ind]]
					)
				)
			end
		else
			if (spell.english == "Honor March" or (spell.english == "Victory March" and buffactive['Soul Voice'])) then
				equip(
					set_combine(
						sets.precast.Song,
						sets.Weapon_magic.Song_buff,
						sets.Instrument.HonorMarch
					)
				)
			else
				equip(
					set_combine(
						sets.precast.Song,
						sets.Weapon_magic.Song_buff,
						sets.Instrument.Buff,
						sets.Extra_song[sets.Extra_song.index[Es_ind]]
					)
				)
			end
		end
	elseif spell.type == 'BardSong' then --debuffs
		if Melee_mode == true then
			equip(
				set_combine(
					sets.precast.Song,
					sets.Instrument.Song_macc
				)
			)
			if AoE_Lullabies:contains(spell.english) then
				if spell.english == "Horde Lullaby II" then
					equip(
						set_combine(
							sets.precast.Song,
							sets.Instrument.AoE_Lullaby2
						)
					)
				else
					equip(
						set_combine(
							sets.precast.Song,
							sets.Instrument.AoE_Lullaby1
						)
					)
				end				
			end
		else --not engaged
			equip(
				set_combine(
					sets.precast.Song,
					sets.Weapon_magic.MAcc,
					sets.Instrument.Song_macc
				)
			)
			if AoE_Lullabies:contains(spell.english) then
				if spell.english == "Horde Lullaby II" then
					equip(
						set_combine(
							sets.precast.Song,
							sets.Weapon_magic.MAcc,
							sets.Instrument.AoE_Lullaby2
						)
					)
				else
					equip(
						set_combine(
							sets.precast.Song,
							sets.Weapon_magic.MAcc,
							sets.Instrument.AoE_Lullaby1
						)
					)
				end				
			end			
		end
	elseif spell.type == 'Ninjutsu' then
		equip(sets.precast.NinjutsuFastCast)
	elseif spell.type == 'Waltz' then
		equip(sets.Waltz)
	elseif spell.type == "WeaponSkill" then
		if player.tp >= 1000 then
			--handles ranged WS's
			if spell.target.distance <= 21.5 then
				-- just in case it comes up, but BRD shoudn't be using a ranged weapon					
			else
				cancel_spell()
				send_command("@input /echo Canceled " .. spell.name .. " " .. spell.target.name .. " is Too Far")
			end
			--handles close-range WS's
			if spell.target.distance <= 5.5 then
				if spell.english == "Savage Blade" then
					equip(sets.SavageBlade[sets.WS.index[WS_ind]])
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
				if spell.english == "True Strike" then
					equip(sets.TrueStrike[sets.WS.index[WS_ind]])
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
				if spell.english == "Mordant Rime" then
					equip(sets.MordantRime[sets.WS.index[WS_ind]])
				end
				if spell.english == "Rudra's Storm" then
					equip(sets.Rudra[sets.WS.index[WS_ind]])
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
						spell.english == "Vorpal Blade" or
						spell.english == "Wasp Sting" or
						spell.english == "Shadowstitch" or
						spell.english == "Viper Bite"
				then
					equip(sets.OtherWS[sets.WS.index[WS_ind]])
				-- elseif spell.type == "WeaponSkill" then
					-- equip(sets.OtherWS[sets.WS.index[WS_ind]])
				end
			else
				cancel_spell()
				send_command("@input /echo Canceled " .. spell.name .. " " .. spell.target.name .. " is Too Far")
			end
			
		end
	elseif spell.english == "Soul Voice" then
		equip(sets.SoulVoice)
	elseif spell.english == "Nightingale" then
		equip(sets.Nightingale)
	elseif spell.english == "Troubador" then
		equip(sets.Troubador)		
	elseif (Enmity_actions:contains(spell.english) and spell.english ~= "Flash") then  
		equip(sets.Enmity)
	end
	
	--Hooks for JA/WS Obi swaps
	--This is redundant with the statments above, but covers a list 
	--that can be edited if user wants to remove some for any reason
	if Elemental_WS:contains(spell.english) then
		equip(sets.obi)
	end
end


function midcast(spell, buff, act)
	--Handles generic recasts as a fallback
	if (spell.type == 'WhiteMagic' or spell.type == 'BlackMagic' or spell.type == 'Ninjutsu' or spell.type == 'Trust') then
		equip(sets.midcast.FastRecast)
	end
	
	
	--Buff Songs
	if Ballads:contains(spell.english) then
		if Melee_mode == true then
			equip(
				set_combine(
					sets.midcast.Song_buff,
					sets.Ballad,
					sets.Instrument.Buff,
					sets.Extra_song[sets.Extra_song.index[Es_ind]]
				)
			)
		else
			equip(
				set_combine(
					sets.midcast.Song_buff,
					sets.Ballad,
					sets.Weapon_magic.Song_buff,
					sets.Instrument.Buff,
					sets.Extra_song[sets.Extra_song.index[Es_ind]]
				)
			)		
		end
	end
	if Carols:contains(spell.english) then
		if Melee_mode == true then
			equip(
				set_combine(
					sets.midcast.Song_buff,
					sets.Carol,
					sets.Instrument.Buff,
					sets.Extra_song[sets.Extra_song.index[Es_ind]]
				)
			)
		else
			equip(
				set_combine(
					sets.midcast.Song_buff,
					sets.Carol,
					sets.Weapon_magic.Song_buff,
					sets.Instrument.Buff,
					sets.Extra_song[sets.Extra_song.index[Es_ind]]
				)
			)		
		end
	end
	if Etudes:contains(spell.english) then
		if Melee_mode == true then
			equip(
				set_combine(
					sets.midcast.Song_buff,
					sets.Etude,
					sets.Instrument.Buff,
					sets.Extra_song[sets.Extra_song.index[Es_ind]]
				)
			)
		else
			equip(
				set_combine(
					sets.midcast.Song_buff,
					sets.Etude,
					sets.Weapon_magic.Song_buff,
					sets.Instrument.Buff,
					sets.Extra_song[sets.Extra_song.index[Es_ind]]
				)
			)		
		end
	end
	if Madrigals:contains(spell.english) then
		if Melee_mode == true then
			equip(
				set_combine(
					sets.midcast.Song_buff,
					sets.Madrigal,
					sets.Instrument.Buff,
					sets.Extra_song[sets.Extra_song.index[Es_ind]]
				)
			)
		else
			equip(
				set_combine(
					sets.midcast.Song_buff,
					sets.Madrigal,
					sets.Weapon_magic.Song_buff,
					sets.Instrument.Buff,
					sets.Extra_song[sets.Extra_song.index[Es_ind]]
				)
			)		
		end
	end
	if Mambos:contains(spell.english) then
		if Melee_mode == true then
			equip(
				set_combine(
					sets.midcast.Song_buff,
					sets.Mambo,
					sets.Instrument.Buff,
					sets.Extra_song[sets.Extra_song.index[Es_ind]]
				)
			)
		else
			equip(
				set_combine(
					sets.midcast.Song_buff,
					sets.Mambo,
					sets.Weapon_magic.Song_buff,
					sets.Instrument.Buff,
					sets.Extra_song[sets.Extra_song.index[Es_ind]]
				)
			)		
		end
	end
	if Marches:contains(spell.english) then
		if (spell.english == "Honor March" or (spell.english == "Victory March" and buffactive['Soul Voice'])) then
			if Melee_mode == true then
				equip(
					set_combine(
						sets.midcast.Song_buff,
						sets.March,
						sets.Instrument.HonorMarch
					)
				)
			else
				equip(
					set_combine(
						sets.midcast.Song_buff,
						sets.March,
						sets.Weapon_magic.Song_buff,
						sets.Instrument.HonorMarch
					)
				)		
			end
		else
			if Melee_mode == true then
				equip(
					set_combine(
						sets.midcast.Song_buff,
						sets.March,
						sets.Instrument.Buff,
						sets.Extra_song[sets.Extra_song.index[Es_ind]]
					)
				)
			else
				equip(
					set_combine(
						sets.midcast.Song_buff,
						sets.March,
						sets.Weapon_magic.Song_buff,
						sets.Instrument.Buff,
						sets.Extra_song[sets.Extra_song.index[Es_ind]]
					)
				)		
			end
		end
	end
	if Minnes:contains(spell.english) then
		if Melee_mode == true then
			equip(
				set_combine(
					sets.midcast.Song_buff,
					sets.Minne,
					sets.Instrument.Buff,
					sets.Extra_song[sets.Extra_song.index[Es_ind]]
				)
			)
		else
			equip(
				set_combine(
					sets.midcast.Song_buff,
					sets.Minne,
					sets.Weapon_magic.Song_buff,
					sets.Instrument.Buff,
					sets.Extra_song[sets.Extra_song.index[Es_ind]]
				)
			)		
		end
	end	
	if Minuets:contains(spell.english) then
		if Melee_mode == true then
			equip(
				set_combine(
					sets.midcast.Song_buff,
					sets.Minuet,
					sets.Instrument.Buff,
					sets.Extra_song[sets.Extra_song.index[Es_ind]]
				)
			)
		else
			equip(
				set_combine(
					sets.midcast.Song_buff,
					sets.Minuet,
					sets.Weapon_magic.Song_buff,
					sets.Instrument.Buff,
					sets.Extra_song[sets.Extra_song.index[Es_ind]]
				)
			)		
		end
	end
	if Paeons:contains(spell.english) then
		if Melee_mode == true then
			equip(
				set_combine(
					sets.midcast.Song_buff,
					sets.Paeon,
					sets.Instrument.Buff,
					sets.Extra_song[sets.Extra_song.index[Es_ind]]
				)
			)
		else
			equip(
				set_combine(
					sets.midcast.Song_buff,
					sets.Paeon,
					sets.Weapon_magic.Song_buff,
					sets.Instrument.Buff,
					sets.Extra_song[sets.Extra_song.index[Es_ind]]
				)
			)		
		end
	end
	if Preludes:contains(spell.english) then
		if Melee_mode == true then
			equip(
				set_combine(
					sets.midcast.Song_buff,
					sets.Prelude,
					sets.Instrument.Buff,
					sets.Extra_song[sets.Extra_song.index[Es_ind]]
				)
			)
		else
			equip(
				set_combine(
					sets.midcast.Song_buff,
					sets.Prelude,
					sets.Weapon_magic.Song_buff,
					sets.Instrument.Buff,
					sets.Extra_song[sets.Extra_song.index[Es_ind]]
				)
			)		
		end
	end	
	if Scherzos:contains(spell.english) then
		if Melee_mode == true then
			equip(
				set_combine(
					sets.midcast.Song_buff,
					sets.Scherzo,
					sets.Instrument.Buff,
					sets.Extra_song[sets.Extra_song.index[Es_ind]]
				)
			)
		else
			equip(
				set_combine(
					sets.midcast.Song_buff,
					sets.Scherzo,
					sets.Weapon_magic.Song_buff,
					sets.Instrument.Buff,
					sets.Extra_song[sets.Extra_song.index[Es_ind]]
				)
			)		
		end
	end
	if Misc_buffs:contains(spell.english) then
		if Melee_mode == true then
			equip(
				set_combine(
					sets.midcast.Song_buff,
					sets.Instrument.Buff,
					sets.Extra_song[sets.Extra_song.index[Es_ind]]
				)
			)
		else
			equip(
				set_combine(
					sets.midcast.Song_buff,
					sets.Weapon_magic.Song_buff,
					sets.Instrument.Buff,
					sets.Extra_song[sets.Extra_song.index[Es_ind]]
				)
			)		
		end
	end	
	
	
	--Enfeebling Songs
	if AoE_Lullabies:contains(spell.english) then
		if spell.english == "Horde Lullaby" then
			if Melee_mode == true then
				equip(
					set_combine(
						sets.midcast.Song_macc,
						sets.Lullaby,
						sets.Instrument.AoE_Lullaby1
					)
				)
			else
				equip(
					set_combine(
						sets.midcast.Song_macc,
						sets.Lullaby,
						sets.Weapon_magic.Song_macc,
						sets.Instrument.AoE_Lullaby1
					)
				)		
			end
		else
			if Melee_mode == true then
				equip(
					set_combine(
						sets.midcast.Song_macc,
						sets.Lullaby,
						sets.Instrument.AoE_Lullaby2
					)
				)
			else
				equip(
					set_combine(
						sets.midcast.Song_macc,
						sets.Lullaby,
						sets.Weapon_magic.Song_macc,
						sets.Instrument.AoE_Lullaby2
					)
				)		
			end
		end
	end
	if Lullabies:contains(spell.english) then
		if Melee_mode == true then
			equip(
				set_combine(
					sets.midcast.Song_macc,
					sets.Lullaby,
					sets.Instrument.Song_macc
				)
			)
		else
			equip(
				set_combine(
					sets.midcast.Song_macc,
					sets.Lullaby,
					sets.Weapon_magic.Song_macc,
					sets.Instrument.Song_macc
				)
			)		
		end
	end	
	if Threnodies:contains(spell.english) then
		if Melee_mode == true then
			equip(
				set_combine(
					sets.midcast.Song_macc,
					sets.Threnody,
					sets.Instrument.Song_macc
				)
			)
		else
			equip(
				set_combine(
					sets.midcast.Song_macc,
					sets.Threnody,
					sets.Weapon_magic.Song_macc,
					sets.Instrument.Song_macc
				)
			)		
		end
	end	
	if Macc_songs:contains(spell.english) then
		if Melee_mode == true then
			equip(
				set_combine(
					sets.midcast.Song_macc,
					sets.Instrument.Song_macc
				)
			)
		else
			equip(
				set_combine(
					sets.midcast.Song_macc,
					sets.Weapon_magic.Song_macc,
					sets.Instrument.Song_macc
				)
			)		
		end
	end	
	
	
	--Enfeebling Magic
	if MAcc_enfeebles:contains(spell.english) then
		if spell.english == "Dispelga" then
			equip(
				set_combine(
					sets.Weapon_magic.Dispelga, 
					sets.MAcc
				)
			)
		elseif Melee_mode == true then
			equip(sets.MAcc)
		else
			equip(
				set_combine(
					sets.Weapon_magic.MAcc, 
					sets.MAcc
				)
			)
		end
	end

	
	--Enhancing Magic
	if spell.english == "Aquaveil" then
		if Melee_mode == true then
			equip(sets.midcast.Enhancing_aquaveil)
		else
			equip(
				set_combine(
					sets.midcast.Enhancing_aquaveil,
					sets.Weapon_magic.Enhancing_skill
				)
			)
		end
	end
	if spell.english == "Stoneskin" then
		if Melee_mode == true then
			equip(sets.midcast.Enhancing_stoneskin)
		else
			equip(
				set_combine(
					sets.midcast.Enhancing_stoneskin,
					sets.Weapon_magic.Enhancing_skill
				)
			)
		end
	end	
	if spell.english == "Phalanx" then
		if Melee_mode == true then
			equip(
				set_combine(
					sets.midcast.Enhancing,
					sets.midcast.Enhancing_phalanx
				)
			)
		else
			equip(
				set_combine(
					sets.midcast.Enhancing,
					sets.midcast.Enhancing_phalanx,
					sets.Weapon_magic.Enhancing_skill
				)
			)
		end
	end
	if spell.english == "Refresh" then
		if spell.target.type == "SELF" then
			if Melee_mode == true then
				equip(sets.midcast.Enhancing_refresh)
			else
				equip(
					set_combine(
						sets.midcast.Enhancing_refresh,
						sets.Weapon_magic.Enhancing_skill
					)
				)
			end
		else
			if Melee_mode == true then
				equip(sets.midcast.Enhancing_refresh_other)
			else
				equip(
					set_combine(
						sets.midcast.Enhancing_refresh_other,
						sets.Weapon_magic.Enhancing_skill
					)
				)
			end
		end
	end
	if Barspells:contains(spell.english) then
		if Melee_mode == true then
			equip(sets.midcast.Enhancing_barspell)
		else
			equip(
				set_combine(
					sets.midcast.Enhancing_barspell,
					sets.Weapon_magic.Enhancing_skill
				)
			)
		end
	end
	if Duration_spells:contains(spell.english) then
		if Melee_mode == true then
			equip(sets.midcast.Enhancing)
		else
			equip(
				set_combine(
					sets.midcast.Enhancing,
					sets.Weapon_magic.Enhancing_skill
				)
			)
		end
	end


	--Cures / Cursna / Banish Effect
	if Cure_spells:contains(spell.english) then
		if Melee_mode == true then
			equip(sets.midcast.Cure)
		else
			equip(
				set_combine(
					sets.midcast.Cure, 
					sets.Weapon_magic.Cure
				)
			)
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
	
	
	--Spell Hooks for Obi
	if (Cure_spells:contains(spell.english) and (spell.element == world.day_element or spell.element == world.weather_element)) then
		equip(sets.obi)
	end
end


function aftercast(spell)
	if (spell.skill == "BardSong" and spell.english ~= "Magic Finale") then
		if not spell.interrupted then
			set_enfeebling_song_duration_timer(spell)
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
				mage_mode_idle_set()
			end
		else -- handles other SJ swaps
			if Melee_mode == true then -- melee mode SW idle
				melee_mode_idle_SW_set()
			else -- mage mode SW idle
				mage_mode_idle_set()
			end
		end
	else 
		engaged_set()
	end
end

function melee_mode_idle_DW_set()
	equip(
		set_combine(
			sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]],
			sets.Idle_melee_DW[sets.Idle_melee_DW.index[Idle_melee_DW_ind]],
			sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
		)
	)
end


function melee_mode_idle_SW_set()
	equip(
		set_combine(
			sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]],
			sets.Idle_melee_SW[sets.Idle_melee_SW.index[Idle_melee_SW_ind]],
			sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
		)
	)
end


function mage_mode_idle_set()
	equip(
		set_combine(			
			sets.Idle[sets.Idle.index[Idle_ind]],
			sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
		)
	)
end


function engaged_set()
	equip(	
		set_combine(
			sets.TP[sets.TP.index[TP_ind]][sets.SJ.index[SJ_ind]]["Haste_"..hasteVal],
			sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]],
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
		determine_haste_sets()
	elseif command == "toggle TP set reverse" then
		TP_ind = TP_ind - 1
		if TP_ind < 1 then
			TP_ind = #sets.TP.index
		end
		send_command("@input /echo <----- TP Set changed to " .. sets.TP.index[TP_ind] .. " ----->")
		determine_haste_sets()
	elseif command == "toggle Extra Song mode" then
		Es_ind = Es_ind + 1
		if Es_ind > #sets.Extra_song.index then
			Es_ind = 1
		end
		send_command("@input /echo <----- Extra Song mode changed to " .. sets.Extra_song.index[Es_ind] .. " ----->")		
		determine_haste_sets()
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
	elseif command == "toggle Range Weapon set" then
		Wr_ind = Wr_ind + 1
		if Wr_ind > #sets.Weapon_range.index then
			Wr_ind = 1
		end
		send_command("@input /echo <----- Range weapon changed to " .. sets.Weapon_range.index[Wr_ind] .. " ----->")
		if Wr_ind == 2 then
			equip(sets.Weapon_range[sets.Weapon_range.index[Wr_ind]])
			disable(range,ammo)
			determine_haste_sets()
			send_command("@input /echo Range/Ammo disabled")
		else
			enable(range,ammo)
			determine_haste_sets()
			send_command("@input /echo Range/Ammo enabled")
		end
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
		Idle_melee_DW_ind = Idle_melee_DW_ind + 1
		Idle_melee_SW_ind = Idle_melee_SW_ind + 1		
		if Idle_ind > #sets.Idle.index then
			Idle_ind = 1
			Idle_melee_DW_ind = 1
			Idle_melee_SW_ind = 1			
		end
		send_command("@input /echo <----- Idle Set changed to " .. sets.Idle.index[Idle_ind] .. " ----->")
		determine_haste_sets()
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
		determine_haste_sets()
	elseif command == "toggle Melee Mode" then
		if Melee_mode == false then
			Melee_mode = true
			send_command("@input /echo <----- Melee Mode ----->")
		else
			Melee_mode = false
			send_command("@input /echo <----- Mage Mode ----->")
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
function create_custom_timer(DurationTotal, spell)
	send_command('timers create "'.. spell.english .. ': ' .. spell.target.name .. '" ' .. DurationTotal .. ' down')
end

function set_enfeebling_song_duration_timer(spell, buff)
	if Buff_song:contains(spell.english) then return end
	
	
	local mult = 1.0
	
	
	if duration30:contains(spell.english) then
		local base = 30.0
	end
	if duration60:contains(spell.english) then
		local base = 60.0
	end
	if duration90:contains(spell.english) then
		local base = 90.0
	end
	if duration120:contains(spell.english) then
		local base = 120.0
	end
	if duration180:contains(spell.english) then
		local base = 180.0
	end
	if duration300:contains(spell.english) then
		local base = 300.0
	end
	
	
	if buffactive['Clarion Call'] then
		base = base + (ClarionCallGifts * 2)
	end
	if (buffactive['Marcato'] and not buffactive['Soul Voice']) then
		base = base + MarcatoGifts
	end	
	if (Lullabies:contains(spell.english) or AoE_Lullabies:contains(spell.english)) then
		base = base + LullabyGifts
	end
	if buffactive['Troubadour'] then 
		mult = mult + 2.0
	end
	if JPTotal >= 1200 then
		mult = mult + 0.05
	end
	

	if player.equipment.main == 'Carnwenhan' then mult = mult + 0.5 end
	if player.equipment.main == 'Kali' then mult = mult + 0.05 end
	if player.equipment.sub == 'Kali' then mult = mult + 0.05 end
	if player.equipment.range == 'Marsyas' then mult = mult + 0.5 end
	if player.equipment.range == 'Gjallarhorn' then mult = mult + 0.4 end
	if player.equipment.range == 'Duardabla' then mult = mult + 0.3 end
	if player.equipment.range == 'Linos' then mult = mult + 0.3 end
	if player.equipment.range == 'Blurred Harp +1' then mult = mult + 0.2 end
	if player.equipment.range == 'Blurred Harp' then mult = mult + 0.1 end
	if (Lullabies:contains(spell.english) or AoE_Lullabies:contains(spell.english) 
		and (player.equipment.range == 'Blurred Harp' or player.equipment.range == 'Blurred Harp +1')) 
		then mult = mult + 0.2 end
	if player.equipment.body == 'Fili Hongreline' then mult = mult + 0.11 end
	if player.equipment.body == 'Fili Hongreline +1' then mult = mult + 0.12 end
	if player.equipment.legs == 'Inyanga Shalwar' then mult = mult + 0.12 end
	if player.equipment.legs == 'Inyanga Shalwar +1' then mult = mult + 0.15 end
	if player.equipment.legs == 'Inyanga Shalwar +2' then mult = mult + 0.17 end
	if player.equipment.feet == 'Brioso Slippers' then mult = mult + 0.1 end
	if player.equipment.feet == 'Brioso Slippers +1' then mult = mult + 0.11 end
	if player.equipment.feet == 'Brioso Slippers +2' then mult = mult + 0.13 end
	if player.equipment.feet == 'Brioso Slippers +3' then mult = mult + 0.15 end
	
	
	if Threnodies:contains(spell.english) and player.equipment.body == "Mousai Manteel +1" then mult = mult + 0.2 end
	if Threnodies:contains(spell.english) and player.equipment.body == "Mousai Manteel" then mult = mult + 0.1 end
	if (Lullabies:contains(spell.english) or AoE_Lullabies:contains(spell.english)) 
		and (player.equipment.hands == "Brioso Cuffs" or player.equipment.hands == "Brioso Cuffs +1" or player.equipment.hands == "Brioso Cuffs +2") 
		then mult = mult + 0.1 end
	if (Lullabies:contains(spell.english) or AoE_Lullabies:contains(spell.english)) and player.equipment.hands == "Brioso Cuffs +3" 
		then mult = mult + 0.2 end
	
	
	DurationTotal = base * mult	
	create_custom_timer(DurationTotal, spell)
end


function has_any_buff_of(buff_set)
    for i,v in pairs(buff_set) do
        if buffactive[v] ~= nil then 
			return true 
		end
    end
end