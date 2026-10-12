BattleHarmInfoView = BattleHarmInfoView or BaseClass(BaseView)
slot0 = BattleController:getInstance()
slot1 = {
	Harm = 1,
	Cure = 2
}
slot2 = {
	Left = 1,
	Right = 2
}

function BattleHarmInfoView.__init(slot0, slot1)
	slot0.win_type = WinType.Mini
	slot0.layout_name = "battle/battle_harm_info_view"
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
	slot0.tab_list = {}
	slot0.left_role_list = {}
	slot0.right_role_list = {}
end

function BattleHarmInfoView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")
	slot0.left_name_label = slot1:getChildByName("left_name_label")
	slot0.right_name_label = slot1:getChildByName("right_name_label")
	slot0.left_role_panel = slot1:getChildByName("left_role_panel")
	slot0.right_role_panel = slot1:getChildByName("right_role_panel")
	slot0.close_btn = slot1:getChildByName("close_btn")

	slot0.close_btn:getChildByName("label"):setString(TI18N("确  定"))

	for slot7 = 1, 2 do
		slot8 = {
			tab_btn = slot9,
			label = slot9:getChildByName("title"),
			index = slot7
		}

		if slot1:getChildByName("tab_container"):getChildByName("tab_btn_" .. slot7) then
			slot0.tab_list[slot7] = slot8

			if slot7 == 1 then
				slot10:setString(TI18N("伤害量"))

				slot0.tab_object = slot8
			elseif slot7 == 2 then
				slot10:setString(TI18N("治疗量"))
			end
		end
	end

	slot4 = {
		TI18N("第1场"),
		TI18N("第2场"),
		TI18N("第3场"),
		TI18N("第4场"),
		TI18N("第5场")
	}
	slot8 = "tab_btn"
	slot0.tab_btn_obj = slot1:getChildByName(slot8)
	slot0.head_tab_list = {}

	for slot8 = 1, 5 do
		slot9 = {
			btn = slot10,
			index = slot8,
			select_bg = slot10:getChildByName("select_img")
		}

		slot9.select_bg:setVisible(false)

		slot9.title = slot0.tab_btn_obj:getChildByName("tab_btn_" .. slot8):getChildByName("label")

		if slot4[slot8] then
			slot9.title:setString(slot4[slot8])
		end

		slot9.is_hide = true

		slot9.btn:setVisible(false)

		slot0.head_tab_list[slot8] = slot9
	end
end

function BattleHarmInfoView.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0._onClickCloseBtn), true, 2)

	slot4 = handler(slot0, slot0._onClickCloseBtn)
	slot5 = false

	registerButtonEventListener(slot0.background, slot4, slot5, 2)

	for slot4, slot5 in pairs(slot0.tab_list) do
		if slot5.tab_btn then
			slot5.tab_btn:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					playTabButtonSound()
					uv0:changeSelectedTab(uv1.index)
				end
			end)
		end
	end

	for slot4, slot5 in ipairs(slot0.head_tab_list) do
		registerButtonEventListener(slot5.btn, function ()
			uv0:changeSelectedHeadTab(uv1.index)
		end, false, 2)
	end
end

function BattleHarmInfoView.openRootWnd(slot0, slot1, slot2)
	if slot2 then
		slot0:initHeadTabInfo(slot1)
	else
		slot0:setData(slot1)
		slot0.tab_btn_obj:setVisible(false)
	end
end

function BattleHarmInfoView.initHeadTabInfo(slot0, slot1)
	if #slot1 > 1 then
		slot0.data_list = slot1
		slot6 = true

		slot0.tab_btn_obj:setVisible(slot6)

		for slot6 = 1, slot2 do
			if slot0.head_tab_list[slot6] then
				slot0.head_tab_list[slot6].btn:setVisible(true)

				if slot1[slot6] and slot1[slot6].round then
					slot0.head_tab_list[slot6].title:setString(string.format(TI18N("第%d场"), slot1[slot6].round))
				end
			end
		end

		slot0:changeSelectedHeadTab(1)
	else
		slot0.tab_btn_obj:setVisible(false)
		slot0:setData(slot1[1])
	end
