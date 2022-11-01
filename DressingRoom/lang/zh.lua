-- translated by 海姆、Raven

ZO_CreateStringId("SI_BINDING_NAME_DRESSINGROOM_TOGGLE", "显示/隐藏窗口")
for i = 1, 24 do
  ZO_CreateStringId("SI_BINDING_NAME_DRESSINGROOM_SET_"..i, "使用配装 "..i)
end
ZO_CreateStringId("SI_BINDING_NAME_DRESSINGROOM_UNDRESS", "卸除所有装备")
ZO_CreateStringId("SI_BINDING_NAME_DRESSINGROOM_PAGE_SELECT_PREVIOUS", "上一页")
ZO_CreateStringId("SI_BINDING_NAME_DRESSINGROOM_PAGE_SELECT_NEXT", "下一页")
ZO_CreateStringId("SI_BINDING_NAME_DRESSINGROOM_CANCEL_PENDING_LOAD", "取消待定加载")
ZO_CreateStringId("SI_BINDING_NAME_DRESSINGROOM_TOGGLE_GROUP_ROLE", "切换组队角色")

DressingRoom._msg = {
  weaponType = {
    [WEAPONTYPE_AXE] = "手斧",
    [WEAPONTYPE_BOW] = "长弓",
    [WEAPONTYPE_DAGGER] = "匕首",
    [WEAPONTYPE_FIRE_STAFF] = "火焰法杖",
    [WEAPONTYPE_FROST_STAFF] = "寒冰法杖",
    [WEAPONTYPE_HAMMER] = "矛锤",
    [WEAPONTYPE_HEALING_STAFF] = "治疗法杖",
    [WEAPONTYPE_LIGHTNING_STAFF] = "闪电法杖",
    [WEAPONTYPE_NONE] = "无",
    [WEAPONTYPE_RUNE] = "符文",
    [WEAPONTYPE_SHIELD] = "盾牌",
    [WEAPONTYPE_SWORD] = "长剑",
    [WEAPONTYPE_TWO_HANDED_AXE] = "战斧",
    [WEAPONTYPE_TWO_HANDED_HAMMER] = "巨锤",
    [WEAPONTYPE_TWO_HANDED_SWORD] = "巨剑",
  },
  
  loadingSet = "加载配装 %s...",
  skillBarSaved = "技能配置 %d 栏位 %d 已保存",
  skillBarLoaded = "技能配置 %d 栏位 %d 已读取",
  skillBarDeleted = "技能配置 %d 栏位 %d 已删除",
  gearSetSaved = "套装配置 %d 已保存",
  gearSetLoaded = "套装配置 %d 已读取",
  gearSetDeleted = "套装配置 %d 已删除",
  noGearSaved = "%d 没有对应套装配置",

  options = {
    reloadUIWarning = "需要重载界面",
    autoReloadUIWarning = "此选项会自动重载界面!",
    reloadUI = "重载界面",
    accountWideSettings = {
      name = "全局设置",
      tooltip = "在账号内使用同样的界面设置\n更改此项目不会更改当前的设置",
    },
    sectionBehaviour = "动作设置",
    autoRechargeWeapons = {
      name = "自动充能武器",
      tooltip = "当你的武器附魔耗尽时,自动使用灵魂宝石为其充能",
    },
    clearEmptyGear = {
      name = "清除空装备槽",
      tooltip = "加载带有空槽位的装备配置时,清除之前的装备",
    },
    clearEmptyPoisons = {
      name = "清除空毒药槽",
      tooltip = "当配装中不包含毒药, 清除之前的毒药",
    },
    clearEmptySkill = {
      name = "清除空技能槽",
      tooltip = "加载带有空槽位的技能配置时,清除之前的技能",
    },
    ignoreAppearanceSlot = {
      name = "忽视外观槽",
      tooltip = "不装备或解除伪装或公会战袍",
    },
    enableOutfits = {
      name = "保存/载入服装",
      tooltip = "与配装同时保存和载入激活的服装",
    },
    disableInCombat = {
      name = "战斗中禁用",
      tooltip = "战斗中禁止更换配置,且结束后也不自动更换",
    },
    sectionUI = "界面设置",
    showNotificationArea = {
      name = "显示通知",
      tooltip = "显示通知区域和当前加载的预置的名称",
    },
    lockNotificationArea = {
      name = "锁定通知区域",
      tooltip = "锁定通知区域的界面位置",
    },
    activeBarOnly = {
      name = "技能设置按钮仅限当前技能栏",
      tooltip = "只显示当前技能栏的技能设置按钮",
    },
    lockWindowPosition = {
      name = "锁定窗口位置",
      tooltip = "锁定窗口防止拖动",
    },
    fontSize = {
      name = "文字大小",
      tooltip = "界面字体大小",
    },
    btnSize = {
      name = "技能图标大小",
      tooltip = "技能图标大小",
    },
    columnMajorOrder = {
      name = "列排序",
      tooltip = "对于界面中的配置,使用列(垂直)排序",
    },
    openWithSkillsWindow = {
      name = "在技能窗口显示",
      tooltip = "打开技能窗口时自动显示界面",
    },
    openWithInventoryWindow = {
      name = "在物品窗口显示",
      tooltip = "打开物品窗口时自动显示界面",
    },
    numRows = {
      name = "行数",
      tooltip = "窗口中包含的配置行数",
    },
    numCols = {
      name = "列数",
      tooltip = "窗口中包含的配置列数",
    },
    showChatMessages = {
      name = "显示聊天消息",
      tooltip = "保存、装备或删除配装或技能栏时在聊天框显示一条消息",
    },
    singleBarToCurrent = {
      name = "加载单技能栏配置到当前技能栏",
      tooltip = "加载一个单技能栏且不带装备的配置时,将仅更新当前技能栏,不更新其他内容",
    },
    autoCloseOnMovement = {
      name = "移动时自动关闭",
      tooltip = "移动时自动关闭Dressing Room的窗口",
    },
    enablePages = {
      name = "使用配置页",
      tooltip = "禁用此选项将不会清除现有配置页，仅隐藏当前配置页，您下次打开时将恢复",
    },
    confirmPageDelete = {
      name = "确认配置页删除",
      tooltip = "删除配置页时显示确认提示",
    },
    alwaysChangePageOnZoneChanged = {
      name = "区域变更时改变配置页",
      tooltip = "如果当前没有一个以您新进入地区命名的预设配置,则加载默认(第一个)配置页",
    },
    useOldUI = {
      name = "使用旧版界面",
      tooltip = "使用原版界面",
    },
    roleSpecificPresets = {
      name = "启用角色页面",
      tooltip = "为不同的组队角色显示不同的可选配置页",
    },
    roleFromLFGTool = {
      name = "LFG工具自动选择角色",
      tooltip = "在LFG工具中更改您的组队角色后，自动选择适当的配置页",
    },
    autoSaveChangesOnClose = {
      name = "关闭窗口时自动保存",
      tooltip = "当关闭Dressing Room窗口时自动保存所有您更改的内容。\n|cff8000注意，你需要重载界面或登出才能将数据保存在磁盘上。|r",
    },
    expertFeatures = "专家模式",
    enableExpertFeatures = {
      name = "开启专家模式",
      tooltip = "我已经阅读了所有的警告,并备份了Dressing Room的配置信息",
    },
    changeDefaultRole = {
      name = "更改默认设置",
      tooltip = "如果你选择了错误的默认角色，你可以使用此按钮。",
    },
    exchangePages = {
      name = "交換页",
      tooltip = "这将把所有你的\"%s\"预设与已选中的预设进行 *调换* 。",
    },
    purgeCharacterData = {
      name = "|cff0000 清除角色数据 |r",
      tooltip = "删除所有配置信息, 并且重置此角色所有配置 \n\n按键绑定不会被重置",
    },
    importPresetsFromCharacter = {
      name = "从角色导入预设",
      tooltip = "如下方选项未开启，此选项将不会删除当前预设，仅在此列表末尾添加新配置页。",
    },
    purgePresetsBeforeImporting = {
      name = "导入前清除预设",
      tooltip = "从其他角色复制预设，并清除当前角色现有预设。",
    },
    importAlphaGear = "|cff0000从 AlphaGear导入配置|r",
    importAlphaGearWarning = "|cff0000注意 - 实验功能! - 按键之前仔细阅读!|r\n\n此操作会删除 Dressing Room 的所有配置信息（如果选择下方选项按键绑定也将重置）。如果你确实需要操作，请先备份配置文件。\n\n 此操作仅兼容'|cFFAA33AlphaGear 2 %s|r', .使用其他版本风险自负.%s\n\n此选项同时会重载界面.",
    importAlphaGearVersionMismatchWarning = "已安装版本:",
    importAlphaGearNotDetected = "未找到AlphaGear, 请启用后再试",
    importAlphaGearRebindKeys = {
      name = "重新绑定按键",
      tooltip = "建议先关闭，检查配置后再开启.",
    },
  },

  setupWindowText = "选择角色的首选设置:",
  setupWindowText2 = "这个可以在插件设置中进行设置.",

  confirmDeletePagePromptOld = "确定删除配置页?",
  confirmDeletePagePrompt = "确定删除配置页 \"<<1>>\"?",
  editPageNamePrompt = "为 \"<<1>>\"输入新名称:",

  changesSave = "确认改变",
  changesUndo = "取消所有改变",

  barBtnText = "点击加载此单独技能栏\nShift + 左键点击保存\nCtrl + 左键点击删除",
  gearBtnText = "点击使用套装配置\nShift + 左键点击保存\nCtrl + 左键点击删除",
  setBtnText = "单击此处加载套装配置和技能配置",

  bttnUndressText = "解除装备",
  undressClicked = "解除所有装备",

  set = "设置",
  usedBy = "使用者:",

  rechargedWeapon = "|cff0000%s|r被充能，使用了|c00ff00%s|r",

  waitingForWeaponSwap = "需要切换技能栏",
  waitingForOutOfCombat = "需要脱离战斗",
}

