HallowsTips = HallowsTips or BaseClass(BaseView)
slot1 = HallowsController:getInstance():getModel()
slot2 = string.format

function HallowsTips.__init(slot0)
	slot0.is_full_screen = false
	slot0.layout_name = "hallows/hallows_tips"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("tips", "tips"),
			type = ResourcesType.plist
		}
	}
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.base_list = {}
end

function HallowsTips.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.lab_name = slot0.main_panel:getChildByName("lab_name")
	slot0.node_dec = slot0.main_panel:getChildByName("node_dec")
	slot0.lab_dec = createRichLabel(22, cc.c3b(224, 191, 152), cc.p(0, 1), cc.p(0, 0), 5, 0, 366)

	slot0.node_dec:addChild(slot0.lab_dec)

	slot0.node_item = slot0.main_panel:getChildByName("node_item")
	slot0.lab_base = slot0.main_panel:getChildByName("lab_base")

	slot0.lab_base:setString(TI18N("基础属性(升级属性强化效果)"))

	slot0.lab_special = slot0.main_panel:getChildByName("lab_special")

	slot0.lab_special:setString(TI18N("特殊属性(升级技能强化效果)"))

	slot0.lab_refine = slot0.main_panel:getChildByName("lab_refine")
	slot4 = TI18N

	slot0.lab_refine:setString(slot4("精炼效果(升级神技精炼效果)"))

	slot0.attr_info_list = {}

	for slot4 = 1, 2 do
		slot0.attr_info_list[slot4] = {
			attr_label = slot0.main_panel:getChildByName("attr_label" .. slot4),
			attr_icon = slot0.main_panel:getChildByName("attr_icon" .. slot4)
		}
	end

	slot0.special_info_list = {}

	for slot4 = 1, 3 do
		slot0.special_info_list[slot4] = {
			apecial_left_label = slot0.main_panel:getChildByName("apecial_left_label" .. slot4),
			apecial_right_label = slot0.main_panel:getChildByName("apecial_right_label" .. slot4)
		}
	end

	slot0.refine_left_label = slot0.main_panel:getChildByName("refine_left_label1")
	slot0.refine_right_label = slot0.main_panel:getChildByName("refine_right_label1")
end

function HallowsTips.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openHallowsTips(false)
		end
	end)
end

function HallowsTips.openRootWnd(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = nil

	if type(slot1) == "number" then
		slot2 = uv0:getHallowsById(slot1)
	elseif type(slot1) == "table" then
		slot2 = slot1
	end

	if not slot2 then
		return
	end

	slot3 = slot2.id
	slot4 = 1
	slot5 = false

	if slot2 then
		slot4 = slot2.skill_lev
	else
		slot5 = true
	end

	slot0.config = Config.HallowsData.data_base[slot3]

	if not slot0.config then
		return
	end

	slot6 = ""

	slot0.lab_name:setString((not HallowsController:getInstance():getModel():getHallowsRefineIsOpen() or uv1(TI18N("%s(+%s)【精炼+%d级】"), slot0.config.name, slot2.step, slot2.refine_lev)) and uv1(TI18N("%s(+%s)"), slot0.config.name, slot2.step))

	slot7, slot8 = slot2:getHallowsSkillAndRefineAtkVal()

	if Config.ItemData.data_get_data(slot0.config.item_id) then
		if not slot0.hallows_item then
			slot0.hallows_item = BackPackItem.new(false, false)

			slot0.node_item:addChild(slot0.hallows_item)
		end

		if slot2.look_id ~= 0 then
			if Config.HallowsData.data_magic[slot2.look_id] then
				slot0.hallows_item:setBaseData(slot10.item_id)
				slot0.hallows_item:setMagicIcon(true)
			else
				slot0.hallows_item:setBaseData(slot0.config.item_id)
				slot0.hallows_item:setMagicIcon(false)
			end
		else
			slot0.hallows_item:setBaseData(slot0.config.item_id)
			slot0.hallows_item:setMagicIcon(false)
		end

		if slot5 then
			createImage(slot0.node_item, PathTool.getResFrame("common", "common_90009"), x, y, cc.p(0.5, 0.5), true, 0, false):setScale(0.8)
			setChildUnEnabled(true, slot0.hallows_item)
		end
	end

	if Config.HallowsData.data_skill_up(getNorKey(slot3, slot4)) and Config.SkillData.data_get_skill(slot11.skill_bid) then
		slot0.lab_dec:setString(uv1(slot12.des, slot7 + slot8, slot8))
	end

	for slot16, slot17 in ipairs(slot0.attr_info_list) do
		if slot2.add_attr[slot16] then
			slot21 = Config.AttrData.data_id_to_key[slot18.attr_id]

			loadSpriteTexture(slot17.attr_icon, PathTool.getResFrame("common", PathTool.getAttrIconByStr(slot21)), LOADTEXT_TYPE_PLIST)
			slot17.attr_label:setString(uv1("%s%s+%s", TI18N("全队"), Config.AttrData.data_key_to_name[slot21], slot18.attr_val))
		else
			slot17.attr_label:setVisible(false)
			slot17.attr_icon:setVisible(false)
		end
	end

	if Config.HallowsData.data_skill_attr[slot3] then
		for slot17, slot18 in ipairs(slot0.special_info_list) do
			if slot13[slot17] then
				slot18.apecial_left_label:setString(slot13[slot17].desc)
				slot18.apecial_right_label:setString(uv1(TI18N("技能等级%s级"), slot13[slot17].lev_limit))

				if slot5 or slot4 < slot13[slot17].lev_limit then
					slot18.apecial_left_label:setColor(cc.c3b(139, 123, 105))
					slot18.apecial_right_label:setColor(cc.c3b(139, 123, 105))
				end
			else
				slot18.apecial_left_label:setVisible(false)
				slot18.apecial_right_label:setVisible(false)
			end
		end
	end

	slot0.refine_left_label:setString(uv1(TI18N("神技技能真实伤害+%d"), slot8))
	slot0.refine_right_label:setString(uv1(TI18N("精炼等级%d级"), slot2.refine_lev))
end

function HallowsTips.close_callback(slot0)
	if slot0.hallows_item then
		slot0.hallows_item:DeleteMe()

		slot0.hallows_item = nil
	end

	uv0:openHallowsTips(false)
end
