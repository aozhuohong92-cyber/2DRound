LadderTopThreeWindow = LadderTopThreeWindow or BaseClass(BaseView)
slot1 = LadderController:getInstance():getModel()

function LadderTopThreeWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "ladder/ladder_top_three_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("ladder", "ladder"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("arena", "arenaenter"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_59"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_60"),
			type = ResourcesType.single
		}
	}
	slot0.state_list = {}
end

function LadderTopThreeWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 1)
	slot1:getChildByName("title_label"):setString(TI18N("英雄殿"))
	slot1:getChildByName("tips_label"):setString(TI18N("*每日点赞可获天梯积分奖励"))

	slot7 = "close_btn"
	slot0.close_btn = slot1:getChildByName(slot7)

	for slot7 = 1, 3 do
		slot8 = slot1:getChildByName(string.format("statue_%d", slot7))
		slot9 = slot8:getChildByName("desc")

		slot9:setString(TI18N("虚位以待"))

		slot10 = {
			model = slot8:getChildByName("model"),
			role_name = slot8:getChildByName("role_name"),
			guild_name = slot8:getChildByName("guild_name"),
			worship_btn = slot8:getChildByName("worship_btn")
		}
		slot10.label = slot10.worship_btn:getChildByName("label")
		slot10.btn_check = slot8:getChildByName("btn_check")
		slot10.desc = slot9
		slot10.worship_num = 0
		slot0.state_list[slot7] = slot10
	end
end

function LadderTopThreeWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0._onClickBtnClose), false, 2)

	slot4 = handler(slot0, slot0._onClickBtnClose)

	registerButtonEventListener(slot0.background, slot4, false, 2)

	for slot4 = 1, 3 do
		if slot0.state_list[slot4] and slot5.worship_btn then
			registerButtonEventListener(slot5.worship_btn, function ()
				uv0:_onClickBtnWorship(uv1)
			end, true)
		end

		if slot5 and slot5.btn_check then
			registerButtonEventListener(slot5.btn_check, function ()
				uv0:_onClickBtnCheck(uv1)
			end)
		end
	end

	if slot0.ladder_top_three_event == nil then
		slot0.ladder_top_three_event = GlobalEvent:getInstance():Bind(LadderEvent.UpdateLadderTopThreeRoleData, function (slot0)
			uv0:setData(slot0)
		end)
	end

	if slot0.update_worship_event == nil then
		slot0.update_worship_event = GlobalEvent:getInstance():Bind(RoleEvent.WorshipOtherRole, function (slot0, slot1, slot2)
			if slot2 ~= nil and uv0.state_list[slot2] then
				slot3 = uv0.state_list[slot2]
				slot3.worship_num = slot3.worship_num + 1

				slot3.label:setString(slot3.worship_num)
				slot3.worship_btn:setTouchEnabled(false)
				setChildUnEnabled(true, slot3.worship_btn, Config.ColorData.data_color4[1])
				slot3.label:enableOutline(cc.c3b(75, 75, 75), 2)
			end
		end)
	end
end

function LadderTopThreeWindow._onClickBtnWorship(slot0, slot1)
	if slot0:getRoleDataByRank(slot1) then
		RoleController:getInstance():requestWorshipRole(slot2.rid, slot2.srv_id, slot1, WorshipType.ladder)
	end
end

function LadderTopThreeWindow._onClickBtnCheck(slot0, slot1)
	if slot0:getRoleDataByRank(slot1) then
		FriendController:getInstance():openFriendCheckPanel(true, {
			srv_id = slot2.srv_id,
			rid = slot2.rid
		})
	end
end

function LadderTopThreeWindow.setData(slot0, slot1)
	slot0.data = slot1 or {}

	for slot5 = 1, 3 do
		slot6 = slot0.state_list[slot5]

		if slot0:getRoleDataByRank(slot5) then
			slot6.model:setVisible(true)
			slot6.role_name:setVisible(true)
			slot6.guild_name:setVisible(true)
			slot6.worship_btn:setVisible(true)
			slot6.btn_check:setVisible(true)
			slot6.desc:setVisible(false)
			slot6.role_name:setString(slot7.name)

			if not slot7.gname or slot8 == "" then
				slot8 = TI18N("暂无")
			end

			slot6.guild_name:setString(string.format(TI18N("公会:%s"), slot8))
			slot6.label:setString(slot7.worship)

			slot6.worship_num = slot7.worship

			if slot7.worship_status == 0 then
				setChildUnEnabled(false, slot6.worship_btn)
				slot6.worship_btn:setTouchEnabled(true)
			else
				setChildUnEnabled(true, slot6.worship_btn, Config.ColorData.data_color4[1])
				slot6.label:enableOutline(cc.c3b(75, 75, 75), 2)
				slot6.worship_btn:setTouchEnabled(false)
			end

			if slot6.role_model then
				slot6.role_model:DeleteMe()

				slot6.role_model = nil
			end

			if slot7.lookid then
				slot6.role_model = BaseRole.new(BaseRole.type.role, slot7.lookid)

				slot6.role_model:setAnimation(0, PlayerAction.show, true)
				slot6.role_model:setCascade(true)
				slot6.role_model:setScale(0.6)
				slot6.role_model:setPosition(cc.p(50, 0))
				slot6.model:addChild(slot6.role_model)
			end
		else
			slot6.model:setVisible(false)
			slot6.role_name:setVisible(false)
			slot6.guild_name:setVisible(false)
			slot6.worship_btn:setVisible(false)
			slot6.btn_check:setVisible(false)
			slot6.desc:setVisible(true)
		end
	end
end

function LadderTopThreeWindow.getRoleDataByRank(slot0, slot1)
	slot0.data = slot0.data or {}
	slot2 = nil

	for slot6, slot7 in pairs(slot0.data) do
		if slot7.rank == slot1 then
			slot2 = slot7

			break
		end
	end

	return slot2
end

function LadderTopThreeWindow._onClickBtnClose(slot0)
	uv0:openLadderTopThreeWindow(false)
end

function LadderTopThreeWindow.openRootWnd(slot0)
	uv0:requestTopThreeRoleData()
end

function LadderTopThreeWindow.close_callback(slot0)
	if slot0.ladder_top_three_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.ladder_top_three_event)

		slot0.ladder_top_three_event = nil
	end

	if slot0.update_worship_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_worship_event)

		slot0.update_worship_event = nil
	end

	for slot4, slot5 in pairs(slot0.state_list) do
		if slot5.role_model then
			slot5.role_model:DeleteMe()

			slot5.role_model = nil
		end
	end

	uv0:updateLadderRedStatus(LadderConst.RedType.TopThree, false)
	uv1:openLadderTopThreeWindow(false)
end
