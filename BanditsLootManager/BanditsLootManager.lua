local ADDON_NAME,VERSION="BanditsLootManager",1.20
BanditsLootManagerInProgress=false		--API state global variable
local LMB,RMB="LMB","RMB"
local Characters={"Any","None"}
local CharacterName
local itemStyles={
	[ITEMSTYLE_RACIAL_BRETON]=true,
	[ITEMSTYLE_RACIAL_REDGUARD]=true,
	[ITEMSTYLE_RACIAL_ORC]=true,
	[ITEMSTYLE_RACIAL_DARK_ELF]=true,
	[ITEMSTYLE_RACIAL_NORD]=true,
	[ITEMSTYLE_RACIAL_ARGONIAN]=true,
	[ITEMSTYLE_RACIAL_HIGH_ELF]=true,
	[ITEMSTYLE_RACIAL_WOOD_ELF]=true,
	[ITEMSTYLE_RACIAL_KHAJIIT]=true,
	[ITEMSTYLE_AREA_ANCIENT_ELF]=true,
	[ITEMSTYLE_AREA_REACH]=true,
	[ITEMSTYLE_ENEMY_PRIMITIVE]=true,
	[ITEMSTYLE_ENEMY_DAEDRIC]=true,
	[ITEMSTYLE_RACIAL_IMPERIAL]=true,
}
local ignoreList={
	[56862]=true,	--Fortified Nirncrux
	[56863]=true,	--Potent Nirncrux
	[33235]=true,	--Wabbajack
	[29956]=true,	--Hunting Bow
	[54982]=true,	--Sentinel's Lash
	[54983]=true,	--Cadwell's Lost Robe
	[54984]=true,	--Er-Jaseen's Worn Jack
	[54985]=true,	--Unfinished Torment Cuirass
	[43757]=true,	--Wet Gunny Sack
	[71073]=true,	--AvA Stam
	[71071]=true,	--AvA Health
	[71072]=true,	--AvA Magicka
	[74728]=true,	--TG Stam/Stealth
	[74728]=true,	--TG Stam/Speed
	[27059] =true,	--Bervez Juice
	[26802] =true,	--Frost Mirriam
	[64222] =true,	--Caviar
}
local MonsterParts={
	[54382]="|H1:item:54382:177:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h",	--Carapace
	[54383]="|H1:item:54383:177:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h",	--Daedra Husk
	[54384]="|H1:item:54384:177:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h",	--Ectoplasm
	[54385]="|H1:item:54385:177:26:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h",	--Elemental Esssence
	[54381]="|H1:item:54381:177:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h",	--Foul Hide
	[54388]="|H1:item:54388:177:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h",	--Supple Root
}
local TreasureTypes={
["Cosmetics"]={icon="/esoui/art/icons/justice_stolen_bottle_001.dds", quest="Bursar"},
["Grooming Items"]={icon="/esoui/art/icons/justice_stolen_mirror_001.dds", quest="Bursar"},
["Dishes and Cookware"]={icon="/esoui/art/icons/justice_stolen_pan_001.dds", quest="Bursar"},
["Dolls"]={icon="/esoui/art/icons/justice_stolen_doll_002.dds", quest="Bursar"},
["Games"]={icon="/esoui/art/icons/justice_stolen_game_001.dds", quest="Bursar"},
["Children's Toys"]={icon="/esoui/art/icons/justice_stolen_toy_001.dds", quest="Bursar"},
["Drinkware"]={icon="/esoui/art/icons/justice_stolen_flask_001.dds"},
["Tools"]={icon="/esoui/art/icons/quest_equipment_001.dds"},
["Medical Supplies"]={icon="/esoui/art/icons/quest_potion_002.dds"},
["Musical Instruments"]={icon="/esoui/art/icons/justice_stolen_instrument_001.dds"},
["Magic Curiosities"]={icon="/esoui/art/icons/quest_glenumbra_006.dds"},
["Wall Décor"]={icon="/esoui/art/icons/justice_stolen_painting_001.dds"},
["Ritual Objects"]={icon="/esoui/art/icons/quest_shadowfen_tree_minders_headpiece.dds"},
["Statues"]={icon="/esoui/art/icons/justice_stolen_statue_001.dds"},
["Oddities"]={icon="/esoui/art/icons/quest_runestone_006.dds"},
["Scrivener Supplies"]={icon="/esoui/art/icons/justice_stolen_rope_001.dds"},
["Trifles and Ornaments"]={icon="/esoui/art/icons/justice_stolen_paperweight_001.dds"},
["Wardrobe Accessories"]={icon="/esoui/art/icons/justice_stolen_cloth_001.dds"},
["Devices"]={icon="/esoui/art/icons/justice_stolen_device_001.dds"},
["Utensils"]={icon="/esoui/art/icons/quest_jewelry_008.dds"},
["Fishing Supplies"]={icon="/esoui/art/icons/justice_stolen_net_001.dds"},
["Writings"]={icon="/esoui/art/icons/justice_stolen_letter_001.dds"},
["Smithing Equipment"]={icon="/esoui/art/icons/justice_stolen_minicleaver_base_03.dds"},
["Maps"]={icon="/esoui/art/icons/justice_stolen_map_001.dds"},
["Dry Goods"]={icon="/esoui/art/icons/justice_stolen_blanket_001.dds"},
["Lights"]={icon="/esoui/art/icons/justice_stolen_candle_001.dds"},
["Artwork"]={icon="/esoui/art/icons/justice_stolen_portrait_001.dds"},
["Furnishings"]={icon="/esoui/art/icons/justice_stolen_tent_001.dds"},
--["Furnishing Supplies"]={icon=""},
}
--	/script StartChatInput(GetItemLinkIcon(""))
function ScanTreasures()
	for _,data in pairs(SHARED_INVENTORY:GenerateFullSlotData(nil,BAG_BACKPACK)) do
		if data.itemType==ITEMTYPE_TREASURE then
			local itemLink=GetItemLink(BAG_BACKPACK,data.slotIndex)
			for i=1,GetItemLinkNumItemTags(itemLink) do
				local treasure_type=GetItemLinkItemTagInfo(itemLink,i)
				if treasure_type~="" and TreasureTypes[treasure_type]==nil then
					d(itemLink..": "..treasure_type)
--					StartChatInput(treasure_type)
				end
			end
		end
	end
end
local QuestItems={
	["Nibbles and Bits"]={[54382]=4,[54383]=5,[54381]=3},
	["Morsels and Pecks"]={[54385]=2,[54388]=3,[54384]=3},
	["Glitter and Gleam"]={[180]=3}
}
local Consumables={
	[33271]="|H1:item:33271:31:50:0:0:0:0:0:0:0:0:0:0:0:0:36:0:0:0:0:0|h|h",	--Soulgem
	[33265]="|H1:item:33265:30:50:0:0:0:0:0:0:0:0:0:0:0:0:36:0:0:0:0:0|h|h",	--Soulgem (empty)
	[30357]="|H1:item:30357:175:1:0:0:0:0:0:0:0:0:0:0:0:0:36:0:0:0:0:0|h|h",	--Lockpick
	[44879]="|H1:item:44879:121:50:0:0:0:0:0:0:0:0:0:0:0:0:36:0:0:0:0:0|h|h",	--Repair kit
	[27037]="|H1:item:27037:307:50:0:0:0:0:0:0:0:0:0:0:0:0:36:0:0:0:0:0|h|h",	--Essence of Magicka
	[27038]="|H1:item:27038:307:50:0:0:0:0:0:0:0:0:0:0:0:0:36:0:0:0:0:0|h|h",	--Essence of Stamina
	[27138]="|H1:item:27138:175:1:0:0:0:0:0:0:0:0:0:0:0:0:36:0:0:0:0:0|h|h",	--Keep Wall Repair kit
	[27962]="|H1:item:27962:175:1:0:0:0:0:0:0:0:0:0:0:0:0:36:0:0:0:0:0|h|h",	--Keep Door Repair Kit
	}
local AvAitems={
[SPECIALIZED_ITEMTYPE_SIEGE_BALLISTA]=true,
[SPECIALIZED_ITEMTYPE_SIEGE_BATTLE_STANDARD]=true,
[SPECIALIZED_ITEMTYPE_SIEGE_CATAPULT]=true,
[SPECIALIZED_ITEMTYPE_SIEGE_GRAVEYARD]=true,
[SPECIALIZED_ITEMTYPE_SIEGE_MONSTER]=true,
[SPECIALIZED_ITEMTYPE_SIEGE_OIL]=true,
[SPECIALIZED_ITEMTYPE_SIEGE_RAM]=true,
[SPECIALIZED_ITEMTYPE_SIEGE_TREBUCHET]=true,
[SPECIALIZED_ITEMTYPE_SIEGE_UNIVERSAL]=true,
[SPECIALIZED_ITEMTYPE_AVA_REPAIR]=true,
}
local Fragments={
--[SPECIALIZED_ITEMTYPE_TROPHY_KEY]=true,[SPECIALIZED_ITEMTYPE_TROPHY_KEY_FRAGMENT]=true,[SPECIALIZED_ITEMTYPE_TROPHY_MATERIAL_UPGRADER]=true,[SPECIALIZED_ITEMTYPE_TROPHY_RUNEBOX_FRAGMENT]=true,[SPECIALIZED_ITEMTYPE_TROPHY_RECIPE_FRAGMENT]=true,
[SPECIALIZED_ITEMTYPE_TROPHY_COLLECTIBLE_FRAGMENT]=true,
[SPECIALIZED_ITEMTYPE_TROPHY_UPGRADE_FRAGMENT]=true,
}
local IsCommonStyle={
	[0]=true,
	[ITEMSTYLE_RACIAL_BRETON]=true,
	[ITEMSTYLE_RACIAL_REDGUARD]=true,
	[ITEMSTYLE_RACIAL_ORC]=true,
	[ITEMSTYLE_RACIAL_DARK_ELF]=true,
	[ITEMSTYLE_RACIAL_NORD]=true,
	[ITEMSTYLE_RACIAL_ARGONIAN]=true,
	[ITEMSTYLE_RACIAL_HIGH_ELF]=true,
	[ITEMSTYLE_RACIAL_WOOD_ELF]=true,
	[ITEMSTYLE_RACIAL_KHAJIIT]=true,
	[ITEMSTYLE_AREA_ANCIENT_ELF]=true,
	[ITEMSTYLE_AREA_REACH]=true,
	[ITEMSTYLE_ENEMY_PRIMITIVE]=true,
	[ITEMSTYLE_ENEMY_DAEDRIC]=true,
	[ITEMSTYLE_RACIAL_IMPERIAL]=true,
}
local ItemQuality={
--	[ITEM_QUALITY_TRASH]="Trash",
	[ITEM_QUALITY_NORMAL]="Normal",
	[ITEM_QUALITY_MAGIC]="|c22EE22Green|r",
	[ITEM_QUALITY_ARCANE]="|c5555FFBlue|r",
	[ITEM_QUALITY_ARTIFACT]="|cEE22EEPurple|r",
	[ITEM_QUALITY_LEGENDARY]="|cEEEE33Gold|r",
}
local IsHihgMaterial={
	[64489]=true,	--Rubedite ingot
	[64504]=true,	--Ancestor Silk
	[64506]=true,	--Rubedo leather
	[64502]=true,	--Sanded ruby ash
	}
local Destroy={
	[42878]=true	--Used bait
	}
local Default={	--Base settings
--	World			=string.match(GetWorldName(),"%a+"),
	Sell			=false,
	Transfer		=false,
	Deposit		=false,
	Launder		=false,
	ChatOutput		=true,
	DetailedBank	=false,
	DetailedLoot	=false,
	RememberJunk	=true,
	--			Quality,	Price,	Destroy,	Junk,		ToBank,	FromBank,	Unmarked
	Gold			={nil,	10000,	nil,		nil,		false,	false},
	Telvar		={nil,	0,		nil,		nil,		false,	false},
	AP			={nil,	0,		nil,		nil,		false,	false},
	Voucher		={nil,	0,		nil,		nil,		false,	false},
	Consumables		={nil,	200,		nil,		nil,		false,	false,	false},
	--Items
	Items			={1,		0,		false,	false,	nil,		nil},
		TrashItems		=true,
--		MonsterParts	=false,
		RareStyleEquip	=false,
		SetItems		=false,
		Ornate		=false,
		Intricate		=false,
		FishingLure		=false,
	Stolen		={3,		10,		false,	false,	nil,		nil},
	Jewelry		={1,		0,		false,	false,	false,	nil},
	Glyph			={1,		nil,		false,	false,	false,	false},
	Fragments		={nil,	nil,		nil,		nil,		false,	false},
	Potions		={nil,	nil,		false,	false,	false,	false},
	Food			={1,		nil,		false,	false,	false,	false},
	Furnishing		={1,		nil,		nil,		false,	false,	false},
	--Materials
	LowMaterial		={nil,	nil,		nil,		false,	nil,		nil},
	Alchemy		={nil,	nil,		nil,		nil,		false,	false},
	Blacksmithing	={nil,	nil,		nil,		nil,		false,	false},
	Clothier		={nil,	nil,		nil,		nil,		false,	false},
	Woodworking		={nil,	nil,		nil,		nil,		false,	false},
	JewelryCrafting	={nil,	nil,		nil,		nil,		false,	false},
--	JewelryTrait	={nil,	nil,		nil,		nil,		false,	false},
	FurnishingCrafting={nil,	nil,		nil,		nil,		false,	false},
	StyleMaterial	={nil,	nil,		false,	nil,		false,	false},
	TraitMaterial	={nil,	nil,		false,	nil,		false,	false},
	CraftingBooster	={nil,	nil,		nil,		nil,		false,	false},
	Ingredient		={nil,	nil,		false,	nil,		false,	false},
	Rune			={nil,	nil,		false,	false,	false,	false},
	Aspect		={1,		nil,		false,	false,	false,	false},
	--Recieps
	StyleKnown		={3,		"None",	false,	nil,		false,	false},
	StyleUnknown	={nil,	"None",	nil,		nil,		false,	false},
	RecipeKnown		={2,		"None",	false,	false,	false,	false},
	RecipeUnknown	={nil,	"None",	nil,		nil,		false,	false},
	SchemeKnown		={2,		"None",	false,	false,	false,	false},
	SchemeUnknown	={nil,	"None",	nil,		nil,		false,	false},
	--Other
	TreasureMap		={2,		nil,		false,	nil,		false,	false},
	SurveyMap		={nil,	nil,		nil,		nil,		false,	false},
	MasterWrit		={nil,	nil,		nil,		nil,		false,	false},
	Scroll		={3,		nil,		false,	nil,		false,	false},
	--Quests
	Bursar		=false,
	BursarTreasure	=false,
	}
