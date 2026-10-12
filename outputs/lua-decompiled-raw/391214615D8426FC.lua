ActionGiftPanel = class("ActionGiftPanel", function ()
	return ccui.Widget:create()
end)

function ActionGiftPanel.ctor(slot0, slot1, slot2)
	slot0.holiday_bid = slot1
	slot0.type = slot2
	slot0.ctrl = ActionController:getInstance()
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.can_get = 0
	slot0.item_list = {}
	slot0.tab_list = {}
	slot0.data = slot0.ctrl:getActionSubTabVo(slot0.holiday_bid)
	slot0.is_update = false

	slot0:configUI()
	slot0:register_event()
end

function ActionGiftPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_gift_panel"))

	slot0.root_wnd:setPosition(-40, -120)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.bg = slot0.main_container:getChildByName("bg")

	if not slot0.bg_load then
		slot0.bg_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_41", true), ResourcesType.single, function ()
			if not tolua.isnull(uv0.bg) then
				uv0.bg:loadTexture(uv1, LOADTEXT_TYPE)
			end
		end, slot0.bg_load)
	end

	slot0.mid_icon = slot0.main_container:getChildByName("mid_icon")
	slot0.label_bg = slot0.main_container:getChildByName("label_bg")
	slot0.btn = slot0.main_container:getChildByName("btn")

	slot0.btn:setTitleText(TI18N("领取大礼"))

	slot0.btn.label = slot0.btn:getTitleRenderer()
	slot0.red_point = slot0.btn:getChildByName("red_point")

	if slot0.btn.label ~= nil then
		slot0.btn.label:enableOutline(Config.ColorData.data_color4[154], 2)
	end

	slot5 = "tab_panel"
	slot0.tab_panel = slot0.main_container:getChildByName(slot5)

	for slot5 = 1, 3 do
		if slot0.tab_panel:getChildByName("tab_btn_" .. slot5) then
			slot7 = {
				btn = slot6,
				select_bg = slot6:getChildByName("select_bg")
			}

			slot6:setVisible(false)
			slot7.select_bg:setVisible(false)

			slot7.title = slot6:getChildByName("title")

			slot7.title:enableOutline(Config.ColorData.data_color4[154], 2)

			slot7.icon = slot6:getChildByName("icon")

			slot7.icon:loadTexture(PathTool.getPlistImgForDownLoad("actiongift", "actiongift_icon_" .. slot5), LOADTEXT_TYPE)

			slot7.index = slot5
			slot0.tab_list[slot5] = slot7
		end
	end

	slot0.time_label = createRichLabel(24, 1, cc.p(0, 0.5), cc.p(15, 185))

	slot0.main_container:addChild(slot0.time_label)
	slot0:showEffect(true, 250, "action", true)
end

function ActionGiftPanel.register_event(slot0)
	if not slot0.update_action_even_event then
		slot0.update_action_even_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
			if slot0.bid == uv0.holiday_bid then
				uv0.is_update = true
				uv0.holiday_data = slot0

				uv0:updateTabList(slot0)
			end
		end)
	end

	for slot4, slot5 in pairs(slot0.tab_list) do
		slot5.btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:changeTabIndex(uv1.index)
			end
		end)
	end

	slot0.btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.limit_lev and uv0.role_vo and uv0.role_vo.lev < uv0.limit_lev then
				message(TI18N("需等级达到") .. uv0.limit_lev .. TI18N("级才可购买"))

				return
			end

			if not uv0.select_btn then
				return
			end

			if not uv0.select_btn.vo then
				return
			end

			if slot2.status == 2 then
				message(TI18N("您已领取过该礼包"))

				return
			end

			if uv0.reward_num > 0 then
				if (slot2.item_list or {}) and slot4[1] then
					if Config.ItemData.data_get_data(slot4[1].bid or 0) then
						CommonAlert.show(string.format(TI18N("是否花费<img src='%s' scale=0.4 />%s购买礼包？"), PathTool.getItemRes(slot7.icon), slot4[1].num or 0), TI18N("确定"), function ()
							if not uv0.select_btn.vo then
								return
							end

							uv0.ctrl:cs16604(uv0.holiday_bid, slot0.aim)
						end, TI18N("取消"), nil, CommonAlert.type.rich, nil, , 24)
					end
				end
			else
				slot3()
			end
		end
	end)
