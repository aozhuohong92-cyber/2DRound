slot0 = HeroController:getInstance()
slot1 = HeroController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
HolyequipmentWearTips = HolyequipmentWearTips or BaseClass(BaseView)

function HolyequipmentWearTips.__init(slot0)
	slot0.is_full_screen = false
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "hero/hero_holy_wear_tips"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("hero", "hero"),
			type = ResourcesType.plist
		}
	}
	slot0.item_node_list = {}
	slot0.enter_status = false
end

function HolyequipmentWearTips.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot1 = slot0.main_panel:getChildByName("title_container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("title_label"):setString(TI18N("提示"))

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.confirm_btn = slot0.main_panel:getChildByName("confirm_btn")

	slot0.confirm_btn:getChildByName("label"):setString(TI18N("确 定"))

	slot0.cancel_btn = slot0.main_panel:getChildByName("cancel_btn")

	slot0.cancel_btn:getChildByName("label"):setString(TI18N("取 消"))

	slot0.box_btn = slot0.main_panel:getChildByName("box_btn")

	slot0.box_btn:getChildByName("name"):setString(TI18N("今日不再提示"))

	slot0.tips_label = createRichLabel(24, 274, cc.p(0.5, 0.5), cc.p(325, 458), 5, nil, 594)

	slot0.main_panel:addChild(slot0.tips_label)
end

function HolyequipmentWearTips.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.handleCbSelectStatus), true, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.handleCbSelectStatus), true, 2)
	registerButtonEventListener(slot0.confirm_btn, function ()
		uv0:sender25224(uv1.hero_vo.partner_id, uv1.id)
		SysEnv:getInstance():save()
		uv0:openHolyequipmentWearTips(false)
	end, true, 1)
	registerButtonEventListener(slot0.cancel_btn, handler(slot0, slot0.handleCbSelectStatus), true, 1)
	slot0.box_btn:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.holy_plan_wear_tip, true, false)
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.holy_plan_wear_tip, false, false)
		end
	end)
end

function HolyequipmentWearTips.handleCbSelectStatus(slot0)
	if SysEnv:getInstance():getBool(SysEnv.keys.holy_plan_wear_tip, false) ~= slot0.enter_status then
		SysEnv:getInstance():set(SysEnv.keys.holy_plan_wear_tip, slot0.enter_status, false)
	end

	uv0:openHolyequipmentWearTips(false)
end

function HolyequipmentWearTips.openRootWnd(slot0, slot1)
	slot0.holy_data = slot1
	slot0.id = slot1.id
	slot0.name = slot1.name
	slot0.hero_vo = slot1.hero_vo
	slot0.item_list = slot1.item_list

	slot0:setData()
end

function HolyequipmentWearTips.setData(slot0)
	if not slot0.holy_data then
		return
	end

	slot0.tips_label:setString(uv0(TI18N("为<div fontcolor=249003>【%s】</div>装配方案，会将以下神装从这些英雄中卸下，是否继续？"), slot0.hero_vo.name))

	slot2 = SysEnv:getInstance():getBool(SysEnv.keys.holy_plan_wear_tip, false)

	slot0.box_btn:setSelected(slot2)

	slot0.enter_status = slot2

	for slot7 = 1, 4 do
		if slot0.item_list[HeroConst.HolyequipmentPosList[slot7]] then
			uv1({}, slot0.item_list[slot8])
		end
	end

	if tableLen(slot0.item_list) > 0 then
		if slot4 < 4 then
			slot5 = 102 + (4 - slot4) * 75
		end

		for slot9 = 1, #slot3 do
			if not slot0.item_node_list[slot9] then
				slot10 = HolyequipmentWearItem.new(HeroConst.HolyequipmentPosList[slot9])

				slot0.main_panel:addChild(slot10)

				slot0.item_node_list[slot9] = slot10
			end

			if slot3[slot9] then
				slot10:setData(slot3[slot9])
			end

			slot10:setPosition(cc.p(slot5 + (slot9 - 1) * 148, 268))
		end
	end
end

function HolyequipmentWearTips.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.item_node_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	uv0:openHolyequipmentWearTips(false)
end

HolyequipmentWearItem = class("HolyequipmentWearItem", function ()
	return ccui.Widget:create()
end)

function HolyequipmentWearItem.ctor(slot0, slot1)
	slot0.holy_type = slot1

	slot0:config()
	slot0:layoutUI()
end

function HolyequipmentWearItem.config(slot0)
	slot0.size = cc.size(119, 295)

	slot0:setContentSize(slot0.size)
end

function HolyequipmentWearItem.layoutUI(slot0)
	slot0.container = ccui.Layout:create()

	slot0.container:setContentSize(slot0.size)
	slot0:addChild(slot0.container)

	slot1 = createSprite(PathTool.getResFrame("common", "common_90097"), slot0.size.width / 2, slot0.size.height / 2, slot0.container, cc.p(0.5, 0.5))
	slot0.holy_item = BackPackItem.new(false, true, nil, 1, false)

	slot0.holy_item:setDefaultTip(true, false)
	slot0.holy_item:setPosition(cc.p(slot0.size.width / 2, slot0.size.height * 3 / 4))
	slot0.container:addChild(slot0.holy_item)

	slot0.holy_item.empty_icon = createImage(slot0.holy_item:getRoot(), PathTool.getResFrame("hero", HeroConst.HolyEmptyIconName[slot0.holy_type]), 60, 60, cc.p(0.5, 0.5), true, 10, false)
	slot0.hero_item = HeroExhibitionItem.new(1, false)

	slot0.hero_item:setPosition(cc.p(slot0.size.width / 2, slot0.size.height / 4))
	slot0.container:addChild(slot0.hero_item)
end

function HolyequipmentWearItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	if slot1.item_vo then
		slot0.holy_item:setData(slot1.item_vo)

		if slot0.holy_item.empty_icon then
			slot0.holy_item.empty_icon:setVisible(false)
		end

		slot0.holy_item.data = slot1.item_vo
	else
		slot0.holy_item:setData()

		if slot0.holy_item.empty_icon then
			slot0.holy_item.empty_icon:setVisible(true)
		end

		slot0.holy_item.data = nil
	end

	if slot1.partner_id then
		slot0.hero_item:setData(uv0:getHeroById(slot1.partner_id))
	end
end

function HolyequipmentWearItem.DeleteMe(slot0)
	if slot0.holy_item then
		slot0.holy_item:DeleteMe()

		slot0.holy_item = nil
	end

	if slot0.hero_item then
		slot0.hero_item:DeleteMe()

		slot0.hero_item = nil
	end
end
