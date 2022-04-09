-- 
-- @author Thefoxdanger of Asura
-- BST.lua v1.0
--
--
-- Note to users:
-- 
-- Advanced BST lua created to streamline play with as few toggles and other things to press as possible. Designed to be similar in 
-- function to the rest of Spicyryan's luas in the Github as well as Falkirk's. Big thanks to the work they put into thier luas used in the design of this lua. 
-- Know that this is a job that has an incredible number of levers to throw as well as a monumental amount of gear fields, so take time to fill it out
-- for your sets and get used to the keybinds below. It also has A LOT of gear fields, which is for a good reason. Make sure to read over comments, 
-- reviewing the current gear in slots to understand what goes there if you don't have my exact gearsets. Everything is very clearly labeled, and if 
-- a set seems to be a duplicate, check that it isn't a version that takes Pet_mode into account. Also, due to how KI is implemented for 
-- weaponskills, if you add a set to weaponskills, you will also need to add a matching KI set as well.
--
-- I plan to maintain this lua as a template, however if you get a hold of this it is YOUR responsibility to understand its use
-- and to troubleshoot issues within. I will not fix your lua if I do not know you (and probably wont if I do know you). 
-- Have fun~!
-- 	

	
--binds--
-- 4 sets you will toggle frequently
send_command("bind F6 gs c toggle Ready set") -- F6 swap between ready sets
send_command("bind !F6 gs c toggle Ready set reverse") -- ALT+F6 swap between ready sets in reverse

send_command("bind F7 gs c toggle Pet set only") -- F7 swap between pet sets (will only update current set if in Pet Mode)
send_command("bind !F7 gs c toggle Pet set only reverse") -- ALT+F7 swap between pet sets in reverse (will only update current set if in Pet Mode)

send_command("bind F9 gs c toggle TP set") -- F9 switches between melee sets
send_command("bind !F9 gs c toggle TP set reverse") -- Alt+F9 switches between melee sets in reverse

send_command("bind F10 gs c toggle Weapon set") -- F10 switches between weapon sets
send_command("bind !F10 gs c toggle Weapon set reverse") -- Alt+F10 switches between weapon sets in reverse

send_command("bind F11 gs c toggle WS set") -- F11 switches between WS sets
send_command("bind !F11 gs c toggle WS set reverse") -- Alt+F11 switches between WS sets in reverse

send_command("bind F12 gs c toggle Idle set") -- F12 switches between idle sets
send_command("bind !F12 gs c toggle Idle set reverse") -- Alt+F12 switches between idle sets in reverse

-- less frequently changed/'setup' toggles
send_command("bind @F8 gs c toggle DW set") -- WIN+F8 swap between DualWield and SingleWield for melee sets (can only be toggled if DW is available)
send_command("bind !F8 gs c toggle Melee Mode") -- ALT+F8 swap between pet and melee modes (Determines if weapons swap when activating sic/ready)
send_command("bind @C gs c toggle Correlation Mode") -- WIN+C swaps between equipping Empyrean head during readies (use if favorable killer effect to mob)
send_command("bind @E gs c toggle Haste Mode") -- WIN+E Toggles between SV/Bolster, HasteII and Low haste modes
send_command("bind @P gs c toggle Jug Lock") -- WIN+P Removes the safety that prevents HQ jugs from being used with Call Beast (Safety is ON by default)
send_command("bind @F11 gs c PetInfo") -- Displays current pet ready command assignments
send_command("bind @F12 gs c toggle Kite Mode") -- Turns movement speed detection on/off (sets will swap in automatically if moving and mode is active)

-- Universal Ready Move Commands -
-- Just as it is in Falkrik's lua, it functions well so no need to change how it works.
-- //gs c PetInfo or WIN+F11 will provide the active pet's ready information
--
-- Commands:
-- //gs c Ready one
-- //gs c Ready two
-- //gs c Ready three
-- //gs c Ready four
-- //gs c Ready five
-- //gs c Ready six
-- //gs c Ready seven
--

