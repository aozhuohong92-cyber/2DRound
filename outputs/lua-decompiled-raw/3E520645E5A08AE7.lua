NewFirstChargeWindow = NewFirstChargeWindow or BaseClass(BaseView)
slot0 = {
	cc.c4b(255, 255, 255, 255),
	cc.c4b(113, 0, 66, 255),
	cc.c4b(196, 90, 20, 255),
	cc.c4b(37, 85, 5, 255)
}
slot2 = NewFirstChargeController:getInstance():getModel()
slot3 = string.format

function NewFirstChargeWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "newfirstcharge/newfirstcharge_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("newfirstcharge", "newfirstcharge"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_action_bigbg_3"),
			type = ResourcesType.single
		}
	}
	slot0.action_fadein_1 = true
	slot0.action_fadein_2 = true
	slot0.action_fadeout_1 = true
	slot0.action_fadeout_2 = true
	slot0.cur_index = nil
	slot0.item_list = {}
	slot0.item_reward_list = {}

	for slot4 = 1, 3 do
		slot0.item_reward_list[slot4] = {}
	end
end

function NewFirstChargeWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot1 = slot0.main_container:getChildByName("container")

	slot1:setPositionY(display.getTop())

	if not slot0.item_load then
		slot0.item_load = loadSpriteTextureFromCDN(slot1:getChildByName("bg"), PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_action_bigbg_3"), ResourcesType.single, slot0.item_load)
	end

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.title_img = slot1:getChildByName("title_img")
	slot0.remain_charge = slot1:getChildByName("remain_charge")

	slot0.remain_charge:setString(TI18N("已累充: "))

	slot0.btn_recharge = slot1:getChildByName("btn")
	slot0.btn_label = slot0.btn_recharge:getChildByName("label")
	slot7 = TI18N

	slot0.btn_label:setString(slot7("前往充值"))
	uv0:setFirstRechargeData()

	for slot7 = 1, 3 do
		if slot1:getChildByName("item_" .. slot7) then
			slot9 = {
				scroll = slot8:getChildByName("scroll")
			}

			slot9.scroll:setScrollBarEnabled(false)

			slot9.finish_icon = slot8:getChildByName("finish_icon")

			slot9.finish_icon:setVisible(false)

			slot9.title = slot8:getChildByName("title")

			slot9.title:setString(uv1(TI18N("第%d天免费领"), slot7))

			slot9.list = {}
			slot0.item_list[slot7] = slot9
		end
	end

	slot0.tab_view = {}

	for slot7 = 1, 2 do
		slot8 = {
			btn = slot1:getChildByName("btn_grade_" .. slot7)
		}
		slot8.normal = slot8.btn:getChildByName("normal")
		slot8.select = slot8.btn:getChildByName("select")

		slot8.select:setVisible(false)

		slot8.title = slot8.btn:getChildByName("title")

		slot8.title:setTextColor(uv2[1])
		slot8.title:enableOutline(uv2[2], 2)

		slot8.title_barner = slot1:getChildByName("title_img_" .. slot7)

		slot8.title_barner:setOpacity(0)

		slot8.index = slot7
		slot0.tab_view[slot7] = slot8
	end

	slot0.tab_get_hero = {}

	for slot7 = 1, 3 do
		slot8 = {
			btn = slot1:getChildByName("btn_" .. slot7)
		}
		slot8.title = slot8.btn:getChildByName("Text_1")
		slot8.get = slot1:getChildByName("get_" .. slot7)

		slot8.get:setVisible(false)

		slot8.index = slot7
		slot0.tab_get_hero[slot7] = slot8
	end
end

function NewFirstChargeWindow.openRootWnd(slot0, slot1)
	slot0:changeTabView(slot1 or 1)
	uv0:sender21012()
end

function NewFirstChargeWindow.changeTabView(slot0, slot1)
	if slot0.cur_index == (slot1 or 1) then
		return
	end

	if slot0.tab_index ~= nil then
		slot0.tab_index.normal:setVisible(true)
		slot0.tab_index.select:setVisible(false)
		slot0.tab_index.title:enableOutline(uv0[2], 2)
	end

	slot0.tab_index = slot0.tab_view[slot1]

	if slot0.tab_index ~= nil then
		slot0.tab_index.normal:setVisible(false)
		slot0.tab_index.select:setVisible(true)
		slot0.tab_index.title:enableOutline(uv0[3], 2)
	end

	slot0.cur_index = slot1

	slot0:titleBarnerAction(slot1)
	slot0:fillItemList(uv1:getFirstRechargeData(slot1))

	if slot0.updata_charge_data then
		slot0:updateData(slot0.updata_charge_data)
	end
end

function NewFirstChargeWindow.titleBarnerAction(slot0, slot1)
	slot3 = 0.4

	slot0:stopAllActions()

	if slot1 == 1 then
		slot0.tab_view[2].title_barner:setOpacity(0)
		slot0.tab_view[1].title_barner:runAction(cc.FadeIn:create(1))
	elseif slot1 == 2 then
		slot0.tab_view[1].title_barner:setOpacity(0)
		slot0.tab_view[2].title_barner:runAction(cc.FadeIn:create(slot2))
	end
end

function NewFirstChargeWindow.stopAllActions(slot0)
	for slot4, slot5 in pairs(slot0.tab_view) do
		doStopAllActions(slot5.title_barner)
	end
end

function NewFirstChargeWindow.fillItemList(slot0, slot1)
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

function NewFirstChargeWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openNewFirstChargeView(false)
	end, false, 2)

	function slot4()
		slot0 = uv0:getFirstRechargeData(uv1.cur_index)

		if uv1.get_gift_id == 0 then
			VipController:getInstance():openVipMainWindow(true, VIPTABCONST.CHARGE)
		elseif uv1.get_gift_id == 1 then
			if slot0[uv1.gift_index] then
				uv2:sender21013(slot0[uv1.gift_index].id)
			end
		else
			uv2:openNewFirstChargeView(false)
		end
	end

	slot5 = true

	registerButtonEventListener(slot0.btn_recharge, slot4, slot5, 1)

	for slot4, slot5 in pairs(slot0.tab_view) do
		registerButtonEventListener(slot5.btn, function ()
			uv0:changeTabView(uv1.index)
		end, true, 1)
	end

	for slot4, slot5 in pairs(slot0.tab_get_hero) do
		registerButtonEventListener(slot5.btn, function ()
			if uv0.index and uv1.updata_charge_data then
				if uv1.updata_charge_data.choosen_status == 1 then
					if Config.PartnerData.data_partner_base[({
						20501,
						30506,
						10505
					})[uv0.index]] then
						CommonAlert.show(uv2(TI18N("<div fontcolor='#643223'>是否确定选择</div> <div fontcolor='#bc3f0e' fontsize=26>%s</div> <div fontcolor='#643223'>作为奖励？\n</div> <div fontcolor='#643223'>  确定后其它英雄将不可领取</div>"), slot1.name), TI18N("确定"), function ()
							uv0:sender21014(uv1.index)
						end, TI18N("取消"), nil, CommonAlert.type.rich, nil, , 26)
					end
				else
					uv3:sender21014(uv0.index)
				end
			end
		end, true, 1)
	end

	slot0:addGlobalEvent(NewFirstChargeEvent.New_First_Charge_Event, function (slot0)
		uv0.updata_charge_data = slot0

		if slot0.choosen_status and slot0.has_choosen_id then
			uv0:getChooseHeroStatus(slot0.choosen_status, slot0.has_choosen_id)
		end

		uv0.remain_charge:setString(uv1(TI18N("已累充: %d"), math.floor(RoleController:getInstance():getRoleVo().vip_exp * 0.1)))
		uv0:setRedPointTab()
		uv0:updateData(slot0)
	end)
