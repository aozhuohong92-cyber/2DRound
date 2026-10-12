AnimateActionFestvalWindow = AnimateActionFestvalWindow or BaseClass(BaseView)
slot0 = AnimateActionController:getInstance()
slot1 = ActionController:getInstance()
slot2 = Config.HolidayLantermFestivalData.data_rand_list
slot3 = Config.HolidayLantermFestivalData.data_constant
slot4 = Config.HolidayLantermFestivalData.data_consume_list
slot5 = Config.HolidayLantermFestivalData.data_consume_num

function AnimateActionFestvalWindow.__init(slot0, slot1, slot2)
	slot0.index = slot1 or 1
	slot0.is_open = slot2 or 0
	slot0.role_festval = RoleController:getInstance():getRoleVo()
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.item_list = {}
	slot0.layout_name = "animateaction/animate_festval_lottery_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("animateaction", "animateaction_yaunzhen"),
			type = ResourcesType.plist
		}
	}
end

function AnimateActionFestvalWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("backgroud")

	slot0.background:setScale(display.getMaxScale())

	slot2 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot2, 1)
	slot2:getChildByName("title_name"):setString(({
		TI18N("壮士酒"),
		TI18N("百夫长酒"),
		TI18N("千夫长酒"),
		TI18N("将军酒")
	})[slot0.index] or "")

	slot0.btn_add = slot2:getChildByName("btn_add")
	slot0.light_festval_num = slot2:getChildByName("light_num")

	slot0.light_festval_num:setString(slot0.role_festval:getActionAssetsNumByBid(uv0.awards_expend_items.val))

	slot0.btn_lighting = slot2:getChildByName("btn_lighting")
	slot0.lighting_spr = slot2:getChildByName("Sprite_3")
	slot0.lighting_bg = slot2:getChildByName("Panel_1")
	slot0.not_open_text = createRichLabel(26, cc.c4b(255, 255, 255, 255), cc.p(0.5, 0.5), cc.p(slot2:getContentSize().width / 2, 56), nil, , 500)

	slot2:addChild(slot0.not_open_text)

	slot0.consume_text = createRichLabel(26, cc.c4b(255, 255, 255, 255), cc.p(0.5, 0.5), cc.p(slot0.btn_lighting:getContentSize().width / 2, slot0.btn_lighting:getContentSize().height / 2), nil, , 150)

	slot0.btn_lighting:addChild(slot0.consume_text)

	slot0.good_cons = slot2:getChildByName("good_cons")

	slot0.good_cons:setScrollBarEnabled(false)

	slot0.main_container = slot2
	slot0.btn_close = slot2:getChildByName("btn_close")
end

function AnimateActionFestvalWindow.setNotOpenConsume(slot0, slot1)
	slot0.btn_lighting:setVisible(slot1)
	slot0.lighting_spr:setVisible(slot1)
	slot0.lighting_bg:setVisible(slot1)
	slot0.light_festval_num:setVisible(slot1)
	slot0.btn_add:setVisible(slot1)
end