local Localization={
	en={
		Tooltip={
		"Quality",
		"Price<=",
		"Destroy items",
		"Mark items as junk",
		"Push to bank",
		"Retreive from bank",
		"Move unmarked to bank",
		"\nwith quality <<1>> or lower",
		"\nand price <<2>>|t16:16:EsoUI/Art/currency/currency_gold.dds|t or lower",
		"\nexcept unknown by <<2>>\n(works only with enabled CraftStore)",
		"\nwith option "
		},
		HelpTooltip		={"Checkboxes:","All characters\n (Global settings are grey)","Current character\n (Local settings are green)","Complex filters:\n Local for each character\nText and Combo boxes:\n Global for account"},
		Sold			="Sold |t16:16:<<1>>|t<<3>>x <<t:2>> for <<4>>|t16:16:EsoUI/Art/currency/currency_gold.dds|t.",
		SoldTotal		="Sold <<1>> <<1[item/items]>> for <<2>>|t16:16:EsoUI/Art/currency/currency_gold.dds|t.",
		Laundered		="Laundered |t16:16:<<1>>|t<<3>>x <<t:2>> for <<4>>|t16:16:EsoUI/Art/currency/currency_gold.dds|t.",
		LaunderedTotal	="Laundered <<1>> <<1[item/items]>> for <<2>>|t16:16:EsoUI/Art/currency/currency_gold.dds|t.",
		Deposited		="Deposited <<1>>|t16:16:<<2>>|t to bank.",
		DepositedItem	="Deposited |t16:16:<<1>>|t<<3>> x <<t:2>>",
		DepositedTotal	="Deposited <<1>> <<1[item/items]>> (<<2>> total).",
		Withdrawn		="Withdrawn <<1>>|t16:16:<<2>>|t from bank.",
		WithdrawnItem	="Withdrawn |t16:16:<<1>>|t<<3>> x <<t:2>>",
		WithdrawnTotal	="Withdrawn <<1>> <<1[item/items]>> (<<2>> total).",
		Destroy		="Destroy |t16:16:<<1>>|t<<2>> (<<3>>)",
		Junk			="Junk |t16:16:<<1>>|t<<2>>",
		Progress		="|cEE2222In progress|r",
		RescanInventory	="Rescan inventory",
		ResetLocal		="Reset local",
		Except		="except",
		--Base options
		Sell			={entry="Auto sell in store"},
		Transfer		={entry="Auto currency transfer"},
		Deposit		={entry="Auto deposit to bank"},
		Launder		={entry="Auto laundry with fence",tooltip="Will not launder trophy and lockpicks."},
		RememberJunk	={entry="Remember items",tooltip="Remember items marked as junk by player"},
		ChatOutput		={
			entry="Chat messages",
			[1]="Post to chat total sold/laundered/deposited/withdrawn messages.",
			[2]="Detailed bank/store/fence (withdraw/deposit) chat messages.",
			[3]="Detailed loot (destroy/mark as junk) chat messages.",
			},
		--Curency
		HeaderCurency	={entry="Currency"},
		Gold			={entry="Keep gold quantity"},
		Telvar		={entry="Keep telvar quantity"},
		AP			={entry="Alliance points"},
		Voucher		={entry="Writ vouchers"},
		--Consumables
		HeaderConsumables	={entry="Consumables"},
		--Items
		HeaderItems		={entry="Items"},
		TrashItems		={entry="Trash items"},
--		MonsterParts	={entry="Monster parts (Needed for quest in Clockwork City)."},
		RareStyleEquip	={entry="Rare style equipement"},
		SetItems		={entry="Set items"},
		Ornate		={entry="Items with ornate trait"},
		Intricate		={entry="Items with intricate trait"},
		FishingLure		={entry="Fishing lure"},
		Stolen		={entry="Stolen items"},
		Jewelry		={entry="Jewelry",[5]=" (except locked)"},
		Glyph			={entry="Glyphs"},
		Fragments		={entry="Fragments", tooltip="Trophy key/runebox/recipe fragments."},
		Potions		={entry="Potions/poisons",[3]=" (except 150 potions)",[4]=" (except 150 potions)"},
		Food			={entry="Food/drink"},
		Furnishing		={entry="Furnishing"},
		--Materials
		HeaderMaterials	={entry="Materials"},
		LowMaterial		={entry="Low level materials",tooltip="<150 level (except raw materials)"},
		Alchemy		={entry="Alchemy reagents"},
		Blacksmithing	={entry="Blacksmithing materials"},
		Clothier		={entry="Clothier materials"},
		Woodworking		={entry="Woodworking materials"},
		JewelryCrafting	={entry="Jewelry materials"},
--		JewelryTrait	={entry="Jewelry trait materials"},
		FurnishingCrafting={entry="Furnishing materials"},
		StyleMaterial	={entry="Style material",[3]=" (except rare style materials)"},
		TraitMaterial	={entry="Trait material",[3]=" (except jewelry materials)"},
		CraftingBooster	={entry="Crafting boosters"},
		Ingredient		={entry="Food ingredients",[3]=" (except "..ItemQuality[4].." quality)"},
		Rune			={entry="Potency/essence rune"},
		Aspect		={entry="Aspect rune"},
		--Recipes
		HeaderRecipes	={entry="Recipes"},
		StyleKnown		={entry="Crafting style known"},
		StyleUnknown	={entry="Crafting style unknown"},
		RecipeKnown		={entry="Recipe known"},
		RecipeUnknown	={entry="Recipe unknown"},
		SchemeKnown		={entry="Blueprint known"},
		SchemeUnknown	={entry="Blueprint unknown"},
		--Other
		HeaderOther		={entry="Maps/Writs"},
		TreasureMap		={entry="Treasure maps"},
		SurveyMap		={entry="Survey maps"},
		MasterWrit		={entry="Master writs"},
		Scroll		={entry="Scrolls"},
		--Quests
		HeaderQuests	={entry="Quests"},
		Bursar		={entry="Bursar of Tributes (loot)", [1]="Do not sell, deposit to bank, withdraw needed for quest.", tooltip="Clockwork city quest. Items:\n|t18:18:/esoui/art/vendor/vendor_tabicon_sell_up.dds|t Ornate armor (price<=180)"},	--[6]="\nitems needed for quest"},
		BursarTreasure	={entry="Bursar of Tributes (treasure)", [1]="Do not sell in fence.", tooltip="Clockwork city quest.\nTreasure items (price<=100):"},
	},

	jf={
		Tooltip={
		"品质",
		"价格<=",
		"销毁物品",
		"将物品标为垃圾",
		"存入银行",
		"从银行取回",
		"将未标记的移动至银行",
		"\n品质等于或低于 <<1>> ",
		"\n价格等于或低于 <<2>>|t16:16:EsoUI/Art/currency/currency_gold.dds|t ",
		"\n除去未知的 <<2>>\n(仅当CraftStore插件开启时有效)",
		"\n通过选项 "
		},
		HelpTooltip		={"复选框:","所有角色\n (全局设置为灰色)","当前角色\n (本角色设置为绿色)","明细筛选器:\n 单独对每个角色生效\n文本和组合框:\n 账户全局设置"},
		Sold			="以 <<4>>|t16:16:EsoUI/Art/currency/currency_gold.dds|t 出售了 |t16:16:<<1>>|t <<3>>个 <<t:2>>。",
		SoldTotal		="以 <<2>>|t16:16:EsoUI/Art/currency/currency_gold.dds|t 出售了 <<1>> <<1[物品/物品]>>。",
		Laundered		="以 <<4>>|t16:16:EsoUI/Art/currency/currency_gold.dds|t 洗白了 |t16:16:<<1>>|t <<3>>个 <<t:2>>。",
		LaunderedTotal	        ="以 <<2>>|t16:16:EsoUI/Art/currency/currency_gold.dds|t 洗白了 <<1>> <<1[物品/物品]>>。",
		Deposited		="<<1>>|t16:16:<<2>>|t 被存入银行",
		DepositedItem	        ="|t16:16:<<1>>|t<<3>> 个 <<t:2>> 被存入银行",
		DepositedTotal	        ="<<1>> <<1[物品/物品]>> 被存入(总共 <<2>> )",
		Withdrawn		="<<1>>|t16:16:<<2>>|t 从银行取出",
		WithdrawnItem	        ="|t16:16:<<1>>|t<<3>> 个 <<t:2>> 从银行取出",
		WithdrawnTotal	        ="<<1>> <<1[物品/物品]>> 被取出(总共 <<2>> )",
		Destroy		        ="|t16:16:<<1>>|t<<2>> 被销毁(<<3>>)",
		Junk			="|t16:16:<<1>>|t<<2>> 被标为垃圾",
		Progress		="|cEE2222处理中|r",
		RescanInventory	="重新扫描物品栏",
		ResetLocal		="重置本账号设置",
		Except		="除去",
		--Base options
		Sell			={entry="在商店自动出售"},
		Transfer		={entry="自动货币转移"},
		Deposit		        ={entry="自动存入银行"},
		Launder		        ={entry="自动洗白赃物",tooltip="不会洗白收藏品和开锁器."},
		RememberJunk	={entry="记忆物品",tooltip="记忆被玩家手动标记为垃圾的物品"},
		ChatOutput		={
			entry="聊天信息",
			[1]="在聊天栏贴出 出售/洗白/存入/取出 总数信息。",
			[2]="聊天栏显示 银行/商店/赃物 (取出/存入) 详细信息。",
			[3]="聊天栏显示 获得 (销毁/标为垃圾) 详细信息。",
			},
		--Curency
		HeaderCurency	={entry="货币"},
		Gold			={entry="保留金币数量"},
		Telvar		        ={entry="保留生命石数量"},
		AP			={entry="联盟点数"},
		Voucher		        ={entry="大师令券"},
		--Consumables
		HeaderConsumables	={entry="消耗品"},
		--Items
		HeaderItems		={entry="物品"},
		TrashItems		={entry="垃圾物品"},
		MonsterParts	        ={entry="怪物部件 (发条城的乌鸦日常任务可能会需要)。"},
		RareStyleEquip	        ={entry="稀有风格装备"},
		SetItems		={entry="套装物品"},
		Ornate		        ={entry="带有 绚丽装饰 特性的物品"},
		Intricate		={entry="带有 错综深奥 特性的物品"},
		FishingLure		={entry="鱼饵"},
		Stolen		        ={entry="赃物"},
		Jewelry		        ={entry="首饰",[5]=" (除去被锁定的)"},
		Glyph			={entry="附魔"},
		Fragments		={entry="碎片", tooltip="收藏品 钥匙/符文箱 碎片"},
		Potions		        ={entry="药剂/毒药",[3]=" (除去 150CP 药剂)",[4]=" (除去 150CP 药剂)"},
		Food			={entry="食物/饮料"},
		Furnishing		={entry="家具"},
		--Materials
		HeaderMaterials	={entry="材料"},
		LowMaterial		={entry="低等级材料",tooltip="<150CP 级 (除去未精炼的原材料)"},
		Alchemy		        ={entry="炼金溶剂"},
		Blacksmithing	        ={entry="锻造材料"},
		Clothier		={entry="制衣材料"},
		Woodworking		={entry="木工材料"},
		JewelryCrafting        	={entry="首饰材料"},
--		JewelryTrait	        ={entry="首饰特性材料"},
		FurnishingCrafting      ={entry="家具材料"},
		StyleMaterial	        ={entry="风格材料",[3]=" (除去稀有风格材料)"},
		TraitMaterial	        ={entry="特性材料",[3]=" (除去首饰材料)"},
		CraftingBooster	        ={entry="制造提升材料"},
		Ingredient		={entry="食物原料",[3]=" (除去 "..ItemQuality[4].." 品质)"},
		Rune			={entry="效力/本质 符文石"},
		Aspect		        ={entry="品质符文石"},
		--Recipes
		HeaderRecipes	={entry="配方"},
		StyleKnown		={entry="已知制造风格"},
		StyleUnknown	        ={entry="未知制造风格"},
		RecipeKnown		={entry="已知食谱"},
		RecipeUnknown	        ={entry="未知食谱"},
		SchemeKnown		={entry="已知家具图"},
		SchemeUnknown	        ={entry="未知家具图"},
		--Other
		HeaderOther		={entry="地图/令状"},
		TreasureMap		={entry="藏宝图"},
		SurveyMap		={entry="制造调查报告"},
		MasterWrit		={entry="大师令状"},
		Scroll		={entry="卷轴"},
		--Quests
		HeaderQuests	={entry="任务"},
		Bursar		={entry="财务官的贡品 (掉落物)", [1]="不出售, 存入银行, 任务需要时取出。", tooltip="发条城日常任务。物品:\n|t18:18:/esoui/art/vendor/vendor_tabicon_sell_up.dds|t 绚丽装饰护甲 (价格<=180)"},	--[6]="\n任务所需物品"},
		BursarTreasure	={entry="财务官的贡品 (宝物)", [1]="不在黑市商人处出售。", tooltip="发条城日常任务。\n宝物 (价格<=100):"},
	},

	ze={
		Tooltip={
		"品质",
		"价格<=",
		"销毁物品",
		"将物品标为垃圾",
		"存入银行",
		"从银行取回",
		"将未标记的移动至银行",
		"\n品质等于或低于 <<1>> ",
		"\n价格等于或低于 <<2>>|t16:16:EsoUI/Art/currency/currency_gold.dds|t ",
		"\n除去未知的 <<2>>\n(仅当CraftStore插件开启时有效)",
		"\n通过选项 "
		},
		HelpTooltip		={"复选框:","所有角色\n (全局设置为灰色)","当前角色\n (本角色设置为绿色)","明细筛选器:\n 单独对每个角色生效\n文本和组合框:\n 账户全局设置"},
		Sold			="以 <<4>>|t16:16:EsoUI/Art/currency/currency_gold.dds|t 出售了 |t16:16:<<1>>|t <<3>>个 <<t:2>>。",
		SoldTotal		="以 <<2>>|t16:16:EsoUI/Art/currency/currency_gold.dds|t 出售了 <<1>> <<1[物品/物品]>>。",
		Laundered		="以 <<4>>|t16:16:EsoUI/Art/currency/currency_gold.dds|t 洗白了 |t16:16:<<1>>|t <<3>>个 <<t:2>>。",
		LaunderedTotal	        ="以 <<2>>|t16:16:EsoUI/Art/currency/currency_gold.dds|t 洗白了 <<1>> <<1[物品/物品]>>。",
		Deposited		="<<1>>|t16:16:<<2>>|t 被存入银行",
		DepositedItem	        ="|t16:16:<<1>>|t<<3>> 个 <<t:2>> 被存入银行",
		DepositedTotal	        ="<<1>> <<1[物品/物品]>> 被存入(总共 <<2>> )",
		Withdrawn		="<<1>>|t16:16:<<2>>|t 从银行取出",
		WithdrawnItem	        ="|t16:16:<<1>>|t<<3>> 个 <<t:2>> 从银行取出",
		WithdrawnTotal	        ="<<1>> <<1[物品/物品]>> 被取出(总共 <<2>> )",
		Destroy		        ="|t16:16:<<1>>|t<<2>> 被销毁(<<3>>)",
		Junk			="|t16:16:<<1>>|t<<2>> 被标为垃圾",
		Progress		="|cEE2222处理中|r",
		RescanInventory	="重新扫描物品栏",
		ResetLocal		="重置本账号设置",
		Except		="除去",
		--Base options
		Sell			={entry="在商店自动出售"},
		Transfer		={entry="自动货币转移"},
		Deposit		        ={entry="自动存入银行"},
		Launder		        ={entry="自动洗白赃物",tooltip="不会洗白收藏品和开锁器."},
		RememberJunk	={entry="记忆物品",tooltip="记忆被玩家手动标记为垃圾的物品"},
		ChatOutput		={
			entry="聊天信息",
			[1]="在聊天栏贴出 出售/洗白/存入/取出 总数信息。",
			[2]="聊天栏显示 银行/商店/赃物 (取出/存入) 详细信息。",
			[3]="聊天栏显示 获得 (销毁/标为垃圾) 详细信息。",
			},
		--Curency
		HeaderCurency	={entry="货币"},
		Gold			={entry="保留金币数量"},
		Telvar		        ={entry="保留生命石数量"},
		AP			={entry="联盟点数"},
		Voucher		        ={entry="大师令券"},
		--Consumables
		HeaderConsumables	={entry="消耗品"},
		--Items
		HeaderItems		={entry="物品"},
		TrashItems		={entry="垃圾物品"},
		MonsterParts	        ={entry="怪物部件 (发条城的乌鸦日常任务可能会需要)。"},
		RareStyleEquip	        ={entry="稀有风格装备"},
		SetItems		={entry="套装物品"},
		Ornate		        ={entry="带有 绚丽装饰 特性的物品"},
		Intricate		={entry="带有 错综深奥 特性的物品"},
		FishingLure		={entry="鱼饵"},
		Stolen		        ={entry="赃物"},
		Jewelry		        ={entry="首饰",[5]=" (除去被锁定的)"},
		Glyph			={entry="附魔"},
		Fragments		={entry="碎片", tooltip="收藏品 钥匙/符文箱 碎片"},
		Potions		        ={entry="药剂/毒药",[3]=" (除去 150CP 药剂)",[4]=" (除去 150CP 药剂)"},
		Food			={entry="食物/饮料"},
		Furnishing		={entry="家具"},
		--Materials
		HeaderMaterials	={entry="材料"},
		LowMaterial		={entry="低等级材料",tooltip="<150CP 级 (除去未精炼的原材料)"},
		Alchemy		        ={entry="炼金溶剂"},
		Blacksmithing	        ={entry="锻造材料"},
		Clothier		={entry="制衣材料"},
		Woodworking		={entry="木工材料"},
		JewelryCrafting        	={entry="首饰材料"},
--		JewelryTrait	        ={entry="首饰特性材料"},
		FurnishingCrafting      ={entry="家具材料"},
		StyleMaterial	        ={entry="风格材料",[3]=" (除去稀有风格材料)"},
		TraitMaterial	        ={entry="特性材料",[3]=" (除去首饰材料)"},
		CraftingBooster	        ={entry="制造提升材料"},
		Ingredient		={entry="食物原料",[3]=" (除去 "..ItemQuality[4].." 品质)"},
		Rune			={entry="效力/本质 符文石"},
		Aspect		        ={entry="品质符文石"},
		--Recipes
		HeaderRecipes	={entry="配方"},
		StyleKnown		={entry="已知制造风格"},
		StyleUnknown	        ={entry="未知制造风格"},
		RecipeKnown		={entry="已知食谱"},
		RecipeUnknown	        ={entry="未知食谱"},
		SchemeKnown		={entry="已知家具图"},
		SchemeUnknown	        ={entry="未知家具图"},
		--Other
		HeaderOther		={entry="地图/令状"},
		TreasureMap		={entry="藏宝图"},
		SurveyMap		={entry="制造调查报告"},
		MasterWrit		={entry="大师令状"},
		Scroll		={entry="卷轴"},
		--Quests
		HeaderQuests	={entry="任务"},
		Bursar		={entry="财务官的贡品 (掉落物)", [1]="不出售, 存入银行, 任务需要时取出。", tooltip="发条城日常任务。物品:\n|t18:18:/esoui/art/vendor/vendor_tabicon_sell_up.dds|t 绚丽装饰护甲 (价格<=180)"},	--[6]="\n任务所需物品"},
		BursarTreasure	={entry="财务官的贡品 (宝物)", [1]="不在黑市商人处出售。", tooltip="发条城日常任务。\n宝物 (价格<=100):"},
	},

	zf={
		Tooltip={
		"品质",
		"价格<=",
		"销毁物品",
		"将物品标为垃圾",
		"存入银行",
		"从银行取回",
		"将未标记的移动至银行",
		"\n品质等于或低于 <<1>> ",
		"\n价格等于或低于 <<2>>|t16:16:EsoUI/Art/currency/currency_gold.dds|t ",
		"\n除去未知的 <<2>>\n(仅当CraftStore插件开启时有效)",
		"\n通过选项 "
		},
		HelpTooltip		={"复选框:","所有角色\n (全局设置为灰色)","当前角色\n (本角色设置为绿色)","明细筛选器:\n 单独对每个角色生效\n文本和组合框:\n 账户全局设置"},
		Sold			="以 <<4>>|t16:16:EsoUI/Art/currency/currency_gold.dds|t 出售了 |t16:16:<<1>>|t <<3>>个 <<t:2>>。",
		SoldTotal		="以 <<2>>|t16:16:EsoUI/Art/currency/currency_gold.dds|t 出售了 <<1>> <<1[物品/物品]>>。",
		Laundered		="以 <<4>>|t16:16:EsoUI/Art/currency/currency_gold.dds|t 洗白了 |t16:16:<<1>>|t <<3>>个 <<t:2>>。",
		LaunderedTotal	        ="以 <<2>>|t16:16:EsoUI/Art/currency/currency_gold.dds|t 洗白了 <<1>> <<1[物品/物品]>>。",
		Deposited		="<<1>>|t16:16:<<2>>|t 被存入银行",
		DepositedItem	        ="|t16:16:<<1>>|t<<3>> 个 <<t:2>> 被存入银行",
		DepositedTotal	        ="<<1>> <<1[物品/物品]>> 被存入(总共 <<2>> )",
		Withdrawn		="<<1>>|t16:16:<<2>>|t 从银行取出",
		WithdrawnItem	        ="|t16:16:<<1>>|t<<3>> 个 <<t:2>> 从银行取出",
		WithdrawnTotal	        ="<<1>> <<1[物品/物品]>> 被取出(总共 <<2>> )",
		Destroy		        ="|t16:16:<<1>>|t<<2>> 被销毁(<<3>>)",
		Junk			="|t16:16:<<1>>|t<<2>> 被标为垃圾",
		Progress		="|cEE2222处理中|r",
		RescanInventory	="重新扫描物品栏",
		ResetLocal		="重置本账号设置",
		Except		="除去",
		--Base options
		Sell			={entry="在商店自动出售"},
		Transfer		={entry="自动货币转移"},
		Deposit		        ={entry="自动存入银行"},
		Launder		        ={entry="自动洗白赃物",tooltip="不会洗白收藏品和开锁器."},
		RememberJunk	={entry="记忆物品",tooltip="记忆被玩家手动标记为垃圾的物品"},
		ChatOutput		={
			entry="聊天信息",
			[1]="在聊天栏贴出 出售/洗白/存入/取出 总数信息。",
			[2]="聊天栏显示 银行/商店/赃物 (取出/存入) 详细信息。",
			[3]="聊天栏显示 获得 (销毁/标为垃圾) 详细信息。",
			},
		--Curency
		HeaderCurency	={entry="货币"},
		Gold			={entry="保留金币数量"},
		Telvar		        ={entry="保留生命石数量"},
		AP			={entry="联盟点数"},
		Voucher		        ={entry="大师令券"},
		--Consumables
		HeaderConsumables	={entry="消耗品"},
		--Items
		HeaderItems		={entry="物品"},
		TrashItems		={entry="垃圾物品"},
		MonsterParts	        ={entry="怪物部件 (发条城的乌鸦日常任务可能会需要)。"},
		RareStyleEquip	        ={entry="稀有风格装备"},
		SetItems		={entry="套装物品"},
		Ornate		        ={entry="带有 绚丽装饰 特性的物品"},
		Intricate		={entry="带有 错综深奥 特性的物品"},
		FishingLure		={entry="鱼饵"},
		Stolen		        ={entry="赃物"},
		Jewelry		        ={entry="首饰",[5]=" (除去被锁定的)"},
		Glyph			={entry="附魔"},
		Fragments		={entry="碎片", tooltip="收藏品 钥匙/符文箱 碎片"},
		Potions		        ={entry="药剂/毒药",[3]=" (除去 150CP 药剂)",[4]=" (除去 150CP 药剂)"},
		Food			={entry="食物/饮料"},
		Furnishing		={entry="家具"},
		--Materials
		HeaderMaterials	={entry="材料"},
		LowMaterial		={entry="低等级材料",tooltip="<150CP 级 (除去未精炼的原材料)"},
		Alchemy		        ={entry="炼金溶剂"},
		Blacksmithing	        ={entry="锻造材料"},
		Clothier		={entry="制衣材料"},
		Woodworking		={entry="木工材料"},
		JewelryCrafting        	={entry="首饰材料"},
--		JewelryTrait	        ={entry="首饰特性材料"},
		FurnishingCrafting      ={entry="家具材料"},
		StyleMaterial	        ={entry="风格材料",[3]=" (除去稀有风格材料)"},
		TraitMaterial	        ={entry="特性材料",[3]=" (除去首饰材料)"},
		CraftingBooster	        ={entry="制造提升材料"},
		Ingredient		={entry="食物原料",[3]=" (除去 "..ItemQuality[4].." 品质)"},
		Rune			={entry="效力/本质 符文石"},
		Aspect		        ={entry="品质符文石"},
		--Recipes
		HeaderRecipes	={entry="配方"},
		StyleKnown		={entry="已知制造风格"},
		StyleUnknown	        ={entry="未知制造风格"},
		RecipeKnown		={entry="已知食谱"},
		RecipeUnknown	        ={entry="未知食谱"},
		SchemeKnown		={entry="已知家具图"},
		SchemeUnknown	        ={entry="未知家具图"},
		--Other
		HeaderOther		={entry="地图/令状"},
		TreasureMap		={entry="藏宝图"},
		SurveyMap		={entry="制造调查报告"},
		MasterWrit		={entry="大师令状"},
		Scroll		={entry="卷轴"},
		--Quests
		HeaderQuests	={entry="任务"},
		Bursar		={entry="财务官的贡品 (掉落物)", [1]="不出售, 存入银行, 任务需要时取出。", tooltip="发条城日常任务。物品:\n|t18:18:/esoui/art/vendor/vendor_tabicon_sell_up.dds|t 绚丽装饰护甲 (价格<=180)"},	--[6]="\n任务所需物品"},
		BursarTreasure	={entry="财务官的贡品 (宝物)", [1]="不在黑市商人处出售。", tooltip="发条城日常任务。\n宝物 (价格<=100):"},
	},

	zg={
		Tooltip={
		"品质",
		"价格<=",
		"销毁物品",
		"将物品标为垃圾",
		"存入银行",
		"从银行取回",
		"将未标记的移动至银行",
		"\n品质等于或低于 <<1>> ",
		"\n价格等于或低于 <<2>>|t16:16:EsoUI/Art/currency/currency_gold.dds|t ",
		"\n除去未知的 <<2>>\n(仅当CraftStore插件开启时有效)",
		"\n通过选项 "
		},
		HelpTooltip		={"复选框:","所有角色\n (全局设置为灰色)","当前角色\n (本角色设置为绿色)","明细筛选器:\n 单独对每个角色生效\n文本和组合框:\n 账户全局设置"},
		Sold			="以 <<4>>|t16:16:EsoUI/Art/currency/currency_gold.dds|t 出售了 |t16:16:<<1>>|t <<3>>个 <<t:2>>。",
		SoldTotal		="以 <<2>>|t16:16:EsoUI/Art/currency/currency_gold.dds|t 出售了 <<1>> <<1[物品/物品]>>。",
		Laundered		="以 <<4>>|t16:16:EsoUI/Art/currency/currency_gold.dds|t 洗白了 |t16:16:<<1>>|t <<3>>个 <<t:2>>。",
		LaunderedTotal	        ="以 <<2>>|t16:16:EsoUI/Art/currency/currency_gold.dds|t 洗白了 <<1>> <<1[物品/物品]>>。",
		Deposited		="<<1>>|t16:16:<<2>>|t 被存入银行",
		DepositedItem	        ="|t16:16:<<1>>|t<<3>> 个 <<t:2>> 被存入银行",
		DepositedTotal	        ="<<1>> <<1[物品/物品]>> 被存入(总共 <<2>> )",
		Withdrawn		="<<1>>|t16:16:<<2>>|t 从银行取出",
		WithdrawnItem	        ="|t16:16:<<1>>|t<<3>> 个 <<t:2>> 从银行取出",
		WithdrawnTotal	        ="<<1>> <<1[物品/物品]>> 被取出(总共 <<2>> )",
		Destroy		        ="|t16:16:<<1>>|t<<2>> 被销毁(<<3>>)",
		Junk			="|t16:16:<<1>>|t<<2>> 被标为垃圾",
		Progress		="|cEE2222处理中|r",
		RescanInventory	="重新扫描物品栏",
		ResetLocal		="重置本账号设置",
		Except		="除去",
		--Base options
		Sell			={entry="在商店自动出售"},
		Transfer		={entry="自动货币转移"},
		Deposit		        ={entry="自动存入银行"},
		Launder		        ={entry="自动洗白赃物",tooltip="不会洗白收藏品和开锁器."},
		RememberJunk	={entry="记忆物品",tooltip="记忆被玩家手动标记为垃圾的物品"},
		ChatOutput		={
			entry="聊天信息",
			[1]="在聊天栏贴出 出售/洗白/存入/取出 总数信息。",
			[2]="聊天栏显示 银行/商店/赃物 (取出/存入) 详细信息。",
			[3]="聊天栏显示 获得 (销毁/标为垃圾) 详细信息。",
			},
		--Curency
		HeaderCurency	={entry="货币"},
		Gold			={entry="保留金币数量"},
		Telvar		        ={entry="保留生命石数量"},
		AP			={entry="联盟点数"},
		Voucher		        ={entry="大师令券"},
		--Consumables
		HeaderConsumables	={entry="消耗品"},
		--Items
		HeaderItems		={entry="物品"},
		TrashItems		={entry="垃圾物品"},
		MonsterParts	        ={entry="怪物部件 (发条城的乌鸦日常任务可能会需要)。"},
		RareStyleEquip	        ={entry="稀有风格装备"},
		SetItems		={entry="套装物品"},
		Ornate		        ={entry="带有 绚丽装饰 特性的物品"},
		Intricate		={entry="带有 错综深奥 特性的物品"},
		FishingLure		={entry="鱼饵"},
		Stolen		        ={entry="赃物"},
		Jewelry		        ={entry="首饰",[5]=" (除去被锁定的)"},
		Glyph			={entry="附魔"},
		Fragments		={entry="碎片", tooltip="收藏品 钥匙/符文箱 碎片"},
		Potions		        ={entry="药剂/毒药",[3]=" (除去 150CP 药剂)",[4]=" (除去 150CP 药剂)"},
		Food			={entry="食物/饮料"},
		Furnishing		={entry="家具"},
		--Materials
		HeaderMaterials	={entry="材料"},
		LowMaterial		={entry="低等级材料",tooltip="<150CP 级 (除去未精炼的原材料)"},
		Alchemy		        ={entry="炼金溶剂"},
		Blacksmithing	        ={entry="锻造材料"},
		Clothier		={entry="制衣材料"},
		Woodworking		={entry="木工材料"},
		JewelryCrafting        	={entry="首饰材料"},
--		JewelryTrait	        ={entry="首饰特性材料"},
		FurnishingCrafting      ={entry="家具材料"},
		StyleMaterial	        ={entry="风格材料",[3]=" (除去稀有风格材料)"},
		TraitMaterial	        ={entry="特性材料",[3]=" (除去首饰材料)"},
		CraftingBooster	        ={entry="制造提升材料"},
		Ingredient		={entry="食物原料",[3]=" (除去 "..ItemQuality[4].." 品质)"},
		Rune			={entry="效力/本质 符文石"},
		Aspect		        ={entry="品质符文石"},
		--Recipes
		HeaderRecipes	={entry="配方"},
		StyleKnown		={entry="已知制造风格"},
		StyleUnknown	        ={entry="未知制造风格"},
		RecipeKnown		={entry="已知食谱"},
		RecipeUnknown	        ={entry="未知食谱"},
		SchemeKnown		={entry="已知家具图"},
		SchemeUnknown	        ={entry="未知家具图"},
		--Other
		HeaderOther		={entry="地图/令状"},
		TreasureMap		={entry="藏宝图"},
		SurveyMap		={entry="制造调查报告"},
		MasterWrit		={entry="大师令状"},
		Scroll		={entry="卷轴"},
		--Quests
		HeaderQuests	={entry="任务"},
		Bursar		={entry="财务官的贡品 (掉落物)", [1]="不出售, 存入银行, 任务需要时取出。", tooltip="发条城日常任务。物品:\n|t18:18:/esoui/art/vendor/vendor_tabicon_sell_up.dds|t 绚丽装饰护甲 (价格<=180)"},	--[6]="\n任务所需物品"},
		BursarTreasure	={entry="财务官的贡品 (宝物)", [1]="不在黑市商人处出售。", tooltip="发条城日常任务。\n宝物 (价格<=100):"},
	},

	zh={
		Tooltip={
		"品质",
		"价格<=",
		"销毁物品",
		"将物品标为垃圾",
		"存入银行",
		"从银行取回",
		"将未标记的移动至银行",
		"\n品质等于或低于 <<1>> ",
		"\n价格等于或低于 <<2>>|t16:16:EsoUI/Art/currency/currency_gold.dds|t ",
		"\n除去未知的 <<2>>\n(仅当CraftStore插件开启时有效)",
		"\n通过选项 "
		},
		HelpTooltip		={"复选框:","所有角色\n (全局设置为灰色)","当前角色\n (本角色设置为绿色)","明细筛选器:\n 单独对每个角色生效\n文本和组合框:\n 账户全局设置"},
		Sold			="以 <<4>>|t16:16:EsoUI/Art/currency/currency_gold.dds|t 出售了 |t16:16:<<1>>|t <<3>>个 <<t:2>>。",
		SoldTotal		="以 <<2>>|t16:16:EsoUI/Art/currency/currency_gold.dds|t 出售了 <<1>> <<1[物品/物品]>>。",
		Laundered		="以 <<4>>|t16:16:EsoUI/Art/currency/currency_gold.dds|t 洗白了 |t16:16:<<1>>|t <<3>>个 <<t:2>>。",
		LaunderedTotal	        ="以 <<2>>|t16:16:EsoUI/Art/currency/currency_gold.dds|t 洗白了 <<1>> <<1[物品/物品]>>。",
		Deposited		="<<1>>|t16:16:<<2>>|t 被存入银行",
		DepositedItem	        ="|t16:16:<<1>>|t<<3>> 个 <<t:2>> 被存入银行",
		DepositedTotal	        ="<<1>> <<1[物品/物品]>> 被存入(总共 <<2>> )",
		Withdrawn		="<<1>>|t16:16:<<2>>|t 从银行取出",
		WithdrawnItem	        ="|t16:16:<<1>>|t<<3>> 个 <<t:2>> 从银行取出",
		WithdrawnTotal	        ="<<1>> <<1[物品/物品]>> 被取出(总共 <<2>> )",
		Destroy		        ="|t16:16:<<1>>|t<<2>> 被销毁(<<3>>)",
		Junk			="|t16:16:<<1>>|t<<2>> 被标为垃圾",
		Progress		="|cEE2222处理中|r",
		RescanInventory	="重新扫描物品栏",
		ResetLocal		="重置本账号设置",
		Except		="除去",
		--Base options
		Sell			={entry="在商店自动出售"},
		Transfer		={entry="自动货币转移"},
		Deposit		        ={entry="自动存入银行"},
		Launder		        ={entry="自动洗白赃物",tooltip="不会洗白收藏品和开锁器."},
		RememberJunk	={entry="记忆物品",tooltip="记忆被玩家手动标记为垃圾的物品"},
		ChatOutput		={
			entry="聊天信息",
			[1]="在聊天栏贴出 出售/洗白/存入/取出 总数信息。",
			[2]="聊天栏显示 银行/商店/赃物 (取出/存入) 详细信息。",
			[3]="聊天栏显示 获得 (销毁/标为垃圾) 详细信息。",
			},
		--Curency
		HeaderCurency	={entry="货币"},
		Gold			={entry="保留金币数量"},
		Telvar		        ={entry="保留生命石数量"},
		AP			={entry="联盟点数"},
		Voucher		        ={entry="大师令券"},
		--Consumables
		HeaderConsumables	={entry="消耗品"},
		--Items
		HeaderItems		={entry="物品"},
		TrashItems		={entry="垃圾物品"},
		MonsterParts	        ={entry="怪物部件 (发条城的乌鸦日常任务可能会需要)。"},
		RareStyleEquip	        ={entry="稀有风格装备"},
		SetItems		={entry="套装物品"},
		Ornate		        ={entry="带有 绚丽装饰 特性的物品"},
		Intricate		={entry="带有 错综深奥 特性的物品"},
		FishingLure		={entry="鱼饵"},
		Stolen		        ={entry="赃物"},
		Jewelry		        ={entry="首饰",[5]=" (除去被锁定的)"},
		Glyph			={entry="附魔"},
		Fragments		={entry="碎片", tooltip="收藏品 钥匙/符文箱 碎片"},
		Potions		        ={entry="药剂/毒药",[3]=" (除去 150CP 药剂)",[4]=" (除去 150CP 药剂)"},
		Food			={entry="食物/饮料"},
		Furnishing		={entry="家具"},
		--Materials
		HeaderMaterials	={entry="材料"},
		LowMaterial		={entry="低等级材料",tooltip="<150CP 级 (除去未精炼的原材料)"},
		Alchemy		        ={entry="炼金溶剂"},
		Blacksmithing	        ={entry="锻造材料"},
		Clothier		={entry="制衣材料"},
		Woodworking		={entry="木工材料"},
		JewelryCrafting        	={entry="首饰材料"},
--		JewelryTrait	        ={entry="首饰特性材料"},
		FurnishingCrafting      ={entry="家具材料"},
		StyleMaterial	        ={entry="风格材料",[3]=" (除去稀有风格材料)"},
		TraitMaterial	        ={entry="特性材料",[3]=" (除去首饰材料)"},
		CraftingBooster	        ={entry="制造提升材料"},
		Ingredient		={entry="食物原料",[3]=" (除去 "..ItemQuality[4].." 品质)"},
		Rune			={entry="效力/本质 符文石"},
		Aspect		        ={entry="品质符文石"},
		--Recipes
		HeaderRecipes	={entry="配方"},
		StyleKnown		={entry="已知制造风格"},
		StyleUnknown	        ={entry="未知制造风格"},
		RecipeKnown		={entry="已知食谱"},
		RecipeUnknown	        ={entry="未知食谱"},
		SchemeKnown		={entry="已知家具图"},
		SchemeUnknown	        ={entry="未知家具图"},
		--Other
		HeaderOther		={entry="地图/令状"},
		TreasureMap		={entry="藏宝图"},
		SurveyMap		={entry="制造调查报告"},
		MasterWrit		={entry="大师令状"},
		Scroll		={entry="卷轴"},
		--Quests
		HeaderQuests	={entry="任务"},
		Bursar		={entry="财务官的贡品 (掉落物)", [1]="不出售, 存入银行, 任务需要时取出。", tooltip="发条城日常任务。物品:\n|t18:18:/esoui/art/vendor/vendor_tabicon_sell_up.dds|t 绚丽装饰护甲 (价格<=180)"},	--[6]="\n任务所需物品"},
		BursarTreasure	={entry="财务官的贡品 (宝物)", [1]="不在黑市商人处出售。", tooltip="发条城日常任务。\n宝物 (价格<=100):"},
	},
}
local lang=GetCVar("language.2") if not Localization[lang] then lang="en" end
for id,itemLink in pairs(Consumables) do Localization[lang][id]={entry=GetItemLinkName(itemLink)} end
for id,itemLink in pairs(MonsterParts) do Localization[lang].Bursar.tooltip=Localization[lang].Bursar.tooltip.."\n|t18:18:"..GetItemLinkIcon(itemLink).."|t "..GetItemLinkName(itemLink) end
for itemName,data in pairs(TreasureTypes) do if data.quest=="Bursar" then Localization[lang].BursarTreasure.tooltip=Localization[lang].BursarTreasure.tooltip.."\n|t18:18:"..data.icon.."|t "..itemName end end
local MenuSettings={
	{param="Sell",		icon="/esoui/art/bank/bank_tabicon_gold_up.dds"},
	{param="Transfer",	icon="/esoui/art/bank/bank_tabicon_deposit_up.dds"},
	{param="Deposit",		icon="/esoui/art/tutorial/vendor_tabicon_sell_up.dds"},
	{param="Launder",		icon="/esoui/art/vendor/vendor_tabicon_fence_up.dds"},
	{param="RememberJunk",	icon="/esoui/art/inventory/inventory_tabicon_junk_up.dds"},
	{param="ChatOutput",	icon="/esoui/art/tutorial/chat-notifications_up.dds"},
	--Curency
	{param="HeaderCurency",	header=true},
	{param="Gold",		count=true,icon="/esoui/art/bank/bank_tabicon_gold_up.dds"},
	{param="Telvar",		count=true,icon="/esoui/art/bank/bank_tabicon_telvar_up.dds"},
	{param="AP",		count=true,icon="/esoui/art/currency/alliancepoints_32.dds"},
	{param="Voucher",		count=true,icon="/esoui/art/currency/writvoucher_mipmap.dds"},
	--Consumables
	{param="HeaderConsumables",	header=true},
	{param="Consumables",	count=true,filters="ConsumableFilters"},
	--Items
	{param="HeaderItems",	header=true},
	{param="Items",		filters="TrashFilters"},
	{param="Stolen",		icon="/esoui/art/inventory/gamepad/gp_inventory_icon_stolenitem.dds"},
	{param="Jewelry",		icon="/esoui/art/icons/gear_altmer_neck_a.dds"},
	{param="Glyph",		switch=true,icon="/esoui/art/icons/crafting_enchantment_032.dds"},
	{param="Fragments",	switch=true,icon="/esoui/art/icons/quest_daedricembers.dds"},
	{param="Potions",		switch=true,icon="/esoui/art/treeicons/store_indexicon_consumables_up.dds"},
	{param="Food",		switch=true,icon="/esoui/art/tutorial/inventory_tabicon_food_up.dds"},
	{param="Furnishing",	switch=true,icon="/esoui/art/treeicons/collection_indexicon_furnishings_up.dds"},
	--Materials
	{param="HeaderMaterials",header=true},
	{param="LowMaterial",	icon="/esoui/art/icons/crafting_ore_base_iron_r2.dds"},
	{param="Alchemy",		switch=true,icon="/esoui/art/inventory/inventory_tabicon_craftbag_alchemy_up.dds"},
	{param="Blacksmithing",	switch=true,icon="/esoui/art/inventory/inventory_tabicon_craftbag_blacksmithing_up.dds"},
	{param="Clothier",	switch=true,icon="/esoui/art/inventory/inventory_tabicon_craftbag_clothing_up.dds"},
	{param="Woodworking",	switch=true,icon="/esoui/art/inventory/inventory_tabicon_craftbag_woodworking_up.dds"},
	{param="JewelryCrafting",switch=true,icon="/esoui/art/icons/servicetooltipicons/servicetooltipicon_jewelrycrafting.dds"},
--	{param="JewelryTrait",	switch=true,icon="/esoui/art/icons/servicetooltipicons/servicetooltipicon_jewelrycrafting.dds"},
	{param="FurnishingCrafting",switch=true,icon="/esoui/art/treeicons/collection_indexicon_furnishings_up.dds"},
	{param="StyleMaterial",	switch=true,icon="/esoui/art/inventory/inventory_tabicon_craftbag_stylematerial_up.dds"},
	{param="TraitMaterial",	switch=true,icon="/esoui/art/inventory/inventory_tabicon_craftbag_itemtrait_up.dds"},
	{param="CraftingBooster",switch=true,icon="/esoui/art/icons/jewelrycrafting_booster_refined_chromium.dds"},
	{param="Ingredient",	switch=true,icon="/esoui/art/inventory/inventory_tabicon_craftbag_provisioning_up.dds"},
	{param="Rune",		switch=true,icon="/esoui/art/crafting/enchantment_tabicon_potency_up.dds"},
	{param="Aspect",		switch=true,icon="/esoui/art/crafting/enchantment_tabicon_aspect_up.dds"},
	--Recipes
	{param="HeaderRecipes",	header=true},
	{param="StyleKnown",	switch=true,icon="/esoui/art/treeicons/gamepad/gp_lorelibrary_categoryicon_craftingstyle.dds"},
	{param="StyleUnknown",	switch=true,icon="/esoui/art/treeicons/gamepad/gp_lorelibrary_categoryicon_craftingstyle.dds"},
	{param="RecipeKnown",	switch=true,icon="/esoui/art/icons/quest_scroll_001.dds"},
	{param="RecipeUnknown",	switch=true,icon="/esoui/art/icons/quest_scroll_001.dds"},
	{param="SchemeKnown",	switch=true,icon="/esoui/art/icons/crafting_planfurniture_blacksmithing3.dds"},
	{param="SchemeUnknown",	switch=true,icon="/esoui/art/icons/crafting_planfurniture_blacksmithing3.dds"},
	--Other
	{param="HeaderOther",	header=true},
	{param="TreasureMap",	switch=true,icon="/EsoUI/Art/ZoneStories/completionTypeIcon_pointOfInterest.dds"},
	{param="SurveyMap",	switch=true,icon="/EsoUI/Art/ZoneStories/completionTypeIcon_pointOfInterest.dds"},
	{param="MasterWrit",	switch=true,icon="/esoui/art/icons/master_writ_blacksmithing.dds"},
	{param="Scroll",	switch=true,icon="/esoui/art/icons/store_bounty_expunger_low.dds"},
	--Quests
	{param="HeaderQuests",	header=true},
	{param="Bursar",		icon="/esoui/art/tutorial/inventory_tabicon_quest_up.dds"},
	{param="BursarTreasure",icon="/esoui/art/tutorial/inventory_tabicon_quest_up.dds"},
}
local ItemFilters={
	TrashFilters={
	TrashItems		={icon="/esoui/art/inventory/inventory_tabicon_junk_up.dds"},
	RareStyleEquip	={icon="/esoui/art/tutorial/inventory_tabicon_armor_up.dds"},
	SetItems		={icon="/esoui/art/crafting/smithing_tabicon_armorset_up.dds"},
	Ornate		={icon="/esoui/art/vendor/vendor_tabicon_sell_up.dds"},
	Intricate		={icon="/esoui/art/crafting/enchantment_tabicon_deconstruction_up.dds"},
	FishingLure		={icon="/esoui/art/inventory/inventory_tabicon_craftbag_fishing_up.dds"}
	},
	Bursar={
		MonsterParts	={icon="/esoui/art/icons/crafting_daedra_noisome_husk.dds"},
		Ornate		={icon="/esoui/art/vendor/vendor_tabicon_sell_up.dds"},
	},
	ConsumableFilters={
	[33271]	={icon="/esoui/art/icons/soulgem_006_filled.dds"},
	[33265]	={icon=GetItemLinkInfo(Consumables[33265])},
	[30357]	={icon="/esoui/art/icons/lockpick.dds"},
	[44879]	={icon="/esoui/art/lfg/lfg_bonus_crate.dds"},
	[27138]	={icon=GetItemLinkInfo(Consumables[27138])},
	[27962]	={icon=GetItemLinkInfo(Consumables[27962])},
	[27037]	={icon=GetItemLinkInfo(Consumables[27037])},
	[27038]	={icon=GetItemLinkInfo(Consumables[27038])},
	}
}
--	/script local itemIcon=GetItemLinkInfo("|H1:item:71779:4:1:0:0:0:0:0:0:0:0:0:0:0:1:0:0:1:0:0:0|h|h") StartChatInput(itemIcon)
local isRecipe={[SPECIALIZED_ITEMTYPE_RECIPE_PROVISIONING_STANDARD_DRINK]=true,[SPECIALIZED_ITEMTYPE_RECIPE_PROVISIONING_STANDARD_FOOD]=true}
local isScheme={
[SPECIALIZED_ITEMTYPE_RECIPE_ALCHEMY_FORMULA_FURNISHING]=true,
[SPECIALIZED_ITEMTYPE_RECIPE_BLACKSMITHING_DIAGRAM_FURNISHING]=true,
[SPECIALIZED_ITEMTYPE_RECIPE_CLOTHIER_PATTERN_FURNISHING]=true,
[SPECIALIZED_ITEMTYPE_RECIPE_ENCHANTING_SCHEMATIC_FURNISHING]=true,
[SPECIALIZED_ITEMTYPE_RECIPE_JEWELRYCRAFTING_SKETCH_FURNISHING]=true,
[SPECIALIZED_ITEMTYPE_RECIPE_PROVISIONING_DESIGN_FURNISHING]=true,
[SPECIALIZED_ITEMTYPE_RECIPE_WOODWORKING_BLUEPRINT_FURNISHING]=true
}
local TreasureMaps={
	Del={
	[43695]=true,[43696]=true,[43697]=true,[43698]=true,[44939]=true,[45010]=true,	--khenarthisroost
	[43699]=true,[43700]=true,[44931]=true,[44931]=true,	--bleakrock
	[43701]=true,[43702]=true,[44928]=true,	--balfoyen
	[43691]=true,[43692]=true,[44946]=true,	--strosmkai
	[43693]=true,[43694]=true,[44930]=true,	--betnihk
	},
	Save={
	[43661]=true,[43662]=true,[43663]=true,[43664]=true,[43665]=true,[43666]=true,[44934]=true,	--deshaan
	[43643]=true,[43644]=true,[43645]=true,[43646]=true,[43647]=true,[43648]=true,[44940]=true,	--malabaltor
	[43619]=true,[43620]=true,[43621]=true,[43622]=true,[43623]=true,[43624]=true,[44929]=true,	--bangkorai
	[43607]=true,[43608]=true,[43609]=true,[43610]=true,[43611]=true,[43612]=true,[44942]=true,	--rivenspire
	[43743]=true,[43744]=true,[43745]=true,[43737]=true,[43738]=true,[43739]=true,[43740]=true,[43741]=true,[43742]=true,	--vvardenfell
	}
}
local TreasureMapsChoices={"All","Start locations only","All except valuable"}
local GlobalVars,SavedVars,CustomJunk,ignoreId,SetItemIsJunkOrig
--Functions
local function IsItemProtected(bagId,slotId)
	if IsItemPlayerLocked(bagId,slotId) then
		return true
	end
	--Item Saver support
	if ItemSaver_IsItemSaved then
		return ItemSaver_IsItemSaved(bagId,slotId)
	end
	--FCO ItemSaver support
	if FCOIS and FCOIS.IsJunkLocked then
		return FCOIS.IsJunkLocked(bagId,slotId)
	end
	--FilterIt support
	if FilterIt and FilterIt.AccountSavedVariables and FilterIt.AccountSavedVariables.FilteredItems then
		local sUniqueId=Id64ToString(GetItemUniqueId(bagId,slotId))
		if FilterIt.AccountSavedVariables.FilteredItems[sUniqueId] then
			return FilterIt.AccountSavedVariables.FilteredItems[sUniqueId] ~= FILTERIT_VENDOR
		end
	end

	return false
