slot0 = HeroController:getInstance()
slot1 = HeroController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
HolyequipmentSaveTips = HolyequipmentSaveTips or BaseClass(BaseView)

function HolyequipmentSaveTips.__init(slot0)
	slot0.is_full_screen = false
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "hero/hero_holy_save_plan_tips"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("hero", "hero"),
			type = ResourcesType.plist
		}
	}
	slot0.item_node_list = {}
	slot0.enter_status = false
end

function HolyequipmentSaveTips.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")

	slot0:playEnterAnimatianByObj(slot0.main_panel, 2)
	slot0.main_panel:getChildByName("title_container"):getChildByName("title_label"):setString(TI18N("提示"))

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.confirm_btn = slot0.main_panel:getChildByName("confirm_btn")

	slot0.confirm_btn:getChildByName("label"):setString(TI18N("确 定"))

	slot0.cancel_btn = slot0.main_panel:getChildByName("cancel_btn")

	slot0.cancel_btn:getChildByName("label"):setString(TI18N("取 消"))

	slot0.box_btn = slot0.main_panel:getChildByName("box_btn")

	slot0.box_btn:getChildByName("name"):setString(TI18N("今日不再提示"))

	slot0.tips_label = createRichLabel(24, 274, cc.p(0.5, 0.5), cc.p(325, 374), 5, nil, 594)

	slot0.main_panel:addChild(slot0.tips_label)
end

function HolyequipmentSaveTips.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.handleCbSelectStatus), true, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.handleCbSelectStatus), true, 2)
	registerButtonEventListener(slot0.confirm_btn, function ()
		if uv0.equip_list and uv0.select_vo then
			slot0 = {}
			slot1 = true

			for slot5, slot6 in pairs(uv0.equip_list) do
				slot7 = 0

				if uv0.select_vo.config.type == slot5 then
					if uv1.dic_itemid_to_partner_id[uv0.select_vo.id] then
						slot7 = uv1.dic_itemid_to_partner_id[uv0.select_vo.id]
					end

					table.insert(slot0, {
						partner_id = slot7,
						item_id = uv0.select_vo.id
					})

					slot1 = false
				else
					if uv1.dic_itemid_to_partner_id[slot6.id] then
						slot7 = uv1.dic_itemid_to_partner_id[slot6.id]
					end

					table.insert(slot0, {
						partner_id = slot7,
						item_id = slot6.id
					})
				end
			end

			if slot1 then
				slot2 = 0

				if uv1.dic_itemid_to_partner_id[uv0.select_vo.id] then
					slot2 = uv1.dic_itemid_to_partner_id[uv0.select_vo.id]
				end

				table.insert(slot0, {
					partner_id = slot2,
					item_id = uv0.select_vo.id
				})
			end

			uv2:sender25221(uv0.id, uv0.partner_id, uv0.name, slot0)
		else
			slot0 = {}

			for slot5, slot6 in pairs(uv1:getHeroHolyEquipList(uv0.partner_id)) do
				if slot6 then
					table.insert(slot0, {
						partner_id = uv0.partner_id,
						item_id = slot6.id
					})
				end
			end

			uv2:sender25221(uv0.id, uv0.partner_id, uv0.name, slot0)
		end

		SysEnv:getInstance():save()
		uv2:openHolyequipmentSaveTips(false)
	end, true, 1)
	registerButtonEventListener(slot0.cancel_btn, handler(slot0, slot0.handleCbSelectStatus), true, 1)
	slot0.box_btn:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.holy_plan_save_tip, true, false)
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.holy_plan_save_tip, false, false)
		end
	end)
end

function HolyequipmentSaveTips.handleCbSelectStatus(slot0)
	if SysEnv:getInstance():getBool(SysEnv.keys.holy_plan_save_tip, false) ~= slot0.enter_status then
		SysEnv:getInstance():set(SysEnv.keys.holy_plan_save_tip, slot0.enter_status, false)
	end

	uv0:openHolyequipmentSaveTips(false)
end

