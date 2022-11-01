local L = {}

L.Description                            = "在试炼期间在屏幕上显示不同事件的提醒."

--------------------------------
----     General Stuff      ----
--------------------------------
L.Settings_General_Header                           = "通用"
-- Settings
L.Settings_General_Notifications_Showcase           = "提醒展示"
L.Settings_General_Bufffood_Reminder                = "Buff食物提醒器"
L.Settings_General_Bufffood_Reminder_TT             = "在试炼中当你没有buff食物或即将耗尽时提醒你 (见下面)"
L.Settings_General_Bufffood_Reminder_Interval       = "提醒间隔"
L.Settings_General_Bufffood_Reminder_Interval_TT    = "食物提醒的间隔时间, 单位为秒, 剩余10分钟时开始。"
L.Settings_General_Vanity_Pets                      = "在试炼中关闭无用的宠物"
L.Settings_General_Vanity_Pets_TT                   = "当你开始一场试炼时将会关闭你无用的宠物。一旦你完成或退出试炼，你的宠物将再次可用。"
L.Settings_General_No_Assistants                    = "战斗开始时关闭助手"
L.Settings_General_No_Assistants_TT                 = "只在试炼中关闭助手，且助手可以通过再次召唤以在战斗中使用。"
L.Settings_General_Center_Screen_Announce           = "公告类型"
L.Settings_General_Center_Screen_Announce_TT        = "要使用的公告类型。\n\n只有自定义格式的公告可以重新定位其在屏幕中的位置。"
L.Settings_General_NotificationsScale               = "通知缩放"
L.Settings_General_NotificationsScale_TT            = "通知和次要倒计时显示的缩放比例"
L.Settings_General_UseDisplayName                   = "使用显示名称"
L.Settings_General_UseDisplayName_TT                = "在提醒中使用一个玩家的显示名称而不使用角色名称。"
L.Settings_General_Unlock_Status_Icon               = "解锁统计图标"
L.Settings_General_Unlock_Status_Icon_TT            = "开启时将在屏幕上显示一个可移动的统计图标。"
L.Settings_General_Default_Sound                    = "默认声音"
L.Settings_General_Default_Sound_TT                 = "通知使用的默认声音。"
-- Choices
L.Settings_General_Choices_Off                      = "关"
L.Settings_General_Choices_Full                     = "全部"
L.Settings_General_Choices_Normal                   = "普通"
L.Settings_General_Choices_Minimal                  = "最小"
L.Settings_General_Choices_Self                     = "自己"
L.Settings_General_Choices_Near                     = "附近"
L.Settings_General_Choices_All                      = "所有"
L.Settings_General_Choices_Always                   = "总是"
L.Settings_General_Choices_Other                    = "其他"
L.Settings_General_Choices_Inverted                 = "反向"
L.Settings_General_Choices_Small_Announcement       = "小 (静态，废弃)"
L.Settings_General_Choices_Large_Announcement       = "大 (静态，废弃)"
L.Settings_General_Choices_Major_Announcement       = "主要 (静态，废弃)"
L.Settings_General_Choices_1s                       = "1.0秒"
L.Settings_General_Choices_500ms                    = "0.5秒"
L.Settings_General_Choices_200ms                    = "0.2秒"
L.Settings_General_Choices_Custom                   = "自定义"
L.Settings_General_Choices_Custom_Announcement      = "自定义 (可移动)"
L.Settings_General_Choices_OnlyChaurusTotem         = "仅查鲁斯" -- Specific for Kyne's Aegis
-- Alerts
L.Alerts_General_No_Bufffood                        = "你没有buff食物!"
L.Alerts_General_Bufffood_Minutes                   = "你的 '<<1>>' buff食物将在 |cbd0000<<2>>|r 分钟后耗尽!"
-- Bindings
L.Binding_ToggleUltimateExchange                    = "切换终极"


--------------------------------
----    Ultimate Exchange   ----
--------------------------------
L.Settings_Ultimate_Header                           = "终极交换 (beta)"
L.Settings_Ultimate_Description                      = "此功能允许你将你的终极技能发送给你的团队成员，使他们可以看见你还有多久后可以释放。无论是套装还是被动引起了消耗减少，它都可以显示。"
-- Settings 
L.Settings_Ultimate_Enabled                          = "开启"
L.Settings_Ultimate_Enabled_TT                       = "开启分享和接收终极值。在试炼之外将被禁用"
L.Settings_Ultimate_Hidden                           = "隐藏"
L.Settings_Ultimate_Hidden_TT                        = "隐藏终极窗口，但不会终止它的功能。"
L.Settings_Ultimate_UseColor                         = "使用颜色"
L.Settings_Ultimate_UseColor_TT                      = "给与他人的终极技一个阈值基于百分之80到100之间的颜色"
L.Settings_Ultimate_UseDisplayName                   = "显示用户名"
L.Settings_Ultimate_UseDisplayName_TT                = "在终极窗口中显示用户名而不是角色名。"
L.Settings_Ultimate_ShowHealers                      = "显示治疗者"
L.Settings_Ultimate_ShowHealers_TT                   = "为治疗者角色的团队成员显示终极技。"
L.Settings_Ultimate_ShowTanks                        = "显示坦克"
L.Settings_Ultimate_ShowTanks_TT                     = "为坦克角色的团队成员显示终极技。"
L.Settings_Ultimate_ShowDps                          = "显示伤害者"
L.Settings_Ultimate_ShowDps_TT                       = "为DPS角色的团队成员显示终极技。"
L.Settings_Ultimate_TargetUlti                       = "终极技能"
L.Settings_Ultimate_TargetUlti_TT                    = "使用什么终极技能使其百分比值对其他人可见。"
L.Settings_Ultimate_OverrideCost                     = "覆盖消耗"
L.Settings_Ultimate_OverrideCost_TT                  = "当发送你的终极消耗给其他人时使用此值。设为0则禁用覆盖。"


--------------------------------
----        Profiles        ----
--------------------------------
L.Settings_Profile_Header                            = "配置"
L.Settings_Profile_Description                       = "设置配置可以在此处管理，包括一个开启账户全局设置的选项，此选项可以将相同的设置应用到此账户下的所有角色上。由于此选项是永久性的，必须先使用面板底部的复选框开启管理。"
L.Settings_Profile_UseGlobal                         = "使用账户全局设置"
L.Settings_Profile_UseGlobal_Warning                 = "在全局或局部配置间切换将重载界面。"
L.Settings_Profile_Copy                              = "选择一个配置以复制"
L.Settings_Profile_Copy_TT                           = "选择一个配置，将此配置中的设置复制到当前的配置上。当前配置可以是当前已登录的角色，也可以是账户全局的配置（如果开启的话）。当前配置中的设置将被永久覆盖\n\n该操作无法撤销!"
L.Settings_Profile_CopyButton                        = "复制配置"
L.Settings_Profile_CopyButton_Warning                = "复制一个配置将会重载界面。"
L.Settings_Profile_CopyCannotCopy                    = "无法复制选中的配置。请再次尝试或选择另一个配置。"
L.Settings_Profile_Delete                            = "选择一个配置以删除"
L.Settings_Profile_Delete_TT                         = "选择一个配置以从数据库中删除它。如果稍后该角色被登陆, 而你没有开启账户全局设置, 全新的默认设置将会被创建。\n\n删除配置是永久性的!"
L.Settings_Profile_DeleteButton                      = "删除配置"
L.Settings_Profile_Guard                             = "开启配置管理"


--------------------------------
----       Countdowns       ----
--------------------------------
L.Settings_Countdown_Header                          = "倒计时"
L.Settings_Countdown_Description                     = "改变倒计时的外貌和行为。"
L.Settings_Countdown_TimerScale                      = "主要计时尺寸(废弃)"
L.Settings_Countdown_TimerScale_TT                   = "计时显示的尺寸"
L.Settings_Countdown_TextScale                       = "主要文本尺寸(废弃)"
L.Settings_Countdown_TextScale_TT                    = "文本显示的尺寸"
L.Settings_Countdown_TimerPrecise                    = "计时精度"
L.Settings_Countdown_TimerPrecise_TT                    = "为倒计时设置计时精度"
L.Settings_Countdown_UseColors                       = "使用颜色"
L.Settings_Countdown_UseColors_TT                    = "开启时当倒计时接近零时，将使用 黄色/橙色/红色 等颜色"


--------------------------------
----          Trials        ----
--------------------------------
L.Settings_Trials_Header                            = "试炼"
L.Settings_Trials_Description                       = "此处你可以为每一个试炼单独配置提醒。它们全都有一个可配置的声音，而且其中很多不光支持你自己，还支持你的队友。"


