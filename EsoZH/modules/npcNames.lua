function EsoZh_doubleNameNPC(EsoZH)
	
	if EsoZH_doubleNamesBoth then
		EsoZH_doubleNamesBoth(EsoZH)
	end

	local GetUnitNameOld = GetUnitName

	function GetUnitName(target)
		
		local currentNpcName = GetUnitNameOld(target)
		local newNpcName
		
		if (target == "player" or EsoZH.Settings.NpcName == "zh" or currentNpcName == nil) then
			return currentNpcName
		end
		
		if (target == "reticleover") then
			if (not DoesUnitExist("reticleover") or IsUnitPlayer("reticleover")) then return currentNpcName end
		end
		
		newNpcName = npcNameDict[currentNpcName]
			
		if newNpcName ~= nil then
			if (EsoZH.Settings.NpcName == "zh+en") then
				currentNpcName = currentNpcName .. " (" .. newNpcName .. ")"
			elseif (EsoZH.Settings.NpcName == "en+zh") then
				currentNpcName = newNpcName .. " (" .. currentNpcName .. ")"
			else
				currentNpcName = newNpcName
			end
		end
			
		return currentNpcName
	end
	
	local GetMapLocationTooltipLineInfoOld = GetMapLocationTooltipLineInfo
	
	function GetMapLocationTooltipLineInfo(...)
		local icon, name, groupingId, categoryName = GetMapLocationTooltipLineInfoOld(...)
		
		if (name == nil or EsoZH.Settings.NpcName == "zh") then
			return icon, name, groupingId, categoryName
		end
		
		newNpcName = npcNameDict[zo_strlower(name)]
			
		if newNpcName ~= nil then
			if (EsoZH.Settings.NpcName == "zh+en") then
				name = name .. "\n|ca99e83" .. newNpcName .. "|r"
			elseif (EsoZH.Settings.NpcName == "en+zh") then
				name = newNpcName .. "\n|ca99e83" .. name .. "|r"
			else
				name = newNpcName
			end
		end
			
		return icon, name, groupingId, categoryName
	end
	
	EsoZH_doubleNamesNPC = nil
end