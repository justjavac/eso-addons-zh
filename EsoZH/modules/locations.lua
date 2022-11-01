function EsoZh_doubleNameLocation(EsoZH)
	
	local GetMapLocationTooltipHeaderOld = GetMapLocationTooltipHeader
	
	function GetMapLocationTooltipHeader(...)
		local headerText = ZO_CachedStrFormat(SI_ZONE_NAME, GetMapLocationTooltipHeaderOld(...))
		
		if (headerText == nil or EsoZH.Settings.LocationDoubleName == "zh") then
			return headerText
		end
		
		newLocName = EsoZH.Names.Locations[headerText]
			
		if newLocName ~= nil then
			if (EsoZH.Settings.LocationDoubleName == "zh+en") then
				headerText = headerText .. "\n|ca99e83" .. newLocName .. "|r"
			elseif (EsoZH.Settings.LocationDoubleName == "en+zh") then
				headerText = newLocName .. "\n|ca99e83" .. headerText .. "|r"
			else
				headerText = newLocName
			end
		end
		
		return headerText
	end
	
	local GetPOIInfoOld = GetPOIInfo
	
	function GetPOIInfo(...)
		local poiName, _, poiStartDesc, poiFinishedDesc = GetPOIInfoOld(...)
		
		if (poiName == nil or EsoZH.Settings.LocationDoubleName == "zh") then
			return ZO_CachedStrFormat(SI_ZONE_NAME, poiName), _, poiStartDesc, poiFinishedDesc
		end
		
		newLocName = EsoZH.Names.Locations[poiName]
			
		if newLocName ~= nil then
			if (EsoZH.Settings.LocationDoubleName == "zh+en") then
				poiName = ZO_CachedStrFormat(SI_ZONE_NAME, poiName).. " (" .. newLocName .. ")"
			elseif (EsoZH.Settings.LocationDoubleName == "en+zh") then
				poiName = newLocName .. " (" .. zo_strformat("<<1>>", poiName) .. ")"
			else
				poiName = newLocName
			end
		end
		
		return poiName, _, poiStartDesc, poiFinishedDesc
	end
	
	local GetMapMouseoverInfoOld = GetMapMouseoverInfo
	
	function GetMapMouseoverInfo(...)
		local locationName, textureFile, widthN, heightN, locXN, locYN = GetMapMouseoverInfoOld(...)
		
		if (locationName == nil or EsoZH.Settings.LocationDoubleName == "zh") then
			return ZO_CachedStrFormat(SI_ZONE_NAME, locationName), textureFile, widthN, heightN, locXN, locYN
		end
		
		newLocName = EsoZH.Names.Locations[locationName]
			
		if newLocName ~= nil then
			if (EsoZH.Settings.LocationDoubleName == "zh+en") then
				locationName = ZO_CachedStrFormat(SI_ZONE_NAME, locationName) .. "\n" .. newLocName
			elseif (EsoZH.Settings.LocationDoubleName == "en+zh") then
				locationName = newLocName .. "\n" .. ZO_CachedStrFormat(SI_ZONE_NAME, locationName)
			else
				locationName = newLocName
			end
		end
		
		return locationName, textureFile, widthN, heightN, locXN, locYN
	end
	
	local GetMapNameOld = GetMapName
	
	function GetMapName(...)
		local zoneName = GetMapNameOld(...)
		
		if (zoneName == nil or EsoZH.Settings.LocationDoubleName == "zh") then
			return zoneName
		end
		
		newLocName = EsoZH.Names.Locations[zoneName]
			
		if newLocName ~= nil then
			if (EsoZH.Settings.LocationDoubleName == "zh+en") then
				zoneName = ZO_CachedStrFormat(SI_ZONE_NAME, zoneName) .. "\n" .. newLocName
			elseif (EsoZH.Settings.LocationDoubleName == "en+zh") then
				zoneName = newLocName .. "\n" .. ZO_CachedStrFormat(SI_ZONE_NAME, zoneName)
			else
				zoneName = newLocName
			end
		end
		
		return zoneName
	end
	
	local GetFastTravelNodeInfoOld = GetFastTravelNodeInfo
	
	function GetFastTravelNodeInfo(...)   --大地图快速传送点
		local known, name, normalizedX, normalizedY, icon, glowIcon, poiType, isLocatedInCurrentMap, linkedCollectibleIsLocked = GetFastTravelNodeInfoOld(...)
		
		if (name == nil or EsoZH.Settings.LocationDoubleName == "zh") then
			return known, name, normalizedX, normalizedY, icon, glowIcon, poiType, isLocatedInCurrentMap, linkedCollectibleIsLocked
		end
		
		newLocName = EsoZH.Names.Locations[name]
			
		if newLocName ~= nil then
			if (EsoZH.Settings.LocationDoubleName == "zh+en") then
				name = name .. "\n" .. newLocName
			elseif (EsoZH.Settings.LocationDoubleName == "en+zh") then
				name = newLocName .. "\n" .. name
			else
				name = newLocName
			end
		end
		
		return known, name, normalizedX, normalizedY, icon, glowIcon, poiType, isLocatedInCurrentMap, linkedCollectibleIsLocked
	end
	
	local GetKeepNameOld = GetKeepName
	
	function GetKeepName(...)
		local name = ZO_CachedStrFormat(SI_ZONE_NAME, GetKeepNameOld(...))
		
		if (name == nil or EsoZH.Settings.LocationDoubleName == "zh") then
			return name
		end
		
		newLocName = EsoZH.Names.Locations[name]
			
		if newLocName ~= nil then
			if (EsoZH.Settings.LocationDoubleName == "zh+en") then
				name = name .. "\n" .. newLocName
			elseif (EsoZH.Settings.LocationDoubleName == "en+zh") then
				name = newLocName .. "\n" .. name
			else
				name = newLocName
			end
		end
		
		return name
	end
	
	local GetMapInfoOld = GetMapInfoByIndex
	
	function GetMapInfoByIndex(...)    --大地图地点名（UI右侧）
		local mapName, mapType, mapContentType, zoneId, description = GetMapInfoOld(...)
		
		if (mapName == nil or EsoZH.Settings.LocationDoubleName == "zh") then
			return mapName, mapType, mapContentType, zoneId, description
		end
		
		newLocName = EsoZH.Names.Locations[mapName]
			
		if newLocName ~= nil then
			if (EsoZH.Settings.LocationDoubleName == "zh+en") then
				mapName = mapName .. "(" .. newLocName .. ")"
			elseif (EsoZH.Settings.LocationDoubleName == "en+zh") then
				mapName = newLocName .. "(" .. mapName .. ")"
			else
				mapName = newLocName
			end
		end
		
		return mapName, mapType, mapContentType, zoneId, description
	end
	
	local GetFriendCharacterInfoOld = GetFriendCharacterInfo
	
	function GetFriendCharacterInfo(...)
		local hasCharacter, characterName, zone, class, alliance, level, championPoints, zoneId = GetFriendCharacterInfoOld(...)
		
		if (zone == nil or EsoZH.Settings.LocationDoubleName == "zh") then
			return hasCharacter, characterName, zone, class, alliance, level, championPoints, zoneId
		end
		
		newLocName = EsoZH.Names.Locations[zone]
			
		if newLocName ~= nil then
			if (EsoZH.Settings.LocationDoubleName == "zh+en") then
				zone = zone .. "(" .. newLocName .. ")"
			elseif (EsoZH.Settings.LocationDoubleName == "en+zh") then
				zone = newLocName .. "(" .. zone .. ")"
			else
				zone = newLocName
			end
		end
		
		return hasCharacter, characterName, zone, class, alliance, level, championPoints, zoneId
	end
	
	FRIENDS_LIST_MANAGER:BuildMasterList()
	
	ZO_PostHook(FRIENDS_LIST_MANAGER, "OnFriendCharacterZoneChanged", function(tooltip, displayName, characterName, zoneName)
		local data = tooltip:FindDataByDisplayName(displayName)

		if data then
			local oldLocation = data.formattedZone
			local newLocName = EsoZH.Names.Locations[oldLocation]

			if newLocName ~= nil then
				if (EsoZH.Settings.LocationDoubleName == "zh+en") then
					data.formattedZone = oldLocation .. "(" .. newLocName .. ")"
				elseif (EsoZH.Settings.LocationDoubleName == "en+zh") then
					data.formattedZone = newLocName .. "(" .. oldLocation .. ")"
				else
					data.formattedZone = newLocName
				end
				tooltip:RefreshSort()
			end
		end
	end)

	local GetZoneNameByIndexOld = GetZoneNameByIndex

	function GetZoneNameByIndex(...)
		local zone = GetZoneNameByIndexOld(...)
		
		if (zone == nil or EsoZH.Settings.LocationDoubleName == "zh") then
			return zone
		end
		
		zone = ZO_CachedStrFormat(SI_ZONE_NAME, zone)
		newLocName = EsoZH.Names.Locations[zone]
			
		if newLocName ~= nil then
			if (EsoZH.Settings.LocationDoubleName == "zh+en") then
				zone = zone .. "(" .. newLocName .. ")"
			elseif (EsoZH.Settings.LocationDoubleName == "en+zh") then
				zone = newLocName .. "(" .. zone .. ")"
			else
				zone = newLocName
			end
		end
		
		return zone
	end
	
	local GetActivityInfoOld = GetActivityInfo
	
	function GetActivityInfo(...)
		local name, levelMin, levelMax, championPointsMin, championPointsMax, groupType, minGroupSize, description, sortOrder = GetActivityInfoOld(...)
		
		if (name == nil or EsoZH.Settings.LocationDoubleName == "zh") then
			return name, levelMin, levelMax, championPointsMin, championPointsMax, groupType, minGroupSize, description, sortOrder
		end
		
		name = ZO_CachedStrFormat(SI_ZONE_NAME, name)
		newLocName = EsoZH.Names.Locations[name]
			
		if newLocName ~= nil then
			if (EsoZH.Settings.LocationDoubleName == "zh+en") then
				name = name .. "(" .. newLocName .. ")"
			elseif (EsoZH.Settings.LocationDoubleName == "en+zh") then
				name = newLocName .. "(" .. name .. ")"
			else
				name = newLocName
			end
		end
		
		return name, levelMin, levelMax, championPointsMin, championPointsMax, groupType, minGroupSize, description, sortOrder
	end
	
	local GetGuildMemberCharacterInfoOld = GetGuildMemberCharacterInfo
	
	function GetGuildMemberCharacterInfo(...)
		local hasCharacter, rawCharacterName, zone, class, alliance, level, championPoints, zoneId = GetGuildMemberCharacterInfoOld(...)
		
		if (zone == nil or EsoZH.Settings.LocationDoubleName == "zh") then
			return hasCharacter, rawCharacterName, zone, class, alliance, level, championPoints, zoneId
		end
		
		zone = ZO_CachedStrFormat(SI_ZONE_NAME, zone)
		newLocName = EsoZH.Names.Locations[zone]
			
		if newLocName ~= nil then
			if (EsoZH.Settings.LocationDoubleName == "zh+en") then
				zone = zone .. "(" .. newLocName .. ")"
			elseif (EsoZH.Settings.LocationDoubleName == "en+zh") then
				zone = newLocName .. "(" .. zone .. ")"
			else
				zone = newLocName
			end
		end
		
		return hasCharacter, rawCharacterName, zone, class, alliance, level, championPoints, zoneId
	end
	
	GUILD_ROSTER_MANAGER:BuildMasterList()

	ZO_PostHook(GUILD_ROSTER_MANAGER, "OnGuildMemberPlayerStatusChanged", function(tooltip, displayName, oldStatus, newStatus)
		local data = tooltip:FindDataByDisplayName(displayName)
		local isOnline = (newStatus ~= PLAYER_STATUS_OFFLINE)
		
		if data and isOnline then
			local oldLocation = data.formattedZone
			local newLocName = EsoZH.Names.Locations[oldLocation]
			
			if newLocName ~= nil then
				if (EsoZH.Settings.LocationDoubleName == "zh+en") then
					data.formattedZone = oldLocation .. " (" .. newLocName .. ")"
				elseif (EsoZH.Settings.LocationDoubleName == "en+zh") then
					data.formattedZone = newLocName .. " (" .. oldLocation .. ")"
				else
					data.formattedZone = newLocName
				end
				tooltip:RefreshFilters()
			end
		end
	end)

	ZO_PostHook(GUILD_ROSTER_MANAGER, "OnGuildMemberCharacterZoneChanged", function(tooltip, displayName, characterName, zone)
		local data = tooltip:FindDataByDisplayName(displayName)
		
		if data then
			local oldLocation = data.formattedZone
			local newLocName = EsoZH.Names.Locations[oldLocation]
			
			if newLocName ~= nil then
				if (EsoZH.Settings.LocationDoubleName == "zh+en") then
					data.formattedZone = oldLocation .. " (" .. newLocName .. ")"
				elseif (EsoZH.Settings.LocationDoubleName == "en+zh") then
					data.formattedZone = newLocName .. " (" .. oldLocation .. ")"
				else
					data.formattedZone = newLocName
				end
				
				tooltip:RefreshSort()
			end
		end
	end)
	
	local GetCadwellZoneInfoOld = GetCadwellZoneInfo
	
	function GetCadwellZoneInfo(...)
		local zone, zoneDescription, zoneOrder = GetCadwellZoneInfoOld(...)
		
		if (zone == nil or EsoZH.Settings.LocationDoubleName == "zh") then
			return zone, zoneDescription, zoneOrder
		end
		
		newLocName = EsoZH.Names.Locations[zone]
			
		if newLocName ~= nil then
			if (EsoZH.Settings.LocationDoubleName == "zh+en") then
				zone = zone .. "\n" .. newLocName
			elseif (EsoZH.Settings.LocationDoubleName == "en+zh") then
				zone = newLocName .. "\n" .. zone
			else
				zone = newLocName
			end
		end
		
		return zone, zoneDescription, zoneOrder
	end
	
	CADWELLS_ALMANAC:RefreshList()
	EsoZH:MapNameStyle()
	
	local ZO_AlertText_GetHandlersOld = ZO_AlertText_GetHandlers
	
	function ZO_AlertText_GetHandlers()
		local ALERT = UI_ALERT_CATEGORY_ALERT
		local handlers = ZO_AlertText_GetHandlersOld()
		
		handlers[EVENT_ZONE_CHANGED] = function(zoneName, subzoneName)
			if(subzoneName ~= "") then
				if (EsoZH.Settings.LocationDoubleName ~= "zh") then
					newLocName = EsoZH.Names.Locations[subzoneName]
			
					if newLocName ~= nil then
						if (EsoZH.Settings.LocationDoubleName == "zh+en") then
							subzoneName = subzoneName .. "\n|ca99e83" .. newLocName .. "|r"
						elseif (EsoZH.Settings.LocationDoubleName == "en+zh") then
							subzoneName = newLocName .. "\n|ca99e83" .. ZO_CachedStrFormat(SI_ZONE_NAME, subzoneName) .. "|r"
						else
							subzoneName = newLocName
						end
					end
				end
				
				return ALERT, ZO_CachedStrFormat(SI_ALERTTEXT_LOCATION_FORMAT, subzoneName)
			elseif(zoneName ~= "") then
				if (EsoZH.Settings.LocationDoubleName ~= "zh") then
					newLocName = EsoZH.Names.Locations[zoneName]
			
					if newLocName ~= nil then
						if (EsoZH.Settings.LocationDoubleName == "zh+en") then
							zoneName = zoneName .. "\n|ca99e83" .. newLocName .. "|r"
						elseif (EsoZH.Settings.LocationDoubleName == "en+zh") then
							zoneName = newLocName .. "\n|ca99e83" .. ZO_CachedStrFormat(SI_ZONE_NAME, zoneName) .. "|r"
						else
							zoneName = newLocName
						end
					end
				end
				
				return ALERT, ZO_CachedStrFormat(SI_ALERTTEXT_LOCATION_FORMAT, zoneName)
			end
		end
		
		return handlers
	end
	
	LFGDoubleNames(EsoZH)
	
	EsoZh_doubleNameLocation = nil
