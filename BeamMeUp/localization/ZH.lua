local mkstr = ZO_CreateStringId
local SI = BMU.SI

-----------------------------------------------------------------------------
-- INTERFACE
-----------------------------------------------------------------------------
mkstr(SI.TELE_UI_TOTAL, "结果:")
mkstr(SI.TELE_UI_GOLD, "节省金币:")
mkstr(SI.TELE_UI_GOLD_ABBR, "k")
mkstr(SI.TELE_UI_GOLD_ABBR2, "m")
mkstr(SI.TELE_UI_TOTAL_PORTS, "共传送:")
---------
--------- Buttons
mkstr(SI.TELE_UI_BTN_REFRESH_ALL, "刷新结果表")
mkstr(SI.TELE_UI_BTN_UNLOCK_WS, "自动发现当前区域指路祭坛")
mkstr(SI.TELE_UI_BTN_FIX_WINDOW, "固定/解锁窗口")
mkstr(SI.TELE_UI_BTN_TOGGLE_ZONE_GUIDE, "切换到BeamMeUp")
mkstr(SI.TELE_UI_BTN_TOGGLE_BMU, "切换到区域指南")
mkstr(SI.TELE_UI_BTN_PORT_TO_OWN_HOUSE, "拥有的房屋")
mkstr(SI.TELE_UI_BTN_ANCHOR_ON_MAP, "浮在/不浮在地图上")
mkstr(SI.TELE_UI_BTN_GUILD_BMU, "公会")
mkstr(SI.TELE_UI_BTN_GUILD_HOUSE_BMU, "访问BeamMeUp公会大厅")
mkstr(SI.TELE_UI_BTN_PTF_INTEGRATION, "\"传送到朋友的房子\" 集成")
mkstr(SI.TELE_UI_BTN_DUNGEON_FINDER, "竞技场/试炼/副本")
mkstr(SI.TELE_UI_BTN_TOOLTIP_CONTEXT_MENU, "\n|c777777(右键点击查看更多选项))")
---------
--------- List
mkstr(SI.TELE_UI_UNRELATED_ITEMS, "其他区域地图")
mkstr(SI.TELE_UI_UNRELATED_QUESTS, "其他区域任务")
mkstr(SI.TELE_UI_SAME_INSTANCE, "相同情况")
mkstr(SI.TELE_UI_DIFFERENT_INSTANCE, "不同情况")
---------
--------- Menu
mkstr(SI.TELE_UI_FAVORITE_PLAYER, "玩家收藏家")
mkstr(SI.TELE_UI_FAVORITE_ZONE, "区域收藏夹")
mkstr(SI.TELE_UI_REMOVE_FAVORITE_PLAYER, "移除玩家收藏")
mkstr(SI.TELE_UI_REMOVE_FAVORITE_ZONE, "移除区域收藏")
mkstr(SI.TELE_UI_VOTE_TO_LEADER, "投票队长")
mkstr(SI.TELE_UI_RESET_COUNTER_ZONE, "重置计数器")
mkstr(SI.TELE_UI_INVITE_BMU_GUILD, "邀请到BeamMeUp公会")
mkstr(SI.TELE_UI_SHOW_QUEST_MARKER_ON_MAP, "显示任务标记")
mkstr(SI.TELE_UI_RENAME_HOUSE_NICKNAME, "重命名房子昵称")
mkstr(SI.TELE_UI_TOGGLE_HOUSE_NICKNAME, "显示昵称")
mkstr(SI.TELE_UI_VIEW_MAP_ITEM, "查看地图物品")
mkstr(SI.TELE_UI_TOGGLE_ARENAS, "单人竞技场")
mkstr(SI.TELE_UI_TOGGLE_GROUP_ARENAS, "组队竞技场")
mkstr(SI.TELE_UI_TOGGLE_TRIALS, "试炼")
mkstr(SI.TELE_UI_TOGGLE_GROUP_DUNGEONS, "组队副本")
mkstr(SI.TELE_UI_TOGGLE_SORT_ACRONYM, "以首字母排序")
mkstr(SI.TELE_UI_DAYS_LEFT, "%d 天剩余")
mkstr(SI.TELE_UI_TOGGLE_DLC_NAMES, "显示DLC名")
mkstr(SI.TELE_UI_UNLOCK_WAYSHRINES, "自动发现指路祭坛")

