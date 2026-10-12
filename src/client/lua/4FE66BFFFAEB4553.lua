BattleBuffInfoView = BattleBuffInfoView or BaseClass(BaseView)
slot1 = BattleController:getInstance():getModel()
slot2 = table.insert
slot3 = {
	Left = 1,
	Right = 2
}

function BattleBuffInfoView.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.layout_name = "battle/battle_buff_info_view"
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("battleharm", "battleharm"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("battle", "battle"),
			type = ResourcesType.plist
		}
	}
	slot0.left_item_list = {}
	slot0.right_item_list = {}
end

function BattleBuffInfoView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)

	slot0.left_name_label = slot1:getChildByName("left_name_label")
	slot0.right_name_label = slot1:getChildByName("right_name_label")
	slot0.left_role_panel = slot1:getChildByName("left_role_panel")
	slot0.right_role_panel = slot1:getChildByName("right_role_panel")
	slot0.close_btn = slot1:getChildByName("close_btn")

	slot0.close_btn:getChildByName("label"):setString(TI18N("确  定"))
	slot1:getChildByName("title_label"):setString(TI18N("BUFF总览"))
end

function BattleBuffInfoView.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0._onClickCloseBtn), true, 2)
	registerButtonEventListener(slot0.background, handler(slot0, slot0._onClickCloseBtn), false, 2)
	slot0:addGlobalEvent(BattleEvent.UPDATE_ROUND_NUM, function ()
		uv0:setData()
	end)
end

function BattleBuffInfoView._onClickCloseBtn(slot0)
	uv0:openBattleBuffInfoView(false)
end

function BattleBuffInfoView.openRootWnd(slot0, slot1, slot2)
	slot0.left_name = slot1 or ""
	slot0.right_name = slot2 or ""

	slot0:setData(true)
end

function BattleBuffInfoView.setData(slot0, slot1)
	if not uv0:getModel():getAllObject() or next(slot2) == nil then
		return
	end

	slot4 = {}

	for slot8, slot9 in pairs(slot2) do
		if slot9.object_type == BattleObjectType.Pet or slot9.object_type == BattleObjectType.Unit then
			if slot9.group == 1 then
				uv1({}, slot9)
			elseif slot9.group == 2 then
				uv1(slot4, slot9)
			end
		end
	end

	slot5 = slot0.left_role_panel:getContentSize().height
	slot9 = slot0.left_name

	slot0.left_name_label:setString(slot9)

	for slot9, slot10 in pairs(slot0.left_item_list) do
		slot10:setVisible(false)
	end

	for slot9, slot10 in ipairs(slot3) do
		if slot1 then
			delayRun(slot0.left_role_panel, slot9 * 4 / display.DEFAULT_FPS, function ()
				if uv0.left_item_list[uv1] == nil then
					slot0 = BattleBuffInfoItem.new(uv2.Left)
					uv0.left_item_list[uv1] = slot0

					uv0.left_role_panel:addChild(slot0)
				end

				slot0:setVisible(true)
				slot0:setPosition(cc.p(0, uv3 - (uv1 - 1) * slot0:getContentSize().height))
				slot0:setData(uv4)
			end)
		else
			if slot0.left_item_list[slot9] == nil then
				slot11 = BattleBuffInfoItem.new(uv2.Left)
				slot0.left_item_list[slot9] = slot11

				slot0.left_role_panel:addChild(slot11)
			end

			slot11:setVisible(true)
			slot11:setPosition(cc.p(0, slot5 - (slot9 - 1) * slot11:getContentSize().height))
			slot11:setData(slot10)
		end
	end

	slot9 = slot0.right_name

	slot0.right_name_label:setString(slot9)

	for slot9, slot10 in pairs(slot0.right_item_list) do
		slot10:setVisible(false)
	end

	for slot9, slot10 in ipairs(slot4) do
		if slot1 then
			delayRun(slot0.right_role_panel, slot9 * 4 / display.DEFAULT_FPS, function ()
				if uv0.right_item_list[uv1] == nil then
					slot0 = BattleBuffInfoItem.new(uv2.Right)
					uv0.right_item_list[uv1] = slot0

					uv0.right_role_panel:addChild(slot0)
				end

				slot0:setVisible(true)
				slot0:setPosition(cc.p(0, uv3 - (uv1 - 1) * slot0:getContentSize().height))
				slot0:setData(uv4)
			end)
		else
			if slot0.right_item_list[slot9] == nil then
				slot11 = BattleBuffInfoItem.new(uv2.Right)
				slot0.right_item_list[slot9] = slot11

				slot0.right_role_panel:addChild(slot11)
			end

			slot11:setVisible(true)
			slot11:setPosition(cc.p(0, slot5 - (slot9 - 1) * slot11:getContentSize().height))
			slot11:setData(slot10)
		end
	end