end

local function JoinTables(target,source)
	local target=target or {}
	local source=source or {}
	for param,value in pairs(source) do
		if type(value)=="table" then
			target[param]={}
			for param1,value1 in pairs(value) do
				target[param][param1]=value1
			end
		else
			target[param]=value
		end
	end
	return target
end

local function GetVar(param1,param2)
	if param2 then
		if SavedVars[param1] and SavedVars[param1][param2]~=nil then
			return SavedVars[param1][param2]
		else
			return GlobalVars[param1][param2],true
		end
	else
		local have_local=SavedVars[param1]~=nil
		if have_local and type(SavedVars[param1])=="table" then
			have_local=false
			for i in pairs(SavedVars[param1]) do have_local=true break end
			if not have_local then SavedVars[param1]=nil end
		end
		if have_local then
			return SavedVars[param1]
		else
			return GlobalVars[param1],true
		end
	end
end

local function SetVar(param1,param2,value,global)
	if global then
		if param2 then
			if not GlobalVars[param1] then GlobalVars[param1]={} end
			GlobalVars[param1][param2]=value	-- or nil
			if SavedVars[param1] then SavedVars[param1][param2]=nil end
		else
			GlobalVars[param1]=value	-- or nil
			SavedVars[param1]=nil
		end
	else
		if param2 then
			if not SavedVars[param1] then SavedVars[param1]={} end
			SavedVars[param1][param2]=value
		else
			SavedVars[param1]=value
		end
	end