mkstr(SI.TELE_UI_SUBMENU_FAVORITES, "收藏夹")



-----------------------------------------------------------------------------
-- CHAT OUTPUTS
-----------------------------------------------------------------------------
mkstr(SI.TELE_CHAT_UNLOCK_START_INFO, "开始自动解锁…")
mkstr(SI.TELE_CHAT_UNLOCK_WS_SUCCESS, "自动解锁成功完成")
mkstr(SI.TELE_CHAT_UNLOCK_WS_COUNT_CALC, "计算已解锁的指路祭坛...")
mkstr(SI.TELE_CHAT_UNLOCK_WS_COUNT_PLU, "新的指路祭坛已被解锁")
mkstr(SI.TELE_CHAT_UNLOCK_WS_COUNT_SING, "新的指路祭坛已被解锁")
mkstr(SI.TELE_CHAT_UNLOCK_WS_NO_PLAYERS, "没有玩家可传送")
mkstr(SI.TELE_CHAT_FAVORITE_UNSET, "收藏槽未设置")
mkstr(SI.TELE_CHAT_FAVORITE_PLAYER_NO_FAST_TRAVEL, "此玩家已下线或被筛选器设置隐藏")
mkstr(SI.TELE_CHAT_FAVORITE_ZONE_NO_FAST_TRAVEL, "没有找到快速旅行选项")
mkstr(SI.TELE_CHAT_NOT_IN_GROUP, "您不在队伍中")
mkstr(SI.TELE_CHAT_PORT_TO_OWN_PRIMARY_HOUSE_FAILED, "没有设置主要房屋!")
mkstr(SI.TELE_CHAT_GROUP_LEADER_YOURSELF, "您是队长")
mkstr(SI.TELE_CHAT_UNLOCK_WS_DISCOVERED_TOTAL, "区域中已发现的指路祭坛总数:")
mkstr(SI.TELE_CHAT_UNLOCK_WS_NEED_DISCOVERED, "以下指路祭坛还需要实际到访:")
mkstr(SI.TELE_CHAT_SHARING_FOLLOW_LINK, "跟随链接 ...")