--------------------------------
----     Hel Ra Citadel     ----
--------------------------------
L.Settings_HelRa_Header                             = "荷尔·拉要塞(HRC)"
-- Settings
L.Settings_HelRa_Yokeda_Meteor                      = "尤柯达: 流星"
L.Settings_HelRa_Yokeda_Meteor_TT                   = "当尤柯达即将使用流星进行攻击时警告你。"
L.Settings_HelRa_Warrior_StoneForm                  = "战士座: 石头形态"
L.Settings_HelRa_Warrior_StoneForm_TT               = "当你和其他人即将被战士座变为石头时警告你。"
L.Settings_HelRa_Warrior_ShieldThrow                = "战士座: 盾牌投掷"
L.Settings_HelRa_Warrior_ShieldThrow_TT             = "当战士座即将投掷他的盾牌时警告你。"
--Alerts
L.Alerts_HelRa_Yokeda_Meteor                        = "|cFF0000流星|r 目标 你 !格挡!"
L.Alerts_HelRa_Yokeda_Meteor_Other                  = "|cFF0000流星|r 目标 |c595959<<!aC:1>>|r !"
L.Alerts_HelRa_Warrior_StoneForm                    = "|c595959石头形态|r 目标 你 !不要使用协同!"
L.Alerts_HelRa_Warrior_StoneForm_Other              = "|c595959石头形态|r 目标 |cFF0000<<!aC:1>>|r !"
L.Alerts_HelRa_Warrior_ShieldThrow                  = "|cFF0000盾牌投掷|r 目标 你 !"


--------------------------------
----   Aetherian Archives   ----
--------------------------------
L.Settings_Archive_Header                           = "艾瑟瑞斯档案塔(AA)"
-- Settings
L.Settings_Archive_StormAtro_ImpendingStorm         = "风暴侍灵: 风暴迫近"
L.Settings_Archive_StormAtro_ImpendingStorm_TT      = "当风暴侍灵即将释放大型闪电AoE时警告你。"
L.Settings_Archive_StormAtro_LightningStorm         = "风暴侍灵: 雷暴"
L.Settings_Archive_StormAtro_LightningStorm_TT      = "当风暴侍灵从天上召唤闪电时警告你需要躲避。"
L.Settings_Archive_StoneAtro_BoulderStorm           = "岩石侍灵: 巨石风暴"
L.Settings_Archive_StoneAtro_BoulderStorm_TT        = "当岩石侍灵开始向人群投掷大量石头时警告你。"
L.Settings_Archive_StoneAtro_BigQuake               = "岩石侍灵: 大地震"
L.Settings_Archive_StoneAtro_BigQuake_TT            = "当岩石侍灵开始践踏地面时警告你。"
L.Settings_Archive_Overcharge                       = "怪物: 超载"
L.Settings_Archive_Overcharge_TT                    = "当一个超载者的超载技能以你为目标时警告你。"
L.Settings_Archive_Call_Lightning                   = "怪物: 召唤闪电"
L.Settings_Archive_Call_Lightning_TT                = "当一个超载者的召唤闪电技能以你为目标时警告你。"
-- Alerts 
L.Alerts_Archive_StormAtro_ImpendingStorm           = "|cFF0000风暴迫近|r !"
L.Alerts_Archive_StormAtro_LightningStorm           = "|cfef92e雷暴|r !进入光内!"
L.Alerts_Archive_StoneAtro_BoulderStorm             = "|cFF0000巨石风暴|r !格挡避免击退!"
L.Alerts_Archive_StoneAtro_BigQuake                 = "|cFF0000大地震|r !"
L.Alerts_Archive_Overcharge                         = "|c46edff超载|r 目标 你 !"
L.Alerts_Archive_Overcharge_Other                   = "|c46edff超载|r 目标 |cFF0000<<!aC:1>>|r !"
L.Alerts_Archive_Call_Lightning                     = "|c46edff召唤闪电|r 目标 你 !动起来!"
L.Alerts_Archive_Call_Lightning_Other               = "|c46edff召唤闪电|r 目标 |cFF0000<<!aC:1>>|r !"


--------------------------------
----    Sanctum Ophidia     ----
--------------------------------
L.Settings_Sanctum_Header                           = "乌鞘蛇圣所(SO)"
-- Settings
L.Settings_Sanctum_Magicka_Detonation               = "毒蛇座: 魔法爆炸"
L.Settings_Sanctum_Magicka_Detonation_TT            = "当你在毒蛇座战斗期间受到魔法爆炸debuff时警告你。"
L.Settings_Sanctum_Serpent_Poison                   = "毒蛇座: 剧毒阶段"
L.Settings_Sanctum_Serpent_Poison_TT                = "当在毒蛇座战斗期间进入剧毒阶段时警告你。"
L.Settings_Sanctum_Serpent_World_Shaper             = "毒蛇座: 世界塑造 (困难模式)"
L.Settings_Sanctum_Serpent_World_Shaper_TT          = "当毒蛇座开始世界塑造攻击时警告你, 倒计时直到它结束。"
L.Settings_Sanctum_Mantikora_Spear                  = "曼尼客拉: 长矛"
L.Settings_Sanctum_Mantikora_Spear_TT               = "当你将得到曼尼客拉长矛时警告你。"
L.Settings_Sanctum_Mantikora_Quake                  = "曼尼客拉: 震裂"
L.Settings_Sanctum_Mantikora_Quake_TT               = "当你在曼尼客拉上得到三套震裂或者符文时警告你。"
L.Settings_Sanctum_Troll_Boulder                    = "怪物: 巨魔巨石投掷"
L.Settings_Sanctum_Troll_Boulder_TT                 = "当一只巨魔准备向你投掷巨石时警告你。"
L.Settings_Sanctum_Troll_Poison                     = "怪物: 巨魔毒药"
L.Settings_Sanctum_Troll_Poison_TT                  = "当一只巨魔准备向你投掷散播毒药时警告你。"
L.Settings_Sanctum_Overcharge                       = "怪物: 超载"
L.Settings_Sanctum_Overcharge_TT                    = "当一个超载者的超载技能以你为目标时警告你。"
L.Settings_Sanctum_Call_Lightning                   = "怪物: 召唤闪电"
L.Settings_Sanctum_Call_Lightning_TT                = "当一个超载者的召唤闪电技能以你为目标时警告你。"
-- Alerts
L.Alerts_Sanctum_Serpent_Poison0                    = "|c39942e剧毒阶段|r !集中在一起!"
L.Alerts_Sanctum_Serpent_Poison1                    = "|c39942e剧毒阶段|r !被 |ccc0000蛇身女妖|r 跟随"
L.Alerts_Sanctum_Serpent_Poison2                    = "|c39942e剧毒阶段|r !被 |c009933曼尼客拉|r 跟随" --left
L.Alerts_Sanctum_Serpent_Poison3                    = "|c39942e剧毒阶段|r !被 |c009933曼尼客拉|r 跟随" --right
L.Alerts_Sanctum_Serpent_Poison4                    = "|c39942e剧毒阶段|r !被 |cff33cc盾牌|r 跟随"
L.Alerts_Sanctum_Serpent_Poison5                    = "最后的 |c39942e剧毒阶段|r !"
L.Alerts_Sanctum_Serpent_World_Shaper               = "|c00c832世界塑造|r 还有"
L.Alerts_Sanctum_Magicka_Detonation                 = "|c234afa魔法爆炸|r !用光你的魔法!"
L.Alerts_Sanctum_Mantikora_Spear                    = "曼尼客拉 |ccde846长矛|r 目标 你 !躲开!"
L.Alerts_Sanctum_Mantikora_Spear_Other              = "曼尼客拉 |ccde846长矛|r 目标 <<!aC:1>> !躲开!"
L.Alerts_Sanctum_Mantikora_Quake                    = "曼尼客拉 |ccde846震裂|r 目标 你 !躲开!"
L.Alerts_Sanctum_Troll_Poison                       = "|c66ff33巨魔毒药|r !不要散播它!"
L.Alerts_Sanctum_Troll_Poison_Other                 = "|c66ff33巨魔毒药|r 目标 |cFF0000<<!aC:1>>|r !"
L.Alerts_Sanctum_Troll_Boulder                      = "|c595959巨石投掷|r !躲避它!"
L.Alerts_Sanctum_Troll_Boulder_Other                = "|c595959巨石投掷|r 目标 |cFF0000<<!aC:1>>|r !"
L.Alerts_Sanctum_Overcharge                         = "|c46edff超载|r 目标 你 !"
L.Alerts_Sanctum_Overcharge_Other                   = "|c46edff超载|r 目标 |cFF0000<<!aC:1>>|r !"
L.Alerts_Sanctum_Call_Lightning                     = "|c46edff召唤闪电|r 目标 你 !跑起来!"
L.Alerts_Sanctum_Call_Lightning_Other               = "|c46edff召唤闪电|r 目标 |cFF0000<<!aC:1>>|r !"


