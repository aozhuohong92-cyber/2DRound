ActivePushWindow = ActivePushWindow or BaseClass(BaseView)
slot0 = Config.HolidayRolePushData
slot1 = RoleController:getInstance()

function ActivePushWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.TOP_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = true
	slot0.layout_name = "action/action_active_push"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("activepush", "activepush_bg3", false),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("activepush", "activepush_bg4", false),
			type = ResourcesType.single
		}
	}
end

function ActivePushWindow.openRootWnd(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	slot0.push_id_list = slot1

	if table.remove(slot0.push_id_list) and slot2.id then
		slot0.push_id = slot2.id

		if not slot0.background_load then
			slot0.background_load = loadSpriteTextureFromCDN(slot0.image_bg, PathTool.getPlistImgForDownLoad("activepush", "activepush_bg" .. slot0.push_id), ResourcesType.single, slot0.background_load)
		end

		slot0:initUI()
	end
end

function ActivePushWindow.initUI(slot0)
	if slot0.push_id and slot0.close_btn and slot0.close_btn.loadTexture and slot0.goto_btn and slot0.goto_btn.loadTexture then
		if slot0.push_id == 1 then
			slot0.close_btn:loadTexture(PathTool.getResFrame("welfare", "welfare_close"), LOADTEXT_TYPE_PLIST)
			slot0.close_btn:setPosition(605, 857)
			slot0.goto_btn:loadTexture(PathTool.getResFrame("common", "common_1018"), LOADTEXT_TYPE_PLIST)
			slot0.goto_btn:setPositionY(0)
			slot0.goto_btn_label:enableOutline(cc.c4b(41, 74, 21, 255), 2)
			slot0.goto_btn_label:setString(TI18N("立即前往"))
		elseif slot0.push_id == 2 then
			slot0.close_btn:loadTexture(PathTool.getResFrame("welfare", "welfare_close_1"), LOADTEXT_TYPE_PLIST)
			slot0.close_btn:setPosition(640, 905)
			slot0.goto_btn:loadTexture(PathTool.getResFrame("common", "common_1017"), LOADTEXT_TYPE_PLIST)
			slot0.goto_btn:setPositionY(-25)
			slot0.goto_btn_label:enableOutline(cc.c4b(118, 69, 25, 255), 2)
			slot0.goto_btn_label:setString(TI18N("立即前往"))
		elseif slot0.push_id == 3 then
			slot0.close_btn:loadTexture(PathTool.getResFrame("welfare", "welfare_close"), LOADTEXT_TYPE_PLIST)
			slot0.close_btn:setPosition(640, 870)
			slot0.goto_btn:loadTexture(PathTool.getResFrame("common", "common_1017"), LOADTEXT_TYPE_PLIST)
			slot0.goto_btn:setPositionY(-50)
			slot0.goto_btn_label:enableOutline(cc.c4b(118, 69, 25, 255), 2)
			slot0.goto_btn_label:setString(TI18N("立即前往"))
		elseif slot0.push_id == 3 or slot0.push_id == 4 then
			slot0.close_btn:loadTexture(PathTool.getResFrame("welfare", "welfare_close"), LOADTEXT_TYPE_PLIST)
			slot0.close_btn:setPosition(585, 815)
			slot0.goto_btn:loadTexture(PathTool.getResFrame("common", "common_1017"), LOADTEXT_TYPE_PLIST)
			slot0.goto_btn:setPositionY(-45)
			slot0.goto_btn_label:enableOutline(cc.c4b(118, 69, 25, 255), 2)
			slot0.goto_btn_label:setString(TI18N("立即前往"))
		end
	end
end

function ActivePushWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.image_bg = slot0.main_container:getChildByName("image_bg")
	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.goto_btn = slot0.main_container:getChildByName("goto_btn")
	slot0.goto_btn_label = slot0.goto_btn:getChildByName("label")

	slot0.goto_btn_label:setString(TI18N("前 往"))
	slot0:register_event()
end

function ActivePushWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openActivePushWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.background, function ()
		uv0:openActivePushWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.goto_btn, function ()
		uv0:onGotoBtn()
	end, true, 2)
end

function ActivePushWindow.onGotoBtn(slot0)
	if slot0.push_id and uv0 and uv0.data_push_list and uv0.data_push_list[slot0.push_id] then
		if uv0.data_push_list[slot0.push_id].jump_id then
			if slot1 == 1 then
				slot0:enterActive(ActionRankCommonType.select_elite_summon)
			elseif slot1 == 2 then
				JumpController:getInstance():jumpViewByEvtData({
					76
				})
			elseif slot1 == 3 then
				slot0:enterActive(ActionRankCommonType.FortuneBagDraw)
			elseif slot1 == 4 then
				slot0:enterActive(ActionRankCommonType.select_elite_summon)
			else
				ActionController:getInstance():openActionMainPanel(true, MainuiConst.icon.festival)
			end
		else
			ActionController:getInstance():openActionMainPanel(true, MainuiConst.icon.festival)
		end
	end

	uv1:openActivePushWindow(false)
end

function ActivePushWindow.enterActive(slot0, slot1)
	if slot1 then
		if ActionController:getInstance():getActionSubTabVo(slot1) then
			slot2:openActionMainPanel(true, nil, slot3.bid)
		else
			message(TI18N("该活动已结束"))
		end
	else
		message(TI18N("该活动已结束"))
	end
end

function ActivePushWindow.close_callback(slot0)
	if slot0.background_load then
		slot0.background_load:DeleteMe()

		slot0.background_load = nil
	end

	uv0:openActivePushWindow(false)
end
