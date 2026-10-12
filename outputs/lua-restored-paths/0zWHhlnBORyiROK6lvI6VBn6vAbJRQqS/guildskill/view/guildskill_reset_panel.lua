GuildskillResetPanel = GuildskillResetPanel or BaseClass(BaseView)
slot0 = table.insert
slot2 = GuildskillController:getInstance():getModel()
slot3 = string.format

function GuildskillResetPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.layout_name = "hero/hero_reset_offer_panel"
end

function GuildskillResetPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)

	slot0.win_title = slot1:getChildByName("win_title")

	slot0.win_title:setString(TI18N("技能重置"))

	slot0.dec_val = createRichLabel(24, cc.c4b(105, 55, 5, 255), cc.p(0, 1), cc.p(50, 491), 12, nil, 580)

	slot1:addChild(slot0.dec_val)

	slot0.cancel_btn = slot1:getChildByName("cancel_btn")
	slot0.cancel_btn_label = slot0.cancel_btn:getChildByName("label")

	slot0.cancel_btn_label:setString(TI18N("取 消"))
	slot0.cancel_btn_label:enableOutline(Config.ColorData.data_color4[263], 2)

	slot0.confirm_btn = slot1:getChildByName("confirm_btn")
	slot0.confirm_btn_label = slot0.confirm_btn:getChildByName("label")

	slot0.confirm_btn_label:setString(TI18N("确定重置"))
	slot0.confirm_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)

	slot0.list_view = slot1:getChildByName("list_view")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.list_view, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.list_view:getContentSize(), {
		start_y = 6,
		once_num = 4,
		start_x = 16,
		item_width = 119,
		space_x = 32,
		row = 4,
		item_height = 119,
		space_y = 10,
		col = 4,
		need_dynamic = true,
		item_class = BackPackItem
	})
	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.container = slot1
end

function GuildskillResetPanel.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openGuildskillResetPanel(false)
	end, true, 1)
	registerButtonEventListener(slot0.background, function ()
		uv0:openGuildskillResetPanel(false)
	end, false, 1)
	registerButtonEventListener(slot0.cancel_btn, function ()
		uv0:openGuildskillResetPanel(false)
	end, true, 2)
	slot0.confirm_btn:addTouchEventListener(function (slot0, slot1)
		if not uv0.can_click_btn then
			return
		end

		customClickAction(slot0, slot1, scale)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:onConfirmButton()
		end
	end)
	slot0:addGlobalEvent(GuildskillEvent.UpdateSkillResetEvent, function (slot0)
		if not slot0 then
			return
		end

		uv0:setData(slot0)
	end)
end

function GuildskillResetPanel.onConfirmButton(slot0)
	if not slot0.career then
		return
	end

	if slot0.reset_type == 1 then
		uv0:send23705(slot0.career)
	else
		uv0:send23709(slot0.career)
	end

	uv0:openGuildskillResetPanel(false)
end

