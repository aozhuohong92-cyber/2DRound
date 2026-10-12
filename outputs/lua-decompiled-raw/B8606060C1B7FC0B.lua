BattlDramaQuickBattleWindow = BattlDramaQuickBattleWindow or BaseClass(BaseView)
slot0 = BattleDramaController:getInstance()
slot1 = BattleDramaController:getInstance():getModel()
slot2 = table.insert

function BattlDramaQuickBattleWindow.__init(slot0)
	slot0.layout_name = "battledrama/battle_drama_quick_battle_windows"
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.quick_battle_status = 0
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_50"),
			type = ResourcesType.single
		}
	}
end

function BattlDramaQuickBattleWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("root")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.holid_up = slot0.main_container:getChildByName("holid_up")

	slot0.holid_up:getChildByName("Text_1"):setString(TI18N("活动UP!"))
	slot0.holid_up:setVisible(false)

	slot0.quick_num_label = createRichLabel(24, 175, cc.p(0.5, 0.5), cc.p(566, 426), nil, , 1000)

	slot0.main_container:addChild(slot0.quick_num_label)

	slot0.quick_btn = createButton(slot0.main_container, TI18N("快速作战"), slot0.main_container:getContentSize().width / 2, 426, cc.size(220, 64), PathTool.getResFrame("common", "common_1017"), 26, Config.ColorData.data_color4[1])

	slot0.quick_btn:enableOutline(cc.c4b(118, 69, 25, 255), 2)

	slot0.source_btn = slot0.main_container:getChildByName("source_btn")

	slot0.source_btn:setVisible(false)
	slot0.main_container:getChildByName("use_title"):setString(TI18N("本关怪物掉落："))

	slot0.explain_btn = slot0.main_container:getChildByName("explain_btn")
	slot0.desc = slot0.main_container:getChildByName("desc")

	slot0.desc:setVisible(false)

	slot0.quick_desc = createRichLabel(24, 175, cc.p(0, 1), cc.p(236, 870), 5, nil, 410)

	slot0.main_container:addChild(slot0.quick_desc)

	slot0.btn_buy_quick = slot0.main_container:getChildByName("btn_buy_quick")

	slot0.btn_buy_quick:getChildByName("Text_2"):setString(TI18N("前往激活"))
	slot0.btn_buy_quick:setVisible(false)

	slot0.list_view = slot0.main_container:getChildByName("list_view")

	if slot0.item_scrollview == nil then
		slot0.item_scrollview = CommonScrollViewLayout.new(slot0.list_view, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.list_view:getContentSize(), {
			start_y = 10,
			item_width = 119,
			start_x = 22,
			space_x = 30,
			row = 1,
			item_height = 119,
			space_y = 10,
			col = 4,
			item_class = BatttleQuickItem
		})
	end

	slot0.quick_btn:getButton():setName("guidesign_quick_btn")
end

function BattlDramaQuickBattleWindow.updateData(slot0)
	slot1 = uv0:getDramaData()

	if uv0:getQuickData() or {} then
		slot4 = RoleController:getInstance():getModel():checkPrivilegeStatus(1)
		slot5 = string.format(TI18N("快速作战可获得<div fontcolor=#249003>%s</div>分钟挂机收益。"), uv0.hook_max_time or 120)

		if IS_APPLE_RMUI then
			slot0.btn_buy_quick:setVisible(false)
		elseif slot4 then
			slot5 = slot5 .. "\n" .. string.format(TI18N("激活快速作战特权:每天免费<div fontcolor=#249003>3</div>次，额外购买<div fontcolor=#249003>11</div>次")) .. string.format(TI18N("<div fontcolor=#249003>(特权已激活)</div>"))

			slot0.btn_buy_quick:setVisible(false)
		else
			slot5 = slot5 .. string.format(TI18N("<div fontcolor=#c92606>(特权未激活)</div>"))

			slot0.btn_buy_quick:setVisible(true)
		end

		slot0.quick_desc:setString(slot5)
	end

	if slot1 and slot1.max_dun_id and Config.DungeonData.data_drama_dungeon_info(slot1.max_dun_id) and slot4.quick_show_items then
		slot5 = {}
		slot6 = 0

		for slot10, slot11 in ipairs(slot4.quick_show_items) do
			slot6 = slot11[2]

			if slot2 and slot2.fast_combat_add_time and slot2.fast_combat_add_time > 0 then
				slot6 = slot6 + math.floor(slot6 * slot2.fast_combat_add_time / slot3)
			end

			uv1(slot5, {
				bid = slot11[1],
				num = slot6
			})
		end

		slot0.item_scrollview:setData(slot5)
	end

	slot0.quick_data = BattleDramaController:getInstance():getModel():getQuickData()

	slot0:checkQuickBattle()
end

