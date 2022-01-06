-- 
-- @author Thefoxdanger of Asura
-- NIN.lua v1.1
--
-- 
-- Intermediate NIN lua created to streamline play with as few toggles and other things to press as possible. Designed to be similar in 
-- fuction to the rest of Spicyryan's luas in the Github. However, this is a job that naturally has a lot of levers to throw, so take time 
-- to get used to the keybinds below. It also has A LOT of gear fields, which is for a good reason. Make sure to read over comments, reviewing 
-- the current gear in slots to understand what goes there if you don't have my exact gearsets. Everything is very clearly labeled, and if 
-- a set seems to be a duplicate, check that it isn't a version that takes Melee_mode into account.
--
-- Credit and thanks goes to Fel for assistance with the haste-tiering functionality used in this (and future) versions.
--
-- I plan to maintain this lua as a template, however if you get a hold of this it is YOUR responsibility to understand its use
-- and to troubleshoot issues within. I will not fix your lua if I do not know you (and probably wont if I do know you). 
-- Have fun~!
-- 	


--binds--
-- 4 core toggles you may use more frequently
send_command("bind f9 gs c toggle TP set") -- F9 switches between current melee/tank sets dependant on mode (Standard, DT, Evasion)
send_command("bind !f9 gs c toggle TP set reverse") -- Alt+F9 switches between current melee/tank sets dependant on mode in reverse (Standard, DT, Evasion)

send_command("bind f10 gs c toggle Weapons") -- F10 switches between current weapon combinations 
send_command("bind !f10 gs c toggle Weapons reverse") -- ALT+F10 switches between current weapon combinations in reverse 

send_command("bind f11 gs c toggle WS set") -- F11 switches between WS sets
send_command("bind !f11 gs c toggle WS set reverse") -- Alt+F11 switches between WS sets in reverse

send_command("bind f12 gs c toggle Idle set") -- F12 switches between idle sets
send_command("bind !f12 gs c toggle Idle set reverse") -- Alt+F12 switches between idle sets in reverse


-- less frequently used/'setup' toggles
send_command("bind f7 gs c toggle Tank set") -- F7 prepares, but does not switch to, tank sets (regardless of whether Tank Mode is active)
send_command("bind !f7 gs c toggle Tank set reverse") -- Alt+F7 prepares, but does not switch to, tank sets in reverse (regardless of whether Tank Mode is active)

send_command("bind @e gs c toggle Haste Mode") -- WIN+F9 Toggles between SV/Bolster, HasteII and Low haste modes
send_command("bind !f8 gs c toggle Tank Mode") -- Alt+F8 swap between Normal and Tank sets
send_command("bind !` gs c toggle Burst Mode") -- Alt+` switches Magic Burst sets on/off
send_command("bind ^` gs c toggle MAcc Mode") -- Alt+` switches Magic Accuracy sets for Nuking on/off
send_command("bind @f12 gs c toggle Kite Mode") -- Enables kiting sets


--numpad controls for WS's
-- -- CTRL key for Katana / SavageBlade WS
send_command('bind ^numpad0 @input /ws "Savage Blade" <t>')
send_command('bind ^numpad1 @input /ws "Blade: Metsu" <t>')
send_command('bind ^numpad2 @input /ws "Blade: Shun" <t>')
send_command('bind ^numpad3 @input /ws "Blade: Ten" <t>')
send_command('bind ^numpad4 @input /ws "Blade: Chi" <t>')
send_command('bind ^numpad5 @input /ws "Blade: To" <t>')
send_command('bind ^numpad6 @input /ws "Blade: Teki" <t>')
send_command('bind ^numpad7 @input /ws "Blade: Ei" <t>')
send_command('bind ^numpad8 @input /ws "Blade: Ku" <t>')
send_command('bind ^numpad9 @input /ws "Blade: Kamu" <t>')
-- -- Alt key for Great Katana / Dagger / H2H / Club WS
send_command('bind !numpad0 @input /ws "Evisceration" <t>')
send_command('bind !numpad1 @input /ws "Aeolian Edge" <t>')
send_command('bind !numpad2 @input /ws "Energy Drain" <t>')
send_command('bind !numpad3 @input /ws "Tachi: Ageha" <t>')
send_command('bind !numpad4 @input /ws "Tachi: Jinpu" <t>')
send_command('bind !numpad5 @input /ws "Tachi: Hobaku" <t>')
send_command('bind !numpad6 @input /ws "Tachi: Kasha" <t>')
send_command('bind !numpad7 @input /ws "Raging Fists" <t>')
send_command('bind !numpad8 @input /ws "Asuran Fists" <t>')
send_command('bind !numpad9 @input /ws "Shoulder Tackle" <t>')


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
Shadow_type = 'None'
MAcc_mode = false
Tank_mode = false
Burst_mode = false
Kite_mode = false
--Haste_mode
Soul_voice = false
Haste_II = false