end

local function IsRecipeUnknown(id,name)
	if not (CS and CS.Data) or name=="None" then return false end
	if name=="Any" then
		for i=3,#Characters do
			local n=Characters[i]
			local cook=CS.Data.cook.knowledge[n] and CS.Data.cook.knowledge[n][id]
			local furnish=CS.Data.furnisher.knowledge[n] and CS.Data.furnisher.knowledge[n][id]
			local style=CS.Data.style.knowledge[n] and CS.Data.style.knowledge[n][id]
			if not(cook or furnish or style) then return true end
		end
		return false
	else
		local cook=CS.Data.cook.knowledge[name] and CS.Data.cook.knowledge[name][id]
		local furnish=CS.Data.furnisher.knowledge[name] and CS.Data.furnisher.knowledge[name][id]
		local style=CS.Data.style.knowledge[name] and CS.Data.style.knowledge[name][id]
		return not (cook or furnish or style)
	end
end

local function TreasureMapToDestroy(id,choice)
	if choice==1 then
		return true
	elseif choice==2 then
--		d("Destroy treasure map: "..tostring(TreasureMaps.Del[id]))
		return TreasureMaps.Del[id]
	elseif choice==3 then
		return not TreasureMaps.Save[id]
	end
end
--	/script for i,data in pairs(SHARED_INVENTORY.bagCache[BAG_SUBSCRIBER_BANK]) do d("["..i.."] ") end
--Bank
local function ChangeLabel()
	local control=KEYBIND_STRIP.keybinds["UI_SHORTCUT_QUATERNARY"]
	if control then
		control=control:GetChild(1)
		if control:GetType()==CT_LABEL then
			control:SetText(BanditsLootManagerInProgress and Localization[lang].Progress or Localization[lang].Deposit.entry)
		end
	end