function GuildskillResetPanel.openRootWnd(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot0.reset_type = slot2 or 1
	slot0.career = slot1

	if slot0.reset_type == 1 then
		uv0:send23704(slot1)
	else
		slot0:setPvpData(slot1)
	end
end

function GuildskillResetPanel.setPvpData(slot0, slot1)
	if not uv0:getPvpskillInfoByCareer(slot1) then
		return
	end

	slot4 = {}

	for slot8, slot9 in ipairs(slot2.attr_formation) do
		slot3 = 0 + slot9.lev

		if Config.GuildSkillData.data_pvp_attr_info(getNorKey(slot9.id, slot9.lev)) and next(slot11.return_res) ~= nil then
			for slot15, slot16 in ipairs(slot11.return_res) do
				if slot4[slot16[1]] == nil then
					slot4[slot16[1]] = slot16[2]
				else
					slot4[slot16[1]] = slot4[slot16[1]] + slot16[2]
				end
			end
		end
	end

	if Config.GuildSkillData.data_pvp_skill_info(getNorKey(slot1, slot2.skill_lev)) then
		for slot10, slot11 in ipairs(slot6.return_res) do
			if slot4[slot11[1]] == nil then
				slot4[slot11[1]] = slot11[2]
			else
				slot4[slot11[1]] = slot4[slot11[1]] + slot11[2]
			end
		end
	end

	slot0:initCostInfo(slot3)

	slot7 = {}

	for slot11, slot12 in pairs(slot4) do
		uv1(slot7, {
			id = slot11,
			quantity = slot12
		})
	end

	table.sort(slot7, SortTools.tableUpperSorter({
		"id"
	}))
	slot0.item_scrollview:setData(slot7, nil, nil, {
		is_show_tips = true,
		is_other = false
	})
	slot0:updateBtnInfo()
end

function GuildskillResetPanel.initCostInfo(slot0, slot1)
	slot1 = slot1 or 1
	slot2 = 0

	if uv0:isPvpFisrtReset() then
		slot2 = 300

		if Config.GuildSkillData.data_const.pvp_first_reset_consume then
			slot2 = slot4.val
		end
	else
		slot4 = 500

		if Config.GuildSkillData.data_const.reset_consume_var1 then
			slot4 = slot5.val
		end

		slot6 = 15

		if Config.GuildSkillData.data_const.reset_consume_var2 then
			slot6 = slot7.val
		end

		slot2 = math.max(slot4, slot1 * slot6)
	end

	slot4 = nil

	if slot2 == 0 then
		slot0.dec_val:setString(uv1(TI18N("本次消耗免费,重置后<div fontcolor=#c00b09>%s职业</div>所有<div fontcolor=#c00b09>PVP属性和技能</div>将被清空等级(变为未激活状态)，请慎重考虑！同时将返还所消耗的<div fontcolor=#df7d2a>100%%养成材料</div>"), HeroConst.CareerName[slot0.career] or HeroConst.CareerName[HeroConst.CareerType.eWarrior]))
	else
		slot0.dec_val:setString(uv1((not slot3 or TI18N("首次重置只需要消耗<img src='%s' scale=0.3 />%s 重置后<div fontcolor=#c00b09>%s职业</div>所有<div fontcolor=#c00b09>PVP属性和技能</div>将被清空等级(变为未激活状态)，请慎重考虑！同时将返还所消耗的<div fontcolor=#df7d2a>100%%养成材料</div>")) and TI18N("重置需要消耗<img src='%s' scale=0.3 />%s 重置后<div fontcolor=#c00b09>%s职业</div>所有<div fontcolor=#c00b09>PVP属性和技能</div>将被清空等级(变为未激活状态)，请慎重考虑！同时将返还所消耗的<div fontcolor=#df7d2a>100%%养成材料</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(Config.ItemData.data_assets_label2id.gold).icon), slot2, slot5))
	end
end

function GuildskillResetPanel.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot3 = nil

	if (slot1.gold or 0) == 0 then
		slot0.dec_val:setString(uv0(TI18N("本次消耗免费,重置后<div fontcolor=#c00b09>%s职业</div>所有技能将被清空等级(变为未激活状态)，请慎重考虑！同时将返回所消耗的<div fontcolor=#df7d2a>100%%公会贡献和50%%贝里</div>"), HeroConst.CareerName[slot0.career] or HeroConst.CareerName[HeroConst.CareerType.eWarrior]))
	else
		slot0.dec_val:setString(uv0((slot1.is_first ~= 1 or TI18N("首次重置只需要消耗<img src='%s' scale=0.3 />%s 重置后<div fontcolor=#c00b09>%s职业</div>所有技能将被清空等级(变为未激活状态)，请慎重考虑！同时将返回所消耗的<div fontcolor=#df7d2a>100%%公会贡献和50%%贝里</div>")) and TI18N("重置需要消耗<img src='%s' scale=0.3 />%s 重置后<div fontcolor=#c00b09>%s职业</div>所有技能将被清空等级(变为未激活状态)，请慎重考虑！同时将返回所消耗的<div fontcolor=#df7d2a>100%%公会贡献和50%%贝里</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(Config.ItemData.data_assets_label2id.gold).icon), slot2, slot4))
	end

	slot5 = {}

	for slot9, slot10 in ipairs(slot1.list) do
		uv1(slot5, {
			id = slot10.id,
			quantity = slot10.num
		})
	end

	table.sort(slot5, SortTools.tableUpperSorter({
		"id"
	}))
	slot0.item_scrollview:setData(slot5, nil, nil, {
		is_show_tips = true,
		is_other = false
	})
	slot0:updateBtnInfo()
end

function GuildskillResetPanel.updateBtnInfo(slot0)
	if slot0.confirm_btn then
		slot0.can_click_btn = false

		slot0.confirm_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
		setChildUnEnabled(true, slot0.confirm_btn)
		slot0:setBtnFormatString(5)
		slot0.confirm_btn:stopAllActions()
		slot0.confirm_btn_label:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 <= 0 then
				uv1.confirm_btn:stopAllActions()

				uv1.can_click_btn = true

				setChildUnEnabled(false, uv1.confirm_btn)
				uv1.confirm_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)
			end

			uv1:setBtnFormatString(uv0)
		end))))
	end
end

function GuildskillResetPanel.setBtnFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.confirm_btn_label:setString(uv0(TI18N("确定重置(%s)"), slot1))
	else
		slot0.confirm_btn_label:setString(TI18N("确定重置"))
	end
end

function GuildskillResetPanel.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	slot0.confirm_btn:stopAllActions()
	uv0:openGuildskillResetPanel(false)
end