--------------------------------
----    Maelstrom Arena     ----
--------------------------------
L.Settings_Maelstrom_Header                         = "大漩涡竞技场(MA)"
-- Settings
L.Settings_Maelstrom_Stage7_Poison                  = "第7阶段: 中毒"
L.Settings_Maelstrom_Stage7_Poison_TT               = "当你在第7阶段(暴徒的密室)中中毒时警告你。"
L.Settings_Maelstrom_Stage9_Synergy                 = "第9阶段: 幽灵爆炸 (协同)"
L.Settings_Maelstrom_Stage9_Synergy_TT              = "当你在第9阶段(绝望剧场)捡到3个(金)鬼魂后获得了协同技能时警告你。"
-- Alerts
L.Alerts_Maelstrom_Stage7_Poison                    = "|c39942e中毒|r !使用两个区域来解毒!"
L.Alerts_Maelstrom_Stage9_Synergy                   = "|c23afe7幽灵爆炸|r 就绪 !使用协同!"


--------------------------------
----     Maw of Lorkhaj     ----
--------------------------------
L.Settings_MawLorkhaj_Header                        = "洛哈吉之渊(MoL)"
-- Settings
L.Settings_MawLorkhaj_Zhaj_GripOfLorkhaj            = "扎哈撒: 洛哈吉之握"
L.Settings_MawLorkhaj_Zhaj_GripOfLorkhaj_TT         = "洛哈吉之握debuff开始影响你时获得一个提醒。"
L.Settings_MawLorkhaj_Zhaj_Glyphs                   = "扎哈撒: 清理平台 (beta)"
L.Settings_MawLorkhaj_Zhaj_Glyphs_TT                = "展示一个窗口来显示所有清理平台的状态和刷新倒计时。"
L.Settings_MawLorkhaj_Zhaj_Glyphs_Invert            = "       - 反向视野"
L.Settings_MawLorkhaj_Zhaj_Glyphs_Invert_TT         = "反向清理平台."
L.Settings_MawLorkhaj_Twin_Aspects                  = "伪月双子: 相位"
L.Settings_MawLorkhaj_Twin_Aspects_TT               = "当你在伪月双子战斗中获得了月光或暗影相位时警告你。\n\n    完全提醒，当你获得了一个相位时、当你开始转换相位时、当转换完成时。\n    普通提醒，当你获得一个相位时和你正在转换时。\n    最小提醒，仅当你正在转换时。"
L.Settings_MawLorkhaj_Twin_Aspects_Status           = "       - 显示状态"
L.Settings_MawLorkhaj_Twin_Aspects_Status_TT        = "boss战期间在状态显示中展示你当前的相位。"
L.Settings_MawLorkhaj_Rakkhat_Unstable_Void         = "拉阚: 动荡虚空"
L.Settings_MawLorkhaj_Rakkhat_Unstable_Void_TT      = "在拉阚战斗中当你获得了动荡虚空效果时警告你。"
L.Settings_MawLorkhaj_Rakkhat_Unstable_Void_Countdown = "       - 倒计时"
L.Settings_MawLorkhaj_Rakkhat_Unstable_Void_Countdown_TT = "当开启时，动荡虚空将显示倒计时，而不是简单的提醒。"
L.Settings_MawLorkhaj_Rakkhat_ThreshingWings        = "拉阚: 扑打之翼"
L.Settings_MawLorkhaj_Rakkhat_ThreshingWings_TT     = "当拉阚使用扑打之翼击技能退你时警告你。"
L.Settings_MawLorkhaj_Rakkhat_DarknessFalls         = "拉阚: 黑暗降临"
L.Settings_MawLorkhaj_Rakkhat_DarknessFalls_TT      = "当拉阚使用黑暗降临技能使天花板倒塌时警告你。"
L.Settings_MawLorkhaj_Rakkhat_DarkBarrage           = "拉阚: 黑暗齐射"
L.Settings_MawLorkhaj_Rakkhat_DarkBarrage_TT        = "当拉阚对坦克使用黑暗齐射引导技能时警告你。"
L.Settings_MawLorkhaj_Rakkhat_LunarBastion1         = "拉阚: 月之堡垒获得"
L.Settings_MawLorkhaj_Rakkhat_LunarBastion1_TT      = "当一名玩家从灼热平台获得祝福时显示。"
L.Settings_MawLorkhaj_Rakkhat_LunarBastion2         = "拉阚: 月之堡垒失去"
L.Settings_MawLorkhaj_Rakkhat_LunarBastion2_TT      = "当一名玩家从灼热平台失去祝福时显示。"
L.Settings_MawLorkhaj_Hulk_ArmorWeakened            = "浩克: 护甲受损"
L.Settings_MawLorkhaj_Hulk_ArmorWeakened_TT         = "当浩克使用雷霆粉碎攻击应用护甲受损debuff堆叠时发出警报。你不应该有超过两个堆叠，否则伤害将会过高。"
L.Settings_MawLorkhaj_ShatteringStrike              = "怪物: 破碎打击"
L.Settings_MawLorkhaj_ShatteringStrike_TT           = "当多-阿萨拉野蛮人即将施放破碎打击时获得一个提醒。"
L.Settings_MawLorkhaj_Shattered                     = "怪物: 盔甲破碎"
L.Settings_MawLorkhaj_Shattered_TT                  = "当你的盔甲破碎时获得一个提醒。"
L.Settings_MawLorkhaj_MarkedForDeath                = "怪物: 死亡标记 (黑豹)"
L.Settings_MawLorkhaj_MarkedForDeath_TT             = "如果被一个多-阿萨拉恐惧行者的黑豹死亡标记时获得一个提醒"
L.Settings_MawLorkhaj_Suneater_Eclipse              = "怪物: 食日者日食场地 (取消)"
L.Settings_MawLorkhaj_Suneater_Eclipse_TT           = "如果你成为日食场地的目标时获得一个提醒。"
-- Alerts
L.Alerts_MawLorkhaj_Zhaj_GripOfLorkhaj              = "注意! |c000055洛哈吉之握|r !立刻清理!"
L.Alerts_MawLorkhaj_Lunar_Aspect                    = "受到 |cFEFF7F月光|r 相位!"
L.Alerts_MawLorkhaj_Shadow_Aspect                   = "受到 |c000055暗影|r 相位!"
L.Alerts_MawLorkhaj_Lunar_Conversion                = "转变为 |cFEFF7F月光|r 相位!"
L.Alerts_MawLorkhaj_Shadow_Conversion               = "转变为 |c000055暗影|r 相位!"
L.Alerts_MawLorkhaj_Rakkhat_Unstable_Void           = "注意! |c000055动荡虚空|r 目标 你 !"
L.Alerts_MawLorkhaj_Rakkhat_Unstable_Void_Other     = "注意! |c000055动荡虚空|r 目标 |cFF0000<<!aC:1>>|r !"
L.Alerts_MawLorkhaj_Rakkhat_ThreshingWings          = "|cFF0000扑打之翼|r !格挡!"
L.Alerts_MawLorkhaj_Rakkhat_DarknessFalls           = "|cFF0000黑暗降临|r !"
L.Alerts_MawLorkhaj_Rakkhat_DarkBarrage             = "|cFF0000黑暗齐射|r !"
L.Alerts_MawLorkhaj_Rakkhat_LunarBastion1           = "你获得了 |cFEFF7F月之堡垒|r"
L.Alerts_MawLorkhaj_Rakkhat_LunarBastion1_Other     = "|cFF0000<<!aC:1>>|r 获得了 |cFEFF7F月之堡垒|r"
L.Alerts_MawLorkhaj_Rakkhat_LunarBastion2           = "你失去了 |cFEFF7F月之堡垒|r"
L.Alerts_MawLorkhaj_Rakkhat_LunarBastion2_Other     = "|cFF0000<<!aC:1>>|r 失去了 |cFEFF7F月之堡垒|r"
L.Alerts_MawLorkhaj_Hulk_ArmorWeakened1             = "你有1个|c000055护甲受损|rdebuff堆叠。"
L.Alerts_MawLorkhaj_Hulk_ArmorWeakened1_Other       = "|cFF0000<<!aC:1>>|r获得1个|c000055护甲受损|rdebuff堆叠。"
L.Alerts_MawLorkhaj_Hulk_ArmorWeakened2             = "你有|cFF00002个|r|c000055护甲受损|rdebuff堆叠了！"
L.Alerts_MawLorkhaj_Hulk_ArmorWeakened2_Other       = "|cFF0000<<!aC:1>>|r获得|cFF00002个|r|c000055护甲受损|rdebuff堆叠了！"
L.Alerts_MawLorkhaj_Suneater_Eclipse                = "|cFF0000日食场地|r 目标 你 !"
L.Alerts_MawLorkhaj_Suneater_Eclipse_Other          = "|cFF0000日食场地|r 目标 |cFF0000<<!aC:1>>|r !"
L.Alerts_MawLorkhaj_ShatteringStrike                = "|c000055破碎打击|r 目标 你 !"
L.Alerts_MawLorkhaj_ShatteringStrike_Other          = "|c000055破碎打击|r 目标 |cFF0000<<!aC:1>>|r !"
L.Alerts_MawLorkhaj_Shattered                       = "你的 |c595959盔甲|r 已经 |cff0000破碎|r."
L.Alerts_MawLorkhaj_MarkedForDeath                  = "注意! |c000055黑豹|r 正在追你!"


