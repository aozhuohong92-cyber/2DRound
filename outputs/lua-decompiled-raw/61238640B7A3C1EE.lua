ArenaLoopChallengeBuffWindow = ArenaLoopChallengeBuffWindow or BaseClass(BaseView)

function ArenaLoopChallengeBuffWindow.__init(slot0)
	slot0.ctrl = ArenaController:getInstance()
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.ctrl = ArenaController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.win_type = WinType.Mini
	slot0.item_list = {}
	slot0.layout_name = "arena/arena_loop_challenge_buff_window"
end

function ArenaLoopChallengeBuffWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 2)

	slot0.close_btn = slot0.container:getChildByName("close_btn")
	slot0.effect_container = slot0.container:getChildByName("effect_container")
	slot0.title = slot0.effect_container:getChildByName("title")

	slot0.title:setString(TI18N("当前效果"))

	slot0.con_win = slot0.effect_container:getChildByName("con_win")

	slot0.con_win:setString(string.format(TI18N("已连胜%s次"), 10))

	slot0.explain_container = slot0.container:getChildByName("explain_container")
	slot0.explain_title = slot0.explain_container:getChildByName("title")

	slot0.explain_title:setString(TI18N("连胜效果说明"))

	slot0.buff_item = slot0.container:getChildByName("buff_item")

	slot0.buff_item:setVisible(false)

	slot0.scroll_view = slot0.explain_container:getChildByName("scroll_view")

	slot0.scroll_view:setScrollBarEnabled(false)

	slot0.scroll_size = slot0.scroll_view:getContentSize()
end

function ArenaLoopChallengeBuffWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			ArenaController:getInstance():openLoopChallengeBuffWindow(false)
		end
	end)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			ArenaController:getInstance():openLoopChallengeBuffWindow(false)
		end
	end)
end

function ArenaLoopChallengeBuffWindow.openRootWnd(slot0)
	if next(slot0.item_list) == nil then
		slot1 = Config.ArenaData.data_continue_list_length
		slot8 = cc.size

		slot0.scroll_view:setInnerContainerSize(slot8(slot0.scroll_size.width, math.max(slot1 * 54 + (slot1 + 1) * 8, slot0.scroll_size.height)))

		for slot8, slot9 in ipairs(Config.ArenaData.data_continue_list) do
			slot11 = ArenaLoopChallengeBuffItem.new(slot0.buff_item:clone())

			slot11:setData(slot9)
			slot0.scroll_view:addChild(slot11)

			slot0.item_list[slot8] = slot11

			slot11:setPosition(slot0.scroll_size.width * 0.5, slot4 - (slot8 - 1) * (slot2 + slot3) - (slot2 * 0.5 + slot3))
		end
	end

	slot0:setCurEffect()
end

function ArenaLoopChallengeBuffWindow.setCurEffect(slot0)
	if ArenaController:getInstance():getModel():getMyLoopData() ~= nil then
		if slot1.cont_win > 0 then
			slot0.con_win:setString(string.format(TI18N("已连胜%s次"), slot1.cont_win))

			if slot0.my_buff_desc == nil then
				slot0.my_buff_desc = createRichLabel(22, cc.c3b(169, 95, 15), cc.p(0, 0.5), cc.p(130, 30), nil, , 260)

				slot0.effect_container:addChild(slot0.my_buff_desc)
			end

			slot0.my_buff_desc:setVisible(true)

			slot2 = ""

			if Config.BuffData.data_get_buff_data[slot1.buffid] ~= nil then
				slot2 = string.format("<img src=%s visible=true scale=1 /><div>%s</div>  ", PathTool.getBuffRes(slot3.icon), slot3.des)
			end

			slot4 = ""

			if Config.ArenaData.data_continue[slot1.cont_win] ~= nil then
				for slot9, slot10 in ipairs(slot5.items) do
					if slot4 ~= "" then
						slot4 = slot4 .. " "
					end

					slot4 = string.format("%s<img src=%s visible=true scale=0.5 /><div fontcolor=#289b14 fontsize=22>X%s</div>", slot4, PathTool.getItemRes(slot10[1]), slot10[2])
				end
			end

			slot0.my_buff_desc:setString(slot2 .. slot4)
		else
			slot0.con_win:setString(TI18N("暂无连胜纪录"))

			if slot0.my_buff_desc ~= nil then
				slot0.my_buff_desc:setVisible(false)
			end
		end
	end
end

function ArenaLoopChallengeBuffWindow.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.item_list) do
		slot5:DeleteMe()
	end

	slot0.item_list = nil

	slot0.ctrl:openLoopChallengeBuffWindow(false)
end

ArenaLoopChallengeBuffItem = class("ArenaLoopChallengeBuffItem", function ()
	return ccui.Layout:create()
end)

function ArenaLoopChallengeBuffItem.ctor(slot0, slot1)
	slot0.node = slot1
	slot0.size = slot0.node:getContentSize()

	slot0:setContentSize(slot0.size)
	slot0:setAnchorPoint(0.5, 0.5)
	slot0:addChild(slot0.node)
	slot0.node:setVisible(true)
	slot0.node:setPosition(0, 0)

	slot0.desc = slot0.node:getChildByName("desc")

	slot0:registerEvent()
end

function ArenaLoopChallengeBuffItem.registerEvent(slot0)
end

function ArenaLoopChallengeBuffItem.setData(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0.data = slot1

	slot0.desc:setString(string.format(TI18N("连胜%s次"), slot1.num))

	if slot0.my_buff_desc == nil then
		slot0.my_buff_desc = createRichLabel(22, cc.c3b(169, 95, 15), cc.p(0, 0.5), cc.p(130, 30), nil, , 260)

		slot0.node:addChild(slot0.my_buff_desc)
	end

	slot0.my_buff_desc:setVisible(true)

	slot2 = ""

	if Config.BuffData.data_get_buff_data[slot1.buff] ~= nil then
		slot2 = string.format("<img src=%s visible=true scale=1 /><div>%s</div>", PathTool.getBuffRes(slot3.icon), slot3.des)
	end

	slot4 = ""

	if Config.ArenaData.data_continue[slot1.num] ~= nil then
		for slot9, slot10 in ipairs(slot5.items) do
			if slot4 ~= "" then
				slot4 = slot4 .. " "
			end

			slot4 = string.format("%s<img src=%s visible=true scale=0.5 /><div fontcolor=#289b14 fontsize=22>X%s</div>", slot4, PathTool.getItemRes(slot10[1]), slot10[2])
		end
	end

	slot0.my_buff_desc:setString(slot2 .. slot4)
end

function ArenaLoopChallengeBuffItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
