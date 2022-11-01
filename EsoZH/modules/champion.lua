function EsoZH_doubleNameChampion(EsoZH)
	if GetCVar("language.2") == "zh" then
		local NameDict = EsoZH.Names
		
		local GetChampionSkillNameOld = GetChampionSkillName
	
		function GetChampionSkillName(...)
			local championSkillId = ...
			local abilityId = GetChampionAbilityId(championSkillId)
			local zhName = GetChampionSkillNameOld(...)
			
			if EsoZH.Settings.ChampionName == "zh" or not abilityId then
				return zhName
			end
			
			if not abilityId or not NameDict.Skills[abilityId] then
				return zhName
			end
			
			if EsoZH.Settings.ChampionName == "zh+en" then
				return string.format("%s (%s)", zhName, NameDict.Skills[abilityId])
			elseif EsoZH.Settings.ChampionName == "en+zh" then
				return string.format("%s (%s)", NameDict.Skills[abilityId], zhName)
			else
				return EsoZH.ExportNames.Skills[abilityId]
			end
		end
		
		-- Tooltips
		
		local function getIdFromSkillId(championSkillId)
			local abilityId = GetChampionAbilityId(championSkillId)
			local zhName = GetChampionSkillNameOld(championSkillId)
			
			return abilityId, zhName
		end
		
		local function getIdFromAbilityId(abilityId)
			local zhName = GetAbilityName(abilityId)
			
			return abilityId, zhName
		end
		
		local function modifyTooltip(abilityId, zhName)
			
			local finalName
			
			if EsoZH.Settings.ChampionName ~= "zh" and abilityId and NameDict.Skills[abilityId] and zhName then					
				if EsoZH.Settings.ChampionName == "zh+en" then
					finalName = string.format("%s\n%s", zhName, NameDict.Skills[abilityId])
				elseif EsoZH.Settings.ChampionName == "en+zh" then
					finalName = string.format("%s\n%s", NameDict.Skills[abilityId], zhName)
				else
					finalName = NameDict.Skills[abilityId]
				end
				
				if finalName then
					SafeAddString(SI_ABILITY_TOOLTIP_NAME, finalName, 10)
				end
			end
		end
		
		local function abilityTooltipHook(tooltipControl, method, linkFunc)
			local origMethod = tooltipControl[method]
			tooltipControl[method] = function(self, ...)
				
				modifyTooltip(linkFunc(...))
				
				origMethod(self, ...)
				
				SafeAddString(SI_ABILITY_TOOLTIP_NAME, EsoZH.StringsBackup["SI_ABILITY_TOOLTIP_NAME"], 10)
			end
		end
		
		abilityTooltipHook(ChampionSkillTooltip, "SetChampionSkill", getIdFromSkillId)
		abilityTooltipHook(ChampionSkillTooltip, "SetAbilityId", getIdFromAbilityId)
		ZO_PreHook(CHAMPION_PERKS, "LayoutRightTooltipChampionSkillAbility", function(tooltip, ...)   modifyTooltip(...) end)
		ZO_PostHook(CHAMPION_PERKS, "LayoutRightTooltipChampionSkillAbility", function() SafeAddString(SI_ABILITY_TOOLTIP_NAME, finalName, 10) end)
	end
	EsoZH_doubleNameChampion = nil
end