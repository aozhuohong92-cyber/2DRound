PartnerComboAttrView = PartnerComboAttrView or BaseClass(BaseView)
slot1 = PartnerComboCtrl:getInstance():getModel()

function PartnerComboAttrView.__init(slot0)
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "partnercombo/ui_partner_combo_attr_view"
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("tips", "tips"),
			type = ResourcesType.plist
		}
	}
	slot0.key_list1 = {
		"atk",
		"hp_max",
		"def",
		"speed"
	}
	slot0.key_list2 = {
		"atk_per",
		"hp_max_per",
		"def_per",
		"crit_rate"
	}
	slot0.key_list3 = {
		"crit_ratio",
		"dodge_magic",
		"hit_magic",
		"tenacity"
	}
	slot0.key_list4 = {
		"cure",
		"be_cure",
		"dam",
		"dam_p",
		"dam_s",
		"res_p",
		"res_s",
		"res",
		"hit_rate",
		"dodge_rate"
	}
end

function PartnerComboAttrView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.container = slot0.root_wnd:getChildByName("main_panel")

	slot0.container:getChildByName("base_attr"):setString(TI18N("基本属性"))
	slot0.container:getChildByName("special_attr"):setString(TI18N("特殊属性"))

	slot4 = TI18N

	slot0.container:getChildByName("tips_lb"):setString(slot4("全体英雄都可获得属性加成"))

	slot0.attr_panel_list = {}
	slot0.attr_list = {}

	for slot4 = 1, 3 do
		slot0.attr_panel_list[slot4] = slot0.container:getChildByName("attr_panel_" .. slot4)
		slot0.attr_list[slot4] = {}

		for slot10 = 1, 4 do
			slot0.attr_list[slot4][slot10] = {
				icon = slot5:getChildByName("attr_icon" .. slot10),
				key = slot5:getChildByName("attr_key" .. slot10),
				value = slot5:getChildByName("attr_label" .. slot10),
				attr_key = slot0["key_list" .. slot4][slot10]
			}
		end
	end

	slot0.attr_panel_list[4] = slot0.container:getChildByName("attr_panel_4")
	slot0.attr_list[4] = {}

	for slot5, slot6 in ipairs(slot0.key_list4) do
		slot0.attr_list[4][slot5] = {
			icon = slot1:getChildByName("attr_icon" .. slot5),
			key = slot1:getChildByName("attr_key" .. slot5),
			value = slot1:getChildByName("attr_label" .. slot5),
			attr_key = slot0.key_list4[slot5]
		}
	end
end

function PartnerComboAttrView.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, 1)
	slot0:addGlobalEvent(HeroEvent.PARTNER_COMBO_ATTRS_UPDATE, function ()
		uv0:setData()
	end)
end

function PartnerComboAttrView.onClickCloseBtn(slot0)
	uv0:openPartnerComboAttrView(false)
end

function PartnerComboAttrView.openRootWnd(slot0)
	if uv0:getAttrList() and next(slot1) then
		slot0:setData()
	end
end

function PartnerComboAttrView.setData(slot0)
	slot1 = uv0:getAttrList()

	for slot5, slot6 in ipairs(slot0.attr_list) do
		for slot10, slot11 in ipairs(slot6) do
			slot12 = slot11.attr_key

			loadSpriteTexture(slot11.icon, PathTool.getResFrame("common", PathTool.getAttrIconByStr(slot12)), LOADTEXT_TYPE_PLIST)
			slot11.key:setString(Config.AttrData.data_key_to_name[slot12])

			if PartnerComboAttrView.isShowPerByStr(slot12) then
				slot16 = (slot1[slot12] or 0) / 10 .. "%"
			end

			slot11.value:setString(slot16)
		end
	end
end

function PartnerComboAttrView.isShowPerByStr(slot0)
	if Config.AttrData.data_type[slot0] and slot1 == 2 then
		return true
	end

	return false
end

function PartnerComboAttrView.close_callback(slot0)
	uv0:openPartnerComboAttrView(false)
end