end

function BattleHarmInfoView.setData(slot0, slot1)
	if slot1 and slot1.hurt_statistics then
		slot0.data = slot1

		slot0.left_name_label:setString(slot1.atk_name or RoleController:getInstance():getRoleVo().name)
		slot0.right_name_label:setString(slot1.target_role_name or slot1.def_name or "")

		slot4 = {}
		slot5 = {}

		for slot9, slot10 in pairs(slot1.hurt_statistics) do
			if slot10.type == 1 then
				slot4 = slot10.partner_hurts
			elseif slot10.type == 2 then
				slot5 = slot10.partner_hurts
			end
		end

		slot7 = 0

		for slot11, slot12 in pairs(slot4) do
			if 0 < slot12.dps then
				slot6 = slot12.dps
			end

			if slot7 < slot12.cure then
				slot7 = slot12.cure
			end
		end

		slot9 = 0

		for slot13, slot14 in pairs(slot5) do
			if 0 < slot14.dps then
				slot8 = slot14.dps
			end

			if slot9 < slot14.cure then
				slot9 = slot14.cure
			end
		end

		for slot13, slot14 in pairs(slot0.left_role_list) do
			slot14:setVisible(false)
		end

		for slot13, slot14 in pairs(slot0.right_role_list) do
			slot14:setVisible(false)
		end

		slot10 = slot0.left_role_panel:getContentSize().height
		slot11 = 0

		for slot15, slot16 in ipairs(slot4) do
			delayRun(slot0.left_role_panel, slot15 * 4 / display.DEFAULT_FPS, function ()
				if uv0.left_role_list[uv1] == nil then
					slot0 = BattleHarmInfoItem.new(uv2.Left, uv3.vedio_id, uv3.srv_id, uv3.combat_type)
					uv0.left_role_list[uv1] = slot0

					uv0.left_role_panel:addChild(slot0)
				end

				slot0:setVisible(true)
				slot0:setPosition(cc.p(0, uv4 - (uv1 - 1) * (slot0:getContentSize().height + uv5)))
				slot0:setData(uv6, uv7, uv8)
			end)
		end

		for slot15, slot16 in ipairs(slot5) do
			delayRun(slot0.right_role_panel, slot15 * 4 / display.DEFAULT_FPS, function ()
				if uv0.right_role_list[uv1] == nil then
					slot0 = BattleHarmInfoItem.new(uv2.Right, uv3.vedio_id, uv3.srv_id, uv3.combat_type)
					uv0.right_role_list[uv1] = slot0

					uv0.right_role_panel:addChild(slot0)
				end

				slot0:setVisible(true)
				slot0:setPosition(cc.p(0, uv4 - (uv1 - 1) * (slot0:getContentSize().height + uv5)))
				slot0:setData(uv6, uv7, uv8)
			end)
		end
	end
end

function BattleHarmInfoView.changeSelectedTab(slot0, slot1)
	if slot0.tab_object and slot0.tab_object.index == slot1 then
		return
	end

	if slot0.tab_object then
		slot0.tab_object.tab_btn:loadTextures(PathTool.getResFrame("battleharm", "battleharm_1004"), "", "", LOADTEXT_TYPE_PLIST)
		slot0.tab_object.tab_btn:setCapInsets(cc.rect(12, 20, 1, 1))
		slot0.tab_object.label:setTextColor(cc.c4b(245, 224, 185))

		slot0.tab_object = nil
	end

	slot0.tab_object = slot0.tab_list[slot1]

	if slot0.tab_object then
		slot0.tab_object.tab_btn:loadTextures(PathTool.getResFrame("battleharm", "battleharm_1003"), "", "", LOADTEXT_TYPE_PLIST)
		slot0.tab_object.tab_btn:setCapInsets(cc.rect(12, 20, 1, 1))
		slot0.tab_object.label:setTextColor(cc.c4b(105, 55, 5))
	end

	for slot5, slot6 in ipairs(slot0.left_role_list) do
		slot6:updateHarmType(slot1)
	end

	for slot5, slot6 in ipairs(slot0.right_role_list) do
		slot6:updateHarmType(slot1)
	end
