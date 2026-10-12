MallSonPanel = class("MallSonPanel", function ()
	return ccui.Widget:create()
end)
slot0 = 16

function MallSonPanel.ctor(slot0)
	slot0.ctrl = MallController:getInstance()
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.tab_list = {}
	slot0.cur_index = nil
	slot0.cur_tab = nil
	slot0.data_list = {}

	slot0:createRootWnd()
	slot0:configUI()
	slot0:register_event()
end

function MallSonPanel.createRootWnd(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("mall/mall_son_panel"))

	slot0.root_wnd:setPosition(40, 103)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)
end

function MallSonPanel.configUI(slot0)
	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot4 = "tab_container"
	slot0.tab_container = slot0.main_container:getChildByName(slot4)

	for slot4 = 1, 5 do
		slot5 = slot0.tab_container:getChildByName(string.format("tab_btn_%s", slot4))
		slot5.label = slot0.tab_container:getChildByName("title_" .. slot4)

		slot5.label:setColor(cc.c3b(248, 194, 60))
		slot5:setBright(false)

		slot5.index = slot4
		slot5.is_first = true
		slot0.tab_list[slot4] = slot5
	end

	slot0.refresh_panel = slot0.main_container:getChildByName("refresh_panel")

	slot0.refresh_panel:setVisible(false)

	slot0.btn_refresh = slot0.refresh_panel:getChildByName("btn_refresh")

	slot0.btn_refresh:setPositionY(slot0.btn_refresh:getPositionY() + 6)

	slot0.refresh_time = slot0.refresh_panel:getChildByName("refresh_time")

	slot0.refresh_time:setString("")

	slot1 = Config.ExchangeData.data_shop_list[uv0]
	slot2 = slot0.btn_refresh:getChildByName("Sprite_1")

	slot2:setScale(0.5)
	loadSpriteTexture(slot2, PathTool.getItemRes(Config.ItemData.data_get_data(slot1.item_bid).icon), LOADTEXT_TYPE)
	slot0.btn_refresh:getChildByName("Text_1"):setString(slot1.cost_list[1][2] .. TI18N(" 刷新"))

	slot0.scrollCon = slot0.main_container:getChildByName("scrollCon")
	slot0.coin = slot0.main_container:getChildByName("coin")

	slot0.coin:setPositionY(slot0.coin:getPositionY() + 4)

	slot0.count = slot0.main_container:getChildByName("count")

	slot0.count:setPositionY(slot0.count:getPositionY() + 4)

	slot0.add_btn = slot0.main_container:getChildByName("add_btn")

	slot0.add_btn:setVisible(false)

	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.scrollCon, cc.p(0, 8), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(622, 648), {
		start_y = 0,
		item_width = 306,
		start_x = 4.5,
		space_x = 2,
		row = 0,
		item_height = 143,
		space_y = 2,
		col = 2,
		item_class = MallItem
	})
end

function MallSonPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function MallSonPanel.setList(slot0, slot1)
	for slot6, slot7 in pairs(slot0.tab_list) do
		if slot1[slot6] then
			slot7:setVisible(true)
			slot7.label:setString(Config.ExchangeData.data_shop_list[slot1[slot6]].name)

			slot7.type = slot1[slot6]
			slot7.notice = ({
				[5] = Config.ExchangeData.data_shop_exchage_cost.open_guild_lev.desc,
				[16] = Config.ExchangeData.data_shop_exchage_cost.open_arena_cent_lev.desc,
				[6] = Config.ExchangeData.data_shop_exchage_cost.open_arena_cent_lev.desc
			})[slot7.type]

			slot0:setTabBtnTouchStatus(slot0:checkBtnIsOpen(slot7.type), slot6)
		else
			slot7:setVisible(false)
		end
	end

	slot3 = 1

	for slot7 = 1, #slot1 do
		if slot0:checkBtnIsOpen(slot0.tab_list[slot7].type) then
			slot3 = slot7

			break
		end
	end
end

