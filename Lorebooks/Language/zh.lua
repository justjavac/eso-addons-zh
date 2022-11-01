

SafeAddString(LBOOKS_QUEST_BOOK, "通过任务可获得的书", 1)
SafeAddString(LBOOKS_MAYBE_NOT_HERE, "[书有可能不在这里]", 1)
SafeAddString(LBOOKS_QUEST_IN_ZONE, "在 <<1>> 中的任务", 1)

-- Thank You for datamining

SafeAddString(LBOOKS_THANK_YOU1, "谢谢", 1)
SafeAddString(LBOOKS_THANK_YOU_LONG1, "你是第一个找到这本丢失的书的人", 1)

SafeAddString(LBOOKS_THANK_YOU10, "继续努力!", 1)
SafeAddString(LBOOKS_THANK_YOU_LONG10, "我们会把那些旧书全都翻录下来", 1)

SafeAddString(LBOOKS_THANK_YOU20, "图书管理员", 1)
SafeAddString(LBOOKS_THANK_YOU_LONG20, "顺便问一下，你读过那些书吗?你应该读读的。", 1)

SafeAddString(LBOOKS_THANK_YOU30, "上古卷轴管理员", 1)
SafeAddString(LBOOKS_THANK_YOU_LONG30, "这对你来说是个不错的名号", 1)


--tooltips
SafeAddString(LBOOKS_KNOWN, "已收集", 1)

SafeAddString(LBOOKS_MOREINFO1, "城镇", 1)
SafeAddString(LBOOKS_MOREINFO2, "洞穴", 1)
SafeAddString(LBOOKS_MOREINFO3, "公共副本", 1)
SafeAddString(LBOOKS_MOREINFO4, "地下", 1)
SafeAddString(LBOOKS_MOREINFO5, "组队情况", 1)

SafeAddString(LBOOKS_SET_WAYPOINT, GetString(SI_WORLD_MAP_ACTION_SET_PLAYER_WAYPOINT) .. " : |cFFFFFF<<1>>|r", 1)

--settings menu header
SafeAddString(LBOOKS_TITLE, "LoreBooks", 1)

--appearance
SafeAddString(LBOOKS_PIN_TEXTURE, "选择地图标记图标", 1)
SafeAddString(LBOOKS_PIN_TEXTURE_EIDETIC, "选择地图标记图标 (<<1>>)", 1)
SafeAddString(LBOOKS_PIN_TEXTURE_DESC, "选择地图标记图标", 1)
SafeAddString(LBOOKS_PIN_GRAYSCALE, " - 使用灰鳞", 1)
SafeAddString(LBOOKS_PIN_GRAYSCALE_DESC, "对已收集的典籍使用灰鳞（只对'真实图标'起效）", 1)
SafeAddString(LBOOKS_PIN_GRAYSCALE_EIDETIC_DESC, "对未收集的永恒记忆书本使用灰鳞（只对'真实图标'起效）", 1)
SafeAddString(LBOOKS_PIN_SIZE, "标记尺寸", 1)
SafeAddString(LBOOKS_PIN_SIZE_DESC, "设置地图标记的尺寸", 1)
SafeAddString(LBOOKS_PIN_LAYER, "标志图层", 1)
SafeAddString(LBOOKS_PIN_LAYER_DESC, "设置地图标志的图层", 1)
   
SafeAddString(LBOOKS_PIN_TEXTURE1, "真实图标", 1)
SafeAddString(LBOOKS_PIN_TEXTURE2, "书籍图标设置 1", 1)
SafeAddString(LBOOKS_PIN_TEXTURE3, "书籍图标设置 2", 1)
SafeAddString(LBOOKS_PIN_TEXTURE4, "Esohead的图标 (Rushmik)", 1)

--compass
SafeAddString(LBOOKS_COMPASS_UNKNOWN, "在罗盘上显示典籍", 1)
SafeAddString(LBOOKS_COMPASS_UNKNOWN_DESC, "在罗盘上 显示/隐藏 未知典籍的图标", 1)
SafeAddString(LBOOKS_COMPASS_DIST, "最大标记距离", 1)
SafeAddString(LBOOKS_COMPASS_DIST_DESC, "标记在罗盘上出现的最大距离", 1)

