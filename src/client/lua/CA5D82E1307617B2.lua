GuildvoyageResultWindow = GuildvoyageResultWindow or BaseClass(BaseView)
slot1 = GuildvoyageController:getInstance():getModel()
slot2 = table.insert

function GuildvoyageResultWindow.__init(slot0)
	slot0.order_type = type
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.is_init = false
	slot0.res_list = {}
	slot0.layout_name = "guildvoyage/guildvoyage_result_window"
	slot0.effect_cache_list = {}
	slot0.item_list = {}
end

function GuildvoyageResultWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot1:getChildByName("rewards_title_1"):setString(TI18N("固定奖励"))
	slot1:getChildByName("rewards_title_2"):setString(TI18N("概率奖励"))

	slot0.title_container = slot0.root_wnd:getChildByName("title_container")
	slot0.title_width = slot0.title_container:getContentSize().width
	slot0.title_height = slot0.title_container:getContentSize().height
	slot0.desc = slot1:getChildByName("desc")

	slot0.desc:setString(TI18N("概率奖励未获得"))

	slot0.main_width = slot1:getContentSize().width
	slot0.container = slot1
end

function GuildvoyageResultWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:openGuildvoyageResultWindow(false)
		end
	end)
end

function GuildvoyageResultWindow.openRootWnd(slot0, slot1, slot2, slot3)
	playOtherSound("c_get")
	slot0:handleEffect(true)

	slot0.is_success = slot2
	slot0.is_double = slot3

	if uv0:getOrderById(slot1) and slot4.config then
		slot0:createRewardsList(slot4.config.rewards)
		slot0:createRandRewardsList(slot4.config.rand_rewards)

		if slot2 == TRUE then
			slot0.desc:setTextColor(cc.c4b(17, 255, 50, 255))
			slot0.desc:setString(TI18N("概率奖励已获得"))
		else
			slot0.desc:setTextColor(Config.ColorData.data_color4[183])
			slot0.desc:setString(TI18N("概率奖励未获得"))
		end
	end
end

function GuildvoyageResultWindow.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0.title_container) and slot0.play_effect == nil then
		slot0.play_effect = createEffectSpine(PathTool.getEffectRes(103), cc.p(slot0.title_width * 0.5, slot0.title_height * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action_1)

		slot0.title_container:addChild(slot0.play_effect, 1)
	end
end

function GuildvoyageResultWindow.createRewardsList(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	slot2 = #slot1
	slot6 = (slot0.main_width - (slot2 * BackPackItem.Width * 0.8 + (slot2 - 1) * 40)) / 2
	slot7 = 0
	slot8 = nil
	slot9 = 1

	if slot0.is_double == TRUE then
		slot9 = 2
	end

	for slot13, slot14 in ipairs(slot1) do
		if slot14[1] and slot14[2] then
			slot8 = BackPackItem.new(false, true, false, slot4, false, true)

			slot8:setBaseData(slot14[1], slot14[2] * slot9)
			slot8:setPosition(slot6 + (slot13 - 1) * (BackPackItem.Width * slot4 + slot3) + BackPackItem.Width * slot4 * 0.5, 367)
			slot0.container:addChild(slot8)
			uv0(slot0.item_list, slot8)

			if Config.ItemData.data_get_data(slot14[1]) then
				slot16 = createLabel(22, 1, nil, slot7, 302, slot15.name, slot0.container, nil, cc.p(0.5, 0.5))
			end
		end
	end
end

function GuildvoyageResultWindow.createRandRewardsList(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	slot2 = #slot1
	slot6 = (slot0.main_width - (slot2 * BackPackItem.Width * 0.8 + (slot2 - 1) * 40)) / 2
	slot7 = 0
	slot8 = nil
	slot9 = 1

	if slot0.is_double == TRUE then
		slot9 = 2
	end

	for slot13, slot14 in ipairs(slot1) do
		if slot14[1] and slot14[2] then
			slot8 = BackPackItem.new(false, true, false, slot4, false, true)

			slot8:setBaseData(slot14[1], slot14[2] * slot9)
			slot8:setPosition(slot6 + (slot13 - 1) * (BackPackItem.Width * slot4 + slot3) + BackPackItem.Width * slot4 * 0.5, 165)
			slot0.container:addChild(slot8)
			uv0(slot0.item_list, slot8)

			if Config.ItemData.data_get_data(slot14[1]) then
				slot16 = createLabel(22, 1, nil, slot7, 100, slot15.name, slot0.container, nil, cc.p(0.5, 0.5))
			end

			if slot0.is_success == FALSE then
				setChildUnEnabled(true, slot8)
			end
		end
	end
end

function GuildvoyageResultWindow.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.item_list) do
		slot5:DeleteMe()
	end

	slot0.item_list = nil

	slot0:handleEffect(false)
	uv0:openGuildvoyageResultWindow(false)
end
