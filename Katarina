local myHero = nil
local myHeroPos = nil

function AfterObjectLoopEvent(myHer0)
    myHero = myHer0
    myHeroPos = GetOrigin(myHero)
		DrawText("Remember that this is still in alpha version .",24,0,0,0xffff0000);
	
	local target = GetCurrentTarget()
	if KeyIsDown(0x20) then 
	    if ValidTarget(target, 900) then
			if CanUseSpell(myHero, _Q) == READY and GetDistance(GetOrigin(target), GetOrigin(myHero)) < 675*675 then
				CastTargetSpell(myHero, _Q)
			end
			if CanUseSpell(myHero, _E) == READY and GetDistance(GetOrigin(target), GetOrigin(myHero)) < 700*700 then
				CastTargetSpell(target, _E)
			end
			if CanUseSpell(myHero, _W) == READY and GetDistance(GetOrigin(target), GetOrigin(myHero)) < 375*375 then
				CastTargetSpell(myHero, _W)
			end	
			if CanUseSpell(myHero, _R) == READY and GetDistance(GetOrigin(target), GetOrigin(myHero)) < 550*550 then
				CastTargetSpell(myHero, _R)	
			end
	  	end
	end	
end

function Katarina:WndMsg(msg, key)
		if self.menu.skills.R.stopclick then
			if msg == WM_RBUTTONDOWN and self.R.using then 
				self.R.using = false
			end
		end
	end

	function Katarina:OnCastSpell(iSpell,startPos,endPos,targetUnit)
		if iSpell == 3 then
			self.R.using = true
			self.R.last  = os.clock()

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
