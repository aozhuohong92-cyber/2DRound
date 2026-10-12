RedBagOpenView = RedBagOpenView or BaseClass(BaseView)

function RedBagOpenView.__init(slot0)
	slot0.ctrl = RedbagController:getInstance()
	slot0.is_full_screen = false
	slot0.layout_name = "redbag/redbg_open_view"
	slot0.res_list = {}
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_can_close = false
end

function RedBagOpenView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())
	slot0.background:setVisible(true)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_container")

	slot0.main_panel:setTouchEnabled(true)
	slot0.main_panel:setScale(display.getMaxScale())
end

function RedBagOpenView.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0.ctrl:openRegBagWindow(false)
		end
	end)
end

function RedBagOpenView.openRootWnd(slot0, slot1)
	slot0.data = slot1

	if slot1 then
		slot0:showAfterEffect()
	end
end

function RedBagOpenView.showAfterEffect(slot0)
	if slot0.after_effect then
		slot0.after_effect:runAction(cc.RemoveSelf:create(true))

		slot0.after_effect = nil
	end

	if not slot0.after_effect then
		slot0.after_effect = createEffectSpine(PathTool.getEffectRes(261), cc.p(slot0.main_panel:getContentSize().width / 2, slot0.main_panel:getContentSize().height / 2), cc.p(0.5, 0.5), false, PlayerAction.action_1)

		slot0.main_panel:addChild(slot0.after_effect)
		delayOnce(function ()
			if uv0.data then
				MainuiController:getInstance():openGetItemView(true, {
					{
						bid = Config.ItemData.data_assets_label2id[Config.GuildData.data_guild_red_bag[uv0.data.type].assets],
						num = uv0.data.val
					}
				}, nil, {
					is_backpack = true,
					is_red_bag = true,
					info_data = uv0.data
				})
				uv0.ctrl:openRegBagWindow(false)
			end
		end, 1)
	end

	if slot0.begin_effect then
		slot0.begin_effect:runAction(cc.RemoveSelf:create(true))

		slot0.begin_effect = nil
	end

	if not slot0.begin_effect then
		slot0.begin_effect = createEffectSpine(PathTool.getEffectRes(261), cc.p(slot0.main_panel:getContentSize().width / 2, slot0.main_panel:getContentSize().height / 2), cc.p(0.5, 0.5), false, PlayerAction.action_2)

		slot0.main_panel:addChild(slot0.begin_effect)
	end

	if not slot0.red_bg_sp and Config.GuildData.data_guild_red_bag[slot0.data.type] then
		slot0.red_bg_sp = createSprite(PathTool.getResFrame("redbag", slot1.res_name), slot0.main_panel:getContentSize().width / 2 + 5, slot0.main_panel:getContentSize().height / 2 + 10, slot0.main_panel, cc.p(0.5, 0.5))

		slot0.red_bg_sp:setOpacity(0)
		slot0.red_bg_sp:setScale(0.8)
		slot0.red_bg_sp:runAction(cc.Sequence:create(cc.FadeIn:create(0.5)))
	end
end

function RedBagOpenView.close_callback(slot0)
	if slot0.after_effect then
		slot0.after_effect:runAction(cc.RemoveSelf:create(true))

		slot0.after_effect = nil
	end

	if slot0.begin_effect then
		slot0.begin_effect:runAction(cc.RemoveSelf:create(true))

		slot0.begin_effect = nil
	end

	slot0.ctrl:openRegBagWindow(false)
end
