-- Based on Spicyryan's RUN lua
-- Reformatted for PLD use, adding PLD specific functionality and QoL changes
-- Updates preformed/maintained by Thefoxdanger of Asura
-- -- Note: If I don't know you, I probably won't fix your broken lua. Keep that in mind before trying to reach me.

-- Note: While spell interrupt toggle does work in this version,
--       there is also safety feature that locks SIR set into self 
--       cure set when below 51% hp.
--       Keeps you alive and less to fiddle with.

-- Also Note: Two of the toggles I added need to be pointed out specifically here.
--
--            Pressing WIN+S: Locks your gear from swapping during WS, nice for when
--                            you want to keep high-hp w/o the swap reducing it.
--
--                            Ex: I use this when I spam KoR for the regen/refresh AM,
--                                or when I'm opening for a SC. Toggle to 'Allow' when
--                                weapon swaps are desired.
--
--            Pressing WIN+H: Sets a higher max hp precast set for all spells except
--                            "cure cheat" when self targetting for Cures. This feature
--                            is automatically overwritten by the safety feature listed 
--                            above.
--
-- Lua now has Weapon/Sub locking and toggle functionality
--		
--			  Pressing WIN+Q cycles the default shield 
--            		Currently accepts: Aegis, Ochain, Priwen, and Srivatsa
--
--            Pressing WIN+E cycles the default sword
--            		Currently accepts: Burtgang, Excalibur, Malignance Sword, Brilliance, Sequence, Naegling
--            		Other swords will swap in during actions when weapons are not locked, 
--            		but should never be part of a tp set.
--            		If I ever get a Burtgang I'll add it to this feature.
--
--            Pressing WIN+W locks Main/Sub slots from swapping
--            		If dual-wielding for some reason, lock main/sub prior to manually 
--            		equipping offhand. If using a greatsword you are probably bad, but 
--            		weapon lock will also need to be enabled to prevent tp loss during 
--            		actions.
 
function get_sets()
    maps()
   