function HolyequipmentSaveTips.openRootWnd(slot0, slot1)
	slot0.holy_data = slot1
	slot0.id = slot1.id
	slot0.name = slot1.name
	slot0.partner_id = slot1.partner_id
	slot0.item_list = slot1.item_list
	slot0.equip_list = slot1.equip_list
	slot0.select_vo = slot1.select_vo

	slot0:setData()
end

function HolyequipmentSaveTips.setData(slot0)
	if not slot0.holy_data then
		return
	end

	slot6 = TI18N("为<div fontcolor=249003>【%s】</div>保存新组合，会将以下神装从对应方案中卸下，是否继续?")

	slot0.tips_label:setString(uv0(slot6, slot0.name))

	slot1 = SysEnv:getInstance():getBool(SysEnv.keys.holy_plan_save_tip, false)

	slot0.box_btn:setSelected(slot1)

	slot0.enter_status = slot1

	for slot6 = 1, 4 do
		if slot0.item_list[HeroConst.HolyequipmentPosList[slot6]] then
			uv1({}, slot0.item_list[slot7])
		end
	end

	if tableLen(slot0.item_list) > 0 then
		if slot3 < 4 then
			slot4 = 102 + (4 - slot3) * 75
		end

		for slot8 = 1, #slot2 do
			if not slot0.item_node_list[slot8] then
				slot9 = HolyequipmentSaveItem.new(HeroConst.HolyequipmentPosList[slot8])

				slot0.main_panel:addChild(slot9)

				slot0.item_node_list[slot8] = slot9
			end

			if slot2[slot8] then
				slot9:setData(slot2[slot8])
			end

			slot9:setPosition(cc.p(slot4 + (slot8 - 1) * 148, 230))
		end
	end
end

function HolyequipmentSaveTips.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.item_node_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	uv0:openHolyequipmentSaveTips(false)
end

HolyequipmentSaveItem = class("HolyequipmentSaveItem", function ()
	return ccui.Widget:create()
end)

function HolyequipmentSaveItem.ctor(slot0, slot1)
	slot0.holy_type = slot1

	slot0:config()
	slot0:layoutUI()
end

function HolyequipmentSaveItem.config(slot0)
	slot0.size = cc.size(138, 211)

	slot0:setContentSize(slot0.size)
end

function HolyequipmentSaveItem.layoutUI(slot0)
	slot0.container = ccui.Layout:create()

	slot0.container:setContentSize(slot0.size)
	slot0:addChild(slot0.container)

	slot1 = createSprite(PathTool.getResFrame("common", "common_90097"), slot0.size.width / 2, 63, slot0.container, cc.p(0.5, 0.5))
	slot0.item_node = BackPackItem.new(false, true, nil, 1, false)

	slot0.item_node:setDefaultTip(true, false)
	slot0.item_node:setPosition(cc.p(slot0.size.width / 2, slot0.size.height - BackPackItem.Height / 2 - 15))
	slot0.container:addChild(slot0.item_node)

	slot0.item_node.empty_icon = createImage(slot0.item_node:getRoot(), PathTool.getResFrame("hero", HeroConst.HolyEmptyIconName[slot0.holy_type]), 60, 60, cc.p(0.5, 0.5), true, 10, false)

	createImage(slot0.container, PathTool.getResFrame("common", "common_90096"), slot0.size.width / 2, 32, cc.p(0.5, 0.5), true, nil, true):setContentSize(cc.size(138, 30))

	slot0.name_label = createLabel(20, 274, nil, slot0.size.width / 2, 32, "", slot0.container, nil, cc.p(0.5, 0.5))
end

function HolyequipmentSaveItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	if slot1.item_vo then
		slot0.item_node:setData(slot1.item_vo)

		if slot0.item_node.empty_icon then
			slot0.item_node.empty_icon:setVisible(false)
		end

		slot0.item_node.data = slot1.item_vo
	else
		slot0.item_node:setData()

		if slot0.item_node.empty_icon then
			slot0.item_node.empty_icon:setVisible(true)
		end

		slot0.item_node.data = nil
	end

	if slot1.name then
		slot0.name_label:setString(slot1.name)
	end
end

function HolyequipmentSaveItem.DeleteMe(slot0)
	if slot0.item_node then
		slot0.item_node:DeleteMe()

		slot0.item_node = nil
	end
end
