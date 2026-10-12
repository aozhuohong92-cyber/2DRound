SkillTips = SkillTips or BaseClass(BaseView)
slot0 = string.format

function SkillTips.__init(slot0, ...)
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "tips/skill_tips"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("tips", "tips"),
			type = ResourcesType.plist
		}
	}
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
end

function SkillTips.open_callback(slot0, ...)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.container = slot0.main_panel:getChildByName("container")
	slot0.container_init_size = slot0.container:getContentSize()
	slot0.base_panel = slot0.container:getChildByName("base_panel")
	slot0.base_panel_height = slot0.base_panel:getContentSize().height
	slot0.Sprite_3 = slot0.base_panel:getChildByName("Sprite_3")
	slot0.skill_icon = slot0.base_panel:getChildByName("skill_icon")

	slot0.Sprite_3:setVisible(false)
	slot0.skill_icon:setVisible(false)

	slot0.skill_item = SkillItem.new(false, false, false, nil, nil, false)

	slot0.skill_item:setPosition(76, 68)
	slot0.base_panel:addChild(slot0.skill_item)

	slot0.skill_name = slot0.base_panel:getChildByName("name")
	slot0.skill_type = slot0.base_panel:getChildByName("skill_type")
	slot0.line = slot0.container:getChildByName("line")
end

function SkillTips.register_event(slot0)
	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0:close()
			end
		end)
	end
end

