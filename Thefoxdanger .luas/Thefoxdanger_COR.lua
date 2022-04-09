-- 
-- @author Thefoxdanger of Asura
-- COR.lua v1.0
--
-- 
-- Intermediate COR lua created to streamline play with as few toggles and other things to press as possible. Designed to be similar in 
-- function to the rest of Spicyryan's luas in the Github. However, this is a job that naturally has a lot of levers to throw, so take time 
-- to get used to the keybinds below. It also has A LOT of gear fields, which is for a good reason. Make sure to read over comments, reviewing 
-- the current gear in slots to understand what goes there if you don't have my exact gearsets. Everything is very clearly labeled, and if 
-- a set seems to be a duplicate, check that it isn't a version that takes Melee_mode into account.
--
-- I plan to maintain this lua as a template, however if you get a hold of this it is YOUR responsibility to understand its use
-- and to troubleshoot issues within. I will not fix your lua if I do not know you (and probably wont if I do know you). 
-- Have fun~!
-- 	


--binds--
-- 5 core toggles you may use more frequently
send_command("bind f9 gs c toggle TP set") -- F9 switches between current melee/DT sets dependant on mode (Standard, Acc)
send_command("bind !f9 gs c toggle TP set reverse") -- Alt+F9 switches between current melee/DT sets dependant on mode in reverse (Standard, Full)

send_command("bind f10 gs c toggle Ranged set") -- F10 switches between current ranged attack sets 
send_command("bind !f10 gs c toggle Ranged set reverse") -- ALT+F10 switches between current ranged attack sets in reverse 

send_command("bind @w gs c toggle Weapons") -- WIN+W switches between current weapon combinations 
send_command("bind !w gs c toggle Weapons reverse") -- ALT+W switches between current weapon combinations in reverse 

send_command("bind f11 gs c toggle WS set") -- F11 switches between WS sets
send_command("bind !f11 gs c toggle WS set reverse") -- Alt+F11 switches between WS sets in reverse

send_command("bind f12 gs c toggle Idle set") -- F12 switches between idle sets
send_command("bind !f12 gs c toggle Idle set reverse") -- Alt+F12 switches between idle sets in reverse


-- less frequently used/'setup' toggles
send_command("bind f7 gs c toggle DT set") -- F7 prepares, but does not switch to, tank sets (regardless of whether Tank Mode is active)
send_command("bind !f7 gs c toggle DT set reverse") -- Alt+F7 prepares, but does not switch to, tank sets in reverse (regardless of whether Tank Mode is active)

send_command("bind @q gs c toggle Quick Draw set") -- WIN+Q cycles through quick draw sets
send_command("bind !q gs c toggle Quick Draw set reverse") -- Alt+Q cycles through quick draw sets in reverse

send_command("bind @e gs c toggle Haste Mode") -- WIN+E Toggles between SV/Bolster, HasteII and Low haste modes
send_command("bind !f8 gs c toggle DT Mode") -- Alt+F8 swap between Normal and Tank sets
send_command("bind !q gs c toggle QD Mode") -- Alt+Q toggles Quick Draw sets
send_command("bind !r gs c toggle Rostam Mode") -- Alt+R toggles Roll swapping for weapon
send_command("bind @r gs c toggle Luzaf Mode") -- Ctrl+R toggles Roll swapping for ring
send_command("bind @f12 gs c toggle Kite Mode") -- Enables kiting sets (OFF by default since COR does not really need complex idle sets anyway)


--numpad controls for WS's
-- -- CTRL key for WS
send_command('bind ^numpad0 @input /ws "Savage Blade" <t>')
send_command('bind ^numpad1 @input /ws "Leaden Salute" <t>')
send_command('bind ^numpad2 @input /ws "Wildfire" <t>')
send_command('bind ^numpad3 @input /ws "Last Stand" <t>')
send_command('bind ^numpad4 @input /ws "Evisceration" <t>')
send_command('bind ^numpad5 @input /ws "Aeolian Edge" <t>')
send_command('bind ^numpad6 @input /ws "Hot Shot" <t>')
send_command('bind ^numpad7 @input /ws "Sniper Shot" <t>')
send_command('bind ^numpad8 @input /ws "" <t>')
send_command('bind ^numpad9 @input /ws "" <t>')
-- -- Alt key
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


send_command('wait 180;input //gs validate')

--Variables
--
--buff IDs taken from: https://github.com/Windower/Resources/blob/master/resources_data/buffs.lua
--debuffs
hasteVal = 0
hastevalue = {}
hastevalue[1] 	= 100 	-- Weakness/-100% haste
hastevalue[13]	= 30  	-- Slow/-30% haste
hastevalue[565] = 35	-- SlowII/-35% haste
hastevalue[194] = 100	-- Elegy/-50~100% haste (Assumed as Massacre Elegy or -100% in this lua)
--buffs
hastevalue[580] = 30 	-- GeoHaste/30~40% haste
hastevalue[228] = 30 	-- Embrava/30% haste
hastevalue[33]  = 15 	-- Haste/15% haste (HasteII/30% haste, but indistinguishable as a buffID)
hastevalue[604] = 15 	-- MightyGuard/15% haste
hastevalue[370] = 5  	-- HasteSamba/5~10% haste
hastevalue[214] = 15 	-- March/15% (logic will assume HonorMarch since also indistinguishable as a buffID)

