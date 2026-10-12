EscortPlunderWindow = EscortPlunderWindow or BaseClass(BaseView)
slot1 = EscortController:getInstance():getModel()
slot2 = GameNet:getInstance()
slot3 = table.insert
slot4 = string.format
slot5 = table.sort

function EscortPlunderWindow.__init(slot0)
	slot0.is_full_screen = false
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.layout_name = "escort/escort_plunder_window"
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

function EscortPlunderWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 2)

	slot2 = slot1:getChildByName("main_panel")

	slot2:getChildByName("win_title"):setString(TI18N("掠夺信息"))
	slot2:getChildByName("title"):setString(TI18N("掠夺获得"))
	slot2:getChildByName("name_title"):setString(TI18N("玩家名字:"))
	slot2:getChildByName("guild_title"):setString(TI18N("公会:"))
	slot2:getChildByName("power_title"):setString(TI18N("战斗力:"))
	slot2:getChildByName("form_title"):setString(TI18N("对方阵容"))
	slot2:getChildByName("times_title"):setString(TI18N("掠夺次数:"))
	slot2:getChildByName("server_title"):setString(TI18N("服务器:"))

	slot0.close_btn = slot2:getChildByName("close_btn")
	slot0.plunder_btn = slot2:getChildByName("plunder_btn")

	slot0.plunder_btn:getChildByName("label"):setString(TI18N("我要掠夺"))

	slot0.form_icon = slot2:getChildByName("form_icon")
	slot0.item_name = slot2:getChildByName("item_name")
	slot0.times_value = slot2:getChildByName("times_value")
	slot0.name_value = slot2:getChildByName("name_value")
	slot0.guild_value = slot2:getChildByName("guild_value")
	slot0.power_value = slot2:getChildByName("power_value")
	slot0.form_value = slot2:getChildByName("form_value")
	slot0.server_value = slot2:getChildByName("server_value")
	slot0.main_width = slot2:getContentSize().width
	slot0.main_panel = slot2
end

function EscortPlunderWindow.register_event(slot0)
	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0:openEscortPlunderWindow(false)
			end
		end)
	end

	if slot0.plunder_btn then
		slot0.plunder_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if uv0.data then
					uv1:requestPlunderEscort(uv0.data.rid, uv0.data.srv_id)
				end
			end
		end)
	end
end

function EscortPlunderWindow.openRootWnd(slot0, slot1)
	slot0.data = slot1

	if slot1 then
		slot0:createBaseInfo()
		slot0:createFormList()
		slot0:createRewardsList()
	end

	if uv0:getMyInfo() then
		if uv0:getMyMaxCount(EscortConst.times_type.plunder) - uv0:getMyCount(EscortConst.times_type.plunder) < 0 then
			slot4 = 0
		end

		slot0.times_value:setString(slot4 .. "/" .. slot3)
	end
end

function EscortPlunderWindow.createBaseInfo(slot0)
	if slot0.data == nil then
		return
	end

	if Config.EscortData.data_baseinfo[slot0.data.quality] then
		slot0.item_name:setString(slot1.title)

		if EscortConst.quality_color[slot0.data.quality] then
			slot0.item_name:setTextColor(slot2)
		end

		if slot0.player == nil then
			slot0.player = createEffectSpine(slot1.res, cc.p(142, 588), cc.p(0.5, 0.5), true, PlayerAction.action_1)

			slot0.player:setScale(0.9)
			slot0.main_panel:addChild(slot0.player)
		end
	end

	if slot0.data.guild_name == "" then
		slot0.guild_value:setString(TI18N("暂无"))
	else
		slot0.guild_value:setString(slot0.data.guild_name)
	end

	slot0.server_value:setString(getServerName(slot0.data.srv_id))
	slot0.power_value:setString(slot0.data.power)
	slot0.name_value:setString(slot0.data.name)

	if (slot0.data.formation_type or 1) and Config.FormationData.data_form_data[slot2] then
		slot0.form_value:setString(slot4.name .. "Lv." .. (slot0.data.formation_lev or 1 or 0))
		loadSpriteTexture(slot0.form_icon, PathTool.getResFrame("form", "form_icon_" .. slot2), LOADTEXT_TYPE_PLIST)
	end
end

function EscortPlunderWindow.createFormList(slot0)
	if slot0.data == nil then
		return
	end

	if slot0.data.p_list and next(slot1) then
		slot0.partner_list = {}
		slot3 = #slot1
		slot6 = nil

		for slot10, slot11 in ipairs(slot1) do
			slot6 = HeroExhibitionItem.new(1, false)

			slot6:setPosition((slot0.main_width - (slot3 * 104 + (slot3 - 1) * 10)) / 2 + 52 + (slot10 - 1) * (104 + slot2), 410)
			slot6:setData(slot11)
			slot0.main_panel:addChild(slot6)
			uv0(slot0.partner_list, slot6)
		end
	end
end

function EscortPlunderWindow.createRewardsList(slot0)
	if slot0.data == nil then
		return
	end

	if Config.EscortData.data_rewards(getNorKey(slot0.data.quality, slot0.data.lev)) and slot1.plunder_award then
		slot0.item_list = {}
		slot3 = 1

		if (uv0:isDoubleTimes() or false) == true then
			slot3 = 2
		end

		slot4 = nil
		slot7 = 0
		slot9 = #slot1.plunder_award
		slot10 = nil
		slot13 = Config.ItemData.data_assets_id2label

		for slot17, slot18 in ipairs(slot1.plunder_award) do
			if slot18[1] and slot18[2] then
				if Config.ItemData.data_get_data(slot18[1]) then
					slot4 = BackPackItem.new(false, true, false, slot5, false, true)

					slot4:setBaseData(slot19, slot18[2] * slot3)
					slot4:setPosition((slot0.main_width - (slot9 * BackPackItem.Width * 0.9 + (slot9 - 1) * 40)) / 2 + (BackPackItem.Width * slot5 + slot6) * (slot17 - 1) + BackPackItem.Width * slot5 * 0.5, 212)
					slot4:setDoubleIcon(slot2)
					slot0.main_panel:addChild(slot4)
					table.insert(slot0.item_list, slot4)
				end
			end
		end
	end
end

function EscortPlunderWindow.close_callback(slot0)
	for slot4, slot5 in ipairs(slot0.partner_list) do
		slot5:DeleteMe()
	end

	slot0.partner_list = nil

	for slot4, slot5 in ipairs(slot0.item_list) do
		slot5:DeleteMe()
	end

	slot0.item_list = nil

	uv0:openEscortPlunderWindow(false)
end
