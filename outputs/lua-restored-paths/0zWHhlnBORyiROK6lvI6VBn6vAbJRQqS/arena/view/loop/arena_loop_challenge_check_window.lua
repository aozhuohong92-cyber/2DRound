ArenaLoopChallengeCheckWindow = ArenaLoopChallengeCheckWindow or BaseClass(BaseView)
slot0 = table.insert

function ArenaLoopChallengeCheckWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.ctrl = ArenaController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.win_type = WinType.Mini
	slot0.item_list = {}
	slot0.layout_name = "arena/arena_loop_challenge_check_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("arena", "arenaloop"),
			type = ResourcesType.plist
		}
	}
end

function ArenaLoopChallengeCheckWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.scroll_view = slot1:getChildByName("scroll_view")

	slot0.scroll_view:setScrollBarEnabled(false)

	slot0.scroll_size = slot0.scroll_view:getContentSize()
	slot0.challenge_btn = slot1:getChildByName("challenge_btn")
	slot0.challenge_btn_label = slot0.challenge_btn:getChildByName("label")

	slot0.challenge_btn_label:setString(TI18N("挑 战"))

	slot0.role_name = slot1:getChildByName("role_name")
	slot0.role_score = slot1:getChildByName("role_score")
	slot0.score_title = slot1:getChildByName("score_title")

	slot0.score_title:setString(TI18N("竞技场积分："))

	slot0.fight_label = CommonNum.new(20, slot1, 99999, -2, cc.p(0, 0.5))

	slot0.fight_label:setPosition(460, 280)

	slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head:setHeadLayerScale(0.95)
	slot0.role_head:setPosition(94, 323)
	slot1:addChild(slot0.role_head)

	slot0.container = slot1
end

function ArenaLoopChallengeCheckWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			ArenaController:getInstance():openCheckLoopChallengeRole(false)
		end
	end)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			ArenaController:getInstance():openCheckLoopChallengeRole(false)
		end
	end)
	slot0.challenge_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data ~= nil then
				ArenaController:getInstance():openCheckLoopChallengeRole(false)
				ArenaController:getInstance():requestFightWithLoopChallenge(uv0.data.rid, uv0.data.srv_id)
			end
		end
	end)
end

function ArenaLoopChallengeCheckWindow.openRootWnd(slot0, slot1)
	slot0.data = slot1

	if slot0.data ~= nil then
		slot0.role_name:setString(slot0.data.name)
		slot0.fight_label:setNum(slot0.data.power)
		slot0.role_head:setHeadRes(slot0.data.face, false, LOADTEXT_TYPE, slot0.data.face_file, slot0.data.face_update_time)
		slot0.role_head:setLev(slot0.data.lev)
		slot0.role_score:setString(slot0.data.score)
	end

	slot0:setCheckRoleHero()
end

function ArenaLoopChallengeCheckWindow.setCheckRoleHero(slot0)
	if slot0.data == nil or slot0.data.p_list == nil then
		return
	end

	slot1 = #slot0.data.p_list
	slot3 = (slot0.scroll_size.width - (slot1 * 104 + (slot1 - 1) * 6)) / 2
	slot4 = nil

	for slot8, slot9 in ipairs(slot0.data.p_list) do
		delayRun(slot0.container, 4 * slot8 / 60, function ()
			uv0 = HeroExhibitionItem.new(0.8, true)

			uv0:setPosition(uv1 + 52 + (uv2 - 1) * 110, uv3.scroll_size.height * 0.5)
			uv0:setData(uv4)
			uv0:addCallBack(function ()
				if uv0.data then
					ArenaController:getInstance():requestRabotInfo(uv0.data.rid, uv0.data.srv_id, uv1.pos)
				end
			end)
			uv3.scroll_view:addChild(uv0)
			uv5(uv3.item_list, uv0)
		end)
	end
end

function ArenaLoopChallengeCheckWindow.close_callback(slot0)
	doStopAllActions(slot0.container)

	if slot0.fight_label then
		slot0.fight_label:DeleteMe()

		slot0.fight_label = nil
	end

	for slot4, slot5 in pairs(slot0.item_list) do
		slot5:DeleteMe()
	end

	slot0.item_list = nil

	slot0.ctrl:openCheckLoopChallengeRole(false)
end
