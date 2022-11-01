NAS = NAS or {}
NAS.localization = NAS.localization or {}

local L = {}

-- keybind
L.NAS_CONFIRM_STEAL 				= "确认偷窃"

-- steal info
L.NAS_SHOW_INFO_CHECKBOX			= "显示状态信息"
L.NAS_SHOW_INFO_CHECKBOX_TOOLTIP	= "如果启用，本插件将在偷窃时显示如何让偷窃指令可用"

-- addon description
L.NAS_ADDON_NAME					= "NoAccidentalStealing(防止意外偷窃)"

-- option strings
L.NAS_STEALTH_ALLOW 				= "潜行来偷窃"
L.NAS_STEALTH_ALLOW_OR				= "或潜行来偷窃"
L.NAS_CONFIRM_SETTING_HEAD			= "确认设置"
L.NAS_CONFIRM_SETTING_TEXT			= [[符合以下条件，可以进行偷窃:
 - 你的角色是隐藏状态
 - 你按住确认按钮时 (可以在游戏控制菜单中设置)
 - 你双击了偷窃交互按钮 (双击间隔的相关设置可以在下面修改)]]
L.NAS_DOUBLE_TAP_HEAD				= "双击设置"
L.NAS_DOUBLE_TAP_TITLE				= "双击速度"
L.NAS_DOUBLE_TAP_TEXT				= [[双击偷窃交互按钮将直接偷窃, 即便你并不想偷.]]
--要修改双击间隔的时长, 轻点击 "配置" 按钮并双击想要的偷窃交互按钮 (默认是 E ).]]
L.NAS_DOUBLE_TAP_BUTTON				= "配置"
L.NAS_DOUBLE_TAP_SLIDER				= "双击间隔(单位毫秒)"
L.NAS_DOUBLE_TAP_SLIDER_TOOLTIP		= "你可以直接设置双击的开关, 以取代确认按钮."
L.NAS_CONTAINER_HEAD				= "容器设置"
L.NAS_CONTAINER_CHECKBOX			= "允许搜寻容器"
L.NAS_CONTAINER_CHECKBOX_TOOLTIP	= "打开容器并不犯罪. 如果此项启用, 即便你不想偷窃也可以打开（含赃物的）容器."
L.NAS_ABILITY_HEAD					= "犯罪行为"
L.NAS_ABILITY_TEXT					= "一些死灵法师的技能也被视为犯罪. 当你不再战斗中，这些能力将被禁止使用, 除非你按住这些按钮直到确认.\n(不兼容手柄模式.)"
L.NAS_ABILITY_SLIDER				= "按住持续时间 (单位毫秒)"
L.NAS_ABILITY_SLIDER_TOOLTIP		= ""

for tag, localizedString in pairs(L) do
	NAS.localization[tag] = localizedString
end
