HeroResonateComfirmLevPanel = HeroResonateComfirmLevPanel or BaseClass(BaseView)
slot1 = HeroController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort
slot5 = math.ceil

function HeroResonateComfirmLevPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.layout_name = "hero/hero_resonate_comfirm_lev_panel"
	slot0.res_list = {}
end

function HeroResonateComfirmLevPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("升级"))

	slot0.lev_key = slot0.main_container:getChildByName("lev_key")

	slot0.lev_key:setString(TI18N("等级提升"))

	slot0.power_key = slot0.main_container:getChildByName("power_key")

	slot0.power_key:setString(TI18N("战力提升"))

	slot0.left_lv = slot0.main_container:getChildByName("left_lv")

	slot0.left_lv:setString(TI18N(""))

	slot0.right_lv = slot0.main_container:getChildByName("right_lv")

	slot0.right_lv:setString(TI18N(""))

	slot0.left_power = createRichLabel(26, cc.c4b(100, 50, 35, 255), cc.p(0.5, 0.5), cc.p(210, 221), nil, , 600)

	slot0.main_container:addChild(slot0.left_power)

	slot0.right_power = createRichLabel(26, cc.c4b(100, 50, 35, 255), cc.p(0.5, 0.5), cc.p(460, 221), nil, , 600)

	slot0.main_container:addChild(slot0.right_power)

	slot0.left_btn = slot0.main_container:getChildByName("left_btn")

	slot0.left_btn:getChildByName("label"):setString(TI18N("取 消"))

	slot0.right_btn = slot0.main_container:getChildByName("right_btn")
	slot4 = TI18N

	slot0.right_btn:getChildByName("label"):setString(slot4("确 定"))

	slot0.cost_bg_list = {}

	for slot4 = 1, 3 do
		slot5 = slot0.main_container:getChildByName("cost_bg_" .. slot4)
		slot0.cost_bg_list[slot4] = {
			cost_icon = slot5:getChildByName("cost_icon"),
			cost_txt = slot5:getChildByName("cost_txt")
		}

		slot0.cost_bg_list[slot4].cost_txt:setString(0)
	end
end

function HeroResonateComfirmLevPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 2)
	registerButtonEventListener(slot0.left_btn, handler(slot0, slot0.onClickBtnClose), true, 1)
	registerButtonEventListener(slot0.right_btn, handler(slot0, slot0.onClickBtnRight), true, 1)
	slot0:addGlobalEvent(HeroEvent.Hero_Resonate_Crystal_Power_Event, function (slot0)
		if not slot0 then
			return
		end

		uv0:setPowerInfo(slot0.power)
	end)
end

function HeroResonateComfirmLevPanel.onClickBtnClose(slot0)
	uv0:openHeroResonateComfirmLevPanel(false)
end

function HeroResonateComfirmLevPanel.onClickBtnRight(slot0)
	if slot0.power then
		uv0:sender26430()
	end

	slot0:onClickBtnClose()
end

function HeroResonateComfirmLevPanel.openRootWnd(slot0, slot1)
	uv0:sender26431()

	slot2 = slot1 or {}
	slot3 = slot2.left_lv or 0

	slot0.left_lv:setString("Lv." .. slot3)
	slot0.right_lv:setString("Lv." .. (slot2.right_lv or 0))
	slot0.left_power:setString(uv1("<img src='%s' scale=1 />%s", PathTool.getResFrame("common", "common_2016"), slot2.left_power or 0))
	slot0:updateCostInfo(slot3)
end

function HeroResonateComfirmLevPanel.setPowerInfo(slot0, slot1)
	slot0.power = slot1

	slot0.right_power:setString(uv0("<img src='%s' scale=1 />%s", PathTool.getResFrame("common", "common_2016"), slot1))
end

function HeroResonateComfirmLevPanel.updateCostInfo(slot0, slot1)
	if Config.ResonateData.data_crystal_cost[slot1] and next(slot2.expend) ~= nil then
		for slot6 = 1, 3 do
			slot9 = slot0.cost_bg_list[slot6].cost_txt

			if slot2.expend[slot6] then
				slot11 = slot7[2]

				if Config.ItemData.data_get_data(slot7[1]) then
					slot0.cost_bg_list[slot6].cost_icon:loadTexture(PathTool.getItemRes(slot12.icon), LOADTEXT_TYPE)

					slot13 = BackpackController:getInstance():getModel():getItemNumByBid(slot10)

					slot9:setString(MoneyTool.GetMoneyString(slot13) .. "/" .. MoneyTool.GetMoneyString(slot11))

					if slot11 <= slot13 then
						slot9:setTextColor(cc.c3b(255, 246, 228))
					else
						slot9:setTextColor(cc.c3b(255, 139, 139))
					end
				end
			else
				slot9:setString("")
			end
		end
	end
end

function HeroResonateComfirmLevPanel.close_callback(slot0)
	if slot0.line_load then
		slot0.line_load:DeleteMe()
	end

	slot0.line_load = nil

	if slot0.left_hero_item then
		slot0.left_hero_item:DeleteMe()

		slot0.left_hero_item = nil
	end

	if slot0.right_hero_item then
		slot0.right_hero_item:DeleteMe()

		slot0.right_hero_item = nil
	end

	uv0:openHeroResonateComfirmLevPanel(false)
end