Shadow_type = 'None'
DT_mode = false
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

	send_command("unbind @w")
	send_command("unbind !w")
	
	send_command("unbind f10")
	send_command("unbind !f10")
	
	send_command("unbind f11")
	send_command("unbind !f11")	

	send_command("unbind f12")
	send_command("unbind !f12")	

	send_command("unbind @q")	
	send_command("unbind !q")
	send_command("unbind @e")	
	send_command("unbind !f8")
	send_command("unbind ^r")
	send_command("unbind !r")
	
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
	set_macros(1,4)
	---Set Lockstyle Here
	set_style(4)
	
	
	--TrueShot Ranges--
	-- Added for ease of adjustment should you choose to 
	-- model size arguments are taken into account in the logic controlling the sets
	-- Current values shown were retested using in-game TrueShot messages and DistancePlus
	
	--Guns
	GunUpper = 5	--Max Trueshot distance
	GunLower = 3.5 	--Min Trueshot distance	
	
	
	--Gear Sets Start Here
	--Augmented Gear
    Camulus = {}
	Camulus.Idle = { name="Camulus's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Snapshot"+10','Phys. dmg. taken-10%',}}
	Camulus.DA = { name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	Camulus.RA = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	Camulus.RA_Crit = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Crit.hit rate+10','Phys. dmg. taken-10%',}}
	Camulus.STR_WSD = { name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	Camulus.AGI_WSD = { name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}
	Camulus.AGI_WSD_Phys = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}}
	Camulus.FC = { name="Camulus's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10',}}
    
	
	TaeonHead = {}
	TaeonHead.DW = { name="Taeon Chapeau", augments={'Accuracy+22','"Dual Wield"+5','DEX+10',}}
	TaeonHead.Phalanx = { name="Taeon Chapeau", augments={'Accuracy+21','Spell interruption rate down -10%','Phalanx +3',}}
	TaeonHead.SS = { name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+5',}}
	
	TaeonBody = {}
	TaeonBody.DW = { name="Taeon Tabard", augments={'Accuracy+20','"Dual Wield"+5','DEX+9',}}
	
	TaeonHands = {}
	TaeonHands.DW = { name="Taeon Gloves", augments={'Accuracy+20','"Dual Wield"+5','DEX+10',}}
	
	TaeonLegs = {}
	TaeonLegs.DW = { name="Taeon Tights", augments={'Accuracy+23','"Dual Wield"+5','DEX+10',}}
	
	TaeonFeet = {}
	TaeonFeet.DW = { name="Taeon Boots", augments={'Accuracy+20 Attack+20','"Dual Wield"+5','Crit. hit damage +3%',}}
	
	HercHelm = {}
	HercHelm.FC = { name="Herculean Helm", augments={'"Fast Cast"+5','Mag. Acc.+11',}}
	
	HercVest = {}
	HercVest.Phalanx = { name="Herculean Vest", augments={'"Dbl.Atk."+2','MND+7','Phalanx +5',}}
	
	HercHands = {}

	HercHands.TH = { name="Herculean Gloves", augments={'VIT+3','"Store TP"+5','"Treasure Hunter"+2','Accuracy+6 Attack+6',}}
	HercHands.Phalanx = { name="Herculean Gloves", augments={'Accuracy+8','AGI+6','Phalanx +4','Accuracy+4 Attack+4',}}	
	
	HercLegs = {}
	HercLegs.FC = { name="Herculean Trousers", augments={'Pet: STR+6','DEX+4','"Fast Cast"+7','Accuracy+7 Attack+7','Mag. Acc.+4 "Mag.Atk.Bns."+4',}}
	HercLegs.Phalanx = { name="Herculean Trousers", augments={'"Fast Cast"+2','Damage taken-4%','Phalanx +5','Accuracy+5 Attack+5','Mag. Acc.+10 "Mag.Atk.Bns."+10',}}
	
	HercFeet = {}
	HercFeet.Quad = { name="Herculean Boots", augments={'CHR+1','Accuracy+10','Quadruple Attack +3','Accuracy+8 Attack+8',}}
	HercFeet.Phalanx = { name="Herculean Boots", augments={'"Mag.Atk.Bns."+24','"Fast Cast"+1','Phalanx +4','Mag. Acc.+17 "Mag.Atk.Bns."+17',}}
	
	AdhemarBody = {}
	AdhemarBody.FC = { name="Adhemar Jacket +1", augments={'HP+105','"Fast Cast"+10','Magic dmg. taken -4',}}
	AdhemarBody.TP = { name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}
	
	
	--Weapon Sets (Melee)--
	sets.Weapon_melee = {} -- sets weapon combo for melee-mode
	sets.Weapon_melee.index = {"Custom", "Naegling", "Magic", "PhysicalRanged", "Armageddon"}
	Wm_ind = 1
	sets.Weapon_melee.Naegling = {
		main = "Naegling",
		sub = "Gleti's Knife",
		range = "Anarchy +2",
		ammo = "Chrono Bullet"
	}
	sets.Weapon_melee.Magic = {
		main = "Naegling",
		sub = "Tauret",
		range = "Fomalhaut",
		ammo = "Chrono Bullet"
	}
	sets.Weapon_melee.PhysicalRanged = {
		main = "Kustawi +1",
		sub = "Nusku Shield",
		range = "Fomalhaut",
		ammo = "Chrono Bullet"
	}
	sets.Weapon_melee.Armageddon = {
		main = "Fettering Blade",
		sub = "Gleti's Knife",
		range = "Armageddon",
		ammo = "Chrono Bullet"
	}
	sets.Weapon_melee.Custom = {} --Manual swaps
	
	
	--Idle Sets--
	-- melee-mode
	sets.Idle = {}
	sets.Idle.index = {"Standard", "DT"}
	Idle_ind = 1
	
	sets.Idle.Standard = { -- Movement Speed
		ammo = "Chrono Bullet", 
		head = "Nyame Helm", -- 0/0/7
		neck = "Warder's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring", 
		body = "Nyame Mail", -- 0/0/9
		hands = "Nyame Gauntlets", -- 0/0/7
		ring1 = "Defending Ring", -- 0/0/10
		ring2 = "Sheltered Ring", 
		back = Camulus.Idle, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = "Carmine Cuisses +1", 
		feet = "Nyame Sollerets" -- 0/0/7
	} -- 10/0/40
	
	sets.Idle.DT = {
		ammo = "Chrono Bullet", 
		head = "Nyame Helm", -- 0/0/7
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring", 
		body = "Nyame Mail", -- 0/0/9
		hands = "Nyame Gauntlets", -- 0/0/7
		ring1 = "Shadow Ring",
		ring2 = "Sheltered Ring", 
		back = Camulus.Idle, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = "Nyame Flanchard", -- 0/0/8 
		feet = "Nyame Sollerets" -- 0/0/7
	} -- 10/0/44


	--TP Sets (melee)--
	sets.TP = {}
	sets.TP.index = {"Standard", "Acc"}
	TP_ind = 1
	
	sets.TP.NoDW = {
		ammo = "Chrono Bullet",
		head = "Malignance Chapeau", 
		neck = "Combatant's Torque", 
		ear1 = "Crepuscular Earring",
		ear2 = "Brutal Earring",
		body = "Malignance Tabard",
		hands = "Malignance Gloves",
		ring1 = "Defending Ring", 
		ring2 = "Epona's Ring",	
		back = Camulus.DA,
		waist = "Carrier's Sash",
		legs = "Malignance Tights", 
		feet = "Malignance Boots"	
	}

	sets.TP.Standard = {}
	sets.TP.Standard.index = {"Oshit", "Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45"}
	--Sets for debuffed/weakened statuses
	--69 DW needed (worst case, no buffs + slow + elegy + weakness, -335% haste)
	--Feel free to add sets to tier between -335%~0% haste if you want. In the future I may tier this out,
	-- --but it's sort of unecessary most of the time.
	--The lua will use this set when when magic haste value is < 0.
	--If you need this set, something went *terribly* wrong.
	sets.TP.Standard.Oshit = {
		ammo = "Chrono Bullet",
		head = TaeonHead.DW, --5 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", --4 
		ear2 = "Suppanomimi", --5
		body = AdhemarBody.TP, --6
		hands = TaeonHands.DW, --5
		ring1 = "Petrov Ring", 
		ring2 = "Epona's Ring",		
		back = Camulus.DW, --10
		waist = "Reiki Yotai", --7
		legs = TaeonLegs.DW, --5
		feet = TaeonFeet.DW --9
	} -- 56 DW | sTP+31 | 3DA/12TA/0QA		
	--49 DW needed
	sets.TP.Standard.Haste_0 = {
		ammo = "Chrono Bullet",
		head = TaeonHead.DW, 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", 
		ear2 = "Suppanomimi", 		
		body = AdhemarBody.TP, 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Petrov Ring", 
		ring2 = "Epona's Ring",		
		back = Camulus.DW,
		waist = "Reiki Yotai",	
		legs = "Samnuha Tights", 
		feet = TaeonFeet.DW
	} -- 46 DW | sTP+27 | 7DA/20TA/0QA	
	--47 DW Needed
	sets.TP.Standard.Haste_5 = {
		ammo = "Chrono Bullet",
		head = TaeonHead.DW, 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", 
		ear2 = "Suppanomimi", 		
		body = AdhemarBody.TP, 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Petrov Ring", 
		ring2 = "Epona's Ring",		
		back = Camulus.DW,
		waist = "Reiki Yotai",	
		legs = "Samnuha Tights", 
		feet = TaeonFeet.DW
	} -- 46 DW | sTP+27 | 7DA/20TA/0QA	
	--45 DW Needed
	sets.TP.Standard.Haste_10 = {
		ammo = "Chrono Bullet",
		head = TaeonHead.DW, 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", 
		ear2 = "Suppanomimi", 		
		body = AdhemarBody.TP, 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Petrov Ring", 
		ring2 = "Epona's Ring",		
		back = Camulus.DW,
		waist = "Reiki Yotai",	
		legs = "Samnuha Tights", 
		feet = TaeonFeet.DW
	} -- 46 DW | sTP+27 | 7DA/20TA/0QA	
	--42 DW needed
	sets.TP.Standard.Haste_15 = {
		ammo = "Chrono Bullet",
		head = "Malignance Chapeau", 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", 
		ear2 = "Suppanomimi", 		
		body = AdhemarBody.TP, 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Petrov Ring", 
		ring2 = "Epona's Ring",		
		back = Camulus.DW,
		waist = "Reiki Yotai",	
		legs = "Samnuha Tights", 
		feet = TaeonFeet.DW
	} -- 41 DW | sTP+35 | 7DA/20TA/0QA	
	--36 DW needed
	sets.TP.Standard.Haste_20 = {
		ammo = "Chrono Bullet",
		head = TaeonHead.DW, 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", 
		ear2 = "Suppanomimi", 		
		body = AdhemarBody.TP, 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Petrov Ring", 
		ring2 = "Epona's Ring",		
		back = Camulus.DA, 
		waist = "Reiki Yotai",	
		legs = "Samnuha Tights", 
		feet = TaeonFeet.DW
	} -- 36 DW | sTP+27 | 17DA/20TA/0QA	
	--33 DW needed
	sets.TP.Standard.Haste_25 = {
		ammo = "Chrono Bullet",
		head = "Malignance Chapeau", 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", 
		ear2 = "Suppanomimi", 		
		body = AdhemarBody.TP, 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Petrov Ring", 
		ring2 = "Epona's Ring",		
		back = Camulus.DA, 
		waist = "Reiki Yotai",	
		legs = "Samnuha Tights", 
		feet = TaeonFeet.DW
	} -- 31 DW | sTP+35 | 17DA/20TA/0QA		
	--31 DW needed
	sets.TP.Standard.Haste_30 = {
		ammo = "Chrono Bullet",
		head = "Malignance Chapeau", 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", 
		ear2 = "Suppanomimi", 		
		body = AdhemarBody.TP, 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Petrov Ring", 
		ring2 = "Epona's Ring",		
		back = Camulus.DA, 
		waist = "Reiki Yotai",	
		legs = "Samnuha Tights", 
		feet = TaeonFeet.DW
	} -- 31 DW | sTP+35 | 17DA/20TA/0QA	
	--25 DW Needed
	sets.TP.Standard.Haste_35 = {
		ammo = "Chrono Bullet",
		head = "Malignance Chapeau", 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", 
		ear2 = "Brutal Earring", 		
		body = AdhemarBody.TP, 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Petrov Ring", 
		ring2 = "Epona's Ring",	
		back = Camulus.DA, 
		waist = "Reiki Yotai",	
		legs = "Samnuha Tights", 
		feet = TaeonFeet.DW
	} -- 26 DW | sTP+36 | 22DA/20TA/0QA	
	--17 DW Needed
	sets.TP.Standard.Haste_40 = {
		ammo = "Chrono Bullet",
		head = "Malignance Chapeau", 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", 
		ear2 = "Brutal Earring", 		
		body = AdhemarBody.TP, 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Petrov Ring", 
		ring2 = "Epona's Ring",		
		back = Camulus.DA, 
		waist = "Reiki Yotai",	
		legs = "Samnuha Tights", 
		feet = HercFeet.TP
	} -- 17 DW | sTP+36 | 22DA/22TA/3QA	
	--11 DW needed (dont go out of your way)
	sets.TP.Standard.Haste_45 = {
		ammo = "Chrono Bullet",
		head = "Malignance Chapeau", 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", 
		ear2 = "Brutal Earring", 		
		body = AdhemarBody.TP, 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Petrov Ring", 
		ring2 = "Epona's Ring",	
		back = Camulus.DA, 
		waist = "Windbuffet Belt +1",	
		legs = "Samnuha Tights", 
		feet = HercFeet.TP
	} -- 10 DW | sTP+32 | 22DA/24TA/5QA
	
	
	sets.TP.Acc = {}
	sets.TP.Acc.index = {"Oshit", "Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45"}

	sets.TP.Acc.Oshit = {
		ammo = "Chrono Bullet",
		head = TaeonHead.DW, --5 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", --4 
		ear2 = "Suppanomimi", --5
		body = AdhemarBody.TP, --6
		hands = TaeonHands.DW, --5
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Camulus.DW, --10
		waist = "Reiki Yotai", --7
		legs = TaeonLegs.DW, --5
		feet = TaeonFeet.DW --9
	} -- 56 DW | sTP+36 | 0DA/10TA/0QA		
	--49 DW needed
	sets.TP.Acc.Haste_0 = {
		ammo = "Chrono Bullet",
		head = TaeonHead.DW, 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", 
		ear2 = "Suppanomimi", 		
		body = AdhemarBody.TP, 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Camulus.DW,
		waist = "Reiki Yotai",	
		legs = "Samnuha Tights", 
		feet = TaeonFeet.DW
	} -- 46 DW | sTP+32 | 3DA/17TA/0QA	
	--47 DW Needed
	sets.TP.Acc.Haste_5 = {
		ammo = "Chrono Bullet",
		head = TaeonHead.DW, 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", 
		ear2 = "Suppanomimi", 		
		body = AdhemarBody.TP, 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",		
		back = Camulus.DW,
		waist = "Reiki Yotai",	
		legs = "Samnuha Tights", 
		feet = TaeonFeet.DW
	} -- 46 DW | sTP+32 | 3DA/17TA/0QA	
	--45 DW Needed
	sets.TP.Acc.Haste_10 = {
		ammo = "Chrono Bullet",
		head = TaeonHead.DW, 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", 
		ear2 = "Suppanomimi", 		
		body = AdhemarBody.TP, 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Camulus.DW,
		waist = "Reiki Yotai",	
		legs = "Samnuha Tights", 
		feet = TaeonFeet.DW
	} -- 46 DW | sTP+32 | 3DA/17TA/0QA	
	--42 DW needed
	sets.TP.Acc.Haste_15 = {
		ammo = "Chrono Bullet",
		head = "Malignance Chapeau", 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", 
		ear2 = "Suppanomimi", 		
		body = AdhemarBody.TP, 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",		
		back = Camulus.DW,
		waist = "Reiki Yotai",	
		legs = "Samnuha Tights", 
		feet = TaeonFeet.DW
	} -- 41 DW | sTP+40 | 3DA/17TA/0QA	
	--36 DW needed
	sets.TP.Acc.Haste_20 = {
		ammo = "Chrono Bullet",
		head = TaeonHead.DW, 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", 
		ear2 = "Suppanomimi", 		
		body = AdhemarBody.TP, 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",		
		back = Camulus.DA, 
		waist = "Reiki Yotai",	
		legs = "Samnuha Tights", 
		feet = TaeonFeet.DW
	} -- 36 DW | sTP+32 | 13DA/17TA/0QA	
	--33 DW needed
	sets.TP.Acc.Haste_25 = {
		ammo = "Chrono Bullet",
		head = "Malignance Chapeau", 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", 
		ear2 = "Suppanomimi", 		
		body = AdhemarBody.TP, 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",		
		back = Camulus.DA, 
		waist = "Reiki Yotai",	
		legs = "Samnuha Tights", 
		feet = TaeonFeet.DW
	} -- 31 DW | sTP+40 | 13DA/17TA/0QA		
	--31 DW needed
	sets.TP.Acc.Haste_30 = {
		ammo = "Chrono Bullet",
		head = "Malignance Chapeau", 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", 
		ear2 = "Suppanomimi", 		
		body = AdhemarBody.TP, 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",		
		back = Camulus.DA, 
		waist = "Reiki Yotai",	
		legs = "Samnuha Tights", 
		feet = TaeonFeet.DW
	} -- 31 DW | sTP+40 | 13DA/17TA/0QA	
	--25 DW Needed
	sets.TP.Acc.Haste_35 = {
		ammo = "Chrono Bullet",
		head = "Malignance Chapeau", 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", 
		ear2 = "Brutal Earring", 		
		body = AdhemarBody.TP, 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",		
		back = Camulus.DA, 
		waist = "Reiki Yotai",	
		legs = "Samnuha Tights", 
		feet = TaeonFeet.DW
	} -- 26 DW | sTP+41 | 18DA/17TA/0QA	
	--17 DW Needed
	sets.TP.Acc.Haste_40 = {
		ammo = "Chrono Bullet",
		head = "Malignance Chapeau", 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", 
		ear2 = "Brutal Earring", 		
		body = AdhemarBody.TP, 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",		
		back = Camulus.DA, 
		waist = "Reiki Yotai",	
		legs = "Samnuha Tights", 
		feet = HercFeet.TP
	} -- 17 DW | sTP+41 | 18DA/19TA/3QA	
	--11 DW needed (dont go out of your way)
	sets.TP.Acc.Haste_45 = {
		ammo = "Chrono Bullet",
		head = "Malignance Chapeau", 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", 
		ear2 = "Brutal Earring", 		
		body = AdhemarBody.TP, 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",		
		back = Camulus.DA, 
		waist = "Windbuffet Belt +1",	
		legs = "Samnuha Tights", 
		feet = HercFeet.TP
	} -- 10 DW | sTP+37 | 18DA/21TA/5QA


	--TP Sets (DT)--
	sets.DT = {}
	sets.DT.index = {"Standard", "Full"}
	DT_ind = 1
	
	sets.DT.NoDW = {
		ammo = "Chrono Bullet",
		head = "Malignance Chapeau", 
		neck = "Combatant's Torque", 
		ear1 = "Crepuscular Earring",
		ear2 = "Brutal Earring",
		body = "Malignance Tabard",
		hands = "Malignance Gloves",
		ring1 = "Defending Ring", 
		ring2 = "Epona's Ring",	
		back = Camulus.DA,
		waist = "Carrier's Sash",
		legs = "Malignance Tights", 
		feet = "Malignance Boots"	
	}

	sets.DT.Standard = {}
	sets.DT.Standard.index = {"Oshit", "Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45"}
	--59 DW needed
	--Let's be real. This much DW needed will not make a DT set.
	sets.DT.Standard.Oshit = {	
		ammo = "Chrono Bullet",
		head = TaeonHead.DW, --5 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", --4 
		ear2 = "Suppanomimi", --5
		body = AdhemarBody.TP, --6
		hands = TaeonHands.DW, --5
		ring1 = "Epona's Ring", 
		ring2 = "Petrov Ring",	
		back = Camulus.DW, --10
		waist = "Reiki Yotai", --7
		legs = TaeonLegs.DW, --5
		feet = TaeonFeet.DW --9
	} -- 56 DW | sTP+31 | 3DA/12TA/0QA		
	--49 DW needed
	sets.DT.Standard.Haste_0 = {
		ammo = "Chrono Bullet",
		head = TaeonHead.DW, 
		neck = "Loricate Torque +1", -- 0/0/6 
		ear1 = "Eabani Earring", 
		ear2 = "Suppanomimi", 
		body = "Malignance Tabard", -- 0/0/9 
		hands = TaeonHands.DW, 
		ring1 = "Defending Ring", -- 0/0/10 
		ring2 = "Gelatinous Ring +1", -- 7/-1/0	
		back = Camulus.DW, -- 10/0/0
		waist = "Reiki Yotai",
		legs = TaeonLegs.DW,
		feet = TaeonFeet.DW 
	} -- 50 DW | sTP+23 | 3DA/11TA/0QA | 17/-1/25	
	--47 DW Needed
	sets.DT.Standard.Haste_5 = {
		ammo = "Chrono Bullet",
		head = TaeonHead.DW, 
		neck = "Loricate Torque +1", -- 0/0/6 
		ear1 = "Eabani Earring", 
		ear2 = "Suppanomimi", 
		body = "Malignance Tabard", -- 0/0/9 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Defending Ring", -- 0/0/10 
		ring2 = "Gelatinous Ring +1", -- 7/-1/0	
		back = Camulus.DW, -- 10/0/0
		waist = "Reiki Yotai",
		legs = TaeonLegs.DW,
		feet = TaeonFeet.DW 
	} -- 45 DW | sTP+30 | 3DA/15TA/0QA | 17/-1/25	
	--45 DW Needed
	sets.DT.Standard.Haste_10 = {
		ammo = "Chrono Bullet",
		head = TaeonHead.DW, 
		neck = "Loricate Torque +1", -- 0/0/6 
		ear1 = "Eabani Earring", 
		ear2 = "Suppanomimi", 
		body = "Malignance Tabard", -- 0/0/9 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Defending Ring", -- 0/0/10 
		ring2 = "Gelatinous Ring +1", -- 7/-1/0	
		back = Camulus.DW, -- 10/0/0
		waist = "Reiki Yotai",
		legs = TaeonLegs.DW,
		feet = TaeonFeet.DW 
	} -- 45 DW | sTP+30 | 3DA/15TA/0QA | 17/-1/25
	--42 DW needed
	sets.DT.Standard.Haste_15 = {
		ammo = "Chrono Bullet",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Loricate Torque +1", -- 0/0/6 
		ear1 = "Eabani Earring", 
		ear2 = "Suppanomimi", 
		body = "Malignance Tabard", -- 0/0/9 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Defending Ring", -- 0/0/10 
		ring2 = "Epona's Ring",	
		back = Camulus.DW, -- 10/0/0
		waist = "Reiki Yotai",
		legs = TaeonLegs.DW,
		feet = TaeonFeet.DW 
	} -- 40 DW | sTP+30 | 3DA/15TA/0QA | 10/0/31
	--36 DW needed
	sets.DT.Standard.Haste_20 = {
		ammo = "Chrono Bullet",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Combatant's Torque",  
		ear1 = "Eabani Earring", 
		ear2 = "Suppanomimi", 
		body = "Malignance Tabard", -- 0/0/9 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Defending Ring", -- 0/0/10 
		ring2 = "Epona's Ring",	
		back = Camulus.DW, -- 10/0/0
		waist = "Reiki Yotai",
		legs = "Malignance Tights", -- 0/0/7
		feet = TaeonFeet.DW 
	} -- 35 DW | sTP+44 | 3DA/13TA/0QA | 10/0/32
	--33 DW needed
	sets.DT.Standard.Haste_25 = {
		ammo = "Chrono Bullet",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Combatant's Torque",  
		ear1 = "Eabani Earring", 
		ear2 = "Brutal Earring", 
		body = "Malignance Tabard", -- 0/0/9 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Defending Ring", -- 0/0/10 
		ring2 = "Epona's Ring",	
		back = Camulus.DW, -- 10/0/0
		waist = "Reiki Yotai",
		legs = "Malignance Tights", -- 0/0/7
		feet = TaeonFeet.DW 
	} -- 30 DW | sTP+45 | 8DA/13TA/0QA | 10/0/32	
	--31 DW needed
	sets.DT.Standard.Haste_30 = {
		ammo = "Chrono Bullet",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Combatant's Torque",  
		ear1 = "Eabani Earring", 
		ear2 = "Brutal Earring", 
		body = "Malignance Tabard", -- 0/0/9 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Defending Ring", -- 0/0/10 
		ring2 = "Epona's Ring",	
		back = Camulus.DW, -- 10/0/0
		waist = "Reiki Yotai",
		legs = "Malignance Tights", -- 0/0/7
		feet = TaeonFeet.DW 
	} -- 30 DW | sTP+45 | 8DA/13TA/0QA | 10/0/32
	--25 DW Needed
	sets.DT.Standard.Haste_35 = {
		ammo = "Chrono Bullet",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Loricate Torque +1", -- 0/0/6 
		ear1 = "Eabani Earring", 
		ear2 = "Brutal Earring", 
		body = "Malignance Tabard", -- 0/0/9 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Defending Ring", -- 0/0/10 
		ring2 = "Epona's Ring",	
		back = Camulus.DA, -- 10/0/0
		waist = "Reiki Yotai",
		legs = TaeonLegs.DW,
		feet = TaeonFeet.DW 
	} -- 25 DW | sTP+31 | 18DA/15TA/0QA | 10/0/31
	--17 DW Needed
	sets.DT.Standard.Haste_40 = {
		ammo = "Chrono Bullet",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", 
		ear2 = "Brutal Earring", 
		body = "Malignance Tabard", -- 0/0/9 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Defending Ring", -- 0/0/10 
		ring2 = "Epona's Ring",
		back = Camulus.DA, -- 10/0/0
		waist = "Reiki Yotai",
		legs = TaeonLegs.DW,
		feet = "Malignance Boots" -- 0/0/4
	} -- 16 DW | sTP+44 | 18DA/15TA/0QA | 10/0/29
	--11 DW needed
	sets.DT.Standard.Haste_45 = {
		ammo = "Chrono Bullet",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", 
		ear2 = "Brutal Earring", 
		body = "Malignance Tabard", -- 0/0/9 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Defending Ring", -- 0/0/10 
		ring2 = "Epona's Ring",	
		back = Camulus.DA, -- 10/0/0
		waist = "Reiki Yotai",
		legs = "Samnuha Tights",
		feet = "Malignance Boots" -- 0/0/4
	} -- 11 DW | sTP+51 | 21DA/16TA/0QA | 10/0/29
	
	--Tese sets priorotize max DT before DW/Combat stats
	sets.DT.Full = {}
	sets.DT.Full.index = {"Oshit", "Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45"}
	--59 DW needed
	sets.DT.Full.Oshit = {	
		ammo = "Chrono Bullet",
		head = "Malignance Chapeau", 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", --4 
		ear2 = "Suppanomimi", --5
		body = "Malignance Tabard",
		hands = "Malignance Gloves",
		ring1 = "Defending Ring", 
		ring2 = "Epona's Ring",	
		back = Camulus.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights", 
		feet = "Malignance Boots"
	} -- 26 DW | sTP+58 | 3DA/9TA/0QA | 10/0/41		
	--49 DW needed
	sets.DT.Full.Haste_0 = {
		ammo = "Chrono Bullet",
		head = "Malignance Chapeau", 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", --4 
		ear2 = "Suppanomimi", --5
		body = "Malignance Tabard",
		hands = "Malignance Gloves",
		ring1 = "Defending Ring", 
		ring2 = "Epona's Ring",	
		back = Camulus.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights", 
		feet = "Malignance Boots"
	} -- 26 DW | sTP+58 | 3DA/9TA/0QA | 10/0/41	
	--47 DW Needed
	sets.DT.Full.Haste_5 = {
		ammo = "Chrono Bullet",
		head = "Malignance Chapeau", 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", --4 
		ear2 = "Suppanomimi", --5
		body = "Malignance Tabard",
		hands = "Malignance Gloves",
		ring1 = "Defending Ring", 
		ring2 = "Epona's Ring",	
		back = Camulus.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights", 
		feet = "Malignance Boots"
	} -- 26 DW | sTP+58 | 3DA/9TA/0QA | 10/0/41		
	--45 DW Needed
	sets.DT.Full.Haste_10 = {
		ammo = "Chrono Bullet",
		head = "Malignance Chapeau", 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", --4 
		ear2 = "Suppanomimi", --5
		body = "Malignance Tabard",
		hands = "Malignance Gloves",
		ring1 = "Defending Ring", 
		ring2 = "Epona's Ring",	
		back = Camulus.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights", 
		feet = "Malignance Boots"
	} -- 26 DW | sTP+58 | 3DA/9TA/0QA | 10/0/41	
	--42 DW needed
	sets.DT.Full.Haste_15 = {
		ammo = "Chrono Bullet",
		head = "Malignance Chapeau", 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", --4 
		ear2 = "Suppanomimi", --5
		body = "Malignance Tabard",
		hands = "Malignance Gloves",
		ring1 = "Defending Ring", 
		ring2 = "Epona's Ring",	
		back = Camulus.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights", 
		feet = "Malignance Boots"
	} -- 26 DW | sTP+58 | 3DA/9TA/0QA | 10/0/41	
	--36 DW needed
	sets.DT.Full.Haste_20 = {
		ammo = "Chrono Bullet",
		head = "Malignance Chapeau", 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", --4 
		ear2 = "Suppanomimi", --5
		body = "Malignance Tabard",
		hands = "Malignance Gloves",
		ring1 = "Defending Ring", 
		ring2 = "Epona's Ring",	
		back = Camulus.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights", 
		feet = "Malignance Boots"
	} -- 26 DW | sTP+58 | 3DA/9TA/0QA | 10/0/41	
	--33 DW needed
	sets.DT.Full.Haste_25 = {
		ammo = "Chrono Bullet",
		head = "Malignance Chapeau", 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", --4 
		ear2 = "Suppanomimi", --5
		body = "Malignance Tabard",
		hands = "Malignance Gloves",
		ring1 = "Defending Ring", 
		ring2 = "Epona's Ring",
		back = Camulus.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights", 
		feet = "Malignance Boots"
	} -- 26 DW | sTP+58 | 3DA/9TA/0QA | 10/0/41	
	--31 DW needed
	sets.DT.Full.Haste_30 = {
		ammo = "Chrono Bullet",
		head = "Malignance Chapeau", 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", --4 
		ear2 = "Suppanomimi", --5
		body = "Malignance Tabard",
		hands = "Malignance Gloves",
		ring1 = "Defending Ring", 
		ring2 = "Epona's Ring",	
		back = Camulus.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights", 
		feet = "Malignance Boots"
	} -- 26 DW | sTP+58 | 3DA/9TA/0QA | 10/0/41	
	--25 DW Needed
	sets.DT.Full.Haste_35 = {
		ammo = "Chrono Bullet",
		head = "Malignance Chapeau", 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", --4 
		ear2 = "Suppanomimi", --5
		body = "Malignance Tabard",
		hands = "Malignance Gloves",
		ring1 = "Defending Ring", 
		ring2 = "Epona's Ring",	
		back = Camulus.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights", 
		feet = "Malignance Boots"
	} -- 26 DW | sTP+58 | 3DA/9TA/0QA | 10/0/41	
	--17 DW Needed
	sets.DT.Full.Haste_40 = {
		ammo = "Chrono Bullet",
		head = "Malignance Chapeau", 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", --4 
		ear2 = "Suppanomimi", --5
		body = "Malignance Tabard",
		hands = "Malignance Gloves",
		ring1 = "Defending Ring", 
		ring2 = "Epona's Ring",	
		back = Camulus.DA,
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights", 
		feet = "Malignance Boots"
	} -- 16 DW | sTP+58 | 13DA/9TA/0QA | 10/0/41	
	--11 DW needed
	sets.DT.Full.Haste_45 = {
		ammo = "Chrono Bullet",
		head = "Malignance Chapeau", 
		neck = "Combatant's Torque", 
		ear1 = "Eabani Earring", --4 
		ear2 = "Brutal Earring",
		body = "Malignance Tabard",
		hands = "Malignance Gloves",
		ring1 = "Defending Ring", 
		ring2 = "Epona's Ring",	
		back = Camulus.DA,
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights", 
		feet = "Malignance Boots"
	} -- 11 DW | sTP+59 | 18DA/9TA/0QA | 10/0/41	


	--Weaponskill Sets--
	sets.WS = {}
	sets.WS.index = {"Normal", "Attack", "AttackCapped"}
	WS_ind = 1	
	
	--For all sets assume you needfull TP Bonus gear
	--a later function handles optimization for TP thresholds

	--Sword
	sets.SavageBlade = {}
	sets.SavageBlade.Normal = {
		ammo="Chrono Bullet",
		head="Nyame Helm",
		neck="Republican Platinum Medal",
		ear1="Ishvara Earring",
		ear2="Moonshade Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Shukuyu Ring",
		ring2="Regal Ring",
		back=Camulus.STR_WSD,
		waist="Sailfi Belt +1",
		legs="Nyame Flanchard",
		feet="Lanun Bottes +3"
	}
	sets.SavageBlade.Attack = {
		ammo="Chrono Bullet",
		head="Nyame Helm",
		neck="Republican Platinum Medal",
		ear1="Ishvara Earring",
		ear2="Moonshade Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Shukuyu Ring",
		ring2="Regal Ring",
		back=Camulus.STR_WSD,
		waist="Sailfi Belt +1",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.SavageBlade.AttackCapped = {
		ammo="Chrono Bullet",
		head="Nyame Helm",
		neck="Republican Platinum Medal",
		ear1="Ishvara Earring",
		ear2="Moonshade Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Shukuyu Ring",
		ring2="Regal Ring",
		back=Camulus.STR_WSD,
		waist="Sailfi Belt +1",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	
	sets.SanguineBlade = {}
	--Higher MAcc set
	sets.SanguineBlade.Normal = {
		ammo="Animikii Bullet",
		head="Pixie Hairpin +1",
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
        ear2="Moonshade Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Archon Ring",
		ring2="Metamorph Ring +1",
		back=Camulus.STR_WSD,
		waist="Eschan Stone",
        legs="Nyame Flanchard",
		feet="Lanun Bottes +3"
	}
	-- MAcc set
	sets.SanguineBlade.Attack = {
		ammo="Animikii Bullet",
		head="Pixie Hairpin +1",
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
        ear2="Moonshade Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Archon Ring",
		ring2="Metamorph Ring +1",
		back=Camulus.STR_WSD,
		waist="Eschan Stone",
        legs="Nyame Flanchard",
		feet="Lanun Bottes +3"
	}
	sets.SanguineBlade.AttackCapped = {
		ammo="Animikii Bullet",
		head="Pixie Hairpin +1",
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
        ear2="Moonshade Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Archon Ring",
		ring2="Metamorph Ring +1",
		back=Camulus.STR_WSD,
		waist="Eschan Stone",
        legs="Nyame Flanchard",
		feet="Lanun Bottes +3"
	}	
	
	sets.RedLotusBlade = {}
	--Higher MAcc set
	sets.RedLotusBlade.Normal = {
		ammo="Animikii Bullet",
		head="Nyame Helm",
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
        ear2="Moonshade Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Dingir Ring",
		ring2="Metamorph Ring +1",
		back=Camulus.STR_WSD,
		waist="Eschan Stone",
        legs="Nyame Flanchard",
		feet="Lanun Bottes +3"
	}
	-- MAcc set
	sets.RedLotusBlade.Attack = {
		ammo="Animikii Bullet",
		head="Nyame Helm",
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
        ear2="Moonshade Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Dingir Ring",
		ring2="Metamorph Ring +1",
		back=Camulus.STR_WSD,
		waist="Eschan Stone",
        legs="Nyame Flanchard",
		feet="Lanun Bottes +3"
	}
	sets.RedLotusBlade.AttackCapped = {
		ammo="Animikii Bullet",
		head="Nyame Helm",
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
        ear2="Moonshade Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Dingir Ring",
		ring2="Metamorph Ring +1",
		back=Camulus.STR_WSD,
		waist="Eschan Stone",
        legs="Nyame Flanchard",
		feet="Lanun Bottes +3"
	}
	
	-- Swaps disallowed for this set due to SC-compatibility needs in Omen
	sets.BurningBlade = {}
	--Higher MAcc set
	sets.BurningBlade.Normal = {}
		-- ammo="Animikii Bullet",
		-- head="Nyame Helm",
		-- neck="Sanctity Necklace",
		-- ear1="Friomisi Earring",
        -- ear2="Moonshade Earring",
		-- body="Nyame Mail",
        -- hands="Nyame Gauntlets",
        -- ring1="Dingir Ring",
		-- ring2="Metamorph Ring +1",
		-- back=Camulus.STR_WSD,
		-- waist="Eschan Stone",
        -- legs="Nyame Flanchard",
		-- feet="Lanun Bottes +3"
	-- }
	-- MAcc set
	sets.BurningBlade.Attack = {}
		-- ammo="Animikii Bullet",
		-- head="Nyame Helm",
		-- neck="Sanctity Necklace",
		-- ear1="Friomisi Earring",
        -- ear2="Moonshade Earring",
		-- body="Nyame Mail",
        -- hands="Nyame Gauntlets",
        -- ring1="Dingir Ring",
		-- ring2="Metamorph Ring +1",
		-- back=Camulus.STR_WSD,
		-- waist="Eschan Stone",
        -- legs="Nyame Flanchard",
		-- feet="Lanun Bottes +3"
	-- }
	sets.BurningBlade.AttackCapped = {}
		-- ammo="Animikii Bullet",
		-- head="Nyame Helm",
		-- neck="Sanctity Necklace",
		-- ear1="Friomisi Earring",
        -- ear2="Moonshade Earring",
		-- body="Nyame Mail",
        -- hands="Nyame Gauntlets",
        -- ring1="Dingir Ring",
		-- ring2="Metamorph Ring +1",
		-- back=Camulus.STR_WSD,
		-- waist="Eschan Stone",
        -- legs="Nyame Flanchard",
		-- feet="Lanun Bottes +3"
	-- }

	sets.SeraphBlade = {}
	--Higher MAcc set
	sets.SeraphBlade.Normal = {
		ammo="Animikii Bullet",
		head="Nyame Helm",
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
        ear2="Moonshade Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Dingir Ring",
		ring2="Metamorph Ring +1",
		back=Camulus.STR_WSD,
		waist="Eschan Stone",
        legs="Nyame Flanchard",
		feet="Lanun Bottes +3"
	}
	-- MAcc set
	sets.SeraphBlade.Attack = {
		ammo="Animikii Bullet",
		head="Nyame Helm",
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
        ear2="Moonshade Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Dingir Ring",
		ring2="Metamorph Ring +1",
		back=Camulus.STR_WSD,
		waist="Eschan Stone",
        legs="Nyame Flanchard",
		feet="Lanun Bottes +3"
	}
	sets.SeraphBlade.AttackCapped = {
		ammo="Animikii Bullet",
		head="Nyame Helm",
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
        ear2="Moonshade Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Dingir Ring",
		ring2="Metamorph Ring +1",
		back=Camulus.STR_WSD,
		waist="Eschan Stone",
        legs="Nyame Flanchard",
		feet="Lanun Bottes +3"
	}
	
	-- Swaps disallowed for this set due to SC-compatibility needs in Omen
	sets.ShiningBlade = {}
	--Higher MAcc set
	sets.ShiningBlade.Normal = {}
		-- ammo="Animikii Bullet",
		-- head="Nyame Helm",
		-- neck="Sanctity Necklace",
		-- ear1="Friomisi Earring",
        -- ear2="Moonshade Earring",
		-- body="Nyame Mail",
        -- hands="Nyame Gauntlets",
        -- ring1="Dingir Ring",
		-- ring2="Metamorph Ring +1",
		-- back=Camulus.STR_WSD,
		-- waist="Eschan Stone",
        -- legs="Nyame Flanchard",
		-- feet="Lanun Bottes +3"
	-- }
	-- MAcc set
	sets.ShiningBlade.Attack = {}
		-- ammo="Animikii Bullet",
		-- head="Nyame Helm",
		-- neck="Sanctity Necklace",
		-- ear1="Friomisi Earring",
        -- ear2="Moonshade Earring",
		-- body="Nyame Mail",
        -- hands="Nyame Gauntlets",
        -- ring1="Dingir Ring",
		-- ring2="Metamorph Ring +1",
		-- back=Camulus.STR_WSD,
		-- waist="Eschan Stone",
        -- legs="Nyame Flanchard",
		-- feet="Lanun Bottes +3"
	-- }
	sets.ShiningBlade.AttackCapped = {}
		-- ammo="Animikii Bullet",
		-- head="Nyame Helm",
		-- neck="Sanctity Necklace",
		-- ear1="Friomisi Earring",
        -- ear2="Moonshade Earring",
		-- body="Nyame Mail",
        -- hands="Nyame Gauntlets",
        -- ring1="Dingir Ring",
		-- ring2="Metamorph Ring +1",
		-- back=Camulus.STR_WSD,
		-- waist="Eschan Stone",
        -- legs="Nyame Flanchard",
		-- feet="Lanun Bottes +3"
	-- }	
	
	--Should really just be geared to land stun
	sets.FlatBlade = {}
	sets.FlatBlade.Normal = {
        ammo="Devastating Bullet",
		head="Malignance Chapeau",
		neck="Sanctity Necklace",
		ear1="Crepuscular Earring",
		ear2="Dignitary's Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Etana Ring",
		ring2="Metamorph Ring +1",
		back=Camulus.DA,
		waist="Eschan Stone",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}
	sets.FlatBlade.Attack = {
        ammo="Devastating Bullet",
		head="Malignance Chapeau",
		neck="Sanctity Necklace",
		ear1="Crepuscular Earring",
		ear2="Dignitary's Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Etana Ring",
		ring2="Metamorph Ring +1",
		back=Camulus.DA,
		waist="Eschan Stone",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}
	sets.FlatBlade.AttackCapped = {
        ammo="Devastating Bullet",
		head="Malignance Chapeau",
		neck="Sanctity Necklace",
		ear1="Crepuscular Earring",
		ear2="Dignitary's Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Etana Ring",
		ring2="Metamorph Ring +1",
		back=Camulus.DA,
		waist="Eschan Stone",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}
	
	sets.VorpalBlade = {}
	sets.VorpalBlade.Normal = {
        ammo="Chrono Bullet",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Odr Earring",
		ear2="Moonshade Earring",
		body="Meghanada Cuirie +2",
		hands="Adhemar Wristbands +1",
		ring1="Ilabrat Ring",
		ring2="Epona's Ring",
		back=Camulus.DA,
		waist="Fotia Belt",
		legs="Meghanada Chausses +2",
		feet="Mummu Gamashes +2"
	}
	sets.VorpalBlade.Attack = {
        ammo="Chrono Bullet",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Odr Earring",
		ear2="Moonshade Earring",
		body="Meghanada Cuirie +2",
		hands="Adhemar Wristbands +1",
		ring1="Ilabrat Ring",
		ring2="Epona's Ring",
		back=Camulus.DA,
		waist="Fotia Belt",
		legs="Meghanada Chausses +2",
		feet="Mummu Gamashes +2"
	}
	sets.VorpalBlade.AttackCapped = {
        ammo="Chrono Bullet",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Odr Earring",
		ear2="Moonshade Earring",
		body="Meghanada Cuirie +2",
		hands="Adhemar Wristbands +1",
		ring1="Ilabrat Ring",
		ring2="Epona's Ring",
		back=Camulus.DA,
		waist="Fotia Belt",
		legs="Meghanada Chausses +2",
		feet="Mummu Gamashes +2"
	}


	--Dagger
	sets.Evisceration = {}
	sets.Evisceration.Normal = {
        ammo="Chrono Bullet",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Odr Earring",
		ear2="Moonshade Earring",
		body="Meghanada Cuirie +2",
		hands="Adhemar Wristbands +1",
		ring1="Ilabrat Ring",
		ring2="Epona's Ring",
		back=Camulus.DA,
		waist="Fotia Belt",
		legs="Meghanada Chausses +2",
		feet="Mummu Gamashes +2"
	}
	sets.Evisceration.Attack = {
        ammo="Chrono Bullet",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Odr Earring",
		ear2="Moonshade Earring",
		body="Meghanada Cuirie +2",
		hands="Adhemar Wristbands +1",
		ring1="Ilabrat Ring",
		ring2="Epona's Ring",
		back=Camulus.DA,
		waist="Fotia Belt",
		legs="Meghanada Chausses +2",
		feet="Mummu Gamashes +2"
	}
	sets.Evisceration.AttackCapped = {
        ammo="Chrono Bullet",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Odr Earring",
		ear2="Moonshade Earring",
		body="Meghanada Cuirie +2",
		hands="Adhemar Wristbands +1",
		ring1="Ilabrat Ring",
		ring2="Epona's Ring",
		back=Camulus.DA,
		waist="Fotia Belt",
		legs="Meghanada Chausses +2",
		feet="Mummu Gamashes +2"
	}	
	
	sets.AeolianEdge = {}
	--Higher MAcc set for MagWS
	sets.AeolianEdge.Normal = {
		ammo="Animikii Bullet",
		head="Nyame Helm",
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
        ear2="Moonshade Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Dingir Ring",
		ring2="Metamorph Ring +1",
		back=Camulus.AGI_WSD,
		waist="Eschan Stone",
        legs="Nyame Flanchard",
		feet="Lanun Bottes +3"
	}
	--MAcc set for MagWS
	sets.AeolianEdge.Attack = {
		ammo="Animikii Bullet",
		head="Nyame Helm",
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
        ear2="Moonshade Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Dingir Ring",
		ring2="Metamorph Ring +1",
		back=Camulus.AGI_WSD,
		waist="Eschan Stone",
        legs="Nyame Flanchard",
		feet="Lanun Bottes +3"
	}
	sets.AeolianEdge.AttackCapped = {
		ammo="Animikii Bullet",
		head="Nyame Helm",
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
        ear2="Moonshade Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Dingir Ring",
		ring2="Metamorph Ring +1",
		back=Camulus.AGI_WSD,
		waist="Eschan Stone",
        legs="Nyame Flanchard",
		feet="Lanun Bottes +3"
	}
	
	
	--Gun
	sets.LeadenSalute = {}
	sets.LeadenSalute.Normal = {
		ammo="Devastating Bullet",
		head="Pixie Hairpin +1",
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
		ear2="Moonshade Earring",
		body="Lanun Frac +3",
		hands="Nyame Gauntlets",
		ring1="Archon Ring",
		ring2="Dingir Ring",
		back=Camulus.AGI_WSD,
		waist="Sveltesse Gouriz +1",
		legs="Nyame Flanchard",
		feet="Lanun Bottes +3"
	}
	sets.LeadenSalute.Attack = {
		ammo="Devastating Bullet",
		head="Nyame Helm",
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
		ear2="Moonshade Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Archon Ring",
		ring2="Dingir Ring",
		back=Camulus.AGI_WSD,
		waist="Sveltesse Gouriz +1",
		legs="Nyame Flanchard",
		feet="Lanun Bottes +3"
	}
	sets.LeadenSalute.AttackCapped = {
		ammo="Devastating Bullet",
		head="Pixie Hairpin +1",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Moonshade Earring",
		body="Lanun Frac +3",
		hands="Nyame Gauntlets",
		ring1="Archon Ring",
		ring2="Dingir Ring",
		back=Camulus.AGI_WSD,
		waist="Sveltesse Gouriz +1",
		legs="Nyame Flanchard",
		feet="Lanun Bottes +3"
	}	
	
	sets.Wildfire = {}
	sets.Wildfire.Normal = {
		ammo="Devastating Bullet",
		head="Nyame Helm",
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
		ear2="Crematio Earring",
		body="Lanun Frac +3",
		hands="Nyame Gauntlets",
		ring1="Ilabrat Ring",
		ring2="Dingir Ring",
		back=Camulus.AGI_WSD,
		waist="Sveltesse Gouriz +1",
		legs="Nyame Flanchard",
		feet="Lanun Bottes +3"
	}
	sets.Wildfire.Attack = {
		ammo="Devastating Bullet",
		head="Nyame Helm",
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
		ear2="Crematio Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Ilabrat Ring",
		ring2="Dingir Ring",
		back=Camulus.AGI_WSD,
		waist="Sveltesse Gouriz +1",
		legs="Nyame Flanchard",
		feet="Lanun Bottes +3"
	}
	sets.Wildfire.AttackCapped = {
		ammo="Devastating Bullet",
		head="Nyame Helm",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Crematio Earring",
		body="Lanun Frac +3",
		hands="Nyame Gauntlets",
		ring1="Ilabrat Ring",
		ring2="Dingir Ring",
		back=Camulus.AGI_WSD,
		waist="Sveltesse Gouriz +1",
		legs="Nyame Flanchard",
		feet="Lanun Bottes +3"
	}	
	
	sets.LastStand = {}
	sets.LastStand.Normal = {
		ammo="Chrono Bullet",
		head="Nyame Helm",
		neck="Fotia Gorget",
		ear1="Ishvara Earring",
		ear2="Moonshade Earring",
		body="Laksamana's Frac +3",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Dingir Ring",
		back=Camulus.AGI_WSD_Phys,
		waist="Fotia Belt",
		legs="Nyame Flanchard",
		feet="Lanun Bottes +3"
	}
	sets.LastStand.Attack = {
		ammo="Chrono Bullet",
		head="Lanun Tricorne +3",
		neck="Fotia Gorget",
		ear1="Telos Earring",
		ear2="Moonshade Earring",
		body="Laksamana's Frac +3",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Dingir Ring",
		back=Camulus.AGI_WSD_Phys,
		waist="Fotia Belt",
		legs="Lanun Trews +3",
		feet="Lanun Bottes +3"
	}
	sets.LastStand.AttackCapped = {
		ammo="Chrono Bullet",
		head="Nyame Helm",
		neck="Fotia Gorget",
		ear1="Ishvara Earring",
		ear2="Moonshade Earring",
		body="Ikenga's Vest",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Dingir Ring",
		back=Camulus.AGI_WSD_Phys,
		waist="Fotia Belt",
		legs="Ikenga's Trousers",
		feet="Lanun Bottes +3"
	}
	

	sets.Detonator = {}
	sets.Detonator.Normal = {
		ammo="Chrono Bullet",
		head="Nyame Helm",
		neck="Fotia Gorget",
		ear1="Ishvara Earring",
		ear2="Moonshade Earring",
		body="Laksamana's Frac +3",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Dingir Ring",
		back=Camulus.AGI_WSD_Phys,
		waist="Fotia Belt",
		legs="Nyame Flanchard",
		feet="Lanun Bottes +3"
	}
	sets.Detonator.Attack = {
		ammo="Chrono Bullet",
		head="Lanun Tricorne +3",
		neck="Fotia Gorget",
		ear1="Telos Earring",
		ear2="Moonshade Earring",
		body="Laksamana's Frac +3",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Dingir Ring",
		back=Camulus.AGI_WSD_Phys,
		waist="Fotia Belt",
		legs="Lanun Trews +3",
		feet="Lanun Bottes +3"
	}
	sets.Detonator.AttackCapped = {
		ammo="Chrono Bullet",
		head="Nyame Helm",
		neck="Fotia Gorget",
		ear1="Ishvara Earring",
		ear2="Moonshade Earring",
		body="Ikenga's Vest",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Dingir Ring",
		back=Camulus.AGI_WSD_Phys,
		waist="Fotia Belt",
		legs="Ikenga's Trousers",
		feet="Lanun Bottes +3"
	}	
	
	
	sets.OtherWS = {}
	sets.OtherWS.Normal = {
		ammo="Chrono Bullet",
		head="Nyame Helm",
		neck="Republican Platinum Medal",
		ear1="Ishvara Earring",
		ear2="Moonshade Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Shukuyu Ring",
		ring2="Regal Ring",
		back=Camulus.STR_WSD,
		waist="Sailfi Belt +1",
		legs="Nyame Flanchard",
		feet="Lanun Bottes +3"
	}
	sets.OtherWS.Attack = {
		ammo="Chrono Bullet",
		head="Nyame Helm",
		neck="Republican Platinum Medal",
		ear1="Ishvara Earring",
		ear2="Moonshade Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Shukuyu Ring",
		ring2="Regal Ring",
		back=Camulus.STR_WSD,
		waist="Sailfi Belt +1",
		legs="Nyame Flanchard",
		feet="Lanun Bottes +3"
	}
	sets.OtherWS.AttackCapped = {
		ammo="Chrono Bullet",
		head="Nyame Helm",
		neck="Republican Platinum Medal",
		ear1="Ishvara Earring",
		ear2="Moonshade Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Shukuyu Ring",
		ring2="Regal Ring",
		back=Camulus.STR_WSD,
		waist="Sailfi Belt +1",
		legs="Nyame Flanchard",
		feet="Lanun Bottes +3"
	}
	
	
	sets.OtherRangedWS = {}
	sets.LastStand.Normal = {
		ammo="Chrono Bullet",
		head="Nyame Helm",
		neck="Fotia Gorget",
		ear1="Ishvara Earring",
		ear2="Moonshade Earring",
		body="Laksamana's Frac +3",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Dingir Ring",
		back=Camulus.AGI_WSD_Phys,
		waist="Fotia Belt",
		legs="Nyame Flanchard",
		feet="Lanun Bottes +3"
	}
	sets.OtherRangedWS.Attack = {
		ammo="Chrono Bullet",
		head="Lanun Tricorne +3",
		neck="Fotia Gorget",
		ear1="Telos Earring",
		ear2="Moonshade Earring",
		body="Laksamana's Frac +3",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Dingir Ring",
		back=Camulus.AGI_WSD_Phys,
		waist="Fotia Belt",
		legs="Lanun Trews +3",
		feet="Lanun Bottes +3"
	}
	sets.OtherRangedWS.AttackCapped = {
		ammo="Chrono Bullet",
		head="Nyame Helm",
		neck="Fotia Gorget",
		ear1="Ishvara Earring",
		ear2="Moonshade Earring",
		body="Ikenga's Vest",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Dingir Ring",
		back=Camulus.AGI_WSD_Phys,
		waist="Fotia Belt",
		legs="Ikenga's Trousers",
		feet="Lanun Bottes +3"
	}
	
	
	--Job Ability Sets--
	sets.WildCard = {feet = "Lanun Bottes +3"}
	sets.RandomDeal = {body = "Lanun Frac +3"}
	sets.SnakeEye = {legs = "Lanun Trews +3"}
	sets.Fold = {}--This is here but left empty in case you want to use the JSE for this. I just don't know why you would.
	
	
	--Rolls
	--Note that if the weapon mode is set to custom you will need to manually re-equip your main weapon after rolling
	sets.RostamRoll = {}
	sets.RostamRoll.index = {'Rostam', 'NoSwap'}
	RostamRoll_ind = 1
	
	sets.RostamRoll.Rostam = {main="Rostam"}
	sets.RostamRoll.NoSwap = {}--Keep Blank	
	
	--This will be set up so you can start a roll with Luzaf's Ring on, and toggle to exclude it from subsequent double-ups if needed.
	--"Phantom Roll+" gear does not stack, but you will still want Regal Necklace here for duration even if you have Rostam.
	--Barataria Ring is obsoleted by Regal Necklace. Don't be *that* Corsair, they don't stack.
	sets.PhantomRoll = {
		ammo="Chrono Bullet",
		head="Lanun Tricorne +3", --Occasionally adds benefit as though the job is present in party
		neck="Regal Necklace", -- +7 | +20 duration
		ear1="Eabani Earring",
		ear2="Odnowa Earring +1",
		body="Nyame Mail",
		hands="Chasseur's Gants +1", -- +50 duration
		ring1="Defending Ring",
		ring2="Purity Ring",
		back=Camulus.Idle,
		waist="Flume Belt +1",
		legs="Desultor Tassets", -- -5 PR recast
		feet="Nyame Sollerets"
	}
	sets.PhantomRoll.index = {'Luzaf', 'NoRing'}
	PhantomRoll_ind = 1
	
	sets.PhantomRoll.Luzaf = {ring2 = "Luzaf's Ring"}
	sets.PhantomRoll.NoRing = {} --Keep Blank
	
	--Roll-specific gear
	-- --No, there is no set here for Blitzer's roll. It's for your own good.
	-- --Allies Roll is handled by the main rolling set
	sets.TacticianRoll = {body="Chasseur's Frac +1"}
	sets.CasterRoll = {legs="Chasseur's Culottes +1"}
	sets.CourserRoll = {feet="Chasseur's Bottes +1"}
	
	
	--Quick Draw
	sets.QuickDraw = {}
	sets.QuickDraw.index = {"STP", "Boost", "Damage"}
	QD_ind = 1
	
	sets.QuickDraw.STP = { --Also a good set for Macc
		ammo="Devastating Bullet",
		head="Malignance Chapeau", --8
		neck="Iskur Gorget", --8
		ear1="Crepuscular Earring", --5
		ear2="Dignitary's Earring", --3
		body="Mirke Wardecors", -- (-5 recast)
		hands="Malignance Gloves", --12 
		ring1="Ilabrat Ring", --5
		ring2="Crepuscular Ring", --6
		back=Camulus.AGI_WSD,
		waist="Kwahu Kachina Belt +1",
		legs="Malignance Tights", --10
		feet="Malignance Boots"	--9
	} -- +67 sTP	
	sets.QuickDraw.Boost = { --Use before magic damage to boost the effect
		ammo="Devastating Bullet",
		head="Malignance Chapeau", --8
		neck="Sanctity Necklace",
		ear1="Crepuscular Earring", --5
		ear2="Dignitary's Earring", --3
		body="Mirke Wardecors", -- (-5 recast) 
		hands="Malignance Gloves", --12 
		ring1="Ilabrat Ring", --5
		ring2="Crepuscular Ring", --6
		back=Camulus.AGI_WSD,
		waist="Kwahu Kachina Belt +1",
		legs="Malignance Tights", --10
		feet="Chasseur's Bottes +1" -- +25% boost to next matching elemental damage
	} -- +49 sTP
	sets.QuickDraw.Damage = { 
		ammo="Animikii Bullet",
		head="Nyame Helm", 
		neck="Sanctity Necklace",
		ear1="Friomisi Earring", 
		ear2="Crematio Earring", 
		body="Lanun Frac +3",  
		hands="Carmine Finger Gauntlets +1",  
		ring1="Dingir Ring", 
		ring2="Crepuscular Ring", 
		back=Camulus.AGI_WSD,
		waist="Sveltesse Gouriz +1",
		legs="Nyame Flanchard", 
		feet="Lanun Bottes +3" 
	}
	--Will override for Light/Dark shots
	--Feet for JSE boost to elemental damage is also active in these sets for minimal Macc loss (it's less fuss than more toggles)
	sets.QuickDraw.Macc = {
		ammo="Devastating Bullet",
		head="Malignance Chapeau", 
		neck="Sanctity Necklace",
		ear1="Crepuscular Earring", 
		ear2="Dignitary's Earring", 
		body="Mirke Wardecors", -- (-5 recast)
		hands="Malignance Gloves",  
		ring1="Metamorph Ring +1", 
		ring2="Crepuscular Ring", 
		back=Camulus.AGI_WSD,
		waist="Kwahu Kachina Belt +1",
		legs="Malignance Tights", 
		feet="Chasseur's Bottes +1"	
	}
	
	
	sets.Waltz ={
	-- Insert gear here as desired
	}	
	
	
	--Precast Sets
	sets.FastCast = {
		head=HercHelm.FC, --12
		neck="Orunmila's Torque", --5
        ear1="Loquacious Earring", --2
		ear2="Enchanter's Earring +1", --2
        body=AdhemarBody.FC, --10
		hands="Leyline Gloves", --8
		ring1="Kishar Ring", --4
		ring2="Rahab Ring", --2
		back=Camulus.FC, --10
		waist="Flume Belt +1",
		legs=HercLegs.FC, --7
		feet=HercFeet.FC --7
	} -- +69% FC (nice)
	
	--This is here if you need it for Utsusemi
	sets.NinjutsuFastCast = set_combine(sets.FastCast, {
		--neck = "Magoraga Beads"
	})
	
	--Snapshot sets
	-- -- Cor has 10% snapshot natively at 1200 JP, caps at 70%
	-- -- Set totals do not include Kustawi bonuses for Rapid Shot
	sets.snapshot = {
		head=TaeonHead.SS, --10/0
		neck="Loricate Torque +1",
		ear1="Eabani Earring",
		ear2="Sanare Earring",
		body="Laksamana's Frac +3", -- 0/20
        hands="Lanun Gants +3", --13/0
		ring1="Defending Ring",
		ring2="Crepuscular Ring", --3/0
		back=Camulus.Idle, -- 10/0
		waist="Impulse Belt", --3/0
        legs="Adhemar Kecks +1", --10/13
		feet="Meghanada Jambeaux +2" --10/0
    } --69/33
	--Assumes Flurry1 (+15), +45 needed to cap
	sets.snapshotF1 = {
		head="Chasseur's Tricorne +1", --0/14
		neck="Loricate Torque +1",
		ear1="Eabani Earring",
		ear2="Sanare Earring",
		body="Laksamana's Frac +3", -- 0/20
        hands="Carmine Fin. Ga. +1", --8/11
		ring1="Defending Ring",
		ring2="Crepuscular Ring", --3/0
		back=Camulus.Idle, -- 10/0
		waist="Impulse Belt", --3/0
        legs="Adhemar Kecks +1", --10/13
		feet="Pursuer's Gaiters" -- 0/10
    } --44/68
	--Assume Flurry2 (+30), +30 needed to cap
	sets.snapshotF2 = {
		head="Chasseur's Tricorne +1", --0/14
		neck="Loricate Torque +1",
		ear1="Eabani Earring",
		ear2="Sanare Earring",
		body="Laksamana's Frac +3", -- 0/20
        hands="Carmine Fin. Ga. +1", --8/11
		ring1="Defending Ring",
		ring2="Crepuscular Ring", --3/0
		back=Camulus.Idle, -- 10/0
		waist="Yemaya Belt", --0/5
        legs="Adhemar Kecks +1", --10/13
		feet="Pursuer's Gaiters" -- 0/10
    } --31/73
	
	
	sets.Ranged = {}
	sets.Ranged.index = {"Standard", "Acc", "HighAcc"}
	Ranged_ind = 1
	
	-- These sets are tiered in case you want to switch into more racc
	-- I've never needed to though, as the sets below will usually meet all acc/sTP needs
	sets.Ranged.Standard = {
		ammo="Chrono Bullet",
		head="Malignance Chapeau",
		neck="Iskur Gorget",
		ear1="Crepuscular Earring",
		ear2="Telos Earring",
		body="Nisroch Jerkin", 
        hands="Malignance Gloves", 
		ring1="Ilabrat Ring",
		ring2="Crepuscular Ring",
		back=Camulus.RA,
		waist="Tellen Belt", 
        legs="Adhemar Kecks +1", 
		feet="Malignance Boots"		
	}
	sets.Ranged.Acc = {
		ammo="Devastating Bullet",
		head="Malignance Chapeau",
		neck="Iskur Gorget",
		ear1="Crepuscular Earring",
		ear2="Telos Earring",
		body="Malignance Tabard", 
        hands="Malignance Gloves", 
		ring1="Ilabrat Ring",
		ring2="Crepuscular Ring",
		back=Camulus.RA,
		waist="Tellen Belt", 
        legs="Malignance Tights", 
		feet="Malignance Boots"	
	} -- 1392 Racc before food/buffs. If you need more, rethink your approach to the content.
	sets.Ranged.HighAcc = {
		ammo="Devastating Bullet",
		head="Malignance Chapeau",
		neck="Iskur Gorget",
		ear1="Crepuscular Earring",
		ear2="Telos Earring",
		body="Malignance Tabard", 
        hands="Malignance Gloves", 
		ring1="Ilabrat Ring",
		ring2="Crepuscular Ring",
		back=Camulus.RA,
		waist="Tellen Belt", 
        legs="Malignance Tights", 
		feet="Malignance Boots"	
	} -- Redundant in case a world where an additional tier is necessary	

	
	--Triple Shot sets
	sets.TripleShot = {}
	sets.TripleShot.Index = {'Standard', 'Acc', 'HighAcc'} --If you add a set to normal RA you will need to add one here too
	
	sets.TripleShot.Standard = {
		ammo="Chrono Bullet",
		head="Malignance Chapeau",
		neck="Iskur Gorget",
		ear1="Crepuscular Earring",
		ear2="Telos Earring",
		body="Chasseur's Frac +1", 
        hands="Lanun Gants +3", 
		ring1="Ilabrat Ring",
		ring2="Crepuscular Ring",
		back=Camulus.RA,
		waist="Tellen Belt", 
        legs="Oshosi Trousers", 
		feet="Oshosi Leggings"		
	}
	sets.TripleShot.Acc = {
		ammo="Devastating Bullet",
		head="Malignance Chapeau",
		neck="Iskur Gorget",
		ear1="Crepuscular Earring",
		ear2="Telos Earring",
		body="Chasseur's Frac +1", 
        hands="Lanun Gants +3", 
		ring1="Ilabrat Ring",
		ring2="Crepuscular Ring",
		back=Camulus.RA,
		waist="Tellen Belt", 
        legs="Malignance Tights", 
		feet="Malignance Boots"	
	} 
	sets.TripleShot.HighAcc = {
		ammo="Devastating Bullet",
		head="Malignance Chapeau",
		neck="Iskur Gorget",
		ear1="Crepuscular Earring",
		ear2="Telos Earring",
		body="Chasseur's Frac +1", 
        hands="Lanun Gants +3", 
		ring1="Ilabrat Ring",
		ring2="Crepuscular Ring",
		back=Camulus.RA,
		waist="Tellen Belt", 
        legs="Malignance Tights", 
		feet="Malignance Boots"	
	} 
	

	--The next sets are only active for AM when equipped with Armageddon
	sets.Ranged.AM_Crit = {
		ammo="Chrono Bullet",
		head="Meghanada Visor +2",
		neck="Iskur Gorget",
		ear1="Odr Earring",
		ear2="Telos Earring",
		body="Nisroch Jerkin", 
        hands="Mummu Wrists +2", 
		ring1="Mummu Ring",
		ring2="Crepuscular Ring",
		back=Camulus.RA_Crit,
		waist="Kwahu Kachina Belt +1", 
        legs="Darraigner's Brais", 
		feet="Oshosi Leggings"			
	}	
	sets.TripleShot.AM_Crit = {
		ammo="Chrono Bullet",
		head="Meghanada Visor +2",
		neck="Iskur Gorget",
		ear1="Odr Earring",
		ear2="Telos Earring",
		body="Chasseur's Frac +1", 
        hands="Lanun Gants +3",  
		ring1="Mummu Ring",
		ring2="Crepuscular Ring",
		back=Camulus.RA_Crit,
		waist="Kwahu Kachina Belt +1", 
        legs="Darraigner's Brais",
		feet="Oshosi Leggings"			
	}
	
	--this set swaps on during AM_Crit sets when range to target is appropriate
	--Tellen Belt will generally be the best waist option even when not in true shot range when crit rate matters less
	sets.TrueShot = {
		waist = "Tellen Belt",
		legs = "Oshosi Trousers"
	}	
	
	
	--Midcast Sets
	-- FC here will lower recasts until cap, but its a good idea to put -DT% in midcasts
	sets.FastRecast = {
		head=HercHelm.FC, --12
		neck="Orunmila's Torque", --5
        ear1="Loquacious Earring", --2
		ear2="Enchanter's Earring +1", --2
        body=AdhemarBody.FC, --10
		hands="Leyline Gloves", --8
		ring1="Kishar Ring", --4
		ring2="Rahab Ring", --2
		back=Camulus.FC, --10
		waist="Flume Belt +1",
		legs=HercLegs.FC, --5
		feet=HercFeet.FC --7
	}
	
	
	--Special Sets
	sets.obi = {waist = "Hachirin-no-Obi"}	
	
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
		ammo = "Chrono Bullet", 
		head = "Nyame Helm", -- 0/0/7
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring", 
		body = "Nyame Mail", -- 0/0/9
		hands = "Nyame Gauntlets", -- 0/0/7
		ring1 = "Shadow Ring",
		ring2 = "Sheltered Ring", 
		back = Camulus.Idle, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = "Nyame Flanchard", -- 0/0/8 
		feet = "Nyame Sollerets" -- 0/0/7
	} -- 10/0/44

	--This is here to be manually called for someone else to cast on you.
	sets.Phalanx = {
		head = TaeonHead.Phalanx, 
		neck = "Loricate Torque +1",
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring", 
		body = HercVest.Phalanx, 
		hands = HercHands.Phalanx,
		ring1 = "Defending Ring", 
		ring2 = "Gelatinous Ring +1", 
		back = Camulus.Idle, 
		waist = "Carrier's Sash", 
		legs = HercLegs.Phalanx,
		feet = HercFeet.Phalanx
	}
	
	-- Currently mapped to Kuriyami: Ichi casts to apply TH4
	sets.TH = {
		ammo = "Perfect Lucky Egg", --1
		head = "Volte Cap", --1
		hands = HercHands.TH, --2
		waist = "Chaac Belt" --1
	} -- +5
	
	sets.Kite = {
		legs = "Carmine Cuisses +1"
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
		'Pflug', 'Provoke', 'Stun', 'Flash', 'Valliance'}
		
	Utsusemi_spells = S{
		'Utsusemi: Ichi', 'Utsusemi: Ni', 'Utsusemi: San'}
	
	--Most common weapons that are not DW
	Not_dual_wield_weapons = S{
		'unarmed', 'Nusku Shield'}
		
	Cancel_shot_ammo = S{
		'Animikii Bullet', 'Hauksbok Bullet'}
		
	TP_bonus_equipment = S{
		"Fomalhaut", "Anarchy +2", "Anarchy +3", "Ataktos", "Ikenga's Vest", "Moonshade Earring"}
	
	TP_bonus_weaponskill = S{
		'Last Stand', 'Hot Shot', 'Detonator', -- Leaden Salute is excluded here since it is optimized better by the main TP bonus checks 
		'Savage Blade'}
		
	TP_bonus_multi_weaponskill = S{
		}
	
	fTP_transfer_weaponskill = S{
		'Evisceration'}
	
	Melee_magic_WS = S{
		'Aeolian Edge', 'Burning Blade', 'Red Lotus Blade', 'Shining Blade', 'Seraph Blade'}
		
	Ranged_weaponskill = S{
		'Detonator', 'Leaden Salute', 'Last Stand', 'Wildfire', 'Hot Shot', 
		'Sniper Shot', 'Split Shot', 'Slug Shot'}
		
	Quick_draw = S{
		'Fire Shot', 'Ice Shot', 'Wind Shot', 'Earth Shot', 'Thunder Shot', 'Water Shot', 'Light Shot', 'Dark Shot'}
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
    -- buffactive[580] = geo haste - 30% 
    -- buffactive[33] = regular haste - 15%
    -- buffactive[604] = mighty guard - 15%
    -- Haste_mode:
	-- -- if: 		Soul Voice, assumes Soul Voice buffs and Bolster
	-- -- elseif: 	Haste II, assumes RDM or SMN haste
	-- -- else: 	Low, assumes NQ haste and NQ BRD songs 
	
	if Not_dual_wield_weapons:contains(player.equipment.main) then
		--do nothing (reserved for potential later use)
	else
		-- magicalHaste = sumOfHasteBuffs - slowAdjustment - weakness
		-- sumOfHasteBuffs = math.min(geoHaste + haste(spell) + marches + embrava + mightyGuard, 45) + samba
		-- slowAdjustment = slowEffect + elegy
		-- weakness = 100
		if Soul_voice == true then -- for both SV and bolster and assumes high-tier haste
			hasteVal = math.min((buffmath(580) * 2) + buffmath(228) + (buffmath(33) * 2) + determine_marches() + buffmath(604) + (buffmath(370) * 2) - (buffmath(13) + buffmath(565) + buffmath(194)), 45) - buffmath(1)
		elseif Haste_II == true then
			hasteVal = math.min(buffmath(580) + buffmath(228) + (buffmath(33) * 2) + determine_marches() + buffmath(604) + (buffmath(370) * 2) - (buffmath(13) + buffmath(565) + buffmath(194)), 45) - buffmath(1)
		else	
			hasteVal = math.min(buffmath(580) + buffmath(228) + buffmath(33) + determine_marches() + buffmath(604) + buffmath(370) - (buffmath(13) + buffmath(565) + buffmath(194)), 45) - buffmath(1)
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
			if DT_mode == false then
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
	DT_mode = false
	Kite_mode = true
	--Haste_mode
	Soul_voice = false
	Haste_II = false
	moving = false
	send_command('@input /echo COR Loaded, Current Modes::: DT: OFF | Haste_mode: LOW')
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
	
	--Never fire R/Ex ammo again
	if (spell.english == 'Ranged' or 
		(spell.type == 'Weaponskill' and not Melee_magic_WS:contains(spell.english))) and 
		Cancel_shot_ammo:contains(player.equipment.ammo) then 
		
		cancel_spell()
		equip({ammo=""})
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


