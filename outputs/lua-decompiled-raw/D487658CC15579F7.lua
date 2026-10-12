HeroTalentSkillLevelUpPanel = HeroTalentSkillLevelUpPanel or BaseClass(BaseView)
slot1 = HeroController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.remove

function HeroTalentSkillLevelUpPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "hero/hero_talent_skill_level_up_panel"
	slot0.res_list = {}
	slot0.item_list = {}
end

function HeroTalentSkillLevelUpPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.title = slot0.main_container:getChildByName("win_title")

	slot0.title:setString(TI18N("技能升级"))

	slot0.skill_up_panel = slot0.main_container:getChildByName("skill_up_panel")
	slot0.skill_up_info = {
		skill_item = SkillItem.new(true, true, true, nil, , false)
	}

	slot0.skill_up_info.skill_item:setScale(0.9)
	slot0.skill_up_panel:getChildByName("show_item_node"):addChild(slot0.skill_up_info.skill_item)

	slot0.skill_up_info.skill_name = slot0.skill_up_panel:getChildByName("skill_name")
	slot0.skill_up_info.skill_desc = createRichLabel(22, cc.c4b(100, 50, 35, 255), cc.p(0, 1), cc.p(0, 0), nil, , 440)

	slot0.skill_up_panel:getChildByName("dec_node"):addChild(slot0.skill_up_info.skill_desc)

	slot0.skill_down_panel = slot0.main_container:getChildByName("skill_down_panel")
	slot0.skill_down_info = {
		skill_item = SkillItem.new(true, true, true, nil, , false)
	}

	slot0.skill_down_info.skill_item:setScale(0.9)
	slot0.skill_down_panel:getChildByName("show_item_node"):addChild(slot0.skill_down_info.skill_item)

	slot0.skill_down_info.skill_name = slot0.skill_down_panel:getChildByName("skill_name")
	slot0.skill_down_info.skill_desc = createRichLabel(22, cc.c4b(100, 50, 35, 255), cc.p(0, 1), cc.p(0, 0), nil, , 440)

	slot0.skill_down_panel:getChildByName("dec_node"):addChild(slot0.skill_down_info.skill_desc)

	slot0.box_90025_2 = slot0.main_container:getChildByName("box_90025_2")
	slot0.page_name_1 = slot0.main_container:getChildByName("page_name_1")

	slot0.page_name_1:setString(TI18N("技能升级"))

	slot0.page_name_2 = slot0.main_container:getChildByName("page_name_2")

	slot0.page_name_2:setString(TI18N("升级消耗"))

	slot0.cost_node = slot0.main_container:getChildByName("cost_node")
	slot0.left_btn = slot0.main_container:getChildByName("left_btn")

	slot0.left_btn:getChildByName("label"):setString(TI18N("遗忘技能"))

	slot0.right_btn = slot0.main_container:getChildByName("right_btn")

	slot0.right_btn:getChildByName("label"):setString(TI18N("升 级"))

	slot0.arrow = slot0.main_container:getChildByName("Sprite_1")
	slot0.skill_max_label = slot0.main_container:getChildByName("skill_max_label")

	slot0.skill_max_label:setString("")
end

function HeroTalentSkillLevelUpPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 1)
	registerButtonEventListener(slot0.left_btn, handler(slot0, slot0.onClickBtnLeft), true, 2)
	registerButtonEventListener(slot0.right_btn, handler(slot0, slot0.onClickBtnRight), true, 2)
	slot0:addGlobalEvent(HeroEvent.Hero_Level_Up_Talent_Event, function (slot0)
		if not slot0 then
			return
		end

		if not uv0.hero_vo then
			return
		end

		if slot0.partner_id == uv0.hero_vo.partner_id then
			uv0:initSkillInfo(uv0.hero_vo.talent_skill_list[uv0.pos])
		end
	end)
end

function HeroTalentSkillLevelUpPanel.onClickBtnClose(slot0)
	uv0:openHeroTalentSkillLevelUpPanel(false)
end

function HeroTalentSkillLevelUpPanel.onClickBtnLeft(slot0)
	if not slot0.skill_id then
		return
	end

	if not slot0.hero_vo then
		return
	end

	if not slot0.pos then
		return
	end

	if Config.PartnerSkillData.data_partner_skill_back_fun(slot0.skill_id) then
		if #slot1.expend == 0 then
			uv0:sender11098(slot0.hero_vo.partner_id, slot0.pos)
			slot0:onClickBtnClose()

			return
		end

		for slot6, slot7 in ipairs(slot1.expend) do
			if Config.ItemData.data_get_data(slot7[1]) then
				if slot6 ~= 1 then
					slot2 = TI18N("遗忘该技能需消耗 ") .. ", "
				end

				slot2 = slot2 .. uv1(TI18N("<img src=%s visible=true scale=0.32 /><div fontColor=#289b14 fontsize= 24>%s</div>"), PathTool.getItemRes(slot8.icon), slot7[2])
			end
		end

		if #slot1.award1 > 0 then
			for slot6, slot7 in ipairs(slot1.award1) do
				if Config.ItemData.data_get_data(slot7[1]) then
					if slot6 ~= 1 then
						slot2 = slot2 .. "\n(同时返还 " .. ", "
					end

					slot2 = slot2 .. uv1(TI18N("<img src=%s visible=true scale=0.32 /><div fontColor=#289b14 fontsize= 24>%s</div>"), PathTool.getItemRes(slot8.icon), slot7[2])
				end
			end

			slot2 = slot2 .. ")"
		end

		CommonAlert.show(slot2, TI18N("确认"), function ()
			uv0:sender11098(uv1.hero_vo.partner_id, uv1.pos)
			uv1:onClickBtnClose()
		end, TI18N("取消"), nil, CommonAlert.type.rich, nil, , , true)
	else
		uv0:sender11098(slot0.hero_vo.partner_id, slot0.pos)
		slot0:onClickBtnClose()
	end
