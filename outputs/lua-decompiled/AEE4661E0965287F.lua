BackpackCompTips = BackpackCompTips or BaseClass(BaseView)
slot0 = Config.PartnerData.data_get_compound_info

function BackpackCompTips.__init(slot0)
	slot0.ctrl = BackpackController:getInstance()
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "tips/backpack_comp_tips"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("tips", "tips"),
			type = ResourcesType.plist
		}
	}
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
end

function BackpackCompTips.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.text_name = slot0.main_panel:getChildByName("text_name")
	slot0.get_path = slot0.main_panel:getChildByName("get_path")

	slot0.get_path:setVisible(false)
	slot0.get_path:getChildByName("Text_2"):setString(TI18N("获取途径"))

	slot0.goto_btn = slot0.get_path:getChildByName("goto")
	slot0.text_desc = slot0.main_panel:getChildByName("text_desc")
	slot0.goods_item = BackPackItem.new(true, true, nil, 1, false)

	slot0.goods_item:setPosition(cc.p(113, 258))
	slot0.main_panel:addChild(slot0.goods_item)
end

function BackpackCompTips.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:close()
		TipsManager:getInstance():showBackPackCompTips(false)
	end, false, 2)
	registerButtonEventListener(slot0.goto_btn, function ()
		if uv0.item_config then
			BackpackController:getInstance():openTipsSource(true, uv0.item_config.id)
			TipsManager:getInstance():showBackPackCompTips(false)
		end
	end, true, 1)
end

function BackpackCompTips.openRootWnd(slot0, slot1)
	if not slot1 then
		return
	end

	slot3 = 1

	if uv0[Config.ItemData.data_get_data(slot1).id] then
		if uv0[slot2.id].is_random == 1 then
			slot3 = 2

			slot0.get_path:setVisible(false)
		else
			slot0.get_path:setVisible(true)
		end
	elseif BackpackController:getModel():getHallowsCompData(slot2.id) then
		slot0.get_path:setVisible(true)
	end

	slot0.item_config = slot2

	slot0:showBtn(slot3)
	slot0:setBaseInfo()
end

function BackpackCompTips.showBtn(slot0, slot1)
	slot3 = createButton(slot0.main_panel, TI18N("合成"), slot1 == 1 and slot0.main_panel:getContentSize().width / 2 or slot0.main_panel:getContentSize().width / 2 + 120, 60, cc.size(129, 64), PathTool.getResFrame("common", "common_1017"), 24, Config.ColorData.data_color4[1])

	slot3:setName("com_btn")
	slot3:setRichText(TI18N("<div fontColor=#ffffff fontsize=24 outline=2,#020019>合成</div>"))
	slot3:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			slot3 = 1
			slot4 = false
			slot5 = nil

			if uv1[uv0.item_config.id] then
				slot5 = uv0.item_config.id
				slot3 = math.floor(BackpackController:getModel():getBackPackItemNumByBid(uv0.item_config.id) / uv1[uv0.item_config.id].num)
				slot4 = true
			else
				slot6 = BackpackController:getModel():getHallowsCompData(uv0.item_config.id)

				print("hallows_data=====================", slot6)
				printLuaTable(slot6)

				slot5 = slot6.bid
				slot3 = math.floor(slot2 / slot6.num)
			end

			if slot3 >= 2 then
				if slot4 == true then
					TipsManager:getInstance():showCompChooseTips(true, uv0.item_config.id)
				else
					BackpackController:getInstance():sender10523(slot5, 1)
				end
			elseif slot3 ~= 0 then
				if slot4 == true then
					BackpackController:getInstance():sender11008(uv0.item_config.id, 1)
				else
					BackpackController:getInstance():sender10523(slot5, 1)
				end
			else
				message(TI18N("数量不足"))
			end
		end
	end)

	if slot1 == 2 then
		slot4 = createButton(slot0.main_panel, TI18N("详情"), slot0.main_panel:getContentSize().width / 2 - 120, 60, cc.size(129, 64), PathTool.getResFrame("common", "common_1017"), 24, Config.ColorData.data_color4[1])

		slot4:setRichText(TI18N("<div fontColor=#ffffff fontsize=24 outline=2,#020019>详情</div>"))
		slot4:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended and uv0.item_config.effect and uv0.item_config.effect[1].val and uv0.item_config.eqm_jie then
				TipsManager:getInstance():showBackPackCompTips(false)
				HeroController:getInstance():openHeroInfoWindowByBidStar(uv0.item_config.effect[1].val, uv0.item_config.eqm_jie)
			end
		end)
	end
end

function BackpackCompTips.setBaseInfo(slot0)
	if slot0.item_config == nil then
		return
	end

	slot0.goods_item:setBaseData(slot0.item_config.id)
	slot0.text_name:setString(slot0.item_config.name)
	slot0.text_desc:setString(slot0.item_config.use_desc)
end

function BackpackCompTips.close_callback(slot0)
	if slot0.goods_item then
		slot0.goods_item:DeleteMe()
	end

	slot0.goods_item = nil

	TipsManager:getInstance():showBackPackCompTips(false)
end
