HeroSkinTipsPanel = HeroSkinTipsPanel or BaseClass(BaseView)
slot1 = HeroController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort
slot5 = RoleController:getInstance():getRoleVo()
slot6 = BackpackController:getInstance()

function HeroSkinTipsPanel.__init(slot0)
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "hero/hero_skin_tips_panel"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("tips", "tips"),
			type = ResourcesType.plist
		}
	}
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.attr_item_list = {}
end

function HeroSkinTipsPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
		slot0.background:setSwallowTouches(false)
	end

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.main_panel_size = slot0.main_panel:getContentSize()
	slot0.bg = slot0.main_panel:getChildByName("bg")
	slot0.bg_size = slot0.bg:getContentSize()
	slot0.container = slot0.main_panel:getChildByName("container")
	slot0.station_img = slot0.container:getChildByName("station_img")
	slot0.model_nodel = slot0.container:getChildByName("model_nodel")
	slot0.attr_panel = slot0.container:getChildByName("attr_panel")

	slot0.attr_panel:getChildByName("label"):setString(TI18N("特殊属性"))

	slot0.name = slot0.container:getChildByName("name")
	slot0.close_btn = slot0.container:getChildByName("close_btn")
	slot0.scroll_view = slot0.container:getChildByName("scroll_view")
	slot0.scroll_view_y = slot0.scroll_view:getPositionY()

	slot0.scroll_view:setScrollBarEnabled(false)

	slot0.scroll_size = slot0.scroll_view:getContentSize()
	slot0.desc_label = createRichLabel(22, cc.c4b(224, 191, 152, 255), cc.p(0, 1), cc.p(20, 64), 8, nil, 460)

	slot0.scroll_view:addChild(slot0.desc_label)

	slot0.btn_list = {}
	slot4 = "tab_panel"
	slot0.tab_panel = slot0.container:getChildByName(slot4)
	slot0.tab_panel_y = slot0.tab_panel:getPositionY()
	slot0.tab_panel_height = slot0.tab_panel:getContentSize().height

	for slot4 = 1, 3 do
		if slot0.tab_panel:getChildByName("tab_btn_" .. slot4) then
			slot0.btn_list[slot4] = {
				btn = slot5,
				label = slot5:getTitleRenderer()
			}
		end
	end
end

function HeroSkinTipsPanel.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:onClickCloseBtn()
	end, true, 1)
	registerButtonEventListener(slot0.background, function ()
		uv0:onClickCloseBtn()
	end, false, 0)
end

function HeroSkinTipsPanel.onClickCloseBtn(slot0)
	uv0:openHeroSkinTipsPanel(false)
end

function HeroSkinTipsPanel.onTabBtn2(slot0)
	if not slot0.data then
		return
	end

	if not slot0.item_config then
		return
	end
end

function HeroSkinTipsPanel.onTabBtn1(slot0)
	if not slot0.data or not slot0.data.id or not slot0.item_config then
		return
	end
end

function HeroSkinTipsPanel.onTabBtn3(slot0)
	if not slot0.data then
		return
	end

	if not slot0.item_config then
		return
	end
end

function HeroSkinTipsPanel.openRootWnd(slot0, slot1, slot2, slot3)
	slot0.cloth_type = slot2 or PartnerConst.EqmTips.normal
	slot0.data = slot1
	slot0.partner = slot3

	if slot0.partner then
		slot0.partner_id = slot0.partner.partner_id
	end

	slot4 = nil
	slot0.item_config = (type(slot1) ~= "number" or Config.ItemData.data_get_data(slot1)) and (not slot1.config or slot1.config) and slot1

	if slot0.item_config == nil then
		return
	end

	slot0:initData()

	if slot0.cloth_type == PartnerConst.EqmTips.backpack then
		slot0:updateBtnList()
	end
end