end

local function MoveCurrency()
	for i=5,6 do
		local curency={}
		if GetVar("Gold",i) then curency[CURT_MONEY]=GetVar("Gold",2) end
		if GetVar("Telvar",i) then curency[CURT_TELVAR_STONES]=GetVar("Telvar",2) end
		if GetVar("AP",i) then curency[CURT_ALLIANCE_POINTS]=GetVar("AP",2) end
		if GetVar("Voucher",i) then curency[CURT_WRIT_VOUCHERS]=GetVar("Voucher",2) end
		for currencyType,amount in pairs(curency) do
			local amount_character=GetCurrencyAmount(currencyType,CURRENCY_LOCATION_CHARACTER)
			local amount_to_transfer=i==6 and math.min(amount-amount_character,GetCurrencyAmount(currencyType,CURRENCY_LOCATION_BANK)) or amount_character-amount
			if amount_to_transfer>0 then
				TransferCurrency(currencyType,amount_to_transfer,i==6 and CURRENCY_LOCATION_BANK or CURRENCY_LOCATION_CHARACTER,i==6 and CURRENCY_LOCATION_CHARACTER or CURRENCY_LOCATION_BANK)
				d(zo_strformat(Localization[lang][i==5 and "Deposited" or "Withdrawn"],amount_to_transfer,GetCurrencyKeyboardIcon(currencyType)))
			end
		end
	end
end

local function MoveItems()
	BanditsLootManagerInProgress=true
	ChangeLabel(true)
	local ESOPlusActive=IsESOPlusSubscriber()
	local QueueData={}
	local BagCache={[BAG_BACKPACK]=SHARED_INVENTORY.bagCache[BAG_BACKPACK],[BAG_BANK]=SHARED_INVENTORY.bagCache[BAG_BANK]}
	if ESOPlusActive then BagCache[BAG_SUBSCRIBER_BANK]=SHARED_INVENTORY.bagCache[BAG_SUBSCRIBER_BANK] end
	local tempBagCache={[BAG_BACKPACK]={},[BAG_BANK]={},[BAG_SUBSCRIBER_BANK]={}}
	local FirstSlot={[BAG_BACKPACK]=0,[BAG_BANK]=0,[BAG_SUBSCRIBER_BANK]=0}
	local BagSize={[BAG_BACKPACK]=GetBagSize(BAG_BACKPACK),[BAG_BANK]=GetBagSize(BAG_BANK),[BAG_SUBSCRIBER_BANK]=GetBagSize(BAG_SUBSCRIBER_BANK)}
	--Find slot to stack
	local function FindSlotToStack(bagId,itemId,count)
		local bags={bagId} if bagId==BAG_BANK and ESOPlusActive then table.insert(bags,BAG_SUBSCRIBER_BANK) end
		for _,bag in pairs(bags) do
			for slotIndex=0, BagSize[bag]-1 do
				if itemId and itemId==GetItemId(bag,slotIndex) then
					local stackCount,stackMax=GetSlotStackSize(bag,slotIndex)
					if stackMax-stackCount>=count then return slotIndex,bag end
				end
			end
		end
	end
	--Find empty slot
	local function FindEmptySlotInBag(bagId)
		local bags={bagId} if bagId==BAG_BANK and ESOPlusActive then table.insert(bags,BAG_SUBSCRIBER_BANK) end
		for _,bag in pairs(bags) do
			for slotIndex=FirstSlot[bag], BagSize[bag]-1 do
				if not BagCache[bag][slotIndex] and not tempBagCache[bag][slotIndex] then
					tempBagCache[bag][slotIndex]=true
					FirstSlot[bag]=slotIndex+1
					return slotIndex,bag
				end
			end
		end
	end
	--Consumables
	local ConsumableItems={}
	local moveUnmarked=GetVar("Consumables",7)
	for id in pairs(Consumables) do
		if moveUnmarked or GetVar(id) then
			ConsumableItems[id]={
				Info={[BAG_BACKPACK]={},[BAG_BANK]={},[BAG_SUBSCRIBER_BANK]={}},
				Count={[BAG_BACKPACK]=0,[BAG_BANK]=0,[BAG_SUBSCRIBER_BANK]=0},
				Hold=GetVar(id) and GetVar("Consumables",2) or 0,
				Deposit=GetVar("Consumables",5),
				Withdraw=GetVar("Consumables",6)
				}
		end
	end
	--Quests
	for i=1,GetNumJournalQuests()do
		local items=QuestItems[GetJournalQuestName(i)]
		if items then
			for id,count in pairs(items) do
				ConsumableItems[id]={
					Info={[BAG_BACKPACK]={},[BAG_BANK]={},[BAG_SUBSCRIBER_BANK]={}},
					Count={[BAG_BACKPACK]=0,[BAG_BANK]=0,[BAG_SUBSCRIBER_BANK]=0},
					Hold=count,
					Withdraw=true,
					}
			end
		end
	end

	for Action=5,ESOPlusActive and 7 or 6 do	--Deposit, Withdraw
		local sourceBag=Action==5 and BAG_BACKPACK or Action==6 and BAG_BANK or BAG_SUBSCRIBER_BANK
		local destBag=Action==5 and BAG_BANK or BAG_BACKPACK
		for slotIndex,data in pairs(BagCache[sourceBag]) do
			local param=nil
			local itemLink=GetItemLink(sourceBag,slotIndex)
			if not data.isJunk and not IsItemLinkStolen(itemLink) and not IsItemLinkCrafted(itemLink) and not (Action==5 and GetItemLinkBindType(itemLink)==BIND_TYPE_ON_PICKUP_BACKPACK) then
				local itemId=GetItemId(sourceBag,slotIndex)
				if itemId then
					local itemType,specializedItemType=GetItemLinkItemType(itemLink)
					local stackCount,stackMax=GetSlotStackSize(sourceBag,slotIndex)
					--Consumables
					if ConsumableItems[itemId] then
						table.insert(ConsumableItems[itemId].Info[sourceBag],{slotIndex=slotIndex,stackCount=stackCount,stackMax=stackMax,itemLink=itemLink})
						ConsumableItems[itemId].Count[sourceBag]=ConsumableItems[itemId].Count[sourceBag]+stackCount
					--Items
					elseif MonsterParts[itemId] and Action==5 and GetVar("Bursar") then	--Bursar of Tributes quest
						table.insert(QueueData,{Action,sourceBag,destBag,slotIndex,stackCount,itemLink,(stackCount<stackMax and itemId or nil)})
					elseif (itemType==ITEMTYPE_ARMOR or itemType==ITEMTYPE_WEAPON) and not IsItemPlayerLocked(sourceBag,slotIndex) then
						local _,_,_,equipType=GetItemLinkInfo(itemLink)
						if equipType==EQUIP_TYPE_NECK or equipType==EQUIP_TYPE_RING then param="Jewelry"
						elseif GetVar("Bursar") then	--Bursar of Tributes quest
							local trait=GetItemTrait(sourceBag,slotIndex)
							if trait==ITEM_TRAIT_TYPE_ARMOR_ORNATE or trait==ITEM_TRAIT_TYPE_WEAPON_ORNATE then
								local weaponType=GetItemLinkWeaponType(itemLink)
								if trait==ITEM_TRAIT_TYPE_ARMOR_ORNATE or (trait==ITEM_TRAIT_TYPE_WEAPON_ORNATE and weaponType==WEAPONTYPE_SHIELD) then
									if Action==5 and not ConsumableItems[180] then
										local _,_,sellPrice=GetItemInfo(sourceBag,slotIndex)
										if sellPrice<=180 then table.insert(QueueData,{Action,sourceBag,destBag,slotIndex,stackCount,itemLink}) end
									elseif ConsumableItems[180] then
										table.insert(ConsumableItems[180].Info[sourceBag],{slotIndex=slotIndex,stackCount=1,stackMax=1,itemLink=itemLink})
										ConsumableItems[180].Count[sourceBag]=ConsumableItems[180].Count[sourceBag]+1
									end
								end
							end
						end
					elseif itemType==ITEMTYPE_GLYPH_ARMOR or itemType==ITEMTYPE_GLYPH_JEWELRY or itemType==ITEMTYPE_GLYPH_WEAPON then param="Glyph"
					elseif Fragments[specializedItemType] then param="Fragments"
					elseif itemType==ITEMTYPE_POTION or itemType==ITEMTYPE_POISON and not IsItemBound(sourceBag,slotIndex) then param="Potions"
					elseif itemType==ITEMTYPE_FOOD or itemType==ITEMTYPE_DRINK then param="Food"
					elseif itemType==ITEMTYPE_FURNISHING then param="Furnishing"
--					elseif itemType==ITEMTYPE_LURE then param="FishingLure"
					--Materials
					elseif itemType==ITEMTYPE_STYLE_MATERIAL or itemType==ITEMTYPE_RAW_MATERIAL then param="StyleMaterial"
					elseif itemType==ITEMTYPE_ARMOR_TRAIT or itemType==ITEMTYPE_WEAPON_TRAIT then param="TraitMaterial"
					elseif itemType==ITEMTYPE_INGREDIENT then param="Ingredient"
					elseif itemType==ITEMTYPE_BLACKSMITHING_BOOSTER or itemType==ITEMTYPE_CLOTHIER_BOOSTER or itemType==ITEMTYPE_WOODWORKING_BOOSTER or itemType==ITEMTYPE_JEWELRYCRAFTING_BOOSTER or itemType==ITEMTYPE_JEWELRYCRAFTING_RAW_BOOSTER then param="CraftingBooster"
					--Enchanting
					elseif itemType==ITEMTYPE_ENCHANTING_RUNE_ESSENCE or itemType==ITEMTYPE_ENCHANTING_RUNE_POTENCY then param="Rune"
					elseif itemType==ITEMTYPE_ENCHANTING_RUNE_ASPECT then param="Aspect"
					--Craft
--					elseif (itemType==ITEMTYPE_BLACKSMITHING_MATERIAL or itemType==ITEMTYPE_CLOTHIER_MATERIAL or itemType==ITEMTYPE_WOODWORKING_MATERIAL) and not IsHihgMaterial[itemId] then param="LowMaterial"
					elseif itemType==ITEMTYPE_REAGENT or itemType==ITEMTYPE_POISON_BASE or itemType==ITEMTYPE_POTION_BASE then param="Alchemy"
					elseif itemType==ITEMTYPE_BLACKSMITHING_MATERIAL or itemType==ITEMTYPE_BLACKSMITHING_RAW_MATERIAL then param="Blacksmithing"
					elseif itemType==ITEMTYPE_CLOTHIER_MATERIAL or itemType==ITEMTYPE_CLOTHIER_RAW_MATERIAL then param="Clothier"
					elseif itemType==ITEMTYPE_WOODWORKING_MATERIAL or itemType==ITEMTYPE_WOODWORKING_RAW_MATERIAL then param="Woodworking"
					elseif itemType==ITEMTYPE_JEWELRYCRAFTING_MATERIAL or itemType==ITEMTYPE_JEWELRYCRAFTING_RAW_MATERIAL or itemType==ITEMTYPE_JEWELRY_RAW_TRAIT or itemType==ITEMTYPE_JEWELRY_TRAIT then param="JewelryCrafting"
--					elseif itemType==ITEMTYPE_JEWELRY_RAW_TRAIT or itemType==ITEMTYPE_JEWELRY_TRAIT then param="JewelryTrait"
					elseif itemType==ITEMTYPE_FURNISHING_MATERIAL then param="FurnishingCrafting"
					--Recieps
					elseif itemType==ITEMTYPE_RACIAL_STYLE_MOTIF then param=IsItemLinkBookKnown(itemLink) and "StyleKnown" or "StyleUnknown"
