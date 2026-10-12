ActionSkinDirectPurchasePanel = ActionSkinDirectPurchasePanel or BaseClass(BaseView)
slot1 = ActionController:getInstance():getModel()
slot2 = table.insert

function ActionSkinDirectPurchasePanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = true
	slot0.layout_name = "action/action_skin_direct_purchase_panel"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("actionskindp", "actionskindp"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_skin_direct_purchase_bg", false),
			type = ResourcesType.single
		}
	}
	slot0.touch_buy_skin = true
end

function ActionSkinDirectPurchasePanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	ActionSkinDirectPurchasePanel.bg = slot0.main_container:getChildByName("bg")
	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.show_btn = slot0.main_container:getChildByName("show_btn")
	slot0.comfirm_btn = slot0.main_container:getChildByName("comfirm_btn")
	slot0.comfirm_btn_label = slot0.comfirm_btn:getChildByName("label")

	slot0.comfirm_btn_label:setTextColor(cc.c4b(2, 54, 86, 255))

	slot0.time_text_0 = slot0.main_container:getChildByName("time_text_0")

	slot0.time_text_0:setString(TI18N("剩余时间:"))

	slot0.time_text = slot0.main_container:getChildByName("time_text")
	slot0.scroll_container = slot0.main_container:getChildByName("scroll_container")
	slot1 = slot0.scroll_container:getContentSize()
	slot0.scroll_view = createScrollView(slot1.width, slot1.height, 0, 0, slot0.scroll_container, ScrollViewDir.horizontal)

	slot0.updateSpine()
end

function ActionSkinDirectPurchasePanel.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openActionSkinDirectPurchasePanel(false)
	end, true, 2)
	registerButtonEventListener(slot0.show_btn, function ()
		uv0:onShowBtn()
	end, true, 2, nil, , 2)
	registerButtonEventListener(slot0.comfirm_btn, function ()
		uv0:onComfirmBtn()
	end, true, 2)
	slot0:addGlobalEvent(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
		if not slot0 then
			return
		end

		if slot0.bid == ActionRankCommonType.skin_direct_purchase then
			uv0:setData(slot0)
		end
	end)
end

function ActionSkinDirectPurchasePanel.onShowBtn(slot0)
	TimesummonController:getInstance():send23219(ActionRankCommonType.skin_direct_purchase)
end

function ActionSkinDirectPurchasePanel.onComfirmBtn(slot0)
	if not slot0.touch_buy_skin then
		return
	end

	if not slot0.cur_skin_id then
		return
	end

	if HeroController:getModel():isUnlockHeroSkin(slot0.cur_skin_id, true) and Config.PartnerSkinData.data_skin_info and slot2[slot0.cur_skin_id] and slot2[slot0.cur_skin_id].diamond_num and slot3[1] then
		CommonAlert.show(string.format(TI18N("您已拥有当前皮肤的永久使用权，再次购买后使用将会转化成 <img src='%s' scale=0.3 /><div fontcolor=#289b14> *%d </div>，是否继续购买"), PathTool.getItemRes(Config.ItemData.data_get_data(slot3[1][1]).icon), slot3[1][2]), TI18N("确定"), function ()
			uv0:setChargeSkin()
		end, TI18N("取消"), nil, CommonAlert.type.rich)

		return
	end

	slot0:setChargeSkin()
end

function ActionSkinDirectPurchasePanel.setChargeSkin(slot0)
	if slot0.buy_skin_ticket == nil then
		slot0.buy_skin_ticket = GlobalTimeTicket:getInstance():add(function ()
			uv0.touch_buy_skin = true

			if uv0.buy_skin_ticket ~= nil then
				GlobalTimeTicket:getInstance():remove(uv0.buy_skin_ticket)

				uv0.buy_skin_ticket = nil
			end
		end, 3)
	end

	slot0.touch_buy_skin = nil

	if slot0.buy_charge_id and Config.ChargeData.data_charge_data[slot0.buy_charge_id] then
		sdkOnPay(slot1.val, 1, slot1.id, slot1.name)
	end
end

