local EsoZH = {}
EsoZH.name = "EsoZH"
EsoZH.Flags = { "en", "zh" }
EsoZH.Version = "v0.19.0"
--EsoZH.versionInt = 263
EsoZH.API = 101036
-- EsoZH.firstInit = true
EsoZH.dropDownparm = { 
	["zh"] = "仅中文",
	["zh+en"] = "中文+英文",
	["en+zh"] = "英文+中文",
	["en"] = "仅英文",
}
EsoZH.FontdropDownparm = { 
	["default"] = "官方字体",
	["SourceHanSans"] = "思源黑体",
}
EsoZH.StringsBackup = {
	["SI_ABILITY_NAME_AND_RANK"] = GetString(SI_ABILITY_NAME_AND_RANK),
	["SI_ABILITY_TOOLTIP_NAME"] = GetString(SI_ABILITY_TOOLTIP_NAME),
	["SI_ITEM_FORMAT_STR_ENCHANT_HEADER_NAMED"] = GetString(SI_ITEM_FORMAT_STR_ENCHANT_HEADER_NAMED),
	["SI_ITEM_FORMAT_STR_ITEM_TRAIT_HEADER"] = GetString(SI_ITEM_FORMAT_STR_ITEM_TRAIT_HEADER),
	["SI_ITEM_FORMAT_STR_ITEM_TRAIT_WITH_ICON_HEADER"] = GetString(SI_ITEM_FORMAT_STR_ITEM_TRAIT_WITH_ICON_HEADER),
	["SI_ITEM_FORMAT_STR_SET_NAME"] = GetString(SI_ITEM_FORMAT_STR_SET_NAME),
	["SI_ITEM_FORMAT_STR_PERFECTED_SET_NAME"] = GetString(SI_ITEM_FORMAT_STR_PERFECTED_SET_NAME),
	["SI_TOOLTIP_ITEM_NAME"] = GetString(SI_TOOLTIP_ITEM_NAME),
	["SI_ITEM_FORMAT_STR_SET_NAME_NO_COUNT"] = GetString(SI_ITEM_FORMAT_STR_SET_NAME_NO_COUNT),
}

ZO_CreateStringId("ESOZH_ADDON_OUTDATE", "双语插件似乎已落后当前游戏版本，请查看网站或SA的QQ群找寻最新版本。你也可以直接点击下边的”查看最新版本”按钮，然后确认提示，会在你电脑的默认浏览器内自动打开汉化插件的网页地址。")
ZO_CreateStringId("ESOZH_DATA_OUTDATE", "数据库看起来不符合当前游戏版本，需要重新导出文本，否则可能有文本不匹配或错乱的情况出现。导出文本视你电脑配置可能需要1~3分钟的时间，请耐心等待！期间可能会自动重载界面数次，请不要强行退出游戏。点击“确定”按钮开始导出游戏文本，点击“取消”按钮本次暂不导出最新数据。")
ZO_CreateStringId("ESOZH_DATA_REEXPORT", "导出文本视你电脑配置可能需要1~3分钟的时间，请耐心等待！期间可能会自动重载界面数次，请不要强行退出游戏。点击“确定”按钮开始导出游戏文本，点击“取消”按钮本次暂不导出最新数据。")
ZO_CreateStringId("ESOZH_DATA_UNCOMPLETE", "插件数据库导出不完整，需要重新导出。导出文本视你电脑配置可能需要1~3分钟的时间，请耐心等待！期间可能会自动重载界面数次，请不要强行退出游戏。点击“确定”按钮开始导出游戏文本。")
ZO_CreateStringId("ESOZH_INIT_DATA", "欢迎使用插件，当前未找寻到插件数据库，需要导出游戏部分文本才可使用双语功能。导出文本视你电脑配置可能需要1~3分钟的时间，请耐心等待！期间可能会自动重载界面数次，请不要强行退出游戏。点击“确定”按钮开始导出游戏文本。")
ZO_CreateStringId("ESOZH_DATA_REEXPORT_DONE", "文本导出完毕，你可以在聊天窗口内输入 /esozh 然后回车来对插件进行一些设置。\n\n\n\n|ac|t256:128:EsoZH/Textures/Donate.dds|t\n\n\n\n|al你也可以适当捐助来让插件变得更好。")
ZO_CreateStringId("ESOZH_DONATE", "你可以在聊天窗口内输入 /esozh 然后回车来对插件进行一些设置。\n\n\n\n|ac|t256:128:EsoZH/Textures/Donate.dds|t\n\n\n\n|al你也可以适当捐助来让插件变得更好。")
ZO_CreateStringId("ESOZH_GUILD_SA", "\n\n|ac|t256:128:EsoZH/Textures/EsozhLogo.dds|t\n\n\n|alSA主会常年满人，暂不开放申请。|H1:guild:688589|hSplendid Achievers II|h\n|H1:guild:774193|hSplendid Achievers IlI|h\n|H1:guild:848581|hSplendid Achievers IV|h\n|H1:guild:848561|hSplendid Achievers V|h\nSA|cfff600分会|r面向休闲玩家，会有简单休闲的跑图活动，带萌新开传送祭坛及清理天空碎片、世界Boss等。\n\n|H1:guild:848579|hSplendid Achievers PVP|h\nSA|cfff600PvP分会|r面向PvP玩家，主要方便战场或角斗场玩家进行联络沟通。\n\n点击确定后，在|cfff600聊天窗口|r中点击公会链接以选择您想加入的公会。")
ZO_CreateStringId("ESOZH_GUILD_SA_JOIN_ALREADY", "\n\n|ac|t256:128:EsoZH/Textures/EsozhLogo.dds|t\n\n\n|al你已经加入了 Splendid Achievers 主会或某一分会，不建议同时加入多个分会。")
ZO_CreateStringId("ESOZH_GUILD_PL_JOIN_ALREADY", "\n\n|ac|t256:128:EsoZH/Textures/EsozhLogo.dds|t\n\n\n|al你已经加入了Pigeon Legion鸽子军团。")
ZO_CreateStringId("ESOZH_LIVE_ONLY", "\n\n|ac|t256:128:EsoZH/Textures/EsozhLogo.dds|t\n\n\n|al仅支持正式服。")
ZO_CreateStringId("ESOZH_LIVE_NA_ONLY", "\n\n|ac|t256:128:EsoZH/Textures/EsozhLogo.dds|t\n\n\n|al仅支持美服。")
ZO_CreateStringId("ESOZH_ADDON_JF", "已检测到曾用机翻插件，使用双语功能需要切换至官方汉化语言。导出文本视你电脑配置可能需要1~3分钟的时间，请耐心等待！期间可能会自动重载界面数次，请不要强行退出游戏。点击“确定”按钮开始导出游戏文本并切换语言。")

EsoZH.Defaults = {
    FirstInit = true,
    NeedUpdate = true,
    versionInt = 1,
	LocationDoubleName = "zh",
	ItemDoubleName = "zh",
	ItemTraits = "zh",
	NpcName = "zh",
	SkillName = "zh",
	EnchantsName = "zh",
	SetsName = "zh",
	ChampionName = "zh",
	NormalFont = "default",
	BookFont = false,
	DonateMsgbox = true,
}
EsoZH.Settings = EsoZH.Defaults