function SkillTips.updateVo(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot0.skill_vo = slot1
	slot7 = slot1.level or 1

	if slot1.client_lev and slot1.client_lev > 0 then
		slot7 = slot1.client_lev
	end

	if not slot4 then
		slot0.skill_name:setString(slot1.name .. "  Lv." .. slot7)
	else
		slot0.skill_name:setString(slot1.name)
	end

	slot0.skill_item:setData(slot1)
	slot0.skill_type:setVisible(true)

	if slot1.type == "active_skill" then
		slot0.skill_type:setString(TI18N("类型：主动技能"))
	else
		slot0.skill_type:setString(TI18N("类型：被动技能"))
	end

	slot8 = 4 + slot0.base_panel_height
	slot9 = 0

	if slot0.skill_vo.des ~= "" then
		if slot0.skill_desc == nil then
			slot0.skill_desc = createRichLabel(22, cc.c4b(254, 238, 186, 255), cc.p(0, 1), cc.p(22, 10), 4, nil, 370)

			slot0.container:addChild(slot0.skill_desc)
		end

		if slot0.skill_vo.hallows_atk and slot0.skill_vo.hallows_atk > 0 and slot6 then
			slot0.skill_desc:setString(string.format(slot0.skill_vo.des, slot0.skill_vo.hallows_atk + slot6, slot6))
		else
			slot0.skill_desc:setString(slot0.skill_vo.des)
		end

		slot8 = slot8 + slot0.skill_desc:getContentSize().height + 2
	end

	slot10 = 0

	if slot0.extend_desc == nil then
		slot0.extend_desc = createRichLabel(22, cc.c4b(255, 238, 221, 255), cc.p(0, 1), cc.p(22, 10), nil, nil, 370)

		slot0.container:addChild(slot0.extend_desc)
	end

	if not slot4 then
		slot11 = ""
		slot11 = (slot0.skill_vo.cd ~= 0 or TI18N("无冷却时间")) and uv0("<div fontcolor=#ffeedd>%s</div><div fontcolor=#14ff32>%s</div><div fontcolor=#ffeedd>%s</div>", TI18N("冷却"), slot0.skill_vo.cd, TI18N("回合"))

		if slot5 and slot5 ~= 0 then
			-- Nothing
		elseif not slot0.skill_vo.fire_cd then
			slot5 = 0
		end

		if slot5 ~= 0 then
			slot11 = slot11 .. uv0("<div fontcolor=#ffeedd>%s</div><div fontcolor=#14ff32>%s</div><div fontcolor=#ffeedd>%s</div>", TI18N("，第"), slot5, TI18N("回合释放"))
		end

		slot0.extend_desc:setString(slot11)
	end

	slot8 = slot8 + slot0.extend_desc:getContentSize().height + 18
	slot11 = ""
	slot12 = 0

	if slot0.skill_vo.buff_des ~= nil and slot0.skill_vo.buff_des[1] and next(slot0.skill_vo.buff_des[1]) then
		slot0.line:setVisible(true)

		for slot17, slot18 in ipairs(slot0.skill_vo.buff_des[1]) do
			if Config.SkillData.data_get_buff[slot18] then
				if slot11 ~= "" then
					slot11 = slot11 .. "<div fontcolor=#a1978b>\n</div>"
				end

				slot11 = slot11 .. uv0("<div fontcolor=#ffeedd>【%s】</div><div fontcolor=#a1978b>\n%s</div>", slot19.name, slot19.desc)
			end
		end
	end

	if slot11 ~= "" then
		if slot0.buff_desc == nil then
			slot0.buff_desc = createRichLabel(20, cc.c4b(255, 238, 221, 255), cc.p(0, 1), cc.p(22, 10), 4, nil, 370)

			slot0.container:addChild(slot0.buff_desc)
		end

		slot0.buff_desc:setString(slot11)

		slot12 = slot0.buff_desc:getContentSize().height
		slot8 = slot8 + slot0.buff_desc:getContentSize().height + 10
	end

	if slot0.skill_vo.open_desc ~= "" and not slot3 and not slot4 then
		if slot0.line_2 == nil then
			slot0.line_2 = createSprite(PathTool.getResFrame("tips", "tips_8"), slot0.container_init_size.width / 2, 0, slot0.container, cc.p(0.5, 1), LOADTEXT_TYPE_PLIST)

			slot0.line_2:setScaleX(7.6)
		end

		slot13 = ""
		slot13 = (not slot2 or slot0.skill_vo.open_desc) and (slot0.skill_vo.next_id ~= 0 or uv0(TI18N("<div fontcolor=#ffeedd>技能已满级</div>"))) and slot0.skill_vo.skill_desc

		if slot0.next_skill_txt == nil then
			slot0.next_skill_txt = createRichLabel(22, cc.c4b(255, 238, 221, 255), cc.p(0, 1), cc.p(22, 10), 4, nil, 370)

			slot0.container:addChild(slot0.next_skill_txt)
		end

		slot0.next_skill_txt:setString(slot13)

		slot8 = slot8 + slot0.next_skill_txt:getContentSize().height + 25
	end

	slot8 = slot8 + 20

	slot0.container:setContentSize(cc.size(slot0.container_init_size.width, slot8))
	slot0.base_panel:setPositionY(slot8 - 4)
	slot0.skill_desc:setPositionY(slot8 - 6 - slot0.base_panel_height)
	slot0.extend_desc:setPositionY(slot8 - 24 - slot0.base_panel_height - slot9)
	slot0.line:setPositionY(slot8 - 30 - slot0.base_panel_height - slot9 - slot10)

	if slot0.buff_desc then
		slot0.buff_desc:setPositionY(slot8 - 38 - slot0.base_panel_height - slot9 - slot10)
	end

	if slot0.line_2 then
		slot0.line_2:setPositionY(slot8 - 44 - slot0.base_panel_height - slot9 - slot10 - slot12)
	end

	if slot0.next_skill_txt then
		slot0.next_skill_txt:setPositionY(slot8 - 52 - slot0.base_panel_height - slot9 - slot10 - slot12)
	end
end

function SkillTips.updatePosition(slot0)
	slot0.root_wnd:setContentSize(cc.size(504, slot0.max_height))
	slot0.back:setContentSize(cc.size(504, slot0.max_height))
	slot0.skill_type:setPositionY(slot0.max_height - 110)
	slot0.skill_back:setPositionY(slot0.max_height - 145)
	slot0.skill_name:setPositionY(slot0.max_height - 50)
	slot0.skill_lev:setPositionY(slot0.max_height - 80)
	slot0.desc3:setPositionY(slot0.max_height - 170)
	slot0.desc1:setPositionY(slot0.max_height - 170)
	slot0.line1:setPositionY(slot0.max_height - 155)
end

function SkillTips.setPosition(slot0, slot1, slot2)
end

function SkillTips.setPos(slot0, slot1, slot2)
end

function SkillTips.getContentSize(slot0)
	return slot0.root_wnd:getContentSize()
end

function SkillTips.openRootWnd(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot0:updateVo(slot1, slot2, slot3, slot4, slot5, slot6)
	delayRun(slot0.root_wnd, 114, function ()
		TipsManager:getInstance():hideTips()
	end)
end

function SkillTips.close_callback(slot0, ...)
end
