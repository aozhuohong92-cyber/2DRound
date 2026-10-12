TaskExpTips = TaskExpTips or BaseClass(BaseView)
slot0 = TipsController:getInstance()

function TaskExpTips.__init(slot0)
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "tips/task_exp_tips"
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.item_list = {}
end

function TaskExpTips.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_panel")
	slot0.task_name = slot0.main_container:getChildByName("task_name")
	slot0.have_time = slot0.main_container:getChildByName("have_time")
	slot0.player_name_key = slot0.main_container:getChildByName("player_name_key")

	slot0.player_name_key:setString(TI18N("达成者:"))

	slot0.player_name = slot0.main_container:getChildByName("player_name")
	slot0.task_desc = createRichLabel(22, cc.c4b(100, 50, 35, 255), cc.p(0, 0.5), cc.p(38, 80), nil, , 370)

	slot0.main_container:addChild(slot0.task_desc)
end

function TaskExpTips.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:onCloseBtn()
	end, false, 2)
end

function TaskExpTips.onCloseBtn(slot0)
	uv0:openTaskExpTips(false)
end

function TaskExpTips.openRootWnd(slot0, slot1)
	slot2 = slot1 or {}
	slot4 = slot2.finish_time or 0
	slot5 = slot2.have_name or ""

	if Config.RoomFeatData.data_exp_info[slot2.id] then
		slot0.task_name:setString(slot6.name)
		slot0.task_desc:setString(slot6.desc)
	end

	slot0.have_time:setString(TimeTool.getYMD3(slot4 or 0))
	slot0.player_name:setString(slot5)
end

function TaskExpTips.close_callback(slot0)
	uv0:openTaskExpTips(false)
end
