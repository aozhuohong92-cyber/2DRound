BattleDramaWorldLevTips = BattleDramaWorldLevTips or BaseClass(BaseView)
slot0 = BattleDramaController:getInstance()

function BattleDramaWorldLevTips.__init(slot0)
	slot0.is_full_screen = false
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "battledrama/battle_drama_world_lev_tips"
end

function BattleDramaWorldLevTips.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.container = slot0.root_wnd:getChildByName("main_panel")
	slot0.close_btn = slot0.container:getChildByName("close_btn")
	slot0.cur_label = slot0.container:getChildByName("cur_label")
	slot0.lev_label = slot0.container:getChildByName("lev_label")
	slot0.title_label = slot0.container:getChildByName("title_label")
	slot0.desc = createRichLabel(22, 175, cc.p(0, 0), cc.p(48, 190), 6, nil, 320)

	slot0.container:addChild(slot0.desc)

	slot0.desc2 = createRichLabel(22, 178, cc.p(0, 1), cc.p(48, 145), 8, nil, 320)

	slot0.container:addChild(slot0.desc2)
end

function BattleDramaWorldLevTips.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openWorldLevTips(false)
		end
	end)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openWorldLevTips(false)
		end
	end)
end

function BattleDramaWorldLevTips.openRootWnd(slot0)
	slot0.desc:setString(Config.WorldLevData.data_const.world_lev_desc.desc)
	slot0.lev_label:setString(string.format(TI18N("%s等级"), slot2))

	if (Config.WorldLevData.data_get(math.max(0, RoleController:getInstance():getModel():getWorldLev() - RoleController:getInstance():getRoleVo().lev)) or {}).exp_ratio and slot3.exp_ratio > 0 then
		slot0.desc2:setString(string.format(TI18N("您当前低于世界等级%s级，获得角色经验加%s%s，额外加速作战次数%s次"), slot2 - slot1, slot3.exp_ratio / 10, "%", slot3.dun_quick_combat))
	end
end

function BattleDramaWorldLevTips.close_callback(slot0)
end
