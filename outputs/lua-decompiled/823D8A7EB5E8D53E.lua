ElitematchPersonalInfoPanel = ElitematchPersonalInfoPanel or BaseClass(BaseView)
slot0 = ElitematchController:getInstance()
slot1 = string.format
slot2 = table.insert
slot3 = table.sort

function ElitematchPersonalInfoPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "elitematch/elitematch_personal_info_panel"
	slot0.res_list = {}
	slot0.record_data = nil
	slot0.personal_record_list = {}
end

function ElitematchPersonalInfoPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot5 = 2

	slot0:playEnterAnimatianByObj(slot0.main_container, slot5)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.tab_container = slot0.main_panel:getChildByName("tab_container")
	slot1 = {
		TI18N("总战绩"),
		TI18N("赛季战绩")
	}
	slot0.tab_list = {}

	for slot5 = 1, 2 do
		if slot0.tab_container:getChildByName("tab_btn_" .. slot5) then
			slot7 = {
				select_bg = slot6:getChildByName("select_bg")
			}

			slot7.select_bg:setVisible(false)

			slot7.unselect_bg = slot6:getChildByName("unselect_bg")
			slot7.title = slot6:getChildByName("title")

			slot7.title:setTextColor(cc.c4b(207, 181, 147, 255))

			if slot1[slot5] then
				slot7.title:setString(slot1[slot5])
			end

			slot7.tab_btn = slot6
			slot7.index = slot5
			slot0.tab_list[slot5] = slot7
		end
	end

	slot0.title = slot0.main_panel:getChildByName("win_title")
	slot7 = "个人战绩"

	slot0.title:setString(TI18N(slot7))

	slot0.panel = slot0.main_panel:getChildByName("panel")
	slot2 = {
		TI18N("当前段位:"),
		TI18N("历史最高段位:"),
		TI18N("所在赛区:"),
		TI18N("常规赛胜场:"),
		TI18N("常规赛胜率:"),
		TI18N("单场最高伤害:"),
		TI18N("mvp次数最多英雄:")
	}
	slot3 = {
		TI18N("当前积分:"),
		TI18N("历史最高积分:"),
		TI18N("赛季排名:"),
		TI18N("王者赛胜场:"),
		TI18N("王者赛胜率:"),
		TI18N("最大连胜场数:"),
		TI18N("最强对手:")
	}
	slot0.left_value_list = {}
	slot0.right_value_list = {}

	for slot7 = 1, 7 do
		if slot2[slot7] then
			slot0.panel:getChildByName("key_label_" .. slot7):setString(slot2[slot7])
		end

		if slot3[slot7] then
			slot0.panel:getChildByName("key_label_right_" .. slot7):setString(slot3[slot7])
		end

		if slot7 ~= 7 then
			slot0.left_value_list[slot7] = slot0.panel:getChildByName("key_value_" .. slot7)
			slot0.right_value_list[slot7] = slot0.panel:getChildByName("key_value_right_" .. slot7)
		end
	end

	slot0.hero_name = slot0.panel:getChildByName("hero_name")
	slot0.player_name = slot0.panel:getChildByName("player_name")
	slot0.team_name1 = slot0.panel:getChildByName("team_name1")

	slot0.team_name1:setString(TI18N("队1"))

	slot0.team_name2 = slot0.panel:getChildByName("team_name2")

	slot0.team_name2:setString(TI18N("队2"))

	slot0.team_power1 = slot0.panel:getChildByName("team_power1")
	slot0.team_power2 = slot0.panel:getChildByName("team_power2")
	slot0.match_name = slot0.panel:getChildByName("match_name")
	slot0.panel_bg_1_1_0 = slot0.panel:getChildByName("panel_bg_1_1_0")
	slot0.Image_32 = slot0.panel:getChildByName("Image_32")
	slot0.Image_33 = slot0.panel:getChildByName("Image_33")
	slot0.Sprite_16 = slot0.panel:getChildByName("Sprite_16")
	slot0.Sprite_17 = slot0.panel:getChildByName("Sprite_17")
	slot0.hero_no_tips = slot0.panel:getChildByName("hero_no_tips")

	slot0.hero_no_tips:setString(TI18N("暂无"))

	slot0.player_no_tips = slot0.panel:getChildByName("player_no_tips")

	slot0.player_no_tips:setString(TI18N("暂无"))

	slot0.left_btn = slot0.main_panel:getChildByName("left_btn")
	slot0.right_btn = slot0.main_panel:getChildByName("right_btn")
	slot0.comfirm_btn = slot0.main_panel:getChildByName("comfirm_btn")

	slot0.comfirm_btn:getChildByName("label"):setString(TI18N("分享"))

	slot0.hero_item = HeroExhibitionItem.new(0.9, false)

	slot0.hero_item:setPosition(132, 70)
	slot0.panel:addChild(slot0.hero_item)

	slot0.player_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.player_head:setPosition(386, 76)
	slot0.panel:addChild(slot0.player_head)