function file_unload()
	--unbinds when job unloads--
	send_command("unbind f7")
	send_command("unbind !f7")
	
	send_command("unbind f9")
	send_command("unbind !f9")
	
	send_command("unbind f10")
	send_command("unbind !f10")
	
	send_command("unbind f11")
	send_command("unbind !f11")	

	send_command("unbind f12")
	send_command("unbind !f12")	

	send_command("unbind @e")	
	send_command("unbind !f8")
	send_command("unbind !`")
	send_command("unbind ^`")
	
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
	set_macros(1,20)
	---Set Lockstyle Here
	set_style(37)
	
	
	--Gear Sets Start Here
	--Augmented Gear
    Andartia = {}
    Andartia.TP = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	Andartia.TPLow = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	Andartia.WSD = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}
	Andartia.MAB = { name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}
	Andartia.Ten = { name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	Andartia.FC = { name="Andartia's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}}
	Andartia.Enmity = { name="Andartia's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Mag. Evasion+15',}}
	
	TaeonHead = {}
	TaeonHead.Phalanx = { name="Taeon Chapeau", augments={'Accuracy+21','Spell interruption rate down -10%','Phalanx +3',}}
	
	HercHelm = {}
	HercHelm.FC = { name="Herculean Helm", augments={'"Fast Cast"+5','Mag. Acc.+11',}}
	
	HercVest = {}
	HercVest.Phalanx = { name="Herculean Vest", augments={'"Dbl.Atk."+2','MND+7','Phalanx +5',}}
	
	HercHands = {}
	HercHands.WSD = { name="Herculean Gloves", augments={'"Store TP"+3','DEX+13','Weapon skill damage +8%','Accuracy+15 Attack+15',}}
	HercHands.Quad = { name="Herculean Gloves", augments={'Accuracy+14 Attack+14','Pet: Accuracy+15 Pet: Rng. Acc.+15','Quadruple Attack +3','Mag. Acc.+13 "Mag.Atk.Bns."+13',}}
	HercHands.TH = { name="Herculean Gloves", augments={'VIT+3','"Store TP"+5','"Treasure Hunter"+2','Accuracy+6 Attack+6',}}
	HercHands.Phalanx = { name="Herculean Gloves", augments={'Accuracy+8','AGI+6','Phalanx +4','Accuracy+4 Attack+4',}}
	
	
	HercLegs = {}
	HercLegs.FC = { name="Herculean Trousers", augments={'Pet: STR+6','DEX+4','"Fast Cast"+7','Accuracy+7 Attack+7','Mag. Acc.+4 "Mag.Atk.Bns."+4',}}
	HercLegs.Phalanx = { name="Herculean Trousers", augments={'"Fast Cast"+2','Damage taken-4%','Phalanx +5','Accuracy+5 Attack+5','Mag. Acc.+10 "Mag.Atk.Bns."+10',}}
	
	HercFeet = {}
	HercFeet.Quad = { name="Herculean Boots", augments={'CHR+1','Accuracy+10','Quadruple Attack +3','Accuracy+8 Attack+8',}}
	HercFeet.FC = { name="Herculean Boots", augments={'Pet: Haste+1','"Dual Wield"+3','"Fast Cast"+7','Mag. Acc.+4 "Mag.Atk.Bns."+4',}}
	HercFeet.Phalanx = { name="Herculean Boots", augments={'"Mag.Atk.Bns."+24','"Fast Cast"+1','Phalanx +4','Mag. Acc.+17 "Mag.Atk.Bns."+17',}}
	
	AdhemarBody = {}
	AdhemarBody.FC = { name="Adhemar Jacket +1", augments={'HP+105','"Fast Cast"+10','Magic dmg. taken -4',}}
	AdhemarBody.TP = { name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}
	
	
	--Weapon Sets (Melee)--
	sets.Weapon_melee = {} -- sets weapon combo for melee-mode
	sets.Weapon_melee.index = {"Naegling", "NaeglingAcc", "Kikoku", "HeishiPhys", "HeishiMag", "Magic", "Tauret", "GKT", "Karambit", "BabySeals"}
	Wm_ind = 1
	sets.Weapon_melee.Naegling = {
		main = "Naegling",
		sub = "Uzura +2"
	}
	sets.Weapon_melee.NaeglingAcc = {
		main = "Naegling",
		sub = "Kunimitsu"
	}
	sets.Weapon_melee.Kikoku = {
		main = "Kikoku",
		sub = "Kunimitsu"
	}
	sets.Weapon_melee.HeishiPhys = {
		main = "Heishi Shorinken",
		sub = "Ternion Dagger +1" -- switch to Gleti's Knife if you prefer it
	}
	sets.Weapon_melee.HeishiMag = {
		main = "Heishi Shorinken",
		sub = "Kunimitsu"
	}
	sets.Weapon_melee.Magic = { --for when ninjutsu damage matters more than your WS's
		main = "Gokotai",
		sub = "Kunimitsu" --I keep a capped Ochu around, but don't sweat it if you don't, it will normally do lower damage overall
	}
	sets.Weapon_melee.Tauret = {
		main = "Tauret",
		sub = "Kunimitsu" -- can also use Gleti's here if not AoE'ing
	}	
	sets.Weapon_melee.GKT = {
		main = "Hachimonji",
		sub = "Bloodrain Strap"
	}
	sets.Weapon_melee.Karambit = {
		main = "Karambit"
	}
	sets.Weapon_melee.BabySeals = {
		main = "Maific Cudgel",
		sub = "Kunimitsu"
	}

	--Weapon Sets (Tank)--
	sets.Weapon_tank = {} -- sets weapon combo for tank-mode
	sets.Weapon_tank.index = {"Tank", "Naegling", "Kikoku", "Heishi", "Tauret", 'GKT', 'Karambit'}
	Wt_ind = 1
	sets.Weapon_tank.Tank = { --Obviously upgrade to Fudo Masamune/Tsuru once R25
		main = "Tsuru",
		sub = "Shuhansadamune"
	}
	sets.Weapon_tank.Naegling = {
		main = "Naegling",
		sub = "Tsuru"
	}
	sets.Weapon_tank.Kikoku = {
		main = "Kikoku",
		sub = "Tsuru"
	}
	sets.Weapon_tank.Heishi = {
		main = "Heishi Shorinken",
		sub = "Tsuru"
	}
	sets.Weapon_tank.Tauret = {
		main = "Tauret",
		sub = "Tsuru"
	}
	sets.Weapon_tank.GKT = {
		main = "Hachimonji",
		sub = "Bloodrain Strap"
	}
	sets.Weapon_tank.Karambit = {
		main = "Karambit"
	}	
	
	-- --Haste Tiering Indexes
	-- --DO NOT CHANGE
	-- sets.Haste_tiering_selection = {}
	-- sets.Haste_tiering_selection.index = {"NoHaste", "Haste15", "Haste30", "Haste35", "HasteMax"}
	-- Haste_tiering_selection_ind = 1
	
	
	--Idle Sets--
	-- melee-mode
	sets.Idle_melee = {}
	sets.Idle_melee.index = {"Standard", "DT", "Evasion"}
	Idle_melee_ind = 1
	sets.Idle_melee.Standard = {
		ammo = "Staunch Tathlum +1", -- 0/0/3
		head = "Nyame Helm", -- 0/0/7
		neck = "Warder's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring", 
		body = "Mpaca's Doublet", -- 10/0/0
		hands = "Nyame Gauntlets", -- 0/0/7
		ring1 = "Shadow Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Andartia.Enmity,
		waist = "Engraved Belt",	
		legs = "Mpaca's Hose", -- 9/0/0
		feet = "Nyame Sollerets" -- 0/0/7
	} -- 19/0/34 | MDB+45 | MEva+626 | Eva+512 | Def+1008
	sets.Idle_melee.DT = {
		ammo = "Yamarang", 
		head = "Nyame Helm", -- 0/0/7
		neck = "Loricate Torque +1", -- 0/0/6 
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring", 
		body = "Nyame Mail", -- 0/0/9
		hands = "Nyame Gauntlets", -- 0/0/7
		ring1 = "Shadow Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Andartia.Enmity,
		waist = "Engraved Belt",	
		legs = "Nyame Flanchard", -- 0/0/8
		feet = "Nyame Sollerets" -- 0/0/7
	} -- 0/0/51 | MDB+30 | MEva+746 | Eva+527 | | Def+1048
	sets.Idle_melee.Evasion = {
		ammo = "Yamarang", 
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Loricate Torque +1", -- 0/0/6 
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring", 
		body = "Malignance Tabard", -- 0/0/9
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Shadow Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Andartia.Enmity,
		waist = "Engraved Belt",	
		legs = "Malignance Tights", -- 0/0/7
		feet = "Malignance Boots" -- 0/0/4
	} -- 0/0/47 | MDB+33 | MEva+751 | Eva+571 (before counting high AGI in set) | Def+790	
	
	
	
	-- tank-mode
	sets.Idle_tank = {}
	sets.Idle_tank.index = {"Standard", "DT", "Evasion"}
	Idle_tank_ind = 1
	sets.Idle_tank.Standard = {
		ammo = "Date Shuriken", 
		head = "Nyame Helm", -- 0/0/7
		neck = "Unmoving Collar +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring", 
		body = "Mpaca's Doublet", -- 10/0/0
		hands = "Macabre Gauntlets +1", -- 4/0/0
		ring1 = "Eihwaz Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Andartia.Enmity,
		waist = "Engraved Belt",	
		legs = "Mpaca's Hose", -- 9/0/0
		feet = "Nyame Sollerets" -- 0/0/7
	} -- 23/0/24 | MDB+42 | MEva+632 | Eva+459 | Def+1057 | Enmity+39
	sets.Idle_tank.DT = {
		ammo = "Date Shuriken", 
		head = "Nyame Helm", -- 0/0/7
		neck = "Unmoving Collar +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring", 
		body = "Nyame Mail", -- 0/0/9
		hands = "Nyame Gauntlets", -- 0/0/7
		ring1 = "Eihwaz Ring", 
		ring2 = "Gelatinous Ring +1", -- 7/-1/0
		back = Andartia.Enmity,
		waist = "Engraved Belt",	
		legs = "Nyame Flanchard", -- 0/0/8
		feet = "Nyame Sollerets" -- 0/0/7
	} -- 7/-1/38 | MDB+33 | MEva+633 | Eva+544 | | Def+1140 | Enmity+28
	sets.Idle_tank.Evasion = {
		ammo = "Yamarang", 
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Bathy Choker +1",
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring", 
		body = "Mpaca's Doublet", -- 10/0/0
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Vengeful Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Andartia.Enmity,
		waist = "Engraved Belt",	
		legs = "Mpaca's Hose", -- 9/0/0
		feet = "Malignance Boots" -- 0/0/4
	} -- 19/0/25 | MDB+41 | MEva+629 | Eva+571 (before counting high AGI in set) | Def+906 | Enmity+13


	--TP Sets (melee)--
	sets.TP = {}
	sets.TP.index = {"Standard", "DT", "Evasion"}
	TP_ind = 1

	sets.TP.Standard = {}
	sets.TP.Standard.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45"}
	--39 DW needed
	sets.TP.Standard.Haste_0 = {
		ammo = "Seki Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",	
		back = Andartia.TPLow, 
		waist = "Reiki Yotai",	
		legs = "Mochizuki Hakama +3", 
		feet = HercFeet.Quad
	} -- 39 DW | sTP+35 | 14DA/10TA/3QA
	--35 DW Needed
	sets.TP.Standard.Haste_5 = {
		ammo = "Seki Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",	
		back = Andartia.TPLow, 
		waist = "Reiki Yotai",	
		legs = "Mochizuki Hakama +3", 
		feet = HercFeet.Quad
	} -- 39 DW | sTP+35 | 14DA/10TA/3QA	
	--37 DW Needed
	sets.TP.Standard.Haste_10 = {
		ammo = "Seki Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",	
		back = Andartia.TPLow, 
		waist = "Reiki Yotai",	
		legs = "Mochizuki Hakama +3", 
		feet = HercFeet.Quad
	} -- 39 DW | sTP+35 | 14DA/10TA/3QA		
	--32 DW needed
	sets.TP.Standard.Haste_15 = {
		ammo = "Seki Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",	
		back = Andartia.TPLow, 
		waist = "Reiki Yotai",	
		legs = "Hachiya Hakama +2", 
		feet = HercFeet.Quad
	} -- 33 DW | sTP+38 | 14DA/10TA/3QA
	--26 DW needed
	sets.TP.Standard.Haste_20 = {
		ammo = "Seki Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",	
		back = Andartia.TPLow, 
		waist = "Windbuffet Belt +1",
		legs = "Hachiya Hakama +2", 
		feet = HercFeet.Quad
	} -- 26 DW | sTP+38 | 14DA/10TA/3QA	
	--23 DW needed
	sets.TP.Standard.Haste_25 = {
		ammo = "Seki Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Brutal Earring", 
		ear2 = "Telos Earring", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",	
		back = Andartia.TPLow, 
		waist = "Windbuffet Belt +1",
		legs = "Hachiya Hakama +2", 
		feet = HercFeet.Quad
	} -- 22 DW | sTP+38 | 14DA/10TA/3QA		
	--21 DW needed
	sets.TP.Standard.Haste_30 = {
		ammo = "Seki Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Brutal Earring", 		
		body = "Kendatsuba Samue +1", 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",	
		back = Andartia.TPLow, 
		waist = "Reiki Yotai",	
		legs = "Samnuha Tights", 
		feet = HercFeet.Quad
	} -- 20 DW | sTP+38 | 21DA/23TA/3QA
	--15 DW Needed
	sets.TP.Standard.Haste_35 = {
		ammo = "Seki Shuriken",
		head = "Dampening Tam", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Cessance Earring", 
		ear2 = "Telos Earring", 		
		body = "Kendatsuba Samue +1", 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",	
		back = Andartia.TP, 
		waist = "Reiki Yotai",	
		legs = "Samnuha Tights", 
		feet = "Hizamaru Sune-ate +2"
	} -- 15 DW | sTP+43 | 10DA/21TA/3QA
	--7 DW Needed
	sets.TP.Standard.Haste_40 = {
		ammo = "Seki Shuriken",
		head = "Dampening Tam", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Cessance Earring", 
		ear2 = "Telos Earring", 		
		body = "Kendatsuba Samue +1", 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",	
		back = Andartia.TP, 
		waist = "Reiki Yotai",	
		legs = "Samnuha Tights", 
		feet = HercFeet.Quad
	} -- 15 DW | sTP+43 | 10DA/21TA/3QA	
	--1 DW needed (dont go out of your way)
	sets.TP.Standard.Haste_45 = {
		ammo = "Seki Shuriken",
		head = "Dampening Tam", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Cessance Earring", 
		ear2 = "Telos Earring", 		
		body = "Kendatsuba Samue +1", 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",	
		back = Andartia.TP, 
		waist = "Windbuffet Belt +1",	
		legs = "Samnuha Tights", 
		feet = HercFeet.Quad
	} -- 0 DW | sTP+39 | 10DA/25TA/8QA

	sets.TP.DT = {}
	sets.TP.DT.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45"}
	--39 DW needed
	sets.TP.DT.Haste_0 = {
		ammo = "Seki Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Andartia.TPLow, 
		waist = "Reiki Yotai",	
		legs = "Mochizuki Hakama +3", 
		feet = "Malignance Boots"
	} -- 39 DW | sTP+49 | 14DA/3TA/0QA | DT 10/0/19
	--37 DW needed
	sets.TP.DT.Haste_5 = {
		ammo = "Seki Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Andartia.TPLow, 
		waist = "Reiki Yotai",	
		legs = "Mochizuki Hakama +3", 
		feet = "Malignance Boots"
	} -- 39 DW | sTP+49 | 14DA/3TA/0QA | DT 10/0/19	
	--35 DW needed
	sets.TP.DT.Haste_10 = {
		ammo = "Seki Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Andartia.TPLow, 
		waist = "Reiki Yotai",	
		legs = "Hachiya Hakama +2", 
		feet = "Malignance Boots"
	} -- 33 DW | sTP+49 | 14DA/3TA/0QA | DT 10/0/19	
	--32 DW needed
	sets.TP.DT.Haste_15 = {
		ammo = "Seki Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Andartia.TPLow, 
		waist = "Reiki Yotai",	
		legs = "Hachiya Hakama +2", 
		feet = "Malignance Boots"
	} -- 33 DW | sTP+52 | 14DA/3TA/0QA | DT 10/0/19
	--26 DW needed
	sets.TP.DT.Haste_20 = {
		ammo = "Seki Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Andartia.TPLow, 
		waist = "Engraved Belt",	
		legs = "Hachiya Hakama +2", 
		feet = "Malignance Boots"
	} -- 26 DW | sTP+52 | 14DA/3TA/0QA | DT 10/0/19	
	--23 DW needed
	sets.TP.DT.Haste_25 = {
		ammo = "Seki Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Cessance Earring", 
		ear2 = "Telos Earring", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Andartia.TPLow, 
		waist = "Reiki Yotai",	
		legs = "Mpaca's Hose", 
		feet = "Malignance Boots"
	} -- 25 DW | sTP+52 | 14DA/3TA/0QA | DT 10/0/19		
	--21 DW needed
	sets.TP.DT.Haste_30 = {
		ammo = "Seki Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Brutal Earring", 		
		body = "Mpaca's Doublet", 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Andartia.TPLow, 
		waist = "Reiki Yotai",	
		legs = "Mpaca's Hose", 
		feet = "Malignance Boots"
	} -- 20 DW | sTP+45 | 18DA/11TA/0QA | DT 29/0/19
	--15 DW Needed
	sets.TP.DT.Haste_35 = {
		ammo = "Seki Shuriken",
		head = "Malignance Chapeau", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Cessance Earring", 
		ear2 = "Telos Earring", 		
		body = "Mpaca's Doublet", 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Andartia.TPLow, 
		waist = "Reiki Yotai",	
		legs = "Mpaca's Hose", 
		feet = "Hizamaru Sune-ate +2"
	} -- 15 DW | sTP+39 | 17DA/10TA/0QA | DT 29/0/21
	--7 DW Needed
	sets.TP.DT.Haste_40 = {
		ammo = "Seki Shuriken",
		head = "Malignance Chapeau", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Cessance Earring", 
		ear2 = "Telos Earring", 		
		body = "Mpaca's Doublet", 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Andartia.TPLow, 
		waist = "Reiki Yotai",	
		legs = "Mpaca's Hose", 
		feet = "Malignance Boots"
	} -- 7 DW | sTP+39 | 17DA/10TA/0QA | DT 29/0/21	
	--1 DW needed (dont go out of your way)
	sets.TP.DT.Haste_45 = {
		ammo = "Seki Shuriken",
		head = "Malignance Chapeau", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Cessance Earring", 
		ear2 = "Telos Earring", 		
		body = "Mpaca's Doublet", 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Andartia.TPLow, 
		waist = "Engraved Belt",	
		legs = "Mpaca's Hose", 
		feet = "Malignance Boots"
	} -- 0 DW | sTP+37 | 17DA/11TA/8QA | DT 22/4/22

	sets.TP.Evasion = {}
	sets.TP.Evasion.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45"}
	--39 DW needed
	sets.TP.Evasion.Haste_0 = {
		ammo = "Seki Shuriken",
		head = "Malignance Chapeau", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Suppanomimi", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Malignance Gloves", 
		ring1 = "Vengeful Ring", 
		ring2 = "Ilabrat Ring",	
		back = Andartia.Enmity, 
		waist = "Reiki Yotai",	
		legs = "Mochizuki Hakama +3", 
		feet = "Malignance Boots"
	} -- 35 DW | sTP+45 | 0DA/0TA/0QA | Eva+469
	--37 DW needed
	sets.TP.Evasion.Haste_5 = {
		ammo = "Seki Shuriken",
		head = "Malignance Chapeau", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Suppanomimi", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Malignance Gloves", 
		ring1 = "Vengeful Ring", 
		ring2 = "Ilabrat Ring",	
		back = Andartia.Enmity, 
		waist = "Reiki Yotai",	
		legs = "Mochizuki Hakama +3", 
		feet = "Malignance Boots"
	} -- 35 DW | sTP+45 | 0DA/0TA/0QA | Eva+469	
	--35 DW needed
	sets.TP.Evasion.Haste_10 = {
		ammo = "Seki Shuriken",
		head = "Malignance Chapeau", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Suppanomimi", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Malignance Gloves", 
		ring1 = "Vengeful Ring", 
		ring2 = "Ilabrat Ring",	
		back = Andartia.Enmity, 
		waist = "Reiki Yotai",	
		legs = "Mochizuki Hakama +3", 
		feet = "Malignance Boots"
	} -- 35 DW | sTP+45 | 0DA/0TA/0QA | Eva+469	
	--32 DW needed
	sets.TP.Evasion.Haste_15 = {
		ammo = "Seki Shuriken",
		head = "Malignance Chapeau", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Suppanomimi", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Malignance Gloves", 
		ring1 = "Vengeful Ring", 
		ring2 = "Regal Ring",
		back = Andartia.Enmity, 
		waist = "Reiki Yotai",	
		legs = "Hachiya Hakama +2", 
		feet = "Malignance Boots"
	} -- 30 DW | sTP+43 | 0DA/0TA/0QA | Eva+474
	--26 DW needed
	sets.TP.Evasion.Haste_20 = {
		ammo = "Seki Shuriken",
		head = "Malignance Chapeau", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Suppanomimi", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Malignance Gloves", 
		ring1 = "Vengeful Ring", 
		ring2 = "Ilabrat Ring",	
		back = Andartia.Enmity, 
		waist = "Reiki Yotai",	
		legs = "Mpaca's Hose", 
		feet = "Malignance Boots"
	} -- 25 DW | sTP+45 | 0DA/0TA/0QA | Eva+469	
	--23 DW needed
	sets.TP.Evasion.Haste_25 = {
		ammo = "Seki Shuriken",
		head = "Malignance Chapeau", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Telos Earring", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Malignance Gloves", 
		ring1 = "Vengeful Ring", 
		ring2 = "Ilabrat Ring",	
		back = Andartia.Enmity, 
		waist = "Reiki Yotai",	
		legs = "Hachiya Hakama +2", 
		feet = "Malignance Boots"
	} -- 24 DW | sTP+45 | 0DA/0TA/0QA | Eva+469	
	--21 DW needed
	sets.TP.Evasion.Haste_30 = {
		ammo = "Seki Shuriken",
		head = "Malignance Chapeau", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Infused Earring", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Malignance Gloves", 
		ring1 = "Vengeful Ring", 
		ring2 = "Ilabrat Ring",	
		back = Andartia.Enmity, 
		waist = "Reiki Yotai",	
		legs = "Malignance Tights", 
		feet = "Malignance Boots"
	} -- 20 DW | sTP+54 | 0DA/0TA/0QA | Eva+501
	--15 DW needed
	sets.TP.Evasion.Haste_35 = {
		ammo = "Seki Shuriken",
		head = "Malignance Chapeau", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Suppanomimi", 		
		body = "Mpaca's Doublet", 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Ilabrat Ring",	
		back = Andartia.Enmity, 
		waist = "Reiki Yotai",	
		legs = "Mpaca's Hose", 
		feet = "Malignance Boots"
	} -- 16 DW | sTP+45 | 3DA/11TA/0QA | Eva+512
	--7 DW needed
	sets.TP.Evasion.Haste_40 = {
		ammo = "Seki Shuriken",
		head = "Malignance Chapeau", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Cessance Earring", 
		ear2 = "Telos Earring", 		
		body = "Mpaca's Doublet", 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Ilabrat Ring",	
		back = Andartia.Enmity, 
		waist = "Reiki Yotai",	
		legs = "Mpaca's Hose", 
		feet = "Malignance Boots"
	} -- 7 DW | sTP+45 | 3DA/11TA/0QA | Eva+512	
	-- 1 DW needed
	sets.TP.Evasion.Haste_45 = {
		ammo = "Seki Shuriken",
		head = "Malignance Chapeau", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Cessance Earring", 
		ear2 = "Brutal Earring", 		
		body = "Mpaca's Doublet", 
		hands = "Malignance Gloves", 
		ring1 = "Vengeful Ring", 
		ring2 = "Ilabrat Ring",	
		back = Andartia.Enmity, 
		waist = "Sailfi Belt +1",	
		legs = "Mpaca's Hose", 
		feet = "Malignance Boots"
	} -- 0 DW | sTP+42 | 10DA/10TA/0QA | Eva+511


	--TP Sets (tank)--
	sets.Tank = {}
	sets.Tank.index = {"Standard", "DT", "Evasion"}
	Tank_ind = 1

	sets.Tank.Standard = {}
	sets.Tank.Standard.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45"}
	--39 DW needed
	sets.Tank.Standard.Haste_0 = {
		ammo = "Date Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Trux Earring", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Adhemar Wristbands +1",
		ring1 = "Eihwaz Ring", 
		ring2 = "Gere Ring",	
		back = Andartia.TPLow, 
		waist = "Reiki Yotai",	
		legs = "Mochizuki Hakama +3", 
		feet = HercFeet.Quad 
	} -- 39 DW | sTP+28 | 13DA/11TA/3QA | Enmity+13
	--37 DW needed
	sets.Tank.Standard.Haste_5 = {
		ammo = "Date Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Trux Earring", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Adhemar Wristbands +1",
		ring1 = "Eihwaz Ring", 
		ring2 = "Gere Ring",	
		back = Andartia.TPLow, 
		waist = "Reiki Yotai",	
		legs = "Mochizuki Hakama +3", 
		feet = HercFeet.Quad
	} -- 39 DW | sTP+28 | 13DA/11TA/3QA | Enmity+13	
	--35 DW needed
	sets.Tank.Standard.Haste_10 = {
		ammo = "Date Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Cessance Earring", 
		ear2 = "Trux Earring", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Adhemar Wristbands +1",
		ring1 = "Eihwaz Ring", 
		ring2 = "Gere Ring",	
		back = Andartia.TPLow, 
		waist = "Reiki Yotai",	
		legs = "Mochizuki Hakama +3", 
		feet = HercFeet.Quad 
	} -- 35 DW | sTP+28 | 13DA/11TA/3QA | Enmity+13	
	--32 DW needed
	sets.Tank.Standard.Haste_15 = {
		ammo = "Date Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Trux Earring", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Adhemar Wristbands +1",
		ring1 = "Eihwaz Ring", 
		ring2 = "Gere Ring",	
		back = Andartia.TPLow, 
		waist = "Reiki Yotai",	
		legs = "Hachiya Hakama +2", 
		feet = HercFeet.Quad 
	} -- 33 DW | sTP+31 | 13DA/11TA/3QA | Enmity+13
	--26 DW needed
	sets.Tank.Standard.Haste_20 = {
		ammo = "Date Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Trux Earring", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Adhemar Wristbands +1",
		ring1 = "Eihwaz Ring", 
		ring2 = "Gere Ring",	
		back = Andartia.TPLow, 
		waist = "Windbuffet Belt +1",	
		legs = "Hachiya Hakama +2", 
		feet = HercFeet.Quad 
	} -- 26 DW | sTP+28 | 13DA/11TA/3QA | Enmity+13		
	--23 DW needed
	sets.Tank.Standard.Haste_25 = {
		ammo = "Date Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Trux Earring", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Adhemar Wristbands +1",
		ring1 = "Eihwaz Ring", 
		ring2 = "Gere Ring",	
		back = Andartia.TPLow, 
		waist = "Windbuffet Belt +1",	
		legs = "Samnuha Tights", 
		feet = HercFeet.Quad 
	} -- 22 DW | sTP+28 | 13DA/11TA/3QA | Enmity+13			
	--21 DW needed
	sets.Tank.Standard.Haste_30 = {
		ammo = "Date Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Trux Earring", 		
		body = "Kendatsuba Samue +1", 
		hands = "Adhemar Wristbands +1",
		ring1 = "Eihwaz Ring", 
		ring2 = "Gere Ring",	
		back = Andartia.TPLow, 
		waist = "Reiki Yotai",	
		legs = "Samnuha Tights", 
		feet = HercFeet.Quad 
	} -- 20 DW | sTP+38 | 16DA/20TA/3QA | Enmity+13
	--15 DW needed
	sets.Tank.Standard.Haste_35 = {
		ammo = "Date Shuriken",
		head = "Dampening Tam", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Cryptic Earring", 
		ear2 = "Trux Earring", 		
		body = "Kendatsuba Samue +1", 
		hands = "Adhemar Wristbands +1",
		ring1 = "Eihwaz Ring", 
		ring2 = "Gere Ring",	
		back = Andartia.TPLow, 
		waist = "Reiki Yotai",	
		legs = "Samnuha Tights", 
		feet = "Hizamaru Sune-ate +2"
	} -- 15 DW | sTP+38 | 16DA/18TA/3QA | Enmity+17
	--7 DW needed
	sets.Tank.Standard.Haste_40 = {
		ammo = "Date Shuriken",
		head = "Dampening Tam", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Cryptic Earring", 
		ear2 = "Trux Earring", 		
		body = "Kendatsuba Samue +1", 
		hands = "Adhemar Wristbands +1",
		ring1 = "Eihwaz Ring", 
		ring2 = "Gere Ring",	
		back = Andartia.TPLow, 
		waist = "Reiki Yotai",	
		legs = "Samnuha Tights", 
		feet = HercFeet.Quad
	} -- 7 DW | sTP+38 | 16DA/18TA/3QA | Enmity+17	
	--1 DW needed
	sets.Tank.Standard.Haste_45 = {
		ammo = "Date Shuriken",
		head = "Dampening Tam", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Cryptic Earring", 
		ear2 = "Trux Earring", 		
		body = "Kendatsuba Samue +1", 
		hands = "Adhemar Wristbands +1",
		ring1 = "Eihwaz Ring", 
		ring2 = "Gere Ring",	
		back = Andartia.TP, 
		waist = "Windbuffet Belt +1",	
		legs = "Samnuha Tights", 
		feet = HercFeet.Quad 
	} -- 0 DW | sTP+38 | 16DA/22TA/8QA | Enmity+17

	--Keep in mind these sets are designed to have Tsuru in one hand (DT 0/0/8 and +15 Enmity)
	sets.Tank.DT = {}
	sets.Tank.DT.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45"}
	--39 DW needed
	sets.Tank.DT.Haste_0 = {
		ammo = "Date Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Trux Earring", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Mpaca's Gloves", -- 8/0/0
		ring1 = "Eihwaz Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Andartia.TPLow, -- 10/0/0
		waist = "Reiki Yotai",	
		legs = "Mochizuki Hakama +3", 
		feet = "Mpaca's Boots" -- 6/0/0
	} -- 39 DW | sTP+21 | 13DA/6TA/0QA | Enmity+13 | DT 24/0/10
	--37 DW needed
	sets.Tank.DT.Haste_5 = {
		ammo = "Date Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Trux Earring", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Mpaca's Gloves", -- 8/0/0
		ring1 = "Eihwaz Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Andartia.TPLow, -- 10/0/0
		waist = "Reiki Yotai",	
		legs = "Mochizuki Hakama +3", 
		feet = "Mpaca's Boots" -- 6/0/0
	} -- 39 DW | sTP+21 | 13DA/6TA/0QA | Enmity+13 | DT 24/0/10
	--35 DW needed
	sets.Tank.DT.Haste_10 = {
		ammo = "Date Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Trux Earring", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Mpaca's Gloves", -- 8/0/0
		ring1 = "Eihwaz Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Andartia.TPLow, -- 10/0/0
		waist = "Reiki Yotai",	
		legs = "Mochizuki Hakama +3", 
		feet = "Mpaca's Boots" -- 6/0/0
	} -- 39 DW | sTP+21 | 13DA/6TA/0QA | Enmity+13 | DT 24/0/10	
	--32 DW needed
	sets.Tank.DT.Haste_15 = {
		ammo = "Date Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Trux Earring", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Mpaca's Gloves", -- 8/0/0
		ring1 = "Eihwaz Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Andartia.TPLow, -- 10/0/0
		waist = "Reiki Yotai",	
		legs = "Hachiya Hakama +2", 
		feet = "Mpaca's Boots" -- 6/0/0
	} -- 33 DW | sTP+24 | 13DA/6TA/0QA | Enmity+13 | DT 24/0/10
	--26 DW needed
	sets.Tank.DT.Haste_20 = {
		ammo = "Date Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Trux Earring", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Mpaca's Gloves", -- 8/0/0
		ring1 = "Eihwaz Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Andartia.TPLow, -- 10/0/0
		waist = "Engraved Belt",	
		legs = "Hachiya Hakama +2", 
		feet = "Mpaca's Boots" -- 6/0/0
	} -- 26 DW | sTP+24 | 13DA/6TA/0QA | Enmity+13 | DT 24/0/10
	--23 DW needed
	sets.Tank.DT.Haste_25 = {
		ammo = "Date Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Trux Earring", 		
		body = "Mpaca's Doublet", 
		hands = "Mpaca's Gloves", -- 8/0/0
		ring1 = "Eihwaz Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Andartia.TPLow, -- 10/0/0
		waist = "Reiki Yotai",	
		legs = "Hachiya Hakama +2", 
		feet = "Mpaca's Boots" -- 6/0/0
	} -- 24 DW | sTP+24 | 13DA/6TA/0QA | Enmity+13 | DT 24/0/10	
	--21 DW needed
	sets.Tank.DT.Haste_30 = {
		ammo = "Date Shuriken", 
		head = "Ryuo Somen +1", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Trux Earring", 		
		body = "Mpaca's Doublet", -- 10/0/0
		hands = "Adhemar Wristbands +1",
		ring1 = "Eihwaz Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Andartia.TPLow, -- 10/0/0
		waist = "Reiki Yotai",	
		legs = "Mpaca's Hose", -- 9/0/0
		feet = "Malignance Boots" -- 0/0/4
	} -- 20 DW | sTP+37 | 13DA/12TA/0QA | Enmity+13 | DT 29/0/14
	--15 DW needed
	sets.Tank.DT.Haste_35 = {
		ammo = "Date Shuriken", 
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Ninja Nodowa +1", 
		ear1 = "Cryptic Earring", 
		ear2 = "Trux Earring", 		
		body = "Mpaca's Doublet", -- 10/0/0
		hands = "Adhemar Wristbands +1", 
		ring1 = "Pernicious Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Andartia.TPLow, -- 10/0/0
		waist = "Reiki Yotai",	
		legs = "Mpaca's Hose", -- 9/0/0
		feet = "Hizamaru Sune-ate +1" 
	} -- 15 DW | sTP+24 | 14DA/12TA/0QA | Enmity+17 | DT 29/0/16
	--7 DW needed
	sets.Tank.DT.Haste_40 = {
		ammo = "Date Shuriken", 
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Ninja Nodowa +1", 
		ear1 = "Cryptic Earring", 
		ear2 = "Trux Earring", 		
		body = "Mpaca's Doublet", -- 10/0/0
		hands = "Adhemar Wristbands +1", 
		ring1 = "Pernicious Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Andartia.TPLow, -- 10/0/0
		waist = "Reiki Yotai",	
		legs = "Mpaca's Hose", -- 9/0/0
		feet = "Mpaca's Boots" 
	} -- 7 DW | sTP+24 | 14DA/12TA/0QA | Enmity+17 | DT 29/0/16	
	--1 DW needed
	sets.Tank.DT.Haste_45 = {
		ammo = "Date Shuriken", 
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Ninja Nodowa +1", 
		ear1 = "Cryptic Earring", 
		ear2 = "Trux Earring", 		
		body = "Mpaca's Doublet", -- 10/0/0
		hands = "Adhemar Wristbands +1", 
		ring1 = "Pernicious Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Andartia.Enmity, 
		waist = "Engraved Belt",	
		legs = "Mpaca's Hose", -- 9/0/0
		feet = "Mpaca's Boots" -- 6/0/0
	} -- 0 DW | sTP+20 | 4DA/15TA/0QA | Enmity+27 | DT 25/0/16
	
	sets.Tank.Evasion = {}
	sets.Tank.Evasion.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45"}
	--39 DW needed
	sets.Tank.Evasion.Haste_0 = {
		ammo = "Date Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Suppanomimi", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Malignance Gloves", -- 0/0/5 
		ring1 = "Vengeful Ring", 
		ring2 = "Ilabrat Ring", 
		back = Andartia.Enmity, 
		waist = "Sveltesse Gouriz +1",	
		legs = "Mochizuki Hakama +3", 
		feet = "Malignance Boots" -- 0/0/4
	} -- 37 DW | sTP+38 | 0DA/0TA/0QA | Enmity+16 | DT 0/0/9 | Eva+742
	--37 DW needed
	sets.Tank.Evasion.Haste_5 = {
		ammo = "Date Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Suppanomimi", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Malignance Gloves", -- 0/0/5 
		ring1 = "Vengeful Ring", 
		ring2 = "Ilabrat Ring", 
		back = Andartia.Enmity, 
		waist = "Sveltesse Gouriz +1",	
		legs = "Mochizuki Hakama +3", 
		feet = "Malignance Boots" -- 0/0/4
	} -- 37 DW | sTP+38 | 0DA/0TA/0QA | Enmity+16 | DT 0/0/9 | Eva+742	
	--35 DW needed
	sets.Tank.Evasion.Haste_10 = {
		ammo = "Date Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Suppanomimi", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Malignance Gloves", -- 0/0/5 
		ring1 = "Vengeful Ring", 
		ring2 = "Ilabrat Ring", 
		back = Andartia.Enmity, 
		waist = "Sveltesse Gouriz +1",	
		legs = "Mochizuki Hakama +3", 
		feet = "Malignance Boots" -- 0/0/4
	} -- 37 DW | sTP+38 | 0DA/0TA/0QA | Enmity+16 | DT 0/0/9 | Eva+742	
	--32 DW needed
	sets.Tank.Evasion.Haste_15 = {
		ammo = "Date Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Suppanomimi", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Malignance Gloves", -- 0/0/5 
		ring1 = "Vengeful Ring", 
		ring2 = "Regal Ring", 
		back = Andartia.Enmity, 
		waist = "Sveltesse Gouriz +1",	
		legs = "Hachiya Hakama +2", 
		feet = "Malignance Boots" -- 0/0/4
	} -- 31 DW | sTP+33 | 0DA/0TA/0QA | Enmity+16 | DT 0/0/9 | Eva+742
	--26 DW needed
	sets.Tank.Evasion.Haste_20 = {
		ammo = "Date Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Infused Earring", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Malignance Gloves", -- 0/0/5 
		ring1 = "Vengeful Ring", 
		ring2 = "Regal Ring", 
		back = Andartia.Enmity, 
		waist = "Sveltesse Gouriz +1",	
		legs = "Hachiya Hakama +2", 
		feet = "Malignance Boots" -- 0/0/4
	} -- 26 DW | sTP+33 | 0DA/0TA/0QA | Enmity+16 | DT 0/0/9 | Eva+742
	--23 DW needed
	sets.Tank.Evasion.Haste_25 = {
		ammo = "Date Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Suppanomimi", 		
		body = "Malignance Tabard", 
		hands = "Malignance Gloves", -- 0/0/5 
		ring1 = "Vengeful Ring", 
		ring2 = "Regal Ring", 
		back = Andartia.Enmity, 
		waist = "Sveltesse Gouriz +1",	
		legs = "Hachiya Hakama +2", 
		feet = "Malignance Boots" -- 0/0/4
	} -- 22 DW | sTP+33 | 0DA/0TA/0QA | Enmity+16 | DT 0/0/9 | Eva+742	
	--20 DW needed
	sets.Tank.Evasion.Haste_30 = {
		ammo = "Date Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Infused Earring", 		
		body = "Mochizuki Chainmail +3", 
		hands = "Malignance Gloves", -- 0/0/7
		ring1 = "Vengeful Ring", 
		ring2 = "Ilabrat Ring", 
		back = Andartia.Enmity, 
		waist = "Sveltesse Gouriz +1",	
		legs = "Malignance Tights", -- 0/0/7 
		feet = "Nyame Sollerets" -- 0/0/7
	} -- 22 DW | sTP+27 | 4DA/0TA/0QA | Enmity+16 | DT 0/0/21 | Eva+776
	--15 DW needed
	sets.Tank.Evasion.Haste_35 = {
		ammo = "Date Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Infused Earring", 		
		body = "Nyame Mail", -- 0/0/9 
		hands = "Nyame Gauntlets", -- 0/0/7
		ring1 = "Vengeful Ring", 
		ring2 = "Defending Ring", 
		back = Andartia.Enmity, 
		waist = "Reiki Yotai",	
		legs = "Malignance Tights", -- 0/0/7 
		feet = "Nyame Sollerets" -- 0/0/7
	} -- 13 DW | sTP+27 | 4DA/0TA/0QA | Enmity+16 | DT 0/0/40 | Eva+788
	--15 DW needed
	sets.Tank.Evasion.Haste_40 = {
		ammo = "Date Shuriken",
		head = "Ryuo Somen +1", 
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Infused Earring", 		
		body = "Nyame Mail", -- 0/0/9 
		hands = "Nyame Gauntlets", -- 0/0/7
		ring1 = "Vengeful Ring", 
		ring2 = "Defending Ring", 
		back = Andartia.Enmity, 
		waist = "Sveltesse Gouriz +1",	
		legs = "Malignance Tights", -- 0/0/7 
		feet = "Nyame Sollerets" -- 0/0/7
	} -- 4 DW | sTP+27 | 4DA/0TA/0QA | Enmity+16 | DT 0/0/40 | Eva+788	
	--1 DW needed
	sets.Tank.Evasion.Haste_45 = {
		ammo = "Date Shuriken",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Infused Earring", 		
		body = "Mpaca's Doublet", -- 10/0/0
		hands = "Nyame Gauntlets", -- 0/0/7
		ring1 = "Vengeful Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Andartia.Enmity, 
		waist = "Sveltesse Gouriz +1",	
		legs = "Mpaca's Hose", -- 9/0/0
		feet = "Nyame Sollerets" -- 0/0/7
	} -- 0 DW | sTP+27 | 4DA/8TA/0QA | Enmity+16 | DT 19/0/30 | Eva+839


	--TP Sets (H2H)--
	-- Martial Arts/gear traits reduce H2H base delay directly [delay caps at max(96, adjustedDelay x 0.2), not +96]
	-- Cannot cap delay reduction as NIN without /MNK (or something gross like blitzer's roll) 
	-- Good sets to have available, but won't make or break you
	sets.H2H = {}
	sets.H2H.index = {"Standard", "DT", "Evasion"}

	sets.H2H.Standard = {
		ammo = "Seki Shuriken",
		head = "Hizamaru Somen +2", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Mache Earring +1", 
		ear2 = "Mache Earring +1", 		
		body = "Kendatsuba Samue +1",
		hands = "Adhemar Wristbands +1",
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",	
		back = Andartia.TP, 
		waist = "Windbuffet Belt +1",	
		legs = "Mpaca's Hose", 
		feet = "Mpaca's Boots"
	} -- +39 M.Arts | 7DA/27TA/2QA | sTP+24
	sets.H2H.DT = {
		ammo = "Seki Shuriken",
		head = "Hizamaru Somen +2", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Mache Earring +1", 
		ear2 = "Mache Earring +1", 		
		body = "Mpaca's Doublet", -- 10/0/0
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring", -- 0/0/10	
		back = Andartia.TP, -- 10/0/0
		waist = "Windbuffet Belt +1",	
		legs = "Mpaca's Hose", -- 9/0/0
		feet = "Mpaca's Boots" -- 6/0/0
	} -- +39 M.Arts | 17DA/12TA/2QA | sTP+19 | 35/0/15 | Counter+10
	sets.H2H.DT_Yonin = {
		ammo = "Seki Shuriken",
		head = "Hizamaru Somen +2", 
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Mache Earring +1", 
		ear2 = "Mache Earring +1", 		
		body = "Mpaca's Doublet", -- 10/0/0
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring", -- 0/0/10	
		back = Andartia.TP, -- 10/0/0
		waist = "Windbuffet Belt +1",	
		legs = "Hattori Hakama +1",
		feet = "Mpaca's Boots" -- 6/0/0
	} -- +39 M.Arts | 17DA/12TA/2QA | sTP+14 | 26/0/21 | Counter+24
	sets.H2H.Evasion = {
		ammo = "Seki Shuriken",
		head = "Hizamaru Somen +2", 
		neck = "Bathy Choker +1", 
		ear1 = "Mache Earring +1", 
		ear2 = "Mache Earring +1", 		
		body = "Mpaca's Doublet", -- 10/0/0
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Vengeful Ring", 
		ring2 = "Ilabrat Ring",	
		back = Andartia.Enmity, 
		waist = "Sveltesse Gouriz +1",	
		legs = "Mpaca's Hose", -- 9/0/0
		feet = "Malignance Boots" -- 0/0/4
	} -- +39 M.Arts | 4DA/8TA/0QA | sTP+26 | 19/0/9 | Eva+774
	--Cannot toggle to this set, handled by tank_mode
	sets.H2H.Tank = {
		ammo = "Date Shuriken",
		head = "Hizamaru Somen +2", 
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Mache Earring +1", 
		ear2 = "Mache Earring +1", 		
		body = "Mpaca's Doublet", -- 10/0/0
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Gelatinous Ring +1", -- 7/-1/0
		ring2 = "Defending Ring", -- 0/0/10
		back = Andartia.Enmity, 
		waist = "Engraved Belt",	
		legs = "Mpaca's Hose", -- 9/0/0
		feet = "Malignance Boots" -- 0/0/4
	} -- +39 M.Arts | 4DA/8TA/0QA | sTP+22 | 26/-1/25 | +13 Enmity


	--TP Sets (GKT)--
	sets.GKT = {}
	sets.GKT.index = {"Standard", "DT", "Evasion"}

	sets.GKT.Standard = {
		ammo = "Seki Shuriken",
		head = "Dampening Tam", 
		neck = "Ninja Nodowa +1", 
		ear1 = "Crepuscular Earring", 
		ear2 = "Telos Earring", 		
		body = "Kendatsuba Samue +1",
		hands = HercHands.Quad,
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",	
		back = Andartia.TP, 
		waist = "Windbuffet Belt +1",	
		legs = "Samnuha Tights", 
		feet = HercFeet.Quad
	} -- 7DA/23TA/11QA | sTP+34 (+34/0/0 MA Rate using Hachimonji)
	sets.GKT.DT = {
		ammo = "Seki Shuriken",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Ninja Nodowa +1", 
		ear1 = "Crepuscular Earring", 
		ear2 = "Telos Earring", 		
		body = "Mpaca's Doublet", -- 10/0/0
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Andartia.TP, -- 10/0/0
		waist = "Windbuffet Belt +1",	
		legs = "Mpaca's Hose", -- 9/0/0 
		feet = "Malignance Boots" -- 0/0/4
	} -- 4DA/13TA/2QA | DT 29/0/25 | sTP+56 (+56/0/0 MA Rate using Hachimonji)
	sets.GKT.Evasion = {
		ammo = "Seki Shuriken",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Ninja Nodowa +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Infused Earring", 		
		body = "Mpaca's Doublet", -- 10/0/0
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Vengeful Ring", 
		ring2 = "Ilabrat Ring",
		back = Andartia.TP, -- 10/0/0
		waist = "Sveltesse Gouriz +1",	
		legs = "Mpaca's Hose", -- 9/0/0 
		feet = "Malignance Boots" -- 0/0/4
	} -- 0DA/8TA/0QA | DT 29/0/15 | sTP+41 (+41/0/0 MA Rate using Hachimonji) | Eva+799
	--Cannot toggle to this set, handled by tank_mode
	sets.GKT.Tank = {
		ammo = "Date Shuriken",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Cryptic Earring", 
		ear2 = "Trux Earring", 		
		body = "Mpaca's Doublet", -- 10/0/0
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Eihwaz Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Andartia.Enmity,
		waist = "Engraved Belt",	
		legs = "Mpaca's Hose", -- 9/0/0 
		feet = "Malignance Boots" -- 0/0/4
	} -- 3DA/8TA/0QA | DT 19/0/31 | sTP+34 (+36/0/0 MA Rate using Hachimonji) | +29 Enmity


	--Weaponskill Sets--
	sets.WS = {}
	sets.WS.index = {"Normal", "Attack", "AttackCapped"}
	WS_ind = 1	
	
	--For all sets assume you needfull TP Bonus gear
	--a later function handles optimization for TP thresholds
	
	--Katana
	sets.Metsu = {}
	sets.Metsu.Normal = {
		ammo="Cath Palug Stone",
		head="Hachiya Hatsuburi +3",
		neck="Ninja Nodowa +1",
		ear1="Lugra Earring +1",
		ear2="Odr Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Ilabrat Ring",
		back=Andartia.WSD,
		waist="Sailfi Belt +1",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}
	sets.Metsu.Attack = {
		ammo="Voluspa Tathlum",
		head="Nyame Helm",
		neck="Ninja Nodowa +1",
		ear1="Lugra Earring +1",
		ear2="Odr Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Ilabrat Ring",
		back=Andartia.WSD,
		waist="Sailfi Belt +1",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}
	sets.Metsu.AttackCapped = {
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
	
	sets.Shun = {}
	sets.Shun.Normal = {
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
	sets.Shun.Attack = {
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
	sets.Shun.AttackCapped = {
		ammo ="Crepuscular Pebble",
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
		legs="Mpaca's Hose",
		feet="Mpaca's Boots"
	}	
	
	sets.Ten = {}
	sets.Ten.Normal = {
		ammo="Voluspa Tathlum",
		head="Mpaca's Cap",
		neck="Ninja Nodowa +1",
		ear1="Moonshade Earring",
		ear2="Lugra Earring +1",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Sailfi Belt +1",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}
	sets.Ten.Attack = {
		ammo="Voluspa Tathlum",
		head="Mpaca's Cap",
		neck="Ninja Nodowa +1",
		ear1="Moonshade Earring",
		ear2="Lugra Earring +1",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Sailfi Belt +1",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}
	sets.Ten.AttackCapped = {
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
	
	sets.Kamu = {}
	sets.Kamu.Normal = {
		ammo="Voluspa Tathlum",
		head="Hachiya Hatsuburi +3",
		neck="Fotia Gorget",
		ear1="Lugra Earring +1",
		ear2="Ishvara Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Fotia Belt",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}
	sets.Kamu.Attack = {
		ammo="Voluspa Tathlum",
		head="Nyame Helm",
		neck="Fotia Gorget",
		ear1="Lugra Earring +1",
		ear2="Ishvara Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Fotia Belt",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}
	sets.Kamu.AttackCapped = {
		ammo="Voluspa Tathlum",
		head="Hachiya Hatsuburi +3",
		neck="Ninja Nodowa +1",
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
	
	sets.Hi = {}
	sets.Hi.Normal = {
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
	sets.Hi.Attack = {
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
	sets.Hi.AttackCapped = {
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

	sets.Ku = {}
	sets.Ku.Normal = {
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
	sets.Ku.Attack = {
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
	sets.Ku.AttackCapped = {
		ammo="Crepuscular Pebble",
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
	}

	sets.Chi = {}
	sets.Chi.Normal = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
        ear2="Friomisi Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Fotia Belt",
        legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.Chi.Attack = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
        ear2="Friomisi Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Fotia Belt",
        legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.Chi.AttackCapped = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
        ear2="Friomisi Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Fotia Belt",
        legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}

	sets.To = {}
	sets.To.Normal = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
        ear2="Friomisi Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Fotia Belt",
        legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.To.Attack = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
        ear2="Friomisi Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Fotia Belt",
        legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.To.AttackCapped = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
        ear2="Friomisi Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Fotia Belt",
        legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}	
	
	sets.Teki = {}
	sets.Teki.Normal = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
        ear2="Friomisi Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Fotia Belt",
        legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.Teki.Attack = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
        ear2="Friomisi Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Fotia Belt",
        legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.Teki.AttackCapped = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
        ear2="Friomisi Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Fotia Belt",
        legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	
	sets.Ei = {}
		--Higher MAcc set for MagWS
	sets.Ei.Normal = {
		ammo="Seething Bomblet +1",
		head="Pixie Hairpin +1",
		neck="Baetyl Pendant",
		ear1="Moonshade Earring",
        ear2="Friomisi Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Archon Ring",
		ring2="Dingir Ring",
		back=Andartia.MAB,
		waist="Eschan Stone",
        legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	--MAcc set for MagWS
	sets.Ei.Attack = {
		ammo="Seething Bomblet +1",
		head="Pixie Hairpin +1",
		neck="Baetyl Pendant",
		ear1="Moonshade Earring",
        ear2="Friomisi Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Archon Ring",
		ring2="Dingir Ring",
		back=Andartia.MAB,
		waist="Eschan Stone",
        legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.Ei.AttackCapped = {
		ammo="Seething Bomblet +1",
		head="Pixie Hairpin +1",
		neck="Baetyl Pendant",
		ear1="Moonshade Earring",
        ear2="Friomisi Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Archon Ring",
		ring2="Dingir Ring",
		back=Andartia.MAB,
		waist="Eschan Stone",
        legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}	
	
	sets.Yu = {}
	--Higher MAcc set for MagWS
	sets.Yu.Normal = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Baetyl Pendant",
		ear1="Moonshade Earring",
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
	--MAcc set for MagWS
	sets.Yu.Attack = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Baetyl Pendant",
		ear1="Moonshade Earring",
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
	sets.Yu.AttackCapped = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Baetyl Pendant",
		ear1="Moonshade Earring",
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

	sets.Jin = {}
	sets.Jin.Normal = {
        ammo="Yetshila",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Lugra Earring +1",
		ear2="Odr Earring",
		body="Kendatsuba Samue +1",
		hands="Ryuo Tekko",
		ring1="Regal Ring",
		ring2="Ilabrat Ring",
		back=Andartia.TPLow,
		waist="Fotia Belt",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots"
	}
	sets.Jin.Attack = {
        ammo="Yetshila",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Lugra Earring +1",
		ear2="Odr Earring",
		body="Kendatsuba Samue +1",
		hands="Ryuo Tekko",
		ring1="Regal Ring",
		ring2="Ilabrat Ring",
		back=Andartia.TPLow,
		waist="Fotia Belt",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots"
	}
	sets.Jin.AttackCapped = {
        ammo="Yetshila",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Lugra Earring +1",
		ear2="Odr Earring",
		body="Kendatsuba Samue +1",
		hands="Ryuo Tekko",
		ring1="Regal Ring",
		ring2="Ilabrat Ring",
		back=Andartia.TPLow,
		waist="Fotia Belt",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots"
	}

	sets.Rin = {}
	sets.Rin.Normal = {
        ammo="Yetshila",
		head="Hachiya Hatsuburi +3",
		neck="Ninja Nodowa +1",
		ear1="Lugra Earring +1",
		ear2="Odr Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Sailfi Belt +1",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}
	sets.Rin.Attack = {
        ammo="Yetshila",
		head="Hachiya Hatsuburi +3",
		neck="Ninja Nodowa +1",
		ear1="Lugra Earring +1",
		ear2="Odr Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Sailfi Belt +1",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}
	sets.Rin.AttackCapped = {
        ammo="Yetshila",
		head="Hachiya Hatsuburi +3",
		neck="Ninja Nodowa +1",
		ear1="Lugra Earring +1",
		ear2="Odr Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Sailfi Belt +1",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}	
	
	--Should really just be geared to land paralyze
	sets.Retsu = {}
	sets.Retsu.Normal = {
        ammo="Yamarang",
		head="Malignance Chapeau",
		neck="Ninja Nodowa +1",
		ear1="Crepuscular Earring",
		ear2="Dignitary's Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Regal Ring",
		ring2="Etana Ring",
		back=Andartia.Ten,
		waist="Eschan Stone",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}
	sets.Retsu.Attack = {
        ammo="Yamarang",
		head="Malignance Chapeau",
		neck="Ninja Nodowa +1",
		ear1="Crepuscular Earring",
		ear2="Dignitary's Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Regal Ring",
		ring2="Etana Ring",
		back=Andartia.Ten,
		waist="Eschan Stone",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}
	sets.Retsu.AttackCapped = {
        ammo="Yamarang",
		head="Malignance Chapeau",
		neck="Ninja Nodowa +1",
		ear1="Crepuscular Earring",
		ear2="Dignitary's Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Regal Ring",
		ring2="Etana Ring",
		back=Andartia.Ten,
		waist="Eschan Stone",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}	
	

	--Sword
	sets.SavageBlade = {}
	sets.SavageBlade.Normal = {
		ammo="Voluspa Tathlum",
		head="Mpaca's Cap",
		neck="Caro Necklace",
		ear1="Moonshade Earring",
		ear2="Lugra Earring +1",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Sailfi Belt +1",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}
	sets.SavageBlade.Attack = {
		ammo="Voluspa Tathlum",
		head="Mpaca's Cap",
		neck="Caro Necklace",
		ear1="Moonshade Earring",
		ear2="Lugra Earring +1",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Sailfi Belt +1",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}
	sets.SavageBlade.AttackCapped = {
		ammo="Crepuscular Pebble",
		head="Mpaca's Cap",
		neck="Ninja Nodowa +1",
		ear1="Moonshade Earring",
		ear2="Lugra Earring +1",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Sailfi Belt +1",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}	
	
	sets.SanguineBlade = {}
	--Higher MAcc set
	sets.SanguineBlade.Normal = {
		ammo="Seething Bomblet +1",
		head="Pixie Hairpin +1",
		neck="Baetyl Pendant",
		ear1="Moonshade Earring",
        ear2="Friomisi Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Archon Ring",
		ring2="Dingir Ring",
		back=Andartia.MAB,
		waist="Eschan Stone",
        legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	-- MAcc set
	sets.SanguineBlade.Attack = {
		ammo="Seething Bomblet +1",
		head="Pixie Hairpin +1",
		neck="Baetyl Pendant",
		ear1="Moonshade Earring",
        ear2="Friomisi Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Archon Ring",
		ring2="Dingir Ring",
		back=Andartia.MAB,
		waist="Eschan Stone",
        legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.SanguineBlade.AttackCapped = {
		ammo="Seething Bomblet +1",
		head="Pixie Hairpin +1",
		neck="Baetyl Pendant",
		ear1="Moonshade Earring",
        ear2="Friomisi Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Archon Ring",
		ring2="Dingir Ring",
		back=Andartia.MAB,
		waist="Eschan Stone",
        legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}	
	
	sets.RedLotusBlade = {}
	--Higher MAcc set
	sets.RedLotusBlade.Normal = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Baetyl Pendant",
		ear1="Moonshade Earring",
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
	-- MAcc set
	sets.RedLotusBlade.Attack = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Baetyl Pendant",
		ear1="Moonshade Earring",
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
	sets.RedLotusBlade.AttackCapped = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Baetyl Pendant",
		ear1="Moonshade Earring",
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
	
	-- Swaps disallowed for this set due to SC-compatibility needs in Omen
	sets.BurningBlade = {}
	--Higher MAcc set
	sets.BurningBlade.Normal = {}
		-- ammo="Seething Bomblet +1",
		-- head="Mochizuki Hatsuburi +3",
		-- neck="Baetyl Pendant",
		-- ear1="Moonshade Earring",
        -- ear2="Friomisi Earring",
		-- body="Nyame Mail",
        -- hands="Nyame Gauntlets",
        -- ring1="Acumen Ring",
		-- ring2="Dingir Ring",
		-- back=Andartia.MAB,
		-- waist="Eschan Stone",
        -- legs="Nyame Flanchard",
		-- feet="Nyame Sollerets"
	-- }
	-- MAcc set
	sets.BurningBlade.Attack = {}
		-- ammo="Seething Bomblet +1",
		-- head="Mochizuki Hatsuburi +3",
		-- neck="Baetyl Pendant",
		-- ear1="Moonshade Earring",
        -- ear2="Friomisi Earring",
		-- body="Nyame Mail",
        -- hands="Nyame Gauntlets",
        -- ring1="Acumen Ring",
		-- ring2="Dingir Ring",
		-- back=Andartia.MAB,
		-- waist="Eschan Stone",
        -- legs="Nyame Flanchard",
		-- feet="Nyame Sollerets"
	-- }
	sets.BurningBlade.AttackCapped = {}
		-- ammo="Seething Bomblet +1",
		-- head="Mochizuki Hatsuburi +3",
		-- neck="Baetyl Pendant",
		-- ear1="Moonshade Earring",
        -- ear2="Friomisi Earring",
		-- body="Nyame Mail",
        -- hands="Nyame Gauntlets",
        -- ring1="Acumen Ring",
		-- ring2="Dingir Ring",
		-- back=Andartia.MAB,
		-- waist="Eschan Stone",
        -- legs="Nyame Flanchard",
		-- feet="Nyame Sollerets"
	-- }

	sets.SeraphBlade = {}
	--Higher MAcc set
	sets.SeraphBlade.Normal = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Baetyl Pendant",
		ear1="Moonshade Earring",
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
	-- MAcc set
	sets.SeraphBlade.Attack = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Baetyl Pendant",
		ear1="Moonshade Earring",
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
	sets.SeraphBlade.AttackCapped = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Baetyl Pendant",
		ear1="Moonshade Earring",
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
	
	-- Swaps disallowed for this set due to SC-compatibility needs in Omen
	sets.ShiningBlade = {}
	--Higher MAcc set
	sets.ShiningBlade.Normal = {}
		-- ammo="Seething Bomblet +1",
		-- head="Mochizuki Hatsuburi +3",
		-- neck="Baetyl Pendant",
		-- ear1="Moonshade Earring",
        -- ear2="Friomisi Earring",
		-- body="Nyame Mail",
        -- hands="Nyame Gauntlets",
        -- ring1="Acumen Ring",
		-- ring2="Dingir Ring",
		-- back=Andartia.MAB,
		-- waist="Eschan Stone",
        -- legs="Nyame Flanchard",
		-- feet="Nyame Sollerets"
	-- }
	-- MAcc set
	sets.ShiningBlade.Attack = {}
		-- ammo="Seething Bomblet +1",
		-- head="Mochizuki Hatsuburi +3",
		-- neck="Baetyl Pendant",
		-- ear1="Moonshade Earring",
        -- ear2="Friomisi Earring",
		-- body="Nyame Mail",
        -- hands="Nyame Gauntlets",
        -- ring1="Acumen Ring",
		-- ring2="Dingir Ring",
		-- back=Andartia.MAB,
		-- waist="Eschan Stone",
        -- legs="Nyame Flanchard",
		-- feet="Nyame Sollerets"
	-- }
	sets.ShiningBlade.AttackCapped = {}
		-- ammo="Seething Bomblet +1",
		-- head="Mochizuki Hatsuburi +3",
		-- neck="Baetyl Pendant",
		-- ear1="Moonshade Earring",
        -- ear2="Friomisi Earring",
		-- body="Nyame Mail",
        -- hands="Nyame Gauntlets",
        -- ring1="Acumen Ring",
		-- ring2="Dingir Ring",
		-- back=Andartia.MAB,
		-- waist="Eschan Stone",
        -- legs="Nyame Flanchard",
		-- feet="Nyame Sollerets"
	-- }	
	
	--Should really just be geared to land stun
	sets.FlatBlade = {}
	sets.FlatBlade.Normal = {
        ammo="Yamarang",
		head="Malignance Chapeau",
		neck="Ninja Nodowa +1",
		ear1="Crepuscular Earring",
		ear2="Dignitary's Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Regal Ring",
		ring2="Etana Ring",
		back=Andartia.Ten,
		waist="Eschan Stone",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}
	sets.FlatBlade.Attack = {
        ammo="Yamarang",
		head="Malignance Chapeau",
		neck="Ninja Nodowa +1",
		ear1="Crepuscular Earring",
		ear2="Dignitary's Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Regal Ring",
		ring2="Etana Ring",
		back=Andartia.Ten,
		waist="Eschan Stone",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}
	sets.FlatBlade.AttackCapped = {
        ammo="Yamarang",
		head="Malignance Chapeau",
		neck="Ninja Nodowa +1",
		ear1="Crepuscular Earring",
		ear2="Dignitary's Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Regal Ring",
		ring2="Etana Ring",
		back=Andartia.Ten,
		waist="Eschan Stone",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}
	
	sets.VorpalBlade = {}
	sets.VorpalBlade.Normal = {
        ammo="Yetshila",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Lugra Earring +1",
		ear2="Odr Earring",
		body="Kendatsuba Samue +1",
		hands="Ryuo Tekko",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.TPLow,
		waist="Fotia Belt",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots"
	}
	sets.VorpalBlade.Attack = {
        ammo="Yetshila",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Lugra Earring +1",
		ear2="Odr Earring",
		body="Kendatsuba Samue +1",
		hands="Ryuo Tekko",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.TPLow,
		waist="Fotia Belt",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots"
	}
	sets.VorpalBlade.AttackCapped = {
        ammo="Yetshila",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Lugra Earring +1",
		ear2="Odr Earring",
		body="Kendatsuba Samue +1",
		hands="Ryuo Tekko",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.TPLow,
		waist="Fotia Belt",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots"
	}


	--Dagger
	sets.Evisceration = {}
	sets.Evisceration.Normal = {
        ammo="Yetshila",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Lugra Earring +1",
		ear2="Odr Earring",
		body="Kendatsuba Samue +1",
		hands="Ryuo Tekko",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.TPLow,
		waist="Fotia Belt",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots"
	}
	sets.Evisceration.Attack = {
        ammo="Yetshila",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Lugra Earring +1",
		ear2="Odr Earring",
		body="Kendatsuba Samue +1",
		hands="Ryuo Tekko",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.TPLow,
		waist="Fotia Belt",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots"
	}
	sets.Evisceration.AttackCapped = {
        ammo="Yetshila",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Lugra Earring +1",
		ear2="Odr Earring",
		body="Kendatsuba Samue +1",
		hands="Ryuo Tekko",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.TPLow,
		waist="Fotia Belt",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots"
	}	
	
	sets.AeolianEdge = {}
	--Higher MAcc set for MagWS
	sets.AeolianEdge.Normal = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Baetyl Pendant",
		ear1="Moonshade Earring",
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
	--MAcc set for MagWS
	sets.AeolianEdge.Attack = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Baetyl Pendant",
		ear1="Moonshade Earring",
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
	sets.AeolianEdge.AttackCapped = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Baetyl Pendant",
		ear1="Moonshade Earring",
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


	--H2H
	sets.AsuranFists = {}
	sets.AsuranFists.Normal = {
		ammo="Voluspa Tathlum",
		head="Hachiya Hatsuburi +3",
		neck="Fotia Gorget",
		ear1="Lugra Earring +1",
		ear2="Telos Earring",
		body="Nyame Mail",
		hands=HercHands.WSD,
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Fotia Belt",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}
	sets.AsuranFists.Attack = {
		ammo="Voluspa Tathlum",
		head="Mpaca's Cap",
		neck="Fotia Gorget",
		ear1="Lugra Earring +1",
		ear2="Telos Earring",
		body="Mochizuki Chainmail +3",
		hands="Mochizuki Tekko +3",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Fotia Belt",
		legs="Mochizuki Hakama +3",
		feet="Mochizuki Kyahan +3"
	}
	sets.AsuranFists.AttackCapped = {
		ammo="Voluspa Tathlum",
		head="Malignance Chapeau",
		neck="Fotia Gorget",
		ear1="Lugra Earring +1",
		ear2="Telos Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Fotia Belt",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}	
	
	sets.RagingFists = {}
	sets.RagingFists.Normal = {
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
	sets.RagingFists.Attack = {
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
	sets.RagingFists.AttackCapped = {
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
	
	sets.Combo = {}
	sets.Combo.Normal = {
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
	sets.Combo.Attack = {
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
	sets.Combo.AttackCapped = {
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

	--Should really just be geared to land stun
	sets.ShoulderTackle = {}
	sets.ShoulderTackle.Normal = {
        ammo="Yamarang",
		head="Malignance Chapeau",
		neck="Ninja Nodowa +1",
		ear1="Crepuscular Earring",
		ear2="Dignitary's Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Regal Ring",
		ring2="Etana Ring",
		back=Andartia.Ten,
		waist="Eschan Stone",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}
	sets.ShoulderTackle.Attack = {
        ammo="Yamarang",
		head="Malignance Chapeau",
		neck="Ninja Nodowa +1",
		ear1="Crepuscular Earring",
		ear2="Dignitary's Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Regal Ring",
		ring2="Etana Ring",
		back=Andartia.Ten,
		waist="Eschan Stone",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}
	sets.ShoulderTackle.AttackCapped = {
        ammo="Yamarang",
		head="Malignance Chapeau",
		neck="Ninja Nodowa +1",
		ear1="Crepuscular Earring",
		ear2="Dignitary's Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Regal Ring",
		ring2="Etana Ring",
		back=Andartia.Ten,
		waist="Eschan Stone",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}
	
	sets.SpinningAttack = {}
	sets.SpinningAttack.Normal = {
		ammo="Voluspa Tathlum",
		head="Mpaca's Cap",
		neck="Caro Necklace",
		ear1="Moonshade Earring",
		ear2="Lugra Earring +1",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Sailfi Belt +1",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}
	sets.SpinningAttack.Attack = {
		ammo="Voluspa Tathlum",
		head="Mpaca's Cap",
		neck="Caro Necklace",
		ear1="Moonshade Earring",
		ear2="Lugra Earring +1",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Sailfi Belt +1",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}
	sets.SpinningAttack.AttackCapped = {
		ammo="Crepuscular Pebble",
		head="Mpaca's Cap",
		neck="Ninja Nodowa +1",
		ear1="Moonshade Earring",
		ear2="Lugra Earring +1",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Sailfi Belt +1",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}
	
	
	--GKT
	sets.Kasha = {}
	sets.Kasha.Normal = {
		ammo="Voluspa Tathlum",
		head="Mpaca's Cap",
		neck="Caro Necklace",
		ear1="Moonshade Earring",
		ear2="Lugra Earring +1",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Sailfi Belt +1",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}
	sets.Kasha.Attack = {
		ammo="Voluspa Tathlum",
		head="Mpaca's Cap",
		neck="Caro Necklace",
		ear1="Moonshade Earring",
		ear2="Lugra Earring +1",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Sailfi Belt +1",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}
	sets.Kasha.AttackCapped = {
		ammo="Crepuscular Pebble",
		head="Mpaca's Cap",
		neck="Ninja Nodowa +1",
		ear1="Moonshade Earring",
		ear2="Lugra Earring +1",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Sailfi Belt +1",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}	
	
	sets.Jinpu = {}
	sets.Jinpu.Normal = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
        ear2="Friomisi Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Fotia Belt",
        legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.Jinpu.Attack = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
        ear2="Friomisi Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Fotia Belt",
        legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.Jinpu.AttackCapped = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
        ear2="Friomisi Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Fotia Belt",
        legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	
	--Should really just be geared to land DefDown
	sets.Ageha = {}
	sets.Ageha.Normal = {
        ammo="Yamarang",
		head="Malignance Chapeau",
		neck="Ninja Nodowa +1",
		ear1="Crepuscular Earring",
		ear2="Dignitary's Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Regal Ring",
		ring2="Etana Ring",
		back=Andartia.Ten,
		waist="Eschan Stone",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}
	sets.Ageha.Attack = {
        ammo="Yamarang",
		head="Malignance Chapeau",
		neck="Ninja Nodowa +1",
		ear1="Crepuscular Earring",
		ear2="Dignitary's Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Regal Ring",
		ring2="Etana Ring",
		back=Andartia.Ten,
		waist="Eschan Stone",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}
	sets.Ageha.AttackCapped = {
        ammo="Yamarang",
		head="Malignance Chapeau",
		neck="Ninja Nodowa +1",
		ear1="Crepuscular Earring",
		ear2="Dignitary's Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Regal Ring",
		ring2="Etana Ring",
		back=Andartia.Ten,
		waist="Eschan Stone",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}	
	
	--Should really just be geared to land stun
	sets.Hobaku = {}
	sets.Hobaku.Normal = {
        ammo="Yamarang",
		head="Malignance Chapeau",
		neck="Ninja Nodowa +1",
		ear1="Crepuscular Earring",
		ear2="Dignitary's Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Regal Ring",
		ring2="Etana Ring",
		back=Andartia.Ten,
		waist="Eschan Stone",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}
	sets.Hobaku.Attack = {
        ammo="Yamarang",
		head="Malignance Chapeau",
		neck="Ninja Nodowa +1",
		ear1="Crepuscular Earring",
		ear2="Dignitary's Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Regal Ring",
		ring2="Etana Ring",
		back=Andartia.Ten,
		waist="Eschan Stone",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}
	sets.Hobaku.AttackCapped = {
        ammo="Yamarang",
		head="Malignance Chapeau",
		neck="Ninja Nodowa +1",
		ear1="Crepuscular Earring",
		ear2="Dignitary's Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Regal Ring",
		ring2="Etana Ring",
		back=Andartia.Ten,
		waist="Eschan Stone",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}	

	sets.Kagero = {}
	sets.Kagero.Normal = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
        ear2="Friomisi Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Fotia Belt",
        legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.Kagero.Attack = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
        ear2="Friomisi Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Fotia Belt",
        legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.Kagero.AttackCapped = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
        ear2="Friomisi Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Fotia Belt",
        legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}	
	
	sets.Koki = {}
	sets.Koki.Normal = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
        ear2="Friomisi Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Fotia Belt",
        legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.Koki.Attack = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
        ear2="Friomisi Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Fotia Belt",
        legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.Koki.AttackCapped = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
        ear2="Friomisi Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Fotia Belt",
        legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}		
	
	sets.Enpi = {}
	sets.Enpi.Normal = {
		ammo="Voluspa Tathlum",
		head="Mpaca's Cap",
		neck="Caro Necklace",
		ear1="Moonshade Earring",
		ear2="Lugra Earring +1",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Sailfi Belt +1",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}
	sets.Enpi.Attack = {
		ammo="Voluspa Tathlum",
		head="Mpaca's Cap",
		neck="Caro Necklace",
		ear1="Moonshade Earring",
		ear2="Lugra Earring +1",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Sailfi Belt +1",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}
	sets.Enpi.AttackCapped = {
		ammo="Crepuscular Pebble",
		head="Mpaca's Cap",
		neck="Ninja Nodowa +1",
		ear1="Moonshade Earring",
		ear2="Lugra Earring +1",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Sailfi Belt +1",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}
	
	sets.OtherWS = {}
	sets.OtherWS.Normal = {
		ammo="Voluspa Tathlum",
		head="Mpaca's Cap",
		neck="Caro Necklace",
		ear1="Moonshade Earring",
		ear2="Lugra Earring +1",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Sailfi Belt +1",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}
	sets.OtherWS.Attack = {
		ammo="Voluspa Tathlum",
		head="Mpaca's Cap",
		neck="Caro Necklace",
		ear1="Moonshade Earring",
		ear2="Lugra Earring +1",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Sailfi Belt +1",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}
	sets.OtherWS.AttackCapped = {
		ammo="Crepuscular Pebble",
		head="Mpaca's Cap",
		neck="Ninja Nodowa +1",
		ear1="Moonshade Earring",
		ear2="Lugra Earring +1",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Andartia.Ten,
		waist="Sailfi Belt +1",
		legs="Mochizuki Hakama +3",
		feet="Nyame Sollerets"
	}	
	
	
	--Job Ability Sets--
	sets.JA = {}
	sets.JA.MijinGakure = {legs = "Mochizuki Hakama +3"}
	
	sets.JA.Waltz ={
	-- Insert gear here as desired
	}	
	
	
	--Precast Sets
	sets.precast = {}
	sets.precast.FastCast = {
        ammo="Sapience Orb", --2
		head=HercHelm.FC, --12
		neck="Orunmila's Torque", --5
        ear1="Loquacious Earring", --2
		ear2="Enchanter's Earring +1", --2
        body=AdhemarBody.FC, --10
		hands="Leyline Gloves", --8
		ring1="Kishar Ring", --4
		ring2="Rahab Ring", --2
		back=Andartia.FC, --10
		waist="Flume Belt +1",
		legs=HercLegs.FC, --7
		feet=HercFeet.FC --7
	} -- +71% FC
	
	--This is here if you need it for Utsusemi
	sets.precast.NinjutsuFastCast = set_combine(sets.precast.FastCast, {
		--neck = "Magoraga Beads",
		body = "Mochizuki Chainmail +3"
	}) -- caps Cast Time Delay (-80%) with the above FC set
	
	
	--Midcast Sets
	sets.midcast = {}
	-- FC here will lower recasts until cap, but its a good idea to put -DT% in midcasts
	sets.midcast.FastRecast = {
        ammo="Sapience Orb", --2
		head=HercHelm.FC, --12
		neck="Orunmila's Torque", --5
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
	} 

	sets.midcast.Ninjutsu_macc = {
		ammo = "Yamarang", -- (15)
		head = "Hachiya Hatsuburi +3", -- +17 (54)
		neck = "Sanctity Necklace", -- (10)
		ear1 = "Dignitary's Earring", -- (10)
		ear2 = "Crepuscular Earring", -- (10)
		body = "Malignance Tabard", -- (50)
		hands = "Malignance Gloves", -- (50)
		ring1 = "Regal Ring", -- (15)
		ring2 = "Stikini Ring", -- +5 (8)
		back = Andartia.MAB, -- (20)
		waist = "Eschan Stone", -- (7)
		legs = "Malignance Tights", -- (50)
		feet = "Mochizuki Kyahan +3" -- +23 (36)
	} -- +45 Skill | +335 MAcc
	
	--Pretty much just Migawari at this point
	--Hattori Ningi needs to be worn atthe timedamage is taken, 
	--not on cast, to receive its effect.
	--Focus on Recast and Skill
	sets.midcast.Ninjutsu_skill = {
		ammo = "Sapience Orb",
		head = "Hachiya Hatsuburi +3", 
		neck = "Incanter's Torque",
		ear1 = "Hnoss Earring", 
		ear2 = "Stealth Earring", 
		body = AdhemarBody.FC, 
		hands = "Leyline Gloves",
		ring1 = "Stikini Ring", 
		ring2 = "Stikini Ring", 
		back = Andartia.FC, 
		waist = "Cimmerian Sash", 
		legs = HercLegs.FC,
		feet = "Mochizuki Kyahan +3" 
	} -- Triggers at approx. 42% of current max HP with this set
	
	sets.midcast.Ninjutsu_utsusemi = {
        ammo="Sapience Orb", --2
		head=HercHelm.FC, --12
		neck="Orunmila's Torque", --5
        ear1="Loquacious Earring", --2
		ear2="Enchanter's Earring +1", --2
        body=AdhemarBody.FC, --10
		hands="Leyline Gloves", --8
		ring1="Kishar Ring", --4
		ring2="Defending Ring",
		back=Andartia.FC, --10
		waist="Flume Belt +1",
		legs=HercLegs.FC, --5
		feet="Hattori Kyahan +1"
	} -- +60 FastCast | DT 16/0/10
	
	sets.midcast.Ninjutsu_utsusemi_enmity = {
		ammo="Staunch Tathlum +1", -- 0/0/3
		head="Malignance Chapeau", -- 0/0/6
		neck="Unmoving Collar +1", -- +10
        ear1="Cryptic Earring", -- (+4)
        ear2="Trux Earring", -- (+5)
        body="Emet Harness +1", -- (+10) 6/0/0
		hands="Kurys Gloves", -- (+9) 0/0/2
        ring1="Eihwaz Ring", -- (+5)
        ring2="Defending Ring", -- 0/0/10
		back=Andartia.Enmity, -- (+10)
		waist="Flume Belt +1", -- 4/0/0
		legs="Zoar Subligar +1", -- (+6)
        feet="Hattori Kyahan +1"
	} -- +59 Enmity | DT 10/0/31
	
	sets.midcast.Ninjutsu_nuke = {
		ammo="Pemphredo Tathlum",
        head="Mochizuki Hatsuburi +3",
		neck="Baetyl Pendant",
        ear1="Friomisi Earring",
        ear2="Crematio Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Acumen Ring",
        ring2="Dingir Ring",
		back=Andartia.MAB,
		waist="Eschan Stone",
		legs="Nyame Flanchard",
		feet="Mochizuki Kyahan +3"
	}
	
	sets.midcast.Ninjutsu_nuke_futae = {
		ammo="Pemphredo Tathlum",
        head="Mochizuki Hatsuburi +3",
		neck="Baetyl Pendant",
        ear1="Friomisi Earring",
        ear2="Crematio Earring",
		body="Nyame Mail",
        hands="Hattori Tekko +1",
        ring1="Acumen Ring",
        ring2="Dingir Ring",
		back=Andartia.MAB,
		waist="Eschan Stone",
		legs="Nyame Flanchard",
		feet="Mochizuki Kyahan +3"
	}

	sets.midcast.Ninjutsu_nuke_macc = {
		ammo="Pemphredo Tathlum",
        head="Mochizuki Hatsuburi +3",
		neck="Baetyl Pendant",
        ear1="Friomisi Earring",
        ear2="Crematio Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Acumen Ring",
        ring2="Dingir Ring",
		back=Andartia.MAB,
		waist="Eschan Stone",
		legs="Nyame Flanchard",
		feet="Mochizuki Kyahan +3"
	}
	
	sets.midcast.Ninjutsu_nuke_futae_macc = {
		ammo="Pemphredo Tathlum",
        head="Mochizuki Hatsuburi +3",
		neck="Baetyl Pendant",
        ear1="Friomisi Earring",
        ear2="Crematio Earring",
		body="Nyame Mail",
        hands="Hattori Tekko +1",
        ring1="Acumen Ring",
        ring2="Dingir Ring",
		back=Andartia.MAB,
		waist="Eschan Stone",
		legs="Nyame Flanchard",
		feet="Mochizuki Kyahan +3"
	}	
	
	sets.midcast.Ninjutsu_burst = {
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
	
	sets.midcast.Ninjutsu_burst_futae = {
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
	
	sets.midcast.Ninjutsu_burst_macc = {
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
	
	sets.midcast.Ninjutsu_burst_futae_macc = {
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
	
	
	--Special Sets
	sets.Obi = {waist = "Hachirin-no-Obi"}	
	
	sets.Doom = {
		neck = "Nicander's Necklace",
		ring1 = "Purity Ring",
		ring2 = "Defending Ring",
		waist = "Gishdubar Sash"
	} -- Actually get the gear for this set. It isnt hard and it makes Doom trivial to remove.
	
	-- Set to be enabled when you are unable to act
	-- Sleep / Terror / Stun / Petrification
	-- You can dance if you want to.
	sets.SafetyDance = {
		ammo = "Yamarang",
		head = "Nyame Helm", 
		neck = "Warder's Charm +1",
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring", 
		body = "Mpaca's Doublet", 
		hands = "Nyame Gauntlets",
		ring1 = "Purity Ring", 
		ring2 = "Defending Ring", 
		back = Andartia.Enmity, 
		waist = "Engraved Belt", 
		legs = "Mpaca's Hose",
		feet = "Nyame Sollerets" 
	}
	
	sets.SafetyDance_tank_mode = {
		ammo = "Yamarang",
		head = "Nyame Helm", 
		neck = "Unmoving Collar +1",
		ear1 = "Cryptic Earring", 
		ear2 = "Trux Earring", 
		body = "Mpaca's Doublet", 
		hands = "Nyame Gauntlets",
		ring1 = "Eihwaz Ring", 
		ring2 = "Defending Ring", 
		back = Andartia.Enmity, 
		waist = "Engraved Belt", 
		legs = "Mpaca's Hose",
		feet = "Nyame Sollerets" 
	}

	sets.Phalanx = {
		ammo = "Staunch Tathlum +1",
		head = TaeonHead.Phalanx, 
		neck = "Incanter's Torque",
		ear1 = "Andoaa Earring", 
		ear2 = "Mimir Earring", 
		body = HercVest.Phalanx, 
		hands = HercHands.Phalanx,
		ring1 = "Stikini Ring", 
		ring2 = "Stikini Ring", 
		back = Andartia.Enmity, 
		waist = "Olympus Sash", 
		legs = HercLegs.Phalanx,
		feet = HercFeet.Phalanx
	}

	sets.Enmity = {
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
	}

	sets.Swipe = {
		ammo="Pemphredo Tathlum",
        head="Mochizuki Hatsuburi +3",
		neck="Baetyl Pendant",
        ear1="Friomisi Earring",
        ear2="Crematio Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Acumen Ring",
        ring2="Dingir Ring",
		back=Andartia.MAB,
		waist="Eschan Stone",
		legs="Nyame Flanchard",
		feet="Mochizuki Kyahan +3"
	}

	sets.Swipe_MB = {
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
	
	sets.Day_kite = {
		feet = "Danzo Sune-ate"
	}
	
	sets.Night_kite = {
		feet = "Hachiya Kyahan +2"
	}
	

	--DO NOT REMOVE--
	prep_startup()
end


------------------------------------------------------------------------------
------------------------------------------------------------------------------
--Do Not Adjust Anything Below This Point Unless You Know What You Are Doing--
------------------------------------------------------------------------------
------------------------------------------------------------------------------
function maps()
	--only update the field if you do not wish to use Lugra Earring as replacement
	-- -- designed in the function so it will update the proper chosen earring regardless of
	-- -- how you set your gear up in the sets.
	TP_bonus_replacement_earring = "Lugra Earring"
	TP_bonus_replacement_multiattack_earring = "Lugra Earring"

	--Mapping--		
	Unusable_buff = {
		spell={'Charm','Mute','Omerta','Petrification','Silence','Sleep','Stun','Terror'},
		ability={'Amnesia','Charm','Impairment','Petrification','Sleep','Stun','Terror'}}	

	Enmity_actions = S{
		'Sentinel', 'Shield Bash', 'Souleater', 'Weapon Bash', 'Vallation', 'Swordplay', 
		'Pflug', 'Provoke', 'Stun', 'Flash'}
		
	Nuke_spells = S{
		'Doton: Ichi', 'Suiton: Ichi', 'Huton: Ichi', 'Katon: Ichi', 'Hyoton: Ichi', 'Raiton: Ichi', 
		'Doton: Ni', 'Suiton: Ni', 'Huton: Ni', 'Katon: Ni', 'Hyoton: Ni', 'Raiton: Ni', 
		'Doton: San', 'Suiton: San', 'Huton: San', 'Katon: San', 'Hyoton: San', 'Raiton: San'}
		
	MAcc_spells = S{
		'Hojo: Ichi', 'Hojo: Ni', 'Kurayami: Ichi', 'Kurayami: Ni', 'Dokomuri: Ichi', 'Aisha: Ichi', 
		'Yurin: Ichi'}
		
	Buff_spells = S{
		'Tonko: Ichi', 'Tonko: Ni', 'Monomi: Ichi', 'Myoshu: Ichi', 'Kakka: Ichi', 'Gekka: Ichi', 'Yain: Ichi'}
		
	Utsusemi_spells = S{
		'Utsusemi: Ichi', 'Utsusemi: Ni', 'Utsusemi: San'}
	
	--Most common weapons that are not DW
	Not_dual_wield_weapons = S{
		'Karambit', 'Hachimonji'}
		
	TP_bonus_equipment = S{
		"Heishi Shorinken", "Uzura +2", "Hitaki", "Mpaca's Cap", "Moonshade Earring"}
	
	TP_bonus_weaponskill = S{
		'Blade: Ten', 'Savage Blade', 'Tachi: Kasha'}
		
	TP_bonus_multi_weaponskill = S{
		'Blade: Shun', 'Blade: Ku'}
	
	fTP_transfer_weaponskill = S{
		'Blade: Shun', 'Blade: Ku', 'Asuran Fists', 'Evisceration'}
		
	check_ws_day = {
		Firesday = S {'Liquefaction','Fusion','Light'},
		Earthsday= S {'Scission','Gravitation','Darkness'},
		Watersday = S {'Reverberation','Distortion','Darkness'},
		Windsday = S {'Detonation','Fragmentation','Light'},
		Iceday = S {'Induration','Distortion','Darkness'},
		Lightningsday = S {'Impaction','Fragmentation','Light'},
		Lightsday = S {'Transfixion','Fusion','Light'},
		Darksday = S {'Compression','Gravitation','Darkness'}}
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
	
	if Not_dual_wield_weapons:contains(player.equipment.main) then
		--do nothing (reserved for potential later use)
	else
		if Soul_voice == true then -- for both SV and bolster and assumes high-tier haste
			hasteVal = math.min((buffmath(580) * 2) + buffmath(228) + (buffmath(33) * 2) + determine_marches() + buffmath(604) + (buffmath(370) * 2), 45)
		elseif Haste_II == true then
			hasteVal = math.min(buffmath(580) + buffmath(228) + (buffmath(33) * 2) + determine_marches() + buffmath(604) + (buffmath(370) * 2), 45)
		else	
			hasteVal = math.min(buffmath(580) + buffmath(228) + buffmath(33) + determine_marches() + buffmath(604) + buffmath(370), 45)
		end
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


function buff_change(n,gain,buff_table)
	local name
    name = string.lower(n)

	--Determine DW groupings will go here, above the rest of the safety hooks
	determine_haste_sets()	

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
	if name == "weakness" then
		if gain then
			enable( 'main', 'sub', 'range', 'ammo',
					'head', 'neck', 'ear1', 'ear2',
					'body', 'hands', 'ring1', 'ring2',
					'back', 'waist', 'legs', 'feet')
		end
	end
	if S{"terror", "petrification", "sleep", "stun"}:contains(name) then
        if gain then
			if Tank_mode == false then
				equip(sets.SafetyDance)
			else
				equip(sets.SafetyDance_tank_mode)
			end
			disable('main', 'sub', 'range', 'ammo',
					'head', 'neck', 'ear1', 'ear2',
					'body', 'hands', 'ring1', 'ring2',
					'back', 'waist', 'legs', 'feet')
        else
			if not has_any_buff_of({"terror", "petrification", "sleep", "stun"}) then
				enable( 'main', 'sub', 'range', 'ammo',
						'head', 'neck', 'ear1', 'ear2',
						'body', 'hands', 'ring1', 'ring2',
						'back', 'waist', 'legs', 'feet')
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
		determine_haste_sets()
	end
end


function prep_startup()
	--Streamlines Variables on load
	-- --Redundant, but I like this to be available to 'standardize'
	-- --startup from one location.
	Shadow_type = 'None'
	MAcc_mode = false
	Tank_mode = false
	Burst_mode = false
	Kite_mode = false
	--Haste_mode
	Soul_voice = false
	Haste_II = false
	send_command('@input /echo NIN Loaded, Current Modes::: Burst_mode: OFF | Haste_mode: LOW')
	determine_haste_sets()
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


function TP_bonus_adjustment(spell)
	--Uzura+2 (or better):	+1000
	--Heishi Shorinken: 	+ 500
	--Moonshade Earring:	+ 250
	--Mpaca's Cap:			+ 200
	--total possible:		+1950
	

	if TP_bonus_weaponskill:contains(spell.english) then
		--to force 3000 TP WS determine non-adjustable factors (weapons)
		if TP_bonus_equipment:contains(player.equipment.main) and TP_bonus_equipment:contains(player.equipment.sub) then -- assumes Heishi/TP Bonus offhand
			-- base: +1500 (total of +1950 possible)
			if player.tp > 1499 then -- replace head and earring
				equip({head = "Hachiya Hatsuburi +3"})
				if TP_bonus_equipment:contains(player.equipment.left_ear) then
					equip({ear1 = TP_bonus_replacement_earring})
				end
				if TP_bonus_equipment:contains(player.equipment.right_ear) then
					equip({ear2 = TP_bonus_replacement_earring})
				end
			elseif player.tp > 1249 then -- replace head
				equip({head = "Hachiya Hatsuburi +3"})
			end
		elseif TP_bonus_equipment:contains(player.equipment.main) then -- assumes Heishi only
			-- base: +500 (total of +950 possible)
			if player.tp > 2499 then -- replace head and earring
				equip({head = "Hachiya Hatsuburi +3"})
				if TP_bonus_equipment:contains(player.equipment.left_ear) then
					equip({ear1 = TP_bonus_replacement_earring})
				end
				if TP_bonus_equipment:contains(player.equipment.right_ear) then
					equip({ear2 = TP_bonus_replacement_earring})
				end
			elseif player.tp > 2249 then -- replace head
				equip({head = "Hachiya Hatsuburi +3"})
			end
		elseif TP_bonus_equipment:contains(player.equipment.sub) then -- assumes TP Bonus offhand only
			-- base: +1000 (total of +1450 possible)
			if player.tp > 1999 then -- replace head and earring
				equip({head = "Hachiya Hatsuburi +3"})
				if TP_bonus_equipment:contains(player.equipment.left_ear) then
					equip({ear1 = TP_bonus_replacement_earring})
				end
				if TP_bonus_equipment:contains(player.equipment.right_ear) then
					equip({ear2 = TP_bonus_replacement_earring})
				end
			elseif player.tp > 1749 then -- replace head
				equip({head = "Hachiya Hatsuburi +3"})
			end
		else -- assumes no TP Bonus main/offhand
			-- base: +0 (total of +450 possible)
			if player.tp > 2749 then -- replace head and earring
				equip({head = "Hachiya Hatsuburi +3"})
				if TP_bonus_equipment:contains(player.equipment.left_ear) then
					equip({ear1 = TP_bonus_replacement_earring})
				end
				if TP_bonus_equipment:contains(player.equipment.right_ear) then
					equip({ear2 = TP_bonus_replacement_earring})
				end
			elseif player.tp > 2549 then -- replace head
				equip({head = "Hachiya Hatsuburi +3"})
			end
		end
	elseif (TP_bonus_multi_weaponskill:contains(spell.english) and WS_ind ~= 3) then -- dont override sets that maximize +PDL%
		--to force 3000 TP WS determine non-adjustable factors (weapons)
		if TP_bonus_equipment:contains(player.equipment.main) and TP_bonus_equipment:contains(player.equipment.sub) then -- assumes Heishi/TP Bonus offhand
			-- base: +1500 (total of +1950 possible)
			if player.tp > 1499 then -- replace head and earring
				equip({head = "Adhemar Bonnet +1"})
				if TP_bonus_equipment:contains(player.equipment.left_ear) then
					equip({ear1 = TP_bonus_replacement_multiattack_earring})
				end
				if TP_bonus_equipment:contains(player.equipment.right_ear) then
					equip({ear2 = TP_bonus_replacement_multiattack_earring})
				end
			elseif player.tp > 1249 then -- replace head
				equip({head = "Adhemar Bonnet +1"})
			end
		elseif TP_bonus_equipment:contains(player.equipment.main) then -- assumes Heishi only
			-- base: +500 (total of +950 possible)
			if player.tp > 2499 then -- replace head and earring
				equip({head = "Adhemar Bonnet +1"})
				if TP_bonus_equipment:contains(player.equipment.left_ear) then
					equip({ear1 = TP_bonus_replacement_multiattack_earring})
				end
				if TP_bonus_equipment:contains(player.equipment.right_ear) then
					equip({ear2 = TP_bonus_replacement_multiattack_earring})
				end
			elseif player.tp > 2249 then -- replace head
				equip({head = "Adhemar Bonnet +1"})
			end
		elseif TP_bonus_equipment:contains(player.equipment.sub) then -- assumes TP Bonus offhand only
			-- base: +1000 (total of +1450 possible)
			if player.tp > 1999 then -- replace head and earring
				equip({head = "Adhemar Bonnet +1"})
				if TP_bonus_equipment:contains(player.equipment.left_ear) then
					equip({ear1 = TP_bonus_replacement_multiattack_earring})
				end
				if TP_bonus_equipment:contains(player.equipment.right_ear) then
					equip({ear2 = TP_bonus_replacement_multiattack_earring})
				end
			elseif player.tp > 1749 then -- replace head
				equip({head = "Adhemar Bonnet +1"})
			end
		else -- assumes no TP Bonus main/offhand
			-- base: +0 (total of +450 possible)
			if player.tp > 2749 then -- replace head and earring
				equip({head = "Adhemar Bonnet +1"})
				if TP_bonus_equipment:contains(player.equipment.left_ear) then
					equip({ear1 = TP_bonus_replacement_multiattack_earring})
				end
				if TP_bonus_equipment:contains(player.equipment.right_ear) then
					equip({ear2 = TP_bonus_replacement_multiattack_earring})
				end
			elseif player.tp > 2549 then -- replace head
				equip({head = "Adhemar Bonnet +1"})
			end
		end		
	end
end


function fTP_day_weather_adjustment(spell)
	if fTP_transfer_weaponskill:contains(spell.english) then
		if (check_ws_day[world.day]:contains(spell.skillchain_a)
		or check_ws_day[world.day]:contains(spell.skillchain_b)
		or check_ws_day[world.day]:contains(spell.skillchain_c)) 
		then
			equip({head = "Gavialis Helm"})
		end
	end
end


-- Job Control Functions
function precast(spell)
	if (spell.type == 'WhiteMagic' or spell.type == 'BlackMagic' or spell.type== 'Trust') then
		equip(sets.precast.FastCast)
	elseif spell.type == 'Ninjutsu' then
		equip(sets.precast.NinjutsuFastCast)
	elseif spell.type == 'Waltz' then
		equip(sets.JA.Waltz)
	elseif spell.type == "WeaponSkill" then
		if player.tp >= 1000 then
			--handles ranged WS's
			if spell.target.distance <= 21.5 then
				-- add ranged WS hooks here if you wish to use them			
			else
				cancel_spell()
				send_command("@input /echo Canceled " .. spell.name .. " " .. spell.target.name .. " is Too Far")
			end
			--handles close-range WS's
			if spell.target.distance <= 5.5 then			
				--Physical WS's
				if spell.english == "Blade: Metsu" then
					equip(sets.Metsu[sets.WS.index[WS_ind]])
				end
				if spell.english == "Blade: Ten" then
					equip(sets.Ten[sets.WS.index[WS_ind]])
				end
				if spell.english == "Blade: Kamu" then
					equip(sets.Kamu[sets.WS.index[WS_ind]])
				end
				if spell.english == "Blade: Shun" then
					equip(sets.Shun[sets.WS.index[WS_ind]])
				end
				if spell.english == "Blade: Ku" then
					equip(sets.Ku[sets.WS.index[WS_ind]])
				end
				if spell.english == "Blade: Hi" then
					equip(sets.Hi[sets.WS.index[WS_ind]])
				end
				if spell.english == "Blade: Jin" then
					equip(sets.Jin[sets.WS.index[WS_ind]])
				end
				if spell.english == "Blade: Retsu" then
					equip(sets.Retsu[sets.WS.index[WS_ind]])
				end
				if spell.english == "Blade: Rin" then
					equip(sets.Rin[sets.WS.index[WS_ind]])
				end
				if spell.english == "Savage Blade" then
					equip(sets.SavageBlade[sets.WS.index[WS_ind]])
				end
				if spell.english == "Flat Blade" then
					equip(sets.FlatBlade[sets.WS.index[WS_ind]])
				end
				if spell.english == "Vorpal Blade" then
					equip(sets.VorpalBlade[sets.WS.index[WS_ind]])
				end
				if spell.english == "Asuran Fists" then
					equip(sets.AsuranFists[sets.WS.index[WS_ind]])
				end
				if spell.english == "Raging Fists" then
					equip(sets.RagingFists[sets.WS.index[WS_ind]])
				end
				if spell.english == "Shoulder Tackle" then
					equip(sets.ShoulderTackle[sets.WS.index[WS_ind]])
				end
				if spell.english == "Spinning Attack" then
					equip(sets.SpinningAttack[sets.WS.index[WS_ind]])
				end
				if spell.english == "True Strike" then
					equip(sets.BlackHalo[sets.WS.index[WS_ind]])
				end
				if spell.english == "Evisceration" then
					equip(sets.Evisceration[sets.WS.index[WS_ind]])
				end
				if spell.english == "Tachi: Kasha" then
					equip(sets.Kasha[sets.WS.index[WS_ind]])
				end
				if spell.english == "Tachi: Hobaku" then
					equip(sets.Hobaku[sets.WS.index[WS_ind]])
				end
				--Hybrid/Elemental WS's
				if spell.english == "Blade: Chi" then
					equip(sets.Chi[sets.WS.index[WS_ind]])
					if world.day_element == "Earth" or world.weather_element == "Earth" then
						equip(sets.obi)
					end
				end
				if spell.english == "Blade: To" then
					equip(sets.To[sets.WS.index[WS_ind]])
					if world.day_element == "Ice" or world.weather_element == "Ice" then
						equip(sets.obi)
					end
				end
				if spell.english == "Blade: Teki" then
					equip(sets.Teki[sets.WS.index[WS_ind]])
					if world.day_element == "Water" or world.weather_element == "Water" then
						equip(sets.obi)
					end
				end
				if spell.english == "Blade: Ei" then
					equip(sets.Ei[sets.WS.index[WS_ind]])
					if world.day_element == "Dark" or world.weather_element == "Dark" then
						equip(sets.obi)
					end
				end
				if spell.english == "Blade: Yu" then
					equip(sets.Yu[sets.WS.index[WS_ind]])
					if world.day_element == "Water" or world.weather_element == "Water" then
						equip(sets.obi)
					end
				end
				if spell.english == "Sanguine Blade" then
					equip(sets.SanguineBlade[sets.WS.index[WS_ind]])
					if world.day_element == "Dark" or world.weather_element == "Dark" then
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
					--if world.day_element == "Fire" or world.weather_element == "Fire" then --Enable if you want this to deal damage
					--	equip(sets.obi)
					--end
				end
				if spell.english == "Seraph Blade" then
					equip(sets.SeraphBlade[sets.WS.index[WS_ind]])
					if world.day_element == "Light" or world.weather_element == "Light" then
						equip(sets.obi)
					end
				end
				if spell.english == "Shining Blade" then
					equip(sets.ShiningBlade[sets.WS.index[WS_ind]])
					--if world.day_element == "Light" or world.weather_element == "Light" then --Enable if you want this to deal damage
					--	equip(sets.obi)
					--end
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
				if spell.english == "Aeolian Edge" then
					equip(sets.AeolianEdge)
					if world.day_element == "Wind" or world.weather_element == "Wind" then
						equip(sets.obi)
					end
				end
				if spell.english == "Tachi: Jinpu" then
					equip(sets.Jinpu[sets.WS.index[WS_ind]])
					if world.day_element == "Wind" or world.weather_element == "Wind" then
						equip(sets.obi)
					end
				end
				if spell.english == "Tachi: Kagero" then
					equip(sets.Kagero[sets.WS.index[WS_ind]])
					if world.day_element == "Fire" or world.weather_element == "Fire" then
						equip(sets.obi)
					end
				end
				if spell.english == "Tachi: Koki" then
					equip(sets.Koki[sets.WS.index[WS_ind]])
					if world.day_element == "Light" or world.weather_element == "Light" then
						equip(sets.obi)
					end
				end
				--Generic WS's
				if (spell.english == "Fast Blade" or
						spell.english == "Circle Blade")
					then
					equip(sets.OtherWS[sets.WS.index[WS_ind]])
				end
			else
				cancel_spell()
				send_command("@input /echo Canceled " .. spell.name .. " " .. spell.target.name .. " is Too Far")
			end
			
		end
	elseif spell.english == "Mijin Gakure" then
		equip(sets.JA.MijinGakure)
	elseif Enmity_actions:contains(spell.english) then  
		equip(sets.Enmity)
	elseif spell.english == "Swipe" then  
		if Burst_mode == true then
			equip(sets.Swipe_MB)
		else
			equip(sets.Swipe)
		end
	end
	
	--Do Not Change the Order of the Next Two Function Calls
	--
	--overrides head for Gavialis Helm consideration
	fTP_day_weather_adjustment(spell)
	--overrides gear used to enhance TP bonus when not needed
	TP_bonus_adjustment(spell)
end


function midcast(spell, buff, act)
	--Handles generic recasts as a fallback
	if (spell.type == 'WhiteMagic' or spell.type == 'BlackMagic' or spell.type == 'Trust') then
		equip(sets.midcast.FastRecast)
	end
	
	
	if spell.name == 'Utsusemi: Ichi' and (Shadow_type == 'Ni' or Shadow_type == 'San') and 
	(buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)']) then
	
		send_command('@wait 0.15;cancel Copy Image;cancel Copy Image (2);cancel Copy Image (3);cancel Copy Image (4+)')
	
	elseif spell.name == 'Utsusemi: Ni' and Shadow_type == 'San' and 
	(buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)']) then

		send_command('cancel Copy Image;cancel Copy Image (2);cancel Copy Image (3);cancel Copy Image (4+)')	
	
	end
	
	
	if Utsusemi_spells:contains(spell.english) then
		if buffactive['Yonin'] then
			equip(sets.midcast.Ninjutsu_utsusemi_enmity)
		else
			equip(sets.midcast.Ninjutsu_utsusemi)
		end
	end
	
	
	if spell.english == 'Migawari: Ichi' then
		equip(sets.midcast.Ninjutsu_skill)
	end
	
	
	-- intentionally redundant in case user wants to specify other sets for this Ninjutsu
	if Buff_spells:contains(spell.english) then
		equip(sets.midcast.FastRecast)
	end
	
	
	if MAcc_spells:contains(spell.english) then
		equip(sets.midcast.Ninjutsu_macc)
	end
	
	
	if Enmity_actions:contains(spell.english) then
		equip(sets.Enmity)
	end
	
	
	if Nuke_spells:contains(spell.english) then
		if MAcc_mode == false then
			if Burst_mode == false then
				if buffactive['Futae'] then
					equip(sets.midcast.Ninjutsu_nuke_futae)
				else
					equip(sets.midcast.Ninjutsu_nuke)
				end
			else
				if buffactive['Futae'] then
					equip(sets.midcast.Ninjutsu_burst_futae)
				else
					equip(sets.midcast.Ninjutsu_burst)
				end
			end
		else
			if Burst_mode == false then
				if buffactive['Futae'] then
					equip(sets.midcast.Ninjutsu_nuke_futae_macc)
				else
					equip(sets.midcast.Ninjutsu_nuke_macc)
				end
			else
				if buffactive['Futae'] then
					equip(sets.midcast.Ninjutsu_burst_futae_macc)
				else
					equip(sets.midcast.Ninjutsu_burst_macc)
				end
			end
		end
	end
	
	
	if spell.english == 'Phalanx' then
		equip(sets.Phalanx)
	end
	
	
	--Spell Hooks for Obi
	if Nuke_spells:contains(spell.english) and (spell.element == world.day_element or spell.element == world.weather_element) then
		equip(sets.Obi)
	end
end


function aftercast(spell)	
	if spell.name == 'Utsusemi: San' and spell.interrupted == false then
		Shadow_type = 'San'
	elseif spell.name == 'Utsusemi: Ni' and spell.interrupted == false then
		Shadow_type = 'Ni'
	elseif spell.name == 'Utsusemi: Ichi' and spell.interrupted == false then
		Shadow_type = 'Ichi'
	end	
	
	determine_haste_sets()
end


function status_change(new, old)
	if new == 'Engaged' then
		determine_haste_sets()
	end
	if new == 'Idle' then
		determine_haste_sets()
	end
end


function determine_equip_set()
	if player.status == 'Engaged' then -- engaged sets
		if Tank_mode == false then
			if Not_dual_wield_weapons:contains(player.equipment.main) then
				other_engaged_set()
			else
				melee_mode_engaged_set()
			end
		else
			if Not_dual_wield_weapons:contains(player.equipment.main) then
				other_tank_set()
			else
				tank_mode_engaged_set()
			end
		end
	else -- idle sets
		if Tank_mode == false then
			melee_mode_idle_set()
			if Kite_mode == true then
				if world.time >= (17*60) or world.time <= (7*60) then
					equip(sets.Night_kite)
				else
					equip(sets.Day_kite)
				end
			end
		else
			tank_mode_idle_set()
			if Kite_mode == true then
				if world.time >= (17*60) or world.time <= (7*60) then
					equip(sets.Night_kite)
				else
					equip(sets.Day_kite)
				end
			end
		end
	end
end


function melee_mode_idle_set()
	equip(
		set_combine(
			sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]],
			sets.Idle_melee[sets.Idle_melee.index[Idle_melee_ind]]
		)
	)
end


function tank_mode_idle_set()
	equip(
		set_combine(
			sets.Weapon_tank[sets.Weapon_tank.index[Wt_ind]],
			sets.Idle_tank[sets.Idle_tank.index[Idle_tank_ind]]
		)
	)
end


function melee_mode_engaged_set()
	equip(
		set_combine(
			sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]],
			sets.TP[sets.TP.index[TP_ind]]["Haste_" .. hasteVal]
		)
	)
end


function tank_mode_engaged_set()
	equip(
		set_combine(
			sets.Weapon_tank[sets.Weapon_tank.index[Wt_ind]],
			sets.Tank[sets.Tank.index[Tank_ind]]["Haste_" .. hasteVal]
		)
	)
end


function other_engaged_set()
	if (player.equipment.main == 'Karambit' or player.equipment.main == "") then
		equip(sets.H2H[sets.H2H.index[TP_ind]])
	else
		equip(sets.GKT[sets.GKT.index[TP_ind]])
	end
end


function other_tank_set()
	if (player.equipment.main == 'Karambit' or player.equipment.main == "") then
		equip(sets.H2H.Tank)
	else
		equip(sets.GKT.Tank)
	end
end


function self_command(command)
	if command == "toggle TP set" then
		if Tank_mode == false then
			TP_ind = TP_ind + 1
			if TP_ind > #sets.TP.index then
				TP_ind = 1
			end
			send_command("@input /echo <----- TP Set changed to " .. sets.TP.index[TP_ind] .. " ----->")
			determine_haste_sets()
		else
			Tank_ind = Tank_ind + 1
			if Tank_ind > #sets.Tank.index then
				Tank_ind = 1
			end
			send_command("@input /echo <----- Tank Set changed to " .. sets.Tank.index[Tank_ind] .. " ----->")
			determine_haste_sets()
		end
	elseif command == "toggle TP set reverse" then
		TP_ind = TP_ind - 1
		if TP_ind < 1 then
			TP_ind = #sets.TP.index
		end
		send_command("@input /echo <----- TP Set changed to " .. sets.TP.index[TP_ind] .. " ----->")
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
	elseif command == "toggle Weapons" then
		if Tank_mode == false then
			Wm_ind = Wm_ind + 1
			if Wm_ind > #sets.Weapon_melee.index then
				Wm_ind = 1
			end
			send_command("@input /echo <----- Melee weapons changed to " .. sets.Weapon_melee.index[Wm_ind] .. " ----->")
			determine_haste_sets()
		else
			Wt_ind = Wt_ind + 1
			if Wt_ind > #sets.Weapon_tank.index then
				Wt_ind = 1
			end
			send_command("@input /echo <----- Tank weapons changed to " .. sets.Weapon_tank.index[Wt_ind] .. " ----->")
			determine_haste_sets()
		end
	elseif command == "toggle Weapons reverse" then
		if Tank_mode == false then
			Wm_ind = Wm_ind - 1
			if Wm_ind < 1 then
				Wm_ind = #sets.Weapon_melee.index
			end
			send_command("@input /echo <----- Melee weapons changed to " .. sets.Weapon_melee.index[Wm_ind] .. " ----->")
			determine_haste_sets()
		else
			Wt_ind = Wt_ind - 1
			if Wt_ind < 1 then
				Wt_ind = #sets.Weapon_tank.index
			end
			send_command("@input /echo <----- Tank weapons changed to " .. sets.Weapon_tank.index[Wt_ind] .. " ----->")
			determine_haste_sets()
		end		
	elseif command == "toggle Idle set" then
		if Tank_mode == false then
			Idle_melee_ind = Idle_melee_ind + 1
			if Idle_melee_ind > #sets.Idle_melee.index then
				Idle_melee_ind = 1			
			end
			send_command("@input /echo <----- Idle Set changed to " .. sets.Idle_melee.index[Idle_melee_ind] .. " ----->")
			determine_haste_sets()
		else
			Idle_tank_ind = Idle_tank_ind + 1
			if Idle_tank_ind > #sets.Idle_tank.index then
				Idle_tank_ind = 1			
			end
			send_command("@input /echo <----- Idle Set changed to " .. sets.Idle_tank.index[Idle_tank_ind] .. " ----->")
			determine_haste_sets()
		end
	elseif command == "toggle Idle set reverse" then
		if Tank_mode == false then
			Idle_melee_ind = Idle_melee_ind - 1
			if Idle_melee_ind < 1 then
				Idle_ind = #sets.Idle_melee.index
			end
			send_command("@input /echo <----- Idle Set changed to " .. sets.Idle_melee.index[Idle_melee_ind] .. " ----->")
			determine_haste_sets()
		else
			Idle_tank_ind = Idle_tank_ind - 1
			if Idle_tank_ind < 1 then
				Idle_tank_ind = #sets.Idle_tank.index
			end
			send_command("@input /echo <----- Idle Set changed to " .. sets.Idle_tank.index[Idle_tank_ind] .. " ----->")
			determine_haste_sets()
		end
	elseif command == "toggle Tank set" then --does not update current set, instead sets up the tank set while in melee_mode
		Tank_ind = Tank_ind + 1
		if Tank_ind > #sets.Tank.index then
			Tank_ind = 1			
		end
		send_command("@input /echo <----- Tank Set currently " .. sets.Tank.index[Tank_ind] .. " ----->")
	elseif command == "toggle Tank set reverse" then --does not update current set, instead sets up the tank set while in melee_mode
		Tank_ind = Tank_ind - 1
		if Tank_ind < 1 then
			Tank_ind = #sets.Tank.index
		end
		send_command("@input /echo <----- Tank Set currently to " .. sets.Tank.index[Tank_ind] .. " ----->")
	elseif command == "toggle Burst Mode" then
		if Burst_mode == false then
			Burst_mode = true
			send_command("@input /echo <----- Burst Mode ON ----->")
		else
			Burst_mode = false
			send_command("@input /echo <----- Burst Mode OFF ----->")
		end
	elseif command == "toggle MAcc Mode" then
		if MAcc_mode == false then
			MAcc_mode = true
			send_command("@input /echo <----- Nuking MACC Mode ON ----->")
		else
			MAcc_mode = false
			send_command("@input /echo <----- Nuking MACC Mode OFF ----->")
		end
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
	elseif command == "toggle Tank Mode" then
		if Tank_mode == false then
			Tank_mode = true
			send_command("@input /echo <----- Tank Sets: ON ----->")
			determine_haste_sets()
		else
			Tank_mode = false
			send_command("@input /echo <----- Tank Sets: OFF ----->")
			determine_haste_sets()
		end
	elseif command == "toggle Kite Mode" then
		if Kite_mode == false then
			Kite_mode = true
			send_command("@input /echo <----- Kite Sets: ON ----->")
			determine_haste_sets()
		else
			Kite_mode = false
			send_command("@input /echo <----- Kite Sets: OFF ----->")
			determine_haste_sets()
		end
	end
end


function has_any_buff_of(buff_set)--returns true if you have any of the buffs given
    for i,v in pairs(buff_set) do
        if buffactive[v] ~= nil then return true end
    end
end