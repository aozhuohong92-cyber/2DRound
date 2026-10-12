UITool = UITool or {}

function UITool.SetTitleColor(slot0, slot1)
	slot0:enableOutline(Config.ColorData.data_uicolor[2], slot1 or 2)
	slot0:setTextColor(Config.ColorData.data_uicolor[1])
end

function UITool.SetDarkColor(slot0)
	slot0:setTextColor(Config.ColorData.data_uicolor[3])
end

function UITool.SetLightColor(slot0)
	slot0:setTextColor(Config.ColorData.data_uicolor[4])
end