-----------------------------------------------------------------------------
-- SETTINGS
-----------------------------------------------------------------------------
mkstr(SI.TELE_SETTINGS_SHOW_ON_MAP_OPEN, "打开地图时打开BeamMeUp")
mkstr(SI.TELE_SETTINGS_SHOW_ON_MAP_OPEN_TOOLTIP, "当您打开地图时, BeamMeUp也将自动打开, 否则的话您将在地图左上部看见一个按钮, 地图完成度窗口中也会有一个切换按钮。")
mkstr(SI.TELE_SETTINGS_ZONE_ONCE_ONLY, "每个区域只显示一次")
mkstr(SI.TELE_SETTINGS_ZONE_ONCE_ONLY_TOOLTIP, "每个区域只显示一个清单.")
mkstr(SI.TELE_SETTINGS_AUTO_PORT_FREQ, "解锁指路祭坛的频率 (ms)")
mkstr(SI.TELE_SETTINGS_AUTO_PORT_FREQ_TOOLTIP, "调整自动解锁指路祭坛的频率。对于配置比较差的电脑或者只是为了防掉线, 更高的频率会有所帮助。")
mkstr(SI.TELE_SETTINGS_AUTO_REFRESH, "打开时刷新并重置")
mkstr(SI.TELE_SETTINGS_AUTO_REFRESH_TOOLTIP, "每次打开BeamMeUp时自动刷新结果列表。清空输入框.")
mkstr(SI.TELE_SETTINGS_HEADER_BLACKLISTING, "黑名单")
mkstr(SI.TELE_SETTINGS_HIDE_OTHERS, "隐藏难以进入的区域")
mkstr(SI.TELE_SETTINGS_HIDE_OTHERS_TOOLTIP, "隐藏例如大漩涡竞技场，法外之地和单人区域之类的区域。")
mkstr(SI.TELE_SETTINGS_HIDE_PVP, "隐藏PVP区域")
mkstr(SI.TELE_SETTINGS_HIDE_PVP_TOOLTIP, "隐藏例如悉罗帝尔, 帝都和角斗场等区域。")
mkstr(SI.TELE_SETTINGS_HIDE_CLOSED_DUNGEONS, "隐藏组队副本和试炼")
mkstr(SI.TELE_SETTINGS_HIDE_CLOSED_DUNGEONS_TOOLTIP, "隐藏所有4人组队副本, 12人试炼和荒崖的组队副本。这些区域内的队伍成员将仍然被显示!")
mkstr(SI.TELE_SETTINGS_HIDE_HOUSES, "隐藏房屋")
mkstr(SI.TELE_SETTINGS_HIDE_HOUSES_TOOLTIP, "隐藏所有房屋。")
mkstr(SI.TELE_SETTINGS_DISABLE_DIALOG, "隐藏自动解锁确认对话框")
mkstr(SI.TELE_SETTINGS_DISABLE_DIALOG_TOOLTIP, "当你使用自动解锁功能时不显示任何确认对话框。")
mkstr(SI.TELE_SETTINGS_WINDOW_STAY, "保持BeamMeUp打开")
mkstr(SI.TELE_SETTINGS_WINDOW_STAY_TOOLTIP, "当您不打开地图状态下打开BeamMeUp, 即便您移动或打开其他窗口他仍将保留。如您使用此选项, 建议关闭'关地图同时关闭BeamMeUp'选项。")
mkstr(SI.TELE_SETTINGS_ONLY_MAPS, "只在区域/世界区域显示")
mkstr(SI.TELE_SETTINGS_ONLY_MAPS_TOOLTIP, "只在如迪莎安或夏幕岛之类的主要区域显示。")
mkstr(SI.TELE_SETTINGS_AUTO_REFRESH_FREQ, "刷新间隔 (s)")
mkstr(SI.TELE_SETTINGS_AUTO_REFRESH_FREQ_TOOLTIP, "当BeamMeUp打开, 结果列表将会每 x 秒钟自动刷新一次。将数值设置为 0 可以禁用自动刷新。")
mkstr(SI.TELE_SETTINGS_FOCUS_ON_MAP_OPEN, "定位到区域查找框")
mkstr(SI.TELE_SETTINGS_FOCUS_ON_MAP_OPEN_TOOLTIP, "当BeamMeUp与地图同时打开时，定位光标到区域查找框。")
mkstr(SI.TELE_SETTINGS_HIDE_DELVES, "隐藏洞穴")
mkstr(SI.TELE_SETTINGS_HIDE_DELVES_TOOLTIP, "隐藏所有洞穴。")
mkstr(SI.TELE_SETTINGS_HIDE_PUBLIC_DUNGEONS, "隐藏公共副本")
mkstr(SI.TELE_SETTINGS_HIDE_PUBLIC_DUNGEONS_TOOLTIP, "隐藏所有公共副本。")
mkstr(SI.TELE_SETTINGS_FORMAT_ZONE_NAME, "隐藏区域名称冠词")
mkstr(SI.TELE_SETTINGS_FORMAT_ZONE_NAME_TOOLTIP, "隐藏区域名称里的冠词以确保更好的排序，更快地找到区域。(中文此选项无效)")
mkstr(SI.TELE_SETTINGS_NUMBER_LINES, "行/列表数量")
mkstr(SI.TELE_SETTINGS_NUMBER_LINES_TOOLTIP, "通过设置可见的行/列表数量，您可以控制插件的总体高度。")
mkstr(SI.TELE_SETTINGS_HEADER_ADVANCED, "额外功能")
mkstr(SI.TELE_SETTINGS_HEADER_UI, "通用")
mkstr(SI.TELE_SETTINGS_HEADER_RECORDS, "列表")
mkstr(SI.TELE_SETTINGS_CLOSE_ON_PORTING, "自动关闭地图和BeamMeUp")
mkstr(SI.TELE_SETTINGS_CLOSE_ON_PORTING_TOOLTIP, "当传送开始后关闭地图和BeamMeUp。")
mkstr(SI.TELE_SETTINGS_SHOW_NUMBER_PLAYERS, "显示每张地图玩家数量")
mkstr(SI.TELE_SETTINGS_SHOW_NUMBER_PLAYERS_TOOLTIP, "显示每张地图您可传送的玩家数量。您可以点击数字以查看所有这些玩家。")
mkstr(SI.TELE_SETTINGS_CHAT_BUTTON_OFFSET, "聊天窗口中按钮偏移")
mkstr(SI.TELE_SETTINGS_CHAT_BUTTON_OFFSET_TOOLTIP, "增加聊天窗口头部按钮的水平偏移量，以避免与其他插件图标的视觉冲突。")
mkstr(SI.TELE_SETTINGS_SEARCH_CHARACTERNAMES, "也搜索角色名")
mkstr(SI.TELE_SETTINGS_SEARCH_CHARACTERNAMES_TOOLTIP, "当搜索玩家时也搜索角色名。")
mkstr(SI.TELE_SETTINGS_SORTING, "排序")
mkstr(SI.TELE_SETTINGS_SORTING_TOOLTIP, "为列表选择一种可行的排序方式。")
mkstr(SI.TELE_SETTINGS_SECOND_SEARCH_LANGUAGE, "第二语言搜索")
mkstr(SI.TELE_SETTINGS_SECOND_SEARCH_LANGUAGE_TOOLTIP, "您可以同时以当前客户端语言以及此第二语言搜索区域名。区域名的提示框也显示其在第二预言中的名称。")
mkstr(SI.TELE_SETTINGS_NOTIFICATION_PLAYER_FAVORITE_ONLINE, "收藏玩家上线通知")
mkstr(SI.TELE_SETTINGS_NOTIFICATION_PLAYER_FAVORITE_ONLINE_TOOLTIP, "当一个被收藏的玩家上线时，您可收到一则通知 (屏幕中央信息)。")
mkstr(SI.TELE_SETTINGS_HIDE_ON_MAP_CLOSE, "关地图同时关闭BeamMeUp")
mkstr(SI.TELE_SETTINGS_HIDE_ON_MAP_CLOSE_TOOLTIP, "当你关闭地图时, BeamMeUp也同时关闭。")
mkstr(SI.TELE_SETTINGS_MAP_DOCK_OFFSET_HORIZONTAL, "地图漂浮位置偏移 - 水平")
mkstr(SI.TELE_SETTINGS_MAP_DOCK_OFFSET_HORIZONTAL_TOOLTIP, "此处您可以自定义地图上漂浮的水平偏移。")
mkstr(SI.TELE_SETTINGS_MAP_DOCK_OFFSET_VERTICAL, "地图漂浮位置偏移 - 垂直")
mkstr(SI.TELE_SETTINGS_MAP_DOCK_OFFSET_VERTICAL_TOOLTIP, "此处您可以自定义地图上漂浮的垂直偏移。")
mkstr(SI.TELE_SETTINGS_RESET_ALL_COUNTERS, "重置所有区域计数器")
mkstr(SI.TELE_SETTINGS_RESET_ALL_COUNTERS_TOOLTIP, "所有区域计数器被重置。因此最常使用排序也将被重置。")
mkstr(SI.TELE_SETTINGS_OFFLINE_NOTE, "下线通知")
mkstr(SI.TELE_SETTINGS_OFFLINE_NOTE_TOOLTIP, "当您设置为下线一段时间，并私信或传送到某人, 您将在聊天窗获得一条通知以提醒你。只要你仍设置为下线状态，你将无法接收任何私信信息，同时别人无法传送到你。（但分享就是关心哦）")
mkstr(SI.TELE_SETTINGS_SCALE, "UI尺寸")
mkstr(SI.TELE_SETTINGS_SCALE_TOOLTIP, "为整个BeamMeUp的UI/窗口缩放所有元素。需要重新加载以应用更改。")
mkstr(SI.TELE_SETTINGS_RESET_UI, "重置UI")
mkstr(SI.TELE_SETTINGS_RESET_UI_TOOLTIP, "将以下选项设置为默认以重置BeamMeUp界面: 尺寸, 按钮偏移, 地图漂浮偏移和窗口位置。整个界面将重新载入。")
mkstr(SI.TELE_SETTINGS_HOUSE_NICKNAMES, "显示房屋昵称")
mkstr(SI.TELE_SETTINGS_HOUSE_NICKNAMES_TOOLTIP, "为您的房屋显示昵称(可更改)以替代常用名。")
mkstr(SI.TELE_SETTINGS_SURVEY_MAP_NOTIFICATION, "调查报告地图通知")
mkstr(SI.TELE_SETTINGS_SURVEY_MAP_NOTIFICATION_TOOLTIP, "如果你挖完了一个调查报告，却在物品栏中还有完全相同的调查报告 (相同地点) ，将会显示一个通知 (屏幕中央信息) 来提醒你。")
mkstr(SI.TELE_SETTINGS_HEADER_PRIO, "优先次序")
mkstr(SI.TELE_SETTINGS_HEADER_CHAT_COMMANDS, "聊天命令")
mkstr(SI.TELE_SETTINGS_UNLOCKING_LESS_CHAT_OUTPUT, "最小化聊天输出")
mkstr(SI.TELE_SETTINGS_UNLOCKING_LESS_CHAT_OUTPUT_TOOLTIP, "当使用自动解锁功能时减少聊天输出的数量。")
mkstr(SI.TELE_SETTINGS_PRIORITIZATION_DESCRIPTION, "在这里你可以定义哪些玩家优先被用于快速旅行。离开或加入公会后，需要重新载入才能正确显示。")
mkstr(SI.TELE_SETTINGS_SHOW_BUTTON_ON_MAP, "在地图上显示额外的按钮")
mkstr(SI.TELE_SETTINGS_SHOW_BUTTON_ON_MAP_TOOLTIP, "在世界地图的左上角显示一个文本按钮来打开BeamMeUp。")
mkstr(SI.TELE_SETTINGS_SURVEY_MAP_NOTIFICATION_SOUND, "播放声音")
mkstr(SI.TELE_SETTINGS_SURVEY_MAP_NOTIFICATION_SOUND_TOOLTIP, "显示通知时播放声音。")
mkstr(SI.TELE_SETTINGS_AUTO_CONFIRM_WAYSHRINE_TRAVEL, "自动确认指路祭坛快速旅行")
mkstr(SI.TELE_SETTINGS_AUTO_CONFIRM_WAYSHRINE_TRAVEL_TOOLTIP, "当你传送到其他指路祭坛时不显示确认框。")
mkstr(SI.TELE_SETTINGS_CURRENT_ZONE_ALWAYS_TOP, "总是将当前地区置顶")
mkstr(SI.TELE_SETTINGS_CURRENT_ZONE_ALWAYS_TOP_TOOLTIP, "总是将当前地区置于列表顶端。")
mkstr(SI.TELE_SETTINGS_HIDE_OWN_HOUSES, "隐藏自己的房子")
mkstr(SI.TELE_SETTINGS_HIDE_OWN_HOUSES_TOOLTIP, "在主列表中隐藏你自己的房子(传送外部)。")
mkstr(SI.TELE_SETTINGS_HEADER_STATS, "统计")
mkstr(SI.TELE_SETTINGS_MOST_PORTED_ZONES, "最常去区域:")
mkstr(SI.TELE_SETTINGS_INSTALLED_SCINCE, "至少从此时已安装:")
mkstr(SI.TELE_SETTINGS_INFO_CHARACTER_DEPENDING, "此功能关联到您的角色 (非账号全局设置)!")
mkstr(SI.TELE_SETTINGS_SHOW_TELEPORT_ANIMATION, "传送动画")
mkstr(SI.TELE_SETTINGS_SHOW_TELEPORT_ANIMATION_TOOLTIP, "通过BeamMeUp开始快速旅行时显示额外的传送动画。必须已解锁收藏品'芬维尔的装饰品'。")
mkstr(SI.TELE_SETTINGS_SHOW_CHAT_BUTTON, "聊天窗口中的按钮")
mkstr(SI.TELE_SETTINGS_SHOW_CHAT_BUTTON_TOOLTIP, "在聊天窗口的标题栏显示一个按钮来打开BeamMeUp。")
mkstr(SI.TELE_SETTINGS_USE_PAN_AND_ZOOM, "平移和缩放")
mkstr(SI.TELE_SETTINGS_USE_PAN_AND_ZOOM_TOOLTIP, "当您点击队伍成员或特殊区域（例如副本、房屋）时，在地图上平移和缩放到目的地。")
mkstr(SI.TELE_SETTINGS_USE_RALLY_POINT, "地图图标")
mkstr(SI.TELE_SETTINGS_USE_RALLY_POINT_TOOLTIP, "当您点击队伍成员或特殊区域（例如副本、房屋）时，在地图中的目的地上显示一个地图图标(集合点) 。必须安装运行库LibMapPing。另外请注意: 如果您是队伍队长，你的图标(集合点)将对所有队伍成员可见。")
mkstr(SI.TELE_SETTINGS_SHOW_ZONES_WITHOUT_PLAYERS, "显示不带传送选项的所有区域")
mkstr(SI.TELE_SETTINGS_SHOW_ZONES_WITHOUT_PLAYERS_TOOLTIP, "在主列表中显示全部区域，即使该地区不带传送选项（无玩家或房屋可传送）。")



