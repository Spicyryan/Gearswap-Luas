-- 
-- @author Thefoxdanger of Asura
-- MNK.lua v1.0
--
-- 
-- Intermediate MNK lua created to streamline play with as few toggles and other things to press as possible. Designed to be similar in 
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
send_command("bind f7 gs c toggle DT set") -- F7 prepares, but does not switch to, DT sets (regardless of whether DT Mode is active)
send_command("bind !f7 gs c toggle DT set reverse") -- Alt+F7 prepares, but does not switch to, DT sets in reverse (regardless of whether DT Mode is active)

send_command("bind @e gs c toggle Haste Mode") -- WIN+F9 Toggles between SV/Bolster, HasteII and Low haste modes
send_command("bind !f8 gs c toggle DT Mode") -- Alt+F8 swap between Normal and DT sets
send_command("bind @f12 gs c toggle Kite Mode") -- Enables kiting sets


--numpad controls for WS's
-- -- CTRL key for Sword / Club WS
send_command('bind ^numpad0 @input /ws "Victory Smite" <t>')
send_command('bind ^numpad1 @input /ws "Howling Fist" <t>')
send_command('bind ^numpad2 @input /ws "Asuran Fists" <t>')
send_command('bind ^numpad3 @input /ws "Shijin Spiral" <t>')
send_command('bind ^numpad4 @input /ws "Raging Fists" <t>')
send_command('bind ^numpad5 @input /ws "Final Heaven" <t>')
send_command('bind ^numpad6 @input /ws "Spinning Attack" <t>')
send_command('bind ^numpad7 @input /ws "Shell Crusher" <t>')
send_command('bind ^numpad8 @input /ws "Cataclysm" <t>')
send_command('bind ^numpad9 @input /ws "" <t>') -- empty for custom
-- -- Alt key 
send_command('bind !numpad0 @input /ja "Chi Blast" <t>') 
send_command('bind !numpad1 @input /ja "Impetus" <me>')  
send_command('bind !numpad2 @input /ja "Focus" <me>') 
send_command('bind !numpad3 @input /ja "Boost" <me>') 
send_command('bind !numpad4 @input /ja "Footwork" <me>') 
send_command('bind !numpad5 @input /ja "Dodge" <me>') 
send_command('bind !numpad6 @input /ja "Counterstance" <me>')  
send_command('bind !numpad7 @input /ja "Mantra" <me>') 
send_command('bind !numpad8 @input /ja "Charka" <me>') 
send_command('bind !numpad9 @input /ja "Inner Strength" <me>') 


