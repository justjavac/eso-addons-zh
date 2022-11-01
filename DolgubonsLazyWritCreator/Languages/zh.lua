-----------------------------------------------------------------------------------
-- Addon Name: Dolgubon's Lazy Writ Crafter
-- Creator: Dolgubon (Joseph Heinzle)
-- Addon Ideal: Simplifies Crafting Writs as much as possible
-- Addon Creation Date: March 14, 2016
--
-- File Name: Languages/en.lua
-- File Description: English Localization
-- Load Order Requirements: None
-- 
-----------------------------------------------------------------------------------

-----------------------------------------------------------------------------------
--
-- TRANSLATION NOTES - PLEASE READ
--
-- If you are not looking to translate the addon you can ignore this. :D
--
-- If you ARE looking to translate this to something else then anything with a comment of Vital beside it is 
-- REQUIRED for the addon to function properly. These strings MUST BE TRANSLATED EXACTLY!
-- If only going for functionality, ctrl+f for Vital. Otherwise, you should just translate everything. Note that some strings 
-- Note that if you are going for a full translation, you must also translate defualt.lua and paste it into your localization file.
--
-- For languages that do not use the Latin Alphabet, there is also an optional langParser() function. IF the language you are translating
-- requires some changes to the WritCreater.parser() function then write the optional langParser() function here, and the addon
-- will use that instead. Just below is a commented out langParser for English. Be sure to remove the comments if rewriting it. [[  ]]
--
-- If you run into problems, please feel free to contact me on ESOUI.
--
-----------------------------------------------------------------------------------
--
--[[
function WritCreater.langParser(str)  -- Optional overwrite function for language translations
	local seperater = "%s+"

	str = string.gsub(str,":"," ")

	local params = {}
	local i = 1
	local searchResult1, searchResult2  = string.find(str,seperater)
	if searchResult1 == 1 then
		str = string.sub(str, searchResult2+1)
		searchResult1, searchResult2  = string.find(str,seperater)
	end

	while searchResult1 do

		params[i] = string.sub(str, 1, searchResult1-1)
		str = string.sub(str, searchResult2+1)
	    searchResult1, searchResult2  = string.find(str,seperater)
	    i=i+1
	end 
	params[i] = str
	return params

end
--]]

WritCreater = WritCreater or {}

local function proper(str)
	if type(str)== "string" then
		return zo_strformat("<<C:1>>",str)
	else
		return str
	end
end

WritCreater.hirelingMailSubjects = 
{
	["Raw Enchanter Materials"] = true ,
	["Raw Clothier Materials"] = true ,
	["Raw Blacksmith Materials"] = true ,
	["Raw Woodworker Materials"] = true ,
	["Raw Provisioner Materials"] = true ,
	["附魔师原材料"] = true ,
	["制衣师原材料"] = true ,
	["锻造师原材料"] = true ,
	["木工师原材料"] = true ,
	["烹饪师原材料"] = true ,
	["附魔师原材料<Raw Enchanter Materials>"] = true ,
	["制衣师原材料<Raw Clothier Materials>"] = true ,
	["锻造师原材料<Raw Blacksmith Materials>"] = true ,
	["木工师原材料<Raw Woodworker Materials>"] = true ,
	["烹饪师原材料<Raw Provisioner Materials>"] = true ,
	["Schreinermaterial"] = true,
	["Versorgerzutaten"] = true,
	["Schneidermaterial"] = true,
	["Verzauberermaterial"] = true,
	["Schmiedematerial"] = true,
	["Matériaux bruts d'enchantement"] = true,
	["Matériaux bruts de forge"] = true,
	["Matériaux bruts de travail du bois"] = true,
	["Matériaux bruts de couture"] = true,
	["Matériaux bruts de cuisine"] = true,
}

function WritCreater.langWritNames() -- Vital
	-- Exact!!!  I know for german alchemy writ is Alchemistenschrieb - so ["G"] = schrieb, and ["A"]=Alchemisten
	local names = {
	["G"] = "日常令状",
	[CRAFTING_TYPE_ENCHANTING] = "附魔",
	[CRAFTING_TYPE_BLACKSMITHING] = "锻造",
	[CRAFTING_TYPE_CLOTHIER] = "制衣",
	[CRAFTING_TYPE_PROVISIONING] = "烹饪",
	[CRAFTING_TYPE_WOODWORKING] = "木工",
	[CRAFTING_TYPE_ALCHEMY] = "炼金",
	[CRAFTING_TYPE_JEWELRYCRAFTING] = "首饰",
	}
	return names
