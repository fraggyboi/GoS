local myHero = nil
local myHeroPos = nil

function AfterObjectLoopEvent(myHer0)
    myHero = myHer0
    myHeroPos = GetOrigin(myHero)
		DrawText("Remember that this is still in alpha version (use ult manually or from f7 menu).",24,0,0,0xffff0000);
	
	local target = GetCurrentTarget()
	if KeyIsDown(0x20) then 
	    if ValidTarget(target, 900) then
			if CanUseSpell(myHero, _W) == READY and GetDistance(GetOrigin(target), GetOrigin(myHero)) < 200*200 then
				CastTargetSpell(myHero, _W)
			end
			if CanUseSpell(myHero, _Q) == READY and GetDistance(GetOrigin(target), GetOrigin(myHero)) < 550*550 then
				CastTargetSpell(target, _Q)
			end
			if CanUseSpell(myHero, _E) == READY and GetDistance(GetOrigin(target), GetOrigin(myHero)) < 900*900 then
				CastTargetSpell(target, _E)
			end
	  	end
	end	
end

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