--Variables
Shadow_type = 'None'
Melee_mode = true
Kite_mode = false
Impetus = false
Impetus_counter = 0


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
	set_macros(1,19)
	---Set Lockstyle Here
	set_style(13)
	
	--Set at what point you want Impetus to be active
	-- -- Lua uses the code from Kinematics MNK lua to determine the #of hits without missing
	-- -- You want to make sure Impetus is providing enough of a bonus for it's specific 
	-- -- equipment to be worthwhile. Change the value below to determine what you feel would be best
	-- -- based on your sets.
	Impetus_limit = 13 -- I chose this number to keep the accuracy value in-line with my TP sets
	
	
	--Gear Sets Start Here
	--Augmented Gear
    Segomo = {}
	Segomo.Idle = { name="Segomo's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Enmity+10','Magic dmg. taken-10%',}}
	Segomo.DA = { name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	Segomo.Counter = { name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','System: 1 ID: 640 Val: 4',}}
	Segomo.VIT_WSD = { name="Segomo's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	Segomo.STR_DA = { name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	Segomo.Crit = { name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Crit.hit rate+10','Phys. dmg. taken-10%',}}
	Segomo.FC = { name="Segomo's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','"Fast Cast"+10','Phys. dmg. taken-10%',}}
	
	TaeonHead = {}
	TaeonHead.Phalanx = { name="Taeon Chapeau", augments={'Accuracy+21','Spell interruption rate down -10%','Phalanx +3',}}
	TaeonHead.DW = { name="Taeon Chapeau", augments={'Accuracy+22','"Dual Wield"+5','DEX+10',}}

	TaeonBody = {}
	TaeonBody.SIR = { name="Taeon Tabard", augments={'Mag. Evasion+10','Spell interruption rate down -10%','Phalanx +3',}}
	
	TaeonHands = {}
	TaeonHands.DW = { name="Taeon Gloves", augments={'Accuracy+20','"Dual Wield"+5','DEX+10',}}
	
	TaeonLegs = {}
	TaeonLegs.DW = { name="Taeon Tights", augments={'Accuracy+23','"Dual Wield"+5','DEX+10',}}
	
	TaeonFeet = {}
	TaeonFeet.DW = { name="Taeon Boots", augments={'Accuracy+20 Attack+20','"Dual Wield"+5','Crit. hit damage +3%',}}
	
		
	HercHelm = {}
	
	HercBody = {}
	HercBody.Phalanx = { name="Herculean Vest", augments={'"Dbl.Atk."+2','MND+7','Phalanx +5',}}
	
	HercHands = {}
	HercHands.WSD = { name="Herculean Gloves", augments={'"Store TP"+3','DEX+13','Weapon skill damage +8%','Accuracy+15 Attack+15',}}
	HercHands.TP = { name="Herculean Gloves", augments={'Accuracy+14 Attack+14','Pet: Accuracy+15 Pet: Rng. Acc.+15','Quadruple Attack +3','Mag. Acc.+13 "Mag.Atk.Bns."+13',}}
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
	
	
	--Weapon Sets (Melee)--
	sets.Weapon_melee = {} -- sets weapon combo for melee-mode
	sets.Weapon_melee.index = {"Custom", "Godhands", "Spharai", "Malignance", "Xoanon"}
	Wm_ind = 1
	sets.Weapon_melee.Godhands = {
		main = "Godhands"
	}
	sets.Weapon_melee.Spharai = {
		main = "Spharai"
	}
	sets.Weapon_melee.Malignance = {
		main = "Malignance Pole",
		sub = "Bloodrain Strap"
	}
	sets.Weapon_melee.Xoanon = {
		main = "Xoanon",
		sub = "Bloodrain Strap"
	}	
	sets.Weapon_melee.Custom = {}
	
	
	--Idle Sets--
	sets.Idle = {}
	sets.Idle.index = {"Standard", "DT", "Evasion"}
	Idle_ind = 1
	sets.Idle.Standard = { -- Killer Focus
		ammo = "Staunch Tathlum +1", -- 0/0/3
		head = "Mpaca's Cap", -- 7/0/0
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", 
		ear2 = "Odnowa Earring +1", -- 0/2/3
		body = "Mpaca's Doublet", -- 10/0/0
		hands = "Mpaca's Gloves", -- 8/0/0
		ring1 = "Defending Ring", 
		ring2 = "Sheltered Ring",
		back = Segomo.Idle, -- 0/10/0
		waist = "Engraved Belt",	
		legs = "Mpaca's Hose", -- 9/0/0
		feet = "Mpaca's Boots" -- 6/0/0
	} -- Killer +16 | 40/12/22 | MDB +62 | +459 Meva
	sets.Idle.DT = { -- Capped DT, High Def, and High MDB
		ammo = "Staunch Tathlum +1", -- 0/0/3
		head = "Nyame Helm", -- 0/0/7
		neck = "Loricate Torque +1", -- 0/0/6 
		ear1 = "Eabani Earring", 
		ear2 = "Odnowa Earring +1", -- 0/2/3
		body = "Mpaca's Doublet", -- 10/0/0
		hands = "Nyame Gauntlets", -- 0/0/7
		ring1 = "Shadow Ring", 
		ring2 = "Sheltered Ring", 
		back = Segomo.Idle, -- 0/10/0
		waist = "Engraved Belt",
		legs = "Mpaca's Hose", -- 9/0/0
		feet = "Nyame Sollerets" -- 0/0/7
	} -- 19/12/33
	sets.Idle.Evasion = { -- Eva-Focus
		ammo = "Staunch Tathlum +1", -- 0/0/3
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Bathy Choker +1",  
		ear1 = "Eabani Earring", 
		ear2 = "Infused Earring", 
		body = "Malignance Tabard", -- 0/0/9
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Defending Ring", -- 0/0/10
		ring2 = "Vengeful Ring", 
		back = Segomo.Idle, -- 0/10/0
		waist = "Sveltesse Gouriz +1",	
		legs = "Malignance Tights", -- 0/0/7
		feet = "Malignance Boots" -- 0/0/4
	} -- 0/10/44 | Eva +672 | +301 AGI


	--TP Sets (melee)--
	--For DW sets I choose to set DW5 in traits, make sure to adjust accordingly if you set less (most do).
	--As reference, DW5 is the same trait as a NIN would have.
	sets.TP = {}
	sets.TP.index = {"Standard", "Acc", "HighAcc", "SB"}
	TP_ind = 1
	
	sets.TP.Staff = {} -- Staff Sets	
	sets.TP.Staff.Standard = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Anu Torque", 
		ear1 = "Sherida Earring",  
		ear2 = "Schere Earring", 
		body = "Kendatsuba Samue +1", 
		hands = "Tatenashi Gote +1", 
		ring1 = "Gere Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",
		legs = "Tatenashi Haidate +1", 
		feet = "Tatenashi Sune-ate +1"
	} -- sTP+61 | 18DA/27TA/3QA | 10/0/31
	
	sets.TP.Staff.Acc = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Combatant's Torque", 
		ear1 = "Sherida Earring",  
		ear2 = "Schere Earring", 
		body = "Kendatsuba Samue +1", 
		hands = "Tatenashi Gote +1", 
		ring1 = "Gere Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",
		legs = "Tatenashi Haidate +1", 
		feet = "Tatenashi Sune-ate +1"
	} -- sTP+50 | 24DA/27TA/3QA | 10/0/31
	
	sets.TP.Staff.HighAcc = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Combatant's Torque", 
		ear1 = "Sherida Earring",  
		ear2 = "Schere Earring", 
		body = "Kendatsuba Samue +1", 
		hands = "Gazu Bracelet +1", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",
		legs = "Tatenashi Haidate +1", 
		feet = "Tatenashi Sune-ate +1"
	} -- sTP+52 | 24DA/18TA/0QA | 10/0/31
	
	sets.TP.Staff.SB = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Anu Torque", 
		ear1 = "Sherida Earring",  
		ear2 = "Dignitary's Earring", 
		body = "Kendatsuba Samue +1", 
		hands = "Tatenashi Gote +1", 
		ring1 = "Gere Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",
		legs = "Mpaca's Hose", 
		feet = "Tatenashi Sune-ate +1"
	} -- sTP+42 | 18DA/27TA/3QA | 10/0/31 | 50 SB / 25 SBII	


	sets.TP.H2H = {}
	sets.TP.H2H.Normal = {}
	sets.TP.H2H.Normal.Standard = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Dedition Earring", 		
		body = "Kendatsuba Samue +1", 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Gere Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Bhikku Hose +1", 
		feet = "Tatenashi Sune-ate +1"
	} -- sTP+55 | 18DA/24TA/3QA/69KA

	sets.TP.H2H.Normal.Acc = {
		ammo = "Coiste Bodhar",
		head = "Ryuo Somen +1", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Crepuscular Earring", 		
		body = "Kendatsuba Samue +1", 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Gere Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Tatenashi Haidate +1", 
		feet = "Tatenashi Sune-ate +1"
	} -- sTP+55 | 18DA/24TA/3QA/49KA

	sets.TP.H2H.Normal.HighAcc = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Schere Earring", 		
		body = "Kendatsuba Samue +1", 
		hands = "Gazu Bracelet +1", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Tatenashi Haidate +1", 
		feet = "Tatenashi Sune-ate +1"
	} -- sTP+42 | 24DA/18TA/0QA/49KA
	
	sets.TP.H2H.Normal.SB = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Schere Earring", 		
		body = "Kendatsuba Samue +1", 
		hands = "Tatenashi Gote +1", 
		ring1 = "Chirich Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Mpaca's Hose", 
		feet = "Tatenashi Sune-ate +1"
	} -- sTP+55 | 18DA/23TA/3QA/49KA | 50 SB / 25 SBII	

	
	--Impetus sets
	sets.TP.H2H.Impetus = {}
	sets.TP.H2H.Impetus.Standard = {	
		ammo = "Coiste Bodhar",
		head = "Adhemar Bonnet +1", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Dedition Earring", 		
		body = "Bhikku Cyclas +1", 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Gere Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Bhikku Hose +1", 
		feet = "Tatenashi Sune-ate +1"
	} -- sTP+49 | 18DA/22TA/3QA/69KA

	sets.TP.H2H.Impetus.Acc = {
		ammo = "Coiste Bodhar",
		head = "Adhemar Bonnet +1", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Crepuscular Earring", 		
		body = "Bhikku Cyclas +1", 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Gere Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Tatenashi Haidate +1", 
		feet = "Tatenashi Sune-ate +1"
	} -- sTP+46 | 18DA/25TA/3QA/49KA

	sets.TP.H2H.Impetus.HighAcc = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Schere Earring", 		
		body = "Bhikku Cyclas +1", 
		hands = "Gazu Bracelet +1", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Tatenashi Haidate +1", 
		feet = "Tatenashi Sune-ate +1"
	} -- sTP+51 | 24DA/20TA/0QA/49KA
	
	sets.TP.H2H.Impetus.SB = {
		ammo = "Coiste Bodhar",
		head = "Adhemar Bonnet +1", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Dedition Earring", 		
		body = "Bhikku Cyclas +1", 
		hands = "Tatenashi Gote +1", 
		ring1 = "Chirich Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Mpaca's Hose", 
		feet = "Tatenashi Sune-ate +1"
	} -- sTP+54 | 18DA/27TA/3QA/49KA | 50 SB / 25 SBII	
	
	--Footwork sets (+20KA)
	sets.TP.H2H.Footwork = {}
	sets.TP.H2H.Footwork.Standard = {	-- "Guaranteed" extra hit in an attack round
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Dedition Earring", 		
		body = "Mpaca's Doublet", 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Gere Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Hesychast's Hose +3", 
		feet = "Anchorite's Gaiters +3"
	} -- sTP+46 | 18DA/19TA/3QA/98KA

	sets.TP.H2H.Footwork.Acc = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Crepuscular Earring", 		
		body = "Malignance Tabard", 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Gere Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Hesychast's Hose +3", 
		feet = "Anchorite's Gaiters +3"
	} -- sTP+49 | 18DA/15TA/3QA/98KA

	sets.TP.H2H.Footwork.HighAcc = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Schere Earring", 		
		body = "Malignance Tabard", 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Hesychast's Hose +3", 
		feet = "Anchorite's Gaiters +3"
	} -- sTP+54 | 24DA/10TA/0QA/98KA
	
	sets.TP.H2H.Footwork.SB = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Dignitary's Earring", 		
		body = "Kendatsuba Samue +1", 
		hands = "Tatenashi Gote +1", 
		ring1 = "Gere Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Mpaca's Hose", 
		feet = "Anchorite's Gaiters +3"
	} -- sTP+37 | 18DA/25TA/3QA/78KA | 50 SB / 25 SBII		
	

	--Spharai sets
	sets.TP.Spharai_AM = {}
	
	sets.TP.Spharai_AM.Normal = {}
	sets.TP.Spharai_AM.Normal.Standard = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Dedition Earring", 		
		body = "Kendatsuba Samue +1", 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Gere Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Tatenashi Haidate +1", 
		feet = "Tatenashi Sune-ate +1"
	} -- sTP+47 | 18DA/27TA/3QA/64KA

	sets.TP.Spharai_AM.Normal.Acc = {
		ammo = "Coiste Bodhar",
		head = "Ryuo Somen +1", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Crepuscular Earring", 		
		body = "Kendatsuba Samue +1", 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Gere Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Tatenashi Haidate +1", 
		feet = "Tatenashi Sune-ate +1"
	} -- sTP+55 | 18DA/24TA/3QA/64KA

	sets.TP.Spharai_AM.Normal.HighAcc = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Schere Earring", 		
		body = "Kendatsuba Samue +1", 
		hands = "Gazu Bracelet +1", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Tatenashi Haidate +1", 
		feet = "Tatenashi Sune-ate +1"
	} -- sTP+42 | 24DA/18TA/0QA/64KA
	
	sets.TP.Spharai_AM.Normal.SB = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Schere Earring", 		
		body = "Kendatsuba Samue +1", 
		hands = "Tatenashi Gote +1", 
		ring1 = "Gere Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Mpaca's Hose", 
		feet = "Tatenashi Sune-ate +1"
	} -- sTP+55 | 18DA/23TA/3QA/64KA | 50 SB / 25 SBII	

	
	--Impetus sets for Spharai
	sets.TP.Spharai_AM.Impetus = {}
	sets.TP.Spharai_AM.Impetus.Standard = {	
		ammo = "Coiste Bodhar",
		head = "Adhemar Bonnet +1", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Schere Earring", 		
		body = "Bhikku Cyclas +1", 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Gere Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Tatenashi Haidate +1", 
		feet = "Tatenashi Sune-ate +1"
	} -- sTP+31 | 24DA/25TA/3QA/69KA

	sets.TP.Spharai_AM.Impetus.Acc = {
		ammo = "Coiste Bodhar",
		head = "Adhemar Bonnet +1", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Schere Earring", 		
		body = "Bhikku Cyclas +1", 
		hands = "Adhemar Wristbands +1", 
		ring1 = "Gere Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Tatenashi Haidate +1", 
		feet = "Tatenashi Sune-ate +1"
	} -- sTP+31 | 24DA/25TA/3QA/69KA

	sets.TP.Spharai_AM.Impetus.HighAcc = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Schere Earring", 		
		body = "Bhikku Cyclas +1", 
		hands = "Gazu Bracelet +1", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Tatenashi Haidate +1", 
		feet = "Tatenashi Sune-ate +1"
	} -- sTP+34 | 24DA/16TA/0QA/69KA
	
	sets.TP.Spharai_AM.Impetus.SB = {
		ammo = "Coiste Bodhar",
		head = "Adhemar Bonnet +1", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Dedition Earring", 		
		body = "Bhikku Cyclas +1", 
		hands = "Tatenashi Gote +1", 
		ring1 = "Gere Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Mpaca's Hose", 
		feet = "Tatenashi Sune-ate +1"
	} -- sTP+23 | 24DA/26TA/3QA/69KA | 50 SB / 25 SBII
	
	--Footwork sets for Spharai (+35KA)
	sets.TP.Spharai_AM.Footwork = {}
	sets.TP.Spharai_AM.Footwork.Standard = {	
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Dedition Earring", 		
		body = "Malignance Tabard", 
		hands = "Tatenashi Gote +1", 
		ring1 = "Gere Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Tatenashi Haidate +1", 
		feet = "Anchorite's Gaiters +3"
	} -- sTP+51 | 18DA/18TA/3QA/94KA

	sets.TP.Spharai_AM.Footwork.Acc = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Crepuscular Earring", 		
		body = "Malignance Tabard", 
		hands = "Tatenashi Gote +1", 
		ring1 = "Gere Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Tatenashi Haidate +1", 
		feet = "Anchorite's Gaiters +3"
	} -- sTP+48 | 18DA/18TA/3QA/94KA

	sets.TP.Spharai_AM.Footwork.HighAcc = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Schere Earring", 		
		body = "Malignance Tabard", 
		hands = "Tatenashi Gote +1", 
		ring1 = "Chirich Ring", 
		ring2 = "Chirich Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Tatenashi Haidate +1", 
		feet = "Anchorite's Gaiters +3"
	} -- sTP+53 | 24DA/13TA/0QA/94KA
	
	sets.TP.Spharai_AM.Footwork.SB = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Dedition Earring", 		
		body = "Mpaca's Doublet", 
		hands = "Tatenashi Gote +1", 
		ring1 = "Gere Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Mpaca's Hose", 
		feet = "Anchorite's Gaiters +3"
	} -- sTP+32 | 18DA/23TA/3QA/94KA | 50 SB / 25 SBII	


	--Damage Taken Sets (DT)--
	sets.DT = {}
	sets.DT.index = {"Standard", "Resist", "Counter", "SB"}
	DT_ind = 1
	
	sets.DT.Staff = {}
	sets.DT.Staff.Standard = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Anu Torque", 
		ear1 = "Sherida Earring",  
		ear2 = "Dedition Earring", 
		body = "Malignance Tabard", 
		hands = "Tatenashi Gote +1", 
		ring1 = "Gere Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",
		legs = "Tatenashi Haidate +1", 
		feet = "Tatenashi Sune-ate +1"
	} -- sTP+65 | 18DA/21TA/3QA | 10/0/40
	
	sets.DT.Staff.Resist = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Anu Torque", 
		ear1 = "Sherida Earring",  
		ear2 = "Dedition Earring", 
		body = "Kendatsuba Samue +1", 
		hands = "Malignance Gloves", 
		ring1 = "Gere Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Engraved Belt",
		legs = "Malignance Tights", 
		feet = "Malignance Boots"
	} -- sTP+68 | 18DA/17TA/3QA | 10/0/42 | Meva+652
	
	--Counter+27% at 2000JP and 5/5 Merits
	sets.DT.Staff.Counter = {
		ammo = "Amar Cluster",
		head = "Malignance Chapeau", 
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring",  
		ear2 = "Cryptic Earring", 
		body = "Mpaca's Doublet", 
		hands = "Malignance Gloves", 
		ring1 = "Gere Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.Counter, 
		waist = "Moonbow Belt",
		legs = "Anchorite's Hose +2", 
		feet = "Hesychast's Gaiters +3"
	} -- sTP+25 | 15DA/11TA/3QA | 10/0/36 | Counter+67%

	sets.DT.Staff.SB = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Anu Torque", 
		ear1 = "Sherida Earring",  
		ear2 = "Dignitary's Earring", 
		body = "Kendatsuba Samue +1", 
		hands = "Malignance Gloves", 
		ring1 = "Gere Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",
		legs = "Mpaca's Hose", 
		feet = "Malignance Boots"
	} -- sTP+54 | 18DA/21TA/3QA | 19/0/40 | 50 SB / 25 SBII		


	sets.DT.H2H = {}
	
	sets.DT.H2H.Normal = {}
	sets.DT.H2H.Normal.Standard = {	
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 		
		body = "Mpaca's Doublet", 
		hands = "Malignance Gloves", 
		ring1 = "Gere Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Mpaca's Hose", 
		feet = "Malignance Boots"
	} -- sTP+60 | 18DA/19TA/3QA/49KA | 29/2/23

	sets.DT.H2H.Normal.Resist = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 		
		body = "Kendatsuba Samue +1", 
		hands = "Malignance Gloves", 
		ring1 = "Defending Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Malignance Tights", 
		feet = "Malignance Boots"
	} -- sTP+57 | 18DA/11TA/3QA/29KA | 10/2/40 | Meva+652

	sets.DT.H2H.Normal.Counter = {
		ammo = "Amar Cluster",
		head = "Malignance Chapeau", 
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Cryptic Earring", 		
		body = "Mpaca's Doublet", 
		hands = "Malignance Gloves", 
		ring1 = "Defending Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.Counter, 
		waist = "Moonbow Belt",	
		legs = "Anchorite's Hose +2", 
		feet = "Nyame Sollerets"
	} -- sTP+40 | 17DA/10TA/3QA/29KA | 10/0/25 | Counter+67%
	
	sets.DT.H2H.Normal.SB = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Schere Earring", 		
		body = "Kendatsuba Samue +1", 
		hands = "Tatenashi Gote +1", 
		ring1 = "Chirich Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Mpaca's Hose", 
		feet = "Tatenashi Sune-ate +1"
	} -- sTP+47 | 18DA/15TA/3QA/49KA | 19/0/30 | 50 SB / 25 SBII	

	
	--Impetus sets
	sets.DT.H2H.Impetus = {}
	sets.DT.H2H.Impetus.Standard = {	
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 		
		body = "Bhikku Cyclas +1", 
		hands = "Malignance Gloves", 
		ring1 = "Defending Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Mpaca's Hose", 
		feet = "Malignance Boots"
	} -- sTP+47 | 18DA/15TA/3QA/49KA | 19/2/33

	sets.DT.H2H.Impetus.Resist = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 		
		body = "Bhikku Cyclas +1", 
		hands = "Malignance Gloves", 
		ring1 = "Defending Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Malignance Tights", 
		feet = "Malignance Boots"
	} -- sTP+47 | 18DA/15TA/3QA/29KA | 19/2/33 | Meva+594

	sets.DT.H2H.Impetus.Counter = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Bathy Choker +1", 
		ear1 = "Cryptic Earring", 
		ear2 = "Odnowa Earring +1", 		
		body = "Bhikku Cyclas +1", 
		hands = "Malignance Gloves", 
		ring1 = "Defending Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.Counter, 
		waist = "Moonbow Belt",	
		legs = "Anchorite's Hose +2", 
		feet = "Hesychast's Gaiters +3"
	} -- sTP+30 | 10DA/6TA/3QA/29KA | 0/2/29 | Counter+57%
	
	sets.DT.H2H.Impetus.SB = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Dignitary's Earring", 		
		body = "Bhikku Cyclas +1", 
		hands = "Malignance Gloves", 
		ring1 = "Defending Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Mpaca's Hose", 
		feet = "Malignance Boots"
	} -- sTP+47 | 18DA/10TA/3QA/29KA | 19/0/30 | 50 SB / 25 SBII	
	
	--Footwork sets (+20KA)
	sets.DT.H2H.Footwork = {}
	sets.DT.H2H.Footwork.Standard = {	-- "Guaranteed" extra hit in an attack round
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Dedition Earring", 		
		body = "Mpaca's Doublet", 
		hands = "Malignance Gloves", 
		ring1 = "Defending Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Hesychast's Hose +3", 
		feet = "Anchorite's Gaiters +3"
	} -- sTP+46 | 18DA/10TA/3QA/98KA | 20/0/26

	sets.DT.H2H.Footwork.Resist = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Dedition Earring", 		
		body = "Malignance Tabard", 
		hands = "Malignance Gloves", 
		ring1 = "Defending Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Malignance Tights", 
		feet = "Anchorite's Gaiters +3"
	} -- sTP+48 | 18DA/12TA/3QA/79KA | 10/0/33 | Meva+595

	sets.DT.H2H.Footwork.Counter = {
		ammo = "Amar Cluster",
		head = "Malignance Chapeau", 
		neck = "Bathy Choker +1", 
		ear1 = "Cryptic Earring", 
		ear2 = "Odnowa Earring +1", 		
		body = "Mpaca's Doublet", 
		hands = "Malignance Gloves", 
		ring1 = "Defending Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.Counter, 
		waist = "Moonbow Belt",	
		legs = "Anchorite's Hose +2", 
		feet = "Anchorite's Gaiters +3"
	} -- sTP+30 | 24DA/10TA/0QA/59KA | 10/2/29 | Counter+67%
	
	sets.DT.H2H.Footwork.SB = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Dignitary's Earring", 		
		body = "Kendatsuba Samue +1", 
		hands = "Malignace Gloves", 
		ring1 = "Defending Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Mpaca's Hose", 
		feet = "Anchorite's Gaiters +3"
	} -- sTP+38 | 18DA/16TA/3QA/79KA | 19/0/26 | 50 SB / 25 SBII	
	
	--Only active while Spharai equipped AND aftermath is active
	sets.DT.Spharai_AM = {}
	
	sets.DT.Spharai_AM.Normal = {}
	sets.DT.Spharai_AM.Normal.Standard = {	
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 		
		body = "Mpaca's Doublet", 
		hands = "Malignance Gloves", 
		ring1 = "Gere Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Mpaca's Hose", 
		feet = "Malignance Boots"
	} -- sTP+50 | 18DA/19TA/3QA/64KA | 29/2/23

	sets.DT.Spharai_AM.Normal.Resist = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 		
		body = "Kendatsuba Samue +1", 
		hands = "Malignance Gloves", 
		ring1 = "Defending Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Malignance Tights", 
		feet = "Malignance Boots"
	} -- sTP+47 | 18DA/11TA/3QA/44KA | 10/2/40 | Meva+652

	sets.DT.Spharai_AM.Normal.Counter = {
		ammo = "Amar Cluster",
		head = "Malignance Chapeau", 
		neck = "Bathy Choker +1", 
		ear1 = "Cryptic Earring", 
		ear2 = "Odnowa Earring +1", 		
		body = "Hesychast's Cyclas +3", 
		hands = "Malignance Gloves", 
		ring1 = "Defending Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.Counter, 
		waist = "Moonbow Belt",	
		legs = "Anchorite's Hose +2", 
		feet = "Hesychast's Gaiters +3"
	} -- sTP+20 | 13DA/6TA/3QA/44KA | 0/2/34 | Counter+74%
	
	sets.DT.Spharai_AM.Normal.SB = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Dignitary's Earring", 		
		body = "Mpaca's Doublet", 
		hands = "Tatenashi Gote +1", 
		ring1 = "Defending Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Mpaca's Hose", 
		feet = "Tatenashi Sune-ate +1"
	} -- sTP+42 | 18DA/21TA/3QA/64KA | 29/0/21 | 50 SB / 25 SBII	

	
	--Impetus sets
	sets.DT.Spharai_AM.Impetus = {}
	sets.DT.Spharai_AM.Impetus.Standard = {	
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Dedition Earring", 
		body = "Bhikku Cyclas +1", 
		hands = "Malignance Gloves", 
		ring1 = "Defending Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Mpaca's Hose", 
		feet = "Malignance Boots"
	} -- sTP+45 | 18DA/10TA/3QA/64KA | 19/0/30

	sets.DT.Spharai_AM.Impetus.Resist = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Odnowa Earring +1", 		
		body = "Bhikku Cyclas +1", 
		hands = "Malignance Gloves", 
		ring1 = "Defending Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Malignance Tights", 
		feet = "Malignance Boots"
	} -- sTP+47 | 18DA/15TA/3QA/29KA | 19/2/33 | Meva+594

	sets.DT.Spharai_AM.Impetus.Counter = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Bathy Choker +1", 
		ear1 = "Cryptic Earring", 
		ear2 = "Odnowa Earring +1", 		
		body = "Bhikku Cyclas +1", 
		hands = "Malignance Gloves", 
		ring1 = "Defending Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.Counter, 
		waist = "Moonbow Belt",	
		legs = "Anchorite's Hose +2", 
		feet = "Malignance Boots"
	} -- sTP+29 | 10DA/6TA/3QA/44KA | 0/2/29 | Counter+71%
	
	sets.DT.Spharai_AM.Impetus.SB = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Dignitary's Earring", 		
		body = "Bhikku Cyclas +1", 
		hands = "Malignance Gloves", 
		ring1 = "Defending Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Mpaca's Hose", 
		feet = "Malignance Boots"
	} -- sTP+42 | 18DA/10TA/3QA/64KA | 19/0/30 | 50 SB / 25 SBII	
	
	--Footwork sets (+20KA)
	sets.DT.Spharai_AM.Footwork = {}	
	sets.DT.Spharai_AM.Footwork.Standard = {	-- "Guaranteed" extra hit in an attack round
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Dedition Earring", 		
		body = "Mpaca's Doublet", 
		hands = "Tatenashi Gote +1", 
		ring1 = "Defending Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Malignance Tights", 
		feet = "Anchorite's Gaiters +3"
	} -- sTP+42 | 18DA/14TA/3QA/94KA | 20/0/28

	sets.DT.Spharai_AM.Footwork.Resist = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Warder's Charm +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Dedition Earring", 		
		body = "Mpaca's Doublet", 
		hands = "Malignance Gloves", 
		ring1 = "Defending Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Malignance Tights", 
		feet = "Anchorite's Gaiters +3"
	} -- sTP+54 | 18DA/10TA/3QA/64KA | 20/0/33 | Meva+595

	sets.DT.Spharai_AM.Footwork.Counter = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Bathy Choker +1", 
		ear1 = "Cryptic Earring", 
		ear2 = "Odnowa Earring +1", 		
		body = "Hesychast's Cyclas +3", 
		hands = "Malignance Gloves", 
		ring1 = "Defending Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.Counter, 
		waist = "Moonbow Belt",	
		legs = "Anchorite's Hose +2", 
		feet = "Anchorite's Gaiters +3"
	} -- sTP+23 | 24DA/6TA/3QA/61KA | 10/2/29 | Counter+71%
	
	sets.DT.Spharai_AM.Footwork.SB = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Monk's Nodowa +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Dignitary's Earring", 		
		body = "Mpacas Doublet", 
		hands = "Tatenashi Gote +1", 
		ring1 = "Defending Ring", 
		ring2 = "Niqmaddu Ring",	
		back = Segomo.DA, 
		waist = "Moonbow Belt",	
		legs = "Mpaca's Hose", 
		feet = "Anchorite's Gaiters +3"
	} -- sTP+34 | 18DA/18TA/3QA/94KA | 20/0/30 | 50 SB / 25 SBII		



	--Weaponskill Sets--
	sets.WS = {}
	sets.WS.index = {"Normal", "Attack", "AttackCapped"}
	WS_ind = 1	
	
	--For all sets assume you need full TP Bonus gear
	--a later function handles optimization for TP thresholds

	--H2H
	sets.VictorySmite = {}
	sets.VictorySmite.Normal = {
		ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Schere Earring",
		body="Kendatsuba Samue +1",
		hands="Ryuo Tekko",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.STR_Crit,
		waist="Moonbow Belt", -- I like to keep capped SB in sets for minimal DPS loss over fotia
		legs="Mpaca's Hose",
		feet="Tatenashi Sune-ate +1"
	}
	sets.VictorySmite.Attack = {
		ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Schere Earring",
		body="Mpaca's Doublet",
		hands="Ryuo Tekko",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.STR_Crit,
		waist="Moonbow Belt", 
		legs="Mpaca's Hose",
		feet="Mpaca's Boots"
	}
	sets.VictorySmite.AttackCapped = {
		ammo="Crepuscular Pebble",
		head="Adhemar Bonnet +1",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Schere Earring",
		body="Kendatsuba Samue +1",
		hands="Ryuo Tekko",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.STR_Crit,
		waist="Moonbow Belt", 
		legs="Mpaca's Hose",
		feet="Tatenashi Sune-ate +1"
	}
	sets.VictorySmite_impetus = {}
	sets.VictorySmite_impetus.Normal = {
		ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Schere Earring",
		body="Bhikku Cyclas +1",
		hands="Ryuo Tekko",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.STR_Crit,
		waist="Moonbow Belt", -- I like to keep capped SB in sets for minimal DPS loss over fotia
		legs="Mpaca's Hose",
		feet="Tatenashi Sune-ate +1"
	}
	sets.VictorySmite_impetus.Attack = {
		ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Schere Earring",
		body="Bhikku Cyclas +1",
		hands="Ryuo Tekko",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.STR_Crit,
		waist="Moonbow Belt", 
		legs="Mpaca's Hose",
		feet="Mpaca's Boots"
	}
	sets.VictorySmite_impetus.AttackCapped = {
		ammo="Crepuscular Pebble",
		head="Adhemar Bonnet +1",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Schere Earring",
		body="Bhikku Cyclas +1",
		hands="Ryuo Tekko",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.STR_Crit,
		waist="Moonbow Belt", 
		legs="Mpaca's Hose",
		feet="Tatenashi Sune-ate +1"
	}	
	
	sets.FinalHeaven = {}
	sets.FinalHeaven.Normal = {
		ammo="Knobkierrie",
		head="Nyame Helm",
		neck="Fotia Gorget",
		ear1="Ishvara Earring",
		ear2="Odnowa Earring +1",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Beithir Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.VIT_WSD,
		waist="Fotia Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.FinalHeaven.Attack = {
		ammo="Knobkierrie",
		head="Nyame Helm",
		neck="Fotia Gorget",
		ear1="Ishvara Earring",
		ear2="Odnowa Earring +1",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Beithir Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.VIT_WSD,
		waist="Fotia Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.FinalHeaven.AttackCapped = {
		ammo="Crepuscular Pebble",
		head="Nyame Helm",
		neck="Fotia Gorget",
		ear1="Ishvara Earring",
		ear2="Odnowa Earring +1",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Beithir Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.VIT_WSD,
		waist="Fotia Belt",
		legs="Mpaca's Hose",
		feet="Nyame Sollerets"
	}	
	
	sets.HowlingFist = {}
	sets.HowlingFist.Normal = {
		ammo="Coiste Bodhar",
		head="Mpaca's Cap",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Kendatsuba Samue +1",
		hands="Tatenashi Gote +1",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.VIT_WSD,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Tatenashi Sune-ate +1"
	}
	sets.HowlingFist.Attack = {
		ammo="Coiste Bodhar",
		head="Mpaca's Cap",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Kendatsuba Samue +1",
		hands="Nyame Gauntlets",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.VIT_WSD,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Nyame Sollerets"
	}
	sets.HowlingFist.AttackCapped = {
		ammo="Crepuscular Pebble",
		head="Mpaca's Cap",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Malignance Tabard",
		hands="Tatenashi Gote +1",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.VIT_WSD,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Tatenashi Sune-ate +1"
	}	

	sets.RagingFists = {}
	sets.RagingFists.Normal = {
		ammo="Coiste Bodhar",
		head="Mpaca's Cap",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Kendatsuba Samue +1",
		hands="Tatenashi Gote +1",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.STR_DA,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Tatenashi Sune-ate +1"
	}
	sets.RagingFists.Attack = {
		ammo="Coiste Bodhar",
		head="Mpaca's Cap",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Mpaca's Doublet",
		hands="Mpaca's Gloves",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.STR_DA,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots"
	}
	sets.RagingFists.AttackCapped = {
		ammo="Crepuscular Pebble",
		head="Mpaca's Cap",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Malignance Tabard",
		hands="Tatenashi Gote +1",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.STR_DA,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Tatenashi Sune-ate +1"
	}	
	
	sets.AsuranFists = {}
	sets.AsuranFists.Normal = {
		ammo="Coiste Bodhar",
		head="Mpaca's Cap",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Odr Earring",
		body="Mpaca's Doublet",
		hands="Hesychast's Gloves +3",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.STR_WSD,
		waist="Fotia Belt",
		legs="Mpaca's Hose",
		feet="Hesychast's Gaiters +3"
	}
	sets.AsuranFists.Attack = {
		ammo="Coiste Bodhar",
		head="Hesychast's Crown +3",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Schere Earring",
		body="Hesychast's Cyclas +3",
		hands="Hesychast's Gloves +3",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.STR_WSD,
		waist="Fotia Belt",
		legs="Hesychast's Hose +3",
		feet="Hesychast's Gaiters +3"
	}
	sets.AsuranFists.AttackCapped = {
		ammo="Crepuscular Pebble",
		head="Malignance Chapeau",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Odr Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.STR_WSD,
		waist="Fotia Belt",
		legs="Mpaca's Hose",
		feet="Malignance Boots"
	}	

	sets.ShijinSpiral = {}
	sets.ShijinSpiral.Normal = { --I build this set with landing the plague effect in mind
		ammo="Voluspa Tathlum",
		head="Malignance Chapeau",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Mache Earring +1",
		body="Kendatsuba Samue +1",
		hands="Malignance Gloves",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.DA,
		waist="Moonbow Belt", --Again, I take the slight hit to DPS here in order to maintain SB cap
		legs="Mpaca's Hose",
		feet="Malignance Boots"
	}
	sets.ShijinSpiral.Attack = { --This set is more damage-focused
		ammo="Voluspa Tathlum",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Mache Earring +1",
		body="Mpaca's Doublet",
		hands="Mpaca's Gloves",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.DA,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots"
	}
	sets.ShijinSpiral.AttackCapped = {
		ammo="Crepuscular Pebble",
		head="Malignance Chapeau",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Mache Earring +1",
		body="Kendatsuba Samue +1",
		hands="Malignance Gloves",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.DA,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Tatenashi Sune-ate +1"
	}
	
	sets.AsceticFury = {}
	sets.AsceticFury.Normal = {
		ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Kendatsuba Samue +1",
		hands="Ryuo Tekko",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.STR_DA,
		waist="Fotia Belt", 
		legs="Mpaca's Hose",
		feet="Tatenashi Sune-ate +1"
	}
	sets.AsceticFury.Attack = {
		ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Mpaca's Doublet",
		hands="Ryuo Tekko",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.STR_DA,
		waist="Fotia Belt", 
		legs="Mpaca's Hose",
		feet="Mpaca's Boots"
	}
	sets.AsceticFury.AttackCapped = {
		ammo="Crepuscular Pebble",
		head="Adhemar Bonnet +1",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Malignance Tabard",
		hands="Ryuo Tekko",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.STR_DA,
		waist="Fotia Belt", 
		legs="Mpaca's Hose",
		feet="Mpaca's Boots"
	}
	sets.AsceticFury_impetus = {}
	sets.AsceticFury_impetus.Normal = {
		ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Bhikku Cyclas +1",
		hands="Ryuo Tekko",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.STR_DA,
		waist="Fotia Belt", 
		legs="Mpaca's Hose",
		feet="Tatenashi Sune-ate +1"
	}
	sets.AsceticFury_impetus.Attack = {
		ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Bhikku Cyclas +1",
		hands="Ryuo Tekko",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.STR_DA,
		waist="Fotia Belt", 
		legs="Mpaca's Hose",
		feet="Mpaca's Boots"
	}
	sets.AsceticFury_impetus.AttackCapped = {
		ammo="Crepuscular Pebble",
		head="Adhemar Bonnet +1",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Bhikku Cyclas +1",
		hands="Ryuo Tekko",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.STR_DA,
		waist="Fotia Belt", 
		legs="Mpaca's Hose",
		feet="Mpaca's Boots"
	}
	
	sets.TornadoKick = {}
	sets.TornadoKick.Normal = {
		ammo="Coiste Bodhar",
		head="Mpaca's Cap",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Kendatsuba Samue +1",
		hands="Tatenashi Gote +1",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.VIT_WSD,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Tatenashi Sune-ate +1"
	}
	sets.TornadoKick.Attack = {
		ammo="Coiste Bodhar",
		head="Mpaca's Cap",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Mpaca's Doublet",
		hands="Mapca's Gloves",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.VIT_WSD,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Tatenashi Sune-ate +1"
	}
	sets.TornadoKick.AttackCapped = {
		ammo="Crepuscular Pebble",
		head="Mpaca's Cap",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Malignance Tabard",
		hands="Tatenashi Gote +1",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.VIT_WSD,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Tatenashi Sune-ate +1"
	}
	--Footwork active
	sets.TornadoKick_FW = {}
	sets.TornadoKick_FW.Normal = {
		ammo="Coiste Bodhar",
		head="Mpaca's Cap",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Kendatsuba Samue +1",
		hands="Tatenashi Gote +1",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.VIT_WSD,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Anchorite's Gaiters +3"
	}
	sets.TornadoKick_FW.Attack = {
		ammo="Coiste Bodhar",
		head="Mpaca's Cap",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Mpaca's Doublet",
		hands="Mapca's Gloves",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.VIT_WSD,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Anchorite's Gaiters +3"
	}
	sets.TornadoKick_FW.AttackCapped = {
		ammo="Crepuscular Pebble",
		head="Mpaca's Cap",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Malignance Tabard",
		hands="Tatenashi Gote +1",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.VIT_WSD,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Anchorite's Gaiters +3"
	}
	
	sets.DragonKick = {}
	sets.DragonKick.Normal = {
		ammo="Coiste Bodhar",
		head="Mpaca's Cap",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Kendatsuba Samue +1",
		hands="Tatenashi Gote +1",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.VIT_WSD,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Anchorite's Gaiters +3"
	}
	sets.DragonKick.Attack = {
		ammo="Coiste Bodhar",
		head="Mpaca's Cap",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Mpaca's Doublet",
		hands="Mapca's Gloves",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.VIT_WSD,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Anchorite's Gaiters +3"
	}
	sets.DragonKick.AttackCapped = {
		ammo="Crepuscular Pebble",
		head="Mpaca's Cap",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Malignance Tabard",
		hands="Tatenashi Gote +1",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.VIT_WSD,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Anchorite's Gaiters +3"
	}	
	--Footwork Active
	sets.DragonKick_FW = {}
	sets.DragonKick_FW.Normal = {
		ammo="Coiste Bodhar",
		head="Mpaca's Cap",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Kendatsuba Samue +1",
		hands="Tatenashi Gote +1",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.VIT_WSD,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Anchorite's Gaiters +3"
	}
	sets.DragonKick_FW.Attack = {
		ammo="Coiste Bodhar",
		head="Mpaca's Cap",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Mpaca's Doublet",
		hands="Mapca's Gloves",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.VIT_WSD,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Anchorite's Gaiters +3"
	}
	sets.DragonKick_FW.AttackCapped = {
		ammo="Crepuscular Pebble",
		head="Mpaca's Cap",
		neck="Monk's Nodowa +1",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Malignance Tabard",
		hands="Tatenashi Gote +1",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.VIT_WSD,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Anchorite's Gaiters +3"
	}

	sets.ShoulderTackle = { --Geared to land stun
		ammo="Voluspa Tathlum",
		head="Malignance Chapeau",
		neck="Sanctity Necklace",
		ear1="Crepuscular Earring",
		ear2="Dignitary's Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Metamorph Ring +1",
		ring2="Etana Ring",
		back=Segomo.DA,
		waist="Acuity Belt +1",
		legs="Malignance Tights",
		feet="Malignance Boots"	
	}
	
	
	--Staff
	sets.Retribution = {}
	sets.Retribution.Normal = {
		ammo="Knobkierrie",
		head="Mpaca's Cap",
		neck="Caro Necklace",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.STR_WSD,
		waist="Sailfi Belt +1",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.Retribution.Attack = {
		ammo="Knobkierrie",
		head="Mpaca's Cap",
		neck="Caro Necklace",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.STR_WSD,
		waist="Sailfi Belt +1",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.Retribution.AttackCapped = {
		ammo="Crepuscular Pebble",
		head="Mpaca's Cap",
		neck="Caro Necklace",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.STR_WSD,
		waist="Sailfi Belt +1",
		legs="Mpaca's Hose",
		feet="Nyame Sollerets"
	}
	
	sets.Cataclysm = {
		ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
		ear2="Moonshade Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Metamorph Ring +1",
		ring2="Archon Ring",
		back=Segomo.STR_WSD,
		waist="Acuity Belt +1",
		legs="Mpaca's Hose",
		feet="Nyame Sollerets"		
	}
	
	sets.ShellCrusher = { --Geared to land DEF Down (TP Bonus to reduce downtime when applying mid-combat)
		ammo="Voluspa Tathlum",
		head="Mpaca's Cap",
		neck="Sanctity Necklace",
		ear1="Crepuscular Earring",
		ear2="Moonshade Earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Metamorph Ring +1",
		ring2="Etana Ring",
		back=Segomo.DA,
		waist="Acuity Belt +1",
		legs="Malignance Tights",
		feet="Malignance Boots"	
	}
	
	
	sets.OtherWS = {}
	sets.OtherWS.Normal = {
		ammo="Knobkierrie",
		head="Nyame Helm",
		neck="Fotia Gorget",
		ear1="Ishvara Earring",
		ear2="Odnowa Earring +1",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Beithir Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.VIT_WSD,
		waist="Fotia Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.OtherWS.Attack = {
		ammo="Knobkierrie",
		head="Nyame Helm",
		neck="Fotia Gorget",
		ear1="Ishvara Earring",
		ear2="Odnowa Earring +1",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Beithir Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.VIT_WSD,
		waist="Fotia Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	sets.OtherWS.AttackCapped = {
		ammo="Crepuscular Pebble",
		head="Nyame Helm",
		neck="Fotia Gorget",
		ear1="Ishvara Earring",
		ear2="Odnowa Earring +1",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Beithir Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.VIT_WSD,
		waist="Fotia Belt",
		legs="Mpaca's Hose",
		feet="Nyame Sollerets"
	}	
	
	
	--Job Ability Sets--
	sets.HundredFists = {legs = "Hesychast's Hose +3"}
	sets.Focus = {head = "Anchorite's Crown +1"}
	sets.Dodge = {feet = "Anchorite's Gaiters +3"}
	sets.ChiBlast = {head = "Hesychast's Crown +3"}
	sets.Mantra = {feet = "Hesychast's Gaiters +3"}
	sets.FormlessStrikes = {body = "Hesychast's Cyclas +3"}
	sets.Footwork = {feet = "Shukuyu Sune-ate"}
	sets.PerfectCounter = {head = "Bhikku Crown +1"}
	sets.Counterstance = {feet = "Hesychast's Gaiters +3"}
	
	sets.Chakra = {
		ammo="Crepuscular Pebble",
		head="Hesychast's Crown +3",
		neck="Unmoving Collar +1",
		ear1="Tuisto Earring",
		ear2="Odnowa Earring +1",
		body="Anchorite's Cyclas +1",
		hands="Hesychast's Gloves +3",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		back=Segomo.VIT_WSD,
		waist="Moonbow Belt",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots"	
	}
	
	sets.Boost = {
		hands = "Anchorites Gloves +2",
		waist = "Ask Sash"
	}
	
	
	sets.Waltz ={
	-- Insert gear here as desired
	}	
	
	
	--Precast Sets
	sets.FastCast = { -- +20% from FC III
        ammo="Sapience Orb", --2
		head=HercHelm.FC, --12
		neck="Orunmila's Torque", --5
        ear1="Enchanter's Earring +1", --2
		ear2="Loquacius Earring", --2
        body=AdhemarBody.FC, --10
		hands="Leyline Gloves", --8
		ring1="Rahab Ring", --2
		ring2="Naji's Loop", --1
		back=Segomo.FC, 
		waist="Moonbow Belt",
		legs=HercLegs.FC, --7
		feet=HercFeet.FC --7
	} -- 68/80% FC 
	
	--This is here if you need it for Utsusemi
	sets.NinjutsuFastCast = set_combine(sets.FastCast, {
		--neck = "Magoraga Beads",
	}) 

	
	
	--Midcast Sets
	-- FC/Haste here will lower recasts until cap, but its a good idea to put -DT% in midcasts
	-- MNK doesn't really do a ton of casting though.
	sets.FastRecast = { -- +20% from FC III
        ammo="Sapience Orb", --2
		head=HercHelm.FC, --12
		neck="Orunmila's Torque", --5
        ear1="Enchanter's Earring +1", --2
		ear2="Loquacius Earring", --2
        body=AdhemarBody.FC, --10
		hands="Leyline Gloves", --8
		ring1="Rahab Ring", --2
		ring2="Naji's Loop", --1
		back=Segomo.FC, 
		waist="Moonbow Belt",
		legs=HercLegs.FC, --7
		feet=HercFeet.FC --7
	} -- 68/80% FC  

	
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
		ear2 = "Odnowa Earring +1", -- 0/2/3
		body = "Mpaca's Doublet", -- 10/0/0
		hands = "Nyame Gauntlets", -- 0/0/7
		ring1 = "Shadow Ring", 
		ring2 = "Sheltered Ring", 
		back = Segomo.Idle, -- 0/10/0
		waist = "Engraved Belt",
		legs = "Mpaca's Hose", -- 9/0/0
		feet = "Nyame Sollerets" -- 0/0/7
	} -- 19/2/33
	

	--To manually call phalanx set
	--Used so someone else (RDM, SCH, etc.) can cast it on you
	sets.Phalanx = {
		ammo = "Staunch Tathlum +1", -- 0/0/3
		head = TaeonHead.Phalanx, 
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", 
		ear2 = "Odnowa Earring +1", -- 0/2/3 
		body = HercBody.Phalanx, 
		hands = HercHands.Phalanx, -- 2/0/0
		ring1 = "Defending Ring", -- 0/0/10
		ring2 = "Gelatinous Ring +1", -- 7/-1/0
		back = Segomo.Idle, -- 10/0/0
		waist = "Carrier's Sash", 
		legs = HercLegs.Phalanx, -- 2/0/4
		feet = HercFeet.Phalanx -- 2/0/0
	} -- 23/1/26
	
	--For JA's that want enmity swaps
	sets.Enmity = {
		ammo="Sapience Orb", --2
		head="Halitus Helm", --8
		neck="Unmoving Collar +1", --10
        ear1="Cryptic Earring", --4
        ear2="Trux Earring", --5
        body="Emet Harness +1", --10
		hands="Kurys Gloves", --9 
        ring1="Supershear Ring", --5
        ring2="Eihwaz Ring", --5
		back=Segomo.FC, 
		waist="Moonbow Belt", 
		legs="Nyame Flanchard", 
        feet="Ahosi Leggings" --7
	} -- +65 Enmity

	--Swipe/Lunge JA Magic Damage
	sets.Swipe = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
		ear2="Crematio Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Metamorph Ring +1",
		ring2="Stikini Ring",
		back=Segomo.STR_WSD,
		waist="Eschan Stone",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}

	sets.Swipe_MB = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
		ear2="Crematio Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Metamorph Ring +1",
		ring2="Stikini Ring",
		back=Segomo.STR_WSD,
		waist="Eschan Stone",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	} 
	
	-- Apply TH4
	-- Currently set to Kurayami: Ichi and Charged Whisker
	sets.TH = {
		ammo = "Perfect Lucky Egg", --1
		head = "Volte Cap", --1
		hands = HercHands.TH, --2
		waist = "Chaac Belt" --1
	} -- +5
	
	sets.Kite = {
		feet = "Herald's Gaiters"
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
	TP_bonus_replacement_earring = "Telos Earring"
	TP_bonus_replacement_multiattack_earring = "Brutal Earring"

	--Mapping--		
	Unusable_buff = {
		spell={'Charm','Mute','Omerta','Petrification','Silence','Sleep','Stun','Terror'},
		ability={'Amnesia','Charm','Impairment','Petrification','Sleep','Stun','Terror'}}	

	Enmity_actions = S{
		'Sentinel', 'Shield Bash', 'Souleater', 'Weapon Bash', 'Vallation', 'Swordplay', 
		'Pflug', 'Provoke', 'Valliance'}
		
	Utsusemi_spells = S{
		'Utsusemi: Ichi', 'Utsusemi: Ni', 'Utsusemi: San'}
		
	Staves = S{
		'Malignance Pole', 'Xoanon'}
		
	TP_bonus_equipment = S{
		"Godhands", "Mpaca's Cap", "Moonshade Earring"}
	
	TP_bonus_weaponskill = S{
		'Dragon Kick',
		'Retribution', 'Cataclysm'}
		
	TP_bonus_multi_weaponskill = S{
		'Howling Fist', 'Raging Fists', 'Tornado Kick'}
	
	fTP_transfer_weaponskill = S{}
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


function buff_change(n,gain,buff_table)
	local name
    name = string.lower(n)

	--Determine DW groupings will go here, above the rest of the safety hooks
	determine_equip_set()	

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
			equip(sets.SafetyDance)
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
		determine_equip_set()
	end
	if name == "boost" then
		if gain then
			equip(sets.Boost)
			disable('waist')
		else
			enable('waist')
			determine_equip_set()
		end
	end
	if name == 'impetus' then
		if gain then
			Impetus = true
		else
			Impetus = false
		end
	end
end


function prep_startup()
	--Streamlines Variables on load
	-- --Redundant, but I like this to be available to 'standardize'
	-- --startup from one location.
	Shadow_type = 'None'
	Melee_mode = true
	Burst_mode = false
	Kite_mode = true
	moving = false
	send_command('@input /echo MNK Loaded, Current Modes::: DT: OFF | Kite: ON')
	determine_equip_set()
end


--Impetus hit tracking base code taken fom Kinematics GS lua
--All I did here was change variabls to work with non-motes setups
function on_action_for_impetus(action)
    if Impetus == true then
        -- count melee hits by player
        if action.actor_id == player.id then
            if action.category == 1 then
                for _,target in pairs(action.targets) do
                    for _,action in pairs(target.actions) do
                        -- Reactions (bitset):
                        -- 1 = evade
                        -- 2 = parry
                        -- 4 = block/guard
                        -- 8 = hit
                        -- 16 = JA/weaponskill?
                        -- If action.reaction has bits 1 or 2 set, it missed or was parried. Reset count.
                        if (action.reaction % 4) > 0 then
                            Impetus_counter = 0
                        else
                            Impetus_counter = Impetus_counter + 1
                        end
                    end
                end
            elseif action.category == 3 then
                -- Missed weaponskill hits will reset the counter.  Can we tell?
                -- Reaction always seems to be 24 (what does this value mean? 8=hit, 16=?)
                -- Can't tell if any hits were missed, so have to assume all hit.
                -- Increment by the minimum number of weaponskill hits: 2.
                for _,target in pairs(action.targets) do
                    for _,action in pairs(target.actions) do
                        -- This will only be if the entire weaponskill missed or was parried.
                        if (action.reaction % 4) > 0 then
                            Impetus_counter = 0
                        else
                            Impetus_counter = Impetus_counter + 2
                        end
                    end
                end
            end
        elseif action.actor_id ~= player.id and action.category == 1 then
            -- If mob hits the player, check for counters.
            for _,target in pairs(action.targets) do
                if target.id == player.id then
                    for _,action in pairs(target.actions) do
                        -- Spike effect animation:
                        -- 63 = counter
                        -- ?? = missed counter
                        if action.has_spike_effect then
                            -- spike_effect_message of 592 == missed counter
                            if action.spike_effect_message == 592 then
                                Impetus_counter = 0
                            elseif action.spike_effect_animation == 63 then
                                Impetus_counter = Impetus_counter + 1
                            end
                        end
                    end
                end
            end
        end
        
        --send_command('@input /echo Impetus hit count: '..Impetus_counter)
    else
        Impetus_counter = 0
    end
	determine_equip_set()
end
windower.raw_register_event('action', on_action_for_impetus)


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
	--Godhands: 				+ 500
	--Mpaca's Cap:				+ 200
	--Moonshade Earring:		+ 250
	--total possible:			+ 950
	

	if TP_bonus_weaponskill:contains(spell.english) then
		--to force 3000 TP WS determine non-adjustable factors (weapons)
		if TP_bonus_equipment:contains(player.equipment.main) and TP_bonus_equipment:contains(player.equipment.sub) then -- assumes Godhands
			-- base: +500 (total of +950 possible)
			if player.tp > 2449 then -- replace head and earring
				equip({head = "Nyame Helm"})
				if TP_bonus_equipment:contains(player.equipment.left_ear) then
					equip({ear1 = TP_bonus_replacement_earring})
				end
				if TP_bonus_equipment:contains(player.equipment.right_ear) then
					equip({ear2 = TP_bonus_replacement_earring})
				end					
			elseif player.tp > 2249 then -- replace head
				equip({head = "Nyame Helm"})
			end
		else -- assumes no TP Bonus main
			-- base: +0 (total of +450 possible)
			if player.tp == 3000 then -- replace head and earring
				equip({head = "Nyame Helm"})
				if TP_bonus_equipment:contains(player.equipment.left_ear) then
					equip({ear1 = TP_bonus_replacement_earring})
				end
				if TP_bonus_equipment:contains(player.equipment.right_ear) then
					equip({ear2 = TP_bonus_replacement_earring})
				end					
			elseif player.tp > 2799 then -- replace head
				equip({head = "Nyame Helm"})
			end
		end
	elseif (TP_bonus_multi_weaponskill:contains(spell.english) and WS_ind ~= 3) then -- dont override sets that maximize +PDL%
		--to force 3000 TP WS determine non-adjustable factors (weapons)
		-- base: +500 (total of +950 possible)
		if player.tp > 2449 then -- replace head and earring
			equip({head = "Adhemar Bonnet +1"})
			if TP_bonus_equipment:contains(player.equipment.left_ear) then
				equip({ear1 = TP_bonus_replacement_earring})
			end
			if TP_bonus_equipment:contains(player.equipment.right_ear) then
				equip({ear2 = TP_bonus_replacement_earring})
			end					
		elseif player.tp > 2249 then -- replace head
			equip({head = "Adhemar Bonnet +1"})
		end
	else -- assumes no TP Bonus main
		-- base: +0 (total of +450 possible)
		if player.tp == 3000 then -- replace head and earring
			equip({head = "Nyame Helm"})
			if TP_bonus_equipment:contains(player.equipment.left_ear) then
				equip({ear1 = TP_bonus_replacement_earring})
			end
			if TP_bonus_equipment:contains(player.equipment.right_ear) then
				equip({ear2 = TP_bonus_replacement_earring})
			end					
		elseif player.tp > 2799 then -- replace head
			equip({head = "Nyame Helm"})
		end		
	end
end


-- Job Control Functions
function precast(spell)
	if (spell.type == 'WhiteMagic' or spell.type == 'BlackMagic' or spell.type== 'Trust') then
		equip(sets.FastCast)
	elseif spell.type == 'BlueMagic' then
		equip(sets.FastCast)
	elseif spell.type == 'Ninjutsu' then
		equip(sets.NinjutsuFastCast)
	elseif spell.type == 'Waltz' then
		equip(sets.Waltz)
	elseif spell.type == "WeaponSkill" then
		if player.tp >= 1000 then
			--handles close-range WS's
			if spell.target.distance <= 5.5 then			
				--Physical WS's
				if spell.english == "Victory Smite" then
					if (buffactive['Impetus'] and Impetus_counter >= Impetus_limit) then
						equip(sets.VictorySmite_impetus[sets.WS.index[WS_ind]])
					else
						equip(sets.VictorySmite[sets.WS.index[WS_ind]])
					end
				end
				if spell.english == "Ascetic\'s Fury" then
					if (buffactive['Impetus'] and Impetus_counter >= Impetus_limit) then
						equip(sets.AsceticFury_impetus[sets.WS.index[WS_ind]])
					else
						equip(sets.AsceticFury[sets.WS.index[WS_ind]])
					end
				end
				if spell.english == "Howling Fist" then
					equip(sets.HowlingFist[sets.WS.index[WS_ind]])
				end
				if spell.english == "Raging Fists" then
					equip(sets.RagingFists[sets.WS.index[WS_ind]])
				end
				if spell.english == "Asuran Fists" then
					equip(sets.AsuranFists[sets.WS.index[WS_ind]])
				end
				if spell.english == "Final Heaven" then
					equip(sets.FinalHeaven[sets.WS.index[WS_ind]])
				end
				if spell.english == "Shijin Spiral" then
					equip(sets.ShijinSpiral[sets.WS.index[WS_ind]])
				end
				if spell.english == "Tornado Kick" then
					if buffactive['Footwork'] then
						equip(sets.TornadoKick_FW[sets.WS.index[WS_ind]])
					else
						equip(sets.TornadoKick[sets.WS.index[WS_ind]])
					end
				end
				if spell.english == "Dragon Kick" then
					if buffactive['Footwork'] then
						equip(sets.DragonKick_FW[sets.WS.index[WS_ind]])
					else
						equip(sets.DragonKick[sets.WS.index[WS_ind]])
					end
				end
				if spell.english == "Retribution" then
					equip(sets.Retribution[sets.WS.index[WS_ind]])
				end
				if spell.english == "Shell Crusher" then
					equip(sets.ShellCrusher)
				end
				
				--Hybrid/Elemental WS's
				if spell.english == "Cataclysm" then
					equip(sets.Cataclysm)
					if world.day_element == "Dark" or world.weather_element == "Dark" then
						equip(sets.obi)
					end
				end
				
				--Generic WS's
				if (spell.english == "Fast Blade" or
						spell.english == "Circle Blade" or
						spell.english == "Skullbreaker" or
						spell.english == "True Strike" or
						spell.english == "Brainshaker")
					then
					equip(sets.OtherWS[sets.WS.index[WS_ind]])
				end
			else
				cancel_spell()
				send_command("@input /echo Canceled " .. spell.name .. " " .. spell.target.name .. " is Too Far")
			end
		end
	elseif spell.english == "Focus" then
		equip(sets.Focus)
	elseif spell.english == "Dodge" then
		equip(sets.Dodge)
	elseif spell.english == "Chi Blast" then
		equip(sets.ChiBlast)
	elseif spell.english == "Mantra" then
		equip(sets.Mantra)
	elseif spell.english == "Formless Strikes" then
		equip(sets.FormlessStrikes)
	elseif spell.english == "Footwork" then
		equip(sets.Footwork)
	elseif spell.english == "Perfect Counter" then
		equip(sets.PerfectCounter)
	elseif spell.english == "Counterstance" then
		equip(sets.Counterstance)
	elseif spell.english == "Chakra" then
		equip(sets.Chakra)
	elseif spell.english == "Boost" then
		equip(sets.Boost)
	-- end of potential rewrites
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
	--overrides gear used to enhance TP bonus when not needed
	TP_bonus_adjustment(spell)
end


function midcast(spell, buff, act)	
	--Handles generic recasts as a fallback
	if (spell.type == 'WhiteMagic' or spell.type == 'BlackMagic' or spell.type == 'Trust') then
		equip(sets.FastRecast)
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
	
	
	--TH
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
	
	determine_equip_set()
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
		determine_equip_set()
	end
	if new == 'Idle' then
		determine_equip_set()
	end
end


function determine_equip_set()
	if player.status == 'Engaged' then -- engaged sets
		if Melee_mode == true then
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


function buff_check()
	if (buffactive['Impetus'] and Impetus_counter >= Impetus_limit) then --Impetus takes priority if both active (higher DPS consideration)
		return 'Impetus'
	elseif buffactive['Footwork'] then
		return 'Footwork'
	else
		return 'Normal'
	end
end


function melee_mode_engaged_set()
	if player.equipment.main == 'Spharai' and buffactive['Aftermath'] then
		equip(
			set_combine(
				sets.TP.Spharai_AM[buff_check()][sets.TP.index[TP_ind]],
				sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]]
			)
		)
	elseif Staves:contains(player.equipment.main) then
		equip(
			set_combine(
				sets.TP.Staff[sets.TP.index[TP_ind]],
				sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]]
			)
		)
	else
		equip(
			set_combine(
				sets.TP.H2H[buff_check()][sets.TP.index[TP_ind]],
				sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]]
			)
		)
	end		
