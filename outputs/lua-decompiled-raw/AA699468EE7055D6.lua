HonorLevelTips = HonorLevelTips or BaseClass(BaseView)
slot0 = TipsController:getInstance()
slot1 = string.format

function HonorLevelTips.__init(slot0)
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "tips/honor_level_tips"
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.item_list = {}
end

function HonorLevelTips.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.bg = slot0.main_panel:getChildByName("bg")
	slot0.item_load_bg = loadSpriteTextureFromCDN(slot0.bg, PathTool.getPlistImgForDownLoad("bigbg", "txt_cn_honor_level_bg"), ResourcesType.single, slot0.item_load_bg)
	slot0.honor_icon = slot0.main_panel:getChildByName("honor_icon")
	slot0.level_name = slot0.main_panel:getChildByName("level_name")
	slot0.player_name = slot0.main_panel:getChildByName("player_name")
	slot0.honor_point_key = slot0.main_panel:getChildByName("honor_point_key")

	slot0.honor_point_key:setString(TI18N("荣誉点数:"))

	slot0.collect_count_key = slot0.main_panel:getChildByName("collect_count_key")

	slot0.collect_count_key:setString(TI18N("收集数:"))

	slot0.honor_point_value = slot0.main_panel:getChildByName("honor_point_value")
	slot0.collect_count_value = slot0.main_panel:getChildByName("collect_count_value")
	slot0.next_label = createRichLabel(20, cc.c4b(149, 83, 34, 255), cc.p(0.5, 1), cc.p(227, 66), nil, , 900)

	slot0.main_panel:addChild(slot0.next_label)

	slot0.btn_label = createRichLabel(22, cc.c3b(36, 144, 3), cc.p(0.5, 0.5), cc.p(366, 53))

	slot0.btn_label:setString(uv0("<div href=xxx>%s</div>", TI18N("前往查看")))
	slot0.main_panel:addChild(slot0.btn_label)
	slot0.btn_label:addTouchLinkListener(function (slot0, slot1, slot2, slot3)
		uv0:onCloseBtn()

		if not uv0.role_data then
			return
		end

		if not RoleController:getInstance():getRoleVo() then
			return
		end

		if uv0.role_data.rid == slot4.rid and uv0.role_data.srv_id == slot4.srv_id then
			RoleController:getInstance():openRolePersonalSpacePanel(true, {
				index = RoleConst.Tab_type.eHonorWall
			})
		else
			RoleController:getInstance():requestRoleInfo(uv0.role_data.rid, uv0.role_data.srv_id, {
				form_type = RoleConst.Other_Form_Type.eHonorLevelTips
			})
		end
	end, {
		"click",
		"href"
	})
end

function HonorLevelTips.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:onCloseBtn()
	end, false, 2)
end

function HonorLevelTips.onCloseBtn(slot0)
	uv0:openHonorLevelTips(false)
end

function HonorLevelTips.openRootWnd(slot0, slot1)
	slot2 = slot1 or {}
	slot3 = slot2.show_type or RoleConst.role_type.eOther
	slot4 = slot2.is_hide_btn_label or false
	slot5 = slot2.point or 0
	slot7 = slot2.role_data or {}
	slot0.role_data = slot7
	slot9, slot10, slot11 = RoleController:getInstance():getModel():getHonorPointName(slot5)

	slot0.level_name:setString(slot9)
	slot0.honor_point_value:setString(slot5)
	slot0.collect_count_value:setString(slot2.num or 0)
	slot0.player_name:setString(slot7.name or "")

	slot12 = PathTool.getPlistImgForDownLoad("rolehonorwall/honorwarllicon", "honor_level_" .. (slot10 or 1), false)

	if slot0.record_honor_icon_res == nil or slot0.record_honor_icon_res ~= slot12 then
		slot0.record_honor_icon_res = slot12
		slot0.item_load_honor_icon = loadSpriteTextureFromCDN(slot0.honor_icon, slot12, ResourcesType.single, slot0.item_load_honor_icon)
	end

	if slot3 == RoleConst.role_type.eOther then
		if slot4 then
			slot0.btn_label:setVisible(false)
		else
			slot0.btn_label:setVisible(true)
		end
	else
		slot0.btn_label:setVisible(false)

		if slot11 then
			if slot11 == -1 then
				slot0.next_label:setString(TI18N("当前已是最高荣誉"))
			else
				slot0.next_label:setString(TI18N("下一级荣誉所需点数:") .. slot11)
			end
		end
	end
end

function HonorLevelTips.close_callback(slot0)
	if slot0.item_load_bg then
		slot0.item_load_bg:DeleteMe()

		item_load_bg = nil
	end

	if slot0.item_load_honor_icon then
		slot0.item_load_honor_icon:DeleteMe()

		item_load_honor_icon = nil
	end

	uv0:openHonorLevelTips(false)
end
