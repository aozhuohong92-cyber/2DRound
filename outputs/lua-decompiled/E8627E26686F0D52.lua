AnimateActionFestvalPanel = class("AnimateActionFestvalPanel", function ()
	return ccui.Widget:create()
end)
slot0 = AnimateActionController:getInstance()
slot1 = ActionController:getInstance()
slot2 = Config.HolidayLantermFestivalData.data_constant

function AnimateActionFestvalPanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.festval_light_list = {}

	slot0:configUI()
	slot0:register_event()
end

function AnimateActionFestvalPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("animateaction/animate_festval_panel"))

	slot0.root_wnd:setPosition(-40, -82)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.title_img = slot0.main_container:getChildByName("title_img")

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getTargetRes("bigbg/animateaction", "txt_cn_animateaction_1", false, false), ResourcesType.single, function ()
			if not tolua.isnull(uv0.title_img) then
				loadSpriteTexture(uv0.title_img, uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end

	slot0.good_cons = slot0.main_container:getChildByName("good_cons")

	slot0.good_cons:setScrollBarEnabled(false)

	slot0.light_num = slot0.main_container:getChildByName("light_layer"):getChildByName("light_num")

	slot0.light_num:setString(slot0.role_vo:getActionAssetsNumByBid(uv0.awards_expend_items.val))

	slot0.btn_add = slot0.main_container:getChildByName("light_layer"):getChildByName("btn_add")
	slot0.btn_rule = slot0.main_container:getChildByName("btn_rule")

	slot0.main_container:getChildByName("time_layer"):getChildByName("Text_2"):setString(TI18N("剩余时间："))

	slot0.time_text = slot0.main_container:getChildByName("time_layer"):getChildByName("time_text")

	slot0.time_text:setString("")
end

function AnimateActionFestvalPanel.register_event(slot0)
	if not slot0.role_festval_event and slot0.role_vo then
		slot0.role_festval_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ACTION_ASSETS, function (slot0, slot1)
			if slot0 and slot0 == uv0.awards_expend_items.val and uv1.role_vo then
				uv1.light_num:setString(uv1.role_vo:getActionAssetsNumByBid(uv0.awards_expend_items.val))
			end
		end)
	end

	if not slot0.animate_festval_event then
		slot0.animate_festval_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
			if slot0.bid == uv0.holiday_bid and slot0 then
				uv1:getModel():setLessTime(uv0.time_text, slot0.remain_sec)
			end
		end)
	end

	if not slot0.festval_light_event then
		slot0.festval_light_event = GlobalEvent:getInstance():Bind(AnimateActionEvent.YuanZhenFestval_Linght, function (slot0)
			if not slot0 or next(slot0) == nil then
				return
			end

			table.sort(slot0.award_list, function (slot0, slot1)
				return slot0.id < slot1.id
			end)

			slot2 = 3
			slot3 = slot0.award_list or {}

			if slot0.award_list[Config.HolidayLantermFestivalData.data_consume_num_length].flag == 1 then
				slot2 = 4

				uv0.good_cons:setInnerContainerSize(cc.size(720, 832))

				slot3 = {
					slot0.award_list[4],
					slot0.award_list[1],
					slot0.award_list[2],
					slot0.award_list[3]
				}
			end

			slot4 = uv0.good_cons:getInnerContainerSize().height
			slot5 = {
				{
					187,
					155
				},
				{
					581,
					300
				},
				{
					219,
					500
				},
				{
					561,
					650
				}
			}

			for slot9 = 1, slot2 do
				if not uv0.festval_light_list[slot9] then
					uv0.festval_light_list[slot9] = AnimateActionFestvalPanelItem.new()

					uv0.good_cons:addChild(uv0.festval_light_list[slot9])
				end

				if uv0.festval_light_list[slot9] then
					uv0.festval_light_list[slot9]:setExtendData(slot3[slot9].flag)
					uv0.festval_light_list[slot9]:setData(slot3[slot9] or {})
					uv0.festval_light_list[slot9]:setPosition(slot5[slot9][1], slot4 - slot5[slot9][2])
				end
			end
		end)
	end

	registerButtonEventListener(slot0.btn_add, function ()
		if uv0:getActionSubTabVo(ActionRankCommonType.yuanzhen_adventure) and uv0.action_operate then
			uv0.action_operate:handleSelectedTab(uv0.action_operate.tab_list[slot0])
		end
	end, true, 1)
	registerButtonEventListener(slot0.btn_rule, function (slot0, slot1, slot2)
		TipsManager:getInstance():showCommonTips(uv0.holiday_content_tips.desc, slot1:getTouchBeganPosition(), nil, nil, 500)
	end, true, 1)
