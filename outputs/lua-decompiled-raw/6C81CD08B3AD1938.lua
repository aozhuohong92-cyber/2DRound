AdventureEvtFighterGuessWindow = AdventureEvtFighterGuessWindow or BaseClass(BaseView)
slot0 = AdventureController:getInstance()

function AdventureEvtFighterGuessWindow.__init(slot0, slot1)
	slot0.win_type = WinType.Mini
	slot0.data = slot1
	slot0.config = slot1.config
	slot0.layout_name = "adventure/adventure_finger_guessing_view"
	slot0.is_full_screen = false
	slot0.is_use_csb = false
	slot0.item_list = {}
	slot0.ext_list = {}
	slot0.btn_list = {}
	slot0.item_btn = {}
	slot0.cur_btn_index = nil
	slot0.cur_item_index = nil
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("adventure", "adventure"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_22"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_21"),
			type = ResourcesType.single
		}
	}
end

function AdventureEvtFighterGuessWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("root")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.role_bg = slot0.main_container:getChildByName("role_bg")
	slot0.bg = slot0.main_container:getChildByName("bg")

	loadSpriteTexture(slot0.bg, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_21"), LOADTEXT_TYPE)

	slot0.role_bg = slot0.main_container:getChildByName("role_bg")

	loadSpriteTexture(slot0.role_bg, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_22"), LOADTEXT_TYPE)

	slot0.bottom_container = slot0.main_container:getChildByName("bottom_container")
	slot0.title = slot0.main_container:getChildByName("window_title_label")

	slot0.title:setString(TI18N("猜拳"))

	slot0.swap_desc_label = createRichLabel(26, 175, cc.p(0.5, 0.5), cc.p(227, 835), nil, , 340)

	slot0.main_container:addChild(slot0.swap_desc_label)
	slot0.swap_desc_label:setVisible(true)

	slot0.desc_label = slot0.main_container:getChildByName("desc_label")
	slot0.guide_container = slot0.main_container:getChildByName("guide_container")
	slot0.guide_container_pos = cc.p(slot0.guide_container:getPositionX(), slot0.guide_container:getPositionY())
	slot0.guidel_label = slot0.guide_container:getChildByName("guide_label")

	slot0.guidel_label:setString(TI18N("请下注"))

	if Config.AdventureData.data_adventure_const.describe_mora then
		slot0.desc_label:setString(Config.AdventureData.data_adventure_const.describe_mora.val)
	end

	for slot4 = 1, 4 do
		slot5 = slot0.bottom_container:getChildByName(string.format("item_button_%s", slot4))
		slot5.label = slot5:getChildByName("item_label")

		slot5:setBright(false)

		slot5.index = slot4
		slot0.item_btn[slot4] = slot5
	end

	slot0:updatedata()
end

function AdventureEvtFighterGuessWindow.updatedata(slot0)
	if slot0.config then
		slot0.swap_desc_label:setString(slot0.config.desc)
		slot0:updateItemData(slot0.config.lose)
		slot0:updateGuessContainer()
	end
end

function AdventureEvtFighterGuessWindow.updateGuessContainer(slot0)
	if not tolua.isnull(slot0.main_container) and slot0.left_effect == nil then
		slot0.left_effect = createEffectSpine(PathTool.getEffectRes(134), cc.p(210, 640), cc.p(0.5, 0.5), true, PlayerAction.action_4)

		slot0.main_container:addChild(slot0.left_effect)
	end

	if not tolua.isnull(slot0.main_container) and slot0.right_effect == nil then
		slot0.right_effect = createEffectSpine(PathTool.getEffectRes(134), cc.p(510, 640), cc.p(0.5, 0.5), true, PlayerAction.action_4)

		slot0.right_effect:setScaleX(-1)
		slot0.main_container:addChild(slot0.right_effect)
		setChildUnEnabled(true, slot0.right_effect)
	end

	for slot4 = 1, 3 do
		slot5 = slot0.main_container:getChildByName(string.format("Button_%s", slot4))
		slot5.label = slot5:getChildByName("title")

		slot5:setBright(false)

		slot5.index = slot4
		slot0.btn_list[slot4] = slot5
	end
end

function AdventureEvtFighterGuessWindow.selectBtn(slot0, slot1)
	slot0:deleteExtlist(1)

	if slot0.cur_select_index == slot1 then
		if slot0.cur_tab ~= nil then
			slot0.cur_tab:setBright(false)

			slot0.cur_tab = nil
			slot0.cur_select_index = nil
		end

		return
	end

	if slot0.cur_tab ~= nil then
		slot0.cur_tab:setBright(false)
	end

	slot0.cur_select_index = slot1
	slot0.cur_tab = slot0.btn_list[slot1]

	if slot0.cur_tab ~= nil then
		slot0.cur_tab:setBright(true)
	end

	table.insert(slot0.ext_list, {
		type = 1,
		val = slot1
	})
	slot0:checkAsk()
end

function AdventureEvtFighterGuessWindow.deleteExtlist(slot0, slot1)
	if slot0.ext_list then
		for slot5, slot6 in ipairs(slot0.ext_list) do
			if slot6.type == slot1 then
				table.remove(slot0.ext_list, slot5)
			end
		end
	end
end

function AdventureEvtFighterGuessWindow.updateItemData(slot0, slot1)
	if slot1 then
		for slot5, slot6 in ipairs(slot1) do
			if slot0.item_btn[slot5].label then
				slot7:setString(slot6[2])
			end
		end
	end
end

function AdventureEvtFighterGuessWindow.selecItem(slot0, slot1)
	slot0:deleteExtlist(2)

	if slot0.cur_item_index == slot1 then
		if slot0.cur_item_tab ~= nil then
			slot0.cur_item_tab:setBright(false)

			slot0.cur_item_tab = nil
			slot0.cur_item_index = nil
		end

		slot0.guide_container:setVisible(true)
		slot0.guide_container:runAction(cc.Sequence:create(cc.MoveTo:create(0.4, cc.p(slot0.guide_container_pos)), cc.CallFunc:create(function ()
			uv0.guidel_label:setString(TI18N("请下注"))
		end)))

		return
	end

	if slot0.cur_item_tab ~= nil then
		slot0.cur_item_tab:setBright(false)
	end

	slot0.cur_item_index = slot1
	slot0.cur_item_tab = slot0.item_btn[slot1]

	if slot0.cur_item_tab ~= nil then
		slot0.cur_item_tab:setBright(true)
	end

	slot0.guide_container:setVisible(true)
	slot0.guide_container:runAction(cc.Sequence:create(cc.MoveTo:create(0.4, cc.p(123, 425)), cc.CallFunc:create(function ()
		uv0.guidel_label:setString(TI18N("请出拳"))
	end)))
	table.insert(slot0.ext_list, {
		type = 2,
		val = slot1
	})
	slot0:checkAsk()
end

function AdventureEvtFighterGuessWindow.checkAsk(slot0)
	if slot0.data == nil then
		return
	end

	for slot5, slot6 in ipairs(slot0.ext_list) do
		slot1 = 0 + 1
	end

	if slot1 >= 2 then
		slot0.guide_container:setVisible(false)
		uv0:send20620(slot0.data.id, AdventureEvenHandleType.handle, slot0.ext_list)
	end
end

function AdventureEvtFighterGuessWindow.register_event(slot0)
	for slot4, slot5 in pairs(slot0.btn_list) do
		if slot5 then
			slot5:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					playTabButtonSound()
					uv0:selectBtn(uv1.index)
				end
			end)
		end
	end

	for slot4, slot5 in pairs(slot0.item_btn) do
		if slot5 then
			slot5:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					playTabButtonSound()
					uv0:selecItem(uv1.index)
				end
			end)
		end
	end

	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:openEvtViewByType(false)
			end
		end)
	end

	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:openEvtViewByType(false)
			end
		end)
	end

	if not slot0.figtherguess_event then
		slot0.figtherguess_event = GlobalEvent:getInstance():Bind(AdventureEvent.Update_Evt_Guess_Result, function (slot0)
			if slot0 then
				uv0:updateResult(slot0)
			end
		end)
	end