--					elseif specializedItemType==SPECIALIZED_ITEMTYPE_TROPHY_RECIPE_FRAGMENT then param="RecipeKnown"
					elseif itemType==ITEMTYPE_RECIPE then
						if isRecipe[specializedItemType] then param=IsItemLinkRecipeKnown(itemLink) and "RecipeKnown" or "RecipeUnknown"
						elseif isScheme[specializedItemType] then param=IsItemLinkRecipeKnown(itemLink) and "SchemeKnown" or "SchemeUnknown"
						end
					elseif specializedItemType==SPECIALIZED_ITEMTYPE_TROPHY_TREASURE_MAP then param="TreasureMap"
					elseif specializedItemType==SPECIALIZED_ITEMTYPE_TROPHY_SURVEY_REPORT then param="SurveyMap"
					elseif itemType==ITEMTYPE_MASTER_WRIT then param="MasterWrit"
					elseif itemType==ITEMTYPE_TROPHY and specializedItemType==SPECIALIZED_ITEMTYPE_TROPHY_SCROLL then param="Scroll"
					end
					if param then
						local force=false
						if Action==5 and (param=="RecipeUnknown" or param=="SchemeUnknown") then	--Force deposit unknown recipes
							local name=GetVar(param,2)	--Character name option
							if CharacterName~=name and name~="Any" and name~="None" and IsRecipeUnknown(itemId,name) then force=true end
						end
						if force or GetVar(param,Action) then
							local name=force and false or GetVar(param,2)
							if not (Action>5 and type(name)=="string" and CharacterName~=name and IsRecipeUnknown(itemId,name)) then	--Recipes
								table.insert(QueueData,{math.min(Action,6),sourceBag,destBag,slotIndex,stackCount,itemLink,(stackCount<stackMax and itemId or nil)})
							end
						end
					end
				end
			end
		end
	end
	--Consumables
	for id,Item in pairs(ConsumableItems) do
		--Deposit
		if Item.Deposit and Item.Count[BAG_BACKPACK]-Item.Hold>0 then
			for _,data in pairs(Item.Info[BAG_BACKPACK]) do
				local count=math.min(Item.Count[BAG_BACKPACK]-Item.Hold,data.stackCount)
				if count>0 then
					Item.Count[BAG_BACKPACK]=Item.Count[BAG_BACKPACK]-count
					table.insert(QueueData,{5,BAG_BACKPACK,BAG_BANK,data.slotIndex,count,data.itemLink,(count<data.stackMax and id or nil)})
				end
			end
		end
		--Withdraw
		if Item.Withdraw and Item.Hold-Item.Count[BAG_BACKPACK]>0 then
			for _,data in pairs(Item.Info[BAG_BANK]) do
				local count=math.min(Item.Hold-Item.Count[BAG_BACKPACK],data.stackCount)
				if count>0 then
					Item.Count[BAG_BACKPACK]=Item.Count[BAG_BACKPACK]+count
					table.insert(QueueData,{6,BAG_BANK,BAG_BACKPACK,data.slotIndex,count,data.itemLink,(count<data.stackMax and id or nil)})
				end
			end
		end
	end
	--Process prepaired queue
	local countMoved,itemsMoved,itemsMovedTotal={[BAG_BACKPACK]=0,[BAG_BANK]=0},{[BAG_BACKPACK]=0,[BAG_BANK]=0},0
	local function MoveItem(sourceBag,sourceSlot,destBag,destSlot,stackCount)
		if IsProtectedFunction("RequestMoveItem") then
			CallSecureProtected("RequestMoveItem",sourceBag,sourceSlot,destBag,destSlot,stackCount)
		else
			RequestMoveItem(sourceBag,sourceSlot,destBag,destSlot,stackCount)
		end
		itemsMovedTotal=itemsMovedTotal+1
	end
	for _,data in pairs(QueueData) do
		if itemsMovedTotal<80 then
			local FreeSlots=GetNumBagFreeSlots(data[3])
			if FreeSlots>0 then
				local Action,sourceBag,destBag,sourceSlot,stackCount,itemLink,itemId=unpack(data)
				local destSlot,bag
				if itemId then destSlot,bag=FindSlotToStack(destBag,itemId,stackCount) end
				if not destSlot then destSlot,bag=FindEmptySlotInBag(destBag) end
				if destSlot then
					--Move item
					MoveItem(sourceBag,sourceSlot,bag,destSlot,stackCount)
					countMoved[destBag]=countMoved[destBag]+stackCount
					itemsMoved[destBag]=itemsMoved[destBag]+1
					if GetVar("DetailedBank") then
						local itemIcon=GetItemLinkInfo(itemLink)
						d(zo_strformat(Localization[lang][Action==5 and "DepositedItem" or "WithdrawnItem"],itemIcon,stackCount,itemLink)..(bag==BAG_SUBSCRIBER_BANK and " to subscriber bank" or ""))
					end
				end
			end
		end
	end
	--Summary
	for _,bag in pairs({BAG_BACKPACK,BAG_BANK}) do
		if itemsMoved[bag]>0 then
--			StackBag(bag)
			local text=zo_strformat(Localization[lang][bag==BAG_BANK and "DepositedTotal" or "WithdrawnTotal"],itemsMoved[bag],countMoved[bag])
			ZO_Alert(UI_ALERT_CATEGORY_ALERT, nil, text)
			if GetVar("ChatOutput") then d(text) end
		end
	end

	BanditsLootManagerInProgress=false
	ChangeLabel(false)
end

local function Bank_Init()
	ZO_CreateStringId("SI_KEYBIND_STRIP_BLM_DEPOSIT",Localization[lang].Deposit.entry)
	Button_Deposit={
		alignment=KEYBIND_STRIP_ALIGN_LEFT,
		{
			name=Localization[lang].Deposit.entry,
			keybind="UI_SHORTCUT_QUATERNARY",
			enabled=function() return not BanditsLootManagerInProgress end,
			visible=function() return true end,
			order=100,
			callback=MoveItems,
		},
	}
	BANK_MENU_FRAGMENT:RegisterCallback("StateChange", function(oldState, newState)
		if newState==SCENE_SHOWN then
			KEYBIND_STRIP:AddKeybindButtonGroup(Button_Deposit)
--			ChangeLabel()
		elseif newState==SCENE_HIDING then
			KEYBIND_STRIP:RemoveKeybindButtonGroup(Button_Deposit)
		end
	end)
end

local function onOpenBank(_,bankBag)
	if bankBag~=BAG_BANK then return end
	if GetVar("Deposit") then MoveItems() end
	if GetVar("Transfer") then MoveCurrency() end
end
--Store
local function SellJunkItems(isFence)
	if not GetVar("Sell") or GetInteractionType()~=INTERACTION_VENDOR then return end

	local total=0
	local count=0
	local transactions=0
	local hagglingBonus
	local bagCache=SHARED_INVENTORY:GenerateFullSlotData(nil,BAG_BACKPACK)

	if isFence then
		hagglingBonus=GetNonCombatBonus(NON_COMBAT_BONUS_HAGGLING) or 0
	end

	for _,data in pairs(bagCache) do
		if transactions<80 and data.isJunk and data.stolen==isFence and not IsItemProtected(BAG_BACKPACK,data.slotIndex) then
			local SellItem=true
			if isFence then
				local totalSells,sellsUsed=GetFenceSellTransactionInfo()
				if sellsUsed>=totalSells then
					ZO_Alert(UI_ALERT_CATEGORY_ALERT,SOUNDS.NEGATIVE_CLICK,GetString("SI_STOREFAILURE",STORE_FAILURE_AT_FENCE_LIMIT))
					break
				end
			end
			if isFence and data.itemType==ITEMTYPE_TREASURE and data.sellPrice<=100 and GetVar("BursarTreasure") then	--Bursar of Tributes
				local itemLink=GetItemLink(BAG_BACKPACK,data.slotIndex)
				for i=1,GetItemLinkNumItemTags(itemLink) do
					local treasure_type=GetItemLinkItemTagInfo(itemLink,i)
					if TreasureTypes[treasure_type] and TreasureTypes[treasure_type].quest=="Bursar" then SellItem=false break end
				end
			end
			if SellItem then
				SellInventoryItem(BAG_BACKPACK,data.slotIndex,data.stackCount)

				local sellPrice=data.sellPrice
				if isFence and hagglingBonus>0 then
					sellPrice=zo_round(sellPrice*(1+hagglingBonus/100))
				end

				if GetVar("DetailedBank") then
					local itemLink=GetItemLink(BAG_BACKPACK,data.slotIndex)
					local itemIcon=GetItemLinkInfo(itemLink)
					d(zo_strformat(Localization[lang].Sold,itemIcon,itemLink,data.stackCount,sellPrice*data.stackCount))
				end
				count=count+data.stackCount
				transactions=transactions+1
				total=total+sellPrice*data.stackCount
			end
		end
	end

	if total>0 then
		local text=zo_strformat(Localization[lang].SoldTotal,count,total)
		ZO_Alert(UI_ALERT_CATEGORY_ALERT, nil, text)
		if GetVar("ChatOutput") then d(text) end
	end
end

local function LaunderItems()
	local total=0
	local count=0
	local transactions=0
	for _,data in pairs(SHARED_INVENTORY.bagCache[BAG_BACKPACK]) do
		if transactions<80 and data.stolen and not IsItemProtected(BAG_BACKPACK,data.slotIndex) then
			local totalSells,sellsUsed=GetFenceLaunderTransactionInfo()
			local numFreeSlots=GetNumBagFreeSlots(BAG_BACKPACK)
			local qtyToLaunder=math.min(data.stackCount,(totalSells-sellsUsed))
			if sellsUsed>=totalSells then
				ZO_Alert(UI_ALERT_CATEGORY_ALERT,SOUNDS.NEGATIVE_CLICK,GetString("SI_ITEMLAUNDERRESULT",ITEM_LAUNDER_RESULT_AT_LIMIT))
				break
			end
			if numFreeSlots>0 or data.stackCount<=(totalSells-sellsUsed) then
				local itemLink=GetItemLink(BAG_BACKPACK,data.slotIndex)
				local itemType=GetItemLinkItemType(itemLink)
				if itemType~=ITEMTYPE_TOOL and itemType~=ITEMTYPE_TREASURE then
					LaunderItem(BAG_BACKPACK,data.slotIndex,qtyToLaunder)
					if GetVar("DetailedBank") then
						local itemIcon=GetItemLinkInfo(itemLink)
						d(zo_strformat(Localization[lang].Laundered,itemIcon,itemLink,qtyToLaunder,data.launderPrice*qtyToLaunder))
					end
					transactions=transactions+1
					count=count+qtyToLaunder
					total=total+data.launderPrice*qtyToLaunder
				end
			end
		end
	end
	if total>0 then
		local text=zo_strformat(Localization[lang].LaunderedTotal,count,total)
		ZO_Alert(UI_ALERT_CATEGORY_ALERT, nil, text)
		if GetVar("ChatOutput") then d(text) end
	end
end

local function OnSlotUpdate(_,bagId,slotId,isNewItem)
	if not isNewItem then return end
	if BanditsLootManagerInProgress then return end
	if IsUnderArrest() then return end
	if IsItemProtected(bagId,slotId) then return end
	if Roomba and Roomba.WorkInProgress and Roomba.WorkInProgress() then return end
	if BankManagerRevived_inProgress and BankManagerRevived_inProgress() then return end

	local _,stackCount,sellPrice,_,locked,equipType,itemStyle,quality=GetItemInfo(bagId,slotId)
	if stackCount<1 or quality==ITEM_QUALITY_LEGENDARY or locked then return end

	local itemLink=GetItemLink(bagId,slotId)
	local itemId=GetItemId(bagId,slotId)
	if ignoreList[itemId] or ignoreId==itemId then ignoreId=nil return end
	if IsItemLinkCrafted(itemLink) then return end
	if CustomJunk[itemId]~=nil then
		if CustomJunk[itemId] then ignoreId=itemId SetItemIsJunk(bagId,slotId,true) end
		return
	end

	local function HandleItem(param)
		local var=GetVar(param)
		if Destroy[itemId]
		or (	var[3]
			and (not var[1] or ((param=="TreasureMap" and TreasureMapToDestroy(itemId,var[1])) or (var[1] and quality<=var[1])))
			and (not var[2] or (var[2] and ((type(var[2])=="number" and sellPrice<=var[2]) or (type(var[2])=="string" and not IsRecipeUnknown(itemId,var[2])))))
			) then
			if GetVar("DetailedLoot") then
				local itemIcon=GetItemLinkInfo(itemLink)
				d(zo_strformat(Localization[lang].Destroy,itemIcon,itemLink,param))
			end
			DestroyItem(bagId,slotId)
		elseif var[4] and (not var[1] or (var[1] and quality<=var[1])) and CustomJunk[itemId]~=false then
			ignoreId=itemId SetItemIsJunk(bagId,slotId,true)
		end
	end

	local param=nil
	local itemType,specializedItemType=GetItemLinkItemType(itemLink)
	if MonsterParts[itemId] then param=GetVar("Bursar") and nil or "Items"
	elseif (itemType==ITEMTYPE_TRASH or itemType==ITEMTYPE_TREASURE) and GetVar("TrashItems") then param="Items"
	elseif IsItemLinkStolen(itemLink) and (itemType==ITEMTYPE_TREASURE or itemType==ITEMTYPE_ARMOR or itemType==ITEMTYPE_WEAPON) then param="Stolen"
	elseif itemType==ITEMTYPE_STYLE_MATERIAL and IsCommonStyle[itemStyle] then param="StyleMaterial"
	elseif itemType==ITEMTYPE_ARMOR_TRAIT or itemType==ITEMTYPE_WEAPON_TRAIT then param="TraitMaterial"
	elseif ((itemType==ITEMTYPE_POTION and (GetItemLinkRequiredChampionPoints(itemLink) or 0)<150) or itemType==ITEMTYPE_POISON) and not IsItemBound(bagId,slotId) then param="Potions"
	elseif itemType==ITEMTYPE_POISON_BASE then ignoreId=itemId SetItemIsJunk(bagId,slotId,true) return
	elseif itemType==ITEMTYPE_ARMOR or itemType==ITEMTYPE_WEAPON then
		local isSet=GetItemLinkSetInfo(itemLink,false)
		local trait=GetItemTrait(bagId,slotId)
		if trait==ITEM_TRAIT_TYPE_ARMOR_NIRNHONED or trait==ITEM_TRAIT_TYPE_WEAPON_NIRNHONED then return
		elseif trait==ITEM_TRAIT_TYPE_WEAPON_ORNATE or trait==ITEM_TRAIT_TYPE_ARMOR_ORNATE or trait==ITEM_TRAIT_TYPE_JEWELRY_ORNATE then
			if GetVar("Bursar") and trait==ITEM_TRAIT_TYPE_ARMOR_ORNATE and sellPrice<=180 then param=nil	--Quest item
			else param=GetVar("Ornate") and "Items" or nil end
		elseif trait==ITEM_TRAIT_TYPE_WEAPON_INTRICATE or trait==ITEM_TRAIT_TYPE_ARMOR_INTRICATE then param=GetVar("Intricate") and "Items" or nil
		elseif (equipType==EQUIP_TYPE_NECK or equipType==EQUIP_TYPE_RING) and trait~=ITEM_TRAIT_TYPE_JEWELRY_INTRICATE then param="Jewelry"
		elseif isSet then param=GetVar("SetItems") and "Items" or nil
		elseif not GetVar("RareStyleEquip") and not IsCommonStyle[itemStyle] then return
		else param="Items"
		end
	elseif itemType==ITEMTYPE_LURE then param=GetVar("FishingLure") and "Items" or nil
	elseif itemType==ITEMTYPE_RECIPE and isRecipe[specializedItemType] then param=IsItemLinkRecipeKnown(itemLink) and "RecipeKnown" or "RecipeUnknown"
	elseif itemType==ITEMTYPE_RECIPE and isScheme[specializedItemType] then param=IsItemLinkRecipeKnown(itemLink) and "SchemeKnown" or "SchemeUnknown"
	elseif specializedItemType==SPECIALIZED_ITEMTYPE_TROPHY_TREASURE_MAP then param="TreasureMap"
	elseif itemType==ITEMTYPE_COLLECTIBLE and specializedItemType==SPECIALIZED_ITEMTYPE_COLLECTIBLE_MONSTER_TROPHY or specializedItemType==SPECIALIZED_ITEMTYPE_COLLECTIBLE_RARE_FISH then
		ignoreId=itemId SetItemIsJunk(bagId,slotId,true) return
	elseif itemType==ITEMTYPE_INGREDIENT then param="Ingredient"
	elseif itemType==ITEMTYPE_FOOD or itemType==ITEMTYPE_DRINK then param="Food"
	elseif itemType==ITEMTYPE_BLACKSMITHING_BOOSTER or itemType==ITEMTYPE_CLOTHIER_BOOSTER or itemType==ITEMTYPE_WOODWORKING_BOOSTER then param="CraftingBooster"
	elseif itemType==ITEMTYPE_GLYPH_ARMOR or itemType==ITEMTYPE_GLYPH_JEWELRY or itemType==ITEMTYPE_GLYPH_WEAPON then param="Glyph"
	elseif itemType==ITEMTYPE_ENCHANTING_RUNE_ESSENCE or itemType==ITEMTYPE_ENCHANTING_RUNE_POTENCY then param="Rune"
	elseif itemType==ITEMTYPE_ENCHANTING_RUNE_ASPECT then param="Aspect"
	elseif itemType==ITEMTYPE_RACIAL_STYLE_MOTIF then param=IsItemLinkBookKnown(itemLink) and "StyleKnown" or "StyleUnknown"
	elseif (itemType==ITEMTYPE_BLACKSMITHING_MATERIAL or itemType==ITEMTYPE_CLOTHIER_MATERIAL or itemType==ITEMTYPE_WOODWORKING_MATERIAL) and not IsHihgMaterial[itemId] then param="LowMaterial"
	end
	if param then HandleItem(param) end