--Numpad--
-- In this Lua the Numpad has been mapped to commands that will set your jug to various pets. You can also manually
-- input them by typing:
--
-- //gs c JUG NAME
--
-- The default will be to use Call Beast whenever possible, unless you are trying to use a HQ jug. There will 
-- be an override toggle allowing you to burn HQ jugs if you wish but it will cancel the action otherwise by
-- default. If this happens it will default to NQ jug if possible instead.
--
-- Even if the jug is not listed in the shortcut commands here, you can still enter its jug manually in-game.
--
-- -- CTRL (Singular Jugs)
send_command('bind ^numpad0 gs c Dire Broth') -- Generous Arthur (Slug - Amorph)
send_command('bind ^numpad1 gs c Lyrical Broth') -- Rhyming Shizuna (Sheep - Beast)
send_command('bind ^numpad2 gs c Meaty Broth') -- Blackbeard Randy (Tiger - Beast)
send_command('bind ^numpad3 gs c Livid Broth') -- Warlike Patrick (Lizard - Lizard)
send_command('bind ^numpad4 gs c Airy Broth') -- Amiable Roche (Pugil - Aquan)
send_command('bind ^numpad5 gs c Aged Humus') -- Sweet Caroline (Mandragora - Plantoid)
send_command('bind ^numpad6 gs c C. Plasma Broth') -- Fatso Fargann (Leech - Amorph)
send_command('bind ^numpad7 gs c Blackwater Broth') -- Headbreaker Ken (Fly - Vermin)
send_command('bind ^numpad8 gs c Furious Broth') -- Suspicious Alice (Eft - Lizard)
send_command('bind ^numpad9 gs c Wispy Broth') -- Brave Hero Glenn (Toad - Aquan)
-- -- ALT (NQ Jugs)
send_command('bind !numpad0 gs c Fizzy Broth') -- Caring Kiyomaro (Raaz - Beast)
send_command('bind !numpad1 gs c Swirling Broth') -- Droopy Dortwin (Rabbit - Beast)
send_command('bind !numpad2 gs c Salubrious Broth') -- Attentive Ibuki (Tulfaire - Bird)
send_command('bind !numpad3 gs c Poisonous Broth') -- Acuex Familiar (Acuex - Amorph)
send_command('bind !numpad4 gs c Rancid Broth') -- Porter Crab Familiar (Porter Crab - Aquan)
send_command('bind !numpad5 gs c Frizzante Broth') -- Lynx Familiar (Lynx - Beast)
send_command('bind !numpad6 gs c Zestful Sap') -- Y. Beetle Familiar (Y. Beetle - Vermin)
send_command('bind !numpad7 gs c Decaying Broth') -- Slime Familiar (Slime - Amorph)
send_command('bind !numpad8 gs c Turpid Broth') -- Hippogryph Familiar (Hippogryph - Beast)
send_command('bind !numpad9 gs c Electrified Broth') -- Redolent Candi (Snapweed - Plantoid)
-- -- WIN (HQ Jugs)
send_command('bind @numpad0 gs c Tant. Broth') -- Vivacious Vicki (Raaz - Beast)
send_command('bind @numpad1 gs c Viscous Broth') -- Pondering Peter (Rabbit - Beast)
send_command('bind @numpad2 gs c Windy Greens') -- Swooping Zhivago (Tulfaire - Bird)
send_command('bind @numpad3 gs c Venomous Broth') -- Fluffy Breedo (Acuex - Amorph)
send_command('bind @numpad4 gs c Pungent Broth') -- Jovial Edwin (Porter Crab - Aquan)
send_command('bind @numpad5 gs c Spumante Broth') -- Vivacious Gaston (Lynx - Beast)
send_command('bind @numpad6 gs c Gassy Sap') -- Energized Sefina (Y. Beetle - Vermin)
send_command('bind @numpad7 gs c Putrescent Broth') -- Sultry Patrice (Slime - Amorph)
send_command('bind @numpad8 gs c Feculent Broth') -- Daring Roland (Hippogryph - Beast)
send_command('bind @numpad9 gs c BugRidden Broth') -- Alluring Honey (Snapweed - Plantoid)


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

	send_command("unbind @C")
	send_command("unbind @E")
	send_command("unbind @P")
	
	send_command("unbind F7")
	send_command("unbind !F7")
	
	send_command("unbind !F8")
	send_command("unbind @F8")
	
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
	set_macros(1,7)
	---Set Lockstyle Here
	if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
		set_style(23)
	else
		set_style(23)
	end
	
	
	--Gear Sets Start Here
	--Augmented Gear
	Artio = {}
	Artio.Idle = { name="Artio's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Mag. Evasion+15',}}
	Artio.STP = { name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	Artio.DW = { name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}}
	Artio.DA = { name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	Artio.Counter = { name="Artio's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','System: 1 ID: 640 Val: 4',}}
	Artio.Idle_pet = { name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Haste+10','Pet: Damage taken -5%',}}
	Artio.Macc_pet = { name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Mag. Acc.+10','"Cure" potency +10%',}}
	Artio.MND_WSD = { name="Artio's Mantle", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%',}}
	Artio.CHR_WSD = { name="Artio's Mantle", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','CHR+10','Weapon skill damage +10%',}}
	Artio.STR_DA = { name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}
	Artio.STR_WSD = { name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	Artio.FC = { name="Artio's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}}
	

	ValorousHead = {}
	ValorousHead.Pet_MAB = { name="Valorous Mask", augments={'Pet: "Mag.Atk.Bns."+26','Pet: INT+14','Pet: Attack+15 Pet: Rng.Atk.+15',}}
	
	ValorousBody = {}
	ValorousBody.Pet_Phys = { name="Valorous Mail", augments={'Pet: Attack+30 Pet: Rng.Atk.+30','Pet: DEX+15','Pet: Accuracy+14 Pet: Rng. Acc.+14',}}
	
	ValorousHands = {}
	
	ValorousLegs = {}
	ValorousLegs.Pet_MAB = { name="Valorous Hose", augments={'Pet: "Mag.Atk.Bns."+20','Pet: INT+14','Pet: Accuracy+9 Pet: Rng. Acc.+9','Pet: Attack+10 Pet: Rng.Atk.+10',}}
	ValorousLegs.Pet_Phys = { name="Valorous Hose", augments={'Pet: Attack+28 Pet: Rng.Atk.+28','Pet: STR+15',}}
	
	ValorousFeet = {}
	ValorousFeet.Crit = { name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+4','AGI+4','Accuracy+4','Attack+13',}}
	ValorousFeet.Pet_MAB = { name="Valorous Greaves", augments={'Pet: "Mag.Atk.Bns."+30','Pet: "Regen"+3','Pet: INT+3','Pet: Accuracy+5 Pet: Rng. Acc.+5','Pet: Attack+6 Pet: Rng.Atk.+6',}}

	TaeonHead = {}
	TaeonHead.DW = { name="Taeon Chapeau", augments={'Accuracy+22','"Dual Wield"+5','DEX+10',}}
	TaeonHead.Phalanx = { name="Taeon Chapeau", augments={'Accuracy+21','Spell interruption rate down -10%','Phalanx +3',}}
	
	TaeonBody = {}
	TaeonBody.DW = { name="Taeon Tabard", augments={'Accuracy+20','"Dual Wield"+5','DEX+9',}}
	TaeonBody.Phalanx = { name="Taeon Tabard", augments={'Mag. Evasion+10','Spell interruption rate down -10%','Phalanx +3',}}
	
	TaeonHands = {}
	TaeonHands.DW = { name="Taeon Gloves", augments={'Accuracy+20','"Dual Wield"+5','DEX+10',}}
	TaeonHands.Phalanx = { name="Taeon Gloves", augments={'Mag. Evasion+7','Spell interruption rate down -10%','Phalanx +3',}}
	
	TaeonLegs = {}
	TaeonLegs.DW = { name="Taeon Tights", augments={'Accuracy+23','"Dual Wield"+5','DEX+10',}}
	TaeonLegs.Phalanx = { name="Taeon Tights", augments={'"Mag.Atk.Bns."+7','Spell interruption rate down -10%','Phalanx +3',}}
	
	TaeonFeet = {}
	TaeonFeet.DW = { name="Taeon Boots", augments={'Accuracy+20 Attack+20','"Dual Wield"+5','Crit. hit damage +3%',}}
	TaeonFeet.Phalanx = { name="Taeon Boots", augments={'"Mag.Atk.Bns."+9','Spell interruption rate down -10%','Phalanx +3',}}
	
	AcroHead = {}
	AcroHead.CB = { name="Acro Helm", augments={'"Call Beast" ability delay -5',}}
	
	AcroBody = {}	
	
	AcroHands = {}
	AcroHands.STP = { name="Acro Gauntlets", augments={'Accuracy+20 Attack+20','"Store TP"+6','Crit. hit damage +3%',}}
	
	AcroLegs = {}
	AcroLegs.CB = { name="Acro Breeches", augments={'"Call Beast" ability delay -5',}}
	
	AcroFeet = {}
	AcroFeet.CB = { name="Acro Leggings", augments={'"Call Beast" ability delay -5',}}
	
	EmichoHead = {}
	EmichoHead.Pet_STR = { name="Emicho Coronet +1", augments={'Attack+25','"Store TP"+7','Pet: STR+20',}}
	EmichoHead.Pet_DA = { name="Emicho Coronet +1", augments={'Pet: Accuracy+20','Pet: Attack+20','Pet: "Dbl. Atk."+4',}}
	
	EmichoBody = {}
	EmichoBody.Pet_MAB = { name="Emicho Haubert +1", augments={'Pet: HP+125','Pet: INT+20','Pet: "Regen"+3',}}
	
	EmichoHands = {}
	EmichoHands.DW = { name="Emi. Gauntlets +1", augments={'Accuracy+25','"Dual Wield"+6','Pet: Accuracy+25',}}
	
	EmichoLegs = {}
	EmichoLegs.Pet_DA = { name="Emicho Hose +1", augments={'Pet: Accuracy+20','Pet: Attack+20','Pet: "Dbl. Atk."+4',}}
	
	EmichoFeet = {}
	

	--SubJob list--
	--Do not change these
	sets.SJ = {}
	sets.SJ.index = {"Other", "Ninja", "Dancer"}
	SJ_ind = 1	


	--Weapon Sets--
	--Pet_mode
	sets.Weapon_pet = {} -- sets weapon combo for melee-mode
	sets.Weapon_pet.index = {"Custom", "Aymur", "Pangu", "FullDT"}
	Wp_ind = 1
	sets.Weapon_pet.Custom = {} -- Mostly used for Aymur AM, disallowing weapon swaps
	sets.Weapon_pet.Aymur = { -- Offense focus
		main = "Aymur",
		sub = "Agwu's Axe"
	}
	sets.Weapon_pet.Pangu = { --High Acc and DT
		main = "Pangu",
		sub = "Agwu's Axe"
	}
	sets.Weapon_pet.FullDT = { -- High DT
		main = "Pangu",
		sub = "Astolfo"
	}
	
	--Melee_mode
	sets.Weapon_melee = {} -- sets weapon combo for melee-mode
	sets.Weapon_melee.index = {"Custom", "Aymur", "Pangu", "Dolichenus", "Naegling"}
	Wm_ind = 1
	sets.Weapon_melee.Custom = {} --intentionally blank so weapons will not swap aside from ammo (allows for manual equipping)
	sets.Weapon_melee.Aymur = {
		main = "Aymur",
		sub = "Agwu's Axe"
	}
	sets.Weapon_melee.Pangu = {
		main = "Pangu",
		sub = "Agwu's Axe"
	}
	sets.Weapon_melee.Dolichenus = {
		main = "Dolichenus",
		sub = "Ternion Dagger +1"
	}
	sets.Weapon_melee.Naegling = {
		main = "Naegling",
		sub = "Renaud's Axe +2"
	}


	sets.DW_mode = {}
	sets.DW_mode.index = {"DW", "notDW"}
	DW_mode_ind = 1

	sets.DW_mode.DW = {}
	sets.DW_mode.notDW = {sub = "Sacro Bulwark"} -- 0/0/10


	sets.Kite = {feet = "Skadi's Jambeaux +1"}

	--Idle Sets--
	-- Pet-mode
	-- Weapon swaps allowed in Pet_mode, but assumes no DT in main/sub slots (Stout Servant 11/0/24 DT to pet)
	sets.Idle_pet = {} -- Both pet and master are idle
	sets.Idle_pet.index = {"Standard", "DT_hybrid"}
	Idle_pet_ind = 1
	sets.Idle_pet.Standard = { -- Pet-focused DT
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Anwig Salade", -- (0/0/10)
		neck = "Shepherd's Chain", -- (0/0/2)
		ear1 = "Handler's Earring +1", -- (4/0/0)
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)
		ring1 = "Gelatinous Ring +1", -- 7/-1/0
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle_pet, -- (0/0/5)
		waist = "Isa Belt",	-- (0/0/3)
		legs = "Tali'ah Seraweels +2", -- (0/0/5) 
		feet = "Ankusa Gaiters +3" -- (5/0/0)
	} -- 14/-1/13 (9/0/55)
	sets.Idle_pet.DT_hybrid = { -- DT balanced for both pet and master
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Nyame Helm", -- 0/0/7
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Handler's Earring +1", -- (4/0/0)
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)
		ring1 = "Gelatinous Ring +1", -- 7/-1/0
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle_pet, -- (0/0/5)
		waist = "Isa Belt",	-- (0/0/3)
		legs = "Tali'ah Seraweels +2", -- (0/0/5) 
		feet = "Nyame Sollerets" -- 0/0/7
	} -- 14/-1/33 (9/0/40)
	
	
	-- Pet-mode (Pangu C)
	-- Pangu as a DT piece is so powerful that it redefines your sets (Pangu + Stout Servant 0/0/24 DT to pet) Best used with sets.Weapon_pet.FullDT 
	sets.Idle_pet_pangu = {}
	sets.Idle_pet_pangu.index = {"Standard", "DT_hybrid"}
	sets.Idle_pet_pangu.Standard = { -- Assumes Astolfo in offhand when DW (11/0/0 for pet). 
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Anwig Salade", -- (0/0/10)
		neck = "Shepherd's Chain", -- (0/0/2)
		ear1 = "Handler's Earring +1", -- (4/0/0)
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)
		ring1 = "Gelatinous Ring +1", -- 7/-1/0
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle_pet, -- (0/0/5)
		waist = "Isa Belt",	-- (0/0/3)
		legs = "Tali'ah Seraweels +2", -- (0/0/5) 
		feet = "Ankusa Gaiters +3" -- (5/0/0)
	} -- 14/-1/38 (20/0/70)
	sets.Idle_pet_pangu.DT_hybrid = { -- Set balanced around pet and master DT. Still assumes Astolfo offhand as above when DW.
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Nyame Helm", -- 0/0/7 
		neck = "Shepherd's Chain", -- (0/0/2)
		ear1 = "Handler's Earring +1", -- (4/0/0)
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)
		ring1 = "Sheltered Ring",
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle_pet, -- (0/0/5)
		waist = "Engraved Belt", 
		legs = "Tali'ah Seraweels +2", -- (0/0/5) 
		feet = "Ankusa Gaiters +3" -- (5/0/0)
	} -- 14/-1/38 (20/0/57)
	
	
	-- melee-mode (DW)
	sets.Idle_melee_DW = {}
	sets.Idle_melee_DW.index = {"Standard", "DT", "Regain"}
	Idle_ind = 1
	sets.Idle_melee_DW.Standard = { --Focus on Killer Effects along with DT
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Ankusa Helm +3", 
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", 
		ear2 = "Odnowa Earring +1", -- 0/2/3 
		body = "Nukumi Gausape +1", 
		hands = "Macabre Gauntlets +1", -- 4/0/0 
		ring1 = "Gelatinous Ring +1", -- 7/-1/0 
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle, 
		waist = "Engraved Belt",	
		legs = "Nyame Flanchard", -- 0/0/8 
		feet = "Nyame Sollerets" -- 0/0/7 
	} -- 11/1/37
	sets.Idle_melee_DW.DT = { -- Higher MEva set designed for when you can't abuse Killer Effects 
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Nyame Helm", -- 0/0/7
		neck = "Warder's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring",  
		body = "Nyame Mail", -- 0/0/9 
		hands = "Nyame Gauntlets", -- 0/0/7 
		ring1 = "Sheltered Ring",  
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle, 
		waist = "Engraved Belt",	
		legs = "Nyame Flanchard", -- 0/0/8 
		feet = "Nyame Sollerets" -- 0/0/7 
	} -- 0/0/52
	sets.Idle_melee_DW.Regain = {  
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Gleti's Mask", -- 6/0/0
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", 
		ear2 = "Odnowa Earring +1", -- 0/2/3  
		body = "Gleti's Cuirass", -- 9/0/0 
		hands = "Gleti's Gauntlets", -- 7/0/0 
		ring1 = "Moonbeam Ring", -- 0/0/4  
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle, 
		waist = "Engraved Belt",	
		legs = "Gleti's Breeches", -- 8/0/0 
		feet = "Gleti's Boots" -- 5/0/0 
	} -- 35/2/16
		
	
	
	-- melee-mode (DW, Pangu C 0/0/25)
	sets.Idle_melee_DW_pangu = {}
	sets.Idle_melee_DW_pangu.index = {"Standard", "DT", "Regain"}
	sets.Idle_melee_DW_pangu.Standard = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Ankusa Helm +3", 
		neck = "Warder's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Odnowa Earring +1", -- 0/2/3
		body = "Nukumi Gausape +1", 
		hands = "Macabre Gauntlets +1", -- 4/0/0 
		ring1 = "Sheltered Ring",  
		ring2 = "Shadow Ring", 
		back = Artio.Idle, 
		waist = "Engraved Belt",	
		legs = "Nyame Flanchard", -- 0/0/8 
		feet = "Nyame Sollerets" -- 0/0/7 
	} -- 4/2/46
	sets.Idle_melee_DW_pangu.DT = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Nyame Helm", -- 0/0/7
		neck = "Warder's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring",  
		body = "Nyame Mail", -- 0/0/9 
		hands = "Nyame Gauntlets", -- 0/0/7 
		ring1 = "Sheltered Ring",  
		ring2 = "Shadow Ring", 
		back = Artio.Idle, 
		waist = "Engraved Belt",	
		legs = "Nyame Flanchard", -- 0/0/8 
		feet = "Nyame Sollerets" -- 0/0/7 
	} -- 0/0/67
	sets.Idle_melee_DW_pangu.Regain = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Gleti's Mask", -- 6/0/0
		neck = "Warder's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring",   
		body = "Gleti's Cuirass", -- 9/0/0 
		hands = "Gleti's Gauntlets", -- 7/0/0 
		ring1 = "Sheltered Ring",   
		ring2 = "Shadow Ring", 
		back = Artio.Idle, 
		waist = "Engraved Belt",	
		legs = "Gleti's Breeches", -- 8/0/0 
		feet = "Gleti's Boots" -- 5/0/0 
	} -- 35/0/28
	
	
	-- melee-mode (Single-Wield, Sacro Bulwark 0/0/10)
	sets.Idle_melee_SW = {}
	sets.Idle_melee_SW.index = {"Standard", "DT", "Regain"}
	sets.Idle_melee_SW.Standard = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Ankusa Helm +3", 
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", 
		ear2 = "Odnowa Earring +1", -- 0/2/3  
		body = "Nukumi Gausape +1", 
		hands = "Macabre Gauntlets +1", -- 4/0/0 
		ring1 = "Sheltered Ring",  
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle, 
		waist = "Engraved Belt",	
		legs = "Nyame Flanchard", -- 0/0/8 
		feet = "Nyame Sollerets" -- 0/0/7 
	} -- 4/2/47
	sets.Idle_melee_SW.DT = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Nyame Helm", -- 0/0/7
		neck = "Warder's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring",  
		body = "Nyame Mail", -- 0/0/9 
		hands = "Nyame Gauntlets", -- 0/0/7 
		ring1 = "Sheltered Ring",  
		ring2 = "Shadow Ring", 
		back = Artio.Idle, 
		waist = "Engraved Belt",	
		legs = "Nyame Flanchard", -- 0/0/8 
		feet = "Nyame Sollerets" -- 0/0/7 
	} -- 0/0/52
	sets.Idle_melee_SW.Regain = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Gleti's Mask", -- 6/0/0
		neck = "Warder's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Odnowa Earring +1", -- 0/2/3  
		body = "Gleti's Cuirass", -- 9/0/0 
		hands = "Gleti's Gauntlets", -- 7/0/0 
		ring1 = "Sheltered Ring",   
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle, 
		waist = "Engraved Belt",	
		legs = "Gleti's Breeches", -- 8/0/0 
		feet = "Gleti's Boots" -- 5/0/0 
	} -- 35/2/16
	
	
	-- melee-mode (Single-Wield, Pangu C + Sacro Bulwark 0/0/35)
	sets.Idle_melee_SW_pangu = {}
	sets.Idle_melee_SW_pangu.index = {"Standard", "DT", "Regain"}
	sets.Idle_melee_SW_pangu.Standard = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Ankusa Helm +3", 
		neck = "Warder's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring",  
		body = "Nukumi Gausape +1", 
		hands = "Macabre Gauntlets +1", -- 4/0/0 
		ring1 = "Sheltered Ring",  
		ring2 = "Shadow Ring", 
		back = Artio.Idle, 
		waist = "Engraved Belt",	
		legs = "Nyame Flanchard", -- 0/0/8 
		feet = "Nyame Sollerets" -- 0/0/7 
	} -- 4/0/53
	sets.Idle_melee_SW_pangu.DT = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Nyame Helm", -- 0/0/7
		neck = "Warder's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring",  
		body = "Nyame Mail", -- 0/0/9 
		hands = "Nyame Gauntlets", -- 0/0/7 
		ring1 = "Sheltered Ring",  
		ring2 = "Shadow Ring", 
		back = Artio.Idle, 
		waist = "Engraved Belt",	
		legs = "Nyame Flanchard", -- 0/0/8 
		feet = "Nyame Sollerets" -- 0/0/7 
	} -- 0/0/76
	sets.Idle_melee_SW_pangu.Regain = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Gleti's Mask", -- 6/0/0
		neck = "Warder's Charm +1", 
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring",  
		body = "Gleti's Cuirass", -- 9/0/0 
		hands = "Gleti's Gauntlets", -- 7/0/0 
		ring1 = "Sheltered Ring",   
		ring2 = "Shadow Ring", 
		back = Artio.Idle, 
		waist = "Engraved Belt",	
		legs = "Gleti's Breeches", -- 8/0/0 
		feet = "Gleti's Boots" -- 5/0/0 
	} -- 35/0/35
	
	
	
	sets.TP = {}
	sets.TP.index = {"Standard", "DT", "Counter"}
	TP_ind = 1

	sets.TP.Standard = {} 
	sets.TP.Standard.index = {"Other", "Ninja", "Dancer"}
	sets.TP.Standard.Other = { -- not DW
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Dedition Earring", 		
		body = "Tali'ah Manteel +2", 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",	
		back = Artio.STP, 
		waist = "Windbuffet Belt +1",	
		legs = "Meghanada Chausses +2", 
		feet = "Malignance Boots"
	} -- 11DA/21TA/2QA | +64 sTP
	

	sets.TP.Standard.Ninja = {} -- DWIII (25%)
	sets.TP.Standard.Ninja.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45", "Haste_50", "Haste_55"}
	-- 49 DW needed
	sets.TP.Standard.Ninja.Haste_0 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Windbuffet Belt +1", 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 6DA/12TA/2QA | +17 sTP | 49 DW
	-- 47 DW needed
	sets.TP.Standard.Ninja.Haste_5 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 6DA/10TA/0QA | +25 sTP | 47 DW
	-- 45 DW needed
	sets.TP.Standard.Ninja.Haste_10 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Windbuffet Belt +1", 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 11DA/12TA/2QA | +22 sTP | 45 DW
	-- 42 DW needed
	sets.TP.Standard.Ninja.Haste_15 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = "Tali'ah Manteel +2", 
		hands = EmichoHands.DW, -- 6 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 6DA/16TA/0QA | +25 sTP | 42 DW
	-- 39 DW needed
	sets.TP.Standard.Ninja.Haste_20 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Windbuffet Belt +1", 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 11DA/12TA/2QA | +27 sTP | 39 DW
	-- 35 DW needed
	sets.TP.Standard.Ninja.Haste_25 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = "Tali'ah Manteel +2", 
		hands = EmichoHands.DW, -- 6 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Windbuffet Belt +1",  
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 6DA/18TA/2QA | +21 sTP | 35 DW
	-- 31 DW needed
	sets.TP.Standard.Ninja.Haste_30 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = "Tali'ah Manteel +2", 
		hands = EmichoHands.DW, -- 6 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Windbuffet Belt +1",  
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 11DA/18TA/2QA | +26 sTP | 31 DW
	-- 25 DW needed
	sets.TP.Standard.Ninja.Haste_35 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = "Tali'ah Manteel +2", 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Windbuffet Belt +1",  
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 11DA/18TA/2QA | +31 sTP | 25 DW
	-- 18 DW needed
	sets.TP.Standard.Ninja.Haste_40 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Anu Torque", 
		ear1 = "Eabani Earring", -- 4 
		ear2 = "Suppanomimi", -- 5	
		body = "Tali'ah Manteel +2", 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.DA, 
		waist = "Windbuffet Belt +1",  
		legs = "Meghanada Chausses +2", 
		feet = TaeonFeet.DW -- 9
	} -- 16DA/22TA/2QA | +30 sTP | 18 DW
	-- 11 DW needed
	sets.TP.Standard.Ninja.Haste_45 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = "Tali'ah Manteel +2", 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.DA, 
		waist = "Reiki Yotai", -- 7  
		legs = "Meghanada Chausses +2", 
		feet = "Malignance Boots"
	} -- 21DA/20TA/0QA | +48 sTP | 12 DW
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
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Reiki Yotai", -- 7
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 6DA/10TA/0QA | +21 sTP | 56 DW
	-- 57 DW needed
	sets.TP.Standard.Dancer.Haste_5 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Reiki Yotai", -- 7
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 6DA/10TA/0QA | +21 sTP | 56 DW
	-- 55 DW needed
	sets.TP.Standard.Dancer.Haste_10 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Reiki Yotai", -- 7
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 6DA/10TA/0QA | +21 sTP | 56 DW
	-- 52 DW needed
	sets.TP.Standard.Dancer.Haste_15 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Reiki Yotai", -- 7
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 11DA/10TA/0QA | +26 sTP | 56 DW
	-- 49 DW needed
	sets.TP.Standard.Dancer.Haste_20 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Windbuffet Belt +1", 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 11DA/12TA/2QA | +22 sTP | 49 DW
	-- 45 DW needed
	sets.TP.Standard.Dancer.Haste_25 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Windbuffet Belt +1", 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 11DA/12TA/2QA | +22 sTP | 45 DW
	-- 41 DW needed
	sets.TP.Standard.Dancer.Haste_30 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = "Tali'ah Manteel +2", 
		hands = EmichoHands.DW, -- 6 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 6DA/16TA/0QA | +25 sTP | 42 DW
	-- 35 DW needed
	sets.TP.Standard.Dancer.Haste_35 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = "Tali'ah Manteel +2", 
		hands = EmichoHands.DW, -- 6 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Windbuffet Belt +1",  
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 6DA/18TA/2QA | +21 sTP | 35 DW
	-- 28 DW needed
	sets.TP.Standard.Dancer.Haste_40 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = "Tali'ah Manteel +2", 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Windbuffet Belt +1",  
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 6DA/18TA/2QA | +26 sTP | 29 DW
	-- 21 DW needed
	sets.TP.Standard.Dancer.Haste_45 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = "Tali'ah Manteel +2", 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, 
		waist = "Reiki Yotai", -- 7  
		legs = "Meghanada Chausses +2", 
		feet = "Malignance Boots"
	} -- 11DA/20TA/0QA | +48 sTP | 22 DW
	-- 15 DW needed
	sets.TP.Standard.Dancer.Haste_50 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = "Tali'ah Manteel +2", 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, 
		waist = "Windbuffet Belt +1", 
		legs = "Meghanada Chausses +2", 
		feet = "Malignance Boots"
	} -- 11DA/22TA/2QA | +44 sTP | 15 DW
	-- 9 DW needed
	sets.TP.Standard.Dancer.Haste_55 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Brutal Earring", 	
		body = "Tali'ah Manteel +2", 
		hands = "Malignance Gloves", 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.DA, 
		waist = "Windbuffet Belt +1", 
		legs = "Meghanada Chausses +2", 
		feet = TaeonFeet.DW
	} -- 16DA/22TA/2QA | +36 sTP | 9 DW



	sets.TP.DT = {}
	sets.TP.DT.index = {"Other", "Ninja", "Dancer"}
	sets.TP.DT.Other = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Dedition Earring", 		
		body = "Gleti's Cuirass", -- 9/0/0
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring", -- 0/0/10	
		back = Artio.STP, -- 10/0/0
		waist = "Windbuffet Belt +1",	
		legs = "Meghanada Chausses +2", -- 6/0/0 
		feet = "Malignance Boots" -- 0/0/4
	} -- 18DA/10TA/2QA | +64 sTP | 25/0/25
	
	
	sets.TP.DT.Ninja = {}
	sets.TP.DT.Ninja.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45", "Haste_50", "Haste_55"}
	-- 49 DW needed
	sets.TP.DT.Ninja.Haste_0 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Windbuffet Belt +1", 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/4TA/2QA | +14 sTP | 49 DW | 10/0/20
	-- 47 DW needed
	sets.TP.DT.Ninja.Haste_5 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +22 sTP | 47 DW | 10/0/20
	-- 45 DW needed
	sets.TP.DT.Ninja.Haste_10 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Windbuffet Belt +1", 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 8DA/4TA/2QA | +19 sTP | 45 DW | 10/0/20
	-- 42 DW needed
	sets.TP.DT.Ninja.Haste_15 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = "Gleti's Cuirass", -- 9/0/0 
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 10DA/8TA/0QA | +22 sTP | 42 DW | 19/0/20
	-- 39 DW needed
	sets.TP.DT.Ninja.Haste_20 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Windbuffet Belt +1", 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 8DA/4TA/2QA | +24 sTP | 39 DW | 10/0/25
	-- 35 DW needed
	sets.TP.DT.Ninja.Haste_25 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = "Gleti's Cuirass", -- 9/0/0
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Windbuffet Belt +1",  
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 10DA/10TA/2QA | +18 sTP | 35 DW | 19/0/25
	-- 31 DW needed
	sets.TP.DT.Ninja.Haste_30 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = "Gleti's Cuirass", -- 9/0/0
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Windbuffet Belt +1",  
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 18DA/18TA/2QA | +26 sTP | 31 DW | 19/0/20
	-- 25 DW needed
	sets.TP.DT.Ninja.Haste_35 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = "Gleti's Cuirass", -- 9/0/0
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Windbuffet Belt +1",  
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 15DA/10TA/2QA | +28 sTP | 25 DW | 19/0/25
	-- 18 DW needed
	sets.TP.DT.Ninja.Haste_40 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", -- 4 
		ear2 = "Suppanomimi", -- 5	
		body = "Gleti's Cuirass", -- 9/0/0
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DA, -- 10/0/0
		waist = "Windbuffet Belt +1",  
		legs = "Meghanada Chausses +2", -- 6/0/0 
		feet = TaeonFeet.DW -- 9
	} -- 23DA/11TA/2QA | +15 sTP | 18 DW | 25/0/27
	-- 11 DW needed
	sets.TP.DT.Ninja.Haste_45 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = "Gleti's Cuirass", -- 9/0/0 
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DA, -- 10/0/0
		waist = "Reiki Yotai", -- 7  
		legs = "Meghanada Chausses +2", -- 6/0/0 
		feet = "Malignance Boots" -- 0/0/4
	} -- 28DA/9TA/0QA | +48 sTP | 12 DW | 25/0/25
	-- 6 DW needed (Not currently possible to determine haste samba from outside source - this may become a toggle later)
	sets.TP.DT.Ninja.Haste_50 = {}
	-- 0 DW needed (Not currently possible to determine haste samba from outside source - this may become a toggle later)
	sets.TP.DT.Ninja.Haste_55 = {}
	
	
	
	sets.TP.DT.Dancer = {}
	sets.TP.DT.Dancer.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45", "Haste_50", "Haste_55"}
	-- 59 DW needed
	sets.TP.DT.Dancer.Haste_0 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 56 DW | 10/0/20
	-- 57 DW needed
	sets.TP.DT.Dancer.Haste_5 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 56 DW | 10/0/20
	-- 55 DW needed
	sets.TP.DT.Dancer.Haste_10 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 56 DW | 10/0/20
	-- 52 DW needed
	sets.TP.DT.Dancer.Haste_15 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 8DA/2TA/0QA | +24 sTP | 56 DW | 10/0/20
	-- 49 DW needed
	sets.TP.DT.Dancer.Haste_20 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Windbuffet Belt +1", 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 8DA/4TA/2QA | +19 sTP | 49 DW | 10/0/20
	-- 45 DW needed
	sets.TP.DT.Dancer.Haste_25 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Windbuffet Belt +1", 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 8DA/4TA/2QA | +19 sTP | 45 DW | 10/0/20
	-- 41 DW needed
	sets.TP.DT.Dancer.Haste_30 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = "Gleti's Cuirass", -- 9/0/0
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 10DA/2TA/0QA | +18 sTP | 42 DW | 19/0/20
	-- 35 DW needed
	sets.TP.DT.Dancer.Haste_35 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = "Gleti's Cuirass", -- 9/0/0
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Windbuffet Belt +1",  
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 10DA/4TA/2QA | +14 sTP | 35 DW | 19/0/20
	-- 28 DW needed
	sets.TP.DT.Dancer.Haste_40 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = "Gleti's Cuirass", -- 9/0/0
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Windbuffet Belt +1",  
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 10DA/4TA/2QA | +19 sTP | 29 DW | 19/0/25
	-- 21 DW needed
	sets.TP.DT.Dancer.Haste_45 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Loricate Torque +1", -- 0/0/6 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = "Gleti's Cuirass", -- 9/0/0
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7  
		legs = "Meghanada Chausses +2", -- 6/0/0
		feet = "Malignance Boots"
	} -- 18DA/9TA/0QA | +41 sTP | 22 DW | 25/0/27
	-- 15 DW needed
	sets.TP.DT.Dancer.Haste_50 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = "Gleti's Cuirass", -- 9/0/0
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Windbuffet Belt +1", 
		legs = "Meghanada Chausses +2", -- 6/0/0 
		feet = "Malignance Boots" -- 0/0/4
	} -- 18DA/11TA/2QA | +34 sTP | 15 DW | 25/0/25
	-- 9 DW needed
	sets.TP.DT.Dancer.Haste_55 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Brutal Earring", 	
		body = "Gleti's Cuirass", -- 9/0/0
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DA, -- 10/0/0
		waist = "Windbuffet Belt +1", 
		legs = "Meghanada Chausses +2", -- 6/0/0 
		feet = TaeonFeet.DW
	} -- 33DA/11TA/2QA | +36 sTP | 9 DW | 25/0/21
	
	
	-- Sets are best used with Pangu C, but not needed if the DT isn't necessary for some reason
	-- Sacro Bulwark is factored in as Shield in SW (Other) set
	-- Zealous Snort gives an additional +25% counter
	sets.TP.Counter = {}
	sets.TP.Counter.index = {"Other", "Ninja", "Dancer"}
	sets.TP.Counter.Other = {
		ammo = "Coiste Bodhar",
		head = "Gleti's Mask", -- 6/0/0
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Cryptic Earring", 		
		body = "Sacro Breastplate", 
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring", 	
		back = Artio.Counter, 
		waist = "Windbuffet Belt +1",	
		legs = "Malignance Tights", -- 0/0/7 
		feet = "Malignance Boots" -- 0/0/4
	} -- 18DA/10TA/2QA | +64 sTP | 6/0/26 | Counter +45 (+70 w/ Snort, capped when also /mnk)
	
	
	-- Does NOT assume Sacro Bulwark for DT
	sets.TP.Counter.Ninja = {}
	sets.TP.Counter.Ninja.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45", "Haste_50", "Haste_55"}
	-- 49 DW needed
	sets.TP.Counter.Ninja.Haste_0 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 46 DW | 0/0/16
	-- 47 DW needed
	sets.TP.Counter.Ninja.Haste_5 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 46 DW | 0/0/16
	-- 45 DW needed
	sets.TP.Counter.Ninja.Haste_10 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 46 DW | 0/0/16
	-- 42 DW needed
	sets.TP.Counter.Ninja.Haste_15 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = "Sacro Breastplate",
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 41 DW | 0/0/16
	-- 39 DW needed
	sets.TP.Counter.Ninja.Haste_20 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = "Sacro Breastplate",
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 41 DW | 0/0/16
	-- 35 DW needed
	sets.TP.Counter.Ninja.Haste_25 = {
		ammo = "Coiste Bodhar",
		head = "Gleti's Mask", -- 6/0/0 
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = "Sacro Breastplate",
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 36 DW | 6/0/16
	-- 31 DW needed
	sets.TP.Counter.Ninja.Haste_30 = {
		ammo = "Coiste Bodhar",
		head = "Gleti's Mask", -- 6/0/0 
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Cryptic Earring",	
		body = "Sacro Breastplate",
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 31 DW | 6/0/16
	-- 25 DW needed
	sets.TP.Counter.Ninja.Haste_35 = {
		ammo = "Coiste Bodhar",
		head = "Gleti's Mask", -- 6/0/0 
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Cryptic Earring",	
		body = "Sacro Breastplate",
		hands = "Malignance Gloves", -- 6 0/0/5 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +23 sTP | 25 DW | 6/0/21
	-- 18 DW needed
	sets.TP.Counter.Ninja.Haste_40 = {
		ammo = "Coiste Bodhar",
		head = "Gleti's Mask", -- 6/0/0 
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Cryptic Earring",	
		body = "Sacro Breastplate",
		hands = "Malignance Gloves", -- 6 0/0/5 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring", 
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = "Malignance Tights", -- 0/0/7
		feet = TaeonFeet.DW -- 9
	} -- 11DA/8TA/0QA | +38 sTP | 16 DW | 6/0/12
	-- 11 DW needed
	sets.TP.Counter.Ninja.Haste_45 = {
		ammo = "Coiste Bodhar",
		head = "Gleti's Mask", -- 6/0/0 
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Cryptic Earring",	
		body = "Sacro Breastplate",
		hands = "Malignance Gloves", -- 6 0/0/5 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring", 
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = "Malignance Tights", -- 0/0/7
		feet = "Malignance Boots" -- 0/0/4
	} -- 11DA/8TA/0QA | +40 sTP | 7 DW | 6/0/16
	-- 6 DW needed (Not currently possible to determine haste samba from outside source - this may become a toggle later)
	sets.TP.Counter.Ninja.Haste_50 = {}
	-- 0 DW needed (Not currently possible to determine haste samba from outside source - this may become a toggle later)
	sets.TP.Counter.Ninja.Haste_55 = {}
	
	
	
	sets.TP.Counter.Dancer = {}
	sets.TP.Counter.Dancer.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45", "Haste_50", "Haste_55"}
	-- 59 DW needed
	sets.TP.Counter.Dancer.Haste_0 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 46 DW | 0/0/16
	-- 47 DW needed
	sets.TP.Counter.Dancer.Haste_5 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 46 DW | 0/0/16
	-- 45 DW needed
	sets.TP.Counter.Dancer.Haste_10 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 46 DW | 0/0/16
	-- 42 DW needed
	sets.TP.Counter.Dancer.Haste_15 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = "Sacro Breastplate",
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 41 DW | 0/0/16
	-- 39 DW needed
	sets.TP.Counter.Dancer.Haste_20 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = "Sacro Breastplate",
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 41 DW | 0/0/16
	-- 35 DW needed
	sets.TP.Counter.Dancer.Haste_25 = {
		ammo = "Coiste Bodhar",
		head = "Gleti's Mask", -- 6/0/0 
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = "Sacro Breastplate",
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 36 DW | 6/0/16
	-- 31 DW needed
	sets.TP.Counter.Dancer.Haste_30 = {
		ammo = "Coiste Bodhar",
		head = "Gleti's Mask", -- 6/0/0 
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Cryptic Earring",	
		body = "Sacro Breastplate",
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 31 DW | 6/0/16
	-- 25 DW needed
	sets.TP.Counter.Dancer.Haste_35 = {
		ammo = "Coiste Bodhar",
		head = "Gleti's Mask", -- 6/0/0 
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Cryptic Earring",	
		body = "Sacro Breastplate",
		hands = "Malignance Gloves", -- 6 0/0/5 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +23 sTP | 25 DW | 6/0/21
	-- 18 DW needed
	sets.TP.Counter.Dancer.Haste_40 = {
		ammo = "Coiste Bodhar",
		head = "Gleti's Mask", -- 6/0/0 
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Cryptic Earring",	
		body = "Sacro Breastplate",
		hands = "Malignance Gloves", -- 6 0/0/5 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring", 
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = "Malignance Tights", -- 0/0/7
		feet = TaeonFeet.DW -- 9
	} -- 11DA/8TA/0QA | +38 sTP | 16 DW | 6/0/12
	-- 11 DW needed
	sets.TP.Counter.Dancer.Haste_45 = {
		ammo = "Coiste Bodhar",
		head = "Gleti's Mask", -- 6/0/0 
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Cryptic Earring",	
		body = "Sacro Breastplate",
		hands = "Malignance Gloves", -- 6 0/0/5 
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring", 
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = "Malignance Tights", -- 0/0/7
		feet = "Malignance Boots" -- 0/0/4
	} -- 11DA/8TA/0QA | +40 sTP | 7 DW | 6/0/16

	
	
	--AM3 Sets--
	-- Specifically accounts for Mythic AM3
	-- I used to differentiate the sets more between AM3 and non-AM3, but the results are usually similar enough,
	-- -- I've mostly backed off of DA and replaced with solid amounts of sTP. You still want extra TA though.
	-- These are here so you can do what you want with them. You can usually do better than 5/5 Malignance though.
	sets.AM3 = {}
	sets.AM3.index = {"Standard", "DT", "Counter"}
	TP_ind = 1

	sets.AM3.Standard = {} 
	sets.AM3.Standard.index = {"Other", "Ninja", "Dancer"}
	sets.AM3.Standard.Other = { -- not DW
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", 
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Dedition Earring", 		
		body = "Tali'ah Manteel +2", 
		hands = "Malignance Gloves", 
		ring1 = "Ilabrat Ring", 
		ring2 = "Gere Ring",	
		back = Artio.STP, 
		waist = "Windbuffet Belt +1",
		legs = "Meghanada Chausses +2", 
		feet = "Malignance Boots"
	} -- 11DA/21TA/2QA | +64 sTP
	

	sets.AM3.Standard.Ninja = {} -- DWIII (25%)
	sets.AM3.Standard.Ninja.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45", "Haste_50", "Haste_55"}
	-- 49 DW needed
	sets.AM3.Standard.Ninja.Haste_0 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Ilabrat Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Windbuffet Belt +1", 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 6DA/12TA/2QA | +17 sTP | 49 DW
	-- 47 DW needed
	sets.AM3.Standard.Ninja.Haste_5 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Ilabrat Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 6DA/10TA/0QA | +25 sTP | 47 DW
	-- 45 DW needed
	sets.AM3.Standard.Ninja.Haste_10 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Ilabrat Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Windbuffet Belt +1", 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 11DA/12TA/2QA | +22 sTP | 45 DW
	-- 42 DW needed
	sets.AM3.Standard.Ninja.Haste_15 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = "Tali'ah Manteel +2", 
		hands = EmichoHands.DW, -- 6 
		ring1 = "Ilabrat Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 6DA/16TA/0QA | +25 sTP | 42 DW
	-- 39 DW needed
	sets.AM3.Standard.Ninja.Haste_20 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = "Malignance Gloves", 
		ring1 = "Ilabrat Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Windbuffet Belt +1", 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 11DA/12TA/2QA | +27 sTP | 39 DW
	-- 35 DW needed
	sets.AM3.Standard.Ninja.Haste_25 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = "Tali'ah Manteel +2", 
		hands = EmichoHands.DW, -- 6 
		ring1 = "Ilabrat Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Windbuffet Belt +1",  
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 6DA/18TA/2QA | +21 sTP | 35 DW
	-- 31 DW needed
	sets.AM3.Standard.Ninja.Haste_30 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = "Tali'ah Manteel +2", 
		hands = EmichoHands.DW, -- 6 
		ring1 = "Ilabrat Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Windbuffet Belt +1",  
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 11DA/18TA/2QA | +26 sTP | 31 DW
	-- 25 DW needed
	sets.AM3.Standard.Ninja.Haste_35 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = "Tali'ah Manteel +2", 
		hands = "Malignance Gloves", 
		ring1 = "Ilabrat Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Windbuffet Belt +1",  
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 11DA/18TA/2QA | +31 sTP | 25 DW
	-- 18 DW needed
	sets.AM3.Standard.Ninja.Haste_40 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Anu Torque", 
		ear1 = "Eabani Earring", -- 4 
		ear2 = "Suppanomimi", -- 5	
		body = "Tali'ah Manteel +2", 
		hands = "Malignance Gloves", 
		ring1 = "Ilabrat Ring", 
		ring2 = "Gere Ring",
		back = Artio.STP, 
		waist = "Windbuffet Belt +1",  
		legs = "Meghanada Chausses +2", 
		feet = TaeonFeet.DW -- 9
	} -- 16DA/22TA/2QA | +30 sTP | 18 DW
	-- 11 DW needed
	sets.AM3.Standard.Ninja.Haste_45 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = "Tali'ah Manteel +2", 
		hands = "Malignance Gloves", 
		ring1 = "Ilabrat Ring", 
		ring2 = "Gere Ring",
		back = Artio.STP, 
		waist = "Reiki Yotai", -- 7  
		legs = "Meghanada Chausses +2", 
		feet = "Malignance Boots"
	} -- 21DA/20TA/0QA | +48 sTP | 12 DW
	-- 6 DW needed (Not currently possible to determine haste samba from outside source - this may become a toggle later)
	sets.AM3.Standard.Ninja.Haste_50 = {}
	-- 0 DW needed (Not currently possible to determine haste samba from outside source - this may become a toggle later)
	sets.AM3.Standard.Ninja.Haste_55 = {}	
	
	
	sets.AM3.Standard.Dancer = {} -- DWII (15%)
	-- Note that sets for Haste_50 and Haste_55 exist for interactions with DNC JA Haste
	-- Currently, unless /DNC, we cannot track this buff provided from outside sources
	-- This lua is future-proofed in the event that this changes (a toggle may be implemented in the future as a work-around) 
	sets.AM3.Standard.Dancer.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45", "Haste_50", "Haste_55"}
	-- 59 DW needed
	sets.AM3.Standard.Dancer.Haste_0 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Ilabrat Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Reiki Yotai", -- 7
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 6DA/10TA/0QA | +21 sTP | 56 DW
	-- 57 DW needed
	sets.AM3.Standard.Dancer.Haste_5 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Ilabrat Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Reiki Yotai", -- 7
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 6DA/10TA/0QA | +21 sTP | 56 DW
	-- 55 DW needed
	sets.AM3.Standard.Dancer.Haste_10 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Ilabrat Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Reiki Yotai", -- 7
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 6DA/10TA/0QA | +21 sTP | 56 DW
	-- 52 DW needed
	sets.AM3.Standard.Dancer.Haste_15 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Ilabrat Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Reiki Yotai", -- 7
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 11DA/10TA/0QA | +26 sTP | 56 DW
	-- 49 DW needed
	sets.AM3.Standard.Dancer.Haste_20 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Ilabrat Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Windbuffet Belt +1", 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 11DA/12TA/2QA | +22 sTP | 49 DW
	-- 45 DW needed
	sets.AM3.Standard.Dancer.Haste_25 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Ilabrat Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Windbuffet Belt +1", 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 11DA/12TA/2QA | +22 sTP | 45 DW
	-- 41 DW needed
	sets.AM3.Standard.Dancer.Haste_30 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = "Tali'ah Manteel +2", 
		hands = EmichoHands.DW, -- 6 
		ring1 = "Ilabrat Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 6DA/16TA/0QA | +25 sTP | 42 DW
	-- 35 DW needed
	sets.AM3.Standard.Dancer.Haste_35 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = "Tali'ah Manteel +2", 
		hands = EmichoHands.DW, -- 6 
		ring1 = "Ilabrat Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Windbuffet Belt +1",  
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 6DA/18TA/2QA | +21 sTP | 35 DW
	-- 28 DW needed
	sets.AM3.Standard.Dancer.Haste_40 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Anu Torque", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = "Tali'ah Manteel +2", 
		hands = "Malignance Gloves", 
		ring1 = "Ilabrat Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, -- 10
		waist = "Windbuffet Belt +1",  
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 6DA/18TA/2QA | +26 sTP | 29 DW
	-- 21 DW needed
	sets.AM3.Standard.Dancer.Haste_45 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = "Tali'ah Manteel +2", 
		hands = "Malignance Gloves", 
		ring1 = "Ilabrat Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, 
		waist = "Reiki Yotai", -- 7  
		legs = "Meghanada Chausses +2", 
		feet = "Malignance Boots"
	} -- 11DA/20TA/0QA | +48 sTP | 22 DW
	-- 15 DW needed
	sets.AM3.Standard.Dancer.Haste_50 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = "Tali'ah Manteel +2", 
		hands = "Malignance Gloves", 
		ring1 = "Ilabrat Ring", 
		ring2 = "Gere Ring",
		back = Artio.DW, 
		waist = "Windbuffet Belt +1", 
		legs = "Meghanada Chausses +2", 
		feet = "Malignance Boots"
	} -- 11DA/22TA/2QA | +44 sTP | 15 DW
	-- 9 DW needed
	sets.AM3.Standard.Dancer.Haste_55 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau",
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Brutal Earring", 	
		body = "Tali'ah Manteel +2", 
		hands = "Malignance Gloves", 
		ring1 = "Ilabrat Ring", 
		ring2 = "Gere Ring",
		back = Artio.STP, 
		waist = "Windbuffet Belt +1", 
		legs = "Meghanada Chausses +2", 
		feet = TaeonFeet.DW
	} -- 16DA/22TA/2QA | +36 sTP | 9 DW



	sets.AM3.DT = {}
	sets.AM3.DT.index = {"Other", "Ninja", "Dancer"}
	sets.AM3.DT.Other = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Dedition Earring", 		
		body = "Gleti's Cuirass", -- 9/0/0
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Ilabrat Ring", 
		ring2 = "Defending Ring", -- 0/0/10	
		back = Artio.STP, -- 10/0/0
		waist = "Windbuffet Belt +1",	
		legs = "Meghanada Chausses +2", -- 6/0/0 
		feet = "Malignance Boots" -- 0/0/4
	} -- 18DA/10TA/2QA | +64 sTP | 25/0/25
	
	
	sets.AM3.DT.Ninja = {}
	sets.AM3.DT.Ninja.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45", "Haste_50", "Haste_55"}
	-- 49 DW needed
	sets.AM3.DT.Ninja.Haste_0 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Windbuffet Belt +1", 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/4TA/2QA | +14 sTP | 49 DW | 10/0/20
	-- 47 DW needed
	sets.AM3.DT.Ninja.Haste_5 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +22 sTP | 47 DW | 10/0/20
	-- 45 DW needed
	sets.AM3.DT.Ninja.Haste_10 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Windbuffet Belt +1", 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 8DA/4TA/2QA | +19 sTP | 45 DW | 10/0/20
	-- 42 DW needed
	sets.AM3.DT.Ninja.Haste_15 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = "Gleti's Cuirass", -- 9/0/0 
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 10DA/8TA/0QA | +22 sTP | 42 DW | 19/0/20
	-- 39 DW needed
	sets.AM3.DT.Ninja.Haste_20 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Windbuffet Belt +1", 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 8DA/4TA/2QA | +24 sTP | 39 DW | 10/0/25
	-- 35 DW needed
	sets.AM3.DT.Ninja.Haste_25 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = "Gleti's Cuirass", -- 9/0/0
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Windbuffet Belt +1",  
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 10DA/10TA/2QA | +18 sTP | 35 DW | 19/0/25
	-- 31 DW needed
	sets.AM3.DT.Ninja.Haste_30 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = "Gleti's Cuirass", -- 9/0/0
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Windbuffet Belt +1",  
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 18DA/18TA/2QA | +26 sTP | 31 DW | 19/0/20
	-- 25 DW needed
	sets.AM3.DT.Ninja.Haste_35 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = "Gleti's Cuirass", -- 9/0/0
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Windbuffet Belt +1",  
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 15DA/10TA/2QA | +28 sTP | 25 DW | 19/0/25
	-- 18 DW needed
	sets.AM3.DT.Ninja.Haste_40 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", -- 4 
		ear2 = "Suppanomimi", -- 5	
		body = "Gleti's Cuirass", -- 9/0/0
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Ilabrat Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.STP, -- 10/0/0
		waist = "Windbuffet Belt +1",  
		legs = "Meghanada Chausses +2", -- 6/0/0 
		feet = TaeonFeet.DW -- 9
	} -- 23DA/11TA/2QA | +15 sTP | 18 DW | 25/0/27
	-- 11 DW needed
	sets.AM3.DT.Ninja.Haste_45 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = "Gleti's Cuirass", -- 9/0/0 
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Ilabrat Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.STP, -- 10/0/0
		waist = "Reiki Yotai", -- 7  
		legs = "Meghanada Chausses +2", -- 6/0/0 
		feet = "Malignance Boots" -- 0/0/4
	} -- 28DA/9TA/0QA | +48 sTP | 12 DW | 25/0/25
	-- 6 DW needed (Not currently possible to determine haste samba from outside source - this may become a toggle later)
	sets.AM3.DT.Ninja.Haste_50 = {}
	-- 0 DW needed (Not currently possible to determine haste samba from outside source - this may become a toggle later)
	sets.AM3.DT.Ninja.Haste_55 = {}
	
	
	
	sets.AM3.DT.Dancer = {}
	sets.AM3.DT.Dancer.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45", "Haste_50", "Haste_55"}
	-- 59 DW needed
	sets.AM3.DT.Dancer.Haste_0 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 56 DW | 10/0/20
	-- 57 DW needed
	sets.AM3.DT.Dancer.Haste_5 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 56 DW | 10/0/20
	-- 55 DW needed
	sets.AM3.DT.Dancer.Haste_10 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 56 DW | 10/0/20
	-- 52 DW needed
	sets.AM3.DT.Dancer.Haste_15 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 8DA/2TA/0QA | +24 sTP | 56 DW | 10/0/20
	-- 49 DW needed
	sets.AM3.DT.Dancer.Haste_20 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Windbuffet Belt +1", 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 8DA/4TA/2QA | +19 sTP | 49 DW | 10/0/20
	-- 45 DW needed
	sets.AM3.DT.Dancer.Haste_25 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Windbuffet Belt +1", 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 8DA/4TA/2QA | +19 sTP | 45 DW | 10/0/20
	-- 41 DW needed
	sets.AM3.DT.Dancer.Haste_30 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = "Gleti's Cuirass", -- 9/0/0
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 10DA/2TA/0QA | +18 sTP | 42 DW | 19/0/20
	-- 35 DW needed
	sets.AM3.DT.Dancer.Haste_35 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = "Gleti's Cuirass", -- 9/0/0
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Windbuffet Belt +1",  
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 10DA/4TA/2QA | +14 sTP | 35 DW | 19/0/20
	-- 28 DW needed
	sets.AM3.DT.Dancer.Haste_40 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = "Gleti's Cuirass", -- 9/0/0
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Windbuffet Belt +1",  
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 10DA/4TA/2QA | +19 sTP | 29 DW | 19/0/25
	-- 21 DW needed
	sets.AM3.DT.Dancer.Haste_45 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Loricate Torque +1", -- 0/0/6 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = "Gleti's Cuirass", -- 9/0/0
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Ilabrat Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7  
		legs = "Meghanada Chausses +2", -- 6/0/0
		feet = "Malignance Boots"
	} -- 18DA/9TA/0QA | +41 sTP | 22 DW | 25/0/27
	-- 15 DW needed
	sets.AM3.DT.Dancer.Haste_50 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Suppanomimi", -- 5	
		body = "Gleti's Cuirass", -- 9/0/0
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Ilabrat Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Windbuffet Belt +1", 
		legs = "Meghanada Chausses +2", -- 6/0/0 
		feet = "Malignance Boots" -- 0/0/4
	} -- 18DA/11TA/2QA | +34 sTP | 15 DW | 25/0/25
	-- 9 DW needed
	sets.AM3.DT.Dancer.Haste_55 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Anu Torque", 
		ear1 = "Sherida Earring", 
		ear2 = "Brutal Earring", 	
		body = "Gleti's Cuirass", -- 9/0/0
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Ilabrat Ring", 
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.STP, -- 10/0/0
		waist = "Windbuffet Belt +1", 
		legs = "Meghanada Chausses +2", -- 6/0/0 
		feet = TaeonFeet.DW
	} -- 33DA/11TA/2QA | +36 sTP | 9 DW | 25/0/21
	
	
	-- Lower DT since locked to Aymur, but high counter rate. Enjoy.
	-- Sacro Bulwark is factored in as Shield in SW (Other) set
	-- Zealous Snort gives an additional +25% counter
	sets.AM3.Counter = {}
	sets.AM3.Counter.index = {"Other", "Ninja", "Dancer"}
	sets.AM3.Counter.Other = {
		ammo = "Coiste Bodhar",
		head = "Gleti's Mask", -- 6/0/0
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Cryptic Earring", 		
		body = "Sacro Breastplate", 
		hands = "Malignance Gloves", -- 0/0/5
		ring1 = "Ilabrat Ring", 
		ring2 = "Gere Ring", 	
		back = Artio.Counter, 
		waist = "Windbuffet Belt +1",	
		legs = "Malignance Tights", -- 0/0/7 
		feet = "Malignance Boots" -- 0/0/4
	} -- 18DA/10TA/2QA | +64 sTP | 6/0/26 | Counter +45 (+70 w/ Snort, capped when also /mnk)
	
	
	-- Does NOT assume Sacro Bulwark for DT
	sets.AM3.Counter.Ninja = {}
	sets.AM3.Counter.Ninja.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45", "Haste_50", "Haste_55"}
	-- 49 DW needed
	sets.AM3.Counter.Ninja.Haste_0 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 46 DW | 0/0/16
	-- 47 DW needed
	sets.AM3.Counter.Ninja.Haste_5 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 46 DW | 0/0/16
	-- 45 DW needed
	sets.AM3.Counter.Ninja.Haste_10 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 46 DW | 0/0/16
	-- 42 DW needed
	sets.AM3.Counter.Ninja.Haste_15 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = "Sacro Breastplate",
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 41 DW | 0/0/16
	-- 39 DW needed
	sets.AM3.Counter.Ninja.Haste_20 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = "Sacro Breastplate",
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 41 DW | 0/0/16
	-- 35 DW needed
	sets.AM3.Counter.Ninja.Haste_25 = {
		ammo = "Coiste Bodhar",
		head = "Gleti's Mask", -- 6/0/0 
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = "Sacro Breastplate",
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 36 DW | 6/0/16
	-- 31 DW needed
	sets.AM3.Counter.Ninja.Haste_30 = {
		ammo = "Coiste Bodhar",
		head = "Gleti's Mask", -- 6/0/0 
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Cryptic Earring",	
		body = "Sacro Breastplate",
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 31 DW | 6/0/16
	-- 25 DW needed
	sets.AM3.Counter.Ninja.Haste_35 = {
		ammo = "Coiste Bodhar",
		head = "Gleti's Mask", -- 6/0/0 
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Cryptic Earring",	
		body = "Sacro Breastplate",
		hands = "Malignance Gloves", -- 6 0/0/5 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +23 sTP | 25 DW | 6/0/21
	-- 18 DW needed
	sets.AM3.Counter.Ninja.Haste_40 = {
		ammo = "Coiste Bodhar",
		head = "Gleti's Mask", -- 6/0/0 
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Cryptic Earring",	
		body = "Sacro Breastplate",
		hands = "Malignance Gloves", -- 6 0/0/5 
		ring1 = "Ilabrat Ring", 
		ring2 = "Gere Ring", 
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = "Malignance Tights", -- 0/0/7
		feet = TaeonFeet.DW -- 9
	} -- 11DA/8TA/0QA | +38 sTP | 16 DW | 6/0/12
	-- 11 DW needed
	sets.AM3.Counter.Ninja.Haste_45 = {
		ammo = "Coiste Bodhar",
		head = "Gleti's Mask", -- 6/0/0 
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Cryptic Earring",	
		body = "Sacro Breastplate",
		hands = "Malignance Gloves", -- 6 0/0/5 
		ring1 = "Ilabrat Ring", 
		ring2 = "Gere Ring", 
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = "Malignance Tights", -- 0/0/7
		feet = "Malignance Boots" -- 0/0/4
	} -- 11DA/8TA/0QA | +40 sTP | 7 DW | 6/0/16
	-- 6 DW needed (Not currently possible to determine haste samba from outside source - this may become a toggle later)
	sets.AM3.Counter.Ninja.Haste_50 = {}
	-- 0 DW needed (Not currently possible to determine haste samba from outside source - this may become a toggle later)
	sets.AM3.Counter.Ninja.Haste_55 = {}
	
	
	
	sets.AM3.Counter.Dancer = {}
	sets.AM3.Counter.Dancer.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45", "Haste_50", "Haste_55"}
	-- 59 DW needed
	sets.AM3.Counter.Dancer.Haste_0 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 46 DW | 0/0/16
	-- 47 DW needed
	sets.AM3.Counter.Dancer.Haste_5 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 46 DW | 0/0/16
	-- 45 DW needed
	sets.AM3.Counter.Dancer.Haste_10 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = TaeonBody.DW, -- 5
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 46 DW | 0/0/16
	-- 42 DW needed
	sets.AM3.Counter.Dancer.Haste_15 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = "Sacro Breastplate",
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 41 DW | 0/0/16
	-- 39 DW needed
	sets.AM3.Counter.Dancer.Haste_20 = {
		ammo = "Coiste Bodhar",
		head = TaeonHead.DW, -- 5
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = "Sacro Breastplate",
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 41 DW | 0/0/16
	-- 35 DW needed
	sets.AM3.Counter.Dancer.Haste_25 = {
		ammo = "Coiste Bodhar",
		head = "Gleti's Mask", -- 6/0/0 
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Suppanomimi", -- 5	
		body = "Sacro Breastplate",
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 36 DW | 6/0/16
	-- 31 DW needed
	sets.AM3.Counter.Dancer.Haste_30 = {
		ammo = "Coiste Bodhar",
		head = "Gleti's Mask", -- 6/0/0 
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Cryptic Earring",	
		body = "Sacro Breastplate",
		hands = EmichoHands.DW, -- 6 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +18 sTP | 31 DW | 6/0/16
	-- 25 DW needed
	sets.AM3.Counter.Dancer.Haste_35 = {
		ammo = "Coiste Bodhar",
		head = "Gleti's Mask", -- 6/0/0 
		neck = "Bathy Choker +1", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Cryptic Earring",	
		body = "Sacro Breastplate",
		hands = "Malignance Gloves", -- 6 0/0/5 
		ring1 = "Moonbeam Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = TaeonLegs.DW, -- 5
		feet = TaeonFeet.DW -- 9
	} -- 3DA/2TA/0QA | +23 sTP | 25 DW | 6/0/21
	-- 18 DW needed
	sets.AM3.Counter.Dancer.Haste_40 = {
		ammo = "Coiste Bodhar",
		head = "Gleti's Mask", -- 6/0/0 
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Cryptic Earring",	
		body = "Sacro Breastplate",
		hands = "Malignance Gloves", -- 6 0/0/5 
		ring1 = "Ilabrat Ring", 
		ring2 = "Gere Ring", 
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = "Malignance Tights", -- 0/0/7
		feet = TaeonFeet.DW -- 9
	} -- 11DA/8TA/0QA | +38 sTP | 16 DW | 6/0/12
	-- 11 DW needed
	sets.AM3.Counter.Dancer.Haste_45 = {
		ammo = "Coiste Bodhar",
		head = "Gleti's Mask", -- 6/0/0 
		neck = "Bathy Choker +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Cryptic Earring",	
		body = "Sacro Breastplate",
		hands = "Malignance Gloves", -- 6 0/0/5 
		ring1 = "Ilabrat Ring", 
		ring2 = "Gere Ring", 
		back = Artio.Counter, 
		waist = "Reiki Yotai", -- 7 
		legs = "Malignance Tights", -- 0/0/7
		feet = "Malignance Boots" -- 0/0/4
	} -- 11DA/8TA/0QA | +40 sTP | 7 DW | 6/0/16	
	
	
	
	-- Pet Sets
	-- Pet Focused, minimal master utility even if engaged (really being engaged only matters for trusts if you want to use them)
	sets.Pet = {}
	sets.Pet.index = {"Standard", "DT_full", "DT_hybrid"}
	Pet_ind = 1

	sets.Pet.Standard = {} -- non-DW, Pet focus
	sets.Pet.Standard.index = {"Other", "Ninja", "Dancer"}
	sets.Pet.Standard.Other = { -- not DW
		ammo = "Voluspa Tathlum",
		head = "Tali'ah Turban +2", 
		neck = "Beastmaster Collar +1", 
		ear1 = "Handler's Earring +1", 
		ear2 = "Enmerkar Earring", 		
		body = "Ankusa Jackcoat +3", 
		hands = "Gleti's Gauntlets", 
		ring1 = "Cath Palug Ring", 
		ring2 = "Varar Ring +1",	
		back = Artio.Idle_pet, 
		waist = "Incarnation Sash",	
		legs = "Ankusa Trousers +3", 
		feet = "Gleti's Boots"
	} -- Pet: 23% Haste | 34% DA | +28 sTP | +1 P.Lvl | 4/0/16
	
	
	-- I opt to use the same set for each in this section since it is not master focus.
	-- The tiering is here if you want to approach it differently.
	sets.Pet.Standard.Ninja = {} -- DWIII (25%)
	sets.Pet.Standard.Ninja.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45", "Haste_50", "Haste_55"}
	-- 49 DW needed
	sets.Pet.Standard.Ninja.Haste_0 = {
		ammo = "Voluspa Tathlum",
		head = "Tali'ah Turban +2", 
		neck = "Beastmaster Collar +1", 
		ear1 = "Handler's Earring +1", 
		ear2 = "Enmerkar Earring", 		
		body = "Ankusa Jackcoat +3", 
		hands = "Gleti's Gauntlets", 
		ring1 = "Cath Palug Ring", 
		ring2 = "Varar Ring +1",	
		back = Artio.Idle_pet, 
		waist = "Incarnation Sash",	
		legs = "Ankusa Trousers +3", 
		feet = "Gleti's Boots"
	} -- Pet: 23% Haste | 34% DA | +28 sTP | +1 P.Lvl | 4/0/16
	-- 47 DW needed
	sets.Pet.Standard.Ninja.Haste_5 = {
		ammo = "Voluspa Tathlum",
		head = "Tali'ah Turban +2", 
		neck = "Beastmaster Collar +1", 
		ear1 = "Handler's Earring +1", 
		ear2 = "Enmerkar Earring", 		
		body = "Ankusa Jackcoat +3", 
		hands = "Gleti's Gauntlets", 
		ring1 = "Cath Palug Ring", 
		ring2 = "Varar Ring +1",	
		back = Artio.Idle_pet, 
		waist = "Incarnation Sash",	
		legs = "Ankusa Trousers +3", 
		feet = "Gleti's Boots"
	} -- Pet: 23% Haste | 34% DA | +28 sTP | +1 P.Lvl | 4/0/16
	-- 45 DW needed
	sets.Pet.Standard.Ninja.Haste_10 = {
		ammo = "Voluspa Tathlum",
		head = "Tali'ah Turban +2", 
		neck = "Beastmaster Collar +1", 
		ear1 = "Handler's Earring +1", 
		ear2 = "Enmerkar Earring", 		
		body = "Ankusa Jackcoat +3", 
		hands = "Gleti's Gauntlets", 
		ring1 = "Cath Palug Ring", 
		ring2 = "Varar Ring +1",	
		back = Artio.Idle_pet, 
		waist = "Incarnation Sash",	
		legs = "Ankusa Trousers +3", 
		feet = "Gleti's Boots"
	} -- Pet: 23% Haste | 34% DA | +28 sTP | +1 P.Lvl | 4/0/16
	-- 42 DW needed
	sets.Pet.Standard.Ninja.Haste_15 = {
		ammo = "Voluspa Tathlum",
		head = "Tali'ah Turban +2", 
		neck = "Beastmaster Collar +1", 
		ear1 = "Handler's Earring +1", 
		ear2 = "Enmerkar Earring", 		
		body = "Ankusa Jackcoat +3", 
		hands = "Gleti's Gauntlets", 
		ring1 = "Cath Palug Ring", 
		ring2 = "Varar Ring +1",	
		back = Artio.Idle_pet, 
		waist = "Incarnation Sash",	
		legs = "Ankusa Trousers +3", 
		feet = "Gleti's Boots"
	} -- Pet: 23% Haste | 34% DA | +28 sTP | +1 P.Lvl | 4/0/16
	-- 39 DW needed
	sets.Pet.Standard.Ninja.Haste_20 = {
		ammo = "Voluspa Tathlum",
		head = "Tali'ah Turban +2", 
		neck = "Beastmaster Collar +1", 
		ear1 = "Handler's Earring +1", 
		ear2 = "Enmerkar Earring", 		
		body = "Ankusa Jackcoat +3", 
		hands = "Gleti's Gauntlets", 
		ring1 = "Cath Palug Ring", 
		ring2 = "Varar Ring +1",	
		back = Artio.Idle_pet, 
		waist = "Incarnation Sash",	
		legs = "Ankusa Trousers +3", 
		feet = "Gleti's Boots"
	} -- Pet: 23% Haste | 34% DA | +28 sTP | +1 P.Lvl | 4/0/16
	-- 35 DW needed
	sets.Pet.Standard.Ninja.Haste_25 = {
		ammo = "Voluspa Tathlum",
		head = "Tali'ah Turban +2", 
		neck = "Beastmaster Collar +1", 
		ear1 = "Handler's Earring +1", 
		ear2 = "Enmerkar Earring", 		
		body = "Ankusa Jackcoat +3", 
		hands = "Gleti's Gauntlets", 
		ring1 = "Cath Palug Ring", 
		ring2 = "Varar Ring +1",	
		back = Artio.Idle_pet, 
		waist = "Incarnation Sash",	
		legs = "Ankusa Trousers +3", 
		feet = "Gleti's Boots"
	} -- Pet: 23% Haste | 34% DA | +28 sTP | +1 P.Lvl | 4/0/16
	-- 31 DW needed
	sets.Pet.Standard.Ninja.Haste_30 = {
		ammo = "Voluspa Tathlum",
		head = "Tali'ah Turban +2", 
		neck = "Beastmaster Collar +1", 
		ear1 = "Handler's Earring +1", 
		ear2 = "Enmerkar Earring", 		
		body = "Ankusa Jackcoat +3", 
		hands = "Gleti's Gauntlets", 
		ring1 = "Cath Palug Ring", 
		ring2 = "Varar Ring +1",	
		back = Artio.Idle_pet, 
		waist = "Incarnation Sash",	
		legs = "Ankusa Trousers +3", 
		feet = "Gleti's Boots"
	} -- Pet: 23% Haste | 34% DA | +28 sTP | +1 P.Lvl | 4/0/16
	-- 25 DW needed
	sets.Pet.Standard.Ninja.Haste_35 = {
		ammo = "Voluspa Tathlum",
		head = "Tali'ah Turban +2", 
		neck = "Beastmaster Collar +1", 
		ear1 = "Handler's Earring +1", 
		ear2 = "Enmerkar Earring", 		
		body = "Ankusa Jackcoat +3", 
		hands = "Gleti's Gauntlets", 
		ring1 = "Cath Palug Ring", 
		ring2 = "Varar Ring +1",	
		back = Artio.Idle_pet, 
		waist = "Incarnation Sash",	
		legs = "Ankusa Trousers +3", 
		feet = "Gleti's Boots"
	} -- Pet: 23% Haste | 34% DA | +28 sTP | +1 P.Lvl | 4/0/16
	-- 18 DW needed
	sets.Pet.Standard.Ninja.Haste_40 = {
		ammo = "Voluspa Tathlum",
		head = "Tali'ah Turban +2", 
		neck = "Beastmaster Collar +1", 
		ear1 = "Handler's Earring +1", 
		ear2 = "Enmerkar Earring", 		
		body = "Ankusa Jackcoat +3", 
		hands = "Gleti's Gauntlets", 
		ring1 = "Cath Palug Ring", 
		ring2 = "Varar Ring +1",	
		back = Artio.Idle_pet, 
		waist = "Incarnation Sash",	
		legs = "Ankusa Trousers +3", 
		feet = "Gleti's Boots"
	} -- Pet: 23% Haste | 34% DA | +28 sTP | +1 P.Lvl | 4/0/16
	-- 11 DW needed
	sets.Pet.Standard.Ninja.Haste_45 = {
		ammo = "Voluspa Tathlum",
		head = "Tali'ah Turban +2", 
		neck = "Beastmaster Collar +1", 
		ear1 = "Handler's Earring +1", 
		ear2 = "Enmerkar Earring", 		
		body = "Ankusa Jackcoat +3", 
		hands = "Gleti's Gauntlets", 
		ring1 = "Cath Palug Ring", 
		ring2 = "Varar Ring +1",	
		back = Artio.Idle_pet, 
		waist = "Incarnation Sash",	
		legs = "Ankusa Trousers +3", 
		feet = "Gleti's Boots"
	} -- Pet: 23% Haste | 34% DA | +28 sTP | +1 P.Lvl | 4/0/16
	-- 6 DW needed (Not currently possible to determine haste samba from outside source - this may become a toggle later)
	sets.Pet.Standard.Ninja.Haste_50 = {
		ammo = "Voluspa Tathlum",
		head = "Tali'ah Turban +2", 
		neck = "Beastmaster Collar +1", 
		ear1 = "Handler's Earring +1", 
		ear2 = "Enmerkar Earring", 		
		body = "Ankusa Jackcoat +3", 
		hands = "Gleti's Gauntlets", 
		ring1 = "Cath Palug Ring", 
		ring2 = "Varar Ring +1",	
		back = Artio.Idle_pet, 
		waist = "Incarnation Sash",	
		legs = "Ankusa Trousers +3", 
		feet = "Gleti's Boots"
	} -- Pet: 23% Haste | 34% DA | +28 sTP | +1 P.Lvl | 4/0/16
	-- 0 DW needed (Not currently possible to determine haste samba from outside source - this may become a toggle later)
	sets.Pet.Standard.Ninja.Haste_55 = {
		ammo = "Voluspa Tathlum",
		head = "Tali'ah Turban +2", 
		neck = "Beastmaster Collar +1", 
		ear1 = "Handler's Earring +1", 
		ear2 = "Enmerkar Earring", 		
		body = "Ankusa Jackcoat +3", 
		hands = "Gleti's Gauntlets", 
		ring1 = "Cath Palug Ring", 
		ring2 = "Varar Ring +1",	
		back = Artio.Idle_pet, 
		waist = "Incarnation Sash",	
		legs = "Ankusa Trousers +3", 
		feet = "Gleti's Boots"
	} -- Pet: 23% Haste | 34% DA | +28 sTP | +1 P.Lvl | 4/0/16	
	
	
	-- I opt to use the same set for each in this section since it is not master focus.
	-- The tiering is here if you want to approach it differently.	
	sets.Pet.Standard.Dancer = {} -- DWII (15%)
	-- Note that sets for Haste_50 and Haste_55 exist for interactions with DNC JA Haste
	-- Currently, unless /DNC, we cannot track this buff provided from outside sources
	-- This lua is future-proofed in the event that this changes (a toggle may be implemented in the future as a work-around) 
	sets.Pet.Standard.Dancer.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45", "Haste_50", "Haste_55"}
	-- 59 DW needed
	sets.Pet.Standard.Dancer.Haste_0 = {
		ammo = "Voluspa Tathlum",
		head = "Tali'ah Turban +2", 
		neck = "Beastmaster Collar +1", 
		ear1 = "Handler's Earring +1", 
		ear2 = "Enmerkar Earring", 		
		body = "Ankusa Jackcoat +3", 
		hands = "Gleti's Gauntlets", 
		ring1 = "Cath Palug Ring", 
		ring2 = "Varar Ring +1",	
		back = Artio.Idle_pet, 
		waist = "Incarnation Sash",	
		legs = "Ankusa Trousers +3", 
		feet = "Gleti's Boots"
	} -- Pet: 23% Haste | 34% DA | +28 sTP | +1 P.Lvl | 4/0/16
	-- 57 DW needed
	sets.Pet.Standard.Dancer.Haste_5 = {
		ammo = "Voluspa Tathlum",
		head = "Tali'ah Turban +2", 
		neck = "Beastmaster Collar +1", 
		ear1 = "Handler's Earring +1", 
		ear2 = "Enmerkar Earring", 		
		body = "Ankusa Jackcoat +3", 
		hands = "Gleti's Gauntlets", 
		ring1 = "Cath Palug Ring", 
		ring2 = "Varar Ring +1",	
		back = Artio.Idle_pet, 
		waist = "Incarnation Sash",	
		legs = "Ankusa Trousers +3", 
		feet = "Gleti's Boots"
	} -- Pet: 23% Haste | 34% DA | +28 sTP | +1 P.Lvl | 4/0/16
	-- 55 DW needed
	sets.Pet.Standard.Dancer.Haste_10 = {
		ammo = "Voluspa Tathlum",
		head = "Tali'ah Turban +2", 
		neck = "Beastmaster Collar +1", 
		ear1 = "Handler's Earring +1", 
		ear2 = "Enmerkar Earring", 		
		body = "Ankusa Jackcoat +3", 
		hands = "Gleti's Gauntlets", 
		ring1 = "Cath Palug Ring", 
		ring2 = "Varar Ring +1",	
		back = Artio.Idle_pet, 
		waist = "Incarnation Sash",	
		legs = "Ankusa Trousers +3", 
		feet = "Gleti's Boots"
	} -- Pet: 23% Haste | 34% DA | +28 sTP | +1 P.Lvl | 4/0/16
	-- 52 DW needed
	sets.Pet.Standard.Dancer.Haste_15 = {
		ammo = "Voluspa Tathlum",
		head = "Tali'ah Turban +2", 
		neck = "Beastmaster Collar +1", 
		ear1 = "Handler's Earring +1", 
		ear2 = "Enmerkar Earring", 		
		body = "Ankusa Jackcoat +3", 
		hands = "Gleti's Gauntlets", 
		ring1 = "Cath Palug Ring", 
		ring2 = "Varar Ring +1",	
		back = Artio.Idle_pet, 
		waist = "Incarnation Sash",	
		legs = "Ankusa Trousers +3", 
		feet = "Gleti's Boots"
	} -- Pet: 23% Haste | 34% DA | +28 sTP | +1 P.Lvl | 4/0/16
	-- 49 DW needed
	sets.Pet.Standard.Dancer.Haste_20 = {
		ammo = "Voluspa Tathlum",
		head = "Tali'ah Turban +2", 
		neck = "Beastmaster Collar +1", 
		ear1 = "Handler's Earring +1", 
		ear2 = "Enmerkar Earring", 		
		body = "Ankusa Jackcoat +3", 
		hands = "Gleti's Gauntlets", 
		ring1 = "Cath Palug Ring", 
		ring2 = "Varar Ring +1",	
		back = Artio.Idle_pet, 
		waist = "Incarnation Sash",	
		legs = "Ankusa Trousers +3", 
		feet = "Gleti's Boots"
	} -- Pet: 23% Haste | 34% DA | +28 sTP | +1 P.Lvl | 4/0/16
	-- 45 DW needed
	sets.Pet.Standard.Dancer.Haste_25 = {
		ammo = "Voluspa Tathlum",
		head = "Tali'ah Turban +2", 
		neck = "Beastmaster Collar +1", 
		ear1 = "Handler's Earring +1", 
		ear2 = "Enmerkar Earring", 		
		body = "Ankusa Jackcoat +3", 
		hands = "Gleti's Gauntlets", 
		ring1 = "Cath Palug Ring", 
		ring2 = "Varar Ring +1",	
		back = Artio.Idle_pet, 
		waist = "Incarnation Sash",	
		legs = "Ankusa Trousers +3", 
		feet = "Gleti's Boots"
	} -- Pet: 23% Haste | 34% DA | +28 sTP | +1 P.Lvl | 4/0/16
	-- 41 DW needed
	sets.Pet.Standard.Dancer.Haste_30 = {
		ammo = "Voluspa Tathlum",
		head = "Tali'ah Turban +2", 
		neck = "Beastmaster Collar +1", 
		ear1 = "Handler's Earring +1", 
		ear2 = "Enmerkar Earring", 		
		body = "Ankusa Jackcoat +3", 
		hands = "Gleti's Gauntlets", 
		ring1 = "Cath Palug Ring", 
		ring2 = "Varar Ring +1",	
		back = Artio.Idle_pet, 
		waist = "Incarnation Sash",	
		legs = "Ankusa Trousers +3", 
		feet = "Gleti's Boots"
	} -- Pet: 23% Haste | 34% DA | +28 sTP | +1 P.Lvl | 4/0/16
	-- 35 DW needed
	sets.Pet.Standard.Dancer.Haste_35 = {
		ammo = "Voluspa Tathlum",
		head = "Tali'ah Turban +2", 
		neck = "Beastmaster Collar +1", 
		ear1 = "Handler's Earring +1", 
		ear2 = "Enmerkar Earring", 		
		body = "Ankusa Jackcoat +3", 
		hands = "Gleti's Gauntlets", 
		ring1 = "Cath Palug Ring", 
		ring2 = "Varar Ring +1",	
		back = Artio.Idle_pet, 
		waist = "Incarnation Sash",	
		legs = "Ankusa Trousers +3", 
		feet = "Gleti's Boots"
	} -- Pet: 23% Haste | 34% DA | +28 sTP | +1 P.Lvl | 4/0/16
	-- 28 DW needed
	sets.Pet.Standard.Dancer.Haste_40 = {
		ammo = "Voluspa Tathlum",
		head = "Tali'ah Turban +2", 
		neck = "Beastmaster Collar +1", 
		ear1 = "Handler's Earring +1", 
		ear2 = "Enmerkar Earring", 		
		body = "Ankusa Jackcoat +3", 
		hands = "Gleti's Gauntlets", 
		ring1 = "Cath Palug Ring", 
		ring2 = "Varar Ring +1",	
		back = Artio.Idle_pet, 
		waist = "Incarnation Sash",	
		legs = "Ankusa Trousers +3", 
		feet = "Gleti's Boots"
	} -- Pet: 23% Haste | 34% DA | +28 sTP | +1 P.Lvl | 4/0/16
	-- 21 DW needed
	sets.Pet.Standard.Dancer.Haste_45 = {
		ammo = "Voluspa Tathlum",
		head = "Tali'ah Turban +2", 
		neck = "Beastmaster Collar +1", 
		ear1 = "Handler's Earring +1", 
		ear2 = "Enmerkar Earring", 		
		body = "Ankusa Jackcoat +3", 
		hands = "Gleti's Gauntlets", 
		ring1 = "Cath Palug Ring", 
		ring2 = "Varar Ring +1",	
		back = Artio.Idle_pet, 
		waist = "Incarnation Sash",	
		legs = "Ankusa Trousers +3", 
		feet = "Gleti's Boots"
	} -- Pet: 23% Haste | 34% DA | +28 sTP | +1 P.Lvl | 4/0/16
	-- 15 DW needed
	sets.Pet.Standard.Dancer.Haste_50 = {
		ammo = "Voluspa Tathlum",
		head = "Tali'ah Turban +2", 
		neck = "Beastmaster Collar +1", 
		ear1 = "Handler's Earring +1", 
		ear2 = "Enmerkar Earring", 		
		body = "Ankusa Jackcoat +3", 
		hands = "Gleti's Gauntlets", 
		ring1 = "Cath Palug Ring", 
		ring2 = "Varar Ring +1",	
		back = Artio.Idle_pet, 
		waist = "Incarnation Sash",	
		legs = "Ankusa Trousers +3", 
		feet = "Gleti's Boots"
	} -- Pet: 23% Haste | 34% DA | +28 sTP | +1 P.Lvl | 4/0/16
	-- 9 DW needed
	sets.Pet.Standard.Dancer.Haste_55 = {
		ammo = "Voluspa Tathlum",
		head = "Tali'ah Turban +2", 
		neck = "Beastmaster Collar +1", 
		ear1 = "Handler's Earring +1", 
		ear2 = "Enmerkar Earring", 		
		body = "Ankusa Jackcoat +3", 
		hands = "Gleti's Gauntlets", 
		ring1 = "Cath Palug Ring", 
		ring2 = "Varar Ring +1",	
		back = Artio.Idle_pet, 
		waist = "Incarnation Sash",	
		legs = "Ankusa Trousers +3", 
		feet = "Gleti's Boots"
	} -- Pet: 23% Haste | 34% DA | +28 sTP | +1 P.Lvl | 4/0/16



	sets.Pet.DT_full = {} -- Pet DT focused sets
	sets.Pet.DT_full.index = {"Other", "Ninja", "Dancer"}
	sets.Pet.DT_full.Other = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Anwig Salade", -- (0/0/10)
		neck = "Shepherd's Chain", -- (0/0/2)
		ear1 = "Handler's Earring +1", -- (4/0/0)
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)
		ring1 = "Gelatinous Ring +1", -- 7/-1/0
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle_pet, -- (0/0/5)
		waist = "Isa Belt",	-- (0/0/3)
		legs = "Tali'ah Seraweels +2", -- (0/0/5) 
		feet = "Ankusa Gaiters +3" -- (5/0/0)
	} -- 14/-1/13 (9/0/55)
	
	
	-- The DW tiers are listed but not strictly adhered to due to focus being on pet melee survival ONLY.
	-- Sets are probably best used with Pangu C as well.
	sets.Pet.DT_full.Ninja = {}
	sets.Pet.DT_full.Ninja.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45", "Haste_50", "Haste_55"}
	-- 49 DW needed
	sets.Pet.DT_full.Ninja.Haste_0 = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Anwig Salade", -- (0/0/10)
		neck = "Shepherd's Chain", -- (0/0/2)
		ear1 = "Handler's Earring +1", -- (4/0/0)
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)
		ring1 = "Gelatinous Ring +1", -- 7/-1/0
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle_pet, -- (0/0/5)
		waist = "Isa Belt",	-- (0/0/3)
		legs = "Tali'ah Seraweels +2", -- (0/0/5) 
		feet = "Ankusa Gaiters +3" -- (5/0/0)
	} -- 14/-1/13 (9/0/55)
	-- 47 DW needed
	sets.Pet.DT_full.Ninja.Haste_5 = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Anwig Salade", -- (0/0/10)
		neck = "Shepherd's Chain", -- (0/0/2)
		ear1 = "Handler's Earring +1", -- (4/0/0)
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)
		ring1 = "Gelatinous Ring +1", -- 7/-1/0
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle_pet, -- (0/0/5)
		waist = "Isa Belt",	-- (0/0/3)
		legs = "Tali'ah Seraweels +2", -- (0/0/5) 
		feet = "Ankusa Gaiters +3" -- (5/0/0)
	} -- 14/-1/13 (9/0/55)
	-- 45 DW needed
	sets.Pet.DT_full.Ninja.Haste_10 = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Anwig Salade", -- (0/0/10)
		neck = "Shepherd's Chain", -- (0/0/2)
		ear1 = "Handler's Earring +1", -- (4/0/0)
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)
		ring1 = "Gelatinous Ring +1", -- 7/-1/0
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle_pet, -- (0/0/5)
		waist = "Isa Belt",	-- (0/0/3)
		legs = "Tali'ah Seraweels +2", -- (0/0/5) 
		feet = "Ankusa Gaiters +3" -- (5/0/0)
	} -- 14/-1/13 (9/0/55)
	-- 42 DW needed
	sets.Pet.DT_full.Ninja.Haste_15 = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Anwig Salade", -- (0/0/10)
		neck = "Shepherd's Chain", -- (0/0/2)
		ear1 = "Handler's Earring +1", -- (4/0/0)
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)
		ring1 = "Gelatinous Ring +1", -- 7/-1/0
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle_pet, -- (0/0/5)
		waist = "Isa Belt",	-- (0/0/3)
		legs = "Tali'ah Seraweels +2", -- (0/0/5) 
		feet = "Ankusa Gaiters +3" -- (5/0/0)
	} -- 14/-1/13 (9/0/55)
	-- 39 DW needed
	sets.Pet.DT_full.Ninja.Haste_20 = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Anwig Salade", -- (0/0/10)
		neck = "Shepherd's Chain", -- (0/0/2)
		ear1 = "Handler's Earring +1", -- (4/0/0)
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)
		ring1 = "Gelatinous Ring +1", -- 7/-1/0
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle_pet, -- (0/0/5)
		waist = "Isa Belt",	-- (0/0/3)
		legs = "Tali'ah Seraweels +2", -- (0/0/5) 
		feet = "Ankusa Gaiters +3" -- (5/0/0)
	} -- 14/-1/13 (9/0/55)
	-- 35 DW needed
	sets.Pet.DT_full.Ninja.Haste_25 = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Anwig Salade", -- (0/0/10)
		neck = "Shepherd's Chain", -- (0/0/2)
		ear1 = "Handler's Earring +1", -- (4/0/0)
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)
		ring1 = "Gelatinous Ring +1", -- 7/-1/0
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle_pet, -- (0/0/5)
		waist = "Isa Belt",	-- (0/0/3)
		legs = "Tali'ah Seraweels +2", -- (0/0/5) 
		feet = "Ankusa Gaiters +3" -- (5/0/0)
	} -- 14/-1/13 (9/0/55)
	-- 31 DW needed
	sets.Pet.DT_full.Ninja.Haste_30 = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Anwig Salade", -- (0/0/10)
		neck = "Shepherd's Chain", -- (0/0/2)
		ear1 = "Handler's Earring +1", -- (4/0/0)
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)
		ring1 = "Gelatinous Ring +1", -- 7/-1/0
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle_pet, -- (0/0/5)
		waist = "Isa Belt",	-- (0/0/3)
		legs = "Tali'ah Seraweels +2", -- (0/0/5) 
		feet = "Ankusa Gaiters +3" -- (5/0/0)
	} -- 14/-1/13 (9/0/55)
	-- 25 DW needed
	sets.Pet.DT_full.Ninja.Haste_35 = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Anwig Salade", -- (0/0/10)
		neck = "Shepherd's Chain", -- (0/0/2)
		ear1 = "Handler's Earring +1", -- (4/0/0)
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)
		ring1 = "Gelatinous Ring +1", -- 7/-1/0
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle_pet, -- (0/0/5)
		waist = "Isa Belt",	-- (0/0/3)
		legs = "Tali'ah Seraweels +2", -- (0/0/5) 
		feet = "Ankusa Gaiters +3" -- (5/0/0)
	} -- 14/-1/13 (9/0/55)
	-- 18 DW needed
	sets.Pet.DT_full.Ninja.Haste_40 = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Anwig Salade", -- (0/0/10)
		neck = "Shepherd's Chain", -- (0/0/2)
		ear1 = "Handler's Earring +1", -- (4/0/0)
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)
		ring1 = "Gelatinous Ring +1", -- 7/-1/0
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle_pet, -- (0/0/5)
		waist = "Isa Belt",	-- (0/0/3)
		legs = "Tali'ah Seraweels +2", -- (0/0/5) 
		feet = "Ankusa Gaiters +3" -- (5/0/0)
	} -- 14/-1/13 (9/0/55)
	-- 11 DW needed
	sets.Pet.DT_full.Ninja.Haste_45 = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Anwig Salade", -- (0/0/10)
		neck = "Shepherd's Chain", -- (0/0/2)
		ear1 = "Handler's Earring +1", -- (4/0/0)
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)
		ring1 = "Gelatinous Ring +1", -- 7/-1/0
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle_pet, -- (0/0/5)
		waist = "Isa Belt",	-- (0/0/3)
		legs = "Tali'ah Seraweels +2", -- (0/0/5) 
		feet = "Ankusa Gaiters +3" -- (5/0/0)
	} -- 14/-1/13 (9/0/55)
	-- 6 DW needed (Not currently possible to determine haste samba from outside source - this may become a toggle later)
	sets.Pet.DT_full.Ninja.Haste_50 = {}
	-- 0 DW needed (Not currently possible to determine haste samba from outside source - this may become a toggle later)
	sets.Pet.DT_full.Ninja.Haste_55 = {}
	
	
	
	sets.Pet.DT_full.Dancer = {}
	sets.Pet.DT_full.Dancer.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45", "Haste_50", "Haste_55"}
	-- 59 DW needed
	sets.Pet.DT_full.Dancer.Haste_0 = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Anwig Salade", -- (0/0/10)
		neck = "Shepherd's Chain", -- (0/0/2)
		ear1 = "Handler's Earring +1", -- (4/0/0)
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)
		ring1 = "Gelatinous Ring +1", -- 7/-1/0
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle_pet, -- (0/0/5)
		waist = "Isa Belt",	-- (0/0/3)
		legs = "Tali'ah Seraweels +2", -- (0/0/5) 
		feet = "Ankusa Gaiters +3" -- (5/0/0)
	} -- 14/-1/13 (9/0/55)
	-- 57 DW needed
	sets.Pet.DT_full.Dancer.Haste_5 = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Anwig Salade", -- (0/0/10)
		neck = "Shepherd's Chain", -- (0/0/2)
		ear1 = "Handler's Earring +1", -- (4/0/0)
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)
		ring1 = "Gelatinous Ring +1", -- 7/-1/0
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle_pet, -- (0/0/5)
		waist = "Isa Belt",	-- (0/0/3)
		legs = "Tali'ah Seraweels +2", -- (0/0/5) 
		feet = "Ankusa Gaiters +3" -- (5/0/0)
	} -- 14/-1/13 (9/0/55)
	-- 55 DW needed
	sets.Pet.DT_full.Dancer.Haste_10 = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Anwig Salade", -- (0/0/10)
		neck = "Shepherd's Chain", -- (0/0/2)
		ear1 = "Handler's Earring +1", -- (4/0/0)
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)
		ring1 = "Gelatinous Ring +1", -- 7/-1/0
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle_pet, -- (0/0/5)
		waist = "Isa Belt",	-- (0/0/3)
		legs = "Tali'ah Seraweels +2", -- (0/0/5) 
		feet = "Ankusa Gaiters +3" -- (5/0/0)
	} -- 14/-1/13 (9/0/55)
	-- 52 DW needed
	sets.Pet.DT_full.Dancer.Haste_15 = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Anwig Salade", -- (0/0/10)
		neck = "Shepherd's Chain", -- (0/0/2)
		ear1 = "Handler's Earring +1", -- (4/0/0)
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)
		ring1 = "Gelatinous Ring +1", -- 7/-1/0
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle_pet, -- (0/0/5)
		waist = "Isa Belt",	-- (0/0/3)
		legs = "Tali'ah Seraweels +2", -- (0/0/5) 
		feet = "Ankusa Gaiters +3" -- (5/0/0)
	} -- 14/-1/13 (9/0/55)
	-- 49 DW needed
	sets.Pet.DT_full.Dancer.Haste_20 = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Anwig Salade", -- (0/0/10)
		neck = "Shepherd's Chain", -- (0/0/2)
		ear1 = "Handler's Earring +1", -- (4/0/0)
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)
		ring1 = "Gelatinous Ring +1", -- 7/-1/0
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle_pet, -- (0/0/5)
		waist = "Isa Belt",	-- (0/0/3)
		legs = "Tali'ah Seraweels +2", -- (0/0/5) 
		feet = "Ankusa Gaiters +3" -- (5/0/0)
	} -- 14/-1/13 (9/0/55)
	-- 45 DW needed
	sets.Pet.DT_full.Dancer.Haste_25 = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Anwig Salade", -- (0/0/10)
		neck = "Shepherd's Chain", -- (0/0/2)
		ear1 = "Handler's Earring +1", -- (4/0/0)
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)
		ring1 = "Gelatinous Ring +1", -- 7/-1/0
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle_pet, -- (0/0/5)
		waist = "Isa Belt",	-- (0/0/3)
		legs = "Tali'ah Seraweels +2", -- (0/0/5) 
		feet = "Ankusa Gaiters +3" -- (5/0/0)
	} -- 14/-1/13 (9/0/55)
	-- 41 DW needed
	sets.Pet.DT_full.Dancer.Haste_30 = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Anwig Salade", -- (0/0/10)
		neck = "Shepherd's Chain", -- (0/0/2)
		ear1 = "Handler's Earring +1", -- (4/0/0)
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)
		ring1 = "Gelatinous Ring +1", -- 7/-1/0
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle_pet, -- (0/0/5)
		waist = "Isa Belt",	-- (0/0/3)
		legs = "Tali'ah Seraweels +2", -- (0/0/5) 
		feet = "Ankusa Gaiters +3" -- (5/0/0)
	} -- 14/-1/13 (9/0/55)
	-- 35 DW needed
	sets.Pet.DT_full.Dancer.Haste_35 = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Anwig Salade", -- (0/0/10)
		neck = "Shepherd's Chain", -- (0/0/2)
		ear1 = "Handler's Earring +1", -- (4/0/0)
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)
		ring1 = "Gelatinous Ring +1", -- 7/-1/0
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle_pet, -- (0/0/5)
		waist = "Isa Belt",	-- (0/0/3)
		legs = "Tali'ah Seraweels +2", -- (0/0/5) 
		feet = "Ankusa Gaiters +3" -- (5/0/0)
	} -- 14/-1/13 (9/0/55)
	-- 28 DW needed
	sets.Pet.DT_full.Dancer.Haste_40 = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Anwig Salade", -- (0/0/10)
		neck = "Shepherd's Chain", -- (0/0/2)
		ear1 = "Handler's Earring +1", -- (4/0/0)
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)
		ring1 = "Gelatinous Ring +1", -- 7/-1/0
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle_pet, -- (0/0/5)
		waist = "Isa Belt",	-- (0/0/3)
		legs = "Tali'ah Seraweels +2", -- (0/0/5) 
		feet = "Ankusa Gaiters +3" -- (5/0/0)
	} -- 14/-1/13 (9/0/55)
	-- 21 DW needed
	sets.Pet.DT_full.Dancer.Haste_45 = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Anwig Salade", -- (0/0/10)
		neck = "Shepherd's Chain", -- (0/0/2)
		ear1 = "Handler's Earring +1", -- (4/0/0)
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)
		ring1 = "Gelatinous Ring +1", -- 7/-1/0
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle_pet, -- (0/0/5)
		waist = "Isa Belt",	-- (0/0/3)
		legs = "Tali'ah Seraweels +2", -- (0/0/5) 
		feet = "Ankusa Gaiters +3" -- (5/0/0)
	} -- 14/-1/13 (9/0/55)
	-- 15 DW needed
	sets.Pet.DT_full.Dancer.Haste_50 = { 
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Anwig Salade", -- (0/0/10)
		neck = "Shepherd's Chain", -- (0/0/2)
		ear1 = "Handler's Earring +1", -- (4/0/0)
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)
		ring1 = "Gelatinous Ring +1", -- 7/-1/0
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle_pet, -- (0/0/5)
		waist = "Isa Belt",	-- (0/0/3)
		legs = "Tali'ah Seraweels +2", -- (0/0/5) 
		feet = "Ankusa Gaiters +3" -- (5/0/0)
	} -- 14/-1/13 (9/0/55)
	-- 9 DW needed
	sets.Pet.DT_full.Dancer.Haste_55 = { -- in case a workaround for DNC main Haste Samba detection is made
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Anwig Salade", -- (0/0/10)
		neck = "Shepherd's Chain", -- (0/0/2)
		ear1 = "Handler's Earring +1", -- (4/0/0)
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)
		ring1 = "Gelatinous Ring +1", -- 7/-1/0
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle_pet, -- (0/0/5)
		waist = "Isa Belt",	-- (0/0/3)
		legs = "Tali'ah Seraweels +2", -- (0/0/5) 
		feet = "Ankusa Gaiters +3" -- (5/0/0)
	} -- 14/-1/13 (9/0/55)
	
	
	
	sets.Pet.DT_hybrid = {} -- Pet and Master DT focused sets
	sets.Pet.DT_hybrid.index = {"Other", "Ninja", "Dancer"}
	sets.Pet.DT_hybrid.Other = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Shulmanu Collar", 
		ear1 = "Sherida Earring", 
		ear2 = "Enmerkar Earring", 		
		body = "Totemic Jackcoat +3", -- 9/0/0
		hands = "Gleti's Gauntlets", -- 0/0/5
		ring1 = "Epona's Ring", 
		ring2 = "Defending Ring", -- 0/0/10	
		back = Artio.Idle_pet, 
		waist = "Reiki Yotai",	
		legs = "Tali'ah Seraweels +2", -- 6/0/0 
		feet = "Gleti's Boots" -- 0/0/0
	} -- 18DA/10TA/2QA | +64 sTP | 25/0/25
	
	
	-- The DW tiers are listed but not strictly adhered to due to focus being on master and pet melee survival.
	-- Sets are probably best used with Pangu C as well.
	sets.Pet.DT_hybrid.Ninja = {}
	sets.Pet.DT_hybrid.Ninja.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45", "Haste_50", "Haste_55"}
	-- 49 DW needed
	sets.Pet.DT_hybrid.Ninja.Haste_0 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Shulmanu Collar", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)  
		ring1 = "Epona's Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7
		legs = "Tali'ah Seraweels +2", -- (0/0/5)
		feet = TaeonFeet.DW -- 9
	} -- 9DA/3TA/0QA | +15 sTP | 30 DW | 17/0/14 (0/0/26)
	-- 47 DW needed
	sets.Pet.DT_hybrid.Ninja.Haste_5 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Shulmanu Collar", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)  
		ring1 = "Epona's Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7
		legs = "Tali'ah Seraweels +2", -- (0/0/5)
		feet = TaeonFeet.DW -- 9
	} -- 9DA/3TA/0QA | +15 sTP | 30 DW | 17/0/14 (0/0/26)
	-- 45 DW needed
	sets.Pet.DT_hybrid.Ninja.Haste_10 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Shulmanu Collar", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)  
		ring1 = "Epona's Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7
		legs = "Tali'ah Seraweels +2", -- (0/0/5)
		feet = TaeonFeet.DW -- 9
	} -- 9DA/3TA/0QA | +15 sTP | 30 DW | 17/0/14 (0/0/26)
	-- 42 DW needed
	sets.Pet.DT_hybrid.Ninja.Haste_15 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Shulmanu Collar", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)  
		ring1 = "Epona's Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7
		legs = "Tali'ah Seraweels +2", -- (0/0/5)
		feet = TaeonFeet.DW -- 9
	} -- 9DA/3TA/0QA | +15 sTP | 30 DW | 17/0/14 (0/0/26)
	-- 39 DW needed
	sets.Pet.DT_hybrid.Ninja.Haste_20 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Shulmanu Collar", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)  
		ring1 = "Epona's Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7
		legs = "Tali'ah Seraweels +2", -- (0/0/5)
		feet = TaeonFeet.DW -- 9
	} -- 9DA/3TA/0QA | +15 sTP | 30 DW | 17/0/14 (0/0/26)
	-- 35 DW needed
	sets.Pet.DT_hybrid.Ninja.Haste_25 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Shulmanu Collar", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)  
		ring1 = "Epona's Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7
		legs = "Tali'ah Seraweels +2", -- (0/0/5)
		feet = TaeonFeet.DW -- 9
	} -- 9DA/3TA/0QA | +15 sTP | 30 DW | 17/0/14 (0/0/26)
	-- 31 DW needed
	sets.Pet.DT_hybrid.Ninja.Haste_30 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Shulmanu Collar", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)  
		ring1 = "Epona's Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7
		legs = "Tali'ah Seraweels +2", -- (0/0/5)
		feet = TaeonFeet.DW -- 9
	} -- 9DA/3TA/0QA | +15 sTP | 30 DW | 17/0/14 (0/0/26)
	-- 25 DW needed
	sets.Pet.DT_hybrid.Ninja.Haste_35 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Shulmanu Collar", 
		ear1 = "Sherida Earring", 
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)  
		ring1 = "Epona's Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7
		legs = "Tali'ah Seraweels +2", -- (0/0/5)
		feet = TaeonFeet.DW -- 9
	} -- 14DA/3TA/0QA | +20 sTP | 26 DW | 17/0/14 (0/0/26)
	-- 18 DW needed
	sets.Pet.DT_hybrid.Ninja.Haste_40 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Shulmanu Collar", 
		ear1 = "Sherida Earring", 
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)  
		ring1 = "Epona's Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DA, -- 10/0/0
		waist = "Reiki Yotai", -- 7
		legs = "Tali'ah Seraweels +2", -- (0/0/5)
		feet = TaeonFeet.DW -- 9
	} -- 24DA/3TA/0QA | +20 sTP | 16 DW | 17/0/14 (0/0/26)
	-- 11 DW needed
	sets.Pet.DT_hybrid.Ninja.Haste_45 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Shulmanu Collar", 
		ear1 = "Sherida Earring", 
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)  
		ring1 = "Epona's Ring", -- 0/0/4
		ring2 = "Gere Ring", 
		back = Artio.DW, -- 10/0/0
		waist = "Klouskap Sash +1", 
		legs = "Tali'ah Seraweels +2", -- (0/0/5)
		feet = "Malignance Boots"
	} -- 14DA/8TA/0QA | +25 sTP | 10 DW | 17/0/10 (0/0/26)
	-- 6 DW needed (Not currently possible to determine haste samba from outside source - this may become a toggle later)
	sets.Pet.DT_hybrid.Ninja.Haste_50 = {}
	-- 0 DW needed (Not currently possible to determine haste samba from outside source - this may become a toggle later)
	sets.Pet.DT_hybrid.Ninja.Haste_55 = {}
	
	
	
	sets.Pet.DT_hybrid.Dancer = {}
	sets.Pet.DT_hybrid.Dancer.index = {"Haste_0", "Haste_5", "Haste_10", "Haste_15", "Haste_20", "Haste_25", "Haste_30", "Haste_35", "Haste_40", "Haste_45", "Haste_50", "Haste_55"}
	-- 59 DW needed
	sets.Pet.DT_hybrid.Dancer.Haste_0 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Shulmanu Collar", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)  
		ring1 = "Epona's Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7
		legs = "Tali'ah Seraweels +2", -- (0/0/5)
		feet = TaeonFeet.DW -- 9
	} -- 9DA/3TA/0QA | +15 sTP | 30 DW | 17/0/14 (0/0/26)
	-- 57 DW needed
	sets.Pet.DT_hybrid.Dancer.Haste_5 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Shulmanu Collar", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)  
		ring1 = "Epona's Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7
		legs = "Tali'ah Seraweels +2", -- (0/0/5)
		feet = TaeonFeet.DW -- 9
	} -- 9DA/3TA/0QA | +15 sTP | 30 DW | 17/0/14 (0/0/26)
	-- 55 DW needed
	sets.Pet.DT_hybrid.Dancer.Haste_10 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Shulmanu Collar", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)  
		ring1 = "Epona's Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7
		legs = "Tali'ah Seraweels +2", -- (0/0/5)
		feet = TaeonFeet.DW -- 9
	} -- 9DA/3TA/0QA | +15 sTP | 30 DW | 17/0/14 (0/0/26)
	-- 52 DW needed
	sets.Pet.DT_hybrid.Dancer.Haste_15 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Shulmanu Collar", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)  
		ring1 = "Epona's Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7
		legs = "Tali'ah Seraweels +2", -- (0/0/5)
		feet = TaeonFeet.DW -- 9
	} -- 9DA/3TA/0QA | +15 sTP | 30 DW | 17/0/14 (0/0/26)
	-- 49 DW needed
	sets.Pet.DT_hybrid.Dancer.Haste_20 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Shulmanu Collar", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)  
		ring1 = "Epona's Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7
		legs = "Tali'ah Seraweels +2", -- (0/0/5)
		feet = TaeonFeet.DW -- 9
	} -- 9DA/3TA/0QA | +15 sTP | 30 DW | 17/0/14 (0/0/26)
	-- 45 DW needed
	sets.Pet.DT_hybrid.Dancer.Haste_25 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Shulmanu Collar", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)  
		ring1 = "Epona's Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7
		legs = "Tali'ah Seraweels +2", -- (0/0/5)
		feet = TaeonFeet.DW -- 9
	} -- 9DA/3TA/0QA | +15 sTP | 30 DW | 17/0/14 (0/0/26)
	-- 41 DW needed
	sets.Pet.DT_hybrid.Dancer.Haste_30 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Shulmanu Collar", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)  
		ring1 = "Epona's Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7
		legs = "Tali'ah Seraweels +2", -- (0/0/5)
		feet = TaeonFeet.DW -- 9
	} -- 9DA/3TA/0QA | +15 sTP | 30 DW | 17/0/14 (0/0/26)
	-- 35 DW needed
	sets.Pet.DT_hybrid.Dancer.Haste_35 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Shulmanu Collar", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)  
		ring1 = "Epona's Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7
		legs = "Tali'ah Seraweels +2", -- (0/0/5)
		feet = TaeonFeet.DW -- 9
	} -- 9DA/3TA/0QA | +15 sTP | 30 DW | 17/0/14 (0/0/26)
	-- 28 DW needed
	sets.Pet.DT_hybrid.Dancer.Haste_40 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Shulmanu Collar", 
		ear1 = "Eabani Earring", -- 4
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)  
		ring1 = "Epona's Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7
		legs = "Tali'ah Seraweels +2", -- (0/0/5)
		feet = TaeonFeet.DW -- 9
	} -- 9DA/3TA/0QA | +15 sTP | 30 DW | 17/0/14 (0/0/26)
	-- 21 DW needed
	sets.Pet.DT_hybrid.Dancer.Haste_45 = {
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Shulmanu Collar", 
		ear1 = "Sherida Earring", 
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)  
		ring1 = "Epona's Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Klouskap Sash +1", 
		legs = "Tali'ah Seraweels +2", -- (0/0/5)
		feet = TaeonFeet.DW -- 9
	} -- 14DA/3TA/0QA | +16 sTP | 19 DW | 17/0/20 (0/0/26)
	-- 15 DW needed
	sets.Pet.DT_hybrid.Dancer.Haste_50 = { 
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Shulmanu Collar", 
		ear1 = "Sherida Earring", 
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)  
		ring1 = "Epona's Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DW, -- 10 10/0/0
		waist = "Reiki Yotai", -- 7
		legs = "Tali'ah Seraweels +2", -- (0/0/5)
		feet = "Malignance Boots" -- 0/0/4
	} -- 14DA/3TA/0QA | +20 sTP | 16 DW | 17/0/24 (0/0/26)
	-- 9 DW needed
	sets.Pet.DT_hybrid.Dancer.Haste_55 = { -- in case a workaround for DNC main Haste Samba detection is made
		ammo = "Coiste Bodhar",
		head = "Malignance Chapeau", -- 0/0/6
		neck = "Shulmanu Collar", 
		ear1 = "Sherida Earring", 
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)  
		ring1 = "Epona's Ring", -- 0/0/4
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.DA, -- 10/0/0
		waist = "Klouskap Sash +1", 
		legs = "Tali'ah Seraweels +2", -- (0/0/5)
		feet = TaeonFeet.DW -- 9
	} -- 24DA/3TA/0QA | +16 sTP | 9 DW | 17/0/20 (0/0/26)	


	--Weaponskill Sets--
	sets.WS = {}
	-- Note: KI_ sets cannot be swapped to manually. 
	-- -- They are detected and implemented by the lua when Correlation Mode is active and there is an active circle effect.
	sets.WS.index = {"Attack", "AttackCapped", "KI_Attack", "KI_AttackCapped"}
	WS_ind = 1
	
	
	--Axe
	sets.MistralAxe = {}
	sets.MistralAxe.Attack = {
		ammo = "Coiste Bodhar",
		head = "Ankusa Helm +3",
		neck = "Beastmaster Collar +1", 
		ear1 = "Thrud Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Gere Ring",
		back = Artio.STR_WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.MistralAxe.AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Ankusa Helm +3",
		neck = "Beastmaster Collar +1", 
		ear1 = "Thrud Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Gleti's Cuirass",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Beithir Ring",
		back = Artio.STR_WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.MistralAxe.KI_Attack = {
		ammo = "Coiste Bodhar",
		head = "Ankusa Helm +3",
		neck = "Beastmaster Collar +1", 
		ear1 = "Thrud Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nukumi Gausape +1", -- Wear this in these KI_ sets.
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Gere Ring",
		back = Artio.STR_WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.MistralAxe.KI_AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Ankusa Helm +3",
		neck = "Beastmaster Collar +1", 
		ear1 = "Thrud Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nukumi Gausape +1",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Beithir Ring",
		back = Artio.STR_WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	
	sets.Calamity = {}
	sets.Calamity.Attack = {
		ammo = "Coiste Bodhar",
		head = "Ankusa Helm +3",
		neck = "Beastmaster Collar +1", 
		ear1 = "Thrud Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Gere Ring",
		back = Artio.STR_WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.Calamity.AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Ankusa Helm +3",
		neck = "Beastmaster Collar +1", 
		ear1 = "Thrud Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Gleti's Cuirass",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Beithir Ring",
		back = Artio.STR_WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.Calamity.KI_Attack = {
		ammo = "Coiste Bodhar",
		head = "Ankusa Helm +3",
		neck = "Beastmaster Collar +1", 
		ear1 = "Thrud Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nukumi Gausape +1",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Gere Ring",
		back = Artio.STR_WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.Calamity.KI_AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Ankusa Helm +3",
		neck = "Beastmaster Collar +1", 
		ear1 = "Thrud Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nukumi Gausape +1",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Beithir Ring",
		back = Artio.STR_WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	
	sets.Decimation = {}
	sets.Decimation.Attack = {
		ammo = "Coiste Bodhar",
		head = "Blistering Sallet +1",
		neck = "Fotia Gorget", 
		ear1 = "Sherida Earring", 
		ear2 = "Lugra Earring +1", 		
		body = "Tali'ah Manteel +2",
		hands = "Nyame Gauntlets",
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.STR_DA, 
		waist = "Fotia Belt",	
		legs = "Meghanada Chausses +2", 
		feet = "Nyame Sollerets"
	}
	sets.Decimation.AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Gleti's Mask",
		neck = "Beastmaster Collar +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Lugra Earring +1",		
		body = "Tali'ah Manteel +2",
		hands = "Gleti's Gauntlets",
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.STR_DA, 
		waist = "Fotia Belt",	
		legs = "Meghanada Chausses +2", 
		feet = "Gleti's Boots"
	}
	sets.Decimation.KI_Attack = {
		ammo = "Coiste Bodhar",
		head = "Ankusa Helm +3",
		neck = "Fotia Gorget", 
		ear1 = "Sherida Earring", 
		ear2 = "Lugra Earring +1", 		
		body = "Nukumi Gausape +1",
		hands = "Nyame Gauntlets",
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.STR_DA, 
		waist = "Fotia Belt",	
		legs = "Meghanada Chausses +2", 
		feet = "Nyame Sollerets"
	}
	sets.Decimation.KI_AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Gleti's Mask",
		neck = "Beastmaster Collar +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Lugra Earring +1",		
		body = "Nukumi Gausape +1",
		hands = "Gleti's Gauntlets",
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.STR_DA, 
		waist = "Fotia Belt",	
		legs = "Meghanada Chausses +2", 
		feet = "Gleti's Boots"
	}
	
	sets.Ruinator = {}
	sets.Ruinator.Attack = {
		ammo = "Coiste Bodhar",
		head = "Blistering Sallet +1",
		neck = "Fotia Gorget", 
		ear1 = "Sherida Earring", 
		ear2 = "Lugra Earring +1", 		
		body = "Tali'ah Manteel +2",
		hands = "Nyame Gauntlets",
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.STR_DA, 
		waist = "Fotia Belt",	
		legs = "Meghanada Chausses +2", 
		feet = "Nyame Sollerets"
	}
	sets.Ruinator.AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Gleti's Mask",
		neck = "Beastmaster Collar +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Lugra Earring +1", 		
		body = "Gleti's Cuirass",
		hands = "Gleti's Gauntlets",
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.STR_DA, 
		waist = "Fotia Belt",	
		legs = "Gleti's Breeches", 
		feet = "Gleti's Boots"
	}
	sets.Ruinator.KI_Attack = {
		ammo = "Coiste Bodhar",
		head = "Ankusa Helm +3",
		neck = "Fotia Gorget", 
		ear1 = "Sherida Earring", 
		ear2 = "Lugra Earring +1",		
		body = "Nukumi Gausape +1",
		hands = "Nyame Gauntlets",
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.STR_DA, 
		waist = "Fotia Belt",	
		legs = "Meghanada Chausses +2", 
		feet = "Nyame Sollerets"
	}
	sets.Ruinator.KI_AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Gleti's Mask",
		neck = "Beastmaster Collar +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Lugra Earring +1",		
		body = "Nukumi Gausape +1",
		hands = "Gleti's Gauntlets",
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.STR_DA, 
		waist = "Fotia Belt",	
		legs = "Gleti's Breeches", 
		feet = "Gleti's Boots"
	}

	sets.Onslaught = {}
	sets.Onslaught.Attack = {
		ammo = "Coiste Bodhar",
		head = "Ankusa Helm +3",
		neck = "Fotia Gorget", 
		ear1 = "Sherida Earring", 
		ear2 = "Lugra Earring +1", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Beithir Ring",
		back = Artio.STR_WSD, 
		waist = "Fotia Belt",	
		legs = "Lustratio Subligar +1", 
		feet = "Lustratio Leggings +1"
	}
	sets.Onslaught.AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Ankusa Helm +3",
		neck = "Beastmaster Collar +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Lugra Earring +1", 		
		body = "Gleti's Cuirass",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Beithir Ring",
		back = Artio.STR_WSD, 
		waist = "Fotia Belt",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.Onslaught.KI_Attack = {
		ammo = "Coiste Bodhar",
		head = "Ankusa Helm +3",
		neck = "Fotia Gorget", 
		ear1 = "Sherida Earring", 
		ear2 = "Lugra Earring +1", 		
		body = "Nukumi Gausape +1",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Beithir Ring",
		back = Artio.STR_WSD, 
		waist = "Fotia Belt",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.Onslaught.KI_AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Ankusa Helm +3",
		neck = "Beastmaster Collar +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Lugra Earring +1",		
		body = "Nukumi Gausape +1",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Beithir Ring",
		back = Artio.STR_WSD, 
		waist = "Fotia Belt",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	
	sets.BoraAxe = {}
	sets.BoraAxe.Attack = {
		ammo = "Coiste Bodhar",
		head = "Ankusa Helm +3",
		neck = "Fotia Gorget", 
		ear1 = "Sherida Earring", 
		ear2 = "Lugra Earring +1", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Gere Ring",
		back = Artio.STR_WSD, 
		waist = "Grunfeld Rope",	
		legs = "Lustratio Subligar +1", 
		feet = "Lustratio Leggings +1"
	}
	sets.BoraAxe.AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Ankusa Helm +3",
		neck = "Beastmaster Collar +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Lugra Earring +1", 		
		body = "Gleti's Cuirass",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Beithir Ring",
		back = Artio.STR_WSD, 
		waist = "Grunfeld Rope",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.BoraAxe.KI_Attack = {
		ammo = "Coiste Bodhar",
		head = "Ankusa Helm +3",
		neck = "Fotia Gorget",
		ear1 = "Sherida Earring", 
		ear2 = "Lugra Earring +1",		
		body = "Nukumi Gausape +1",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Gere Ring",
		back = Artio.STR_WSD, 
		waist = "Grunfeld Rope",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.BoraAxe.KI_AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Ankusa Helm +3",
		neck = "Beastmaster Collar +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Lugra Earring +1", 		
		body = "Nukumi Gausape +1",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Beithir Ring",
		back = Artio.STR_WSD, 
		waist = "Grunfeld Rope",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}	
	
	sets.PrimalRend = {}
	sets.PrimalRend.Attack = {
		ammo = "Ghastly Tathlum +1",
		head = "Nyame Helm",
		neck = "Baetyl Pendant", 
		ear1 = "Friomisi Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Carbuncle Ring",
		back = Artio.CHR_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.PrimalRend.AttackCapped = {
		ammo = "Ghastly Tathlum +1",
		head = "Nyame Helm",
		neck = "Baetyl Pendant", 
		ear1 = "Friomisi Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Carbuncle Ring",
		back = Artio.CHR_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.PrimalRend.KI_Attack = {
		ammo = "Ghastly Tathlum +1",
		head = "Nyame Helm",
		neck = "Baetyl Pendant", 
		ear1 = "Friomisi Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nukumi Gausape +1",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Carbuncle Ring",
		back = Artio.CHR_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.PrimalRend.KI_AttackCapped = {
		ammo = "Ghastly Tathlum +1",
		head = "Nyame Helm",
		neck = "Baetyl Pendant", 
		ear1 = "Friomisi Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nukumi Gausape +1",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Carbuncle Ring",
		back = Artio.CHR_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}	
	
	sets.Cloudsplitter = {}
	sets.Cloudsplitter.Attack = {
		ammo = "Pemphredo Tathlum",
		head = "Nyame Helm",
		neck = "Baetyl Pendant", 
		ear1 = "Friomisi Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Rufescent Ring",
		back = Artio.MND_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.Cloudsplitter.AttackCapped = {
		ammo = "Pemphredo Tathlum",
		head = "Nyame Helm",
		neck = "Baetyl Pendant", 
		ear1 = "Friomisi Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Rufescent Ring",
		back = Artio.MND_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.Cloudsplitter.KI_Attack = {
		ammo = "Pemphredo Tathlum",
		head = "Nyame Helm",
		neck = "Baetyl Pendant", 
		ear1 = "Friomisi Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nukumi Gausape +1",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Rufescent Ring",
		back = Artio.MND_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.Cloudsplitter.KI_AttackCapped = {
		ammo = "Pemphredo Tathlum",
		head = "Nyame Helm",
		neck = "Baetyl Pendant", 
		ear1 = "Friomisi Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nukumi Gausape +1",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Rufescent Ring",
		back = Artio.MND_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}	

	sets.Rampage = {}
	sets.Rampage.Attack = {
		ammo = "Coiste Bodhar",
		head = "Blistering Sallet +1",
		neck = "Fotia Gorget", 
		ear1 = "Sherida Earring", 
		ear2 = "Lugra Earring +1", 		
		body = "Gleti's Cuirass",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Gere Ring",
		back = Artio.STR_DA, 
		waist = "Fotia Belt",	
		legs = "Meghanada Chausses +2", 
		feet = ValorousFeet.Crit
	}
	sets.Rampage.AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Gleti's Mask",
		neck = "Beastmaster Collar +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Lugra Earring +1", 		
		body = "Gleti's Cuirass",
		hands = "Gleti's Gauntlets",
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.STR_DA, 
		waist = "Fotia Belt",	
		legs = "Gleti's Breeches", 
		feet = "Gleti's Boots"
	}
	sets.Rampage.KI_Attack = {
		ammo = "Coiste Bodhar",
		head = "Blistering Sallet +1",
		neck = "Fotia Gorget", 
		ear1 = "Sherida Earring", 
		ear2 = "Lugra Earring +1",		
		body = "Nukumi Gausape +1",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Gere Ring",
		back = Artio.STR_DA, 
		waist = "Fotia Belt",	
		legs = "Meghanada Chausses +2", 
		feet = ValorousFeet.Crit
	}
	sets.Rampage.KI_AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Gleti's Mask",
		neck = "Beastmaster Collar +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Lugra Earring +1",		
		body = "Nukumi Gausape +1",
		hands = "Gleti's Gauntlets",
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.STR_DA, 
		waist = "Fotia Belt",	
		legs = "Gleti's Breeches", 
		feet = ValorousFeet.Crit
	}	
	
	
	--Sword
	sets.SavageBlade = {}
	sets.SavageBlade.Attack = {
		ammo = "Coiste Bodhar",
		head = "Ankusa Helm +3",
		neck = "Beastmaster Collar +1", 
		ear1 = "Thrud Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Gere Ring",
		back = Artio.STR_WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.SavageBlade.AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Ankusa Helm +3",
		neck = "Beastmaster Collar +1", 
		ear1 = "Thrud Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Gleti's Cuirass",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Beithir Ring",
		back = Artio.STR_WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.SavageBlade.KI_Attack = {
		ammo = "Coiste Bodhar",
		head = "Ankusa Helm +3",
		neck = "Beastmaster Collar +1", 
		ear1 = "Thrud Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nukumi Gausape +1",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Gere Ring",
		back = Artio.STR_WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.SavageBlade.KI_AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Ankusa Helm +3",
		neck = "Beastmaster Collar +1", 
		ear1 = "Thrud Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nukumi Gausape +1",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Beithir Ring",
		back = Artio.STR_WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}	
	
	sets.SanguineBlade = {}
	sets.SanguineBlade.Attack = {
		ammo = "Pemphredo Tathlum",
		head = "Pixie Hairpin +1",
		neck = "Baetyl Pendant", 
		ear1 = "Friomisi Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Archon Ring",
		back = Artio.MND_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.SanguineBlade.AttackCapped = {
		ammo = "Pemphredo Tathlum",
		head = "Pixie Hairpin +1",
		neck = "Baetyl Pendant", 
		ear1 = "Friomisi Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Archon Ring",
		back = Artio.MND_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.SanguineBlade.KI_Attack = {
		ammo = "Pemphredo Tathlum",
		head = "Pixie Hairpin +1",
		neck = "Baetyl Pendant", 
		ear1 = "Friomisi Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nukumi Gausape +1",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Archon Ring",
		back = Artio.MND_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.SanguineBlade.KI_AttackCapped = {
		ammo = "Pemphredo Tathlum",
		head = "Pixie Hairpin +1",
		neck = "Baetyl Pendant", 
		ear1 = "Friomisi Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nukumi Gausape +1",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Archon Ring",
		back = Artio.MND_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}

	sets.RedLotusBlade = {}
	sets.RedLotusBlade.Attack = {
		ammo = "Pemphredo Tathlum",
		head = "Nyame Helm",
		neck = "Baetyl Pendant", 
		ear1 = "Friomisi Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Rufescent Ring",
		back = Artio.STR_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.RedLotusBlade.AttackCapped = {
		ammo = "Pemphredo Tathlum",
		head = "Nyame Helm",
		neck = "Baetyl Pendant", 
		ear1 = "Friomisi Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Rufescent Ring",
		back = Artio.STR_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.RedLotusBlade.KI_Attack = {
		ammo = "Pemphredo Tathlum",
		head = "Nyame Helm",
		neck = "Baetyl Pendant", 
		ear1 = "Friomisi Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nukumi Gausape +1",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Rufescent Ring",
		back = Artio.STR_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.RedLotusBlade.KI_AttackCapped = {
		ammo = "Pemphredo Tathlum",
		head = "Nyame Helm",
		neck = "Baetyl Pendant", 
		ear1 = "Friomisi Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nukumi Gausape +1",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Rufescent Ring",
		back = Artio.STR_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	
	sets.BurningBlade = {}
	sets.BurningBlade.Attack = { --commented out for SC purposes in Omen
		-- ammo = "Pemphredo Tathlum",
		-- head = "Nyame Helm",
		-- neck = "Baetyl Pendant", 
		-- ear1 = "Friomisi Earring", 
		-- ear2 = "Moonshade Earring", 		
		-- body = "Nyame Mail",
		-- hands = "Nyame Gauntlets",
		-- ring1 = "Metamorph Ring +1", 
		-- ring2 = "Rufescent Ring",
		-- back = Artio.STR_WSD, 
		-- waist = "Eschan Stone",	
		-- legs = "Nyame Flanchard", 
		-- feet = "Nyame Sollerets"
	}
	sets.BurningBlade.AttackCapped = {
		-- ammo = "Pemphredo Tathlum",
		-- head = "Nyame Helm",
		-- neck = "Baetyl Pendant", 
		-- ear1 = "Friomisi Earring", 
		-- ear2 = "Moonshade Earring", 		
		-- body = "Nyame Mail",
		-- hands = "Nyame Gauntlets",
		-- ring1 = "Metamorph Ring +1", 
		-- ring2 = "Rufescent Ring",
		-- back = Artio.STR_WSD, 
		-- waist = "Eschan Stone",	
		-- legs = "Nyame Flanchard", 
		-- feet = "Nyame Sollerets"
	}
	sets.BurningBlade.KI_Attack = {
		-- ammo = "Pemphredo Tathlum",
		-- head = "Nyame Helm",
		-- neck = "Baetyl Pendant", 
		-- ear1 = "Friomisi Earring", 
		-- ear2 = "Moonshade Earring", 		
		-- body = "Nukumi Gausape +1",
		-- hands = "Nyame Gauntlets",
		-- ring1 = "Metamorph Ring +1", 
		-- ring2 = "Rufescent Ring",
		-- back = Artio.STR_WSD, 
		-- waist = "Eschan Stone",	
		-- legs = "Nyame Flanchard", 
		-- feet = "Nyame Sollerets"
	}
	sets.BurningBlade.KI_AttackCapped = {
		-- ammo = "Pemphredo Tathlum",
		-- head = "Nyame Helm",
		-- neck = "Baetyl Pendant", 
		-- ear1 = "Friomisi Earring", 
		-- ear2 = "Moonshade Earring", 		
		-- body = "Nukumi Gausape +1",
		-- hands = "Nyame Gauntlets",
		-- ring1 = "Metamorph Ring +1", 
		-- ring2 = "Rufescent Ring",
		-- back = Artio.STR_WSD, 
		-- waist = "Eschan Stone",	
		-- legs = "Nyame Flanchard", 
		-- feet = "Nyame Sollerets"
	}	
	
	sets.SeraphBlade = {}
	sets.SeraphBlade.Attack = {
		ammo = "Pemphredo Tathlum",
		head = "Nyame Helm",
		neck = "Baetyl Pendant", 
		ear1 = "Friomisi Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Rufescent Ring",
		back = Artio.STR_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.SeraphBlade.AttackCapped = {
		ammo = "Pemphredo Tathlum",
		head = "Nyame Helm",
		neck = "Baetyl Pendant", 
		ear1 = "Friomisi Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Rufescent Ring",
		back = Artio.STR_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.SeraphBlade.KI_Attack = {
		ammo = "Pemphredo Tathlum",
		head = "Nyame Helm",
		neck = "Baetyl Pendant", 
		ear1 = "Friomisi Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nukumi Gausape +1",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Rufescent Ring",
		back = Artio.STR_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.SeraphBlade.KI_AttackCapped = {
		ammo = "Pemphredo Tathlum",
		head = "Nyame Helm",
		neck = "Baetyl Pendant", 
		ear1 = "Friomisi Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nukumi Gausape +1",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Rufescent Ring",
		back = Artio.STR_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}

	sets.ShiningBlade = {}
	sets.ShiningBlade.Attack = { --commented out for SC purposes in Omen
		-- ammo = "Pemphredo Tathlum",
		-- head = "Nyame Helm",
		-- neck = "Baetyl Pendant", 
		-- ear1 = "Friomisi Earring", 
		-- ear2 = "Moonshade Earring", 		
		-- body = "Nyame Mail",
		-- hands = "Nyame Gauntlets",
		-- ring1 = "Metamorph Ring +1", 
		-- ring2 = "Rufescent Ring",
		-- back = Artio.STR_WSD, 
		-- waist = "Eschan Stone",	
		-- legs = "Nyame Flanchard", 
		-- feet = "Nyame Sollerets"
	}
	sets.ShiningBlade.KI_Attack = {
		-- ammo = "Pemphredo Tathlum",
		-- head = "Nyame Helm",
		-- neck = "Baetyl Pendant", 
		-- ear1 = "Friomisi Earring", 
		-- ear2 = "Moonshade Earring", 		
		-- body = "Nukumi Gausape +1",
		-- hands = "Nyame Gauntlets",
		-- ring1 = "Metamorph Ring +1", 
		-- ring2 = "Rufescent Ring",
		-- back = Artio.STR_WSD, 
		-- waist = "Eschan Stone",	
		-- legs = "Nyame Flanchard", 
		-- feet = "Nyame Sollerets"
	}
	sets.ShiningBlade.KI_AttackCapped = {
		-- ammo = "Pemphredo Tathlum",
		-- head = "Nyame Helm",
		-- neck = "Baetyl Pendant", 
		-- ear1 = "Friomisi Earring", 
		-- ear2 = "Moonshade Earring", 		
		-- body = "Nukumi Gausape +1",
		-- hands = "Nyame Gauntlets",
		-- ring1 = "Metamorph Ring +1", 
		-- ring2 = "Rufescent Ring",
		-- back = Artio.STR_WSD, 
		-- waist = "Eschan Stone",	
		-- legs = "Nyame Flanchard", 
		-- feet = "Nyame Sollerets"
	}	

	--Dagger
	sets.Evisceration = {}
	sets.Evisceration.Attack = {
		ammo = "Coiste Bodhar",
		head = "Blistering Sallet +1",
		neck = "Fotia Gorget", 
		ear1 = "Sherida Earring", 
		ear2 = "Lugra Earring +1", 		
		body = "Gleti's Cuirass",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Gere Ring",
		back = Artio.DA, 
		waist = "Fotia Belt",	
		legs = "Lustratio Subligar +1", 
		feet = ValorousFeet.Crit
	}
	sets.Evisceration.AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Gleti's Mask",
		neck = "Beastmaster Collar +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Lugra Earring +1", 		
		body = "Gleti's Cuirass",
		hands = "Gleti's Gauntlets",
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.DA, 
		waist = "Fotia Belt",	
		legs = "Gleti's Breeches", 
		feet = "Gleti's Boots"
	}
	sets.Evisceration.KI_Attack = {
		ammo = "Coiste Bodhar",
		head = "Blistering Sallet +1",
		neck = "Fotia Gorget", 
		ear1 = "Sherida Earring", 
		ear2 = "Lugra Earring +1",		
		body = "Nukumi Gausape +1",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Gere Ring",
		back = Artio.DA, 
		waist = "Fotia Belt",	
		legs = "Lustratio Subligar +1", 
		feet = ValorousFeet.Crit
	}
	sets.Evisceration.KI_AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Gleti's Mask",
		neck = "Beastmaster Collar +1", 
		ear1 = "Sherida Earring", 
		ear2 = "Lugra Earring +1",		
		body = "Nukumi Gausape +1",
		hands = "Gleti's Gauntlets",
		ring1 = "Epona's Ring", 
		ring2 = "Gere Ring",
		back = Artio.DA, 
		waist = "Fotia Belt",	
		legs = "Gleti's Breeches", 
		feet = ValorousFeet.Crit
	}	
	
	sets.AeolianEdge = {}
	sets.AeolianEdge.Attack = {
		ammo = "Pemphredo Tathlum",
		head = "Nyame Helm",
		neck = "Baetyl Pendant", 
		ear1 = "Friomisi Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Ilabrat Ring",
		back = Artio.CHR_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.AeolianEdge.AttackCapped = {
		ammo = "Pemphredo Tathlum",
		head = "Nyame Helm",
		neck = "Baetyl Pendant", 
		ear1 = "Friomisi Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Ilabrat Ring",
		back = Artio.CHR_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.AeolianEdge.KI_Attack = {
		ammo = "Pemphredo Tathlum",
		head = "Nyame Helm",
		neck = "Baetyl Pendant", 
		ear1 = "Friomisi Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nukumi Gausape +1",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Ilabrat Ring",
		back = Artio.CHR_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.AeolianEdge.KI_AttackCapped = {
		ammo = "Pemphredo Tathlum",
		head = "Nyame Helm",
		neck = "Baetyl Pendant", 
		ear1 = "Friomisi Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nukumi Gausape +1",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Ilabrat Ring",
		back = Artio.CHR_WSD, 
		waist = "Eschan Stone",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}

	--Club	
	sets.TrueStrike = {}
	sets.TrueStrike.Attack = {
		ammo = "Coiste Bodhar",
		head = "Ankusa Helm +3",
		neck = "Beastmaster Collar +1", 
		ear1 = "Thrud Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Gere Ring",
		back = Artio.STR_WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.TrueStrike.AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Ankusa Helm +3",
		neck = "Beastmaster Collar +1", 
		ear1 = "Thrud Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Gleti's Cuirass",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Beithir Ring",
		back = Artio.STR_WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.TrueStrike.KI_Attack = {
		ammo = "Coiste Bodhar",
		head = "Ankusa Helm +3",
		neck = "Beastmaster Collar +1", 
		ear1 = "Thrud Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nukumi Gausape +1",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Gere Ring",
		back = Artio.STR_WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.TrueStrike.KI_AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Ankusa Helm +3",
		neck = "Beastmaster Collar +1", 
		ear1 = "Thrud Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nukumi Gausape +1",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Beithir Ring",
		back = Artio.STR_WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}


	--Scythe
	sets.SpiralHell = {}
	sets.SpiralHell.Attack = {
		ammo = "Coiste Bodhar",
		head = "Ankusa Helm +3",
		neck = "Beastmaster Collar +1", 
		ear1 = "Thrud Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Gere Ring",
		back = Artio.STR_WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.SpiralHell.AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Ankusa Helm +3",
		neck = "Beastmaster Collar +1", 
		ear1 = "Thrud Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Gleti's Cuirass",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Beithir Ring",
		back = Artio.STR_WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.SpiralHell.KI_Attack = {
		ammo = "Coiste Bodhar",
		head = "Ankusa Helm +3",
		neck = "Beastmaster Collar +1", 
		ear1 = "Thrud Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nukumi Gausape +1",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Gere Ring",
		back = Artio.STR_WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.SpiralHell.KI_AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Ankusa Helm +3",
		neck = "Beastmaster Collar +1", 
		ear1 = "Thrud Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nukumi Gausape +1",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Beithir Ring",
		back = Artio.STR_WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}	
	
	sets.Entropy = {}
	sets.Entropy.Attack = {
		ammo = "Coiste Bodhar",
		head = "Nyame Helm",
		neck = "Fotia Gorget", 
		ear1 = "Lugra Earring +1", 
		ear2 = "Moonshade Earring", 		
		body = "Tali'ah Manteel +2",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Gere Ring",
		back = Artio.DA, 
		waist = "Fotia Belt",	
		legs = "Meghanada Chausses +2", 
		feet = "Nyame Sollerets"
	}
	sets.Entropy.AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Gleti's Mask",
		neck = "Beastmaster Collar +1", 
		ear1 = "Lugra Earring +1", 
		ear2 = "Moonshade Earring", 		
		body = "Gleti's Cuirass",
		hands = "Gleti's Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Beithir Ring",
		back = Artio.DA, 
		waist = "Fotia Belt",	
		legs = "Gleti's Breeches", 
		feet = "Gleti's Boots"
	}
	sets.Entropy.KI_Attack = {
		ammo = "Coiste Bodhar",
		head = "Nyame Helm",
		neck = "Fotia Gorget", 
		ear1 = "Lugra Earring +1", 
		ear2 = "Moonshade Earring", 		
		body = "Nukumi Gausape +1",
		hands = "Nyame Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Gere Ring",
		back = Artio.DA, 
		waist = "Fotia Belt",	
		legs = "Meghanada Chausses +2", 
		feet = "Nyame Sollerets"
	}
	sets.Entropy.KI_AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Gleti's Mask",
		neck = "Beastmaster Collar +1", 
		ear1 = "Lugra Earring +1", 
		ear2 = "Moonshade Earring", 			
		body = "Nukumi Gausape +1",
		hands = "Gleti's Gauntlets",
		ring1 = "Metamorph Ring +1", 
		ring2 = "Beithir Ring",
		back = Artio.DA, 
		waist = "Fotia Belt",	
		legs = "Gleti's Breeches", 
		feet = "Gleti's Boots"
	}		

	
	--All Other
	sets.OtherWS = {}
	sets.OtherWS.Attack = {
		ammo = "Coiste Bodhar",
		head = "Ankusa Helm +3",
		neck = "Beastmaster Collar +1", 
		ear1 = "Thrud Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Gere Ring",
		back = Artio.STR_WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.OtherWS.AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Ankusa Helm +3",
		neck = "Beastmaster Collar +1", 
		ear1 = "Thrud Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Gleti's Cuirass",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Beithir Ring",
		back = Artio.STR_WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.OtherWS.KI_Attack = {
		ammo = "Coiste Bodhar",
		head = "Ankusa Helm +3",
		neck = "Beastmaster Collar +1", 
		ear1 = "Thrud Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nukumi Gausape +1",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Gere Ring",
		back = Artio.STR_WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}
	sets.OtherWS.KI_AttackCapped = {
		ammo = "Crepuscular Pebble",
		head = "Ankusa Helm +3",
		neck = "Beastmaster Collar +1", 
		ear1 = "Thrud Earring", 
		ear2 = "Moonshade Earring", 		
		body = "Nukumi Gausape +1",
		hands = "Nyame Gauntlets",
		ring1 = "Regal Ring", 
		ring2 = "Beithir Ring",
		back = Artio.STR_WSD, 
		waist = "Sailfi Belt +1",	
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"
	}		


	--Job Ability Sets--
	sets.Familiar = {legs = "Ankusa Trousers +3"}
	sets.KillerInstinct = {head = "Ankusa Helm +3"}
	sets.Spur = {
		main="Skullrender", 
		sub="Skullrender", 
		back=Artio.Idle, 
		feet="Nukumi Ocreae +1"
	} -- pet sTP +60 | pet Atk +60
	
	sets.Charm = {
        ammo="Pemphredo Tathlum",
		head="Ankusa Helm +3", 
        neck="Beastmaster Collar +1", 
        ear1="Crepuscular Earring",
		ear2="Enchanter's Earring +1", 
		body="Ankusa Jackcoat +3",  
        hands="Ankusa Gloves +3", 
        ring1="Metamorph Ring +1", 
        ring2="Stikini Ring", 
        back=Artio.CHR_WSD, 
		waist="Eschan Stone", 
        legs="Ankusa Trousers +3", 
        feet="Ankusa Gaiters +3"		
	}
	
	sets.FeralHowl = {
        ammo="Pemphredo Tathlum",
		head="Malignance Chapeau", 
        neck="Sanctity Necklace", 
        ear1="Crepuscular Earring",
		ear2="Dignitary's Earring", 
		body="Ankusa Jackcoat +3",  
        hands="Malignance Gloves", 
        ring1="Metamorph Ring +1", 
        ring2="Stikini Ring", 
        back=Artio.CHR_WSD, 
		waist="Eschan Stone", 
        legs="Malignance Tights", 
        feet="Malignance Boots"	
	}
	
	sets.Reward = {
        ammo="Pet Food Theta",
		head="Stout Bonnet", 
        neck="Unmoving Collar +1", 
        ear1="Static Earring",
		ear2="Enmerkar Earring", 
		body="Totemic Jackcoat +3",  
        hands="Malignance Gloves", 
        ring1="Metamorph Ring +1", 
        ring2="Stikini Ring", 
        back=Artio.MND_WSD, 
		waist="Engraved Belt", 
        legs="Ankusa Trousers +3", 
        feet="Ankusa Gaiters +3"	
	}
	
	-- You need to have a ilvl 119 weapon in mainhand as well
	sets.CallBeast = {
        ammo="Staunch Tathlum +1",
		head=AcroHead.CB, 
        neck="Loricate Torque +1", 
        ear1="Eabani Earring",
		ear2="Sanare Earring", 
		body="Mirke Wardecors",  
        hands="Ankusa Gloves +3", 
        ring1="Gelatinous Ring +1", 
        ring2="Defending Ring", 
        back=Artio.FC, 
		waist="Flume Belt +1", 
        legs=AcroLegs.CB, 
        feet=AcroFeet.CB		
	}
	
	sets.Waltz ={
        ammo="Voluspa Tathlum",
		head="Anwig Salade", 
        neck="Unmoving Collar +1", 
        ear1="Handler's Earring +1",
		ear2="Enchanter's Earring +1", 
		body="Gleti's Cuirass",  
        hands="Gleti's Gauntlets", 
        ring1="Metamorph Ring +1", 
        ring2="Carbuncle Ring", 
        back=Artio.CHR_WSD, 
		waist="Flume Belt +1", 
        legs="Dashing Subligar", 
        feet="Nyame Sollerets"
	}
	
	sets.precast = {}
	sets.precast.FastCast = {
		main = "Shukuyu's Scythe", -- 10
		sub = "Bloodrain Strap",
		ammo = "Sapience Orb", -- 2
		head = "Nyame Helm", 
		neck = "Orunmila's Torque", -- 5
		ear1 = "Enchanter's Earring +1", -- 2
		ear2 = "Loquacious Earring", -- 2
		body = "Sacro Breastplate", -- 10
		hands = "Leyline Gloves", -- 8
		ring1 = "Naji's Loop", -- 1
		ring2 = "Rahab Ring", -- 2
		waist = "Flume Belt +1", 
		back = Artio.FC, -- 10
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets" 	
	} -- 52% FC
	
	sets.precast.FastCast_melee = {
		ammo = "Sapience Orb", -- 2
		head = "Nyame Helm", 
		neck = "Orunmila's Torque", -- 5
		ear1 = "Enchanter's Earring +1", -- 2
		ear2 = "Loquacious Earring", -- 2
		body = "Sacro Breastplate", -- 10
		hands = "Leyline Gloves", -- 8
		ring1 = "Naji's Loop", -- 1
		ring2 = "Rahab Ring", -- 2
		waist = "Flume Belt +1", 
		back = Artio.FC, -- 10
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets" 	
	} -- 42% FC	

	
	--This is here if you need it for Utsusemi
	sets.precast.NinjutsuFastCast = set_combine(sets.precast.FastCast, {
		--neck = "Magoraga Beads",
	})
	
	
	
	--Ready Sets
	--Precast
	sets.precast.Ready_precast_weapon = {main="Aymur"} -- +500 TP Bonus during precast, +500 more during midcast
	--5/5 ready merits caps with only legs	
	sets.Ready_precast = {
		legs="Gleti's Breeches" --5
	}
	
	--Midcast
	Ready_ind = 1 --Dont change this
	
	-- Normal:
		-- 5% intimidation rate to enemies of the prey species.
		-- +5% damage dealt to enemies of the prey species.
		-- -5% Special Damage Taken from enemies of the prey species.
	-- Increases by +24% if Nukumi Cabasset +1 is used against correct species
	sets.Correlation = {head="Nukumi Cabasset +1"} -- swaps in during ready/during DT if Correlation Mode is active
	
	--You don't want to use TP bonus hands during Unleash
	sets.Unleash_hands_phys = {hands=EmichoHands.DW}
	sets.Unleash_hands_magic = {hands="Gleti's Gauntlets"}
	--Macc
	--Shouldn't need tiers for Macc, just use as much as possible until testing reveals a stat matters
	sets.Ready_Macc_weapon = {main="Pangu", sub="Sacro Bulwark"}
	sets.Ready_Macc_weapon_DW = {main="Pangu", sub="Agwu's Axe"}
	
	sets.Ready_Macc = {
		ammo = "Voluspa Tathlum", 
		head = "Nyame Helm", 
		neck = "Adad Amulet", 
		ear1 = "Handler's Earring +1", 
		ear2 = "Enmerkar Earring", 
		body = "Nyame Mail", 
		hands = "Gleti's Gauntlets", 
		ring1 = "Cath Palug Ring", 
		ring2 = "Tali'ah Ring", 
		waist = "Incarnation Sash", 
		back = Artio.Macc_pet, 
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"		
	}
	
	--MAB
	sets.Ready_MAB_weapon = {main="Pangu", sub="Sacro Bulwark"}
	sets.Ready_MAB_weapon_DW = {main="Pangu", sub="Agwu's Axe"}
	
	sets.Ready_MAB = {}
	sets.Ready_MAB.index = {'MAB', 'Macc'}
	sets.Ready_MAB.MAB = {
		ammo = "Voluspa Tathlum", 
		head = ValorousHead.Pet_MAB, 
		neck = "Adad Amulet", 
		ear1 = "Hija Earring", 
		ear2 = "Enmerkar Earring", 
		body = EmichoBody.Pet_MAB, 
		hands = "Nukumi Manoplas +1", 
		ring1 = "Cath Palug Ring", 
		ring2 = "Tali'ah Ring", 
		waist = "Incarnation Sash", 
		back = Artio.Macc_pet, 
		legs = ValorousLegs.Pet_MAB, 
		feet = ValorousFeet.Pet_MAB
	}
	sets.Ready_MAB.Macc = {
		ammo = "Voluspa Tathlum", 
		head = "Nyame Helm", 
		neck = "Adad Amulet", 
		ear1 = "Hija Earring", 
		ear2 = "Enmerkar Earring", 
		body = EmichoBody.Pet_MAB, 
		hands = "Nukumi Manoplas +1", 
		ring1 = "Cath Palug Ring", 
		ring2 = "Tali'ah Ring", 
		waist = "Incarnation Sash", 
		back = Artio.Macc_pet, 
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets"	
	}
	
	--Phys/Multiattack
	--You can add more physical tiers for Accuracy as content demands
	sets.Ready_Phys_weapon = {main="Aymur", sub="Sacro Bulwark"}
	sets.Ready_Phys_weapon_DW = {main="Aymur", sub="Agwu's Axe"}
	
	sets.Ready_Phys = {}
	sets.Ready_Phys.index = {'Attack', 'Acc'}
	sets.Ready_Phys.Attack = {
		ammo = "Hesperiidae", 
		head = EmichoHead.Pet_STR, 
		neck = "Shulmanu Collar", 
		ear1 = "Hija Earring", 
		ear2 = "Enmerkar Earring", 
		body = ValorousBody.Pet_Phys, 
		hands = "Nukumi Manoplas +1", 
		ring1 = "Cath Palug Ring", 
		ring2 = "Varar Ring +1", 
		waist = "Incarnation Sash", 
		back = Artio.Idle_pet, 
		legs = ValorousLegs.Pet_Phys, 
		feet = "Gleti's Boots"	
	}
	sets.Ready_Phys.Acc = {
		ammo = "Hesperiidae", 
		head = "Nyame Helm", 
		neck = "Shulmanu Collar", 
		ear1 = "Hija Earring", 
		ear2 = "Enmerkar Earring", 
		body = "Nyame Mail", 
		hands = "Nukumi Manoplas +1", 
		ring1 = "Cath Palug Ring", 
		ring2 = "Varar Ring +1", 
		waist = "Incarnation Sash", 
		back = Artio.Idle_pet, 
		legs = "Nyame Flanchard", 
		feet = "Gleti's Boots"	
	}
	
	sets.Ready_Multiattack = {}
	sets.Ready_Multiattack.index = {'Attack', 'Acc'}
	sets.Ready_Multiattack.Attack = {
		ammo = "Hesperiidae", 
		head = EmichoHead.Pet_DA, 
		neck = "Shulmanu Collar", 
		ear1 = "Hija Earring", 
		ear2 = "Domesticator's Earring", 
		body = ValorousBody.Pet_Phys, 
		hands = "Nukumi Manoplas +1", 
		ring1 = "Cath Palug Ring", 
		ring2 = "Varar Ring +1", 
		waist = "Incarnation Sash", 
		back = Artio.Idle_pet, 
		legs = EmichoLegs.Pet_DA, 
		feet = "Gleti's Boots"	
	}
	sets.Ready_Multiattack.Acc = {
		ammo = "Hesperiidae", 
		head = EmichoHead.Pet_DA, 
		neck = "Shulmanu Collar", 
		ear1 = "Hija Earring", 
		ear2 = "Domesticator's Earring", 
		body = "Nyame Mail", 
		hands = "Nukumi Manoplas +1", 
		ring1 = "Cath Palug Ring", 
		ring2 = "Varar Ring +1", 
		waist = "Incarnation Sash", 
		back = Artio.Idle_pet, 
		legs = EmichoLegs.Pet_DA, 
		feet = "Gleti's Boots"	
	}
	
	--Buffs and cures
	--Only TP Bonus really matters here, so I use DT here where I can.
	sets.Ready_Buffs_weapon = {main="Aymur"}
	
	sets.Ready_Buffs = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Nyame Helm", -- 0/0/7
		neck = "Shepherd's Chain", -- (0/0/2)
		ear1 = "Handler's Earring +1", -- (4/0/0)
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Nukumi Manoplas +1", 
		ring1 = "Cath Palug Ring", -- 0/0/5
		ring2 = "Defending Ring", -- 0/0/10
		waist = "Isa Belt", -- (0/0/3)
		back = Artio.Idle_pet, -- (0/0/5)
		legs = "Tali'ah Seraweels +2", -- (0/0/5)
		feet = "Ankusa Gaiters +3" -- (5/0/0)
	} -- 0/0/25 (9/0/37)
	
	
	sets.midcast = {}
	-- FC here will lower recasts until cap, but its a good idea to put -DT% in midcasts
	sets.midcast.FastRecast = {
		ammo = "Sapience Orb", -- 2
		head = "Nyame Helm", 
		neck = "Orunmila's Torque", -- 5
		ear1 = "Enchanter's Earring +1", -- 2
		ear2 = "Loquacious Earring", -- 2
		body = "Sacro Breastplate", -- 10
		hands = "Leyline Gloves", -- 8
		ring1 = "Naji's Loop", -- 1
		ring2 = "Rahab Ring", -- 2
		waist = "Flume Belt +1", 
		back = Artio.FC, -- 10
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets" 	
	} -- 42% FC


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
		ammo = "Sapience Orb", -- 2
		head = "Nyame Helm", 
		neck = "Orunmila's Torque", -- 5
		ear1 = "Enchanter's Earring +1", -- 2
		ear2 = "Loquacious Earring", -- 2
		body = "Sacro Breastplate", -- 10
		hands = "Leyline Gloves", -- 8
		ring1 = "Naji's Loop", -- 1
		ring2 = "Rahab Ring", -- 2
		waist = "Flume Belt +1", 
		back = Artio.FC, -- 10
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets" 
	}  
	
	--Use defined phalanx pieces here if you have them
	sets.midcast.Enhancing_phalanx = {
		ammo = "Sapience Orb",
		head = TaeonHead.Phalanx,  
		neck = "Incanter's Torque", 
		ear1 = "Mimir Earring", 
		ear2 = "Andoaa Earring",		
        body = TaeonBody.Phalanx, 
		hands = TaeonHands.Phalanx, 
		ring1 = "Stikini Ring", 
		ring2 = "Stikini Ring", 
        back = Artio.FC, 		
		legs = TaeonLegs.Phalanx, 
		feet = TaeonFeet.Phalanx 	
	} 
	
	sets.midcast.Enhancing_aquaveil = {
		ammo = "Sapience Orb",
		head = "Nyame Helm", 
		neck = "Incanter's Torque", 
		ear1 = "Mimir Earring", 
		ear2 = "Andoaa Earring", 
		body = "Sacro Breastplate", 
		hands = "Leyline Gloves", 
		ring1 = "Stikini Ring", 
		ring2 = "Stikini Ring", 
        back = Artio.FC, 
		waist = "Olympus Sash", 
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets" 
	} 
	
	sets.midcast.Enhancing_stoneskin = {
		ammo = "Sapience Orb",
		head = "Nyame Helm", 
		neck = "Incanter's Torque", 
		ear1 = "Mimir Earring", 
		ear2 = "Andoaa Earring", 
		body = "Sacro Breastplate", 
		hands = "Leyline Gloves", 
		ring1 = "Stikini Ring", 
		ring2 = "Stikini Ring", 
        back = Artio.FC, 
		waist = "Olympus Sash", 
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets" 
	} 
	
	sets.midcast.Enhancing_refresh = {
		ammo = "Sapience Orb",
		head = "Nyame Helm", 
		neck = "Orunmila's Torque", 
		ear1 = "Loquacious Earring", 
		ear2 = "Enchanter's Earring +1", 
		body = "Sacro Breastplate", 
		hands = "Leyline Gloves", 
		ring1 = "Naji's Loop", 
		ring2 = "Rahab Ring", 
        back = Artio.FC, 
		waist = "Gishdubar Sash", 
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets" 
	} 
	
	sets.midcast.Enhancing_refresh_other = {
		ammo = "Sapience Orb", -- 2
		head = "Nyame Helm", 
		neck = "Orunmila's Torque", -- 5
		ear1 = "Enchanter's Earring +1", -- 2
		ear2 = "Loquacious Earring", -- 2
		body = "Sacro Breastplate", -- 10
		hands = "Leyline Gloves", -- 8
		ring1 = "Naji's Loop", -- 1
		ring2 = "Rahab Ring", -- 2
		waist = "Flume Belt +1", 
		back = Artio.FC, -- 10
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets" 
	}	

	sets.midcast.Enhancing_barspell = {
		ammo = "Sapience Orb",
		head = "Nyame Helm", 
		neck = "Incanter's Torque", 
		ear1 = "Mimir Earring", 
		ear2 = "Andoaa Earring", 
		body = "Sacro Breastplate", 
		hands = "Leyline Gloves", 
		ring1 = "Stikini Ring", 
		ring2 = "Stikini Ring", 
        back = Artio.FC, 
		waist = "Olympus Sash", 
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets" 
	} 


	--Weapon combos specific to pet-only mode
	sets.Weapon_magic = {}
	sets.Weapon_magic.MAcc = {
		main = "Pangu",  
		sub = "Sacro Bulwark",
		range = "Ullr"
	}
	sets.Weapon_magic.MAcc_DW = {
		main = "Pangu",  
		sub = "Agwu's Axe",
		range = "Ullr"
	}
	
	sets.Charm = {
        ammo="Pemphredo Tathlum",
		head="Ankusa Helm +3", --Should be totemic Helm +3 but I don't have a reason to make it atm. 
        neck="Sanctity Necklace", 
        ear1="Crepuscular Earring",
		ear2="Dignitary's Earring", 
		body="Ankusa Jackcoat +3",  
        hands="Ankusa Gloves +3", 
        ring1="Metamorph Ring +1", 
        ring2="Stikini Ring", 
        back=Artio.CHR_WSD, 
		waist="Eschan Stone", 
        legs="Ankusa Trousers +3", 
        feet="Ankusa Gaiters +3"		
	}
	
	--For enfeebles
	sets.MAcc = {
        ammo="Pemphredo Tathlum",
		head="Malignance Chapeau", 
        neck="Sanctity Necklace", 
        ear1="Crepuscular Earring",
		ear2="Dignitary's Earring", 
		body="Malignance Tabard",  
        hands="Malignance Gloves", 
        ring1="Metamorph Ring +1", 
        ring2="Stikini Ring", 
        back=Artio.CHR_WSD, 
		waist="Eschan Stone", 
        legs="Malignance Tights", 
        feet="Malignance Boots"
	}

	
	--White Magic	
	sets.Weapon_magic.Cure = {
	    main="Pangu",
		sub="Sacro Bulwark"
	}
	
	
	--Cures
	sets.midcast.Cure = {
		ammo="Sapience Orb",
		head="Nyame Helm", 
		neck="Incanter's Torque",
		ear1="Enchanter's Earring +1",
		ear2="Loquacious Earring",
        body="Jumalik Mail", -- 15/0
		hands="Nyame Gauntlets", 
        ring1="Janniston Ring +1", -- 0/6
        ring2="Menelaus's Ring", -- 5/0
        back=Artio.Macc_pet, -- 10/0
		waist="Tempus Fugit",
		legs="Nyame Flanchard", 
		feet="Nyame Sollerets" 
	} -- 30% CPI | 6% CPII
	
	--Cursna+ -> Healing Skill (until new %-tier) -> Haste -> FastCast
	sets.midcast.Cursna = {
		ammo = "Sapience Orb", -- 2
		head = "Nyame Helm", 
		neck = "Debilis Medallion", 
		ear1 = "Enchanter's Earring +1", -- 2
		ear2 = "Loquacious Earring", -- 2
		body = "Sacro Breastplate", -- 10
		hands = "Leyline Gloves", -- 8
		ring1 = "Menelaus's Ring", -- -10
		ring2 = "Haoma's Ring", 
		waist = "Tempus Fugit", 
		back = Artio.FC, -- 10
		legs = "Nyame Flanchard", 
		feet = "Nyame Sollerets" 	
	} -- 31% FC | Cursna +50

	--Banish Effect+
	sets.midcast.Banish_effect = {} 
	

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
		head = "Ankusa Helm +3", 
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Eabani Earring", 
		ear2 = "Sanare Earring",  
		body = "Nukumi Gausape +1", 
		hands = "Nyame Gauntlets", -- 0/0/7 
		ring1 = "Sheltered Ring",  
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle, 
		waist = "Engraved Belt",	
		legs = "Nyame Flanchard", -- 0/0/8 
		feet = "Nyame Sollerets" -- 0/0/7 
	} -- 0/-1/41
	
	-- Set for both master and pet if player is unable to act
	sets.SafetyDance_pet = {
		ammo = "Staunch Tathlum +1", -- 0/0/3 
		head = "Nyame Helm", -- 0/0/7
		neck = "Loricate Torque +1", -- 0/0/6
		ear1 = "Handler's Earring +1", -- (4/0/0)
		ear2 = "Enmerkar Earring", -- (0/0/3)
		body = "Totemic Jackcoat +3", -- (0/0/10)
		hands = "Gleti's Gauntlets", -- 7/0/0 (0/0/8)
		ring1 = "Gelatinous Ring +1", -- 7/-1/0
		ring2 = "Defending Ring", -- 0/0/10
		back = Artio.Idle_pet, -- (0/0/5)
		waist = "Isa Belt",	-- (0/0/3)
		legs = "Tali'ah Seraweels +2", -- (0/0/5) 
		feet = "Nyame Sollerets" -- 0/0/7
	} -- 14/-1/33 (9/0/40)	
	
	sets.Enmity = {
		ammo = "Sapience Orb", 
		head = "Halitus Helm", 
		neck = "Unmoving Collar +1", 
		ear1 = "Cryptic Earring", 
		ear2 = "Trux Earring", 
		body = "Emet Harness +1", 
		hands = "Macabre Gauntlets +1", 
		ring1 = "Eihwaz Ring", 
		ring2 = "Supershear Ring", 
		back = Artio.Counter, 
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
		
	--Pet Moves
	--Pet move lists taken from Falkirk's Lua
	Physical_ready_moves = S{
		'Foot Kick','Whirl Claws','Sheep Charge','Lamb Chop','Head Butt','Wild Oats',
		'Leaf Dagger','Claw Cyclone','Razor Fang','Crossthrash','Nimble Snap','Cyclotail','Rhino Attack',
		'Power Attack','Mandibular Bite','Big Scissors','Grapple','Spinning Top','Double Claw','Frogkick',
		'Blockhead','Brain Crush','Tail Blow','Scythe Tail','Ripper Fang','Chomp Rush','Needleshot',
		'Recoil Dive','Sudden Lunge','Spiral Spin','Wing Slap','Beak Lunge','Suction','Back Heel',
		'Fantod','Tortoise Stomp','Sensilla Blades','Tegmina Buffet','Pentapeck','Sweeping Gouge',
		'Somersault','Tickling Tendrils','Pecking Flurry','Sickle Slash','Disembowel','Extirpating Salvo',
		'Mega Scissors','Rhinowrecker','Hoof Volley','Fluid Toss','Fluid Spread'}

	Magic_atk_ready_moves = S{
		'Dust Cloud','Cursed Sphere','Venom','Toxic Spit','Bubble Shower','Drainkiss',
		'Silence Gas','Dark Spore','Fireball','Plague Breath','Snow Cloud','Charged Whisker','Corrosive Ooze',
		'Aqua Breath','Stink Bomb','Nectarous Deluge','Nepenthic Plunge','Pestilent Plume','Foul Waters',
		'Acid Spray','Infected Leech','Gloom Spray','Venom Shower'}

	Magic_acc_ready_moves = S{
		'Sheep Song','Scream','Dream Flower','Roar','Predatory Glare','Gloeosuccus',
		'Palsy Pollen','Soporific','Geist Wall','Toxic Spit','Numbing Noise','Spoil','Hi-Freq Field',
		'Sandpit','Sandblast','Venom Spray','Filamented Hold','Queasyshroom','Numbshroom','Spore','Shakeshroom',
		'Infrasonics','Chaotic Eye','Blaster','Purulent Ooze','Intimidate','Noisome Powder','Acid Mist',
		'Choke Breath','Jettatura','Nihility Song','Molting Plumage','Swooping Frenzy','Spider Web'}

	Multi_hit_ready_moves = S{
		'Pentapeck','Tickling Tendrils','Sweeping Gouge','Chomp Rush','Wing Slap', 'Pecking Flurry'}

	TP_based_ready_moves = S{
		'Foot Kick','Dust Cloud','Snow Cloud','Sheep Song','Sheep Charge','Lamb Chop',
		'Head Butt','Scream','Dream Flower','Wild Oats','Leaf Dagger','Claw Cyclone','Razor Fang','Roar',
		'Gloeosuccus','Palsy Pollen','Soporific','Cursed Sphere','Somersault','Geist Wall','Numbing Noise',
		'Frogkick','Nimble Snap','Cyclotail','Spoil','Rhino Attack','Hi-Freq Field','Sandpit','Sandblast',
		'Mandibular Bite','Metallic Body','Bubble Shower','Grapple','Spinning Top','Double Claw','Spore',
		'Filamented Hold','Blockhead','Fireball','Tail Blow','Plague Breath','Brain Crush','Infrasonics',
		'Needleshot','Chaotic Eye','Blaster','Ripper Fang','Intimidate','Recoil Dive','Water Wall',
		'Sudden Lunge','Noisome Powder','Wing Slap','Beak Lunge','Suction','Drainkiss','Acid Mist',
		'TP Drainkiss','Back Heel','Jettatura','Choke Breath','Fantod','Charged Whisker','Purulent Ooze',
		'Corrosive Ooze','Tortoise Stomp','Aqua Breath','Sensilla Blades','Tegmina Buffet','Sweeping Gouge',
		'Tickling Tendrils','Pecking Flurry','Pestilent Plume','Foul Waters','Spider Web','Gloom Spray',
		'Disembowel','Extirpating Salvo','Rhinowrecker','Venom Shower','Fluid Toss','Fluid Spread','Digest'}
		
	Non_ready_pet_actions = S{
		'Fight', 'Heel', 'Leave', 'Stay', 'Snarl', 'Spur', 'Run Wild'}

	-- List of Pet Buffs and Ready moves exclusively modified by Pet TP Bonus gear.
	Pet_buff_moves = S{'Wild Carrot','Bubble Curtain','Scissor Guard','Secretion','Rage','Harden Shell',
		'TP Drainkiss','Fantod','Rhino Guard','Zealous Snort','Frenzied Rage','Digest'}

	-- List of Jug Modes that will cancel if Call Beast is used (Bestial Loyalty-only jug pets, HQs generally).
	Call_beast_cancel = S{'Vis. Broth','Ferm. Broth','Bubbly Broth','Windy Greens','Bug-Ridden Broth','Tant. Broth',
		'Glazed Broth','Slimy Webbing','Deepwater Broth','Venomous Broth','Heavenly Broth'}	
	
	Jugs = S{
		'Alchemist Water', 'Carrot Broth', 'F. Carrot Broth', 'Famous Carrot Broth', 'Fish Broth', 'Fish Oil Broth',
		'Herbal Broth', 'S. Herbal Broth', 'Singing Herbal Broth', 'Wormy Broth', 'Grasshopper Broth', 'Noisy Grasshopper Broth',
		'Humus', 'Rich Humus', 'Meat Broth', 'Warm Meat Broth', 'Bug Broth', 'Qdv. Bug Broth', 'Quadav Bug Broth', 'Carrion Broth',
		'Cold Carrion Broth', 'Mole Broth', 'L. Mole Broth', 'Lively Mole Broth', 'Seedbed Soil', 'Antica Broth', 'Fragrant Antica Broth',
		'Tree Sap', 'Scarlet Sap', 'Blood Broth', 'Clear Blood Broth', 'Auroral Broth', 'Sun Water', 'Briny Broth', 'Cng. Brain Broth',
		'Cunning Brain Broth', 'D. Herbal Broth', 'Dancing Herbal Broth', 'L. Carrot Broth', 'Lucky Carrot Broth', 'Vermihumus',
		'Wool Grease', 'Deepbed Soil', 'C. Plasma Broth', 'Clot Plasma Broth', 'C. Grass. Broth', 'Chirping Grasshopper Broth',
		'Bub. Carrion Broth', 'Bubbling Carrion Broth', 'Gob. Bug Broth', 'Goblin Bug Broth', 'Lucky Broth', 'Mlw. Bird Broth',
		'Mellow Bird Broth', 'Rzr. Brain Broth', 'Razor Brain Broth', 'Svg. Mole Broth', 'Savage Mole Broth', 'Bur. Carrion Broth',
		'Burning Carrion Broth', 'Cl. Wheat Broth', 'Cloudy Wheat Broth', 'Shadowy Broth', 'Airy Broth', 'Aged Humus', 'Blackwater Broth',
		'Crackling Broth', 'Creepy Broth', 'Crumbly Soil', 'Dire Broth', 'Electrified Broth', 'Bug-Ridden Broth', 'Fizzy Broth',
		'Tantalizing Broth', 'Tant. Broth', 'Furious Broth', 'Insipid Broth', 'Deepwater Broth', 'Livid Broth', 'Lyrical Broth', 'Meaty Broth',
		'Muddy Broth', 'Pale Sap', 'Poisonous Broth', 'Venomous Broth', 'Pristine Sap', 'T. Pristine Sap', 'Truly Pristine Sap',
		'Rapid Broth', 'Saline Broth', 'Salubrious Broth', 'Windy Greens', 'Shimmering Broth', 'Ferm. Broth', 'Fermented Broth', 
		'Spicy Broth', 'Bubbly Broth', 'Sticky Webbing', 'Slimy Webbing', 'Sugary Broth', 'Glazed Broth', 'Swirling Broth', 'Vis. Broth',
		'Viscous Broth', 'Trans. Broth', 'Translucent Broth', 'Wetlands Broth', 'Heavenly Broth', 'Wispy Broth', 'Aged Humus', 
		'Rancid Broth', 'Pungent Broth', 'Zestful Sap', 'Gassy Sap', 'Frizzante Broth', 'Spumante Broth', 'Turpid Broth', 'Feculent Broth',
		'Decaying Broth', 'Putrescent Broth'}
		
	Circle_buffs = S{
		'Arcane Circle', 'Holy Circle', 'Ancient Circle', 'Warding Circle'}
	
	Elemental_WS = S{
		'Sanguine Blade', 'Seraph Blade', 'Shining Blade', 'Red Lotus Blade', 'Burning Blade', 
		'Seraph Strike', 'Shining Strike', 
		'Flaming Arrow', 
		'Aeolian Edge',
		'Primal Rend', 'Cloudsplitter'}
		
	Ranged_weaponskill = S{
		'Empyreal Arrow', 'Flaming Arrow', 'Piercing Arrow', 'Sidewinder', 'Dulling Arrow'}
		
	Unusable_buff = {
		spell={'Charm','Mute','Omerta','Petrification','Silence','Sleep','Stun','Terror'},
		ability={'Amnesia','Charm','Impairment','Petrification','Sleep','Stun','Terror'}}	

	Enmity_actions = S{'Sentinel', 'Shield Bash', 'Souleater', 'Weapon Bash', 'Vallation', 'Valiance', 'Swordplay', 'Pflug', 'Provoke', 'Flash'}
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
Haste_II = false 

-- Sets the default mode for weapons swaps
-- -- Melee(true): Disallows weapon swaps during casts
-- -- Mage(false): Allows weapon swaps during casts
Melee_mode = true
Correlation_mode = false

Kite_mode = true

Jug = ''
Jug_lock = true
 


-- Sets Merits/Job Gifts related to Pets for calculations later
-- -- Replace with the # of Merits you have in this category (5 max)
Ready_recast = 5
-- -- Replace with current JP Total (0~2100)
JPTotal = 2100


--Ready-Related Variables
Ready_move_one = ' '
Ready_move_two = ' '
Ready_move_three = ' '
Ready_move_four = ' '
Ready_move_five = ' '
Ready_move_six = ' '
Ready_move_seven = ' '


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
	if Circle_buffs:contains(name) then
		if gain then
			Circle_buff = true
		else
			Circle_buff = false
		end
	end
	determine_haste_sets()
end

function prep_startup()
	--Streamlines Variables on load
	-- --Redundant, but I like this to be available to 'standardize'
	-- --startup from one location.
	Melee_mode = true
	DW_mode_ind = 2
	Jug = ''
	Jug_lock = true
	Correlation_mode = false
	Kite_mode = true
	
	
	Ready_move_one = ' '
	Ready_move_two = ' '
	Ready_move_three = ' '
	Ready_move_four = ' '
	Ready_move_five = ' '
	Ready_move_six = ' '
	Ready_move_seven = ' '
	
	send_command('@input /echo BST Loaded, Current Modes::: Melee_mode: ON | Correlation Mode: OFF | DW_mode: DW')
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
	--Handle Jugs
	--Falkirk's lua handles this really well, reusing some of its functionality here
	if spell.english == "Call Beast" then
		if Jug == ' ' then
			send_command('@input /echo Jug not yet selected.')
		else
			equip(
				set_combine(
					sets.CallBeast,
					{ammo=Jug}
				)
			)
		end
		if Jug_lock == true and Call_beast_cancel:contains(player.equipment.ammo) then
			cancel_spell()
			send_command('@input /echo Cancelling HQ Jug use, set override to use this Jug.')
			Jug_downgrade(Jug)
		end
	end
	if spell.english == 'Bestial Loyalty' then
		if Jug == ' ' then
			send_command('@input /echo Jug not yet selected.')
		else
			equip(
				set_combine(
					sets.CallBeast,
					{ammo=Jug}	
				)
			)
		end
	end
	if (spell.type == 'WhiteMagic' or spell.type == 'BlackMagic') then
		if player.status == 'Engaged' then
			equip(sets.precast.FastCast_melee)
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
			-- if (spell.target.distance <= 21.5 and Ranged_weaponskill:contains(spell.english)) then
				-- -- just in case it comes up, but BST shoudn't be using a ranged weapon					
			-- else
				-- cancel_spell()
				-- send_command("@input /echo Canceled " .. spell.name .. " " .. spell.target.name .. " is Too Far")
			-- end
			--handles mid-range WS's (Mistral Axe and Bora Axe)
			if spell.target.distance <= 15.5 and spell.english == 'Mistral Axe' then
				equip(sets.MistralAxe[sets.WS.index[WS_ind]])
				if ((buffactive['Killer Instinct'] or Circle_buff == true) and Correlation_mode == true) then
					equip(sets.MistralAxe[sets.WS.index[WS_ind + (#sets.WS.index / 2)]])
				end
			end
			if (spell.target.distance <= 15.5 and spell.english == "Bora Axe") then
				equip(sets.BoraAxe[sets.WS.index[WS_ind]])
				if ((buffactive['Killer Instinct'] or Circle_buff == true) and Correlation_mode == true) then
					equip(sets.BoraAxe[sets.WS.index[WS_ind + (#sets.WS.index / 2)]])
				end
			end
			--handles close-range WS's
			if spell.target.distance <= 5.5 then
				--Axe
				if spell.english == "Calamity" then
					equip(sets.Calamity[sets.WS.index[WS_ind]])
					if ((buffactive['Killer Instinct'] or Circle_buff == true) and Correlation_mode == true) then
						equip(sets.Calamity[sets.WS.index[WS_ind + (#sets.WS.index / 2)]])
					end
				end
				if spell.english == "Ruinator" then
					equip(sets.Ruinator[sets.WS.index[WS_ind]])
					if ((buffactive['Killer Instinct'] or Circle_buff == true) and Correlation_mode == true) then
						equip(sets.Ruinator[sets.WS.index[WS_ind + (#sets.WS.index / 2)]])
					end
				end
				if spell.english == "Decimation" then
					equip(sets.Decimation[sets.WS.index[WS_ind]])
					if ((buffactive['Killer Instinct'] or Circle_buff == true) and Correlation_mode == true) then
						equip(sets.Decimation[sets.WS.index[WS_ind + (#sets.WS.index / 2)]])
					end
				end
				if spell.english == "Rampage" then
					equip(sets.Rampage[sets.WS.index[WS_ind]])
					if ((buffactive['Killer Instinct'] or Circle_buff == true) and Correlation_mode == true) then
						equip(sets.Rampage[sets.WS.index[WS_ind + (#sets.WS.index / 2)]])
					end
				end
				if spell.english == "Onslaught" then
					equip(sets.Onslaught[sets.WS.index[WS_ind]])
					if ((buffactive['Killer Instinct'] or Circle_buff == true) and Correlation_mode == true) then
						equip(sets.Onslaught[sets.WS.index[WS_ind + (#sets.WS.index / 2)]])
					end
				end
				if spell.english == "Primal Rend" then
					equip(sets.PrimalRend[sets.WS.index[WS_ind]])
					if ((buffactive['Killer Instinct'] or Circle_buff == true) and Correlation_mode == true) then
						equip(sets.PrimalRend[sets.WS.index[WS_ind + (#sets.WS.index / 2)]])
					end
					if world.day_element == "Light" or world.weather_element == "Light" then
						equip(sets.obi)
					end
				end
				if spell.english == "Cloudsplitter" then
					equip(sets.Cloudsplitter[sets.WS.index[WS_ind]])
					if ((buffactive['Killer Instinct'] or Circle_buff == true) and Correlation_mode == true) then
						equip(sets.Cloudsplitter[sets.WS.index[WS_ind + (#sets.WS.index / 2)]])
					end
					if world.day_element == "Thunder" or world.weather_element == "Thunder" then
						equip(sets.obi)
					end
				end
				--Sword
				if spell.english == "Savage Blade" then
					equip(sets.SavageBlade[sets.WS.index[WS_ind]])
					if ((buffactive['Killer Instinct'] or Circle_buff == true) and Correlation_mode == true) then
						equip(sets.SavageBlade[sets.WS.index[WS_ind + (#sets.WS.index / 2)]])
					end
				end
				if spell.english == "Sanguine Blade" then
					equip(sets.SanguineBlade[sets.WS.index[WS_ind]])
					if ((buffactive['Killer Instinct'] or Circle_buff == true) and Correlation_mode == true) then
						equip(sets.SanguineBlade[sets.WS.index[WS_ind + (#sets.WS.index / 2)]])
					end
					if world.day_element == "Dark" or world.weather_element == "Dark" then
						equip(sets.obi)
					end
				end
				if spell.english == "Seraph Blade" then
					equip(sets.SeraphBlade[sets.WS.index[WS_ind]])
					if ((buffactive['Killer Instinct'] or Circle_buff == true) and Correlation_mode == true) then
						equip(sets.SeraphBlade[sets.WS.index[WS_ind + (#sets.WS.index / 2)]])
					end
					if world.day_element == "Light" or world.weather_element == "Light" then
						equip(sets.obi)
					end
				end
				if spell.english == "Shining Blade" then
					equip(sets.ShiningBlade[sets.WS.index[WS_ind]])
					if ((buffactive['Killer Instinct'] or Circle_buff == true) and Correlation_mode == true) then
						equip(sets.ShiningBlade[sets.WS.index[WS_ind + (#sets.WS.index / 2)]])
					end
					if world.day_element == "Light" or world.weather_element == "Light" then
						equip(sets.obi)
					end
				end
				if spell.english == "Red Lotus Blade" then
					equip(sets.RedLotusBlade[sets.WS.index[WS_ind]])
					if ((buffactive['Killer Instinct'] or Circle_buff == true) and Correlation_mode == true) then
						equip(sets.RedLotusBlade[sets.WS.index[WS_ind + (#sets.WS.index / 2)]])
					end
					if world.day_element == "Fire" or world.weather_element == "Fire" then
						equip(sets.obi)
					end
				end
				if spell.english == "Burning Blade" then
					equip(sets.BurningBlade[sets.WS.index[WS_ind]])
					if ((buffactive['Killer Instinct'] or Circle_buff == true) and Correlation_mode == true) then
						equip(sets.BurningBlade[sets.WS.index[WS_ind + (#sets.WS.index / 2)]])
					end
					if world.day_element == "Fire" or world.weather_element == "Fire" then
						equip(sets.obi)
					end
				end
				--Club
				if spell.english == "True Strike" then
					equip(sets.TrueStrike[sets.WS.index[WS_ind]])
					if ((buffactive['Killer Instinct'] or Circle_buff == true) and Correlation_mode == true) then
						equip(sets.TrueStrike[sets.WS.index[WS_ind + (#sets.WS.index / 2)]])
					end
				end
				--Dagger
				if spell.english == "Evisceration" then
					equip(sets.Evisceration[sets.WS.index[WS_ind]])
					if ((buffactive['Killer Instinct'] or Circle_buff == true) and Correlation_mode == true) then
						equip(sets.Evisceration[sets.WS.index[WS_ind + (#sets.WS.index / 2)]])
					end
				end
				if spell.english == "Aeolian Edge" then
					equip(sets.AeolianEdge[sets.WS.index[WS_ind]])
					if ((buffactive['Killer Instinct'] or Circle_buff == true) and Correlation_mode == true) then
						equip(sets.AeolianEdge[sets.WS.index[WS_ind + (#sets.WS.index / 2)]])
					end
					if world.day_element == "Wind" or world.weather_element == "Wind" then
						equip(sets.obi)
					end
				end
				--Scythe
				if spell.english == "Spiral Hell" then
					equip(sets.SpiralHell[sets.WS.index[WS_ind]])
					if ((buffactive['Killer Instinct'] or Circle_buff == true) and Correlation_mode == true) then
						equip(sets.SpiralHell[sets.WS.index[WS_ind + (#sets.WS.index / 2)]])
					end
				end
				if spell.english == "Entropy" then
					equip(sets.Entropy[sets.WS.index[WS_ind]])
					if ((buffactive['Killer Instinct'] or Circle_buff == true) and Correlation_mode == true) then
						equip(sets.Entropy[sets.WS.index[WS_ind + (#sets.WS.index / 2)]])
					end
				end
				--Other
				if spell.english == "Fast Blade" or 
						spell.english == "Flat Blade" or 
						spell.english == "Circle Blade" or
						spell.english == "Vorpal Blade" or
						spell.english == "Wasp Sting" or
						spell.english == "Shadowstitch" or
						spell.english == "Viper Bite"
				then
					equip(sets.OtherWS[sets.WS.index[WS_ind]])
					if ((buffactive['Killer Instinct'] or Circle_buff == true) and Correlation_mode == true) then
						equip(sets.OtherWS[sets.WS.index[WS_ind + (#sets.WS.index / 2)]])
					end
				end
			else
				cancel_spell()
				send_command("@input /echo Canceled " .. spell.name .. " " .. spell.target.name .. " is Too Far")
			end
			
		end
	elseif spell.english == "Familiar" then
		equip(sets.Familiar)
	elseif spell.english == "Feral Howl" then
		equip(sets.FeralHowl)
	elseif spell.english == "Killer Instinct" then
		equip(sets.KillerInstinct)
	elseif spell.english == "Reward" then
		equip(sets.Reward)
	elseif ((spell.type == "Monster" and not spell.interrupted) or not buffactive['Unleash'] and Non_ready_pet_actions:contains(spell.english) == false) then
		if Melee_mode == true then
			equip(sets.Ready_precast)
		else
			equip(
				set_combine(
					sets.Ready_precast, 
					sets.Ready_precast_weapon
				)
			)
		end
	elseif spell.english == 'Charm' then
		if Melee_mode == true then
			equip(sets.Charm)
		else
			if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
				equip(set_combine(sets.Weapon_magic.MAcc_DW, sets.Charm))
			else
				equip(set_combine(sets.Weapon_magic.MAcc, sets.Charm))
			end
		end
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
	
	
	--Enfeebling Magic
	if Enfeebles:contains(spell.english) then
		if Melee_mode == true then
			equip(sets.MAcc)
		else
			if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
				equip(
					set_combine(
						sets.Weapon_magic.MAcc_DW, 
						sets.MAcc
					)
				)
			else
				equip(
					set_combine(
						sets.Weapon_magic.MAcc, 
						sets.MAcc
					)
				)
			end
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
					sets.Weapon_magic.Cure --for the DT
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
					sets.Weapon_magic.Cure --for the DT
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
					sets.Weapon_magic.Cure --for the DT
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
						sets.Weapon_magic.Cure --for the DT
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
						sets.Weapon_magic.Cure --for the DT
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
					sets.Weapon_magic.Cure --for the DT
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
					sets.Weapon_magic.Cure --for the DT
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

function pet_midcast(spell)
	if spell.type == "Monster" or spell.name == "Sic" then
        eventArgs.handled = true
    end
end

function aftercast(spell)
	if (spell.type == 'Monster' and not spell.interrupted) then
		--determine_pet_midcast(spell)
		if Magic_acc_ready_moves:contains(spell.english) then
			if Melee_mode == true or (buffactive['Aftermath: Lv.3'] and player.equipment.main == 'Aymur') then
				equip(sets.Ready_Macc)
			else
				if (player.sub_job == 'DNC' or player.sub_job == 'NIN') then
					equip(
						set_combine(
							sets.Ready_Macc, 
							sets.Ready_Macc_weapon_DW
						)
					)
				else
					equip(
						set_combine(
							sets.Ready_Macc, 
							sets.Ready_Macc_weapon
						)
					)
				end
			end
		end
		if Magic_atk_ready_moves:contains(spell.english) then
			if Melee_mode == true or (buffactive['Aftermath: Lv.3'] and player.equipment.main == 'Aymur') then
				equip(sets.Ready_MAB[sets.Ready_MAB.index[Ready_ind]])
			else
				if (player.sub_job == 'DNC' or player.sub_job == 'NIN') then
					equip(
						set_combine(
							sets.Ready_MAB[sets.Ready_MAB.index[Ready_ind]], 
							sets.Ready_MAB_weapon_DW
						)
					)
				else
					equip(
						set_combine(
							sets.Ready_MAB[sets.Ready_MAB.index[Ready_ind]], 
							sets.Ready_MAB_weapon
						)
					)
				end
			end
		end
		if Physical_ready_moves:contains(spell.english) then
			if TP_based_ready_moves:contains(spell.english) then
				if Melee_mode == true or (buffactive['Aftermath: Lv.3'] and player.equipment.main == 'Aymur') then
					equip(sets.Ready_Phys[sets.Ready_Phys.index[Ready_ind]])
				else
					if (player.sub_job == 'DNC' or player.sub_job == 'NIN') then
						equip(
							set_combine(
								sets.Ready_Phys[sets.Ready_Phys.index[Ready_ind]], 
								sets.Ready_Phys_weapon_DW
							)
						)
					else
						equip(
							set_combine(
								sets.Ready_Phys[sets.Ready_Phys.index[Ready_ind]], 
								sets.Ready_Phys_weapon
							)
						)
					end
				end
			end
			if Multi_hit_ready_moves:contains(spell.english) then
				if TP_based_ready_moves:contains(spell.english) then
					if Melee_mode == true or (buffactive['Aftermath: Lv.3'] and player.equipment.main == 'Aymur') then
						equip(sets.Ready_Multiattack[sets.Ready_Multiattack.index[Ready_ind]])
					else
						if (player.sub_job == 'DNC' or player.sub_job == 'NIN') then
							equip(
								set_combine(
									sets.Ready_Multiattack[sets.Ready_Multiattack.index[Ready_ind]],
									sets.Ready_Phys_weapon_DW
								)
							)
						else
							equip(
								set_combine(
									sets.Ready_Multiattack[sets.Ready_Multiattack.index[Ready_ind]], 
									sets.Ready_Phys_weapon
								)
							)
						end
					end
				end
			end
		end
		if Pet_buff_moves:contains(spell.english) then
			if Melee_mode == true or (buffactive['Aftermath: Lv.3'] and player.equipment.main == 'Aymur') then
				equip(sets.Ready_Buffs)
			else
				equip(
					set_combine(
						sets.Ready_Buffs, 
						sets.Ready_Buffs_weapon
					)
				)
			end
		end
		-- Ensures you arent using Pet TP Bonus equipment when you dont need it
		if buffactive['Unleash'] then
			if (Physical_ready_moves:contains(spell.english) or
			pet.tp > 2400 or
			(player.equipment.main == 'Aymur' and pet.tp > 1400)) then
				equip(sets.Unleash_hands_phys)
			else
				equip(sets.Unleash_hands_magic)
			end
		end
		if Correlation_mode == true then
			equip(sets.Correlation)
		end
	else
		determine_haste_sets()
	end
end

function pet_aftercast(spell)
	determine_haste_sets()
end

function status_change(new, old)
	if new ~= 'Engaged' then
		determine_haste_sets()
	else
		determine_haste_sets()
	end
end

function pet_status_change(new, old)
	if (pet.isvalid and new ~= 'Engaged') then
		determine_haste_sets()
	else
		determine_haste_sets()
	end
end

function pet_change(pet, gain)
	if gain then
		determine_haste_sets()
	else
		determine_haste_sets()
	end
	pet_info_update()
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
		send_command("unbind @f8")
		send_command("@input /echo SJ is non-DW")
	end
	determine_equip_set()
end

function determine_equip_set()
	if player.status ~= 'Engaged' then -- player is not engaged
		if Melee_mode == true then -- melee mode
			melee_mode_idle_set()
		else -- pet mode idle
			if pet.isvalid then
				if pet.status == 'Engaged' then -- if pet is engaged and player is not
					engaged_set() -- will pull a pet set based on parameters
				else -- if both idle
					pet_mode_idle_set()
				end
			else -- if no pet, then might as well be in melee idle
				melee_mode_idle_set()
			end
		end
	else 
		engaged_set()
	end
end

function melee_mode_idle_set()
	if player.equipment.main == 'Pangu' then
		if SJ_ind == 1 then -- not DW
			equip(sets.Idle_melee_SW_pangu[sets.Idle_melee_SW_pangu.index[Idle_ind]])
		else
			equip(sets.Idle_melee_DW_pangu[sets.Idle_melee_DW_pangu.index[Idle_ind]])
		end
	else
		if SJ_ind == 1 then -- not DW
			equip(sets.Idle_melee_SW[sets.Idle_melee_SW.index[Idle_ind]])
		else
			equip(sets.Idle_melee_DW[sets.Idle_melee_DW.index[Idle_ind]])
		end
	end
	equip(
		set_combine(
			sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]],
			sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
		)
	)
end


function pet_mode_idle_set()
	if player.equipment.main == 'Pangu' then
		equip(sets.Idle_pet_pangu[sets.Idle_pet_pangu.index[Idle_pet_ind]])
	else
		equip(sets.Idle_pet[sets.Idle_pet.index[Idle_pet_ind]])
	end
	if Correlation_mode == true then
		equip(sets.Correlation)
	end
	equip(
		set_combine(			
			sets.Weapon_pet[sets.Weapon_pet.index[Wp_ind]],
			sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
		)
	)
end


function engaged_set()
	if Melee_mode == true then
		if (buffactive['Aftermath: Lv.3'] and player.equipment.main == 'Aymur') then
			equip(	
				set_combine(
					sets.AM3[sets.AM3.index[TP_ind]][sets.SJ.index[SJ_ind]],
					sets.AM3[sets.AM3.index[TP_ind]][sets.SJ.index[SJ_ind]]["Haste_"..hasteVal],
					sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]],
					sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
				)
			)
		else
			equip(	
				set_combine(
					sets.TP[sets.TP.index[TP_ind]][sets.SJ.index[SJ_ind]],
					sets.TP[sets.TP.index[TP_ind]][sets.SJ.index[SJ_ind]]["Haste_"..hasteVal],
					sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]],
					sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
				)
			)
		end
	else -- pet mode engaged sets (if pet is active)
		if pet.isvalid then
			equip(	
				set_combine(
					sets.Pet[sets.Pet.index[Pet_ind]][sets.SJ.index[SJ_ind]],
					sets.Pet[sets.Pet.index[Pet_ind]][sets.SJ.index[SJ_ind]]["Haste_"..hasteVal],
					sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]],
					sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
				)
			)
			if Correlation_mode == true then
				equip(sets.Correlation)
			end
		else -- if pet is not active (no need for pet sets)
			if (buffactive['Aftermath: Lv.3'] and player.equipment.main == 'Aymur') then
				equip(	
					set_combine(
						sets.AM3[sets.AM3.index[TP_ind]][sets.SJ.index[SJ_ind]],
						sets.AM3[sets.AM3.index[TP_ind]][sets.SJ.index[SJ_ind]]["Haste_"..hasteVal],
						sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]],
						sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
					)
				)
			else
				equip(	
					set_combine(
						sets.TP[sets.TP.index[TP_ind]][sets.SJ.index[SJ_ind]],
						sets.TP[sets.TP.index[TP_ind]][sets.SJ.index[SJ_ind]]["Haste_"..hasteVal],
						sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]],
						sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
					)
				)
			end
		end
	end
end

function jug_downgrade(Jug)
	--if HQ change to NQ
	if Jug == 'Viscous Broth' then Jug = 'Swirling Broth' end
	if Jug == 'Fermented Broth' then Jug = 'Shimmering Broth' end
	if Jug == 'Bubbly Broth' then Jug = 'Spicy Broth' end
	if Jug == 'Viscous Broth' then Jug = 'Swirling Broth' end
	if Jug == 'Windy Greens' then Jug = 'Salubrious Broth' end
	if Jug == 'Bug-ridden Broth' then Jug = 'Electrified Broth' end
	if Jug == 'Tantalizing Broth' then Jug = 'Fizzy Broth' end
	if Jug == 'Glazed Broth' then Jug = 'Sugary Broth' end
	if Jug == 'Slimy Webbing' then Jug = 'Sticky Webbing' end
	if Jug == 'Deepwater Broth' then Jug = 'Insipid Broth' end
	if Jug == 'Venomous Broth' then Jug = 'Poisonous Broth' end
	if Jug == 'Heavenly Broth' then Jug = 'Wetlands Broth' end
	if Jug == 'T. Pristine Sap' then Jug = 'Pristine Sap' end
	if Jug == 'Pungent Broth' then Jug = 'Rancid Broth' end
	if Jug == 'Gassy Sap' then Jug = 'Zestful Sap' end
	if Jug == 'Spumante Broth' then Jug = 'Frizzante Broth' end
	if Jug == 'Feculent Broth' then Jug = 'Turpid Broth' end
	if Jug == 'Putrescent Broth' then Jug = 'Decaying Broth' end
	
	
	--Resend CB
	send_command('@input /echo Downgraded to '..Jug..'; wait 0.12; @input /ja "Call Beast" <me>')
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
			Pet_ind = Pet_ind + 1
			if Pet_ind > #sets.Pet.index then
				Pet_ind = 1
			end
			send_command("@input /echo <----- Pet TP Set changed to " .. sets.Pet.index[Pet_ind] .. " ----->")
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
			Pet_ind = Pet_ind - 1
			if Pet_ind < 1 then
				Pet_ind = #sets.Pet.index
			end
			send_command("@input /echo <----- Pet TP Set changed to " .. sets.Pet.index[Pet_ind] .. " ----->")
		end
		determine_haste_sets()
	elseif command == "toggle WS set" then
		WS_ind = WS_ind + 1
		if WS_ind > (#sets.WS.index / 2) then
			WS_ind = 1
		end
		send_command("@input /echo <----- WS Set changed to " .. sets.WS.index[WS_ind] .. " ----->")
		determine_haste_sets()
	elseif command == "toggle WS set reverse" then
		WS_ind = WS_ind - 1
		if WS_ind < 1 then
			WS_ind = (#sets.WS.index / 2)
		end
		send_command("@input /echo <----- WS Set changed to " .. sets.WS.index[WS_ind] .. " ----->")
		determine_haste_sets()	
	elseif command == "toggle Weapon set" then
		if Melee_mode == true then
			Wm_ind = Wm_ind + 1
			if Wm_ind > #sets.Weapon_melee.index then
				Wm_ind = 1
			end
			send_command("@input /echo <----- Melee weapon changed to " .. sets.Weapon_melee.index[Wm_ind] .. " ----->")
		else
			Wp_ind = Wp_ind + 1
			if Wp_ind > #sets.Weapon_pet.index then
				Wp_ind = 1
			end
			send_command("@input /echo <----- Pet weapon changed to " .. sets.Weapon_pet.index[Wp_ind] .. " ----->")
		end
		determine_haste_sets()
	elseif command == "toggle Weapon set reverse" then
		if Melee_mode == true then
			Wm_ind = Wm_ind - 1
			if Wm_ind < 1 then
				Wm_ind = #sets.Weapon_melee.index
			end
			send_command("@input /echo <----- Melee weapon changed to " .. sets.Weapon_melee.index[Wm_ind] .. " ----->")
		else
			Wp_ind = Wp_ind - 1
			if Wp_ind < 1 then
				Wp_ind = #sets.Weapon_pet.index
			end
			send_command("@input /echo <----- Pet weapon changed to " .. sets.Weapon_pet.index[Wp_ind] .. " ----->")
		end
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
	elseif command == "toggle Pet set only" then
			Idle_pet_ind = Idle_pet_ind + 1
			if Idle_pet_ind > #sets.Idle_pet.index then
				Idle_pet_ind = 1
			end
			send_command("@input /echo <----- Pet Idle Set changed to " .. sets.Idle_pet.index[Idle_pet_ind] .. " ----->")
			if Melee_mode == false then
				determine_haste_sets()
			end
	elseif command == "toggle Pet set only reverse" then
			Idle_pet_ind = Idle_pet_ind - 1
			if Idle_pet_ind < 1 then
				Idle_pet_ind = #sets.Idle_pet.index
			end
			send_command("@input /echo <----- Pet Idle Set changed to " .. sets.Idle_pet.index[Idle_pet_ind] .. " ----->")
			if Melee_mode == false then
				determine_haste_sets()
			end	
	elseif command == "toggle Ready set" then
		Ready_ind = Ready_ind + 1
		if Ready_ind > #sets.Ready_Phys.index then
			Ready_ind = 1
		end
		send_command("@input /echo <----- Ready Set changed to " .. sets.Ready_Phys.index[Ready_ind] .. " ----->")
	elseif command == "toggle Ready set reverse" then
		Ready_ind = Ready_ind - 1
		if Ready_ind < 1 then
			Ready_ind = #sets.Ready_Phys.index
		end
		send_command("@input /echo <----- Ready Set changed to " .. sets.Ready_Phys.index[Ready_ind] .. " ----->")	
	elseif command == "toggle Idle set" then
		if Melee_mode == true then
			Idle_ind = Idle_ind + 1
			if Idle_ind > #sets.Idle_melee_DW.index then
				Idle_ind = 1
			end
			send_command("@input /echo <----- Idle Set changed to " .. sets.Idle_melee_DW.index[Idle_ind] .. " ----->")
		else
			Idle_pet_ind = Idle_pet_ind + 1
			if Idle_pet_ind > #sets.Idle_pet.index then
				Idle_pet_ind = 1
			end
			send_command("@input /echo <----- Pet Idle Set changed to " .. sets.Idle_pet.index[Idle_pet_ind] .. " ----->")
		end
		determine_haste_sets()
	elseif command == "toggle Idle set reverse" then
		if Melee_mode == true then
			Idle_ind = Idle_ind - 1
			if Idle_melee_DW < 1 then
				Idle_ind = #sets.Idle_melee_DW.index
			end
			send_command("@input /echo <----- Idle Set changed to " .. sets.Idle_melee_DW.index[Idle_ind] .. " ----->")
		else
			Idle_pet_ind = Idle_pet_ind - 1
			if Idle_pet_ind < 1 then
				Idle_pet_ind = #sets.Idle_pet.index
			end
			send_command("@input /echo <----- Pet Idle Set changed to " .. sets.Idle_pet.index[Idle_pet_ind] .. " ----->")
		end
		determine_haste_sets()
	elseif command == "toggle Melee Mode" then
		if Melee_mode == false then
			Melee_mode = true
			send_command("@input /echo <----- Melee Mode ----->")
		else
			Melee_mode = false
			send_command("@input /echo <----- Pet Mode ----->")
		end
		determine_haste_sets()
	elseif command == "toggle Correlation Mode" then
		if Correlation_mode == false then
			Correlation_mode = true
			send_command("@input /echo <----- Correlation Mode: ON ----->")
		else
			Correlation_mode = false
			send_command("@input /echo <----- Correlation Mode: OFF ----->")
		end
		determine_haste_sets()
	elseif command == "toggle Jug Lock" then
		if Jug_lock == true then
			Jug_lock = false
			send_command("@input /echo <----- Warning: All Jugs will be consumed on use (HQ jugs included) ----->")
		else
			Jug_lock = true
			send_command("@input /echo <----- Warning: HQ Jugs will be downgraded to NQ on use (Cancelled if not available) ----->")
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
	if Jugs:contains(command) then
		Jug=tostring(command)
		send_command('@input /echo Current Jug: '..Jug)
	end
	if (command == 'Ready one' or 
		command == 'Ready two' or 
		command == 'Ready three' or 
		command == 'Ready four' or 
		command == 'Ready five' or
		command == 'Ready six' or
		command == 'Ready seven') then
		
		local move = command[2]:lower()
		local ReadyMove = ''
		if move == 'one' then
			ReadyMove = Ready_move_one
		elseif move == 'two' then
			ReadyMove = Ready_move_two
		elseif move == 'three' then
			ReadyMove = Ready_move_three
		elseif move == 'four' then
			ReadyMove = Ready_move_four	
		elseif move == 'five' then
			ReadyMove = Ready_move_five
		elseif move == 'six' then
			ReadyMove = Ready_move_six			
		else
			ReadyMove = Ready_move_seven
		end
		if ReadyMove == 'None' then
			send_command('@input /echo Ready does not exist. List of ready moves: ; wait 0.12; @input /echo Ready1: '..Ready_move_one..' | Ready2: '..Ready_move_two..' | Ready3: '..Ready_move_three..' | Ready4: '..Ready_move_four..' | Ready5: '..Ready_move_five..' | Ready6: '..Ready_move_six..' | Ready7: '..Ready_move_seven)
		else
			send_command('@input /pet "'.. ReadyMove ..'" <me>')
		end
	end
	if command == 'PetInfo' then
		send_command('@input /echo Ready1: '..Ready_move_one..' | Ready2: '..Ready_move_two..' | Ready3: '..Ready_move_three..' | Ready4: '..Ready_move_four..' | Ready5: '..Ready_move_five..' | Ready6: '..Ready_move_six..' | Ready7: '..Ready_move_seven)
	end
	if command == 'Normal sets' then
		if Melee_mode == true then -- melee mode
			if player.equipment.main == 'Pangu' then
				if SJ_ind == 1 then -- not DW
					equip(sets.Idle_melee_SW_pangu[sets.Idle_melee_SW_pangu.index[Idle_ind]])
				else
					equip(sets.Idle_melee_DW_pangu[sets.Idle_melee_DW_pangu.index[Idle_ind]])
				end
			else
				if SJ_ind == 1 then -- not DW
					equip(sets.Idle_melee_SW[sets.Idle_melee_SW.index[Idle_ind]])
				else
					equip(sets.Idle_melee_DW[sets.Idle_melee_DW.index[Idle_ind]])
				end
			end
			equip(
				set_combine(
					sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]],
					sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
				)
			)
		else -- pet mode idle
			if pet.isvalid then
				if pet.status == 'Engaged' then -- if pet is engaged and player is not
					if Melee_mode == true then
						if (buffactive['Aftermath: Lv.3'] and player.equipment.main == 'Aymur') then
							equip(	
								set_combine(
									sets.AM3[sets.AM3.index[TP_ind]][sets.SJ.index[SJ_ind]],
									sets.AM3[sets.AM3.index[TP_ind]][sets.SJ.index[SJ_ind]]["Haste_"..hasteVal],
									sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]],
									sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
								)
							)
						else
							equip(	
								set_combine(
									sets.TP[sets.TP.index[TP_ind]][sets.SJ.index[SJ_ind]],
									sets.TP[sets.TP.index[TP_ind]][sets.SJ.index[SJ_ind]]["Haste_"..hasteVal],
									sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]],
									sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
								)
							)
						end
					else -- pet mode engaged sets (if pet is active)
						if pet.isvalid then
							equip(	
								set_combine(
									sets.Pet[sets.Pet.index[TP_ind]][sets.SJ.index[SJ_ind]],
									sets.Pet[sets.Pet.index[TP_ind]][sets.SJ.index[SJ_ind]]["Haste_"..hasteVal],
									sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]],
									sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
								)
							)
							if Correlation_mode == true then
								equip(sets.Correlation)
							end
						else -- if pet is not active (no need for pet sets)
							if (buffactive['Aftermath: Lv.3'] and player.equipment.main == 'Aymur') then
								equip(	
									set_combine(
										sets.AM3[sets.AM3.index[TP_ind]][sets.SJ.index[SJ_ind]],
										sets.AM3[sets.AM3.index[TP_ind]][sets.SJ.index[SJ_ind]]["Haste_"..hasteVal],
										sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]],
										sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
									)
								)
							else
								equip(	
									set_combine(
										sets.TP[sets.TP.index[TP_ind]][sets.SJ.index[SJ_ind]],
										sets.TP[sets.TP.index[TP_ind]][sets.SJ.index[SJ_ind]]["Haste_"..hasteVal],
										sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]],
										sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
									)
								)
							end
						end
					end
				else -- if both idle
					if player.equipment.main == 'Pangu' then
						equip(
							set_combine(			
								sets.Idle_pet_pangu[sets.Idle_pet_pangu.index[Idle_pet_ind]],
								sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
							)
						)
					else
						equip(
							set_combine(			
								sets.Idle_pet[sets.Idle_pet.index[Idle_pet_ind]],
								sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
							)
						)
					end
					if Correlation_mode == true then
						equip(sets.Correlation)
					end
				end
			else -- if no pet, then might as well be in melee idle
				if player.equipment.main == 'Pangu' then
				if SJ_ind == 1 then -- not DW
					equip(sets.Idle_melee_SW_pangu[sets.Idle_melee_SW_pangu.index[Idle_ind]])
				else
					equip(sets.Idle_melee_DW_pangu[sets.Idle_melee_DW_pangu.index[Idle_ind]])
				end
			else
				if SJ_ind == 1 then -- not DW
					equip(sets.Idle_melee_SW[sets.Idle_melee_SW.index[Idle_ind]])
				else
					equip(sets.Idle_melee_DW[sets.Idle_melee_DW.index[Idle_ind]])
				end
			end
			equip(
				set_combine(
					sets.Weapon_melee[sets.Weapon_melee.index[Wm_ind]],
					sets.DW_mode[sets.DW_mode.index[DW_mode_ind]]
				)
			)
			end
		end
	end
end

function pet_info_update()
    if pet.isvalid then

        if pet.name == 'DroopyDortwin' or pet.name == 'PonderingPeter' or pet.name == 'HareFamiliar' or pet.name == 'KeenearedSteffi' then
            Ready_move_one = 'Foot Kick';Ready_move_two = 'Whirl Claws';Ready_move_three = 'Wild Carrot';Ready_move_four = 'Dust Cloud';Ready_move_five = 'None';Ready_move_six = 'None';Ready_move_seven = 'None'
        elseif pet.name == 'LuckyLulush' then
            Ready_move_one = 'Foot Kick';Ready_move_two = 'Whirl Claws';Ready_move_three = 'Wild Carrot';Ready_move_four = 'Snow Cloud';Ready_move_five = 'None';Ready_move_six = 'None';Ready_move_seven = 'None'
        elseif pet.name == 'SunburstMalfik' or pet.name == 'AgedAngus' or pet.name == 'HeraldHenry' or pet.name == 'CrabFamiliar' or pet.name == 'CourierCarrie' then
            Ready_move_one = 'Bubble Shower';Ready_move_two = 'Bubble Curtain';Ready_move_three = 'Big Scissors';Ready_move_four = 'Scissor Guard'; Ready_move_five = 'Metallic Body'; Ready_move_six = 'None';Ready_move_seven = 'None'
        elseif pet.name == 'P.CrabFamiliar' or pet.name == 'JovialEdwin' then
            Ready_move_one = 'Bubble Curtain';Ready_move_two = 'Scissor Guard';Ready_move_three = 'Metallic Body';Ready_move_four = 'Venom Shower'; Ready_move_five = 'Mega Scissors'; Ready_move_six = 'None';Ready_move_seven = 'None'
        elseif pet.name == 'WarlikePatrick' or pet.name == 'LizardFamiliar' or pet.name == 'ColdbloodComo' or pet.name == 'AudaciousAnna' then
            Ready_move_one = 'Tail Blow';Ready_move_two = 'Fireball';Ready_move_three = 'Blockhead';Ready_move_four = 'Brain Crush';Ready_move_five = 'Infrasonics';Ready_move_six = 'Secretion';Ready_move_seven = 'None'
        elseif pet.name == 'ScissorlegXerin' or pet.name == 'BouncingBertha' then
            Ready_move_one = 'Sensilla Blades';Ready_move_two = 'Tegmina Buffet';Ready_move_three = 'None';Ready_move_four = 'None';Ready_move_five = 'None';Ready_move_six = 'None';Ready_move_seven = 'None'
        elseif pet.name == 'RhymingShizuna' or pet.name == 'SheepFamiliar' or pet.name == 'LullabyMelodia' or pet.name == 'NurseryNazuna' then
            Ready_move_one = 'Lamb Chop';Ready_move_two = 'Rage';Ready_move_three = 'Sheep Charge';Ready_move_four = 'Sheep Song';Ready_move_five = 'None';Ready_move_six = 'None';Ready_move_seven = 'None'
        elseif pet.name == 'AttentiveIbuki' or pet.name == 'SwoopingZhivago' then
            Ready_move_one = 'Swooping Frenzy';Ready_move_two = 'Pentapeck';Ready_move_three = 'Molting Plumage';Ready_move_four = 'None';Ready_move_five = 'None';Ready_move_six = 'None';Ready_move_seven = 'None'
        elseif pet.name == 'AmiableRoche' or pet.name == 'TurbidToloi' then
            Ready_move_one = 'Intimidate';Ready_move_two = 'Recoil Dive';Ready_move_three = 'Water Wall';Ready_move_four = 'None';Ready_move_five = 'None';Ready_move_six = 'None';Ready_move_seven = 'None'
        elseif pet.name == 'BrainyWaluis' or pet.name == 'FunguarFamiliar' or pet.name == 'DiscreetLouise' then
            Ready_move_one = 'Frogkick';Ready_move_two = 'Spore';Ready_move_three = 'Queasyshroom';Ready_move_four = 'Numbshroom';Ready_move_five = 'Shakeshroom';Ready_move_six = 'Silence Gas';Ready_move_seven='Dark Spore'
        elseif pet.name == 'HeadbreakerKen' or pet.name == 'MayflyFamiliar' or pet.name == 'ShellbusterOrob' or pet.name == 'MailbusterCetas' then
           Ready_move_one = 'Cursed Sphere';Ready_move_two = 'Venom';Ready_move_three = 'Somersault';Ready_move_four = 'None';Ready_move_five = 'None';Ready_move_six = 'None';Ready_move_seven = 'None'
        elseif pet.name == 'RedolentCandi' or pet.name == 'AlluringHoney' then
            Ready_move_one = 'Tickling Tendrils';Ready_move_two = 'Stink Bomb';Ready_move_three = 'Nectarous Deluge';Ready_move_four = 'Nepenthic Plunge';Ready_move_five = 'None';Ready_move_six = 'None';Ready_move_seven = 'None'
        elseif pet.name == 'CaringKiyomaro' or pet.name == 'VivaciousVickie' then
            Ready_move_one = 'Sweeping Gouge';Ready_move_two = 'Zealous Snort';Ready_move_three = 'None';Ready_move_four = 'None';Ready_move_five = 'None';Ready_move_six = 'None';Ready_move_seven = 'None'
        elseif pet.name == 'HurlerPercival' or pet.name == 'BeetleFamiliar' or pet.name == 'PanzerGalahad' then
            Ready_move_one = 'Power Attack';Ready_move_two = 'Hi-Freq Field';Ready_move_three = 'Rhino Attack';Ready_move_four = 'Rhino Guard';Ready_move_five = 'Spoil';Ready_move_six = 'None';Ready_move_seven = 'None'
        elseif pet.name == 'Y.BeetleFamilia' or pet.name == 'EnergizedSefina' then
            Ready_move_one = 'Power Attack';Ready_move_two = 'Hi-Freq Field';Ready_move_three = 'Rhino Attack';Ready_move_four = 'Rhino Guard';Ready_move_five = 'Spoil';Ready_move_six = 'Rhinowrecker';Ready_move_seven = 'None'
        elseif pet.name == 'BlackbeardRandy' or pet.name == 'TigerFamiliar' or pet.name == 'SaberSiravarde' or pet.name == 'GorefangHobs' then
            Ready_move_one = 'Roar';Ready_move_two = 'Razor Fang';Ready_move_three = 'Claw Cyclone';Ready_move_four = 'Crossthrash';Ready_move_five = 'Predatory Glare';Ready_move_six = 'None';Ready_move_seven = 'None'
        elseif pet.name == 'ColibriFamiliar' or pet.name == 'ChoralLeera' then
            Ready_move_one = 'Pecking Flurry';Ready_move_two = 'None';Ready_move_three = 'None';Ready_move_four = 'None';Ready_move_five = 'None';Ready_move_six = 'None';Ready_move_seven = 'None'
        elseif pet.name == 'SpiderFamiliar' or pet.name == 'GussyHachirobe' then
            Ready_move_one = 'Sickle Slash';Ready_move_two = 'Acid Spray';Ready_move_three = 'Spider Web';Ready_move_four = 'None';Ready_move_five = 'None';Ready_move_six = 'None';Ready_move_seven = 'None'
        elseif pet.name == 'GenerousArthur' or pet.name == 'GooeyGerard' then
            Ready_move_one = 'Purulent Ooze';Ready_move_two = 'Corrosive Ooze';Ready_move_three = 'None';Ready_move_four = 'None';Ready_move_five = 'None';Ready_move_six = 'None';Ready_move_seven = 'None'
        elseif pet.name == 'ThreestarLynn' or pet.name == 'DipperYuly' then
            Ready_move_one = 'Spiral Spin';Ready_move_two = 'Sudden Lunge';Ready_move_three = 'Noisome Powder';Ready_move_four = 'None';Ready_move_five = 'None';Ready_move_six = 'None';Ready_move_seven = 'None'
        elseif pet.name == 'SharpwitHermes' or pet.name == 'SweetCaroline' or pet.name == 'FlowerpotBill' or pet.name == 'FlowerpotBen' or pet.name == 'Homunculus' or pet.name == 'FlowerpotMerle' then
            Ready_move_one = 'Head Butt';Ready_move_two = 'Wild Oats';Ready_move_three = 'Leaf Dagger';Ready_move_four = 'Scream';Ready_move_five = 'None';Ready_move_six = 'None';Ready_move_seven = 'None'
        elseif pet.name == 'AcuexFamiliar' or pet.name == 'FluffyBredo' then
            Ready_move_one = 'Foul Waters';Ready_move_two = 'Pestilent Plume';Ready_move_three = 'None';Ready_move_four = 'None';Ready_move_five = 'None';Ready_move_six = 'None';Ready_move_seven = 'None'
        elseif pet.name == 'FlytrapFamiliar' or pet.name == 'VoraciousAudrey' or pet.name == 'PrestoJulio' then
            Ready_move_one = 'Soporific';Ready_move_two = 'Palsy Pollen';Ready_move_three = 'Gloeosuccus';Ready_move_four = 'None';Ready_move_five = 'None';Ready_move_six = 'None';Ready_move_seven = 'None'
        elseif pet.name == 'EftFamiliar' or pet.name == 'AmbusherAllie' or pet.name == 'BugeyedBroncha' or pet.name == 'SuspiciousAlice' then
            Ready_move_one = 'Nimble Snap';Ready_move_two = 'Cyclotail';Ready_move_three = 'Geist Wall';Ready_move_four = 'Numbing Noise';Ready_move_five = 'Toxic Spit';Ready_move_six = 'None';Ready_move_seven = 'None'
        elseif pet.name == 'AntlionFamiliar' or pet.name == 'ChopsueyChucky' or pet.name == 'CursedAnnabelle' then
            Ready_move_one = 'Mandibular Bite';Ready_move_two = 'Sandblast';Ready_move_three = 'Sandpit';Ready_move_four = 'Venom Spray';Ready_move_five = 'None';Ready_move_six = 'None';Ready_move_seven = 'None'
        elseif pet.name == 'MiteFamiliar' or pet.name == 'LifedrinkerLars' or pet.name == 'AnklebiterJedd' then
            Ready_move_one = 'Double Claw';Ready_move_two = 'Grapple';Ready_move_three = 'Spinning Top';Ready_move_four = 'Filamented Hold';Ready_move_five = 'None';Ready_move_six = 'None';Ready_move_seven = 'None'
        elseif pet.name == 'AmigoSabotender' then
           Ready_move_one = 'Needle Shot';Ready_move_two = '??? Needles';Ready_move_three = 'None';Ready_move_four = 'None';Ready_move_five = 'None';Ready_move_six = 'None';Ready_move_seven = 'None'
        elseif pet.name == 'CraftyClyvonne' then
            Ready_move_one = 'Blaster';Ready_move_two = 'Chaotic Eye';Ready_move_three = 'None';Ready_move_four = 'None';Ready_move_five = 'None';Ready_move_six = 'None';Ready_move_seven = 'None'
        elseif pet.name == 'BloodclawShasra' then
            Ready_move_one = 'Blaster';Ready_move_two = 'Charged Whisker';Ready_move_three = 'Chaotic Eye';Ready_move_four = 'None';Ready_move_five = 'None';Ready_move_six = 'None';Ready_move_seven = 'None'
        elseif pet.name == 'LynxFamiliar' or pet.name == 'VivaciousGaston' then
            Ready_move_one = 'Chaotic Eye';Ready_move_two = 'Blaster';Ready_move_three = 'Charged Whisker';Ready_move_four = 'Frenzied Rage';Ready_move_five = 'None';Ready_move_six = 'None';Ready_move_seven = 'None'
        elseif pet.name == 'SwiftSieghard' or pet.name == 'FleetReinhard' then
            Ready_move_one = 'Scythe Tail';Ready_move_two = 'Ripper Fang';Ready_move_three = 'Chomp Rush';Ready_move_four = 'None';Ready_move_five = 'None';Ready_move_six = 'None';Ready_move_seven = 'None'
        elseif pet.name == 'DapperMac' or pet.name == 'SurgingStorm' or pet.name == 'SubmergedIyo' then
            Ready_move_one = 'Wing Slap';Ready_move_two = 'Beak Lunge';Ready_move_three = 'None';Ready_move_four = 'None';Ready_move_five = 'None';Ready_move_six = 'None';Ready_move_seven = 'None'
        elseif pet.name == 'FatsoFargann' then
            Ready_move_one = 'Suction';Ready_move_two = 'TP Drainkiss';Ready_move_three = 'Drainkiss';Ready_move_four = 'Acid Mist';Ready_move_five = 'None';Ready_move_six = 'None';Ready_move_seven = 'None'
        elseif pet.name == 'Hip.Familiar' or pet.name == 'DaringRoland' or pet.name == 'FaithfulFalcorr' then
            Ready_move_one = 'Back Heel';Ready_move_two = 'Jettatura';Ready_move_three = 'Choke Breath';Ready_move_four = 'Fantod';Ready_move_five = 'Hoof Volley';Ready_move_six = 'Nihility Song';Ready_move_seven = 'None'
        elseif pet.name == 'CrudeRaphie' then
            Ready_move_one = 'Tortoise Stomp';Ready_move_two = 'Harden Shell';Ready_move_three = 'Aqua Breath';Ready_move_four = 'None';Ready_move_five = 'None';Ready_move_six = 'None';Ready_move_seven = 'None'
        elseif pet.name == 'MosquitoFamilia' or pet.name == 'Left-HandedYoko' then
            Ready_move_one = 'Infected Leech';Ready_move_two = 'Gloom Spray';Ready_move_three = 'None';Ready_move_four = 'None';Ready_move_five = 'None';Ready_move_six = 'None';Ready_move_seven = 'None'
        elseif pet.name == 'WeevilFamiliar' or pet.name == 'StalwartAngelin' then
            Ready_move_one = 'Disembowel';Ready_move_two = 'Extirpating Salvo';Ready_move_three = 'None';Ready_move_four = 'None';Ready_move_five = 'None';Ready_move_six = 'None';Ready_move_seven = 'None'
        elseif pet.name == 'SlimeFamiliar' or pet.name == 'SultryPatrice' then
            Ready_move_one = 'Fluid Toss';Ready_move_two = 'Fluid Spread';Ready_move_three = 'Digest';Ready_move_four = 'None';Ready_move_five = 'None';Ready_move_six = 'None';Ready_move_seven = 'None'
        end
    else
        Ready_move_one = 'None';Ready_move_two = 'None';Ready_move_three = 'None';Ready_move_four = 'None';Ready_move_five = 'None';Ready_move_six = 'None';Ready_move_seven = 'None'
    end
end
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--Detects movement and equips movement speed sets
--WIN+F12 disables
mov = { counter = 0 }
if player and player.index and windower.ffxi.get_mob_by_index(player.index) then -- get currentlyrrent location of character
	mov.x = windower.ffxi.get_mob_by_index(player.index).x
	mov.y = windower.ffxi.get_mob_by_index(player.index).y
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
			dist = math.sqrt((pl.x-mov.x)^2 + (pl.y-mov.y)^2 + (pl.z-mov.z)^2)
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
			mov.y = pl.y
			mov.z = pl.z
		end
		mov.counter = 0
	end
end)


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


function has_any_buff_of(buff_set)--returns true if you have any of the buffs given
    for i,v in pairs(buff_set) do
        if buffactive[v] ~= nil then return true end
    end
end

------------------------------------------------------------------------------
------------------------------------------------------------------------------