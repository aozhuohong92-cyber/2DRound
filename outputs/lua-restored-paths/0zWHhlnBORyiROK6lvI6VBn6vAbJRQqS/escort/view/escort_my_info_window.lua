EscortMyInfoWindow = EscortMyInfoWindow or BaseClass(BaseView)
slot1 = EscortController:getInstance():getModel()
slot2 = GameNet:getInstance()
slot3 = RoleController:getInstance():getRoleVo()
slot4 = HeroController:getInstance():getModel()
slot5 = table.insert
slot6 = string.format
slot7 = table.sort

function EscortMyInfoWindow.__init(slot0)
	slot0.is_full_screen = false
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.layout_name = "escort/escort_my_info_window"
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
	slot0.assets_icon = 0
	slot0.assets_num = 0
	slot0.partner_list = {}
	slot0.item_list = {}
end

function EscortMyInfoWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 1)

	slot2 = slot1:getChildByName("main_panel")

	slot2:getChildByName("win_title"):setString(TI18N("我的信息"))
	slot2:getChildByName("title"):setString(TI18N("雇佣奖励"))
	slot2:getChildByName("name_title"):setString(TI18N("玩家名字:"))
	slot2:getChildByName("guild_title"):setString(TI18N("公会:"))
	slot2:getChildByName("power_title"):setString(TI18N("战斗力:"))
	slot2:getChildByName("form_title"):setString(TI18N("我的阵容"))

	slot0.close_btn = slot2:getChildByName("close_btn")
	slot0.finish_btn = slot2:getChildByName("finish_btn")
	slot0.finish_btn_label = createRichLabel(24, 1, cc.p(0.5, 0.5), cc.p(115, 33))

	slot0.finish_btn:addChild(slot0.finish_btn_label)

	slot0.form_icon = slot2:getChildByName("form_icon")
	slot0.item_name = slot2:getChildByName("item_name")
	slot0.time = slot2:getChildByName("time")
	slot0.name_value = slot2:getChildByName("name_value")
	slot0.guild_value = slot2:getChildByName("guild_value")
	slot0.power_value = slot2:getChildByName("power_value")
	slot0.form_value = slot2:getChildByName("form_value")
	slot0.main_width = slot2:getContentSize().width
	slot0.main_panel = slot2
	slot0.finish_config = DeepCopy(Config.EscortData.data_finish)

	uv0(slot0.finish_config, function (slot0, slot1)
		return slot1.end_time < slot0.end_time
	end)
end

function EscortMyInfoWindow.register_event(slot0)
	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0:openEscortMyInfoWindow(false)
			end
		end)
	end

	if slot0.finish_btn then
		slot0.finish_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if uv0.my_info and uv0.my_info.status == 1 then
					if uv0.my_info.end_time <= uv1:getTime() then
						uv2:requestGetEscortAwards()
					elseif uv0.assets_icon ~= 0 then
						CommonAlert.show(string.format(TI18N("是否花费 <img src=%s visible=true scale=0.5 />%s 快速完成本次护送?"), PathTool.getItemRes(uv0.assets_icon), uv0.assets_num), TI18N("确定"), function ()
							uv0:requestUseAssetsFinishEscort()
						end, TI18N("取消"), nil, CommonAlert.type.rich)
					end
				end
			end
		end)
	end
end

function EscortMyInfoWindow.openRootWnd(slot0)
	slot0.my_info = uv0:getMyInfo()

	if slot0.my_info then
		slot0:createBaseInfo()
		slot0:createMyFormList()
		slot0:createRewardsList()
		slot0:createTimeTicket()
	end
end

function EscortMyInfoWindow.clearTimeTicket(slot0)
	if slot0.time_ticket then
		slot0.time_ticket = GlobalTimeTicket:getInstance():remove(slot0.time_ticket)
		slot0.time_ticket = nil
	end
end

function EscortMyInfoWindow.createTimeTicket(slot0)
	if slot0.my_info == nil then
		return
	end

	if slot0.my_info.status == 1 then
		if slot0.my_info.end_time <= uv0:getTime() then
			slot0.finish_btn_label:setString(TI18N("领取奖励"))
			slot0.time:setVisible(false)
		else
			if slot0.time_ticket == nil then
				slot0.time_ticket = GlobalTimeTicket:getInstance():add(function ()
					uv0:timeTicketCount()
				end, 1)
			end

			slot0:timeTicketCount()
			slot0.time:setVisible(true)
		end
	end
end

function EscortMyInfoWindow.timeTicketCount(slot0)
	if slot0.my_info == nil then
		slot0:clearTimeTicket()

		return
	end

	if slot0.my_info.end_time - uv0:getTime() <= 0 then
		slot0:clearTimeTicket()
		slot0.finish_btn_label:setString(TI18N("领取奖励"))
		slot0.time:setVisible(false)
	else
		slot0.time:setString(uv1(TI18N("剩余时间:%s"), TimeTool.GetTimeFormat(slot1)))
		slot0:setCanUseAssets(slot1)
	end
end