function HeroSkinTipsPanel.updateBtnList(slot0)
	if not slot0.item_config then
		return
	end

	for slot4, slot5 in pairs(slot0.btn_list) do
		if slot5.btn then
			slot5.btn:setVisible(false)
		end
	end

	if tableLen(slot0.item_config.tips_btn or {}) == 1 then
		slot4 = slot0.btn_list[3]

		if slot0.btn_list[1].btn and slot4.btn then
			slot3.btn:setPositionX(slot4.btn:getPositionX())
		end
	end

	slot3 = 1

	for slot7, slot8 in ipairs(slot1) do
		if slot3 > 3 then
			break
		end

		if slot0.btn_list[slot7] and slot9.btn then
			slot9.label:setString(BackPackConst.tips_btn_title[slot8] or "")
			slot9.btn:setVisible(true)
			slot9.btn:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					uv0:clickBtn(uv1)
				end
			end)
		end

		slot3 = slot3 + 1
	end
end

function HeroSkinTipsPanel.clickBtn(slot0, slot1)
	if not slot0.item_config then
		return
	end

	if not slot0.skin_id then
		return
	end

	if slot1 == BackPackConst.tips_btn_type.source then
		if #slot0.item_config.source > 0 then
			uv0:openTipsSource(true, slot0.data)
		else
			message(TI18N("暂时没有来源"))
		end
	elseif slot1 == BackPackConst.tips_btn_type.goods_use then
		if uv1:getHeroSkinInfoBySkinID(slot0.skin_id) ~= nil and slot2 == 0 then
			if Config.PartnerSkinData.data_skin_info and slot3[slot0.skin_id] and slot0.item_config.client_effect[1] then
				CommonAlert.show(uv2(TI18N("当前您已永久拥有该皮肤，重复激活使用，将转化为 <img src='%s' scale=0.3 /><div fontcolor=#289b14> %s </div>，是否继续使用？（永久皮肤可以在英雄->皮肤使用界面对皮肤进行升级哦！）"), PathTool.getItemRes(Config.ItemData.data_get_data(slot0.item_config.client_effect[1][3] or Config.ItemData.data_assets_label2id.skin_debris).icon), slot0.item_config.client_effect[1][4] or 0), TI18N("使用"), function ()
					uv0:sender10515(uv1.data.id or 0, 1)
				end, TI18N("取消"), nil, CommonAlert.type.rich, nil, {
					title = TI18N("使用皮肤")
				})
			end
		else
			uv0:sender10515(slot0.data.id or 0, 1)
		end
	end

	slot0:onClickCloseBtn()
end

function HeroSkinTipsPanel.initData(slot0)
	slot0.name:setString(slot0.item_config.name)

	slot1 = PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_skin_tips", false)

	if slot0.record_station_res == nil or slot0.record_station_res ~= slot1 then
		slot0.record_station_res = slot1
		slot0.item_load = loadSpriteTextureFromCDN(slot0.station_img, slot1, ResourcesType.single, slot0.item_load)
	end

	slot2 = 101

	if slot0.item_config.client_effect[1] then
		slot2 = slot0.item_config.client_effect[1][1] or 101
	end

	slot0.skin_id = slot2

	slot0:updateSpine(slot2)

	slot3 = slot0:updateAttrInfo(slot2)

	slot0.desc_label:setString(slot0.item_config.desc)

	slot5 = math.max(slot0.desc_label:getContentSize().height, slot0.scroll_size.height)

	slot0.scroll_view:setInnerContainerSize(cc.size(slot0.scroll_size.width, slot5))
	slot0.desc_label:setPositionY(slot5 - 10)

	slot6 = nil

	if slot0.cloth_type == PartnerConst.EqmTips.normal then
		slot0.tab_panel:setVisible(false)
		slot0.container:setPositionY(slot0.main_panel_size.height - (slot3 + 54) + (slot3 + 54) * 0.5)
	else
		slot0.tab_panel:setVisible(true)
		slot0.container:setPositionY(slot0.main_panel_size.height - slot3 + slot3 * 0.5)
	end

	slot0.scroll_view:setPositionY(slot0.scroll_view_y + slot3)
	slot0.tab_panel:setPositionY(slot0.tab_panel_y + slot3)
	slot0.bg:setContentSize(cc.size(slot0.main_panel_size.width, slot6))
	slot0.main_panel:setContentSize(cc.size(slot0.main_panel_size.width, slot6))
