FormationSelectPanel = FormationSelectPanel or BaseClass(BaseView)
slot0 = HeroController:getInstance()
slot1 = string.format
slot2 = table.insert
slot3 = table.sort

function FormationSelectPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "hero/formation_select_panel"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("form", "form"),
			type = ResourcesType.plist
		}
	}
end

function FormationSelectPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.title = slot0.main_container:getChildByName("win_title")

	slot0.title:setString(TI18N("阵法更换"))
	slot0.main_container:getChildByName("tips_label"):setString(TI18N("点击图标选中阵法"))

	slot0.scrollview = slot0.main_container:getChildByName("scrollview")

	slot0.scrollview:setScrollBarEnabled(false)

	slot0.scrollview_size = slot0.scrollview:getContentSize()
	slot0.comfirm_btn = slot0.main_container:getChildByName("comfirm_btn")

	slot0.comfirm_btn:getChildByName("label"):setString(TI18N("确 定"))
end

function FormationSelectPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 1)
	registerButtonEventListener(slot0.comfirm_btn, handler(slot0, slot0.onClickComfirmBtn), true, 2)
end

function FormationSelectPanel.onClickBtnClose(slot0)
	uv0:openFormationSelectPanel(false)
end

function FormationSelectPanel.onClickComfirmBtn(slot0)
	if not slot0.old_select then
		return
	end

	if not slot0.select_index then
		return
	end

	if slot0.old_select ~= slot0.select_index and slot0.callback then
		slot0.callback(slot0.config_list[slot0.select_index].type, slot0.team_index)
	end

	slot0:onClickBtnClose()
end

function FormationSelectPanel.openRootWnd(slot0, slot1, slot2, slot3)
	if not slot3 then
		return
	end

	slot0.team_index = slot3
	slot0.callback = slot2

	slot0:setData(slot1)
end

function FormationSelectPanel.setData(slot0, slot1)
	slot2 = slot1 or 1
	slot0.config_list = {}

	for slot7, slot8 in pairs(Config.FormationData.data_form_data) do
		uv0(slot0.config_list, slot8)
	end

	function slot7(slot0, slot1)
		return slot0.order < slot1.order
	end

	uv1(slot0.config_list, slot7)

	slot0.select_index = 1

	for slot7, slot8 in ipairs(slot0.config_list) do
		if slot2 == slot8.type then
			slot0.select_index = slot7
		end
	end

	slot0.old_select = slot0.select_index
	slot5 = RoleController:getInstance():getRoleVo() and slot4.lev or 0

	slot0.scrollview:setInnerContainerSize(cc.size(math.max(slot0.scrollview_size.width, (98 + 16) * #slot0.config_list), slot0.scrollview_size.height))

	slot0.item_list = {}
	slot9 = 1

	slot0:clearTimeTicket()

	slot0.time_ticket = GlobalTimeTicket:getInstance():add(function ()
		if tolua.isnull(uv0.scrollview) then
			return
		end

		if uv0.config_list[uv1] ~= nil then
			if uv0.item_list[uv1] == nil then
				uv0.item_list[uv1] = uv0:createItem(uv0.config_list[uv1], uv2, uv1, uv3)

				uv0.scrollview:addChild(uv0.item_list[uv1].con)
			end

			uv0.item_list[uv1].con:setPosition((uv1 - 1 + 0.5) * (uv2 + 16), 100)

			uv1 = uv1 + 1
		else
			uv0:clearTimeTicket()
		end
	end, 3 / display.DEFAULT_FPS)
end

function FormationSelectPanel.createItem(slot0, slot1, slot2, slot3, slot4)
	slot5 = cc.size(slot2, slot2)
	slot6 = {
		config = slot1,
		con = slot8
	}
	slot8 = ccui.Widget:create()

	slot8:setContentSize(slot5)
	slot8:setTouchEnabled(true)
	slot8:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if not uv0.item_list then
				return
			end

			if uv1 < uv2.need_lev and uv0.team_index ~= 999 then
				message(uv2.need_lev .. TI18N("级解锁"))

				return
			end

			uv0.select_index = uv3

			for slot5, slot6 in ipairs(uv0.item_list) do
				if slot6.select_img then
					if uv0.select_index == slot5 then
						slot6.select_img:setVisible(true)
					else
						slot6.select_img:setVisible(false)
					end
				end
			end
		end
	end)
	createImage(slot8, PathTool.getNormalCell(), slot5.width / 2, slot5.height / 2, cc.p(0.5, 0.5), true, 0, true):setContentSize(slot5)

	slot6.icon = createImage(slot6.con, PathTool.getResFrame("form", "form_icon_" .. slot1.type), slot5.width / 2, slot5.height / 2, cc.p(0.5, 0.5), true, 0, false)

	slot6.icon:setScale(0.8)

	slot6.select_img = createImage(slot6.con, PathTool.getResFrame("common", "common_90019"), slot5.width / 2, slot5.height / 2, cc.p(0.5, 0.5), true, 0, true)

	slot6.select_img:setContentSize(slot5)

	if slot0.select_index == slot3 == true then
		slot6.select_img:setVisible(true)

		slot6.cur_img = createImage(slot6.con, PathTool.getResFrame("common", "common_30012"), 30, 67, cc.p(0.5, 0.5), true, 0, false)
		slot14 = createLabel(18, cc.c3b(255, 255, 255), nil, 20, 39, TI18N("当前"), slot6.cur_img, nil, cc.p(0.5, 0.5), nil)

		slot14:enableOutline(cc.c3b(255, 89, 67), 2)
		slot14:setRotation(-45)
	else
		slot6.select_img:setVisible(false)
	end

	createImage(slot6.con, PathTool.getResFrame("common", "common_90010"), slot5.width / 2, -27, cc.p(0.5, 0.5), true, 0, true):setContentSize(cc.size(105, 37))

	slot6.name = createLabel(24, cc.c3b(104, 69, 42), nil, slot2 * 0.5, -27, slot1.name, slot6.con, nil, cc.p(0.5, 0.5), nil)

	if slot4 < slot1.need_lev and slot0.team_index ~= 999 then
		slot6.lock_icon = createImage(slot6.con, PathTool.getResFrame("common", "common_90009"), slot5.width / 2, 62, cc.p(0.5, 0.5), true, 0, false)

		createLabel(22, Config.ColorData.data_color4[1], Config.ColorData.data_color4[9], slot5.width / 2, 10, uv0("%s%s", slot1.need_lev, TI18N("解锁")), slot6.con, 2, cc.p(0.5, 0))
		setChildUnEnabled(true, slot6.icon)
	end

	return slot6
end

function FormationSelectPanel.clearTimeTicket(slot0)
	if slot0.time_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.time_ticket)

		slot0.time_ticket = nil
	end
end

function FormationSelectPanel.close_callback(slot0)
	slot0:clearTimeTicket()
	uv0:openFormationSelectPanel(false)
end