end

function ElitematchPersonalInfoPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.left_btn, handler(slot0, slot0.onClickBtnLeft), true, 1)
	registerButtonEventListener(slot0.right_btn, handler(slot0, slot0.onClickBtnRight), true, 1)

	function slot4(slot0, slot1)
		uv0:onClickBtnComfirm(slot1:convertToWorldSpace(cc.p(0.5, 0.5)))
	end

	slot5 = true

	registerButtonEventListener(slot0.comfirm_btn, slot4, slot5, 1)

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

	slot0.player_head:addCallBack(function ()
		if not uv0.rid then
			return
		end

		if uv0.rid == 0 then
			return
		end

		FriendController:getInstance():openFriendCheckPanel(true, {
			srv_id = uv0.srv_id,
			rid = uv0.rid
		})
	end)
	slot0:addGlobalEvent(ElitematchEvent.Elite_Personal_Info_Event, function (slot0)
		if not slot0 then
			return
		end

		if slot0.period == 0 then
			uv0.record_data = slot0

			if uv0.index == 1 then
				uv0:initPanel(slot0)
			end
		else
			uv0.personal_record_list[slot0.period] = slot0

			if uv0.index == 2 and slot0.period == uv0.select_period then
				uv0:initPanel(slot0)
			end
		end
	end)
	slot0:addGlobalEvent(ElitematchEvent.Elite_Personal_Info_Event2, function (slot0)
		if not slot0 then
			return
		end

		if slot0.period == 0 then
			uv0.record_data = slot0

			if uv0.index == 1 then
				uv0:initPanel(slot0)
			end
		else
			uv0.personal_record_list[slot0.period] = slot0

			if uv0.index == 2 and slot0.period == uv0.select_period then
				uv0:initPanel(slot0)
			end
		end
	end)
end

function ElitematchPersonalInfoPanel.onClickBtnClose(slot0)
	uv0:openElitematchPersonalInfoPanel(false)
end

function ElitematchPersonalInfoPanel.onClickBtnComfirm(slot0, slot1)
	HeroController:getInstance():openHeroSharePanel(true, slot1, function (slot0, slot1)
		if not slot0 then
			return
		end

		if uv0.root_wnd and not tolua.isnull(uv0.root_wnd) then
			if slot0 == HeroConst.ShareBtnType.eHeroShareCross then
				uv1:sender24941(ChatConst.Channel.Cross)
			elseif slot0 == HeroConst.ShareBtnType.eHeroShareWorld then
				uv1:sender24941(ChatConst.Channel.World)
			elseif slot0 == HeroConst.ShareBtnType.eHeroShareGuild then
				uv1:sender24941(ChatConst.Channel.Gang)
			end
		end
	end, {
		offsetx = 230,
		offsety = 60
	})
end

function ElitematchPersonalInfoPanel.onClickBtnLeft(slot0)
	if not slot0.select_period then
		return
	end

	slot0.select_period = slot0.select_period - 1

	if slot0.select_period <= 1 then
		slot0.select_period = 1
	end

	slot0:setTitle(slot0.select_period)
	slot0:setBtnShowStatus()
	slot0:updateData()
