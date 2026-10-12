ElfinTipsWindow = ElfinTipsWindow or BaseClass(BaseView)
slot0 = string.format
slot1 = ElfinController:getInstance()
slot2 = table.insert

function ElfinTipsWindow.__init(slot0)
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "tips/elfin_tips"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("tips", "tips"),
			type = ResourcesType.plist
		}
	}
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
end

function ElfinTipsWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.old_con_size = slot0.container:getContentSize()
	slot0.close_btn = slot0.container:getChildByName("close_btn")
	slot0.base_panel = slot0.container:getChildByName("base_panel")
	slot0.elfin_name = slot0.base_panel:getChildByName("name")

	slot0.base_panel:getChildByName("score_title"):setString(TI18N("评分："))

	slot0.power_label = CommonNum.new(1, slot0.base_panel, 1, -2, cc.p(0, 0))

	slot0.power_label:setPosition(cc.p(230, 66))
	slot0.power_label:setNum(0)
	slot0.power_label:setScale(0.8)

	slot0.skill_panel = slot0.container:getChildByName("skill_panel")

	slot0.skill_panel:getChildByName("label"):setString(TI18N("幽灵技能"))

	slot0.skill_icon = slot0.skill_panel:getChildByName("skill_icon")
	slot0.skill_name = slot0.skill_panel:getChildByName("name")
	slot0.skill_type = slot0.skill_panel:getChildByName("skill_type")
	slot0.skill_line = slot0.skill_panel:getChildByName("line")

	slot0.skill_line:setVisible(false)

	slot4 = "tab_panel"
	slot0.tab_panel = slot0.container:getChildByName(slot4)
	slot0.tab_list = {}

	for slot4 = 1, 3 do
		if slot0.tab_panel:getChildByName("tab_btn_" .. slot4) then
			uv0(slot0.tab_list, slot5)
		end
	end
end

function ElfinTipsWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:close()
	end, false, 2)

	function slot4()
		uv0:close()
	end

	slot5 = false

	registerButtonEventListener(slot0.close_btn, slot4, slot5, 2)

	for slot4, slot5 in ipairs(slot0.tab_list) do
		registerButtonEventListener(slot5, function ()
			uv0:onClickBtnByIndex(uv1)
		end, true)
	end
end

function ElfinTipsWindow.onClickBtnByIndex(slot0, slot1)
	if not slot0.elfin_bid then
		return
	end

	if slot1 == 1 then
		BackpackController:getInstance():openItemSellPanel(true, BackpackController:getModel():getBackPackItemByBid(slot0.elfin_bid), BackPackConst.Bag_Code.BACKPACK, 3)
	elseif slot1 == 2 then
		ElfinController:getInstance():openElfinCompoundWindow(true, slot0.elfin_bid)
	elseif slot1 == 3 then
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.partner, HeroConst.BagTab.eElfin, ElfinConst.Tab_Index.Rouse)
	end

	slot0:close()
end

function ElfinTipsWindow.openRootWnd(slot0, slot1, slot2)
	slot0.elfin_bid = slot1
	slot0.is_show_btn = slot2 or false

	slot0:setData(slot1)
end

