BackpackTips = BackpackTips or BaseClass(BaseView)
slot0 = table.insert

function BackpackTips.__init(slot0)
	slot0.ctrl = BackpackController:getInstance()
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "tips/backpack_tips"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("tips", "tips"),
			type = ResourcesType.plist
		}
	}
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.btn_list = {}
end

function BackpackTips.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.container = slot0.main_panel:getChildByName("container")
	slot0.container_init_size = slot0.container:getContentSize()
	slot0.base_panel = slot0.container:getChildByName("base_panel")
	slot0.goods_item = BackPackItem.new(true, true, nil, 1, false)

	slot0.goods_item:setPosition(cc.p(72, 68))
	slot0.base_panel:addChild(slot0.goods_item)

	slot0.name = slot0.base_panel:getChildByName("name")
	slot0.equip_type = slot0.base_panel:getChildByName("equip_type")
	slot0.extend_desc = createRichLabel(22, cc.c4b(255, 238, 221, 255), cc.p(0, 0), cc.p(146, 10), nil, , 500)

	slot0.base_panel:addChild(slot0.extend_desc)

	slot0.usedesc_panel = slot0.container:getChildByName("usedesc_panel")
	slot0.use_desc = slot0.usedesc_panel:getChildByName("desc")
	slot0.usedesc_panel_height = slot0.usedesc_panel:getContentSize().height
	slot0.desc_panel = slot0.container:getChildByName("desc_panel")
	slot0.desc_panel_size = slot0.desc_panel:getContentSize()
	slot0.scroll_view = slot0.desc_panel:getChildByName("scroll_view")

	slot0.scroll_view:setScrollBarEnabled(false)

	slot0.scroll_size = slot0.scroll_view:getContentSize()
	slot0.desc_label = createRichLabel(22, cc.c4b(161, 151, 139, 255), cc.p(0, 1), cc.p(20, 100), 8, nil, 380)

	slot0.scroll_view:addChild(slot0.desc_label)

	slot4 = "tab_panel"
	slot0.tab_panel = slot0.container:getChildByName(slot4)
	slot0.tab_panel_height = slot0.tab_panel:getContentSize().height

	for slot4 = 1, 3 do
		if slot0.tab_panel:getChildByName("tab_btn_" .. slot4) then
			slot0.btn_list[slot4] = {
				btn = slot5,
				label = slot5:getTitleRenderer()
			}
		end
	end

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
end

function BackpackTips.register_event(slot0)
	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0:close()
			end
		end)
	end

	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0:close()
			end
		end)
	end
end