end

function ElitematchPersonalInfoPanel.onClickBtnRight(slot0)
	if not slot0.select_period then
		return
	end

	slot0.select_period = slot0.select_period + 1

	if slot0.max_period <= slot0.select_period then
		slot0.select_period = slot0.max_period
	end

	slot0:setTitle(slot0.select_period)
	slot0:setBtnShowStatus()
	slot0:updateData()
end

function ElitematchPersonalInfoPanel.setBtnShowStatus(slot0)
	if not slot0.select_period then
		return
	end

	if slot0.max_period == 1 then
		slot0.left_btn:setVisible(false)
		slot0.right_btn:setVisible(false)

		return
	end

	if slot0.select_period == 1 then
		slot0.left_btn:setVisible(false)
		slot0.right_btn:setVisible(true)
	elseif slot0.select_period == slot0.max_period then
		slot0.left_btn:setVisible(true)
		slot0.right_btn:setVisible(false)
	else
		slot0.left_btn:setVisible(true)
		slot0.right_btn:setVisible(true)
	end
end

function ElitematchPersonalInfoPanel.changeSelectedTab(slot0, slot1)
	if slot0.tab_object ~= nil and slot0.tab_object.index == slot1 then
		return
	end

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(false)
		slot0.tab_object.title:setTextColor(cc.c4b(207, 181, 147, 255))

		slot0.tab_object = nil
	end

	slot0.tab_object = slot0.tab_list[slot1]

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(true)
		slot0.tab_object.title:setTextColor(cc.c4b(255, 237, 214, 255))
	end

	slot0.index = slot1

	if not slot0.select_period then
		return
	end

	if slot1 == 1 then
		slot0:setTitle()
		slot0.left_btn:setVisible(false)
		slot0.right_btn:setVisible(false)

		if slot0.record_data == nil then
			slot0:senderProto(0)
		else
			slot0:initPanel(slot0.record_data)
		end
	else
		slot0:setTitle(slot0.select_period)
		slot0:setBtnShowStatus()
		slot0:updateData()
	end
end

function ElitematchPersonalInfoPanel.senderProto(slot0, slot1)
	if slot0.is_share then
		if not slot0.id then
			return
		end

		if not slot0.share_srv_id then
			return
		end

		uv0:sender24942(slot0.id, slot0.share_srv_id, slot1)
	else
		uv0:sender24940(slot1)
	end
end

