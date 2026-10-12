BattleDramaUnlockWindow = BattleDramaUnlockWindow or BaseClass(BaseView)

function BattleDramaUnlockWindow.__init(slot0)
	slot0.ctrl = BattleDramaController:getInstance()
	slot0.is_full_screen = false
	slot0.layout_name = "battledrama/battle_drama_unlock_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("battleunlock", "battleunlock"),
			type = ResourcesType.plist
		}
	}
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_can_close = false
end

function BattleDramaUnlockWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())
	slot0.background:setVisible(true)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_panel, 2)
	slot0.main_panel:setTouchEnabled(false)
	slot0.main_panel:setScale(display.getMaxScale())

	slot0.ok_btn = slot0.main_panel:getChildByName("ok_btn")

	slot0.ok_btn:setTitleText(TI18N("知道了"))
	slot0.ok_btn:getTitleRenderer():enableOutline(cc.c4b(196, 90, 20, 255), 2)

	slot0.time_label = createRichLabel(22, 1, cc.p(0.5, 0.5), cc.p(slot0.root_wnd:getContentSize().width / 2 + 5, 125), nil, nil, 1000)

	slot0.time_label:setString(TI18N("10秒后关闭"))
	slot0.main_panel:addChild(slot0.time_label)

	slot0.head_icon = slot0.main_panel:getChildByName("head_icon")
	slot0.star_name = slot0.main_panel:getChildByName("star_name")
	slot0.star_desc = createRichLabel(26, Config.ColorData.data_color4[1], cc.p(0.5, 1), cc.p(360, 360), nil, nil, 500)

	slot0.main_panel:addChild(slot0.star_desc)
	slot0:handleEffect(true)
end

function BattleDramaUnlockWindow.register_event(slot0)
	slot0.ok_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()

			if uv0.is_can_close == true then
				uv0.ctrl:openBattleDramaUnlockWindow(false)
			end
		end
	end)
end

function BattleDramaUnlockWindow.updateDesc(slot0, slot1)
	if slot1 then
		if slot0.res_id_2 ~= PathTool.getPlistImgForDownLoad("bigbg/battledrama", slot1.unlock_icon) then
			slot0.res_id_2 = slot2
			slot0.item_load_1 = createResourcesLoad(slot0.res_id_2, ResourcesType.single, function ()
				if not tolua.isnull(uv0.head_icon) then
					loadSpriteTexture(uv0.head_icon, uv0.res_id_2, LOADTEXT_TYPE)
				end
			end, slot0.item_load_1)
		end

		slot0.star_name:setString(slot1.unlock_name)
		slot0.star_desc:setString(slot1.unlock_desc)
	end

	slot0.is_can_close = true

	slot0:updateTimer()
end

function BattleDramaUnlockWindow.updateTimer(slot0)
	slot1 = 10

	GlobalTimeTicket:getInstance():add(function ()
		uv0 = uv0 - 1

		if uv1.time_label and not tolua.isnull(uv1.time_label) then
			uv1.time_label:setString(math.ceil(uv0) .. TI18N("秒后关闭"))
		end

		if slot0 <= 0 then
			uv1.ctrl:openBattleDramaUnlockWindow(false)
			GlobalTimeTicket:getInstance():remove("close_unlock_view")
		end
	end, 1, 0, "close_unlock_view")
end

function BattleDramaUnlockWindow.openRootWnd(slot0, slot1)
	slot0:updateDesc(slot1)
end

function BattleDramaUnlockWindow.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	else
		slot2 = slot0.main_panel:getContentSize()

		if not tolua.isnull(slot0.main_panel) and slot0.play_effect == nil then
			slot0.play_effect = createEffectSpine(PathTool.getEffectRes(145), cc.p(slot2.width * 0.5, slot2.height * 0.5 + 10), cc.p(0.5, 0.5), true, PlayerAction.action)

			slot0.main_panel:addChild(slot0.play_effect, -1)
		end
	end
end

function BattleDramaUnlockWindow.close_callback(slot0)
	slot0.ctrl:openBattleDramaUnlockWindow(false)
	GlobalTimeTicket:getInstance():remove("close_unlock_view")
	GlobalEvent:getInstance():Fire(BattleEvent.CLOSE_RESULT_VIEW)
	slot0:handleEffect(false)

	if slot0.item_load_1 then
		slot0.item_load_1:DeleteMe()

		slot0.item_load_1 = nil
	end
end