function ActionSkinDirectPurchasePanel.updateSpine(slot0)
	function slot1()
		if not ActionSkinDirectPurchasePanel.spine then
			ActionSkinDirectPurchasePanel.spine = BaseRole.new(BaseRole.type.partner, 70532, nil, {
				scale = 0.7
			})

			ActionSkinDirectPurchasePanel.spine:setAnimation(0, PlayerAction.show, true)
			ActionSkinDirectPurchasePanel.spine:setPosition(cc.p(40, 0))
			ActionSkinDirectPurchasePanel.spine:setAnchorPoint(cc.p(0, 0))
			ActionSkinDirectPurchasePanel.bg:addChild(ActionSkinDirectPurchasePanel.spine)
			ActionSkinDirectPurchasePanel.spine:setOpacity(0)
			ActionSkinDirectPurchasePanel.spine:runAction(cc.FadeIn:create(0.2))
		end
	end

	if ActionSkinDirectPurchasePanel.spine then
		doRemoveFromParent(ActionSkinDirectPurchasePanel.spine)

		ActionSkinDirectPurchasePanel.spine = BaseRole.new(BaseRole.type.partner, 70532, nil, {
			scale = 0.7
		})

		ActionSkinDirectPurchasePanel.spine:setAnimation(0, PlayerAction.show, true)
		ActionSkinDirectPurchasePanel.spine:setPosition(cc.p(40, 0))
		ActionSkinDirectPurchasePanel.spine:setAnchorPoint(cc.p(0, 0))
		ActionSkinDirectPurchasePanel.bg:addChild(ActionSkinDirectPurchasePanel.spine)
		ActionSkinDirectPurchasePanel.spine:setOpacity(0)
		ActionSkinDirectPurchasePanel.spine:runAction(cc.FadeIn:create(0.2))
	else
		slot1()
	end
end

function ActionSkinDirectPurchasePanel.openRootWnd(slot0)
	uv0:cs16603(ActionRankCommonType.skin_direct_purchase)
end

function ActionSkinDirectPurchasePanel.setData(slot0, slot1)
	commonCountDownTime(slot0.time_text, slot1.remain_sec)

	if (slot1.aim_list or nil) and slot2[1] then
		slot4 = nil

		if keyfind("aim_args_key", 35, slot2[1].aim_args) or nil then
			slot0.cur_skin_id = slot3.aim_args_val or 101

			slot0:setAttrData(slot0.cur_skin_id)
		end

		if slot2[1].item_list and next(slot2[1].item_list) ~= nil then
			slot5 = {}

			for slot9, slot10 in ipairs(slot2[1].item_list) do
				uv0(slot5, {
					slot10.bid,
					slot10.num
				})
			end

			slot0.item_list = commonShowSingleRowItemList(slot0.scroll_view, slot0.item_list, slot5, {
				scale = 0.9,
				start_x = 0,
				space_x = 10,
				max_count = 5,
				is_center = true
			})
		end

		if slot1.finish ~= 0 then
			setChildUnEnabled(true, slot0.comfirm_btn)
			slot0.comfirm_btn_label:setString(TI18N("已购买"))
			slot0.comfirm_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
			slot0.comfirm_btn:setTouchEnabled(false)
		else
			slot6 = nil

			if keyfind("aim_args_key", 33, slot2[1].aim_args) or nil then
				slot6 = slot5.aim_args_val or 0
			end

			if slot6 then
				slot0.buy_charge_id = slot6

				if Config.ChargeData.data_charge_data[slot6] then
					slot0.comfirm_btn_label:setString("￥" .. slot7[slot6].val)
				end
			end
		end
	end
end

function ActionSkinDirectPurchasePanel.setAttrData(slot0, slot1)
	if Config.PartnerSkinData.data_skin_info and slot2[slot1] then
		for slot8, slot9 in pairs(slot2[slot1].skin_attr or {}) do
			slot10 = PathTool.getAttrIconByStr(slot9[1])
			slot11 = Config.AttrData.data_key_to_name[slot9[1]] or ""
			slot12, slot13, slot14 = commonGetAttrInfoByKeyValue(slot9[1], slot9[2])
		end

		for slot9 = 1, #{
			[slot8] = string.format("<img src=%s visible=true scale=1 /><div fontColor=#89ff83 outline=2,#000000> %s+%s</div>", slot12, slot13, slot14)
		} do
			slot5 = "" .. slot4[slot9] .. "  "
		end

		slot0.main_container:addChild(createRichLabel(22, cc.c4b(255, 255, 255, 255), cc.p(1, 0.5), cc.p(673, 289), nil, , 600))
	end
end

function ActionSkinDirectPurchasePanel.close_callback(slot0)
	uv0:openActionSkinDirectPurchasePanel(false)

	if slot0.item_list ~= nil then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end
	end

	slot0.item_list = nil
end