end

function LFGDoubleNames(EsoZH)
	local locs2 = ZO_ACTIVITY_FINDER_ROOT_MANAGER.sortedLocationsData[2] -- Normal Dungeons
	local locs3 = ZO_ACTIVITY_FINDER_ROOT_MANAGER.sortedLocationsData[3] -- Vet Dungeons
	
	for i = 1, #locs2 do	   
	   newLocationName = EsoZH.Names.Locations[locs2[i]["rawName"]]
	   
	   if newLocationName ~= nil then
			if (EsoZH.Settings.LocationDoubleName == "zh") then
				locs2[i]["nameKeyboard"] = ZO_CachedStrFormat(SI_ZONE_NAME, locs2[i]["rawName"])
				locs2[i]["nameGamepad"] = ZO_CachedStrFormat(SI_ZONE_NAME, locs2[i]["rawName"])
			else
				locs2[i]["nameKeyboard"] = ZO_CachedStrFormat(SI_ZONE_NAME, locs2[i]["rawName"] .. " (" .. newLocationName .. ")")
				locs2[i]["nameGamepad"] = ZO_CachedStrFormat(SI_ZONE_NAME, locs2[i]["rawName"] .. " (" .. newLocationName .. ")")
			end
		end
	end
	
	for i = 1, #locs3 do	   
	   newLocationName = EsoZH.Names.Locations[locs3[i]["rawName"]]
	   
	   if newLocationName ~= nil then
			if (EsoZH.Settings.LocationDoubleName == "zh") then
				if string.find(locs3[i]["nameKeyboard"], "target_veteranRank_icon") then
					locs3[i]["nameKeyboard"] = "|t100%:100%:EsoUI/Art/UnitFrames/target_veteranRank_icon.dds|t " .. ZO_CachedStrFormat(SI_ZONE_NAME, locs3[i]["rawName"])
				end
				if string.find(locs3[i]["nameGamepad"], "^精英") then
					locs3[i]["nameGamepad"] = "精英 " .. locs3[i]["rawName"]
				end
			else
				if string.find(locs3[i]["nameKeyboard"], "target_veteranRank_icon") then
					locs3[i]["nameKeyboard"] = "|t100%:100%:EsoUI/Art/UnitFrames/target_veteranRank_icon.dds|t " .. ZO_CachedStrFormat(SI_ZONE_NAME, locs3[i]["rawName"].. " (" .. newLocationName .. ")")
				end
				if string.find(locs3[i]["nameGamepad"], "^精英") then
					locs3[i]["nameGamepad"] = "精英 " .. locs3[i]["rawName"].. " (" .. newLocationName .. ")"
				end
			end
		end
	end
end