RoleAchieveWindow = RoleAchieveWindow or BaseClass(BaseView)
slot0 = RoleController:getInstance()

function RoleAchieveWindow.__init(slot0, slot1)
	slot0.win_type = WinType.Mini
	slot0.view_tag = slot1 or ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/rolepersonalspace", "txt_cn_task_achieve", false),
			type = ResourcesType.single
		}
	}
	slot0.is_csb_action = true
	slot0.layout_name = "roleinfo/role_achieve_window"
end

function RoleAchieveWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())
	slot0.root_wnd:getChildByName("main_container"):getChildByName("bg"):setScale(1.5)

	if not slot0.load_bg then
		slot0.load_bg = loadSpriteTextureFromCDN(slot2, PathTool.getPlistImgForDownLoad("bigbg/rolepersonalspace", "txt_cn_task_achieve"), ResourcesType.single, slot0.load_bg)
	end

	slot0.action_1 = slot0.root_wnd:getChildByName("action_1")

	slot0.action_1:setPositionY(695)

	slot0.name = slot1:getChildByName("name")

	slot0.name:setString("")

	slot0.desc = slot1:getChildByName("desc")

	slot0.desc:setString("")

	slot0.share_btn = slot1:getChildByName("share_btn")
	slot0.share_btn_label = slot0.share_btn:getChildByName("label")

	slot0.share_btn_label:setString(TI18N("分享"))

	slot0.close_btn = slot1:getChildByName("close_btn")

	slot0.close_btn:getChildByName("label"):setString(TI18N("关闭"))
end

function RoleAchieveWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openRoleAchieveWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.share_btn, function (slot0, slot1)
		uv0:onShareBtn(slot1)
	end, true, 1)
end

function RoleAchieveWindow.onShareBtn(slot0, slot1)
	if not slot0.config then
		return
	end

	if slot0.is_home_world_feat then
		TaskController:getInstance():openTaskMainWindow(true, TaskConst.type.exp)
	else
		TaskController:getInstance():openTaskSharePanel(true, {
			world_pos = slot1:convertToWorldSpace(cc.p(0.5, 0.5)),
			callback = function (slot0)
				uv0:shareCallback(slot0)
			end
		})
	end
end

function RoleAchieveWindow.shareCallback(slot0, slot1)
	if not slot0.config then
		return
	end

	if slot1 == VedioConst.Share_Btn_Type.eWorldBtn then
		RoleController:getInstance():send25817(slot0.config.id, ChatConst.Channel.World)
	elseif slot1 == VedioConst.Share_Btn_Type.eGuildBtn then
		RoleController:getInstance():send25817(slot0.config.id, ChatConst.Channel.Gang)
	elseif slot1 == VedioConst.Share_Btn_Type.eCrossBtn then
		RoleController:getInstance():send25817(slot0.config.id, ChatConst.Channel.Cross)
	end
end

function RoleAchieveWindow.openRootWnd(slot0, slot1)
	if not slot1 then
		return
	end

	if not Config.RoomFeatData.data_exp_info[slot1.id or 1] then
		return
	end

	slot0.config = slot3

	playOtherSound("c_get")
	slot0.name:setString(slot0.config.name)
	slot0.desc:setString(slot0.config.desc)
	slot0:runmoveAction(slot0.name, 0.2)
	slot0:runmoveAction(slot0.desc, 0.3)
	slot0:handleEffect(true)

	if Config.RoomFeatData.data_const.home_world_feat and slot4.val == slot0.config.id then
		slot0.is_home_world_feat = true

		slot0.share_btn_label:setString(TI18N("前往"))
	end
end

function RoleAchieveWindow.runmoveAction(slot0, slot1, slot2)
	if slot2 <= 0 then
		slot2 = 1
	end

	slot3, slot4 = slot1:getPosition()

	slot1:setOpacity(0)
	slot1:runAction(cc.Sequence:create(cc.DelayTime:create(slot2), cc.FadeIn:create(0.4)))
end

function RoleAchieveWindow.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect1 then
			slot0.play_effect1:clearTracks()
			slot0.play_effect1:removeFromParent()

			slot0.play_effect1 = nil
		end

		if slot0.play_effect2 then
			slot0.play_effect2:clearTracks()
			slot0.play_effect2:removeFromParent()

			slot0.play_effect2 = nil
		end
	else
		if not tolua.isnull(slot0.action_1) and slot0.play_effect1 == nil then
			slot0.play_effect1 = createEffectSpine(PathTool.getEffectRes(1307), cc.p(50, 50), cc.p(0.5, 0.5), false, PlayerAction.action_1)

			slot0.action_1:addChild(slot0.play_effect1, 2)
		end

		if not tolua.isnull(slot0.action_1) and slot0.play_effect2 == nil then
			slot0.play_effect2 = createEffectSpine(PathTool.getEffectRes(1307), cc.p(50, 50), cc.p(0.5, 0.5), true, PlayerAction.action_2)

			slot0.action_1:addChild(slot0.play_effect2, 1)
		end
	end
end

function RoleAchieveWindow.close_callback(slot0)
	doStopAllActions(slot0.name)
	doStopAllActions(slot0.desc)
	slot0:handleEffect(false)

	if slot0.load_bg then
		slot0.load_bg:DeleteMe()
	end

	slot0.load_bg = nil

	if slot0.is_home_world_feat and slot0.config then
		uv0:sender25813(slot0.config.id)
	end

	uv0:openRoleAchieveWindow(false)
end