-- Job Control Functions
function precast(spell)
	--Prevents range/ammo swaps from occuring when using Ullr
	if spell.english == "Ranged" then
		if buffactive['Flurry II'] then
			equip(sets.snapshotF2)
		elseif buffactive['Flurry'] then
			equip(sets.snapshotF1)
		else
			equip(sets.snapshot)
		end
	elseif (spell.type == 'WhiteMagic' or 
		spell.type == 'BlackMagic' or 
		spell.type == 'BlueMagic' or
		spell.type == 'Trust' or
		spell.type == 'BardSong' or
		spell.type == 'Geomancy') then
		
		equip(sets.FastCast)
	elseif spell.type == 'Ninjutsu' then
		equip(sets.NinjutsuFastCast)
	elseif spell.type == 'Waltz' then
		equip(sets.JA.Waltz)
	elseif spell.type == "WeaponSkill" then
		if player.tp >= 1000 then
			--handles ranged WS's
			if Ranged_weaponskill:contains(spell.english) then
				if spell.target.distance <= 21.5 then
					equip(sets.OtherRangedWS[sets.WS.index[WS_ind]])
					if spell.english == "Detonator" then
						equip(sets.Detonator[sets.WS.index[WS_ind]])
					end
					if spell.english == "Last Stand" then
						equip(sets.LastStand[sets.WS.index[WS_ind]])
					end
					if spell.english == "Leaden Salute" then
						equip(sets.LeadenSalute[sets.WS.index[WS_ind]])
						if world.day_element == "Dark" or world.weather_element == "Dark" then
							equip(sets.obi)
						end
					end
					if spell.english == "Wildfire" then
						equip(sets.Wildfire[sets.WS.index[WS_ind]])
						if world.day_element == "Fire" or world.weather_element == "Fire" then
							equip(sets.obi)
						end
					end
					if spell.english == "Hot Shot" then
						equip(sets.HotShot[sets.WS.index[WS_ind]])
						if world.day_element == "Fire" or world.weather_element == "Fire" then
							equip(sets.obi)
						end
					end
				else
					cancel_spell()
					send_command("@input /echo Canceled " .. spell.name .. " " .. spell.target.name .. " is Too Far")
				end
				return
			end
			
			--handles close-range WS's
			if not Ranged_weaponskill:contains(spell.english) then
				if spell.target.distance <= 5.5 then
					--Physical WS's
					equip(sets.OtherWS[sets.WS.index[WS_ind]])
					if spell.english == "Savage Blade" then
						equip(sets.SavageBlade[sets.WS.index[WS_ind]])
					end
					if spell.english == "Flat Blade" then
						equip(sets.FlatBlade[sets.WS.index[WS_ind]])
					end
					if spell.english == "Vorpal Blade" then
						equip(sets.VorpalBlade[sets.WS.index[WS_ind]])
					end
					if spell.english == "Evisceration" then
						equip(sets.Evisceration[sets.WS.index[WS_ind]])
					end
					--Hybrid/Elemental WS's
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
				end
			else
				cancel_spell()
				send_command("@input /echo Canceled " .. spell.name .. " " .. spell.target.name .. " is Too Far")
			end

		end
	elseif spell.english == "Wild Card" then
		equip(sets.WildCard)
	elseif spell.english == "Random Deal" then
		equip(sets.RandomDeal)
	elseif spell.english == "Snake Eye" then
		equip(sets.SnakeEye)
	elseif spell.english == "Fold" then
		equip(sets.Fold)
	elseif Quick_draw:contains(spell.english) then
		if spell.enlgish == "Light Shot" or spell.enlgish == "Dark Shot" then
			equip(sets.QuickDraw.Macc)
		else
			equip(sets.QuickDraw[sets.QuickDraw.index[QD_ind]])
		end
		if world.day_element == spell.element or world.weather_element == spell.element then
			equip(sets.obi)
		end
	elseif spell.type == "CorsairRoll" or spell.english == "Double-Up" then
		equip(
			set_combine(
				sets.RostamRoll[sets.RostamRoll.index[RostamRoll_ind]], -- Check if using Rostam toggle
				sets.PhantomRoll, -- base PR set
				sets.PhantomRoll[sets.PhantomRoll.index[PhantomRoll_ind]] -- Check Luzaf's toggle
				)
			)
		-- Roll-specific gear
		if spell.english == "Tactician's Roll" then
			equip(sets.TacticianRoll)
		elseif spell.english == "Caster's's Roll" then
			equip(sets.CasterRoll) 
		elseif spell.english == "Courser's Roll" then
			equip(sets.CourserRoll)
		end
	elseif Enmity_actions:contains(spell.english) then  
		equip(sets.Enmity)
	elseif spell.english == "Swipe" then  
		if Burst_mode == true then
			equip(sets.Swipe_MB)
		else
			equip(sets.Swipe)
		end
	end
	

	--overrides gear used to enhance TP bonus when not needed
	TP_bonus_adjustment(spell)
