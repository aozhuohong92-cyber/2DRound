BattleDramaQingBaoTipsView = BattleDramaQingBaoTipsView or BaseClass(BaseView)
slot0 = BattleDramaController:getInstance()
slot1 = BattleDramaController:getInstance():getModel()

function BattleDramaQingBaoTipsView.__init(slot0)
	slot0.layout_name = "battledrama/battle_drama_qingbao_tips_view"
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.item_list = {}
	slot0.quick_battle_status = 0
	slot0.role_vo = RoleController:getInstance():getRoleVo()
end

function BattleDramaQingBaoTipsView.open_callback(slot0)
	slot0.panel_bg = slot0.root_wnd:getChildByName("Panel_bg")
	slot0.background = slot0.panel_bg:getChildByName("background")

	slot0.panel_bg:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("root")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.desc_label = createLabel(24, Config.ColorData.data_color3[175], nil, 360, 800, "", slot0.main_container, 2, cc.p(0.5, 0.5))

	slot0.desc_label:setWidth(550)

	slot0.reward_label = slot0.main_container:getChildByName("reward_label")

	slot0.reward_label:setString(TI18N("冒险奖励"))

	slot0.title_label = slot0.main_container:getChildByName("title_label")

	slot0.title_label:setString(TI18N("小提示"))

	slot0.go_btn = slot0.main_container:getChildByName("go_btn")
	slot0.go_btn.label = slot0.go_btn:getTitleRenderer()

	if slot0.go_btn.label ~= nil then
		slot0.go_btn:setTitleText(TI18N("前往冒险"))
		slot0.go_btn.label:enableOutline(Config.ColorData.data_color4[264], 2)
	end

	slot0.item_crollView = slot0.main_container:getChildByName("item_crollView")

	slot0.item_crollView:setScrollBarEnabled(false)
end

function BattleDramaQingBaoTipsView.updateData(slot0, slot1)
	slot2 = TI18N("  冒险情报用于空岛冒险中探索新的岛屿，完成事件后可获得丰厚贝里和道具奖励")
	slot3 = BattleDramaController:getInstance():getModel():getMaxEnergyMax()

	if Config.DungeonData.data_drama_const and slot3 and slot0.role_vo then
		slot2 = (slot3 > slot0.role_vo.energy or TI18N("  冒险情报已满，无法继续增加，建议前往冒险探索")) and TI18N("  冒险情报用于空岛冒险中探索新的岛屿，完成事件后可获得丰厚贝里和道具奖励")
	end

	slot0.desc_label:setString(slot2)

	if Config.DungeonData.data_drama_const and Config.DungeonData.data_drama_const.advanture_item then
		slot0:updateItem(Config.DungeonData.data_drama_const.advanture_item.val)
	end
end

function BattleDramaQingBaoTipsView.updateItem(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = nil
	slot3 = BackPackItem.Height + 10
	slot10 = cc.size

	slot0.item_crollView:setInnerContainerSize(slot10(slot0.item_crollView:getContentSize().width, math.max(slot0.item_crollView:getContentSize().height, slot3 * math.floor(tableLen(slot1) / 4) + 5 * tableLen(slot1) % 4 + slot3)))

	for slot10, slot11 in ipairs(slot1) do
		if not slot0.item_list[slot10] then
			slot12 = BackPackItem.new(true, true)

			slot12:setBaseData(slot11[1], slot11[2])
			slot12:setAnchorPoint(cc.p(0, 1))
			slot12:setDefaultTip()
			slot0.item_crollView:addChild(slot12)
			slot12:setPosition(10 + (BackPackItem.Width + 20) * ((slot10 - 1) % 4), slot6 - slot3 * math.floor((slot10 - 1) / 4) - 10)

			slot0.item_list[slot10] = slot12
		end
	end
end

function BattleDramaQingBaoTipsView.register_event(slot0)
	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:openBattleDramaQingBaoTipsView(false)
			end
		end)
	end

	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:openBattleDramaQingBaoTipsView(false)
			end
		end)
	end

	if slot0.go_btn then
		slot0.go_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
			end
		end)
	end

	if slot0.role_vo ~= nil and slot0.role_assets_event == nil then
		slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "energy" then
				slot2 = TI18N("  冒险情报用于空岛冒险中探索新的岛屿，完成事件后可获得丰厚贝里和道具奖励")
				slot3 = BattleDramaController:getInstance():getModel():getMaxEnergyMax()

				if Config.DungeonData.data_drama_const and slot3 and uv0.role_vo then
					slot2 = (slot3 > uv0.role_vo.energy or TI18N("  冒险情报已满，无法继续增加，建议前往冒险探索")) and TI18N("  冒险情报用于空岛冒险中探索新的岛屿，完成事件后可获得丰厚贝里和道具奖励")
				end

				uv0.desc_label:setString(slot2)
			end
		end)
	end
end

function BattleDramaQingBaoTipsView.openRootWnd(slot0, slot1)
	slot0:updateData(slot1)
end

function BattleDramaQingBaoTipsView.close_callback(slot0)
	if slot0.role_vo ~= nil and slot0.role_assets_event ~= nil then
		slot0.role_vo:UnBind(slot0.role_assets_event)

		slot0.role_assets_event = nil
	end

	uv0:openBattleDramaQingBaoTipsView(false)
end