function BackpackTips.clickBtn(slot0, slot1)
	if not slot0.item_config then
		return
	end

	if slot1 == BackPackConst.tips_btn_type.source then
		if #slot0.item_config.source > 0 then
			slot0.ctrl:openTipsSource(true, slot0.data)
		else
			message(TI18N("暂时没有来源"))
		end
	elseif slot1 == BackPackConst.tips_btn_type.sell then
		if slot0.data.quantity <= 1 then
			MarketController:getInstance():sender23502(slot0.data.id, slot0.data.quantity)
		else
			if not slot0.sell_vo then
				return
			end

			BackpackController:getInstance():openBatchUseItemView(true, slot0.data, ItemConsumeType.sell, {
				type = 1,
				value_list = slot0.sell_vo
			})
		end
	elseif slot1 == BackPackConst.tips_btn_type.goods_use then
		if slot0.data and slot0.data.id and (slot0.item_config.use_type or 1) == BackPackConst.item_use_type.BATCH_USE then
			slot3 = slot0.data.quantity or 0

			if slot0.item_config.type == BackPackConst.item_type.FREE_GIFT then
				slot0.ctrl:openGiftSelectPanel(slot0.data)
			elseif slot3 == 1 then
				slot0.ctrl:sender10515(slot0.data.id or 0, slot3)
			else
				slot0.ctrl:openBatchUseItemView(true, slot0.data)
			end
		end
	elseif slot1 == BackPackConst.tips_btn_type.boss_source then
		-- Nothing
	elseif slot1 == BackPackConst.tips_btn_type.drama_new_source then
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.drama_scene)
	elseif slot1 == BackPackConst.tips_btn_type.drama_source then
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.drama_scene)
	elseif slot1 == BackPackConst.tips_btn_type.hero_source then
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.partner)
	elseif slot1 == BackPackConst.tips_btn_type.skill_source then
		HeroController:getInstance():openHeroBagWindow(true)
	elseif slot1 == BackPackConst.tips_btn_type.form_source then
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.partner)
	elseif slot1 == BackPackConst.tips_btn_type.call_source then
		PartnersummonController:getInstance():openPartnerSummonWindow(true)
	elseif slot1 == BackPackConst.tips_btn_type.artifact_source then
		-- Nothing
	elseif slot1 == BackPackConst.tips_btn_type.seerpalace_summon then
		SeerpalaceController:getInstance():openSeerpalaceMainWindow(true, SeerpalaceConst.Tab_Index.Summon)
	elseif slot1 == BackPackConst.tips_btn_type.seerpalace_change then
		SeerpalaceController:getInstance():openSeerpalaceMainWindow(true, SeerpalaceConst.Tab_Index.Change)
	elseif slot1 == BackPackConst.tips_btn_type.hecheng2 then
		if slot0.data.config and slot2.effect and slot2.effect[1] and slot2.effect[1].effect_type == 24 then
			BackpackController:getInstance():openBackPackComposeWindow(true, {
				bid = slot2.effect[1].val or 0
			})
		end
	elseif slot1 == BackPackConst.tips_btn_type.fenjie then
		uv0({}, {
			id = slot0.data.id,
			bid = slot0.data.base_id,
			num = slot0.data.quantity
		})
		BackpackController:getInstance():openBatchUseItemView(true, slot0.data, ItemConsumeType.resolve)
	elseif slot1 == BackPackConst.tips_btn_type.redbag then
		if RoleController:getInstance():getRoleVo() and slot2.gid ~= 0 and slot2.gsrid ~= "" then
			slot3 = 1

			if slot0.data and slot0.data.config and slot0.data.config.client_effect and next(slot0.data.config.client_effect or {}) ~= nil and slot0.data.config.client_effect[1] then
				slot3 = slot0.data.config.client_effect[1]
			end

			RedbagController:getInstance():openMainView(true, slot3)
		else
			message(TI18N("未加入公会不能发红包哦！"))
		end
	elseif slot1 == BackPackConst.tips_btn_type.head then
		if slot0.data.config then
			RoleController:getInstance():openRoleDecorateView(true, 2, {
				id = slot0.data.config.id
			})
		end
	elseif slot1 == BackPackConst.tips_btn_type.chenghao then
		RoleController:getInstance():openRoleDecorateView(true, 4)
	elseif slot1 == BackPackConst.tips_btn_type.partner_character then
		if slot0.data.config then
			RoleController:getInstance():openRoleDecorateView(true, 3, {
				id = slot0.data.config.id
			})
		end
	elseif slot1 == BackPackConst.tips_btn_type.arena_source then
		ArenaController:getInstance():requestOpenArenaLoopMathWindow(true)
	elseif slot1 == BackPackConst.tips_btn_type.stone_upgrade then
		-- Nothing
	elseif slot1 == BackPackConst.tips_btn_type.upgrade_star then
		-- Nothing
	elseif slot1 == BackPackConst.tips_btn_type.low_treasure then
		ActionController:getInstance():openLuckyTreasureWin(true)
	elseif slot1 == BackPackConst.tips_btn_type.high_treasure then
		ActionController:getInstance():openLuckyTreasureWin(true, 2)
	elseif slot1 == BackPackConst.tips_btn_type.halidom then
		slot3 = RoleController:getInstance():getRoleVo()

		if Config.HalidomData.data_const.halidom_open_lev and slot3 and slot2.val <= slot3.lev then
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.partner, HeroConst.BagTab.eHalidom)
		elseif slot2 then
			message(slot2.desc)
		end
	elseif slot1 == BackPackConst.tips_btn_type.heaven_book then
		HeroController:getInstance():openHeroClothesLustratWindow(true)
	elseif slot1 == BackPackConst.tips_btn_type.heaven_shop then
		SuitShopController:getInstance():openSuitShopMainView(true)
	elseif slot1 == BackPackConst.tips_btn_type.item_sell then
		BackpackController:getInstance():openItemSellPanel(true, slot0.data, BackPackConst.Bag_Code.BACKPACK)
	elseif slot1 == BackPackConst.tips_btn_type.hero_reset then
		if ActionController:getInstance():CheckActionExistByActionBid(93030) then
			ActionController:getInstance():openActionMainPanel(true, nil, slot2)
		else
			message(TI18N("活动未开启"))
		end
	elseif slot1 == BackPackConst.tips_btn_type.heaven_dial_1 then
		JumpController:getInstance():jumpViewByEvtData({
			48,
			1
		})
	elseif slot1 == BackPackConst.tips_btn_type.heaven_dial_2 then
		JumpController:getInstance():jumpViewByEvtData({
			48,
			2
		})
	elseif slot1 == BackPackConst.tips_btn_type.heaven_dial_3 then
		JumpController:getInstance():jumpViewByEvtData({
			48,
			3
		})
	elseif slot1 == BackPackConst.tips_btn_type.heaven_dial_4 then
		JumpController:getInstance():jumpViewByEvtData({
			48,
			4
		})
	elseif slot1 == BackPackConst.tips_btn_type.heaven_dial_5 then
		JumpController:getInstance():jumpViewByEvtData({
			48,
			5
		})
	elseif slot1 == BackPackConst.tips_btn_type.resonate then
		JumpController:getInstance():jumpViewByEvtData({
			55
		})
	elseif slot1 == BackPackConst.tips_btn_type.elfin_hatch then
		JumpController:getInstance():jumpViewByEvtData({
			60,
			ElfinConst.Tab_Index.Hatch
		})
	elseif slot1 == BackPackConst.tips_btn_type.elfin_rouse then
		JumpController:getInstance():jumpViewByEvtData({
			60,
			ElfinConst.Tab_Index.Rouse
		})
	elseif slot1 == BackPackConst.tips_btn_type.elfin_summon then
		JumpController:getInstance():jumpViewByEvtData({
			60,
			ElfinConst.Tab_Index.Summon
		})
	elseif slot1 == BackPackConst.tips_btn_type.petard then
		JumpController:getInstance():jumpViewByEvtData({
			64
		})
	elseif slot1 == BackPackConst.tips_btn_type.emoguoshi_zhaohuan_source then
		JumpController:getInstance():jumpViewByEvtData({
			64
		})
	elseif slot1 == BackPackConst.tips_btn_type.emoguoshi_fenjie then
		if slot0.setting.emoguoshi_fenjie_cb then
			slot0.setting.emoguoshi_fenjie_cb()
		end
	elseif slot1 == BackPackConst.tips_btn_type.return_action then
		if ReturnActionController:getInstance():getModel():isCanGetRedbag() == true then
			function ()
				if uv0.data and uv0.data.id then
					if (uv0.data.quantity or 0) == 1 then
						uv0.ctrl:sender10515(uv0.data.id or 0, slot0)
					else
						uv0.ctrl:openBatchUseItemView(true, uv0.data)
					end
				end
			end()
		else
			if slot0.alert then
				slot0.alert:close()

				slot0.alert = nil
			end

			if not slot0.alert then
				slot0.alert = CommonAlert.show(TI18N("您今天可领取红包次数已达上限 确定继续使用？"), TI18N("确定"), slot2, TI18N("取消"), nil, CommonAlert.type.rich)
			end
		end
	elseif slot1 == BackPackConst.tips_btn_type.herosoul_shop then
		JumpController:getInstance():jumpViewByEvtData({
			71
		})
	elseif slot1 == BackPackConst.tips_btn_type.elfin_egg_synthetic and slot0.item_config and slot0.item_config.id then
		ElfinController:getInstance():openElfinEggSyntheticPanel(true, slot0.item_config.id)
	end

	slot0:close()
