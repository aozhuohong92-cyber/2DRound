AdventureShotKillWindow = AdventureShotKillWindow or BaseClass(BaseView)
slot0 = AdventureController:getInstance()
slot1 = AdventureController:getInstance():getUiModel()
slot2 = string.format
slot3 = table.insert
slot4 = GameNet:getInstance()

function AdventureShotKillWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.index = 2
	slot0.layout_name = "adventure/adventure_shot_kill_window"
	slot0.evt_path = "resource/adventure/evt/%s.png"
	slot0.monster_list = {}
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("adventure", "adventurewindow"),
			type = ResourcesType.plist
		}
	}
end

function AdventureShotKillWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)

	slot0.skill_name = slot1:getChildByName("skill_name")
	slot0.skill_desc = slot1:getChildByName("skill_desc")
	slot0.skill_num = slot1:getChildByName("skill_num")
	slot0.skill_num2 = slot1:getChildByName("skill_num2")
	slot0.empty_desc = slot1:getChildByName("empty_desc")

	slot0.empty_desc:setString(TI18N("暂无可击杀守卫"))

	slot0.choose_container = slot1:getChildByName("choose_container")

	slot0.choose_container:getChildByName("choose_title"):setString(TI18N("请选择使用目标"))

	slot0.total_width = slot0.choose_container:getContentSize().width
	slot0.cancen_btn = slot0.choose_container:getChildByName("cancen_btn")

	slot0.cancen_btn:setTitleColor(Config.ColorData.data_color4[1])
	slot0.cancen_btn:setTitleText(TI18N("取消"))

	slot0.cancen_btn_label = slot0.cancen_btn:getTitleRenderer()

	if slot0.cancen_btn_label ~= nil then
		slot0.cancen_btn_label:enableOutline(Config.ColorData.data_color4[278], 2)
	end

	slot0.confirm_btn = slot0.choose_container:getChildByName("confirm_btn")

	slot0.confirm_btn:setTitleColor(Config.ColorData.data_color4[1])
	slot0.confirm_btn:setTitleText(TI18N("确定"))

	slot0.confirm_btn_label = slot0.confirm_btn:getTitleRenderer()

	if slot0.confirm_btn_label ~= nil then
		slot0.confirm_btn_label:enableOutline(Config.ColorData.data_color4[277], 2)
	end

	slot0.buy_btn = slot1:getChildByName("buy_btn")

	slot0.buy_btn:getChildByName("label"):setString(TI18N("购买"))
end

function AdventureShotKillWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openAdventureShotKillWindow(false)
	end, false, REGISTER_BUTTON_SOUND_CLOSED_TYPY)
	registerButtonEventListener(slot0.cancen_btn, function ()
		uv0:openAdventureShotKillWindow(false)
	end, false, REGISTER_BUTTON_SOUND_CLOSED_TYPY)
	registerButtonEventListener(slot0.buy_btn, function ()
		if not uv0.config then
			return
		end

		if not Config.AdventureData.data_adventure_const.poison_price then
			return
		end

		if slot0.val and next(slot0.val) ~= nil then
			slot1 = slot0.val[1][1] or 3

			if 5 < math.floor(BackpackController:getInstance():getModel():getItemNumByBid(bid) / (slot0.val[1][2] or 1)) then
				slot5 = slot3
			end

			MallController:getInstance():openMallBuyWindow(true, {
				name = uv0.config.name,
				limit_num = slot3,
				has_buy = slot5 or 1,
				price = slot2,
				pay_type = slot1,
				shop_type = MallConst.MallType.AdventureShotKillBuy
			})
		end
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.confirm_btn, function ()
		if uv0.select_object == nil or uv0.select_object.data == nil then
			message(TI18N("请选择击杀目标"))

			return
		end

		if uv0.config then
			uv1:send20607(uv0.config.id, uv0.select_object.data.id)
		end
	end, false, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	slot0:addGlobalEvent(AdventureEvent.UpdateShotKillInfo, function (slot0)
		uv0:updateMonsterList(slot0)
	end)
	slot0:addGlobalEvent(AdventureEvent.UpdateSkillInfo, function (slot0)
		if not uv0.config then
			return
		end

		if slot0 then
			for slot4, slot5 in ipairs(slot0) do
				if uv0.config.id == slot5.bid then
					uv0:updateCount(slot5.num)
				end
			end
		end
	end)
end

function AdventureShotKillWindow.openRootWnd(slot0, slot1)
	uv0:send20611()

	if slot1 and slot1.config then
		slot0.config = slot1.config
		slot0.use_count = slot1.use_count

		slot0.skill_name:setString(slot0.config.name)
		slot0.skill_desc:setString(TI18N("效果：") .. slot0.config.desc)
		slot0:updateCount(slot1.num or 0)
	end
end

function AdventureShotKillWindow.updateCount(slot0, slot1)
	if not slot0.config then
		return
	end

	if slot0.config.max_num and slot2 > 0 then
		slot0.skill_num:setString(uv0(TI18N("本轮剩余使用次数：%s"), slot2 - (slot0.use_count or 0)))
		slot0.skill_num2:setString(uv0(TI18N("驱魂药剂剩余：%s"), slot1))
	else
		slot0.skill_num:setString(TI18N("剩余数量：") .. slot1)
		slot0.skill_num2:setString("")
	end
end

function AdventureShotKillWindow.updateMonsterList(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		slot0.choose_container:setVisible(false)
		slot0.empty_desc:setVisible(true)
	else
		slot0.choose_container:setVisible(true)
		slot0.empty_desc:setVisible(false)

		for slot8, slot9 in ipairs(slot1) do
			slot0:createMonsterHead(slot9, slot8, (slot0.total_width - #slot1 * 120) * 0.5)
		end
	end
end

function AdventureShotKillWindow.createMonsterHead(slot0, slot1, slot2, slot3)
	if slot1 == nil or slot1.evt_id == nil then
		return
	end

	if Config.AdventureData.data_adventure_event(slot1.evt_id) == nil or slot4.res_id == nil or slot4.res_id[1] == nil or slot4.res_id[1][2] == nil then
		return
	end

	if slot0.monster_list[slot1.evt_id] then
		return
	end

	slot6 = ccui.Layout:create()

	slot6:setContentSize(cc.size(120, 120))
	slot6:setAnchorPoint(0.5, 0.5)
	slot6:setPosition(slot3 + 60 + (slot2 - 1) * 120, 142)
	slot6:setTouchEnabled(true)
	slot6:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:selectMonsterIcon(uv1.evt_id)
		end
	end)
	slot0.choose_container:addChild(slot6)

	slot7 = PlayerHead.new(PlayerHead.type.other, nil, , PathTool.getResFrame("common", "common_1031"), nil, true)

	slot7:setPosition(60, 60)
	slot7:setHeadRes(slot4.face)
	slot6:addChild(slot7)

	slot8 = createSprite(PathTool.getResFrame("adventure", "adventurewindow_15", false, "adventurewindow"), 60, 60, slot6, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
	slot9 = createSprite(PathTool.getResFrame("common", "common_1043"), 42.5, 42.5, slot8, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)

	slot8:setVisible(false)

	slot11 = createSprite(uv0(slot0.evt_path, slot4.res_id[1][2]), 60, 60, slot6, cc.p(0.5, 0.5), LOADTEXT_TYPE)
	slot0.monster_list[slot1.evt_id] = {
		container = slot6,
		head = slot7,
		select = slot8,
		data = slot1
	}
end

function AdventureShotKillWindow.selectMonsterIcon(slot0, slot1)
	if slot0.select_object and slot0.select_object.data and slot0.select_object.data.evt_id == slot1 then
		return
	end

	if slot0.select_object then
		slot0.select_object.select:setVisible(false)

		slot0.select_object = nil
	end

	slot0.select_object = slot0.monster_list[slot1]

	if slot0.select_object then
		slot0.select_object.select:setVisible(true)
	end
end

function AdventureShotKillWindow.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.monster_list) do
		if slot5.head then
			slot5.head:DeleteMe()
		end
	end

	slot0.monster_list = nil
	slot0.config = nil

	uv0:openAdventureShotKillWindow(false)
end