--------------------------------
----    Dragonstar Arena    ----
--------------------------------
L.Settings_Dragonstar_Header                        = "龙星竞技场(DSA)"
-- Settings
L.Settings_Dragonstar_General_Taking_Aim            = "普通: 瞄准"
L.Settings_Dragonstar_General_Taking_Aim_TT         = "当你成为瞄准技能的目标时警告你。"
L.Settings_Dragonstar_General_Crystal_Blast         = "普通: 爆裂水晶"
L.Settings_Dragonstar_General_Crystal_Blast_TT      = "当你成为爆裂水晶技能的目标时警告你。"
L.Settings_Dragonstar_Arena2_Crushing_Shock         = "竞技场 2: 粉碎冲击"
L.Settings_Dragonstar_Arena2_Crushing_Shock_TT      = "当你在寒冰竞技场中成为粉碎冲击技能的目标时警告你。"
L.Settings_Dragonstar_Arena6_Drain_Resource         = "竞技场 6: 消耗资源"
L.Settings_Dragonstar_Arena6_Drain_Resource_TT      = "当你在波兹莫竞技场中成为消耗资源毒箭的目标时警告你。"
L.Settings_Dragonstar_Arena7_Unstable_Core          = "竞技场 7: 动荡之核 (日食)"
L.Settings_Dragonstar_Arena7_Unstable_Core_TT       = "当你在祭献竞技场中圣职者boss对你放置动荡之核 (日食) 时警告你。"
L.Settings_Dragonstar_Arena8_Ice_Charge             = "竞技场 8: 寒冰冲锋"
L.Settings_Dragonstar_Arena8_Ice_Charge_TT          = "当一名冰霜百夫长即将发动寒冰攻击时警告你。"
L.Settings_Dragonstar_Arena8_Fire_Charge            = "竞技场 8: 火焰冲锋"
L.Settings_Dragonstar_Arena8_Fire_Charge_TT         = "当一名火焰百夫长即将发动火焰攻击时警告你。"
-- Alerts
L.Alerts_Dragonstar_General_Taking_Aim              = "|cFF6600瞄准|r 目标 你 !"
L.Alerts_Dragonstar_General_Crystal_Blast           = "|c990099爆裂水晶|r 目标 你 !"
L.Alerts_Dragonstar_Arena2_Crushing_Shock           = "|c3366EE粉碎冲击|r !格挡!"
L.Alerts_Dragonstar_Arena6_Drain_Resource           = "|c00CC00消耗资源|r !翻滚!"
L.Alerts_Dragonstar_Arena6_Drain_Resource_Other     = "|c00CC00消耗资源|r 目标 |cFF0000<<!aC:1>>|r !"
L.Alerts_Dragonstar_Arena7_Unstable_Core            = "你有 |cDDDD33动荡之核|r !挣脱!"
L.Alerts_Dragonstar_Arena8_Ice_Charge               = "|c6699FF寒冰冲锋|r 目标 你 !打断或翻滚!"
L.Alerts_Dragonstar_Arena8_Ice_Charge_Other         = "|c6699FF寒冰冲锋|r 目标 |cFF0000<<!aC:1>>|r !打断!"
L.Alerts_Dragonstar_Arena8_Fire_Charge              = "|cFF3113火焰冲锋|r 目标 你 !打断或翻滚!"
L.Alerts_Dragonstar_Arena8_Fire_Charge_Other        = "|c6699FF火焰冲锋|r 目标 |cFF0000<<!aC:1>>|r !打断!"



--------------------------------
---- Halls Of Fabrication   ----
--------------------------------
L.Settings_HallsFab_Header                          = "锻造大厅(HoF)"
-- Settings
L.Settings_HallsFab_Taking_Aim                      = "普通: 瞄准"
L.Settings_HallsFab_Taking_Aim_TT                   = "当你成为瞄准技能的目标时警告你。"
L.Settings_HallsFab_Taking_Aim_Dynamic              = "       - 倒计时"
L.Settings_HallsFab_Taking_Aim_Dynamic_TT           = "当开启时，瞄准攻击将显示倒计时，而不是简单的提醒。"
L.Settings_HallsFab_Taking_Aim_Duration             = "       - 倒计时持续"
L.Settings_HallsFab_Taking_Aim_Duration_TT          = "倒计时的持续时间，单位为毫秒。"
L.Settings_HallsFab_Draining_Ballista               = "普通: 消耗弩炮"
L.Settings_HallsFab_Draining_Ballista_TT            = "当球体需要被打掉时警告你。"
L.Settings_HallsFab_Conduit_Strike                  = "普通: 导管打击"
L.Settings_HallsFab_Conduit_Strike_TT               = "当导管打击即将开始时警告你。"
L.Settings_HallsFab_Power_Leech                     = "普通: 枯竭冲击"
L.Settings_HallsFab_Power_Leech_TT                  = "当你被导管打击眩晕而需要挣脱时警告你。"
L.Settings_HallsFab_Venom_Injection                 = "猎人: 毒液注射"
L.Settings_HallsFab_Venom_Injection_TT              = "当你在猎人boss战中被毒液注射折磨时显示一个状态展示。"
L.Settings_HallsFab_Conduit_Spawn                   = "顶尖: 导管刷新"
L.Settings_HallsFab_Conduit_Spawn_TT                = "当在顶尖械构boss战中一个导管即将刷新时警告你。"
L.Settings_HallsFab_Conduit_Drain                   = "顶尖: 导管消耗"
L.Settings_HallsFab_Conduit_Drain_TT                = "当在顶尖械构boss战中一个导管正在消耗你时警告你。"
L.Settings_HallsFab_Scalded_Debuff                  = "顶尖: 烫伤Debuff"
L.Settings_HallsFab_Scalded_Debuff_TT               = "显示一个小状态图标展示它的治疗Debuff大小及消失倒计时。"
L.Settings_HallsFab_Overcharge_Aura                 = "议会: 超载光环"
L.Settings_HallsFab_Overcharge_Aura_TT              = "当回收者开始超载光环时警告你。"
L.Settings_HallsFab_Overpower_Auras                 = "议会: 压倒光环"
L.Settings_HallsFab_Overpower_Auras_TT              = "当坦克需要切换议会boss时警告你。" 
L.Settings_HallsFab_Overpower_Auras_Duration        = "       - 倒计时持续"
L.Settings_HallsFab_Overpower_Auras_Duration_TT     = "倒计时的持续时间，单位为毫秒。"
L.Settings_HallsFab_Overpower_Auras_Dynamic         = "       - 动态倒计时"
L.Settings_HallsFab_Overpower_Auras_Dynamic_TT      = "开启后，当坦克切换boss完成时将尝试停止倒计时。"
L.Settings_HallsFab_Fabricant_Spawn                 = "议会: 被毁械构刷新"
L.Settings_HallsFab_Fabricant_Spawn_TT              = "当被毁械构刷新时警告你。"
L.Settings_HallsFab_Catastrophic_Discharge          = "议会: 灾难性放电"
L.Settings_HallsFab_Catastrophic_Discharge_TT       = "当被毁械开始对你放电时警告你。"
L.Settings_HallsFab_Reclaim_Achieve                 = "议会: 回收废弃完成失败"
L.Settings_HallsFab_Reclaim_Achieve_TT              = "当波兹莫到达回收者时警告你。"
-- Alerts
L.Alerts_HallsFab_Taking_Aim                        = "|cFF6600瞄准|r 目标 你 !"
L.Alerts_HallsFab_Taking_Aim_Other                  = "|cFF6600瞄准|r 目标 |cFF0000<<!aC:1>>|r !"
L.Alerts_HallsFab_Taking_Aim_Simple                 = "|cFF6600瞄准|r"
L.Alerts_HallsFab_Conduit_Spawn                     = "导管即将刷新"
L.Alerts_HallsFab_Conduit_Drain                     = "导管正在消耗你!"
L.Alerts_HallsFab_Conduit_Drain_Other               = "导管正在消耗 |cFF0000<<!aC:1>>|r !"
L.Alerts_HallsFab_Conduit_Strike                    = "|cFF0000导管打击|r !格挡!"
L.Alerts_HallsFab_Draining_Ballista                 = "|cFFC000枯竭冲击|r 目标 你 !格挡或打断!"
L.Alerts_HallsFab_Draining_Ballista_Other           = "|cFFC000枯竭冲击|r 目标 |cFF0000<<!aC:1>>|r !打断!"
L.Alerts_HallsFab_Power_Leech                       = "|c6600FF能量榨取|r !挣脱!"
L.Alerts_HallsFab_Overcharge_Aura                   = "|c3366EE超载光环|r 在回收者。"
L.Alerts_HallsFab_Overpower_Auras                   = "|cFF0000光环倒计时!|r"
L.Alerts_HallsFab_Catastrophic_Discharge            = "|cFF0000灾难性放电|r 目标 你 !格挡!"
L.Alerts_HallsFab_Fabricant_Spawn                   = "|cFFC000被毁械构刷新|r"
L.Alerts_HallsFab_Reclaim_Achieve                   = "|cDCD822[报废计划]|r 成就 |cFF0000失败|r"



