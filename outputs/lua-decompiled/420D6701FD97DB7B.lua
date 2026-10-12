EscortChallengeWindow = EscortChallengeWindow or BaseClass(BaseView)
slot1 = EscortController:getInstance():getModel()
slot2 = table.insert

function EscortChallengeWindow.__init(slot0, slot1)
	slot0.is_full_screen = false
	slot0.challenge_type = slot1
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.partner_list = {}
	slot0.item_list = {}
	slot0.layout_name = "escort/escort_challenge_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("escort", "escort"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("form", "form"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_52"),
			type = ResourcesType.single
		}
	}
end

function EscortChallengeWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 2)

	slot2 = slot1:getChildByName("main_panel")

	slot2:getChildByName("name_title"):setString(TI18N("玩家名字:"))
	slot2:getChildByName("guild_title"):setString(TI18N("公会:"))
	slot2:getChildByName("power_title"):setString(TI18N("战斗力:"))
	slot2:getChildByName("form_title"):setString(TI18N("对方阵容"))
	slot2:getChildByName("server_title"):setString(TI18N("服务器:"))

	slot0.close_btn = slot2:getChildByName("close_btn")
	slot0.challenge = slot2:getChildByName("challenge")

	if slot0.challenge_type == EscortConst.challenge_type.revenge then
		slot0.challenge:getChildByName("label"):setString(TI18N("立即复仇"))
		slot2:getChildByName("title"):setString(TI18N("复仇成功奖励"))
		slot2:getChildByName("win_title"):setString(TI18N("复仇"))
		slot2:getChildByName("times_title"):setString(TI18N("今日复仇次数:"))
	else
		slot0.challenge:getChildByName("label"):setString(TI18N("立即击退"))
		slot2:getChildByName("title"):setString(TI18N("击退成功奖励"))
		slot2:getChildByName("win_title"):setString(TI18N("击退"))
		slot2:getChildByName("times_title"):setString(TI18N("今日击退次数:"))
	end

	slot0.form_icon = slot2:getChildByName("form_icon")
	slot0.times_value = slot2:getChildByName("times_value")
	slot0.name_value = slot2:getChildByName("name_value")
	slot0.guild_value = slot2:getChildByName("guild_value")
	slot0.power_value = slot2:getChildByName("power_value")
	slot0.form_value = slot2:getChildByName("form_value")
	slot0.server_value = slot2:getChildByName("server_value")
	slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head:setPosition(146, 606)
	slot0.role_head:setLev(99)
	slot2:addChild(slot0.role_head)

	slot0.main_width = slot2:getContentSize().width
	slot0.main_panel = slot2
end

function EscortChallengeWindow.register_event(slot0)
	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0:openEscortChallengeWindow(false)
			end
		end)
	end

	if slot0.challenge then
		slot0.challenge:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if uv0.data then
					uv1:requestAtkPlunderPlayer(uv0.data.rid, uv0.data.srv_id, uv0.data.id)
				end
			end
		end)
	end
end

function EscortChallengeWindow.openRootWnd(slot0, slot1)
	slot0.data = slot1

	if slot1 then
		slot2 = 0
		slot3 = 0

		if slot0.challenge_type == EscortConst.challenge_type.revenge then
			slot2 = uv0:getMyCount(EscortConst.times_type.atk_back)
			slot3 = uv0:getMyMaxCount(EscortConst.times_type.atk_back)
		else
			slot2 = uv0:getMyCount(EscortConst.times_type.do_help)
			slot3 = uv0:getMyMaxCount(EscortConst.times_type.do_help)
		end

		if slot3 - slot2 < 0 then
			slot2 = 0
		end

		slot0.times_value:setString(slot2 .. "/" .. slot3)
		slot0:createBaseInfo()
		slot0:createFormList()
		slot0:createRewardsList()
	end
end

