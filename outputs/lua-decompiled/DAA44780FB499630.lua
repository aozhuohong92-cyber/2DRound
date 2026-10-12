EndlessOpenTips = EndlessOpenTips or BaseClass(BaseView)
slot0 = Endless_trailController:getInstance()
slot1 = Endless_trailController:getInstance():getModel()
slot2 = string.format

function EndlessOpenTips.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Tips
	slot0.item_list = {}
	slot0.is_full_screen = false
	slot0.layout_name = "endlesstrail/endlesstrail_open_tips"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("endless", "endless_bg_1"),
			type = ResourcesType.single
		}
	}
end

function EndlessOpenTips.open_callback(slot0)
	slot0.background_panel = slot0.root_wnd:getChildByName("background_panel")
	slot0.background = slot0.background_panel:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")

	slot0:playEnterAnimatianByObj(slot0.main_panel, 2)

	slot0.icon_img = slot0.main_panel:getChildByName("icon_img")
	slot0.desc_label = slot0.main_panel:getChildByName("desc_label")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.ok_btn = slot0.main_panel:getChildByName("ok_btn")
	slot0.ok_btn.label = slot0.ok_btn:getChildByName("label")

	slot0.ok_btn.label:setString(TI18N("确 定"))

	slot0.title_container = slot0.main_panel:getChildByName("title_container")
	slot0.title_label = slot0.title_container:getChildByName("title_label")

	slot0.title_label:setString("")

	slot0.time_label = slot0.main_panel:getChildByName("time_label")

	UITool.SetTitleColor(slot0.ok_btn.label)
	UITool.SetTitleColor(slot0.title_label)
	UITool.SetLightColor(slot0.desc_label)
end

function EndlessOpenTips.register_event(slot0)
	registerButtonEventListener(slot0.background_panel, function ()
		uv0:openEndlessOpenTips(false)
	end, false, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openEndlessOpenTips(false)
	end, true, 2)
	registerButtonEventListener(slot0.ok_btn, function ()
		uv0:openEndlessOpenTips(false)
	end, true, 2)
end

function EndlessOpenTips.setData(slot0)
	if not uv0:getEndlessData() then
		return
	end

	if not Config.EndlessData.data_new_type[slot1.next_type] then
		return
	end

	slot0.title_label:setString(slot2.title)
	slot0.desc_label:setString(slot2.describe)

	slot0.icon_img_load = loadSpriteTextureFromCDN(slot0.icon_img, PathTool.getPlistImgForDownLoad("endless", "icon_" .. slot2.icon, false), ResourcesType.single, slot0.icon_img_load)

	commonCountDownTime(slot0.time_label, slot1.next_time, {
		callback = function (slot0)
			uv0:setTimeFormatString(slot0)
		end
	})
end

function EndlessOpenTips.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.time_label:setString(uv0(TI18N("%s后开启"), TimeTool.GetTimeFormatDayIIIIIII(slot1)))
	else
		slot0.time_label:setString("")
	end
end

function EndlessOpenTips.openRootWnd(slot0)
	slot0:setData()
end

function EndlessOpenTips.close_callback(slot0)
	doStopAllActions(slot0.time_label)

	if slot0.icon_img_load then
		slot0.icon_img_load:DeleteMe()

		slot0.icon_img_load = nil
	end

	uv0:openEndlessOpenTips(false)
end
