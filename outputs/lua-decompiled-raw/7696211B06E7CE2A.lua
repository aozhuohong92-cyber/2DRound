GuildskillLevelUpPanel = GuildskillLevelUpPanel or BaseClass(BaseView)
slot1 = GuildskillController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.remove

function GuildskillLevelUpPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "guildskill/guildskill_level_up_panel"
	slot0.res_list = {}
	slot0.item_list = {}
	slot0.title_height = 60
end

function GuildskillLevelUpPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("技能升级"))

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.Image_22 = slot0.main_panel:getChildByName("Image_22")
	slot0.arrow = slot0.main_panel:getChildByName("arrow")
	slot0.icon_bg_sp = slot0.main_panel:getChildByName("icon_bg_sp")
	slot0.left_lev = slot0.main_container:getChildByName("left_lev")
	slot0.right_lev = slot0.main_container:getChildByName("right_lev")
	slot0.skill_key = slot0.main_container:getChildByName("skill_key")

	slot0.skill_key:setString(TI18N("当前效果:"))

	slot0.next_skill_key = slot0.main_container:getChildByName("next_skill_key")

	slot0.next_skill_key:setString(TI18N("下一等级:"))

	slot0.skill_desc = createRichLabel(24, cc.c3b(100, 50, 35), cc.p(0, 1), cc.p(168, 433), nil, , 460)
	slot0.next_skill_desc = createRichLabel(24, cc.c3b(36, 144, 3), cc.p(0, 1), cc.p(168, 298), nil, , 460)

	slot0.main_container:addChild(slot0.skill_desc)
	slot0.main_container:addChild(slot0.next_skill_desc)

	slot0.skill_node = slot0.main_container:getChildByName("skill_node")
	slot0.tips = slot0.main_container:getChildByName("tips")

	slot0.tips:setString("")

	slot0.skill_item = SkillItem.new(true, true, true, nil, , false)
	slot4 = slot0.skill_item

	slot0.skill_node:addChild(slot4)

	slot0.cost_bg_list = {}

	for slot4 = 1, 2 do
		slot5 = slot0.main_container:getChildByName("cost_bg_" .. slot4)
		slot0.cost_bg_list[slot4] = {
			cost_bg = slot5,
			cost_icon = slot5:getChildByName("cost_icon"),
			cost_txt = slot5:getChildByName("cost_txt")
		}
	end

	slot0.right_btn = slot0.main_container:getChildByName("right_btn")
	slot0.right_btn_label = slot0.right_btn:getChildByName("label")

	slot0.right_btn_label:setString(TI18N("升 级"))

	slot1 = createImage(slot0.main_container, nil, 0, 0, cc.p(0, 0.5), false, 1)

	slot1:setAnchorPoint(0.5, 0)
	slot1:setScaleX(1.82)
	slot1:setPosition(cc.p(slot0.main_container:getContentSize().width / 2, 18))

	slot0.line_load = loadImageTextureFromCDN(slot1, PathTool.getPlistImgForDownLoad("bigbg/pattern", "pattern_1"), ResourcesType.single, slot0.line_load)
end

function GuildskillLevelUpPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 1)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.right_btn, handler(slot0, slot0.onClickRightBtn), true, 2)
end

function GuildskillLevelUpPanel.onClickBtnClose(slot0)
	uv0:openGuildskillLevelUpPanel(false)
end

function GuildskillLevelUpPanel.onClickRightBtn(slot0)
	if slot0.is_show_tips then
		message(slot0.is_show_tips)

		return
	end

	if slot0.career then
		uv0:send23708(slot0.career)
	end
end

