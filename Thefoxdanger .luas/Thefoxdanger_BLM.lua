-- 
-- @author Thefoxdanger of Asura
-- BLM.lua v1.1
--
-- 
-- **Version Changelog**
--
-- V1.1
-- -- Added Ancient Magic to the lists to allow for swaps
-- -- Added detection for Quanpur necklace
-- -- Fixed logic issue in -ja spell detection that prevented swaps from occuring properly
-- -- Added timer logic for -ja spell duration / equip processing
--
-- Note to users:
-- 
-- Intermediate BLM lua created to streamline play with as few toggles and other things to press as possible. Designed to be similar in 
-- function to the rest of Spicyryan's luas in the Github However, this is a job that naturally has a few levers to throw, so take time 
-- to get used to the keybinds below. It also has A LOT of gear fields, which is for a good reason. Make sure to read over comments, reviewing 
-- the current gear in slots to understand what goes there if you don't have my exact gearsets. Everything is very clearly labeled, and if 
-- a set seems to be a duplicate, check that it isn't a version that takes Melee_mode into account.
--
-- **********************************************************************************************************************************************
-- *As Mage_mode in my Luas will allow for weapons to swap (while Melee_mode disables weapon swapping on cast) make sure to change to Melee_mode*
-- *if you plan to use Myrkr. Only Dispelga will override this feature.                                                                         *
-- **********************************************************************************************************************************************
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
send_command("bind @f9 gs c toggle Haste Mode") -- WIN+F9 Toggles between SV/Bolster, HasteII and Low haste modes
send_command("bind @d gs c toggle Death Mode") -- WIN+D Toggles Death mode on/off (Overrides all idle / fast cast sets)
send_command("bind !s gs c toggle Burst set") -- ALT+S Cycles between burst sets
send_command("bind @w gs c toggle Mana Wall override") 	-- WIN+W Turns Mana Wall override On/Off. 
															-- Off: Mana Wall will only automatically optimize Idle sets. 
															-- On: Replaces feet and/or weapon in all actions with Mana Wall gear. 