function MallSonPanel.register_event(slot0)
	for slot4, slot5 in pairs(slot0.tab_list) do
		registerButtonEventListener(slot5, function ()
			if uv0.type ~= nil then
				if uv0.can_touch == false then
					message(TI18N(uv0.notice))
				else
					uv1:changeTabView(uv0.index)
				end
			end
		end, false, 1)
	end

	registerButtonEventListener(slot0.add_btn, function ()
		BackpackController:getInstance():openTipsSource(true, Config.ItemData.data_get_data(Config.ExchangeData.data_shop_list[uv0.cur_tab.type].item_bid))
	end, true, 1)

	if not slot0.update_have_count then
		slot0.update_have_count = GlobalEvent:getInstance():Bind(MallEvent.Open_View_Event, function (slot0)
			if not slot0 then
				return
			end

			if uv0.cur_index ~= 4 then
				if uv0.cur_tab.type == slot0.type then
					uv0.data_list[uv0.cur_index] = uv0:getConfig(uv0.cur_tab.type, slot0)

					uv0.item_scrollview:setData(uv0.data_list[uv0.cur_index], function (slot0)
						uv0.ctrl:openMallBuyWindow(true, slot0:getData())
					end)
				else
					for slot4, slot5 in pairs(uv0.tab_list) do
						if slot5.type == slot0.type then
							uv0.data_list[slot4] = uv0:getConfig(uv0.cur_tab.type, slot0)
						end
					end
				end
			end
		end)
	end

	if slot0.role_vo and slot0.role_update_lev_event == nil then
		slot0.role_update_lev_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "lev" then
				for slot5, slot6 in pairs(uv0.tab_list) do
					uv0:setTabBtnTouchStatus(uv0:checkBtnIsOpen(slot6.type), slot5)
				end
			elseif slot0 == "gsrv_id" or slot0 == "gid" then
				uv0:setTabBtnTouchStatus(uv0:checkBtnIsOpen(5), 1)
			elseif (slot0 == "gold" or slot0 == "arena_cent" or slot0 == "guild" or slot0 == "hero_soul" or slot0 == "friend_point" or slot0 == "arena_guesscent" or slot0 == "star_point" or slot0 == "expedition_medal" or slot0 == "elite_coin") and Config.ItemData.data_assets_id2label[Config.ExchangeData.data_shop_list[uv0.cur_tab.type].item_bid] == slot0 then
				loadSpriteTexture(uv0.coin, PathTool.getItemRes(Config.ItemData.data_get_data(slot2).icon), LOADTEXT_TYPE)

				if uv0.cur_index == 4 then
					uv0.count:setString(MoneyTool.GetMoneyString(uv0.role_vo.star_point))
				elseif uv0.cur_index == 1 then
					uv0.count:setString(MoneyTool.GetMoneyString(uv0.role_vo.expedition_medal))
				elseif uv0.cur_index == 5 then
					uv0.count:setString(MoneyTool.GetMoneyString(uv0.role_vo.elite_coin))
				else
					uv0.count:setString(MoneyTool.GetMoneyString(uv0.role_vo[Config.ItemData.data_assets_id2label[slot2]]))
				end
			end
		end)
	end

	if not slot0.buy_success_event then
		slot0.buy_success_event = GlobalEvent:getInstance():Bind(MallEvent.Buy_Success_Event, function (slot0)
			if uv0.cur_index and uv0.data_list and uv0.data_list[uv0.cur_index] then
				slot4 = uv0.cur_index

				for slot4, slot5 in pairs(uv0.data_list[slot4]) do
					if type(slot5) ~= "number" and slot5 and slot5.id and slot5.has_buy and slot5.id == slot0.eid and next(slot0.ext or {}) ~= nil then
						slot5.has_buy = slot0.ext[1].val
					end
				end
			end
		end)
	end

	registerButtonEventListener(slot0.btn_refresh, function ()
		if Config.ExchangeData.data_shop_list[uv0].cost_list[1][2] <= uv1.role_vo.star_point then
			uv1.ctrl:sender13405(uv0)
		else
			message(TI18N("探宝积分不足"))
			BackpackController:getInstance():openTipsSource(true, 18)
		end
	end, true, 1)

	if not slot0.update_son_list then
		slot0.update_son_list = GlobalEvent:getInstance():Bind(MallEvent.Get_Buy_list, function (slot0)
			if slot0.type == uv0 then
				slot5 = GameNet:getInstance():getTime()
				slot4 = slot0.refresh_time - slot5

				uv1:setLessTime(slot4)

				for slot4, slot5 in pairs(slot0.item_list) do
					slot5.shop_type = uv0
				end

				uv1.data_list[uv1.cur_index] = slot0

				uv1.item_scrollview:setData(uv1.data_list[uv1.cur_index].item_list, function (slot0)
					uv0.ctrl:openMallBuyWindow(true, slot0:getData())
				end)
			end
		end)
	end
