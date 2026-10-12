StarTowerGetWindow = StarTowerGetWindow or BaseClass(BaseView)

function StarTowerGetWindow.__init(slot0, slot1)
	slot0.ctrl = StartowerController:getInstance()
	slot0.is_full_screen = false
	slot0.layout_name = "startower/star_tower_get"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("startower", "startower"),
			type = ResourcesType.plist
		}
	}
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.tower = slot1 or 0
end

function StarTowerGetWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())
	slot0.background:setVisible(true)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_panel, 1)
	slot0.main_panel:setTouchEnabled(false)

	slot0.ok_btn = slot0.main_panel:getChildByName("ok_btn")

	slot0.ok_btn:setTitleText(TI18N("知道了"))
	slot0.ok_btn:getTitleRenderer():enableOutline(Config.ColorData.data_color4[264], 2)
	slot0:createDesc()
	slot0:updateDesc()
end

function StarTowerGetWindow.register_event(slot0)
	slot0.ok_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0.ctrl:openGetWindow(false)
		end
	end)
end

function StarTowerGetWindow.createDesc(slot0)
	slot1 = slot0.main_panel:getContentSize()
	slot0.star_name = createLabel(26, Config.ColorData.data_color4[1], Config.ColorData.data_color4[9], slot1.width / 2, 385, "", slot0.main_panel, 2, cc.p(0.5, 0))
	slot0.star_desc = createRichLabel(26, Config.ColorData.data_color4[1], cc.p(0.5, 1), cc.p(slot1.width / 2, 360), nil, nil, 500)

	slot0.main_panel:addChild(slot0.star_desc)
end

function StarTowerGetWindow.updateDesc(slot0)
	if slot0.tower == 0 then
		return
	end

	slot2 = nil

	for slot6, slot7 in pairs(Config.StarTowerData.data_award_list) do
		if slot7.lev and slot7.lev == slot0.tower and slot7.extend and slot7.extend[1] then
			slot2 = Config.ItemData.data_get_data(slot7.extend[1])
		end
	end

	slot3 = slot0.main_panel:getContentSize()

	if not slot2 then
		return
	end

	if not slot0.head_icon then
		slot0.head_icon = BackPackItem.new(true)

		slot0.main_panel:addChild(slot0.head_icon, 1000)
		slot0.head_icon:getBackground():setVisible(false)
		slot0.head_icon:setData(slot2)
	end

	slot0.head_icon:setPosition(cc.p(slot3.width / 2, 500))
	slot0.head_icon:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.head_icon:setScale(1.2)
	slot0.star_desc:setString(slot2.desc or "")

	if slot2.eqm_set then
		slot0.star_name:setString(Config.StarData.data_star_name[slot2.eqm_set] or "")
	end
end

function StarTowerGetWindow.openRootWnd(slot0)
	playOtherSound("c_get")
	slot0:handleEffect(true)
end

function StarTowerGetWindow.setPanelData(slot0)
end

function StarTowerGetWindow.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0.main_panel) and slot0.play_effect == nil then
		slot2 = slot0.main_panel:getContentSize()
		slot0.play_effect = createEffectSpine(Config.EffectData.data_effect_info[145], cc.p(slot2.width * 0.5, slot2.height * 0.5 + 10), cc.p(0.5, 0.5), true, PlayerAction.action)

		slot0.main_panel:addChild(slot0.play_effect, 1)
	end
end

function StarTowerGetWindow.close_callback(slot0)
	slot0.ctrl:openGetWindow(false)
	slot0:handleEffect(false)
	GlobalEvent:getInstance():Fire(BattleEvent.CLOSE_RESULT_VIEW)

	if slot0.bottom_head then
		slot0.bottom_head:DeleteMe()

		slot0.bottom_head = nil
	end

	if slot0.head_icon then
		slot0.head_icon:DeleteMe()

		slot0.head_icon = nil
	end
end
