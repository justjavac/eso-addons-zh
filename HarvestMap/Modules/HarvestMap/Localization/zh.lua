
Harvest.localizedStrings = {
	-- top level description
	esouidescription = "有关插件描述和常见问题，请访问esoui.com上的插件页面",
	openesoui = "打开ESOUI",
	exchangedescription2 = "您可以通过安装HarvestMap-Data插件来下载大多数最新的HarvestMap数据(资源位置)。更多信息请参见ESOUI网站上的插件描述。",
	
	notifications = "通知和警告",
	notificationstooltip = "在屏幕右上角显示通知和警告。",
	moduleerrorload = " <<1>> 插件被禁用了。\n此区域没有可用数据。",
	moduleerrorsave = " <<1>> 插件被禁用了。\n此节点的位置信息没有被保存。",
	
	-- outdated data settings
	outdateddata = "过时的数据设置",
	outdateddatainfo = "这些数据相关的设置在这台计算机上的所有帐户和角色之间共享.",
	timedifference = "只保存最近的数据",
	timedifferencetooltip = "HarvestMap将只保存最近X天的数据。\n这可以防止显示可能已经过时的旧数据。\n设置为0以保存任何数据，不论其时间.",
	applywarning = "旧数据一旦删除，就无法恢复!",
	
	-- account wide settings
	account = "账户全局设置",
	accounttooltip = "下面的所有设置对所有角色都是相同的.",
	accountwarning = "更改此设置将重新加载UI.",
	
	-- map pin settings
	mapheader = "地图标记设置",
	mappins = "在主地图上显示标记",
	minimappins = "在小地图上显示标记",
	minimappinstooltip = "支持的小地图插件：Votan, Fyrakin和AUI",
	level = "在地点图标之上显示标记",
	hasdrawdistance = "只显示附近的地图标记",
	hasdrawdistancetooltip = "开启时, HarvestMap只为靠近玩家的采集地点创建地图标记.\n此设置只影响主地图。小地图上则会自动启用此选项!",
	hasdrawdistancewarning = "此设置只影响游戏内地图。小地图上则会自动启用此选项!",
	drawdistance = "地图标记距离",
	drawdistancetooltip = "绘制地图标记的距离阈值。此设置也影响小地图!",
	drawdistancewarning = "此设置也影响小地图!",
	
	visiblepintypes = "可见标记类型",
	custom_profile = "自定义",
	same_as_map = "和地图上一样",
	
	-- compass settings
	compassheader = "罗盘设置",
	compass = "在罗盘上显示标记",
	compassdistance = "最大标记距离",
	compassdistancetooltip = "显示在罗盘上标记的最大距离(以米为单位).",
	
	-- 3d pin settings
	worldpinsheader = "3D标记设置",
	worldpins = "在3D世界中显示标记",
	worlddistance = "最大3D标记距离",
	worlddistancetooltip = "显示采集位置的最大距离(以米为单位)。当一个位置较远时, 则不会显示3D标记。",
	worldpinwidth = "3D标记宽度",
	worldpinwidthtooltip = "3D标记的宽度，单位为厘米。",
	worldpinheight = "3D标记高度",
	worldpinheighttooltip = "3D标记的高度，单位为厘米。",
	worldpinsdepth = "为3D标记使用深度提升",
	worldpinsdepthtooltip = "关闭时, 3D标记将可以透过墙或其他物体而被看见。",
	worldpinsdepthwarning = "由于一个ESO游戏BUG, 当在游戏的视频选项中将二次取样质量设置为中等或者低时，此选项无法生效。",
	
	
	-- respawn timer settings
	visitednodes = "已访问的节点和采集助手",
	rangemultiplier = "访问的节点范围",
	rangemultipliertooltip = "在X米内的节点才会被隐藏计时器和采集助手访问。",
	usehiddentime = "隐藏最近访问的节点",
	usehiddentimetooltip = "隐藏您最近访问过的标记位置。",
	hiddentime = "隐藏持续时间",
	hiddentimetooltip = "最近访问的节点将被隐藏X分钟。",
	hiddenonharvest = "只在采集之后隐藏节点",
	hiddenonharvesttooltip = "开启此选项后只当你已采集时隐藏标记。关闭后当你访问时标记也将被隐藏。",
	
	-- spawn filter
	spawnfilter = "已刷新资源筛选器",
	nodedetectionmissing = "只有当'NodeDetection'运行库开启时，这些选项才可用。",
	spawnfilterdescription = [[当开启, HarvestMap将隐藏还未刷新出来的资源标记。
例如，如果另一个玩家已经采集了资源, 那么标记将被隐藏，直到资源再次可用。
此选项仅适用于可采集的制造原料。HarvestMap无法侦测已刷新的容器，例如宝箱，重麻袋或赛伊克传送门。
当其他插件隐藏或调整了罗盘时，此筛选器不可用。]],
	spawnfilter_map = "在主地图上使用筛选器",
	spawnfilter_minimap = "在小地图上使用筛选器",
	spawnfilter_compass = "为罗盘标记使用筛选器",
	spawnfilter_world = "为3D标记使用筛选器",
	spawnfilter_pintype = "为标记类型启用筛选器:",
	
	-- pin type options
	pinoptions = "标记类型选项",
	pinsize = "标记尺寸",
	pinsizetooltip = "设置地图上的标记尺寸.",
	pincolor = "标记颜色",
	pincolortooltip = "设置地图和罗盘上标记的颜色.",
	savepin = "保存位置",
	savetooltip = "启用在发现资源时保存它们的位置。",
	pintexture = "标记图标",
	
	-- pin type names
	pintype1 = "锻造和首饰",
	pintype2 = "制衣",
	pintype3 = "符文石和赛伊克传送门",
	pintype4 = "蘑菇",
	pintype13 = "草药/花朵",
	pintype14 = "水生植物",
	pintype5 = "木材",
	pintype6 = "宝箱",
	pintype7 = "溶剂",
	pintype8 = "钓鱼点",
	pintype9 = "重麻袋",
	pintype10 = "盗贼的宝藏",
	pintype11 = "审判容器",
	pintype12 = "隐藏物品",
	pintype15 = "巨型水蚌",
	-- pin type 16, 17 used to be jewlry and psijic portals 
	-- but the locations are the same as smithing and runes
	pintype18 = "未知节点",
	pintype19 = "猩红奈恩根",
	
	-- extra map filter buttons
	deletepinfilter = "删除HarvestMap标记",
	filterheatmap = "热力地图模式",
	
	-- localization for the farming helper
	goldperminute = "每分钟的金币:",
	farmresult = "HarvestFarm 结果",
	farmnotour = "HarvestFarm 不能基于设定的最小路线长度计算出一个良好的收割路线。",
	farmerror = "HarvestFarm 错误",
	farmnoresources = "没有找到资源。\n此地图上没有资源，或者您没有选择任何资源类型。",
	farmsuccess = "HarvestFarm 计算出了一条每公里 <<1>> 节点的收割线路。\n\n按一下其中一个路线标记以设定路线的起点。",
	farmdescription = "HarvestFarm 将计算出一条非常高效的资源收割线路。\n在生成一条线路之后, 点击其中一个被选择的资源来设置线路的起点。",
	farmminlength = "最小长度",
	farmminlengthdescription = "路线越长, 当您开始下一个循环时，资源重新出现的机会就越大。\n然而，一个较短的线路将获得更高的收割效率。\n(最小长度以千米为单位。)",
	tourpin = "你线路的下一个目标",
	calculatetour = "计算线路",
	showtourinterface = "显示路线界面",
	canceltour = "取消线路",
	reverttour = "恢复线路方向",
	resourcetypes = "资源类型",
	skiptarget = "跳过当前目标",
	removetarget = "删除当前目标",
	nodesperminute = "每分钟的节点数",
	distancetotarget = "到下一个资源的距离",
	showarrow = "显示方向",
	removetour = "删除路线",
	undo = "撤消最后的变动",
	tourname = "线路名: ",
	defaultname = "未命名的线路",
	savedtours = "此地图已保存的线路:",
	notourformap = "此地图没有已保存线路。",
	load = "载入",
	delete = "删除",
	saveexiststitle = "请确认",
	saveexists = "此地图已有一个以 <<1>> 命名的线路了。您要覆盖它吗?",
	savenotour = "没有可保存的线路。",
	loaderror = "此线路无法被载入",
	removepintype = "您想从路线中删除 <<1>> 吗?",
	removepintypetitle = "确认删除",
	
	-- extra harvestmap menu
	farmmenu = "收割线路编辑器",
	editordescription = [[在此菜单中，您可以创建和编辑线路。
如果目前没有其他被激活的线路, 您可以通过点击地图标记创建一个线路。
如果有被激活的线路, 您可以通过替换其中一部分来编辑线路:
- 首先点击您线路(红色)中的一个标记。
- 然后,点击你想添加到路线中的标记。 (一条绿色线路将会出现)
- 最后,再次点击你的红色线路中的标记。
现在绿色线路将被插入红色线路。]],
	editorstats = [[节点数量: <<1>>
长度: <<2>> 米
每公里节点数: <<3>>]],

	-- filter profiles
	filterprofilebutton = "打开筛选器配置菜单",
	filtertitle = "筛选器配置菜单",
	filtermap = "地图标记筛选器配置",
	filtercompass = "罗盘标记筛选器配置",
	filterworld = "3D标记筛选器配置",
	unnamedfilterprofile = "未命名配置",
	defaultprofilename = "默认筛选器配置",
	
	-- SI names to fit with ZOS api
	SI_BINDING_NAME_SKIP_TARGET = "跳过目标",
	SI_BINDING_NAME_TOGGLE_WORLDPINS = "切换3D标记",
	SI_BINDING_NAME_TOGGLE_MAPPINS = "切换地图标记",
	SI_BINDING_NAME_TOGGLE_MINIMAPPINS = "切出小地图标记",
	SI_BINDING_NAME_HARVEST_SHOW_PANEL = "打开HarvestMap浏览编辑器",
	SI_BINDING_NAME_HARVEST_SHOW_FILTER = "打开HarvestMap筛选器菜单",
	HARVESTFARM_GENERATOR = "生成新线路",
	HARVESTFARM_EDITOR = "编辑线路",
	HARVESTFARM_SAVE = "保存/载入 线路",
}