end


function midcast(spell, buff, act)	
	if spell.english == "Ranged" then
		if player.equipment.range == 'Armageddon' and (buffactive['Aftermath: Lv.1'] or buffactive['Aftermath: Lv.2'] or buffactive['Aftermath: Lv.3']) then
			if buffactive['Triple Shot'] then
				if ((spell.target.distance < (GunUpper + spell.target.model_size)) and (spell.target.distance > (GunLower + spell.target.model_size))) then	-- true shot range
					equip(
						set_combine(
							sets.TripleShot.AM_Crit, 
							sets.TrueShot
						)
					) -- AM + TrueShot + TripleShot
				else
					equip(sets.TripleShot.AM_Crit) -- AM + TripleShot set
				end
			else
				if ((spell.target.distance < (GunUpper + spell.target.model_size)) and (spell.target.distance > (GunLower + spell.target.model_size))) then	-- true shot range
					equip(
						set_combine(
							sets.Ranged.AM_Crit, 
							sets.TrueShot
						)
					) -- Ranged AM + TrueShot set
				else
					equip(sets.Ranged.AM_Crit) -- Ranged AM set
				end
			end
		else
			if buffactive['Triple Shot'] then
				if ((spell.target.distance < (GunUpper + spell.target.model_size)) and (spell.target.distance > (GunLower + spell.target.model_size))) then	-- true shot range
					equip(
						set_combine(
							sets.TripleShot[sets.TripleShot.index[Ranged_ind]], 
							sets.TrueShot
						)
					) -- TrueShot + TripleShot set
				else
					equip(sets.TripleShot[sets.TripleShot.index[Ranged_ind]]) -- normal TripleShot set 
				end
			else
				if ((spell.target.distance < (GunUpper + spell.target.model_size)) and (spell.target.distance > (GunLower + spell.target.model_size))) then -- true shot range
					
					equip(
						set_combine(
							sets.Ranged[sets.Ranged.index[Ranged_ind]], 
							sets.TrueShot
						)
					) -- normal TrueShot set
				else
					equip(sets.Ranged[sets.Ranged.index[Ranged_ind]]) -- normal ranged set
				end
			end
		end
	end

	--Handles generic recasts as a fallback
	if (spell.type == 'WhiteMagic' or 
		spell.type == 'BlackMagic' or 
		spell.type == 'Trust' or
		spell.type == 'BlueMagic' or
		spell.type == 'Ninjutsu' or
		spell.type == 'BardSong' or
		spell.type == 'Geomancy') then
		equip(sets.FastRecast)
	end
	
	
	if spell.name == 'Utsusemi: Ichi' and (Shadow_type == 'Ni' or Shadow_type == 'San') and 
	(buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)']) then
	
		send_command('@wait 0.15;cancel Copy Image;cancel Copy Image (2);cancel Copy Image (3);cancel Copy Image (4+)')
	
	elseif spell.name == 'Utsusemi: Ni' and Shadow_type == 'San' and 
	(buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)']) then

		send_command('cancel Copy Image;cancel Copy Image (2);cancel Copy Image (3);cancel Copy Image (4+)')	
	
	end
	
	
	if Enmity_actions:contains(spell.english) then
		equip(sets.Enmity)
	end
	
	
	if spell.english == 'Phalanx' then
		equip(sets.Phalanx)
	end
	
	
	if spell.english == "Kurayami: Ichi" then
		equip(sets.TH)
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