end

function AnimateActionFestvalPanel.setVisibleStatus(slot0, slot1)
	slot1 = slot1 or false

	slot0:setVisible(slot1)

	if slot1 == true then
		uv0:cs16603(slot0.holiday_bid)
		uv1:sender24801()
	end
end

function AnimateActionFestvalPanel.DeleteMe(slot0)
	doStopAllActions(slot0.time_text)

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	if slot0.festval_light_list then
		for slot4, slot5 in pairs(slot0.festval_light_list) do
			slot5:DeleteMe()
		end

		slot0.festval_light_list = nil
	end

	if slot0.animate_festval_event then
		GlobalEvent:getInstance():UnBind(slot0.animate_festval_event)

		slot0.animate_festval_event = nil
	end

	if slot0.festval_light_event then
		GlobalEvent:getInstance():UnBind(slot0.festval_light_event)

		slot0.festval_light_event = nil
	end

	if slot0.role_festval_event then
		slot0.role_vo:UnBind(slot0.role_festval_event)

		slot0.role_festval_event = nil
	end
end

AnimateActionFestvalPanelItem = class("AnimateActionFestvalPanelItem", function ()
	return ccui.Widget:create()
end)
slot3 = {
	TI18N("壮士酒"),
	TI18N("百夫长酒"),
	TI18N("千夫长酒"),
	TI18N("将军酒")
}
slot4 = Config.HolidayLantermFestivalData.data_consume_num

function AnimateActionFestvalPanelItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function AnimateActionFestvalPanelItem.configUI(slot0)
	slot0.size = cc.size(180, 210)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("animateaction/animate_festval_panel_item"))

	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.name = slot1:getChildByName("name")
	slot0.light_spr = slot1:getChildByName("light_spr")
	slot0.consume_text = createRichLabel(22, cc.c4b(255, 225, 162, 255), cc.p(0.5, 0.5), cc.p(slot1:getContentSize().width / 2, -3), nil, nil, 250)

	slot1:addChild(slot0.consume_text)
end

function AnimateActionFestvalPanelItem.register_event(slot0)
	registerButtonEventListener(slot0, function ()
		uv0:openAnimateFestvalWindow(true, uv1.data.id, uv1.is_open)
	end, false, 1)
end

function AnimateActionFestvalPanelItem.setExtendData(slot0, slot1)
	slot0.is_open = slot1 or 1
end

function AnimateActionFestvalPanelItem.setData(slot0, slot1)
	if not slot1 or next(slot1) == nil then
		return
	end

	slot0.data = slot1

	slot0.name:setString(uv0[slot0.data.id])
	loadSpriteTexture(slot0.light_spr, PathTool.getResFrame("animateaction_yaunzhen", "animateaction_yaunzhen_" .. slot0.data.id), LOADTEXT_TYPE_PLIST)

	if slot0.is_open == 1 then
		slot0.consume_text:setVisible(false)
		setChildUnEnabled(false, slot0.light_spr)
	else
		setChildUnEnabled(true, slot0.light_spr)
		slot0.consume_text:setString(string.format(TI18N("累计消耗 <img src='%s' scale=0.45 />%d个开启"), PathTool.getItemRes(Config.ItemData.data_get_data(uv1.awards_expend_items.val).icon), uv2[slot0.data.id].need_num))
		slot0.consume_text:setVisible(true)
	end
end

function AnimateActionFestvalPanelItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
