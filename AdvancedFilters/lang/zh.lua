local util = AdvancedFilters.util

local afPrefix = "|cFF0000[AdvancedFilters%s]|r"
local afPrefixNormal    = string.format(afPrefix, "")
local afPrefixError     = string.format(afPrefix, " ERROR")

local strings = {
    --SHARED
    None = util.Localize(SI_ARMORTYPE0),
    All = util.Localize(SI_ITEMFILTERTYPE0),
    Trophy = util.Localize(SI_ITEMTYPE5),
    TreasureMaps = util.Localize(SI_SPECIALIZEDITEMTYPE100),
    SurveyReport = util.Localize(SI_SPECIALIZEDITEMTYPE101),
    KeyFragment = util.Localize(SI_SPECIALIZEDITEMTYPE102),
    MuseumPiece = util.Localize(SI_SPECIALIZEDITEMTYPE103),
    RecipeFragment = util.Localize(SI_SPECIALIZEDITEMTYPE104),
    Scroll = util.Localize(SI_SPECIALIZEDITEMTYPE105),
    CollectibleFragment = util.Localize(SI_SPECIALIZEDITEMTYPE109),
    Key = util.Localize(SI_SPECIALIZEDITEMTYPE107),
    MaterialUpgrader = util.Localize(SI_SPECIALIZEDITEMTYPE106),
    RuneboxFragment = util.Localize(SI_SPECIALIZEDITEMTYPE108),
    Toy = util.Localize(SI_SPECIALIZEDITEMTYPE111),
    UpgradeFragment = util.Localize(SI_SPECIALIZEDITEMTYPE110),
    Fish = util.Localize(SI_ITEMTYPE54),
    RareFish = util.Localize(SI_SPECIALIZEDITEMTYPE80),
    Treasure = util.Localize(SI_SPECIALIZEDITEMTYPE2550),
    
    --WEAPON
    OneHand = util.Localize(SI_GAMEPADWEAPONCATEGORY1),
    TwoHand = util.Localize(SI_GAMEPADWEAPONCATEGORY2),
    Bow = util.Localize(SI_WEAPONTYPE8),
    DestructionStaff = util.Localize(SI_GAMEPADWEAPONCATEGORY4),
    HealStaff = util.Localize(SI_WEAPONTYPE9),

    Axe = util.Localize(SI_WEAPONTYPE1),
    Sword = util.Localize(SI_WEAPONTYPE3),
    Hammer = util.Localize(SI_WEAPONTYPE2),
    TwoHandAxe = "双手 "..util.Localize(SI_WEAPONTYPE1),
    TwoHandSword = "双手 "..util.Localize(SI_WEAPONTYPE3),
    TwoHandHammer = "双手 "..util.Localize(SI_WEAPONTYPE2),
    Dagger = util.Localize(SI_WEAPONTYPE11),
    Fire = util.Localize(SI_WEAPONTYPE12),
    Frost = util.Localize(SI_WEAPONTYPE13),
    Lightning = util.Localize(SI_WEAPONTYPE15),

    --ARMOR
    Heavy = util.Localize(SI_ARMORTYPE3),
    Medium = util.Localize(SI_ARMORTYPE2),
    LightArmor = util.Localize(SI_ARMORTYPE1),
    Clothing = util.Localize(SI_VISUALARMORTYPE5),
    Shield = util.Localize(SI_WEAPONTYPE14),
    Jewelry = util.Localize(SI_GAMEPADITEMCATEGORY38),

    Head = util.Localize(SI_EQUIPSLOT0), --"头甲",
    Chest = util.Localize(SI_EQUIPTYPE3), --"胸甲",
    Shoulders = util.Localize(SI_EQUIPTYPE4), --"肩甲",
    Hand = util.Localize(SI_EQUIPTYPE13), --"手甲",
    Waist = util.Localize(SI_EQUIPTYPE8), --"腰甲",
    Legs = util.Localize(SI_EQUIPTYPE9), --"腿甲",
    Feet = util.Localize(SI_EQUIPTYPE10), --"足甲",
    Ring = util.Localize(SI_EQUIPTYPE12), --"戒指",
    Neck = util.Localize(SI_EQUIPSLOT1), --"项链",

    --Jewelry
    Arcane  = util.Localize(SI_ITEMTRAITTYPE22),
    Bloodthirsty  = util.Localize(SI_ITEMTRAITTYPE31),
    Harmony  = util.Localize(SI_ITEMTRAITTYPE29),
    Healthy  = util.Localize(SI_ITEMTRAITTYPE21),
    Infused  = util.Localize(SI_ITEMTRAITTYPE33),
    Intricate  = util.Localize(SI_ITEMTRAITTYPE27),
    Ornate  = util.Localize(SI_ITEMTRAITTYPE24),
    Robust  = util.Localize(SI_ITEMTRAITTYPE23),
    Swift  = util.Localize(SI_ITEMTRAITTYPE28),
    Triune = util.Localize(SI_ITEMTRAITTYPE30),
    Protective = util.Localize(SI_ITEMTRAITTYPE32),

    --Companion traits
    Aggressive = util.Localize(SI_ITEMTRAITTYPE47),
    Augmented = util.Localize(SI_ITEMTRAITTYPE49),
    Bolstered = util.Localize(SI_ITEMTRAITTYPE50),
    Focused = util.Localize(SI_ITEMTRAITTYPE45),
    Prolific = util.Localize(SI_ITEMTRAITTYPE44),
    Quickened = util.Localize(SI_ITEMTRAITTYPE43),
    Shattering = util.Localize(SI_ITEMTRAITTYPE46),
    Soothing = util.Localize(SI_ITEMTRAITTYPE48),
    Vigorous = util.Localize(SI_ITEMTRAITTYPE51),

    --CONSUMABLES
    Crown = util.Localize(SI_ITEMTYPE57),
    Food = util.Localize(SI_ITEMTYPE4),
    Drink = util.Localize(SI_ITEMTYPE12),
    Recipe = util.Localize(SI_ITEMTYPE29),
    Potion = util.Localize(SI_ITEMTYPE7),
    Poison = util.Localize(SI_ITEMTYPE30),
    Motif = util.Localize(SI_ITEMTYPE8),
    Writ = util.Localize(SI_ITEMTYPE60),
    Container = util.Localize(SI_ITEMTYPE18),
    Repair = util.Localize(SI_STORE_MODE_REPAIR),

    --MATERIALS
    Blacksmithing = util.Localize(SI_GAMEPADITEMCATEGORY4), --"锻造",
    Clothier = util.Localize(SI_GAMEPADITEMCATEGORY7), --"制衣",
    Woodworking = util.Localize(SI_GAMEPADITEMCATEGORY33), --"木工",
    Alchemy = util.Localize(SI_ITEMFILTERTYPE16), --"炼金",
    Enchanting = util.Localize(SI_GAMEPADITEMCATEGORY11), --"附魔",
    Provisioning = util.Localize(SI_GAMEPADITEMCATEGORY19), --"烹饪",
    Style = util.Localize(SI_ITEMTYPE44),
    WeaponTrait = util.Localize(SI_ITEMTYPE46),
    ArmorTrait = util.Localize(SI_ITEMTYPE45),
    AllTraits = util.Localize(SI_ITEMFILTERTYPE20),
    FurnishingMat = util.Localize(SI_ITEMTYPE62),

    Reagent = util.Localize(SI_ITEMTYPE31),
    Water = util.Localize(SI_ITEMTYPE33),
    Oil = util.Localize(SI_ITEMTYPE58),
    Aspect = util.Localize(SI_ENCHANTINGRUNECLASSIFICATION1),
    Essence = util.Localize(SI_ENCHANTINGRUNECLASSIFICATION2),
    Potency = util.Localize(SI_ENCHANTINGRUNECLASSIFICATION3),
    FoodIngredient = zo_strformat("<<1>> - <<2>>", GetString("SI_ITEMTYPE", ITEMTYPE_INGREDIENT), GetString("SI_ITEMTYPE", ITEMTYPE_FOOD)),
    DrinkIngredient = zo_strformat("<<1>> - <<2>>", GetString("SI_ITEMTYPE", ITEMTYPE_INGREDIENT), GetString("SI_ITEMTYPE", ITEMTYPE_DRINK)),
    OldIngredient = zo_strformat("<<1>> - <<2>>", GetString("SI_ITEMTYPE", ITEMTYPE_INGREDIENT), GetString("SI_ITEMTYPE", ITEMTYPE_NONE)),
    RareIngredient = util.Localize(SI_SPECIALIZEDITEMTYPE48),

    --FURNISHINGS
    CraftingStation = util.Localize(SI_SPECIALIZEDITEMTYPE213),
    Light = util.Localize(SI_SPECIALIZEDITEMTYPE211),
    Ornamental = util.Localize(SI_SPECIALIZEDITEMTYPE210),
    Seating = util.Localize(SI_SPECIALIZEDITEMTYPE212),
    TargetDummy = util.Localize(SI_SPECIALIZEDITEMTYPE214),
    Furnishings = util.Localize(SI_ITEMFILTERTYPE21),

    --MISCELLANEOUS
    Runes = util.Localize(SI_WEAPONMODELTYPE11),
    Glyphs = util.Localize(SI_GAMEPADITEMCATEGORY13),
    ArmorGlyph = util.Localize(SI_ITEMTYPE21),
    JewelryGlyph = util.Localize(SI_ITEMTYPE26),
    WeaponGlyph = util.Localize(SI_ITEMTYPE20),

    SoulGem = util.Localize(SI_ITEMTYPE19),
    Siege = util.Localize(SI_ITEMTYPE6),
    Bait = util.Localize(SI_GAMEPADITEMCATEGORY3), --鱼饵",
    Tool = util.Localize(SI_ITEMTYPE9),
    Fence = util.Localize(SI_INVENTORY_STOLEN_ITEM_TOOLTIP),
    Trash = util.Localize(SI_ITEMTYPE48),

    --Vanity = "Vanity",
    Costume = util.Localize(SI_ITEMTYPE13),
    Disguise = util.Localize(SI_ITEMTYPE14),
    Tabard = util.Localize(SI_ITEMTYPE15),

    --JUNK
    Weapon = util.Localize(SI_ITEMFILTERTYPE1),
    Armor = util.Localize(SI_ITEM_FORMAT_STR_ARMOR), -- 护甲
    Apparel = util.Localize(SI_ITEMFILTERTYPE2),
    Consumable = util.Localize(SI_ITEMFILTERTYPE3),
    Materials = util.Localize(SI_ITEMFILTERTYPE4),
    Miscellaneous = util.Localize(SI_ITEMFILTERTYPE5),

    --DROPDOWN CONTEXT MENU
    ResetToAll = "\'全部\'重置",
    InvertDropdownFilter = "反转过滤器: %s",

    --CRAFT BAG
    --BLACKSMITHING
    RawMaterialSmithing = util.Localize(SI_ITEMTYPE17),
    RefinedMaterialSmithing = util.Localize(SI_ITEMTYPE36),
    Temper = util.Localize(SI_ITEMTYPE41),
    RawTemper = util.Localize(SI_ITEMTYPE17),

    --Clothier
    RawMaterialClothier = util.Localize(SI_ITEMTYPE17),
    RefinedMaterialClothier = util.Localize(SI_ITEMTYPE36),

    --Woodworking
    RawMaterialWoodworking = util.Localize(SI_ITEMTYPE17),
    RefinedMaterialWoodworking = util.Localize(SI_ITEMTYPE36),

    --Jewelry Crafting
    JewelryCrafting = util.Localize(SI_ITEMFILTERTYPE24),
    Plating = util.Localize(SI_ITEMTYPE65),
    RawPlating = util.Localize(SI_ITEMTYPE67),
    JewelryAllTrait = util.Localize(SI_ITEMTYPE66),
    JewelryRawTrait = util.Localize(SI_ITEMTYPE68),
    JewelryRefinedTrait = util.Localize(SI_ITEMTYPE66),
    RefinedMaterialJewelry = util.Localize(SI_ITEMTYPE64),
    RawMaterialJewelry = util.Localize(SI_ITEMTYPE63),

    RawMaterialStyle = util.Localize(SI_ITEMTYPE17),

    --CLOTHING
    Resin = util.Localize(SI_ITEMTYPE42),

    --WOODWORKING
    Tannin = util.Localize(SI_ITEMTYPE43),

    --Transmutation
    Retrait = util.Localize(SI_RETRAIT_STATION_ITEM_TO_RETRAIT_HEADER),

    --Recall stones
    RecallStone = util.Localize(SI_ITEMTYPE69),

    --LAM settings menu
    lamDescription = "在物品栏中显示额外筛选按钮，以分隔项目类型",
    lamHideItemCount = "隐藏物品数",
    lamHideItemCountTT = "隐藏物品数量信息，只在物品栏底行显示在 \"(...)\" 中",
    lamHideItemCountColor = "物品数量颜色",
    lamHideItemCountColorTT = "设置物品栏底行显示的物品数量颜色",
    lamHideSubFilterLabel = "隐藏子筛选器标签",
    lamHideSubFilterLabelTT = "隐藏物品栏底行的子筛选器的描述标签（在子筛选器按钮左边）",
    lamGrayOutSubFiltersWithNoItems = "禁用无物品的子筛选器",
    lamGrayOutSubFiltersWithNoItemsTT = "禁用该项下没有符合条件物品的子筛选器按钮。",
    lamShowIconsInFilterDropdowns = "在下拉框中显示图标",
    lamShowIconsInFilterDropdownsTT = "在筛选器下拉框中显示筛选器条目的图标",
    lamRememberFilterDropdownsLastSelection = "记住最后一次筛选器下拉选择",
    lamRememberFilterDropdownsLastSelectionTT = "在每个子筛选器和筛选面板（物品栏，邮箱，制造台，...）记住最后一次筛选器下拉选择，当你再次回到此筛选面板和子筛选器时，自动恢复此筛选器下拉选项。\n当你登出或重载界面之后，此记忆将不会保存！",
    lamShowDropdownSelectedReminderAnimation = "最后一次筛选器下拉选择发光",
    lamShowDropdownSelectedReminderAnimationTT = "当你改变为一个子筛选器条时，使下拉框发光, 下拉框筛选器在哪里被选中且并不是显示\'".. util.Localize(SI_ITEMFILTERTYPE0) .. "\'条目",
    lamShowDropdownLastSelectedEntries = "显示筛选器下拉选择历史",
    lamShowDropdownLastSelectedEntriesTT = "右击筛选器下拉框，在标准内容菜单项下面显示最后10个曾选择过的下拉项列表。单击历史记录条目再次选择它 (如果当前子筛选器栏的下拉框在交叉子筛选器栏创建历史时提供了这个条目)!",
    lamHideCharBoundAtBankDeposit = "银行隐藏角色绑定物品",
    lamHideCharBoundAtBankDepositTT = "在银行存入标签隐藏角色绑定物品",
    lamShowFilterDropdownMenuOnRightMouse   = "|t150.000000%:150.000000%:EsoUI/Art/Miscellaneous/icon_RMB.dds|t: 在按钮显示下拉框筛选器",
    lamShowFilterDropdownMenuOnRightMouseTT = "显示如在当前子过滤器按钮处打开时相同的过滤器。\n\n|t100.000000%:100.000000%:EsoUI/Art/Miscellaneous/icon_RMB.dds|t: 显示普通插件过滤器菜单\nSHIFT键 + |t100.000000%:100.000000%:EsoUI/Art/Miscellaneous/icon_RMB.dds|t: 显示右键单击插件过滤器菜单",
    lamHeaderVisual = "可视化",
    lamHeaderFilterCategory = "筛选器分类",
    lamHeaderSubfilter = "子筛选器按钮",
    lamHeaderDropdownFilterbox = "筛选器下拉框",
    lamDebugOutput = "调试",
    lamDebugOutputTT = "在聊天/调试日志框UI中显示一些调试消息。",
    lamDebugSpamOutput = "调试刷屏",
    lamDebugSpamOutputTT = "注意: 此功能将用本插件的大量信息刷屏你的聊天/调试日志框UI。只有在被告知需要这样做时再启用此功能!",
    lamDebugSpamExcludeRefreshSubfilterBar = "排除刷新子筛选器栏",
    lamDebugSpamExcludeDropdownBoxFilters = "排除下拉框筛选器",

    --Error messages
    errorCheckChatPlease = afPrefixError .. " 请阅读聊天栏中的错误信息!",
    errorLibraryMissing      = afPrefixError .. " 所需运行库 \'%s\' 未加载。本插件不能正常工作!",
    errorWhatToDo1          = "!> 请回答以下4个问题并发送答案 (如给出也一并发送: 行中显示的变量, 从 -> 开始) 到AdvancedFilters插件的评论页面 @www.esoui.com:\nhttps://bit.ly/2lSbb2A",
    errorWhatToDo2          = "1) 你做了啥?\n2)你在哪做的?\n3)你是否测试过只开启AdvancedFilters插件和其所需运行库的情况下是否会有报错 (请测试!)?\n4)如果当其他插件开启时报错: 报错时你在使用其他哪个插件, 或者你是否能说出其他哪个插件引起了报错?",

    --Errors because of other addons
    errorOtherAddonsMulticraft = afPrefixError .. "其他插件打断了 \'" .. afPrefixNormal .. "\' -> 请禁用此插件: \'MultiCraft\'!",
    errorOtherAddonsMulticraftLong = "请禁用此插件 \'MultiCraft\'! 当此插件开启时 " .. afPrefixNormal .. " 无法工作。\'Multicraft\' 已经被Z社自己的多重制造界面取代了，所以你将不再需要此插件了!"
}