end

function WritCreater.langCraftKernels()
	return 
	{
		[CRAFTING_TYPE_ENCHANTING] = "附魔",
		[CRAFTING_TYPE_BLACKSMITHING] = "锻造",
		[CRAFTING_TYPE_CLOTHIER] = "制衣",
		[CRAFTING_TYPE_PROVISIONING] = "烹饪",
		[CRAFTING_TYPE_WOODWORKING] = "木工",
		[CRAFTING_TYPE_ALCHEMY] = "炼金",
		[CRAFTING_TYPE_JEWELRYCRAFTING] = "首饰",
	}
end

function WritCreater.langMasterWritNames() -- Vital
	local names = {
	["M"] 							= "大师",
	["M1"]							= "大师",
	[CRAFTING_TYPE_ALCHEMY]			= "药剂",
	[CRAFTING_TYPE_ENCHANTING]		= "附魔",
	[CRAFTING_TYPE_PROVISIONING]	= "食物",
	["plate"]						= "防具",
	["tailoring"]					= "衣服",
	["leatherwear"]					= "皮革",
	["weapon"]						= "武器",
	["shield"]						= "盾牌",
	}
return names

end

function WritCreater.writCompleteStrings() -- Vital for translation
	local strings = {
	["place"] = "将货物放入",
	["sign"] = "签署货单",
	["masterPlace"] = "我已经完成了",
	["masterSign"] = "<完成工作。>",
	["masterStart"] = "<接受委托。>",
	["Rolis Hlaalu"] = "劳利仕·哈拉鲁", -- This is the same in most languages but ofc chinese and japanese
	["Deliver"] = "运送",
	}
	return strings
end


function WritCreater.languageInfo() -- Vital

