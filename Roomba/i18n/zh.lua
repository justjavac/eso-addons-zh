
local strings = {
    ROOMBA_GBANK            = "在公会银行开启Roomba",
    ROOMBA_GBANK_TOOLTIP    = "如果开启, Roomba将在公会银行界面可用",

    ROOMBA_POSITION         = "水平位置",
    ROOMBA_POSITION_TOOLTIP = "为Roomba按钮设置水平位置",

    ROOMBA_POSITION_CHOICE1 = "左边",
    ROOMBA_POSITION_CHOICE2 = "中间",
    ROOMBA_POSITION_CHOICE3 = "右边",
    
    ROOMBA_RESCAN_BANK      = "重新扫描"
}

for stringId, stringValue in pairs(strings) do
    ZO_CreateStringId(stringId, stringValue)
    SafeAddVersion(stringId, 1)
end