--filters
SafeAddString(LBOOKS_UNKNOWN, "显示未知典籍", 1)
SafeAddString(LBOOKS_UNKNOWN_DESC, "在地图上 显示/隐藏 未知典籍的图标", 1)
SafeAddString(LBOOKS_COLLECTED, "显示已收集典籍", 1)
SafeAddString(LBOOKS_COLLECTED_DESC, "在地图上 显示/隐藏 已收集典籍的图标", 1)

SafeAddString(LBOOKS_SHARE_DATA, "与 LoreBooks 作者分享你的发现", 1)
SafeAddString(LBOOKS_SHARE_DATA_DESC, "开启此选项将通过自动发送一个收集数据的游戏内邮件来与 LoreBooks 作者分享你的发现。\n此选项只对欧服玩家生效, 但收集到的数据会被分享给美服玩家\n请注意，当邮件发送时，您的技能可能会遇到一个小延迟。 每阅读30本书，邮件就自动发送一次。", 1)

SafeAddString(LBOOKS_EIDETIC, "显示未知永恒记忆", 1)
SafeAddString(LBOOKS_EIDETIC_DESC, "在地图上 显示/隐藏 未知永恒记忆卷轴。 这些卷轴是一些不计入法师公会进度的相关知识卷轴, 只提供一些与塔姆瑞尔世界观相关的信息", 1)
SafeAddString(LBOOKS_EIDETIC_COLLECTED, "显示已知永恒记忆", 1)
SafeAddString(LBOOKS_EIDETIC_COLLECTED_DESC, "在地图上 显示/隐藏 已知永恒记忆卷轴。 这些卷轴是一些不计入法师公会进度的相关知识卷轴, 只提供一些与塔姆瑞尔世界观相关的信息", 1)

SafeAddString(LBOOKS_COMPASS_EIDETIC, "在罗盘上显示未知永恒记忆", 1)
SafeAddString(LBOOKS_COMPASS_EIDETIC_DESC, "在罗盘上 显示/隐藏 未知永恒记忆卷轴。 这些卷轴是一些不计入法师公会进度的相关知识卷轴, 只提供一些与塔姆瑞尔世界观相关的信息", 1)

SafeAddString(LBOOKS_UNLOCK_EIDETIC, "解锁永恒图书馆", 1)
SafeAddString(LBOOKS_UNLOCK_EIDETIC_DESC, "即使你还没有完成法师公会的任务线，此选项依然能为您解锁永恒图书馆。此选项只对 英语/法语/德语 用户生效。", 1)

--worldmap filters
SafeAddString(LBOOKS_FILTER_UNKNOWN, "未知典籍", 1)
SafeAddString(LBOOKS_FILTER_COLLECTED, "已收集典籍", 1)
SafeAddString(LBOOKS_FILTER_EICOLLECTED, "<<1>> (已收集)", 1)

SafeAddString(LBOOKS_SEARCH_LABEL, "在典籍图书馆中搜索:", 1)
SafeAddString(LBOOKS_SEARCH_PLACEHOLDER, "典籍名字", 1)

SafeAddString(LBOOKS_RANDOM_POSITION, "[书架]", 1)

-- Report

SafeAddString(LBOOKS_REPORT_KEYBIND_RPRT, "报告", 1)
SafeAddString(LBOOKS_REPORT_KEYBIND_SWITCH, "切换模式", 1)
SafeAddString(LBOOKS_REPORT_KEYBIND_COPY, "复制", 1)

SafeAddString(LBOOKS_RS_FEW_BOOKS_MISSING, "沙利多的图书馆中仍有部分书籍未找到..", 1)
SafeAddString(LBOOKS_RS_MDONE_BOOKS_MISSING, "您已达到法师公会技能线最大级 ! 但是仍有部分书籍未找到", 1)
SafeAddString(LBOOKS_RS_GOT_ALL_BOOKS, "你成功完成了所有沙利多的图书馆书籍收集。恭喜您 !", 1)

