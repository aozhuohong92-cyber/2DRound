FruitTreasurePassItem = class("FruitTreasurePassItem", function ()
	return ccui.Widget:create()
end)
FruitTreasurePassItem.Width = 630
FruitTreasurePassItem.Height = 130
slot0 = BackPackItem.Width + 10
slot1 = 0
slot3 = FruitTreasureController:getInstance():getModel()
slot4 = Config.BlastiaActivityOrderData

function FruitTreasurePassItem.ctor(slot0)
	slot0.data = nil
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.arr_pay_item = nil
	slot0.free_item = nil
	slot0._list_unlock_flag = {
		advanced = false,
		basic = false
	}
	slot0._list_get_flag = {
		advanced = false,
		basic = false
	}
	slot0._flag_get_state = 0

	slot0:configUI()
	slot0:register_event()
end

function FruitTreasurePassItem.configUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("fruit_treasure/fruit_pass_item"))

	slot0:setContentSize(cc.size(FruitTreasurePassItem.Width, FruitTreasurePassItem.height))
	slot0.root_wnd:setAnchorPoint(cc.p(0, 0.5))
	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("n_ui")
	slot0.n_award = nx.gui.find(slot1, "n_award")
	slot0.free_item = slot0:_CreateBackPackItem(slot0.n_award, 1, 0.75)[1]
	slot0.n_scroll = nx.gui.find(slot1, "scroll_award")
	slot0.arr_pay_item = slot0:_CreateBackPackItem(slot0.n_scroll, 2, 0.75)
	slot0.t_schedule = nx.gui.find(slot1, "t_schedule")
	slot0.n_get = nx.gui.find(slot1, "n_get")
	slot0.b_get = nx.gui.find(slot1, "b_get")
	slot0.t_cost = nx.gui.find(slot0.b_get, "t_cost")
	slot0.n_red = nx.gui.find(slot0.b_get, "n_red")
end

function FruitTreasurePassItem._CreateBackPackItem(slot0, slot1, slot2, slot3)
	slot5 = slot2 or 1
	slot3 = slot3 or 1

	for slot11 = 1, slot5 do
		slot12 = function ()
			slot0 = BackPackItem.new()

			slot0:setDefaultTip()
			slot0:setSwallowTouches(false)
			slot0:setAnchorPoint(cc.p(0, 0.5))
			uv0:addChild(slot0)

			return slot0
		end()

		slot12:setScale(slot3)
		slot12:setPosition(cc.p(0 + (slot11 - 1) * uv0 * slot3, slot1:getContentSize().height / 2))
	end

	return {
		[slot11] = slot12
	}
end

function FruitTreasurePassItem.register_event(slot0)
	registerButtonEventListener(slot0.b_get, function ()
		if not uv0.data then
			return
		end

		if uv0._list_unlock_flag.basic and uv0._list_unlock_flag.advanced and (not uv0._list_get_flag.basic or not uv0._list_get_flag.advanced) then
			uv1:sender29622(uv0.data.reward_id)

			return
		end

		if uv0._flag_get_state == 1 then
			uv1:sender29622(slot0)
		elseif uv0._flag_get_state == 2 then
			if not slot1 then
				slot6 = uv2:GetPassConfigByKey("junior_unlock")

				CommonAlert.show(string.format("%s<img src=%s visible=true scale=0.3 /><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#764519>(%s:</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#764519>)\n</div>", TI18N("是否使用"), PathTool.getItemRes(slot6[1]), slot6[2], TI18N("拥有"), uv0.role_vo.gold + uv0.role_vo.red_gold) .. "\n激活初级战令", TI18N("确定"), function ()
					uv0:sender29621()
				end, TI18N("取消"), nil, CommonAlert.type.rich)
			elseif not slot2 then
				slot6 = Config.ChargeData.data_charge_data[uv2:GetPassConfigByKey("charge_id")]

				CommonAlert.show("是否购买高级战令", TI18N("确定"), function ()
					sdkOnPay(uv0.val, 1, uv1, uv0.name)
				end, TI18N("取消"), nil, CommonAlert.type.common)
			end
		end
	end, true, 1)
end

function FruitTreasurePassItem.setData(slot0, slot1)
	slot0.data = slot1
	slot0._list_unlock_flag.basic = uv0:GetBattlePassInfo().junior_status == TRUE
	slot0._list_unlock_flag.advanced = slot2.senior_status == TRUE
	slot3 = slot1.junior_reward

	slot0.free_item:setData({
		id = slot3[1][1],
		num = slot3[1][2]
	})
	slot0.free_item:showOrderWarLock(not slot0._list_unlock_flag.basic, cc.p(BackPackItem.Width / 2, BackPackItem.Height / 2))

	for slot7, slot8 in ipairs(slot0.arr_pay_item) do
		slot9 = slot1.senior_reward

		slot8:setData({
			id = slot9[slot7][1],
			num = slot9[slot7][2]
		})
		slot8:showOrderWarLock(not slot0._list_unlock_flag.advanced, cc.p(BackPackItem.Width / 2, BackPackItem.Height / 2))
	end

	slot4 = uv0:GetBattlePassInfoByKey("activity")
	slot5 = slot1.activity

	slot0.t_schedule:setString(string.format(TI18N("活跃度\n%s/%s"), slot4, slot5))
	slot0.b_get:setVisible(slot5 <= slot4)
	slot0.n_red:setVisible(slot5 <= slot4)
	slot0.t_schedule:setVisible(slot4 < slot5)
	slot0.n_get:setVisible(false)

	if slot4 < slot5 then
		return
	end

	for slot11, slot12 in ipairs(uv0:GetBattlePassInfoByKey("reward_list")) do
		if slot12.reward_id == slot1.reward_id then
			slot0._list_get_flag.basic = slot12.status1 == TRUE
			slot0._list_get_flag.advanced = slot12.status2 == TRUE

			break
		end
	end

	slot8 = slot0._list_unlock_flag.basic
	slot9 = slot0._list_unlock_flag.advanced
	slot12 = "领取"

	if slot0._list_get_flag.basic and slot0._list_get_flag.advanced then
		slot0.b_get:setVisible(false)
		slot0.t_schedule:setVisible(false)
		slot0.n_get:setVisible(true)
	elseif not slot8 and not slot9 then
		slot12 = "领取"
		slot0._flag_get_state = 2
	elseif slot8 and not slot9 and not slot10 or slot9 and not slot8 and not slot11 then
		slot12 = "领取"
		slot0._flag_get_state = 1
	elseif slot8 and slot10 and not slot9 and not slot11 or slot9 and slot11 and not slot8 and not slot10 then
		slot12 = "继续领取"
		slot0._flag_get_state = 2
	elseif slot8 and slot10 and slot9 and not slot11 or slot9 and slot11 and slot8 and not slot10 then
		slot12 = "继续领取"
		slot0._flag_get_state = 1
	end

	slot0.t_cost:setString(slot12)
end

function FruitTreasurePassItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