end

function BackpackTips.openRootWnd(slot0, slot1, slot2, slot3, slot4)
	if not slot1 then
		return
	end

	slot0.setting = slot4 or {}
	slot0.is_show_btn = slot2 or false
	slot0.is_special_source = slot3

	if type(slot1) == "number" then
		if not Config.ItemData.data_get_data(slot1) then
			return
		end

		slot0.data = slot5
		slot0.item_config = slot5
	else
		slot0.data = slot1

		if slot0.data.config then
			slot0.item_config = slot0.data.config
		else
			slot0.item_config = slot1
		end
	end

	if slot2 == true then
		slot0:updateBtnList()
	end

	slot0:setBaseInfo()
	slot0:initLimitBuyInfo()
end

function BackpackTips.initLimitBuyInfo(slot0)
	if not slot0.data then
		return
	end

	if slot0.data.limit_day then
		if slot0:getLimitBuytLabel() then
			slot2:setString(string.format(TI18N("每日限购<div fontcolor=#68c74b>%s/%s</div>个"), slot0.data.limit_day, slot0.data.limit_total_num or 0))
		end
	end
end

function BackpackTips.getLimitBuytLabel(slot0)
	if slot0.limit_buy_label == nil then
		slot0.limit_buy_label = createRichLabel(22, cc.c4b(255, 238, 221, 255), cc.p(0, 0.5), cc.p(16, slot0.show_limit_y or 0), nil, , 1000)

		slot0.container:addChild(slot0.limit_buy_label)
	end

	return slot0.limit_buy_label