function EscortChallengeWindow.createBaseInfo(slot0)
	if slot0.data == nil then
		return
	end

	slot0.role_head:setHeadRes(slot0.data.face)
	slot0.role_head:setLev(slot0.data.lev)

	if slot0.data.guild_name == "" then
		slot0.guild_value:setString(TI18N("暂无"))
	else
		slot0.guild_value:setString(slot0.data.guild_name)
	end

	slot0.power_value:setString(slot0.data.power)
	slot0.name_value:setString(slot0.data.name)
	slot0.server_value:setString(getServerName(slot0.data.srv_id))

	if (slot0.data.formation_type or 1) and Config.FormationData.data_form_data[slot1] then
		slot0.form_value:setString(slot3.name .. "Lv." .. (slot0.data.formation_lev or 1 or 0))
		loadSpriteTexture(slot0.form_icon, PathTool.getResFrame("form", "form_icon_" .. slot1), LOADTEXT_TYPE_PLIST)
	end
end

function EscortChallengeWindow.createFormList(slot0)
	if slot0.data == nil then
		return
	end

	if slot0.data.p_list and next(slot1) then
		slot0.partner_list = {}
		slot3 = #slot1
		slot6 = nil

		for slot10, slot11 in ipairs(slot1) do
			slot6 = HeroExhibitionItem.new(1, false)

			slot6:setPosition((slot0.main_width - (slot3 * 104 + (slot3 - 1) * 10)) / 2 + 52 + (slot10 - 1) * (104 + slot2), 380)
			slot6:setData(slot11)
			slot0.main_panel:addChild(slot6)
			uv0(slot0.partner_list, slot6)
		end
	end
end

function EscortChallengeWindow.createRewardsList(slot0)
	if slot0.data == nil then
		return
	end

	if Config.EscortData.data_rewards(getNorKey(slot0.data.quality, slot0.data.lev)) == nil or slot1.plunder_award == nil then
		return
	end

	slot2 = DeepCopy(slot1.plunder_award)
	slot3 = 1

	if slot0.challenge_type == EscortConst.challenge_type.repel then
		if Config.EscortData.data_const.request_reward and slot4.val then
			slot3 = slot4.val * 0.001
		end
	elseif Config.EscortData.data_const.revenge_reward and slot4.val then
		slot3 = slot4.val * 0.001
	end

	for slot7, slot8 in ipairs(slot2) do
		if slot8[2] then
			slot8[2] = math.floor(slot8[2] * slot3)
		end
	end

	slot0.item_list = {}
	slot5 = 1

	if (uv0:isDoubleTimes() or false) == true then
		slot5 = 2
	end

	slot6 = nil
	slot9 = 0
	slot11 = #slot2
	slot12 = nil
	slot15 = Config.ItemData.data_assets_id2label

	for slot19, slot20 in ipairs(slot2) do
		if slot20[1] and slot20[2] then
			if Config.ItemData.data_get_data(slot20[1]) then
				slot6 = BackPackItem.new(false, true, false, slot7, false, true)

				slot6:setBaseData(slot21, slot20[2] * slot5)
				slot6:setPosition((slot0.main_width - (slot11 * BackPackItem.Width * 0.9 + (slot11 - 1) * 40)) / 2 + (BackPackItem.Width * slot7 + slot8) * (slot19 - 1) + BackPackItem.Width * slot7 * 0.5, 180)
				slot6:setDoubleIcon(slot4)
				slot0.main_panel:addChild(slot6)
				uv1(slot0.item_list, slot6)
			end
		end
	end
end

function EscortChallengeWindow.close_callback(slot0)
	if slot0.role_head then
		slot0.role_head:DeleteMe()

		slot0.role_head = nil
	end

	for slot4, slot5 in ipairs(slot0.partner_list) do
		slot5:DeleteMe()
	end

	slot0.partner_list = nil

	for slot4, slot5 in ipairs(slot0.item_list) do
		slot5:DeleteMe()
	end

	slot0.item_list = nil

	uv0:openEscortChallengeWindow(false)
end