EsoZH.ExportNames = {
	ExportVersion = 0,
	AddonVersion = "",
	Skills = {},
	Items = {},
	Sets = {},
	SetsNames = {},
	Traits = {},
	Potions = {},
	Locations = {},
	Parts = {},
	Prefixes = {},
	Affixes = {},
	EnchantPrefixes = {},
}

EsoZH.Names = EsoZH.ExportNames

local Font_SourceHanSans = "EsoZH/fonts/SourceHanSans.otf"

local THIN          = 'soft-shadow-thin'
local THICK         = 'soft-shadow-thick'
local SHADOW        = 'shadow'
local NONE          = 'none'

EsoZH.FONTSTYLE_VALUES =
{
  FONT_STYLE_NORMAL,
  FONT_STYLE_OUTLINE,
  FONT_STYLE_OUTLINE_THICK,
  FONT_STYLE_SHADOW,
  FONT_STYLE_SOFT_SHADOW_THICK,
  FONT_STYLE_SOFT_SHADOW_THIN,
}

local panelData = {
    type = "panel",
    name = "中英双语插件",
    displayName = "中英双语插件",
    author = "Bevis熊熊",
    version = EsoZH.Version,
    slashCommand = "/esozh",
    registerForRefresh = true,
    registerForDefaults = true,
	website = "https://vstab.com/local",
}

local optionsTable = { }

table.insert(optionsTable,{
		type = "header",
		name = "选项",
		width = "full",	--or "half" (optional)
	})
--table.insert(optionsTable, {
--	type = "checkbox",
--	name = "自动保存上次使用语言",
--	tooltip = "启用此选项后，游戏将使用上次选择的语言。否则，每次启动时都是英语。",
--	getFunc = function()
--		if GetCVar("IgnorePatcherLanguageSetting") == "1" then
--			return true
--		else
--			return false
--		end
--		return GetCVar("IgnorePatcherLanguageSetting")
--	end,
--	setFunc = function(value)
--		if value == true then
--			SetCVar("IgnorePatcherLanguageSetting", "1")
--		else
--			SetCVar("IgnorePatcherLanguageSetting", "0")
--		end
--	end,
--	width = "full",
--})

table.insert(optionsTable,{
	type = "dropdown",
	name = "双语显示地名",
	tooltip = "对于已翻译的地名，选择是否中英语显示。",
	choices = {
		EsoZH.dropDownparm["zh"],
		EsoZH.dropDownparm["zh+en"],
		EsoZH.dropDownparm["en+zh"],
		EsoZH.dropDownparm["en"],
	},
	choicesValues = {"zh","zh+en","en+zh","en"},
	getFunc = function() return EsoZH.Settings.LocationDoubleName end,
	setFunc = (function(value)
		EsoZH.Settings.LocationDoubleName = value

		if value ~= "zh" and EsoZh_doubleNameLocation then
			EsoZh_doubleNameLocation(EsoZH)
		end

		FRIENDS_LIST_MANAGER:BuildMasterList()
		FRIENDS_LIST_MANAGER:OnSocialDataLoaded()
		GUILD_ROSTER_MANAGER:BuildMasterList()
		GUILD_ROSTER_MANAGER:OnGuildDataLoaded()

		LFGDoubleNames(EsoZH)

		CADWELLS_ALMANAC:RefreshList()
		CALLBACK_MANAGER:FireCallbacks("OnWorldMapChanged")
		EsoZH:MapNameStyle()
	end),
	width = "full",
})

table.insert(optionsTable,{
	type = "dropdown",
	name = "双语显示装备名称",
	tooltip = "对于已翻译的装备名称，选择是否中英语显示。",
	choices = {
		EsoZH.dropDownparm["zh"],
		EsoZH.dropDownparm["zh+en"],
		EsoZH.dropDownparm["en+zh"],
		EsoZH.dropDownparm["en"],
	},
	choicesValues = {"zh","zh+en","en+zh","en"},
	getFunc = function() return EsoZH.Settings.ItemDoubleName end,
	setFunc = (function(value)
		EsoZH.Settings.ItemDoubleName = value

		if value ~= "zh" and EsoZH_doubleNameItems then
			EsoZH_doubleNameItems(EsoZH)
		end
	end),
	width = "full",
})

table.insert(optionsTable,{
	type = "dropdown",
	name = "双语显示装备特性",
	tooltip = "选择是否双语显示装备特性。",
	choices = {
		EsoZH.dropDownparm["zh"],
		EsoZH.dropDownparm["zh+en"],
		EsoZH.dropDownparm["en+zh"],
		EsoZH.dropDownparm["en"],
	},
	choicesValues = {"zh","zh+en","en+zh","en"},
	getFunc = function() return EsoZH.Settings.ItemTraits end,
	setFunc = (function(value)
		EsoZH.Settings.ItemTraits = value

		if value ~= "zh" and EsoZH_doubleNameItems then
			EsoZH_doubleNameItems(EsoZH)
		end
	end),
	width = "full",
})

table.insert(optionsTable,{
	type = "dropdown",
	name = "双语显示符文名",
	tooltip = "选择是否双语显示符文名。",
	choices = {
		EsoZH.dropDownparm["zh"],
		EsoZH.dropDownparm["zh+en"],
		EsoZH.dropDownparm["en+zh"],
		EsoZH.dropDownparm["en"],
	},
	choicesValues = {"zh","zh+en","en+zh","en"},
	getFunc = function() return EsoZH.Settings.EnchantsName end,
	setFunc = (function(value)
		EsoZH.Settings.EnchantsName = value

		if value ~= "zh" and EsoZH_doubleNameItems then
			EsoZH_doubleNameItems(EsoZH)
		end
	end),
	width = "full",
})

table.insert(optionsTable,{
	type = "dropdown",
	name = "双语显示套装名",
	tooltip = "选择是否双语显示套装名。",
	choices = {
		EsoZH.dropDownparm["zh"],
		EsoZH.dropDownparm["zh+en"],
		EsoZH.dropDownparm["en+zh"],
		EsoZH.dropDownparm["en"],
	},
	choicesValues = {"zh","zh+en","en+zh","en"},
	getFunc = function() return EsoZH.Settings.SetsName end,
	setFunc = (function(value)
		EsoZH.Settings.SetsName = value

		if value ~= "zh" and EsoZH_doubleNameItems then
			EsoZH_doubleNameItems(EsoZH)
		end
	end),
	width = "full",
})

table.insert(optionsTable,{
	type = "dropdown",
	name = "双语显示NPC名字",
	tooltip = "选择是否双语显示NPC名字。",
	choices = {
		EsoZH.dropDownparm["zh"],
		EsoZH.dropDownparm["zh+en"],
		EsoZH.dropDownparm["en+zh"],
		EsoZH.dropDownparm["en"],
	},
	choicesValues = {"zh","zh+en","en+zh","en"},
	getFunc = function() return EsoZH.Settings.NpcName end,
	setFunc = (function(value)
		EsoZH.Settings.NpcName = value

		if value ~= "zh" and EsoZh_doubleNameNPC then
			EsoZh_doubleNameNPC(EsoZH)
		end
	end),
	width = "full",
})

