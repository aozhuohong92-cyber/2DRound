PractisetowerItem = class("PractisetowerItem", function ()
	return ccui.Widget:create()
end)

function PractisetowerItem.ctor(slot0)
	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function PractisetowerItem.config(slot0)
	slot0.ctrl = PractisetowerController:getInstance()
	slot0.size = cc.size(720, 331)

	slot0:setContentSize(slot0.size)

	slot0.is_lock = false

	slot0:retain()

	slot0.item_list = {}
	slot0.model_id = 0
end

function PractisetowerItem.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("practisetower/practise_tower_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.background = slot0.main_panel:getChildByName("bg")

	slot0.background:setVisible(false)

	slot0.lock_icon = slot0.main_panel:getChildByName("lock")

	slot0.lock_icon:setVisible(false)

	slot0.pass_icon = slot0.main_panel:getChildByName("pass_icon")

	slot0.pass_icon:setVisible(false)

	slot0.model_panel = slot0.main_panel:getChildByName("model_panel")

	slot0.model_panel:setVisible(false)

	slot0.tips_lab = slot0.main_panel:getChildByName("tips_lab")

	slot0.tips_lab:setString(TI18N("请先通过前一层"))
	slot0.tips_lab:setVisible(false)

	slot0.cur_panel = slot0.main_panel:getChildByName("cur_panel")

	slot0.cur_panel:setVisible(false)

	slot0.comfirm_btn = slot0.cur_panel:getChildByName("comfirm_btn")
	slot0.comfirm_btn_lab = slot0.comfirm_btn:getChildByName("label")

	slot0.comfirm_btn_lab:setString(TI18N("挑战BOSS"))
	UITool.SetTitleColor(slot0.comfirm_btn_lab)

	slot0.progress_container = slot0.cur_panel:getChildByName("progress_container")
	slot0.progress = slot0.progress_container:getChildByName("progress")

	slot0.progress:setScale9Enabled(true)

	slot0.hp_value = slot0.progress_container:getChildByName("hp_value")

	slot0.cur_panel:getChildByName("Text_28"):setString(TI18N("血量:"))

	slot0.award_panel = slot0.main_panel:getChildByName("award_panel")

	slot0.award_panel:setVisible(false)

	slot0.item_scrollview = slot0.award_panel:getChildByName("item_scrollview")

	slot0.item_scrollview:setScrollBarEnabled(false)
	slot0.item_scrollview:setSwallowTouches(false)

	slot0.power_info = slot0.main_panel:getChildByName("power_info")

	slot0.power_info:setVisible(false)

	slot0.power_lab = slot0.power_info:getChildByName("power_lab")
	slot0.num_lab = slot0.main_panel:getChildByName("num_lab")
end

function PractisetowerItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	if slot1.is_top_2 == true then
		return
	end

	slot0.data = slot1

	slot0:updateMessage()
end

function PractisetowerItem.sweepCount(slot0)
	if not slot0.data then
		return
	end

	if not slot0.ctrl:getModel():getPractiseTowerData() then
		return
	end

	if slot1.last_unixtime - GameNet:getInstance():getTime() <= 0 then
		setChildUnEnabled(true, slot0.comfirm_btn)
		slot0.comfirm_btn_lab:disableEffect(cc.LabelEffect.OUTLINE)
	else
		setChildUnEnabled(false, slot0.comfirm_btn)
		slot0.comfirm_btn_lab:enableOutline(cc.c4b(2, 0, 25, 255), 2)
	end

	slot0.num_lab:setString(string.format(TI18N("第%d层"), slot0.data.id))
	slot0.num_lab:setVisible(true)

	slot3 = false

	if slot0.data.id <= (slot0.ctrl:getModel():getNowTowerId() or 0) then
		slot3 = true
	end

	slot0.is_pass = slot3
	slot0.is_lock = slot0.data.id > slot2 + 2

	slot0.lock_icon:setVisible(slot0.is_lock)
	slot0.tips_lab:setVisible(false)
	slot0.cur_panel:setVisible(false)

	if slot0.is_lock == false and slot0.is_pass == false then
		slot0.main_panel:runAction(cc.Sequence:create(cc.DelayTime:create(0.2), cc.CallFunc:create(function ()
			if uv0 and uv0.updateModel then
				uv0:updateModel(true, uv0.data)
			end
		end)))

		if slot0.data.id == slot2 + 1 then
			slot0.cur_panel:setVisible(true)
			slot0.progress:setPercent(slot1.radio)
			slot0.hp_value:setString(string.format("%d%%", slot1.radio))
		elseif slot0.data.id == slot2 + 2 then
			slot0.tips_lab:setVisible(true)
		end
	else
		slot0.model_panel:setVisible(false)
	end

	slot0.pass_icon:setVisible(slot0.is_pass)

	if slot0.is_lock == true then
		slot0.power_lab:setString(TI18N("推荐战力：？？？"))
	else
		slot0.power_lab:setString(string.format(TI18N("推荐战力：%d"), slot0.data.power))
	end

	slot0:updateAwardInfo()
end

function PractisetowerItem.updateModel(slot0, slot1, slot2)
	slot0.model_panel:setVisible(slot1)

	if slot1 == true then
		if not slot2 then
			return
		end

		if slot0.model_id ~= tonumber(slot2.mode_id) and slot0.partner_model then
			slot0.partner_model:DeleteMe()

			slot0.partner_model = nil
		end

		if not slot0.partner_model then
			slot0.partner_model = BaseRole.new(BaseRole.type.unit, tonumber(slot2.mode_id), nil, {
				scale = 0.4
			})

			slot0.partner_model:setAnimation(0, PlayerAction.show, true)
			slot0.model_panel:addChild(slot0.partner_model)
			slot0.partner_model:setPosition(cc.p(50, 25))
		end

		slot0.model_id = slot2.mode_id
	elseif slot0.partner_model then
		slot0.partner_model:DeleteMe()

		slot0.partner_model = nil
	end
end

function PractisetowerItem.updateAwardInfo(slot0)
	if not slot0.data then
		return
	end

	slot0.award_panel:setVisible(true)
	slot0.power_info:setVisible(true)

	slot0.item_list = commonShowSingleRowItemList(slot0.item_scrollview, slot0.item_list, slot0.data.reward or {}, {
		scale = 0.6,
		max_count = 2,
		is_center = true,
		is_show_got = slot0.is_pass
	})
end

function PractisetowerItem.updateMessage(slot0)
	if not slot0.data then
		return
	end

	slot0.background:setVisible(false)

	if slot0.data.type == 1 then
		loadSpriteTexture(slot0.background, PathTool.getPlistImgForDownLoad("practisetower", "practisetower_bg_2"), LOADTEXT_TYPE)
		slot0.background:setVisible(true)
	elseif slot0.data.type == 2 then
		loadSpriteTexture(slot0.background, PathTool.getResFrame("practisetower", "practisetower_2"), LOADTEXT_TYPE_PLIST)
		slot0.background:setVisible(true)
	else
		if slot0.index % 2 == 0 then
			loadSpriteTexture(slot0.background, PathTool.getResFrame("practisetower", "practisetower_2"), LOADTEXT_TYPE_PLIST)
		else
			loadSpriteTexture(slot0.background, PathTool.getResFrame("practisetower", "practisetower_3"), LOADTEXT_TYPE_PLIST)
		end

		slot0.background:setVisible(true)
	end

	slot0.pass_icon:setVisible(false)
	slot0.award_panel:setVisible(false)
	slot0.power_info:setVisible(false)
	slot0.lock_icon:setVisible(false)
	slot0.tips_lab:setVisible(false)
	slot0.cur_panel:setVisible(false)
	slot0.num_lab:setVisible(false)

	if slot0.data.type == 1 or slot0.data.type == 2 then
		slot0.model_panel:setVisible(false)

		return
	end

	slot0:sweepCount()
end

function PractisetowerItem.registerEvents(slot0)
	registerButtonEventListener(slot0.comfirm_btn, function ()
		if not uv0.ctrl:getModel():getPractiseTowerData() or not uv0.data then
			return
		end

		if slot0.last_unixtime - GameNet:getInstance():getTime() <= 0 then
			message(TI18N("当前活动已结束"))

			return
		end

		if slot0.time <= 0 and slot0.is_recombat == 0 then
			if slot0.last_buy_time > 0 then
				slot2 = RoleController:getInstance():getRoleVo()

				if Config.HolidayPractiseTowerData.data_const.holiday_practise_tower_buy_loss and slot1.val and slot1.val[1] and slot1.val[1][1] and slot1.val[1][2] and slot2 then
					if slot1.val[1][2] <= slot2.gold then
						if Config.ItemData.data_get_data(slot1.val[1][1]) and slot7.icon then
							CommonAlert.show(string.format(TI18N("是否花费<img src='%s' scale=0.25 />%s购买一次挑战次数？"), PathTool.getItemRes(slot7.icon), slot1.val[1][2] or 0), TI18N("确定"), function ()
								uv0.ctrl:getModel():setIsTouchFight({
									id = uv0.data.id,
									power = uv0.data.power
								})
								uv0.ctrl:sender29104()
							end, TI18N("取消"), nil, CommonAlert.type.rich, nil, , 24)
						end
					else
						slot4 = nil

						if (type(slot1.val[1][1]) ~= "number" or Config.ItemData.data_get_data(slot5)) and Config.ItemData.data_get_data(Config.ItemData.data_assets_label2id[slot5]) then
							if slot4.id == Config.ItemData.data_assets_label2id.gold then
								if FILTER_CHARGE then
									message(TI18N("钻石不足"))
								else
									CommonAlert.show(string.format(TI18N("%s不足，是否前往充值？"), slot4.name), TI18N("确定"), function ()
										VipController:getInstance():openVipMainWindow(true, VIPTABCONST.CHARGE)
									end, TI18N("取消"), nil, CommonAlert.type.rich, nil, , , true)
								end
							else
								BackpackController:getInstance():openTipsSource(true, slot4)
							end
						end
					end
				end
			else
				message(TI18N("挑战次数不足"))
			end

			return
		end

		HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.PractiseTower, {
			select_base_id = uv0.data.id,
			is_send = false,
			power = uv0.data.power
		})
	end, true, 1)
end

function PractisetowerItem.clickHandler(slot0)
	if slot0.call_fun then
		slot0:call_fun(slot0.data)
	end
end

function PractisetowerItem.addCallBack(slot0, slot1)
	slot0.call_fun = slot1
end

function PractisetowerItem.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function PractisetowerItem.getData(slot0)
	return slot0.data
end

function PractisetowerItem.clearInfo(slot0)
	slot0:removeFromParent()
end

function PractisetowerItem.DeleteMe(slot0)
	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end

	if slot0.partner_model then
		slot0.partner_model:DeleteMe()

		slot0.partner_model = nil
	end

	slot0:removeFromParent()
	slot0:removeAllChildren()
	slot0:release()
end
