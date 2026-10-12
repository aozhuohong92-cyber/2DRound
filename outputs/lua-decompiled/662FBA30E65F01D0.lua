NewFirstChargeWindow3 = NewFirstChargeWindow3 or BaseClass(BaseView)
slot0 = {
	cc.c4b(130, 205, 236, 255),
	cc.c4b(29, 60, 124, 255),
	cc.c4b(255, 255, 255, 255)
}
slot2 = NewFirstChargeController:getInstance():getModel()
slot3 = string.format

function NewFirstChargeWindow3.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "newfirstcharge/newfirstcharge_window3"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("newfirstcharge1", "newfirstcharge1"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_action_bigbg_4"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_action_bigbg_6"),
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

	slot0.item_effect_list = {}

	for slot4 = 1, 2 do
		slot0.item_effect_list[slot4] = {}

		for slot8 = 1, 3 do
			slot0.item_effect_list[slot4][slot8] = {}
		end
	end
end

function NewFirstChargeWindow3.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot1 = slot0.main_container:getChildByName("container")
	slot0.bg1 = slot1:getChildByName("bg1")
	slot0.bg2 = slot1:getChildByName("bg2")

	if not slot0.bg1_item_load then
		slot0.bg1_item_load = loadSpriteTextureFromCDN(slot0.bg1, PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_action_bigbg_4"), ResourcesType.single, slot0.bg1_item_load)
	end

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.title_img = slot1:getChildByName("title_img")
	slot0.remain_charge = slot1:getChildByName("remain_charge")

	slot0.remain_charge:setString(TI18N("已累计消耗快乐币: "))

	slot0.battle_preview_btn = slot1:getChildByName("battle_preview_btn")
	slot0.preview_btn_label = slot0.battle_preview_btn:getChildByName("preview_btn_label")

	slot0.preview_btn_label:setString(TI18N("战斗预览"))
	slot0.battle_preview_btn:setVisible(false)

	slot0.btn_recharge = slot1:getChildByName("btn")
	slot0.btn_label = slot0.btn_recharge:getChildByName("label")

	slot0.btn_label:setString(TI18N("前往充值"))
	UITool.SetTitleColor(slot0.btn_label)

	slot6 = slot0.main_container

	slot0:playEnterAnimatianByObj(slot6, 2)
	uv0:setFirstRechargeNewData3()

	for slot6 = 1, 3 do
		if slot1:getChildByName("item_" .. slot6) then
			slot8 = {
				scroll = slot7:getChildByName("scroll")
			}

			slot8.scroll:setScrollBarEnabled(false)

			slot8.finish_icon = slot7:getChildByName("finish_icon")

			slot8.finish_icon:setVisible(false)

			slot8.title = slot7:getChildByName("title")

			slot8.title:setString(uv1(TI18N("第%d天免费领"), slot6))

			slot8.list = {}
			slot0.item_list[slot6] = slot8
		end
	end

	slot0.tab_view = {}

	for slot7 = 1, 2 do
		slot8 = {
			btn = slot1:getChildByName("btn_grade_" .. slot7)
		}
		slot8.normal = slot8.btn:getChildByName("normal")

		slot8.normal:setScale(0.8)

		slot8.select = slot8.btn:getChildByName("select")

		slot8.select:setVisible(false)

		slot8.title = slot8.btn:getChildByName("title")

		slot8.title:setPositionX(118)
		slot8.title:setString(({
			TI18N("10元赠礼"),
			TI18N("50元赠礼")
		})[slot7])
		slot8.title:setTextColor(uv2[1])
		slot8.title:enableOutline(uv2[2], 2)

		slot8.title_barner = slot1:getChildByName("title_img_" .. slot7)

		slot8.title_barner:setOpacity(0)

		slot8.index = slot7
		slot0.tab_view[slot7] = slot8
	end
end

function NewFirstChargeWindow3.openRootWnd(slot0, slot1)
	slot0:changeTabView(slot1 or 1)
	uv0:sender21032()
end

function NewFirstChargeWindow3.changeTabView(slot0, slot1)
	if slot0.cur_index == (slot1 or 1) then
		return
	end

	if slot0.tab_index ~= nil then
		slot0.tab_index.normal:setVisible(true)
		slot0.tab_index.select:setVisible(false)
		slot0.tab_index.title:setPositionX(118)
		slot0.tab_index.title:setTextColor(uv0[1])
	end

	slot0.tab_index = slot0.tab_view[slot1]

	if slot0.tab_index ~= nil then
		slot0.tab_index.normal:setVisible(false)
		slot0.tab_index.select:setVisible(true)
		slot0.tab_index.title:setPositionX(118)
		slot0.tab_index.title:setTextColor(uv0[3])
	end

	if slot1 == 1 then
		slot0.bg1:setVisible(true)
		slot0.bg2:setVisible(false)
		slot0.battle_preview_btn:setPosition(130, 520)
		slot0.close_btn:setPosition(638, 910)
	elseif slot1 == 2 then
		if not slot0.bg2_item_load then
			slot0.bg2_item_load = loadSpriteTextureFromCDN(slot0.bg2, PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_action_bigbg_6"), ResourcesType.single, slot0.bg2_item_load)
		end

		slot0.bg1:setVisible(false)
		slot0.bg2:setVisible(true)
		slot0.battle_preview_btn:setPosition(110, 588)
		slot0.close_btn:setPosition(638, 910)
	end

	slot0.cur_index = slot1

	slot0:titleBarnerAction(slot1)
	slot0:fillItemList(uv1:getFirstRechargeData(slot1))

	if slot0.updata_charge_data then
		slot0:updateData(slot0.updata_charge_data)
	end
end

function NewFirstChargeWindow3.titleBarnerAction(slot0, slot1)
	slot0:stopAllActions()

	if slot1 == 1 then
		slot0.tab_view[2].title_barner:setOpacity(0)
		slot0.tab_view[1].title_barner:runAction(cc.FadeIn:create(0.2))
	elseif slot1 == 2 then
		slot0.tab_view[1].title_barner:setOpacity(0)
		slot0.tab_view[2].title_barner:runAction(cc.FadeIn:create(slot2))
	end
end

function NewFirstChargeWindow3.stopAllActions(slot0)
	for slot4, slot5 in pairs(slot0.tab_view) do
		doStopAllActions(slot5.title_barner)
	end
end

function NewFirstChargeWindow3.fillItemList(slot0, slot1)
	slot0:hideItemEffect()

	slot3 = 119 * 0.7
	slot4 = 1
	slot8 = slot1

	for slot8 = 1, tableLen(slot8) do
		slot9 = slot0.item_list[slot8]

		for slot14 = 1, tableLen(slot1[slot8].item_list) do
			delayRun(slot0.main_container, slot4 / 15, function ()
				slot0 = uv0 * uv1 - uv0 * 0.5
				slot1 = uv0 * 0.5

				if not uv2.item_reward_list[uv3][uv1] then
					uv2.item_reward_list[uv3][uv1] = BackPackItem.new(false, true, false, uv4, false, true)

					uv5.scroll:addChild(uv2.item_reward_list[uv3][uv1])
				end

				if not uv2.item_effect_list[uv2.cur_index][uv3][uv1] then
					slot2 = uv2.item_reward_list[uv3][uv1]:getContentSize().width / 2
					slot3 = uv2.item_reward_list[uv3][uv1]:getContentSize().height / 2

					if uv6[uv3].effect_list and not uv2.item_effect_list[uv2.cur_index][uv3][uv1] then
						slot4 = "action"
						slot5 = 1

						if uv6[uv3].effect_list[1][uv1] == 263 then
							slot4 = "action1"
							slot5 = 1.1
						end

						uv2.item_effect_list[uv2.cur_index][uv3][uv1] = createEffectSpine(PathTool.getEffectRes(uv6[uv3].effect_list[1][uv1]), cc.p(slot2, slot3), cc.p(0.5, 0.5), true, slot4)

						uv2.item_reward_list[uv3][uv1]:addChild(uv2.item_effect_list[uv2.cur_index][uv3][uv1])
						uv2.item_effect_list[uv2.cur_index][uv3][uv1]:setScale(slot5)
						uv2.item_effect_list[uv2.cur_index][uv3][uv1]:setVisible(false)
					end
				end

				if uv2.item_effect_list[uv2.cur_index][uv3][uv1] then
					uv2.item_effect_list[uv2.cur_index][uv3][uv1]:setVisible(true)
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

function NewFirstChargeWindow3.hideItemEffect(slot0)
	for slot4 = 1, 2 do
		for slot8 = 1, 3 do
			for slot12 = 1, 2 do
				if slot0.item_effect_list[slot4][slot8][slot12] then
					slot0.item_effect_list[slot4][slot8][slot12]:setVisible(false)
				end
			end
		end
	end
end

function NewFirstChargeWindow3.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openNewFirstChargeView(false)
	end, false, 2)
	registerButtonEventListener(slot0.background, function ()
		uv0:openNewFirstChargeView(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_recharge, function ()
		slot0 = uv0:getFirstRechargeData(uv1.cur_index)

		if uv1.get_gift_id == 0 then
			if RoleController:getInstance():getRoleVo() and slot1.lev >= 10 and RoleController:getInstance():getModel():getOpenSrvDay() <= 15 then
				ActionController:getInstance():openActionMainPanel(true, nil, ActionRankCommonType.novice_gift)
			else
				VipController:getInstance():openVipMainWindow(true, VIPTABCONST.CHARGE)
			end
		elseif uv1.get_gift_id == 1 then
			if slot0[uv1.gift_index] then
				uv2:sender21033(slot0[uv1.gift_index].id)
			end
		else
			uv2:openNewFirstChargeView(false)
		end
	end, true, 1)

	function slot4()
		if uv0.cur_index == 1 then
			TimesummonController:getInstance():send23219(BattlePreviewParm.FirstCharge)
		else
			TimesummonController:getInstance():send23219(BattlePreviewParm.FirstCharge2)
		end
	end

	slot5 = true

	registerButtonEventListener(slot0.battle_preview_btn, slot4, slot5)

	for slot4, slot5 in pairs(slot0.tab_view) do
		registerButtonEventListener(slot5.btn, function ()
			uv0:changeTabView(uv1.index)
		end, true, 1)
	end

	slot0:addGlobalEvent(NewFirstChargeEvent.New_First_Charge_Event, function (slot0)
		uv0.updata_charge_data = slot0

		uv0.remain_charge:setString(uv1(TI18N("已累计消耗快乐币: %d"), math.floor(RoleController:getInstance():getRoleVo().vip_exp * 0.1)))
		uv0:setRedPointTab()
		uv0:updateData(slot0)
	end)
end

function NewFirstChargeWindow3.setRedPointTab(slot0)
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

function NewFirstChargeWindow3.updateData(slot0, slot1)
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

function NewFirstChargeWindow3.close_callback(slot0)
	doStopAllActions(slot0.main_container)
	slot0:stopAllActions()

	for slot4 = 1, 2 do
		for slot8 = 1, 3 do
			for slot12 = 1, 2 do
				if slot0.item_effect_list[slot4][slot8][slot12] then
					slot0.item_effect_list[slot4][slot8][slot12]:clearTracks()
					slot0.item_effect_list[slot4][slot8][slot12]:removeFromParent()

					slot0.item_effect_list[slot4][slot8][slot12] = nil
				end
			end
		end
	end

	slot0.item_effect_list = {}

	for slot4 = 1, 3 do
		for slot8, slot9 in pairs(slot0.item_reward_list[slot4]) do
			slot9:DeleteMe()
		end

		slot0.item_reward_list[slot4] = nil
	end

	slot0.item_reward_list = {}

	if slot0.bg1_item_load then
		slot0.bg1_item_load:DeleteMe()
	end

	slot0.bg1_item_load = nil

	if slot0.bg2_item_load then
		slot0.bg2_item_load:DeleteMe()
	end

	slot0.bg2_item_load = nil

	uv0:openNewFirstChargeView(false)
end
