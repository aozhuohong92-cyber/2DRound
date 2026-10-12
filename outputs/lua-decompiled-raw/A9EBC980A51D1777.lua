ActionSevenLoginWindow = ActionSevenLoginWindow or BaseClass(BaseView)

function ActionSevenLoginWindow.__init(slot0)
	slot0.ctrl = ActionController:getInstance()
	slot0.is_full_screen = true
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "action/action_seven_login_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("actionsevenlogin", "actionsevenlogin"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/action", "action_bigbg_2"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/action", "action_seven_bg1"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/action", "action_seven_bg2"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_action_seven_login_title1"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_action_seven_login_title2"),
			type = ResourcesType.single
		}
	}
	slot0.day_list = {}
	slot0.cur_select = nil
	slot0.cur_index = nil
end

function ActionSevenLoginWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.container = slot0.main_panel:getChildByName("container")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.model_icon = slot0.main_panel:getChildByName("model_icon")
	slot0.title = slot0.main_panel:getChildByName("title")
	slot0.btn = slot0.container:getChildByName("btn")

	slot0.btn:setName("get_btn")
	slot0.btn:setTitleText(TI18N("领取"))

	slot0.btn.label = slot0.btn:getTitleRenderer()

	if slot0.btn.label ~= nil then
		slot0.btn.label:enableOutline(Config.ColorData.data_color4[154], 2)
	end

	setChildUnEnabled(false, slot0.btn)

	slot0.day_label = slot0.container:getChildByName("day_label")

	slot0.day_label:setLocalZOrder(21)

	slot0.day_bg = slot0.container:getChildByName("day_bg")

	slot0.day_bg:setLocalZOrder(20)

	slot4 = "seven_con"
	slot0.seven_con = slot0.container:getChildByName(slot4)

	for slot4 = 1, 7 do
		slot6 = LoginItem.new()

		slot6:setData(slot4)
		slot0.seven_con:getChildByName("day" .. slot4):addChild(slot6)

		slot0.day_list[slot4] = slot6

		slot6:addCallBack(function ()
			uv0:selectByIndex(uv1)
		end)
		slot0.day_list[slot4]:setStatus(1)
	end

	slot0.goods_con = slot0.container:getChildByName("goods_con")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.goods_con, cc.p(0, 2), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.goods_con:getContentSize(), {
		start_y = 5,
		start_x = 10,
		space_x = 15,
		row = 1,
		space_y = 4,
		col = 0,
		item_class = BackPackItem,
		item_width = BackPackItem.Width,
		item_height = BackPackItem.Height
	})

	slot0.item_scrollview:setSwallowTouches(false)
	slot0.ctrl:cs21100()
end

function ActionSevenLoginWindow.openRootWnd(slot0)
end