end

function ActionGiftPanel.changeTabIndex(slot0, slot1)
	if slot0.is_update == false and slot0.select_btn and slot0.select_btn.index == slot1 then
		return
	end

	slot0.is_update = false

	if slot0.select_btn then
		slot0.select_btn.select_bg:setVisible(false)
		slot0.select_btn.title:enableOutline(Config.ColorData.data_color4[154], 2)
	end

	slot0.select_btn = slot0.tab_list[slot1]

	if slot0.select_btn then
		slot0.select_btn.select_bg:setVisible(true)
		slot0.select_btn.title:enableOutline(Config.ColorData.data_color4[167], 2)
	end

	slot0:updateData()
end

function ActionGiftPanel.updateTabList(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = slot1.aim_list or {}

	for slot6 = 1, #slot2 do
		if slot2[slot6] and slot0.tab_list[slot6] then
			slot0.tab_list[slot6].btn:setVisible(true)
			slot0.tab_list[slot6].title:setString(slot7.aim_str or "")

			slot0.tab_list[slot6].vo = slot7
		end
	end

	slot0:changeTabIndex(1)
end

function ActionGiftPanel.updateData(slot0)
	if not slot0.select_btn then
		return
	end

	if not slot0.select_btn.vo then
		return
	end

	slot2 = slot1.item_list or {}
	slot0.reward_num = 0
	slot0.limit_lev = 0

	for slot7, slot8 in pairs(slot1.aim_args or {}) do
		if slot8 and slot8.aim_args_key == 1 then
			slot0.reward_num = slot8.aim_args_val or 0
		elseif slot8 and slot8.aim_args_key == 200 then
			slot0.limit_lev = slot8.aim_args_val or 0
		elseif slot8 and slot8.aim_args_key == 7 then
			slot0.res_val = slot8.aim_args_val or 0
		end
	end

	slot4 = ""
	slot4 = (slot0.reward_num > 0 or TI18N("领取")) and TI18N("抢购")

	if slot0.holiday_data then
		slot0.time_label:setString(string.format(TI18N("%s剩余时间：<div fontcolor=#35ff14>%s</div>"), slot4, TimeTool.GetTimeFormatDay(slot0.holiday_data.remain_sec or 0)))
	end

	setChildUnEnabled(false, slot0.btn)
	slot0.btn.label:enableOutline(Config.ColorData.data_color4[154], 2)

	slot4 = slot4 .. TI18N("大礼")

	slot0.red_point:setVisible(false)

	if slot1.status == 2 then
		setChildUnEnabled(true, slot0.btn)
		slot0.btn.label:enableOutline(Config.ColorData.data_color4[151], 2)

		slot4 = TI18N("已领取")
	elseif slot1.status == 1 and slot0.reward_num == 0 then
		slot0.red_point:setVisible(true)
	end

	slot0.btn:setTitleText(slot4)
	slot0:updateItemList(slot2)
	slot0:updateRes()
end

function ActionGiftPanel.updateRes(slot0)
	if not slot0.select_btn then
		return
	end

	slot2 = slot0.select_btn.vo.aim

	if slot0.mid_load then
		slot0.mid_load:DeleteMe()

		slot0.mid_load = nil
	end

	if not slot0.mid_load then
		slot0.mid_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("actiongift", "actiongift_show_" .. slot2), ResourcesType.single, function ()
			if not tolua.isnull(uv0.mid_icon) then
				loadSpriteTexture(uv0.mid_icon, uv1, LOADTEXT_TYPE)
				uv0.mid_icon:setLocalZOrder(10)
			end
		end, slot0.mid_load)
	end

	if slot0.title_load then
		slot0.title_load:DeleteMe()

		slot0.title_load = nil
	end

	if not slot0.title_load then
		slot0.title_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("actiongift", "txt_cn_actiongift_title_" .. slot2), ResourcesType.single, function ()
			if not tolua.isnull(uv0.label_bg) then
				loadSpriteTexture(uv0.label_bg, uv1, LOADTEXT_TYPE)
			end
		end, slot0.title_load)
	end
