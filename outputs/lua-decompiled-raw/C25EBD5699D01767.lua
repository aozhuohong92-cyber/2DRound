HeroUpgradeStarTipsPanel = HeroUpgradeStarTipsPanel or BaseClass(BaseView)
slot0 = HeroController:getInstance()
slot1 = string.format

function HeroUpgradeStarTipsPanel.__init(slot0)
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "hero/hero_upgrade_star_tips_panel"
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("tips", "tips"),
			type = ResourcesType.plist
		}
	}
end

function HeroUpgradeStarTipsPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot4 = "main_panel"
	slot0.container = slot0.root_wnd:getChildByName(slot4)
	slot0.star_order_list = {}

	for slot4 = 1, 4 do
		if slot0.container:getChildByName("star_order_" .. slot4) then
			slot6 = {
				star_order = slot5,
				index = slot4,
				label = slot5:getChildByName("label")
			}

			slot6.label:setString(uv0(TI18N("星阶%s"), slot4))

			slot7, slot8 = slot5:getPosition()
			slot6.desc = createRichLabel(24, cc.c3b(234, 181, 80), cc.p(0, 1), cc.p(slot7 + 80, slot8 + 50), 5, nil, 300)

			slot0.container:addChild(slot6.desc)

			slot0.star_order_list[slot4] = slot6
		end
	end

	slot0.container:getChildByName("title_label"):setString(TI18N("星阶总加成展示"))
end

function HeroUpgradeStarTipsPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, 1)
	registerButtonEventListener(slot0.goto_btn_1, handler(slot0, slot0.onClickGotoBtn1), true, 2)
	registerButtonEventListener(slot0.goto_btn_2, handler(slot0, slot0.onClickGotoBtn1), true, 2)
	registerButtonEventListener(slot0.goto_btn_3, handler(slot0, slot0.onClickGotoBtn3), true, 2)
	registerButtonEventListener(slot0.goto_btn_4, handler(slot0, slot0.onClickGotoBtn4), true, 2)
	registerButtonEventListener(slot0.bottom_btn, handler(slot0, slot0.onClickBottomBtn), true, 2)
	slot0:addGlobalEvent(HeroEvent.Hero_Vo_Detailed_info, function (slot0)
		if slot0 and slot0.partner_id == uv0.hero_vo.partner_id then
			uv0:setData(slot0)
		end
	end)
end

function HeroUpgradeStarTipsPanel.onClickCloseBtn(slot0)
	uv0:openHeroUpgradeStarTipsPanel(false)
end

function HeroUpgradeStarTipsPanel.openRootWnd(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot0.hero_vo = slot1

	for slot6 = 1, 4 do
		if slot0.star_order_list[slot6] then
			slot7.desc:setString([[
随便测试
随便测试2
随便测试3
我的星阶是: ]] .. slot6)
		end
	end
end

function HeroUpgradeStarTipsPanel.close_callback(slot0)
	uv0:openHeroUpgradeStarTipsPanel(false)
end
