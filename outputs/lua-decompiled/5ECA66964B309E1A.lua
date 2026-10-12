ActionEightLoginWindow = ActionEightLoginWindow or BaseClass(BaseView)

function ActionEightLoginWindow.__init(slot0)
	slot0.ctrl = ActionController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.is_full_screen = true
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "action/action_eight_login_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("actioneightlogin", "actioneightlogin"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/action", "action_eight_bg"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_action_eight_login_title"),
			type = ResourcesType.single
		}
	}
	slot0.day_list = {}
	slot0.cur_index = nil
end

function ActionEightLoginWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.container = slot0.main_panel:getChildByName("container")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.model_icon = slot0.main_panel:getChildByName("model_icon")
	slot0.title_2 = slot0.main_panel:getChildByName("title_2")
	slot0.btn = slot0.container:getChildByName("btn")

	slot0.btn:setTitleText(TI18N("查看详情"))
	slot0.btn:setVisible(false)

	slot0.day_label = slot0.container:getChildByName("day_label")

	slot0.day_label:setLocalZOrder(21)

	slot4 = "seven_con"
	slot0.seven_con = slot0.container:getChildByName(slot4)

	for slot4 = 1, 8 do
		slot6 = EightLoginItem.new()

		slot6:setData(slot4)
		slot0.seven_con:getChildByName("day" .. slot4):addChild(slot6)

		slot0.day_list[slot4] = slot6

		slot0.day_list[slot4]:setStatus(1)
		slot6:addCallBack(function ()
			if uv0.day_list[uv1] then
				if uv0.day_list[uv1].status == 2 then
					if uv0.model:getSevenLoginData() then
						if uv0:getMinGetDay(slot0.status_list) < uv1 then
							message(TI18N("请先领取前一档奖励"))

							return
						end

						uv0.ctrl:cs21101(uv1)
					end
				elseif uv0.day_list[uv1].status == 3 or uv0.day_list[uv1].status == 1 then
					uv0:selectByIndex(uv1)

					if Config.LoginDaysNewData.data_day[uv1] and slot0.rewards then
						if BackPackConst.checkIsEquip(Config.ItemData.data_get_data(slot0.rewards[1][1]).type) then
							HeroController:getInstance():openEquipTips(true, slot1)
						else
							TipsManager:getInstance():showGoodsTips(slot1)
						end
					end
				end
			end
		end)
	end

	slot0.ctrl:cs21100()
end

function ActionEightLoginWindow.openRootWnd(slot0)
end

function ActionEightLoginWindow.selectByIndex(slot0, slot1, slot2)
	if slot0.cur_index == slot1 and not slot2 then
		return
	end

	slot0.cur_index = slot1
	slot3 = 774
	slot4 = PathTool.getTargetRes("bigbg/action", "action_eight_bg2", false, false)
	slot5 = PathTool.getTargetRes("bigbg/action", "txt_cn_action_eight_login_title1", false, false)

	if slot1 <= 2 then
		slot4 = PathTool.getTargetRes("bigbg/action", "action_eight_bg2", false, false)
		slot5 = PathTool.getTargetRes("bigbg/action", "txt_cn_action_eight_login_title1", false, false)

		slot0.btn:setVisible(true)
	elseif slot1 == 3 then
		slot4 = PathTool.getTargetRes("bigbg/action", "action_eight_bg1", false, false)
		slot5 = PathTool.getTargetRes("bigbg/action", "txt_cn_action_eight_login_title2", false, false)

		slot0.btn:setVisible(false)
	else
		slot3 = 783
		slot4 = PathTool.getTargetRes("bigbg/action", "action_eight_bg3", false, false)
		slot5 = PathTool.getTargetRes("bigbg/action", "txt_cn_action_eight_login_title3", false, false)

		slot0.btn:setVisible(true)
	end

	slot0.model_icon_load = createResourcesLoad(slot4, ResourcesType.single, function ()
		if not tolua.isnull(uv0.model_icon) then
			loadSpriteTexture(uv0.model_icon, uv1, LOADTEXT_TYPE)
		end
	end, slot0.model_icon_load)
	slot0.title_2_load = createResourcesLoad(slot5, ResourcesType.single, function ()
		if not tolua.isnull(uv0.title_2) then
			loadSpriteTexture(uv0.title_2, uv1, LOADTEXT_TYPE)
		end
	end, slot0.title_2_load)

	slot0.model_icon:setPositionY(slot3)

	if Config.LoginDaysNewData.data_day[slot1] then
		slot0.day_label:setString(slot6.reward_desc)
	end
end

function ActionEightLoginWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0.ctrl:openEightLoginWin(false)
	end, false, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0.ctrl:openEightLoginWin(false)
	end, true, 2)
	registerButtonEventListener(slot0.btn, function ()
		slot0 = nil

		if uv0.cur_index then
			if uv0.cur_index <= 2 then
				slot0 = 50508
			elseif index ~= 3 then
				slot0 = 70502
			end
		end

		if slot0 then
			HeroController:getInstance():openHeroInfoWindowByBidStar(slot0, 10)
		end
	end, true, 1)

	if slot0.update_status == nil then
		slot0.update_status = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_SEVEN_LOGIN_STATUS, function (slot0)
			if slot0.status_list then
				for slot4, slot5 in pairs(slot0.status_list) do
					uv0.day_list[slot5.day]:setStatus(slot5.status)
				end

				uv0.now_day = math.min(#slot0.status_list + 1, 8)

				uv0:selectByIndex(uv0:getMinGetDay(slot0.status_list), true)
			end
		end)
	end

	if slot0.get_event == nil then
		slot0.get_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_SEVEN_LOGIN_REWARDS, function (slot0)
		end)
	end
