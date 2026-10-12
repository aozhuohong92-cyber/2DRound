HonorIconTips = HonorIconTips or BaseClass(BaseView)
slot0 = TipsController:getInstance()

function HonorIconTips.__init(slot0)
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "tips/honor_icon_tips"
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.item_list = {}
end

function HonorIconTips.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.bg = slot0.main_panel:getChildByName("bg")
	slot0.quality_bg = slot0.main_panel:getChildByName("quality_bg")
	slot0.item_node = slot0.main_panel:getChildByName("item_node")
	slot0.honor_item = RoleHonorItem.new(0.6)

	slot0.item_node:addChild(slot0.honor_item)

	slot0.honor_name = slot0.main_panel:getChildByName("honor_name")
	slot0.have_time = slot0.main_panel:getChildByName("have_time")
	slot0.label_desc1 = createRichLabel(24, cc.c4b(224, 191, 144, 255), cc.p(0, 1), cc.p(16, 185), nil, , 388)

	slot0.main_panel:addChild(slot0.label_desc1)

	slot0.have_name = createRichLabel(24, cc.c4b(224, 191, 144, 255), cc.p(0, 1), cc.p(16, 118), nil, , 388)

	slot0.main_panel:addChild(slot0.have_name)

	slot0.Image_3 = slot0.main_panel:getChildByName("Image_3")
	slot0.label_desc2 = createRichLabel(20, cc.c4b(193, 183, 171, 255), cc.p(0, 1), cc.p(16, 68), nil, , 388)

	slot0.main_panel:addChild(slot0.label_desc2)

	slot0.share_btn = slot0.main_panel:getChildByName("share_btn")
end

function HonorIconTips.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:onCloseBtn()
	end, false, 2)
	registerButtonEventListener(slot0.share_btn, function (slot0, slot1)
		uv0:onShareBtn(slot1)
	end, true, 1)
end

function HonorIconTips.onCloseBtn(slot0)
	uv0:openHonorIconTips(false)
end

function HonorIconTips.onShareBtn(slot0, slot1)
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

function HonorIconTips.shareCallback(slot0, slot1)
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

function HonorIconTips.openRootWnd(slot0, slot1)
	slot0.config = (slot1 or {}).config

	if slot0.config == nil then
		slot0.config = Config.RoomFeatData.data_honor_icon_info[slot2.id or 0]
	end

	if not slot0.config then
		return
	end

	slot0.show_type = slot2.show_type or RoleConst.role_type.eMySelf

	if slot2.have_time then
		slot0.have_time:setString(TimeTool.getYMD(slot3))
	else
		slot0.have_time:setString("")
	end

	slot0.honor_item:setData({
		config = slot0.config
	})
	slot0.honor_name:setString(slot0.config.name)
	slot0.honor_name:setColor(BackPackConst.getBlackQualityColorC4B(slot0.config.quality))

	slot4 = PathTool.getResFrame("tips", "tips_" .. slot0.config.quality)

	if slot0.record_background_res == nil or slot0.record_background_res ~= slot4 then
		slot0.record_background_res = slot4

		slot0.quality_bg:loadTexture(slot4, LOADTEXT_TYPE_PLIST)
	end

	slot0.label_desc1:setString(slot0.config.desc1)

	if slot0.show_type == RoleConst.role_type.eMySelf then
		slot0.have_name:setString(string.format(TI18N("荣誉点数: <div fontcolor=#65df74>%s</div>"), slot0.config.point))

		if slot3 == nil then
			slot0.honor_item:setShowLock(true)
			slot0.share_btn:setVisible(false)
		else
			slot0.share_btn:setVisible(true)
			slot0.honor_item:setShowEffect(true)
		end
	else
		slot0.have_name:setString(string.format(TI18N("持有者: <div fontcolor=#65df74>%s</div>"), slot2.have_name or ""))
		slot0.share_btn:setVisible(false)
		slot0.honor_item:setShowEffect(true)
	end

	if slot0.config.desc2 == "" then
		slot0.Image_3:setVisible(false)
		slot0.bg:setContentSize(cc.size(420, 285))
	else
		slot0.label_desc2:setString(slot0.config.desc2)
	end
end

function HonorIconTips.close_callback(slot0)
	uv0:openHonorIconTips(false)
end