end

function NewFirstChargeWindow.setRedPointTab(slot0)
	slot1 = false

	for slot5 = 1, 3 do
		if uv0:getFirstBtnStatus(slot5) and slot6 == 1 then
			slot1 = true

			break
		end
	end

	addRedPointToNodeByStatus(slot0.tab_view[1].btn, slot1)

	slot2 = false

	for slot6 = 4, 6 do
		if uv0:getFirstBtnStatus(slot6) and slot7 == 1 then
			slot2 = true

			break
		end
	end

	addRedPointToNodeByStatus(slot0.tab_view[2].btn, slot2)
end

function NewFirstChargeWindow.getChooseHeroStatus(slot0, slot1, slot2)
	for slot6 = 1, 3 do
		if slot1 == 0 then
			slot0.tab_get_hero[slot6].get:setVisible(false)
			slot0.tab_get_hero[slot6].btn:setVisible(true)
			setChildUnEnabled(true, slot0.tab_get_hero[slot6].btn, uv0[1])
		elseif slot1 == 1 then
			slot0.tab_get_hero[slot6].get:setVisible(false)
			slot0.tab_get_hero[slot6].btn:setVisible(true)
			setChildUnEnabled(false, slot0.tab_get_hero[slot6].btn, uv0[4])
		elseif slot1 == 2 then
			slot0.tab_get_hero[slot6].btn:setVisible(false)

			if slot6 == slot2 then
				slot0.tab_get_hero[slot6].get:setVisible(true)
			end
		end
	end
end

function NewFirstChargeWindow.updateData(slot0, slot1)
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

function NewFirstChargeWindow.close_callback(slot0)
	doStopAllActions(slot0.main_container)
	slot0:stopAllActions()

	for slot4 = 1, 3 do
		for slot8, slot9 in pairs(slot0.item_reward_list[slot4]) do
			slot9:DeleteMe()
		end

		slot0.item_reward_list[slot4] = nil
	end

	slot0.item_reward_list = {}

	if slot0.item_load then
		slot0.item_load:DeleteMe()
	end

	slot0.item_load = nil

	uv0:openNewFirstChargeView(false)
end