end

function BackpackTips.adjustContentSizeAndPos(slot0)
	if not slot0.is_show_btn then
		slot0.tab_panel:setVisible(false)

		slot1 = slot0.container_init_size.height - slot0.tab_panel_height
	end

	slot2 = false

	if slot0.data and slot0.data.limit_day then
		slot2 = true
		slot1 = slot1 + 30
	end

	slot3 = true

	if slot0.item_config.use_desc == nil or slot0.item_config.use_desc == "" then
		slot3 = false
		slot1 = slot1 - slot0.usedesc_panel_height

		slot0.usedesc_panel:setVisible(false)
	end

	if slot0.desc_label and slot0.scroll_size.height < slot0.desc_label:getContentSize().height then
		slot5 = math.min(slot4.height - slot0.scroll_size.height, 220)
		slot1 = slot1 + slot5

		slot0.desc_panel:setContentSize(cc.size(slot0.desc_panel_size.width, slot0.desc_panel_size.height + slot5))
	end

	if slot0.setting.is_market_place and slot0.market_time_label then
		slot1 = slot1 + slot0.market_time_label:getContentSize().height + 5
	end

	slot0.container:setContentSize(cc.size(slot0.container_init_size.width, slot1))

	slot4 = slot1 - 4

	slot0.base_panel:setPositionY(slot4)

	slot4 = slot4 - slot0.base_panel:getContentSize().height

	if slot2 then
		slot0.show_limit_y = slot4 - 23
		slot4 = slot4 - 30
	end

	if slot3 == true then
		slot0.usedesc_panel:setPositionY(slot4 - 2)
		slot0.desc_panel:setPositionY(slot0.usedesc_panel:getPositionY() - slot0.usedesc_panel:getContentSize().height)
	else
		slot0.desc_panel:setPositionY(slot4 - 2)
	end

	slot0.scroll_view:setPositionY(slot0.desc_panel:getContentSize().height - 16)
	slot0.tab_panel:setPositionY(slot0.desc_panel:getPositionY() - slot0.desc_panel:getContentSize().height)

	if slot0.setting.is_market_place and slot0.market_time_label then
		slot0.market_time_label:setPositionY(slot0.desc_panel:getPositionY() - slot0.desc_panel:getContentSize().height + 15)
	end
end

function BackpackTips.updateBtnList(slot0)
	if not slot0.item_config then
		return
	end

	slot1 = slot0.item_config.type or 0

	for slot5, slot6 in pairs(slot0.btn_list) do
		if slot6.btn then
			slot6.btn:setVisible(false)
		end
	end

	if slot0.is_special_source then
		if slot0.is_special_source == 1 then
			uv0({}, BackPackConst.tips_btn_type.source)
		elseif slot0.is_special_source == 2 then
			uv0(slot2, BackPackConst.tips_btn_type.heaven_book)
		end
	else
		slot2 = slot0.item_config.tips_btn or {}
	end

	if tableLen(slot2) == 1 then
		slot5 = slot0.btn_list[3]

		if slot0.btn_list[1].btn and slot5.btn then
			slot4.btn:setPositionX(slot5.btn:getPositionX())
		end
	end

	slot4 = 1

	for slot8, slot9 in ipairs(slot2) do
		if slot4 > 3 then
			break
		end

		if slot0.btn_list[slot8] and slot10.btn then
			slot10.label:setString(BackPackConst.tips_btn_title[slot9] or "")
			slot10.btn:setVisible(true)
			slot10.btn:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					uv0:clickBtn(uv1)
				end
			end)
		end

		slot4 = slot4 + 1
	end

	slot0:checkRedPoint()
end

