ArenaChampionMyMatchReadyPanel = class("ArenaChampionMyMatchReadyPanel", function ()
	return ccui.Layout:create()
end)
slot0 = string.format
slot1 = GameNet:getInstance()

function ArenaChampionMyMatchReadyPanel.ctor(slot0, slot1)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("arena/arena_champion_my_match_ready_panel"))
	slot0.view_type = slot1 or ArenaConst.champion_type.normal

	if slot0.view_type == ArenaConst.champion_type.normal then
		slot0.ctrl = ArenaController:getInstance()
		slot0.model = slot0.ctrl:getChampionModel()
	else
		slot0.ctrl = CrosschampionController:getInstance()
		slot0.model = slot0.ctrl:getModel()
	end

	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot2

	slot2:getChildByName("info_panel"):setLocalZOrder(1)

	slot0.left_img = slot2:getChildByName("left_img")

	slot0.left_img:ignoreContentAdaptWithSize(true)

	slot0.right_img = slot2:getChildByName("right_img")

	slot0.right_img:ignoreContentAdaptWithSize(true)

	if slot0.view_type == ArenaConst.champion_type.normal then
		slot0.resource_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_46"), ResourcesType.single, function ()
			uv0.left_img:loadTexture(uv1, LOADTEXT_TYPE)
			uv0.right_img:loadTexture(uv1, LOADTEXT_TYPE)
		end)

		slot0.left_img:setVisible(true)
		slot0.right_img:setVisible(true)
		slot0:handleFlagEffect(false)
	else
		slot0.left_img:setVisible(false)
		slot0.right_img:setVisible(false)
		slot0:handleFlagEffect(true)
	end

	slot0.image_title = slot3:getChildByName("Image_3")

	slot0.image_title:ignoreContentAdaptWithSize(true)

	if slot0.view_type == ArenaConst.champion_type.normal then
		slot0.image_title:loadTexture(PathTool.getResFrame("arena", "arenachampion_1004", false, "arenachampion"), LOADTEXT_TYPE_PLIST)
	else
		slot0.image_title:loadTexture(PathTool.getResFrame("arena", "arenachampion_1033", false, "arenachampion"), LOADTEXT_TYPE_PLIST)
	end

	slot0.notice_label = slot3:getChildByName("notice_label")
	slot0.extend_desc = createRichLabel(24, cc.c4b(255, 243, 145, 255), cc.p(0, 1), cc.p(92, 228), 2, nil, 278)

	slot3:addChild(slot0.extend_desc)

	if slot0.view_type == ArenaConst.champion_type.normal then
		if Config.ArenaChampionData.data_const.battle_members then
			slot0.need_rank_index = slot4.val
		else
			slot0.need_rank_index = 128
		end
	elseif Config.ArenaClusterChampionData.data_const.battle_members then
		slot0.need_rank_index = slot4.val
	else
		slot0.need_rank_index = 256
	end
end

function ArenaChampionMyMatchReadyPanel.handleFlagEffect(slot0, slot1)
	if slot1 == false then
		if slot0.flag_effect then
			slot0.flag_effect:clearTracks()
			slot0.flag_effect:removeFromParent()

			slot0.flag_effect = nil
		end
	elseif not tolua.isnull(slot0.container) and slot0.flag_effect == nil then
		slot0.flag_effect = createEffectSpine(Config.EffectData.data_effect_info[1321], cc.p(222, -23), cc.p(0.5, 0.5), true, PlayerAction.action)

		slot0.container:addChild(slot0.flag_effect)
	end
end

function ArenaChampionMyMatchReadyPanel.addToParent(slot0, slot1)
	slot0:setVisible(slot1)

	if slot1 == false then
		slot0:clearTimeTicket()
	end
end

function ArenaChampionMyMatchReadyPanel.clearTimeTicket(slot0)
	if slot0.time_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.time_ticket)

		slot0.time_ticket = nil
	end
end

function ArenaChampionMyMatchReadyPanel.updateInfo(slot0)
	if slot0.model:getMyMatchStatus() == ArenaConst.champion_my_status.in_match then
		return
	end

	if slot1 == ArenaConst.champion_my_status.unopened then
		if slot0.view_type == ArenaConst.champion_type.normal then
			slot0.notice_label:setString(TI18N("本次冠军赛尚未开启"))
		else
			slot0.notice_label:setString(TI18N("本次周冠军赛尚未开启"))
		end

		if slot0.time_ticket == nil then
			slot0.time_ticket = GlobalTimeTicket:getInstance():add(function ()
				uv0:countDownTimeTicket()
			end, 1)
		end

		slot0:countDownTimeTicket()
	elseif slot1 == ArenaConst.champion_my_status.unjoin then
		if slot0.view_type == ArenaConst.champion_type.normal then
			slot0.notice_label:setString(TI18N("您未能参与本次冠军赛"))
		else
			slot0.notice_label:setString(TI18N("您未能参与本次周冠军赛"))
		end

		str = uv0(TI18N("可前往竞猜界面参与竞猜玩法，各种稀有道具等你来兑换"))

		slot0.extend_desc:setString(str)
	end
end

function ArenaChampionMyMatchReadyPanel.countDownTimeTicket(slot0)
	if slot0.model:getBaseInfo() == nil then
		slot0:clearTimeTicket()

		return
	end

	if slot1.step_status_time - uv0:getTime() < 0 then
		slot2 = 0

		slot0:clearTimeTicket()
	end

	slot3 = uv1(TI18N("开启倒计时:<div fontColor=#66e734 >%s</div>\n竞技场排名前<div fontColor=#66e734 >%s名</div>的玩家将自动参与"), TimeTool.GetTimeFormat(slot2), slot0.need_rank_index)

	if slot0.view_type == ArenaConst.champion_type.cross then
		slot3 = uv1(TI18N("开启倒计时:<div fontColor=#66e734 >%s</div>\n跨服天梯前<div fontColor=#66e734 >%s名</div>的玩家将自动参与"), TimeTool.GetTimeFormat(slot2), slot0.need_rank_index)
	end

	slot0.extend_desc:setString(slot3)
end

function ArenaChampionMyMatchReadyPanel.DeleteMe(slot0)
	slot0:clearTimeTicket()
	slot0:handleFlagEffect(false)

	if slot0.resource_load then
		slot0.resource_load:DeleteMe()

		slot0.resource_load = nil
	end
end