end

function HeroSkinTipsPanel.updateSpine(slot0, slot1)
	if slot0.record_spine_skin_id and slot0.record_spine_skin_id == slot1 then
		return
	end

	slot0.record_spine_skin_id = slot1

	function slot2()
		if not uv0.spine then
			uv0.spine = BaseRole.new(BaseRole.type.skin, uv1, nil, {})

			uv0.spine:setAnimation(0, PlayerAction.show, true)
			uv0.spine:setCascade(true)
			uv0.spine:setPosition(cc.p(0, 166))
			uv0.spine:setAnchorPoint(cc.p(0, 0))
			uv0.model_nodel:addChild(uv0.spine)
			uv0.spine:setCascade(true)
			uv0.spine:setOpacity(0)
			uv0.spine:showShadowUI(true)
			uv0.spine:runAction(cc.FadeIn:create(0.2))
		end
	end

	if slot0.spine then
		slot0.can_click_btn = false

		slot0.spine:setCascade(true)
		slot0.spine:runAction(cc.Sequence:create(cc.FadeOut:create(0.2), cc.CallFunc:create(function ()
			doStopAllActions(uv0.spine)
			uv0.spine:removeFromParent()

			uv0.spine = nil
			uv0.can_click_btn = true

			uv1()
		end)))
	else
		slot2()
	end
end

function HeroSkinTipsPanel.updateAttrInfo(slot0, slot1)
	slot3 = 0

	if Config.PartnerSkinData.data_skin_info[slot1] then
		slot4 = 40
		slot5 = slot0.attr_panel:getContentSize()
		slot6 = slot5.width * 0.25
		slot7 = slot5.width * 0.75

		if #slot2.skin_attr <= 2 then
			slot3 = 40
		end

		for slot11, slot12 in ipairs(slot2.skin_attr) do
			slot15 = 0

			if slot0.attr_item_list[slot11] == nil then
				slot0.attr_item_list[slot11] = slot0:createAttrItem((slot11 - 1) % 2 == 0 and slot6 or slot7, slot5.height - (slot4 * 0.5 + math.floor((slot11 - 1) / 2) * slot4))
			else
				slot0.attr_item_list[slot11].bg:setVisible(true)
				slot0.attr_item_list[slot11].key_label:setVisible(true)
			end

			slot17, slot18, slot19 = commonGetAttrInfoByKeyValue(slot12[1], slot12[2])

			slot0.attr_item_list[slot11].key_label:setString(string.format("<img src='%s' scale=1 /> %s + %s", slot17, slot18, slot19))
		end
	end

	return slot3
end

function HeroSkinTipsPanel.createAttrItem(slot0, slot1, slot2)
	slot3 = {
		bg = createImage(slot0.attr_panel, PathTool.getResFrame("common", "common_90058"), slot1, slot2, cc.p(0.5, 0.5), true, 0, true)
	}
	slot4 = cc.size(230, 35)

	slot3.bg:setContentSize(slot4)
	slot3.bg:setOpacity(128)
	slot3.bg:setCapInsets(cc.rect(15, 15, 1, 1))

	slot3.key_label = createRichLabel(22, cc.c4b(224, 191, 152, 255), cc.p(0, 0.5), cc.p(slot1 - slot4.width * 0.5 + 10, slot2), nil, nil, 380)

	slot0.attr_panel:addChild(slot3.key_label, 2)

	return slot3
end

function HeroSkinTipsPanel.close_callback(slot0)
	if slot0.spine then
		doStopAllActions(slot0.spine)
		slot0.spine:removeFromParent()

		slot0.spine = nil
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	uv0:openHeroSkinTipsPanel(false)
end
