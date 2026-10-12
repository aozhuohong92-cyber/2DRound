HonorNextLevelTips = HonorNextLevelTips or BaseClass(BaseView)
slot0 = TipsController:getInstance()
slot1 = string.format

function HonorNextLevelTips.__init(slot0)
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "tips/honor_next_level_tips"
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.item_list = {}
end

function HonorNextLevelTips.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.bg = slot0.main_panel:getChildByName("bg")
	slot0.item_load_bg = loadSpriteTextureFromCDN(slot0.bg, PathTool.getPlistImgForDownLoad("bigbg", "txt_cn_honor_level_bg_1"), ResourcesType.single, slot0.item_load_bg)
	slot0.honor_icon = slot0.main_panel:getChildByName("honor_icon")
	slot0.level_name = slot0.main_panel:getChildByName("level_name")
	slot0.player_name = slot0.main_panel:getChildByName("player_name")
	slot0.honor_point_key = slot0.main_panel:getChildByName("honor_point_key")

	slot0.honor_point_key:setString(TI18N("荣誉点数:"))

	slot0.collect_count_key = slot0.main_panel:getChildByName("collect_count_key")

	slot0.collect_count_key:setString(TI18N("收集数:"))

	slot0.honor_point_value = slot0.main_panel:getChildByName("honor_point_value")
	slot0.collect_count_value = slot0.main_panel:getChildByName("collect_count_value")
	slot0.next_honor_icon = slot0.main_panel:getChildByName("next_honor_icon")
	slot0.next_level_name = slot0.main_panel:getChildByName("next_level_name")
	slot0.next_tips = slot0.main_panel:getChildByName("next_tips")

	slot0.next_tips:setString("下一级")

	slot0.need_point = slot0.main_panel:getChildByName("need_point")
end

function HonorNextLevelTips.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:onCloseBtn()
	end, false, 2)
end

function HonorNextLevelTips.onCloseBtn(slot0)
	uv0:openHonorNextLevelTips(false)
end

function HonorNextLevelTips.openRootWnd(slot0, slot1)
	slot2 = slot1 or {}
	slot3 = slot2.show_type or RoleConst.role_type.eOther
	slot4 = slot2.point or 0
	slot6 = slot2.role_data or {}
	slot0.role_data = slot6
	slot8, slot9, slot10, slot11, slot12 = RoleController:getInstance():getModel():getHonorPointName(slot4)

	slot0.level_name:setString(slot8 or "")
	slot0.honor_point_value:setString(slot4)
	slot0.collect_count_value:setString(slot2.num or 0)
	slot0.player_name:setString(slot6.name or "")
	slot0.next_level_name:setString(slot11 or "")

	slot13 = PathTool.getPlistImgForDownLoad("rolehonorwall/honorwarllicon", "honor_level_" .. (slot9 or 1), false)

	if slot0.record_honor_icon_res == nil or slot0.record_honor_icon_res ~= slot13 then
		slot0.record_honor_icon_res = slot13
		slot0.item_load_honor_icon = loadSpriteTextureFromCDN(slot0.honor_icon, slot13, ResourcesType.single, slot0.item_load_honor_icon)
	end

	if slot3 ~= RoleConst.role_type.eOther then
		if slot10 then
			if slot10 == -1 then
				slot0.need_point:setString(TI18N("当前已是最高荣誉"))
			else
				slot0.need_point:setString(TI18N("所需荣誉点数: ") .. slot10)
			end
		end

		slot14 = PathTool.getPlistImgForDownLoad("rolehonorwall/honorwarllicon", "honor_level_" .. (slot12 or 1), false)

		if slot0.record_honor_next_icon_res == nil or slot0.record_honor_next_icon_res ~= slot14 then
			slot0.record_honor_next_icon_res = slot14
			slot0.item_load_next_honor_icon = loadSpriteTextureFromCDN(slot0.next_honor_icon, slot14, ResourcesType.single, slot0.item_load_next_honor_icon)
		end
	end
end

function HonorNextLevelTips.close_callback(slot0)
	if slot0.item_load_bg then
		slot0.item_load_bg:DeleteMe()

		item_load_bg = nil
	end

	if slot0.item_load_honor_icon then
		slot0.item_load_honor_icon:DeleteMe()

		item_load_honor_icon = nil
	end

	if slot0.item_load_next_honor_icon then
		slot0.item_load_next_honor_icon:DeleteMe()

		item_load_next_honor_icon = nil
	end

	uv0:openHonorNextLevelTips(false)
end
