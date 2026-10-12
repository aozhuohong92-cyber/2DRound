HeroBreakPanel = HeroBreakPanel or BaseClass(BaseView)
slot0 = HeroController:getInstance()
slot1 = string.format

function HeroBreakPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "hero/hero_break_panel"
	slot0.empty_res = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3")
	slot0.res_list = {
		{
			path = slot0.empty_res,
			type = ResourcesType.single
		}
	}
end

function HeroBreakPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot5 = 2

	slot0:playEnterAnimatianByObj(slot0.main_container, slot5)

	slot0.title = slot0.main_container:getChildByName("win_title")

	slot0.title:setString(TI18N("进阶"))

	slot0.item_cost_panel1 = slot0.main_container:getChildByName("item_cost_panel1")
	slot0.item_cost_panel2 = slot0.main_container:getChildByName("item_cost_panel2")
	slot0.item_icon1 = slot0.item_cost_panel1:getChildByName("item_icon")
	slot0.item_cost1 = slot0.item_cost_panel1:getChildByName("label")
	slot0.item_icon2 = slot0.item_cost_panel2:getChildByName("item_icon")
	slot0.item_cost2 = slot0.item_cost_panel2:getChildByName("label")
	slot1 = slot0.main_container:getChildByName("attr_panel")
	slot0.attr_icon_list = {}
	slot0.attr_label_key_list = {}
	slot0.attr_labe_left_list = {}
	slot0.attr_labe_right_list = {}

	for slot5 = 1, 5 do
		slot0.attr_icon_list[slot5] = slot1:getChildByName("attr_icon" .. slot5)
		slot0.attr_label_key_list[slot5] = slot1:getChildByName("attr_label_key" .. slot5)
		slot0.attr_labe_left_list[slot5] = slot1:getChildByName("attr_label_left" .. slot5)
		slot0.attr_labe_right_list[slot5] = slot1:getChildByName("attr_label_right" .. slot5)
	end

	slot0.attr_label_key_list[1]:setString(TI18N("等级上限:"))

	slot0.skill_panel = slot0.main_container:getChildByName("skill_panel")
	slot0.skill_title = slot0.skill_panel:getChildByName("label_title")
	slot0.skill_name = slot0.skill_panel:getChildByName("label_name")
	slot0.break_btn = slot0.main_container:getChildByName("break_btn")

	slot0.break_btn:getChildByName("label"):setString(TI18N("进阶"))
end

function HeroBreakPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0._onClickBtnClose), false, 1)
	registerButtonEventListener(slot0.break_btn, handler(slot0, slot0._onClickBtnBreak), true, 2)
	slot0:addGlobalEvent(HeroEvent.Next_Break_Info_Event, function (slot0)
		if not slot0 then
			return
		end

		if not uv0.hero_vo then
			return
		end

		uv0:setData(uv0.hero_vo, slot0)
	end)
end

function HeroBreakPanel._onClickBtnClose(slot0)
	uv0:openHeroBreakPanel(false)
end

function HeroBreakPanel._onClickBtnBreak(slot0)
	if not slot0.hero_vo then
		return
	end

	uv0:sender11004(slot0.hero_vo.id)
end

function HeroBreakPanel.openRootWnd(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.hero_vo = slot1

	uv0:sender11016(slot1.partner_id)
end

function HeroBreakPanel.setData(slot0, slot1, slot2)
	slot7 = slot1.use_skin or 0

	if Config.PartnerData.data_partner_brach[getNorKey(slot1.type, slot1.break_id, slot1.break_lev)] == nil or Config.PartnerData.data_partner_brach[getNorKey(slot1.type, slot1.break_id, slot1.break_lev + 1)] == nil then
		return
	end

	for slot11 = 1, 5 do
		if slot11 == 1 then
			slot0.attr_labe_left_list[slot11]:setString(slot4.lev_max)
			slot0.attr_labe_right_list[slot11]:setString(slot6.lev_max)
		elseif slot6.all_attr[slot11 - 1] then
			slot13 = slot12[1]

			loadSpriteTexture(slot0.attr_icon_list[slot11], PathTool.getResFrame("common", PathTool.getAttrIconByStr(slot13)), LOADTEXT_TYPE_PLIST)
			slot0.attr_label_key_list[slot11]:setString(Config.AttrData.data_key_to_name[slot13] .. ":")

			if slot13 == "hp_max" then
				slot13 = "hp"
			end

			slot0.attr_labe_left_list[slot11]:setString(slot1[slot13])
			slot0.attr_labe_right_list[slot11]:setString(slot2[slot13] or 0)
		end
	end

	if slot4.skill_num < slot6.skill_num then
		if Config.PartnerData.data_partner_star(getNorKey(slot1.bid, slot1.star)) then
			slot10 = nil

			for slot14, slot15 in ipairs(slot9.skills) do
				if slot15[1] == slot6.skill_num then
					slot16 = Config.PartnerSkinData.data_skilltonewskill[getNorKey(slot7, slot15[2])]

					if slot1.star >= 10 and slot16 then
						slot7 = slot16

						break
					end

					slot10 = slot15[2]

					break
				end
			end

			if slot10 ~= nil then
				slot0.skill_title:setString(TI18N("解锁技能"))

				slot0.skill_item = SkillItem.new(true, true, nil, 0.8, true)
				slot11 = slot0.skill_panel:getContentSize()

				slot0.skill_item:setPosition(cc.p(slot11.width / 2, slot11.height / 2))
				slot0.skill_panel:addChild(slot0.skill_item)

				if Config.SkillData.data_get_skill(slot10) then
					slot0.skill_item:setData(slot12)
					slot0.skill_item:addCallBack(function ()
						TipsManager:getInstance():showSkillTips(uv0)
					end)
					slot0.skill_name:setString(slot12.name)
				end
			else
				slot0:ShowNoneSkillInfo()
			end
		else
			slot0:ShowNoneSkillInfo()
		end
	else
		slot0:ShowNoneSkillInfo()
	end

	if #slot4.expend == 0 then
		slot0.item_cost_panel1:setVisible(false)
		slot0.item_cost_panel2:setVisible(false)
	else
		for slot11 = 1, 2 do
			if slot4.expend[slot11] then
				slot14 = slot0["item_icon" .. slot11]

				if Config.ItemData.data_get_data(slot12[1]) and slot14 then
					loadSpriteTexture(slot14, PathTool.getItemRes(slot13.icon, false), LOADTEXT_TYPE)
					slot14:setScale(0.4)
				end

				slot15 = BackpackController:getInstance():getModel():getItemNumByBid(slot12[1])

				slot0["item_cost" .. slot11]:setString(uv0("%s/%s", MoneyTool.GetMoneyString(slot15, false), MoneyTool.GetMoneyString(slot12[2], false)))

				if slot15 < slot12[2] then
					slot0["item_cost" .. slot11]:setColor(cc.c3b(255, 89, 67))
				end
			else
				slot0["self.item_cost_panel" .. slot11]:setVisible(false)
			end
		end
	end
end

function HeroBreakPanel.ShowNoneSkillInfo(slot0, ...)
	slot0.skill_title:setVisible(false)
	slot0.skill_name:setString(TI18N("什么都没有"))

	slot1 = slot0.skill_panel:getContentSize()

	createImage(slot0.skill_panel, slot0.empty_res, slot1.width / 2, slot1.height / 2, cc.p(0.5, 0.5), false):setScale(0.6)
end

function HeroBreakPanel.close_callback(slot0)
	if slot0.skill_item then
		slot0.skill_item:DeleteMe()

		slot0.skill_item = nil
	end

	uv0:openHeroBreakPanel(false)
end
