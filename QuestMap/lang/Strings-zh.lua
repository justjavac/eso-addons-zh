--[[

Quest Map
by CaptainBlagbird
https://github.com/CaptainBlagbird

--]]

local strings = {
    -- General
    QUESTMAP_COMPLETED             = "已完成",
    QUESTMAP_UNCOMPLETED           = "未完成",
    QUESTMAP_HIDDEN                = "手动隐藏",
    QUESTMAP_STARTED               = "已开始",
    QUESTMAP_GUILD                 = "公会",
    QUESTMAP_DAILY                 = "日常",
    QUESTMAP_SKILL                 = "技能点",
    QUESTMAP_CADWELL               = "卡德威尔",
    QUESTMAP_DUNGEON               = "副本",
    QUESTMAP_HOLIDAY               = "节日",
    QUESTMAP_WEEKLY                = "周常",
    QUESTMAP_ZONESTORY             = "区域主线",
    QUESTMAP_PROLOGUE              = "序章",
    QUESTMAP_PLEDGES               = "誓约",

    QUESTMAP_HIDE                  = "隐藏任务",
    QUESTMAP_UNHIDE                = "取消隐藏任务",

    QUESTMAP_MSG_HIDDEN            = "任务隐藏",
    QUESTMAP_MSG_UNHIDDEN          = "任务取消隐藏",
    QUESTMAP_MSG_HIDDEN_P          = "任务隐藏",
    QUESTMAP_MSG_UNHIDDEN_P        = "任务取消隐藏",

    QUESTMAP_QUESTS                = "任务",
    QUESTMAP_QUEST_SUBFILTER       = "子筛选",

    QUESTMAP_SLASH_USAGE           = "请在此命令后使用一个参数:\n 'hide' - 隐藏当前地图上的所有任务\n 'unhide' - 取消当前地图上所有任务的隐藏",
    QUESTMAP_SLASH_MAPINFO         = "请先打开地图。",

    QUESTMAP_LIB_REQUIRED          = "没有安装",

    -- Settings menu
    QUESTMAP_MENU_ICON_SET         = "图标设置",

    QUESTMAP_MENU_PIN_SIZE         = "地图标记尺寸",
    QUESTMAP_MENU_PIN_SIZE_TT      = "定义地图标记的显示大小 (默认: 25)",

    QUESTMAP_MENU_PIN_LVL          = "地图标记层级",
    QUESTMAP_MENU_PIN_LVL_TT       = "定义在哪个层级绘制地图标记 (默认: 40)",

    QUESTMAP_MENU_DISP_MSG         = "在聊天栏显示任务隐藏或取消隐藏消息",
    QUESTMAP_MENU_DISP_MSG_TT      = "任务隐藏或取消隐藏时是否在聊天栏显示消息",

    QUESTMAP_MENU_TOGGLE_HIDDEN_MSG      = "隐藏或取消隐藏任务选项",
    QUESTMAP_MENU_TOGGLE_HIDDEN_MSG_TT     = "点击任务图标时，是否显示隐藏或取消隐藏任务选项",

    QUESTMAP_MENU_TOGGLE_COMPLETED_MSG      = "显示已完成任务清单选项",
    QUESTMAP_MENU_TOGGLE_COMPLETED_MSG_TT      = "点击已完成任务图标和图标堆叠在一起时，是否显示任务清单",

    QUESTMAP_MENU_HIDDEN_QUESTS_T  = "手动隐藏任务",
    QUESTMAP_MENU_HIDDEN_QUESTS_1  = "你可以通过点击任务标记手动(取消)隐藏它们。(要查看被隐藏的任务标记, 激活地图右侧的标记过滤器。)",
    QUESTMAP_MENU_HIDDEN_QUESTS_2  = "想要立即(取消)隐藏某地图所有任务标记, 你可以使用命令 '/qm hide' 或 '/qm unhide'",
    QUESTMAP_MENU_HIDDEN_QUESTS_B  = "如果你想清除所有手动隐藏的任务标记, 你可以使用此按钮:",

    QUESTMAP_MENU_RESET_HIDDEN     = "重置被隐藏的标记",
    QUESTMAP_MENU_RESET_HIDDEN_TT  = "重置手动隐藏的标记",
    QUESTMAP_MENU_RESET_HIDDEN_W   = "不可撤销!",

    QUESTMAP_MENU_RESET_NOTE       = "注意: 点击下方的 '"..GetString(SI_OPTIONS_DEFAULTS).."' 不会重置手动隐藏的任务标记。",

    QUESTMAP_MENU_SHOW_SUFFIX        = "显示提示框子选项",
    QUESTMAP_MENU_SHOW_SUFFIX_TT     = "切出任务标记提示子选项以适应个人偏好或色盲无障碍设置。",

    -- Uncompleted quest pin text
    QUESTMAP_UNCOMPLETED_PIN_COLOR  = "未完成任务标记颜色",
    QUESTMAP_UNCOMPLETED_PIN_COLOR_DESC  = "改变未完成任务标记颜色",

    QUESTMAP_UNCOMPLETED_TOOLTIP_COLOR  = "未完成任务提示框颜色",
    QUESTMAP_UNCOMPLETED_TOOLTIP_COLOR_DESC  = "改变未完成任务提示框颜色",

    -- Completed quest pin text
    QUESTMAP_COMPLETED_PIN_COLOR  = "已完成任务标记颜色",
    QUESTMAP_COMPLETED_PIN_COLOR_DESC  = "改变已完成任务标记颜色",

    QUESTMAP_COMPLETED_TOOLTIP_COLOR  = "已完成任务提示框颜色",
    QUESTMAP_COMPLETED_TOOLTIP_COLOR_DESC  = "改变已完成任务提示框颜色",

    -- Hidden quest pin text
    QUESTMAP_HIDDEN_PIN_COLOR  = "被隐藏任务标记颜色",
    QUESTMAP_HIDDEN_PIN_COLOR_DESC  = "改变被隐藏任务标记颜色",

    QUESTMAP_HIDDEN_TOOLTIP_COLOR  = "被隐藏任务提示框颜色",
    QUESTMAP_HIDDEN_TOOLTIP_COLOR_DESC  = "改变被隐藏任务提示框颜色",

    -- Started quest pin text
    QUESTMAP_STARTED_PIN_COLOR  = "已开始任务标记颜色",
    QUESTMAP_STARTED_PIN_COLOR_DESC  = "改变已开始任务标记颜色",

    QUESTMAP_STARTED_TOOLTIP_COLOR  = "已开始任务提示框颜色",
    QUESTMAP_STARTED_TOOLTIP_COLOR_DESC  = "改变已开始任务提示框颜色",

    -- Repeatable quest pin text
    QUESTMAP_REPEATABLE_PIN_COLOR  = "可重复任务标记颜色",
    QUESTMAP_REPEATABLE_PIN_COLOR_DESC  = "改变可重复任务标记颜色",

    QUESTMAP_REPEATABLE_TOOLTIP_COLOR  = "可重复任务提示框颜色",
    QUESTMAP_REPEATABLE_TOOLTIP_COLOR_DESC  = "改变可重复任务提示框颜色",

    -- Daily quest pin text
    QUESTMAP_DAILY_PIN_COLOR  = "日常任务标记颜色",
    QUESTMAP_DAILY_PIN_COLOR_DESC  = "改变日常任务标记颜色",

    QUESTMAP_DAILY_TOOLTIP_COLOR  = "日常任务提示框颜色",
    QUESTMAP_DAILY_TOOLTIP_COLOR_DESC  = "改变日常任务提示框颜色",

    -- Weekly Duration quest pin text
    QUESTMAP_WEEKLY_PIN_COLOR  = "周常任务标记颜色",
    QUESTMAP_WEEKLY_PIN_COLOR_DESC  = "改变周常任务标记颜色",

    QUESTMAP_WEEKLY_TOOLTIP_COLOR  = "周常任务提示框颜色",
    QUESTMAP_WEEKLY_TOOLTIP_COLOR_DESC  = "改变周常任务提示框颜色",

    -- Holiday quest pin text
    QUESTMAP_HOLIDAY_PIN_COLOR  = "节日任务标记颜色",
    QUESTMAP_HOLIDAY_PIN_COLOR_DESC  = "改变节日任务标记颜色",

    QUESTMAP_HOLIDAY_TOOLTIP_COLOR  = "节日任务提示框颜色",
    QUESTMAP_HOLIDAY_TOOLTIP_COLOR_DESC  = "改变节日任务提示框颜色",

    -- Cadwell quest pin text
    QUESTMAP_CADWELL_PIN_COLOR  = "卡德威尔任务标记颜色",
    QUESTMAP_CADWELL_PIN_COLOR_DESC  = "改变卡德威尔任务标记颜色",

    QUESTMAP_CADWELL_TOOLTIP_COLOR  = "卡德威尔任务提示框颜色",
    QUESTMAP_CADWELL_TOOLTIP_COLOR_DESC  = "改变卡德威尔任务提示框颜色",

    -- Skill quest pin text
    QUESTMAP_SKILL_PIN_COLOR  = "技能任务标记颜色",
    QUESTMAP_SKILL_PIN_COLOR_DESC  = "改变技能任务标记颜色",

    QUESTMAP_SKILL_TOOLTIP_COLOR  = "技能任务提示框颜色",
    QUESTMAP_SKILL_TOOLTIP_COLOR_DESC  = "改变技能任务提示框颜色",

    -- Dungeon quest pin text
    QUESTMAP_DUNGEON_PIN_COLOR  = "副本任务标记颜色",
    QUESTMAP_DUNGEON_PIN_COLOR_DESC  = "改变副本任务标记颜色",

    QUESTMAP_DUNGEON_TOOLTIP_COLOR  = "副本任务提示框颜色",
    QUESTMAP_DUNGEON_TOOLTIP_COLOR_DESC  = "改变副本任务提示框颜色",

    -- Zonestory quest pin text
    QUESTMAP_ZONESTORY_PIN_COLOR  = "区域主线任务标记颜色",
    QUESTMAP_ZONESTORY_PIN_COLOR_DESC  = "改变区域主线任务标记颜色",

    QUESTMAP_ZONESTORY_TOOLTIP_COLOR  = "区域主线任务提示框颜色",
    QUESTMAP_ZONESTORY_TOOLTIP_COLOR_DESC  = "改变区域主线任务标记颜色",

    -- Prologue quest pin text
    QUESTMAP_PROLOGUE_PIN_COLOR  = "序章任务标记颜色",
    QUESTMAP_PROLOGUE_PIN_COLOR_DESC  = "改变序章任务标记颜色",

    QUESTMAP_PROLOGUE_TOOLTIP_COLOR  = "序章任务提示框颜色",
    QUESTMAP_PROLOGUE_TOOLTIP_COLOR_DESC  = "改变序章任务标记颜色",

    -- Pledges quest pin text
    QUESTMAP_PLEDGES_PIN_COLOR  = "誓约任务标记颜色",
    QUESTMAP_PLEDGES_PIN_COLOR_DESC  = "改变誓约任务标记颜色",

    QUESTMAP_PLEDGES_TOOLTIP_COLOR  = "誓约任务提示框颜色",
    QUESTMAP_PLEDGES_TOOLTIP_COLOR_DESC  = "改变誓约任务标记颜色",

}

for key, value in pairs(strings) do
   ZO_CreateStringId(key, value)
   SafeAddVersion(key, 1)
end