local craftInfo = 
	{
		[ CRAFTING_TYPE_CLOTHIER] = 
		{
			["pieces"] = --exact!!
			{
				[1] = "长袍",
				[2] = "衬衣",
				[3] = "布鞋",
				[4] = "手套",
				[5] = "帽子",
				[6] = "长裤",
				[7] = "披肩",
				[8] = "腰带",
				[9] = "护胸",
				[10]= "长靴",
				[11]= "护腕",
				[12]= "头盔",
				[13]= "护腿",
				[14]= "护肩",
				[15]= "护腰",
			},
			["match"] = --exact!!! This is not the material, but rather the prefix the material gives to equipment. e.g. Homespun Robe, Linen Robe
			{
				[1] = "手编的", --lvtier one of mats
				[2] = "亚麻",	--l
				[3] = "棉布制",
				[4] = "蛛丝",
				[5] = "乌晶丝",
				[6] = "克雷什",
				[7] = "铁柳丝",
				[8] = "白银布",
				[9] = "虚无布制",
				[10]= "先祖之丝",
				[11]= "生皮",
				[12]= "毛皮",
				[13]= "皮革",
				[14]= "全革",
				[15]= "兽皮",
				[16]= "锁子甲",
				[17]= "精铁革",
				[18]= "奢华皮制",
				[19]= "暗影皮",
				[20]= "湮红皮制",
			},
	
		},
		[CRAFTING_TYPE_BLACKSMITHING] = 
		{
			["pieces"] = --exact!!
			{
				[1] = "手斧",
				[2] = "矛锤",
				[3] = "长剑",
				[4] = "大斧",
				[5] ="大锤",
				[6] ="大剑",
				[7] = "匕首",
				[8] = "胸铠",
				[9] = "足铠",
				[10] = "手铠",
				[11] = "头铠",
				[12] = "腿铠",
				[13] = "肩铠",
				[14] = "腰铠",
			},
			["match"] = --exact!!! This is not the material, but rather the prefix the material gives to equipment. e.g. Iron Axe, Steel Axe
			{
				[1] = "铁制",
				[2] = "钢铁",
				[3] = "山铜钢制",
				[4] = "锻莫钢制",
				[5] = "乌晶制",
				[6] = "钙石制",
				[7] = "锰晶制",
				[8] = "水银制",
				[9] = "虚无钢制",
				[10]= "湮红矿制",
			},

		},
		[CRAFTING_TYPE_WOODWORKING] = 
		{
			["pieces"] = --Exact!!!
			{
				[1] = "长弓",
				[3] = "火焰法杖",
				[4] = "寒冰法杖",
				[5] = "闪电法杖",
				[6] = "恢复法杖",
				[2] = "盾",
			},
			["match"] = --exact!!! This is not the material, but rather the prefix the material gives to equipment. e.g. Maple Bow. Oak Bow.
			{
				[1] = "枫木",
				[2] =  "橡木",
				[3] =  "桦木",
				[4] = "胡桃木",
				[5] = "杉木",
				[6] =  "桦木",
				[7] = "灰木",
				[8] = "桃心木",
				[9] = "夜木",
				[10] = "湮红木制",
			},

		},
		[CRAFTING_TYPE_JEWELRYCRAFTING] = 
		{
			["pieces"] = --Exact!!!
			{
				[1] = "戒指",
				[2] = "项链",

			},
			["match"] = --exact!!! This is not the material, but rather the prefix the material gives to equipment. e.g. Maple Bow. Oak Bow.
			{
				[1] = "锡制", -- 1
				[2] = "铜制", -- 26
				[3] = "银制", -- CP10
				[4] = "琥珀", --CP80
				[5] = "铂金", -- CP150
			},

		},
		[CRAFTING_TYPE_ENCHANTING] = 
		{
			["pieces"] = --exact!!
			{ --{String Identifier, ItemId, positive or negative}
				{"疾病抗性", 45841,2},
				{"瘟疫", 45841,1},
				{"耐力吸收", 45833,2},
				{"魔法吸收", 45832,2},
				{"生命吸收", 45831,2},
				{"寒冰抗性",45839,2},
				{"寒冰",45839,1},
				{"技耗缩减", 45836,2},
				{"耐力恢复", 45836,1},
				{"硬化", 45842,1},
				{"冲击", 45842,2},
				{"棱镜攻击", 68342,2},
				{"棱镜防御", 68342,1},
				{"防御",45849,2},
				{"猛击",45849,1},
				{"毒素抗性",45837,2},
				{"毒系",45837,1},
				{"法术伤害降低",45848,2},
				{"法术伤害强化",45848,1},
				{"魔法恢复", 45835,1},
				{"魔耗缩减", 45835,2},
				{"闪电抗性",45840,2},
				{"闪电",45840,1},
				{"生命恢复",45834,1},
				{"生命减少",45834,2},
				{"虚弱",45843,2},
				{"强化攻击",45843,1},
				{"药剂强化",45846,1},
				{"药剂加速",45846,2},
				{"火焰抗性",45838,2},
				{"火焰",45838,1},
				{"物理伤害降低", 45847,2},
				{"物理伤害强化", 45847,1},
				{"耐力增强",45833,1},
				{"生命增强",45831,1},
				{"魔法增强",45832,1}
			},
			["match"] = --exact!!! The names of glyphs. The prefix (in English) So trifling glyph of magicka, for example
			{
				[1] = {"微不足道的", 45855},
				[2] = {"次等的",45856},
				[3] = {"琐碎的 ",45857},
				[4] = {"少量的",45806},
				[5] = {"一般的",45807},
				[6] = {"正常的",45808},
				[7] = {"正适的",45809},
				[8] = {"熟练的",45810},
				[9] = {"强力的",45811},
				[10]= {"优等的",45812},
				[11]= {"稀有的",45813},
				[12]= {"至高的",45814},
				[13]= {"究极的",45815},
				[14]= {"传说的",45816},
				[15]= {"真实优秀的",{68341,68340,},},
				[16]= {"上等的",{64509,64508,},},
				
			},
			["quality"] = 
			{
				{"普通",45850},
				{"优秀",45851},
				{"精良",45852},
				{"史诗",45853},
				{"传说",45854},
				{"", 45850} -- default, if nothing is mentioned. Default should be Ta.
			}
		},
	} 

	return craftInfo

end

function WritCreater.masterWritQuality() -- Vital . This is probably not necessary, but it stays for now because it works
	return {{"史诗",4},{"传说",5}}
end




function WritCreater.langEssenceNames() -- Vital

local essenceNames =  
	{
		[1] = "欧-科", --health
		[2] = "德尼", --stamina
		[3] = "玛克欧", --magicka
	}
	return essenceNames
end

function WritCreater.langPotencyNames() -- Vital
	--exact!! Also, these are all the positive runestones - no negatives needed.
	local potencyNames = 
	{
		[1] = "玖-拉", --Lowest potency stone lvl
		[2] = "珀拉-德",
		[3] = "颉-拉",
		[4] = "颉玖-拉",
		[5] = "欧达-拉",
		[6] = "珀玖-拉",
		[7] = "伊多-拉",
		[8] = "贾伊-拉",
		[9] = "珀-拉",
		[10]= "德纳-拉",
		[11]= "瑞-拉",
		[12]= "德拉-多",
		[13]= "瑞库-拉",
		[14]= "库拉",
		[15]= "瑞-颉-拉",
		[16]= "瑞-珀-拉", --v16 potency stone
		
	}
	return potencyNames
