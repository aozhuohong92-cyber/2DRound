slot1 = MonopolyController:getInstance():getModel()
slot2 = string.format
MonopolyTips = MonopolyTips or BaseClass(BaseView)

function MonopolyTips.__init(slot0)
	slot0.is_full_screen = false
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "monopoly/monopoly_tips"
	slot0.res_list = {}
end

function MonopolyTips.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)

	slot0.ui_panel = slot1:getChildByName("ui_panel")

	slot0.ui_panel:setVisible(false)
	slot0.ui_panel:getChildByName("title_txt"):setString(TI18N("提示"))

	slot0.got_sp_1 = slot0.ui_panel:getChildByName("got_sp_1")
	slot0.got_sp_2 = slot0.ui_panel:getChildByName("got_sp_2")
	slot0.close_btn = slot0.ui_panel:getChildByName("close_btn")
	slot0.tips_txt_1 = slot0.ui_panel:getChildByName("tips_txt_1")
	slot0.tips_txt_2 = slot0.ui_panel:getChildByName("tips_txt_2")

	delayRun(slot0.ui_panel, 1.2, function ()
		uv0.ui_panel:setVisible(true)
	end)

	slot0.pos_node = slot1:getChildByName("pos_node")
end

function MonopolyTips.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2)
end

function MonopolyTips.onClickCloseBtn(slot0)
	uv0:openMonopolyTips(false)
end

function MonopolyTips.openRootWnd(slot0, slot1)
	slot0:setData(slot1)
	slot0:handleEffect(true)
end

function MonopolyTips.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot0.cfg_data = Config.MonopolyMapsData.data_customs[slot1.id]

	if not slot0.cfg_data then
		return
	end

	slot2 = false
	slot3 = false

	if slot0.cfg_data.start_unixtime <= GameNet:getInstance():getTime() then
		slot2 = true
	end

	if slot0.cfg_data.develop <= uv0:getGuildDevelopValById(slot1.id - 1) and slot0.cfg_data.develop ~= 0 then
		slot3 = true
	end

	slot0.tips_txt_1:setString(uv1(TI18N("%s将于%s解锁！"), slot0.cfg_data.name, TimeTool.getYMDHM(slot0.cfg_data.start_unixtime)))

	if Config.MonopolyMapsData.data_customs[slot1.id - 1] then
		if slot0.cfg_data.develop / slot6.max_develop * 100 > 100 then
			slot7 = 100
		end

		slot0.tips_txt_2:setString(uv1(TI18N("%s探索值达到%d%%"), slot6.name, slot7))
		slot0.tips_txt_2:setVisible(true)
	else
		slot0.tips_txt_2:setVisible(false)
	end

	if slot2 then
		slot0.got_sp_1:setVisible(true)
		slot0.tips_txt_1:setTextColor(cc.c4b(100, 50, 35, 255))
	else
		slot0.got_sp_1:setVisible(false)
		slot0.tips_txt_1:setTextColor(cc.c4b(105, 105, 105, 255))
	end

	if slot3 then
		slot0.got_sp_2:setVisible(true)
		slot0.tips_txt_2:setTextColor(cc.c4b(149, 83, 34, 255))
	else
		slot0.got_sp_2:setVisible(false)
		slot0.tips_txt_2:setTextColor(cc.c4b(105, 105, 105, 255))
	end
end

function MonopolyTips.handleEffect(slot0, slot1)
	if slot1 == true then
		if not tolua.isnull(slot0.pos_node) and slot0.enter_effect == nil then
			slot0.enter_effect = createEffectSpine(Config.EffectData.data_effect_info[1503], cc.p(-360, -752), cc.p(0, 0), false, PlayerAction.action_1)

			slot0.pos_node:addChild(slot0.enter_effect)
		end
	elseif slot0.enter_effect then
		slot0.enter_effect:clearTracks()
		slot0.enter_effect:removeFromParent()

		slot0.enter_effect = nil
	end
end

function MonopolyTips.close_callback(slot0)
	slot0:handleEffect(false)
	uv0:openMonopolyTips(false)
end