-----------------------------------------------------------------------------
-- KEY BINDING
-----------------------------------------------------------------------------
mkstr(SI.TELE_KEYBINDING_TOGGLE_MAIN, "打开BeamMeUp")
mkstr(SI.TELE_KEYBINDING_TOGGLE_MAIN_RELATED_ITEMS, "藏宝图&调查报告&线索")
mkstr(SI.TELE_KEYBINDING_REFRESH, "刷新结果列表")
mkstr(SI.TELE_KEYBINDING_WAYSHRINE_UNLOCK, "解锁当前区域指路祭坛")
mkstr(SI.TELE_KEYBINDING_PRIMARY_RESIDENCE, "传送进入您的主房屋")
mkstr(SI.TELE_KEYBINDING_GUILD_HOUSE_BMU, "访问BeamMeUp公会大厅")
mkstr(SI.TELE_KEYBINDING_CURRENT_ZONE, "传送到当前区域")
mkstr(SI.TELE_KEYBINDING_PRIMARY_RESIDENCE_OUTSIDE, "传送主房屋外部")
mkstr(SI.TELE_KEYBINDING_TOGGLE_MAIN_DUNGEON_FINDER, "竞技场/试炼/副本")
mkstr(SI.TELE_KEYBINDING_TRACKED_QUEST, "传送到聚焦任务")