--------------------------------
----   Asylum Sanctorium    ----
--------------------------------
L.Settings_Asylum_Header                         = "庇护圣所(AS)"
-- Settings
L.Settings_Asylum_Defiling_Blast                 = "圣洛熙斯: 污染颜料爆炸"
L.Settings_Asylum_Defiling_Blast_TT              = "当你或其他人成为圣洛熙斯的锥形攻击目标时警告你。"
L.Settings_Asylum_Soul_Stained_Corruption        = "圣洛熙斯: 玷污灵魂腐败"
L.Settings_Asylum_Soul_Stained_Corruption_TT     = "当玩家成为圣洛熙斯应被猛击的攻击目标时警告你。"
L.Settings_Asylum_Teleport_Strike                = "圣菲尔姆: 闪现一击"
L.Settings_Asylum_Teleport_Strike_TT             = "当圣菲尔姆即将传送到你旁边时警告你。"
L.Settings_Asylum_Exhaustive_Charges             = "圣奥姆斯: 彻底充能"
L.Settings_Asylum_Exhaustive_Charges_TT          = "当圣奥姆斯即将发动三个大型闪电圈攻击时警告你。"
L.Settings_Asylum_Storm_The_Heavens              = "圣奥姆斯: 风暴天"
L.Settings_Asylum_Storm_The_Heavens_TT           = "当圣奥姆斯即将飞到空中并刷新大量小闪电圈时警告你。"
L.Settings_Asylum_Gusts_Of_Steam                 = "圣奥姆斯: 一阵蒸汽"
L.Settings_Asylum_Gusts_Of_Steam_TT              = "圣奥姆斯即将开始来回跳并标志着进入下一个战斗阶段时警告你。"
L.Settings_Asylum_Gusts_Of_Steam_Slider          = "       - 跳前百分比"
L.Settings_Asylum_Gusts_Of_Steam_Slider_TT       = "在boss跳跃之前更快的显示提醒boss血量的若干百分点。"
L.Settings_Asylum_Protector_Spawn                = "圣奥姆斯: 护卫刷新"
L.Settings_Asylum_Protector_Spawn_TT             = "当球体即将刷新时警告你。"
L.Settings_Asylum_Trial_By_Fire                  = "圣奥姆斯: 火之试炼"
L.Settings_Asylum_Trial_By_Fire_TT               = "在斩杀阶段当圣奥姆斯即将施放火焰时警告你。"
-- Alerts
L.Alerts_Asylum_Defiling_Blast                   = "注意! |c00cc00污染爆炸|r 目标 你 !"
L.Alerts_Asylum_Defiling_Blast_Other             = "注意! |c00cc00污染爆炸|r 目标 |cFF0000<<!aC:1>>|r !"
L.Alerts_Asylum_Soul_Stained_Corruption          = "|c3366EE玷污灵魂腐败|r !打断!"
L.Alerts_Asylum_Teleport_Strike                  = "|cFF3366闪现一击|r 目标 你 !"
L.Alerts_Asylum_Teleport_Strike_Other            = "|cFF3366闪现一击|r 目标 |cFF0000<<!aC:1>>|r !"
L.Alerts_Asylum_Exhaustive_Charges               = "|cFF0000彻底充能|r"
L.Alerts_Asylum_Storm_The_Heavens                = "|cFF0000风暴天|r !放风筝!"
L.Alerts_Asylum_Gusts_Of_Steam                   = "|cFF9900一阵蒸汽|r !躲藏!"
L.Alerts_Asylum_Pre_Gusts_Of_Steam               = "|cFF0000<<1>>%|r 开始 |cFF9900跳跃|r !准备躲藏!"
L.Alerts_Asylum_Trial_By_Fire                    = "|cFF5500火焰|r!"
L.Alerts_Asylum_Protector_Spawn                  = "|c0000FF护卫|r 刷新!"
L.Alerts_Asylum_Protector_Active                 = "|c0000FF护卫|r 激活!"



--------------------------------
------   CLOUDREST         -----
--------------------------------
L.Settings_Cloudrest_Header			            = "云息城(CR)"
-- Settings
L.Settings_Cloudrest_Olorime_Spears             = "普通: 奥罗里姆之矛"
L.Settings_Cloudrest_Olorime_Spears_TT          = "当矛已就绪需要有人捡起它时警告你。"
L.Settings_Cloudrest_Shadow_Realm_Cast          = "普通: 传送门刷新"
L.Settings_Cloudrest_Shadow_Realm_Cast_TT       = "当传送门刷新完成，队伍可以进入暗影领域时警告你。"
L.Settings_Cloudrest_Hoarfrost                  = "法拉瑞尔: 白霜"
L.Settings_Cloudrest_Hoarfrost_TT               = "当你获得了白霜debuff需要实用协同移除时警告你。"
L.Settings_Cloudrest_Hoarfrost_Countdown        = "       - 使用倒计时"
L.Settings_Cloudrest_Hoarfrost_Countdown_TT     = "使用倒计时来显示你何时可以丢掉它。"
L.Settings_Cloudrest_Hoarfrost_Shed             = "法拉瑞尔: 白霜掉落"
L.Settings_Cloudrest_Hoarfrost_Shed_TT          = "当白霜debuff被其他玩家丢掉，需要被捡起时警告你。"
L.Settings_Cloudrest_Heavy_Attack               = "小Boss: 重击"
L.Settings_Cloudrest_Heavy_Attack_TT            = "当闪电(震撼粉碎), 火焰(滚烫切割) 或 寒冰(破坏吹击) 小boss正在施放重击时警告你。"
L.Settings_Cloudrest_Chilling_Comet             = "法拉瑞尔: 寒冷彗星"
L.Settings_Cloudrest_Chilling_Comet_TT          = "当你获得了寒冷彗星debuff并需要格挡，且遭爆炸前不能与其他拥有相同debuff的玩家重叠的时候警告你。"
L.Settings_Cloudrest_Roaring_Flare              = "西罗瑞亚: 咆哮闪耀"
L.Settings_Cloudrest_Roaring_Flare_TT           = "当你或任何队员获得了咆哮闪耀debuff，且需要最少3个以上队员重叠以抵消此debuff时警告你。"
L.Settings_Cloudrest_Track_Roaring_Flare        = "       - 追踪咆哮闪耀"
L.Settings_Cloudrest_Track_Roaring_Flare_TT     = "显示获得debuff的玩家方向"
L.Settings_Cloudrest_Voltaic_Overload           = "贝兰纳瑞尔: 电伏超载"
L.Settings_Cloudrest_Voltaic_Overload_TT        = "警告你即将获得电伏超载debuff，获得此debuff后你在10秒内无法切换技能条。"
L.Settings_Cloudrest_Nocturnals_Favor	        = "斯马加: 诺克图娜尔的馈赠"
L.Settings_Cloudrest_Nocturnals_Favor_TT        = "当斯马加将你作为重击的目标时警告你。"
L.Settings_Cloudrest_Baneful_Barb               = "亚格拉怪物: 剧毒倒刺"
L.Settings_Cloudrest_Baneful_Barb_TT            = "当亚格拉怪物将你作为剧毒倒刺攻击的目标时警告你。"
L.Settings_Cloudrest_Break_Amulet               = "斯马加: 在斩杀阶段只显示重要机制"
L.Settings_Cloudrest_Break_Amulet_TT            = "在斩杀阶段禁用球体, 触手提醒"
L.Settings_Cloudrest_Sum_Shadow_Beads           = "斯马加: 球体"
L.Settings_Cloudrest_Sum_Shadow_Beads_TT        = "当球体即将刷新时警告你。"
L.Settings_Cloudrest_Tentacle_Spawn             = "斯马加: 潜伏者刷新"
L.Settings_Cloudrest_Tentacle_Spawn_TT          = "当诺克图娜尔潜伏者即将刷新时警告你。"
L.Settings_Cloudrest_Crushing_Darkness          = "斯马加: 粉碎黑暗"
L.Settings_Cloudrest_Crushing_Darkness_TT       = "当范围AoE正在跟随你并需要对它放风筝时警告你。"
L.Settings_Cloudrest_Malicious_Strike           = "斯马加: 恶毒打击"
L.Settings_Cloudrest_Malicious_Strike_TT        = "当球体被摧毁且需要格挡或翻滚时警告你。"

