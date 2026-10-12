FormHallowsSelectPanel = FormHallowsSelectPanel or BaseClass(BaseView)
slot1 = HeroController:getInstance()
slot2 = HallowsController:getInstance():getModel()
slot3 = string.format
slot4 = table.insert
slot5 = table.sort

function FormHallowsSelectPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "hero/form_hallows_select_panel"
	slot0.res_list = {}
end

function FormHallowsSelectPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.title = slot0.main_container:getChildByName("win_title")

	slot0.title:setString(TI18N("神技更换"))
end

function FormHallowsSelectPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 1)
end

function FormHallowsSelectPanel.onClickBtnClose(slot0)
	uv0:openFormHallowsSelectPanel(false)
end

function FormHallowsSelectPanel.openRootWnd(slot0, slot1, slot2, slot3, slot4, slot5)
	if not slot4 then
		return
	end

	slot0.dic_equips = slot3 or {}
	slot0.team_index = slot4
	slot0.callback = slot2
	slot0.hallows_equip_id = slot1

	if slot5 then
		slot0.mine_hallows_id = slot5
	end

	if not Config.HallowsData.data_base then
		return
	end

	slot0.hallows_list = {}

	for slot10, slot11 in ipairs(slot6) do
		if slot11.id == slot0.hallows_equip_id then
			-- Nothing
		else
			slot12.is_equip = false
		end

		if slot3[slot11.id] then
			slot12.team_index = slot3[slot11.id]
			slot12.team_text = uv1(TI18N("队伍%s装备中"), slot3[slot11.id])
		end

		if slot0.mine_hallows_id and slot0.mine_hallows_id[slot11.id] then
			slot12.mine_text = TI18N("其他队伍装备中")
		end

		slot0.hallows_list[slot10] = {
			hallows_vo = uv0:getHallowsById(slot11.id),
			config = slot11,
			is_equip = true
		}
	end

	if #slot0.hallows_list > 0 then
		slot0:updateHallowList()
	else
		slot0.emptyTips = createImage(slot0.main_container, PathTool.getEmptyMark(), slot0.main_container:getContentSize().width * 0.5, 505, cc.p(0.5, 0.5))

		createLabel(22, Config.ColorData.data_color4[187], nil, slot0.emptyTips:getContentSize().width / 2 + 10, -20, TI18N("暂时没有数据"), slot0.emptyTips, 0, cc.p(0.5, 0))
	end
end

function FormHallowsSelectPanel.updateHallowList(slot0)
	if not slot0.list_view then
		slot4, slot5 = slot0.main_container:getChildByName("box_2014"):getPosition()
		slot0.list_view = CommonScrollViewLayout.new(slot0.main_container, cc.p(slot4, slot5), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(630, 640), {
			start_y = 4,
			item_height = 148,
			start_x = 0,
			space_y = 0,
			col = 1,
			space_x = 0,
			item_width = 630,
			item_class = FormHallowsSelectItem
		}, cc.p(0.5, 0.5))
	end

	slot0.list_view:setData(slot0.hallows_list, function (slot0, slot1)
		uv0:selectItem(slot0, slot1)
	end)
end