-- Augmented sets here

	Rudiano = {}
	Rudiano.FC = { name="Rudianos's Mantle", augments={'HP+60','"Fast Cast"+10',}}
	Rudiano.TP = { name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','HP+20','"Store TP"+10','Phys. dmg. taken-10%',}}
	Rudiano.Enmity = { name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Phys. dmg. taken-10%',}}
	Rudiano.Shield = { name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Chance of successful block +5',}}
	Rudiano.Cure = { name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Cure" potency +10%','Spell interruption rate down-10%',}}
	Rudiano.WSD = { name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	Rudiano.Counter = { name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','System: 1 ID: 640 Val: 4',}}

	OdysseanHead = {}
	OdysseanHead.Phalanx = { name="Odyssean Helm", augments={'Mag. Acc.+12','DEX+5','Phalanx +5','Mag. Acc.+1 "Mag.Atk.Bns."+1',}}
	
	OdysseanBody = {}
	OdysseanBody.FC = { name="Odyss. Chestplate", augments={'Attack+6','"Fast Cast"+5','DEX+9',}}
	OdysseanBody.Phalanx = { name="Odyss. Chestplate", augments={'"Counter"+2','Weapon skill damage +1%','Phalanx +4',}}
	
	OdysseanHands = {}
	OdysseanHands.WSD = { name="Odyssean Gauntlets", augments={'Pet: "Dbl.Atk."+2 Pet: Crit.hit rate +2','"Occult Acumen"+7','Weapon skill damage +8%','Accuracy+12 Attack+12','Mag. Acc.+15 "Mag.Atk.Bns."+15',}}
	
	OdysseanLegs = {}
	OdysseanLegs.Block = { name="Odyssean Cuisses", augments={'"Fast Cast"+1','Chance of successful block +2','"Refresh"+2','Mag. Acc.+11 "Mag.Atk.Bns."+11',}}
	OdysseanLegs.Phalanx = { name="Odyssean Cuisses", augments={'CHR+5','Crit.hit rate+1','Phalanx +4','Accuracy+14 Attack+14',}}
	
	OdysseanFeet = {}
	OdysseanFeet.SIR = { name="Odyssean Greaves", augments={'"Cure" potency +5%','Mag. Acc.+7','"Mag.Atk.Bns."+4',}}

	
	ValorousHead = {}
	ValorousHead.TP = { name="Valorous Mask", augments={'"Mag.Atk.Bns."+22','Phys. dmg. taken -3%','Quadruple Attack +2','Accuracy+17 Attack+17',}}
	
	ValorousBody = {}
	
	ValorousHands = {}
	ValorousHands.TP = { name="Valorous Mitts", augments={'Pet: "Mag.Atk.Bns."+19','MND+2','Quadruple Attack +3','Accuracy+12 Attack+12',}}
	
	ValorousLegs = {}
	ValorousLegs.TP = { name="Valorous Hose", augments={'DEX+1','"Store TP"+5','Quadruple Attack +1','Accuracy+11 Attack+11','Mag. Acc.+13 "Mag.Atk.Bns."+13',}}
	
	ValorousFeet = {}
	ValorousFeet.TP = { name="Valorous Greaves", augments={'Sklchn.dmg.+1%','Enmity+5','Quadruple Attack +3','Mag. Acc.+16 "Mag.Atk.Bns."+16',}}
	ValorousFeet.WSD = { name="Valorous Greaves", augments={'"Cure" potency +5%','Accuracy+29','Weapon skill damage +9%','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}
	ValorousFeet.Crit = { name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+4','AGI+4','Accuracy+4','Attack+13',}}

	EmichoHands = {}
	EmichoHands.TP = { name="Emicho Gauntlets", augments={'Accuracy+20','"Dual Wield"+5','Pet: Accuracy+20',}}

------End of Augmented Gear-----------------------------------------------------------------------------------------------------------------------------

-- Set Default Sword/Shield here

	--Swords--
	-- WIN+E toggles swords (Burtgang is default)
	sets.Sword = {}
	sets.Sword.index = {'Burtgang', 'Excalibur', 'Malignance', 'Sequence', 'Naegling', 'Brilliance', 'Sakpata'}
	Sword_ind = 1
	
	sets.Sword.Burtgang = {main = "Burtgang"}
	sets.Sword.Excalibur = {main = "Excalibur"}
	sets.Sword.Malignance = {main = "Malignance Sword"}
	sets.Sword.Sequence = {main = "Sequence"}
	sets.Sword.Naegling = {main = "Naegling"}
	sets.Sword.Brilliance = {main = "Brilliance"}
	sets.Sword.Sakpata = {main = "Sakpata's Sword"}

	--Shields--
	-- WIN+Q toggles shields (Aegis is default)
	sets.Shield = {}
	sets.Shield.index = {'Aegis', 'Ochain', 'Priwen', 'Srivatsa'}
	Shield_ind = 1
	
	sets.Shield.Aegis = {sub = "Aegis"}
	sets.Shield.Ochain = {sub = "Ochain"}
	sets.Shield.Priwen = {sub = "Priwen"}
	sets.Shield.Priwen = {sub = "Srivatsa"}

-- Normal sets start here	
    --Idle Sets--
    sets.Idle = {}
    sets.Idle.index = { 'PerfectSet', 'PerfectSet2', 'Priwen', 'Aegis', 'MEvaAegis', 'Ochain', 'Srivatsa', 'Kite'}
    Idle_ind = 1

	-- for Xcal(R15)/Priwen
	-- can cap block rate vs all content in game (100%)
	-- retains high MEva and HP
	-- set is intended for wave3, other Priwen set is technically better vs lower content
	sets.Idle.PerfectSet = {
		sub   = "Priwen", -- 0/0/9
		ammo  = "Staunch Tathlum +1", -- 0/0/3
        head  = "Sakpata's Helm", -- 0/0/7
        neck  = {name="Unmoving Collar +1", priority=1},
        ear1  = "Foresti Earring",
        ear2  = {name="Odnowa Earring +1", priority=2}, -- 0/2/3
        body  = {name="Sakpata's Breastplate", priority=3}, -- 0/0/10
        hands = "Souveran Handschuhs +1", -- 4/5/0
        ring1 = {name="Gelatinous Ring +1", priority=4}, -- 7/-1/0
        ring2 = {name="Eihwaz Ring", priority=5},
        back  = Rudiano.Shield, 
        waist = "Carrier's Sash",
        legs  = "Sakpata's Cuisses", -- 0/0/9
        feet  = "Reverence Leggings +3" 
    } -- 11/1/41 (+0/+24/+0 w/ShellV)

	-- alternate set allowing more useful stats
	-- 99% limits to lower end of content
	-- meant to be used with brilliance
	sets.Idle.PerfectSet2 = {
		sub   = "Srivatsa", -- 0/0/8
		ammo  = "Staunch Tathlum +1", -- 0/0/3
        head  = "Sakpata's Helm", -- 0/0/7
        neck  = {name="Unmoving Collar +1", priority=1},
        ear1  = "Foresti Earring",
        ear2  = {name="Odnowa Earring +1", priority=2}, -- 0/2/3
        body  = {name="Sakpata's Breastplate", priority=3}, -- 0/0/10
        hands = "Souveran Handschuhs +1", -- 4/5/0
        ring1 = {name="Gelatinous Ring +1", priority=4}, -- 7/-1/0
        ring2 = {name="Eihwaz Ring", priority=5},
        back  = Rudiano.Shield, 
        waist = "Carrier's Sash",
        legs  = "Sakpata's Cuisses", -- 0/0/9
        feet  = "Reverence Leggings +3" 
    } -- 11/1/41 (+0/+24/+0 w/ShellV)

	--So you want to be a Runefencer?
    sets.Idle.Priwen = {
		sub   = "Priwen", -- 0/0/9
		ammo  = "Staunch Tathlum +1", -- 0/0/3
        head  = "Sakpata's Helm", -- 0/0/7
        neck  = "Unmoving Collar +1", 
        ear1  = "Tuisto Earring",
        ear2  = "Odnowa Earring +1", -- 0/2/3
        body  = "Sakpata's Breastplate", -- 0/0/10
        hands = "Macabre Gauntlets +1", -- 4/0/0
        ring1 = "Gelatinous Ring +1", -- 7/-1/0
        ring2 = "Eihwaz Ring",
        back  = Rudiano.Shield, 
        waist = "Carrier's Sash",
        legs  = "Sakpata's Cuisses", -- 0/0/9
        feet  = "Sakpata's Leggings" -- 4/6/0
    } -- 15/7/41 (+0/+24 w/ShellV) (+673 MEva)
	
	--High HP (magic def focus)
    sets.Idle.Aegis = {
		sub   = "Aegis", -- 0/50*/0
		ammo  = "Staunch Tathlum +1", -- 0/0/3
        head  = "Sakpata's Helm", -- 0/0/7
        neck  = "Unmoving Collar +1", 
        ear1  = "Tuisto Earring",
        ear2  = "Odnowa Earring +1", -- 0/2/3
        body  = "Reverence Surcoat +3", -- 0/0/11
        hands = "Sakpata's Gauntlets", -- 0/0/8
        ring1 = "Gelatinous Ring +1", -- 7/-1/0
        ring2 = "Eihwaz Ring",
        back  = Rudiano.Counter, 
        waist = "Carrier's Sash", 
        legs  = "Sakpata's Cuisses", -- 0/0/9
        feet  = "Sakpata's Leggings" -- 0/0/6
    } -- 7/51*/47 (+0/+24 w/ShellV)
	
	-- Highest magic protection
	-- Gears for Counter to offset low block rate (30%)
	-- Brilliance or Sakpata's Sword considering DT values
    sets.Idle.MEvaAegis = {
		sub   = "Aegis", -- 0/50(II)/0
		ammo  = "Staunch Tathlum +1", -- 0/0/3
        head  = "Sakpata's Helm", -- 0/0/7
        neck  = "Unmoving Collar +1", 
        ear1  = "Tuisto Earring",
        ear2  = "Odnowa Earring +1", -- 0/2/3
        body  = "Sacro Breastplate",
        hands = "Sakpata's Gauntlets", -- 0/0/8
        ring1 = "Gelatinous Ring +1", -- 7/-1/0
        ring2 = "Moonbeam Ring", -- 0/0/4
        back  = Rudiano.Counter,
        waist = "Carrier's Sash",
        legs  = "Sakpata's Cuisses", -- 0/0/9
        feet  = "Sakpata's Leggings" -- 0/0/6
    } -- 7/51*/40 (+0/+24 w/ShellV)

	--MP Restore (phys def focus)
	--Converts 50% of Damage Taken to MP
	sets.Idle.Ochain = {
		sub   = "Ochain",
		ammo  = "Staunch Tathlum +1", -- 0/0/3
        head  = "Chevalier's Armet +1",
        neck  = "Unmoving Collar +1", 
        ear1  = "Tuisto Earring",
        ear2  = "Odnowa Earring +1", -- 0/2/3
        body  = "Sakpata's Breastplate", -- 0/0/10
        hands = "Souveran Handschuhs +1", -- 4/5/0
        ring1 = "Gelatinous Ring +1", -- 7/-1/0
        ring2 = "Moonbeam Ring", -- 0/0/4 
        back  = Rudiano.Enmity, -- 10/0/0 
        waist = "Flume Belt +1", -- 4/0/0
        legs  = "Chevalier's Cuisses +1", -- 6/0/0
        feet  = "Reverence Leggings +3"
    } -- 31/6/20 (+0/+24/+0 w/ShellV)
	
	--Collossal HP / Low MEva
	--This set should probably never be used / outdated
	sets.Idle.Srivatsa = {
		sub   = "Srivatsa", -- 0/0/8
		ammo  = "Staunch Tathlum +1", -- 0/0/3
        head  = "Souveran Schaller +1", -- 0/0/0(2)
        neck  = "Unmoving Collar +1", 
        ear1  = "Tuisto Earring",
        ear2  = "Odnowa Earring +1", -- 0/2/3
        body  = "Reverence Surcoat +3", -- 0/0/11
        hands = "Souveran Handschuhs +1", -- 4/5/0(2)
        ring1 = "Gelatinous Ring +1", -- 7/-1/0
        ring2 = "Moonbeam Ring", -- 0/0/4
        back  = "Moonbeam Cape", -- 0/0/5
        waist = "Creed Baudrier", 
        legs  = "Souveran Cuisses +1", -- 0/0/4(2)
        feet  = "Souveran Schuhs +1" -- 5/0/0(2)
    } -- 12/6/46 (+0/+24/+0 w/ShellV)	
	
	-- Lock weapon index for customized shield based on content
	-- Priwen is default to help resist bind/sleep/petrification/gravity/etc.
    sets.Idle.Kite = {
		sub   = "Priwen", -- 0/0/9
		ammo  = "Staunch Tathlum +1", -- 0/0/3
        head  = "Sakpata's Helm", -- 0/0/7
        neck  = "Unmoving Collar +1",
        ear1  = "Tuisto Earring",
		ear2  = "Odnowa Earring +1", -- 0/2/3
        body  = "Sakpata's Breastplate", -- 0/0/10
        hands = "Macabre Gauntlets +1", -- 4/0/0
        ring1 = "Gelatinous Ring +1", -- 7/-1/0
        ring2 = "Moonbeam Ring", -- 0/0/4
        back  = Rudiano.Shield,
        waist = "Carrier's Sash", 
        legs  = "Carmine Cuisses +1",
        feet  = "Sakpata's Leggings" -- 0/0/6
    } -- 11/1/42 (+0/+24 w/ShellV)

	-- Put w/e you feel like standing around in here.
	sets.Idle.Town = {
		sub   = "Priwen", -- 0/0/9
		ammo  = "Staunch Tathlum +1", -- 0/0/3
        head  = "Sakpata's Helm", -- 0/0/7
        neck  = {name="Unmoving Collar +1", priority=1},
        ear1  = "Foresti Earring",
        ear2  = {name="Odnowa Earring +1", priority=2}, -- 0/2/3
        body  = {name="Sakpata's Breastplate", priority=3}, -- 0/0/10
        hands = "Souveran Handschuhs +1", -- 4/5/0
        ring1 = {name="Gelatinous Ring +1", priority=4}, -- 7/-1/0
        ring2 = {name="Moonbeam Ring", priority=5}, -- 0/0/4
        back  = Rudiano.Shield, 
        waist = "Carrier's Sash",
        legs  = "Sakpata's Cuisses", -- 0/0/9
        feet  = "Reverence Leggings +3" 
    } -- 11/1/45 (+0/+24/+0 w/ShellV)

	-- Specific to Lilith fight due to knockback mechanics (ideally you want +6 KB reduction in gear)
	-- Can also be used in any other fight to avoid knockback while not being a fucking cheater.
	-- Old/Unused set here for reference
    sets.Idle.Lilith = {
		ammo  = "Staunch Tathlum +1", -- 0/0/2
        head  = "Volte Cap", -- 0/0/10
        neck  = "Unmoving Collar +1", 
        ear1  = "Tuisto Earring",
        ear2  = "Eabani Earring",
        body  = "Sacro Breastplate",
        hands = "Macabre Gauntlets +1", -- 4/0/0
        ring1 = "Gelatinous Ring +1", -- 7/0/0
		--ring1 = "Vocane Ring +1",
        ring2 = "Defending Ring", -- 0/0/4
        back  = Rudiano.Enmity, -- 10/0/0
		--back = "Impassive Mantle",
        waist = "Carrier's Sash",
        legs  = "Sakpata's Cuisses", -- 7/3/0
		--legs = "Dashing Subligar",
        feet  = "Sakpata's Leggings" -- 4/6/0
    } -- 29/9/26 (+0/+24 w/ShellV)
 
-------TP Sets-------------------------------------------
   
    ---------------------
    --OneHanded TP Sets--
    ---------------------

	-- Generic DD sets for lolPLDdps
	-- Not currently maintained/optimized, but they work
    sets.OneHandedTP = {}
    sets.OneHandedTP.index = { 'DualWield', 'DualWieldDT', 'CappedHaste' }
    OneHandedTP_ind = 1
    --
    sets.OneHandedTP.DualWield = {
		ammo  = "Coiste Bodhar", -- +3
        head  = "Flamma Zucchetto +2", -- +6
        neck  = "Vim Torque +1",
        ear1  = "Suppanomimi", -- +3
        ear2  = "Eabani Earring", -- +1
        body  = "Dagon Breastplate",
        hands = "Sakpata's Gauntlets",
        ring1 = "Petrov Ring", -- +5
        ring2 = "Hetairoi Ring",
        back  = Rudiano.TP, 
        waist = "Sailfi Belt +1",
        legs  = "Sakpata's Cuisses",
        feet  = "Flamma Gambieras +2" -- +6
    } -- 
	
    sets.OneHandedTP.DualWieldDT = {
		ammo  = "Coiste Bodhar", 
        head  = "Sakpata's Helm", 
        neck  = "Vim Torque +1",
        ear1  = "Suppanomimi", 
        ear2  = "Eabani Earring", 
        body  = "Sakpata's Breastplate",
        hands = "Acro Gauntlets", 
        ring1 = "Chirich Ring", 
        ring2 = "Chirich Ring", 
        back  = Rudiano.TP, 
        waist = "Sailfi Belt +1", 
        legs  = "Sakpata's Cuisses",
        feet  = "Sakpata's Leggings" 
    } -- 
   
    sets.OneHandedTP.CappedHaste = {
		ammo  = "Coiste Bodhar", 
        head  = "Sakpata's Helm",
        neck  = "Combatant's Torque", 
        ear1  = "Cessance Earring", 
        ear2  = "Brutal Earring", 
        body  = "Sakpata's Breastplate", 
        hands = "Acro Gauntlets",
        ring1 = "Chirich Ring",
        ring2 = "Chirich Ring", 
        back  = Rudiano.TP, 
        waist = "Sailfi Belt +1",
        legs  = "Sakpata's Cuisses",
        feet  = "Sakpata's Leggings" 
    } -- 
   
    ---------------------
    --TwoHanded TP Sets--
    ---------------------

	-- Retained since the RUN lua this is made from has the functionality.
	-- PLD can Torcleaver (but probably shouldn't)
	-- PLD can Shockwave for hawt utility (the sleep actually lands)
    sets.TwoHandedTP = {}
    sets.TwoHandedTP.index = { 'CappedHaste', 'AccuracyFull' }
    TwoHandedTP_ind = 1
 
    sets.TwoHandedTP.CappedHaste = {
		ammo  = "Coiste Bodhar", -- +3
        head  = "Flamma Zucchetto +2", -- +7
        neck  = "Combatant's Torque", 
        ear1  = "Telos Earring", -- +5
        ear2  = "Brutal Earring", -- +1
        body  = "Hjarrandi Breastplate", -- +10
        hands = ValorousHands.TP,
        ring1 = "Hetairoi Ring",
        ring2 = "Flamma Ring", -- +3
        back  = Rudiano.TP, -- +10
        waist = "Windbuffet Belt +1",
        legs  = ValorousLegs.TP,
        feet  = "Flamma Gambieras +2" -- +6
    } -- 45
 
    sets.TwoHandedTP.AccuracyFull = {
		ammo  = "Coiste Bodhar", -- +3
        head  = "Flamma Zucchetto +2", -- +6
        neck  = "Combatant's Torque", -- +4
        ear1  = "Telos Earring", -- +5
        ear2  = "Brutal Earring", -- +1
        body  = "Sakpata's Breastplate",
        hands = "Acro Gauntlets", -- +10
        ring1 = "Flamma Ring", -- +5
        ring2 = "Moonbeam Ring", -- +3
        back  = Rudiano.TP, -- +10
        waist = "Sailfi Belt +1",
        legs  = "Sakpata's Cuisses",
        feet  = "Flamma Gambieras +2" -- +6
    } -- 53
 
    -------------------
    --BurtAM3 TP Sets--
    -------------------

	-- Currently only activates then not in a TankingTP set (toggled by alt+F8)
	
    sets.BurtAM3 = {}
    sets.BurtAM3.index = { 'CappedHaste', 'CappedHaste', 'CappedHaste', 'CappedHaste', 'CappedHaste', 'CappedHaste', 'CappedHaste' }
    BurtAM3_ind = 1 -- In the same rule as the 2H TP Toggle so it toggles it at the same time
 
    sets.BurtAM3.CappedHaste = {
		ammo  = "Coiste Bodhar", 
        head  = ValorousHead.TP,
        neck  = "Combatant's Torque", 
        ear1  = "Telos Earring", 
        ear2  = "Dignitary's Earring", 
        body  = "Hjarrandi Breastplate", 
        hands = ValorousHands.TP,
        ring1 = "Chirich Ring",
        ring2 = "Chirich Ring", 
        back  = Rudiano.TP, 
        waist = "Sailfi Belt +1",
        legs  = ValorousLegs.TP,
        feet  = ValorousFeet.TP	
	}
   
    -------------------
    --Tanking TP Sets--
    -------------------
	
    sets.TankingTP = {}
    sets.TankingTP.index = { 'PerfectSet', 'PerfectSet2', 'Priwen', 'Aegis', 'MEvaAegis', 'Ochain', 'Srivatsa' }
    TankingTP_ind = 1

	sets.TankingTP.PerfectSet = {
		sub   = "Priwen", -- 0/0/9
		ammo  = "Staunch Tathlum +1", -- 0/0/3
        head  = "Sakpata's Helm", -- 0/0/7
        neck  = {name="Unmoving Collar +1", priority=1},
        ear1  = "Foresti Earring",
        ear2  = {name="Odnowa Earring +1", priority=2}, -- 0/2/3
        body  = {name="Sakpata's Breastplate", priority=3}, -- 0/0/10
        hands = "Souveran Handschuhs +1", -- 4/5/0
        ring1 = {name="Gelatinous Ring +1", priority=4}, -- 7/-1/0
        ring2 = {name="Eihwaz Ring", priority=5},
        back  = Rudiano.Shield, 
        waist = "Carrier's Sash",
        legs  = "Sakpata's Cuisses", -- 0/0/9
        feet  = "Reverence Leggings +3" 
    } -- 11/6/41 (+0/+24/+0 w/ShellV)

	sets.TankingTP.PerfectSet2 = {
		sub   = "Srivatsa", -- 0/0/8
		ammo  = "Staunch Tathlum +1", -- 0/0/3
        head  = "Sakpata's Helm", -- 0/0/7
        neck  = {name="Unmoving Collar +1", priority=1},
        ear1  = "Foresti Earring",
        ear2  = {name="Odnowa Earring +1", priority=2}, -- 0/2/3
        body  = {name="Sakpata's Breastplate", priority=3}, -- 0/0/10
        hands = "Souveran Handschuhs +1", -- 4/5/0
        ring1 = {name="Gelatinous Ring +1", priority=4}, -- 7/-1/0
        ring2 = {name="Eihwaz Ring", priority=5},
        back  = Rudiano.Shield, 
        waist = "Carrier's Sash",
        legs  = "Sakpata's Cuisses", -- 0/0/9
        feet  = "Reverence Leggings +3" 
    } -- 11/6/40 (+0/+24/+0 w/ShellV)
	
	--High MEva set for Priwen
    sets.TankingTP.Priwen = {
		sub   = "Priwen", -- 0/0/9
		ammo  = "Staunch Tathlum +1", -- 0/0/3
        head  = "Sakpata's Helm", -- 0/0/7
        neck  = "Unmoving Collar +1", 
        ear1  = "Tuisto Earring",
        ear2  = "Odnowa Earring +1", -- 0/2/3
        body  = "Sakpata's Breastplate", -- 0/0/10
        hands = "Macabre Gauntlets +1", -- 4/0/0
        ring1 = "Gelatinous Ring +1", -- 7/-1/0
        ring2 = "Eihwaz Ring",
        back  = Rudiano.Shield,
        waist = "Carrier's Sash",
        legs  = "Sakpata's Cuisses", -- 0/0/9
        feet  = "Sakpata's Leggings" -- 0/0/6
    } -- 11/1/47 (+0/+24 w/ShellV) (+673 MEva)
	
	--High MEva for Aegis/Ochain
    sets.TankingTP.Aegis = {
		sub   = "Aegis", -- 0/50*/0
		ammo  = "Staunch Tathlum +1", -- 0/0/3
        head  = "Sakpata's Helm", -- 0/0/7
        neck  = "Unmoving Collar +1", 
        ear1  = "Tuisto Earring",
        ear2  = "Odnowa Earring +1", -- 0/2/3
        body  = "Reverence Surcoat +3", -- 0/0/11
        hands = "Sakpata's Gauntlets", -- 0/0/8
        ring1 = "Gelatinous Ring +1", -- 7/-1/0
        ring2 = "Eihwaz Ring",
        back  = Rudiano.Counter, 
        waist = "Carrier's Sash", 
        legs  = "Sakpata's Cuisses", -- 0/0/9
        feet  = "Sakpata's Leggings" -- 0/0/6
    } -- 7/51*/47 (+0/+24 w/ShellV)

	--High MEva set for Aegis
	--Build for counter to make up for terribad block rate on Aegis
    sets.TankingTP.MEvaAegis = {
		sub   = "Aegis", -- 0/50(II)/0
		ammo  = "Staunch Tathlum +1", -- 0/0/3
        head  = "Sakpata's Helm", -- 0/0/7
        neck  = "Unmoving Collar +1", 
        ear1  = "Tuisto Earring",
        ear2  = "Odnowa Earring +1", -- 0/2/3
        body  = "Sacro Breastplate",
        hands = "Sakpata's Gauntlets", -- 0/0/8
        ring1 = "Gelatinous Ring +1", -- 7/-1/0
        ring2 = "Moonbeam Ring", -- 0/0/4
        back  = Rudiano.Counter,
        waist = "Carrier's Sash",
        legs  = "Sakpata's Cuisses", -- 0/0/9
        feet  = "Sakpata's Leggings" -- 0/0/6
    } -- 7/51*/40 (+0/+24 w/ShellV)	
   
    --Robust D / 100% Block Rate @150 / MP Restore Set
    sets.TankingTP.Ochain = {
		sub   = "Ochain",
		ammo  = "Staunch Tathlum +1", -- 0/0/3
        head  = "Chevalier's Armet +1",
        neck  = "Unmoving Collar +1", 
        ear1  = "Tuisto Earring",
        ear2  = "Odnowa Earring +1", -- 0/2/3
        body  = "Sakpata's Breastplate", -- 0/0/10
        hands = "Souveran Handschuhs +1", -- 4/5/0
        ring1 = "Gelatinous Ring +1", -- 7/-1/0
        ring2 = "Moonbeam Ring", -- 0/0/4
        back  = Rudiano.Enmity, -- 10/0/0 
        waist = "Flume Belt +1", -- 4/0/0
        legs  = "Chevalier's Cuisses +1", -- 6/0/0
        feet  = "Reverence Leggings +3"
    } -- 31/6/20 (+0/+24/+0 w/ShellV)
	
	-- 75% block rate
    sets.TankingTP.Srivatsa = {
		sub   = "Srivatsa", -- 0/0/8
		ammo  = "Staunch Tathlum +1", -- 0/0/3
        head  = "Souveran Schaller +1", -- 0/0/0(2)
        neck  = "Unmoving Collar +1", 
        ear1  = "Tuisto Earring",
        ear2  = "Odnowa Earring +1", -- 0/2/3
        body  = "Reverence Surcoat +3", -- 0/0/11
        hands = "Souveran Handschuhs +1", -- 4/5/0(2)
        ring1 = "Gelatinous Ring +1", -- 7/-1/0
        ring2 = "Moonbeam Ring", -- 0/0/4
        back  = "Moonbeam Cape", -- 0/0/5 
        waist = "Creed Baudrier", 
        legs  = "Souveran Cuisses +1", -- 0/0/4(2)
        feet  = "Souveran Schuhs +1" -- 5/0/0(2)
    } -- 12/6/46 (+0/+24/+0 w/ShellV)	

    --For Lilith fight
    sets.TankingTP.Lilith = {
		ammo  = "Staunch Tathlum +1", -- 0/0/2
        head  = "Volte Cap", -- 0/0/10
        neck  = "Unmoving Collar +1", 
        ear1  = "Tuisto Earring",
        ear2  = "Eabani Earring",
        body  = "Sacro Breastplate",
        hands = "Macabre Gauntlets +1", -- 4/0/0
        ring1 = "Gelatinous Ring +1", -- 7/0/0
		--ring1 = "Vocane Ring +1",
        ring2 = "Defending Ring", -- 0/0/4
        back  = Rudiano.Enmity, -- 10/0/0
		--back = "Impassive Mantle",
        waist = "Carrier's Sash",
        legs  = "Sakpata's Cuisses", -- 7/3/0
		--legs = "Dashing Subligar",
        feet  = "Sakpata's Leggings" -- 4/6/0
    } -- 29/9/26 (+0/+24 w/ShellV)
	
------End of TP--------------------------------------------------------------------------------------------------------------------
    --WS Sets--
    sets.WS = {}
   
    sets.Requiescat = {}
 
    sets.Requiescat.index = { 'Attack', 'Accuracy' }
    Requiescat_ind = 1
 
    sets.Requiescat.Attack = {
        ammo  = "Coiste Bodhar",
        head  = "Sakpata's Helm",
        neck  = "Fotia Gorget",
        ear1  = "Ishvara Earring",
        ear2  = "Moonshade Earring",
        body  = "Sakpata's Breastplate",
        hands = "Sakpata's Gauntlets",
        ring1 = "Regal Ring",
        ring2 = "Rufescent Ring",
        back  = Rudiano.TP,
        waist = "Fotia Belt",
        legs  = "Sakpata's Cuisses",
        feet  = "Sakpata's Leggings"
    }
 
    sets.Requiescat.Accuracy = {
        ammo  = "Coiste Bodhar",
        head  = "Sakpata's Helm",
        neck  = "Fotia Gorget",
        ear1  = "Ishvara Earring",
        ear2  = "Moonshade Earring",
        body  = "Sakpata's Breastplate",
        hands = "Sakpata's Gauntlets",
        ring1 = "Regal Ring",
        ring2 = "Rufescent Ring",
        back  = Rudiano.TP,
        waist = "Fotia Belt",
        legs  = "Sakpata's Cuisses",
        feet  = "Sakpata's Leggings"
    }
	
	sets.Atonement = {}
 
    sets.Atonement.index = { 'Attack', 'Accuracy' }
    Atonement_ind = 1
 
    sets.Atonement.Attack = {
        ammo  = "Sapience Orb",
        head  = "Souveran Schaller +1",
        neck  = "Unmoving Collar +1",
        ear1  = "Trux Earring",
        ear2  = "Moonshade Earring",
        body  = "Souveran Cuirass +1",
        hands = "Caballarius Gauntlets +3",
        ring1 = "Pernicious Ring",
		ring2 = "Eihwaz Ring",
        back  = Rudiano.Enmity,
        waist = "Fotia Belt",
        legs  = "Souveran Diechlings +1",
        feet  = "Eschite Greaves"
    }
 
    sets.Atonement.Accuracy = {
        ammo  = "Sapience Orb",
        head  = "Souveran Schaller +1",
        neck  = "Unmoving Collar +1",
        ear1  = "Trux Earring",
        ear2  = "Moonshade Earring",
        body  = "Souveran Cuirass +1",
        hands = "Caballarius Gauntlets +3",
        ring1 = "Defending Ring",
        ring2 = "Pernicious Ring",
        back  = Rudiano.Enmity,
        waist = "Fotia Belt",
        legs  = "Souveran Diechlings +1",
        feet  = "Eschite Greaves"
    }
 
	sets.CDC = {}
 
    sets.CDC.index = { 'Attack', 'Accuracy' }
    CDC_ind = 1
 
    sets.CDC.Attack = {
        ammo  = "Coiste Bodhar",
        head  = "Flamma Zucchetto +2",
        neck  = "Fotia Gorget",
        ear1  = "Mache Earring +1",
        ear2  = "Moonshade Earring",
        body  = "Hjarrandi Breastplate",
        hands = "Flamma Manopolas +2",
        ring1 = "Hetairoi Ring",
        ring2 = "Regal Ring",
        back  = Rudiano.WSD,
        waist = "Fotia Belt",
        legs  = "Lustratio Subligar +1",
        feet  = ValorousFeet.Crit
    }
 
    sets.CDC.Accuracy = {
        ammo  = "Coiste Bodhar",
        head  = "Flamma Zucchetto +2",
        neck  = "Fotia Gorget",
        ear1  = "Mache Earring +1",
        ear2  = "Moonshade Earring",
        body  = "Hjarrandi Breastplate",
        hands = "Flamma Manopolas +2",
        ring1 = "Hetairoi Ring",
        ring2 = "Regal Ring",
        back  = Rudiano.WSD,
        waist = "Fotia Belt",
        legs  = "Lustratio Subligar +1",
        feet  = ValorousFeet.Crit
    }
 
    sets.Torcleaver = {}
 
    sets.Torcleaver.index = { 'AttackUncapped', 'AttackCapped', 'Accuracy' }
    Torcleaver_ind = 1
	
    sets.Torcleaver.AttackUncapped = {	
        ammo  = "Amar Cluster",
        head  = "Nyame Helm",
        neck  = "Unmoving Collar +1",
        ear1  = "Thrud Earring",
        ear2  = "Moonshade Earring",
        body  = "Nyame Mail",
        hands = OdysseanHands.WSD,
        ring1 = "Regal Ring",
        ring2 = "Supershear Ring",
        back  = Rudiano.WSD,
        waist = "Sailfi Belt +1",
        legs  = "Nyame Flanchard",
        feet  = "Sulevia's Leggings +2"
    }
    sets.Torcleaver.AttackCapped = {
        ammo  = "Amar Cluster",
        head  = "Nyame Helm",
        neck  = "Unmoving Collar +1",
        ear1  = "Thrud Earring",
        ear2  = "Moonshade Earring",
        body  = "Nyame Mail",
        hands = OdysseanHands.WSD,
        ring1 = "Regal Ring",
        ring2 = "Rufescent Ring",
        back  = Rudiano.WSD,
        waist = "Sailfi Belt +1",
        legs  = "Nyame Flanchard",
        feet  = ValorousFeet.WSD
	}
    sets.Torcleaver.Accuracy = {
        ammo  = "Amar Cluster",
        head  = "Nyame Helm",
        neck  = "Unmoving Collar +1",
        ear1  = "Thrud Earring",
        ear2  = "Moonshade Earring",
        body  = "Nyame Mail",
        hands = OdysseanHands.WSD,
        ring1 = "Regal Ring",
        ring2 = "Rufescent Ring",
        back  = Rudiano.WSD,
        waist = "Sailfi Belt +1",
        legs  = "Nyame Flanchard",
        feet  = "Sulevia's Leggings +2"
	}
	
    sets.Resolution = {}
 
    sets.Resolution.index = { 'AttackUncapped', 'AttackCapped', 'Accuracy' }
    Resolution_ind = 1
	
    sets.Resolution.AttackUncapped = {
        ammo  = "Coiste Bodhar",
        head  = "Sakpata's Helm",
        neck  = "Fotia Gorget",
        ear1  = "Thrud Earring",
        ear2  = "Moonshade Earring",
        body  = "Sakpata's Breastplate",
        hands = "Sakpata's Gauntlets",
        ring1 = "Regal Ring",
        ring2 = "Flamma Ring",
        back  = Rudiano.WSD,
        waist = "Fotia Belt",
        legs  = "Sakpata's Cuisses",
        feet  = "Sakpata's Leggings"	
	}
    sets.Resolution.AttackCapped = {
        ammo  = "Coiste Bodhar",
        head  = "Sakpata's Helm",
        neck  = "Fotia Gorget",
        ear1  = "Thrud Earring",
        ear2  = "Moonshade Earring",
        body  = "Sakpata's Breastplate",
        hands = "Sakpata's Gauntlets",
        ring1 = "Regal Ring",
        ring2 = "Flamma Ring",
        back  = Rudiano.WSD,
        waist = "Fotia Belt",
        legs  = "Sakpata's Cuisses",
        feet  = "Sakpata's Leggings"	
	}
    sets.Resolution.Accuracy = {
        ammo  = "Amar Cluster",
        head  = "Flamma Zucchetto +2",
        neck  = "Fotia Gorget",
        ear1  = "Thrud Earring",
        ear2  = "Moonshade Earring",
        body  = "Dagon Breastplate",
        hands = "Sakpata's Gauntlets",
        ring1 = "Regal Ring",
        ring2 = "Rufescent Ring",
        back  = Rudiano.TP,
        waist = "Fotia Belt",
        legs  = "Sakpata's Cuisses",
        feet  = "Flamma Gambieras +2"	
	}	
 
    sets.SanguineBlade = {
        ammo  = "Pemphredo Tathlum",
        head  = "Pixie Hairpin +1",
        neck  = "Baetyl Pendant",
        ear1  = "Thrud Earring",
        ear2  = "Friomisi Earring",
        body  = "Nyame Mail",
        hands = "Nyame Gauntlets",
        ring1 = "Archon Ring",
        ring2 = "Rufescent Ring",
        back  = "Moonbeam Cape",
        waist = "Eschan Stone",
        legs  = "Nyame Flanchard",
        feet  = "Nyame Sollerets"
    }
 
    sets.SavageBlade = {}
 
    sets.SavageBlade.index = { 'Attack', 'Accuracy' }
    SavageBlade_ind = 1
    sets.SavageBlade.Attack = {
        ammo  = "Amar Cluster",
        head  = "Nyame Helm",
        neck  = "Caro Necklace",
        ear1  = "Thrud Earring",
        ear2  = "Moonshade Earring",
        body  = "Nyame Mail",
        hands = OdysseanHands.WSD,
        ring1 = "Regal Ring",
        ring2 = "Rufescent Ring",
        back  = Rudiano.WSD,
        waist = "Sailfi Belt +1",
        legs  = "Nyame Flanchard",
        feet  = ValorousFeet.WSD
    }
 
    sets.SavageBlade.Accuracy = {
        ammo  = "Amar Cluster",
        head  = ValorousHead.WSD,
        neck  = "Caro Necklace",
        ear1  = "Thrud Earring",
        ear2  = "Moonshade Earring",
        body  = "Nyame Mail",
        hands = OdysseanHands.WSD,
        ring1 = "Regal Ring",
        ring2 = "Rufescent Ring",
        back  = Rudiano.WSD,
        waist = "Sailfi Belt +1",
        legs  = "Nyame Flanchard",
        feet  = ValorousFeet.WSD
    }
	
    sets.BlackHalo = {}
 
    sets.BlackHalo.index = { 'Attack', 'Accuracy' }
    BlackHalo_ind = 1
    sets.BlackHalo.Attack = {
        ammo  = "Amar Cluster",
        head  = "Nyame Helm",
        neck  = "Caro Necklace",
        ear1  = "Thrud Earring",
        ear2  = "Moonshade Earring",
        body  = "Nyame Mail",
        hands = OdysseanHands.WSD,
        ring1 = "Regal Ring",
        ring2 = "Rufescent Ring",
        back  = Rudiano.WSD,
        waist = "Sailfi Belt +1",
        legs  = "Nyame Flanchard",
        feet  = ValorousFeet.WSD
    }
 
    sets.BlackHalo.Accuracy = {
        ammo  = "Amar Cluster",
        head  = "Nyame Helm",
        neck  = "Caro Necklace",
        ear1  = "Thrud Earring",
        ear2  = "Moonshade Earring",
        body  = "Nyame Mail",
        hands = OdysseanHands.WSD,
        ring1 = "Regal Ring",
        ring2 = "Rufescent Ring",
        back  = Rudiano.WSD,
        waist = "Sailfi Belt +1",
        legs  = "Nyame Flanchard",
        feet  = ValorousFeet.WSD
    }	
	
    sets.HexaStrike = {}
 
    sets.HexaStrike.index = { 'Attack', 'Accuracy' }
    HexaStrike_ind = 1
    sets.HexaStrike.Attack = {
        ammo  = "Coiste Bodhar",
        head  = "Sakpata's Helm",
        neck  = "Fotia Gorget",
        ear1  = "Lugra Earring +1",
        ear2  = "Moonshade Earring",
        body  = "Hjarrandi Breastplate",
        hands = "Flamma Manopolas +2",
        ring1 = "Regal Ring",
        ring2 = "Rufescent Ring",
        back  = Rudiano.WSD,
        waist = "Fotia Belt",
        legs  = "Sakpata's Cuisses",
        feet  = "Sakpata's Leggings"
    }
 
    sets.HexaStrike.Accuracy = {
        ammo  = "Amar Cluster",
        head  = "Sakpata's Helm",
        neck  = "Fotia Gorget",
        ear1  = "Lugra Earring +1",
        ear2  = "Moonshade Earring",
        body  = "Hjarrandi Breastplate",
        hands = "Flamma Manopolas +2",
        ring1 = "Regal Ring",
        ring2 = "Rufescent Ring",
        back  = Rudiano.WSD,
        waist = "Fotia Belt",
        legs  = "Sakpata's Cuisses",
        feet  = "Sakpata's Leggings"
    }	

	sets.SwiftBlade = {}
	
    sets.SwiftBlade.index = { 'Attack', 'Accuracy' }
    SwiftBlade_ind = 1
	sets.SwiftBlade.Attack = set_combine(sets.SavageBlade.AttackUncapped, {})
	sets.SwiftBlade.Accuracy = set_combine(sets.SavageBlade.AttackCapped, {})
	
	sets.Knights = {}
	
    sets.Knights.index = { 'Attack', 'Accuracy' }
    Knights_ind = 1
	sets.Knights.Attack = {
        ammo  = "Amar Cluster",
        head  = "Nyame Helm",
        neck  = "Caro Necklace",
        ear1  = "Thrud Earring",
        ear2  = "Moonshade Earring",
        body  = "Nyame Mail",
        hands = OdysseanHands.WSD,
        ring1 = "Regal Ring",
        ring2 = "Rufescent Ring",
        back  = Rudiano.WSD,
        waist = "Sailfi Belt +1",
        legs  = "Nyame Flanchard",
        feet  = "Sulevia's Leggings +2"
    }
	
	sets.Knights.Accuracy = {
        ammo  = "Amar Cluster",
        head  = "Nyame Helm",
        neck  = "Caro Necklace",
        ear1  = "Thrud Earring",
        ear2  = "Moonshade Earring",
        body  = "Nyame Mail",
        hands = OdysseanHands.WSD,
        ring1 = "Regal Ring",
        ring2 = "Rufescent Ring",
        back  = Rudiano.WSD,
        waist = "Sailfi Belt +1",
        legs  = "Nyame Flanchard",
        feet  = "Sulevia's Leggings +2"
    }
   
    sets.FlashNova = {}
	
	--Also the set for Sonic Thrust in the rules section
	sets.ImpulseDrive = {}

    sets.ImpulseDrive.index = { 'Attack', 'Accuracy' }
    ImpulseDrive_ind = 1
	sets.ImpulseDrive.Attack = {
        ammo  = "Coiste Bodhar",
        head  = "Nyame Helm",
        neck  = "Caro Necklace",
        ear1  = "Thrud Earring",
        ear2  = "Moonshade Earring",
        body  = "Dagon Breastplate",
        hands = OdysseanHands.WSD,
        ring1 = "Regal Ring",
        ring2 = "Rufescent Ring",
        back  = Rudiano.WSD,
        waist = "Sailfi Belt +1",
        legs  = "Nyame Flanchard",
        feet  = "Sulevia's Leggings +2"
	}
	
	sets.ImpulseDrive.Accuracy = {
        ammo  = "Coiste Bodhar",
        head  = "Sakpata's Helm",
        neck  = "Caro Necklace",
        ear1  = "Thrud Earring",
        ear2  = "Moonshade Earring",
        body  = "Nyame Mail",
        hands = "Nyame Gauntlets",
        ring1 = "Regal Ring",
        ring2 = "Rufescent Ring",
        back  = Rudiano.WSD,
        waist = "Sailfi Belt +1",
        legs  = "Nyame Flanchard",
        feet  = "Sakpata's Leggings"
	}	
	
	sets.WS.NoSwap = {}

------End of WS------------------------------------------------------------------------------------------
------Magic Sets---
    sets.BlueMagic = {
		ammo  = "Staunch Tathlum +1",
        head  = "Souveran Schaller +1", -- +9
        neck  = "Unmoving Collar +1", -- +10
        ear1  = "Knightly Earring",
        ear2  = {name="Odnowa Earring +1", priority=1},
        body  = "Souveran Cuirass +1", -- +20
        hands = {name="Regal Gauntlets", priority=2},
        ring1 = {Name="Gelatinous Ring +1", priority=3},
        ring2 = "Evanescence Ring",
        back  = Rudiano.Enmity, -- +10
        waist = "Audumbla Sash",
        legs  = "Founder's Hose",
        feet  = {name="Souveran Schuhs +1",Priority=4}
	} -- +73 enmity (+103 w/ crusade) | 105% SIR

    sets.BlueMagic.Enmity = {
		ammo  = "Staunch Tathlum +1",
        head  = "Souveran Schaller +1", -- +9
        neck  = "Unmoving Collar +1", -- +10
        ear1  = "Knightly Earring",
        ear2  = {name="Odnowa Earring +1", priority=1},
        body  = "Souveran Cuirass +1", -- +20
        hands = {name="Regal Gauntlets", priority=2},
        ring1 = {Name="Gelatinous Ring +1", priority=3},
        ring2 = "Evanescence Ring",
        back  = Rudiano.Enmity, -- +10
        waist = "Audumbla Sash",
        legs  = "Founder's Hose",
        feet  = {name="Souveran Schuhs +1",Priority=4}
	} -- +73 enmity (+103 w/ crusade) | 105% SIR
 
    sets.BlueMagic.STR = set_combine(sets.BlueMagic, {})
	
	sets.Holy = {
		ammo  = "Pemphredo Tathlum",
        head  = "Jumalik Helm", --10/0
        neck  = "Baetyl Pendant",
        ear1  = "Friomisi Earring",
        ear2  = "Crematio Earring",
        body  = "Nyame Mail", --6/0
        hands = "Nyame Gauntlets", --5/0
        ring1 = "Mujin Band", --0/5
        ring2 = "Acumen Ring",
        back  = Rudiano.Enmity,
        waist = "Eschan Stone",
        legs  = "Nyame Flanchard", --6/0
        feet  = "Nyame Sollerets" --5/0
	} -- 32/5
	
	sets.HolyAura = {
		ammo  = "Pemphredo Tathlum",
        head  = "Jumalik Helm", --10/0
        neck  = "Baetyl Pendant",
        ear1  = "Friomisi Earring",
        ear2  = "Crematio Earring",
        body  = "Nyame Mail", --6/0
        hands = "Nyame Gauntlets", --5/0
        ring1 = "Mujin Band", --0/5
        ring2 = "Acumen Ring",
        back  = Rudiano.Enmity,
        waist = "Hachirin-no-Obi",
        legs  = "Nyame Flanchard", --6/0
        feet  = "Nyame Sollerets" --5/0
	} -- 32/5	

    --Curing Sets--
    sets.Cures = {         
		ammo  = "Staunch Tathlum +1", -- -11% SIR 
        head  = "Souveran Schaller +1", -- -20% SIR
        neck  = "Unmoving Collar +1",
        ear1  = "Tuisto Earring",
        ear2  = "Odnowa Earring +1",
        body  = "Souveran Cuirass +1",
        hands = "Macabre Gauntlets +1",
        ring1 = "Gelatinous Ring +1",
        ring2 = "Eihwaz Ring",
        back  = Rudiano.Cure, -- -10% SIR
        waist = "Audumbla Sash", -- -10% SIR
        legs  = "Founder's Hose", -- -30% SIR
        feet  = OdysseanFeet.SIR -- -20% SIR
    } -- +51% Cure Potency || +90 Enmity (+120 Enmity)

    sets.Cures.SelfCures = {
		ammo  = "Staunch Tathlum +1", -- -11% SIR 
        head  = "Souveran Schaller +1", -- -20% SIR
        neck  = "Sacro Gorget",
        ear1  = "Tuisto Earring",
        ear2  = "Odnowa Earring +1",
        body  = "Souveran Cuirass +1",
        hands = "Macabre Gauntlets +1",
        ring1 = "Gelatinous Ring +1",
        ring2 = "Eihwaz Ring",
        back  = Rudiano.Cure, -- -10% SIR
        waist = "Audumbla Sash", -- -10% SIR
        legs  = "Founder's Hose", -- -30% SIR
        feet  = OdysseanFeet.SIR -- -20% SIR
    } -- +71 enmity (+30 crusade) = +90 total || 3302 Max HP || CPot: 54%/50%  CPotRec'd: 30%/30%  Total: 75% (+25% majesty) || 101% SIR +10% (merits)

	-- Triggers as an o-shit when initiating a cure under 51% hp
	-- nearly caps "standard" cure potency amounts (49%) while being uninterruptable (105% SIR)
    sets.Cures.SelfCures.SIR = {  
		ammo  = "Staunch Tathlum +1", -- 11
        head  = "Souveran Schaller +1", -- 20
        neck  = "Unmoving Collar +1",
        ear1  = "Tuisto Earring",
        ear2  = "Nourishing Earring +1",
        body  = "Souveran Cuirass +1",
        hands = "Regal Gauntlets",
        ring1 = "Defending Ring",
        ring2 = "Eihwaz Ring",
        back  = Rudiano.Enmity,
        waist = "Audumbla Sash", -- 10
        legs  = "Founder's Hose", -- 30
        feet  = OdysseanFeet.SIR -- 20
    } -- +23 enmity (+30 crusade) = +53 total || CPot: 34%/50%  CPotRec'd: 15%/30%  Total: 49% || 105% SIR (+10 in merits)
	
    --Spell Interruption Rate--
    sets.SIR = {
        ammo  = "Staunch Tathlum +1", -- 11
		head  = "Souveran Schaller +1", -- 20
		hands = "Regal Gauntlets", -- 10
		waist = "Audumbla Sash",
        legs  = "Founder's Hose", -- 30
		feet  = OdysseanFeet.SIR -- 20
    } -- 101% +10 (merits) = 111
------End of Magic-------------------------------------------------------------------------------------
    --Enmity Set--
   
    sets.Enmity = {  
		ammo  = "Sapience Orb", -- +2
        head  = "Souveran Schaller +1", -- +9
        neck  = "Unmoving Collar +1", -- +10
        ear1  = "Tuisto Earring",
        ear2  = "Odnowa Earring +1",
        body  = "Souveran Cuirass +1", -- +20
        hands = "Caballarius Gauntlets +3", -- +9
        ring1 = "Gelatinous Ring +1",
        ring2 = "Eihwaz Ring", -- +5
		back  = Rudiano.Enmity, -- +10
        waist = "Creed Baudrier", -- +5
        legs  = "Souveran Diechlings +1", -- +9
        feet  = "Souveran Schuhs +1" -- +9
    } -- +88 (+118 with crusade)
	
    sets.EnmitySpells = {  
		ammo  = "Sapience Orb", -- +2
        head  = "Carmine Mask +1",
        neck  = "Unmoving Collar +1", -- +10
        ear1  = "Tuisto Earring",
        ear2  = "Odnowa Earring +1",
        body  = "Souveran Cuirass +1", -- +20
        hands = "Caballarius Gauntlets +3", -- +9
        ring1 = "Defending Ring",
        ring2 = "Eihwaz Ring", -- +5
		back  = Rudiano.Enmity, -- +10
        waist = "Creed Baudrier", -- +5
        legs  = "Souveran Diechlings +1", -- +9
        feet  = "Eschite Greaves" -- +15
    } -- +84 (+114 with crusade)	
   
    --Utility Sets--
	sets.Cover = {}
	
	sets.Cover.PerfectSet = {
		sub   = "Priwen", -- 0/0/9
		ammo  = "Staunch Tathlum +1", -- 0/0/3
        head  = "Sakpata's Helm", -- 0/0/7
        neck  = "Unmoving Collar +1", 
        ear1  = "Foresti Earring",
        ear2  = "Odnowa Earring +1", -- 0/2/3
        body  = "Caballarius Surcoat +3", -- 0/0/12
        hands = "Souveran Handschuhs +1", -- 4/5/0
        ring1 = "Gelatinous Ring +1", -- 7/-1/0
        ring2 = "Eihwaz Ring",
        back  = Rudiano.Shield, 
        waist = "Creed Baudrier",
        legs  = "Sakpata's Cuisses", -- 0/0/9
        feet  = "Reverence Leggings +3" 
    } -- 11/6/39 (+0/+24/+0 w/ShellV)
	
	sets.Cover.PerfectSet2 = {
		sub   = "Srivatsa", -- 0/0/8
		ammo  = "Staunch Tathlum +1", -- 0/0/3
        head  = "Sakpata's Helm", -- 0/0/7
        neck  = "Unmoving Collar +1", 
        ear1  = "Foresti Earring",
        ear2  = "Odnowa Earring +1", -- 0/2/3
        body  = "Caballarius Surcoat +3", -- 0/0/12
        hands = "Souveran Handschuhs +1", -- 4/5/0
        ring1 = "Gelatinous Ring +1", -- 7/-1/0
        ring2 = "Eihwaz Ring",
        back  = Rudiano.Shield, 
        waist = "Creed Baudrier",
        legs  = "Sakpata's Cuisses", -- 0/0/9
        feet  = "Reverence Leggings +3" 
    } -- 11/6/42 (+0/+24/+0 w/ShellV)	

	sets.Cover.Priwen = {
		sub   = "Priwen", -- 0/0/9
		ammo  = "Staunch Tathlum +1", -- 0/0/3
        head  = "Sakpata's Helm", -- 0/0/7
        neck  = "Unmoving Collar +1", 
        ear1  = "Tuisto Earring",
        ear2  = "Odnowa Earring +1", -- 0/2/3
        body  = "Caballarius Surcoat +3", -- 0/0/12
        hands = "Macabre Gauntlets +1", -- 4/0/0
        ring1 = "Gelatinous Ring +1", -- 7/-1/0
        ring2 = "Eihwaz Ring",
        back  = Rudiano.Shield, 
        waist = "Creed Baudrier",
        legs  = "Sakpata's Cuisses", -- 0/0/9
        feet  = "Sakpata's Leggings" -- 0/0/6
    } -- 11/22/49 (+0/+24 w/ShellV)	(+612 MEva)
	
	sets.Cover.Aegis = {
		sub   = "Aegis", -- 0/50(II)/0
		ammo  = "Staunch Tathlum +1", -- 0/0/3
        head  = "Sakapat's Helm", -- 0/0/7
        neck  = "Unmoving Collar +1", 
        ear1  = "Tuisto Earring",
        ear2  = "Odnowa Earring +1", -- 0/2/3
        body  = "Caballarius Surcoat +3", -- 0/0/12
        hands = "Sakpata's Gauntlets", -- 0/0/8
        ring1 = "Gelatinous Ring +1", -- 7/-1/0
        ring2 = "Eihwaz Ring",
        back  = Rudiano.Counter, 
        waist = "Carrier's Sash", 
        legs  = "Sakpata's Cuisses", -- 0/0/9
        feet  = "Sakpata's Leggings" -- 0/0/6
    } -- 7/51*/48 (+0/+24 w/ShellV)	

	sets.Cover.MEvaAegis = {
		sub   = "Aegis", -- 0/50(II)/0
		ammo  = "Staunch Tathlum +1", -- 0/0/3
        head  = "Sakpata's Helm", -- 0/0/7
        neck  = "Unmoving Collar +1", 
        ear1  = "Tuisto Earring",
        ear2  = "Odnowa Earring +1", -- 0/2/3
        body  = "Caballarius Surcoat +3", -- 0/0/12
        hands = "Macabre Gauntlets +1", -- 4/0/0
        ring1 = "Gelatinous Ring +1", -- 7/-1/0
        ring2 = "Moonbeam Ring", -- 0/0/4
        back  = Rudiano.Shield,
        waist = "Carrier's Sash",
        legs  = "Sakpata's Cuisses", -- 0/0/8
        feet  = "Sakpata's Leggings" -- 0/0/6
    } -- 11/51*/43 (+0/+24 w/ShellV)		

	sets.Cover.Ochain = {
		sub   = "Ochain",
		ammo  = "Staunch Tathlum +1", -- 0/0/3
        head  = "Chevalier's Armet +1",
        neck  = "Unmoving Collar +1", 
        ear1  = "Tuisto Earring",
        ear2  = "Odnowa Earring +1", -- 0/2/3
        body  = "Caballarius Surcoat +3", -- 0/0/12
        hands = "Souveran Handschuhs +1", -- 4/5/0
        ring1 = "Gelatinous Ring +1", -- 7/-1/0
        ring2 = "Moonbeam Ring", -- 0/0/4
        back  = Rudiano.Enmity, -- 10/0/0 
        waist = "Flume Belt +1", -- 4/0/0 
        legs  = "Chevalier's Cuisses +1", -- 6/0/0
        feet  = "Reverence Leggings +3"
    } -- 31/6/20 (+0/+24/+0 w/ShellV)	
	
    sets.Cover.Srivatsa = {
		sub   = "Srivatsa", -- 0/0/8
		ammo  = "Staunch Tathlum +1", -- 0/0/3
        head  = "Souveran Schaller +1", -- 0/0/0(2)
        neck  = "Unmoving Collar +1", 
        ear1  = "Tuisto Earring",
        ear2  = "Odnowa Earring +1", -- 0/2/3
        body  = "Caballarius Surcoat +3", -- 0/0/12
        hands = "Souveran Handschuhs +1", -- 4/5/0(2)
        ring1 = "Gelatinous Ring +1", -- 7/-1/0
        ring2 = "Moonbeam Ring", -- 0/0/4
        back  = "Moonbeam Cape", -- 0/0/5 
        waist = "Creed Baudrier", 
        legs  = "Souveran Cuisses +1", -- 0/0/4(2)
        feet  = "Souveran Schuhs +1" -- 5/0/0(2)
    } -- 12/6/47 (+0/+24/+0 w/ShellV)	

    sets.Utility = {}
 
    sets.Utility.TH = {
        head  = "Volte Cap",
		waist = "Chaac Belt"
    }

    sets.Utility.Derp = { 		
		ammo  = "Staunch Tathlum +1", -- 0/0/3
        head  = "Sakpata's Helm", -- 0/0/7
        neck  = "Unmoving Collar +1", 
        ear1  = "Tuisto Earring",
        ear2  = "Odnowa Earring +1", -- 0/2/3
        body  = "Reverence Surcoat +3", -- 0/0/11
        hands = "Sakpata's Gauntlets", -- 0/0/8
        ring1 = "Pernicious Ring",
        ring2 = "Eihwaz Ring", 
        back  = Rudiano.Enmity, -- 10/0/0
        waist = "Carrier's Sash",
        legs  = "Chevalier's Cuisses +1", -- 6/0/0
        feet  = "Sakpata's Leggings" -- 0/0/6
    } -- 16/2/38 (+0/+24 w/ShellV)
   
    sets.Utility.MDTTank =  {
		ammo  = "Vanir Battery",
        head  = "Souveran Schaller +1", -- 4/0/0
        neck  = "Creed Collar", 
        ear1  = "Odnowa Earring +1", -- 0/2/0
        ear2  = "Odnowa Earring", -- 0/1/0
        body  = "Hjarrandi Breastplate", -- 0/0/12
        hands = "Regal Gauntlets",
        ring1 = "Defending ring", -- 0/0/10
        ring2 = "Moonbeam Ring", -- 0/0/4
        back  = "Moonbeam Cape", -- 0/0/5
        waist = "Creed Baudrier",
        legs  = "Souveran Diechlings +1", -- 0/0/4
        feet  = "Souveran Schuhs +1" -- 5/0/0
    } -- 9/3/41 (+0/+24 w/ShellV)
   
    --Shell V on. Need 23% when 5/5 with pants, 21% with sheltered (24% with sheltered and trust/self cast)--
    sets.Utility.MDTV = {	
		ammo  = "Vanir Battery",
        head  = "Souveran Schaller +1", -- 4/0/0
        neck  = "Creed Collar", 
        ear1  = "Odnowa Earring +1", -- 0/2/0
        ear2  = "Odnowa Earring", -- 0/1/0
        body  = "Hjarrandi Breastplate", -- 0/0/12
        hands = "Regal Gauntlets",
        ring1 = "Defending ring", -- 0/0/10
        ring2 = "Moonbeam Ring", -- 0/0/4
        back  = "Moonbeam Cape", -- 0/0/5
        waist = "Creed Baudrier",
        legs  = "Souveran Diechlings +1", -- 0/0/4
        feet  = "Souveran Schuhs +1" -- 5/0/0
    } -- 9/3/41 (+0/+24 w/ShellV)
 
    --Shell II only--
    sets.Utility.MDTII = {	
		ammo  = "Vanir Battery",
        head  = "Souveran Schaller +1", -- 4/0/0
        neck  = "Creed Collar", 
        ear1  = "Odnowa Earring +1", -- 0/2/0
        ear2  = "Odnowa Earring", -- 0/1/0
        body  = "Hjarrandi Breastplate", -- 0/0/12
        hands = "Regal Gauntlets",
        ring1 = "Defending ring", -- 0/0/10
        ring2 = "Moonbeam Ring", -- 0/0/4
        back  = "Moonbeam Cape", -- 0/0/5
        waist = "Creed Baudrier",
        legs  = "Souveran Diechlings +1", -- 0/0/4
        feet  = "Souveran Schuhs +1" -- 5/0/0
    } -- 9/3/41 (+0/+24 w/ShellV)
 
    --No Shell--
    sets.Utility.MDTNO = {	
		ammo  = "Vanir Battery",
        head  = "Souveran Schaller +1", -- 4/0/0
        neck  = "Creed Collar", 
        ear1  = "Odnowa Earring +1", -- 0/2/0
        ear2  = "Odnowa Earring", -- 0/1/0
        body  = "Hjarrandi Breastplate", -- 0/0/12
        hands = "Regal Gauntlets",
        ring1 = "Defending ring", -- 0/0/10
        ring2 = "Moonbeam Ring", -- 0/0/4
        back  = "Moonbeam Cape", -- 0/0/5
        waist = "Creed Baudrier",
        legs  = "Souveran Diechlings +1", -- 0/0/4
        feet  = "Souveran Schuhs +1" -- 5/0/0
    } -- 9/3/41 (+0/+24 w/ShellV)
 
    --Telchine with proper ball busting augments is the best for magic evasion--
    sets.Utility.MEVA = {		
		ammo  = "Vanir Battery",
        head  = "Souveran Schaller +1", -- 4/0/0
        neck  = "Creed Collar", 
        ear1  = "Odnowa Earring +1", -- 0/2/0
        ear2  = "Odnowa Earring", -- 0/1/0
        body  = "Hjarrandi Breastplate", -- 0/0/12
        hands = "Regal Gauntlets",
        ring1 = "Defending ring", -- 0/0/10
        ring2 = "Moonbeam Ring", -- 0/0/4
        back  = "Moonbeam Cape", -- 0/0/5
        waist = "Creed Baudrier",
        legs  = "Souveran Diechlings +1", -- 0/0/4
        feet  = "Souveran Schuhs +1" -- 5/0/0
    } -- 9/3/41 (+0/+24 w/ShellV)
 
    ---------------------------------------------------------------
   
    sets.Utility.Charm = {		
		ammo  = "Staunch Tathlum +1", -- 0/0/3
        head  = "Sakpata's Helm", -- 3/7/0
        neck  = "Unmoving Collar +1", 
        ear1  = "Tuisto Earring",
        ear2  = "Odnowa Earring +1", -- 0/2/3
        body  = "Sacro Breastplate", 
        hands = "Macabre Gauntlets +1", -- 4/0/0
        ring1 = "Gelatinous ring +1", -- 7/-1/0
        ring2 = "Purity Ring", -- 0/4/0
        back  = Rudiano.Enmity, -- 10/0/0
        waist = "Carrier's Sash",
        legs  = "Souveran Diechlings +1", -- 0/0/4
        feet  = "Sakpata's Leggings" -- 4/6/0
    }
   
    sets.Utility.Doom = {
        neck  = "Nicander's Necklace",
		ring1 = "Haoma's Ring",
		ring2 = "Purity Ring",
		waist = "Gishdubar Sash"
    }
   
    --Enhancing Sets--
   
    sets.Enhancing = {}
   
    sets.Enhancing.Skill = {       
		ammo  = "Sapience Orb",
        head  = "Carmine Mask +1",
        neck  = "Incanter's Torque",
        ear1  = "Andoaa Earring",
        ear2  = "Mimir Earring",
        body  = "Sacro Breastplate",
        hands = "Regal Gauntlets",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring",
        back  = "Moonbeam Cape",
        waist = "Olympus Sash",
        legs  = "Carmine Cuisses +1",
        feet  = "Carmine Greaves +1"
    }
   
    sets.Enhancing.Duration = {       
		ammo  = "Staunch Tathlum +1",
        head  = "Souveran Schaller +1",
        neck  = "Unmoving Collar",
        ear1  = "Tuisto Earring",
        ear2  = "Odnowa Earring +1",
        body  = "Reverence Surcoat +3",
        hands = "Regal Gauntlets",
        ring1 = "Gelatinous Ring +1",
        ring2 = "Moonbeam Ring",
        back  = "Moonbeam Cape",
        waist = "Audumbla Sash",
        legs  = "Founder's Hose",
        feet  = OdysseanFeet.SIR
    }
   
    sets.Enhancing.Phalanx = {      
		ammo  = "Staunch Tathlum +1",
        head  = OdysseanHead.Phalanx,
        neck  = "Unmoving Collar +1",
        ear1  = "Tuisto Earring",
        ear2  = "Odnowa Earring +1",
        body  = OdysseanBody.Phalanx,
        hands = "Souveran Handschuhs +1",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring",
        back  = "Weard Mantle",
        waist = "Creed Baudrier",
        legs  = "Sakpata's Cuisses",
        feet  = "Souveran Schuhs +1"
	}
	
	--Only called manually for pre-buffing
	--This set is NOT the set that will be used when you cast this spell
    sets.Phalanx = {      
		main  = "Sakpata's Sword",
		sub   = "Priwen",
		ammo  = "Staunch Tathlum +1",
        head  = OdysseanHead.Phalanx,
        neck  = "Unmoving Collar +1",
        ear1  = "Tuisto Earring",
        ear2  = "Odnowa Earring +1",
        body  = OdysseanBody.Phalanx,
        hands = "Souveran Handschuhs +1",
        ring1 = "Gelatinous Ring +1",
        ring2 = "Moonbeam Ring",
        back  = "Weard Mantle",
        waist = "Creed Baudrier",
        legs  = "Sakpata's Cuisses",
        feet  = "Souveran Schuhs +1"
	}	
	
	sets.Enhancing.Reprisal = { 
		ammo  = "Sapience Orb",
        head  = "Souveran Schaller +1",
        neck  = "Unmoving Collar +1", 
        ear1  = "Etiolation Earring",
        ear2  = "Odnowa Earring +1",
        body  = "Reverence Surcoat +3",
        hands = "Regal Gauntlets",
        ring1 = "Rahab Ring",
        ring2 = "Kishar Ring",
        back  = Rudiano.FC,
        waist = "Creed Baudrier",
        legs  = "Souveran Diechlings +1",
        feet  = "Souveran Schuhs +1"
	}

	sets.Enhancing.Enlight = { 
		ammo  = "Staunch Tathlum +1",
        head  = "Jumalik Helm",
        neck  = "Incanter's Torque", 
        ear1  = "Tuisto Earring",
        ear2  = "Odnowa Earring +1",
        body  = "Reverence Surcoat +3",
        hands = "Eschite Gauntlets",
        ring1 = "Gelatinous Ring +1",
        ring2 = "Stikini Ring",
        back  = "Moonbeam Cape",
        waist = "Austerity Belt",
        legs  = "Souveran Diechlings +1",
        feet  = "Souveran Schuhs +1"
	}
   
    sets.Enhancing.Refresh = set_combine(sets.Enhancing.Duration, {
        waist = "Gishdubar Sash",
    })
   
    sets.Enhancing.Regen = set_combine(sets.Enhancing.Duration, {})
   
    sets.Enhancing.ProShell = set_combine(sets.Enhancing.Duration, {
        Ring2 = "Sheltered Ring",
    })
   
    --Job Ability Sets--
 
    sets.JA = {}
   
    sets.JA.Lunge = {}

    sets.JA.Invincible = {      
		ammo  = "Sapience Orb", -- +2
        head  = "Souveran Schaller +1", -- +9
        neck  = "Unmoving Collar +1", -- +10
        ear1  = "Friomisi Earring", -- +2
        ear2  = "Cryptic Earring", -- +4
        body  = "Souveran Cuirass +1", -- +20
        hands = "Caballarius Gauntlets +3", -- +9
        ring1 = "Pernicious Ring", -- +5
        ring2 = "Eihwaz Ring", -- +5
        back  = Rudiano.Enmity, -- +10
        waist = "Creed Baudrier", -- +5
        legs  = "Caballarius Breeches +3", -- +9
        feet  = "Eschite Greaves"
    } -- +90 (+120)
	
	sets.JA.DivineEmblem = set_combine(sets.Enmity, {
		feet = "Chevalier's Sabatons +1"
	})
 
    sets.JA.Swordplay = set_combine(sets.Enmity, {})
   
    sets.JA.Vallation = set_combine(sets.Enmity, {})
   
    sets.JA.Pflug = set_combine(sets.Enmity, {})
	
    --Rampart is VIT * 2 = Magic Damage Reduction--
    sets.JA.Rampart = set_combine(sets.Enmity, {      
		ammo  = "Staunch Tathlum +1",
        head  = "Caballarius Coronet +3", -- +9
        neck  = "Unmoving Collar +1", -- +10
        ear1  = "Tuisto Earring",
        ear2  = "Odnowa Earring +1",
        body  = "Reverence Surcoat +3", -- +10
        hands = "Caballarius Gauntlets +3", -- +7
        ring1 = "Supershear Ring", -- +5
        ring2 = "Eihwaz Ring", -- +5
        back  = Rudiano.Enmity, -- +10
        waist = "Creed Baudrier", -- +5
        legs  = "Souveran Diechlings +1", -- +9
        feet  = "Souveran Schuhs +1" -- +9
    }) -- +97 (+127)
	
	sets.JA.Chivalry = {      
		ammo  = "Staunch Tathlum +1",
        head  = "Sakpata's Helm",
        neck  = "Aife's Medal",
        ear1  = "Etiolation Earring",
        ear2  = "Odnowa Earring +1",
        body  = "Reverence Surcoat +3",
        hands = "Caballarius Gauntlets +3",
        ring1 = "Gelatinous Ring +1",
        ring2 = "Moonbeam Ring",
        back  = "Moonbeam Cape",
        waist = "Luminary Sash",
        legs  = "Souveran Diechlings +1",
        feet  = "Carmine Greaves +1"
	}
	
	sets.JA.Fealty = set_combine(sets.Enmity, {
		body = "Caballarius Surcoat +3"
	})
	
	sets.JA.Cover = set_combine(sets.Enmity, {
		head = "Reverence Coronet +1",
		body = "Caballarius Surcoat +3"
	})
   
    sets.JA.Intervene = set_combine(sets.Enmity, {})
	
	sets.JA.Sentinel = set_combine(sets.Enmity, {
		feet = "Caballarius Leggings +3"
	})
	
	sets.JA.ShieldBash = set_combine(sets.Enmity, {
		ear2  = "Knightly Earring",
		hands = "Caballarius Gauntlets +3"
	})
	
	sets.JA.HolyCircle = set_combine(sets.Enmity, {
		feet = "Reverence Leggings +3"
	})
	
	sets.JA.Sepulcher = set_combine(sets.Enmity, {})
   
    ---SAM---
    sets.JA.Meditate = set_combine(sets.Enmity, {})
	
    ---WAR---
    sets.JA.Provoke = set_combine(sets.Enmity, {})
    sets.JA.Warcry = set_combine(sets.Enmity, {})
	
	---RUN---
	sets.JA.Ignis = sets.Enmity
	sets.JA.Gelus = sets.Enmity
	sets.JA.Flabra = sets.Enmity
	sets.JA.Tellus = sets.Enmity
	sets.JA.Sulpor = sets.Enmity
	sets.JA.Unda = sets.Enmity
	sets.JA.Lux = sets.Enmity
	sets.JA.Tenebrae = sets.Enmity
	
	--DRK--
	sets.JA.LastResort = set_combine(sets.Enmity, {})
	sets.JA.SoulEater = set_combine(sets.Enmity, {})
	sets.JA.ArcaneCircle = set_combine(sets.Enmity, {})
	sets.JA.WeaponBash = set_combine(sets.Enmity, {ear2= "Knightly Earring"})

    --Precast Sets--
    sets.precast = {}
 
    sets.precast.FastCast = {    
		ammo  = "Sapience Orb", --2
        head  = "Carmine Mask +1", --14
		neck  = "Unmoving Collar +1",
		body  = "Reverence Surcoat +3", --10
		hands = "Leyline Gloves",
        ear1  = "Tuisto Earring",
		ear2  = "Odnowa Earring +1",
		ring1 = "Gelatinous Ring +1",
		ring2 = "Kishar Ring", --4
		back  = Rudiano.FC, --10
		waist = "Creed Baudrier",
        legs  = "Souveran Diechlings +1",
		feet  = "Carmine Greaves +1" --8
	} -- 56% (64% w/ malignance) || 3103 HP 
 
    sets.precast.FastCast.Standard = {    
		ammo  = "Sapience Orb", --2
        head  = "Carmine Mask +1", --14
		neck  = "Unmoving Collar +1",
		body  = "Reverence Surcoat +3", --10
		hands = "Leyline Gloves",
        ear1  = "Tuisto Earring",
		ear2  = "Odnowa Earring +1",
		ring1 = "Gelatinous Ring +1",
		ring2 = "Kishar Ring", --4
		back  = Rudiano.FC, --10
		waist = "Creed Baudrier",
        legs  = "Souveran Diechlings +1",
		feet  = "Carmine Greaves +1" --8
	} -- 56% (64% w/ malignance) || 3103 HP 
   
    sets.precast.FastCast.Enhancing = {    
		ammo  = "Sapience Orb", --2
        head  = "Carmine Mask +1", --14
		neck  = "Unmoving Collar +1",
		body  = "Reverence Surcoat +3", --10
		hands = "Leyline Gloves",
        ear1  = "Tuisto Earring",
		ear2  = "Odnowa Earring +1",
		ring1 = "Gelatinous Ring +1",
		ring2 = "Kishar Ring", --4
		back  = Rudiano.FC, --10
		waist = "Creed Baudrier",
        legs  = "Souveran Diechlings +1",
		feet  = "Carmine Greaves +1" --8
	} -- 58% + (-8% Siegel Sash) = 68%
	
    sets.precast.FastCast.CureCheat = {    
		ammo  = "Sapience Orb", --2
        head  = "Carmine Mask +1", --12
		neck  = "Orunmila's Torque", --5
		body  = OdysseanBody.FC, --10
		hands = "Leyline Gloves", --8
        ear1  = "Loquac. Earring", --2
		ear2  = "Enchanter's Earring +1", --2
		ring1 = "Mephitas's Ring +1",
		ring2 = "Mephitas's Ring",
		back  = Rudiano.FC, --10
		waist = "Carrier's Sash",
        legs  = "Eschite Cuisses", --5
		feet  = "Carmine Greaves +1" --8
	} -- 72% FC (1258 HP Cured) finishes at 100% HP
	
    sets.precast.FastCast.HighHP = {    
		ammo  = "Sapience Orb", --2
        head  = "Carmine Mask +1", --14
		neck  = "Unmoving Collar +1",
		body  = "Reverence Surcoat +3", --10
		hands = "Leyline Gloves",
        ear1  = "Tuisto Earring",
		ear2  = "Odnowa Earring +1",
		ring1 = "Gelatinous Ring +1",
		ring2 = "Kishar Ring", --4
		back  = Rudiano.FC, --10
		waist = "Creed Baudrier",
        legs  = "Souveran Diechlings +1",
		feet  = "Carmine Greaves +1" --8
	} -- 56% (64% w/ malignance) || 3103 HP 
	
    sets.precast.FastCast.Enhancing.HighHP = {    
		ammo  = "Sapience Orb", --2
        head  = "Carmine Mask +1", --14
		neck  = "Unmoving Collar +1",
		body  = "Reverence Surcoat +3", --10
		hands = "Leyline Gloves",
        ear1  = "Tuisto Earring",
		ear2  = "Odnowa Earring +1",
		ring1 = "Gelatinous Ring +1",
		ring2 = "Kishar Ring", --4
		back  = Rudiano.FC, --10
		waist = "Creed Baudrier",
        legs  = "Souveran Diechlings +1",
		feet  = "Carmine Greaves +1" --8
	} -- 56% + (-8% Siegel Sash) = 68%
	
    sets.precast.FastCast.Sketchy = {    
		ammo  = "", 
        head  = "", 
		neck  = "", 
		body  = "", 
		hands = "", 
        ear1  = "", 
		ear2  = "", 
		ring1 = "", 
		ring2 = "", 
		back  = "", 
		waist = "", 
        legs  = "",
		feet  = "" 
	} 
end
 
---End of Gear---------------------------------------------------------------------------------------------------------------------------------------------------------
 
-------------------------------------
---------                   ---------
------                         ------
---         Start of Maps         ---
------                         ------
---------                   ---------
-------------------------------------
 
-------------------------
--   BLU Spells List   --
-------------------------
 
TwoHandedWeapons = S {
    'Beheader +1', 'Takoba', 'Zulqifar', 'Caladbolg', 'Ragnarok',
    'Montante', 'Montante +1', 'Humility', 'Nibiru Faussar', 'Macbain', 'Soulcleaver',
    'Kaqulijaan', 'Beorc Sword', 'Trial Blade', 'Sword of Trials', 'Irradiance Blade',
    'Greatsword', 'Parashu', 'Nanadaka'
}
 
-------------------------
--   BLU Spells List   --
-------------------------
 
function maps()
    PhysicalSpells = S {
        'Bludgeon', 'Body Slam', 'Feather Storm', 'Mandibular Bite', 'Queasyshroom',
        'Power Attack', 'Screwdriver', 'Sickle Slash', 'Smite of Rage',
        'Terror Touch', 'Battle Dance', 'Claw Cyclone', 'Foot Kick', 'Grand Slam',
        'Sprout Smack', 'Helldive', 'Jet Stream', 'Pinecone Bomb', 'Wild Oats', 'Uppercut'
    }
   
    BlueMagic_Buffs = S {
        'Refueling',
    }
 
    BlueMagic_Healing = S {
        'Healing Breeze', 'Pollen', 'Wild Carrot'
    }
 
    BlueMagic_Enmity = S {
        'Blank Gaze', 'Jettatura', 'Geist Wall', 'Sheep Song', 'Soporific', 'Cocoon', 'Stinking Gas'
    }
   
    RUNMagic_Enmity = S {
        'Flash', 'Stun', 'Absorb-TP'
    }
end
 
------------------------
--   Town Gear List   --
------------------------
 
Town = S {
    "Ru'Lude Gardens", "Upper Jeuno", "Lower Jeuno", "Port Jeuno",
    "Port Windurst", "Windurst Waters", "Windurst Woods", "Windurst Walls", "Heavens Tower",
    "Port San d'Oria", "Northern San d'Oria", "Southern San d'Oria", "Chateau d'Oraguille",
    "Port Bastok", "Bastok Markets", "Bastok Mines", "Metalworks",
    "Aht Urhgan Whitegate", "Nashmau",
    "Selbina", "Mhaura", "Norg",  "Kazham", "Tavanazian Safehold",
    "Eastern Adoulin", "Western Adoulin", "Celennia Memorial Library", "Mog Garden"
}
 
---End of Maps----------------------------------------------------------------------------------------------------------------------------------------------------------
 
function msg(str)
    send_command('@input /echo <----- ' .. str .. ' ----->')
end
 
------------------------------------------
-- Macro and Style Change on Job Change
------------------------------------------
function set_macros(sheet,book)
    if book then
        send_command('@input /macro book '..tostring(book)..';wait .1;input /macro set '..tostring(sheet))
        return
    end
    send_command('@input /macro set '..tostring(sheet))
end
 
function set_style(sheet)
    send_command('@input ;wait 5.0;input /lockstyleset '..sheet)
    add_to_chat (55, 'Currently on: '..('PLD '):color(5)..''..('Macros set!'):color(121))
--  add_to_chat (60, 'Eat tendies in moderation')
end
 
--Page, Book--
set_macros(1,18)
--Use the Lockstyle Number--
set_style(22)
------------------------------------------
-- Variables
------------------------------------------
SetLocked = false --Used to Check if set is locked before changing equipment
LockedEquipSet = {} --Placeholder to store desired lock set
LockGearSet = {}
equipSet = {} --Currently Equiped Gearset
LockGearIndex = false
TargetDistance = 0
TH = false -- Defaults
SIR = false -- Spell Interruption Rate
TankingTP = true -- If true, default set is tanking TP array.
TwoHandedTP = true -- TP set order, looks for Tanking TP set before 2H TP before 1H DW TP.
WSswap = true -- Used to conserve High-HP if using Xcal AM or opening SC (true = will swap)
HighHPprecast = false -- Used to conserve High HP for precast actions (true = High HP)
WeaponLock = true -- Locks Weapon/sub to avoid swaps


------------------------------------------
-- Windower Hooks              --
------------------------------------------

function buff_change(n, gain, buff_table)
    local name
    name = string.lower(n)
    if S{"terror","petrification","sleep","stun"}:contains(name) then
        if gain then
            ChangeGear(sets.Utility.Derp)
        elseif not has_any_buff_of({"terror","petrification","sleep","stun"}) then
            if player.status == 'Engaged' then
                if LockGearIndex then
                    ChangeGear(LockGearSet)
                elseif not LockGearIndex then
                    if TankingTP == true then
						ChangeGear(sets.Sword[sets.Sword.index[Sword_ind]])
						ChangeGear(sets.Shield[sets.Shield.index[Shield_ind]])                        
						ChangeGear(sets.TankingTP[sets.TankingTP.index[TankingTP_ind]])
                    elseif BurtAM3 == true then
                        ChangeGear(sets.BurtAM3[sets.BurtAM3.index[BurtAM3_ind]])
                    elseif TwoHandedTP == true then
                        ChangeGear(sets.TwoHandedTP[sets.TwoHandedTP.index[TwoHandedTP_ind]])
                    else
                        ChangeGear(sets.OneHandedTP[sets.OneHandedTP.index[OneHandedTP_ind]])
                    end
                end
            elseif player.status == 'Idle' then
                if LockGearIndex then
                    ChangeGear(LockGearSet)
                elseif not LockGearIndex then
					ChangeGear(sets.Sword[sets.Sword.index[Sword_ind]])
					ChangeGear(sets.Shield[sets.Shield.index[Shield_ind]])                    
					ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
                end
            end
        end
    elseif name == "doom" then
        if gain then
            ChangeGear(sets.Utility.Doom)
            send_command('@input /p Doomed.')
            disable('neck','ring1','ring2','waist')
        else
            if player.status == 'Engaged' then
                if LockGearIndex then
                    send_command('@input /p Doom off.')
                    enable('neck','ring1','ring2','waist')
                    ChangeGear(LockGearSet)
                else
                    send_command('@input /p Doom off.')
                    enable('neck','ring1','ring2','waist')
                    if TankingTP == true then
						ChangeGear(sets.Sword[sets.Sword.index[Sword_ind]])
						ChangeGear(sets.Shield[sets.Shield.index[Shield_ind]])                        
						ChangeGear(sets.TankingTP[sets.TankingTP.index[TankingTP_ind]])
                    elseif BurtAM3 == true then
                        ChangeGear(sets.BurtAM3[sets.BurtAM3.index[BurtAM3_ind]])
                    elseif TwoHandedTP == true then
                        ChangeGear(sets.TwoHandedTP[sets.TwoHandedTP.index[TwoHandedTP_ind]])
                    else
                        ChangeGear(sets.OneHandedTP[sets.OneHandedTP.index[OneHandedTP_ind]])
                    end
                end
            elseif player.status == 'Idle' then
                if LockGearIndex then
                    send_command('@input /p Doom off.')
                    enable('neck','ring1','ring2','waist')
                    ChangeGear(LockGearSet)
                else
                    send_command('@input /p Doom off.')
                    enable('neck','ring1','ring2','waist')
					ChangeGear(sets.Sword[sets.Sword.index[Sword_ind]])
					ChangeGear(sets.Shield[sets.Shield.index[Shield_ind]])                    
					ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
                end
            end
        end
    elseif name == "charm" then
        if gain then
            send_command('@input /p Charmed!')
        else
            send_command('@input /p Charm off.')
        end
    elseif name == "weakness" then
        if gain then
            enable('neck','ring1','ring2','waist')
        end
    elseif name ==  "divine emblem" then
        if gain then
			ChangeGear(set_combine(equipSet, {feet="Chevalier's Sabatons =1"}))
        else
            if player.status == 'Engaged' then
                if LockGearIndex then
                    ChangeGear(LockGearSet)
                elseif not LockGearIndex then
                    if TankingTP == true then
						ChangeGear(sets.Sword[sets.Sword.index[Sword_ind]])
						ChangeGear(sets.Shield[sets.Shield.index[Shield_ind]])                        
						ChangeGear(sets.TankingTP[sets.TankingTP.index[TankingTP_ind]])
                    elseif BurtAM3 == true then
                        ChangeGear(sets.BurtAM3[sets.BurtAM3.index[BurtAM3_ind]])
                    elseif TwoHandedTP == true then
                        ChangeGear(sets.TwoHandedTP[sets.TwoHandedTP.index[TwoHandedTP_ind]])
                    else
                        ChangeGear(sets.OneHandedTP[sets.OneHandedTP.index[OneHandedTP_ind]])
                    end
                end
            elseif player.status == 'Idle' then
                if LockGearIndex then
                    ChangeGear(LockGearSet)
                elseif not LockGearIndex then
					ChangeGear(sets.Sword[sets.Sword.index[Sword_ind]])
					ChangeGear(sets.Shield[sets.Shield.index[Shield_ind]])				
                    ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
                end
            end
        end
elseif name == "cover" then
    if TankingTP_ind == 1 then    
		if gain then
            ChangeGear(sets.Cover.PerfectSet)
            disable('body', 'ring2', 'waist')
        else
            if player.status == 'Engaged' then
                if LockGearIndex then
                    enable('body', 'ring2', 'waist')
                    ChangeGear(LockGearSet)
                else
                    enable('body', 'ring2', 'waist')
                    if TankingTP == true then
						ChangeGear(sets.Sword[sets.Sword.index[Sword_ind]])
						ChangeGear(sets.Shield[sets.Shield.index[Shield_ind]])                        
						ChangeGear(sets.TankingTP[sets.TankingTP.index[TankingTP_ind]])
                    elseif BurtAM3 == true then
                        ChangeGear(sets.BurtAM3[sets.BurtAM3.index[BurtAM3_ind]])
                    elseif TwoHandedTP == true then
                        ChangeGear(sets.TwoHandedTP[sets.TwoHandedTP.index[TwoHandedTP_ind]])
                    else
                        ChangeGear(sets.OneHandedTP[sets.OneHandedTP.index[OneHandedTP_ind]])
                    end
                end
            elseif player.status == 'Idle' then
                if LockGearIndex then
                    enable('body', 'ring2', 'waist')
                    ChangeGear(LockGearSet)
                else
                    enable('body', 'ring2', 'waist')
					ChangeGear(sets.Sword[sets.Sword.index[Sword_ind]])
					ChangeGear(sets.Shield[sets.Shield.index[Shield_ind]])                    
					ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
                end
            end
        end
    elseif TankingTP_ind == 2 then    
		if gain then
            ChangeGear(sets.Cover.PerfectSet2)
            disable('body', 'ring2', 'waist')
        else
            if player.status == 'Engaged' then
                if LockGearIndex then
                    enable('body', 'ring2', 'waist')
                    ChangeGear(LockGearSet)
                else
                    enable('body', 'ring2', 'waist')
                    if TankingTP == true then
						ChangeGear(sets.Sword[sets.Sword.index[Sword_ind]])
						ChangeGear(sets.Shield[sets.Shield.index[Shield_ind]])                        
						ChangeGear(sets.TankingTP[sets.TankingTP.index[TankingTP_ind]])
                    elseif BurtAM3 == true then
                        ChangeGear(sets.BurtAM3[sets.BurtAM3.index[BurtAM3_ind]])
                    elseif TwoHandedTP == true then
                        ChangeGear(sets.TwoHandedTP[sets.TwoHandedTP.index[TwoHandedTP_ind]])
                    else
                        ChangeGear(sets.OneHandedTP[sets.OneHandedTP.index[OneHandedTP_ind]])
                    end
                end
            elseif player.status == 'Idle' then
                if LockGearIndex then
                    enable('body', 'ring2', 'waist')
                    ChangeGear(LockGearSet)
                else
                    enable('body', 'ring2', 'waist')
					ChangeGear(sets.Sword[sets.Sword.index[Sword_ind]])
					ChangeGear(sets.Shield[sets.Shield.index[Shield_ind]])                    
					ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
                end
            end
        end	
    elseif TankingTP_ind == 3 then    
		if gain then
            ChangeGear(sets.Cover.Priwen)
            disable('body', 'ring2', 'waist')
        else
            if player.status == 'Engaged' then
                if LockGearIndex then
                    enable('body', 'ring2', 'waist')
                    ChangeGear(LockGearSet)
                else
                    enable('body', 'ring2', 'waist')
                    if TankingTP == true then
						ChangeGear(sets.Sword[sets.Sword.index[Sword_ind]])
						ChangeGear(sets.Shield[sets.Shield.index[Shield_ind]])                        
						ChangeGear(sets.TankingTP[sets.TankingTP.index[TankingTP_ind]])
                    elseif BurtAM3 == true then
                        ChangeGear(sets.BurtAM3[sets.BurtAM3.index[BurtAM3_ind]])
                    elseif TwoHandedTP == true then
                        ChangeGear(sets.TwoHandedTP[sets.TwoHandedTP.index[TwoHandedTP_ind]])
                    else
                        ChangeGear(sets.OneHandedTP[sets.OneHandedTP.index[OneHandedTP_ind]])
                    end
                end
            elseif player.status == 'Idle' then
                if LockGearIndex then
                    enable('body', 'ring2', 'waist')
                    ChangeGear(LockGearSet)
                else
                    enable('body', 'ring2', 'waist')
					ChangeGear(sets.Sword[sets.Sword.index[Sword_ind]])
					ChangeGear(sets.Shield[sets.Shield.index[Shield_ind]])                    
					ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
                end
            end
        end	
    elseif TankingTP_ind == 4 then    
		if gain then
            ChangeGear(sets.Cover.Aegis)
            disable('body', 'ring2', 'waist')
        else
            if player.status == 'Engaged' then
                if LockGearIndex then
                    enable('body', 'ring2', 'waist')
                    ChangeGear(LockGearSet)
                else
                    enable('body', 'ring2', 'waist')
                    if TankingTP == true then
						ChangeGear(sets.Sword[sets.Sword.index[Sword_ind]])
						ChangeGear(sets.Shield[sets.Shield.index[Shield_ind]])                        
						ChangeGear(sets.TankingTP[sets.TankingTP.index[TankingTP_ind]])
                    elseif BurtAM3 == true then
                        ChangeGear(sets.BurtAM3[sets.BurtAM3.index[BurtAM3_ind]])
                    elseif TwoHandedTP == true then
                        ChangeGear(sets.TwoHandedTP[sets.TwoHandedTP.index[TwoHandedTP_ind]])
                    else
                        ChangeGear(sets.OneHandedTP[sets.OneHandedTP.index[OneHandedTP_ind]])
                    end
                end
            elseif player.status == 'Idle' then
                if LockGearIndex then
                    enable('body', 'ring2', 'waist')
                    ChangeGear(LockGearSet)
                else
                    enable('body', 'ring2', 'waist')
					ChangeGear(sets.Sword[sets.Sword.index[Sword_ind]])
					ChangeGear(sets.Shield[sets.Shield.index[Shield_ind]])                    
					ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
                end
            end
        end	
	elseif TankingTP_ind == 5 then 
		if gain then
            ChangeGear(sets.Cover.MEvaAegis)
            disable('body', 'ring2', 'waist')
        else
            if player.status == 'Engaged' then
                if LockGearIndex then
                    enable('body', 'ring2', 'waist')
                    ChangeGear(LockGearSet)
                else
                    enable('body', 'ring2', 'waist')
                    if TankingTP == true then
						ChangeGear(sets.Sword[sets.Sword.index[Sword_ind]])
						ChangeGear(sets.Shield[sets.Shield.index[Shield_ind]])                        
						ChangeGear(sets.TankingTP[sets.TankingTP.index[TankingTP_ind]])
                    elseif BurtAM3 == true then
                        ChangeGear(sets.BurtAM3[sets.BurtAM3.index[BurtAM3_ind]])
                    elseif TwoHandedTP == true then
                        ChangeGear(sets.TwoHandedTP[sets.TwoHandedTP.index[TwoHandedTP_ind]])
                    else
                        ChangeGear(sets.OneHandedTP[sets.OneHandedTP.index[OneHandedTP_ind]])
                    end
                end
            elseif player.status == 'Idle' then
                if LockGearIndex then
                    enable('body', 'ring2', 'waist')
                    ChangeGear(LockGearSet)
                else
                    enable('body', 'ring2', 'waist')
					ChangeGear(sets.Sword[sets.Sword.index[Sword_ind]])
					ChangeGear(sets.Shield[sets.Shield.index[Shield_ind]])                    
					ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
                end
            end
        end
	elseif TankingTP_ind == 6 then 
		if gain then
            ChangeGear(sets.Cover.Ochain)
            disable('body', 'ring2', 'waist')
        else
            if player.status == 'Engaged' then
                if LockGearIndex then
                    enable('body', 'ring2', 'waist')
                    ChangeGear(LockGearSet)
                else
                    enable('body', 'ring2', 'waist')
                    if TankingTP == true then
						ChangeGear(sets.Sword[sets.Sword.index[Sword_ind]])
						ChangeGear(sets.Shield[sets.Shield.index[Shield_ind]])                        
						ChangeGear(sets.TankingTP[sets.TankingTP.index[TankingTP_ind]])
                    elseif BurtAM3 == true then
                        ChangeGear(sets.BurtAM3[sets.BurtAM3.index[BurtAM3_ind]])
                    elseif TwoHandedTP == true then
                        ChangeGear(sets.TwoHandedTP[sets.TwoHandedTP.index[TwoHandedTP_ind]])
                    else
                        ChangeGear(sets.OneHandedTP[sets.OneHandedTP.index[OneHandedTP_ind]])
                    end
                end
            elseif player.status == 'Idle' then
                if LockGearIndex then
                    enable('body', 'ring2', 'waist')
                    ChangeGear(LockGearSet)
                else
                    enable('body', 'ring2', 'waist')
					ChangeGear(sets.Sword[sets.Sword.index[Sword_ind]])
					ChangeGear(sets.Shield[sets.Shield.index[Shield_ind]])                    
					ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
                end
            end
        end
	else	
		if gain then
            ChangeGear(sets.Cover.Srivatsa)
            disable('body', 'ring2', 'waist')
        else
            if player.status == 'Engaged' then
                if LockGearIndex then
                    enable('body', 'ring2', 'waist')
                    ChangeGear(LockGearSet)
                else
                    enable('body', 'ring2', 'waist')
                    if TankingTP == true then
						ChangeGear(sets.Sword[sets.Sword.index[Sword_ind]])
						ChangeGear(sets.Shield[sets.Shield.index[Shield_ind]])                        
						ChangeGear(sets.TankingTP[sets.TankingTP.index[TankingTP_ind]])
                    elseif BurtAM3 == true then
                        ChangeGear(sets.BurtAM3[sets.BurtAM3.index[BurtAM3_ind]])
                    elseif TwoHandedTP == true then
                        ChangeGear(sets.TwoHandedTP[sets.TwoHandedTP.index[TwoHandedTP_ind]])
                    else
                        ChangeGear(sets.OneHandedTP[sets.OneHandedTP.index[OneHandedTP_ind]])
                    end
                end
            elseif player.status == 'Idle' then
                if LockGearIndex then
                    enable('body', 'ring2', 'waist')
                    ChangeGear(LockGearSet)
                else
                    enable('body', 'ring2', 'waist')
					ChangeGear(sets.Sword[sets.Sword.index[Sword_ind]])
					ChangeGear(sets.Shield[sets.Shield.index[Shield_ind]])                    
					ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
                end
            end
        end
	end	
    elseif name == "hasso" then
        if gain then
        do return end
    else
        send_command('gs c -cd Hasso Lost!')
        end
    end
   
    if name == "aftermath: lv.3" and player.equipment.main == 'Burtgang' then -- Mythic AM3
        if gain then
            BurtAM3 = true
            send_command('timers create "Mythic AM3" 180 down')
             if LockGearIndex then
                ChangeGear(LockGearSet)
            elseif TankingTP == true then
				ChangeGear(sets.Sword[sets.Sword.index[Sword_ind]])
				ChangeGear(sets.Shield[sets.Shield.index[Shield_ind]])                
				ChangeGear(sets.TankingTP[sets.TankingTP.index[TankingTP_ind]])
            else
                ChangeGear(sets.BurtAM3[sets.BurtAM3.index[BurtAM3_ind]])
            end
        else
            BurtAM3 = false
            send_command('timers delete "Mythic AM3";gs c -cd AM3 Lost!!!')
        end
    end
end
 
------------------------------------------
--               Binds                  --
------------------------------------------
send_command('bind f9 gs c toggle TP set') --This means if you hit f9 it toggles the sets
send_command('bind f10 gs c toggle GS WS set') --Changes Reso and Dimidiation sets
send_command('bind f11 gs c ') --Empty
send_command('bind f12 gs c toggle Idle set')
send_command('bind ^f8 gs c toggle SIR') -- Turns Spell Interruption Rate set on
send_command('bind ^f9 input /ws "Torcleaver" <t>') --^ means cntrl
send_command('bind ^f10 input /ws "Atonement" <t>')
send_command('bind ^f11 input /ws "Ground Strike" <t>')
send_command('bind ^f12 input /ws "Savage Blade" <t>')
send_command('bind !f7 gs c toggle TankingTP set') --! means alt, this exists only for toggling outside of this mode being active, otherwise f9
send_command('bind !f8 gs c toggle TankingTP') --! turns tanking tp off
send_command('bind !f9 gs c toggle backwards')
send_command('bind !f10 gs c toggle Other WS set') -- Changes affiliated sword ws sets
send_command('bind !f11 ') --Empty
send_command('bind !f12 gs c lockgearindex')
send_command('bind @s gs c toggle WS Swaps') -- WIN+s toggle WS Swaps
send_command('bind @h gs c toggle High HP Precast Swaps') -- WIN+h toggle precasts to favor High HP swaps
 
send_command('bind !e input /item "Echo Drops" <me>')
send_command('bind !r input /item "Remedy" <me>')
send_command('bind !p input /item "Panacea" <me>')
send_command('bind !h input /item "Holy Water" <me>')
send_command('bind !w input /equip ring2 "Warp Ring"; /echo Warping; wait 11; input /item "Warp Ring" <me>;')
send_command('bind !q input /equip ring2 "Dim. Ring (Holla)"; /echo Reisenjima; wait 11; input /item "Dim. Ring (Holla)" <me>;')
send_command('bind !t gs c toggle TH') -- alt + t toggles TH mode
send_command('bind @w gs c toggle WeaponLock') -- WIN+W locks weapon/sub
send_command('bind @q gs c toggle Shield Set') -- WIN+Q toggles default shield
send_command('bind @e gs c toggle Sword Set') -- WIN+E toggles default sword
 
--Unload Binds
function file_unload()
    send_command('unbind ^f9')
    send_command('unbind ^f10')
    send_command('unbind ^f11')
    send_command('unbind ^f12')
    send_command('unbind !f9')
    send_command('unbind !f10')
    send_command('unbind !f11')
    send_command('unbind !f12')
    send_command('unbind f9')
    send_command('unbind f10')
    send_command('unbind f11')
    send_command('unbind f12')
   
    send_command('unbind !e')
    send_command('unbind !r')
    send_command('unbind !p')
    send_command('unbind !h')
    send_command('unbind !w')
    send_command('unbind !q')
    send_command('unbind !t')
	send_command('unbind @s')
	send_command('unbind @h')
	send_command('unbind @w')
	send_command('unbind @q')
	send_command('unbind @e')
end
 
------------------------------------------
-- Console Commands             --
------------------------------------------
function self_command(command)
    if command == 'togglelock' then
        if SetLocked == false then
            msg("Equipment Set LOCKED!")
        else
            SetLocked = false
            msg("Equipment Set UNLOCKED!")
        end
    elseif command == 'lockgearindex' then
        if LockGearIndex == false then
            LockGearIndex = true
            LockGearSet = {
                ammo = player.equipment.ammo,
                head = player.equipment.head,
                neck = player.equipment.neck,
                ear1 = player.equipment.left_ear,
                ear2 = player.equipment.right_ear,
                body = player.equipment.body,
                hands = player.equipment.hands,
                ring1 = player.equipment.left_ring,
                ring2 = player.equipment.right_ring,
                back = player.equipment.back,
                waist = player.equipment.waist,
                legs = player.equipment.legs,
                feet = player.equipment.feet
            }
            msg("Gear Index Locked")
        else
            LockGearIndex = false
            msg("Gear Index Unlocked")
            if player.status == 'Engaged' then
                if TankingTP == true then
					ChangeGear(sets.Sword[sets.Sword.index[Sword_ind]])
					ChangeGear(sets.Shield[sets.Shield.index[Shield_ind]])                    
					ChangeGear(sets.TankingTP[sets.TankingTP.index[TankingTP_ind]])
                elseif BurtAM3 == true then
                        ChangeGear(sets.BurtAM3[sets.BurtAM3.index[BurtAM3_ind]])
                elseif TwoHandedTP == true then
                    ChangeGear(sets.TwoHandedTP[sets.TwoHandedTP.index[TwoHandedTP_ind]])
                else
                    ChangeGear(sets.OneHandedTP[sets.OneHandedTP.index[OneHandedTP_ind]])
                end
            else
				ChangeGear(sets.Sword[sets.Sword.index[Sword_ind]])
				ChangeGear(sets.Shield[sets.Shield.index[Shield_ind]])                
				ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
            end
        end
    end
	if command == 'toggle WeaponLock' then
		if WeaponLock == true then
			WeaponLock = false
			disable('main','sub')
			send_command('@input /echo <----- Weapon/Sub Swaps Disabled ----->')
		elseif WeaponLock == false then
			WeaponLock = true
			enable('main','sub')
			send_command('@input /echo <----- Weapon/Sub Swaps Enabled ----->')
		end
	end	
	if command == 'toggle WS Swaps' then
		if WSswap == true then
			WSswap = false
			send_command('@input /echo <----- WS Swaps changed to No Swaps ----->')
		elseif WSswap == false then
			WSswap = true
			send_command('@input /echo <----- WS Swaps changed to Allow Swaps ----->')
		end
	end
	if command == 'toggle High HP Precast Swaps' then
		if HighHPprecast == true then
			HighHPprecast = false
			send_command('@input /echo <----- Precast Swaps changed to Normal ----->')
		elseif HighHPprecast == false then
			HighHPprecast = true
			send_command('@input /echo <----- Precast Swaps changed to High HP ----->')
		end
	end
    if command == 'toggle TP set' then
        if TankingTP == true then
            TankingTP_ind = TankingTP_ind + 1
            if TankingTP_ind > #sets.TankingTP.index then TankingTP_ind = 1 end
            send_command('@input /echo <----- TankingTP Set changed to ' .. sets.TankingTP.index[TankingTP_ind] .. ' ----->')
            if player.status == 'Engaged' then
				ChangeGear(sets.Sword[sets.Sword.index[Sword_ind]])
				ChangeGear(sets.Shield[sets.Shield.index[Shield_ind]])                
				ChangeGear(sets.TankingTP[sets.TankingTP.index[TankingTP_ind]])
            end
        elseif TankingTP == false then
            if TwoHandedTP == true then
                TwoHandedTP_ind = TwoHandedTP_ind + 1
                BurtAM3_ind = BurtAM3_ind +1
                if TwoHandedTP_ind > #sets.TwoHandedTP.index then TwoHandedTP_ind = 1 end
                if BurtAM3_ind > #sets.BurtAM3.index then BurtAM3_ind = 1 end
                send_command('@input /echo <----- 2H TP Set changed to ' .. sets.TwoHandedTP.index[TwoHandedTP_ind] .. ' ----->')  
                if player.status == 'Engaged' then
                    if BurtAM3 == true then
                        ChangeGear(sets.BurtAM3[sets.BurtAM3.index[BurtAM3_ind]])
                    else
                        ChangeGear(sets.TwoHandedTP[sets.TwoHandedTP.index[TwoHandedTP_ind]])
                    end
                end
            elseif TwoHandedTP == false then
                OneHandedTP_ind = OneHandedTP_ind + 1
                if OneHandedTP_ind > #sets.OneHandedTP.index then OneHandedTP_ind = 1 end
                send_command('@input /echo <----- 1H TP Set changed to ' .. sets.OneHandedTP.index[OneHandedTP_ind] .. ' ----->')
                if player.status == 'Engaged' then
                    ChangeGear(sets.OneHandedTP[sets.OneHandedTP.index[OneHandedTP_ind]])
                end
            end    
        end
    elseif command == 'toggle Sword Set' then
        Sword_ind = Sword_ind + 1
        if Sword_ind > #sets.Sword.index then Sword_ind = 1 end
        send_command('@input /echo <----- Sword changed to ' .. sets.Sword.index[Sword_ind] .. ' ----->')
        ChangeGear(sets.Sword[sets.Sword.index[Sword_ind]])
	elseif command == 'toggle Shield Set' then
        Shield_ind = Shield_ind + 1
        if Shield_ind > #sets.Shield.index then Shield_ind = 1 end
        send_command('@input /echo <----- Shield changed to ' .. sets.Shield.index[Shield_ind] .. ' ----->')
        ChangeGear(sets.Shield[sets.Shield.index[Shield_ind]])
	elseif command == 'toggle Idle set' then
        Idle_ind = Idle_ind + 1
        if Idle_ind > #sets.Idle.index then Idle_ind = 1 end
        send_command('@input /echo <----- Idle Set changed to ' .. sets.Idle.index[Idle_ind] .. ' ----->')
        ChangeGear(sets.Sword[sets.Sword.index[Sword_ind]])
		ChangeGear(sets.Shield[sets.Shield.index[Shield_ind]])
		ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
    elseif command == 'toggle GS WS set' then
        Torcleaver_ind = Torcleaver_ind + 1
		Resolution_ind = Resolution_ind + 1
        if Torcleaver_ind > #sets.Torcleaver.index then Torcleaver_ind = 1 end
		if Resolution_ind > #sets.Resolution.index then Resolution_ind = 1 end
        send_command('@input /echo <----- WS Sets changed to ' .. sets.Torcleaver.index[Torcleaver_ind] .. ' ----->')
    elseif command == 'toggle Other WS set' then
        SavageBlade_ind = SavageBlade_ind + 1
        Knights_ind = Knights_ind + 1
		CDC_ind = CDC_ind + 1
		SwiftBlade_ind = SwiftBlade_ind + 1
        Requiescat_ind = Requiescat_ind + 1
        BlackHalo_ind = BlackHalo_ind + 1
        Realmrazer_ind = Realmrazer_ind + 1
		ImpulseDrive_ind = ImpulseDrive_ind + 1
		BlackHalo_ind = BlackHalo_ind + 1
		HexaStrike_ind = HexaStrike_ind + 1
        if SavageBlade_ind > #sets.SavageBlade.index then SavageBlade_ind = 1 end
        if Knights_ind > #sets.Knights.index then Knights_ind = 1 end
		if CDC_ind > #sets.CDC.index then CDC_ind = 1 end
        if SwiftBlade_ind > #sets.SwiftBlade.index then SwiftBlade_ind = 1 end		
        if Requiescat_ind > #sets.Requiescat.index then Requiescat_ind = 1 end
        if BlackHalo_ind > #sets.Upheaval.index then BlackHalo_ind = 1 end
        if Realmrazer_ind > #sets.Realmrazer.index then Realmrazer_ind = 1 end
		if ImpulseDrive_ind > #sets.ImpulseDrive.index then ImpulseDrive_ind = 1 end
		if BlackHalo_ind > #sets.BlackHalo.index then BlackHalo_ind = 1 end
		if HexaStrike_ind > #sets.HexaStrike.index then HexaStrike_ind = 1 end
        send_command('@input /echo <----- Sword/Club WS Set changed to ' .. sets.SavageBlade.index[SavageBlade_ind] .. ' ----->')
    elseif command == 'toggle TankingTP set' then
        TankingTP_ind = TankingTP_ind + 1
        if TankingTP_ind > #sets.TankingTP.index then TankingTP_ind = 1 end
        send_command('@input /echo <----- TankingTP Set changed to ' .. sets.TankingTP.index[TankingTP_ind] .. ' ----->')
        if player.status == 'Engaged' then
            ChangeGear(sets.TankingTP[sets.TankingTP.index[TankingTP_ind]])
        end
    elseif command == 'toggle TankingTP' then
        if TankingTP == true then
            TankingTP = false
            send_command('@input /echo <----- Tanking TP: [Off] ----->')
        else
            TankingTP = true
            send_command('@input /echo <----- Tanking TP: [On] ----->')
        end
        status_change(player.status)
    elseif command == 'toggle TwoHandedTP' then
        if TwoHandedTP == true then
            TwoHandedTP = false
            send_command('@input /echo <----- 2H TP: [Off] ----->')
        else
            TwoHandedTP = true
            send_command('@input /echo <----- 2H TP: [On] ----->')
        end
        status_change(player.status)
    elseif command == 'toggle SIR' then
        if SIR == true then
            SIR = false
            send_command('@input /echo <----- Spell Interruption Rate: [Off] ----->')
        else
            SIR = true
            send_command('@input /echo <----- Spell Interruption Rate: [On] ----->')
        end
        status_change(player.status)
    elseif command == 'toggle TH' then
        if TH == true then
            TH = false
            send_command('@input /echo <----- Treasure Hunter TP: [Off] ----->')
        else
            TH = true
            send_command('@input /echo <----- Treasure Hunter TP: [On] ----->')
        end
        status_change(player.status)
    elseif command == 'toggle backwards' then
        if TankingTP == true then
            TankingTP_ind = TankingTP_ind -1
            if TankingTP_ind == 0 then
                TankingTP_ind = #sets.TankingTP.index
            end
            send_command('@input /echo <----- TankingTP Set changed to ' .. sets.TankingTP.index[TankingTP_ind] .. ' ----->')
            if player.status == 'Engaged' then
                ChangeGear(sets.TankingTP[sets.TankingTP.index[TankingTP_ind]])
            end
        elseif TankingTP == false then
            if TwoHandedTP == true then
                TwoHandedTP_ind = TwoHandedTP_ind -1
                BurtAM3_ind = BurtAM3_ind -1
                if TwoHandedTP_ind == 0 then
                    TwoHandedTP_ind = #sets.TwoHandedTP.index
                end
                if BurtAM3_ind == 0 then
                    BurtAM3_ind = #sets.BurtAM3.index
                end
                send_command('@input /echo <----- 2H TP Set changed to ' .. sets.TwoHandedTP.index[TwoHandedTP_ind] .. ' ----->')  
                if player.status == 'Engaged' then
                    if BurtAM3 == true then
                        ChangeGear(sets.BurtAM3[sets.BurtAM3.index[BurtAM3_ind]])
                    else
                        ChangeGear(sets.TwoHandedTP[sets.TwoHandedTP.index[TwoHandedTP_ind]])
                    end
                end
            elseif TwoHandedTP == false then
                OneHandedTP_ind = OneHandedTP_ind -1
                if OneHandedTP_ind == 0 then
                    OneHandedTP_ind = #sets.OneHandedTP.index
                end
                if player.status == 'Engaged' then
                    ChangeGear(sets.OneHandedTP[sets.OneHandedTP.index[TP_ind]])
                end
            end
        end
    elseif command == 'ZoneChange' then
        IdleState()
    elseif string.sub(command, 0, 4) == '-cd ' then     --If the first 4 characters of the command are '-cd '
        add_to_chat (30, string.sub(command, 5, string.len(command)))      --add everything after '-cd ' to a message in the chat
    end
end
 
------------------------------------------
-- Character States                     --
------------------------------------------
function IdleState()
    if LockGearIndex then
        ChangeGear(LockGearSet)
    elseif not LockGearIndex then
        ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
    end
   
    if player.mpp <= 50 and Idle_ind == 2 then --standard idle
        --ChangeGear({body = "Sacro Breastplate"})
    elseif player.mpp <= 50 and Idle_ind == 3 then -- buff duration
        ChangeGear({})
    end
       
    if Town:contains(world.area) and player.mpp < 75 then
        ChangeGear(sets.Sword[sets.Sword.index[Sword_ind]])
		ChangeGear(sets.Shield[sets.Shield.index[Shield_ind]])        
		ChangeGear(set_combine(sets.Idle.Town, {}))
        elseif Town:contains(world.area) then
        ChangeGear(sets.Sword[sets.Sword.index[Sword_ind]])
		ChangeGear(sets.Shield[sets.Shield.index[Shield_ind]])                
		ChangeGear(sets.Idle.Town)
    end
   
end
 
windower.raw_register_event('zone change',function()
windower.send_command('@wait 9; input //gs c ZoneChange')
end)
 
function RestingState()
 
end
 
function EngagedState()
    if LockGearIndex then
        ChangeGear(LockGearSet)
    elseif not LockGearIndex then
        if TankingTP == true then
			ChangeGear(sets.Sword[sets.Sword.index[Sword_ind]])
			ChangeGear(sets.Shield[sets.Shield.index[Shield_ind]])
			ChangeGear(sets.TankingTP[sets.TankingTP.index[TankingTP_ind]])
        elseif buffactive["Aftermath: Lv.3"] and player.equipment.main == 'Burtgang' then --am3
            BurtAM3 = true
            ChangeGear(sets.BurtAM3[sets.BurtAM3.index[BurtAM3_ind]])  
        elseif TwoHandedTP == true then
            BurtAM3 = false
            ChangeGear(sets.TwoHandedTP[sets.TwoHandedTP.index[TwoHandedTP_ind]])
        else
            BurtAM3 = false
            ChangeGear(sets.OneHandedTP[sets.OneHandedTP.index[OneHandedTP_ind]])
        end
    end
end
 
-----------------------------
--      Spell control      --
-----------------------------
unusable_buff = {
    spell={'Charm','Mute','Omerta','Petrification','Silence','Sleep','Stun','Terror'},
    ability={'Amnesia','Charm','Impairment','Petrification','Sleep','Stun','Terror'}}
  --check_recast('ability',spell.recast_id)  check_recast('spell',spell.recast_id)
function check_recast(typ,id) --if spell can be cast(not in recast) return true
    local recasts = windower.ffxi['get_'..typ..'_recasts']()
    if id and recasts[id] and recasts[id] == 0 then
        return true
    else
        return false
    end
end
 --return true if spell/ability is unable to be used at this time
function spell_control(spell)
    if spell.type == "Item" then
        return false
    --Stops spell if you do not have a target
    elseif spell.target.name == nil and not spell.target.raw:contains("st") then
        return true
    --Stops spell if a blocking buff is active
    elseif spell.action_type == 'Ability' and spell.type ~= 'WeaponSkill' and (has_any_buff_of(unusable_buff.ability) or not check_recast('ability',spell.recast_id)) then
        return true
    elseif spell.type == 'WeaponSkill' and player.tp < 1000 then
        return true
    elseif spell.type == 'WeaponSkill' and (has_any_buff_of(unusable_buff.ability)) then
        msg("Weapon Skill Canceled, Can't")
        return true
    elseif spell.action_type == 'Magic' and (has_any_buff_of(unusable_buff.spell)
      or not check_recast('spell',spell.recast_id)) then
        return true
    --Stops spell if you do not have enough mp/tp to use
    elseif spell.mp_cost and spell.mp_cost > player.mp and not has_any_buff_of({'Manawell','Manafont'}) and not spell.action_type == 'Ability' then
        msg("Spell Canceled, Not Enough MP")
        return true
    end
    --Calculate how many finishing moves your char has up to 6
    local fm_count = 0
    for i, v in pairs(buffactive) do
        if tostring(i):startswith('finishing move') or tostring(i):startswith('?????????') then
            fm_count = tonumber(string.match(i, '%d+')) or 1
        end
    end
    --Stops flourishes if you do not have enough finishing moves
    local min_fm_for_flourishes = {['Animated Flourish']=1,['Desperate Flourish']=1,['Violent Flourish']=1,['Reverse Flourish']=1,['Building Flourish']=1,
                                   ['Wild Flourish']=2,['Climactic Flourish']=1,['Striking Flourish']=2,['Ternary Flourish']=3,}
    if min_fm_for_flourishes[spell.en] then
        if min_fm_for_flourishes[spell.en] > fm_count and not buffactive[507] then
            return true
        end
    end
    --Reomves Sneak when casting Spectral Jig
    if spell.en == 'Spectral Jig' then
        send_command('cancel 71')
    end
    if spell.name == 'Utsusemi: Ichi' and overwrite and buffactive['Copy Image (3)'] then
        return true
    end
    if player.tp >= 1000 and player.target and player.target.distance and player.target.distance > 7 and spell.type == 'WeaponSkill' then
        msg("Weapon Skill Canceled  Target Out of Range")
        return true
    end
end
 
------------------------------------------
--              Precast                 --
------------------------------------------
function has_any_buff_of(buff_set)--returns true if you have any of the buffs given
    for i,v in pairs(buff_set) do
        if buffactive[v] ~= nil then return true end
    end
end
--JA Sets--
function pc_JA(spell, act)
    if spell.english == 'Invincible' then
        ChangeGear(sets.JA.Invincible)
    elseif spell.english == 'Swordplay' then
        ChangeGear(sets.JA.Swordplay)
    elseif spell.english == 'Vallation' or spell.english == 'Valiance' then
        ChangeGear(sets.JA.Vallation)
    elseif spell.english == 'Pflug' then
        ChangeGear(sets.JA.Pflug)
    elseif spell.english == 'Rampart' then
        ChangeGear(sets.JA.Rampart)
    elseif spell.english == 'Intervene' then
        ChangeGear(sets.JA.Intervene)
    elseif spell.english == 'Lunge' or spell.english == 'Swipe' then
        ChangeGear(sets.JA.Lunge)
    elseif spell.english == 'Meditate' then
        ChangeGear(sets.JA.Meditate)
    elseif spell.english == 'Provoke' then
        ChangeGear(sets.JA.Provoke)
    elseif spell.english == 'Warcry' then
        ChangeGear(sets.JA.Warcry)
	elseif spell.english == 'Sentinel' then
        ChangeGear(sets.JA.Sentinel)
	elseif spell.english == 'Shield Bash' then
        ChangeGear(sets.JA.ShieldBash)
	elseif spell.english == 'Fealty' then
        ChangeGear(sets.JA.Fealty)
	elseif spell.english == 'Chivalry' then
        ChangeGear(sets.JA.Chivalry)
	elseif spell.english == 'Divine Emblem' then
        ChangeGear(sets.JA.DivineEmblem)
	elseif spell.english == 'Holy Circle' then
        ChangeGear(sets.JA.HolyCircle)
	elseif spell.english == 'Sepulcher' then
        ChangeGear(sets.JA.Sepulcher)
	elseif spell.english == 'Last Resort' then
        ChangeGear(sets.JA.LastResort)
	elseif spell.english == 'Soul Eater' then
        ChangeGear(sets.JA.SoulEater)
	elseif spell.english == 'Arcane Circle' then
        ChangeGear(sets.JA.ArcaneCircle)
	elseif spell.english == 'Weapon Bash' then
        ChangeGear(sets.JA.WeaponBash)
    end
 
    IgnoreWS = S { "Sanguine Blade", "Red Lotus Blade", "Flash Nova", "Realmrazer" }  -- Excluded from Moonshade TP override rule.
    BrutalWS = S { "Savage Blade", "Torcleaver", "Resolution" }
    STRWS = S {"Vorpal Blade", "Circle Blade", "Shockwave" } -- Just uses the Torcleaver Set
   
   
    if spell.type == 'WeaponSkill' then
        if WSswap == true then
			if spell.english == 'Requiescat' then
				ChangeGear(sets.Requiescat[sets.Requiescat.index[Requiescat_ind]])
			elseif spell.english == 'Ground Strike' or spell.english == 'Torcleaver' or STRWS:contains(spell.english) then
				ChangeGear(sets.Torcleaver[sets.Torcleaver.index[Torcleaver_ind]])
			elseif spell.english == 'Resolution' then
				ChangeGear(sets.Resolution[sets.Resolution.index[Resolution_ind]])				
			elseif spell.english == 'Savage Blade' then
				ChangeGear(sets.SavageBlade[sets.SavageBlade.index[SavageBlade_ind]])
			elseif spell.english == 'Knights of Round' then
				ChangeGear(sets.Knights[sets.Knights.index[Knights_ind]])
			elseif spell.english == 'Atonement' then
				if player.tp == 3000 then
					ChangeGear(set_combine(sets.Atonement[sets.Atonement.index[Atonement_ind]], {waist="Creed Baudrier", ear2="Cryptic Earring"}))
				elseif player.tp >= 2900 then
					ChangeGear(set_combine(sets.Atonement[sets.Atonement.index[Atonement_ind]], {waist="Creed Baudrier"}))
				else
					ChangeGear(sets.Atonement[sets.Atonement.index[Atonement_ind]])
				end
			elseif spell.english == 'Chant du Cygne' then
				ChangeGear(sets.CDC[sets.CDC.index[CDC_ind]])				
			elseif spell.english == 'Swift Blade' then
				ChangeGear(sets.SwiftBlade[sets.SwiftBlade.index[SwiftBlade_ind]])
			elseif spell.english == 'Flash Nova' or spell.english == 'Red Lotus Blade' then
				ChangeGear(sets.FlashNova)
			elseif spell.english == 'Sanguine Blade' then
				ChangeGear(sets.SanguineBlade)
			elseif spell.english == 'Impulse Drive' or spell.english == 'Sonic Thrust' then
				ChangeGear(sets.ImpulseDrive[sets.ImpulseDrive.index[ImpulseDrive_ind]])
			elseif spell.english == 'Black Halo' then
				ChangeGear(sets.BlackHalo[sets.BlackHalo.index[BlackHalo_ind]])
			elseif spell.english == 'Hexa Strike' then
				ChangeGear(sets.HexaStrike[sets.HexaStrike.index[HexaStrike_ind]])	
			end
			if player.tp > 2025 and player.equipment.main == 'Sequence' and buffactive['TP Bonus'] then
				if IgnoreWS:contains(spell.english) then
					do return end
				elseif BrutalWS:contains(spell.english) then
					equip(set_combine(equipSet, { ear2 = "Brutal Earring" })) --Watch for ear conflicts between TP sets and WS sets
					msg("Brutal Earring equiped !!!!")
				else
					equip(set_combine(equipSet, { ear2 = "Telos Earring" }))
					msg("Telos Earring equiped !!!!")
				end
			elseif player.tp > 2275 and player.equipment.main == 'Sequence' then
				if IgnoreWS:contains(spell.english) then
					do return end
				elseif BrutalWS:contains(spell.english) then
					equip(set_combine(equipSet, { ear2 = "Brutal Earring" })) --Watch for ear conflicts between TP sets and WS sets
					msg("Brutal Earring equiped !!!!")
				else
					equip(set_combine(equipSet, { ear2 = "Telos Earring" }))
					msg("Telos Earring equiped !!!!")
				end
			elseif player.tp > 2550 and buffactive['TP Bonus'] then
				if IgnoreWS:contains(spell.english) then
					do return end
				elseif BrutalWS:contains(spell.english) then
					equip(set_combine(equipSet, { ear2 = "Brutal Earring" })) --Watch for ear conflicts between TP sets and WS sets
					msg("Brutal Earring equiped !!!!")
				else
					equip(set_combine(equipSet, { ear2 = "Telos Earring" }))
					msg("Telos Earring equiped !!!!")
				end
			elseif player.tp > 2775 then
				if IgnoreWS:contains(spell.english) then
					do return end
				elseif BrutalWS:contains(spell.english) then
					equip(set_combine(equipSet, { ear2 = "Brutal Earring" })) --Watch for ear conflicts between TP sets and WS sets
					msg("Brutal Earring equiped !!!!")
				else
					equip(set_combine(equipSet, { ear2 = "Telos Earring" }))
					msg("Telos Earring equiped !!!!")
				end
			end
		end
	end
 
    if string.find(spell.english,'Step') then
        ChangeGear(set_combine(sets.TwoHandedTP.AccuracyFull, sets.Utility.TH))
    elseif spell.english == 'Animated Flourish' then
        ChangeGear(sets.Enmity)
    end
end
 
function pc_Magic(spell, act)
    if spell.skill == 'Enhancing Magic' then
        if HighHPprecast == true then
			ChangeGear(sets.precast.FastCast.Enhancing.HighHP)
		else
			ChangeGear(sets.precast.FastCast.Enhancing)
		end
	elseif spell.skill == 'Healing Magic' and spell.target.type == 'SELF' then
		ChangeGear(sets.precast.FastCast.CureCheat)
    else
        if HighHPprecast == true then
			ChangeGear(sets.precast.FastCast.HighHP)
		else
			ChangeGear(sets.precast.FastCast.Standard)
		end
    end
end
 
function pc_Item(spell, act)
end
 
 
------------------------------------------
-- Midcast                 --
------------------------------------------
function mc_JA(spell, act)
end
 
function mc_Magic(spell, act)
    if spell.skill == 'Enhancing Magic' then
		if spell.english == 'Aquaveil' then
            ChangeGear(sets.SIR)
        elseif spell.english == 'Refresh' then
            ChangeGear(sets.Enhancing.Refresh)
        elseif string.find(spell.english,'Regen') then
            ChangeGear(sets.Enhancing.Regen)
        elseif string.find(spell.english,'Reprisal') then
            ChangeGear(sets.Enhancing.Reprisal)
        elseif string.find(spell.english,'Bar') then
            ChangeGear(sets.Enhancing.Skill)
        elseif spell.english == 'Phalanx' then
            ChangeGear(sets.Enhancing.Phalanx)
        elseif string.find(spell.english,'Shell') or string.find(spell.english,'Protect') then
            ChangeGear(sets.Enhancing.ProShell)
        else
            ChangeGear(sets.Enhancing.Duration)
        end
    elseif spell.skill == 'Healing Magic' then
        if spell.target and spell.target.type == 'SELF' then
            ChangeGear(sets.Cures.SelfCures)
        else
            ChangeGear(sets.Cures)
        end
    elseif spell.skill == 'Enfeebling Magic' then
        if spell.english == 'Sleepga' or spell.english == 'Poisonga' and TH == true then --For tanking/pulling Divergence to TH tag everything
            ChangeGear(set_combine(sets.Enmity, sets.Utility.TH))
        end
    elseif spell.skill == 'Divine Magic' then		
		if string.find(spell.english,'Enlight') then
				ChangeGear(sets.Enhancing.Enlight)
		end
		if (string.find(spell.english,'Holy') or string.find(spell.english,'Holy II')) then
			if (buffactive['Aurorastorm'] or world.weather_element == 'Light' or world.day_element == 'Light') then
				ChangeGear(sets.HolyAura)
			else	
				ChangeGear(sets.Holy)
			end
		end
    end
 
    if BlueMagic_Enmity:contains(spell.english) then
        ChangeGear(sets.BlueMagic.Enmity)
    elseif BlueMagic_Buffs:contains(spell.english) then
        ChangeGear(sets.TankingTP.Inq)
    elseif PhysicalSpells:contains(spell.english) then
        ChangeGear(sets.BlueMagic.STR)
    elseif BlueMagic_Healing:contains(spell.english) then
        if spell.target and spell.target.type == 'SELF' then
            if player.hpp < 51 then
				ChangeGear(sets.Cures.SelfCures.SIR)
			else
				ChangeGear(sets.Cures.SelfCures)
			end
        else
            ChangeGear(sets.Cures)
        end
    elseif RUNMagic_Enmity:contains(spell.english) then
        ChangeGear(sets.EnmitySpells)
    end
   
    if buffactive['Tenebrae'] and spell.english == 'Lunge' or spell.english == 'Swipe' then
        equip(sets.JA.Lunge,{head="Pixie Hairpin +1"})
    end
   
end
 
function mc_Item(spell, act)
end
 
 
------------------------------------------
-- After Cast               --
------------------------------------------
function ac_JA(spell)
end
 
function ac_Magic(spell)
end
 
function ac_Item(spell)
end
 
function ac_Global()
    if LockGearIndex == true then
        ChangeGear(LockGearSet)
        msg("Lock Gear is ON -- Swapping Gear")
    else
        if player.status == 'Engaged' then
            EngagedState()
        else
            IdleState()
        end
    end
end
 
------------------------------------------
-- Framework Core            --
------------------------------------------
function status_change(new, old)
    if new == 'Idle' then
        IdleState()
    elseif new == 'Resting' then
        RestingState()
    elseif new == 'Engaged' then
        EngagedState()
    end
   
    if player.status == 'Engaged' and TH == true then
        ChangeGear(set_combine(equipSet, sets.Utility.TH))         
    end
   
    if S{1,4,6,7,8,10,12}:contains(gearswap.res.items:with('en', player.equipment.main).skill) then --Checks mainhand weapon for TP set choice. See below for notes on #s
        TwoHandedTP = true 
    else
        TwoHandedTP = false
    end
   
end
 
--Numbers in the 1H 2H TP mode rule:
--1 = Hand-to-Hand
--2 = Dagger
--3 = Sword
--4 = Great Sword
--5 = Axe
--6 = Great Axe
--7 = Scythe
--8 = Polearm
--9 = Katana
--10 = Great Katana
--11 = Club
--12 = Staff
 
 
function precast(spell, act)
    if spell_control(spell) then
        cancel_spell()
        return
    end
    if spell.action_type == 'Ability' then
        pc_JA(spell, act)
    elseif spell.action_type == 'Magic' then
        pc_Magic(spell, act)
    else
        pc_Item(spell, act)
    end
end
 
function midcast(spell, act)
    IgnoreSIRSpell = S { "Phalanx", "Refresh", "Regen"}  -- Excluded from Spell Interruption Rate override rule.
    if spell.action_type == 'Ability' then
        mc_JA(spell, act)
    elseif spell.action_type == 'Magic' then
        if SIR == true then
            if IgnoreSIRSpell:contains(spell.english) and not string.find(spell.english,'Bar') then
                mc_Magic(spell, act)
            else
                ChangeGear(sets.SIR)
            end
        else
            mc_Magic(spell, act)
        end
    else
        mc_Item(spell, act)
    end
end
 
function aftercast(spell, act)
    if spell.action_type == 'Ability' then
        ac_JA(spell)
    elseif spell.action_type == 'Magic' then
        ac_Magic(spell)
    else
        ac_Item(spell)
    end
    ac_Global()
   
    --Countdowns--
    if not spell.interrupted then
        if spell.english == "Meditate" then
            send_command('wait 170;gs c -cd '..spell.name..': [Ready In 10 Seconds!];wait 10;gs c -cd '..spell.name..': [Ready !]')
        elseif spell.english == "Sekkanoki" then
            send_command('wait 290;gs c -cd '..spell.name..': [Ready In 10 Seconds!];wait 10;gs c -cd '..spell.name..': [Ready !]')
        elseif spell.english == "Swordplay" then
            send_command('wait 290;gs c -cd '..spell.name..': [Ready In 10 Seconds!];wait 10;gs c -cd '..spell.name..': [Ready !]')
        elseif spell.english == "One for All" then
            send_command('wait 290;gs c -cd '..spell.name..': [Ready In 10 Seconds!];wait 10;gs c -cd '..spell.name..': [Ready !]')
        elseif spell.english == "Battuta" then
            send_command('wait 290;gs c -cd '..spell.name..': [Ready In 10 Seconds!];wait 10;gs c -cd '..spell.name..': [Ready !]')
        elseif spell.english == "Liement" then
            send_command('wait 170;gs c -cd '..spell.name..': [Ready In 10 Seconds!];wait 10;gs c -cd '..spell.name..': [Ready !]')
        end
    end
   
    if S{4,6,7,8,10,12}:contains(gearswap.res.items:with('en', player.equipment.main).skill) then --Checks mainhand weapon for TP set choice. See bottom for notes on #s
        TwoHandedTP = true
    else
        TwoHandedTP = false
    end
   
end
   
   
function ChangeGear(GearSet)
    equipSet = GearSet
    equip(GearSet)
end
 
function LockGearSet(GearSet)
    LockedEquipSet = GearSet
    equip(GearSet)
    SetLocked = true
end
 
function UnlockGearSet()
    locked = false
    equip(equipSet)
end