-- Alerts
L.Alerts_Cloudrest_Olorime_Spears               = "|cffd000矛|r 就绪了! (<<1>>)"
L.Alerts_Cloudrest_Hoarfrost0                   = "|c00ddff白霜|r 目标 你 !"
L.Alerts_Cloudrest_Hoarfrost1                   = "|cff0000最后的|r |c00ddff白霜|r 目标 你 !"
L.Alerts_Cloudrest_Hoarfrost_Other0             = "|c00ddff白霜|r 目标 |cff0000<<!aC:1>>|r !"
L.Alerts_Cloudrest_Hoarfrost_Other1             = "|cff0000最后的|r |c00ddff白霜|r 目标 |cff0000<<!aC:1>>|r !"
L.Alerts_Cloudrest_Hoarfrost_Countdown0         = "丢掉 |c00ddff白霜|r 还有..."
L.Alerts_Cloudrest_Hoarfrost_Countdown1         = "丢掉 |cff0000最后的|r |c00ddff白霜|r 还有..."
L.Alerts_Cloudrest_Hoarfrost_Syn                = "|cff0000使用协同|r 丢掉白霜!"
L.Alerts_Cloudrest_Hoarfrost_Shed               = "|c00ddff白霜|r 丢掉了!"
L.Alerts_Cloudrest_Hoarfrost_Shed_Other         = "|c00ddff白霜|r 被 |cff0000<<!aC:1>>|r 丢掉了!"
L.Alerts_Cloudrest_Heavy_Attack                 = "|c0bf29e重击|r 目标 你 !"
L.Alerts_Cloudrest_Heavy_Attack_Other           = "|c0bf29e重击|r 目标 |cff0000<<!aC:1>>|r !"
L.Alerts_Cloudrest_Baneful_Barb                 = "|cff0000剧毒倒刺|r !翻滚!"
L.Alerts_Cloudrest_Baneful_Barb_Other           = "|cff0000剧毒倒刺|r 目标 |cff0000<<!aC:1>>|r !"
L.Alerts_Cloudrest_Chilling_Comet               = "|cff0000寒冷彗星|r 目标 你 !格挡!"
L.Alerts_Cloudrest_Roaring_Flare                = "|cff7700咆哮闪耀|r 目标 你 !"
L.Alerts_Cloudrest_Roaring_Flare_2              = "|cff0000<<!aC:1>>|r |t100%:100%:Esoui/Art/Buttons/large_leftarrow_up.dds|t |cff7700咆哮闪耀|r |t100%:100%:Esoui/Art/Buttons/large_rightarrow_up.dds|t |cff0000<<!aC:2>>|r"
L.Alerts_Cloudrest_Roaring_Flare_Other          = "|cff7700咆哮闪耀|r 目标 |cff0000<<!aC:1>>|r !集中起来!"
L.Alerts_Cloudrest_Voltaic_Current              = "|c55b4d4电伏超载|r 目标 你 !还有"
L.Alerts_Cloudrest_Voltaic_Overload             = "|c4d61c1电伏超载|r 目标 你 !切技能条!"
L.Alerts_Cloudrest_Voltaic_Overload_Cd          = "|c4d61c1电伏超载|r 不要切换!"
L.Alerts_Cloudrest_Shadow_Realm_Cast            = "|cab82ff传送门|r 刷新 (<<1>>)"
L.Alerts_Cloudrest_Tentacle_Spawn               = "|c00a86b潜伏者|r 刷新"
L.Alerts_Cloudrest_Sum_Shadow_Beads             = "|cab82ff球体|r 即将刷新"
L.Alerts_Cloudrest_Nocturnals_Favor             = "|cff0000诺克图娜尔的馈赠|r 目标 你 !"
L.Alerts_Cloudrest_Crushing_Darkness            = "|cfc0c66粉碎黑暗|r 目标 你 !放风筝!"
L.Alerts_Cloudrest_Malicious_Strike             = "|cff0000恶毒打击|r 目标 你 !格挡!"

--------------------------------
------   SUNSPIRE          -----
--------------------------------
L.Settings_Sunspire_Header			= "阳尖城(SS)"
-- Settings
L.Settings_Sunspire_Chilling_Comet        = "普通: 寒冷彗星"
L.Settings_Sunspire_Chilling_Comet_TT     = "当你成为寒冷彗星的目标时警告你。离开队友人群, 格挡并且注意不要和其他被寒冷彗星标记的玩家重叠。寒冷彗星一次标记两名玩家。"
L.Settings_Sunspire_Sweeping_Breath	      = "纳文塔斯: 横扫吐息"
L.Settings_Sunspire_Sweeping_Breath_TT    = "警告你纳文塔斯的火焰吐息。吐息从竞技场的一边开始横扫到另一边，并对所有在其中的玩家造成伤害。所有玩家都必须格挡或翻滚来躲避此攻击"
L.Settings_Sunspire_Molten_Meteor         = "纳文塔斯: 熔火流星"
L.Settings_Sunspire_Molten_Meteor_TT      = "当你成为熔火流星的目标时警告你。移动到竞技场的边缘, 格挡, 格挡并且注意不要和其他被熔火流星标记的玩家重叠。熔火流星一次标记三名玩家。"
L.Settings_Sunspire_Focus_Fire            = "尤尔纳克林: 聚焦火焰"
L.Settings_Sunspire_Focus_Fire_TT         = "当你成为聚焦火焰的目标时警告你。聚焦火焰需要队伍成员聚集在一起来分担伤害。之后会有一个持续debuff, 增加你受到的下一次聚焦火焰的伤害。由于此debuff, 你下一次应该聚集在不同的人群里。"
L.Settings_Sunspire_Breath                = "普通: 火焰/寒冰/灼热吐息"
L.Settings_Sunspire_Breath_TT             = "当boss的引导锥形对准你时警告你, 这会造成大量伤害。"
L.Settings_Sunspire_Cataclism             = "尤尔纳克林: 灾难"
L.Settings_Sunspire_Cataclism_TT          = "当boss即将在竞技场中间吐息火焰时警告你。所有人必须移动到边缘, 并且清小怪。"
L.Settings_Sunspire_Frozen_Tomb           = "洛克斯提兹: 冰冻坟墓"
L.Settings_Sunspire_Frozen_Tomb_TT        = "冰冻坟墓刷新时警告你。一名玩家必须走进坟墓, 这将冻结他们并造成持续伤害。然后你必须被治愈才能被释放。因为debuff，需要3名玩家进入坟墓，且每次是不同的人。"
L.Settings_Sunspire_Thrash                = "纳文塔斯: 鞭打"
L.Settings_Sunspire_Thrash_TT             = "当boss即将朝队伍甩动它的头时警告你, 这会将所有人击退。必须格挡或翻滚来躲避。"
L.Settings_Sunspire_Mark_For_Death        = "纳文塔斯: 死亡标记"
L.Settings_Sunspire_Mark_For_Death_TT     = "当你被死亡标记时警告你。造成大量持续伤害, 并完全移除你的所有抗性。"
L.Settings_Sunspire_Time_Breach           = "纳文塔斯: 时间裂隙"
L.Settings_Sunspire_Time_Breach_TT        = "当时间迁移传送门打开时警告你。"
L.Settings_Sunspire_Negate_Field          = "永恒的仆人: 无效领域"
L.Settings_Sunspire_Negate_Field_TT       = "在时间迁移中如果你成为无效领域的目标时获得一个警告。"
L.Settings_Sunspire_Shock_Bolt            = "永恒的仆人: 闪电箭"
L.Settings_Sunspire_Shock_Bolt_TT         = "闪电箭倒计时，通知队伍何时聚拢以解放另一个玩家。"
L.Settings_Sunspire_Apocalypse            = "永恒的仆人: 转化启示录"
L.Settings_Sunspire_Apocalypse_TT         = "当永恒的仆人正在引导他的攻击到楼上的组员时警告你。给你一个倒计时显示何时你可以猛击引导并且用一个倒计时显示他何时完成引导攻击。"


