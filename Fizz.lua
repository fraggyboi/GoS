




function OnProcessSpell(Object,spellProc) --Object is a pointer to the caster of the spell; spellProc is a struct with some spell datas
--spellProc.name = the name of the current spell cast (including autoattacks and such)
--spellProc.windUpTime = number holding the value of the required animation time for an attack to complete
--spellProc.animationTime = number holding the full animation time of an attack or spell (always greater than windUpTime)
--spellProc.castSpeed = proportional to "GetAttackSpeed(myHero);", returns the speed value of the casted spell or attack.
--spellProc.startPos.x
--spellProc.startPos.y = returns a VECTOR holding the starting position of the spell cast (often the same as GetOrigin(Object))
--spellProc.startPos.z 
--||||||||||||||||||||
--spellProc.endPos.x
--spellProc.endPos.y = returns a VECTOR holding the ending position of the spell cast (often the same as GetOrigin(Object))
--spellProc.endPos.z 
--||||||||||||||||||||
--spellProc.target = returns a pointer to a target if there is any (for example Ryze Q is skillshot without target, but his W does have target)

if myher0 == Object then
	--MessageBox(0,spellProc.name,tostring(spellProc.windUpTime),0);
	end

end



function ObjectLoopEvent(Object,myHero) --Object is a pointer to the current object, ObjectLoopEvent is looping trough all objects each frame.

end



function AfterObjectLoopEvent(myHero) --myHero is pointer to our champion; AfterObjectLoopEvent itself is happening every game frame.

myher0 = myHero;
-- print all the local variables we got so far from myHero
DrawText("Remember that this script is still in BETA.",24,0,0,0xffff0000);

local Obj_Type = GetObjectType(myHero); --returns string holding the name of the object type (champion, minion, turret, etc)
local Obj_BaseName = GetObjectBaseName(myHero); --returns a string holding the basename, often used when GetObjectName is empty or incorrect
local deadflag = IsDead(myHero); --returns a boolean, true if dead, false if alive
local team = GetTeam(myHero); --returns an int, holding the team (100;200 or 300 for jungle team)
local origin = GetOrigin(myHero); --returns a xyz VECTOR of the specific object in the world; in this case "origin.x" "origin.y" and "origin.z"
local currhp = GetCurrentHP(myHero); --returns the current health of the object
local maxhp = GetMaxHP(myHero);  --returns the maximum health of the object
local junglecampbool = IsCampusUp(myHero);  --this can't be used with myHero object, instead only for a jungle camp, will return true if it's UP
local currmana = GetCurrentMana(myHero);  --returns the current mana/energy of the champion (should be 0 for Katarina, Vladimir, etc)
local maxmana = GetMaxMana(myHero); --returns the maximum mana/energy of the champion
local magicshield = GetMagicShield(myHero); --returns the value of the magic damage shield applied to the champion (probably by Morgana E)
local dmgshield = GetDmgShield(myHero);  --returns the standart shield value a champion has (like Riven E; Lux W; and much more)
local champname = GetObjectName(myHero);  --returns a string with the champion name (for example Ryze, Annie etc)
local cdr = GetCDR(myHero);  --returns the cooldown reduction of the champion
local apf = GetArmorPenFlat(myHero);  --returns the flat armor penetration value of the champion (probably by runes or blrutalizer item)
local mpf = GetMagicPenFlat(myHero);  --returns the same thing as above, but for flat magic penetration
local app = GetArmorPenPercent(myHero);  --returns the percentage of armor penetration
local mpp = GetMagicPenPercent(myHero);  --returns the percentage of magic penetration
local bonusdmg = GetBonusDmg(myHero); --returns the bonus AD damage by items/runes/buffs etc
local bonusap = GetBonusAP(myHero); --returns the bonus AP damage by items/runes/buffs etc
local lifesteal = GetLifeSteal(myHero); --returns the lifesteal percentage of a champion
local spellvamp = GetSpellVamp(myHero); --returns the spellvamp percentage of a champion
local attspd = GetAttackSpeed(myHero); --returns the attack speed percentage of a champion
local basedmg = GetBaseDamage(myHero); --returns the base champion attack damage (works for minions and others too)
local crit = GetCritChance(myHero); --returns the critical strike percentage of a champion
local armor = GetArmor(myHero); --returns the total armor of an object
local magicres = GetMagicResist(myHero);  --returns the magic resist of an object
local hpregen = GetHPRegen(myHero);  --returns the health regeneration ratio of an object
local mpregen = GetMPRegen(myHero);  --returns the mana/energy regeneration of an object
local movespd = GetMoveSpeed(myHero);  --returns the move speed of an object
local range = GetRange(myHero); --returns the attack range of an object