function GuildskillLevelUpPanel.openRootWnd(slot0, slot1)
	if not uv0:getPvpskillInfoByCareer(slot1) then
		return
	end

	slot0.career = slot1

	slot0.left_lev:setString("Lv." .. slot2.skill_lev)
	slot0.right_lev:setString("Lv." .. slot2.skill_lev + 1)

	if slot2.skill_lev <= 0 then
		slot3 = 1
	end

	if Config.GuildSkillData.data_pvp_skill_info(getNorKey(slot1, slot3)) then
		slot6 = Config.SkillData.data_get_skill(slot5.skill_id)

		slot0.skill_item:setData(slot6)
		slot0.skill_item:showName(true, slot6.name, nil, 22, false, cc.c4b(100, 50, 35, 255), PathTool.getResFrame("common", "common_90003"), cc.size(168, 31))

		if slot2.skill_lev == 0 then
			slot0.skill_desc:setString(TI18N("无"))
			slot0.next_skill_desc:setString(slot6.des)
		else
			slot0.skill_desc:setString(slot6.des)

			if Config.GuildSkillData.data_pvp_skill_info(getNorKey(slot1, slot3 + 1)) then
				if Config.SkillData.data_get_skill(slot8.skill_id) then
					slot0.next_skill_desc:setString(slot9.des)
				end
			else
				slot0.next_skill_key:setVisible(false)
				slot0.next_skill_desc:setVisible(false)
				slot0.tips:setVisible(false)
				slot0.Image_22:setVisible(false)
				slot0.arrow:setVisible(false)
				slot0.right_lev:setVisible(false)

				slot12 = false

				slot0.right_btn:setVisible(slot12)

				for slot12, slot13 in ipairs(slot0.cost_bg_list) do
					slot13.cost_bg:setVisible(false)
				end

				slot0.tips_desc = createRichLabel(26, cc.c3b(100, 50, 35), cc.p(0.5, 0.5), cc.p(338, 77), nil, , 500)

				slot0.tips_desc:setString(TI18N("已经已达最大等级"))
				slot0.main_container:addChild(slot0.tips_desc)
				slot0.left_lev:setPositionX(338)

				return
			end
		end

		if slot2.skill_lev == 0 and not Config.GuildSkillData.data_pvp_skill_info(getNorKey(slot1, slot2.skill_lev)) then
			return
		end

		slot0:updateCostInfo(slot5.loss)

		slot7 = true

		for slot11, slot12 in ipairs(slot2.attr_formation) do
			if slot12.lev < slot5.need_lev then
				slot7 = false
			end
		end

		if not slot7 then
			slot0.is_show_tips = uv1(TI18N("需要每个%s属性达%s级"), PartnerConst.Hero_Type[slot1] or "", slot5.need_lev)

			slot0.tips:setString(slot0.is_show_tips)
			slot0.right_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
			setChildUnEnabled(true, slot0.right_btn)
		end
	end
end

function GuildskillLevelUpPanel.updateCostInfo(slot0, slot1)
	for slot5 = 1, 2 do
		slot8 = slot0.cost_bg_list[slot5].cost_txt

		if slot1[slot5] then
			slot10 = slot6[2]
			slot11 = 0

			if Config.ItemData.data_get_data(slot6[1]) then
				slot0.cost_bg_list[slot5].cost_icon:loadTexture(PathTool.getItemRes(slot12.icon), LOADTEXT_TYPE)

				slot11 = BackpackController:getInstance():getModel():getItemNumByBid(slot9)

				slot8:setString(MoneyTool.GetMoneyString(slot11) .. "/" .. MoneyTool.GetMoneyString(slot10))

				if slot10 <= slot11 then
					slot8:setTextColor(cc.c3b(255, 246, 228))
				else
					slot8:setTextColor(cc.c3b(255, 139, 139))
				end
			end
		else
			slot8:setString("")
		end
	end
end

function GuildskillLevelUpPanel.close_callback(slot0)
	if slot0.line_load then
		slot0.line_load:DeleteMe()
	end

	slot0.line_load = nil

	if slot0.skill_item then
		slot0.skill_item:DeleteMe()

		slot0.skill_item = nil
	end

	uv0:openGuildskillLevelUpPanel(false)
end
