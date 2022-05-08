-- 
-- @author Thefoxdanger of Asura
-- DNC.lua v1.1
--
-- Changelog
-- V1.1
-- -- Added detection for Jig that was previously missing.
--
-- V1.2
-- -- Added better waltz detection for sets
-- -- Increased the number of sets to fill various scenarios
-- -- Added custom step timer
-- 
-- 
-- Intermediate DNC lua created to streamline play with as few toggles and other things to press as possible. Designed to be similar in 
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
-- -- CTRL key for WS
send_command('bind ^numpad0 @input /ws "Rudra\'s Storm" <t>')
send_command('bind ^numpad1 @input /ws "" <t>')
send_command('bind ^numpad2 @input /ws "" <t>')
send_command('bind ^numpad3 @input /ws "" <t>')
send_command('bind ^numpad4 @input /ws "" <t>')
send_command('bind ^numpad5 @input /ws "" <t>')
send_command('bind ^numpad6 @input /ws "" <t>')
send_command('bind ^numpad7 @input /ws "" <t>')
send_command('bind ^numpad8 @input /ws "" <t>')
send_command('bind ^numpad9 @input /ws "" <t>')
-- -- Alt key for JA's
send_command('bind !numpad0 @input /ja "Haste Samba" <me>')
send_command('bind !numpad1 @input /ja "Box Step" <t>')
send_command('bind !numpad2 @input /ja "Quickstep" <t>')
send_command('bind !numpad3 @input /ja "Feather Step" <t>')
send_command('bind !numpad4 @input /ja "Stutter Step" <t>')
send_command('bind !numpad5 @input /ja "Climactic Flourish" <me>')
send_command('bind !numpad6 @input /ja "Striking Flourish" <me>')
send_command('bind !numpad7 @input /ja "Reverse Flourish" <me>')
send_command('bind !numpad8 @input /ja "Striking Flourish" <me>')
send_command('bind !numpad9 @input /ja "Ternary Flourish" <t>')
-- -- WIN key for even more JA's (Waltz)
send_command('bind @numpad0 @input /ja "Contradance" <me>')
send_command('bind @numpad1 @input /ja "Curing Waltz III" <stpt>')
send_command('bind @numpad2 @input /ja "Divine Waltz II" <stpt>')
send_command('bind @numpad3 @input /ja "Divine Waltz" <stpt>')
send_command('bind @numpad4 @input /ja "Healing Waltz" <stpt>')
send_command('bind @numpad5 @input /ja "Spectral Jig" <me>')
send_command('bind @numpad6 @input /ja "Chocobo Jig II" <me>')
send_command('bind @numpad7 @input /ja "" <me>') --Custom "blank"
send_command('bind @numpad8 @input /ja "" <me>') --Custom "blank"
send_command('bind @numpad9 @input /ja "" <t>') --Custom "blank"


send_command('wait 180;input //gs validate')

--Variables
--
-- Put your current total for step duration job points here (**/20)
stepJPBonus = 20
--
--
--
-- **** Do not modify these variables ****
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
Loop_stop = 0
MAcc_mode = false
Tank_mode = false
Kite_mode = false
--Haste_mode
Soul_voice = false
Haste_II = false
--
-- **** End of variables you shouldn't touch ****

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
	
	send_command('unbind @numpad0')
	send_command('unbind @numpad1')
	send_command('unbind @numpad2')
	send_command('unbind @numpad3')
	send_command('unbind @numpad4')
	send_command('unbind @numpad5')
	send_command('unbind @numpad6')
	send_command('unbind @numpad7')
	send_command('unbind @numpad8')
	send_command('unbind @numpad9')	
end


