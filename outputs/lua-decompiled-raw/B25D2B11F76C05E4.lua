ActionyearmonsterRedbagEffectPanel = ActionyearmonsterRedbagEffectPanel or BaseClass(BaseView)

function ActionyearmonsterRedbagEffectPanel.__init(slot0)
	slot0.ctrl = ActionyearmonsterController:getInstance()
	slot0.is_full_screen = false
	slot0.layout_name = "redbag/redbg_open_view"
	slot0.res_list = {}
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_can_close = false
end

function ActionyearmonsterRedbagEffectPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())
	slot0.background:setVisible(true)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_panel, 2)
	slot0.main_panel:setTouchEnabled(true)
	slot0.main_panel:setScale(display.getMaxScale())
end

function ActionyearmonsterRedbagEffectPanel.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0.ctrl:openActionyearmonsterRedbagEffectPanel(false)
		end
	end)
end

function ActionyearmonsterRedbagEffectPanel.openRootWnd(slot0, slot1)
	slot0.data = slot1

	if slot1 then
		slot0:showAfterEffect()
	end
end

function ActionyearmonsterRedbagEffectPanel.showAfterEffect(slot0)
	if slot0.after_effect then
		slot0.after_effect:runAction(cc.RemoveSelf:create(true))

		slot0.after_effect = nil
	end

	if not slot0.after_effect then
		slot0.after_effect = createEffectSpine(PathTool.getEffectRes(332), cc.p(slot0.main_panel:getContentSize().width / 2, slot0.main_panel:getContentSize().height / 2), cc.p(0.5, 0.5), false, PlayerAction.action)

		slot0.main_panel:addChild(slot0.after_effect)
		delayOnce(function ()
			if uv0.data then
				slot0 = {}

				if uv0.data.role_reward_list and next(uv0.data.role_reward_list) ~= nil then
					for slot4, slot5 in ipairs(uv0.data.role_reward_list) do
						table.insert(slot0, {
							bid = slot5.role_base_id,
							num = slot5.role_num
						})
					end
				end

				if next(slot0) == nil then
					slot0 = {
						{
							bid = 1,
							num = 10
						}
					}
				end

				MainuiController:getInstance():openGetItemView(true, slot0, nil, {
					is_year_red_bag = true,
					is_backpack = true,
					info_data = uv0.data
				})
				uv0.ctrl:openActionyearmonsterRedbagEffectPanel(false)
			end
		end, 1)
	end
end

function ActionyearmonsterRedbagEffectPanel.close_callback(slot0)
	if slot0.after_effect then
		slot0.after_effect:runAction(cc.RemoveSelf:create(true))

		slot0.after_effect = nil
	end

	slot0.ctrl:openActionyearmonsterRedbagEffectPanel(false)
end