strings.Vanity = strings.Disguise

--QuickSlots
strings.BodyMarking = "纹身"
strings.JewelryPiercing  = strings.Jewelry
strings.HeadMarking = strings.Head
strings.Facial = "面部"
strings.Hair = "头发"
strings.Hat = "帽子"
strings.Skin = "皮肤"
strings.Polymorph = "变形"
strings.Personality = "个性"

local light = " (" .. util.Localize(SI_ARMORTYPE1) .. ")"
local medium = " (" .. util.Localize(SI_ARMORTYPE2) .. ")"
strings.Head_Light = strings.Head .. light
strings.Chest_Light = strings.Chest .. light
strings.Shoulders_Light = strings.Shoulders .. light
strings.Hand_Light = strings.Hand .. light
strings.Waist_Light = strings.Waist .. light
strings.Legs_Light = strings.Legs .. light
strings.Feet_Light = strings.Feet .. light
strings.Head_Medium = strings.Head .. medium
strings.Chest_Medium = strings.Chest .. medium
strings.Shoulders_Medium = strings.Shoulders .. medium
strings.Hand_Medium = strings.Hand .. medium
strings.Waist_Medium = strings.Waist .. medium
strings.Legs_Medium = strings.Legs .. medium
strings.Feet_Medium = strings.Feet .. medium
local ringStr = " (" .. strings.Ring .. ")"
strings.Arcane_Ring = strings.Arcane .. ringStr
strings.Bloodthirsty_Ring = strings.Bloodthirsty .. ringStr
strings.Harmony_Ring = strings.Harmony .. ringStr
strings.Healthy_Ring = strings.Healthy .. ringStr
strings.Infused_Ring = strings.Infused .. ringStr
strings.Intricate_Ring = strings.Intricate .. ringStr
strings.Ornate_Ring = strings.Ornate .. ringStr
strings.Robust_Ring = strings.Robust .. ringStr
strings.Swift_Ring = strings.Swift .. ringStr
strings.Triune_Ring = strings.Triune .. ringStr
strings.Protective_Ring = strings.Protective .. ringStr
strings.All_Ring = strings.All .. ringStr
strings.None_Ring = strings.None .. ringStr
--Companion
strings.Aggressive_Ring = strings.Aggressive ..ringStr
strings.Augmented_Ring = strings.Augmented ..ringStr
strings.Bolstered_Ring = strings.Bolstered ..ringStr
strings.Focused_Ring = strings.Focused ..ringStr
strings.Prolific_Ring = strings.Prolific ..ringStr
strings.Quickened_Ring = strings.Quickened ..ringStr
strings.Shattering_Ring = strings.Shattering ..ringStr
strings.Soothing_Ring = strings.Soothing ..ringStr
strings.Vigorous_Ring = strings.Vigorous ..ringStr