table.insert(optionsTable,{
	type = "dropdown",
	name = "双语显示技能名",
	tooltip = "选择是否双语显示技能名。",
	choices = {
		EsoZH.dropDownparm["zh"],
		EsoZH.dropDownparm["zh+en"],
		EsoZH.dropDownparm["en+zh"],
		EsoZH.dropDownparm["en"],
	},
	choicesValues = {"zh","zh+en","en+zh","en"},
	getFunc = function() return EsoZH.Settings.SkillName end,
	setFunc = (function(value)
		EsoZH.Settings.SkillName = value

		if value ~= "zh" and EsoZH_doubleNameSkills then
			EsoZH_doubleNameSkills(EsoZH)
		end

		SKILLS_WINDOW:RebuildSkillLineList()
		COMPANION_SKILLS_DATA_MANAGER:RebuildSkillsData()
	end),
	width = "full",
})
table.insert(optionsTable,{
	type = "dropdown",
	name = "双语显示勇士星座名",
	tooltip = "选择是否双语显示勇士星座名。",
	choices = {
		EsoZH.dropDownparm["zh"],
		EsoZH.dropDownparm["zh+en"],
		EsoZH.dropDownparm["en+zh"],
		EsoZH.dropDownparm["en"],
	},
	choicesValues = {"zh","zh+en","en+zh","en"},
	getFunc = function() return EsoZH.Settings.ChampionName end,
	setFunc = (function(value)
		EsoZH.Settings.ChampionName = value

		if value ~= "zh" and EsoZH_doubleNameChampion then
			EsoZH_doubleNameChampion(EsoZH)
		end

		SKILLS_WINDOW:RebuildSkillLineList()
		COMPANION_SKILLS_DATA_MANAGER:RebuildSkillsData()
	end),
	width = "full",
})


table.insert(optionsTable,{
	type = "button",
	name = "导出数据",
	tooltip = "导出双语插件需要的数据",
	func = function()
		EsoZH:ShowMsgBox("提示", ESOZH_DATA_REEXPORT, 1)
	end,
	width = "half",	--or "half" (optional)
})

table.insert(optionsTable,{
	type = "header",
	name = "额外功能",
	width = "full",	--or "half" (optional)
})

table.insert(optionsTable,{
	type = "button",
	name = "SA公会大厅",
	tooltip = "传送到 辉煌成就者 公会大厅，美服或欧服会自动识别",
	func = function()
		if GetWorldName() == "NA Megaserver" then
			JumpToSpecificHouse("@raven_wong", 71)
		elseif GetWorldName() == "EU Megaserver" then
			JumpToHouse("@Star-Sky")
		else	
			EsoZH:ShowMsgBox("提示", "\n\n|ac|t256:128:EsoZH/Textures/EsozhLogo.dds|t\n\n\n|al仅支持正式服。", 2)
		end 
	end,
	width = "half",	--or "half" (optional)
})

--table.insert(optionsTable,{
--	type = "header",
--	name = "字体修改",
--	width = "full",	--or "half" (optional)
--})

table.insert(optionsTable,{
	type = "dropdown",
	name = "游戏主要字体修改",
	tooltip = "选择是否修改部分主要字体，不是所有的界面都适用（比如载屏界面无法修改）。",
	choices = {
		EsoZH.FontdropDownparm["default"],
		EsoZH.FontdropDownparm["SourceHanSans"],
	},
	choicesValues = {"default","SourceHanSans"},
	getFunc = function() return EsoZH.Settings.NormalFont end,
	setFunc = (function(value)
		EsoZH.Settings.NormalFont = value
		if value ~= "default" then
			EsoZH:SetFonts()
		end

	end),
	width = "half",
})

table.insert(optionsTable, {
	type = "checkbox",
	name = "游戏书信字体修改",
	tooltip = "启用此选项后，将书信的字体修改至类似英语原版字体。",
	getFunc = function() return EsoZH.Settings.BookFont end,
	setFunc = function(value)
			EsoZH.Settings.BookFont = value
		if value == true then
			EsoZH:SetFonts()
		end
	end,
	width = "half",
})

table.insert(optionsTable,{
	type = "header",
	name = "公会加入",
	width = "full",	--or "half" (optional)
})

table.insert(optionsTable,{
	type = "button",
	name = "鸽子军团(美服)",
	tooltip = "加入美服公会 Pigeon Legion 鸽子军团",
	func = function()
		if GetWorldName() == "NA Megaserver" then
			if ZO_ValidatePlayerGuildId(665471) then
				EsoZH:ShowMsgBox("提示", ESOZH_GUILD_PL_JOIN_ALREADY, 2)
			end
			ZO_LinkHandler_OnLinkClicked("|H1:guild:665471|hPigeon Legion|h", 1, nil)
		else
			EsoZH:ShowMsgBox("提示", ESOZH_LIVE_NA_ONLY, 2)
		end end,
	width = "half",	--or "half" (optional)
})

table.insert(optionsTable,{
	type = "button",
	name = "辉煌成就者分会",
	tooltip = "加入公会 Splendid Achievers 辉煌成就者分会",
	func = function() EsoZH:JoinSA() end,
	width = "half",	--or "half" (optional)
})



--table.insert(optionsTable,{
--	type = "button",
--	name = "辉煌成就者分会(欧服)",
--	tooltip = "加入欧服公会 Splendid Achievers 辉煌成就者",
--	func = function() if GetWorldName() == "EU Megaserver" then
--		if ZO_ValidatePlayerGuildId(641060) then
--			EsoZH:ShowMsgBox("提示", "\n\n|ac|t256:128:EsoZH/Textures/EsozhLogo.dds|t\n\n\n|al你已经加入了Splendid Achievers辉煌成就者。", 2)
--		end
--		ZO_LinkHandler_OnLinkClicked("|H1:guild:641060|hSplendid Achievers|h", 1, nil)
--	else
--		EsoZH:ShowMsgBox("提示", "\n\n|ac|t256:128:EsoZH/Textures/EsozhLogo.dds|t\n\n\n|al检测到不是欧服，如果是美服的话请选择美服公会！", 2)
--	end end,
--	width = "half",	--or "half" (optional)
--})

--table.insert(optionsTable,{
--	type = "button",
--	name = "加入Steam组",
--	tooltip = "加入Steam ESOCN组，可第一时间获得汉化更新消息或是反映汉化问题！",
--	func = function()
--		EsoZH:ShowMsgBox("提示", "\n\n|ac|t256:128:EsoZH/Textures/EsozhLogo.dds|t\n\n\n|al加入微攻略ESO CN Steam社区组，将会在默认浏览器内打开地址。中国大陆地区玩家可能无法正常访问Steam社区页面。", 4)
--	end,
--	width = "half",	--or "half" (optional)
--})

