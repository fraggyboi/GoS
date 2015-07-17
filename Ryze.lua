local myHero = nil
local myHeroPos = nil

function AfterObjectLoopEvent(myHer0)
    myHero = myHer0
    myHeroPos = GetOrigin(myHero)
	origin = GetOrigin(target)
		DrawText("Remember that this is still in alpha version.",24,0,0,0xffff0000);
		
	local castusage = CanUseSpell(myHero,_Q);
	local target = GetCurrentTarget()
	if ValidTarget(target, 900) then
	local capspress = KeyIsDown(0x14);
    if capspress then
	local castusage = CanUseSpell(myHero,_Q);
	if castusage == READY then
		local mousepos = GetMousePos();
		CastSkillShot(_Q,origin.x,origin.y,origin.z);
		end
	end
			if CanUseSpell(myHero, _R) == READY and GetDistance(GetOrigin(target), GetOrigin(myHero)) < 650*650 then
				CastTargetSpell(myHero, _R)
			end
			if CanUseSpell(myHero, _W) == READY and GetDistance(GetOrigin(target), GetOrigin(myHero)) < 600*600 then
				CastTargetSpell(target, _W)
			end
			if CanUseSpell(myHero, _E) == READY and GetDistance(GetOrigin(target), GetOrigin(myHero)) < 600*600 then
				CastTargetSpell(target, _E)
			end
end	
end
	
function ValidTarget(unit, range)
	range = range or math.huge
	if GetOrigin(unit) == nil or IsDead(unit) or GetTeam(unit) == GetTeam(myHero) or not IsDistance(unit, range) then return false end
	return true
end

function IsDistance(p1,r)
	return GetDistance(GetOrigin(p1)) < r*r
end

function GetDistance(p1,p2)
	p2 = p2 or myHeroPos
	local dx = p1.x - p2.x
	local dz = (p1.z or p1.y) - (p2.z or p2.y)
	return dx*dx + dz*dz
end

function GenerateMovePos()
	local mPos = GetMousePos()
	local tV = {x = (mPos.x-myHeroPos.x), z = (mPos.z-myHeroPos.z)}
	local len = math.sqrt(tV.x * tV.x + tV.z * tV.z)
	return {x = myHeroPos.x + 250 * tV.x / len, y = 0, z = myHeroPos.z + 250 * tV.z / len}
end