local neckStr = " (" .. strings.Neck .. ")"
strings.Arcane_Neck = strings.Arcane .. neckStr
strings.Bloodthirsty_Neck = strings.Bloodthirsty .. neckStr
strings.Harmony_Neck = strings.Harmony .. neckStr
strings.Healthy_Neck = strings.Healthy .. neckStr
strings.Infused_Neck = strings.Infused .. neckStr
strings.Intricate_Neck = strings.Intricate .. neckStr
strings.Ornate_Neck = strings.Ornate .. neckStr
strings.Robust_Neck = strings.Robust .. neckStr
strings.Swift_Neck = strings.Swift .. neckStr
strings.Triune_Neck = strings.Triune .. neckStr
strings.Protective_Neck = strings.Protective .. neckStr
strings.All_Neck = strings.All .. neckStr
strings.None_Neck = strings.None .. neckStr
--Companion
strings.Aggressive_Neck = strings.Aggressive ..neckStr
strings.Augmented_Neck = strings.Augmented ..neckStr
strings.Bolstered_Neck = strings.Bolstered ..neckStr
strings.Focused_Neck = strings.Focused ..neckStr
strings.Prolific_Neck = strings.Prolific ..neckStr
strings.Quickened_Neck = strings.Quickened ..neckStr
strings.Shattering_Neck = strings.Shattering ..neckStr
strings.Soothing_Neck = strings.Soothing ..neckStr
strings.Vigorous_Neck = strings.Vigorous ..neckStr

--AdvancedFilters Prefix
strings.AFPREFIX        = afPrefix
strings.AFPREFIXNORMAL  = afPrefixNormal
strings.AFPREFIXERROR   = afPrefixError

--Provide the EN texts globally and update the texts for the usage of the addon
AdvancedFilters.ENstrings = strings
AdvancedFilters.strings = strings