send_command("bind @F8 gs c toggle DW set") -- WIN+F8 swap between DualWield and SingleWield for melee sets (can only be toggled if DW is available)
send_command("bind !F8 gs c toggle Melee Mode") -- ALT+F8 swap between mage and melee modes (Determines if weapons swap with casts)
send_command("bind !` gs c toggle Burst Mode") -- ALT+` switches Magic Burst sets on/off


--numpad controls for Custom Binds
-- -- CTRL key for Custom Binds
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
-- -- Alt key for Custom Binds
send_command('bind !numpad0 @input /ma "" <t>')
send_command('bind !numpad1 @input /ma "" <t>')
send_command('bind !numpad2 @input /ma "" <t>')
send_command('bind !numpad3 @input /ma "" <t>')
send_command('bind !numpad4 @input /ma "" <t>')
send_command('bind !numpad5 @input /ma "" <t>')
send_command('bind !numpad6 @input /ma "" <t>')
send_command('bind !numpad7 @input /ma "" <t>')
send_command('bind !numpad8 @input /ma "" <t>')
send_command('bind !numpad9 @input /ma "" <t>')

	
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
	
	send_command("unbind @F9")
	send_command("unbind @d")
	send_command("unbind @w")
	send_command("unbind !s")
	
	send_command("unbind !F8")
	send_command("unbind @F8")
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
	set_macros(1,2)
	---Set Lockstyle Here
	if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
		set_style(1)
	else
		set_style(1)
	end
	
	
	--Gear Sets Start Here
	--Augmented Gear
	Taranus = {}
	Taranus.Idle = { name="Taranus's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}
	Taranus.MAB = { name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}}
	Taranus.Macc = { name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Fast Cast"+10','Phys. dmg. taken-10%',}}
	Taranus.STP = { name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Store TP"+10',}}
	Taranus.TP = { name="Taranus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Haste+10','Phys. dmg. taken-10%',}}
		
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
	MerlinicHead.Aspir = { name="Merlinic Hood", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','"Drain" and "Aspir" potency +9','MND+10','Mag. Acc.+9','"Mag.Atk.Bns."+8',}}
	MerlinicHead.Phalanx = { name="Merlinic Hood", augments={'Pet: VIT+3','Accuracy+9','Phalanx +3','Mag. Acc.+11 "Mag.Atk.Bns."+11',}}
	
	MerlinicBody = {}
	MerlinicHead.FC = { name="Merlinic Hood", augments={'"Fast Cast"+5','Accuracy+19',}}
	MerlinicBody.Phalanx = { name="Merlinic Jubbah", augments={'Pet: DEX+5','STR+7','Phalanx +3','Mag. Acc.+6 "Mag.Atk.Bns."+6',}}
	MerlinicBody.Occult = { name="Merlinic Jubbah", augments={'"Occult Acumen"+11','INT+8','Mag. Acc.+8','"Mag.Atk.Bns."+12',}}
	
	MerlinicHands = {}
	MerlinicHands.Aspir = { name="Merlinic Dastanas", augments={'Mag. Acc.+9','"Drain" and "Aspir" potency +10','CHR+15',}}
	MerlinicHands.Phalanx = { name="Merlinic Dastanas", augments={'"Rapid Shot"+4','"Mag.Atk.Bns."+12','Phalanx +4','Accuracy+14 Attack+14','Mag. Acc.+10 "Mag.Atk.Bns."+10',}}
	MerlinicHands.Occult = { name="Merlinic Dastanas", augments={'Mag. Acc.+15','"Occult Acumen"+11','MND+6','"Mag.Atk.Bns."+1',}}
	
	MerlinicLegs = {}
	MerlinicLegs.MAB = { name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+29','INT+10','Accuracy+5 Attack+5','Mag. Acc.+20 "Mag.Atk.Bns."+20',}}
	MerlinicLegs.Aspir = { name="Merlinic Shalwar", augments={'Mag. Acc.+19','"Drain" and "Aspir" potency +9','INT+2','"Mag.Atk.Bns."+4',}}
	MerlinicLegs.Refresh = { name="Merlinic Shalwar", augments={'Accuracy+25','Accuracy+1 Attack+1','"Refresh"+2','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}
	MerlinicLegs.Phalanx = { name="Merlinic Shalwar", augments={'STR+5','Mag. Acc.+19','Phalanx +5','Accuracy+16 Attack+16',}}
	
	MerlinicFeet = {}
	MerlinicFeet.Phalanx = { name="Merlinic Crackows", augments={'"Fast Cast"+2','MND+5','Phalanx +3',}}
	MerlinicFeet.Occult = { name="Merlinic Crackows", augments={'Mag. Acc.+20','"Occult Acumen"+11','MND+8','"Mag.Atk.Bns."+12',}}
	

	--SubJob list--
	--Do not change these
	sets.SJ = {}
	sets.SJ.index = {"Other", "Ninja", "Dancer"}
	SJ_ind = 1	


	--Weapon Sets--
	sets.Weapon_melee = {} -- sets weapon combo for melee-mode
	sets.Weapon_melee.index = {"Custom", "Mpaca", "Khatvanga", "Lathi", "Claustrum"}
	Wm_ind = 1
	sets.Weapon_melee.Custom = {} --intentionally blank so weapons will not swap (allows for manual equipping)
	sets.Weapon_melee.Mpaca = {
		main = "Mpaca's Staff",
		sub = "Khonsu"
	}
	sets.Weapon_melee.Khatvanga = {
		main = "Khatvanga",
		sub = "Bloodrain Strap"
	}
	sets.Weapon_melee.Lathi = {
		main = "Lathi",
		sub = "Khonsu"
	}
	sets.Weapon_melee.Claustrum = {
		main = "Claustrum",
		sub = "Khonsu"
	}


	sets.DW_mode = {}
	sets.DW_mode.index = {"DW", "notDW"}
	DW_mode_ind = 1

	sets.DW_mode.DW = {}
	sets.DW_mode.notDW = {sub = "Genmei Shield"} -- 10/0/0


	--Idle Sets--
	-- mage-mode
	sets.Idle = {}
	sets.Idle.index = {"Resist", "DT", "Refresh"}
	Idle_ind = 1
	sets.Idle.Resist = {
		ammo = "Staunch Tathlum +1", -- 0/0/3
		head = "Agwu's Cap", 
		neck = "Warder's Charm +1", 
		ear1 = "Lugalbanda Earring", 
		ear2 = "Etiolation Earring", -- 0/3/0
		body = "Shamash Robe", -- 10/0/0
		hands = "Agwu's Gages",
		ring1 = "Mephitas's Ring +1", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Taranus.Idle, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = "Agwu's Slops", -- 0/0/7
		feet = "Agwu's Pigaches" 
	} -- 20/3/20
	sets.Idle.DT = {
		ammo = "Staunch Tathlum +1", -- 0/0/3
		head = "Nyame Helm", -- 0/0/7 
		neck = "Warder's Charm +1", 
		ear1 = "Lugalbanda Earring", 
		ear2 = "Etiolation Earring", -- 0/3/0
		body = "Shamash Robe", -- 10/0/0
		hands = "Nyame Gauntlets", -- 0/0/7
		ring1 = "Mephitas's Ring +1", 
		ring2 = "Mephitas's Ring",
		back = Taranus.Idle, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = "Nyame Flanchard", -- 0/0/8
		feet = "Nyame Sollerets" -- 0/0/7
	} -- 20/3/32
	sets.Idle.Refresh = {
		ammo = "Staunch Tathlum +1", -- 0/0/3
		head = "Volte Beret", 
		neck = "Loricate Torque +1", -- 0/0/6 
		ear1 = "Lugalbanda Earring", 
		ear2 = "Etiolation Earring", -- 0/3/0
		body = "Shamash Robe", -- 10/0/0
		hands = "Volte Gloves", 
		ring1 = "Mephitas's Ring +1", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Taranus.Idle, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = MerlinicLegs.Refresh,
		feet = "Volte Gaiters" 
	} -- 20/3/19
	
	
	-- mana wall
	sets.Idle_mana_wall = {}
	sets.Idle_mana_wall.index = {"Resist", "DT", "Refresh"}
	Idle_mana_wall_ind = 1
	sets.Idle_mana_wall.Resist = {
		ammo = "Staunch Tathlum +1", -- 0/0/3
		head = "Agwu's Cap", 
		neck = "Warder's Charm +1", 
		ear1 = "Lugalbanda Earring", 
		ear2 = "Etiolation Earring", -- 0/3/0
		body = "Shamash Robe", -- 10/0/0
		hands = "Agwu's Gages",
		ring1 = "Mephitas's Ring +1", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Taranus.Idle, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = "Agwu's Slops", -- 0/0/7
		feet = "Wicce Sabots +1"
	} -- 20/3/20
	sets.Idle_mana_wall.DT = {
		ammo = "Staunch Tathlum +1", -- 0/0/3
		head = "Nyame Helm", -- 0/0/7 
		neck = "Warder's Charm +1", 
		ear1 = "Lugalbanda Earring", 
		ear2 = "Etiolation Earring", -- 0/3/0
		body = "Shamash Robe", -- 10/0/0
		hands = "Nyame Gauntlets", -- 0/0/7
		ring1 = "Mephitas's Ring +1", 
		ring2 = "Mephitas's Ring",
		back = Taranus.Idle, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = "Nyame Flanchard", -- 0/0/8
		feet = "Wicce Sabots +1"
	} -- 20/3/25
	sets.Idle_mana_wall.Refresh = {
		ammo = "Staunch Tathlum +1", -- 0/0/3
		head = "Volte Beret", 
		neck = "Loricate Torque +1", -- 0/0/6 
		ear1 = "Lugalbanda Earring", 
		ear2 = "Etiolation Earring", -- 0/3/0
		body = "Shamash Robe", -- 10/0/0
		hands = "Volte Gloves", 
		ring1 = "Mephitas's Ring +1", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Taranus.Idle, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = MerlinicLegs.Refresh,
		feet = "Wicce Sabots +1" 
	} -- 20/3/19
	
	
	--When enabled this will layer Mana Wall pieces over the top of all other sets during midcast actions
	sets.ManaWall_override = {}
	sets.ManaWall_override.index = {'Off', 'On'}
	ManaWall_override_ind = 1
	
	sets.ManaWall_override.On = {feet = "Wicce Sabots +1"} --Add Su5 weapon into this set as well, if desired
	sets.ManaWall_override.Off = {}
	
	
	-- Death Idle
	sets.Idle.Death = {
		ammo = "Staunch Tathlum +1", -- 0/0/3
		head = "Amalric Coif +1", 
		neck = "Loricate Torque +1", -- 0/0/6 
		ear1 = "Lugalbanda Earring", 
		ear2 = "Etiolation Earring", -- 0/3/0
		body = "Shamash Robe", -- 10/0/0
		hands = "Amalric Gages +1",
		ring1 = "Mephitas's Ring +1", 
		ring2 = "Mephitas's Ring", 
		back = Taranus.Idle, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = "Agwu's Slops", -- 0/0/7
		feet = "Amalric Nails +1" 
	} -- 20/3/16


	--TP Sets--
	--The ability to support DW is ere but... you probably shouldnt.
	sets.TP = {}
	sets.TP.index = {"Standard", "DT"}
	TP_ind = 1

	sets.TP.Standard = {}
	sets.TP.Standard.index = {"Other", "Ninja", "Dancer"}
	sets.TP.Standard.Other = {
		head = "Blistering Sallet +1",  
		neck = "Combatant's Torque", 
		ear1 = "Crepuscular Earring", 
		ear2 = "Telos Earring", 		
		body = "Nyame Mail", -- 0/0/9
		hands = "Gazu Bracelet +1", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Taranus.TP, -- 10/0/0
		waist = "Windbuffet Belt +1",	
		legs = "Nyame Flanchard", -- 0/0/8
		feet = "Nyame Sollerets" -- 0/0/7
	} -- 11DA/2TA/2QA | 34 sTP | 10/0/24
	
	sets.TP.Standard.Ninja = {} -- DWIII (25%)
	sets.TP.Standard.Ninja.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45", "Haste_50", "Haste_55"}
	-- 49 DW needed
	sets.TP.Standard.Ninja.Haste_0 = {}
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
	sets.TP.Standard.Ninja.Haste_30 = {}
	-- 25 DW needed
	sets.TP.Standard.Ninja.Haste_35 = {} 
	-- 18 DW needed
	sets.TP.Standard.Ninja.Haste_40 = {}
	-- 11 DW needed
	sets.TP.Standard.Ninja.Haste_45 = {} 
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
	sets.TP.Standard.Dancer.Haste_0 = {} 
	-- 57 DW needed
	sets.TP.Standard.Dancer.Haste_5 = {} 
	-- 55 DW needed
	sets.TP.Standard.Dancer.Haste_10 = {}
	-- 52 DW needed
	sets.TP.Standard.Dancer.Haste_15 = {} 
	-- 49 DW needed
	sets.TP.Standard.Dancer.Haste_20 = {} 
	-- 45 DW needed
	sets.TP.Standard.Dancer.Haste_25 = {} 
	-- 41 DW needed
	sets.TP.Standard.Dancer.Haste_30 = {} 
	-- 35 DW needed
	sets.TP.Standard.Dancer.Haste_35 = {} 
	-- 28 DW needed
	sets.TP.Standard.Dancer.Haste_40 = {} 
	-- 21 DW needed
	sets.TP.Standard.Dancer.Haste_45 = {} 
	-- 15 DW needed
	sets.TP.Standard.Dancer.Haste_50 = {} 
	-- 9 DW needed
	sets.TP.Standard.Dancer.Haste_55 = {}


	sets.TP.DT = {}
	sets.TP.DT.index = {"Other", "Ninja", "Dancer"}
	sets.TP.DT.Other = {
		head = "Blistering Sallet +1",  
		neck = "Combatant's Torque", 
		ear1 = "Crepuscular Earring", 
		ear2 = "Telos Earring", 		
		body = "Nyame Mail", -- 0/0/9
		hands = "Gazu Bracelet +1", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Taranus.TP, -- 10/0/0
		waist = "Windbuffet Belt +1",	
		legs = "Nyame Flanchard", -- 0/0/8
		feet = "Nyame Sollerets" -- 0/0/7
	} -- 11DA/2TA/2QA | 34 sTP | 10/0/24
		
	sets.TP.DT.Ninja = {}
	sets.TP.DT.Ninja.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45", "Haste_50", "Haste_55"}
	-- 49 DW needed
	sets.TP.DT.Ninja.Haste_0 = {} 
	-- 47 DW needed
	sets.TP.DT.Ninja.Haste_5 = {}
	-- 45 DW needed
	sets.TP.DT.Ninja.Haste_10 = {} 
	-- 42 DW needed
	sets.TP.DT.Ninja.Haste_15 = {} 
	-- 39 DW needed
	sets.TP.DT.Ninja.Haste_20 = {} 
	-- 35 DW needed
	sets.TP.DT.Ninja.Haste_25 = {} 
	-- 31 DW needed
	sets.TP.DT.Ninja.Haste_30 = {} 
	-- 25 DW needed
	sets.TP.DT.Ninja.Haste_35 = {} 
	-- 18 DW needed
	sets.TP.DT.Ninja.Haste_40 = {} 
	-- 11 DW needed
	sets.TP.DT.Ninja.Haste_45 = {} 
	-- 6 DW needed (Not currently possible to determine haste samba from outside source - this may become a toggle later)
	sets.TP.DT.Ninja.Haste_50 = sets.TP.DT.Ninja.Haste_45
	-- 0 DW needed (Not currently possible to determine haste samba from outside source - this may become a toggle later)
	sets.TP.DT.Ninja.Haste_55 = sets.TP.DT.Ninja.Haste_45
		
	sets.TP.DT.Dancer = {}
	sets.TP.DT.Dancer.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45", "Haste_50", "Haste_55"}
	-- 59 DW needed
	sets.TP.DT.Dancer.Haste_0 = {} 
	-- 57 DW needed
	sets.TP.DT.Dancer.Haste_5 = {} 
	-- 55 DW needed
	sets.TP.DT.Dancer.Haste_10 = {}
	-- 52 DW needed
	sets.TP.DT.Dancer.Haste_15 = {} 
	-- 49 DW needed
	sets.TP.DT.Dancer.Haste_20 = {}
	-- 45 DW needed
	sets.TP.DT.Dancer.Haste_25 = {} 
	-- 41 DW needed
	sets.TP.DT.Dancer.Haste_30 = {}
	-- 35 DW needed
	sets.TP.DT.Dancer.Haste_35 = {} 
	-- 28 DW needed
	sets.TP.DT.Dancer.Haste_40 = {} 
	-- 21 DW needed
	sets.TP.DT.Dancer.Haste_45 = {} 
	-- 15 DW needed
	sets.TP.DT.Dancer.Haste_50 = {}
	-- 9 DW needed
	sets.TP.DT.Dancer.Haste_55 = {} 
	

	--Death Engaged Set
	sets.TP.Death = {
		ammo = "Staunch Tathlum +1", -- 0/0/3
		head = "Amalric Coif +1", 
		neck = "Loricate Torque +1", -- 0/0/6 
		ear1 = "Lugalbanda Earring", 
		ear2 = "Etiolation Earring", -- 0/3/0
		body = "Shamash Robe", -- 10/0/0
		hands = "Amalric Gages +1",
		ring1 = "Mephitas's Ring +1", 
		ring2 = "Mephitas's Ring", 
		back = Taranus.Idle, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = "Agwu's Slops", -- 0/0/7
		feet = "Amalric Nails +1" 
	} -- 20/3/16	


	--Weaponskill Sets--
	sets.WS = {}
	sets.WS.index = {'Attack', 'AttackCapped'}
	WS_ind = 1
	
	
	--Dagger	
	sets.AeolianEdge = {}
	sets.AeolianEdge.Attack = {
		head="Nyame Helm",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Regal Earring",
        body="Nyame Mail",
		hands="Jhakri Cuffs +2",
		ring1="Metamorph Ring +1",
		ring2="Freke Ring",
        back=Taranus.MAB,
		waist="Acuity Belt +1",
		legs=MerlinicLegs.MAB,
		feet="Nyame Sollerets"
	}
	sets.AeolianEdge.AttackCapped = {
		head="Nyame Helm",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Regal Earring",
        body="Nyame Mail",
		hands="Jhakri Cuffs +2",
		ring1="Metamorph Ring +1",
		ring2="Freke Ring",
        back=Taranus.MAB,
		waist="Acuity Belt +1",
		legs=MerlinicLegs.MAB,
		feet="Nyame Sollerets"
	}
	
	
	--Staff
	--Myrkr doesn't need multiple sets
	sets.Myrkr = {
		ammo="Ghastly Tathlum +1",
		head="Amalric Coif +1",
		neck="Sanctity Necklace",
		ear1="Moonshade Earring",
		ear2="Etiolation Earring",
        body="Rosette Jaseran +1",
		hands="Amalric Gages +1",
		ring1="Mephitas's Ring +1",
		ring2="Mephitas's Ring",
        back=Taranus.Macc,
		waist="Luminary Sash",
		legs="Amalric Slops",
		feet="Amalric Nails +1"
	}
	
	sets.Vidohunir = {}
	sets.Vidohunir.Attack = {
		ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Regal Earring",
        body="Nyame Mail",
		hands="Jhakri Cuffs +2",
		ring1="Archon Ring",
		ring2="Freke Ring",
        back=Taranus.MAB,
		waist="Acuity Belt +1",
		legs=MerlinicLegs.MAB,
		feet="Nyame Sollerets"
	}
	sets.Vidohunir.AttackCapped = {
		ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Regal Earring",
        body="Nyame Mail",
		hands="Jhakri Cuffs +2",
		ring1="Archon Ring",
		ring2="Freke Ring",
        back=Taranus.MAB,
		waist="Acuity Belt +1",
		legs=MerlinicLegs.MAB,
		feet="Nyame Sollerets"
	}
	
	sets.Cataclysm = {}
	sets.Cataclysm.Attack = {
		ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Regal Earring",
        body="Nyame Mail",
		hands="Jhakri Cuffs +2",
		ring1="Archon Ring",
		ring2="Freke Ring",
        back=Taranus.MAB,
		waist="Acuity Belt +1",
		legs=MerlinicLegs.MAB,
		feet="Nyame Sollerets"
	}
	sets.Cataclysm.AttackCapped = {
		ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Regal Earring",
        body="Nyame Mail",
		hands="Jhakri Cuffs +2",
		ring1="Archon Ring",
		ring2="Freke Ring",
        back=Taranus.MAB,
		waist="Acuity Belt +1",
		legs=MerlinicLegs.MAB,
		feet="Nyame Sollerets"
	}

	sets.Shattersoul = {}
	sets.Shattersoul.Attack = {
		ammo="Hasty Pinion +1",
		head="Nyame Helm",
		neck="Fotia Gorget",
		ear1="Crepuscular Earring",
		ear2="Telos Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Archon Ring",
		ring2="Freke Ring",
        back=Taranus.TP,
		waist="Fotia Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.Shattersoul.AttackCapped = {
		ammo="Hasty Pinion +1",
		head="Nyame Helm",
		neck="Fotia Gorget",
		ear1="Crepuscular Earring",
		ear2="Telos Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Archon Ring",
		ring2="Freke Ring",
        back=Taranus.TP,
		waist="Fotia Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}

	sets.Retribution = {}
	sets.Retribution.Attack = {
		ammo="Hasty Pinion +1",
		head="Nyame Helm",
		neck="Fotia Gorget",
		ear1="Crepuscular Earring",
		ear2="Telos Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Archon Ring",
		ring2="Freke Ring",
        back=Taranus.TP,
		waist="Fotia Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.Retribution.AttackCapped = {
		ammo="Hasty Pinion +1",
		head="Nyame Helm",
		neck="Fotia Gorget",
		ear1="Crepuscular Earring",
		ear2="Telos Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Archon Ring",
		ring2="Freke Ring",
        back=Taranus.TP,
		waist="Fotia Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	
	sets.GateOfTartarus = {}
	sets.GateOfTartarus.Attack = {
		ammo="Ghastly Tathlum +1",
		head="Nyame Helm",
		neck="Fotia Gorget",
		ear1="Crepuscular Earring",
		ear2="Telos Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Archon Ring",
		ring2="Freke Ring",
        back=Taranus.TP,
		waist="Fotia Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.GateOfTartarus.AttackCapped = {
		ammo="Ghastly Tathlum +1",
		head="Nyame Helm",
		neck="Fotia Gorget",
		ear1="Crepuscular Earring",
		ear2="Telos Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Archon Ring",
		ring2="Freke Ring",
        back=Taranus.TP,
		waist="Fotia Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}	
	
	sets.SpiritTaker = {}
	sets.SpiritTaker.Attack = {
		ammo="Hasty Pinion +1",
		head="Nyame Helm",
		neck="Fotia Gorget",
		ear1="Crepuscular Earring",
		ear2="Telos Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Archon Ring",
		ring2="Freke Ring",
        back=Taranus.TP,
		waist="Fotia Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.SpiritTaker.AttackCapped = {
		ammo="Hasty Pinion +1",
		head="Nyame Helm",
		neck="Fotia Gorget",
		ear1="Crepuscular Earring",
		ear2="Telos Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Archon Ring",
		ring2="Freke Ring",
        back=Taranus.TP,
		waist="Fotia Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}

	sets.ShellCrusher = {}
	sets.ShellCrusher.Attack = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Sanctity Necklace",
		ear1="Crepuscular Earring",
		ear2="Dignitary's Earring",
        body="Nyame Mail",
		hands="Gazu Bracelet +1",
		ring1="Metamorph Ring +1",
		ring2="Etana Ring",
        back=Taranus.TP,
		waist="Acuity Belt +1",
		legs="Agwu's Slops",
		feet="Agwu's Pigaches"
	}
	sets.ShellCrusher.AttackCapped = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Sanctity Necklace",
		ear1="Crepuscular Earring",
		ear2="Dignitary's Earring",
        body="Nyame Mail",
		hands="Gazu Bracelet +1",
		ring1="Metamorph Ring +1",
		ring2="Etana Ring",
        back=Taranus.TP,
		waist="Acuity Belt +1",
		legs="Agwu's Slops",
		feet="Agwu's Pigaches"
	}

	sets.EarthCrusher = {}
	sets.EarthCrusher.Attack = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Quanpur Necklace",
		ear1="Friomisi Earring",
		ear2="Regal Earring",
        body="Nyame Mail",
		hands="Jhakri Cuffs +2",
		ring1="Archon Ring",
		ring2="Freke Ring",
        back=Taranus.MAB,
		waist="Acuity Belt +1",
		legs=MerlinicLegs.MAB,
		feet="Nyame Sollerets"
	}
	sets.EarthCrusher.AttackCapped = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Quanpur Necklace",
		ear1="Friomisi Earring",
		ear2="Regal Earring",
        body="Nyame Mail",
		hands="Jhakri Cuffs +2",
		ring1="Archon Ring",
		ring2="Freke Ring",
        back=Taranus.MAB,
		waist="Acuity Belt +1",
		legs=MerlinicLegs.MAB,
		feet="Nyame Sollerets"
	}

	sets.RockCrusher = {}
	sets.RockCrusher.Attack = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Quanpur Necklace",
		ear1="Friomisi Earring",
		ear2="Regal Earring",
        body="Nyame Mail",
		hands="Jhakri Cuffs +2",
		ring1="Archon Ring",
		ring2="Freke Ring",
        back=Taranus.MAB,
		waist="Acuity Belt +1",
		legs=MerlinicLegs.MAB,
		feet="Nyame Sollerets"
	}
	sets.RockCrusher.AttackCapped = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Quanpur Necklace",
		ear1="Friomisi Earring",
		ear2="Regal Earring",
        body="Nyame Mail",
		hands="Jhakri Cuffs +2",
		ring1="Archon Ring",
		ring2="Freke Ring",
        back=Taranus.MAB,
		waist="Acuity Belt +1",
		legs=MerlinicLegs.MAB,
		feet="Nyame Sollerets"
	}	


	--Club	
	sets.BlackHalo = {}
	sets.BlackHalo.Attack = {
		ammo="Crepuscular Pebble",
		head = "Nyame Helm",
		neck = "Fotia Gorget", 
		ear1 = "Regal Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Rufescent Ring",
		back = Taranus.TP, 
		waist = "Fotia Belt",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.BlackHalo.AttackCapped = {
		ammo="Crepuscular Pebble",
		head = "Nyame Helm",
		neck = "Fotia Gorget", 
		ear1 = "Regal Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Rufescent Ring",
		back = Taranus.TP, 
		waist = "Fotia Belt",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	
	sets.Judgment = {}
	sets.Judgment.Attack = {
		ammo="Crepuscular Pebble",
		head = "Nyame Helm",
		neck = "Caro Necklace", 
		ear1 = "Ishvara Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Shukuyu Ring", 
		ring2 = "Rufescent Ring",
		back = Taranus.TP, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.Judgment.AttackCapped = {
		ammo="Crepuscular Pebble",
		head = "Nyame Helm",
		neck = "Caro Necklace", 
		ear1 = "Ishvara Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Shukuyu Ring", 
		ring2 = "Rufescent Ring",
		back = Taranus.TP, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}

	sets.FlashNova = {}
	sets.FlashNova.Attack = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Regal Earring",
        body="Nyame Mail",
		hands="Jhakri Cuffs +2",
		ring1="Metamorph Ring +1",
		ring2="Freke Ring",
        back=Taranus.MAB,
		waist="Acuity Belt +1",
		legs=MerlinicLegs.MAB,
		feet="Nyame Sollerets"
	}
	sets.FlashNova.AttackCapped = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Regal Earring",
        body="Nyame Mail",
		hands="Jhakri Cuffs +2",
		ring1="Metamorph Ring +1",
		ring2="Freke Ring",
        back=Taranus.MAB,
		waist="Acuity Belt +1",
		legs=MerlinicLegs.MAB,
		feet="Nyame Sollerets"
	}		
	
	sets.ShiningStrike = {}
	sets.ShiningStrike.Attack = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Regal Earring",
        body="Nyame Mail",
		hands="Jhakri Cuffs +2",
		ring1="Metamorph Ring +1",
		ring2="Freke Ring",
        back=Taranus.MAB,
		waist="Acuity Belt +1",
		legs=MerlinicLegs.MAB,
		feet="Nyame Sollerets"
	}
	sets.ShiningStrike.AttackCapped = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Regal Earring",
        body="Nyame Mail",
		hands="Jhakri Cuffs +2",
		ring1="Metamorph Ring +1",
		ring2="Freke Ring",
        back=Taranus.MAB,
		waist="Acuity Belt +1",
		legs=MerlinicLegs.MAB,
		feet="Nyame Sollerets"
	}	
	
	sets.SeraphStrike = {}
	sets.SeraphStrike.Attack = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Regal Earring",
        body="Nyame Mail",
		hands="Jhakri Cuffs +2",
		ring1="Metamorph Ring +1",
		ring2="Freke Ring",
        back=Taranus.MAB,
		waist="Acuity Belt +1",
		legs=MerlinicLegs.MAB,
		feet="Nyame Sollerets"
	}
	sets.SeraphStrike.AttackCapped = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Regal Earring",
        body="Nyame Mail",
		hands="Jhakri Cuffs +2",
		ring1="Metamorph Ring +1",
		ring2="Freke Ring",
        back=Taranus.MAB,
		waist="Acuity Belt +1",
		legs=MerlinicLegs.MAB,
		feet="Nyame Sollerets"
	}		

	
	--All Other
	sets.OtherWS = {}
	sets.OtherWS.Attack = {
		ammo="Hasty Pinion +1",
		head = "Nyame Helm",
		neck = "Caro Necklace", 
		ear1 = "Ishvara Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Shukuyu Ring", 
		ring2 = "Rufescent Ring",
		back = Taranus.TP, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.OtherWS.AttackCapped = {
		ammo="Hasty Pinion +1",
		head = "Nyame Helm",
		neck = "Caro Necklace", 
		ear1 = "Ishvara Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Shukuyu Ring", 
		ring2 = "Rufescent Ring",
		back = Taranus.TP, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}


	--Job Ability Sets--
	sets.Manafont = {body = "Archmage's Coat +3"}
	sets.Sublimation = {waist = "Embla Sash"}
	
	
	sets.Waltz ={
	-- Insert gear here as desired
	}
	
	
	--BLM @Job Master gets -38% cast time for elemental magic (Elemental Celerity)
	sets.precast = {}
	--This set is overkill in the event of wrong arts or no SJ
	sets.precast.FastCast = {
		ammo = "Sapience Orb", -- 2
		head = MerlinicHead.FC, -- 13
		neck = "Orunmila's Torque", -- 5
		ear1 = "Malignance Earring", -- 4
		ear2 = "Loquacious Earring", -- 2
		body = "Zendik Robe", -- 13
		hands = "Agwu's Gages", -- 6
		ring1 = "Mephitas's Ring +1",  
		ring2 = "Mephitas's Ring", 
		waist = "Embla Sash", -- 5
		back = Taranus.Idle, -- 10
		legs = "Agwu's Slops", -- 7
		feet = "Amalric Nails +1" -- 6
	} -- 73% + 38% = 111% FC
	
	--This is always the FC set for death
	--If Death_mode is enabled it will also replace all FC sets (except impact)
	sets.precast.FastCast_death_mode = {
		ammo = "Ghastly Tathlum +1",
		head = "Amalric Coif +1", -- 11
		neck = "Orunmila's Torque", -- 5
		ear1 = "Loquacious Earring", -- 2
		ear2 = "Etiolation Earring", -- 1
		body = "Rosette Jaseran +1", -- 3~6
		hands = "Amalric Gages +1", 
		ring1 = "Mephitas's Ring +1",  
		ring2 = "Mephitas's Ring", 
		waist = "Embla Sash", -- 5
		back = Taranus.Macc, -- 10
		legs = "Amalric Slops", 
		feet = "Amalric Nails +1" -- 6
	} -- 43~46% + 38% = 81~84%
	
	sets.precast.FastCast_impact = {
		ammo = "Sapience Orb", -- 2
		head = "",
		neck = "Orunmila's Torque", -- 5
		ear1 = "Malignance Earring", -- 4
		ear2 = "Loquacious Earring", -- 2
		body = "Twilight Cloak",
		hands = "Agwu's Gages", -- 6
		ring1 = "Mephitas's Ring +1",  
		ring2 = "Mephitas's Ring", 
		waist = "Embla Sash", -- 3 (3)
		back = Taranus.Macc, -- 10
		legs = "Agwu's Slops", -- 7
		feet = "Amalric Nails +1" -- 6
	} -- 45% + 38% = 83% FC (3% QM)
	
	--This is here if you need it for Utsusemi
	sets.precast.NinjutsuFastCast = set_combine(sets.precast.FastCast, {
		--neck = "Magoraga Beads",
	})
	
	
	sets.midcast = {}
	-- FC here will lower recasts until cap, but its a good idea to put -DT% in midcasts
	sets.midcast.FastRecast = {
		ammo = "Hasty Pinion +1", 
		head = MerlinicHead.FC, -- 13
		neck = "Orunmila's Torque", -- 5
		ear1 = "Malignance Earring", -- 4
		ear2 = "Loquacious Earring", -- 2
		body = "Zendik Robe", -- 13
		hands = "Agwu's Gages", -- 6
		ring1 = "Mephitas's Ring +1",  
		ring2 = "Mephitas's Ring", 
		waist = "Witful Belt", -- 3 (3)
		back = Taranus.Idle, -- 10
		legs = "Agwu's Slops", -- 7
		feet = "Amalric Nails +1" -- 6
	} -- 59% FC | 25% Gear Haste

	
	sets.Weapon_magic = {}
	--Weapon combos specific to mage-only mode
	sets.Weapon_magic.Enhancing_duration = {
		main = "Gada",
		sub = "Ammurapi Shield"
	} -- +18 Skill | +15% Duration
	sets.Weapon_magic.Enhancing_aquaveil = {
		main = "Vadose Rod",
		sub = "Ammurapi Shield"
	} -- +18 Skill | +10% Duration | +1 Aquaveil


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
	
	
	sets.midcast.Enhancing_duration = {
		ammo = "Hasty Pinion +1",
		head = TelchineHead.Enh, 
		neck = "Incanter's Torque", 
        body = TelchineBody.Enh, 
		ear1 = "Mimir Earring", 
		ear2 = "Andoaa Earring", 
		hands = TelchineHands.Enh, 
		ring1 = "Stikini Ring", 
		ring2 = "Stikini Ring", 
        back = "Fi Follet Cape +1", 
		waist = "Embla Sash", 
		legs = TelchineLegs.Enh, 
		feet = TelchineFeet.Enh 
	}
	
	sets.midcast.Enhancing_barspells = {
		ammo = "Hasty Pinion +1",
		head = "Befouled Crown", 
		neck = "Incanter's Torque", 
        body = TelchineBody.Enh, 
		ear1 = "Mimir Earring", 
		ear2 = "Andoaa Earring", 
		hands = TelchineHands.Enh, 
		ring1 = "Stikini Ring", 
		ring2 = "Stikini Ring", 
        back = "Fi Follet Cape +1", 
		waist = "Olympus Sash", 
		legs = "Shedir Seraweels", 
		feet = "Regal Pumps +1" 
	}
	
	sets.midcast.Enhancing_aquaveil = {
		ammo = "Hasty Pinion +1",
		head = "Amalric Coif +1", 
		neck = "Incanter's Torque", 
        body = TelchineBody.Enh, 
		ear1 = "Mimir Earring", 
		ear2 = "Andoaa Earring", 
		hands = "Regal Cuffs", 
		ring1 = "Stikini Ring", 
		ring2 = "Stikini Ring", 
        back = "Fi Follet Cape +1", 
		waist = "Emphatikos Rope", 
		legs = "Shedir Seraweels", 
		feet = "Regal Pumps +1" 
	}
	
	sets.midcast.Enhancing_phalanx = {
		ammo = "Hasty Pinion +1",
		head = MerlinicHead.Phalanx, 
		neck = "Incanter's Torque", 
        body = MerlinicBody.Phalanx, 
		ear1 = "Mimir Earring", 
		ear2 = "Andoaa Earring", 
		hands = MerlinicHands.Phalanx, 
		ring1 = "Stikini Ring", 
		ring2 = "Stikini Ring", 
        back = "Fi Follet Cape +1", 
		waist = "Embla Sash", 
		legs = MerlinicLegs.Phalanx, 
		feet = MerlinicFeet.Phalanx
	}
	
	sets.midcast.Enhancing_stoneskin = {
		ammo = "Hasty Pinion +1",
		head = TelchineHead.Enh, 
		neck = "Loricate Torque +1", 
        body = TelchineBody.Enh, 
		ear1 = "Lugalbanda Earring", 
		ear2 = "Etiolation Earring", 
		hands = TelchineHands.Enh, 
		ring1 = "Gelatinous Ring +1", 
		ring2 = "Defending Ring",
        back = "Fi Follet Cape +1", 
		waist = "Embla Sash", 
		legs = "Shedir Seraweels", 
		feet = TelchineFeet.Enh 
	}
	
	sets.midcast.Enhancing_refresh = {
		ammo = "Hasty Pinion +1",
		head = "Amalric Coif +1", 
		neck = "Loricate Torque +1", 
        body = TelchineBody.Enh, 
		ear1 = "Lugalbanda Earring", 
		ear2 = "Etiolation Earring", 
		hands = TelchineHands.Enh, 
		ring1 = "Gelatinous Ring +1", 
		ring2 = "Defending Ring", 
        back = "Grapevine Cape", 
		waist = "Gishdubar Sash", 
		legs = TelchineLegs.Enh, 
		feet = TelchineFeet.Enh 
	}
	
	sets.midcast.Enhancing_refresh_other = {
		ammo = "Hasty Pinion +1",
		head = "Amalric Coif +1", 
		neck = "Loricate Torque +1", 
        body = TelchineBody.Enh, 
		ear1 = "Lugalbanda Earring", 
		ear2 = "Etiolation Earring", 
		hands = TelchineHands.Enh, 
		ring1 = "Gelatinous Ring +1", 
		ring2 = "Defending Ring", 
        back = Taranus.Idle, 
		waist = "Embla Sash", 
		legs = TelchineLegs.Enh, 
		feet = TelchineFeet.Enh 
	}	


	--Weapon combos specific to mage-only mode
	sets.Weapon_magic.Enfeebling = {
		main = "Bunzi's Rod", 
		sub = "Ammurapi Shield"
	} 
	sets.Weapon_magic.Enfeebling_dispelga = { --Dispelga will always swap regardless of mode
		main = "Daybreak",
		sub = "Ammurapi Shield"
	} 


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
	

	sets.midcast.Enfeebling = {
        ammo="Pemphredo Tathlum",
		head="Spaekona's Petasos +2",
        neck="Sorceror's Stole +1", 
        ear1="Malignance Earring", 
        ear2="Regal Earring", 
		body="Spaekona's Coat +2",
        hands="Regal Cuffs", 
        ring1="Kishar Ring",
        ring2="Metamorph Ring +1", 
        back=Taranus.Macc, 
		waist="Luminary Sash",
        legs="Spaekona's Tonban +2", 
        feet="Spaekona's Sabots +2" 	
	}
	
	sets.midcast.Enfeebling_elemental_debuff = {
        ammo="Pemphredo Tathlum",
		head="Spaekona's Petasos +2",
        neck="Sorceror's Stole +1", 
        ear1="Malignance Earring", 
        ear2="Regal Earring", 
		body="Spaekona's Coat +2",
        hands="Regal Cuffs", 
        ring1="Kishar Ring",
        ring2="Metamorph Ring +1", 
        back=Taranus.Macc, 
		waist="Luminary Sash",
        legs="Archmage's Tonban +3", 
        feet="Archmage's Sabots +3" 	
	}
	
	sets.midcast.Enfeebling_impact = {
        ammo="Pemphredo Tathlum",
		head="",
        neck="Sorceror's Stole +1", 
        ear1="Malignance Earring", 
        ear2="Regal Earring", 
		body="Twilight Cloak",
        hands="Agwu's Gages", 
        ring1="Stikini Ring",
        ring2="Metamorph Ring +1", 
        back=Taranus.Macc, 
		waist="Luminary Sash",
        legs="Spaekona's Tonban +2", 
        feet="Spaekona's Sabots +2" 
	}

	
	--White Magic
	sets.Weapon_magic.FC = {
		main = "Gada",  
		sub = "Genmei Shield"
	} 
	sets.Weapon_magic.Cure = {
	    main="Raetic Rod +1", 
		sub="Genmei Shield"
	} -- 23/10

	
	--Cures
	sets.midcast.Cure = {
		ammo="Hasty Pinion +1", 
		head="Vanya Hood", --10/0
		neck="Incanter's Torque",
		ear1="Malignance Earring",
		ear2="Meili Earring",
        body="Vedic Coat", 
		hands=TelchineHands.Cure, -- 18/0 
        ring1="Janniston Ring +1", --0/6
        ring2="Menelaus's Ring", -- 5/0
        back=Taranus.Idle, 
		waist="Luminary Sash",
		legs="Vanya Slops", 
		feet="Vanya Clogs" --5/0
	} -- 38/6
	
	sets.midcast.Cure_melee = {
		ammo="Hasty Pinion +1", 
		head="Vanya Hood", --10/0
		neck="Incanter's Torque",
		ear1="Malignance Earring",
		ear2="Meili Earring",
        body="Vrikodara Jupon", -- 13/0
		hands=TelchineHands.Cure, -- 18/0
        ring1="Janniston Ring +1", --0/6
        ring2="Menelaus's Ring", -- 5/0
        back=Taranus.Idle, 
		waist="Luminary Sash",
		legs="Vanya Slops", 
		feet="Vanya Clogs" --5/0
	} -- 50/6	
	
	--Cursna+ -> Healing Skill (until new %-tier) -> Haste -> FastCast
	sets.midcast.Cursna = {
		ammo="Hasty Pinion +1", 
		head="Vanya Hood",
		neck="Debilis Medallion",
		ear1="Malignance Earring",
		ear2="Meili Earring",
		body="Zendik Robe",
		hands="Agwu's Gages",
		ring1="Haoma's Ring",
		ring2="Menelaus's Ring",
		back="Oretania's Cape +1",
		waist="Witful Belt",
		legs="Agwu's Slops",
		feet="Vanya Clogs"
	} -- 30% Doom removal rate when not /sch

	--Banish Effect+
	sets.midcast.Banish_effect = {
		head="Ipoca Beret",
		neck="Jokushu Chain",
		back="Disperser's Cape"
	}


	--Black Magic
	sets.Quanpur = {neck="Quanpur Necklace"} --swapped in for Stone Spells
	sets.Duration_boost = {legs="Wicce Chausses +1"} --Only swapped for first cast of -ja spell to increase duration of effect
	
	sets.midcast.Elemental_mab = {
		ammo="Pemphredo Tathlum",
        head="Archmage's Petasos +3", 
        neck="Baetyl Pendant", 
        ear1="Malignance Earring", 
        ear2="Regal Earring", 
        body="Spaekona's Coat +2",
        hands="Archmage's Gloves +3",
        ring1="Metamorph Ring +1", 
        ring2="Freke Ring", 
        back=Taranus.MAB, 
        waist="Acuity Belt +1", 
        legs=MerlinicLegs.MAB,
        feet="Archmage's Sabots +3"
	} 
	
	sets.midcast.Elemental_mab_occult = {
		ammo="Seraphic Ampulla",
        head="Mallquis Chapeau +2", 
        neck="Combatant's Torque", 
        ear1="Crepuscular Earring", 
        ear2="Dedition Earring", 
        --body=MerlinicBody.Occult,
		body="Spaekona's Coat +2",
        hands=MerlinicHands.Occult,
        ring1="Chirich Ring", 
        ring2="Crepuscular Ring", 
        back=Taranus.STP, 
        waist="Oneiros Rope", 
        legs="Perdition Slops",
        feet=MerlinicFeet.Occult
	} --Set provides 1k+ TP on Blizzard VI and Thunder VI w/ Khatvanga weapon set
		--Designed only to refill MP in an emergency or to SC, not for sustained nuking use (DPS is bad, AF Body should make most nukes free)
		--Set automatically overrides non-Death, free-nuke sets when Khatvanga is equipped
		
	sets.midcast.Elemental_mab_meteor = {
		ammo="Pemphredo Tathlum",
        head="Archmage's Petasos +3", 
        neck="Incanter's Torque", 
        ear1="Malignance Earring", 
        ear2="Regal Earring", 
        body="Archmage's Coat +3",
        hands="Archmage's Gloves +3",
        ring1="Stikini Ring", 
        ring2="Stikini Ring", 
        back=Taranus.MAB, 
        waist="Acuity Belt +1", 
        legs=MerlinicLegs.MAB,
        feet="Archmage's Sabots +3"
	}
	
	sets.midcast.Elemental_mab_comet = {
		ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1", 
        neck="Baetyl Pendant", 
        ear1="Malignance Earring", 
        ear2="Regal Earring", 
        body="Spaekona's Coat +2",
        hands="Agwu's Gages",
        ring1="Metamorph Ring +1", 
        ring2="Archon Ring", 
        back=Taranus.MAB, 
        waist="Acuity Belt +1", 
        legs=MerlinicLegs.MAB,
        feet="Archmage's Sabots +3"
	} --I favor FC over Elemental Skill in these sets for the cumulative debuff re-application
	
	sets.midcast.Elemental_mab_comet_burst = {
		ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1", 
        neck="Mizukage-no-Kubikazari", 
        ear1="Malignance Earring", 
        ear2="Regal Earring", 
        body="Spaekona's Coat +2",
        hands="Archmage's Gloves +3",
        ring1="Metamorph Ring +1", 
        ring2="Freke Ring", 
        back=Taranus.MAB, 
        waist="Acuity Belt +1", 
        legs="Ea Slops",
        feet="Agwu's Pigaches"
	}
	
	-- Set to apply increased culmative duration on first -ja cast if bursting
	sets.midcast.Elemental_mab_aja_burst = {
		ammo="Pemphredo Tathlum",
        head="Archmage's Petasos +3", 
        neck="Mizukage-no-Kubikazari", 
        ear1="Malignance Earring", 
        ear2="Regal Earring", 
        body="Spaekona's Coat +2",
        hands="Archmage's Gloves +3",
        ring1="Metamorph Ring +1", 
        ring2="Freke Ring", 
        back=Taranus.MAB, 
        waist="Acuity Belt +1", 
        legs="Wicce Chausses +1",
        feet="Agwu's Pigaches"
	}
	
	--Feel free to add burst sets to optimize for various fights
	sets.midcast.Elemental_burst = {}
	sets.midcast.Elemental_burst.index = {'Normal', 'Ongo'}
	Elemental_burst_ind = 1
	
	sets.midcast.Elemental_burst.Normal = {
        ammo="Pemphredo Tathlum",
		head="Ea Hat", -- 6/6
        neck="Mizukage-no-Kubikazari", -- 10/0 
        ear1="Malignance Earring", 
        ear2="Regal Earring", 
        body="Spaekona's Coat +2", 
        hands="Agwu's Gages", -- 8/4
        ring1="Metamorph Ring +1", 
        ring2="Mujin Band", -- 0/5
        back=Taranus.MAB, -- 5/0
        waist="Acuity Belt +1", 
        legs="Ea Slops", -- 7/7
        feet="Agwu's Pigaches" -- 6/0
	} -- 40/22
	
	sets.midcast.Elemental_burst.Ongo = {
        ammo="Ghastly Tathlum +1",
		head="Ea Hat", -- 6/6
        neck="Quanpur Necklace", 
        ear1="Malignance Earring", 
        ear2="Regal Earring", 
        body="Ea Houppelande", -- 8/8
        hands="Agwu's Gages", -- 8/4
		--hands="Archmage's Gloves +3", -- 20/0
        ring1="Metamorph Ring +1", 
        ring2="Freke Ring",
        back=Taranus.MAB, -- 5/0 
        waist="Acuity Belt +1", 
        legs="Agwu's Slops", -- 9/0
        feet="Agwu's Pigaches" -- 6/0
	} -- 40/18 MBB I/II | 414 (gear/JP/merits) + 756 (skill + Mpaca's Staff) + 415 (dINT <= 415) + 8 (dINT > 415) = 1593 (1582 w/ Agwus Gages) Macc before food (Assumes Mpaca's Staff/Enki Strap) | +397 MAB
	
	sets.midcast.Elemental_burst_melee = {
        ammo="Pemphredo Tathlum",
		head="Ea Hat", -- 6/6
        neck="Mizukage-no-Kubikazari", -- 10/0 
        ear1="Malignance Earring", 
        ear2="Regal Earring", 
        body="Spaekona's Coat +2", 
        hands="Agwu's Gages", -- 8/4
        ring1="Metamorph Ring +1", 
        ring2="Mujin Band", -- 0/5
        back=Taranus.MAB, -- 5/0
        waist="Acuity Belt +1", 
        legs="Ea Slops", -- 7/7
        feet="Agwu's Pigaches" -- 6/0
	} -- 40/22
	
	--Not affected by prior burst set toggles
	sets.midcast.Elemental_death = {
        ammo="Ghastly Tathlum +1",
		head="Pixie Hairpin +1", 
        neck="Sanctity Necklace", 
        ear1="Malignance Earring", 
        ear2="Etiolation Earring", 
        body="Agwu's Robe",
        hands="Amalric Gages +1",
        ring1="Mephitas's Ring +1", 
        ring2="Archon Ring", 
        back=Taranus.Macc, 
        waist="Acuity Belt +1", 
        legs="Agwu's Slops",
        feet="Amalric Nails +1"
	}	
	
	sets.midcast.Elemental_death_burst = {
        ammo="Ghastly Tathlum +1",
		head="Pixie Hairpin +1", 
        neck="Sanctity Necklace", 
        ear1="Static Earring", 
        ear2="Etiolation Earring", 
        body="Ea Houppelande",
        hands="Amalric Gages +1",
        ring1="Mephitas's Ring +1", 
        ring2="Archon Ring", 
        back=Taranus.Macc, 
        waist="Acuity Belt +1", 
        legs="Ea Slops",
        feet="Amalric Nails +1"
	}		
	
	
	--Dark
	sets.Weapon_magic.Dark_drain = {
		main = "Rubicundity", -- 20
		sub = "Ammurapi Shield", 
		ammo = "Pemphredo Tathlum" 
	} -- 20
	
	sets.Weapon_magic.Dark_macc = {
		main = "Mpaca's Staff",
		sub = "Khonsu", 
		ammo = "Pemphredo Tathlum" 
	} -- 5% FC
	
	
	sets.midcast.Dark_drain = {
        ammo="Pemphredo Tathlum", 
		head=MerlinicHead.Aspir, -- 9
        neck="Erra Pendant", -- 5
        ear1="Hirudinea Earring", -- 5 
        ear2="Regal Earring", 
		body="Zendik Robe", 
        hands=MerlinicHands.aspir, -- 10
        ring1="Archon Ring", 
        ring2="Evanescence Ring", -- 10
        back=Taranus.Macc, 
		waist="Fucho-no-obi", -- 8
        legs="Spaekona's Tonban +2", -- 10
        feet="Agwu's Pigaches"-- 30
	} -- 77% Potency
	sets.midcast.Dark_aspir = sets.midcast.Dark_drain
	
	sets.midcast.Dark_drain_death_mode = {
		ammo="Ghastly Tathlum +1", 
		head="Amalric Coif +1", 
        neck="Erra Pendant", -- 5
        ear1="Hirudinea Earring", -- 5 
        ear2="Regal Earring", 
		body="Rosette Jaseran +1", 
        hands="Amalric Gages +1", 
        ring1="Metamorph Ring +1", 
        ring2="Evanescence Ring", 
        back=Taranus.Macc, 
		waist="Fucho-no-obi", -- 8
        legs="Spaekona's Tonban +2", -- 10
        feet="Agwu's Pigaches"-- 30
	} -- +58% Potency | 2139 MP
	
	--FastCast -> Macc -> Skill
	sets.midcast.Dark_stun = {
        ammo="Hasty Pinion +1",
		head="Agwu's Cap", 
        neck="Erra Pendant", 
        ear1="Malignance Earring",
        ear2="Crepuscular Earring",
		body="Zendik Robe", 
        hands="Agwu's Gages", 
        ring1="Metamorph Ring +1", 
        ring2="Evanescence Ring", 
        back=Taranus.Macc, 
		waist="Witful Belt", 
        legs="Agwu's Slops", 
        feet="Agwu's Pigaches" 
	} -- 57% FC | 26% Gear Haste

	--Macc -> Skill
	--Only here if you wish to customize these spells
	sets.midcast.Dark_absorb = {
        ammo="Pemphredo Tathlum",
		head="Spaekona's Petasos +2", 
        neck="Erra Pendant", 
        ear1="Malignance Earring",
        ear2="Regal Earring",
		body="Spaekona's Coat +2", 
        hands="Archmage's Gloves +3", 
        ring1="Kishar Ring", 
        ring2="Metamorph Ring +1", 
        back=Taranus.Macc, 
		waist="Luminary Sash", 
        legs="Spaekona's Tonban +2", 
        feet="Spaekona's Sabots +2" 
	} 
	

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
		head = "Nyame Helm", -- 0/0/7 
		neck = "Warder's Charm +1", 
		ear1 = "Lugalbanda Earring", 
		ear2 = "Etiolation Earring", -- 0/3/0
		body = "Shamash Robe", -- 10/0/0
		hands = "Nyame Gauntlets", -- 0/0/7
		ring1 = "Mephitas's Ring +1", 
		ring2 = "Mephitas's Ring",
		back = Taranus.Idle, -- 10/0/0
		waist = "Carrier's Sash",	
		legs = "Nyame Flanchard", -- 0/0/8
		feet = "Nyame Sollerets" -- 0/0/7		
	} -- 20/3/32


	
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
	MAcc_enfeebles = S{
		'Sleep', 'Sleep II', 'Sleepga', 'Sleepga II', 'Silence', 'Dispel', 'Dispelga', 'Bind', 'Break', 
		'Blind', 'Slow', 'Paralyze', 'Frazzle', 'Distract', 'Addle', 'Gravity', 'Breakga',
		'Burn', 'Choke', 'Shock', 'Drown', 'Rasp', 'Frost', 
		'Repose'}
		
	ElementalDebuff_spells = S{
		'Burn', 'Choke', 'Shock', 'Drown', 'Rasp', 'Frost'}
		
	Cure_spells = S{
		'Cure', 'Cure II', 'Cure III', 'Cure IV', 'Curaga', 'Curaga II', 'Curaga III', 'Cura',
		'Healing Breeze', 'Wild Carrot'}
	
    Skill_spells = S{
        'Temper', 'Temper II', 'Enfire', 'Enfire II', 'Enblizzard', 'Enblizzard II', 'Enaero', 'Enaero II',
        'Enstone', 'Enstone II', 'Enthunder', 'Enthunder II', 'Enwater', 'Enwater II', 'Gain-STR', 'Gain-DEX', 
		'Gain-VIT', 'Gain-AGI', 'Gain-INT', 'Gain-MND', 'Gain-CHR'}
		
	Duration_spells = S{
		'Haste', 'Flurry', 'Blaze Spikes', 'Ice Spikes', 'Shock Spikes',
		'Aurorastorm', 'Voidstorm', 'Sandstorm', 'Rainstorm', 'Windstorm', 'Firestorm', 'Hailstorm', 'Thunderstorm',
		'Protect', 'Protect II', 'Protect III', 'Protect IV', 'Protect V', 'Protectra', 'Protectra II', 'Protectra III', 
		'Shell', 'Shell II', 'Shell III', 'Shell IV', 'Shell V', 'Shellra', 'Shellra II',
		'Barsleep', 'Barpoison', 'Barparalyze', 'Barblind', 'Barsilence', 'Barpetrify', 'Barvirus', 'Baramnesia', 
		'Barsleepra', 'Barpoisonra', 'Barparalyzra', 'Barblindra', 'Barsilencera', 'Barpetra', 'Barvira', 'Baramnesra'}
	
	Barspells = S{
		'Barthunder', 'Barblizzard', 'Barfire', 'Baraero', 'Barwater', 'Barstone', 
		'Barthundra', 'Barblizzara', 'Barfira', 'Baraera', 'Barwatera', 'Barstonra', }
	
	Absorb_spells = S{
		'Absorb-STR', 'Absorb-DEX', 'Absorb-VIT', 'Absorb-AGI', 'Absorb-INT', 'Absorb-MND', 'Absorb-CHR', 'Absorb-ACC'}
		
	Nuke_spells = S{
		'Stone', 'Stone II', 'Stone III', 'Stone IV', 'Stone V', 'Stone VI', 'Stonega', 'Stonega II',  'Stonega III', 
		'Water', 'Water II', 'Water III', 'Water IV', 'Water V', 'Water VI', 'Waterga', 'Waterga II', 'Waterga III', 
		'Aero', 'Aero II', 'Aero III', 'Aero IV', 'Aero V', 'Aero VI', 'Aeroga', 'Aeroga II', 'Aeroga III',
		'Fire', 'Fire II', 'Fire III', 'Fire IV', 'Fire V', 'Fire VI', 'Firaga', 'Firaga II', 'Firaga III', 
		'Blizzard', 'Blizzard II', 'Blizzard III', 'Blizzard IV', 'Blizzard V', 'Blizzard VI', 'Blizzaga', 'Blizzaga II', 'Blizzaga III', 
		'Thunder', 'Thunder II', 'Thunder III', 'Thunder IV', 'Thunder V', 'Thunder VI', 'Thundaga', 'Thundaga II', 'Thundaga III',
		'Holy',
		'Quake', 'Flood', 'Torando', 'Flare', 'Freeze', 'Burst', 'Quake II', 'Flood II', 'Torando II', 'Flare II', 'Freeze II', 'Burst II',  
		'Geohelix', 'Hydrohelix', 'Anemohelix', 'Pyrohelix', 'Cryohelix', 'Ionohelix', 'Noctohelix', 'Luminohelix'}
		
	Nuke_aja_spells = S{
		'Stoneja', 'Waterja', 'Aeroja', 'Firaja', 'Blizzaja', 'Thundaja', 'Comet'}
		
	Stone_spells = S{
		'Stone', 'Stone II', 'Stone III', 'Stone IV', 'Stone V', 'Stone VI', 'Quake', 'Quake II', 
		'Stonega', 'Stonega II', 'Stonega III', 'Stoneja'}
		
	Drain_spells = S{
		'Aspir', 'Aspir II', 'Aspir III', 'Drain'}
		
	Geo_ra_spells = S{
		'Stonera', 'Watera', 'Aera', 'Fira', 'Blizzara', 'Thundara', 
		'Stonera II', 'Watera II', 'Aera II', 'Fira II', 'Blizzara II', 'Thundara II', 
		'Stonera III', 'Watera III', 'Aera III', 'Fira III', 'Blizzara III', 'Thundara III'}
		
	Elemental_WS = S{
		'Seraph Strike', 'Shining Strike', 'Flash Nova', 
		'Rock Crusher', 'Earth Crusher', 'Cataclysm', 'Vidohunir',
		'Aeolian Edge'}	
		
	Unusable_buff = {
		spell={'Charm','Mute','Omerta','Petrification','Silence','Sleep','Stun','Terror'},
		ability={'Amnesia','Charm','Impairment','Petrification','Sleep','Stun','Terror'}}	

	Enmity_actions = S{'Sentinel', 'Shield Bash', 'Souleater', 'Weapon Bash', 'Vallation', 'Valiance', 'Swordplay', 'Pflug', 'Provoke'}
	
	--Leave the Lethargy set in even if it isn't relevant to Geo.
	-- --Duration Timers depend on it, and while it can be removed
	-- --in the later code, it doesn't actually matter that it's here.
	LethargySet = S{
		'Lethargy Chappel', 'Leth. Chappel +1', 'Lethargy Sayon', 'Lethargy Sayon +1', 'Lethargy Gantherots', 'Lethargy Gantherots +1', 
		'Lethargy Fuseau', 'Leth. Fuseau +1', 'Lethargy Houseaux', 'Leth. Houseaux +1'}		

	--Master Base Enfeebling Duration Table (seconds)
	duration30 = S{
		'Break', 'Breakga', 'Bind'} --No conclusive data found on min Bind duration
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
--Haste_mode
Soul_voice = false
Haste_II = true -- RDM will always have access to Haste II, but this is here in case you dont for some reason


-- Sets the default mode for weapons swaps
-- -- Melee(true): Disallows weapon swaps during casts
-- -- Mage(false): Allows weapon swaps during casts
Melee_mode = true

-- Controls sets for precast/midcast to optimize Death
Death_mode = false

-- Sets the default mode for magic bursts
Burst_mode = false


-- Sets the default for -aja duration boost and keeps trck of new mobs added
Ja_duration_boost = false 
Ja_table = {} --Holds the queue of -ja debuffed mobs
Ja_table_ind = 0 --used to create "uniqueness" for each mob in queue
Current_ja_boost = "" --Stores current cumulative magic effect


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
	Melee_mode = true
	Burst_mode = false
	Death_mode = false
	Ja_duration_boost = false
	Notorious_monster = false
	Weapon_lock = false
	DW_mode_ind = 2
	
	send_command('@input /echo BLM Loaded, Current Modes::: Melee_mode: ON | Burst_mode: OFF | Death_mode: OFF | DW_mode: SW')
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
		if spell.english == "Dispelga" then
			if Death_mode == true then
				equip(set_combine(sets.Weapon_magic.Enfeebling_dispelga, sets.precast.FastCast_death_mode))
			else
				equip(set_combine(sets.Weapon_magic.Enfeebling_dispelga, sets.precast.FastCast))
			end
		elseif spell.english == "Impact" then
			if Melee_mode == true then
				equip(sets.precast.FastCast_impact)
			else
				equip(set_combine(sets.Weapon_magic.Enfeebling, sets.precast.FastCast_impact))
			end
		else	
			if Death_mode == true then
				equip(sets.precast.FastCast_death_mode)
			else
				equip(sets.precast.FastCast)
			end
		end
		if (Drain_spells:contains(spell.english) and Death_mode == true) then --this is so far down here to avoid any potential conflicts
			equip(sets.precast.FastCast_death_mode)
		end
	elseif spell.type == 'Ninjutsu' then
		if Death_mode == true then
			equip(sets.precast.FastCast_death_mode)
		else
			equip(set_combine(sets.precast.FastCast_death_mode, sets.precast.NinjutsuFastCast))
		end
	elseif spell.type == 'Waltz' then
		equip(sets.Waltz)
	elseif spell.type == "WeaponSkill" then
		if player.tp >= 1000 then
			--handles close-range WS's
			if spell.target.distance <= 5.5 then			
				if spell.english == "Black Halo" then
					equip(sets.BlackHalo[sets.WS.index[WS_ind]])
				end
				if spell.english == "Realmrazer" then
					equip(sets.Realmrazer[sets.WS.index[WS_ind]])
				end
				if spell.english == "Judgment" then
					equip(sets.Judgment[sets.WS.index[WS_ind]])
				end
				if spell.english == "Flash Nova" then
					equip(sets.SeraphStrike[sets.WS.index[WS_ind]])
					if world.day_element == "Light" or world.weather_element == "Light" then
						equip(sets.obi)
					end
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
				if spell.english == "Myrkr" then
					equip(sets.Myrkr)
				end
				if spell.english == "Gate of Tartarus" then
					equip(sets.GateOfTartarus[sets.WS.index[WS_ind]])
				end
				if spell.english == "Retribution" then
					equip(sets.Retribution[sets.WS.index[WS_ind]])
				end
				if spell.english == "Spirit Taker" then
					equip(sets.SpiritTaker[sets.WS.index[WS_ind]])
				end
				if spell.english == "Shell Crusher" then
					equip(sets.ShellCrusher[sets.WS.index[WS_ind]])
				end
				if spell.english == "Vidohunir" then
					equip(sets.Vidohunir[sets.WS.index[WS_ind]])
					if world.day_element == "Dark" or world.weather_element == "Dark" then
						equip(sets.obi)
					end
				end
				if spell.english == "Cataclysm" then
					equip(sets.Cataclysm[sets.WS.index[WS_ind]])
					if world.day_element == "Dark" or world.weather_element == "Dark" then
						equip(sets.obi)
					end
				end
				if spell.english == "Earth Crusher" then
					equip(sets.EarthCrusher[sets.WS.index[WS_ind]])
					if world.day_element == "Earth" or world.weather_element == "Earth" then
						equip(sets.obi)
					end
				end
				if spell.english == "Rock Crusher" then
					equip(sets.RockCrusher[sets.WS.index[WS_ind]])
					if world.day_element == "Earth" or world.weather_element == "Earth" then
						equip(sets.obi)
					end
				end
				if spell.english == "Wasp Sting" or 
						spell.english == "Viper Bite" or 
						spell.english == "Full Swing" or
						spell.english == "Heavy Swing"
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
	elseif spell.english == "Manafont" then
		equip(sets.Bolster)
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
		equip(sets.obi)
	end
end

function midcast(spell, buff, act)
	--Handles generic recasts as a fallback
	if (spell.type == 'WhiteMagic' or spell.type == 'BlackMagic' or spell.type == 'Ninjutsu' or spell.type == 'Trust') then
		equip(sets.midcast.FastRecast)
	end
	
	
	--Enfeebling Magic
	if MAcc_enfeebles:contains(spell.english) then
		if spell.english == "Dispelga" then
			equip(
				set_combine(
					sets.Weapon_magic.Enfeebling_dispelga, 
					sets.midcast.Enfeebling
				)
			)
		elseif Melee_mode == true then
			equip(sets.midcast.Enfeebling)
		else
			equip(
				set_combine(
					sets.Weapon_magic.Enfeebling, 
					sets.midcast.Enfeebling
				)
			)
		end
	end
	if spell.english == 'Impact' then --this is elemental magic, but is used as a debuff
		if Melee_mode == true then
			equip(sets.midcast.Enfeebling_impact)
		else
			equip(
				set_combine(
					sets.Weapon_magic.Enfeebling, 
					sets.midcast.Enfeebling_impact
				)
			)
		end
	end
	if ElementalDebuff_spells:contains(spell.english) then
		if Melee_mode == true then
			equip(sets.midcast.Enfeebling_elemental_debuff)
		else
			equip(
				set_combine(
					sets.Weapon_magic.Enfeebling, 
					sets.midcast.Enfeebling_elemental_debuff
				)
			)
		end
	end

	
	--Enhancing Magic
	if (Skill_spells:contains(spell.english) or Duration_spells:contains(spell.english)) then
		if Melee_mode == true then
			equip(sets.midcast.Enhancing_duration)
		else
			equip(
				set_combine(
					sets.Weapon_magic.Enhancing_duration, 
					sets.midcast.Enhancing_duration
				)
			)
		end
	end
	if Barspells:contains(spell.english) then
		if Melee_mode == true then
			equip(sets.midcast.Enhancing_barspells)
		else
			equip(
				set_combine(
					sets.Weapon_magic.Enhancing_duration, 
					sets.midcast.Enhancing_barspells
				)
			)
		end
	end
	if spell.english == 'Aquaveil' then
		if Melee_mode == true then
			equip(sets.midcast.Enhancing_aquaveil)
		else
			equip(
				set_combine(
					sets.Weapon_magic.Enhancing_aquaveil, 
					sets.midcast.Enhancing_aquaveil
				)
			)
		end
	end
	if spell.english == 'Stoneskin' then
		if Melee_mode == true then
			equip(sets.midcast.Enhancing_stoneskin)
		else
			equip(
				set_combine(
					sets.Weapon_magic.Enhancing_duration, 
					sets.midcast.Enhancing_stoneskin
				)
			)
		end
	end
	if spell.english == 'Refresh' then
		if Melee_mode == true then
			equip(sets.midcast.Enhancing_refresh)
		else
			equip(
				set_combine(
					sets.Weapon_magic.Enhancing_duration, 
					sets.midcast.Enhancing_refresh
				)
			)
		end
		if spell.target.type ~= 'SELF' then
			if Melee_mode == true then
				equip(sets.midcast.Enhancing_refresh_other)
			else
				equip(
					set_combine(
						sets.Weapon_magic.Enhancing_duration, 
						sets.midcast.Enhancing_refresh_other
					)
				)
			end
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
		if Melee_mode == true then
			equip(sets.midcast.Cursna)
		else
			equip(
				set_combine(
					sets.midcast.Cursna, 
					sets.Weapon_magic.FC
				)
			)
		end
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
				if player.equipment.main == 'Khatvanga' then
					equip(sets.midcast.Elemental_mab_occult)
				else
					equip(sets.midcast.Elemental_mab)
				end
			else
				equip(
					set_combine(
						sets.Weapon_melee[sets.Weapon_melee.index[Weapon_melee_ind]], 
						sets.midcast.Elemental_mab
					)
				)
			end
			if Stone_spells:contains(spell.english) then
				equip(sets.Quanpur)
			end
		else
			if Melee_mode == true then
				equip(
					sets.midcast.Elemental_burst_melee
				)
			else
				equip(
					set_combine(
						sets.Weapon_melee[sets.Weapon_melee.index[Weapon_melee_ind]], 
						sets.midcast.Elemental_burst[sets.midcast.Elemental_burst.index[Elemental_burst_ind]]
					)
				)
			end
		end
	end
	if (Nuke_aja_spells:contains(spell.english) and (Ja_duration_boost == false or Current_ja_boost ~= spell.english)) then -- applies duration boost
		equip(
			set_combine(
				sets.midcast.Elemental_mab, 
				sets.Duration_boost
			)
		)
		if spell.english == 'Comet' then
			equip(
				set_combine(
					sets.midcast.Elemental_mab_comet,
					sets.Duration_boost
				)
			)
		end
	elseif Nuke_aja_spells:contains(spell.english) then -- handles as normal nukes
		if Burst_mode == false then
			if Melee_mode == true then
				if player.equipment.main == 'Khatvanga' then
					equip(sets.midcast.Elemental_mab_occult)
				else
					equip(sets.midcast.Elemental_mab)
					if spell.english == 'Comet' then
						equip(sets.midcast.Elemental_mab_comet)
					end
				end
			else 
				equip(
					set_combine(
						sets.Weapon_melee[sets.Weapon_melee.index[Weapon_melee_ind]], 
						sets.midcast.Elemental_mab
					)
				)
				if spell.english == 'Comet' then
					equip(
						set_combine(
							sets.Weapon_melee[sets.Weapon_melee.index[Weapon_melee_ind]], 
							sets.midcast.Elemental_mab_comet
						)
					)
				end
			end
			if Stone_spells:contains(spell.english) then
				equip(sets.Quanpur)
			end			
		else
			if Melee_mode == true then
				equip(sets.midcast.Elemental_burst)
				if spell.english == 'Comet' then
					equip(sets.midcast.Elemental_mab_comet_burst)
				end
			else 
				equip(
					set_combine(
						sets.Weapon_melee[sets.Weapon_melee.index[Weapon_melee_ind]], 
						sets.midcast.Elemental_burst[sets.midcast.Elemental_burst.index[Elemental_burst_ind]]
					)
				)
				if spell.english == 'Comet' then
					equip(
						set_combine(
							sets.Weapon_melee[sets.Weapon_melee.index[Weapon_melee_ind]], 
							sets.midcast.Elemental_mab_comet_burst
						)
					)
				end
			end
		end
	end
	if spell.english == 'Death' then
		if Burst_mode == false then
			if Melee_mode == true then
				equip(sets.midcast.Elemental_death)
			else
				equip(
					set_combine(
						sets.Weapon_melee[sets.Weapon_melee.index[Weapon_melee_ind]], 
						sets.midcast.Elemental_death
					)
				)
			end
		else
			if Melee_mode == true then
				equip(sets.midcast.Elemental_death_burst)
			else
				equip(
					set_combine(
						sets.Weapon_melee[sets.Weapon_melee.index[Weapon_melee_ind]], 
						sets.midcast.Elemental_death_burst
					)
				)
			end
		end
	end
	if spell.english == 'Meteor' then
		if Melee_mode == true then
			equip(sets.Elemental_mab_meteor)
		else
			equip(
				set_combine(
					sets.Weapon_melee[sets.Weapon_melee.index[Weapon_melee_ind]], 
					sets.Elemental_mab_meteor
				)
			)
		end
	end

	
	--Dark Magic
	if Drain_spells:contains(spell.english) then
		if Melee_mode == true then
			equip(sets.midcast.Dark_drain)
		else
			equip(
				set_combine(
					sets.Weapon_magic.Dark_drain, 
					sets.midcast.Dark_drain
				)
			)
		end
		if (player.mpp > 60 and Death_mode == true and spell.english ~= 'Drain') then
			if Melee_mode == true then
				equip(sets.midcast.Dark_drain_death_mode)
			else
				equip(
					set_combine(
						sets.Weapon_magic.Dark_drain, 
						sets.midcast.Dark_drain_death_mode
					)
				)
			end
		end
	end
	if spell.english == "Stun" then
		if Melee_mode == true then
			equip(sets.midcast.Dark_stun)
		else
			equip(
				set_combine(
					sets.Weapon_magic.Dark_macc, 
					sets.midcast.Dark_stun
				)
			)
		end
	end
	if Absorb_spells:contains(spell.english) then
		if Melee_mode == true then
			equip(sets.midcast.Dark_absorb)
		else
			equip(
				set_combine(
					sets.Weapon_magic.Dark_macc, 
					sets.midcast.Dark_absorb
				)
			)
		end
	end
	
	
	--Spell Hooks for Obi
	if (Cure_spells:contains(spell.english) or 
		Nuke_spells:contains(spell.english) or
		Geo_ra_spells:contains(spell.english) or
		(spell.english == "Drain" or spell.english == "Aspir")) 
		and 
		(spell.element == world.day_element or spell.element == world.weather_element) 
	then
		equip(sets.obi)
	end
	
	
	--Mana Wall Override
	equip(sets.ManaWall_override[sets.ManaWall_override.index[ManaWall_override_ind]])
end

function aftercast(spell)
	if spell.skill == "Enfeebling Magic" and (spell.english ~= "Dispel" and spell.english ~= "Dispelga") then
		if not spell.interrupted then
			set_enfeebling_duration_timer(spell)
		end
	end
	if Nuke_aja_spells:contains(spell.english) then	
		if (Ja_duration_boost == false or Current_ja_boost ~= spell.english) then
			Current_ja_boost = spell.english
			Ja_table_ind = Ja_table_ind + 1
			table.insert(Ja_table, tostring(spell.target.name .. " #" .. Ja_table_ind))
			send_command('timers create "'.. spell.english .. ': ' .. Ja_table[Ja_table_ind] .. '" 100 down spells/01015.png')
			Ja_duration_boost = true
			send_command('wait 100;input //gs c reset Aja_duration Timer')
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
		if Melee_mode == true then -- melee mode engaged
			melee_mode_engaged_set()
		else -- mage mode engaged
			mage_mode_engaged_set()
		end
	end
end

function idle_set()
	if Death_mode == true then
		equip(
			set_combine(		
				sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]],
				sets.Idle.Death
			)
		)
		if buffactive['Sublimation: Activated'] then
			equip(sets.Sublimation)
		end
	else
		if buffactive['Mana Wall'] then
			equip(
				set_combine(
					sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]],
					sets.Idle_mana_wall[sets.Idle_mana_wall.index[Idle_mana_wall_ind]]
				)
			)
		else
			equip(
				set_combine(		
					sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]],
					sets.Idle[sets.Idle.index[Idle_ind]]
				)
			)
			if buffactive['Sublimation: Activated'] then
				equip(sets.Sublimation)
			end
		end
	end
end

function melee_mode_engaged_set()
	equip(	
		set_combine(
			sets.TP[sets.TP.index[TP_ind]].Other,
			sets.TP[sets.TP.index[TP_ind]][sets.SJ.index[SJ_ind]]["Haste_"..hasteVal],
			sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]]
		)
	)
end

function mage_mode_engaged_set()
	equip(	
		set_combine(
			sets.TP[sets.TP.index[TP_ind]][sets.SJ.index[SJ_ind]]["Haste_"..hasteVal],
			sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]]
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
		Idle_pet_ind = Idle_pet_ind - 1
		Idle_melee_DW_ind = Idle_melee_DW_ind - 1
		if Idle_ind < 1 then
			Idle_ind = #sets.Idle.index
			Idle_melee_DW_ind = #sets.Idle_melee_DW.index
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
	elseif command == "toggle Mana Wall override" then
		ManaWall_override_ind = ManaWall_override_ind + 1	
		if ManaWall_override_ind > #sets.ManaWall_override.index then
			ManaWall_override_ind = 1			
		end
		send_command("@input /echo <----- Mana Wall Override " .. sets.ManaWall_override.index[ManaWall_override_ind] .. " ----->")
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
	elseif command == "toggle Burst set" then
		Elemental_burst_ind = Elemental_burst_ind + 1
		if Elemental_burst_ind > #sets.midcast.Elemental_burst.index then
			Elemental_burst_ind = 1			
		end
		send_command("@input /echo <----- Burst set changed to " .. sets.midcast.Elemental_burst.index[Elemental_burst_ind] .. " ----->")
		determine_haste_sets()
	elseif command == "toggle Death Mode" then
		if Death_mode == false then
			Death_mode = true
			send_command("@input /echo <----- Death Mode ON ----->")
		else
			Death_mode = false
			send_command("@input /echo <----- Death Mode OFF ----->")
		end
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
	elseif command == "reset Aja_duration Timer" then
		send_command("@input /echo <----- ".. Ja_table[1] ..": Cumulative Magic Effect Has Worn Off ----->")
		table.remove(Ja_table,1)
		Ja_table_ind = Ja_table_ind - 1
		if Ja_table[1] == nil then
			Ja_duration_boost = false
			send_command("@input /echo <----- All Cumulative Magic Duration Effects Have Expired ----->")
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