--table.insert(optionsTable,{
--	type = "button",
--	name = "加入汉化组",
--	tooltip = "汉化组一直在招新，如果你愿意为汉化插件贡献一份力量且满足要求的话，欢迎加入！",
--	func = function()
--		EsoZH:ShowMsgBox("提示", "\n\n|ac|t256:128:EsoZH/Textures/EsozhLogo.dds|t\n\n\n|al将会在默认浏览器内打开申请地址，确认窗口中通过即可。", 5)
--	end,
--	width = "half",	--or "half" (optional)
--})

--table.insert(optionsTable,{
--	type = "button",
--	name = "更新日志",
--	tooltip = "单击此按钮查看汉化插件的更新日志",
--	func = function()
--		EsoZH:ShowMsgBox("已更新至v0.18.1.0", "\n\n|ac|t256:128:EsoZH/Textures/EsozhLogo.dds|t\n\n\n|al兼容Lost Depths DLC更新\n增加NPC名双语显示选项\n增加技能名双语选项", 3)
--	end,
--	width = "half",	--or "half" (optional)
--})

table.insert(optionsTable,{
	type = "header",
	name = "捐助打赏",
	width = "full",	--or "half" (optional)
})

table.insert(optionsTable,{
	type = "description",
	text ="\n\n\n\n\n\n|ac|t512:256:EsoZH/Textures/Donate.dds|t\n\n\n\n\n\n|al汉化插件需要你的捐助支持！\n\n从微攻略人工版汉化与机翻汉化迭代而来。学生请不要大额捐助。\n\nBevis熊熊",
	width = "full",	--or "half" (optional)
})

function EsoZH:JoinSA()
	if GetWorldName() == "NA Megaserver" then
			if ZO_ValidatePlayerGuildId(660663) or ZO_ValidatePlayerGuildId(688589) or ZO_ValidatePlayerGuildId(774193) or ZO_ValidatePlayerGuildId(848581) or ZO_ValidatePlayerGuildId(848561) or ZO_ValidatePlayerGuildId(848579) then
				EsoZH:ShowMsgBox("提示", ESOZH_GUILD_SA_JOIN_ALREADY, 2)
			end
			EsoZH:ShowMsgBox("提示", ESOZH_GUILD_SA, 2)
			d('二会：|H1:guild:688589|hSplendid Achievers II|h')
			d('三会：|H1:guild:774193|hSplendid Achievers IlI|h') 
			d('四会：|H1:guild:848581|hSplendid Achievers IV|h')
			d('五会：|H1:guild:848561|hSplendid Achievers V|h')
			d('PvP会：|H1:guild:848579|hSplendid Achievers PVP|h')
	elseif (GetWorldName() == "EU Megaserver") then
			if ZO_ValidatePlayerGuildId(641060) then
				EsoZH:ShowMsgBox("提示", ESOZH_GUILD_SA_JOIN_ALREADY, 2)
			else
				ZO_LinkHandler_OnLinkClicked("|H1:guild:641060|hSplendid Achievers|h", 1, nil)
			end
	else
		EsoZH:ShowMsgBox("提示", ESOZH_LIVE_ONLY, 2)
	end
	
end

function EsoZH:SetFonts()
	if EsoZH.Settings.NormalFont == "SourceHanSans" then
		for key,value in zo_insecurePairs(_G) do
   			if ((key):find("^Zo") and not (key):find("^ZoFontBook")) and type(value) == "userdata" and value.SetFont then
      			local font = {value:GetFontInfo()}
      			font[1] = "EsoZH/fonts/SourceHanSans.otf"
      			value:SetFont(table.concat(font, "|"))
  			end
		end
	elseif EsoZH.Settings.NormalFont == "default" then
		for key,value in zo_insecurePairs(_G) do
   			if ((key):find("^Zo") and not (key):find("^ZoFontBook")) and type(value) == "userdata" and value.SetFont then
      			local font = {value:GetFontInfo()}
      			font[1] = "$(MEDIUM_FONT)"
      			value:SetFont(table.concat(font, "|"))
  			end
		end
	end

	if EsoZH.Settings.BookFont then
		for key,value in zo_insecurePairs(_G) do
   			if ((key):find("^ZoFontBookPaper") or (key):find("^ZoFontBookSkin") or (key):find("^ZoFontBookRubbing") or (key):find("^ZoFontBookMetal")) and type(value) == "userdata" and value.SetFont then
      			local font = {value:GetFontInfo()}
      			font[1] = "EsoZH/fonts/proseantiquepsmt.otf"   --$(ANTIQUE_FONT)
      			value:SetFont(table.concat(font, "|"))
      		elseif ((key):find("^ZoFontBookLetter") or (key):find("^ZoFontBookNote") or (key):find("^ZoFontBookScroll")) and type(value) == "userdata" and value.SetFont then
      			local font = {value:GetFontInfo()}
      			font[1] = "EsoZH/fonts/handwritten_bold.otf"   --$(HANDWRITTEN_FONT)
      			value:SetFont(table.concat(font, "|"))
  			elseif (key):find("^ZoFontBookTablet") and type(value) == "userdata" and value.SetFont then
	  			local font = {value:GetFontInfo()}
      			font[1] = "EsoZH/fonts/trajanpro-regular.otf"  --$(STONE_TABLET_FONT)
      			value:SetFont(table.concat(font, "|"))
  			end
		end
		
	else
		for key,value in zo_insecurePairs(_G) do
   			if (key):find("^ZoFontBook") and type(value) == "userdata" and value.SetFont then
      			local font = {value:GetFontInfo()}
      			font[1] = "$(HANDWRITTEN_FONT)"
      			value:SetFont(table.concat(font, "|"))
  			end
		end
	end

end

-- 返回当前游戏语言，中文或英文
--function EsoZH.GetLanguage()
--    local lang = GetCVar("language.2")
--    if (lang == "zh") then return lang end
--    return "en"
--end

-- 改变游戏语言
--function EsoZH.ChangeLang(lang)
--    zo_callLater(function()
--        SetCVar("language.2", lang)
--       -- EsoZH.savedVars.lang = lang
--        ReloadUI()
--    end, 500)
--end

-- 是否是全 ascii 字符串，用来判断是否汉化了
function EsoZH.IsAscii(s)
    for i = 1, #s do
       if string.byte(string.sub(s, i, i)) >= 128 then
            return true
        end
    end
    return false
end

--function EsoZH:SCTFix()
--	if EsoZH:GetLanguage() == "zh" then
--		SetSCTKeyboardFont(Font_Medium .. "|" .. 32 .. "|",FONT_STYLE_OUTLINE_THICK)
--		SetSCTGamepadFont(Font_Medium .. "|" .. 42 .. "|",FONT_STYLE_SOFT_SHADOW_THICK)
--		SetNameplateKeyboardFont(Font_Medium .. "|" .. 22 .. "|",FONT_STYLE_OUTLINE_THICK)
--	end
--end