function ElitematchPersonalInfoPanel.openRootWnd(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if slot2 then
		slot0.id = slot2.id
		slot0.share_srv_id = slot2.share_srv_id
		slot0.is_share = true
	end

	slot0.max_period = slot1
	slot0.select_period = slot1

	slot0:setTitle(slot1)

	if slot1 == 0 then
		slot0:changeSelectedTab(1)
	else
		slot0:changeSelectedTab(2)
	end

	if slot0.is_share then
		slot0.comfirm_btn:setVisible(false)
	end
end

function ElitematchPersonalInfoPanel.updateData(slot0)
	if not slot0.select_period then
		return
	end

	if slot0.personal_record_list[slot0.select_period] then
		slot0:initPanel(slot0.personal_record_list[slot0.select_period])
	else
		slot0:senderProto(slot0.select_period)
	end
end

function ElitematchPersonalInfoPanel.setTitle(slot0, slot1)
	slot2 = nil

	slot0.match_name:setString((slot1 ~= nil or TI18N("总战绩")) and uv0(TI18N("第S%s赛季"), slot1))
end

function ElitematchPersonalInfoPanel.initPanel(slot0, slot1)
	if Config.ArenaEliteData.data_elite_level[slot1.my_elite_lev] then
		slot0.left_value_list[1]:setString(slot2.name)
	else
		slot0.left_value_list[1]:setString(TI18N("暂无"))
	end

	if Config.ArenaEliteData.data_elite_level[slot1.max_lev] then
		slot0.left_value_list[2]:setString(slot3.name)
	end

	slot0.left_value_list[4]:setString(slot1.combat_win_count1)

	slot4 = nil
	slot4 = (slot1.combat_all_count1 == 0 or math.floor(slot1.combat_win_count1 * 100 / slot1.combat_all_count1)) and 0

	if slot1.log_zone_id == 0 then
		slot0.left_value_list[3]:setString(TI18N("无"))
	elseif Config.ArenaEliteData.data_zone[slot1.log_zone_id] then
		slot0.left_value_list[3]:setString(slot5.name .. TI18N("赛区"))
	else
		slot0.left_value_list[3]:setString(TI18N("无"))
	end

	if slot1.log_rank == 0 then
		slot0.right_value_list[3]:setString(TI18N("无"))
	else
		slot0.right_value_list[3]:setString(slot1.log_rank)
	end

	slot0.left_value_list[5]:setString(slot4 .. "%")
	slot0.left_value_list[6]:setString(slot1.max_dps)
	slot0.right_value_list[1]:setString(slot1.my_score)
	slot0.right_value_list[2]:setString(slot1.max_score)
	slot0.right_value_list[4]:setString(slot1.combat_win_count2)
	slot0.right_value_list[5]:setString(((slot1.combat_all_count2 == 0 or math.floor(slot1.combat_win_count2 * 100 / slot1.combat_all_count2)) and 0) .. "%")
	slot0.right_value_list[6]:setString(slot1.winning_streak)
	slot0.team_power1:setString("0")
	slot0.team_power2:setString("0")

	for slot8, slot9 in ipairs(slot1.power) do
		if slot9.order == 1 then
			slot0.team_power1:setString(slot9.power)
		else
			slot0.team_power2:setString(slot9.power)
		end
	end

	if Config.PartnerData.data_partner_base[slot1.best_mvp] then
		slot0.hero_name:setVisible(true)
		slot0.hero_item:setVisible(true)
		slot0.hero_no_tips:setVisible(false)

		slot6 = slot5.init_star or 1

		if slot1.use_skin and slot1.use_skin ~= 0 then
			if Config.PartnerSkinData.data_skin_info[slot1.use_skin] then
				slot0.hero_item:setHeadImg(slot7.head_id)
			end
		elseif Config.PartnerData.data_partner_star(getNorKey(slot5.bid, slot6)) then
			slot0.hero_item:setHeadImg(slot8.head_id)
		end

		slot0.hero_item:setQualityImg(slot5.init_star)
		slot0.hero_item:setCampImg(slot5.camp_type)
		slot0.hero_name:setString(slot5.name)
	else
		slot0.hero_name:setVisible(false)
		slot0.hero_item:setVisible(false)
		slot0.hero_no_tips:setVisible(true)
	end

	if slot1.name == nil or slot1.name == "" then
		slot0:setRightVisible(false)

		slot0.rid = 0
	else
		slot0.rid = slot1.rid
		slot0.srv_id = slot1.srv_id

		slot0:setRightVisible(true)
		slot0.player_name:setString(uv0("[%s]%s", getServerName(slot1.srv_id), slot1.name))
		slot0.player_head:setHeadRes(slot1.face, false, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)
		slot0.player_head:setLev(slot1.lev)
	end
end

function ElitematchPersonalInfoPanel.setRightVisible(slot0, slot1)
	slot0.panel_bg_1_1_0:setVisible(slot1)
	slot0.Image_32:setVisible(slot1)
	slot0.Image_33:setVisible(slot1)
	slot0.Sprite_16:setVisible(slot1)
	slot0.Sprite_17:setVisible(slot1)
	slot0.player_head:setVisible(slot1)
	slot0.player_name:setVisible(slot1)
	slot0.team_power1:setVisible(slot1)
	slot0.team_power2:setVisible(slot1)
	slot0.team_name1:setVisible(slot1)
	slot0.team_name2:setVisible(slot1)
	slot0.player_no_tips:setVisible(not slot1)
end

function ElitematchPersonalInfoPanel.close_callback(slot0)
	uv0:openElitematchPersonalInfoPanel(false)
end