end

function HeroTalentSkillLevelUpPanel.onClickBtnRight(slot0)
	if not slot0.hero_vo then
		return
	end

	if not slot0.pos then
		return
	end

	uv0:sender11097(slot0.hero_vo.partner_id, slot0.pos)
end

function HeroTalentSkillLevelUpPanel.openRootWnd(slot0, slot1, slot2, slot3)
	if not slot1 then
		return
	end

	if not slot3 then
		return
	end

	if not slot2 then
		return
	end

	slot0.pos = slot3
	slot0.hero_vo = slot1

	slot0:initSkillInfo(slot2)
end

function HeroTalentSkillLevelUpPanel.initSkillInfo(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.skill_id = slot1

	if Config.PartnerSkillData.data_partner_skill_level_fun(slot1) then
		slot0:showSkillInfo(slot2.id, slot0.skill_up_info)
		slot0:showSkillInfo(slot2.next_id, slot0.skill_down_info)
		slot0:showCostInfo(slot2)
	else
		slot7 = slot0.skill_up_info

		slot0:showSkillInfo(slot1, slot7)
		slot0.box_90025_2:setVisible(false)
		slot0.page_name_2:setVisible(false)
		slot0.arrow:setVisible(false)
		slot0.right_btn:setVisible(false)
		slot0.skill_max_label:setString(TI18N("该技能已满级"))

		slot6 = false

		slot0.skill_down_panel:setVisible(slot6)

		for slot6, slot7 in ipairs(slot0.item_list) do
			slot7:setVisible(false)
		end

		slot0.skill_bg = createSprite(nil, 337, 298, slot0.main_container, cc.p(0.5, 0.5), LOADTEXT_TYPE)

		slot0.skill_bg:setZOrder(1)

		slot0.item_load = loadSpriteTextureFromCDN(slot0.skill_bg, PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_talent_skill_max", false), ResourcesType.single, slot0.item_load)

		slot0.skill_max_label:setZOrder(2)
		slot0.skill_max_label:setPositionY(307)
		slot0.left_btn:setZOrder(2)
		slot0.left_btn:setPosition(slot0.main_container:getContentSize().width * 0.5, 61)
	end
end

function HeroTalentSkillLevelUpPanel.showSkillInfo(slot0, slot1, slot2)
	if not Config.SkillData.data_get_skill(slot1) then
		return
	end

	if slot2.skill_item then
		slot2.skill_item:setData(slot3)
	end

	slot2.skill_name:setString(slot3.name)
	slot2.skill_desc:setString(slot3.des)
end

function HeroTalentSkillLevelUpPanel.showCostInfo(slot0, slot1)
	if not slot1 then
		return
	end

	for slot5, slot6 in ipairs(slot0.item_list) do
		slot6:setPositionX(10000)
	end

	slot3 = -(BackPackItem.Width + 160) * #slot1.expend / 2 + 80

	for slot7, slot8 in ipairs(slot1.expend) do
		if slot0.item_list[slot7] == nil then
			slot0.item_list[slot7] = BackPackItem.new(true, true)

			slot0.item_list[slot7]:setAnchorPoint(0.5, 0.5)
			slot0.item_list[slot7]:setScale(0.8)
			slot0.cost_node:addChild(slot0.item_list[slot7])
		end

		slot0.item_list[slot7]:setPosition(slot3 + (slot7 - 1) * slot2, 0)

		if Config.ItemData.data_get_data(slot8[1]) then
			slot0.item_list[slot7]:setData(slot10)
			slot0.item_list[slot7]:setNeedNum2(slot8[2], BackpackController:getInstance():getModel():getItemNumByBid(slot10.id))
			slot0.item_list[slot7]:setDefaultTip(true, nil, , 1)
			slot0.item_list[slot7]:setGoodsName(slot10.name, cc.p(174, 61), 24, cc.c4b(100, 50, 35, 255))
		end
	end
end

function HeroTalentSkillLevelUpPanel.close_callback(slot0)
	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end

	if slot0.skill_up_info and slot0.skill_up_info.skill_item then
		slot0.skill_up_info.skill_item:DeleteMe()

		slot0.skill_up_info = nil
	end

	if slot0.skill_down_info and slot0.skill_down_info.skill_item then
		slot0.skill_down_info.skill_item:DeleteMe()

		slot0.skill_down_info = nil
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()
	end

	slot0.item_load = nil

	uv0:openHeroTalentSkillLevelUpPanel(false)
end