function ActionSevenLoginWindow.selectByIndex(slot0, slot1, slot2)
	if slot0.cur_index == slot1 and not slot2 then
		return
	end

	slot0.index = slot1

	if slot0.cur_select ~= nil then
		slot0.cur_select:setSelect(false)
	end

	slot0.cur_index = slot1
	slot0.cur_select = slot0.day_list[slot1]

	slot0.cur_select:setSelect(true)

	slot3 = PathTool.getTargetRes("bigbg/action", "action_seven_bg1", false, false)
	slot4 = PathTool.getTargetRes("bigbg/action", "txt_cn_action_seven_login_title1", false, false)

	if slot1 <= 2 then
		slot3 = PathTool.getTargetRes("bigbg/action", "action_seven_bg1", false, false)
		slot4 = PathTool.getTargetRes("bigbg/action", "txt_cn_action_seven_login_title1", false, false)
	else
		slot3 = PathTool.getTargetRes("bigbg/action", "action_seven_bg2", false, false)
		slot4 = PathTool.getTargetRes("bigbg/action", "txt_cn_action_seven_login_title2", false, false)
	end

	loadSpriteTexture(slot0.model_icon, slot3, LOADTEXT_TYPE)
	loadSpriteTexture(slot0.title, slot4, LOADTEXT_TYPE)
	slot0.day_label:setString(TI18N("第") .. StringUtil.numToChinese(slot1) .. TI18N("天"))

	slot5 = {}
	slot7 = {}

	if Config.LoginDaysData.data_day[slot1].spec_reward then
		for slot11, slot12 in ipairs(slot6) do
			if not slot7[slot12] then
				slot7[slot12] = {
					effect_id = slot12
				}
			end
		end
	end

	for slot11, slot12 in pairs(Config.LoginDaysData.data_day[slot1].rewards) do
		slot13 = {}

		if deepCopy(Config.ItemData.data_get_data(slot12[1])) then
			slot13.show_effect = slot7[slot12[1]]
			slot13.quantity = slot12[2]

			table.insert(slot5, slot13)
		end
	end

	if slot0.day_list[slot0.index].status == 2 then
		setChildUnEnabled(false, slot0.btn)

		if slot0.btn.label ~= nil then
			slot0.btn.label:enableOutline(Config.ColorData.data_color4[154], 2)
		end
	else
		setChildUnEnabled(true, slot0.btn)

		if slot0.btn.label ~= nil then
			slot0.btn.label:disableEffect(cc.LabelEffect.OUTLINE)
		end
	end

	if #slot5 > 4 then
		slot0.item_scrollview:setClickEnabled(true)
	else
		slot0.item_scrollview:setClickEnabled(false)
	end

	slot0.item_scrollview:setData(slot5)
	slot0.item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
			slot5:setDefaultTip()

			if slot5.data and slot5.data.show_effect then
				if slot5.data.quality >= 4 then
					slot5:showItemEffect(true, 263, PlayerAction.action_1, true, 1.1)
				else
					slot5:showItemEffect(true, 263, PlayerAction.action_2, true, 1.1)
				end
			else
				slot5:showItemEffect(false)
			end
		end
	end)
end

function ActionSevenLoginWindow.register_event(slot0)
	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0.ctrl:openSevenLoginWin(false)
			end
		end)
	end

	slot0.btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.day_list[uv0.index] then
				if uv0.day_list[uv0.index].status == 2 then
					uv0.ctrl:cs21101(uv0.index)
					setChildUnEnabled(false, uv0.btn)

					uv0.btn.label = uv0.btn:getTitleRenderer()

					if uv0.btn.label ~= nil then
						uv0.btn.label:enableOutline(Config.ColorData.data_color4[154], 2)
					end
				elseif uv0.day_list[uv0.index].status == 3 then
					setChildUnEnabled(true, uv0.btn)

					uv0.btn.label = uv0.btn:getTitleRenderer()

					if uv0.btn.label ~= nil then
						uv0.btn.label:disableEffect(cc.LabelEffect.OUTLINE)
					end

					message(TI18N("已经领取过啦"))
				elseif uv0.day_list[uv0.index].status == 1 then
					setChildUnEnabled(true, uv0.btn)

					uv0.btn.label = uv0.btn:getTitleRenderer()

					if uv0.btn.label ~= nil then
						uv0.btn.label:disableEffect(cc.LabelEffect.OUTLINE)
					end

					message(TI18N("未到天数"))
				end
			end
		end
	end)

	if slot0.update_status == nil then
		slot0.update_status = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_SEVEN_LOGIN_STATUS, function (slot0)
			if slot0.status_list then
				for slot4, slot5 in pairs(slot0.status_list) do
					uv0.day_list[slot5.day]:setStatus(slot5.status)
				end

				uv0.now_day = math.min(#slot0.status_list + 1, 7)

				uv0:selectByIndex(uv0:getMinGetDay(slot0.status_list), true)
			end
		end)
	end

	if slot0.get_event == nil then
		slot0.get_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_SEVEN_LOGIN_REWARDS, function (slot0)
		end)
	end