function BackpackTips.checkRedPoint(slot0)
end

function BackpackTips.setBaseInfo(slot0)
	if slot0.data == nil or slot0.item_config == nil then
		return
	end

	slot1 = slot0.data

	slot0.extend_desc:setString("")
	slot0.goods_item:setBaseData(slot0.item_config.id)

	if slot0.item_config.type == BackPackConst.item_type.HERO_HUN then
		slot0.goods_item:createStar(slot0.item_config.eqm_jie)

		if slot0.item_config.camp_type ~= 0 then
			slot0.goods_item:initCamp(slot0.item_config.camp_type)
		end
	end

	slot2 = 0

	if slot0.item_config.quality >= 0 and slot0.item_config.quality <= 5 then
		slot2 = slot0.item_config.quality
	end

	slot0.name:setTextColor(BackPackConst.quality_color[slot2])
	slot0.name:setString(slot0.item_config.name)
	slot0.equip_type:setString(TI18N("类型：") .. slot0.item_config.type_desc)

	if slot0.item_config.type == 100 then
		slot0.goods_item:createStar(slot0.item_config.eqm_jie)
	end

	if slot0.item_config.open_type then
		slot0.goods_item:setItemIcon(PathTool.getItemRes(slot0.item_config.icon))
		slot0.goods_item:setSelfBackground(slot0.item_config.quality)
	end

	slot0.use_desc:setString(slot0.item_config.use_desc or "")
	slot0.desc_label:setString(slot0.item_config.desc)

	slot5 = math.max(slot0.desc_label:getContentSize().height, slot0.scroll_size.height)

	slot0.scroll_view:setContentSize(cc.size(slot0.scroll_size.width, math.min(slot5, 320)))
	slot0.scroll_view:setInnerContainerSize(cc.size(slot0.scroll_size.width, slot5))
	slot0.desc_label:setPositionY(slot5)

	if slot0.setting.is_market_place and slot0.data.end_time and next(slot0.data.end_time) ~= nil then
		slot0.market_time_label = createRichLabel(24, cc.c4b(255, 155, 30, 255), cc.p(0, 1), cc.p(17, -10000), 8, nil, 1000)

		slot0.container:addChild(slot0.market_time_label)

		slot7 = slot0.data.end_time[1].end_num or 1
		slot8 = nil

		if (slot0.data.end_time[1].end_unixtime or 0) - GameNet:getInstance():getTime() < 0 then
			slot9 = 0
		end

		slot0.market_time_label:setString((slot9 > 0 or string.format(TI18N("%s个物品已过期"), slot7)) and string.format(TI18N("%s个物品于<div fontcolor=#249003>%s</div>后过期"), slot7, TimeTool.GetTimeFormatDayIIIIII(slot9)))
	end

	slot0:adjustContentSizeAndPos()

	if slot0.data and slot0.data.expire_time and slot0.data.expire_time ~= 0 then
		if slot0.less_timer then
			GlobalTimeTicket:getInstance():remove(slot0.less_timer)

			slot0.less_timer = nil
		end

		slot6 = (slot0.data.expire_time or 0) - GameNet:getInstance():getTime()
		slot7 = ""

		if slot0.data and slot0.data.expire_type == 1 or slot0.data.expire_type == 2 then
			slot7 = TI18N("后过期")
		elseif slot0.data and slot0.data.expire_type == 4 or slot0.data.expire_type == 3 then
			slot7 = TI18N("后可用")
		end

		slot0.extend_desc:setString(TimeTool.GetTimeFormatDayII(slot6) .. slot7)

		if slot6 <= 0 then
			slot0.extend_desc:setString("")

			return
		end

		if not slot0.less_timer then
			slot0.less_timer = GlobalTimeTicket:getInstance():add(function ()
				if uv0 >= 0 then
					uv1.extend_desc:setString(TimeTool.GetTimeFormatDayII(uv0) .. uv2)
				else
					uv1.extend_desc:setString("")
				end

				uv0 = uv0 - 1
			end, 1)
		end
	end
end

function BackpackTips.setPanelData(slot0)
end

function BackpackTips.close_callback(slot0)
	if slot0.goods_item then
		slot0.goods_item:DeleteMe()
	end

	slot0.goods_item = nil

	if slot0.less_timer then
		GlobalTimeTicket:getInstance():remove(slot0.less_timer)

		slot0.less_timer = nil
	end
end