function EsoZH:StartupMessage()
	if EsoZH.Settings.NeedUpdate and EsoZH:IsOldDB() then
		EsoZH:ShowMsgBox("数据库需要更新", ESOZH_DATA_OUTDATE,1)
	end

	if EsoZH:IsOldDB() and not EsoZH.Settings.NeedUpdate then
		d("数据库需要更新，请在聊天窗口内输入 /esozh 然后回车。在弹出的窗口内找到“导出数据”来生成插件需要的数据文件。")
	end


	EsoZH:CheckExportStatus()

	if EsoZH.Settings.DonateMsgbox then
		EsoZH.Settings.DonateMsgbox = false
		EsoZH:ShowMsgBox("欢迎使用双语插件", ESOZH_DATA_REEXPORT_DONE, 2)
	end
	
	--if EsoZH.API ~= GetAPIVersion() then
	--	EsoZH:ShowMsgBox("汉化插件需要更新", "\n\n|ac|t256:128:EsoZH/Textures/EsozhLogo.dds|t\n\n\n|al汉化插件看起来已经过时，使用旧版的汉化插件可能会引起文本缺失、文本无法对应等问题。\n\n请到微攻略网站查看并下载最新版本的汉化插件。\n\nhttps://vstab.com/local \n\n你也可以直接点击下边的 查看最新版本 按钮，然后确认提示，会在你电脑的默认浏览器内自动打开汉化插件的地址。", 3)
	--end

	--if EsoZH.Settings.versionInt ~= EsoZH.versionInt then
	--    EsoZH.Settings.versionInt = EsoZH.versionInt
	--	EsoZH:ShowMsgBox("已更新至v0.18.1.0", "\n\n|ac|t256:128:EsoZH/Textures/EsozhLogo.dds|t\n\n\n|al插件更新成功！已上线地名与装备名的双语显示功能！\n你可以在聊天窗口内输入/esozh 命令来对插件进行一些设置或查看更新日志。\n\n\n\n|ac|t256:128:EsoZH/Textures/Donate.dds|t\n\n\n\n|al汉化插件需要你的捐助支持！", 2)
	--	--EsoZH.Settings.version = EsoZH.versionInt
	--end


	
	EVENT_MANAGER:UnregisterForEvent("EsoZH_StartupMessage", EVENT_PLAYER_ACTIVATED)
end

-- 重新加载 UI
--function EsoZH.RefreshUI()
--    local flagControl
--    local count = 0
--    local flagTexture
--    for _, flagCode in pairs(EsoZH.Flags) do
--        flagTexture = "EsoZH/flags/"..flagCode..".dds"
--        flagControl = GetControl("EsoZH_FlagControl_"..tostring(flagCode))
--        if flagControl == nil then
--            flagControl = CreateControlFromVirtual("EsoZH_FlagControl_", EsoZHUI, "EsoZH_FlagControl", tostring(flagCode))
--            GetControl("EsoZH_FlagControl_"..flagCode.."Texture"):SetTexture(flagTexture)
--            if EsoZH.GetLanguage() ~= flagCode then
--                flagControl:SetAlpha(0.3)
--                if flagControl:GetHandler("OnMouseDown") == nil then
--                    flagControl:SetHandler("OnMouseDown", function() EsoZH.ChangeLang(flagCode) end)
--                end
--            end
--        end
--        flagControl:ClearAnchors()
--        flagControl:SetAnchor(LEFT, EsoZHUI, LEFT, 14 +count*34, 0)
--        count = count + 1
--    end
--    EsoZHUI:SetDimensions(25 +count*34, 50)
--    EsoZHUI:SetMouseEnabled(true)
--end

-- 插件初始化时调用
function Initialize()
   -- if (addOnName):find("^ZO_") then return end

   -- local defaultVars = { lang = "zh" }
    EsoZH.Settings = ZO_SavedVars:NewAccountWide("EsoZH_Variables", 1, nil, EsoZH.Defaults)
    EsoZH.Names = ZO_SavedVars:NewAccountWide("EsoZh_ExportData", 1, nil, EsoZH.ExportNames)

    
    
   -- if EsoZH.SettingsCharacter.firstInit == true then
	--	SetSetting(SETTING_TYPE_SUBTITLES, SUBTITLE_SETTING_ENABLED, "true")
	--	EsoZH.SettingsCharacter.firstInit = false
	-- end

	local lang = GetCVar("language.2")

	if lang == "jf" or lang == "ze" or lang == "zf" or lang == "zg" then
		EsoZH:ShowMsgBox("提示", ESOZH_ADDON_JF, 1)
	end
	
	if EsoZH.Settings.FirstInit == true then
		if lang == "zh" then
			SetSetting(SETTING_TYPE_SUBTITLES, SUBTITLE_SETTING_ENABLED, "true")
			EsoZH.Settings.FirstInit = false
			EsoZH:ShowMsgBox("欢迎使用双语插件", ESOZH_INIT_DATA, 1)
		--else
		--	EsoZH:ShowMsgBox("欢迎使用微攻略人工版汉化插件", "\n\n|ac|t256:128:EsoZH/Textures/EsozhLogo.dds|t\n\n\n|al感谢你安装《上古卷轴 Online》微攻略人工版汉化插件！\n\n看起来你这是首次启动汉化插件，因此要将语言切换到中文。\n\n现在是否要切换语言？", 1)
		end
	end

   -- SetSCTKeyboardFont(Font_Bold .. "|" .. 32 .. "|",FONT_STYLE_OUTLINE_THICK)

    
    -- chinese gamepad hack
    for k, v in pairs( ZO_TOOLTIP_STYLES ) do
        v.fontFace = "EsoZH/fonts/Univers57.otf"
    end
    
    for k, v in pairs( ZO_CRAFTING_TOOLTIP_STYLES ) do
        v.fontFace = "EsoZH/fonts/Univers57.otf"
    end
    
 for _, flagCode in pairs(EsoZH.Flags) do
        ZO_CreateStringId("SI_BINDING_NAME_"..string.upper(flagCode), string.upper(flagCode))
    end

   -- EsoZH.RefreshUI()
    
	if not LibAddonMenu2 then return end
	LibAddonMenu2:RegisterAddonPanel(EsoZH.name.."Options", panelData)
	LibAddonMenu2:RegisterOptionControls(EsoZH.name.."Options", optionsTable)

	if GetCVar("language.2") == "zh" then
		EsoZH_init()
	end

    --function ZO_GameMenu_OnShow(control)
    --    if control.OnShow then
    --        control.OnShow(control.gameMenu)
    --        EsoZHUI:SetHidden(hidden)
    --    end
    --end
    
    --function ZO_GameMenu_OnHide(control)
    --    if control.OnHide then
    --        control.OnHide(control.gameMenu)
    --        EsoZHUI:SetHidden(not hidden)
    --    end
    --end

    --SLASH_COMMANDS["/esozhexport"]=EsoZH.DumpEn
    
    
	
end

function EsoZH:CloseMsgBox()
	ZO_Dialogs_ReleaseDialog("EsoZHDialog", false)
end


