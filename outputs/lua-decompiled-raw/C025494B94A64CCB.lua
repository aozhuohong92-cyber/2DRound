AnimateYuanzhenCollectWindow = AnimateYuanzhenCollectWindow or BaseClass(BaseView)
slot0 = AnimateActionController:getInstance()
slot1 = Config.HolidayMakeData.data_collect_list
slot2 = Config.HolidayMakeData.data_master_diff_list

function AnimateYuanzhenCollectWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "animateaction/animate_yuanzhen_collect_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_26"),
			type = ResourcesType.single
		}
	}
end

function AnimateYuanzhenCollectWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 1)
	slot1:getChildByName("Text_2"):setString(TI18N("召集船员"))
	slot1:getChildByName("text"):setString(TI18N("推荐战力: "))
	slot1:getChildByName("text_0"):setString(TI18N("今日可挑战次数: "))

	slot0.master_trait_text = slot1:getChildByName("master_trait_text")
	slot0.recommend_power = slot1:getChildByName("recommend_power")
	slot0.btn_add = slot1:getChildByName("btn_add")
	slot0.btn_challenge = slot1:getChildByName("btn_challenge")

	slot0.btn_challenge:getChildByName("Text_6"):setString(TI18N("挑战"))

	slot2 = slot1:getChildByName("good_cons")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 5,
		start_x = 0,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.8,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.8,
		item_height = BackPackItem.Height * 0.8
	})

	slot0.item_scrollview:setSwallowTouches(false)

	slot0.titile_image = slot1:getChildByName("titile_image")

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getTargetRes("bigbg", "bigbg_26", false, false), ResourcesType.single, function ()
			if not tolua.isnull(uv0.titile_image) then
				loadSpriteTexture(uv0.titile_image, uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end

	slot0.challge_num = createRichLabel(24, cc.c4b(100, 50, 35, 255), cc.p(0.5, 0.5), cc.p(288, 346), nil, , 100)

	slot1:addChild(slot0.challge_num)

	slot0.main_container = slot1
	slot0.btn_close = slot1:getChildByName("btn_close")
end

function AnimateYuanzhenCollectWindow.openRootWnd(slot0)
	slot1 = uv0:getModel():getHolidayID()

	slot0.master_trait_text:setString(uv1[slot1].desc)

	slot2 = RoleController:getInstance():getRoleVo()
	slot3 = 1

	for slot7, slot8 in pairs(uv2[slot1]) do
		if slot8.min <= slot2.max_power and slot2.max_power <= slot8.max then
			slot3 = slot8.id

			break
		end
	end

	slot0.recommend_power:setString(uv2[slot1][slot3].recommend)
	slot0.main_container:runAction(cc.Sequence:create(cc.DelayTime:create(0.1), cc.CallFunc:create(function ()
		if uv0 and uv0.updateModel then
			uv0:updateModel(uv1[uv2][uv3].unit_id)
		end
	end)))
	slot0.challge_num:setString(string.format(TI18N("<div fontcolor=#157e22 >%d</div> 次"), uv0:getModel():getRemainChallageNum()))

	if slot0.item_scrollview then
		slot5 = {}

		for slot9, slot10 in pairs(uv1[slot1].award) do
			if deepCopy(Config.ItemData.data_get_data(slot10[1])) then
				slot11.quantity = slot10[2]

				table.insert(slot5, slot11)
			end
		end

		slot0.item_scrollview:setData(slot5)
		slot0.item_scrollview:addEndCallBack(function ()
			for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
				slot5:setDefaultTip()
			end
		end)
	end
end

function AnimateYuanzhenCollectWindow.updateModel(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot0.partner_model then
		slot0.partner_model = BaseRole.new(BaseRole.type.unit, slot1)

		slot0.partner_model:setAnimation(0, PlayerAction.show, true)
		slot0.main_container:addChild(slot0.partner_model)
		slot0.partner_model:setPosition(cc.p(355, 630))
	end
end

function AnimateYuanzhenCollectWindow.register_event(slot0)
	slot0:addGlobalEvent(AnimateActionEvent.YuanZhenFestval_Buy_Challage, function (slot0)
		if not slot0 or next(slot0) == nil then
			return
		end

		if uv0.challge_num then
			uv0.challge_num:setString(string.format(TI18N("<div fontcolor=#157e22 >%d</div> 次"), slot0.combat_num))
		end
	end)
	slot0:addGlobalEvent(AnimateActionEvent.YuanZhenFestval_Kitchen, function (slot0)
		if not slot0 or next(slot0) == nil then
			return
		end

		if uv0.challge_num then
			uv0.challge_num:setString(string.format(TI18N("<div fontcolor=#157e22 >%d</div> 次"), slot0.combat_num))
		end
	end)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openAnimateYuanzhenCollectWindow(false)
	end, true, 1)
	registerButtonEventListener(slot0.btn_add, function ()
		if Config.ItemData.data_get_data(uv1[uv0:getModel():getHolidayID()].buy_loss[1][1]) then
			CommonAlert.show(string.format(TI18N("是否花费 <img src='%s' scale=0.4 />%s购买挑战次数"), PathTool.getItemRes(slot2.icon), uv1[slot0].buy_loss[1][2]), TI18N("确定"), function ()
				uv0:sender24809()
			end, TI18N("取消"), nil, CommonAlert.type.rich, nil, , 24)
		end
	end, true, 1)
	registerButtonEventListener(slot0.btn_challenge, function ()
		uv0:sender24808()
	end, true, 1)
end

function AnimateYuanzhenCollectWindow.close_callback(slot0)
	if slot0.partner_model then
		slot0.partner_model:runAction(cc.Sequence:create(cc.CallFunc:create(function ()
			doStopAllActions(uv0.partner_model)
			uv0.partner_model:removeFromParent()

			uv0.partner_model = nil
		end)))
	end

	doStopAllActions(slot0.main_container)

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	uv0:openAnimateYuanzhenCollectWindow(false)
end