end

local function OnOpenFence()
	if not AreAnyItemsStolen(BAG_BACKPACK) then return end
	local delay=0
	if GetVar("Sell") and HasAnyJunk(BAG_BACKPACK) then delay=500 SellJunkItems(true) end
	if GetVar("Launder") then zo_callLater(LaunderItems,delay) end
end

local function RescanInventory()
	for slotIndex,data in pairs(SHARED_INVENTORY.bagCache[BAG_BACKPACK]) do
		if not data.isJunk then OnSlotUpdate(nil,BAG_BACKPACK,slotIndex,true) end
	end
end

local function Inventory_Init()
	local hoveredBagId
	local hoveredSlotId
	local Keybinds
	local hoveredItemCanBeJunked
	local hoveredItemCanBeDestroyed
	local isItemJunk
	local descriptorName=GetString(SI_ITEM_ACTION_MARK_AS_JUNK)

	local function OnSlotMouseEnter(inventorySlot)
		if inventorySlot and inventorySlot.dataEntry then
			hoveredBagId=inventorySlot.dataEntry.data.bagId
			hoveredSlotId=inventorySlot.dataEntry.data.slotIndex
			if hoveredBagId and hoveredSlotId and hoveredBagId==BAG_BACKPACK and not IsItemProtected(hoveredBagId,hoveredSlotId) then
				hoveredItemCanBeDestroyed=true
				if CanItemBeJunk(hoveredBagId,hoveredSlotId) then
					hoveredItemCanBeJunked=true
					isItemJunk=IsItemJunk(hoveredBagId,hoveredSlotId)
				end
				KEYBIND_STRIP:UpdateKeybindButtonGroup(Keybinds)
			end
		end
	end

	local function OnSlotMouseExit()
		hoveredBagId=nil
		hoveredSlotId=nil
		hoveredItemCanBeJunked=false
		hoveredItemCanBeDestroyed=false
		isItemJunk=false
		KEYBIND_STRIP:UpdateKeybindButtonGroup(Keybinds)
	end

	local function JunkHoveredItem()
		if hoveredItemCanBeJunked then
			SetItemIsJunk(hoveredBagId,hoveredSlotId,not isItemJunk)
		end
	end

	local function DestroyHoveredItem()
		if CanHoveredItemBeDestroyed() then
			DestroyItem(hoveredBagId,hoveredSlotId)
		end
	end

	local function UpdateAndDisplayJunkKeybind()
		if isItemJunk then
			descriptorName=GetString(SI_ITEM_ACTION_UNMARK_AS_JUNK)
		else
			descriptorName=GetString(SI_ITEM_ACTION_MARK_AS_JUNK)
		end
		return hoveredItemCanBeJunked
	end

	ZO_PreHook("ZO_InventorySlot_OnMouseEnter",OnSlotMouseEnter)
	ZO_PreHook("ZO_InventorySlot_OnMouseExit",OnSlotMouseExit)
	ZO_CreateStringId("SI_BINDING_NAME_LOOTMANAGER_JUNK",descriptorName)
	ZO_CreateStringId("SI_BINDING_NAME_LOOTMANAGER_DESTROY",GetString(SI_ITEM_ACTION_DESTROY))
	Keybinds=
	{
		alignment=KEYBIND_STRIP_ALIGN_CENTER,
		{
			name=GetString(SI_ITEM_ACTION_DESTROY),
			keybind="LOOTMANAGER_DESTROY",
			callback=DestroyHoveredItem,
			visible=hoveredItemCanBeDestroyed,
		},
		{
			name=function() return descriptorName end,
			keybind="LOOTMANAGER_JUNK",-- UI_SHORTCUT_NEGATIVE cannot be used
			callback=JunkHoveredItem,
			visible=UpdateAndDisplayJunkKeybind,
		},
	}
	
	local function OnStateChanged(oldState,newState)
		if newState==SCENE_SHOWING then
			KEYBIND_STRIP:AddKeybindButtonGroup(Keybinds)
		elseif newState==SCENE_HIDDEN then
			KEYBIND_STRIP:RemoveKeybindButtonGroup(Keybinds)
		end
	end
	
	INVENTORY_FRAGMENT:RegisterCallback("StateChange",OnStateChanged)

end

local function MarkItemHandler()
	if not SetItemIsJunkOrig then SetItemIsJunkOrig=SetItemIsJunk end
	if GetVar("RememberJunk") then
		SetItemIsJunk=function(bagId,slotId,junk,...)
			if junk and IsItemProtected(bagId,slotId) then junk=false
			else
				local itemId=GetItemId(bagId,slotId) if itemId and ignoreId~=itemId then CustomJunk[itemId]=junk end
				if GetVar("DetailedLoot") then
					local itemLink=GetItemLink(bagId,slotId)
					local itemIcon=GetItemLinkInfo(itemLink)
					d(zo_strformat(Localization[lang].Junk,itemIcon,itemLink)..(ignoreId~=itemId and (junk and " (mark)" or " (unmark)") or ""))
				end
			end
			SetItemIsJunkOrig(bagId,slotId,junk,...)
		end
	else
		SetItemIsJunk=SetItemIsJunkOrig
	end
end

--Menu
local function Menu_Init()
	local BanditsMenu=BUI and BUI.InternalMenu
	if not BanditsMenu and not LibAddonMenu2 then return end
	local Panel={
		type="panel",
		name=(BanditsMenu and "19. |t32:32:/esoui/art/inventory/inventory_tabicon_junk_up.dds|t" or "Bandits ").."物品管理",
		displayName=(BanditsMenu and "19. " or "").."|c4B8BFEBandits|r 物品管理",
		author="|c4B8BFEHoft|r",
		version=tostring(VERSION)..(VERSION%1==0 and ".0" or ""),
		}
	if BanditsMenu then
		BUI.Menu.RegisterPanel("BUI_LootManager_Menu",Panel)
	else
		LibAddonMenu2:RegisterAddonPanel("BUI_LootManager_Menu",Panel)
	end

	local container=WINDOW_MANAGER:CreateControlFromVirtual("LootManager_MenuContainer", BUI_LootManager_Menu, "ZO_ScrollContainer")
	container:SetAnchor(TOPLEFT, BUI_LootManager_Menu, TOPLEFT, 0, 50)
	container:SetAnchor(BOTTOMRIGHT, BUI_LootManager_Menu, BOTTOMRIGHT, 0, 0)
	BUI_LootManager_Menu.scroll=GetControl(container, "ScrollChild")
	BUI_LootManager_Menu.scroll:SetResizeToFitPadding(0, 0)
	local scroll=BUI_LootManager_Menu.scroll
	local w,h=BUI_LootManager_Menu:GetWidth()-20,26
	local h1=h+5
	local on,off='/esoui/art/cadwell/checkboxicon_checked.dds','/esoui/art/cadwell/checkboxicon_unchecked.dds'
	local color_global,color_local={.6,.57,.46,1},{.6,.9,.46,1}
	local color_global_over,color_local_over={.8,.8,.7,1},{.8,.9,.7,1}
	scroll.button={} scroll.combobox={} scroll.editbox={} scroll.switch={} scroll.icon={}
	--Import
	local function MenuUpdate()
		for _,data in pairs(scroll.button) do
			local value,global
			if type(data.var)=="table" then value,global=GetVar(data.var[1],data.var[2]) else value,global=GetVar(data.var) end
			data.control:SetTexture(value and on or off)
			data.control:SetColor(unpack(global and color_global or color_local))
		end