function BattlDramaQuickBattleWindow.register_event(slot0)
	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0:openDramBattleQuickView(false)
			end
		end)
	end

	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0:openDramBattleQuickView(false)
			end
		end)
	end

	registerButtonEventListener(slot0.btn_buy_quick, function ()
		VipController:getInstance():openVipMainWindow(true, VIPTABCONST.PRIVILEGE)
	end, false, 1)
	registerButtonEventListener(slot0.explain_btn, function (slot0, slot1, slot2)
		TipsManager:getInstance():showCommonTips(Config.DungeonData.data_drama_const.game_rule.desc, slot1:getTouchBeganPosition(), nil, , 500)
	end, false, 1)

	if slot0.quick_btn then
		slot0.quick_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				if uv0.quick_battle_status == 0 or uv0.quick_battle_status == 1 then
					uv0:send13004()
				elseif uv0.quick_battle_status == 3 then
					if not uv0.privilege_status then
						VipController:getInstance():openVipMainWindow(true, VIPTABCONST.PRIVILEGE)
						uv1:openDramBattleQuickView(false)
					else
						uv0:send13004()
					end
				else
					uv0.cost = uv0.cost or 0

					CommonAlert.show(TI18N("本次快速作战花费") .. string.format("<img src=%s visible=true scale=0.3 /><div>x%s</div>", PathTool.getItemRes(Config.ItemData.data_assets_label2id.gold), uv0.cost), TI18N("确认"), function ()
						uv0:send13004()
					end, TI18N("取消"), nil, CommonAlert.type.rich, nil, , , true)
				end
			end
		end)
	end

	if not slot0.update_dram_quick_battle_event then
		slot0.update_dram_quick_battle_event = GlobalEvent:getInstance():Bind(Battle_dramaEvent.BattleDrama_Quick_Battle_Data, function (slot0)
			if slot0 then
				uv0.quick_data = slot0

				uv0:updateData()
			end
		end)
	end
end

function BattlDramaQuickBattleWindow.send13004(slot0)
	if not RoleController:getInstance():getRoleVo() then
		return
	end

	slot2 = slot1.energy
	slot3 = slot1.energy_max
	slot4 = 0
	slot5 = 0
	slot6 = uv0.hook_max_time or 120

	if Config.DungeonData.data_drama_dungeon_info((BattleDramaController:getInstance():getModel():getDramaData() or {}).dun_id) and slot8.per_hook_items then
		for slot12, slot13 in ipairs(slot8.per_hook_items) do
			if slot13[1] == Config.ItemData.data_assets_label2id.energy then
				slot4 = slot13[2] * slot6 * (1 + slot5)
			end
		end
	end

	if slot3 < slot2 + slot4 then
		CommonAlert.show(string.format("注意:当前拥有<div fontcolor=#249003>%s/%s</div>远航情报,快速作战后,远航情报溢出部分将会损失,是否继续？", slot2, slot3), TI18N("确定"), function ()
			BattleDramaController:getInstance():send13004()
		end, TI18N("取消"), nil, CommonAlert.type.rich, nil, {
			off_y = 0,
			timer = 3,
			timer_for = true,
			title = TI18N("提示")
		}, 24)
	else
		BattleDramaController:getInstance():send13004()
	end
end