function get_sets() 
	--Calls spell mapping (don't remove)
	maps()


	-- Set Macro Book/Set Here	
	set_macros(1,9)
	---Set Lockstyle Here
	set_style(19)
	
	
	--Gear Sets Start Here
	--Augmented Gear
    Senuna = {}
	Senuna.Eva = { name="Senuna's Mantle", augments={'DEX+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Dbl.Atk."+10','Evasion+15',}}
	Senuna.DEX_WSD = { name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}
	Senuna.Waltz = { name="Senuna's Mantle", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Waltz" potency +10%',}}
	Senuna.TP = { name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	Senuna.Crit = { name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}}
	Senuna.DW = { name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}}
	Senuna.STR_DA = { name="Senuna's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}
	
	TaeonHead = {}
	TaeonHead.Phalanx = { name="Taeon Chapeau", augments={'Accuracy+21','Spell interruption rate down -10%','Phalanx +3',}}
	TaeonHead.DW = { name="Taeon Chapeau", augments={'Accuracy+22','"Dual Wield"+5','DEX+10',}}
	
	TaeonBody = {}
	TaeonBody.DW = { name="Taeon Tabard", augments={'Accuracy+20','"Dual Wield"+5','DEX+9',}}
	
	TaeonHands = {}
	TaeonHands.DW = { name="Taeon Gloves", augments={'Accuracy+20','"Dual Wield"+5','DEX+10',}}
	
	TaeonLegs ={}
	TaeonLegs.DW = { name="Taeon Tights", augments={'Accuracy+23','"Dual Wield"+5','DEX+10',}}
	
	TaeonFeet = {}
	TaeonFeet.DW = { name="Taeon Boots", augments={'Accuracy+20 Attack+20','"Dual Wield"+5','Crit. hit damage +3%',}}
	
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
	HercFeet.TP = { name="Herculean Boots", augments={'CHR+1','Accuracy+10','Quadruple Attack +3','Accuracy+8 Attack+8',}}
	HercFeet.FC = { name="Herculean Boots", augments={'Pet: Haste+1','"Dual Wield"+3','"Fast Cast"+7','Mag. Acc.+4 "Mag.Atk.Bns."+4',}}
	HercFeet.Phalanx = { name="Herculean Boots", augments={'"Mag.Atk.Bns."+24','"Fast Cast"+1','Phalanx +4','Mag. Acc.+17 "Mag.Atk.Bns."+17',}}
	
	AdhemarBody = {}
	AdhemarBody.FC = { name="Adhemar Jacket +1", augments={'HP+105','"Fast Cast"+10','Magic dmg. taken -4',}}
	AdhemarBody.TP = { name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}
	
	
	--Weapon Sets (Melee)--
	sets.Weapon_melee = {} -- sets weapon combo for melee-mode
	sets.Weapon_melee.index = {"Custom", "Aeneas", "Tauret", "Karambit"}
	Wm_ind = 1
	sets.Weapon_melee.Aeneas = {
		main = "Aeneas",
		sub = "Gleti's Knife"
	}
	sets.Weapon_melee.Tauret = {
		main = "Tauret",
		sub = "Gleti's Knife"
	}
	sets.Weapon_melee.Karambit = {
		main = "Karambit"
	}
	sets.Weapon_melee.Custom = {}

	--Weapon Sets (Tank)--
	sets.Weapon_tank = {} -- sets weapon combo for tank-mode
	sets.Weapon_tank.index = {"Custom", "Tank", 'Karambit'}
	Wt_ind = 1
	sets.Weapon_tank.Tank = { 
		main = "Acrontica",
		sub = "Gleti's Knife"
	}
	sets.Weapon_tank.Karambit = { 
		main = "Karambit"
	}
	sets.Weapon_tank.Custom = {}

	
	-- Overrides Tank sets to include relic hands
	sets.FanDance = {"Horos Bangles +3"}
	
	--Idle Sets--
	-- melee-mode
	sets.Idle_melee = {}
	sets.Idle_melee.index = {"Standard", "DT", "Regain", "Evasion"}
	Idle_melee_ind = 1
	sets.Idle_melee.Standard = {
		ammo = "Staunch Tathlum +1", -- 0/0/3
		head = "Nyame Helm", -- 0/0/7
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Sanare Earring", 
		ear2 = "Eabani Earring", 
		body = "Nyame Mail", -- 0/0/9
		hands = "Nyame Gauntlets", -- 0/0/7
		ring1 = "Sheltered Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Senuna.Eva,
		waist = "Engraved Belt",	
		legs = "Nyame Flanchard", -- 0/0/8
		feet = "Skadi's Jambeaux +1" 
	} -- 0/0/50
	sets.Idle_melee.DT = {
		ammo = "Staunch Tathlum +1", -- 0/0/3
		head = "Nyame Helm", -- 0/0/7
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Sanare Earring", 
		ear2 = "Eabani Earring", 
		body = "Nyame Mail", -- 0/0/9
		hands = "Horos Bangles +3", 
		ring1 = "Sheltered Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Senuna.Eva,
		waist = "Engraved Belt",	
		legs = "Nyame Flanchard", -- 0/0/8
		feet = "Nyame Sollerets" -- 0/0/7 
	} -- 0/0/50
	sets.Idle_melee.Regain = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Gleti's Mask", -- 6/0/0
		neck = "Loricate Torque +1", -- 0/0/6 
		ear1 = "Sanare Earring", 
		ear2 = "Odnowa Earring +1", -- 0/2/3
		body = "Gleti's Cuirass", -- 9/0/0
		hands = "Gleti's Gauntlets", -- 7/0/0
		ring1 = "Sheltered Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Senuna.Eva,
		waist = "Engraved Belt",	
		legs = "Gleti's Breeches", -- 8/0/0
		feet = "Gleti's Boots" -- 5/0/0 
	} -- 35/2/22
	sets.Idle_melee.Evasion = {
		ammo = "Yamarang", 
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Bathy Choker +1", 
		ear1 = "Infused Earring", 
		ear2 = "Eabani Earring", 
		body = "Nyame Mail", -- 0/0/9
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Sheltered Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Senuna.Eva,
		waist = "Engraved Belt",	
		legs = "Malignance Tights", -- 0/0/7
		feet = "Nyame Sollerets" -- 0/0/7 
	} -- 0/0/44	
	
	
	
	-- tank-mode
	sets.Idle_tank = {}
	sets.Idle_tank.index = {"Standard", "DT", "Regain", "Evasion"}
	Idle_tank_ind = 1
	sets.Idle_tank.Standard = {
		ammo = "Staunch Tathlum +1", -- 0/0/3
		head = "Nyame Helm", -- 0/0/7
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Sanare Earring", 
		ear2 = "Eabani Earring", 
		body = "Nyame Mail", -- 0/0/9
		hands = "Nyame Gauntlets", -- 0/0/7
		ring1 = "Sheltered Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Senuna.Eva,
		waist = "Engraved Belt",	
		legs = "Nyame Flanchard", -- 0/0/8
		feet = "Skadi's Jambeaux +1" 
	} -- 0/0/50
	sets.Idle_tank.DT = {
		ammo = "Staunch Tathlum +1", -- 0/0/3
		head = "Nyame Helm", -- 0/0/7
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Sanare Earring", 
		ear2 = "Eabani Earring", 
		body = "Nyame Mail", -- 0/0/9
		hands = "Horos Bangles +3", 
		ring1 = "Sheltered Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Senuna.Eva,
		waist = "Engraved Belt",	
		legs = "Nyame Flanchard", -- 0/0/8
		feet = "Nyame Sollerets" -- 0/0/7 
	} -- 0/0/50
	sets.Idle_tank.Regain = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Gleti's Mask", -- 6/0/0
		neck = "Loricate Torque +1", -- 0/0/6 
		ear1 = "Sanare Earring", 
		ear2 = "Odnowa Earring +1", -- 0/2/3
		body = "Gleti's Cuirass", -- 9/0/0
		hands = "Gleti's Gauntlets", -- 7/0/0
		ring1 = "Sheltered Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Senuna.Eva,
		waist = "Engraved Belt",	
		legs = "Gleti's Breeches", -- 8/0/0
		feet = "Gleti's Boots" -- 5/0/0 
	} -- 35/2/22
	sets.Idle_tank.Evasion = {
		ammo = "Yamarang", 
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Bathy Choker +1", 
		ear1 = "Infused Earring", 
		ear2 = "Eabani Earring", 
		body = "Nyame Mail", -- 0/0/9
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Sheltered Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Senuna.Eva,
		waist = "Engraved Belt",	
		legs = "Malignance Tights", -- 0/0/7
		feet = "Nyame Sollerets" -- 0/0/7 
	} -- 0/0/44	


	--TP Sets (melee)--
	sets.TP = {}
	sets.TP.index = {"Standard", "DT", "Evasion"}
	TP_ind = 1

	sets.TP.Standard = {}
	sets.TP.Standard.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45"}
	--39 DW needed
	sets.TP.Standard.Haste_0 = {
		ammo = "Coiste Bodhar",
		head = "Maxixi Tiara +2", --4
		neck = "Etoile Gorget +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", --4
		body = "Adhemar Jacket +1", --6 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Samnuha Tights",
		feet = "Horos Toe Shoes +3"
	} -- 31 DW | sTP+48 | 15DA/15TA/0QA
	--37 DW Needed
	sets.TP.Standard.Haste_5 = {
		ammo = "Coiste Bodhar",
		head = "Maxixi Tiara +2", --4
		neck = "Etoile Gorget +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", --4
		body = "Adhemar Jacket +1", --6 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Samnuha Tights",
		feet = "Horos Toe Shoes +3"
	} -- 31 DW | sTP+48 | 15DA/15TA/0QA
	--35 DW Needed
	sets.TP.Standard.Haste_10 = {
		ammo = "Coiste Bodhar",
		head = "Maxixi Tiara +2", --4
		neck = "Etoile Gorget +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", --4
		body = "Adhemar Jacket +1", --6 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Samnuha Tights",
		feet = "Horos Toe Shoes +3"
	} -- 31 DW | sTP+48 | 15DA/15TA/0QA
	--32 DW needed
	sets.TP.Standard.Haste_15 = {
		ammo = "Coiste Bodhar",
		head = "Maxixi Tiara +2", --4
		neck = "Etoile Gorget +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", --4
		body = "Adhemar Jacket +1", --6 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Samnuha Tights",
		feet = "Horos Toe Shoes +3"
	} -- 31 DW | sTP+48 | 15DA/15TA/0QA
	--26 DW needed
	sets.TP.Standard.Haste_20 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Etoile Gorget +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Telos Earring", 
		body = AdhemarBody.TP, --6 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Samnuha Tights",
		feet = "Horos Toe Shoes +3"
	} -- 23 DW | sTP+44 | 15DA/21TA/2QA
	--23 DW needed
	sets.TP.Standard.Haste_25 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Etoile Gorget +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Telos Earring", 
		body = AdhemarBody.TP, --6 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Samnuha Tights",
		feet = "Horos Toe Shoes +3"
	} -- 23 DW | sTP+44 | 15DA/21TA/2QA
	--21 DW needed
	sets.TP.Standard.Haste_30 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Etoile Gorget +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Telos Earring", 
		body = AdhemarBody.TP, --6 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Samnuha Tights",
		feet = "Horos Toe Shoes +3"
	} -- 23 DW | sTP+44 | 15DA/21TA/2QA
	--15 DW Needed
	sets.TP.Standard.Haste_35 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Etoile Gorget +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Telos Earring", 
		body = "Horos Casaque +3", 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Samnuha Tights",
		feet = "Horos Toe Shoes +3"
	} -- 17 DW | sTP+44 | 15DA/21TA/2QA
	--7 DW Needed
	sets.TP.Standard.Haste_40 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Etoile Gorget +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Telos Earring", 
		body = "Horos Casaque +3",  
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",	
		back = Senuna.TP, 
		waist = "Reiki Yotai", --7
		legs = "Samnuha Tights",
		feet = "Horos Toe Shoes +3"
	} -- 7 DW | sTP+45 | 15DA/21TA/3QA
	--1 DW needed (dont go out of your way)
	sets.TP.Standard.Haste_45 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Etoile Gorget +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Telos Earring", 
		body = "Horos Casaque +3",  
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",	
		back = Senuna.TP, 
		waist = "Windbuffet Belt +1",
		legs = "Samnuha Tights",
		feet = "Horos Toe Shoes +3"
	} -- 0 DW | sTP+41 | 15DA/23TA/5QA

	sets.TP.DT = {}
	sets.TP.DT.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45"}
	--39 DW needed
	sets.TP.DT.Haste_0 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", -- 0/2/3 
		body = "Horos Casaque +3",  
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring", -- 0/0/10	
		back = Senuna.DW, -- 10/0/0
		waist = "Reiki Yotai", 
		legs = "Malignance Tights", -- 0/0/7
		feet = "Horos Toe Shoes +3" 
	} -- 37 DW | sTP+48 | 15DA/10TA/0QA | 10/2/26
	--37 DW Needed
	sets.TP.DT.Haste_5 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", -- 0/2/3 
		body = "Horos Casaque +3",  
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring", -- 0/0/10	
		back = Senuna.DW, -- 10/0/0
		waist = "Reiki Yotai", 
		legs = "Malignance Tights", -- 0/0/7
		feet = "Horos Toe Shoes +3" 
	} -- 37 DW | sTP+48 | 15DA/10TA/0QA | 10/2/26
	--35 DW Needed
	sets.TP.DT.Haste_10 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", -- 0/2/3 
		body = "Horos Casaque +3",  
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring", -- 0/0/10	
		back = Senuna.DW, -- 10/0/0
		waist = "Reiki Yotai", 
		legs = "Malignance Tights", -- 0/0/7
		feet = "Horos Toe Shoes +3"
	} -- 37 DW | sTP+48 | 15DA/10TA/0QA | 10/2/26
	--32 DW needed
	sets.TP.DT.Haste_15 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", -- 0/2/3 
		body = "Horos Casaque +3",  
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring", -- 0/0/10	
		back = Senuna.DW, -- 10/0/0
		waist = "Windbuffet Belt +1", 
		legs = "Malignance Tights", -- 0/0/7
		feet = "Horos Toe Shoes +3" 
	} -- 30 DW | sTP+44 | 15DA/10TA/0QA | 10/2/26
	--26 DW needed
	sets.TP.DT.Haste_20 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", -- 0/2/3 
		body = "Horos Casaque +3",  
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring", -- 0/0/10	
		back = Senuna.DW, -- 10/0/0
		waist = "Windbuffet Belt +1", 
		legs = "Malignance Tights", -- 0/0/7
		feet = "Horos Toe Shoes +3" 
	} -- 30 DW | sTP+44 | 15DA/14TA/0QA | 10/2/26
	--23 DW needed
	sets.TP.DT.Haste_25 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", 
		body = "Horos Casaque +3", 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring", -- 0/0/10		
		back = Senuna.TP, -- 10/0/0
		waist = "Reiki Yotai", 
		legs = "Malignance Tights", -- 0/0/7
		feet = "Horos Toe Shoes +3" -- 2/0/0
	} -- 23 DW | sTP+40 | 24DA/17TA/3QA	| 12/0/23
	--21 DW needed
	sets.TP.DT.Haste_30 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", 
		body = "Horos Casaque +3", 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring", -- 0/0/10		
		back = Senuna.TP, -- 10/0/0
		waist = "Reiki Yotai", 
		legs = "Malignance Tights", -- 0/0/7
		feet = "Horos Toe Shoes +3" -- 2/0/0
	} -- 23 DW | sTP+40 | 24DA/17TA/3QA	| 12/0/23
	--15 DW Needed
	sets.TP.DT.Haste_35 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", -- 0/2/3 
		body = "Horos Casaque +3",  
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Senuna.DW, -- 10/0/0
		waist = "Windbuffet Belt +1",
		legs = "Malignance Tights", -- 0/0/7
		feet = "Horos Toe Shoes +3" -- 2/0/0
	} -- 16 DW | sTP+41 | 15DA/23TA/5QA | 12/2/26
	--7 DW Needed
	sets.TP.DT.Haste_40 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", -- 0/2/3 
		body = "Horos Casaque +3", -- 9/0/0 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring", -- 0/0/10
		back = Senuna.TP, -- 10/0/0
		waist = "Reiki Yotai", 
		legs = "Malignance Tights", --0/0/7
		feet = "Horos Toe Shoes +3" -- 2/0/0
	} -- 7 DW | sTP+43 | 28DA/9TA/3QA | 21/2/26
	--1 DW needed (dont go out of your way)
	sets.TP.DT.Haste_45 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", -- 0/2/3 
		body = "Horos Casaque +3",
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring", -- 0/0/10
		back = Senuna.TP, -- 10/0/0
		waist = "Windbuffet Belt +1", 
		legs = "Malignance Tights", --0/0/7
		feet = "Horos Toe Shoes +3"
	} -- 0 DW | sTP+39 | 28DA/11TA/5QA | 21/2/26

	sets.TP.Evasion = {} -- Need to rework sets later
	sets.TP.Evasion.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45"}
	--39 DW needed
	sets.TP.Evasion.Haste_0 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Etoile Gorget +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", -- 0/2/3 
		body = "Maculele Casaque +1",  
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring", -- 0/0/10	
		back = Senuna.DW, -- 10/0/0
		waist = "Reiki Yotai", 
		legs = "Malignance Tights", -- 0/0/7
		feet = TaeonFeet.DW 
	} -- 37 DW | sTP+48 | 15DA/10TA/0QA | 10/2/26
	--37 DW Needed
	sets.TP.Evasion.Haste_5 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Etoile Gorget +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", -- 0/2/3 
		body = "Maculele Casaque +1",  
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring", -- 0/0/10	
		back = Senuna.DW, -- 10/0/0
		waist = "Reiki Yotai", 
		legs = "Malignance Tights", -- 0/0/7
		feet = TaeonFeet.DW 
	} -- 37 DW | sTP+48 | 15DA/10TA/0QA | 10/2/26
	--35 DW Needed
	sets.TP.Evasion.Haste_10 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Etoile Gorget +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", -- 0/2/3 
		body = "Maculele Casaque +1",  
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring", -- 0/0/10	
		back = Senuna.DW, -- 10/0/0
		waist = "Reiki Yotai", 
		legs = "Malignance Tights", -- 0/0/7
		feet = TaeonFeet.DW 
	} -- 37 DW | sTP+48 | 15DA/10TA/0QA | 10/2/26
	--32 DW needed
	sets.TP.Evasion.Haste_15 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Etoile Gorget +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", -- 0/2/3 
		body = "Maculele Casaque +1",  
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring", -- 0/0/10	
		back = Senuna.DW, -- 10/0/0
		waist = "Windbuffet Belt +1", 
		legs = "Malignance Tights", -- 0/0/7
		feet = TaeonFeet.DW 
	} -- 30 DW | sTP+44 | 15DA/10TA/0QA | 10/2/26
	--26 DW needed
	sets.TP.Evasion.Haste_20 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Etoile Gorget +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", -- 0/2/3 
		body = AdhemarBody.TP,  
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring", -- 0/0/10	
		back = Senuna.DW, -- 10/0/0
		waist = "Windbuffet Belt +1", 
		legs = "Malignance Tights", -- 0/0/7
		feet = TaeonFeet.DW 
	} -- 30 DW | sTP+44 | 15DA/14TA/0QA | 10/2/26
	--23 DW needed
	sets.TP.Evasion.Haste_25 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Etoile Gorget +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", 
		body = "Maculele Casaque +1", 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring", -- 0/0/10		
		back = Senuna.TP, -- 10/0/0
		waist = "Reiki Yotai", 
		legs = "Malignance Tights", -- 0/0/7
		feet = HercFeet.TP -- 2/0/0
	} -- 23 DW | sTP+40 | 24DA/17TA/3QA	| 12/0/23
	--21 DW needed
	sets.TP.Evasion.Haste_30 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Etoile Gorget +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", 
		body = "Maculele Casaque +1", 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring", -- 0/0/10		
		back = Senuna.TP, -- 10/0/0
		waist = "Reiki Yotai", 
		legs = "Malignance Tights", -- 0/0/7
		feet = HercFeet.TP -- 2/0/0
	} -- 23 DW | sTP+40 | 24DA/17TA/3QA	| 12/0/23
	--15 DW Needed
	sets.TP.Evasion.Haste_35 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Etoile Gorget +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", -- 0/2/3 
		body = AdhemarBody.TP,  
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Senuna.DW, -- 10/0/0
		waist = "Windbuffet Belt +1",
		legs = "Malignance Tights", -- 0/0/7
		feet = HercFeet.TP -- 2/0/0
	} -- 16 DW | sTP+41 | 15DA/23TA/5QA | 12/2/26
	--7 DW Needed
	sets.TP.Evasion.Haste_40 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Etoile Gorget +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", -- 0/2/3 
		body = "Gleti's Cuirass", -- 9/0/0 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring", -- 0/0/10
		back = Senuna.TP, -- 10/0/0
		waist = "Reiki Yotai", 
		legs = "Malignance Tights", --0/0/7
		feet = HercFeet.TP -- 2/0/0
	} -- 7 DW | sTP+43 | 28DA/9TA/3QA | 21/2/26
	--1 DW needed (dont go out of your way)
	sets.TP.Evasion.Haste_45 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Etoile Gorget +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", -- 0/2/3 
		body = "Gleti's Cuirass", -- 9/0/0 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring", -- 0/0/10
		back = Senuna.TP, -- 10/0/0
		waist = "Windbuffet Belt +1", 
		legs = "Malignance Tights", --0/0/7
		feet = HercFeet.TP -- 2/0/0
	} -- 0 DW | sTP+39 | 28DA/11TA/5QA | 21/2/26


	--TP Sets (tank)--
	sets.Tank = {}
	sets.Tank.index = {"Standard", "DT", "Evasion", "Inquartata"}
	Tank_ind = 1

	sets.Tank.Standard = {}
	sets.Tank.Standard.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45"}
	--39 DW needed
	sets.Tank.Standard.Haste_0 = {
		ammo = "Coiste Bodhar",
		head = "Maxixi Tiara +2", --4
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", --4 
		body = "Horos Casaque +3",  
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Malignance Boots"
	} -- 25 DW | sTP+48 | 15DA/15TA/0QA
	--37 DW Needed
	sets.Tank.Standard.Haste_5 = {
		ammo = "Coiste Bodhar",
		head = "Maxixi Tiara +2", --4
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", --4 
		body = "Horos Casaque +3",  
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Malignance Boots"
	} -- 25 DW | sTP+48 | 15DA/15TA/0QA
	--35 DW Needed
	sets.Tank.Standard.Haste_10 = {
		ammo = "Coiste Bodhar",
		head = "Maxixi Tiara +2", --4
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", --4 
		body = "Horos Casaque +3",  
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Malignance Boots"
	} -- 25 DW | sTP+48 | 15DA/15TA/0QA
	--32 DW needed
	sets.Tank.Standard.Haste_15 = {
		ammo = "Coiste Bodhar",
		head = "Maxixi Tiara +2", --4
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", --4 
		body = "Horos Casaque +3",  
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Malignance Boots"
	} -- 25 DW | sTP+48 | 15DA/15TA/0QA
	--26 DW needed
	sets.Tank.Standard.Haste_20 = {
		ammo = "Coiste Bodhar",
		head = "Maxixi Tiara +2", --4
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", --4 
		body = "Horos Casaque +3",  
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Malignance Boots"
	} -- 25 DW | sTP+48 | 15DA/15TA/0QA
	--23 DW needed
	sets.Tank.Standard.Haste_25 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", --4 
		body = "Horos Casaque +3",  
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Malignance Boots"
	} -- 21 DW | sTP+48 | 15DA/15TA/0QA
	--21 DW needed
	sets.Tank.Standard.Haste_30 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", --4 
		body = "Horos Casaque +3",  
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Malignance Boots"
	} -- 21 DW | sTP+48 | 15DA/15TA/0QA
	--15 DW Needed
	sets.Tank.Standard.Haste_35 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Horos Casaque +3",  
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Malignance Boots"
	} -- 17 DW | sTP+48 | 15DA/15TA/0QA
	--7 DW Needed
	sets.Tank.Standard.Haste_40 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Horos Casaque +3",  
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.TP, 
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 7 DW | sTP+48 | 15DA/15TA/0QA
	--1 DW needed (dont go out of your way)
	sets.Tank.Standard.Haste_45 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Gleti's Cuirass",  
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.TP, 
		waist = "Windbuffet Belt +1",
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 0 DW | sTP+41 | 15DA/23TA/5QA

	sets.Tank.DT = {}
	sets.Tank.DT.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45"}
	--39 DW needed
	sets.Tank.DT.Haste_0 = {
		ammo = "Coiste Bodhar",
		head = "Maxixi Tiara +2", --4
		neck = "Unmoving Collar +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", --4 
		body = "Gleti's Cuirass", 
		hands = "Horos Bangles +3", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 25 DW | sTP+48 | 15DA/15TA/0QA
	--37 DW Needed
	sets.Tank.DT.Haste_5 = {
		ammo = "Coiste Bodhar",
		head = "Maxixi Tiara +2", --4
		neck = "Unmoving Collar +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", --4 
		body = "Gleti's Cuirass", 
		hands = "Horos Bangles +3", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 25 DW | sTP+48 | 15DA/15TA/0QA
	--35 DW Needed
	sets.Tank.DT.Haste_10 = {
		ammo = "Coiste Bodhar",
		head = "Maxixi Tiara +2", --4
		neck = "Unmoving Collar +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", --4 
		body = "Gleti's Cuirass", 
		hands = "Horos Bangles +3", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 25 DW | sTP+48 | 15DA/15TA/0QA
	--32 DW needed
	sets.Tank.DT.Haste_15 = {
		ammo = "Coiste Bodhar",
		head = "Maxixi Tiara +2", --4
		neck = "Unmoving Collar +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", --4 
		body = "Gleti's Cuirass", 
		hands = "Horos Bangles +3", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 25 DW | sTP+48 | 15DA/15TA/0QA
	--26 DW needed
	sets.Tank.DT.Haste_20 = {
		ammo = "Coiste Bodhar",
		head = "Maxixi Tiara +2", --4
		neck = "Unmoving Collar +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", --4 
		body = "Gleti's Cuirass", 
		hands = "Horos Bangles +3", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 25 DW | sTP+48 | 15DA/15TA/0QA
	--23 DW needed
	sets.Tank.DT.Haste_25 = {
		ammo = "Coiste Bodhar",
		head = "Maxixi Tiara +2", --4
		neck = "Unmoving Collar +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", --4 
		body = "Gleti's Cuirass", 
		hands = "Horos Bangles +3", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 25 DW | sTP+48 | 15DA/15TA/0QA
	--21 DW needed
	sets.Tank.DT.Haste_30 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Unmoving Collar +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", --4 
		body = "Gleti's Cuirass", 
		hands = "Horos Bangles +3", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 21 DW | sTP+48 | 15DA/15TA/0QA
	--15 DW Needed
	sets.Tank.DT.Haste_35 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Unmoving Collar +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1",
		body = "Gleti's Cuirass", 
		hands = "Horos Bangles +3", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 17 DW | sTP+48 | 15DA/15TA/0QA
	--7 DW Needed
	sets.Tank.DT.Haste_40 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Unmoving Collar +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1",
		body = "Gleti's Cuirass", 
		hands = "Horos Bangles +3", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.TP,
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 7 DW | sTP+48 | 15DA/15TA/0QA
	--1 DW needed (dont go out of your way)
	sets.Tank.DT.Haste_45 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Unmoving Collar +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1",
		body = "Gleti's Cuirass", 
		hands = "Horos Bangles +3", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.TP,
		waist = "Windbuffet Belt +1",
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 0 DW | sTP+48 | 15DA/15TA/0QA
	
	--I recommend for Tier 2 merits in this set:
	-- -- 5/5 Fan Dance
	-- -- 5/5 Closed position
	sets.Tank.Evasion = {} 
	sets.Tank.Evasion.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45"}
	--39 DW needed
	sets.Tank.Evasion.Haste_0 = {
		ammo = "Yamarang",
		head = "Malignance Chapeau",
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", 
		body = "Malignance Tabard", 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 21 DW | sTP+48 | 15DA/15TA/0QA
	--37 DW Needed
	sets.Tank.Evasion.Haste_5 = {
		ammo = "Yamarang",
		head = "Malignance Chapeau",
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", 
		body = "Malignance Tabard", 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 21 DW | sTP+48 | 15DA/15TA/0QA
	--35 DW Needed
	sets.Tank.Evasion.Haste_10 = {
		ammo = "Yamarang",
		head = "Malignance Chapeau",
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", 
		body = "Malignance Tabard", 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 21 DW | sTP+48 | 15DA/15TA/0QA
	--32 DW needed
	sets.Tank.Evasion.Haste_15 = {
		ammo = "Yamarang",
		head = "Malignance Chapeau",
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", 
		body = "Malignance Tabard", 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 21 DW | sTP+48 | 15DA/15TA/0QA
	--26 DW needed
	sets.Tank.Evasion.Haste_20 = {
		ammo = "Yamarang",
		head = "Malignance Chapeau",
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", 
		body = "Malignance Tabard", 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 21 DW | sTP+48 | 15DA/15TA/0QA
	--23 DW needed
	sets.Tank.Evasion.Haste_25 = {
		ammo = "Yamarang",
		head = "Malignance Chapeau",
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", 
		body = "Malignance Tabard", 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 21 DW | sTP+48 | 15DA/15TA/0QA
	--21 DW needed
	sets.Tank.Evasion.Haste_30 = {
		ammo = "Yamarang",
		head = "Malignance Chapeau",
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", 
		body = "Malignance Tabard", 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 21 DW | sTP+48 | 15DA/15TA/0QA
	--15 DW Needed
	sets.Tank.Evasion.Haste_35 = {
		ammo = "Yamarang",
		head = "Malignance Chapeau",
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", 
		body = "Malignance Tabard", 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Sveltesse Gouriz +1",
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 14 DW | sTP+48 | 15DA/15TA/0QA
	--7 DW Needed
	sets.Tank.Evasion.Haste_40 = {
		ammo = "Yamarang",
		head = "Malignance Chapeau",
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", 
		body = "Malignance Tabard", 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.Eva,
		waist = "Sveltesse Gouriz +1",
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 4 DW | sTP+48 | 15DA/15TA/0QA
	--1 DW needed (dont go out of your way)
	sets.Tank.Evasion.Haste_45 = {
		ammo = "Yamarang",
		head = "Malignance Chapeau",
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", 
		body = "Malignance Tabard", 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.Eva,
		waist = "Sveltesse Gouriz +1",
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 4 DW | sTP+48 | 15DA/15TA/0QA
	
	sets.Tank.Inquartata = {} 
	sets.Tank.Inquartata.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45"}
	--39 DW needed
	sets.Tank.Inquartata.Haste_0 = {
		ammo = "Staunch Tathlum +1",
		head = "Malignance Chapeau",
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", --4
		body = "Gleti's Cuirass", 
		hands = "Turms Mittens +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Turms Leggings +1"
	} -- 21 DW | sTP+48 | 15DA/15TA/0QA
	--37 DW Needed
	sets.Tank.Inquartata.Haste_5 = {
		ammo = "Staunch Tathlum +1",
		head = "Malignance Chapeau",
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", --4
		body = "Gleti's Cuirass", 
		hands = "Turms Mittens +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Turms Leggings +1"
	} -- 21 DW | sTP+48 | 15DA/15TA/0QA
	--35 DW Needed
	sets.Tank.Inquartata.Haste_10 = {
		ammo = "Staunch Tathlum +1",
		head = "Malignance Chapeau",
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", --4
		body = "Gleti's Cuirass", 
		hands = "Turms Mittens +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Turms Leggings +1"
	} -- 21 DW | sTP+48 | 15DA/15TA/0QA
	--32 DW needed
	sets.Tank.Inquartata.Haste_15 = {
		ammo = "Staunch Tathlum +1",
		head = "Malignance Chapeau",
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", --4
		body = "Gleti's Cuirass", 
		hands = "Turms Mittens +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Turms Leggings +1"
	} -- 21 DW | sTP+48 | 15DA/15TA/0QA
	--26 DW needed
	sets.Tank.Inquartata.Haste_20 = {
		ammo = "Staunch Tathlum +1",
		head = "Malignance Chapeau",
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", --4
		body = "Gleti's Cuirass", 
		hands = "Turms Mittens +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Turms Leggings +1"
	} -- 21 DW | sTP+48 | 15DA/15TA/0QA
	--23 DW needed
	sets.Tank.Inquartata.Haste_25 = {
		ammo = "Staunch Tathlum +1",
		head = "Malignance Chapeau",
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", --4
		body = "Gleti's Cuirass", 
		hands = "Turms Mittens +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Turms Leggings +1"
	} -- 21 DW | sTP+48 | 15DA/15TA/0QA
	--21 DW needed
	sets.Tank.Inquartata.Haste_30 = {
		ammo = "Staunch Tathlum +1",
		head = "Malignance Chapeau",
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", --4
		body = "Gleti's Cuirass", 
		hands = "Turms Mittens +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Turms Leggings +1"
	} -- 21 DW | sTP+48 | 15DA/15TA/0QA
	--15 DW Needed
	sets.Tank.Inquartata.Haste_35 = {
		ammo = "Staunch Tathlum +1",
		head = "Malignance Chapeau",
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", --4
		body = "Gleti's Cuirass", 
		hands = "Turms Mittens +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.TP,
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Turms Leggings +1"
	} -- 11 DW | sTP+48 | 15DA/15TA/0QA
	--7 DW Needed
	sets.Tank.Inquartata.Haste_40 = {
		ammo = "Staunch Tathlum +1",
		head = "Malignance Chapeau",
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", --4
		body = "Gleti's Cuirass", 
		hands = "Turms Mittens +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.TP,
		waist = "Windbuffet Belt +1",
		legs = "Malignance Tights",
		feet = "Turms Leggings +1"
	} -- 4 DW | sTP+48 | 15DA/15TA/0QA
	--1 DW needed (dont go out of your way)
	sets.Tank.Inquartata.Haste_45 = {
		ammo = "Staunch Tathlum +1",
		head = "Malignance Chapeau",
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Eabani Earring", --4
		body = "Gleti's Cuirass", 
		hands = "Turms Mittens +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.TP,
		waist = "Windbuffet Belt +1",
		legs = "Malignance Tights",
		feet = "Turms Leggings +1"
	} -- 4 DW | sTP+48 | 15DA/15TA/0QA
	
	
	--CP Sets (tank)--
	--For Tank Mode when Closed Position is active (Face to Face with target)
	sets.CP_Tank = {}
	sets.CP_Tank.index = {"Standard", "DT", "Evasion", "Inquartata"}

	sets.CP_Tank.Standard = {}
	sets.CP_Tank.Standard.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45"}
	--39 DW needed
	sets.CP_Tank.Standard.Haste_0 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Maculele Casaque +1", --11 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = TaeonFeet.DW --9
	} -- 37 DW | sTP+48 | 15DA/15TA/0QA
	--37 DW Needed
	sets.CP_Tank.Standard.Haste_5 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Warder's Charm +1",  
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Maculele Casaque +1", --11 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = TaeonFeet.DW --9
	} -- 37 DW | sTP+48 | 15DA/15TA/0QA
	--35 DW Needed
	sets.CP_Tank.Standard.Haste_10 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Warder's Charm +1",  
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Maculele Casaque +1", --11 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = TaeonFeet.DW --9
	} -- 37 DW | sTP+48 | 15DA/15TA/0QA	
	--32 DW needed
	sets.CP_Tank.Standard.Haste_15 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Maculele Casaque +1", --11 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Carrier's Sash",
		legs = "Malignance Tights",
		feet = TaeonFeet.DW --9
	} -- 30 DW | sTP+44 | 15DA/17TA/2QA
	--26 DW needed
	sets.CP_Tank.Standard.Haste_20 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = AdhemarBody.TP, --6 
		hands = "Malignance Gloves",  
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Carrier's Sash",
		legs = "Malignance Tights",
		feet = TaeonFeet.DW --9
	} -- 25 DW | sTP+44 | 15DA/21TA/2QA
	--23 DW needed
	sets.CP_Tank.Standard.Haste_25 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", --5 
		body = "Maculele Casaque +1", --11 
		hands = "Malignance Gloves",  
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.TP,
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 23 DW | sTP+40 | 24DA/17TA/3QA	
	--21 DW needed
	sets.CP_Tank.Standard.Haste_30 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Warder's Charm +1",  
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Maculele Casaque +1", --11 
		hands = "Malignance Gloves",  
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Carrier's Sash",
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 21 DW | sTP+41 | 15DA/19TA/5QA
	--15 DW Needed
	sets.CP_Tank.Standard.Haste_35 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = AdhemarBody.TP, --6 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Carrier's Sash",
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 16 DW | sTP+41 | 15DA/23TA/5QA
	--7 DW Needed
	sets.CP_Tank.Standard.Haste_40 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Gleti's Cuirass",  
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.TP, 
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 7 DW | sTP+45 | 15DA/21TA/3QA
	--1 DW needed (dont go out of your way)
	sets.CP_Tank.Standard.Haste_45 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Gleti's Cuirass",  
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.TP, 
		waist = "Carrier's Sash",
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 0 DW | sTP+41 | 15DA/23TA/5QA

	sets.CP_Tank.DT = {}
	sets.CP_Tank.DT.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45"}
	--39 DW needed
	sets.CP_Tank.DT.Haste_0 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Unmoving Collar +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Maculele Casaque +1", --11 
		hands = "Horos Bangles +3", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = TaeonFeet.DW --9
	} -- 37 DW | sTP+48 | 15DA/15TA/0QA
	--37 DW Needed
	sets.CP_Tank.DT.Haste_5 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Unmoving Collar +1",  
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Maculele Casaque +1", --11 
		hands = "Horos Bangles +3", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = TaeonFeet.DW --9
	} -- 37 DW | sTP+48 | 15DA/15TA/0QA
	--35 DW Needed
	sets.CP_Tank.DT.Haste_10 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Unmoving Collar +1",  
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Maculele Casaque +1", --11 
		hands = "Horos Bangles +3", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = TaeonFeet.DW --9
	} -- 37 DW | sTP+48 | 15DA/15TA/0QA	
	--32 DW needed
	sets.CP_Tank.DT.Haste_15 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Unmoving Collar +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Maculele Casaque +1", --11 
		hands = "Horos Bangles +3", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Windbuffet Belt +1",
		legs = "Malignance Tights",
		feet = TaeonFeet.DW --9
	} -- 30 DW | sTP+44 | 15DA/17TA/2QA
	--26 DW needed
	sets.CP_Tank.DT.Haste_20 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Unmoving Collar +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = AdhemarBody.TP, --6 
		hands = "Horos Bangles +3",  
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Windbuffet Belt +1",
		legs = "Malignance Tights",
		feet = TaeonFeet.DW --9
	} -- 25 DW | sTP+44 | 15DA/21TA/2QA
	--23 DW needed
	sets.CP_Tank.DT.Haste_25 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Unmoving Collar +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", --5 
		body = "Maculele Casaque +1", --11 
		hands = "Horos Bangles +3",  
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.TP,
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 23 DW | sTP+40 | 24DA/17TA/3QA	
	--21 DW needed
	sets.CP_Tank.DT.Haste_30 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Unmoving Collar +1",  
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Maculele Casaque +1", --11 
		hands = "Horos Bangles +3",  
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Windbuffet Belt +1",
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 21 DW | sTP+41 | 15DA/19TA/5QA
	--15 DW Needed
	sets.CP_Tank.DT.Haste_35 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Unmoving Collar +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = AdhemarBody.TP, --6 
		hands = "Horos Bangles +3", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Windbuffet Belt +1",
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 16 DW | sTP+41 | 15DA/23TA/5QA
	--7 DW Needed
	sets.CP_Tank.DT.Haste_40 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Unmoving Collar +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Gleti's Cuirass",  
		hands = "Horos Bangles +3", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.TP, 
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 7 DW | sTP+45 | 15DA/21TA/3QA
	--1 DW needed (dont go out of your way)
	sets.CP_Tank.DT.Haste_45 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Unmoving Collar +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Gleti's Cuirass",  
		hands = "Horos Bangles +3", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.TP, 
		waist = "Windbuffet Belt +1",
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 0 DW | sTP+41 | 15DA/23TA/5QA
	
	--I recommend for Tier 2 merits in this set:
	-- -- 5/5 Fan Dance
	-- -- 5/5 Closed position
	sets.CP_Tank.Evasion = {} 
	sets.CP_Tank.Evasion.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45"}
	--39 DW needed
	sets.CP_Tank.Evasion.Haste_0 = {
		ammo = "Yamarang",
		head = "Malignance Chapeau",
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Maculele Casaque +1", --11 
		hands = "Horos Bangles +3", 
		ring1 = "Moonbeam Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = TaeonFeet.DW --9
	} -- 37 DW | sTP+48 | 15DA/15TA/0QA
	--37 DW Needed
	sets.CP_Tank.Evasion.Haste_5 = {
		ammo = "Yamarang",
		head = "Malignance Chapeau",
		neck = "Bathy Choker +1",  
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Maculele Casaque +1", --11 
		hands = "Horos Bangles +3", 
		ring1 = "Moonbeam Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = TaeonFeet.DW --9
	} -- 37 DW | sTP+48 | 15DA/15TA/0QA
	--35 DW Needed
	sets.CP_Tank.Evasion.Haste_10 = {
		ammo = "Yamarang",
		head = "Malignance Chapeau",
		neck = "Bathy Choker +1",  
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Maculele Casaque +1", --11 
		hands = "Horos Bangles +3", 
		ring1 = "Moonbeam Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = TaeonFeet.DW --9
	} -- 37 DW | sTP+48 | 15DA/15TA/0QA	
	--32 DW needed
	sets.CP_Tank.Evasion.Haste_15 = {
		ammo = "Yamarang",
		head = "Malignance Chapeau",
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Maculele Casaque +1", --11 
		hands = "Horos Bangles +3", 
		ring1 = "Moonbeam Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Sveltesse Gouriz +1",
		legs = "Malignance Tights",
		feet = TaeonFeet.DW --9
	} -- 30 DW | sTP+44 | 15DA/17TA/2QA
	--26 DW needed
	sets.CP_Tank.Evasion.Haste_20 = {
		ammo = "Yamarang",
		head = "Malignance Chapeau",
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = AdhemarBody.TP, --6 
		hands = "Horos Bangles +3",  
		ring1 = "Moonbeam Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Sveltesse Gouriz +1",
		legs = "Malignance Tights",
		feet = TaeonFeet.DW --9
	} -- 25 DW | sTP+44 | 15DA/21TA/2QA
	--23 DW needed
	sets.CP_Tank.Evasion.Haste_25 = {
		ammo = "Yamarang",
		head = "Malignance Chapeau",
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", --5 
		body = "Maculele Casaque +1", --11 
		hands = "Horos Bangles +3",  
		ring1 = "Moonbeam Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.Eva,
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 23 DW | sTP+40 | 24DA/17TA/3QA	
	--21 DW needed
	sets.CP_Tank.Evasion.Haste_30 = {
		ammo = "Yamarang",
		head = "Malignance Chapeau",
		neck = "Bathy Choker +1",  
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Maculele Casaque +1", --11 
		hands = "Horos Bangles +3",  
		ring1 = "Moonbeam Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Sveltesse Gouriz +1",
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 21 DW | sTP+41 | 15DA/19TA/5QA
	--15 DW Needed
	sets.CP_Tank.Evasion.Haste_35 = {
		ammo = "Yamarang",
		head = "Malignance Chapeau",
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = AdhemarBody.TP, --6 
		hands = "Horos Bangles +3", 
		ring1 = "Moonbeam Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Sveltesse Gouriz +1",
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 16 DW | sTP+41 | 15DA/23TA/5QA
	--7 DW Needed
	sets.CP_Tank.Evasion.Haste_40 = {
		ammo = "Yamarang",
		head = "Malignance Chapeau",
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Gleti's Cuirass",  
		hands = "Horos Bangles +3", 
		ring1 = "Moonbeam Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.Eva, 
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 7 DW | sTP+45 | 15DA/21TA/3QA
	--1 DW needed (dont go out of your way)
	sets.CP_Tank.Evasion.Haste_45 = {
		ammo = "Yamarang",
		head = "Malignance Chapeau",
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Gleti's Cuirass",  
		hands = "Horos Bangles +3", 
		ring1 = "Moonbeam Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.Eva, 
		waist = "Sveltesse Gouriz +1",
		legs = "Malignance Tights",
		feet = "Horos Toe Shoes +3"
	} -- 0 DW | sTP+41 | 15DA/23TA/5QA
	
	sets.CP_Tank.Inquartata = {} 
	sets.CP_Tank.Inquartata.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45"}
	--39 DW needed
	sets.CP_Tank.Inquartata.Haste_0 = {
		ammo = "Yamarang",
		head = "Malignance Chapeau",
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Maculele Casaque +1", --11 
		hands = "Turms Mittens +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = TaeonFeet.DW --9
	} -- 37 DW | sTP+48 | 15DA/15TA/0QA
	--37 DW Needed
	sets.CP_Tank.Inquartata.Haste_5 = {
		ammo = "Yamarang",
		head = "Malignance Chapeau",
		neck = "Bathy Choker +1",  
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Maculele Casaque +1", --11 
		hands = "Turms Mittens +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = TaeonFeet.DW --9
	} -- 37 DW | sTP+48 | 15DA/15TA/0QA
	--35 DW Needed
	sets.CP_Tank.Inquartata.Haste_10 = {
		ammo = "Yamarang",
		head = "Malignance Chapeau",
		neck = "Bathy Choker +1",  
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Maculele Casaque +1", --11 
		hands = "Turms Mittens +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = TaeonFeet.DW --9
	} -- 37 DW | sTP+48 | 15DA/15TA/0QA	
	--32 DW needed
	sets.CP_Tank.Inquartata.Haste_15 = {
		ammo = "Yamarang",
		head = "Malignance Chapeau",
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Maculele Casaque +1", --11 
		hands = "Turms Mittens +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Sveltesse Gouriz +1",
		legs = "Malignance Tights",
		feet = TaeonFeet.DW --9
	} -- 30 DW | sTP+44 | 15DA/17TA/2QA
	--26 DW needed
	sets.CP_Tank.Inquartata.Haste_20 = {
		ammo = "Yamarang",
		head = "Malignance Chapeau",
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = AdhemarBody.TP, --6 
		hands = "Turms Mittens +1",  
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Sveltesse Gouriz +1",
		legs = "Malignance Tights",
		feet = TaeonFeet.DW --9
	} -- 25 DW | sTP+44 | 15DA/21TA/2QA
	--23 DW needed
	sets.CP_Tank.Inquartata.Haste_25 = {
		ammo = "Yamarang",
		head = "Malignance Chapeau",
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", --5 
		body = "Maculele Casaque +1", --11 
		hands = "Turms Mittens +1",  
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.Eva,
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Turms Leggings +1"
	} -- 23 DW | sTP+40 | 24DA/17TA/3QA	
	--21 DW needed
	sets.CP_Tank.Inquartata.Haste_30 = {
		ammo = "Yamarang",
		head = "Malignance Chapeau",
		neck = "Bathy Choker +1",  
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Maculele Casaque +1", --11 
		hands = "Turms Mittens +1",  
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Sveltesse Gouriz +1",
		legs = "Malignance Tights",
		feet = "Turms Leggings +1"
	} -- 21 DW | sTP+41 | 15DA/19TA/5QA
	--15 DW Needed
	sets.CP_Tank.Inquartata.Haste_35 = {
		ammo = "Yamarang",
		head = "Malignance Chapeau",
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = AdhemarBody.TP, --6 
		hands = "Turms Mittens +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.DW, --10
		waist = "Sveltesse Gouriz +1",
		legs = "Malignance Tights",
		feet = "Turms Leggings +1"
	} -- 16 DW | sTP+41 | 15DA/23TA/5QA
	--7 DW Needed
	sets.CP_Tank.Inquartata.Haste_40 = {
		ammo = "Yamarang",
		head = "Malignance Chapeau",
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Gleti's Cuirass",  
		hands = "Turms Mittens +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.Eva, 
		waist = "Reiki Yotai", --7
		legs = "Malignance Tights",
		feet = "Turms Leggings +1"
	} -- 7 DW | sTP+45 | 15DA/21TA/3QA
	--1 DW needed (dont go out of your way)
	sets.CP_Tank.Inquartata.Haste_45 = {
		ammo = "Yamarang",
		head = "Malignance Chapeau",
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 
		body = "Gleti's Cuirass",  
		hands = "Turms Mittens +1", 
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.Eva, 
		waist = "Sveltesse Gouriz +1",
		legs = "Malignance Tights",
		feet = "Turms Leggings +1"
	} -- 0 DW | sTP+41 | 15DA/23TA/5QA	


	--TP Sets (H2H)--
	-- Martial Arts/gear traits reduce H2H base delay directly [delay caps at max(96, adjustedDelay x 0.2), not +96]
	-- Cannot cap delay reduction as NIN without /MNK (or something gross like blitzer's roll) 
	-- Good sets to have available, but won't make or break you
	sets.H2H = {} -- need to rework later
	sets.H2H.index = {"Standard", "DT", "Evasion"}

	sets.H2H.Standard = {
		ammo = "Coiste Bodhar",
		head = "Adhemar Bonnet +1", 
		neck = "Etoile Gorget +1", 
		ear1 = "Mache Earring +1", 
		ear2 = "Mache Earring +1", 		
		body = "Horos Casaque +3",
		hands = "Adhemar Wristbands +1",
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",	
		back = Senuna.TP, 
		waist = "Windbuffet Belt +1",	
		legs = "Samnuha Tights", 
		feet = "Horos Toe Shoes +3"
	} -- +39 M.Arts | 7DA/27TA/2QA | sTP+24
	sets.H2H.DT = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Etoile Gorget +1", 
		ear1 = "Mache Earring +1", 
		ear2 = "Mache Earring +1", 		
		body = "Gleti's Cuirass",
		hands = "Adhemar Wristbands +1",
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.TP, 
		waist = "Windbuffet Belt +1",	
		legs = "Malignance Tights", 
		feet = "Horos Toe Shoes +3"
	} -- +39 M.Arts | 17DA/12TA/2QA | sTP+62 | 19/0/23
	sets.H2H.Evasion = {
		ammo = "Yamarang",
		head = "Malignance Chapeau", 
		neck = "Etoile Gorget +1", 
		ear1 = "Mache Earring +1", 
		ear2 = "Mache Earring +1", 		
		body = "Malignance Tabard",
		hands = "Malignance Gloves",
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",	
		back = Senuna.Eva, 
		waist = "Sveltesse Gouriz +1",	
		legs = "Malignance Tights", 
		feet = "Horos Toe Shoes +3"
	} -- +39 M.Arts | 4DA/8TA/0QA | sTP+26 | 19/0/9 | Eva+774
	--Cannot toggle to this set, handled by tank_mode
	sets.H2H.Tank = {
		ammo = "Staunch Tathlum +1",
		head = "Malignance Chapeau", 
		neck = "Warder's Charm +1", 
		ear1 = "Mache Earring +1", 
		ear2 = "Mache Earring +1", 		
		body = "Gleti's Cuirass",
		hands = "Gleti's Gauntlets",
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.TP, 
		waist = "Windbuffet Belt +1",	
		legs = "Malignance Tights", 
		feet = "Horos Toe Shoes +3"
	} -- +39 M.Arts | 4DA/8TA/0QA | sTP+22 | 25/0/26
	--Cannot toggle to this set, handled by tank_mode
	sets.H2H.Tank_Fan_dance = {
		ammo = "Staunch Tathlum +1",
		head = "Malignance Chapeau", 
		neck = "Warder's Charm +1", 
		ear1 = "Mache Earring +1", 
		ear2 = "Mache Earring +1", 		
		body = "Gleti's Cuirass",
		hands = "Horos Bangles +3",
		ring1 = "Moonbeam Ring", 
		ring2 = "Defending Ring",	
		back = Senuna.TP, 
		waist = "Windbuffet Belt +1",	
		legs = "Malignance Tights", 
		feet = "Horos Toe Shoes +3"
	} -- +39 M.Arts | 4DA/8TA/0QA | sTP+22 | 19/0/30


	--Weaponskill Sets--
	sets.WS = {}
	sets.WS.index = {"Normal", "Attack", "AttackCapped"}
	WS_ind = 1	
	
	--For all sets assume you needfull TP Bonus gear
	--a later function handles optimization for TP thresholds
	

	--Dagger
	sets.Rudra = {}
	sets.Rudra.Normal = {
        ammo="Cath Palug Stone",
		head="Nyame Helm",
		neck="Etoile Gorget +1",
		ear1="Odr Earring",
		ear2="Moonshade Earring",
		body="Nyame Mail",
		hands=HercHands.WSD,
		ring1="Beithir Ring",
		ring2="Regal Ring",
		back=Senuna.DEX_WSD,
		waist="Grunfeld Rope",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.Rudra.Attack = {
        ammo="Cath Palug Stone",
		head="Nyame Helm",
		neck="Etoile Gorget +1",
		ear1="Odr Earring",
		ear2="Moonshade Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Ilabrat Ring",
		ring2="Regal Ring",
		back=Senuna.DEX_WSD,
		waist="Grunfeld Rope",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.Rudra.AttackCapped = {
        ammo="Cath Palug Stone",
		head="Nyame Helm",
		neck="Etoile Gorget +1",
		ear1="Odr Earring",
		ear2="Moonshade Earring",
		body="Gleti's Cuirass",
		hands=HercHands.WSD,
		ring1="Ilabrat Ring",
		ring2="Beithir Ring",
		back=Senuna.DEX_WSD,
		waist="Grunfeld Rope",
		legs="Nyame Flanchard",
		feet="Lustratio Leggings +1"
	}
	sets.Rudra.Clim = {
        ammo="Charis Feather",
		head="Maculele Tiara +1",
		neck="Etoile Gorget +1",
		ear1="Odr Earring",
		ear2="Moonshade Earring",
		body="Nyame Mail",
		hands=HercHands.WSD,
		ring1="Beithir Ring",
		ring2="Regal Ring",
		back=Senuna.DEX_WSD,
		waist="Grunfeld Rope",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}	
	
	sets.PyrrhicKleos = {}
	sets.PyrrhicKleos.Normal = {
        ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Mache Earring +1",
		body="Horos Casaque +3",
		hands="Adhemar Wristbands +1",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Senuna.STR_DA,
		waist="Fotia Belt",
		legs="Samnuha Tights",
		feet="Lustratio Leggings +1"
	}
	sets.PyrrhicKleos.Attack = {
        ammo="Coiste Bodhar",
		head="Horos Tiara +3",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Mache Earring +1",
		body="Horos Casaque +3",
		hands="Horos Bangles +3",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Senuna.STR_DA,
		waist="Fotia Belt",
		legs="Nyame Flanchard",
		feet="Lustratio Leggings +1"
	}
	sets.PyrrhicKleos.AttackCapped = {
        ammo="Crepuscular Pebble",
		head="Gleti's Mask",
		neck="Etoile Gorget +1",
		ear1="Sherida Earring",
		ear2="Mache Earring +1",
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Senuna.STR_DA,
		waist="Fotia Belt",
		legs="Gleti's Breeches",
		feet="Lustratio Leggings +1"
	}
	sets.PyrrhicKleos.Strike = {
        ammo="Crepuscular Pebble",
		head="Adhemar Bonnet +1",
		neck="Etoile Gorget +1",
		ear1="Sherida Earring",
		ear2="Mache Earring +1",
		body="Maculele Casaque +1",
		hands="Adhemar Wristbands +1",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Senuna.STR_DA,
		waist="Fotia Belt",
		legs="Samnuha Tights",
		feet="Lustratio Leggings +1"
	}

	sets.SharkBite = {}
	sets.SharkBite.Normal = {
        ammo="Cath Palug Stone",
		head="Nyame Helm",
		neck="Etoile Gorget +1",
		ear1="Odr Earring",
		ear2="Moonshade Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Ilabrat Ring",
		ring2="Regal Ring",
		back=Senuna.DEX_WSD,
		waist="Grunfeld Rope",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.SharkBite.Attack = {
        ammo="Cath Palug Stone",
		head="Nyame Helm",
		neck="Etoile Gorget +1",
		ear1="Odr Earring",
		ear2="Moonshade Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Ilabrat Ring",
		ring2="Regal Ring",
		back=Senuna.DEX_WSD,
		waist="Grunfeld Rope",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.SharkBite.AttackCapped = {
        ammo="Cath Palug Stone",
		head="Nyame Helm",
		neck="Etoile Gorget +1",
		ear1="Odr Earring",
		ear2="Moonshade Earring",
		body="Gleti's Cuirass",
		hands=HercHands.WSD,
		ring1="Ilabrat Ring",
		ring2="Beithir Ring",
		back=Senuna.DEX_WSD,
		waist="Grunfeld Rope",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.SharkBite.Clim = {
        ammo="Charis Feather",
		head="Maculele Tiara +1",
		neck="Etoile Gorget +1",
		ear1="Odr Earring",
		ear2="Moonshade Earring",
		body="Meghanada Cuirie +2",
		hands=HercHands.WSD,
		ring1="Beithir Ring",
		ring2="Regal Ring",
		back=Senuna.DEX_WSD,
		waist="Grunfeld Rope",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}	
	
	sets.Evisceration = {}
	sets.Evisceration.Normal = {
        ammo="Charis Feather",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Odr Earring",
		ear2="Moonshade Earring",
		body="Meghanada Cuirie +2",
		hands="Adhemar Wristbands +1",
		ring1="Epona's Ring",
		ring2="Gere Ring",
		back=Senuna.Crit,
		waist="Fotia Belt",
		legs="Samnuha Tights",
		feet="Gleti's Boots"
	}
	sets.Evisceration.Attack = {
        ammo="Charis Feather",
		head="Gleti's Mask",
		neck="Fotia Gorget",
		ear1="Odr Earring",
		ear2="Moonshade Earring",
		body="Meghanada Cuirie +2",
		hands="Gleti's Gauntlets",
		ring1="Ilabrat Ring",
		ring2="Gere Ring",
		back=Senuna.Crit,
		waist="Fotia Belt",
		legs="Gleti's Breeches",
		feet="Gleti's Boots"
	}
	sets.Evisceration.AttackCapped = {
        ammo="Charis Feather",
		head="Gleti's Mask",
		neck="Etoile Gorget +1",
		ear1="Odr Earring",
		ear2="Moonshade Earring",
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",
		ring1="Ilabrat Ring",
		ring2="Gere Ring",
		back=Senuna.Crit,
		waist="Fotia Belt",
		legs="Lustratio Leggings +1",
		feet="Gleti's Boots"
	}

	sets.DancingEdge = {}
	sets.DancingEdge.Normal = {
        ammo="Voluspa Tathlum",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Mache Earring +1",
		body="Horos Casaque +3",
		hands="Adhemar Wristbands +1",
		ring1="Epona's Ring",
		ring2="Regal Ring",
		back=Senuna.TP,
		waist="Fotia Belt",
		legs="Samnuha Tights",
		feet="Horos Toe Shoes +3"
	}
	sets.DancingEdge.Attack = {
        ammo="Voluspa Tathlum",
		head="Horos Tiara +3",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Mache Earring +1",
		body="Horos Casaque +3",
		hands="Horos Bangles +3",
		ring1="Ilabrat Ring",
		ring2="Regal Ring",
		back=Senuna.TP,
		waist="Fotia Belt",
		legs="Samnuha Tights",
		feet="Horos Toe Shoes +3"
	}
	sets.DancingEdge.AttackCapped = {
        ammo="Crepuscular Pebble",
		head="Adhemar Bonnet +1",
		neck="Etoile Gorget +1",
		ear1="Sherida Earring",
		ear2="Mache Earring +1",
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",
		ring1="Epona's Ring",
		ring2="Regal Ring",
		back=Senuna.STR_DA,
		waist="Fotia Belt",
		legs="Gleti's Breeches",
		feet="Horos Toe Shoes +3"
	}
	
	sets.AeolianEdge = {}
	--Higher MAcc set for MagWS
	sets.AeolianEdge.Normal = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
        ear2="Moonshade Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Metamorph Ring +1",
		ring2="Regal Ring",
		back=Senuna.TP,
		waist="Eschan Stone",
        legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	--MAcc set for MagWS
	sets.AeolianEdge.Attack = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
        ear2="Moonshade Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Metamorph Ring +1",
		ring2="Regal Ring",
		back=Senuna.TP,
		waist="Eschan Stone",
        legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.AeolianEdge.AttackCapped = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
        ear2="Moonshade Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Metamorph Ring +1",
		ring2="Regal Ring",
		back=Senuna.TP,
		waist="Eschan Stone",
        legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}


	--H2H (Finish converting seets to DNC later)
	sets.AsuranFists = {}
	sets.AsuranFists.Normal = {
		ammo="Voluspa Tathlum",
		head="Horos Tiara +3",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Telos Earring",
		body="Nyame Mail",
		hands=HercHands.WSD,
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Senuna.DEX_WSD,
		waist="Fotia Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.AsuranFists.Attack = {
		ammo="Voluspa Tathlum",
		head="Horos Tiara +3",
		neck="Fotia Gorget",
		ear1="Lugra Earring +1",
		ear2="Telos Earring",
		body="Horos Casaque +3",
		hands="Horos Bangles +3",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Senuna.DEX_WSD,
		waist="Fotia Belt",
		legs="Nyame Flanchard",
		feet="Horos Toe Shoes +3"
	}
	sets.AsuranFists.AttackCapped = {
		ammo="Voluspa Tathlum",
		head="Gleti's Mask",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Telos Earring",
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Senuna.DEX_WSD,
		waist="Fotia Belt",
		legs="Gleti's Breeches",
		feet="Gleti's Boots"
	}	
	
	sets.RagingFists = {}
	sets.RagingFists.Normal = {
		ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Horos Casaque +3",
		hands="Adhemar Wristbands +1",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Senuna.STR_DA,
		waist="Fotia Belt",
		legs="Samnuha Tights",
		feet="Gleti's Boots"
	}
	sets.RagingFists.Attack = {
		ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Horos Casaque +3",
		hands="Horos Bangles +3",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Senuna.STR_DA,
		waist="Fotia Belt",
		legs="Nyame Flanchard",
		feet="Horos Toe Shoes +3"
	}
	sets.RagingFists.AttackCapped = {
		ammo="Crepuscular Pebble",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Gleti's Cuirass",
		hands="Adhemar Wristbands +1",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Senuna.STR_DA,
		waist="Fotia Belt",
		legs="Gleti's Breeches",
		feet="Gleti's Boots"
	}	
	
	sets.Combo = {}
	sets.Combo.Normal = {
		ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Horos Casaque +3",
		hands="Adhemar Wristbands +1",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Senuna.STR_DA,
		waist="Fotia Belt",
		legs="Samnuha Tights",
		feet="Gleti's Boots"
	}
	sets.Combo.Attack = {
		ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Horos Casaque +3",
		hands="Horos Bangles +3",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Senuna.STR_DA,
		waist="Fotia Belt",
		legs="Nyame Flanchard",
		feet="Horos Toe Shoes +3"
	}
	sets.Combo.AttackCapped = {
		ammo="Crepuscular Pebble",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Gleti's Cuirass",
		hands="Adhemar Wristbands +1",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Senuna.STR_DA,
		waist="Fotia Belt",
		legs="Gleti's Breeches",
		feet="Gleti's Boots"
	}		

	--Should really just be geared to land stun
	sets.ShoulderTackle = {}
	sets.ShoulderTackle.Normal = {
        ammo="Voluspa Tathlum",
		head="Malignance Chapeau",
		neck="Etoile Gorget +1",
		ear1="Crepuscular Earring",
		ear2="Dignitary's Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Regal Ring",
		ring2="Etana Ring",
		back=Senuna.STR_DA,
		waist="Eschan Stone",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}
	sets.ShoulderTackle.Attack = {
        ammo="Voluspa Tathlum",
		head="Malignance Chapeau",
		neck="Etoile Gorget +1",
		ear1="Crepuscular Earring",
		ear2="Dignitary's Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Regal Ring",
		ring2="Etana Ring",
		back=Senuna.STR_DA,
		waist="Eschan Stone",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}
	sets.ShoulderTackle.AttackCapped = {
        ammo="Voluspa Tathlum",
		head="Malignance Chapeau",
		neck="Etoile Gorget +1",
		ear1="Crepuscular Earring",
		ear2="Dignitary's Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Regal Ring",
		ring2="Etana Ring",
		back=Senuna.STR_DA,
		waist="Eschan Stone",
		legs="Malignance Tights",
		feet="Malignance Boots"
	}
	
	sets.SpinningAttack = {}
	sets.SpinningAttack.Normal = {
		ammo="Voluspa Tathlum",
		head="Nyame Helm",
		neck="Republican Platinum Medal",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Senuna.STR_DA,
		waist="Sailfi Belt +1",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.SpinningAttack.Attack = {
		ammo="Voluspa Tathlum",
		head="Nyame Helm",
		neck="Republican Platinum Medal",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Senuna.STR_DA,
		waist="Sailfi Belt +1",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.SpinningAttack.AttackCapped = {
		ammo="Crepuscular Pebble",
		head="Nyame Helm",
		neck="Etoile Gorget +1",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Gere Ring",
		back=Senuna.STR_DA,
		waist="Sailfi Belt +1",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	
	
	sets.OtherWS = {}
	sets.OtherWS.Normal = {
        ammo="Cath Palug Stone",
		head="Nyame Helm",
		neck="Etoile Gorget +1",
		ear1="Odr Earring",
		ear2="Moonshade Earring",
		body="Nyame Mail",
		hands=HercHands.WSD,
		ring1="Ilabrat Ring",
		ring2="Regal Ring",
		back=Senuna.DEX_WSD,
		waist="Grunfeld Rope",
		legs="Lustratio Subligar +1",
		feet="Lustratio Leggings +1"
	}
	sets.OtherWS.Attack = {
        ammo="Cath Palug Stone",
		head="Nyame Helm",
		neck="Etoile Gorget +1",
		ear1="Odr Earring",
		ear2="Moonshade Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Ilabrat Ring",
		ring2="Regal Ring",
		back=Senuna.DEX_WSD,
		waist="Grunfeld Rope",
		legs="Nyame Flanchard",
		feet="Lustratio Leggings +1"
	}
	sets.OtherWS.AttackCapped = {
        ammo="Cath Palug Stone",
		head="Nyame Helm",
		neck="Etoile Gorget +1",
		ear1="Odr Earring",
		ear2="Moonshade Earring",
		body="Gleti's Cuirass",
		hands=HercHands.WSD,
		ring1="Ilabrat Ring",
		ring2="Beithir Ring",
		back=Senuna.DEX_WSD,
		waist="Grunfeld Rope",
		legs="Nyame Flanchard",
		feet="Lustratio Leggings +1"	
	}
	
	--Job Ability Sets--
	sets.Trance = {head = "Horos Tiara +3"}
	sets.Jig = {legs = "Horos Tights +3"}
	sets.Samba = {head = "Maxixi Tiara +2", back = Senuna.Eva}
	sets.NoFootRise = {body = "Horos Casaque +3"}
	
	
	sets.ReverseFlourish = {
		hands = "Maculele Bangles +1",
		back = "Toetapper Mantle"
	}
	
	sets.Step = {
        ammo="Cath Palug Stone",
		head="Maxixi Tiara +2",
		neck="Etoile Gorget +1",
		ear1="Crepuscular Earring",
		ear2="Telos Earring",
		body="Maxixi Casaque +3",
		hands="Maxixi Bangles +2",
		ring1="Ilabrat Ring",
		ring2="Regal Ring",
		back=Senuna.TP,
		waist="Eschan Stone",
		legs="Maxixi Tights +2",
		feet="Horos Toe Shoes +3"		
	}
	
	sets.FeatherStep = {
        ammo="Cath Palug Stone",
		head="Maxixi Tiara +2",
		neck="Etoile Gorget +1",
		ear1="Crepuscular Earring",
		ear2="Telos Earring",
		body="Maxixi Casaque +3",
		hands="Maxixi Bangles +2",
		ring1="Ilabrat Ring",
		ring2="Regal Ring",
		back=Senuna.TP,
		waist="Eschan Stone",
		legs="Maxixi Tights +2",
		feet="Maculele Toe Shoes +1"	
	}
	
	-- generic set used when specific weapons arent flagged
	-- no DT focus
	sets.Waltz ={
        ammo="Voluspa Tathlum",
		head="Anwig Salade",
		neck="Etoile Gorget +1",
		ear1="Sjofn Earring",
		ear2="Handler's Earring +1",
		body="Maxixi Casaque +3",
		hands="Horos Bangles +3",
		ring1="Carbuncle Ring",
		ring2="Metamorph Ring +1",
		back=Senuna.Waltz,
		waist="Flume Belt +1",
		legs="Dashing Subligar",
		feet="Horos Toe Shoes +3"
	}
	
	-- 8% waltz potency from main or sub weapon (Acrontica must be equipped)
	sets.Waltz.Acrontica = {
        ammo="Yamarang", --5
		head="Anwig Salade",
		neck="Etoile Gorget +1",
		ear1="Enchanter's Earring +1",
		ear2="Handler's Earring +1",
		body="Maxixi Casaque +3", --19
		hands="Horos Bangles +3",
		ring1="Carbuncle Ring",
		ring2="Metamorph Ring +1",
		back=Senuna.Waltz, --10
		waist="Engraved Belt",
		legs="Dashing Subligar", --10
		feet="Horos Toe Shoes +3"	
	}
	
	-- 10% waltz potency from main or sub weapon (Gleti's Knife must be equipped)
	sets.Waltz["Gleti's Knife"] ={
        ammo="Voluspa Tathlum",
		head="Anwig Salade",
		neck="Etoile Gorget +1",
		ear1="Enchanter's Earring +1",
		ear2="Handler's Earring +1",
		body="Maxixi Casaque +3", --19
		hands="Horos Bangles +3",
		ring1="Carbuncle Ring",
		ring2="Metamorph Ring +1",
		back=Senuna.Waltz, --10
		waist="Engraved Belt",
		legs="Dashing Subligar", --10
		feet="Horos Toe Shoes +3"	
	}
	
	-- 18% waltz potency from main and sub (BOTH Gleti's Knife and Acrontica must be equipped)
	sets.Waltz.GletiAcrontica ={
        ammo="Yamarang",
		head="Anwig Salade",
		neck="Etoile Gorget +1",
		ear1="Enchanter's Earring +1",
		ear2="Handler's Earring +1",
		body="Maxixi Casaque +3", --19
		hands="Horos Bangles +3",
		ring1="Carbuncle Ring",
		ring2="Metamorph Ring +1",
		back=Senuna.Eva,
		waist="Engraved Belt",
		legs="Dashing Subligar", --10
		feet="Horos Toe Shoes +3"
	}	
	
	-- Waltz sets for "Tank_mode"
	-- generic set used when specific weapons arent flagged
	-- DT focused set
	sets.Tank_Waltz ={
        ammo="Yamarang",
		head="Nyame Helm",
		neck="Etoile Gorget +1",
		ear1="Sjofn Earring",
		ear2="Odnowa Earring +1",
		body="Maxixi Casaque +3",
		hands="Horos Bangles +3",
		ring1="Metamorph Ring +1",
		ring2="Defending Ring",
		back=Senuna.Waltz,
		waist="Engraved Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}		
	
	-- 8% waltz potency from main or sub weapon (Acrontica must be equipped)
	-- set caps DT as well (assumes tanking or similar situations)
	-- intentionally does not use non-ilvl or low meva pieces
	sets.Tank_Waltz.Acrontica = {
        ammo="Yamarang",
		head="Nyame Helm",
		neck="Loricate Torque +1",
		ear1="Sjofn Earring",
		ear2="Handler's Earring +1",
		body="Maxixi Casaque +3",
		hands="Horos Bangles +3",
		ring1="Metamorph Ring +1",
		ring2="Defending Ring",
		back=Senuna.Waltz,
		waist="Engraved Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"	
	}
	
	-- 10% waltz potency from main or sub weapon (Gleti's Knife must be equipped)
	-- 40% DT
	sets.Tank_Waltz["Gleti's Knife"] ={
        ammo="Staunch Tathlum +1",
		head="Anwig Salade",
		neck="Loricate Torque +1",
		ear1="Sjofn Earring",
		ear2="Handler's Earring +1",
		body="Maxixi Casaque +3",
		hands="Horos Bangles +3",
		ring1="Metamorph Ring +1",
		ring2="Defending Ring",
		back=Senuna.Waltz,
		waist="Engraved Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	
	-- 18% waltz potency from main and sub (BOTH Gleti's Knife and Acrontica must be equipped)
	-- set caps DT as well (assumes tanking or similar situations)
	-- intentionally does not use non-ilvl or low meva pieces
	sets.Tank_Waltz.GletiAcrontica ={
        ammo="Yamarang",
		head="Nyame Helm",
		neck="Unmoving Collar +1",
		ear1="Enchanter's Earring +1",
		ear2="Handler's Earring +1",
		body="Maxixi Casaque +3",
		hands="Horos Bangles +3",
		ring1="Metamorph Ring +1",
		ring2="Defending Ring",
		back=Senuna.Waltz,
		waist="Engraved Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	
	-- Landing flourishes
	sets.MAcc = {
        ammo="Yamarang",
		head="Malignance Chapeau",
		neck="Etoile Gorget +1",
		ear1="Crepuscular Earring",
		ear2="Dignitary's Earring",
		body="Horos Casaque +3",
		hands="Malignance Gloves",
		ring1="Etana Ring",
		ring2="Metamorph Ring +1",
		back=Senuna.TP,
		waist="Eschan Stone",
		legs="Malignance Tights",
		feet="Malignance Boots"	
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
		back=Senuna.Eva, 
		waist="Flume Belt +1",
		legs=HercLegs.FC, --7
		feet=HercFeet.FC --7
	} -- +61% FC
	
	--This is here if you need it for Utsusemi
	sets.precast.NinjutsuFastCast = set_combine(sets.precast.FastCast, {
		--neck = "Magoraga Beads",
	}) 
	
	
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
		back=Senuna.Evz,
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
		ammo = "Staunch Tathlum +1", -- 0/0/3
		head = "Nyame Helm", -- 0/0/7
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring", 
		body = "Nyame Mail", -- 0/0/9
		hands = "Horos Bangles +3", 
		ring1 = "Sheltered Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Senuna.Eva,
		waist = "Engraved Belt",	
		legs = "Nyame Flanchard", -- 0/0/8
		feet = "Nyame Sollerets" -- 0/0/7 
	}
	
	sets.SafetyDance_tank_mode = {
		ammo = "Staunch Tathlum +1", -- 0/0/3
		head = "Nyame Helm", -- 0/0/7
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring", 
		body = "Nyame Mail", -- 0/0/9
		hands = "Horos Bangles +3", 
		ring1 = "Sheltered Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Senuna.Eva,
		waist = "Engraved Belt",	
		legs = "Nyame Flanchard", -- 0/0/8
		feet = "Nyame Sollerets" -- 0/0/7  
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
		back = Senuna.Eva, 
		waist = "Olympus Sash", 
		legs = HercLegs.Phalanx,
		feet = HercFeet.Phalanx
	}

	sets.Enmity = {
		ammo="Sapience Orb", -- 2
		head="Halitus Helm",
		neck="Unmoving Collar +1", -- 10
        ear1="Cryptic Earring", -- 4
        ear2="Trux Earring", -- 5
        body="Emet Harness +1", -- 10
		hands="Horos Bangles +3", -- 9
        ring1="Eihwaz Ring", -- 5
        ring2="Supershear Ring", -- 5
		back=Senuna.Eva, 
		waist="Trance Belt", -- 4
		legs="Zoar Subligar +1", -- 6
        feet="Ahosi Leggings" -- 7
	} -- +67

	sets.Swipe = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
        ear2="Moonshade Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Metamorph Ring +1",
		ring2="Regal Ring",
		back=Senuna.TP,
		waist="Eschan Stone",
        legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}

	sets.Swipe_MB = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
        ear2="Moonshade Earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Metamorph Ring +1",
		ring2="Regal Ring",
		back=Senuna.TP,
		waist="Eschan Stone",
        legs="Nyame Flanchard",
		feet="Nyame Sollerets"	
	} --28/5 
	
	-- Currently mapped to Kuriyami: Ichi casts to apply TH4
	sets.TH = {
		ammo = "Perfect Lucky Egg", --1
		head = "Volte Cap", --1
		hands = HercHands.TH, --2
		waist = "Chaac Belt" --1
	} -- +5
	
	sets.Kite = {
		feet = "Skadi's Jambeaux +1"
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
	TP_bonus_replacement_earring = "Ishvara Earring"
	TP_bonus_replacement_multiattack_earring = "Ishvara Earring"

	--Mapping--		
	Unusable_buff = {
		spell={'Charm','Mute','Omerta','Petrification','Silence','Sleep','Stun','Terror'},
		ability={'Amnesia','Charm','Impairment','Petrification','Sleep','Stun','Terror'}}	

	Enmity_actions = S{
		'Sentinel', 'Shield Bash', 'Souleater', 'Weapon Bash', 'Vallation', 'Swordplay', 
		'Pflug', 'Provoke', 'Stun', 'Flash', 'Animated Flourish'}
		
	Buff_spells = S{
		'Tonko: Ichi', 'Tonko: Ni', 'Monomi: Ichi', 'Myoshu: Ichi', 'Kakka: Ichi', 'Gekka: Ichi', 'Yain: Ichi'}
		
	Utsusemi_spells = S{
		'Utsusemi: Ichi', 'Utsusemi: Ni', 'Utsusemi: San'}
		
	Sambas = S{
		'Haste Samba', 'Drain Samba', 'Drain Samba II', 'Drain Samba III', 'Aspir Samba', 'Aspir Samba II'}
		
	Steps = S{
		"Box Step", "Feather Step", "Quickstep", "Stutter Step"}
		
	Jigs = S{
		"Spectral Jig", "Chocobo Jig", "Chocobo Jig II"}
		
	Flourishes_macc = S{
		'Animated Flourish', 'Desperate Flourish'}
	
	--Most common weapons that are not DW
	Not_dual_wield_weapons = S{
		'Karambit'}
		
	TP_bonus_equipment = S{
		"Aeneas", "Fusetto +2", "Fusetto +3", "Centovente", "Moonshade Earring"}
	
	TP_bonus_weaponskill = S{
		"Rudra's Storm", "Shark Bite"}
		
	TP_bonus_multi_weaponskill = S{
		'Raging Fists', 'Combo'}
	
	fTP_transfer_weaponskill = S{
		'Pyrrhic Kleos', 'Evisceration', 'Dancing Edge'}
		
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
	Loop_stop = 0
	MAcc_mode = false
	Tank_mode = false
	Burst_mode = false
	Kite_mode = false
	--Haste_mode
	Soul_voice = false
	Haste_II = false
	send_command('@input /echo DNC Loaded, Current Modes::: Haste_mode: LOW')
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
	if Steps:contains(spell.english) then
		if buffactive['Presto'] == false then
			send_command('@input /ja "Presto" <me>')
		end
	end
end


function TP_bonus_adjustment(spell)
	--Fusetto+2 (or better):	+1000
	--Aeneas: 					+ 500
	--Moonshade Earring:		+ 250
	--total possible:			+1750
	

	if TP_bonus_weaponskill:contains(spell.english) then
		--to force 3000 TP WS determine non-adjustable factors (weapons)
		if TP_bonus_equipment:contains(player.equipment.main) and TP_bonus_equipment:contains(player.equipment.sub) then -- assumes Aeneas/TP Bonus offhand
			-- base: +1500 (total of +1750 possible)
			if player.tp > 1499 then -- replace earring
				if TP_bonus_equipment:contains(player.equipment.left_ear) then
					equip({ear1 = TP_bonus_replacement_earring})
				end
				if TP_bonus_equipment:contains(player.equipment.right_ear) then
					equip({ear2 = TP_bonus_replacement_earring})
				end
			end
		elseif TP_bonus_equipment:contains(player.equipment.main) then -- assumes Aeneas only
			-- base: +500 (total of +950 possible)
			if player.tp > 2499 then -- replace earring
				if TP_bonus_equipment:contains(player.equipment.left_ear) then
					equip({ear1 = TP_bonus_replacement_earring})
				end
				if TP_bonus_equipment:contains(player.equipment.right_ear) then
					equip({ear2 = TP_bonus_replacement_earring})
				end
			end
		elseif TP_bonus_equipment:contains(player.equipment.sub) then -- assumes TP Bonus offhand only
			-- base: +1000 (total of +1250 possible)
			if player.tp > 1999 then -- replace head and earring
				if TP_bonus_equipment:contains(player.equipment.left_ear) then
					equip({ear1 = TP_bonus_replacement_earring})
				end
				if TP_bonus_equipment:contains(player.equipment.right_ear) then
					equip({ear2 = TP_bonus_replacement_earring})
				end
			end
		else -- assumes no TP Bonus main/offhand
			-- base: +0 (total of +450 possible)
			if player.tp > 2749 then -- replace earring
				if TP_bonus_equipment:contains(player.equipment.left_ear) then
					equip({ear1 = TP_bonus_replacement_earring})
				end
				if TP_bonus_equipment:contains(player.equipment.right_ear) then
					equip({ear2 = TP_bonus_replacement_earring})
				end
			end
		end
	elseif (TP_bonus_multi_weaponskill:contains(spell.english) and WS_ind ~= 3) then -- dont override sets that maximize +PDL%
		--to force 3000 TP WS determine non-adjustable factors (weapons)
		if TP_bonus_equipment:contains(player.equipment.main) and TP_bonus_equipment:contains(player.equipment.sub) then -- assumes Aeneas/TP Bonus offhand
			-- base: +1500 (total of +1750 possible)
			if player.tp > 1499 then -- replace earring
				if TP_bonus_equipment:contains(player.equipment.left_ear) then
					equip({ear1 = TP_bonus_replacement_multiattack_earring})
				end
				if TP_bonus_equipment:contains(player.equipment.right_ear) then
					equip({ear2 = TP_bonus_replacement_multiattack_earring})
				end
			end
		elseif TP_bonus_equipment:contains(player.equipment.main) then -- assumes Aeneas only
			-- base: +500 (total of +750 possible)
			if player.tp > 2499 then -- replace earring
				if TP_bonus_equipment:contains(player.equipment.left_ear) then
					equip({ear1 = TP_bonus_replacement_multiattack_earring})
				end
				if TP_bonus_equipment:contains(player.equipment.right_ear) then
					equip({ear2 = TP_bonus_replacement_multiattack_earring})
				end
			end
		elseif TP_bonus_equipment:contains(player.equipment.sub) then -- assumes TP Bonus offhand only
			-- base: +1000 (total of +1450 possible)
			if player.tp > 1999 then -- replace earring
				if TP_bonus_equipment:contains(player.equipment.left_ear) then
					equip({ear1 = TP_bonus_replacement_multiattack_earring})
				end
				if TP_bonus_equipment:contains(player.equipment.right_ear) then
					equip({ear2 = TP_bonus_replacement_multiattack_earring})
				end
			end
		else -- assumes no TP Bonus main/offhand
			-- base: +0 (total of +250 possible)
			if player.tp > 2749 then -- replace earring
				if TP_bonus_equipment:contains(player.equipment.left_ear) then
					equip({ear1 = TP_bonus_replacement_multiattack_earring})
				end
				if TP_bonus_equipment:contains(player.equipment.right_ear) then
					equip({ear2 = TP_bonus_replacement_multiattack_earring})
				end
			end
		end		
	end
end

--From motes.Utility
function find_player_in_alliance(name)
    for party_index,ally_party in ipairs(alliance) do
        for player_index,_player in ipairs(ally_party) do
            if _player.name == name then
                return _player
            end
        end
    end
end


	-- if (Nuke_aja_spells:contains(spell.english) and not spell.interrupted) then	
		-- if (Ja_duration_boost == false or Current_ja_boost ~= spell.english) then
			-- Current_ja_boost = spell.english
			-- Ja_table_ind = Ja_table_ind + 1
			-- table.insert(Ja_table, tostring(spell.target.name .. " #" .. Ja_table_ind))
			-- send_command('timers create "'.. spell.english .. ': ' .. Ja_table[Ja_table_ind] .. '" 100 down spells/01015.png')
			-- Ja_duration_boost = true
			-- send_command('wait 100;input //gs c reset Aja_duration Timer')
		-- end
	-- end

Step = {}
Step[201] = 0 --Quickstep
Step[202] = 0 --BoxStep
Step[203] = 0 -- Stutter Step
Step[312] = 0 -- Feather Step
StepStart = {} -- start time for each step
StepStart[201] = 0
StepStart[202] = 0
StepStart[203] = 0
StepStart[312] = 0
function customStepTimer(spell)
	if Steps:contains(spell.english) then
		if player.equipment.main == ({"Setan Kober", augments = {"Path: C",}}) then
			koberBonus = 60
		else
			koberBonus = 0
		end
		if Step[spell.id] then
			Step[spell.id] = 60 + stepJPBonus + koberBonus -- 60 + {min: 0, max: 20} + koberBonus, max duration is 140
		end
		if StepStart[spell.id] > 0 then
			StepStart[spell.id] = os.time() - StepStart[spell.id]
			Step[spell.id] = math.max((Step[spell.id] - StepStart[spell.id] + 30 + stepJPBonus), 60 + stepJPBonus + koberBonus) -- remaining time on step + 30 + bonuses
		else
			StepStart[spell.id] = os.time()
		end
		send_command('timers create "'.. spell.english .. '" ' .. Step[spell.id] .. ' down abilities/00000.07.png')
	end
end


--Based on motes.Utility
function determine_waltz(spell)
	if spell.english == 'Healing Waltz' or
		spell.english == 'Divine Waltz' or
		spell.english == 'Divine Waltz II'
		then return end
		
	cancel_spell()
	
	local HP
	local spell_recasts = windower.ffxi.get_spell_recasts()
	
	-- determine HP to cure
	if spell.target.type == 'SELF' then
		HP = player.max_hp - player.hp
	else
		local target = find_player_in_alliance(spell.target.name)
        local est_max_hp = target.hp / (target.hpp/100)
        HP = math.floor(est_max_hp - target.hp)
	end
	
	-- determine available waltz
	if HP > 2199 then
		if (windower.ffxi.get_ability_recasts()[189] < 1 and player.tp > 799) then
			send_command('@input /ja "Curing Waltz V" '..spell.target.name)
		elseif (windower.ffxi.get_ability_recasts()[188] < 1 and player.tp > 649) then
			send_command('@input /ja "Curing Waltz IV" '..spell.target.name)
		elseif (windower.ffxi.get_ability_recasts()[187] < 1 and player.tp > 499) then
			send_command('@input /ja "Curing Waltz III" '..spell.target.name)
		elseif (windower.ffxi.get_ability_recasts()[186] < 1 and player.tp > 349) then
			send_command('@input /ja "Curing Waltz II" '..spell.target.name)
		elseif windower.ffxi.get_ability_recasts()[217] < 1 then
			send_command('@input /ja "Curing Waltz" '..spell.target.name)
		end
	elseif HP > 1599 then
		if (windower.ffxi.get_ability_recasts()[188] < 1 and player.tp > 649) then
			send_command('@input /ja "Curing Waltz IV" '..spell.target.name)
		elseif (windower.ffxi.get_ability_recasts()[189] < 1 and player.TP > 799) then
			send_command('@input /ja "Curing Waltz V" '..spell.target.name)
		elseif (windower.ffxi.get_ability_recasts()[187] < 1 and player.tp > 499) then
			send_command('@input /ja "Curing Waltz III" '..spell.target.name)
		elseif (windower.ffxi.get_ability_recasts()[186] < 1 and player.tp > 349) then
			send_command('@input /ja "Curing Waltz II" '..spell.target.name)
		elseif windower.ffxi.get_ability_recasts()[217] < 1 then
			send_command('@input /ja "Curing Waltz" '..spell.target.name)
		end
	elseif HP > 1199 then
		if (windower.ffxi.get_ability_recasts()[187] < 1 and player.tp > 499) then
			send_command('@input /ja "Curing Waltz III" '..spell.target.name)
		elseif (windower.ffxi.get_ability_recasts()[188] < 1 and player.tp > 649) then
			send_command('@input /ja "Curing Waltz IV" '..spell.target.name)
		elseif (windower.ffxi.get_ability_recasts()[189] < 1 and player.TP > 799) then
			send_command('@input /ja "Curing Waltz V" '..spell.target.name)
		elseif (windower.ffxi.get_ability_recasts()[186] < 1 and player.tp > 349) then
			send_command('@input /ja "Curing Waltz II" '..spell.target.name)
		elseif windower.ffxi.get_ability_recasts()[217] < 1 then
			send_command('@input /ja "Curing Waltz" '..spell.target.name)
		end
	elseif HP > 699 then
		if (spell_recasts[186] < 1 and player.tp > 349) then
			send_command('@input /ja "Curing Waltz II" '..spell.target.name)
		elseif (spell_recasts[187] < 1 and player.tp > 499) then
			send_command('@input /ja "Curing Waltz III" '..spell.target.name)
		elseif (spell_recasts[188] < 1 and player.tp > 649) then
			send_command('@input /ja "Curing Waltz IV" '..spell.target.name)
		elseif (spell_recasts[189] < 1 and player.TP > 799) then
			send_command('@input /ja "Curing Waltz V" '..spell.target.name)
		elseif spell_recasts[217] < 1 then
			send_command('@input /ja "Curing Waltz" '..spell.target.name)
		end
	end	
	if HP < 600 then 
		send_command('@input /ja "Curing Waltz" '..spell.target.name)
	end
end


-- Job Control Functions
function precast(spell)
	if (spell.type == 'WhiteMagic' or spell.type == 'BlackMagic' or spell.type== 'Trust') then
		equip(sets.precast.FastCast)
	elseif spell.type == 'Ninjutsu' then
		equip(sets.precast.NinjutsuFastCast)
	elseif Flourishes_macc:contains(spell.english) then
		equip(sets.MAcc)
	elseif Steps:contains(spell.english) then
		equip(sets.Step)
		if spell.english == 'Feather Step' then
			equip(sets.FeatherStep)
		end
		customStepTimer(spell)
	elseif spell.type == 'Waltz' then
		if Loop_stop == 0 then
			determine_waltz(spell)
			Loop_stop = 1
		end
		if Tank_mode == true then
			if sets.Tank_Waltz[player.equipment.main] or sets.Tank_Waltz[player.equipment.sub] then
				if sets.Tank_Waltz[player.equipment.main] and sets.Tank_Waltz[player.equipment.sub] then
					equip(sets.Tank_Waltz.GletiAcrontica)
				else
					if sets.Tank_Waltz[player.equipment.main] then
						equip(sets.Tank_Waltz[player.equipment.main])
					else
						equip(sets.Tank_Waltz[player.equipment.sub])
					end
				end
			else
				equip(sets.Tank_Waltz)
			end
		else
			if sets.Waltz[player.equipment.main] or sets.Waltz[player.equipment.sub] then
				if sets.Waltz[player.equipment.main] and sets.Waltz[player.equipment.sub] then
					equip(sets.Waltz.GletiAcrontica)
				else
					if sets.Waltz[player.equipment.main] then
						equip(sets.Waltz[player.equipment.main])
					else
						equip(sets.Waltz[player.equipment.sub])
					end
				end
			else
				equip(sets.Waltz)
			end
		end
	elseif Sambas:contains(spell.english) then
		equip(sets.Samba)
	elseif spell.type == "WeaponSkill" then
		if player.tp >= 1000 then
			--handles close-range WS's
			if spell.target.distance <= 5.5 then			
				--Physical WS's
				if spell.english == "Rudra's Storm" then
					equip(sets.Rudra[sets.WS.index[WS_ind]])
					if buffactive['Climactic Flourish'] then
						equip(sets.Rudra.Clim)
					end
				end
				if spell.english == "Evisceration" then
					equip(sets.Evisceration[sets.WS.index[WS_ind]])
				end
				if spell.english == "Pyrrhic Kleos" then
					equip(sets.PyrrhicKleos[sets.WS.index[WS_ind]])
				end
				if spell.english == "Dancing Edge" then
					equip(sets.DancingEdge[sets.WS.index[WS_ind]])
				end
				if spell.english == "Shark Bite" then
					equip(sets.SharkBite[sets.WS.index[WS_ind]])
					if buffactive['Climactic Flourish'] then
						equip(sets.SharkBite.Clim)
					end
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
				if spell.english == "Aeolian Edge" then
					equip(sets.AeolianEdge[sets.WS.index[WS_ind]])
					if world.day_element == "Wind" or world.weather_element == "Wind" then
						equip(sets.obi)
					end
				end
				--Generic WS's
				if (spell.english == "Fast Blade" or
						spell.english == "Circle Blade" or
						spell.english == "Wasp Sting" or
						spell.english == "Viper Bite")
					then
					equip(sets.OtherWS[sets.WS.index[WS_ind]])
				end
			else
				cancel_spell()
				send_command("@input /echo Canceled " .. spell.name .. " " .. spell.target.name .. " is Too Far")
			end

		end
	elseif spell.english == "Trance" then
		equip(sets.Trance)
	elseif spell.english == "No Foot Rise" then
		equip(sets.NoFootRise)
	elseif spell.english == "Reverse Flourish" then
		equip(sets.ReverseFlourish)
	elseif Jigs:contains(spell.english) then
		equip(sets.Jig)
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
	
	
	-- intentionally redundant in case user wants to specify other sets for this Ninjutsu
	if Buff_spells:contains(spell.english) then
		equip(sets.midcast.FastRecast)
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
	Loop_stop = 0
	
	-- RE-enables range/ammo swaps in case of Ullr use
	enable("range", "ammo")
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
				if buffactive['Fan Dance'] then
					equip(sets.FanDance)
				end
			else
				tank_mode_engaged_set()
				if buffactive['Fan Dance'] then
					equip(sets.FanDance)
				end
			end
		end
	else -- idle sets
		if Tank_mode == false then
			melee_mode_idle_set()
			if Kite_mode == true then
				equip(sets.Kite)
			end
		else
			tank_mode_idle_set()
			if Kite_mode == true then
				equip(sets.Kite)
			end
			if buffactive['Fan Dance'] then
				equip(sets.FanDance)
			end
		end
	end
end


function melee_mode_idle_set()
	equip(
		set_combine(			
			sets.Idle_melee[sets.Idle_melee.index[Idle_melee_ind]],
			sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]]
		)
	)
end


function tank_mode_idle_set()
	equip(
		set_combine(			
			sets.Idle_tank[sets.Idle_tank.index[Idle_tank_ind]],
			sets.Weapon_tank[sets.Weapon_tank.index[Wt_ind]]
		)
	)
end


function melee_mode_engaged_set()
	equip(
		set_combine(			
			sets.TP[sets.TP.index[TP_ind]]["Haste_" .. hasteVal],
			sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]]
		)
	)
end


function tank_mode_engaged_set()
	equip(
		set_combine(			
			sets.Tank[sets.Tank.index[Tank_ind]]["Haste_" .. hasteVal],
			sets.Weapon_tank[sets.Weapon_tank.index[Wt_ind]]
		)
	)
end


function other_engaged_set()
	if (player.equipment.main == 'Karambit' or player.equipment.main == "") then
		equip(sets.H2H[sets.H2H.index[TP_ind]])
	end
end


function other_tank_set()
	if (player.equipment.main == 'Karambit' or player.equipment.main == "") then
		equip(sets.H2H.Tank)
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
		else
			Tank_ind = Tank_ind + 1
			if Tank_ind > #sets.Tank.index then
				Tank_ind = 1
			end
			send_command("@input /echo <----- Tank Set changed to " .. sets.Tank.index[Tank_ind] .. " ----->")
		end
		determine_haste_sets()
	elseif command == "toggle TP set reverse" then
		if Tank_mode == false then
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
		else
			Idle_tank_ind = Idle_tank_ind + 1
			if Idle_tank_ind > #sets.Idle_tank.index then
				Idle_tank_ind = 1			
			end
			send_command("@input /echo <----- Idle Set changed to " .. sets.Idle_tank.index[Idle_tank_ind] .. " ----->")
		end
		determine_haste_sets()
	elseif command == "toggle Idle set reverse" then
		if Tank_mode == false then
			Idle_melee_ind = Idle_melee_ind - 1
			if Idle_melee_ind < 1 then
				Idle_ind = #sets.Idle_melee.index
			end
			send_command("@input /echo <----- Idle Set changed to " .. sets.Idle_melee.index[Idle_melee_ind] .. " ----->")
		else
			Idle_tank_ind = Idle_tank_ind - 1
			if Idle_tank_ind < 1 then
				Idle_tank_ind = #sets.Idle_tank.index
			end
			send_command("@input /echo <----- Idle Set changed to " .. sets.Idle_tank.index[Idle_tank_ind] .. " ----->")
		end
		determine_haste_sets()
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
	elseif command == "retrigger engaged set" then
		determine_haste_sets()
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