function EsoZH_init()

	if EsoZH.Settings.LocationDoubleName ~= "zh" and EsoZh_doubleNameLocation then
		EsoZh_doubleNameLocation(EsoZH)
	else
		local GetMapLocationTooltipHeaderOld = GetMapLocationTooltipHeader
		
		function GetMapLocationTooltipHeader(...)
			return ZO_CachedStrFormat(SI_ZONE_NAME, GetMapLocationTooltipHeaderOld(...))
		end
	end

	if (EsoZH.Settings.ItemDoubleName ~= "zh" or EsoZH.Settings.ItemTraits ~= "zh" or EsoZH.Settings.EnchantsName ~= "zh" or EsoZH.Settings.SetsName ~= "zh") and EsoZH_doubleNameItems then
		EsoZH_doubleNameItems(EsoZH)
	end
	
	if EsoZH.Settings.NpcName ~= "zh" and EsoZh_doubleNameNPC then
		EsoZh_doubleNameNPC(EsoZH)
	end

	if EsoZH.Settings.SkillName ~= "zh" and EsoZH_doubleNameSkills then
		EsoZH_doubleNameSkills(EsoZH)
	end

	if EsoZH.Settings.ChampionName ~= "zh" and EsoZH_doubleNameChampion then
		EsoZH_doubleNameChampion(EsoZH)
	end

	--if (EsoZH.Settings.EnchantsName ~= "zh" or EsoZH.Settings.EnchantsName ~= "zh") and EsoZH_doubleNameItems then
	--	EsoZH_doubleNameItems(EsoZH)
	--end
	
	--if (EsoZH.Settings.SetsName ~= "zh" or EsoZH.Settings.SetsName ~= "zh") and EsoZH_doubleNameItems then
	--	EsoZH_doubleNameItems(EsoZH)
	--end

end

function EsoZH:ShowMsgBox(title, msg, typ)

	local callback = {}
	--local msgBody = msg()
	
	if typ == 1 then
		callback = {
			[1] = 
			{
				keybind = "DIALOG_PRIMARY",
				text = "确定导出", 
				callback =
					function ()
						EsoZH.Settings.DonateMsgbox = true
						EsoZH_ExportDB()
					end,
                clickSound = SOUNDS.DIALOG_ACCEPT,
			},
			[2] =
			{
				keybind = "DIALOG_NEGATIVE",
                text = "取消",
                callback = 
                	function()
	                	EsoZH.Settings.NeedUpdate = false
                	end,
                clickSound = SOUNDS.DIALOG_DECLINE,
			},
		}
	elseif typ == 2 then
		callback = {
			[1] = 
			{
				keybind = "DIALOG_PRIMARY",
				text = SI_OK,
                clickSound = SOUNDS.DIALOG_ACCEPT,
			}
		}
	elseif typ == 3 then
		callback = {
			[1] = 
			{
				keybind = "DIALOG_PRIMARY",
				text = "查看最新版本", 
				callback =
					function ()
						RequestOpenUnsafeURL("https://vstab.com/local/")
					end,
                clickSound = SOUNDS.DIALOG_ACCEPT,
			},
			[2] =
			{
				keybind = "DIALOG_NEGATIVE",
                text = "取消",
                clickSound = SOUNDS.DIALOG_DECLINE,
			},
		}
		elseif typ == 4 then
		callback = {
			[1] = 
			{
				keybind = "DIALOG_PRIMARY",
				text = "访问Steam社区组", 
				callback =
					function ()
						RequestOpenUnsafeURL("https://steamcommunity.com/groups/ESOChina")
					end,
                clickSound = SOUNDS.DIALOG_ACCEPT,
			},
			[2] =
			{
				keybind = "DIALOG_NEGATIVE",
                text = "取消",
                clickSound = SOUNDS.DIALOG_DECLINE,
			},
		}
	--elseif typ == 5 then
	--	callback = {
	--		[1] = 
	--		{
	--			keybind = "DIALOG_PRIMARY",
	--			text = "访问汉化组招新申请页面", 
	--			callback =
	--				function ()
	--					RequestOpenUnsafeURL("https://www.edigame.com/join")
	--				end,
 --               clickSound = SOUNDS.DIALOG_ACCEPT,
	--		},
	--		[2] =
	--		{
	--			keybind = "DIALOG_NEGATIVE",
 --               text = "取消",
 --               clickSound = SOUNDS.DIALOG_DECLINE,
	--		},
	--	}
	end
	
	local confirmDialog = 
	{
		canQueue = true,
		onlyQueueOnce = true,
		gamepadInfo = { dialogType = GAMEPAD_DIALOGS.BASIC },
		title = { text = title },
		mainText = { text = GetString(msg) },
		buttons = callback
	}
	
	ZO_Dialogs_RegisterCustomDialog("EsoZHDialog", confirmDialog)
	EsoZH:CloseMsgBox()
	
	--else
		ZO_Dialogs_ShowDialog("EsoZHDialog")
	--end
end


-- 玩家激活时调用
--function EsoZH.LoadScreen(event)
--    SetNameplateKeyboardFont(Font_Bold .. "|" .. 22 .. "|",FONT_STYLE_OUTLINE_THICK)
--    SetNameplateGamepadFont(Font_Bold .. "|" .. 22 .. "|",FONT_STYLE_OUTLINE_THICK)
    
--    -- 检查当前语言、上次设置的语言是否是中文，如有必要就修改语言设置
--   -- if EsoZH.firstInit then
--    --    EsoZH.firstInit = false
--     --   if EsoZH.GetLanguage() ~= "zh" and EsoZH.savedVars.lang == "zh" then
--      --      EsoZH.ChangeLang("zh")
--      --  end
--  --  end
--end

-- 修改字幕显示时间，因为中文文本一般会比英文短
--if not EsoZH.old_OnShowSubtitle then
--    EsoZH.old_OnShowSubtitle = ZO_SubtitleManager.OnShowSubtitle
--end
--ZO_SubtitleManager.OnShowSubtitle = function(self, ...)
--    EsoZH.old_OnShowSubtitle(self, ...)
--    local message = self.currentSubtitle and self.currentSubtitle.messageText
--    local lang = GetCVar("Language.2")
--    if lang == "zh" and message and EsoZH.IsAscii(message) then
--        local minLen = 3
--        local maxLen = 12
--        local messageLength = ZoUTF8StringLength(message)
--        local charactersPerSecond = 4  -- default is 10
--        self.currentSubtitle.displayLengthSeconds = zo_clamp(messageLength / charactersPerSecond, minLen, maxLen)
--    end
--end

function EsoZH:IsOldDB()
	local db = EsoZH.Names
	if not db.ExportVersion or not db.AddonVersion or (db.ExportVersion ~= GetAPIVersion()) or (db.AddonVersion ~= EsoZH.Version) then
		return true
	else
		return false
	end
end