function ElfinTipsWindow.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot3 = Config.ItemData.data_get_data(slot1)

	if not Config.SpriteData.data_elfin_data(slot1) or not slot3 then
		return
	end

	slot0.power_label:setNum(slot2.power)

	slot4 = 0

	if slot3.quality >= 0 and slot3.quality <= 5 then
		slot4 = slot3.quality
	end

	loadSpriteTexture(slot0.base_panel, PathTool.getResFrame("tips", "tips_" .. slot4), LOADTEXT_TYPE_PLIST)
	slot0.elfin_name:setTextColor(BackPackConst.getEquipTipsColor(slot4))
	slot0.elfin_name:setString(slot3.name)

	if not slot0.elfin_item then
		slot0.elfin_item = BackPackItem.new(false, false)

		slot0.elfin_item:setPosition(cc.p(70, 69))
		slot0.base_panel:addChild(slot0.elfin_item)
	end

	slot0.elfin_item:setData(slot3)

	slot7 = slot0.old_con_size.height

	if slot2.skill and Config.SkillData.data_get_skill(slot2.skill) then
		slot0.skill_name:setString(uv0("%s Lv.%d", slot8.name, slot8.level))

		if slot8.type == "active_skill" then
			slot0.skill_type:setString(TI18N("类型：主动技能"))
		else
			slot0.skill_type:setString(TI18N("类型：被动技能"))
		end

		loadSpriteTexture(slot0.skill_icon, PathTool.getSkillRes(slot8.icon), LOADTEXT_TYPE)

		if not slot0.skill_desc then
			slot0.skill_desc = createRichLabel(22, cc.c4b(254, 238, 186, 255), cc.p(0, 1), cc.p(22, -85), 4, nil, 370)

			slot0.skill_panel:addChild(slot0.skill_desc)
		end

		slot0.skill_desc:setString(slot8.des)

		slot7 = slot7 + slot0.skill_desc:getContentSize().height + 10

		if not slot0.extend_desc then
			slot0.extend_desc = createRichLabel(22, cc.c4b(255, 238, 221, 255), cc.p(0, 1), cc.p(22, slot9 - slot10 - 10), nil, , 370)

			slot0.skill_panel:addChild(slot0.extend_desc)
		end

		slot11 = ""

		if slot8.fire_cd ~= 0 then
			slot11 = ((slot8.cd ~= 0 or TI18N("无冷却时间")) and uv0("<div fontcolor=#ffeedd>%s</div><div fontcolor=#14ff32>%s</div><div fontcolor=#ffeedd>%s</div>", TI18N("冷却"), slot8.cd, TI18N("回合"))) .. uv0("<div fontcolor=#ffeedd>%s</div><div fontcolor=#14ff32>%s</div><div fontcolor=#ffeedd>%s</div>", TI18N("，第"), slot8.fire_cd, TI18N("回合释放"))
		end

		slot0.extend_desc:setString(slot11)

		slot7 = slot7 + slot0.extend_desc:getContentSize().height + 10
		slot13 = ""

		if slot8.buff_des ~= nil and slot8.buff_des[1] and next(slot8.buff_des[1]) then
			for slot18, slot19 in ipairs(slot8.buff_des[1]) do
				if Config.SkillData.data_get_buff[slot19] then
					if slot13 ~= "" then
						slot13 = slot13 .. "<div fontcolor=#a1978b>\n</div>"
					end

					slot13 = slot13 .. uv0("<div fontcolor=#ffeedd>【%s】</div><div fontcolor=#a1978b>\n%s</div>", slot20.name, slot20.desc)
				end
			end
		end

		if slot13 ~= "" then
			if slot0.buff_desc == nil then
				slot0.buff_desc = createRichLabel(20, cc.c4b(255, 238, 221, 255), cc.p(0, 1), cc.p(22, slot9 - slot10 - slot12 - 20), 4, nil, 370)

				slot0.skill_panel:addChild(slot0.buff_desc)
			end

			slot0.buff_desc:setString(slot13)

			slot7 = slot7 + slot0.buff_desc:getContentSize().height + 10

			slot0.skill_line:setVisible(true)
			slot0.skill_line:setPositionY(slot9 - slot10 - slot12 - 15)
		end
	end

	slot0.tab_panel:setVisible(slot0.is_show_btn)

	if not slot0.is_show_btn then
		slot7 = slot7 - 72
	end

	slot0.container:setContentSize(cc.size(slot0.old_con_size.width, slot7))
	slot0.base_panel:setPositionY(slot7 - 4)
	slot0.skill_panel:setPositionY(slot7 - 144)
	slot0.tab_panel:setPositionY(0)
	slot0.close_btn:setPositionY(slot7 - 15)

	if not Config.SpriteData.data_elfin_com[slot1] and slot0.tab_list and slot0.tab_list[2] then
		slot0.tab_list[2]:setTouchEnabled(false)
		setChildUnEnabled(true, slot0.tab_list[2])
	end
end

function ElfinTipsWindow.close_callback(slot0)
	if slot0.power_label then
		slot0.power_label:DeleteMe()

		slot0.power_label = nil
	end

	if slot0.elfin_item then
		slot0.elfin_item:DeleteMe()

		slot0.elfin_item = nil
	end
end