end

function MallSonPanel.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.refresh_time) then
		return
	end

	doStopAllActions(slot0.refresh_time)

	if slot1 > 0 then
		slot0:setTimeFormatString(slot1)
		slot0.refresh_time:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				doStopAllActions(uv1.refresh_time)
			else
				uv1:setTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(slot1)
	end
end

function MallSonPanel.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.refresh_time:setString(TimeTool.GetTimeFormat(slot1))
	else
		slot0.refresh_time:setString("00:00:00")
	end
end

function MallSonPanel.changeTabView(slot0, slot1)
	if slot0.cur_index == slot1 then
		return
	end

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.label:setColor(cc.c3b(248, 194, 60))
		slot0.cur_tab:setBright(false)
	end

	slot0.cur_index = slot1
	slot0.cur_tab = slot0.tab_list[slot0.cur_index]

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.label:setColor(cc.c3b(255, 255, 255))
		slot0.cur_tab:setBright(true)
	end

	if slot0.cur_index == 4 then
		slot0.refresh_panel:setVisible(true)
	else
		slot0.refresh_panel:setVisible(false)
	end

	if slot0.cur_tab.is_first then
		slot0.ctrl:sender13401(slot0.cur_tab.type)

		slot0.cur_tab.is_first = false
	elseif slot0.cur_index ~= 4 then
		slot0.item_scrollview:setData(slot0.data_list[slot0.cur_index], function (slot0)
			uv0.ctrl:openMallBuyWindow(true, slot0:getData())
		end)
	end

	if slot0.cur_index == 4 then
		slot0.item_scrollview:setData({})
		slot0.ctrl:sender13403(uv0)
	end

	if Config.ExchangeData.data_shop_list[slot0.cur_tab.type].item_bid then
		if slot0.cur_index == 4 then
			loadSpriteTexture(slot0.coin, PathTool.getItemRes(Config.ItemData.data_get_data(Config.ExchangeData.data_shop_list[uv0].item_bid).icon), LOADTEXT_TYPE)
			slot0.count:setString(slot0.role_vo.star_point)
		else
			loadSpriteTexture(slot0.coin, PathTool.getItemRes(Config.ItemData.data_get_data(slot2).icon), LOADTEXT_TYPE)

			if slot0.cur_index == 1 then
				slot0.count:setString(MoneyTool.GetMoneyString(slot0.role_vo.expedition_medal))
			elseif slot0.cur_index == 5 then
				slot0.count:setString(MoneyTool.GetMoneyString(slot0.role_vo.elite_coin))
			else
				slot0.count:setString(MoneyTool.GetMoneyString(slot0.role_vo[Config.ItemData.data_assets_id2label[slot2]]))
			end
		end
	end
end

function MallSonPanel.openById(slot0, slot1)
	for slot5, slot6 in pairs(slot0.tab_list) do
		if slot6.type == slot1 then
			slot0.cur_index = nil

			slot0:changeTabView(slot6.index)

			return
		end
	end
end