end

function BattleBuffInfoView.close_callback(slot0)
	slot0.left_role_panel:stopAllActions()

	for slot4, slot5 in pairs(slot0.left_item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	slot0.right_role_panel:stopAllActions()

	for slot4, slot5 in pairs(slot0.right_item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	uv0:openBattleBuffInfoView(false)
end

BattleBuffInfoItem = class("BattleBuffInfoItem", function ()
	return ccui.Widget:create()
end)

function BattleBuffInfoItem.ctor(slot0, slot1)
	slot0.role_dir = slot1 or uv0.Left
	slot0.buff_list_item = {}

	slot0:configUI()
	slot0:register_event()
end

function BattleBuffInfoItem.configUI(slot0)
	slot0.size = cc.size(300, 99)

	slot0:setTouchEnabled(false)
	slot0:setAnchorPoint(cc.p(0, 1))
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("battle/battle_buff_info_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot2
	slot0.touch_layout = slot2:getChildByName("touch_layout")
	slot0.arrow_sp = slot2:getChildByName("Sprite_1")
	slot0.hero_head = HeroExhibitionItem.new(0.7, true)

	slot0.hero_head:addCallBack(handler(slot0, slot0._onClickHeroCallBack))
	slot2:addChild(slot0.hero_head)

	if slot0.role_dir == uv0.Left then
		slot0.hero_head:setPosition(cc.p(50, slot0.size.height / 2))
		slot0.touch_layout:setPosition(cc.p(slot0.size.width, 0))
		slot0.arrow_sp:setPosition(cc.p(282, 15))
		slot0.arrow_sp:setScaleX(1)
	else
		slot0.hero_head:setPosition(cc.p(slot0.size.width - 50, slot0.size.height / 2))
		slot0.touch_layout:setPosition(cc.p(slot0.size.width - slot0.hero_head:getContentSize().width * 0.7 - 18, 0))
		slot0.arrow_sp:setPosition(cc.p(18, 15))
		slot0.arrow_sp:setScaleX(-1)
	end
end

function BattleBuffInfoItem._onClickHeroCallBack(slot0)
	if slot0.data and slot0.data.owner_id ~= 0 and slot0.data.owner_srv_id ~= "" and slot0.data.object_id then
		if RoleController:getInstance():getRoleVo().rid == slot0.data.owner_id and slot1.srv_id == slot0.data.owner_srv_id then
			if HeroController:getInstance():getModel():getHeroById(slot0.data.object_id) and next(slot2) ~= nil then
				HeroController:getInstance():openHeroTipsPanel(true, slot2)
			else
				message(TI18N("该英雄来自异域，无法查看"))
			end
		elseif slot0.data.owner_srv_id == "robot" then
			message(TI18N("该英雄来自异域，无法查看"))
		else
			LookController:getInstance():sender11061(slot0.data.owner_id, slot0.data.owner_srv_id, slot0.data.object_id)
		end
	else
		message(TI18N("该英雄来自异域，无法查看"))
	end
end

function BattleBuffInfoItem.register_event(slot0)
	registerButtonEventListener(slot0.touch_layout, function ()
		if uv0.buff_list_data and next(uv0.buff_list_data) ~= nil then
			uv1:openBattleBuffListView(true, uv0.buff_list_data, uv0.data.group, uv0.data.object_bid)
		end
	end)
end

function BattleBuffInfoItem.setData(slot0, slot1)
	slot0.data = slot1 or {}
	slot2 = HeroVo.New()

	if Config.PartnerData.data_partner_base[slot1.object_bid] then
		slot2.bid = slot1.object_bid
		slot2.star = slot1.star
	elseif Config.UnitData.data_unit(slot1.object_bid) then
		slot2.bid = tonumber(slot3.head_icon)

		if slot3.star and slot3.star > 0 then
			slot2.star = slot3.star
		elseif Config.PartnerData.data_partner_base[slot2.bid] then
			slot2.star = slot4.init_star
		end

		slot2.master_head_id = slot2.bid
	end

	slot2.camp_type = slot1.camp_type
	slot2.lev = slot1.lev
	slot2.use_skin = slot1.fashion
	slot2.resonate_lev = slot1.crystal

	slot0.hero_head:setData(slot2)

	if not slot1.is_die then
		slot0.hero_head:showStrTips(false)
	else
		slot0.hero_head:showStrTips(true, TI18N("已阵亡"), {
			c3b = cc.c3b(255, 255, 255)
		})
	end

	slot3 = {}
	slot4 = {}

	for slot8, slot9 in pairs(slot1.buff_list) do
		if Config.SkillData.data_get_buff[slot9.bid].icon ~= nil and slot11 ~= 0 and (slot0.data.hp > 0 or slot10.clean_when_dead and slot10.clean_when_dead == "false") then
			if slot3[slot11] == nil then
				slot3[slot11] = {
					num = 0,
					res_id = slot11,
					name = slot10.name,
					remain_round = slot9.remain_round,
					desc = slot10.desc,
					buff_infos = {}
				}
			end

			if slot3[slot11].num == 0 or slot10.join_type and slot10.join_type ~= 3 then
				slot3[slot11].num = slot3[slot11].num + 1

				uv0(slot3[slot11].buff_infos, {
					buff_id = slot9.bid,
					remain_round = slot9.remain_round,
					group = slot10.group,
					group_pro = slot10.group_pro
				})

				if slot10.group then
					slot4[slot10.group] = true
				end
			elseif slot10.join_type and slot10.join_type == 3 and slot10.group then
				if slot4[slot10.group] then
					for slot15, slot16 in pairs(slot3[slot11].buff_infos or {}) do
						if slot16.group == slot10.group then
							if slot16.group_pro < slot10.group_pro or slot16.group_pro == slot10.group_pro and slot9.bid < slot16.buff_id then
								slot16.buff_id = slot9.bid
								slot16.remain_round = slot9.remain_round
								slot16.group_pro = slot10.group_pro
							end

							break
						end
					end
				else
					slot4[slot10.group] = true
					slot3[slot11].num = slot3[slot11].num + 1

					uv0(slot3[slot11].buff_infos, {
						buff_id = slot9.bid,
						remain_round = slot9.remain_round,
						group = slot10.group,
						group_pro = slot10.group_pro
					})
				end
			end
		end
	end

	slot0.buff_list_data = {}

	for slot8, slot9 in pairs(slot3) do
		uv0(slot0.buff_list_data, slot9)
	end

	table.sort(slot0.buff_list_data, function (slot0, slot1)
		return slot0.res_id < slot1.res_id
	end)

	slot8 = slot0.buff_list_data
	slot9 = slot0.data.group

	uv1:updateBattleBuffListView(slot8, slot9, slot0.data.object_bid)

	for slot8, slot9 in pairs(slot0.buff_list_item) do
		if slot9.icon then
			slot9.icon:setVisible(false)
		end
	end

	slot6 = 85

	if slot0.role_dir == uv2.Right then
		slot5 = slot0.size.width - 110
	end

	slot7 = 5
	slot8 = 5
	slot9 = cc.size(33, 32)

	for slot13, slot14 in ipairs(slot0.buff_list_data) do
		if slot13 <= 8 then
			if slot0.buff_list_item[slot13] == nil then
				slot0.buff_list_item[slot13] = slot0:createBuffItem()
			end

			slot15.icon:setVisible(true)
			slot15.label:setString(slot14.num)

			slot16 = math.ceil(slot13 / 4)

			if slot13 % 4 == 0 then
				slot17 = 4
			end

			slot18 = slot5 + (slot17 - 1) * (slot9.width + slot7) + slot9.width / 2

			if slot0.role_dir == uv2.Right then
				slot18 = slot5 - (slot17 - 1) * (slot9.width + slot7) - slot9.width / 2
			end

			slot15.icon:setPosition(cc.p(slot18, slot6 - (slot16 - 1) * (slot9.height + slot7) - slot9.height / 2))

			if slot15.path ~= PathTool.getBigBuffRes(slot14.res_id) then
				slot15.path = slot21

				loadSpriteTexture(slot15.icon, slot21, LOADTEXT_TYPE)
			end
		end
	end
end

function BattleBuffInfoItem.createBuffItem(slot0)
	slot2 = createSprite(nil, 0, 0, slot0.container, cc.p(0.5, 0.5), nil, 5)

	slot2:setCascadeOpacityEnabled(true)

	slot3 = createLabel(14, Config.ColorData.data_color4[1], nil, 30, 0, 0, slot2)

	slot3:setAnchorPoint(1, 0)
	slot3:enableOutline(Config.ColorData.data_color4[2], 1)

	return {
		icon = slot2,
		label = slot3,
		path = ""
	}
end

function BattleBuffInfoItem.DeleteMe(slot0)
	if slot0.hero_head then
		slot0.hero_head:DeleteMe()

		slot0.hero_head = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