--[[
		for _,data in pairs(scroll.combobox) do
			data.control:SelectItemByIndex(GetVar(data.var,1), true)
		end
		for _,data in pairs(scroll.editbox) do
			data.control:SetText(GetVar(data.var,2))
		end
--]]
		for _,data in pairs(scroll.icon) do
			data.control:SetColor(unpack(GetVar(data.var) and {1,1,1,1} or {.3,.3,.2,1}))
		end
	end

	--Help
	local button=WINDOW_MANAGER:CreateControl("$(parent)Help", BUI_LootManager_Menu, CT_TEXTURE)
	button:SetDimensions(h,h)
	button:SetAnchor(TOPLEFT,BUI_LootManager_Menu,TOPLEFT,w-130-h/2,5)
	button:SetTexture('/esoui/art/help/help_tabicon_tutorial_up.dds')
	button:SetMouseEnabled(true)
	button:SetDrawLayer(DL_CONTROLS)
	button:SetHandler("OnMouseEnter", function(self)
		ZO_Tooltips_ShowTextTooltip(self,BOTTOM,
			Localization[lang].HelpTooltip[1].."\n"..
			LMB.." - "..Localization[lang].HelpTooltip[2].."\n"..
			RMB.." - "..Localization[lang].HelpTooltip[3].."\n"..
			Localization[lang].HelpTooltip[4]
		)
	end)
	button:SetHandler("OnMouseExit", ZO_Tooltips_HideTextTooltip)
	--Import box
	local control=WINDOW_MANAGER:CreateControlFromVirtual("$(parent)ComboBox_Import", scroll, "ZO_ComboBox")
	control:SetDimensions(140, 28)
	control:SetAnchor(TOPLEFT,scroll,TOPLEFT,w-200,0)
	local comboBox=control.m_comboBox
	comboBox:SetSortsItems(false)
	comboBox:ClearItems()
	for i, name in pairs(Characters) do
		local entry=ZO_ComboBox:CreateItemEntry(name, function()
			if name and name~="" and name~="None" and name~="Any" and name~=CharacterName then
				JoinTables(SavedVars,BLM_SavedVars.Default[GetDisplayName()][name])
				MenuUpdate()
			end
		end)
		entry.id=i
		comboBox:AddItem(entry, ZO_COMBOBOX_SUPRESS_UPDATE)
	end
	comboBox:SelectItemByIndex(2, true)
	comboBox:SetFont("ZoFontGame")
	control.la=WINDOW_MANAGER:CreateControl(nil, control, CT_LABEL)
	control.la:SetDimensions(100,h)
	control.la:SetAnchor(TOPRIGHT,control,TOPLEFT,-5,0)
	control.la:SetFont("ZoFontHeader")
	control.la:SetColor(1,1,1,1)
	control.la:SetHorizontalAlignment(2)
	control.la:SetVerticalAlignment(1)
	control.la:SetText("Import from")
	--Reset local
	button=WINDOW_MANAGER:CreateControlFromVirtual(nil, control, "ZO_DefaultButton")
	button:SetWidth(180, 28)
	button:SetText(Localization[lang].ResetLocal)
	button:SetAnchor(TOPLEFT,scroll,TOPLEFT,w-220,h1*2)
	button:SetClickSound("Click")
	button:SetHandler("OnClicked", function() for var in pairs(Default) do SavedVars[var]=nil end MenuUpdate() end)
	--Rescan
	button=WINDOW_MANAGER:CreateControlFromVirtual(nil, control, "ZO_DefaultButton")
	button:SetWidth(180, 28)
	button:SetText(Localization[lang].RescanInventory)
	button:SetAnchor(TOPLEFT,scroll,TOPLEFT,w-220,h1*4)
	button:SetClickSound("Click")
	button:SetHandler("OnClicked", RescanInventory)

	--Menu settings
	for i,data in ipairs(MenuSettings) do
		local param=data.param
		if data.header then
			local backdop=WINDOW_MANAGER:CreateControl("$(parent)Bg"..i, scroll, CT_BACKDROP)
			backdop:SetDimensions(w,h)
			backdop:SetAnchor(TOPLEFT,scroll,TOPLEFT,0,h1*(i-1))
			backdop:SetCenterColor(.4,.4,.4,.3)
			backdop:SetEdgeColor(0,0,0,0)
			backdop:SetEdgeTexture("",8,2,2)

			local label=WINDOW_MANAGER:CreateControl("$(parent)Header"..i, scroll, CT_LABEL)
			label:SetDimensions(w,h)
			label:SetAnchor(TOPLEFT,scroll,TOPLEFT,0,h1*(i-1))
			label:SetFont("ZoFontHeader")
			label:SetColor(.8,.8,.6,1)
			label:SetHorizontalAlignment(1)
			label:SetVerticalAlignment(1)
			label:SetModifyTextType(MODIFY_TEXT_TYPE_UPPERCASE)
			label:SetText(Localization[lang][param].entry)
		else
			if data.filters then
				--Filters
				local f=0
				for filter,data in pairs(ItemFilters[data.filters]) do
					local control=WINDOW_MANAGER:CreateControl("$(parent)Icon"..#scroll.icon+1, scroll, CT_CONTROL)
					control:SetDimensions(h, h)
					control:SetAnchor(TOPLEFT,scroll,TOPLEFT,h*f,h1*(i-1))
					control.icon=WINDOW_MANAGER:CreateControl(nil, control, CT_TEXTURE)
					control.icon:SetDimensions(h, h)
					control.icon:SetAnchor(CENTER,control,CENTER,0,0)
					control.icon:SetTexture(data.icon)
					local value,global=GetVar(filter)
					control.icon:SetColor(unpack(value and {1,1,1,1} or {.3,.3,.2,1}))
					control:SetMouseEnabled(true)
					button:SetDrawLayer(DL_CONTROLS)
					control:SetHandler("OnMouseDown", function(self)
						SetVar(filter,nil,not GetVar(filter))
						value,global=GetVar(filter)
						self.icon:SetColor(unpack(value and {1,1,1,1} or {.3,.3,.2,1}))
					end)
					control:SetHandler("OnMouseEnter", function(self)
						self.icon:SetDimensions(h*1.3, h*1.3)
						ZO_Tooltips_ShowTextTooltip(self,BOTTOM,(Localization[lang][filter].entry))	--GetVar(filter) and GetString(SI_CHECK_BUTTON_ON) or GetString(SI_CHECK_BUTTON_OFF))..": "
					end)
					control:SetHandler("OnMouseExit", function(self)
						self.icon:SetDimensions(h, h)
						ZO_Tooltips_HideTextTooltip()
					end)
					scroll.icon[#scroll.icon+1]={control=control.icon,var=filter}
					f=f+1
				end
			else
				--Label
				local label=WINDOW_MANAGER:CreateControl("$(parent)Label"..i, scroll, CT_LABEL)
				label:SetDimensions(210,h)
				label:SetAnchor(TOPLEFT,scroll,TOPLEFT,0,h1*(i-1))
				label:SetFont("ZoFontHeader")
				label:SetColor(.8,.8,.6,1)
				label:SetHorizontalAlignment(0)
				label:SetVerticalAlignment(1)
				label:SetText(zo_iconFormat(data.icon,h,h).." "..(Localization[lang][param].entry or param))
				if Localization[lang][param].tooltip then
					label:SetMouseEnabled(true)
					label:SetHandler("OnMouseEnter", function(self) ZO_Tooltips_ShowTextTooltip(self, BOTTOM, Localization[lang][param].tooltip) end)
					label:SetHandler("OnMouseExit", ZO_Tooltips_HideTextTooltip)
				end
			end
			if type(Default[param])=="boolean" then
				local button=WINDOW_MANAGER:CreateControl("$(parent)Button"..#scroll.button+1, scroll, CT_TEXTURE)
				button:SetDimensions(h, h)
				button:SetAnchor(TOPLEFT,scroll,TOPLEFT,220,h1*(i-1))
				local value,global=GetVar(param)
				button:SetTexture(value and on or off)
				button:SetColor(unpack(global and color_global or color_local))
				button:SetMouseEnabled(true)
				button:SetDrawLayer(DL_CONTROLS)
				button:SetHandler("OnMouseDown", function(self,button)
					SetVar(param,nil,not GetVar(param),button==1)
					value,global=GetVar(param)
					self:SetTexture(value and on or off)
					self:SetColor(unpack(global and color_global or color_local))
					if param=="RememberJunk" then MarkItemHandler() end
				end)
				button:SetHandler("OnMouseEnter", function(self)
					if Localization[lang][param][1] then ZO_Tooltips_ShowTextTooltip(self,BOTTOM,Localization[lang][param][1]) end
					value,global=GetVar(param)
					self:SetColor(unpack(global and color_global_over or color_local_over))
				end)
				button:SetHandler("OnMouseExit", function(self)
					ZO_Tooltips_HideTextTooltip()
					value,global=GetVar(param)
					self:SetColor(unpack(global and color_global or color_local))
				end)
				scroll.button[#scroll.button+1]={control=button,var=param}
				if param=="ChatOutput" then
					local button=WINDOW_MANAGER:CreateControl("$(parent)Button"..#scroll.button+1, scroll, CT_TEXTURE)
					button:SetDimensions(h, h)
					button:SetAnchor(TOPLEFT,scroll,TOPLEFT,220+30,h1*(i-1))
					local value,global=GetVar("DetailedBank")
					button:SetTexture(value and on or off)
					button:SetColor(unpack(global and color_global or color_local))
					button:SetMouseEnabled(true)
					button:SetDrawLayer(DL_CONTROLS)
					button:SetHandler("OnMouseDown", function(self,button)
						SetVar("DetailedBank",nil,not GetVar("DetailedBank"),button==1)
						value,global=GetVar("DetailedBank")
						self:SetTexture(value and on or off)
						self:SetColor(unpack(global and color_global or color_local))
					end)
					button:SetHandler("OnMouseEnter", function(self)
						ZO_Tooltips_ShowTextTooltip(self,BOTTOM,Localization[lang][param][2])
						value,global=GetVar("DetailedBank")
						self:SetColor(unpack(global and color_global_over or color_local_over))
					end)
					button:SetHandler("OnMouseExit", function(self)
						ZO_Tooltips_HideTextTooltip()
						value,global=GetVar("DetailedBank")
						self:SetColor(unpack(global and color_global or color_local))
					end)
					scroll.button[#scroll.button+1]={control=button,var="DetailedBank"}
					local button=WINDOW_MANAGER:CreateControl("$(parent)Button"..#scroll.button+1, scroll, CT_TEXTURE)
					button:SetDimensions(h, h)
					button:SetAnchor(TOPLEFT,scroll,TOPLEFT,220+60,h1*(i-1))
					local value,global=GetVar("DetailedLoot")
					button:SetTexture(value and on or off)
					button:SetColor(unpack(global and color_global or color_local))
					button:SetMouseEnabled(true)
					button:SetDrawLayer(DL_CONTROLS)
					button:SetHandler("OnMouseDown", function(self,button)
						SetVar("DetailedLoot",nil,not GetVar("DetailedLoot"),button==1)
						value,global=GetVar("DetailedLoot")
						self:SetTexture(value and on or off)
						self:SetColor(unpack(global and color_global or color_local))
					end)
					button:SetHandler("OnMouseEnter", function(self)
						ZO_Tooltips_ShowTextTooltip(self,BOTTOM,Localization[lang][param][3])
						value,global=GetVar("DetailedLoot")
						self:SetColor(unpack(global and color_global_over or color_local_over))
					end)
					button:SetHandler("OnMouseExit", function(self)
						ZO_Tooltips_HideTextTooltip()
						value,global=GetVar("DetailedLoot")
						self:SetColor(unpack(global and color_global or color_local))
					end)
					scroll.button[#scroll.button+1]={control=button,var="DetailedLoot"}
				end
			else
				--Checkboxes
				scroll.switch[i]={}
				for b=3,7 do
					if Default[param][b]~=nil then
					local button=WINDOW_MANAGER:CreateControl("$(parent)Button"..#scroll.button+1, scroll, CT_TEXTURE)
					button:SetDimensions(h, h)
					button:SetAnchor(TOPLEFT,scroll,TOPLEFT,220+(b-3)*30,h1*(i-1))
					local value,global=GetVar(param,b)
					button:SetTexture(value and on or off)
					button:SetColor(unpack(global and color_global or color_local))
					button:SetMouseEnabled(true)
					button:SetDrawLayer(DL_CONTROLS)
					button:SetHandler("OnMouseDown", function(self,button)
						SetVar(param,b,not GetVar(param,b),button==1)
						value,global=GetVar(param,b)
						self:SetTexture(value and on or off)
						--Push/Pull switcher
						if data.switch then
							local push=GetVar(param,5)
							local pull=GetVar(param,6)
							if b==5 and pull then
								SetVar(param,6,not pull,global)
								scroll.switch[i][6]:SetTexture(not pull and on or off)
								scroll.switch[i][5]:SetColor(unpack(global and color_global or color_local))
							elseif b==6 and push then
								SetVar(param,5,not push,global)
								scroll.switch[i][5]:SetTexture(not push and on or off)
								scroll.switch[i][5]:SetColor(unpack(global and color_global or color_local))
							end
						end
						--Apply item filters to current character
						if data.filters then
							for filter in pairs(ItemFilters[data.filters]) do
								SetVar(filter,nil,GetVar(filter))
							end
						end
					end)
					button:SetHandler("OnMouseEnter", function(self)
						ZO_Tooltips_ShowTextTooltip(self,BOTTOM,zo_strformat(Localization[lang].Tooltip[b]
							..(b==3 and param=="TreasureMap" and Localization[lang].Tooltip[11].."\""..TreasureMapsChoices[GetVar(param,1)].."\""
								or((b<5 and Default[param][1]) and Localization[lang].Tooltip[8] or "")
								..((type(Default[param][2])=="string" and (b==3 or b==4 or b==6)) and Localization[lang].Tooltip[10]
									or (b==3 and Default[param][2]) and Localization[lang].Tooltip[9] or "")
								..((Localization[lang][param] and Localization[lang][param][b]) or "")
							),ItemQuality[GetVar(param,1)],GetVar(param,2)))
						value,global=GetVar(param,b)
						self:SetColor(unpack(global and color_global_over or color_local_over))
					end)
					button:SetHandler("OnMouseExit", function(self)
						ZO_Tooltips_HideTextTooltip()
						value,global=GetVar(param,b)
						self:SetColor(unpack(global and color_global or color_local))
					end)
					scroll.button[#scroll.button+1]={control=button,var={param,b}}
					scroll.switch[i][b]=button
					end
				end
				--Quality
				if param=="TreasureMap" then
					local control=WINDOW_MANAGER:CreateControlFromVirtual("$(parent)ComboBox1_"..i, scroll, "ZO_ComboBox")
					control:SetDimensions(180, 28)
					control:SetAnchor(TOPLEFT,scroll,TOPLEFT,360,h1*(i-1))
					local comboBox=control.m_comboBox
					comboBox:SetSortsItems(false)
					comboBox:ClearItems()
					for i, v in pairs(TreasureMapsChoices) do
						local entry=ZO_ComboBox:CreateItemEntry(v, function() SetVar(param,1,i,true) end)
						entry.id=i
						comboBox:AddItem(entry, ZO_COMBOBOX_SUPRESS_UPDATE)
					end
					comboBox:SelectItemByIndex(GetVar(param,1), true)
					comboBox:SetFont("ZoFontGame")
				elseif Default[param][1]~=nil then
					local control=WINDOW_MANAGER:CreateControlFromVirtual("$(parent)ComboBox1_"..i, scroll, "ZO_ComboBox")
					control:SetDimensions(90, 28)
					control:SetAnchor(TOPLEFT,scroll,TOPLEFT,360,h1*(i-1))
					local comboBox=control.m_comboBox
					comboBox:SetSortsItems(false)
					comboBox:ClearItems()
					for i, v in pairs(ItemQuality) do
						local entry=ZO_ComboBox:CreateItemEntry(v, function() SetVar(param,1,i,true) end)
						entry.id=i
						comboBox:AddItem(entry, ZO_COMBOBOX_SUPRESS_UPDATE)
					end
					comboBox:SelectItemByIndex(GetVar(param,1), true)
					comboBox:SetFont("ZoFontGame")
					scroll.combobox[#scroll.combobox+1]={control=comboBox,var=param}
					control.la=WINDOW_MANAGER:CreateControl("$(parent)Mark1_"..i, control, CT_LABEL)
					control.la:SetDimensions(20,h)
					control.la:SetAnchor(TOPRIGHT,control,TOPLEFT,-3,0)
					control.la:SetFont("ZoFontGame")
					control.la:SetColor(.6,.6,.4,1)
					control.la:SetHorizontalAlignment(2)
					control.la:SetVerticalAlignment(1)
					control.la:SetText("<=")
				end
				--Character
				if type(Default[param][2])=="string" then
					local control=WINDOW_MANAGER:CreateControlFromVirtual("$(parent)ComboBox2_"..i, scroll, "ZO_ComboBox")
					control:SetDimensions(100, 28)
					control:SetAnchor(TOPLEFT,scroll,TOPLEFT,520,h1*(i-1))
					local comboBox=control.m_comboBox
					comboBox:SetSortsItems(false)
					comboBox:ClearItems()
					for i, name in pairs(Characters) do
						local entry=ZO_ComboBox:CreateItemEntry(name, function()
							if name and name~="" then
								SetVar(param,2,name,true)
							end
						end)
						entry.id=i
						comboBox:AddItem(entry, ZO_COMBOBOX_SUPRESS_UPDATE)
					end
					local cName=GetVar(param,2)
					local index=1 for i, name in pairs(Characters) do if cName==name then index=i break end end
					comboBox:SelectItemByIndex(index, true)
					comboBox:SetFont("ZoFontGame")
--[[
					scroll.combobox[#scroll.combobox+1]={control=comboBox,var=param}
					control.la=WINDOW_MANAGER:CreateControl("$(parent)Mark2_"..i, control, CT_LABEL)
					control.la:SetDimensions(80,h)
					control.la:SetAnchor(TOPRIGHT,control,TOPLEFT,-3,0)
					control.la:SetFont("ZoFontGame")
					control.la:SetColor(.6,.6,.4,1)
					control.la:SetHorizontalAlignment(2)
					control.la:SetVerticalAlignment(1)
					control.la:SetText(Localization[lang].Except)
--]]
				--Price
				elseif Default[param][2]~=nil then
					local control=WINDOW_MANAGER:CreateControl("$(parent)EditBox"..i, scroll, CT_EDITBOX)
					control.bg=WINDOW_MANAGER:CreateControlFromVirtual(nil, control, "ZO_EditBackdrop_Gamepad")
					control.eb=WINDOW_MANAGER:CreateControlFromVirtual(nil, control, "ZO_DefaultEditForBackdrop")
					control:ClearAnchors()
					control:SetAnchor(TOPLEFT,scroll,TOPLEFT,520,h1*(i-1))
					control:SetAnchor(BOTTOMRIGHT, scroll, TOPLEFT, 520+60, h1*(i-1)+h)
					control.bg:SetAnchorFill()
					control.eb:ClearAnchors()
					control.eb:SetAnchorFill()
					control.eb:SetMaxInputChars(6)
					control.eb:SetHandler("OnEnter", function(self) self:LoseFocus() SetVar(param,2,tonumber(self:GetText()),true) end)
					control.eb:SetHandler("OnFocusLost", function(self) self:LoseFocus() SetVar(param,2,tonumber(self:GetText()),true) end)
					control.eb:SetFont("ZoFontGame")
					control.eb:SetText(GetVar(param,2))
					scroll.editbox[#scroll.editbox+1]={control=control.eb,var=param}
					if not data.count then
						control.la=WINDOW_MANAGER:CreateControl("$(parent)Mark2_"..i, control, CT_LABEL)
						control.la:SetDimensions(60,h)
						control.la:SetAnchor(TOPRIGHT,control,TOPLEFT,-3,0)
						control.la:SetFont("ZoFontGame")
						control.la:SetColor(.6,.6,.4,1)
						control.la:SetHorizontalAlignment(2)
						control.la:SetVerticalAlignment(1)
						control.la:SetText(Localization[lang].Tooltip[2])
					end
				end
			end
		end
	end
end

local function OnLoad(_,name)
	if name~=ADDON_NAME then return true end
	GlobalVars=ZO_SavedVars:NewAccountWide("BLM_GlobalVars",2,nil,Default)
	SavedVars=ZO_SavedVars:New("BLM_SavedVars",1,nil,{})
	CustomJunk=ZO_SavedVars:NewAccountWide("BLM_SavedJunk",1,nil,{})
	--Characters
	local AccName=GetDisplayName()
	if BLM_SavedVars and BLM_SavedVars.Default and BLM_SavedVars.Default[AccName] then
		for name, data in pairs(BLM_SavedVars.Default[AccName]) do
--			if name~=PlayerName then
				table.insert(Characters, name)
--			end
		end
	end
	CharacterName=GetUnitName("player")

	Menu_Init()
	Bank_Init()
--	Inventory_Init()
	MarkItemHandler()
	if BUI and BUI.name=="BanditsUserInterface" then LMB='|t16:16:/BanditsUserInterface/textures/lmb.dds|t' RMB='|t16:16:/BanditsUserInterface/textures/rmb.dds|t' end

	ZO_PreHook("SellAllJunk",function() SellJunkItems(false) end)
	ESO_Dialogs["SELL_ALL_JUNK"]={
		title={text=SI_PROMPT_TITLE_SELL_ITEMS},
		mainText={text=SI_SELL_ALL_JUNK},
		buttons={
			[1]={text=SI_SELL_ALL_JUNK_CONFIRM,callback=SellAllJunk},
			[2]={text=SI_DIALOG_DECLINE}
		}
	}

	EVENT_MANAGER:RegisterForEvent(ADDON_NAME,EVENT_OPEN_STORE,function()SellJunkItems(false)end)
	EVENT_MANAGER:RegisterForEvent(ADDON_NAME,EVENT_OPEN_FENCE,OnOpenFence)
	EVENT_MANAGER:RegisterForEvent(ADDON_NAME,EVENT_INVENTORY_SINGLE_SLOT_UPDATE,OnSlotUpdate)
	EVENT_MANAGER:AddFilterForEvent(ADDON_NAME,EVENT_INVENTORY_SINGLE_SLOT_UPDATE,REGISTER_FILTER_BAG_ID,BAG_BACKPACK)
	EVENT_MANAGER:AddFilterForEvent(ADDON_NAME,EVENT_INVENTORY_SINGLE_SLOT_UPDATE,REGISTER_FILTER_INVENTORY_UPDATE_REASON,INVENTORY_UPDATE_REASON_DEFAULT)
	EVENT_MANAGER:RegisterForEvent(ADDON_NAME, EVENT_OPEN_BANK, onOpenBank)
	EVENT_MANAGER:UnregisterForEvent(ADDON_NAME,EVENT_ADD_ON_LOADED)
end

EVENT_MANAGER:RegisterForEvent(ADDON_NAME,EVENT_ADD_ON_LOADED,OnLoad)