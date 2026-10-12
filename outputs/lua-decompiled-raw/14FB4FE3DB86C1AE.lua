FruitTreasurePassView = FruitTreasurePassView or BaseClass(BaseView)
slot0 = ActionController:getInstance()
slot2 = FruitTreasureController:getInstance():getModel()
slot3 = Config.BlastiaActivityOrderData

function FruitTreasurePassView.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "fruit_treasure/fruit_pass_view"
	slot0._list_item = nil
	slot0._list_node = {
		basic = {},
		advanced = {}
	}
	slot0._list_unlock_flag = {
		advanced = false,
		basic = false
	}
	slot0.role_vo = RoleController:getInstance():getRoleVo()
end

function FruitTreasurePassView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("n_ui")
	slot0.n_bg = slot1:getChildByName("n_bg")
	slot2 = slot1:getChildByName("scroll_award")
	slot0.scroll_award = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = -20,
		start_x = -20,
		space_x = -40,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.6,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 1,
		item_height = BackPackItem.Height * 1
	})

	slot0.scroll_award:setSwallowTouches(false)

	slot5 = slot1:getChildByName("n_basic")
	slot6 = slot5:getChildByName("n_lock")
	slot0._list_node.basic.n_basic = slot5
	slot0._list_node.basic.n_lock = slot6
	slot0._list_node.basic.i_lock = slot6:getChildByName("i_cost")
	slot0._list_node.basic.t_lock = slot6:getChildByName("t_lock")
	slot0._list_node.basic.n_unlock = slot5:getChildByName("n_unlock")
	slot10 = slot1:getChildByName("n_advanced")
	slot11 = slot10:getChildByName("n_lock")
	slot0._list_node.advanced.n_advanced = slot10
	slot0._list_node.advanced.n_lock = slot11
	slot0._list_node.advanced.t_lock = slot11:getChildByName("t_lock")
	slot0._list_node.advanced.n_unlock = slot10:getChildByName("n_unlock")
	slot0.t_time = slot1:getChildByName("n_time"):getChildByName("t_time")
	slot15 = slot1:getChildByName("scroll_item")
	slot0.scroll_item = CommonScrollViewLayout.new(slot15, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot15:getContentSize(), {
		start_y = 0,
		start_x = 5,
		space_x = 0,
		row = 1,
		space_y = 0,
		col = 1,
		item_class = FruitTreasurePassItem,
		item_width = FruitTreasurePassItem.Width,
		item_height = FruitTreasurePassItem.Height
	}, cc.p(0, 0))

	slot0.scroll_item:setSwallowTouches(false)
	slot0:playEnterAnimatianByObj(slot1, 2)
end

function FruitTreasurePassView.openRootWnd(slot0, slot1)
	uv0:sender29620()
	slot0:_StartOpenViewInfo()
end

function FruitTreasurePassView.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:OpenFruitTreasurePassView(false)
	end, false, 2)
	registerButtonEventListener(slot0._list_node.basic.n_basic, function ()
		if not uv0._list_unlock_flag.basic then
			slot2 = uv2:GetPassConfigByKey("junior_unlock")

			CommonAlert.show(string.format("%s<img src=%s visible=true scale=0.3 /><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#764519>(%s:</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#764519>)\n</div>", TI18N("是否使用"), PathTool.getItemRes(slot2[1]), slot2[2], TI18N("拥有"), uv0.role_vo.gold + uv0.role_vo.red_gold) .. "\n激活初级战令", TI18N("确定"), function ()
				uv0:sender29621()
			end, TI18N("取消"), nil, CommonAlert.type.rich)
		end
	end, false, 1)
	registerButtonEventListener(slot0._list_node.advanced.n_advanced, function ()
		if not uv0._list_unlock_flag.advanced then
			slot2 = Config.ChargeData.data_charge_data[uv1:GetPassConfigByKey("charge_id")]

			CommonAlert.show("是否购买高级战令", TI18N("确定"), function ()
				sdkOnPay(uv0.val, 1, uv1, uv0.name)
			end, TI18N("取消"), nil, CommonAlert.type.common)
		end
	end, false, 1)
	slot0:addGlobalEvent(FruitTreasureEvent.UpdateFruitTreasurePass, function (slot0)
		uv0._list_unlock_flag.basic = slot0.junior_status == TRUE
		uv0._list_unlock_flag.advanced = slot0.senior_status == TRUE

		uv0:_UpdateLockState()
		uv0:_UpdateTime(slot0.end_time)
		uv0:_UpdateAwardItem()
	end)
end

function FruitTreasurePassView._StartOpenViewInfo(slot0)
	loadSpriteTexture(slot0.n_bg, path, LOADTEXT_TYPE)

	slot1 = uv0:GetPassConfigByKey("junior_unlock")

	slot0._list_node.basic.i_lock:loadTexture(PathTool.getItemRes(slot1[1]), LOADTEXT_TYPE)
	slot0._list_node.basic.t_lock:setString(slot1[2])
	slot0._list_node.advanced.t_lock:setString(string.format("%s解锁", MoneyTool.GetChannelMoneyString(device.getChannel(), Config.ChargeData.data_charge_data[uv0:GetPassConfigByKey("charge_id")].val)))

	slot9 = {}

	for slot14, slot15 in ipairs(uv0:GetPassConfigByKey("reward_show")) do
		table.insert(slot9, {
			id = slot15[1],
			num = slot15[2]
		})
	end

	slot0.scroll_award:setData(slot9)
	slot0.scroll_award:addEndCallBack(function ()
		for slot4, slot5 in ipairs(uv0.scroll_award:getItemList()) do
			slot5:setDefaultTip()
		end
	end)
	slot0:_UpdateLockState()
end

function FruitTreasurePassView._UpdateLockState(slot0)
	slot0._list_node.basic.n_lock:setVisible(not slot0._list_unlock_flag.basic)
	slot0._list_node.basic.n_unlock:setVisible(slot0._list_unlock_flag.basic)
	slot0._list_node.advanced.n_lock:setVisible(not slot0._list_unlock_flag.advanced)
	slot0._list_node.advanced.n_unlock:setVisible(slot0._list_unlock_flag.advanced)
end

function FruitTreasurePassView._UpdateTime(slot0, slot1)
	if not slot1 then
		return
	end

	if slot1 <= 0 then
		slot1 = 0
	end

	uv0:getModel():setCountDownTime(slot0.t_time, slot1, slot1 <= 0)
end

function FruitTreasurePassView._UpdateAwardItem(slot0)
	if not uv0.data_reward_list then
		return
	end

	if not slot0._list_item then
		slot0.scroll_item:setData(slot1)
		slot0.scroll_item:addEndCallBack(function ()
			uv0._list_item = uv0.scroll_item:getItemList()
		end)
	else
		for slot5, slot6 in ipairs(slot0._list_item) do
			slot6:setData(slot1[slot5])
		end
	end
end

function FruitTreasurePassView.close_callback(slot0)
	if slot0.scroll_award then
		slot0.scroll_award:DeleteMe()
	end

	slot0.scroll_award = nil

	if slot0.scroll_item then
		slot0.scroll_item:DeleteMe()

		slot0._list_item = nil
	end

	slot0.scroll_item = nil

	uv0:OpenFruitTreasurePassView(false)
end
