function EsoZH_doubleNameSkills(EsoZH)
	if GetCVar("language.2") == "zh" then
		local NameDict = EsoZH.Names
		
		-- Main Window
		local ZO_Skills_AbilityEntry_SetupOrg = ZO_Skills_AbilityEntry_Setup
		ZO_Skills_AbilityEntry_Setup = function(control, skillData)
			ZO_Skills_AbilityEntry_SetupOrg(control, skillData)
			
			local skillPointAllocator = skillData:GetPointAllocator()
			local skillProgressionData = skillPointAllocator:GetProgressionData()
			local currentAbilityId = skillProgressionData:GetAbilityId()
			--local currentAbilityName = GetAbilityName(currentAbilityId)
			
			if NameDict.Skills[currentAbilityId] ~= nil and EsoZH.Settings.SkillName == "zh" then
				control:GetNamedChild("Name"):SetText(EsoZH:MagicReplace(control:GetNamedChild("Name"):GetText(), GetAbilityName(currentAbilityId), NameDict.Skills[currentAbilityId]))
			end
		end
		
		local ZO_Skills_CompanionSkillEntry_SetupOrg = ZO_Skills_CompanionSkillEntry_Setup
		ZO_Skills_CompanionSkillEntry_Setup = function(control, skillData)
			ZO_Skills_CompanionSkillEntry_SetupOrg(control, skillData)
			
			local skillPointAllocator = skillData:GetPointAllocator()
			local skillProgressionData = skillPointAllocator:GetProgressionData()
			local currentAbilityId = skillProgressionData:GetAbilityId()
			--local currentAbilityName = GetAbilityName(currentAbilityId)
			
			if NameDict.Skills[currentAbilityId] ~= nil and EsoZH.Settings.SkillName == "zh" then
				control:GetNamedChild("Name"):SetText(EsoZH:MagicReplace(control:GetNamedChild("Name"):GetText(), GetAbilityName(currentAbilityId), NameDict.Skills[currentAbilityId]))
			end
		end

		ZO_SkillsConfirmDialog:SetHandler("OnShow", function()
			
			local skillProgressionData = ZO_SkillsConfirmDialog.data
			local currentAbilityId = skillProgressionData:GetAbilityId()
			--local currentAbilityName =  GetAbilityName(currentAbilityId)
			
			if NameDict.Skills[currentAbilityId] and EsoZH.Settings.SkillName == "zh" then
				ZO_SkillsConfirmDialog:GetNamedChild("AbilityName"):SetText(EsoZH:MagicReplace(ZO_SkillsConfirmDialog:GetNamedChild("AbilityName"):GetText(), GetAbilityName(currentAbilityId), NameDict.Skills[currentAbilityName]))
			end
		end)
		
		ZO_SkillsMorphDialog:SetHandler("OnShow", function()
			
			local bsAbility = ZO_SkillsMorphDialog:GetNamedChild("BaseAbility")
			local skillProgressionData = bsAbility.skillProgressionData
			local currentAbilityId = skillProgressionData:GetAbilityId()
			--local currentAbilityName =  GetAbilityName(currentAbilityId)
			
			if NameDict.Skills[currentAbilityId] and EsoZH.Settings.SkillName == "zh" then
				ZO_SkillsMorphDialog.desc:SetText(zo_strformat(SI_SKILLS_SELECT_MORPH, NameDict.Skills[currentAbilityId]))
			end
		end)
		
		-- Advisor
		
		local AdvSetupAbilityEntryOrg = ZO_SKILLS_ADVISOR_SUGGESTION_WINDOW.SetupAbilityEntry
		ZO_SKILLS_ADVISOR_SUGGESTION_WINDOW.SetupAbilityEntry = function(manager, control, skillProgressionData)
			AdvSetupAbilityEntryOrg(manager, control, skillProgressionData)
			
			local skillData = skillProgressionData:GetSkillData()
			local currentAbilityId = skillProgressionData:GetAbilityId()
			--local currentAbilityName =  GetAbilityName(currentAbilityId)
			
			if NameDict.Skills[currentAbilityId] ~= nil and EsoZH.Settings.SkillName == "zh" then
				control:GetNamedChild("Name"):SetText(EsoZH:MagicReplace(control:GetNamedChild("Name"):GetText(), GetAbilityName(currentAbilityId), NameDict.Skills[currentAbilityId]))
			end
		end
		
		-- Tooltips
		
		local function modifyTooltip(isPassive, isNew, ...)
			local finalName, finalName2, zhName
			
			if EsoZH.Settings.SkillName ~= "zh" then
				if isPassive then
					local skillType, skillLineIndex, skillIndex, rank = ...
					local abilityId = GetSpecificSkillAbilityInfo(skillType, skillLineIndex, skillIndex, 0, rank)
					--local abilityName = GetAbilityName(abilityId)
					
					if abilityId and NameDict.Skills[abilityId] then
						zhName = GetAbilityName(abilityId)
						finalName = NameDict.Skills[abilityId]
					end
				elseif isNew then
					local skillType, skillLineIndex, skillIndex = ...
					local abilityId = GetSpecificSkillAbilityInfo(skillType, skillLineIndex, skillIndex, 0, 1)
					--local abilityName = GetAbilityName(abilityId)
					
					if abilityId and NameDict.Skills[abilityId] then
						zhName = GetAbilityName(abilityId)
						finalName = NameDict.Skills[abilityId]
					end
				else
					local skillType, skillLineIndex, skillIndex, morphChoice, _, _, _, _, _, _, _, _, _, overrideAbilityId = ...
					local abilityId = GetSpecificSkillAbilityInfo(skillType, skillLineIndex, skillIndex, morphChoice, 1)
					--local abilityName = GetAbilityName(abilityId)
					
					if overrideAbilityId and NameDict.Skills[overrideAbilityId] then
						finalName = NameDict.Skills[overrideAbilityId]
						zhName = GetAbilityName(overrideAbilityId)
					elseif abilityId and NameDict.Skills[abilityId] then
						finalName = NameDict.Skills[abilityId]
						zhName = GetAbilityName(abilityId)
					end
				end
				
				if finalName and zhName then
					if EsoZH.Settings.SkillName == "zh+en" then
						finalName = string.format("%s\n%s", zhName, finalName)
					elseif EsoZH.Settings.SkillName == "en+zh" then
						finalName = string.format("%s\n%s", finalName, zhName)
					end
					
					SafeAddString(SI_ABILITY_NAME_AND_RANK, GetString(SI_ABILITY_NAME_AND_RANK):gsub("<<1>>", finalName), 10)
					SafeAddString(SI_ABILITY_TOOLTIP_NAME, finalName, 10)
				end
			end
		end
		
		local function modifyTooltipCompanion(...)
			local finalName, zhName
			
			if EsoZH.Settings.SkillName ~= "zh" then
				local abilityId = ...
				--local abilityName =  ...
				
				if abilityId and NameDict.Skills[abilityId] then
					zhName = GetAbilityName(abilityId)
					finalName = NameDict.Skills[abilityId]
				end
				
				if finalName and zhName then
					if EsoZH.Settings.SkillName == "zh+en" then
						finalName = string.format("%s\n%s", zhName, finalName)
					elseif EsoZH.Settings.SkillName == "en+zh" then
						finalName = string.format("%s\n%s", finalName, zhName)
					end
					
					SafeAddString(SI_ABILITY_NAME_AND_RANK, GetString(SI_ABILITY_NAME_AND_RANK):gsub("<<1>>", finalName), 10)
					SafeAddString(SI_ABILITY_TOOLTIP_NAME, finalName, 10)
				end
			end
		end
		
		local function abilityTooltipHook(tooltipControl, method, isPassive, isNew, isCompanion)
			local origMethod = tooltipControl[method]
			tooltipControl[method] = function(self, ...)
				
				if isCompanion then
					modifyTooltipCompanion(...)
				else
					modifyTooltip(isPassive, isNew, ...)
				end
				
				origMethod(self, ...)
					
				SafeAddString(SI_ABILITY_NAME_AND_RANK, EsoZH.StringsBackup["SI_ABILITY_NAME_AND_RANK"], 10)
				SafeAddString(SI_ABILITY_TOOLTIP_NAME, EsoZH.StringsBackup["SI_ABILITY_TOOLTIP_NAME"], 10)
			end
		end
		
		abilityTooltipHook(SkillTooltip, "SetActiveSkill", false, false, false)
		abilityTooltipHook(SkillTooltip, "SetPassiveSkill", true, false, false)
		abilityTooltipHook(SkillTooltip, "SetSkillAbility", false, true, false)
		abilityTooltipHook(SkillTooltip, "SetCompanionSkill", false, false, true)
	end
	EsoZH_doubleNamesSkillBuff = nil
end