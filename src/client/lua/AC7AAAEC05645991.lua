HeroUpgradeStarUpPanel = HeroUpgradeStarUpPanel or BaseClass(BaseView)
slot1 = HeroController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.remove

function HeroUpgradeStarUpPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "hero/hero_upgrade_star_up_panel"
	slot0.res_list = {}
end

function HeroUpgradeStarUpPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("星阶升级"))

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.star_order_1 = slot0.main_container:getChildByName("star_order_1")
	slot0.star_label = slot0.star_order_1:getChildByName("label")

	slot0.star_label:setString(TI18N("星级x"))

	slot0.cost_key = slot0.main_container:getChildByName("cost_key")

	slot0.cost_key:setString(TI18N("激活所需消耗: "))

	slot0.cost_tips = slot0.main_container:getChildByName("cost_tips")

	slot0.cost_tips:setString(TI18N("(二选一) "))

	slot0.up_btn = slot0.main_container:getChildByName("up_btn")

	slot0.up_btn:getChildByName("label"):setString(TI18N("升 级"))

	slot0.up_tips = slot0.main_container:getChildByName("up_tips")

	slot0.up_tips:setString(TI18N("该星阶已激活"))

	slot0.bottom_tips = slot0.main_container:getChildByName("bottom_tips")
	slot4 = TI18N

	slot0.bottom_tips:setString(slot4("(100%返还材料英雄升级、进阶消耗的贝里、经验和突破卡)"))

	slot0.cost_bg_list = {}

	for slot4 = 1, 1 do
		slot5 = slot0.main_container:getChildByName("cost_bg")
		slot0.cost_bg_list[slot4] = {
			cost_bg = slot5,
			cost_icon = slot5:getChildByName("cost_icon"),
			cost_txt = slot5:getChildByName("cost_txt")
		}
	end

	slot0.item_node = {
		slot0.main_container:getChildByName("item_node1"),
		slot0.main_container:getChildByName("item_node2")
	}
end

function HeroUpgradeStarUpPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 1)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.up_btn, handler(slot0, slot0.onClickUpBtn), true, 2)
end

function HeroUpgradeStarUpPanel.onClickBtnClose(slot0)
	uv0:openHeroUpgradeStarUpPanel(false)
end

function HeroUpgradeStarUpPanel.onClickUpBtn(slot0)
end

function HeroUpgradeStarUpPanel.openRootWnd(slot0, slot1)
	slot2 = slot1 or {}
	slot0.hero_vo = slot2.hero_vo
	slot0.index = slot2.index or 1

	if not slot0.hero_vo then
		return
	end

	slot4 = Config.PartnerData.data_partner_star_order(getNorKey(slot0.hero_vo.bid, slot0.hero_vo.star, slot0.index))
end

function HeroUpgradeStarUpPanel.updateUpStarHeroInfo(slot0, slot1)
end

function HeroUpgradeStarUpPanel.updateCostInfo(slot0, slot1)
	for slot5 = 1, 1 do
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

function HeroUpgradeStarUpPanel.close_callback(slot0)
	uv0:openHeroUpgradeStarUpPanel(false)
end