-----------------------------------------------------------------------------
-- DIALOGS | NOTIFICATIONS
-----------------------------------------------------------------------------
mkstr(SI.TELE_DIALOG_AUTO_UNLOCK_TITLE, "开始自动解锁指路祭坛吗?")
mkstr(SI.TELE_DIALOG_AUTO_UNLOCK_BODY, "确认后, BeamMeUp将开始自动传送当前区域中所有可传送的玩家。通过这种方法，您将自动在各个指路祭坛间传送以解锁尽可能多的指路祭坛。")
mkstr(SI.TELE_DIALOG_NO_BMU_GUILD_BODY, "我们很抱歉, 此服务器目前还没有BeamMeUp公会。\n\n通过ESOUI网站您可轻松联系我们并在此服务器中创建一个官方BeamMeUp公会。")
mkstr(SI.TELE_DIALOG_INFO_BMU_GUILD_BODY, "您好，感谢您使用BeamMeUp。2019年, 我们建立了几个公会以分享免费的快速旅行选项。我们欢迎所有人, 没有其他附加条件!\n\n确认此对话框, 您将在列表中看到官方和合作公会，欢迎你加入! 您也可以通过点击左上角的公会按钮来找到公会\n您的BeamMeUp团队")
mkstr(SI.TELE_DIALOG_REFUSE_AUTO_UNLOCK_TITLE, "已不再需要解锁")
mkstr(SI.TELE_DIALOG_REFUSE_AUTO_UNLOCK_BODY, "区域中的指路祭坛已经全部被解锁")
mkstr(SI.TELE_DIALOG_INFO_NEW_FEATURE_FAVORITE_PLAYER_NOTIFICATION, "当一名收藏玩家上线时，你将收到一个通知 (屏幕中央信息)。\n\n开启此功能?")
mkstr(SI.TELE_DIALOG_INFO_NEW_FEATURE_SURVEY_MAP_NOTIFICATION, "如果你挖完了一个调查报告，却在物品栏中还有完全相同的调查报告 (相同地点) ，将会显示一个通知 (屏幕中央信息) 来提醒你。\n\n开启此功能?")
mkstr(SI.TELE_DIALOG_REFUSE_AUTO_UNLOCK_TITLE2, "无法解锁")
mkstr(SI.TELE_DIALOG_REFUSE_AUTO_UNLOCK_BODY2, "此区域无法解锁指路祭坛。此功能仅在世界区域或主要区域可用。")
mkstr(SI.TELE_DIALOG_PTF_INTEGRATION_MISSING_TITLE, "集成\"传送到朋友房子\"")
mkstr(SI.TELE_DIALOG_PTF_INTEGRATION_MISSING_BODY, "要使用此集成功能, 请安装\"Port to Friend's House\"插件。然后你会在列表中看到你配置好的房子和公会大厅。\n\n想要现在打开\"Port to Friend's House\"插件网站吗?")
mkstr(SI.TELE_DIALOG_REFUSE_AUTO_UNLOCK_TITLE3, "无法解锁")
mkstr(SI.TELE_DIALOG_REFUSE_AUTO_UNLOCK_BODY3, "很不辛, 区域内没有可传送的玩家。")



-----------------------------------------------------------------------------
-- CENTER SCREEN NOTIFICATIONS
-----------------------------------------------------------------------------
mkstr(SI.TELE_CENTERSCREEN_OFFLINE_NOTE_HEAD, "通知: 你仍然设置为下线状态!")
mkstr(SI.TELE_CENTERSCREEN_OFFLINE_NOTE_BODY, "别人无法私信或传送到你!\n|c8c8c8c(本通知可以在BeamMeUp插件设置中禁用)")
mkstr(SI.TELE_CENTERSCREEN_SURVEY_MAPS, "此调查报告还有 %d 份剩余! 刷新后再回来!")
mkstr(SI.TELE_CENTERSCREEN_FAVORITE_PLAYER_ONLINE, "目前已下线!")




-----------------------------------------------------------------------------
-- ITEM NAMES (PART OF IT) - BACKUP
-----------------------------------------------------------------------------
mkstr(SI.CONSTANT_TREASURE_MAP, "藏宝图") -- need a part of the item name that is in every treasure map item the same no matter which zone
mkstr(SI.CONSTANT_SURVEY_MAP, "调查报告:") -- need a part of the item name that is in every survey map item the same no matter which zone and kind of craft