end

function AdventureEvtFighterGuessWindow.updateResult(slot0, slot1)
	if slot0.left_effect then
		slot0.left_effect:setAnimation(0, "action" .. slot1.sel_val, false)
	end

	if slot0.right_effect then
		slot0.right_effect:setAnimation(0, "action" .. slot1.ret_val, false)
	end

	slot2 = ""
	slot2 = (slot1.ret ~= 0 or TI18N("趁你没输，赶紧回去吧")) and (slot1.ret ~= 1 or TI18N("愿赌服输，你赢了")) and TI18N("小子，回去练练再来")

	delayOnce(function ()
		uv0:showStr(uv1)
	end, 0.8)
	delayOnce(function ()
		uv0:openEvtViewByType(false)
		uv0:showGetItemTips(uv1.items, true, uv1.ret)
	end, 3)
end

function AdventureEvtFighterGuessWindow.showStr(slot0, slot1)
	slot2, slot3 = StringUtil.splitStr(slot1)
	slot4 = ""

	for slot8, slot9 in ipairs(slot2) do
		delayRun(slot0.root_wnd, 0.1 * slot8, function ()
			uv0 = uv0 .. uv1.char

			uv2.swap_desc_label:setString(uv0)
		end)
	end
end

function AdventureEvtFighterGuessWindow.openRootWnd(slot0, slot1)
end

function AdventureEvtFighterGuessWindow.close_callback(slot0)
	slot0.ext_list = {}

	if slot0.figtherguess_event then
		GlobalEvent:getInstance():UnBind(slot0.figtherguess_event)

		slot0.figtherguess_event = nil
	end

	uv0:openEvtViewByType(false)
end