SafeAddString(LBOOKS_RE_FEW_BOOKS_MISSING, "永恒记忆中仍有部分书籍未找到..", 1)
SafeAddString(LBOOKS_RE_GOT_ALL_BOOKS, "你成功完成了所有永恒记忆收集。恭喜您 !", 1)
SafeAddString(LBOOKS_RE_THREESHOLD_ERROR, "你需要收集更多一些书籍来获取永恒记忆报告..", 1)

SafeAddString(LBOOKS_REPORT_BOOK, "报告书本 <<1>> 修正信息..", 1)
SafeAddString(LBOOKS_EIDETIC_REPORT, "感谢您报告LoreBooks修正信息。\n如果您想为此插件贡献一份力只需在插件设置中打开分享即可。\n如果你想纠正某个特定的标记,这里就是正确的地方。\n请确保插件是最新版本 (你的版本: <<1>>)\n\n我的报告 :", 1)

SafeAddString(LBOOKS_QUEST_PLACEHOLDER, "请输入任务名", 1)
SafeAddString(LBOOKS_QUEST_LABEL, "任务名:", 1)

SafeAddString(LBOOKS_RS_NOT_HERE_ANYMORE, "书籍不在这儿了", 1)
SafeAddString(LBOOKS_RS_NOT_HERE_ANYMORE_DESC, "随着时间推移，一些书可能被移走。我肯定这本书已经不在这里了 (找几分钟, 楼上, 楼下, 可能哪里有个小洞什么的)", 1)
SafeAddString(LBOOKS_RS_NOT_HERE_ANYMORE_ERR, "这本书是最近才发现的(瑞驰的号角)。请再搜索一下。", 1)

SafeAddString(LBOOKS_RE_ELIGIBLE, "这本书属于瑞驰的号角 (2017年9月)的永恒记忆，在此精确位置. 你可以报告", 1)
SafeAddString(LBOOKS_RE_NOT_ELIGIBLE, "这本书还未在瑞驰的号角中找到(2017年9月) 永恒记忆在此精确位置. 你可以不报告. 如果您没有找到这本书，请确保您可能有任务链接。这本书也可能被移到了其他地方。", 1)

SafeAddString(LBOOKS_RS_BELONG_QUEST, "书籍属于一个任务", 1)
SafeAddString(LBOOKS_RS_BELONG_QUEST_DESC, "此书籍只有在任务 前/中/后 才有效。", 1)

SafeAddString(LBOOKS_RS_IN_DUNGEON, "副本中的书籍", 1)
SafeAddString(LBOOKS_RS_IN_DUNGEON_DESC, "此书籍在一个小副本里或在哪个洞穴里，然而在下没有地图。", 1)

SafeAddString(LBOOKS_SEND_DATA, "发送我的修改", 1)

SafeAddString(LBOOKS_REPORT_THANK_YOU, "谢谢您", 1)
SafeAddString(LBOOKS_REPORT_THANK_YOU_SEC, "您的修改将被确认并添加到下一个版本", 1)

-- Immersive Mode
SafeAddString(LBOOKS_IMMERSIVE, "开启沉浸模式基于", 1)
SafeAddString(LBOOKS_IMMERSIVE_DESC, "基于您正在查看的当前区域以下目标的完成情况，未知典籍不会被显示", 1)

SafeAddString(LBOOKS_IMMERSIVE_CHOICE1, "禁用", 1)
SafeAddString(LBOOKS_IMMERSIVE_CHOICE2, "区域主线任务", 1)
SafeAddString(LBOOKS_IMMERSIVE_CHOICE3, GetString(SI_MAPFILTER8), 1)
SafeAddString(LBOOKS_IMMERSIVE_CHOICE4, GetAchievementCategoryInfo(6), 1)
SafeAddString(LBOOKS_IMMERSIVE_CHOICE5, "区域任务", 1)

-- Quest Books
SafeAddString(LBOOKS_USE_QUEST_BOOKS, "使用任务书籍 (测试版)", 1)
SafeAddString(LBOOKS_USE_QUEST_BOOKS_DESC, "收到新任务时，会尝试使用任务工具来避免错过只出现在物品栏的书籍。也可以使用地图之类的东西，因为书和其他可用的任务物品没有区别。", 1)