end


function DT_mode_engaged_set()
	if player.equipment.main == 'Spharai' and buffactive['Aftermath'] then
		equip(
			set_combine(
				sets.DT.Spharai_AM[buff_check()][sets.DT.index[DT_ind]],
				sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]]
			)
		)
	elseif Staves:contains(player.equipment.main) then
		equip(
			set_combine(
				sets.DT.Staff[sets.DT.index[DT_ind]],
				sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]]
			)
		)
	else
		equip(
			set_combine(
				sets.DT.H2H[buff_check()][sets.DT.index[DT_ind]],
				sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]]
			)
		)
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
			determine_equip_set()
		else
			DT_ind = DT_ind + 1
			if DT_ind > #sets.DT.index then
				DT_ind = 1
			end
			send_command("@input /echo <----- DT Set changed to " .. sets.DT.index[DT_ind] .. " ----->")
			determine_equip_set()
		end
	elseif command == "toggle TP set reverse" then
		if Melee_mode == true then
			TP_ind = TP_ind - 1
			if TP_ind < 1 then
				TP_ind = #sets.TP.index
			end
			send_command("@input /echo <----- TP Set changed to " .. sets.TP.index[TP_ind] .. " ----->")
			determine_equip_set()
		else
			DT_ind = DT_ind - 1
			if DT_ind < 1 then
				DT_ind = #sets.DT.index
			end
			send_command("@input /echo <----- DT Set changed to " .. sets.DT.index[DT_ind] .. " ----->")
			determine_equip_set()

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
	elseif command == "toggle Weapons" then
		Wm_ind = Wm_ind + 1
		if Wm_ind > #sets.Weapon_melee.index then
			Wm_ind = 1
		end
		send_command("@input /echo <----- Melee weapons changed to " .. sets.Weapon_melee.index[Wm_ind] .. " ----->")
		determine_equip_set()
	elseif command == "toggle Weapons reverse" then
		Wm_ind = Wm_ind - 1
		if Wm_ind < 1 then
			Wm_ind = #sets.Weapon_melee.index
		end
		send_command("@input /echo <----- Melee weapons changed to " .. sets.Weapon_melee.index[Wm_ind] .. " ----->")
		determine_equip_set()		
	elseif command == "toggle Idle set" then
		Idle_ind = Idle_ind + 1
		if Idle_ind > #sets.Idle.index then
			Idle_ind = 1			
		end
		send_command("@input /echo <----- Idle Set changed to " .. sets.Idle.index[Idle_ind] .. " ----->")
		determine_equip_set()
	elseif command == "toggle Idle set reverse" then
		Idle_ind = Idle_ind - 1
		if Idle_ind < 1 then
			Idle_ind = #sets.Idle.index
		end
		send_command("@input /echo <----- Idle Set changed to " .. sets.Idle.index[Idle_ind] .. " ----->")
		determine_equip_set()
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
	elseif command == "toggle Burst Mode" then
		if Burst_mode == false then
			Burst_mode = true
			send_command("@input /echo <----- Burst Mode ON ----->")
		else
			Burst_mode = false
			send_command("@input /echo <----- Burst Mode OFF ----->")
		end
	elseif command == "toggle DT Mode" then
		if Melee_mode == true then
			Melee_mode = false
			send_command("@input /echo <----- DT Sets: ON ----->")
			determine_equip_set()
		else
			Melee_mode = true
			send_command("@input /echo <----- DT Sets: OFF ----->")
			determine_equip_set()
		end
	elseif command == "toggle Kite Mode" then
		if Kite_mode == false then
			Kite_mode = true
			send_command("@input /echo <----- Kite Sets: ON ----->")
			determine_equip_set()
		else
			Kite_mode = false
			send_command("@input /echo <----- Kite Sets: OFF ----->")
			determine_equip_set()
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