function EsoZH:CheckExportStatus()
	if GetCVar("language.2") == "en" and EsoZH.Names["ExportEN"] ~= nil then
		EsoZH:DumpEn()
	end
	
	if GetCVar("language.2") == "zh" and EsoZH.Names["ExportZH"] ~= nil then
		EsoZH.Names["ExportZH"] = nil
		EsoZH:DumpZh()
	end

	if EsoZH.Names["ExportDone"] ~= nil then
		EsoZH.Names["ExportDone"] = nil
		
	end
	
end


function EsoZH_ExportDB()
	EsoZH.Names.Skills = {}
	EsoZH.Names.Items = {}
	EsoZH.Names.Sets = {}
	EsoZH.Names.SetsNames = {}
	EsoZH.Names.Traits = {}
	EsoZH.Names.Potions = {}
	EsoZH.Names.Locations = {}
	EsoZH.Names.Parts = {}
	EsoZH.Names.Prefixes = PrefixesDict
	EsoZH.Names.Affixes = AffixesDict
	EsoZH.Names.EnchantPrefixes = EnchantPrefixesDict

	if GetCVar("language.2") == "zh" then
		EsoZH:DumpZh()
	else
		EsoZH.Names["ExportZH"] = true
		SetCVar("language.2", "zh")
	end

end


function EsoZH:MagicReplace(str, what, with)
    what = zo_strgsub(what, "[%(%)%.%+%-%*%?%[%]%^%$%%]", "%%%1")
    with = zo_strgsub(with, "[%%]", "%%%%")
    return zo_strgsub(str, what, with)
end

function EsoZH:MapNameStyle()		
	if EsoZH.Settings.LocationDoubleNames == "zh+en" or EsoZH.Settings.LocationDoubleNames == "en+zh" then
		ZO_WorldMapCornerTitle:SetFont("ZoFontWinH3")
	else
		ZO_WorldMapCornerTitle:SetFont("ZoFontWinH1")
	end
	
	local scrollData = ZO_ScrollList_GetDataList(ZO_WorldMapLocationsList)
    ZO_ClearNumericallyIndexedTable(scrollData)
	WORLD_MAP_LOCATIONS_DATA:RefreshLocationList()
	WORLD_MAP_LOCATIONS:BuildLocationList()
end

function EsoZH:IsAddonRunning(addonName)
    local manager = GetAddOnManager()
    for i = 1, manager:GetNumAddOns() do
        local name, _, _, _, _, state = manager:GetAddOnInfo(i)
        if name == addonName and state == ADDON_STATE_ENABLED then
            return true
        end
    end
    return false
end


function EsoZH:DumpZh()

