------------------------------------------------
-- Chinese localization for DailyProvisioning
------------------------------------------------

ZO_CreateStringId("DP_CRAFTING_QUEST",      "烹饪师日常令状")
ZO_CreateStringId("DP_CRAFTING_MASTER",     "大师食物")
ZO_CreateStringId("DP_CRAFTING_WITCH",      "女巫节令状")
ZO_CreateStringId("DP_CRAFTING_EVENT1",     "慈善捐赠")    
ZO_CreateStringId("DP_CRAFTING_EVENT1BOOK", "帝国慈善令")        



ZO_CreateStringId("DP_BULK_HEADER",         "批量制造")
ZO_CreateStringId("DP_BULK_FLG",            "立刻制造所有所需物品")
ZO_CreateStringId("DP_BULK_FLG_TOOLTIP",    "当你想制造大量的所需物品时使用。")
ZO_CreateStringId("DP_BULK_COUNT",          "制造数量")
ZO_CreateStringId("DP_BULK_COUNT_TOOLTIP",  "实际制造数量可能比这个数量更多。(取决于你的 厨师/酿造师 技能)")

ZO_CreateStringId("DP_CRAFT_WRIT",          "生产密封的令状")
ZO_CreateStringId("DP_CRAFT_WRIT_MSG",      "当访问烹饪料理处时, <<1>>")
ZO_CreateStringId("DP_CANCEL_WRIT",         "取消密封的令状")
ZO_CreateStringId("DP_CANCEL_WRIT_MSG",     "密封的令状被取消")

ZO_CreateStringId("DP_OTHER_HEADER",        "其他")
ZO_CreateStringId("DP_ACQUIRE_ITEM",        "从银行取回物品")
ZO_CreateStringId("DP_DELAY",               "延迟时间")
ZO_CreateStringId("DP_DELAY_TOOLTIP",       "取回物品的延迟时间(秒)\n如果你不能把东西拿出来, 增加此值。")
ZO_CreateStringId("DP_AUTO_EXIT",           "自动退出")
ZO_CreateStringId("DP_AUTO_EXIT_TOOLTIP",   "完成日常令状后你将自动退出制造台.")
ZO_CreateStringId("DP_DONT_KNOW",           "如果食谱未学会则禁用自动制造")
ZO_CreateStringId("DP_DONT_KNOW_TOOLTIP",   "如果你的角色未学会完成令状所需要的食谱则不会自动制造物品.")
ZO_CreateStringId("DP_LOG",                 "显示日志")
ZO_CreateStringId("DP_DEBUG_LOG",           "显示调试日志")

ZO_CreateStringId("DP_UNKNOWN_RECIPE",      " 食谱 [<<1>>] 未学会. 无法制造物品.")
ZO_CreateStringId("DP_MISMATCH_RECIPE",     " ... [错误]食谱名不匹配 (<<1>>)")
ZO_CreateStringId("DP_NOTHING_RECIPE",      " ... 没有食谱")
ZO_CreateStringId("DP_SHORT_OF",            " ... 缺少原材料 (<<1>>)")




function DailyProvisioning:ConvertedItemNameForDisplay(itemName)
    return itemName
end

function DailyProvisioning:ConvertedItemNames(itemName)
    local list = {
        {"%-",  " "},
        {"%^.*", ""},
    }

    local convertedItemName = itemName
    for _, value in ipairs(list) do
        convertedItemName = string.gsub(convertedItemName, value[1], value[2])
    end
    return {convertedItemName}
end

function DailyProvisioning:ConvertedJournalCondition(journalCondition)

    local list = {
        {"\n", ""},
        {" ",  " "},   -- code(0xA0) > space(0x20): HTML non-breaking space ?("0xC2 0xA0")
        {"%-", " "},

        -- Master Writ(Create from context menu)
        {".+:制作一个%w*(.*)",             "制造[%1]"},
        {".+:制作(.*)",                   "制造[%1]"},

        -- Master Writ(in Journal)
        {"制作一个%w*(.*)...%s进行中:",  "制造[%1]"},

        -- Dayly
        {"制造(.*):",                 "制造[%1]"},
    }

    local convertedCondition = journalCondition
    for _, value in ipairs(list) do
        convertedCondition = string.gsub(convertedCondition, value[1], value[2])
    end
    return convertedCondition
end

function DailyProvisioning:CraftingConditions()
    local list = {
        "制造",
    }
    return list
end

function DailyProvisioning:isProvisioning(journalCondition)
    local list = {
        "制作一个.*带有",                       -- SI_MASTER_WRIT_QUEST_ALCHEMY_FORMAT_STRING
        "锻造商人出售此.*",    -- [en.lang.csv] "7949764","0","61966","xxxxxxxx"
        "制衣商人出售此.*",      -- [en.lang.csv] "7949764","0","61968","xxxxxxxx"
        "木工商人出售此.*",     -- [en.lang.csv] "7949764","0","61970","xxxxxxxx"
        "木工师出售此.*",              -- [en.lang.csv] "7949764","0","68075","xxxxxxxx"
    }
    return not self:Contains(journalCondition, list)
end