end

function ActionGiftPanel.updateItemList(slot0, slot1)
	slot2 = 1
	slot3 = (#slot1 or 0) - slot0.reward_num
	slot4 = slot0.main_container:getContentSize()

	for slot8, slot9 in pairs(slot0.item_list) do
		slot9:showItemEffect(false)
		slot9:setVisible(false)
	end

	slot6 = {
		[slot11.bid] = slot11
	}

	for slot10, slot11 in pairs(slot0.holiday_data.item_effect_list or {}) do
		-- Nothing
	end

	for slot10, slot11 in pairs(slot1) do
		if slot0.reward_num < slot10 then
			if not slot0.item_list[slot2] then
				slot12 = BackPackItem.new(true, true, nil, 0.9)

				slot0.main_container:addChild(slot12)
				slot12:setDefaultTip()

				slot0.item_list[slot2] = slot12
			end

			slot0.item_list[slot2]:setPosition(cc.p(slot4.width / 2 - 70 - slot3 / 2 * 140 + slot2 * 140, 290))

			slot13 = {
				bid = slot11.bid,
				quantity = slot11.num
			}
			slot14 = Config.ItemData.data_get_data(slot11.bid)
			slot14.quantity = slot11.num

			slot0.item_list[slot2]:setData(slot14, true)
			slot0.item_list[slot2]:setVisible(true)
			slot0.item_list[slot2]:showItemEffect(false)

			if slot6[slot11.bid] and slot6[slot11.bid].effect_1 and slot6[slot11.bid].effect_1 == 1 then
				if slot14 and slot14.quality >= 4 then
					slot0.item_list[slot2]:showItemEffect(true, 263, PlayerAction.action_1, true, 1.1)
				else
					slot0.item_list[slot2]:showItemEffect(true, 263, PlayerAction.action_2, true, 1.1)
				end
			end

			slot2 = slot2 + 1
		end
	end
end

function ActionGiftPanel.showEffect(slot0, slot1, slot2, slot3, slot4)
	if status == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif slot0.play_effect == nil and not tolua.isnull(slot0.main_container) then
		slot0.play_effect = createEffectSpine(Config.EffectData.data_effect_info[slot2], cc.p(slot0.main_container:getContentSize().width / 2 - 3, 426), cc.p(0.5, 0.5), slot4, slot3)

		slot0.main_container:addChild(slot0.play_effect, 1)
	end
end

function ActionGiftPanel.setVisibleStatus(slot0, slot1)
	slot1 = slot1 or false

	slot0:setVisible(slot1)

	if slot1 == true then
		ActionController:getInstance():cs16603(slot0.holiday_bid)
	end
end

function ActionGiftPanel.DeleteMe(slot0)
	if slot0.item_list ~= nil then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end
	end

	slot0.item_list = nil

	if slot0.bg_load then
		slot0.bg_load:DeleteMe()

		slot0.bg_load = nil
	end

	if slot0.mid_load then
		slot0.mid_load:DeleteMe()

		slot0.mid_load = nil
	end

	if slot0.title_load then
		slot0.title_load:DeleteMe()

		slot0.title_load = nil
	end

	if slot0.update_action_even_event then
		slot0.update_action_even_event = GlobalEvent:getInstance():UnBind(slot0.update_action_even_event)
		slot0.update_action_even_event = nil
	end

	slot0:showEffect(false)
end