function EscortMyInfoWindow.setCanUseAssets(slot0, slot1)
	slot2 = nil

	for slot6, slot7 in ipairs(slot0.finish_config) do
		if slot7.end_time <= slot1 then
			slot2 = slot7

			break
		end
	end

	if slot2 == nil or slot2.expend == nil or slot2.expend[1] == nil or slot2.expend[1][1] == nil or slot2.expend[1][2] == nil then
		return
	end

	if slot0.assets_config == slot2.expend[1] then
		return
	end

	slot0.assets_config = slot2.expend[1]
	slot4 = slot0.assets_config[2]

	if Config.ItemData.data_get_data(slot0.assets_config[1]) then
		slot0.assets_icon = slot5.icon
		slot0.assets_num = slot4

		slot0.finish_btn_label:setString(string.format("<img src=%s visible=true scale=0.35 />,<div fontColor=#ffffff fontsize=24 outline=1,#C45A14>%s %s</div>", PathTool.getItemRes(slot5.icon), slot4, TI18N("立即完成")))
	end
end

function EscortMyInfoWindow.createBaseInfo(slot0)
	if slot0.my_info == nil then
		return
	end

	if Config.EscortData.data_baseinfo[slot0.my_info.quality] then
		slot0.item_name:setString(slot1.title)

		if EscortConst.quality_color[slot0.my_info.quality] then
			slot0.item_name:setTextColor(slot2)
		end

		if slot0.player == nil then
			slot0.player = createEffectSpine(slot1.res, cc.p(142, 588), cc.p(0.5, 0.5), true, PlayerAction.action_1)

			slot0.player:setScale(0.9)
			slot0.main_panel:addChild(slot0.player)
		end
	end

	if uv0.gid == 0 then
		slot0.guild_value:setString(TI18N("暂无"))
	else
		slot0.guild_value:setString(uv0.gname)
	end

	slot0.power_value:setString(uv0.power)
	slot0.name_value:setString(uv0.name)
end

function EscortMyInfoWindow.createMyFormList(slot0)
	if uv0:getMyPosList() and next(slot1) then
		slot2 = {}

		for slot6, slot7 in pairs(slot1) do
			if uv0:getHeroById(slot7.id) then
				uv1(slot2, slot8)
			end
		end

		slot0.partner_list = {}

		if next(slot2) then
			slot4 = #slot2
			slot7 = nil

			for slot11, slot12 in ipairs(slot2) do
				slot7 = HeroExhibitionItem.new(1, false)

				slot7:setPosition((slot0.main_width - (slot4 * 104 + (slot4 - 1) * 10)) / 2 + 52 + (slot11 - 1) * (104 + slot3), 410)
				slot7:setData(slot12)
				slot0.main_panel:addChild(slot7)
				uv1(slot0.partner_list, slot7)
			end
		end
	end
end

function EscortMyInfoWindow.createRewardsList(slot0)
	if slot0.my_info == nil or slot0.my_info.quality == nil then
		return
	end

	if Config.EscortData.data_rewards(getNorKey(slot0.my_info.quality, uv0.lev)) == nil or slot1.award == nil or slot1.plunder_award == nil then
		return
	end

	slot2 = slot0.my_info.plunder_count

	if slot0.my_info.quality == BackPackConst.quality.orange then
		slot2 = 0
	end

	slot3 = {}

	if slot2 ~= 0 then
		for slot7, slot8 in ipairs(slot1.plunder_award) do
			if slot8[1] and slot8[2] then
				slot3[slot8[1]] = slot8[2] * slot2
			end
		end
	end

	slot0.item_list = {}
	slot5 = 1

	if (uv1:isDoubleTimes() or false) == true then
		slot5 = 2
	end

	slot6 = nil
	slot9 = 0
	slot11 = #slot1.award
	slot12 = nil
	slot15 = Config.ItemData.data_assets_id2label

	for slot19, slot20 in ipairs(slot1.award) do
		if slot20[1] and slot20[2] then
			if Config.ItemData.data_get_data(slot20[1]) then
				slot6 = BackPackItem.new(false, true, false, slot7, false, true)

				slot6:setBaseData(slot21)
				slot6:setPosition((slot0.main_width - (slot11 * BackPackItem.Width * 0.9 + (slot11 - 1) * 40)) / 2 + (BackPackItem.Width * slot7 + slot8) * (slot19 - 1) + BackPackItem.Width * slot7 * 0.5, 218)
				slot0.main_panel:addChild(slot6)
				table.insert(slot0.item_list, slot6)

				if slot3[slot21] then
					slot6:setExtendDesc(true, slot20[2] * slot5 - slot23 * slot5 .. "(-" .. _num .. ")", 183)
				else
					slot6:setExtendDesc(true, slot22, 175)
				end

				slot6:setDoubleIcon(slot4)
			end
		end
	end
end

function EscortMyInfoWindow.close_callback(slot0)
	slot0:clearTimeTicket()

	for slot4, slot5 in ipairs(slot0.partner_list) do
		slot5:DeleteMe()
	end

	slot0.partner_list = nil

	for slot4, slot5 in ipairs(slot0.item_list) do
		slot5:DeleteMe()
	end

	slot0.item_list = nil

	uv0:openEscortMyInfoWindow(false)
end
