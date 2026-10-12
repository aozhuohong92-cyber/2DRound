RoleHonorUnlockPanel = RoleHonorUnlockPanel or BaseClass(BaseView)
slot0 = RoleController:getInstance()

function RoleHonorUnlockPanel.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("levupgrade", "levupgrade"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/rolepersonalspace", "txt_cn_role_honor_title", false),
			type = ResourcesType.single
		}
	}
	slot0.is_csb_action = true
	slot0.layout_name = "roleinfo/role_honor_unlock_panel"
end

function RoleHonorUnlockPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.title_icon_effect = slot0.main_container:getChildByName("title_icon_effect")
	slot0.title_width = slot0.title_icon_effect:getContentSize().width
	slot0.title_height = slot0.title_icon_effect:getContentSize().height

	if not slot0.load_title then
		slot0.load_title = loadSpriteTextureFromCDN(slot0.main_container:getChildByName("title_sprite"), PathTool.getPlistImgForDownLoad("bigbg/rolepersonalspace", "txt_cn_role_honor_title"), ResourcesType.single, slot0.load_title)
	end

	slot0.item_node = slot0.main_container:getChildByName("item_node")
	slot0.honor_item = RoleHonorItem.new(1)

	slot0.item_node:addChild(slot0.honor_item)

	slot0.name = slot0.main_container:getChildByName("name")
	slot0.close_btn = slot0.main_container:getChildByName("close_btn")

	slot0.close_btn:getChildByName("label"):setString(TI18N("关 闭"))

	slot0.share_btn = slot0.main_container:getChildByName("share_btn")

	slot0.share_btn:getChildByName("label"):setString(TI18N("分 享"))

	slot0.desc = createRichLabel(18, cc.c3b(255, 232, 183), cc.p(0.5, 0.5), cc.p(slot0.main_container:getContentSize().width * 0.5, 166), nil, , 500)

	slot0.main_container:addChild(slot0.desc)
end

function RoleHonorUnlockPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openRoleHonorUnlockPanel(false)
	end, false, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openRoleHonorUnlockPanel(false)
	end, true, 2)
	registerButtonEventListener(slot0.share_btn, function (slot0, slot1)
		uv0:onShareBtn(slot1)
	end, true, 1)
end

function RoleHonorUnlockPanel.onShareBtn(slot0, slot1)
	if not slot0.config then
		return
	end

	TaskController:getInstance():openTaskSharePanel(true, {
		world_pos = slot1:convertToWorldSpace(cc.p(0.5, 0.5)),
		callback = function (slot0)
			uv0:shareCallback(slot0)
		end
	})
end

function RoleHonorUnlockPanel.shareCallback(slot0, slot1)
	if not slot0.config then
		return
	end

	if slot1 == VedioConst.Share_Btn_Type.eWorldBtn then
		RoleController:getInstance():send25815(slot0.config.id, ChatConst.Channel.World)
	elseif slot1 == VedioConst.Share_Btn_Type.eGuildBtn then
		RoleController:getInstance():send25815(slot0.config.id, ChatConst.Channel.Gang)
	elseif slot1 == VedioConst.Share_Btn_Type.eCrossBtn then
		RoleController:getInstance():send25815(slot0.config.id, ChatConst.Channel.Cross)
	end
end

function RoleHonorUnlockPanel.openRootWnd(slot0, slot1)
	if not (slot1 or {}).id then
		return
	end

	if not Config.RoomFeatData.data_honor_icon_info[slot3] then
		return
	end

	slot0.config = slot4

	playOtherSound("c_get")
	slot0.honor_item:setData({
		config = slot4
	})
	slot0.honor_item:setShowEffect(true)
	slot0.name:setString(slot4.name)
	slot0:handleEffect(true)
	slot0.desc:setString(string.format("<div outline=2,#000000>%s</div>", slot4.desc2))
	slot0:runmoveAction(slot0.honor_item, 0.2)
	slot0:runmoveAction(slot0.name, 0.2)
	slot0:runmoveAction(slot0.desc, 0.3)
end

function RoleHonorUnlockPanel.runmoveAction(slot0, slot1, slot2)
	if slot2 <= 0 then
		slot2 = 1
	end

	slot3, slot4 = slot1:getPosition()

	slot1:setPosition(slot3 - 300, slot4)
	slot1:setOpacity(0)
	slot1:runAction(cc.Sequence:create(cc.DelayTime:create(slot2), cc.Spawn:create(cc.EaseBackOut:create(cc.MoveTo:create(0.4, cc.p(slot3, slot4))), cc.FadeIn:create(0.4))))
end

function RoleHonorUnlockPanel.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0.title_icon_effect) and slot0.play_effect == nil then
		slot0.play_effect = createEffectSpine(PathTool.getEffectRes(1306), cc.p(slot0.title_width * 0.5, slot0.title_height * 0.5), cc.p(0.5, 0.5), true, PlayerAction.action)

		slot0.title_icon_effect:addChild(slot0.play_effect, 1)
		slot0.play_effect:setOpacity(0)
		slot0.play_effect:runAction(cc.FadeIn:create(0.5))
	end
end

function RoleHonorUnlockPanel.close_callback(slot0)
	doStopAllActions(slot0.name)
	doStopAllActions(slot0.desc)
	slot0:handleEffect(false)

	if slot0.load_title then
		slot0.load_title:DeleteMe()
	end

	slot0.load_title = nil

	if slot0.honor_item then
		slot0.honor_item:DeleteMe()

		slot0.honor_item = nil
	end

	uv0:openRoleHonorUnlockPanel(false)
end
