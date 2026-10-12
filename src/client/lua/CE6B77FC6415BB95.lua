LevupgradeWindow = LevupgradeWindow or BaseClass(BaseView)
slot0 = LevupgradeController:getInstance()
slot1 = RoleController:getInstance():getRoleVo()
slot2 = string.format

function LevupgradeWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Tips
	slot0.layout_name = "levupgrade/lev_upgrade_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("levupgrade", "levupgrade"),
			type = ResourcesType.plist
		}
	}
	slot0.is_csb_action = true
	slot0.lev_list = {}
	slot0.item_list = {}
	slot0.can_touch = false
	slot0.auto_limit_time = 5
end

function LevupgradeWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.back_panel = slot0.main_container:getChildByName("back_panel")
	slot4 = "title_container"
	slot0.title_container = slot0.main_container:getChildByName(slot4)
	slot0.title_width = slot0.title_container:getContentSize().width
	slot0.title_height = slot0.title_container:getContentSize().height

	for slot4 = 1, 1 do
		if slot0.root_wnd:getChildByName("item_" .. slot4) then
			if slot4 == 1 then
				slot5:getChildByName("title"):setString(TI18N("船长等级"))
			elseif slot4 == 2 then
				slot6:setString(TI18N("英雄等级上限"))
			elseif slot4 == 3 then
				slot6:setString(TI18N("装备精炼上限"))
			end

			slot0.lev_list[slot4] = {
				last_lev = slot5:getChildByName("last_lev"),
				now_lev = slot5:getChildByName("now_lev")
			}
		end
	end

	slot0.award_container = slot0.root_wnd:getChildByName("award_container")

	slot0.award_container:getChildByName("award_title"):setString(TI18N("升级奖励"))

	slot0.extend_container = slot0.root_wnd:getChildByName("extend_container")
	slot0.extend_panel = slot0.extend_container:getChildByName("extend_panel")
	slot0.extend_icon = slot0.extend_panel:getChildByName("icon")
	slot0.extend_title = slot0.extend_panel:getChildByName("title")
	slot0.extend_desc = slot0.extend_panel:getChildByName("desc")
	slot0.extend_ext_desc = slot0.extend_panel:getChildByName("ext_desc")

	slot0.extend_panel:getChildByName("extend_title"):setString(TI18N("功能预告"))
end

function LevupgradeWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended and uv0.can_touch == true then
			uv0:onClickClose()
		end
	end)
end

function LevupgradeWindow.onClickClose(slot0)
	uv0:openMainWindow(false)
end

function LevupgradeWindow.openRootWnd(slot0, slot1)
	playOtherSound("c_get")
	slot0:handleEffect(true)
	slot0:starTimeTicket()

	slot2 = slot1.old_lev or 0

	if Config.RoleData.data_role_attr[slot1.lev or 0] then
		slot5 = slot0.lev_list[1]

		slot5.last_lev:setString(slot2)
		slot5.now_lev:setString(slot3)

		slot6 = {}

		for slot10 = slot2 + 1, slot3 do
			if Config.RoleData.data_role_attr[slot10] and slot11.reward then
				for slot15, slot16 in pairs(slot11.reward) do
					if slot16[1] then
						if slot6[slot16[1]] == nil then
							slot6[slot16[1]] = slot16[2]
						else
							slot6[slot16[1]] = slot6[slot16[1]] + slot16[2]
						end
					end
				end
			end
		end

		slot0.award_data = {}

		for slot10, slot11 in pairs(slot6) do
			table.insert(slot0.award_data, {
				slot10,
				slot11
			})
		end

		slot0:setAwardInfo()
		slot0:setExtendInfo(slot4)
	end
end

function LevupgradeWindow.setAwardInfo(slot0)
	if slot0.award_data == nil then
		return
	end

	for slot4, slot5 in pairs(slot0.item_list) do
		slot5:setVisible(false)
	end

	if slot0.award_data and next(slot0.award_data) ~= nil then
		slot4 = slot0.award_container:getContentSize().width / 2 - (#slot0.award_data - 1) * (20 / 2 + BackPackItem.Width * 1 / 2)

		for slot8, slot9 in ipairs(slot0.award_data) do
			if slot0.item_list[slot8] == nil then
				slot10 = BackPackItem.new(false, true, false, slot2, nil, true)

				slot10:setBaseData(slot9[1], slot9[2])
				slot0.award_container:addChild(slot10)

				slot0.item_list[slot8] = slot10
			end

			slot10:setVisible(true)
			slot10:setPosition(cc.p(slot4 + (slot8 - 1) * (slot1 + BackPackItem.Width * slot2), slot3.height / 2 - 25))
		end

		slot0.award_container:setVisible(true)
	else
		slot0.award_container:setVisible(false)
	end
end

function LevupgradeWindow.setExtendInfo(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot1.icon == "" then
		slot0.back_panel:setContentSize(cc.size(SCREEN_WIDTH, 349))
		slot0.extend_container:setVisible(false)
	else
		slot0.back_panel:setContentSize(cc.size(SCREEN_WIDTH, 519))

		slot0.res_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("bigbg/battledrama", slot1.icon), ResourcesType.single, function ()
			loadSpriteTexture(uv0.extend_icon, uv1, LOADTEXT_TYPE)
		end)

		slot0.extend_title:setString(slot1.title)
		slot0.extend_desc:setString(slot1.desc)
		slot0.extend_ext_desc:setString(slot1.ext_desc)
	end
end

function LevupgradeWindow.starTimeTicket(slot0)
	slot0.cut_time = 0

	if slot0.time_ticket == nil then
		slot0.time_ticket = GlobalTimeTicket:getInstance():add(function ()
			uv0.cut_time = uv0.cut_time + 0.5

			if uv0.cut_time > 0.5 then
				uv0.can_touch = true
			end

			if uv0.auto_limit_time <= uv0.cut_time then
				uv0:onClickClose()
			end
		end, 0.5)
	end
end

function LevupgradeWindow.clearTimeticket(slot0)
	if slot0.time_ticket then
		GlobalTimeTicket:getInstance():remove(slot0.time_ticket)

		slot0.time_ticket = nil
	end
end

function LevupgradeWindow.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0.title_container) and slot0.play_effect == nil then
		slot0.play_effect = createEffectSpine(PathTool.getEffectRes(274), cc.p(slot0.title_width * 0.5, slot0.title_height * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action_2)

		slot0.title_container:addChild(slot0.play_effect, 1)
	end
end

function LevupgradeWindow.close_callback(slot0)
	slot0:handleEffect(false)

	if slot0.res_load then
		slot0.res_load:DeleteMe()
	end

	slot0.res_load = nil
	slot4 = BattleEvent.NEXT_SHOW_RESULT_VIEW

	GlobalEvent:getInstance():Fire(slot4)
	slot0:clearTimeticket()

	for slot4, slot5 in pairs(slot0.item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	uv0:openMainWindow(false)
end