--Detects movement and equips movement speed sets
--WIN+F12 disables
mov = { counter = 0 }
if player and player.index and windower.ffxi.get_mob_by_index(player.index) then -- get currentlyrrent location of character
	-- mov.y has been removed since its not really needed
	mov.x = windower.ffxi.get_mob_by_index(player.index).x
	mov.z = windower.ffxi.get_mob_by_index(player.index).z
end

moving = false
windower.raw_register_event('prerender',function()
	mov.counter = mov.counter + 1;
	if mov.counter > 15 then -- limit the frequency at which this updates (make the value larger if you want it to be less responsive, DO NOT MAKE IT 0)
		local pl = windower.ffxi.get_mob_by_index(player.index)		
		--if:
		-- --player location index table exists;
		-- --pl.x exists;
		-- --mov.x exists
		if pl and pl.x and mov.x and Kite_mode == true then 
			dist = math.sqrt((pl.x-mov.x)^2 + (pl.z-mov.z)^2)
			if dist > 1 and player.status ~= 'Engaged' and not moving then
				send_command('gs equip sets.Kite')
				moving = true
			elseif dist < 1 and moving then
				send_command('gs c Normal sets')
				moving = false
			end
		end
		
		
		--if:
		-- --player location index table exists;
		-- --pl.x exists;
		--then:
		-- --set mov to this location index for later comparison
		if pl and pl.x then
			mov.x = pl.x
			mov.z = pl.z
		end
		mov.counter = 0
	end
end)


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
		if DT_mode == false then
			melee_mode_engaged_set()
		else
			DT_mode_engaged_set()
		end
	else -- idle sets
		idle_set()
	end