function AnimateActionFestvalWindow.setLightComsumeTotle(slot0, slot1)
	if not slot1 or next(slot1) == nil then
		return
	end

	table.sort(slot1.rand_list, function (slot0, slot1)
		if slot0.rand_id and slot1.rand_id then
			return slot0.rand_id < slot1.rand_id
		end
	end)

	if slot0.index == 4 then
		slot0.consume_text:setString(string.format(TI18N("<img src='%s' scale=0.45 /> <div outline=2,#2b610d>%d  点灯</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(uv0.awards_expend_items.val).icon), uv0.awards_4_expend.val[2] or 0))
	else
		if (slot1.count or 0) + 1 >= (#uv1[slot0.index] or 1) then
			slot4 = slot5
		end

		slot0.consume_text:setString(string.format(TI18N("<img src='%s' scale=0.45 /> <div outline=2,#2b610d>%d  点灯</div>"), slot3, uv1[slot0.index][slot4].expend or 0))
	end

	slot4 = false

	if slot1 and slot1.rand_list then
		for slot8, slot9 in pairs(slot1.rand_list) do
			if slot9.status == 0 then
				slot4 = true

				break
			end
		end
	end

	if slot0.is_open == 1 then
		if slot4 == false then
			slot0:setNotOpenConsume(false)

			if not slot0.light_finish then
				slot0.light_finish = createSprite(PathTool.getResFrame("animateaction_yaunzhen", "txt_cn_animateaction_yaunzhen"), slot0.main_container:getContentSize().width / 2, 61, slot0.main_container, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
			end

			if slot0.light_finish then
				slot0.light_finish:setVisible(true)
			end

			slot0.not_open_text:setVisible(false)
		end
	else
		slot0:setNotOpenConsume(false)
		slot0.not_open_text:setString(string.format(TI18N("累计消耗<img src='%s' scale=0.45 />%d个开启</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(uv0.awards_expend_items.val).icon), uv2[slot0.index].need_num or 0))
		slot0.not_open_text:setVisible(true)

		if slot0.light_finish then
			slot0.light_finish:setVisible(false)
		end
	end

	slot0.good_cons:setInnerContainerSize(cc.size(511, 119 * math.floor((#slot1.rand_list or 1) / 4) + 30))

	slot6 = slot0.good_cons:getInnerContainerSize().height - 60

	for slot10 = 1, slot5 do
		delayRun(slot0.good_cons, slot10 * 2 / 60, function ()
			if not uv0.item_list[uv1] then
				uv0.item_list[uv1] = BackPackItem.new(true, true, nil)

				uv0.item_list[uv1]:setAnchorPoint(0, 0.5)
				uv0.good_cons:addChild(uv0.item_list[uv1])
			end

			if uv0.item_list[uv1] then
				slot0 = (uv1 - 1) % 4

				uv0.item_list[uv1]:setPosition(cc.p(BackPackItem.Width * slot0 + slot0 * 26, uv2 - (BackPackItem.Height * math.floor((uv1 - 1) / 4) + 18 * math.floor((uv1 - 1) / 4))))
				uv0.item_list[uv1]:setDefaultTip()

				slot4 = uv3[uv0.index][uv4.rand_list[uv1].rand_id].item_num
				slot5 = uv3[uv0.index][uv4.rand_list[uv1].rand_id].effect

				if uv3[uv0.index][uv4.rand_list[uv1].rand_id].item_id and slot4 then
					uv0.item_list[uv1]:setBaseData(slot3, slot4)
				end

				if slot5 == 1 then
					uv0.item_list[uv1]:showItemEffect(true, 263, PlayerAction.action_1, true, 1.1)
				else
					uv0.item_list[uv1]:showItemEffect(false)
				end

				if uv4.rand_list[uv1] and uv4.rand_list[uv1].status == 0 then
					setChildUnEnabled(false, uv0.item_list[uv1])
				else
					setChildUnEnabled(true, uv0.item_list[uv1])
				end
			end
		end)
	end
end

function AnimateActionFestvalWindow.openRootWnd(slot0)
	uv0:sender24802(slot0.index)
end

function AnimateActionFestvalWindow.register_event(slot0)
	if not slot0.role_lottery_event and slot0.role_festval then
		slot0.role_lottery_event = slot0.role_festval:Bind(RoleEvent.UPDATE_ROLE_ACTION_ASSETS, function (slot0, slot1)
			if slot0 and slot0 == uv0.awards_expend_items.val and uv1.role_festval then
				if tolua.isnull(uv1.light_festval_num) == false then
					uv1.light_festval_num:setString(uv1.role_festval:getActionAssetsNumByBid(uv0.awards_expend_items.val) or 0)
				end
			end
		end)
	end

	slot0:addGlobalEvent(AnimateActionEvent.YuanZhenFestval_Lottery, function (slot0)
		if not slot0 or next(slot0) == nil then
			return
		end

		uv0:setLightComsumeTotle(slot0)
	end)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:sender24801()
		uv0:openAnimateFestvalWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.btn_lighting, function ()
		uv0:sender24803(uv1.index)
	end, true, 1)
	registerButtonEventListener(slot0.btn_add, function ()
		uv0:openAnimateFestvalWindow(false)

		if uv1:getActionSubTabVo(ActionRankCommonType.yuanzhen_adventure) and uv1.action_operate and uv1.action_operate.tab_list[slot0] then
			uv1.action_operate:handleSelectedTab(uv1.action_operate.tab_list[slot0])
		end
	end, true, 1)
end

function AnimateActionFestvalWindow.close_callback(slot0)
	doStopAllActions(slot0.good_cons)

	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end

	if slot0.role_lottery_event then
		slot0.role_festval:UnBind(slot0.role_lottery_event)

		slot0.role_lottery_event = nil
	end

	uv0:openAnimateFestvalWindow(false)
end