SetCVar("language.2", "zh")

	for i = 1, 300000 do

		local hasSet, setName = GetItemLinkSetInfo(string.format("|H1:item:%d:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h", i)) 
		
		if hasSet then
			EsoZH.Names.SetsNames[ZO_CachedStrFormat("<<z:1>>", setName)] = i
		end
	end
	
	for i = 1, #zhPotLinks do
		EsoZH.Names.Potions[GetItemLinkName(string.format("|H1:item:%s:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h", zhPotLinks[i]))] = zhPotLinks[i]
	end
	
	for i = 1, #zhParts do
		EsoZH.Names.Parts[ZO_CachedStrFormat("<<z:1>>", GetItemLinkName(string.format("|H1:item:%d:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h", zhParts[i])))] = zhParts[i]
	end
	
	--for i = 1, #zhEnchantPrefixes do
	--	EsoZH.Names.EnchantPrefixes[EsoZH:MagicReplace(GetItemLinkName(string.format("|H1:item:%s:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h", zhEnchantPrefixes[i])), " " .. GetItemLinkName("|H1:item:5364:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h"), "")] = zhEnchantPrefixes[i]
	--end
	
	--for i = 1, #zhPrefixes do
	--	local str = EsoZH:MagicReplace(ZO_CachedStrFormat("<<z:1>>", GetItemLinkName(string.format("|H1:item:%s:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h", zhPrefixes[i]))), " " .. ZO_CachedStrFormat("<<z:1>>", GetItemLinkName("|H1:item:" .. string.match(zhPrefixes[i], "^(%d+):") .. ":0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h")), "")
	--	EsoZH.Names.Prefixes[str:sub(1, #str - 3)] = zhPrefixes[i]
	--end
	
	--for i = 1, #zhAffixes do
	--	EsoZH.Names.Affixes[EsoZH:MagicReplace(ZO_CachedStrFormat("<<z:1>>", GetItemLinkName(string.format("|H1:item:43533:0:0:%d:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h", zhAffixes[i]))), ZO_CachedStrFormat("<<z:1>>", GetItemLinkName("|H1:item:43533:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h")) .. " ", "")] = zhAffixes[i]
	--end
	
	-- Locations
	
	--local backupLocations = EsoZH.Settings.LocationDoubleName
	EsoZH.Settings.LocationDoubleName = "zh"
	
	local zonesCount = GetNumZones()
	for i = 1, zonesCount do
		local locationName = ZO_CachedStrFormat("<<z:1>>", GetZoneNameByIndex(i))
		if locationName then
			EsoZH.Names.Locations[locationName] = string.format("zone:%d:0", i)
		end
		
		local POIsCount = GetNumPOIs(i)
		for j = 1, POIsCount do
			local locationName = ZO_CachedStrFormat("<<z:1>>", GetPOIInfo(i, j))
			if locationName then
				EsoZH.Names.Locations[locationName] = string.format("poi:%d:%d", i, j)
			end
		end
	end
	
	local fastTravelNodesCount = GetNumFastTravelNodes()
	for i = 1, fastTravelNodesCount do
		local _, locationName = GetFastTravelNodeInfo(i)
		if locationName then
			EsoZH.Names.Locations[ZO_CachedStrFormat("<<z:1>>", locationName)] = string.format("ft:%d:0", i)
		end
	end
	
	for i = 1, 1000 do
		local locationName = ZO_CachedStrFormat("<<z:1>>", GetKeepName(i))
		if locationName then
			EsoZH.Names.Locations[locationName] = string.format("keep:%d:0", i)
		end
	end
	
	--EsoZH.Settings.LocationDoubleName = backupLocations

	EsoZH.Names["ExportEN"] = true
	SetCVar("language.2", "en")
end

function EsoZH:DumpEn()

local numSkillTypes = GetNumSkillTypes()
	
	for i = 1, numSkillTypes do
		local numSkillLines = GetNumSkillLines(i)
		
		for j = 1, numSkillLines do
			local numSkillAbilities = GetNumSkillAbilities(i, j)
			
			for k = 1, numSkillAbilities do
				
				local _, _, _, passive = GetSkillAbilityInfo(i, j, k)
				
				if passive then
					for l = 1,GetNumPassiveSkillRanks(i, j, k) do
						local currentMorphId = GetSpecificSkillAbilityInfo(i, j, k, 0, l)
						EsoZH.Names.Skills[currentMorphId] = GetAbilityName(currentMorphId)
					end
				else
					local currentMorphId = GetSpecificSkillAbilityInfo(i, j, k, 0, 1)
					EsoZH.Names.Skills[currentMorphId] = GetAbilityName(currentMorphId)
					
					local currentMorphId = GetSpecificSkillAbilityInfo(i, j, k, 1, 1)
					EsoZH.Names.Skills[currentMorphId] = GetAbilityName(currentMorphId)
					
					local currentMorphId = GetSpecificSkillAbilityInfo(i, j, k, 2, 1)
					EsoZH.Names.Skills[currentMorphId] = GetAbilityName(currentMorphId)
				end
			end
		end
	end

	--for key,value in pairs(ruesoCompanionAbilities) do
	--	EsoZH.Names.Skills[key] = GetAbilityName(key)
	--end

	for i = 1, GetNumChampionDisciplines() do
		for j = 1, GetNumChampionDisciplineSkills(i) do
			EsoZH.Names.Skills[GetChampionAbilityId(GetChampionSkillId(i, j))] = GetChampionSkillName(GetChampionSkillId(i, j))
		end
	end

	for i = 1, 300000 do
		local itemName = GetItemLinkName(string.format("|H1:item:%d:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h", i))
		
		if itemName and itemName ~= "" and not string.match(itemName, "_") then
			EsoZH.Names.Items[i] = ZO_CachedStrFormat(SI_TOOLTIP_ITEM_NAME, itemName)
		end

		local hasSet, setName, _, _, _, setId = GetItemLinkSetInfo(string.format("|H1:item:%d:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h", i))
		
		if hasSet then
			EsoZH.Names.Sets[setId] = setName
		end

	end

	-- Set Names
	
	for index,value in pairs(EsoZH.Names.SetsNames) do
		local hasSet, setName = GetItemLinkSetInfo(string.format("|H1:item:%d:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h", value))
		EsoZH.Names.SetsNames[index] = ZO_CachedStrFormat(SI_TOOLTIP_ITEM_NAME, setName)
	end
	
	-- Alchemy
	
	for index,value in pairs(EsoZH.Names.Potions) do
		EsoZH.Names.Potions[index] = ZO_CachedStrFormat(SI_TOOLTIP_ITEM_NAME, GetItemLinkName(string.format("|H1:item:%s:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h", value)))
	end
	
	-- Item Parts
	
	for index,value in pairs(EsoZH.Names.Parts) do
		EsoZH.Names.Parts[index] = ZO_CachedStrFormat(SI_TOOLTIP_ITEM_NAME, GetItemLinkName(string.format("|H1:item:%d:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h", value)))
	end
	
	-- Enchantment Prefixes
	
	--for index,value in pairs(EsoZH.Names.EnchantPrefixes) do
	--	EsoZH.Names.EnchantPrefixes[index] = ZO_CachedStrFormat(SI_TOOLTIP_ITEM_NAME, EsoZH:MagicReplace(GetItemLinkName(string.format("|H1:item:%s:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h", value)), " " .. GetItemLinkName("|H1:item:5364:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h"), ""))
	--end
	
	-- Item Prefixes
	
	--for index,value in pairs(EsoZH.Names.Prefixes) do
	--	EsoZH.Names.Prefixes[index] = EsoZH:MagicReplace(ZO_CachedStrFormat(SI_TOOLTIP_ITEM_NAME, GetItemLinkName(string.format("|H1:item:%s:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h", value))), " " .. ZO_CachedStrFormat(SI_TOOLTIP_ITEM_NAME, GetItemLinkName("|H1:item:" .. string.match(value, "^(%d+):") .. ":0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h")), "")
	--end
	
	-- Item Affixes
	
	--for index,value in pairs(EsoZH.Names.Affixes) do
	--	EsoZH.Names.Affixes[index] = EsoZH:MagicReplace(ZO_CachedStrFormat(SI_TOOLTIP_ITEM_NAME, GetItemLinkName(string.format("|H1:item:43533:0:0:%d:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h", value))), ZO_CachedStrFormat(SI_TOOLTIP_ITEM_NAME, GetItemLinkName("|H1:item:43533:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h")) .. " ", "")
	--end

	-- Traits
	
	for i = 1, 100 do
		local traitName = GetString("SI_ITEMTRAITTYPE", i)
		
		if traitName and traitName ~= "" then
			EsoZH.Names.Traits[i] = traitName
		end
	end

	-- Locations
	
	for index,value in pairs(EsoZH.Names.Locations) do
		local locType, locId, locSubId = string.match(value, "^(.*):(%d+):(%d+)$")
		
		if locType and locId and locSubId then
			if locType == "zone" then
				EsoZH.Names.Locations[index] = ZO_CachedStrFormat(SI_ZONE_NAME, GetZoneNameByIndex(locId))
			elseif locType == "poi" then
				EsoZH.Names.Locations[index] = ZO_CachedStrFormat(SI_ZONE_NAME, GetPOIInfo(locId, locSubId))
			elseif locType == "keep" then
				EsoZH.Names.Locations[index] = ZO_CachedStrFormat(SI_ZONE_NAME, GetKeepName(locId))
			elseif locType == "ft" then
				local _, locationName = GetFastTravelNodeInfo(locId)
				EsoZH.Names.Locations[index] = ZO_CachedStrFormat(SI_ZONE_NAME, locationName)
			end
		end
	end

	EsoZH.Names["ExportEN"] = nil
	EsoZH.Names["ExportDone"] = true

	EsoZH.Names.ExportVersion = GetAPIVersion()
	EsoZH.Names.AddonVersion = EsoZH.Version
	EsoZH.Settings.NeedUpdate = true

	SetCVar("language.2", "zh")
	
end


-- 注册初始化事件

function OnAddonLoaded(eventType, addonName)
	if addonName == EsoZH.name then
		Initialize()
		--UnregisterForEvent--
		EVENT_MANAGER:UnregisterForEvent(EsoZH.name, eventType)
	end
	EsoZH:SetFonts()
end
EVENT_MANAGER:RegisterForEvent(EsoZH.name, EVENT_ADD_ON_LOADED, OnAddonLoaded)
--EVENT_MANAGER:RegisterForEvent("EsoZH_OnAddOnLoaded", EVENT_ADD_ON_LOADED, function(_event, _name) EsoZH.OnInit(_event, _name) end)
--EVENT_MANAGER:RegisterForEvent("EsoZH_SCTFix", EVENT_PLAYER_ACTIVATED, function(...) EsoZH:SCTFix() end)
--EVENT_MANAGER:RegisterForEvent("EsoZH_LoadScreen", EVENT_PLAYER_ACTIVATED, EsoZH.LoadScreen)
EVENT_MANAGER:RegisterForEvent("EsoZH_StartupMessage", EVENT_PLAYER_ACTIVATED, function(...) EsoZH:StartupMessage() end)

ZO_CompassCenterOverPinLabel:SetHandler("OnTextChanged", function() 
	local pinLabelText = ZO_CompassCenterOverPinLabel:GetText()
	
	if pinLabelText ~= nil and pinLabelText ~= "" then
		ZO_CompassCenterOverPinLabel:SetText(ZO_CachedStrFormat(SI_UNIT_NAME, pinLabelText))
	end
end)