function FormHallowsSelectPanel.selectItem(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if not slot2 then
		return
	end

	if not slot2.config then
		return
	end

	function slot3()
		if uv0.is_equip == true then
			uv1.hallows_equip_id = 0
		else
			uv1.hallows_equip_id = uv0.config.id
		end

		uv1:onClickBtnClose()

		if uv1.callback then
			uv1.callback(uv1.hallows_equip_id, uv1.team_index)
		end
	end

	if slot2.team_index ~= nil and slot2.team_index ~= 0 and not slot2.is_equip then
		CommonAlert.show(uv0(TI18N("其他队伍中已装配了该神技，若要在此队伍中装配，则系统会自动卸下其他队伍中的该神技，是否确定？")), TI18N("确定"), function ()
			uv0()
		end, TI18N("取消"), nil, nil, nil, {
			title = TI18N("提示")
		})
	else
		slot3()
	end
end

function FormHallowsSelectPanel.close_callback(slot0)
	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end

	uv0:openFormHallowsSelectPanel(false)
end

FormHallowsSelectItem = class("FormHallowsSelectItem", function ()
	return ccui.Widget:create()
end)

function FormHallowsSelectItem.ctor(slot0)
	slot0:config()
	slot0:layoutUI()
	slot0:registerEvent()
end

function FormHallowsSelectItem.config(slot0)
end

function FormHallowsSelectItem.layoutUI(slot0)
	slot0.size = cc.size(630, 148)

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("hero/form_hallows_select_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.item_icon = BackPackItem.new(false, false)

	slot0.item_icon:setPosition(cc.p(80, 80))
	slot0.main_container:addChild(slot0.item_icon)

	slot0.name_label = createLabel(24, Config.ColorData.data_color4[1], nil, 154, 117, "", slot0.main_container, 2, cc.p(0, 0.5))
	slot0.dec_label = createRichLabel(22, Config.ColorData.data_color3[175], cc.p(0, 1), cc.p(152, 90), 5, 0, 319)

	slot0.main_container:addChild(slot0.dec_label)

	slot0.look_btn = slot0.main_container:getChildByName("look_btn")
	slot0.comfirm_btn = slot0.main_container:getChildByName("comfirm_btn")
	slot0.comfirm_label = slot0.comfirm_btn:getChildByName("label")

	slot0.comfirm_label:setColor(cc.c3b(255, 255, 255))
end

function FormHallowsSelectItem.registerEvent(slot0)
	registerButtonEventListener(slot0.look_btn, handler(slot0, slot0.onClickLookBtn), true, 2)
	registerButtonEventListener(slot0.comfirm_btn, handler(slot0, slot0.onClickComfirmBtn), true, 2)
end

function FormHallowsSelectItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function FormHallowsSelectItem.onClickLookBtn(slot0)
	if not slot0.hallows_id then
		return
	end

	HallowsController:getInstance():openHallowsTips(true, slot0.hallows_id)
end

function FormHallowsSelectItem.onClickComfirmBtn(slot0)
	if not slot0.data then
		return
	end

	if slot0.data.hallows_vo == nil then
		message(TI18N("该神技未开启"))

		return
	end

	if slot0.callback then
		slot0:callback(slot0.data)
	end
end

function FormHallowsSelectItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	if not slot1.config then
		return
	end

	slot0.hallows_id = slot2.id
	slot3 = Config.ItemData.data_get_data(slot2.item_id)

	if slot1.hallows_vo and slot1.hallows_vo.look_id ~= 0 then
		if Config.HallowsData.data_magic[slot1.hallows_vo.look_id] then
			slot0.item_icon:setBaseData(slot4.item_id)
			slot0.item_icon:setMagicIcon(true)
		else
			slot0.item_icon:setBaseData(slot2.item_id)
			slot0.item_icon:setMagicIcon(false)
		end
	else
		slot0.item_icon:setBaseData(slot2.item_id)
		slot0.item_icon:setMagicIcon(false)
	end

	slot4, slot5 = nil
	slot6 = ""

	if slot1.hallows_vo ~= nil then
		slot5 = getNorKey(slot2.id, slot1.hallows_vo.skill_lev)
		slot4 = slot1.hallows_vo.step
		slot6 = (not HallowsController:getInstance():getModel():getHallowsRefineIsOpen() or uv0(TI18N("%s (%s级)【精炼+%d级】"), slot2.name, slot4, slot1.hallows_vo.refine_lev)) and uv0(TI18N("%s (%s级)"), slot2.name, slot4)

		slot0.look_btn:setPositionX(495)
	else
		slot5 = getNorKey(slot2.id, 1)
		slot6 = uv0("%s (%s%s)", slot2.name, 1, TI18N("级"))

		slot0.look_btn:setPositionX(380)
	end

	slot0.name_label:setString(slot6)

	if BackPackConst.quality_color[slot3.quality] then
		slot0.name_label:setColor(BackPackConst.quality_color[slot3.quality])
	end

	if Config.SkillData.data_get_skill(Config.HallowsData.data_skill_up(slot5).skill_bid) then
		slot9 = slot8.hallows_atk or 0
		slot10 = 0

		if slot1.hallows_vo then
			slot9, slot10 = slot1.hallows_vo:getHallowsSkillAndRefineAtkVal()
		end

		if StringUtil.SubStringGetTotalIndex(uv0(slot8.des, slot9 + slot10, slot10)) > 45 then
			slot12 = StringUtil.SubStringUTF8(slot12, 1, 45) .. "..."
		end

		slot0.dec_label:setString(slot12)
	else
		slot0.dec_label:setString(TI18N("该神技没有技能"))
	end

	if slot1.hallows_vo == nil then
		slot0.item_icon:setItemIconUnEnabled(true)

		slot0.lock_icon = createImage(slot0.main_container, PathTool.getResFrame("common", "common_90009"), 80, 80, cc.p(0.5, 0.5), true, 0, false)

		if slot0.non_label == nil then
			slot0.non_label = createLabel(26, Config.ColorData.data_color4[206], nil, 514, 72, TI18N("未开启"), slot0.main_container, 2, cc.p(0, 0.5))
		else
			slot0.non_label:setVisible(true)
		end

		slot0.comfirm_btn:setVisible(false)
		slot0.look_btn:setVisible(false)
	else
		slot0.item_icon:setItemIconUnEnabled(false)
		slot0:setBtnStatus(slot1.is_equip)
		slot0.look_btn:setVisible(true)

		if slot1.team_index ~= nil then
			if slot0.team_dec == nil then
				slot0.team_dec = createLabel(20, Config.ColorData.data_color4[206], nil, 611, 24, slot1.team_text or "", slot0.main_container, 2, cc.p(1, 0.5))
			else
				slot0.team_dec:setString(slot9)
			end
		elseif slot0.team_dec then
			slot0.team_dec:setString("")
		end

		if slot1.mine_text ~= nil then
			if slot0.team_mine_dec == nil then
				slot0.team_mine_dec = createLabel(20, Config.ColorData.data_color4[206], nil, 611, 24, slot1.mine_text, slot0.main_container, 2, cc.p(1, 0.5))
			else
				slot0.team_mine_dec:setString(slot1.mine_text)
			end

			setChildUnEnabled(true, slot0.comfirm_btn)
			slot0.comfirm_label:setColor(cc.c3b(255, 255, 255))
			slot0.comfirm_btn:setTouchEnabled(false)
		elseif slot0.team_mine_dec then
			slot0.team_mine_dec:setString("")
		end
	end
end

function FormHallowsSelectItem.setBtnStatus(slot0, slot1)
	if slot1 then
		slot0.comfirm_btn:loadTexture(PathTool.getResFrame("common", "common_1018"), LOADTEXT_TYPE_PLIST)
		slot0.comfirm_label:setString(TI18N("取消配置"))
		slot0.comfirm_label:enableOutline(Config.ColorData.data_color4[263], 2)
	else
		slot0.comfirm_btn:loadTexture(PathTool.getResFrame("common", "common_1017"), LOADTEXT_TYPE_PLIST)
		slot0.comfirm_label:setString(TI18N("装 配"))
		slot0.comfirm_label:enableOutline(Config.ColorData.data_color4[264], 2)
	end
end

function FormHallowsSelectItem.DeleteMe(slot0)
	if slot0.item_icon then
		slot0.item_icon:DeleteMe()

		slot0.item_icon = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