end

function ActionSevenLoginWindow.getMinGetDay(slot0, slot1)
	slot2 = slot0.now_day

	for slot6, slot7 in pairs(slot1) do
		if slot7.day == 1 and slot7.status == 2 then
			return 1
		elseif slot7.day < slot2 and slot7.status == 2 then
			slot2 = slot7.day
		end
	end

	return slot2
end

function ActionSevenLoginWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	for slot4, slot5 in pairs(slot0.day_list) do
		if slot5 then
			slot5:DeleteMe()
		end
	end

	slot0.day_list = nil

	if slot0.update_status ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_status)

		slot0.update_status = nil
	end

	if slot0.get_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.get_event)

		slot0.get_event = nil
	end

	slot0.ctrl:openSevenLoginWin(false)
end

LoginItem = class("LoginItem", function ()
	return ccui.Widget:create()
end)

function LoginItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()

	slot0.status = 1
end

function LoginItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_seven_login_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(100, 120))
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0.main_container:setTouchEnabled(true)
	slot0.main_container:setSwallowTouches(false)
	slot0.main_container:getChildByName("title_bg"):setLocalZOrder(21)

	slot0.title = slot0.main_container:getChildByName("title")

	slot0.title:setLocalZOrder(21)

	slot0.get = slot0.main_container:getChildByName("get")

	slot0.get:setVisible(false)

	slot0.select = slot0.main_container:getChildByName("select")

	slot0.select:setVisible(false)

	slot0.effect = createEffectSpine(PathTool.getEffectRes(257), cc.p(slot0.main_container:getContentSize().width / 2, slot0.main_container:getContentSize().height / 2), cc.p(0.5, 0.5), true, "action")

	slot0.effect:setVisible(false)
	slot0.main_container:addChild(slot0.effect, 20)

	slot0.icon = slot0.main_container:getChildByName("icon")
end

function LoginItem.register_event(slot0)
	slot0.main_container:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.callback then
				uv0:callback()
			end
		end
	end)
end

function LoginItem.setData(slot0, slot1)
	slot0.title:setString(TI18N("第") .. StringUtil.numToChinese(slot1) .. TI18N("天"))
	loadSpriteTexture(slot0.icon, PathTool.getResFrame("actionsevenlogin", "txt_cn_seven_login_item_" .. slot1), LOADTEXT_TYPE_PLIST)

	if slot1 == 2 or slot1 == 3 then
		if slot0.effect2 == nil then
			slot0.effect2 = createEffectSpine(PathTool.getEffectRes(258), cc.p(slot0.main_container:getContentSize().width / 2, slot0.main_container:getContentSize().height / 2), cc.p(0.5, 0.5), true, "action")

			slot0.main_container:addChild(slot0.effect2, 19)
		end

		if slot0.effect2 then
			slot0.effect2:setVisible(true)
		end
	elseif slot0.effect2 then
		slot0.effect2:setVisible(false)
	end
end

function LoginItem.setStatus(slot0, slot1)
	slot0.status = slot1

	if slot0.status == 3 then
		if slot0.effect2 and not tolua.isnull(slot0.effect2) then
			slot0.effect2:setVisible(false)
		end

		if slot0.effect and not tolua.isnull(slot0.effect) then
			slot0.effect:setVisible(false)
		end

		slot0.get:setVisible(true)
	else
		slot0.get:setVisible(false)
	end

	if slot0.status == 2 then
		if slot0.effect and not tolua.isnull(slot0.effect) then
			slot0.effect:setVisible(true)
		end
	elseif slot0.effect and not tolua.isnull(slot0.effect) then
		slot0.effect:setVisible(false)
	end
end

function LoginItem.setSelect(slot0, slot1)
	if slot1 then
		slot0.select:setVisible(true)
	else
		slot0.select:setVisible(false)
	end
end

function LoginItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function LoginItem.DeleteMe(slot0)
end