function BattlDramaQuickBattleWindow.checkQuickBattle(slot0)
	if slot0.quick_data then
		slot0.privilege_status = RoleController:getInstance():getModel():checkPrivilegeStatus(1)

		if slot0.quick_data.is_holiday == 1 then
			slot0.holid_up:setVisible(true)
		else
			slot0.holid_up:setVisible(false)
		end

		slot3 = string.format("%s<div fontColor=#249003>%s</div>%s", TI18N("今日剩余:"), slot0.quick_data.fast_combat_max - slot0.quick_data.fast_combat_num, TI18N("次"))

		if slot0.privilege_status then
			slot3 = string.format("%s<div fontColor=#249003>%s+%s</div>%s", TI18N("今日剩余:"), slot1, Config.PrivilegeData.data_fast_combat_cost_length - slot0.quick_data.fast_combat_p_num, TI18N("次"))
		end

		if slot0.quick_data.is_holiday == 1 or slot0.privilege_status == true then
			slot3 = (slot0.quick_data.is_holiday ~= 1 or slot0.privilege_status ~= true or string.format("%s<div fontColor=#249003>%s+%s</div>%s", TI18N("今日剩余:"), slot1, Config.DungeonData.data_drama_const.hd_fast_combat_buy_time.val - slot0.quick_data.fast_combat_w_num + slot2, TI18N("次"))) and (slot0.privilege_status ~= true or string.format("%s<div fontColor=#249003>%s+%s</div>%s", TI18N("今日剩余:"), slot1, slot2, TI18N("次"))) and string.format("%s<div fontColor=#249003>%s+%s</div>%s", TI18N("今日剩余:"), slot1, Config.DungeonData.data_drama_const.hd_fast_combat_buy_time.val - slot0.quick_data.fast_combat_w_num, TI18N("次"))
		end

		slot0.cost = 0
		slot4 = ""

		if slot0.quick_data.fast_combat_free_num > 0 then
			slot4 = TI18N("<div fontcolor=#ffffff outline=2,#020019>快速战斗</div>")
			slot0.quick_battle_status = 0
			slot3 = TI18N("本次免费")
		elseif slot0.privilege_status then
			slot0.quick_num_label:setVisible(true)

			slot6 = Config.PrivilegeData.data_fast_combat_cost[slot0.quick_data.fast_combat_p_num + 1]

			if Config.DungeonData.data_drama_quick_cost[slot0.quick_data.fast_combat_num + 1] then
				slot0.quick_battle_status = 2
				slot0.cost = Config.DungeonData.data_drama_quick_cost[slot5].cost
				slot4 = string.format(TI18N("<img src=%s visible=true scale=0.25 /><div fontcolor=#ffffff outline=2,#020019>%s 快速战斗</div>"), PathTool.getItemRes(Config.ItemData.data_assets_label2id.gold), slot0.cost)
			elseif slot6 then
				slot0.quick_battle_status = 2
				slot0.cost = slot6.cost
				slot4 = string.format(TI18N("<img src=%s visible=true scale=0.25 /><div fontcolor=#ffffff outline=2,#020019>%s 快速战斗</div>"), PathTool.getItemRes(Config.ItemData.data_assets_label2id.gold), slot0.cost)
			else
				slot0.quick_battle_status = 3
				slot4 = TI18N("<div fontcolor=#ffffff outline=2,#020019>快速战斗</div>")
			end
		elseif Config.DungeonData.data_drama_quick_cost[slot0.quick_data.fast_combat_num + 1] then
			slot0.quick_battle_status = 2
			slot0.cost = Config.DungeonData.data_drama_quick_cost[slot5].cost
			slot4 = string.format(TI18N("<img src=%s visible=true scale=0.25 /><div fontcolor=#ffffff outline=2,#020019>%s 快速战斗</div>"), PathTool.getItemRes(Config.ItemData.data_assets_label2id.gold), slot0.cost)
		else
			slot6 = Config.DungeonData.data_drama_const

			if slot0.quick_data.is_holiday == 1 and slot0.quick_data.fast_combat_w_num < slot6.hd_fast_combat_buy_time.val then
				slot0.quick_battle_status = 2
				slot0.cost = slot6.hd_fast_combat_lose.val[1][2]
				slot4 = string.format(TI18N("<img src=%s visible=true scale=0.25 /><div fontcolor=#ffffff outline=2,#020019>%s 快速战斗</div>"), PathTool.getItemRes(slot6.hd_fast_combat_lose.val[1][1]), slot0.cost)
			else
				slot0.quick_battle_status = 3
				slot4 = TI18N("<div fontcolor=#ffffff outline=2,#020019>获取更多次数</div>")
			end
		end

		slot0.quick_num_label:setString(slot3)
		slot0.quick_btn:setRichText(slot4, 28)
	end
end

function BattlDramaQuickBattleWindow.openRootWnd(slot0)
	slot0:updateData()
end

function BattlDramaQuickBattleWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.update_dram_quick_battle_event then
		GlobalEvent:getInstance():UnBind(slot0.update_dram_quick_battle_event)

		slot0.update_dram_quick_battle_event = nil
	end

	if slot0.add_goods_event then
		GlobalEvent:getInstance():UnBind(slot0.add_goods_event)

		slot0.add_goods_event = nil
	end

	if slot0.modify_add_event then
		GlobalEvent:getInstance():UnBind(slot0.modify_add_event)

		slot0.modify_add_event = nil
	end

	GlobalEvent:getInstance():Fire(BattleEvent.CLOSE_RESULT_VIEW)
	uv0:openDramBattleQuickView(false)
end

BatttleQuickItem = class("BatttleQuickItem", function ()
	return ccui.Layout:create()
end)

function BatttleQuickItem.ctor(slot0)
	slot0:setContentSize(cc.size(BackPackItem.Width, BackPackItem.Height))
	slot0:setAnchorPoint(cc.p(0.5, 0.5))

	slot0.item = BackPackItem.new(false, true, false, 1, false, true)

	slot0.item:setPosition(BackPackItem.Width * 0.5, BackPackItem.Height * 0.5)
	slot0:addChild(slot0.item)
	slot0:registerEvent()
end

function BatttleQuickItem.registerEvent(slot0)
end

function BatttleQuickItem.setData(slot0, slot1)
	slot0.data = slot1

	if slot1 then
		slot0.item:setBaseData(slot1.bid, slot1.num)
	end
end

function BatttleQuickItem.suspendAllActions(slot0)
end

function BatttleQuickItem.DeleteMe(slot0)
	if slot0.item then
		slot0.item:DeleteMe()

		slot0.item = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