end

function ActionEightLoginWindow.getMinGetDay(slot0, slot1)
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

function ActionEightLoginWindow.close_callback(slot0)
	if slot0.model_icon_load then
		slot0.model_icon_load:DeleteMe()

		slot0.model_icon_load = nil
	end

	if slot0.title_2_load then
		slot0.title_2_load:DeleteMe()

		slot0.title_2_load = nil
	end

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

	slot0.ctrl:openEightLoginWin(false)
end

EightLoginItem = class("EightLoginItem", function ()
	return ccui.Widget:create()
end)

function EightLoginItem.ctor(slot0)
	slot0.ctrl = ActionController:getInstance()
	slot0.model = slot0.ctrl:getModel()

	slot0:configUI()
	slot0:register_event()

	slot0.status = 1
	slot0.day_index = 1
end

function EightLoginItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_eight_login_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(100, 120))
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0.main_container:setTouchEnabled(true)
	slot0.main_container:setSwallowTouches(false)

	slot0.title = slot0.main_container:getChildByName("title")

	slot0.title:setLocalZOrder(21)

	slot0.title_bg = slot0.main_container:getChildByName("title_bg")

	slot0.title_bg:setLocalZOrder(22)

	slot0.title_day = slot0.main_container:getChildByName("title_day")

	slot0.title_day:setLocalZOrder(23)

	slot0.get = slot0.main_container:getChildByName("get")

	slot0.get:setVisible(false)

	slot0.effect = createEffectSpine("E31336", cc.p(slot0.main_container:getContentSize().width / 2, slot0.main_container:getContentSize().height / 2 + 8), cc.p(0.5, 0.5), true, "action")

	slot0.effect:setVisible(false)
	slot0.main_container:addChild(slot0.effect, 20)

	slot0.icon = slot0.main_container:getChildByName("icon")
end

function EightLoginItem.register_event(slot0)
	slot0.main_container:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.callback then
				uv0:callback()
			end
		end
	end)
end

function EightLoginItem.setData(slot0, slot1)
	if slot1 == 1 then
		slot0.main_container:setName("get_btn")
	end

	slot0.day_index = slot1

	if Config.LoginDaysNewData.data_day[slot1] and slot2.is_spe_day == 1 then
		if slot0.effect2 == nil then
			slot0.effect2 = createEffectSpine("E31335", cc.p(slot0.main_container:getContentSize().width / 2, slot0.main_container:getContentSize().height / 2), cc.p(0.5, 0.5), true, "action")

			slot0.main_container:addChild(slot0.effect2, 19)
		end

		if slot0.effect2 then
			slot0.effect2:setVisible(true)
		end

		loadSpriteTexture(slot0.icon, PathTool.getResFrame("actioneightlogin", "action_eight_item_" .. slot1), LOADTEXT_TYPE_PLIST)
		slot0.icon:setScale(1)
	else
		if slot0.effect2 then
			slot0.effect2:setVisible(false)
		end

		if slot2 and slot2.rewards[1][1] then
			loadSpriteTexture(slot0.icon, PathTool.getItemRes(slot2.rewards[1][1], false), LOADTEXT_TYPE)
		end

		slot0.icon:setScale(0.8)
	end

	if slot2 then
		slot0.title:setString(slot2.desc)
	end
end

function EightLoginItem.setTitleLab(slot0, slot1)
	slot0.title_bg:setContentSize(cc.size(61.69, 23))

	if slot0.model:getSevenLoginData() then
		slot3 = #slot2.status_list or 1

		if slot1 == 3 or slot1 == 2 then
			doStopAllActions(slot0.title_day)
			slot0.title_day:setString(TI18N("第") .. slot0.day_index .. TI18N("天"))
		elseif slot3 + 2 <= slot0.day_index then
			doStopAllActions(slot0.title_day)
			slot0.title_day:setString(slot0.day_index - slot3 .. TI18N("天后"))
		else
			slot0.title_bg:setContentSize(cc.size(81.69, 23))
			commonCountDownTime(slot0.title_day, TimeTool.getOneDayLessTime())
		end
	end
end

function EightLoginItem.setStatus(slot0, slot1)
	slot0.status = slot1

	if slot0.status == 3 then
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

		slot0.title:setString(TI18N("可领取"))
	else
		if slot0.effect and not tolua.isnull(slot0.effect) then
			slot0.effect:setVisible(false)
		end

		if Config.LoginDaysNewData.data_day[slot0.day_index] then
			slot0.title:setString(slot2.desc)
		end
	end

	slot0:setTitleLab(slot1)
end

function EightLoginItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function EightLoginItem.DeleteMe(slot0)
	doStopAllActions(slot0.title_day)

	if slot0.effect then
		slot0.effect:clearTracks()
		slot0.effect:removeFromParent()

		slot0.effect = nil
	end

	if slot0.effect2 then
		slot0.effect2:clearTracks()
		slot0.effect2:removeFromParent()

		slot0.effect2 = nil
	end
end
