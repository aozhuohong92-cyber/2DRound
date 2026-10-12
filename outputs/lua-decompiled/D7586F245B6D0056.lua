slot1 = ElfinController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
ElfinFightPlanSaveTips = ElfinFightPlanSaveTips or BaseClass(BaseView)

function ElfinFightPlanSaveTips.__init(slot0)
	slot0.is_full_screen = false
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "hero/hero_holy_save_plan_tips"
	slot0.res_list = {}
	slot0.item_node_list = {}
	slot0.enter_status = false
end

function ElfinFightPlanSaveTips.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")

	slot0:playEnterAnimatianByObj(slot0.main_panel, 2)
	slot0.main_panel:getChildByName("title_container"):getChildByName("title_label"):setString(TI18N("提示"))

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.confirm_btn = slot0.main_panel:getChildByName("confirm_btn")

	slot0.confirm_btn:getChildByName("label"):setString(TI18N("确 定"))

	slot0.cancel_btn = slot0.main_panel:getChildByName("cancel_btn")

	slot0.cancel_btn:getChildByName("label"):setString(TI18N("取 消"))

	slot0.box_btn = slot0.main_panel:getChildByName("box_btn")

	slot0.box_btn:getChildByName("name"):setString(TI18N("今日不再提示"))

	slot0.tips_label = createRichLabel(24, 274, cc.p(0.5, 0.5), cc.p(325, 374), 5, nil, 594)

	slot0.main_panel:addChild(slot0.tips_label)
end

function ElfinFightPlanSaveTips.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.handleCbSelectStatus), true, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.handleCbSelectStatus), true, 2)
	registerButtonEventListener(slot0.confirm_btn, function ()
		uv0:onConfirmBtn()
	end, true, 1)
	registerButtonEventListener(slot0.cancel_btn, handler(slot0, slot0.handleCbSelectStatus), true, 1)
	slot0.box_btn:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.elfin_plan_save_tip, true, false)
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.elfin_plan_save_tip, false, false)
		end
	end)
end

function ElfinFightPlanSaveTips.onConfirmBtn(slot0)
	if slot0.callback then
		slot0.callback()
	end

	SysEnv:getInstance():save()
	uv0:openElfinFightPlanSaveTips(false)
end

function ElfinFightPlanSaveTips.handleCbSelectStatus(slot0)
	if SysEnv:getInstance():getBool(SysEnv.keys.elfin_plan_save_tip, false) ~= slot0.enter_status then
		SysEnv:getInstance():set(SysEnv.keys.elfin_plan_save_tip, slot0.enter_status, false)
	end

	uv0:openElfinFightPlanSaveTips(false)
end

function ElfinFightPlanSaveTips.openRootWnd(slot0, slot1)
	slot2 = slot1 or {}
	slot0.same_list = slot2.same_list
	slot0.callback = slot2.callback

	slot0:setData()
end

function ElfinFightPlanSaveTips.setData(slot0)
	slot6 = "应用此装配方案，会将以下幽灵从对应队伍中卸下，是否继续?"

	slot0.tips_label:setString(TI18N(slot6))

	slot1 = SysEnv:getInstance():getBool(SysEnv.keys.elfin_plan_save_tip, false)

	slot0.box_btn:setSelected(slot1)

	slot0.enter_status = slot1

	table.sort(slot0.same_list, function (slot0, slot1)
		return slot0.team < slot1.team
	end)

	slot2 = {}

	for slot6, slot7 in ipairs(slot0.same_list) do
		if slot7.item_bid ~= 0 then
			uv0(slot2, slot7.item_bid)
		end
	end

	if #slot2 > 0 then
		if slot3 < 4 then
			slot4 = 102 + (4 - slot3) * 75
		end

		for slot8 = 1, slot3 do
			if not slot0.item_node_list[slot8] then
				slot9 = ElfinSaveItem.new()

				slot0.main_panel:addChild(slot9)

				slot0.item_node_list[slot8] = slot9
			end

			slot9:setData(slot0.same_list[slot8])
			slot9:setPosition(cc.p(slot4 + (slot8 - 1) * 148, 230))
		end
	end
end

function ElfinFightPlanSaveTips.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.item_node_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	uv0:openElfinFightPlanSaveTips(false)
end

ElfinSaveItem = class("ElfinSaveItem", function ()
	return ccui.Widget:create()
end)

function ElfinSaveItem.ctor(slot0)
	slot0:config()
	slot0:layoutUI()
end

function ElfinSaveItem.config(slot0)
	slot0.size = cc.size(138, 211)

	slot0:setContentSize(slot0.size)
end

function ElfinSaveItem.layoutUI(slot0)
	slot0.container = ccui.Layout:create()

	slot0.container:setContentSize(slot0.size)
	slot0:addChild(slot0.container)

	slot1 = createSprite(PathTool.getResFrame("common", "common_90097"), slot0.size.width / 2, 63, slot0.container, cc.p(0.5, 0.5))
	slot0.item_node = SkillItem.new(true, true, true, 1, true)

	slot0.item_node:setPosition(cc.p(slot0.size.width / 2, slot0.size.height - BackPackItem.Height / 2 - 15))
	slot0.container:addChild(slot0.item_node)
	createImage(slot0.container, PathTool.getResFrame("common", "common_90096"), slot0.size.width / 2, 32, cc.p(0.5, 0.5), true, nil, true):setContentSize(cc.size(138, 30))

	slot0.name_label = createLabel(20, 274, nil, slot0.size.width / 2, 32, "", slot0.container, nil, cc.p(0.5, 0.5))
end

function ElfinSaveItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	if slot1.item_bid then
		if Config.SpriteData.data_elfin_data(slot1.item_bid) and Config.SkillData.data_get_skill(slot2.skill) then
			slot0.item_node:setData(slot3)
		end

		slot3 = Config.SkillData.data_get_skill(slot2.skill)
	end

	if slot1.team then
		slot0.name_label:setString(uv0(TI18N("队伍%s"), StringUtil.numToChinese(slot1.team)))
	end
end

function ElfinSaveItem.DeleteMe(slot0)
	if slot0.item_node then
		slot0.item_node:DeleteMe()

		slot0.item_node = nil
	end
end
