function EsoZH_doubleNameItems(EsoZH)
	if GetCVar("language.2") == "zh" then
		
		-- Tooltips
		local itemDataDicts = EsoZH.Names
		
		local function GetWornLink(slot, bagId)
			return GetItemLink(bagId, slot)
		end
		
		local function GetChatLink(aLink)
			return aLink
		end
		
		local function CheckAlchemyName(...)
			local link, prospectiveAlchemyResult = GetAlchemyResultingItemLink(...)
			if prospectiveAlchemyResult ~= PROSPECTIVE_ALCHEMY_RESULT_KNOWN then
				return ""
			else
				return link
			end
		end

		local function splitItemName(itemName, itemNameRaw)
			local finalName = ""
			if string.match(itemName, " " .. itemNameRaw .. " ") then
				local prefix, affix = string.match(itemName, "^(.*) " .. itemNameRaw .. " (.*)$")

				if prefix and itemDataDicts.Prefixes[prefix] then
					finalName = itemDataDicts.Prefixes[prefix] .. " "
				end
				--if prefix and itemDataDicts.Prefixes[prefix:sub(1, #prefix - 4)] then
				--	finalName = itemDataDicts.Prefixes[prefix:sub(1, #prefix - 4)] .. " "
				--end
				
				finalName = finalName .. itemDataDicts.Parts[itemNameRaw]
				
				if affix and itemDataDicts.Affixes[affix] then
					finalName = finalName .. " " .. itemDataDicts.Affixes[affix]
				end
				
				d("prefix: " ..tostring(prefix))
				
				return finalName
			elseif string.match(itemName, " " .. itemNameRaw .. "$") then
				local prefix = string.match(itemName, "^(.*) " .. itemNameRaw .. "$")

				if prefix and itemDataDicts.Prefixes[prefix] then
					finalName = itemDataDicts.Prefixes[prefix] .. " "
				end
				
				--if prefix and itemDataDicts.Prefixes[prefix:sub(1, #prefix - 4)] then
				--	finalName = itemDataDicts.Prefixes[prefix:sub(1, #prefix - 4)] .. " "
				--end
				
				finalName = finalName .. itemDataDicts.Parts[itemNameRaw]

				d("prefix: " ..tostring(prefix))
				
				return finalName
			elseif string.match(itemName, "^" .. itemNameRaw .. " ") then
				local affix = string.match(itemName, "^" .. itemNameRaw .. " (.*)$")
				
				finalName = finalName .. itemDataDicts.Parts[itemNameRaw]
				
				if affix and itemDataDicts.Affixes[affix] then
					finalName = finalName .. " " .. itemDataDicts.Affixes[affix]
				end
				
				return finalName
			end
			
			return itemDataDicts.Parts[itemNameRaw]
		end
		
		local function modifyTooltip(lnk)
			if EsoZH.Settings.ItemDoubleName ~= EsoZH.dropDownparm["zh"] or EsoZH.Settings.ItemTraits ~= "zh" or EsoZH.Settings.EnchantsName ~= "zh" or EsoZH.Settings.SetsName ~= "zh" or EsoZH.Settings.ItemDoubleName ~= "zh" then
				local zhName, zhTrait, zhSet, zhEnchant
				local itmType = GetItemLinkItemType(lnk)
				-- Names
				
				local itmId = GetItemLinkItemId(lnk)
				local itmName = GetItemLinkName(lnk)
				zhName = ZO_CachedStrFormat(SI_TOOLTIP_ITEM_NAME, itmName)
				local itmNameRaw = itemDataDicts.Items[itmId]
				local itmNameRawZh = GetItemLinkName("|H1:item:" .. itmId .. ":0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h")
				local itmNameFinal = ""
				
				local finalName, finalEnchant, finalTrait, finalSet

				if itmType == ITEMTYPE_GLYPH_ARMOR or itmType == ITEMTYPE_GLYPH_JEWELRY or itmType == ITEMTYPE_GLYPH_WEAPON then						
					if itmNameRaw then
						for index,value in pairs(itemDataDicts.EnchantPrefixes) do
							if string.match(itmName, "^" .. index) then
								itmNameFinal = value .. " "
								break
							end
						end
						
						finalName = itmNameFinal .. itmNameRaw
					end
				elseif itmType == ITEMTYPE_POISON or itmType == ITEMTYPE_POTION then
					if itemDataDicts.Potions[itmName] then
						finalName = itemDataDicts.Potions[itmName]
					elseif itemDataDicts.Items[itmId] then
						finalName = itemDataDicts.Items[itmId]
					end
				elseif itmType == ITEMTYPE_ARMOR or itmType == ITEMTYPE_WEAPON then
					if itmNameRawZh and itemDataDicts.Parts[itmNameRawZh] then
						finalName = splitItemName(itmName, itmNameRawZh)
					elseif itemDataDicts.Items[itmId] then
						finalName = itemDataDicts.Items[itmId]
					end
				elseif itmType == ITEMTYPE_CONTAINER then
					if itemDataDicts.Items[itmId] then
						--local loweredItemName = itmName
						if itmName ~= itmNameRawZh then
							local prefix = string.match(itmName, "^([^ ]+) ")

							if prefix and itemDataDicts.Prefixes[prefix] then
								finalName = itemDataDicts.Prefixes[prefix] .. " " .. itemDataDicts.Items[itmId]
							--if prefix and itemDataDicts.Prefixes[prefix:sub(1, #prefix - 4)] then
							--	finalName = itemDataDicts.Prefixes[prefix:sub(1, #prefix - 4)] .. " " .. itemDataDicts.Items[itmId]
							else
								finalName = itemDataDicts.Items[itmId]
							end
						else
							finalName = itemDataDicts.Items[itmId]
						end
					end
				else
					if itemDataDicts.Items[itmId] then
						finalName = itemDataDicts.Items[itmId]
					end
				end

				-- Enchantments
				
				if itmType == ITEMTYPE_ARMOR or itmType == ITEMTYPE_WEAPON or itmType == ITEMTYPE_GLYPH_ARMOR or itmType == ITEMTYPE_GLYPH_JEWELRY or itmType == ITEMTYPE_GLYPH_WEAPON then
					if zhEnchants[GetItemLinkFinalEnchantId(lnk)] then
						local hasCharges, enchantHeader = GetItemLinkEnchantInfo(lnk)
						zhEnchant = enchantHeader
						finalEnchant = zhEnchants[GetItemLinkFinalEnchantId(lnk)]
					end
				end

				
				-- Traits
				
				if itmType == ITEMTYPE_ARMOR or itmType == ITEMTYPE_WEAPON or itmType == ITEMTYPE_ARMOR_TRAIT or itmType == ITEMTYPE_JEWELRY_TRAIT or itmType == ITEMTYPE_WEAPON_TRAIT then
					local traitType = GetItemLinkTraitType(lnk)
					if itemDataDicts.Traits[traitType] then
						zhTrait = GetString("SI_ITEMTRAITTYPE", traitType)
						finalTrait = itemDataDicts.Traits[traitType]
					end
				end
				
				-- Sets
				
				if itmType == ITEMTYPE_ARMOR or itmType == ITEMTYPE_WEAPON then
					local hasSet, setName, _, _, _, setId = GetItemLinkSetInfo(lnk, false)
					zhSet = setName
					
					if itemDataDicts.Sets[setId] then
						finalSet = itemDataDicts.Sets[setId]
					end
				end
				
				if itmType == ITEMTYPE_CONTAINER then
					local numSetIds = GetItemLinkNumContainerSetIds(lnk)
					
					if numSetIds > 0 then
						for i = 1, numSetIds do
							local hasSet, _, _, _, _, setId = GetItemLinkContainerSetInfo(lnk, i)
							
							if itemDataDicts.Sets[setId] then
								finalSet = itemDataDicts.Sets[setId]
							end
						end
					end
				end
				
				if EsoZH.Settings.ItemDoubleName ~= "zh" and finalName and zhName then
					if EsoZH.Settings.ItemDoubleName == "zh+en" then
						finalName = string.format("%s\n%s", zhName, finalName)
					elseif EsoZH.Settings.ItemDoubleName == "en+zh" then
						finalName = string.format("%s\n%s", finalName, zhName)
					end
					
					SafeAddString(SI_TOOLTIP_ITEM_NAME, finalName, 10)
				end

				if EsoZH.Settings.EnchantsName ~= "zh" and finalEnchant and zhEnchant then
					if EsoZH.Settings.EnchantsName == "zh+en" then
						finalEnchant = string.format("%s (%s)", zhEnchant, finalEnchant)
					elseif EsoZH.Settings.EnchantsName == "en+zh" then
						finalEnchant = string.format("%s (%s)", finalEnchant, zhEnchant)
					end
					
					SafeAddString(SI_ITEM_FORMAT_STR_ENCHANT_HEADER_NAMED, ZO_CachedStrFormat(SI_ITEM_FORMAT_STR_ENCHANT_HEADER_NAMED, finalEnchant), 10)
				end
				
				if EsoZH.Settings.ItemTraits ~= "zh" and finalTrait and zhTrait then
					if EsoZH.Settings.ItemTraits == "zh+en" then
						finalTrait = string.format("%s (%s)", zhTrait, finalTrait)
					elseif EsoZH.Settings.ItemTraits == "en+zh" then
						finalTrait = string.format("%s (%s)", finalTrait, zhTrait)
					end
					
					SafeAddString(SI_ITEM_FORMAT_STR_ITEM_TRAIT_HEADER, finalTrait, 10)
					SafeAddString(SI_ITEM_FORMAT_STR_ITEM_TRAIT_WITH_ICON_HEADER, GetString(SI_ITEM_FORMAT_STR_ITEM_TRAIT_WITH_ICON_HEADER):gsub("<<2>>", finalTrait), 10)
				end

				--d("item name: " ..tostring(zo_strformat(SI_UNIT_NAME, GetItemLinkName(lnk))) .."ID:" ..tostring(zo_strformat(SI_UNIT_NAME, GetItemLinkItemId(lnk))))
				--d("item bag: " ..tostring(zo_strformat(SI_UNIT_NAME, (lnk))))
				
				
				
				if EsoZH.Settings.SetsName ~= "zh" and finalSet and zhSet then
					if EsoZH.Settings.SetsName == "zh+en" then
						finalSet = string.format("«%s» (%s)", zhSet, finalSet)
					elseif EsoZH.Settings.SetsName == "en+zh" then
						finalSet = string.format("«%s» (%s)", finalSet, zhSet)
					else
						finalSet = string.format("«%s»", finalSet)
					end
					
					SafeAddString(SI_ITEM_FORMAT_STR_SET_NAME, GetString(SI_ITEM_FORMAT_STR_SET_NAME):gsub("<<1>>", finalSet), 10)
					SafeAddString(SI_ITEM_FORMAT_STR_PERFECTED_SET_NAME, GetString(SI_ITEM_FORMAT_STR_PERFECTED_SET_NAME):gsub("<<1>>", finalSet), 10)
					--SafeAddString(SI_ITEM_FORMAT_STR_SET_NAME_NO_COUNT, finalSet, 10)
				end

				--d("item: " ..tostring(finalSet))
			end
		end
		
		local function itemTooltipHook(tooltipControl, method, linkFunc)
			local origMethod = tooltipControl[method]
			tooltipControl[method] = function(self, ...)
				
				if linkFunc then
					local lnk = linkFunc(...)
					modifyTooltip(lnk)
				end
				
				origMethod(self, ...)
					
				SafeAddString(SI_TOOLTIP_ITEM_NAME, EsoZH.StringsBackup["SI_TOOLTIP_ITEM_NAME"], 10)
				SafeAddString(SI_ITEM_FORMAT_STR_ENCHANT_HEADER_NAMED, EsoZH.StringsBackup["SI_ITEM_FORMAT_STR_ENCHANT_HEADER_NAMED"], 10)
				SafeAddString(SI_ITEM_FORMAT_STR_ITEM_TRAIT_HEADER, EsoZH.StringsBackup["SI_ITEM_FORMAT_STR_ITEM_TRAIT_HEADER"], 10)
				SafeAddString(SI_ITEM_FORMAT_STR_ITEM_TRAIT_WITH_ICON_HEADER, EsoZH.StringsBackup["SI_ITEM_FORMAT_STR_ITEM_TRAIT_WITH_ICON_HEADER"], 10)
				SafeAddString(SI_ITEM_FORMAT_STR_SET_NAME, EsoZH.StringsBackup["SI_ITEM_FORMAT_STR_SET_NAME"], 10)
				SafeAddString(SI_ITEM_FORMAT_STR_PERFECTED_SET_NAME, EsoZH.StringsBackup["SI_ITEM_FORMAT_STR_PERFECTED_SET_NAME"], 10)
			end
		end
		
		local function comparativeTooltipHook(tooltip, gameDataType, ...)
			if gameDataType == TOOLTIP_GAME_DATA_EQUIPPED_INFO then
				local slotIndex, actorCategory = ...
				local itemLink = GetWornLink(slotIndex, GetWornBagForGameplayActorCategory(actorCategory))
				modifyTooltip(itemLink)
			elseif gameDataType == TOOLTIP_GAME_DATA_STOLEN then
				SafeAddString(SI_TOOLTIP_ITEM_NAME, EsoZH.StringsBackup["SI_TOOLTIP_ITEM_NAME"], 10)
				SafeAddString(SI_ITEM_FORMAT_STR_ENCHANT_HEADER_NAMED, EsoZH.StringsBackup["SI_ITEM_FORMAT_STR_ENCHANT_HEADER_NAMED"], 10)
				SafeAddString(SI_ITEM_FORMAT_STR_ITEM_TRAIT_HEADER, EsoZH.StringsBackup["SI_ITEM_FORMAT_STR_ITEM_TRAIT_HEADER"], 10)
				SafeAddString(SI_ITEM_FORMAT_STR_ITEM_TRAIT_WITH_ICON_HEADER, EsoZH.StringsBackup["SI_ITEM_FORMAT_STR_ITEM_TRAIT_WITH_ICON_HEADER"], 10)
				SafeAddString(SI_ITEM_FORMAT_STR_SET_NAME, EsoZH.StringsBackup["SI_ITEM_FORMAT_STR_SET_NAME"], 10)
				SafeAddString(SI_ITEM_FORMAT_STR_PERFECTED_SET_NAME, EsoZH.StringsBackup["SI_ITEM_FORMAT_STR_PERFECTED_SET_NAME"], 10)
			end
		end
		
		--itemTooltipHook(AntiquityTooltip, "SetAntiquitySetFragment", AntiqTest)
		itemTooltipHook(ItemTooltip, "SetAttachedMailItem", GetAttachedItemLink)
		itemTooltipHook(ItemTooltip, "SetBagItem", GetItemLink)
		itemTooltipHook(ItemTooltip, "SetBuybackItem", GetBuybackItemLink)
		itemTooltipHook(ItemTooltip, "SetLink", GetChatLink)
		itemTooltipHook(ItemTooltip, "SetLootItem", GetLootItemLink)
		itemTooltipHook(ItemTooltip, "SetStoreItem", GetStoreItemLink)
		itemTooltipHook(ItemTooltip, "SetTradeItem", GetTradeItemLink)
		itemTooltipHook(ItemTooltip, "SetTradingHouseItem", GetTradingHouseSearchResultItemLink)
		itemTooltipHook(ItemTooltip, "SetTradingHouseListing", GetTradingHouseListingItemLink)
		itemTooltipHook(ItemTooltip, "SetWornItem", GetWornLink)
		itemTooltipHook(ItemTooltip, "SetReward", GetItemRewardItemLink)
		itemTooltipHook(PopupTooltip, "SetLink", GetChatLink)
		itemTooltipHook(ItemTooltip, "SetItemUsingEnchantment", GetEnchantedItemResultingItemLink)
		itemTooltipHook(ItemTooltip, "SetAction", GetSlotItemLink)
		itemTooltipHook(ItemTooltip, "SetItemSetCollectionPieceLink", GetChatLink)
		
		ZO_PreHookHandler(ComparativeTooltip1, "OnAddGameData", comparativeTooltipHook)
		ZO_PreHookHandler(ComparativeTooltip2, "OnAddGameData", comparativeTooltipHook)
		
		itemTooltipHook(ZO_AlchemyTopLevelTooltip, "SetPendingAlchemyItem", CheckAlchemyName)
		itemTooltipHook(ZO_EnchantingTopLevelTooltip, "SetPendingEnchantingItem", GetEnchantingResultingItemLink)
		itemTooltipHook(ZO_ProvisionerTopLevelTooltip, "SetProvisionerResultItem", GetRecipeResultItemLink)
		itemTooltipHook(ZO_SmithingTopLevelCreationPanelResultTooltip, "SetPendingSmithingItem", GetSmithingPatternResultLink)
		itemTooltipHook(ZO_SmithingTopLevelImprovementPanelResultTooltip, "SetSmithingImprovementResult", GetSmithingImprovedItemLink)
		itemTooltipHook(ZO_RetraitStation_KeyboardTopLevelRetraitPanelResultTooltip, "SetPendingRetraitItem", GetResultingItemLinkAfterRetrait)
		itemTooltipHook(ZO_RetraitStation_KeyboardTopLevelRetraitPanelResultTooltip, "SetBagItem", GetItemLink)
		itemTooltipHook(ZO_RetraitStation_KeyboardTopLevelReconstructPanelOptionsPreviewTooltip, "SetItemSetCollectionPieceLink", GetChatLink)
		
		-- Gamepad PreHooks
		
		local function GamepadTooltipPreHook(tooltip, ...)
			modifyTooltip(itemLink)
		end
		
		local function GamepadTooltipPostHook()
			SafeAddString(SI_TOOLTIP_ITEM_NAME, EsoZH.StringsBackup["SI_TOOLTIP_ITEM_NAME"], 10)
			SafeAddString(SI_ITEM_FORMAT_STR_ENCHANT_HEADER_NAMED, EsoZH.StringsBackup["SI_ITEM_FORMAT_STR_ENCHANT_HEADER_NAMED"], 10)
			SafeAddString(SI_ITEM_FORMAT_STR_ITEM_TRAIT_HEADER, EsoZH.StringsBackup["SI_ITEM_FORMAT_STR_ITEM_TRAIT_HEADER"], 10)
			SafeAddString(SI_ITEM_FORMAT_STR_ITEM_TRAIT_WITH_ICON_HEADER, EsoZH.StringsBackup["SI_ITEM_FORMAT_STR_ITEM_TRAIT_WITH_ICON_HEADER"], 10)
			SafeAddString(SI_ITEM_FORMAT_STR_SET_NAME, EsoZH.StringsBackup["SI_ITEM_FORMAT_STR_SET_NAME"], 10)
			SafeAddString(SI_ITEM_FORMAT_STR_PERFECTED_SET_NAME, EsoZH.StringsBackup["SI_ITEM_FORMAT_STR_PERFECTED_SET_NAME"], 10)
		end
		
		ZO_PreHook(GAMEPAD_TOOLTIPS:GetTooltip(GAMEPAD_LEFT_TOOLTIP),    "LayoutItem", function(tooltip, ...)   modifyTooltip(({...})[1]) end)
		ZO_PreHook(GAMEPAD_TOOLTIPS:GetTooltip(GAMEPAD_RIGHT_TOOLTIP),   "LayoutItem", function(tooltip, ...)   modifyTooltip(({...})[1]) end)
		ZO_PreHook(GAMEPAD_TOOLTIPS:GetTooltip(GAMEPAD_MOVABLE_TOOLTIP), "LayoutItem", function(tooltip, ...)   modifyTooltip(({...})[1]) end)
		
		ZO_PreHook(ZO_GamepadSmithingCreation,    "SetupResultTooltip", function(tooltip, ...)   modifyTooltip(GetSmithingPatternResultLink(...)) end)
		ZO_PreHook(ZO_GamepadSmithingImprovement,    "SetupResultTooltip", function(tooltip, ...)   modifyTooltip(GetSmithingImprovedItemLink(...)) end)
		ZO_PreHook(ZO_GamepadAlchemy,    "UpdateTooltip", function(tooltip)   modifyTooltip(CheckAlchemyName(tooltip:GetAllCraftingBagAndSlots())) end)
		
		ZO_PreHook(ZO_GamepadEnchanting,    "UpdateTooltip", function(tooltip)
			if tooltip:IsCraftable() then
				modifyTooltip(GetEnchantingResultingItemLink(tooltip:GetAllCraftingBagAndSlots()))
			elseif tooltip:IsExtractable() and tooltip.extractionSlot:HasOneItem() then
				modifyTooltip(GetItemLink(tooltip.extractionSlot:GetItemBagAndSlot(1)))
			end
		end)
		
		ZO_PreHook(ZO_GamepadProvisioner,    "RefreshRecipeDetails", function(tooltip, selectedData)
			if selectedData then
				modifyTooltip(GetRecipeResultItemLink(selectedData.recipeListIndex, selectedData.recipeIndex))
				local prePostHook = tooltip.ingredientsBar.Clear
				ZO_PostHook(tooltip.ingredientsBar, "Clear", function()
					GamepadTooltipPostHook()
					tooltip.ingredientsBar.Clear = prePostHook
				end)
			end
		end)
		
		ZO_PreHook(ZO_GamepadSmithingExtraction,    "RefreshTooltip", function(tooltip)
			if tooltip.extractionSlot:HasOneItem() then
				local bagId, slotIndex = tooltip.extractionSlot:GetItemBagAndSlot(1)
				modifyTooltip(GetItemLink(bagId, slotIndex))
			end
		end)
		
		local prePostHookSm = ZO_GamepadSmithingImprovement.Refresh
		ZO_PreHook(ZO_GamepadSmithingImprovement, "Refresh", function(tooltip, ...)
			ZO_GamepadSmithingImprovement.Refresh = prePostHookSm
			ZO_PreHook(tooltip.sourceTooltip.tip, "LayoutImproveSourceSmithingItem", function(tlt, ...)
				modifyTooltip(GetItemLink(...))
			end)
			
			ZO_PostHook(tooltip.sourceTooltip.tip, "LayoutImproveSourceSmithingItem", function(tlt, ...)
				GamepadTooltipPostHook()
			end)
		end)
		
		ZO_PreHook(ZO_RetraitStation_Retrait_Gamepad, "LayoutSourceItemTooltip", function(tooltip, itemData)
			if itemData then
				modifyTooltip(GetItemLink(itemData.bagId, itemData.slotIndex))
			end
		end)
		
		ZO_PreHook(ZO_RetraitStation_Retrait_Gamepad, "LayoutResultItemTooltip", function(tooltip, traitData)
			local itemData = tooltip.inventory:CurrentSelection()
			if itemData and traitData then
				local bagId = itemData.bagId
				local slotIndex = itemData.slotIndex
				local resultItemLink = GetResultingItemLinkAfterRetrait(bagId, slotIndex, traitData.trait)
				modifyTooltip(resultItemLink)
			end
		end)
		
		ZO_PreHook(ZO_RetraitStation_Reconstruct_Gamepad,    "RefreshResultTooltip", function(tooltip)
			if tooltip.itemSetPieceData and tooltip:IsOptionsModeShowing() then
				modifyTooltip(tooltip.itemSetPieceData:GetItemLink())
			end
		end)
		
		-- Gamepad PostHooks
		
		ZO_PostHook(GAMEPAD_TOOLTIPS:GetTooltip(GAMEPAD_LEFT_TOOLTIP),    "LayoutItem", function()   GamepadTooltipPostHook() end)
		ZO_PostHook(GAMEPAD_TOOLTIPS:GetTooltip(GAMEPAD_RIGHT_TOOLTIP),   "LayoutItem", function()   GamepadTooltipPostHook() end)
		ZO_PostHook(GAMEPAD_TOOLTIPS:GetTooltip(GAMEPAD_MOVABLE_TOOLTIP), "LayoutItem", function()   GamepadTooltipPostHook() end)
		
		ZO_PostHook(ZO_GamepadSmithingCreation,    "SetupResultTooltip", function()   GamepadTooltipPostHook() end)
		ZO_PostHook(ZO_GamepadSmithingImprovement,    "SetupResultTooltip", function()   GamepadTooltipPostHook() end)
		ZO_PostHook(ZO_GamepadAlchemy,    "UpdateTooltip", function()   GamepadTooltipPostHook() end)
		ZO_PostHook(ZO_GamepadEnchanting,    "UpdateTooltip", function()   GamepadTooltipPostHook() end)
		ZO_PostHook(ZO_GamepadProvisioner,    "RefreshRecipeDetails", function()   GamepadTooltipPostHook() end)
		ZO_PostHook(ZO_GamepadSmithingExtraction,    "RefreshTooltip", function()   GamepadTooltipPostHook() end)
		ZO_PostHook(ZO_RetraitStation_Retrait_Gamepad,    "LayoutSourceItemTooltip", function()   GamepadTooltipPostHook() end)
		ZO_PostHook(ZO_RetraitStation_Retrait_Gamepad,    "LayoutResultItemTooltip", function()   GamepadTooltipPostHook() end)
		ZO_PostHook(ZO_RetraitStation_Reconstruct_Gamepad,    "RefreshResultTooltip", function()   GamepadTooltipPostHook() end)
		
		-- Third-party Compatibility
		
		-- Tamriel Trade Centre
		if EsoZH:IsAddonRunning("TamrielTradeCentre") then
			if TamrielTradeCentre_ItemInfo then
				ZO_PreHook(TamrielTradeCentre_ItemInfo, "New", function() SafeAddString(SI_TOOLTIP_ITEM_NAME, EsoZH.StringsBackup["SI_TOOLTIP_ITEM_NAME"], 10) end)
			end
			
			if TamrielTradeCentre_MasterWritInfo then
				ZO_PreHook(TamrielTradeCentre_MasterWritInfo, "New", function() SafeAddString(SI_TOOLTIP_ITEM_NAME, EsoZH.StringsBackup["SI_TOOLTIP_ITEM_NAME"], 10) end)
			end
		end
		
		-- Item Set Browser
		if ItemBrowser then
			itemTooltipHook(ExtendedJournalItemTooltip, "SetLink", GetChatLink)
		end

		-- Wish List
		if WishList then
			itemTooltipHook(WishListTooltip, "SetLink", GetChatLink)
		end
	end
	EsoZH_doubleNameItems = nil
end