local buffbool = GotBuff(myHero,"OdinRecall"); --returns true if we have a specific buff; "OdinRecall" is the recalling buff in "The Crystal Scar"
--test1 = GetBuffCount(myHero,4); --returns a value bigger than 1 (if the buff at index 4 is actually valid, min index 0, max index 63)
--testname = GetBuffName(myHero,4); --returns a string with a buffname (if the buff at index 4 is valid and has GetBuffCount(myHero,4) > 0)
--immune = IsImmune(Object,myHero); --returns a boolean true if the "Object" is immune to damage and can't be killed (Tryndamere ulti; etc)

local potionslot = GetItemSlot(myHero,2003); --returns a value > than 0 if the item is found; this value is used in CastSpell as slot

local castlevel = GetCastLevel(myHero,_Q); --returns how much the Q spell has been leveled up
local castrange = GetCastRange(myHero,_Q); --returns the range of the Q spell determined by the game engine
local castmana = GetCastMana(myHero,_Q,castlevel);  --returns the mana required to cast Q on the specific level it is
local castcd = GetCastCooldown(myHero,_Q,castlevel);  --returns the cooldown of the Q spell depending on the level it is currently
local castname = GetCastName(myHero,_Q);  --returns the current name of the Q spell (it changes for Nidalee and other champs depending on form)
local castusage = CanUseSpell(myHero,_Q); --returns the current state of the Q spell; READY=0;NOTAVAILABLE=1;NOTLEARNED=2;READYNONCAST=3;UNKNOWN=4;ONCOOLDOWN=5;


local hitboxsize = GetHitBox(myHero); --returns a value with the "size (range)" of the object's hitbox
local mylevel = GetLevel(myHero); --returns an int value from 1 to 18 with the player's level
local myexp = GetExperience(myHero);  --returns a value with the total experience gained so far
local amivisible = IsVisible(myHero);  --returns a boolean if an object is visible (not in Fog Of War)
local isobjalive = IsObjectAlive(myHero); --returns a boolean if the object is not dead and has health bigger than 0



--CastTargetSpell(Object,_Q); --casts Q spell at target "Object"
--CastSkillshot(_Q,origin.x,origin.y,origin.z); --casts Q spell as a skillshot at target location "origin"
--MoveToXYZ(origin.x,origin.y,origin.z); --Moves your champion to "origin"
--HoldPosition(); --stops your champion from attacking and moving
--AttackUnit(Object);  --attacks "Object" with an auto-attack if it's an enemy.

if capspress then  --checking if boolean capspress is true; then showing a messagebox
	MessageBox(0,"testmsg","testcapt",0);  --1st param window handle, 2nd param string message, 3rd param caption message, 4th param icon type
	end

	


local myscreenpos = WorldToScreen(1,origin.x,origin.y,origin.z); --transforms xyz to screen xy coordinates; (params: visfix,x,y,z; and returns a struct x,y,flag)
if myscreenpos.flag then
	DrawText("D3ftsu Mode",24,myscreenpos.x,myscreenpos.y,0xffff0000); --draws a text to XY coords; (params: text,size,x,y,color)
	--if "size" is not 12, but 0 it will use GoS setting set by the user for default text size
	
	end

local mousepos = GetMousePos(); --returns a xyz VECTOR of your mouse position in the 3d world


local myTarget = GetCurrentTarget(); --returns your current target (if any available) based on current GoS logic.

function ValidTarget(unit, range)
if GetOrigin(unit) == nil or IsDead(unit) or GetTeam(unit) == GetTeam(myHero) or GetDistance(GetOrigin(unit)) > range*range then return false end
return true
end
 
function GetDistance(p1,p2)
p2 = p2 or myHeroPos
local dx = p1.x - p2.x
local dz = (p1.z or p1.y) - (p2.z or p2.y)
return dx*dx + dz*dz
end

  if not KeyIsDown(0x20) then return end
    if ValidTarget(unit, range) then
     if CanUseSpell(myHero, _W) == READY and GetDistance(GetOrigin(target), GetOrigin(myHero)) < 200*200 then
	 CastSpell(_W)
	 end
	 if CanUseSpell(myHero, _Q) == READY and GetDistance(GetOrigin(target), GetOrigin(myHero)) < 550*550 then
	 CastTargetSpell(_Q)
	 end
	 if CanUseSpell(myHero, _R) == READY and GetDistance(GetOrigin(target), GetOrigin(myHero)) < 1000*1000 then
	 CastTargetSpell(_R)
	 end
	 if CanUseSpell(myHero, _E) == READY and GetDistance(GetOrigin(target), GetOrigin(myHero)) < 900*900 then
	 CastTargetSpell(_E)
	 end
  end
      if walk then
        walk = false
        MoveToXYZ(mousePos.x, mousePos.y, mousePos.z)
      else
        walk = true
        AttackUnit(unit)
      end
    else
      MoveToXYZ(mousePos.x, mousePos.y, mousePos.z)
    end
end	
end