end

function BattleHarmInfoView.changeSelectedHeadTab(slot0, slot1)
	if slot0.cur_tab_index == slot1 then
		return
	end

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.select_bg:setVisible(false)
	end

	slot0.cur_tab_index = slot1
	slot0.cur_tab = slot0.head_tab_list[slot0.cur_tab_index]

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.select_bg:setVisible(true)
	end

	if slot0.data_list and slot0.data_list[slot1] then
		slot0.left_role_panel:stopAllActions()
		slot0.right_role_panel:stopAllActions()
		slot0:setData(slot0.data_list[slot1])
	end
end

function BattleHarmInfoView._onClickCloseBtn(slot0)
	uv0:openBattleHarmInfoView(false)
end

function BattleHarmInfoView.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.left_role_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	for slot4, slot5 in pairs(slot0.right_role_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	uv0:openBattleHarmInfoView(false)
end

BattleHarmInfoItem = class("BattleHarmInfoItem", function ()
	return ccui.Widget:create()
end)

function BattleHarmInfoItem.ctor(slot0, slot1, slot2, slot3, slot4)
	slot0.role_dir = slot1 or uv0.Left
	slot0.vedio_id = slot2 or 0
	slot0.srv_id = slot3
	slot0.combat_type = slot4

	slot0:configUI()
	slot0:register_event()
end

function BattleHarmInfoItem.configUI(slot0)
	slot0.size = cc.size(300, 99)

	slot0:setTouchEnabled(false)
	slot0:setAnchorPoint(cc.p(0, 1))
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("battle/battle_harm_info_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")
	slot0.progress_bg = slot2:getChildByName("progress_bg")
	slot0.progress = slot0.progress_bg:getChildByName("progress")

	slot0.progress:setScale9Enabled(true)
	slot0.progress:setPercent(0)

	slot0.progress_value = slot0.progress_bg:getChildByName("progress_value")

	slot0.progress_value:setString(0)

	slot0.image_mvp = slot2:getChildByName("image_mvp")

	slot0.image_mvp:setVisible(false)

	slot0.hero_head = HeroExhibitionItem.new(0.7, true)

	slot0.hero_head:addCallBack(handler(slot0, slot0._onClickHeroCallBack))
	slot2:addChild(slot0.hero_head)

	if slot0.role_dir == uv0.Left then
		slot0.hero_head:setPosition(cc.p(50, slot0.size.height / 2))
		slot0.image_mvp:setPosition(cc.p(270, 72))
		slot0.progress_bg:setPosition(cc.p(100, 40))
		slot0.progress_value:setAnchorPoint(cc.p(0, 0.5))
		slot0.progress_value:setPositionX(0)
		slot0.progress:setPositionX(0)
		slot0.progress:setScaleX(1)
	else
		slot0.hero_head:setPosition(cc.p(slot0.size.width - 50, slot0.size.height / 2))
		slot0.image_mvp:setPosition(cc.p(slot0.size.width - 254, 72))
		slot0.progress_bg:setPosition(cc.p(slot0.size.width - 184 - 100, 40))
		slot0.progress_value:setAnchorPoint(cc.p(1, 0.5))
		slot0.progress_value:setPositionX(184)
		slot0.progress:setPositionX(184)
		slot0.progress:setScaleX(-1)
	end
end

function BattleHarmInfoItem.register_event(slot0)
end

function BattleHarmInfoItem._onClickHeroCallBack(slot0)
	if slot0.data and slot0.data.id and slot0.vedio_id and slot0.vedio_id ~= 0 then
		VedioController:getInstance():requestVedioHeroData(slot0.vedio_id, slot0.data.id, slot0.role_dir, slot0.srv_id, slot0.combat_type)
	elseif slot0.data and slot0.data.rid and slot0.data.rid ~= 0 and slot0.data.srvid and slot0.data.srvid ~= "" and slot0.data.id then
		if RoleController:getInstance():getRoleVo().rid == slot0.data.rid and slot1.srv_id == slot0.data.srvid then
			HeroController:getInstance():openHeroTipsPanel(true, HeroController:getInstance():getModel():getHeroById(slot0.data.id))
		else
			LookController:getInstance():sender11061(slot0.data.rid, slot0.data.srvid, slot0.data.id)
		end
	else
		message(TI18N("该英雄来自异域，无法查看"))
	end
end

function BattleHarmInfoItem.setData(slot0, slot1, slot2, slot3)
	slot0.data = slot1
	slot4 = HeroVo.New()

	if Config.PartnerData.data_partner_base[slot1.bid] then
		slot4.bid = slot1.bid
		slot4.star = slot1.star
	elseif Config.UnitData.data_unit(slot1.bid) then
		slot4.bid = tonumber(slot5.head_icon)
		slot4.master_head_id = slot4.bid

		if slot5.star and slot5.star > 0 then
			slot4.star = slot5.star
		elseif Config.PartnerData.data_partner_base[slot4.bid] then
			slot4.star = slot6.init_star
		end
	end

	slot4.camp_type = slot1.camp_type
	slot4.lev = slot1.lev

	if slot1.ext_data then
		for slot8, slot9 in ipairs(slot1.ext_data) do
			if slot9.key == 5 then
				slot4.use_skin = slot9.val
			end
		end
	end

	slot0.hero_head:setData(slot4)

	slot0.max_harm_val = slot2
	slot0.max_cure_val = slot3

	slot0:updateHarmType()
end

function BattleHarmInfoItem.updateHarmType(slot0, slot1)
	if slot0.data then
		slot0.harm_type = slot1 or uv0.Harm
		slot0.total_val = 0
		slot0.cur_val = 0

		if slot0.harm_type == uv0.Harm then
			slot0.image_mvp:setVisible(slot0.data.dps > 0 and slot0.data.dps == slot0.max_harm_val)

			slot0.total_val = slot0.max_harm_val
			slot0.cur_val = slot0.data.dps
		else
			slot0.image_mvp:setVisible(slot0.data.cure > 0 and slot0.data.cure == slot0.max_cure_val)

			slot0.total_val = slot0.max_cure_val
			slot0.cur_val = slot0.data.cure
		end

		slot0.temp_add = slot0.cur_val / 50
		slot0.temp_harm_val = 0

		slot0.progress:setPercent(0)
		slot0.progress_value:setString(slot0.cur_val)
		slot0:openProgressTimer(false)
		slot0:openProgressTimer(true)
	end
end

function BattleHarmInfoItem.openProgressTimer(slot0, slot1)
	if slot1 == true then
		if slot0.progress_timer == nil then
			slot0.progress_timer = GlobalTimeTicket:getInstance():add(function ()
				uv0.temp_harm_val = uv0.temp_harm_val + uv0.temp_add

				if uv0.temp_harm_val < uv0.cur_val then
					uv0.progress:setPercent(uv0.temp_harm_val / uv0.total_val * 100)
				else
					uv0.progress:setPercent(uv0.cur_val / uv0.total_val * 100)
					GlobalTimeTicket:getInstance():remove(uv0.progress_timer)

					uv0.progress_timer = nil
				end
			end, 0.01)
		end
	elseif slot0.progress_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.progress_timer)

		slot0.progress_timer = nil
	end
end

function BattleHarmInfoItem.DeleteMe(slot0)
	if slot0.hero_head then
		slot0.hero_head:DeleteMe()

		slot0.hero_head = nil
	end

	slot0:openProgressTimer(false)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
