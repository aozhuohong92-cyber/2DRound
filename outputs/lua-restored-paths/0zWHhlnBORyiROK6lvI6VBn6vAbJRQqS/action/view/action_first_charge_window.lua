ActionFirstChargeWindow = ActionFirstChargeWindow or BaseClass(BaseView)
slot1 = ActionController:getInstance():getModel()

function ActionFirstChargeWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "action/action_first_charge_window"
	slot0.tab_list = {}
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("firstcharge", "firstcharge"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_action_bigbg_1"),
			type = ResourcesType.single
		}
	}
	slot0.cur_index = nil
	slot0.item_list = {}
	slot0.item_reward_list = {}

	for slot4 = 1, 3 do
		slot0.item_reward_list[slot4] = {}
	end
end

function ActionFirstChargeWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container)

	slot1 = slot0.main_container:getChildByName("container")

	slot1:setPositionY(display.getTop())

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.title_img = slot1:getChildByName("title_img")
	slot0.btn_return = slot1:getChildByName("btn_return")
	slot0.return_title = slot0.btn_return:getChildByName("Sprite_2")
	slot0.remain_charge = slot1:getChildByName("remain_charge")

	slot0.remain_charge:setVisible(false)

	slot0.btn_recharge = slot1:getChildByName("btn")
	slot0.btn_label = slot0.btn_recharge:getChildByName("label")
	slot5 = TI18N

	slot0.btn_label:setString(slot5("前往充值"))
	uv0:setFirstRechargeData()

	for slot5 = 1, 3 do
		if slot1:getChildByName("item_" .. slot5) then
			slot7 = {
				scroll = slot6:getChildByName("scroll")
			}

			slot7.scroll:setScrollBarEnabled(false)

			slot7.finish_icon = slot6:getChildByName("finish_icon")

			slot7.finish_icon:setVisible(false)

			slot7.title = slot6:getChildByName("title")

			slot7.title:setString(TI18N("第") .. slot5 .. TI18N("天免费领"))

			slot7.list = {}
			slot0.item_list[slot5] = slot7
		end
	end

	slot0.container = slot1
	slot0.switch_effect = createEffectSpine(PathTool.getEffectRes(350), cc.p(slot0.btn_return:getPositionX(), slot0.btn_return:getPositionY()), cc.p(0.5, 0.5), true, "action")

	slot0.switch_effect:setVisible(false)
	slot0.container:addChild(slot0.switch_effect)
end

function ActionFirstChargeWindow.openRootWnd(slot0, slot1)
	slot0:changeTabView(slot1 or 1)
	uv0:sender21000()
end

function ActionFirstChargeWindow.changeTabView(slot0, slot1)
	slot0.cur_index = slot1

	loadSpriteTexture(slot0.title_img, PathTool.getResFrame("firstcharge", "txt_cn_firstcharge_" .. 3 + slot1), LOADTEXT_TYPE_PLIST)
	loadSpriteTexture(slot0.return_title, PathTool.getResFrame("firstcharge", "txt_cn_firstcharge_" .. 1 + slot1), LOADTEXT_TYPE_PLIST)
	slot0:fillItemList(uv0:getFirstRechargeData(slot1))

	if slot0.cur_index == 2 then
		slot0.switch_effect:setVisible(false)

		slot6 = true

		if (1000 - RoleController:getInstance():getRoleVo().vip_exp) * 0.1 <= 0 then
			slot5 = 0
			slot6 = false
		end

		slot0.remain_charge:setVisible(slot6)
		slot0.remain_charge:setString(string.format(TI18N("还需充值: %d元"), slot5))
	else
		slot0.switch_effect:setVisible(true)
		slot0.remain_charge:setVisible(false)
	end

	slot4 = 4
	slot5 = 6

	if slot0.cur_index == 2 then
		slot4 = 1
		slot5 = 3
	end

	slot6 = false

	for slot10 = slot4, slot5 do
		if ActionController:getInstance():getModel():getFirstBtnStatus(slot10) and slot11 == 1 then
			slot6 = true

			break
		end
	end

	addRedPointToNodeByStatus(slot0.btn_return, slot6)

	if slot0.updata_charge_data then
		slot0:updateData(slot0.updata_charge_data)
	end
end