end

function WritCreater.questExceptions(condition)
	condition = string.gsub(condition, " "," ")
	return condition
end

function WritCreater.enchantExceptions(condition)

	condition = string.gsub(condition, " "," ")
	return condition
end


function WritCreater.langTutorial(i) 
	local t = {
		[5]="还有一些事情你应该知道。\n首先, /dailyreset 此命令会告诉你\n距离下一次服务器日常任务重置还有多久。",
		[4]="最后, 您也可以选择\n为每个专业停用或激活此插件。\n一般来说，所有可用制造都是默认开启的\n如果您想关闭其中的某些，请查看设置。",
		[3]="接下来，您需要选择当您使用工作台的时候\n是否希望看到此窗口。\n此窗口会告诉你完成令状需要多少材料, 以及你现在有多少。",
		[2]="要选择的第一个设置是\n您是否想使用自动制造。\n如果开启, 当您打开工作台时, 插件将自动开始制造。",
		[1]="欢迎使用懒人令状!\n首先，您应该选择几个设置。\n 您可以随时从设置菜单更改设置。",
	}
	return t[i]
end

function WritCreater.langTutorialButton(i,onOrOff) -- sentimental and short please. These must fit on a small button
	local tOn = 
	{
		[1]="使用默认",
		[2]="开",
		[3]="显示",
		[4]="继续",
		[5]="完成",
	}
	local tOff=
	{
		[1]="继续",
		[2]="关",
		[3]="不显示",
	}
	if onOrOff then
		return tOn[i]
	else
		return tOff[i]
	end
end

function WritCreater.langStationNames()
	return
	{["锻造工作台"] = 1, ["制衣工作台"] = 2, ["附魔工作台"] = 3,["炼金实验台"] = 4, ["烹饪料理处"] = 5, ["木工工作台"] = 6, ["首饰工作台"] = 7,
	["锻造工作台<Blacksmithing Station>"] = 1, ["制衣工作台<Clothing Station>"] = 2, ["附魔工作台<Enchanting Table>"] = 3,["炼金实验台<Alchemy Station>"] = 4, 
	["烹饪料理处<Cooking Fire>"] = 5, ["木工工作台<Woodworking Station>"] = 6, ["首饰工作台<Jewelry Crafting Station>"] = 7,  }
end