-- Alerts
L.Alerts_Sunspire_Chilling_Comet          = "|c00ddff寒冷彗星|r 目标 你 !格挡!"
L.Alerts_Sunspire_Chilling_Comet_Other    = "|c00ddff寒冷彗星|r 目标 |cff0000<<!aC:1>>|r !"
L.Alerts_Sunspire_Sweeping_Breath         = "|cff0000横扫吐息|r !格挡!"
L.Alerts_Sunspire_Molten_Meteor           = "|c00ddff熔火流星|r 目标 你 !出去!"
L.Alerts_Sunspire_Molten_Meteor_Other     = "|c00ddff熔火流星|r 目标 |cff0000<<!aC:1>>|r !"
L.Alerts_Sunspire_Focus_Fire              = "|cff7700聚焦火焰|r 目标 你 !还有"
L.Alerts_Sunspire_Focus_Fire_Other        = "|cff7700聚焦火焰|r 目标 |cff0000<<!aC:1>>|r !还有"
L.Alerts_Sunspire_Atronach_Zap            = "|cff7700侍灵|r 刷新 还有"
L.Alerts_Sunspire_Frost_Atronach          = "|cff7700寒冰侍灵|r 就绪!"
L.Alerts_Sunspire_Breath                  = "|cffff00<<1>>|r 目标 你 !"
L.Alerts_Sunspire_Breath_Other            = "|cffff00<<1>>|r 目标 |cff0000<<!aC:1>>|r !"
L.Alerts_Sunspire_Cataclism               = "|cff3300灾难|r 结束 还有"
L.Alerts_Sunspire_Frozen_Tomb             = "|c00ddff冰冻坟墓|r (<<1>>)"
L.Alerts_Sunspire_Thrash                  = "|cff0000鞭打|r !格挡!"
L.Alerts_Sunspire_Mark_For_Death          = "死亡标记 目标 你 !"
L.Alerts_Sunspire_Mark_For_Death_Other    = "死亡标记 目标 |cff0000<<!aC:1>>|r !"
L.Alerts_Sunspire_Time_Breach_Countdown   = "|c81cc00时间裂隙|r 还有 "
L.Alerts_Sunspire_Negate_Field            = "|c53c4c9无效领域|r 目标 你 !"
L.Alerts_Sunspire_Negate_Field_Others     = "|c53c4c9无效领域|r 目标 |cff0000<<!aC:1>>|r !"
L.Alerts_Sunspire_Shock_Bolt              = "|c00ddff闪电箭|r !聚在一起以解放"
L.Alerts_Sunspire_Apocalypse              = "|cffff00转化启示录|r 猛击 还有"
L.Alerts_Sunspire_Apocalypse_Ends         = "|cffff00转化启示录|r 结束 还有"


--------------------------------
------   KYNE'S AEGIS      -----
--------------------------------
L.Settings_KynesAegis_Header                        = "凯娜的庇护"
-- Settings
L.Settings_KynesAegis_Crashing_Wall                 = "一般: 碾压之墙"
L.Settings_KynesAegis_Crashing_Wall_TT              = "当半巨人破潮者开始施放碾压之墙攻击时提醒你, 倒计时直到施放完成。格挡或翻滚躲避。"
L.Settings_KynesAegis_Sanguine_Prison               = "一般: 血红监狱"
L.Settings_KynesAegis_Sanguine_Prison_TT            = "当你的盟友被苦难骑士创造的血红监狱困住时提醒你。你需要通过聚焦他的监狱来解救你的盟友。"
L.Settings_KynesAegis_Blood_Fountain                = "一般: 血之泉"
L.Settings_KynesAegis_Blood_Fountain_TT             = "当鲜血骑士开始他的血之泉攻击时提醒你, 倒计时直到施放完成。这是一种十字型AoE, 需要避免，因为它会造成严重伤害。"
L.Settings_KynesAegis_Totem                         = "彦迪尔: 图腾刷新"
L.Settings_KynesAegis_Totem_TT                      = "当与屠夫BOSS彦迪尔战斗中特定图腾出现时提醒你。\n\n龙图腾: 总是同时出现两个; 每个都沿着两个相反方向的直线喷射火焰。\n鹰身女妖图腾: 刷新一个闪电光环并辐射开来。\n石像鬼图腾: 把随机玩家装进石头里。\n查鲁斯图腾: 使若干人中毒, 这种毒不应传播给其他人, 这就是为什么你不应该在这个阶段聚集在一起。"
L.Settings_KynesAegis_Yandir_FireShaman_Meteor      = "彦迪尔HM: 流星"
L.Settings_KynesAegis_Yandir_FireShaman_Meteor_TT   = "当屠夫之火萨满即将对玩家施放流星时提醒你。"
L.Settings_KynesAegis_Vrol_FireMage_Meteor          = "弗罗尔: 流星"
L.Settings_KynesAegis_Vrol_FireMage_Meteor_TT       = "当弗罗尔誓约火焰法师从船上向玩家施放流星时提醒你。"
L.Settings_KynesAegis_Ichor_Eruption                = "法尔格雷夫: 腐液喷发"
L.Settings_KynesAegis_Ichor_Eruption_TT             = "法尔格雷文释放他的腐液喷发前显示倒计时。"
L.Settings_KynesAegis_Ichor_Eruption_CD_Time        = "       - 倒计时时间"
L.Settings_KynesAegis_Ichor_Eruption_CD_Time_TT     = "腐液喷发开始前多久跳出倒计时。"

-- Alerts
L.Alerts_KynesAegis_Crashing_Wall                   = "|cd2a100碾压之墙|r来了"
L.Alerts_KynesAegis_Sanguine_Prison_Other           = "|cff0000<<!aC:1>>|r被|cb00000血红监狱|r困住了。解救他们!"
L.Alerts_KynesAegis_Blood_Fountain                  = "|cb00000血之泉|r来了"
L.Alerts_KynesAegis_Dragon_Totem                    = "两个|cffa500龙图腾|r刷新了。躲避火焰!"
L.Alerts_KynesAegis_Harpy_Totem                     = "|c00bfff鹰身女妖图腾|r刷新了。"
L.Alerts_KynesAegis_Gargoyle_Totem                  = "|cf5f5dc石像鬼图腾|r刷新了。"
L.Alerts_KynesAegis_Chaurus_Totem                   = "|c39942e查鲁斯图腾|r刷新了。不要聚集!"
L.Alerts_KynesAegis_FireMage_Meteor                 = "|cffa500流星|r对你来了"
L.Alerts_KynesAegis_FireMage_Meteor_Other           = "流星来了"
L.Alerts_KynesAegis_Ichor_Eruption                  = "|cb00000腐液喷发|r来了"


--------------------------------
------   ROCKGROVE         -----
--------------------------------
L.Settings_Rockgrove_Header                        = "石林"
-- Settings
L.Settings_Rockgrove_Sundering_Strike              = "一般: 崩裂打击"
L.Settings_Rockgrove_Sundering_Strike_TT           = "当苏尔-仙收割者使用崩裂打击时提醒你。翻滚躲避它。"
L.Settings_Rockgrove_Astral_Shield                 = "一般: 星际盾牌"
L.Settings_Rockgrove_Astral_Shield_TT              = "当苏尔-仙震魂者施放星际盾牌时提醒你。"
L.Settings_Rockgrove_Soul_Remnant                  = "一般: 灵魂残迹 (震魂者)"
L.Settings_Rockgrove_Soul_Remnant_TT               = "当灵魂残迹以你作为目标时提醒你 (作为打破震魂者的星际盾牌的结果)."
L.Settings_Rockgrove_Prime_Meteor                  = "一般: 主流星"
L.Settings_Rockgrove_Prime_Meteor_TT               = "当流星出现时，会显示倒计时，指示爆炸发生前的剩余时间。确保及时杀死流星。"
L.Settings_Rockgrove_Hasted_Assault                = "一般: 加速突袭"
L.Settings_Rockgrove_Hasted_Assault_TT             = "当破坏者野蛮人施放加速突袭时提醒你。他以随机顺序从一个玩家传送到另一个玩家，并攻击他们。应该格挡此攻击。"
L.Settings_Rockgrove_Savage_Blitz                  = "奥克希托: 野蛮闪电"
L.Settings_Rockgrove_Savage_Blitz_TT               = "当奥克希托向最远的玩家冲锋时提醒你。"
L.Settings_Rockgrove_Noxious_Sludge                = "奥克希托: 剧毒污泥"
L.Settings_Rockgrove_Noxious_Sludge_TT             = "当有人因被奥克希托下毒而需要去池子清洗时提醒你。"
L.Settings_Rockgrove_Cinder_Cleave                 = "奥克希托的小boss: 灰烬猛劈"
L.Settings_Rockgrove_Cinder_Cleave_TT              = "在与奥克希托战斗时，当破坏者歼灭者对某人施放他的灰烬猛劈技能时提醒你。"
L.Settings_Rockgrove_Embrace_Of_Death              = "焰兆巴塞: 死亡拥抱"
L.Settings_Rockgrove_Embrace_Of_Death_TT           = "当有人被焰兆巴塞诅咒时通知你。这个人会在8秒后爆炸，并传播诅咒。让被诅咒的玩家远离团队很重要。"
L.Settings_Rockgrove_Embrace_Of_Death_TT_All       = "|cFF0000警告!|r如果你的团队获得了太多的诅咒，你的屏幕有可能会被这些诅咒的倒计时全部覆盖住! 我们正在努力改进这一通知问题。"