end


function idle_set()
	equip(
		set_combine(			
			sets.Idle[sets.Idle.index[Idle_ind]],
			sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]]
		)
	)
end


function melee_mode_engaged_set()
	if Not_dual_wield_weapons:contains(player.equipment.sub) then
		equip(sets.TP.NoDW)
	elseif hasteVal < 0 then
		equip(
			set_combine(			
				sets.TP[sets.TP.index[TP_ind]]["Oshit"],
				sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]]
			)
		)
	else
		equip(
			set_combine(			
				sets.TP[sets.TP.index[TP_ind]]["Haste_" .. hasteVal],
				sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]]
			)
		)
	end
end


function DT_mode_engaged_set()
	if Not_dual_wield_weapons:contains(player.equipment.sub) then
		equip(sets.DT.NoDW)
	elseif hasteVal < 0 then
		equip(
			set_combine(			
				sets.DT[sets.DT.index[DT_ind]]["Oshit"],
				sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]]
			)
		)
	else
		equip(
			set_combine(			
				sets.DT[sets.DT.index[DT_ind]]["Haste_" .. hasteVal],
				sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]]
			)
		)
	end
end


function self_command(command)
	if command == "toggle TP set" then
		if DT_mode == false then
			TP_ind = TP_ind + 1
			if TP_ind > #sets.TP.index then
				TP_ind = 1
			end
			send_command("@input /echo <----- TP Set changed to " .. sets.TP.index[TP_ind] .. " ----->")
		else
			DT_ind = DT_ind + 1
			if DT_ind > #sets.DT.index then
				DT_ind = 1
			end
			send_command("@input /echo <----- DT Set changed to " .. sets.DT.index[DT_ind] .. " ----->")
		end
		determine_haste_sets()
	elseif command == "toggle TP set reverse" then
		if DT_mode == false then
			TP_ind = TP_ind - 1
			if TP_ind < 1 then
				TP_ind = #sets.TP.index
			end
			send_command("@input /echo <----- TP Set changed to " .. sets.TP.index[TP_ind] .. " ----->")
		else
			DT_ind = DT_ind - 1
			if DT_ind < 1 then
				DT_ind = #sets.DT.index
			end
			send_command("@input /echo <----- DT Set changed to " .. sets.DT.index[DT_ind] .. " ----->")		
		end
		determine_haste_sets()
	elseif command == "toggle Ranged set" then
		Ranged_ind = Ranged_ind + 1
		if Ranged_ind > #sets.Ranged.index then
			Ranged_ind = 1
		end
		send_command("@input /echo <----- Ranged Set changed to " .. sets.Ranged.index[Ranged_ind] .. " ----->")
		determine_haste_sets()
	elseif command == "toggle Ranged set reverse" then
		Ranged_ind = Ranged_ind - 1
		if Ranged_ind < 1 then
			Ranged_ind = #sets.Ranged.index
		end
		send_command("@input /echo <----- Ranged Set changed to " .. sets.Ranged.index[Ranged_ind] .. " ----->")
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
		Wm_ind = Wm_ind + 1
		if Wm_ind > #sets.Weapon_melee.index then
			Wm_ind = 1
		end
		send_command("@input /echo <----- Melee weapons changed to " .. sets.Weapon_melee.index[Wm_ind] .. " ----->")
		determine_haste_sets()
	elseif command == "toggle Weapons reverse" then
		Wm_ind = Wm_ind - 1
		if Wm_ind < 1 then
			Wm_ind = #sets.Weapon_melee.index
		end
		send_command("@input /echo <----- Melee weapons changed to " .. sets.Weapon_melee.index[Wm_ind] .. " ----->")
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
	elseif command == "toggle DT set" then --does not update current set, instead sets up the tank set while in melee_mode
		DT_ind = DT_ind + 1
		if DT_ind > #sets.DT.index then
			DT_ind = 1			
		end
		send_command("@input /echo <----- DT Set currently " .. sets.DT.index[DT_ind] .. " ----->")
	elseif command == "toggle DT set reverse" then --does not update current set, instead sets up the tank set while in melee_mode
		DT_ind = DT_ind - 1
		if DT_ind < 1 then
			DT_ind = #sets.DT.index
		end
		send_command("@input /echo <----- DT Set currently to " .. sets.DT.index[DT_ind] .. " ----->")
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
	elseif command == "toggle DT Mode" then
		if DT_mode == false then
			DT_mode = true
			send_command("@input /echo <----- DT Sets: ON ----->")
			determine_haste_sets()
		else
			DT_mode = false
			send_command("@input /echo <----- DT Sets: OFF ----->")
			determine_haste_sets()
		end
	elseif command == "toggle QD Mode" then
		QD_ind = QD_ind + 1
		if QD_ind > #sets.QuickDraw.index then
			QD_ind = 1
		end
		send_command("@input /echo <----- Quick Draw sets changed to " .. sets.QuickDraw.index[QD_ind] .. " ----->")
	elseif command == "toggle Rostam Mode" then
		Rostam_ind = Rostam_ind + 1
		if Rostam_ind > #sets.Rostam.index then
			Rostam_ind = 1
		end
		send_command("@input /echo <----- Rostam Mode set to " .. sets.Rostam.index[Rostam_ind] .. " ----->")
	elseif command == "toggle Luzaf Mode" then
		PhantomRoll_ind = PhantomRoll_ind + 1
		if PhantomRoll_ind > #sets.PhantomRoll.index then
			PhantomRoll_ind = 1
		end
		send_command("@input /echo <----- Luzaf Mode set to " .. sets.PhantomRoll.index[PhantomRoll_ind] .. " ----->")
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
	elseif command == 'Normal sets' then
		equip(
			set_combine(			
				sets.Idle[sets.Idle.index[Idle_ind]],
				sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]]
			)
		)
	end
end


function has_any_buff_of(buff_set)--returns true if you have any of the buffs given
    for i,v in pairs(buff_set) do
        if buffactive[v] ~= nil then return true end
    end
end