local function runeMissingFunction(ta,essence,potency)
	local missing = {}
	if not ta["bag"] then
		missing[#missing + 1] = "|r塔|cf60000"
	end
	if not essence["bag"] then
		missing[#missing + 1] =  "|cffcc66"..essence["slot"].."|cf60000"
	end
	if not potency["bag"] then
		missing[#missing + 1] = "|c0066ff"..potency["slot"].."|r"
	end
	local text = ""
	for i = 1, #missing do
		if i ==1 then
			text = "|cff3333附魔无法制造。你缺少 "..proper(missing[i])
		else
			text = text.." 和 "..proper(missing[i])
		end
	end
	return text
end


local function dailyResetFunction(till, stamp) -- You can translate the following simple version instead.
										-- function (till) d(zo_strformat("<<1>> hours and <<2>> minutes until the daily reset.",till["hour"],till["minute"])) end,
	if till["hour"]==0 then
		if till["minute"]==1 then
			return "还有 1 分钟后日常重置!"
		elseif till["minute"]==0 then
			if stamp==1 then
				return "日常重置还剩 "..stamp.." 秒!"
			else
				return "真的... 别问了。你真有那么着急么??? 它会在一秒内重置! *哼~哼*"
			end
		else
			return till["minute"].." 分钟后日常将重置!"
		end		
	else
		return till["hour"].." 小时 "..till["minute"].." 分钟 后日常重置"
	end 
end

local function masterWritEnchantToCraft (pat,set,trait,style,qual,mat,writName,Mname,generalName)
	local partialString = zo_strformat("制造一个 CP150 <<t:6>> <<t:1>> 带有 <<t:2>> 套装，<<t:3>> 特性， <<t:4>> 风格以及 <<t:5>> 品质等属性",pat,set,trait,style,qual,mat)
	return zo_strformat("<<t:2>> <<t:3>> <<t:4>>: <<1>>",partialString,writName,Mname,generalName )
end

WritCreater.missingTranslations = {}
local stringIndexTable = {}
local findMissingTranslationsMetatable = 
{
["__newindex"] = function(t,k,v) if not stringIndexTable[tostring(t)] then stringIndexTable[tostring(t)] = {} end stringIndexTable[tostring(t)][k] = v WritCreater.missingTranslations[k] = {k, v} end,
["__index"] = function(t, k) return stringIndexTable[tostring(t)][k] end,
}
WritCreater.strings = {}
setmetatable(WritCreater.strings, findMissingTranslationsMetatable)

WritCreater.strings["runeReq"] 					= function (essence, potency) return zo_strformat("|c2dff00制造需要 1个 |r塔|c2dff00, 1个 |cffcc66<<1>>|c2dff00 和 1个 |c0066ff<<2>>|r", essence, potency) end
WritCreater.strings["runeMissing"] 				= runeMissingFunction 
WritCreater.strings["notEnoughSkill"]				= "你没有足够的制造技能来制造所需的装备"
WritCreater.strings["smithingMissing"] 			= "\n|cf60000你没有足够的材料|r"
WritCreater.strings["craftAnyway"] 				= "先制造再说"
WritCreater.strings["smithingEnough"] 				= "\n|c2dff00你的材料充足|r"
WritCreater.strings["craft"] 						= "|c00ff00制造|r"
WritCreater.strings["crafting"] 					= "|c00ff00制造中...|r"
WritCreater.strings["craftIncomplete"] 			= "|cf60000制造可能无法完成。\n你需要更多材料。|r"
WritCreater.strings["moreStyle"] 					= "|cf60000您没有任何可用的风格材料。\n检查你的物品栏, 成就, 和设置。|r"
WritCreater.strings["moreStyleSettings"]			= "|cf60000您没有任何可用的风格材料。\n您可能需要在设置菜单中允许更多|r"
WritCreater.strings["moreStyleKnowledge"]			= "|cf60000您没有任何可用的风格材料。\n您可能需要学习更多的风格|r"
WritCreater.strings["dailyreset"] 					= dailyResetFunction
WritCreater.strings["complete"] 					= "|c00FF00令状完成|r"
WritCreater.strings["craftingstopped"]				= "制造终止。请检查以确保插件正在制作正确的物品。"
WritCreater.strings["smithingReqM"] 				= function (amount, type, more) return zo_strformat( "制造将使用 <<1>> <<2>> (|cf60000你需要 <<3>>|r)" ,amount, type, more) end
WritCreater.strings["smithingReq"] 				= function (amount,type, current) return zo_strformat( "制造将使用 <<1>> <<2>> (|c2dff00<<3>> 可用|r)"  ,amount, type, current) end
WritCreater.strings["lootReceived"]				= "<<3>> <<1>> 被收到 (你有 <<2>>)"
WritCreater.strings["lootReceivedM"]				= "<<1>> 被收到 "
WritCreater.strings["countSurveys"]				= "你有 <<1>> 调查报告"
WritCreater.strings["countVouchers"]				= "你有 <<1>> 未获得的大师令券"
WritCreater.strings["includesStorage"]				= function(type) local a= {"调查报告", "大师令状"} a = a[type] return zo_strformat("包括 <<1>> 房屋储存", a) end
WritCreater.strings["surveys"]						= "制造调查报告"
WritCreater.strings["sealedWrits"]					= "密封的状令"
WritCreater.strings["masterWritEnchantToCraft"]	= function(lvl, type, quality, writCraft, writName, generalName) 
											return zo_strformat("<<t:4>> <<t:5>> <<t:6>>: 正在制造一个 <<t:2>> 等级 <<t:3>> 类型的 <<t:1>> 附魔",lvl, type, quality,
												writCraft,writName, generalName) end
WritCreater.strings["masterWritSmithToCraft"]		= masterWritEnchantToCraft
WritCreater.strings["withdrawItem"]				= function(amount, link, remaining) return "懒人令状插件 取出了 "..amount.." "..link.."。(银行剩余"..remaining..")" end  -- in Bank for German
WritCreater.strings['fullBag']						= "你没有足够的背包空间。请清理你的背包。"
WritCreater.strings['masterWritSave']				= "懒人令状插件 阻止了你意外接受一个大师令状! 设置菜单以禁用此选项。"
WritCreater.strings['missingLibraries']			= "懒人令状插件 需要以下运行库。请下载、安装或打开这些运行库: "
WritCreater.strings['resetWarningMessageText']		= "日常状令将在 <<1>> 小时 <<2>> 分钟 后刷新\n您可以在设置中自定义或关闭此警告"
WritCreater.strings['resetWarningExampleText']		= "警告将是这样"




WritCreater.optionStrings = {}
WritCreater.optionStrings.nowEditing                   = "你正在更改 %s 设置"
WritCreater.optionStrings.accountWide                  = "账户全局"
WritCreater.optionStrings.characterSpecific            = "角色独立"
WritCreater.optionStrings.useCharacterSettings         = "使用角色设置" -- de
WritCreater.optionStrings.useCharacterSettingsTooltip  = "仅对该角色使用独立于其他角色的设置" --de
WritCreater.optionStrings["style tooltip"]								= function (styleName, styleStone) return zo_strformat("允许 <<1>> 风格, 将使用 <<2>> 风格材料用于制造",styleName, styleStone) end 
WritCreater.optionStrings["show craft window"]							= "显示制造窗口"
WritCreater.optionStrings["show craft window tooltip"]					= "当制造工作台打开时显示制造窗口"
WritCreater.optionStrings["autocraft"]									= "自动制造"
WritCreater.optionStrings["autocraft tooltip"]							= "选择此选项将使插件在进入一个工作台后立即开始制造。如果选择不显示窗口, 此功能会被打开."
WritCreater.optionStrings["blackmithing"]								= "锻造"
WritCreater.optionStrings["blacksmithing tooltip"]						= "为锻造打开此插件"
WritCreater.optionStrings["clothing"]									= "制衣"
WritCreater.optionStrings["clothing tooltip"]							= "为制衣打开此插件"
WritCreater.optionStrings["enchanting"]									= "附魔"
WritCreater.optionStrings["enchanting tooltip"]							= "为附魔打开此插件"
WritCreater.optionStrings["alchemy"]									= "炼金"
WritCreater.optionStrings["alchemy tooltip"]							= "为炼金打开此插件(只开启取出银行功能)"
WritCreater.optionStrings["provisioning"]								= "烹饪"
WritCreater.optionStrings["provisioning tooltip"]						= "为烹饪打开此插件(只开启取出银行功能)"
WritCreater.optionStrings["woodworking"]								= "木工"
WritCreater.optionStrings["woodworking tooltip"]						= "为木工打开此插件"
WritCreater.optionStrings["jewelry crafting"]							= "首饰制造"
WritCreater.optionStrings["jewelry crafting tooltip"]					= "为首饰制造打开此插件"
WritCreater.optionStrings["writ grabbing"]								= "取出令状物品"
WritCreater.optionStrings["writ grabbing tooltip"]						= "从银行获取令状所需的物品 (例如 奈恩根, 塔, 之类的)"
WritCreater.optionStrings["style stone menu"]							= "使用风格材料"
WritCreater.optionStrings["style stone menu tooltip"]					= "选择插件将使用哪些风格材料"
WritCreater.optionStrings["send data"]									= "发送令状数据"
WritCreater.optionStrings["send data tooltip"]							= "发送你从令状盒子中收到的奖励信息。不会发送其他信息。"
WritCreater.optionStrings["exit when done"]								= "退出制造窗口"
WritCreater.optionStrings["exit when done tooltip"]						= "完成所有的制造后退出制造窗口"
WritCreater.optionStrings["automatic complete"]							= "自动任务对话框"
WritCreater.optionStrings["automatic complete tooltip"]					= "在需要的地方自动接受和完成任务"
WritCreater.optionStrings["new container"]								= "保持新状态"
WritCreater.optionStrings["new container tooltip"]						= "保持令状奖励容器的新状态"
WritCreater.optionStrings["master"]										= "大师令状"
WritCreater.optionStrings["master tooltip"]								= "如果开启，插件会制造你已激活的大师令状"
WritCreater.optionStrings["right click to craft"]						= "右击制作"
WritCreater.optionStrings["right click to craft tooltip"]				= "如果开启，右键点击一个密封的令状后，插件将制作你制定的大师令状。需要打开LibCustomMenu插件。"
WritCreater.optionStrings["crafting submenu"]							= "为交易而制造"
WritCreater.optionStrings["crafting submenu tooltip"]					= "为特殊制造关闭插件"
WritCreater.optionStrings["timesavers submenu"]							= "节省时间"
WritCreater.optionStrings["timesavers submenu tooltip"]					= "各种节省时间的小功能"
WritCreater.optionStrings["loot container"]								= "收到容器时打开"
WritCreater.optionStrings["loot container tooltip"]						= "当收到令状奖励容器时打开他们"
WritCreater.optionStrings["master writ saver"]							= "保存大师令状"
WritCreater.optionStrings["master writ saver tooltip"]					= "防止大师令状被接受"
WritCreater.optionStrings["loot output"]								= "高价奖励提醒"
WritCreater.optionStrings["loot output tooltip"]						= "当从令状奖励中收到有价值的物品时，输出一条消息"
WritCreater.optionStrings["autoloot behaviour"]							= "自动开箱行为" -- Note that the following three come early in the settings menu, but becuse they were changed
WritCreater.optionStrings["autoloot behaviour tooltip"]					= "选择什么时候插件将自动开启令状奖励容器" -- they are now down below (with untranslated stuff)
WritCreater.optionStrings["autoloot behaviour choices"]					= {"复制游戏设置下的设置", "自动开箱", "不要自动开箱"}
WritCreater.optionStrings["hide when done"]								= "完成时隐藏"
WritCreater.optionStrings["hide when done tooltip"]						= "所有项目都已制作完成时，隐藏插件窗口"
WritCreater.optionStrings['reticleColour']								= "改变光标颜色"
WritCreater.optionStrings['reticleColourTooltip']						= "如果你在工作台有未完成或已完成的令状，改变光标颜色"
WritCreater.optionStrings['autoCloseBank']								= "自动银行对话框"
WritCreater.optionStrings['autoCloseBankTooltip']						= "如有要取出的物品，则自动进入和退出银行对话框"
WritCreater.optionStrings['despawnBanker']							= "解散银行助手"
WritCreater.optionStrings['despawnBankerTooltip']					= "取出物品后自动解散银行助手"
WritCreater.optionStrings['dailyResetWarnTime']								= "距重置剩余分钟"
WritCreater.optionStrings['dailyResetWarnTimeTooltip']						= "在日常任务重置前多少分钟显示警告"
WritCreater.optionStrings['dailyResetWarnType']							= "日常重置提醒"
WritCreater.optionStrings['dailyResetWarnTypeTooltip']					= "当每日重置即将发生时，应该显示哪种类型的警告"
WritCreater.optionStrings['dailyResetWarnTypeChoices']					={ "无","类型 1", "类型 2", "类型 3", "类型 4", "全部"}
WritCreater.optionStrings['stealingProtection']							= "偷窃保护"
WritCreater.optionStrings['stealingProtectionTooltip']					= "当您的任务日志中有令状任务时，防止您误操作导致偷窃"
WritCreater.optionStrings['noDELETEConfirmJewelry']						= "简单首饰销毁"
WritCreater.optionStrings['noDELETEConfirmJewelryTooltip']				= "在删除首饰对话框中自动输入'DELETE'文本来销毁首饰令状"
WritCreater.optionStrings['suppressQuestAnnouncements']					= "隐藏令状任务公告"
WritCreater.optionStrings['suppressQuestAnnouncementsTooltip']			= "当你接下令状任务和制造令状物品时，隐藏屏幕中央的公告文本"
WritCreater.optionStrings["questBuffer"]								= "令状任务缓冲区"
WritCreater.optionStrings["questBufferTooltip"]							= "保留一个任务缓冲区，这样就可以保障你有空间去接令状任务"
WritCreater.optionStrings["craftMultiplier"]							= "批量制造器"
WritCreater.optionStrings["craftMultiplierTooltip"]						= "制作多份所需物品以便下次出现相同令状的时候，你不需要再次制造。注意: 每增加1个以上，节省大约37个栏位"
WritCreater.optionStrings['hireling behaviour']							= "雇佣邮件动作"
WritCreater.optionStrings['hireling behaviour tooltip']					= "如何处理雇佣邮件"
WritCreater.optionStrings['hireling behaviour choices']					= { "无处理","拿取并删除", "仅拿取"}


WritCreater.optionStrings["allReward"]									= "所有制造"
WritCreater.optionStrings["allRewardTooltip"]							= "对所有制造类所采取的动作"

WritCreater.optionStrings['sameForALlCrafts']							= "对所有使用相同选项"
WritCreater.optionStrings['sameForALlCraftsTooltip']					= "对所有制造类使用与此类奖励相同的选项"
WritCreater.optionStrings['1Reward']									= "锻造"
WritCreater.optionStrings['2Reward']									= "对所有使用"
WritCreater.optionStrings['3Reward']									= "对所有使用"
WritCreater.optionStrings['4Reward']									= "对所有使用"
WritCreater.optionStrings['5Reward']									= "对所有使用"
WritCreater.optionStrings['6Reward']									= "对所有使用"
WritCreater.optionStrings['7Reward']									= "对所有使用"

WritCreater.optionStrings["matsReward"]									= "材料奖励"
WritCreater.optionStrings["matsRewardTooltip"]							= "如何处理制造材料奖励"
WritCreater.optionStrings["surveyReward"]								= "调查报告奖励"
WritCreater.optionStrings["surveyRewardTooltip"]						= "如何处理调查报告奖励"
WritCreater.optionStrings["masterReward"]								= "大师令状奖励"
WritCreater.optionStrings["masterRewardTooltip"]						= "如何处理大师令状奖励"
WritCreater.optionStrings["repairReward"]								= "修理箱奖励"
WritCreater.optionStrings["repairRewardTooltip"]						= "如何处理修理箱奖励"
WritCreater.optionStrings["ornateReward"]								= "绚丽装饰装备奖励"
WritCreater.optionStrings["ornateRewardTooltip"]						= "如何处理绚丽装饰装备奖励"
WritCreater.optionStrings["intricateReward"]							= "错综深奥装备奖励"
WritCreater.optionStrings["intricateRewardTooltip"]						= "如何处理错综深奥装备奖励"
WritCreater.optionStrings["soulGemReward"]								= "空灵魂石"
WritCreater.optionStrings["soulGemTooltip"]								= "如何处理空灵魂石"
WritCreater.optionStrings["glyphReward"]								= "附魔"
WritCreater.optionStrings["glyphRewardTooltip"]							= "如何处理附魔"
WritCreater.optionStrings["recipeReward"]								= "食谱"
WritCreater.optionStrings["recipeRewardTooltip"]						= "如何处理食谱"
WritCreater.optionStrings["fragmentReward"]								= "塞伊克碎片"
WritCreater.optionStrings["fragmentRewardTooltip"]						= "如何处理塞伊克碎片"


WritCreater.optionStrings["writRewards submenu"]						= "令状奖励处理"
WritCreater.optionStrings["writRewards submenu tooltip"]				= "怎么处理所有来自令状的奖励"

WritCreater.optionStrings["jubilee"]									= "打开周年纪念盒子"
WritCreater.optionStrings["jubilee tooltip"]							= "自动打开周年纪念盒子"
WritCreater.optionStrings["skin"]										= "令状助手皮肤"
WritCreater.optionStrings["skinTooltip"]								= "令状助手UI皮肤"
WritCreater.optionStrings["skinOptions"]								= {"默认", "奶酪化"}

WritCreater.optionStrings["rewardChoices"]								= {"无","存入银行","垃圾", "摧毁"}
WritCreater.optionStrings["scan for unopened"]							= "登录时打开容器"
WritCreater.optionStrings["scan for unopened tooltip"]					= "当您登录时，扫描背包中未打开的令状容器，并试图打开它们"

ZO_CreateStringId("SI_BINDING_NAME_WRIT_CRAFTER_CRAFT_ITEMS", "制造物品")
ZO_CreateStringId("SI_BINDING_NAME_WRIT_CRAFTER_OPEN", "显示令状制造器统计窗口")

function WritCreater.langWritRewardBoxes () return {
	[CRAFTING_TYPE_ALCHEMY] = "炼金师奖励器皿",
	[CRAFTING_TYPE_ENCHANTING] = "附魔师奖励箱",
	[CRAFTING_TYPE_PROVISIONING] = "烹饪师奖励包裹",
	[CRAFTING_TYPE_BLACKSMITHING] = "锻造师奖励箱",
	[CRAFTING_TYPE_CLOTHIER] = "制衣师奖励包裹",
	[CRAFTING_TYPE_WOODWORKING] = "木工师奖励箱",
	[CRAFTING_TYPE_JEWELRYCRAFTING] = "首饰制作师奖励箱",
	[8] = "箱",
}
end


function WritCreater.getTaString()
	return "塔"
end

WritCreater.optionStrings["alternate universe"] = "关闭愚人玩笑"
WritCreater.optionStrings["alternate universe tooltip"] = "关闭制造，制造站和其他交互的改名功能。(这个功能是个作者做的彩蛋，愚人节随机改制作台和材料的名字，已经从程序里关闭了，太无聊……)"

WritCreater.lang = "zh"
WritCreater.langIsMasterWritSupported = true

--[[
SLASH_COMMANDS['/opencontainers'] = function()local a=WritCreater.langWritRewardBoxes() for i=1,200 do for j=1,6 do if a[j]==GetItemName(1,i) then if IsProtectedFunction("endUseItem") then
	CallSecureProtected("endUseItem",1,i)
else
	UseItem(1,i)
end end end end end]]