-- Alerts
L.Alerts_Rockgrove_Sundering_Strike                = "|cCDCDCD崩裂打击|r即将攻击你!"
L.Alerts_Rockgrove_Sundering_Strike_Other          = "|cCDCDCD崩裂打击|r即将攻击|cFF0000<<!aC:1>>|r!"
L.Alerts_Rockgrove_Astral_Shield_Cast              = "|cFFFF8F星际盾牌|r已被释放。准备翻滚或格挡!"
L.Alerts_Rockgrove_Soul_Remnant                    = "|c8FF2FF灵魂残迹|r来袭!"
L.Alerts_Rockgrove_Prime_Meteor                    = "|cFFD600主流星|r爆炸还剩"
L.Alerts_Rockgrove_Hasted_Assault                  = "|cFF0000加速突袭|r来袭! 格挡!"
L.Alerts_Rockgrove_Savage_Blitz                    = "奥克希托向|cFF0000<<!aC:1>>|r冲锋!"
L.Alerts_Rockgrove_Noxious_Sludge_Self             = "你中了|c008C22剧毒污泥|r的毒! 在池子里清洗掉!"
L.Alerts_Rockgrove_Noxious_Sludge_Other1           = "|cFF0000<<!aC:1>>|r中了|c008C22剧毒污泥|r的毒。"
L.Alerts_Rockgrove_Noxious_Sludge_Other2           = "|cFF0000<<!aC:1>>|r和|cFF0000<<!aC:2>>|r中了|c008C22剧毒污泥|r的毒。"
L.Alerts_Rockgrove_Cinder_Cleave                   = "|cD74700灰烬猛劈|r即将攻击你!"
L.Alerts_Rockgrove_Cinder_Cleave_Other             = "|cD74700灰烬猛劈|r即将攻击|cFF0000<<!aC:1>>|r。"
L.Alerts_Rockgrove_Embrace_Of_Death                = "你被|c0A929B死亡拥抱|r诅咒了!远离人群!爆炸剩余"
L.Alerts_Rockgrove_Embrace_Of_Death_Other          = "|cFF0000<<!aC:1>>|r被|c0A929B死亡拥抱|r诅咒了!爆炸剩余"


--------------------------------
------   DREADSAIL REEF    -----
--------------------------------
L.Settings_DreadsailReef_Header                    = "惧帆暗礁"
-- Settings
L.Settings_DreadsailReef_Dome_Activation           = "莱兰纳&图拉希尔：火/冰 穹顶激活"
L.Settings_DreadsailReef_Dome_Activation_TT        = "当有人受到火或冰穹顶时提醒你。"
L.Settings_DreadsailReef_Imminent_Debuffs          = "莱兰纳&图拉希尔：临头 水泡/寒冷"
L.Settings_DreadsailReef_Imminent_Debuffs_TT       = "当坦克受到莱兰纳的临头水泡debuff或图拉希尔的临头寒冷debuff时提醒你。坦克应该在10秒内切换。"
L.Settings_DreadsailReef_Brothers_Heavy_Attack     = "莱兰纳&图拉希尔：重击"
L.Settings_DreadsailReef_Brothers_Heavy_Attack_TT  = "当莱兰纳或图拉希尔发起他们的重击（酷热之砍/刺剪）时提醒你。"
L.Settings_DreadsailReef_ReefGuardian_ReefHeart    = "守礁者：礁心刷新"
L.Settings_DreadsailReef_ReefGuardian_ReefHeart_TT = "礁心出现时提醒你。你有60秒时间杀死它，否则将团灭。可能有多个礁心同时被激活。"
L.Settings_DreadsailReef_ReefHeart_Result          = "守礁者：礁心成功/失败"
L.Settings_DreadsailReef_ReefHeart_Result_TT       = "当你处理完礁心或未处理完时提醒你。"
L.Settings_DreadsailReef_Rapid_Deluge              = "塔蕾瑞亚：迅速泛滥"
L.Settings_DreadsailReef_Rapid_Deluge_TT           = "当你获取他人受到迅速泛滥debuff时提醒你。受到6秒后会爆炸，处理该伤害的最佳方式是在该时间点游泳。"

-- Alerts
L.Alerts_DreadsailReef_Destructive_Ember           = "<<!aC:1>> 激活了 |cFFA500火穹顶|r!"
L.Alerts_DreadsailReef_Piercing_Hailstone          = "<<!aC:1>> 激活了 |c20C3D0冰穹顶|r!"
L.Alerts_DreadsailReef_Imminent_Blister            = "你受到了 |cF27D0C临头水泡|r! 切换坦克直到"
L.Alerts_DreadsailReef_Imminent_Blister_Other      = "|cFF0000<<!aC:1>>|r 受到了 |cF27D0C临头水泡|r! 切换坦克直到"
L.Alerts_DreadsailReef_Imminent_Chill              = "你受到了 |cF27D0C临头寒冷|r! 切换坦克直到"
L.Alerts_DreadsailReef_Imminent_Chill_Other        = "|cFF0000<<!aC:1>>|r 受到了 |cF27D0C临头寒冷|r! 切换坦克直到"
L.Alerts_DreadsailReef_Broiling_Hew                = "|cCDCDCD酷热之砍|r 对你来袭!"
L.Alerts_DreadsailReef_Broiling_Hew_Other          = "|cCDCDCD酷热之砍|r 对 |cFF0000<<!aC:1>>|r 来袭!"
L.Alerts_DreadsailReef_Stinging_Shear              = "|cCDCDCD刺剪|r 对你来袭!"
L.Alerts_DreadsailReef_Stinging_Shear_Other        = "|cCDCDCD刺剪|r 对 |cFF0000<<!aC:1>>|r 来袭!"
L.Alerts_DreadsailReef_ReefGuardian_ReefHeart      = "礁心 #|cFF0000<<1>>|r 刷新了!"
L.Alerts_DreadsailReef_ReefHeart_Success           = "礁心 #|cFF0000<<1>>|r |c7CFC00摧毁了|r!"
L.Alerts_DreadsailReef_ReefHeart_Success_Unknown   = "礁心 |c7CFC00摧毁了|r!"
L.Alerts_DreadsailReef_ReefHeart_Failure           = "礁心 #|cFF0000<<1>>|r |cFF0000增强了|r. 你完蛋了!"
L.Alerts_DreadsailReef_ReefHeart_Failure_Unknown   = "礁心 |cFF0000增强了|r. 你完蛋了!"
L.Alerts_DreadsailReef_Rapid_Deluge                = "你受到了 |c1CA3EC迅速泛滥|r! 你需要游泳，剩余"
L.Alerts_DreadsailReef_Rapid_Deluge_Other          = "|cFF0000<<!aC:1>>|r 受到了 |c1CA3EC迅速泛滥|r! 需要游泳，剩余"


--------------------------------
----       Debugging        ----
--------------------------------
L.Settings_Debug_Header                  = "调试"
L.Settings_Debug                         = "打开调试"
L.Settings_Debug_TT                      = "在聊天窗口中打开调试输出"
L.Settings_Debug_DevMode                 = "开发模式"
L.Settings_Debug_DevMode_TT              = "当开启时，将开启某些可能没有完整功能化的警告, 包括某些计时不匹配或未完全测试的警告。在通常情况下它们应该不会引起UI报错，但仍然推荐使用某些'错误捕捉'插件。"
L.Settings_Debug_DevMode_Warning         = "需要开发模式"

L.Settings_Debug_Tracker_Header          = "调试跟踪"
L.Settings_Debug_Tracker_Description     = "这是一个调试功能，通过打印出战斗事件和效果的信息，在试炼过程中跟踪和输出潜在机制。"
L.Settings_Debug_Tracker_Enabled         = "开启"
L.Settings_Debug_Tracker_SpamControl     = "滚屏控制"
L.Settings_Debug_Tracker_SpamControl_TT  = "开启时，技能和效果的每个动作类型只打印一次。此会话的已知技能列表可以使用“/rndebug clear”命令清除。"
L.Settings_Debug_Tracker_MyEnemyOnly     = "只对敌人"
L.Settings_Debug_Tracker_MyEnemyOnly_TT  = "当开启时，此功能将会对所有技能和效果的调试输出做出限制，只有目标为玩家且不是由玩家或队伍造成的部分才予以显示。当你在寻找某些特殊的信息但不想开启滚屏控制时非常有用。"



--TODO: get rid of this ugly, bulky localization method
for k, v in pairs(L) do
    local string = "RAIDNOTIFIER_" .. string.upper(k)
    ZO_CreateStringId(string, v)
end

function RaidNotifier:GetLocale()
	return L
end
function RaidNotifier:MissingLocale()
	d("显然没有丢失任何英文字符串....")
end

if (GetCVar('language.2') == 'zh') then
        local MissingL = {}
        for k, v in pairs(RaidNotifier:GetLocale()) do
                if (not L[k]) then
                        table.insert(MissingL, k)
                        L[k] = v
                end
        end
        function RaidNotifier:GetLocale()
                return L
        end
        -- for debugging
        function RaidNotifier:MissingLocale()
                df("Missing strings for '%s'", GetCVar('language.2'))
                d(MissingL)
        end
end