function MallSonPanel.getConfig(slot0, slot1, slot2)
	slot3 = {}
	slot4 = {}

	if slot1 == 5 then
		slot3 = deepCopy(Config.ExchangeData.data_shop_exchage_guild)
	elseif slot1 == 6 then
		slot3 = deepCopy(Config.ExchangeData.data_shop_exchage_arena)
	elseif slot1 == 7 then
		slot3 = deepCopy(Config.ExchangeData.data_shop_exchage_boss)
	elseif slot1 == 8 then
		slot3 = deepCopy(Config.ExchangeData.data_shop_exchage_expediton)
	elseif slot1 == 16 then
		slot3 = deepCopy(Config.ExchangeData.data_shop_exchage_guess)
	elseif slot1 == 17 then
		slot3 = deepCopy(Config.ExchangeData.data_shop_exchage_elite)
	end

	slot5 = deepCopy(slot2.item_list)
	slot6 = {}

	for slot10, slot11 in pairs(slot3) do
		if slot11.type == slot0.cur_tab.type then
			if slot5 and next(slot5) then
				for slot15, slot16 in pairs(slot5) do
					if slot11.id == slot16.item_id then
						if slot16.ext[1].val then
							slot11.has_buy = slot16.ext[1].val

							table.remove(slot5, slot15)
						end

						break
					else
						slot11.has_buy = 0
					end
				end
			else
				slot11.has_buy = 0
			end

			if slot11.open_srv_timestamp and slot11.open_srv_timestamp ~= 0 and InviteCodeController:getInstance():getModel():getOpenServerTime() <= slot11.open_srv_timestamp and slot11.limit_week and slot11.limit_week ~= 0 then
				slot11.limit_week = 0
			end

			slot12 = true

			if slot0.role_vo then
				slot12 = slot0:checkShowLev(slot11.role_lev)
			end

			if slot12 then
				table.insert(slot6, slot11)
			end
		end
	end

	return slot6
end

function MallSonPanel.checkShowLev(slot0, slot1)
	if slot1 ~= nil and next(slot1) ~= nil then
		for slot5, slot6 in ipairs(slot1) do
			if slot6[1] == "lv" and slot0.role_vo.lev and slot0.role_vo.lev < slot6[2] then
				return false
			end
		end
	end

	return true
end

function MallSonPanel.checkBtnIsOpen(slot0, slot1)
	if slot1 == 5 then
		if Config.ExchangeData.data_shop_exchage_cost.open_guild_lev.val <= slot0.role_vo.lev and slot0.role_vo:isHasGuild() then
			return true
		else
			return false
		end
	elseif slot1 == 6 or slot1 == 16 then
		if MainSceneController:getInstance():getBuildVo(CenterSceneBuild.arena) and slot2.is_lock then
			return false
		else
			return true
		end
	elseif slot1 == 7 then
		if Config.ExchangeData.data_shop_exchage_cost.open_god_point_lev.val <= slot0.role_vo.lev then
			return true
		else
			return false
		end
	end

	return true
end

function MallSonPanel.setTabBtnTouchStatus(slot0, slot1, slot2)
	if slot0.tab_list[slot2] then
		if slot1 == true then
			setChildUnEnabled(false, slot3)
			slot3.label:setColor(cc.c3b(248, 194, 60))
			slot3.label:enableOutline(cc.c4b(2, 17, 25, 255), 2)
		else
			setChildUnEnabled(true, slot3)
			slot3.label:setColor(cc.c3b(216, 215, 215))
			slot3.label:enableOutline(cc.c4b(2, 0, 25, 255), 2)
		end

		slot3.can_touch = slot1
	end
end

function MallSonPanel.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.update_have_count then
		GlobalEvent:getInstance():UnBind(slot0.update_have_count)

		slot0.update_have_count = nil
	end

	if slot0.update_son_list then
		GlobalEvent:getInstance():UnBind(slot0.update_son_list)

		slot0.update_son_list = nil
	end

	if slot0.buy_success_event then
		GlobalEvent:getInstance():UnBind(slot0.buy_success_event)

		slot0.buy_success_event = nil
	end

	if slot0.role_vo then
		if slot0.role_update_lev_event then
			slot0.role_vo:UnBind(slot0.role_update_lev_event)

			slot0.role_update_lev_event = nil
		end

		slot0.role_vo = nil
	end

	doStopAllActions(slot0.refresh_time)
end