function ActionFirstChargeWindow.fillItemList(slot0, slot1)
	slot4 = 1
	slot8 = slot1

	for slot8 = 1, tableLen(slot8) do
		slot9 = slot0.item_list[slot8]
		slot10 = tableLen(slot1[slot8].item_list)
		slot14 = cc.size

		slot9.scroll:setInnerContainerSize(slot14(119 * 0.8 * slot10, slot9.scroll:getContentSize().height))

		for slot14 = 1, slot10 do
			delayRun(slot0.main_container, slot4 / 15, function ()
				slot0 = uv0 * uv1 - uv0 * 0.5
				slot1 = uv0 * 0.5

				if not uv2.item_reward_list[uv3][uv1] then
					uv2.item_reward_list[uv3][uv1] = BackPackItem.new(false, true, false, uv4, false, true)

					uv5.scroll:addChild(uv2.item_reward_list[uv3][uv1])
				end

				if uv2.item_reward_list[uv3][uv1] then
					uv2.item_reward_list[uv3][uv1]:setPosition(slot0, slot1)
					uv2.item_reward_list[uv3][uv1]:setBaseData(uv6[uv3].item_list[uv1][1], uv6[uv3].item_list[uv1][2])
				end
			end)

			slot4 = slot4 + 1
		end
	end
end

function ActionFirstChargeWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openFirstChargeView(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_return, function ()
		if uv0.cur_index == 1 then
			uv0.cur_index = 2
		elseif uv0.cur_index == 2 then
			uv0.cur_index = 1
		end

		uv0:changeTabView(uv0.cur_index)
	end, true, 2)
	registerButtonEventListener(slot0.btn_recharge, function ()
		slot0 = uv0:getFirstRechargeData(uv1.cur_index)

		if uv1.get_gift_id == 0 then
			VipController:getInstance():openVipMainWindow(true, VIPTABCONST.CHARGE)
		elseif uv1.get_gift_id == 1 then
			if slot0[uv1.gift_index] then
				uv2:sender21001(slot0[uv1.gift_index].id)
			end
		else
			uv2:openFirstChargeView(false)
		end
	end, true, 1)
	slot0:addGlobalEvent(ActionEvent.Update_First_Charge_Status, function (slot0)
		uv0.updata_charge_data = slot0

		uv0:updateData(slot0)
	end)
end

function ActionFirstChargeWindow.updateData(slot0, slot1)
	if slot1 == nil then
		return
	end

	for slot7, slot8 in ipairs(({
		{
			1,
			2,
			3
		},
		{
			4,
			5,
			6
		}
	})[slot0.cur_index]) do
		slot0.item_list[slot7].finish_icon:setVisible(uv0:getFirstBtnStatus(slot8) == 2)
	end

	slot0.gift_index = 0
	slot0.get_gift_id = 10

	for slot8, slot9 in ipairs({
		[slot7] = slot9
	}) do
		slot4 = 0 + slot9

		if slot9 == 1 then
			slot0.get_gift_id = 1
			slot0.gift_index = slot8
		end
	end

	if slot0.cur_index == 2 then
		slot5 = false
		slot6 = 0

		for slot10, slot11 in pairs(slot2[1]) do
			if uv0:getFirstBtnStatus(slot11) == 1 or slot12 == 2 then
				slot6 = 1
			end

			if slot12 == 1 then
				slot5 = true

				break
			end
		end

		if slot6 == 0 then
			slot5 = true
		end

		slot0.switch_effect:setVisible(slot5)
	end

	if slot4 == 0 then
		slot0.get_gift_id = 0

		slot0.btn_label:setString(TI18N("前往充值"))
	elseif slot4 == 1 or slot4 == 3 or slot4 == 5 then
		slot0.btn_label:setString(TI18N("领取奖励"))
	elseif slot4 == 2 or slot4 == 4 then
		slot0.btn_label:setString(TI18N("明日再来"))
	elseif slot4 == 6 then
		slot0.btn_label:setString(TI18N("领取完毕"))
	end
end

function ActionFirstChargeWindow.close_callback(slot0)
	doStopAllActions(slot0.main_container)

	for slot4 = 1, 3 do
		for slot8, slot9 in pairs(slot0.item_reward_list[slot4]) do
			slot9:DeleteMe()
		end

		slot0.item_reward_list[slot4] = nil
	end

	slot0.item_reward_list = {}

	if slot0.switch_effect then
		slot0.switch_effect:clearTracks()
		slot0.switch_effect:removeFromParent()

		slot0.switch_effect = nil
	end

	uv0:openFirstChargeView(false)
end
