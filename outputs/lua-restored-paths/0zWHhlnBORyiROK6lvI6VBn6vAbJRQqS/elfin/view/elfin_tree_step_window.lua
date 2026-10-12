slot1 = ElfinController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
ElfinTreeStepWindow = ElfinTreeStepWindow or BaseClass(BaseView)

function ElfinTreeStepWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "elfin/elfin_tree_step_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("elfin", "elfin"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3"),
			type = ResourcesType.single
		}
	}
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.cost_item_list = {}
	slot0.cost_item_bid_list = {}
end

function ElfinTreeStepWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot5 = 2

	slot0:playEnterAnimatianByObj(slot0.main_container, slot5)
	slot0.main_container:getChildByName("win_title"):setString(TI18N("唤醒"))

	slot0.image_bg_pos = slot0.main_container:getChildByName("image_bg_pos")
	slot0.elfin_panel = slot0.main_container:getChildByName("elfin_panel")

	slot0.elfin_panel:getChildByName("label_title"):setString(TI18N("解锁槽位"))

	slot0.elfin_pos_txt = slot0.elfin_panel:getChildByName("pos_txt")
	slot0.pos_node = slot0.elfin_panel:getChildByName("pos_node")
	slot0.lock_txt = slot0.elfin_panel:getChildByName("lock_txt")
	slot1 = slot0.main_container:getChildByName("attr_panel")
	slot0.attr_objects = {}

	for slot5 = 1, 5 do
		uv0(slot0.attr_objects, {
			attr_icon = slot1:getChildByName("attr_icon" .. slot5),
			attr_name = slot1:getChildByName("attr_label_key" .. slot5),
			attr_left_val = slot1:getChildByName("attr_label_left" .. slot5),
			attr_right_val = slot1:getChildByName("attr_label_right" .. slot5)
		})
	end

	slot0.break_btn = slot0.main_container:getChildByName("break_btn")
	slot0.break_btn_lab = slot0.break_btn:getChildByName("label")

	slot0.break_btn_lab:setString(TI18N("唤醒"))

	slot0.get_egg_txt = createRichLabel(24, cc.c4b(155, 67, 9, 255), cc.p(0.5, 0.5), cc.p(552, 135))

	slot0.main_container:addChild(slot0.get_egg_txt)
	slot0.get_egg_txt:setString(uv1(TI18N("<div href=xxx >前往获取</div><img src='%s'/>"), PathTool.getResFrame("elfin", "elfin_1016")))
	slot0.get_egg_txt:addTouchEventListener(function ()
		if Config.SpriteData.data_const.awake_gain and slot0.val and Config.ItemData.data_get_data(slot0.val) then
			BackpackController:getInstance():openTipsOnlySource(true, slot1)
		end
	end)
end

function ElfinTreeStepWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openElfinTreeStepWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.break_btn, function ()
		if uv0.open_lev and uv0.role_vo and uv0.role_vo.lev < uv0.open_lev then
			message(uv1(TI18N("需要角色等级达到%d级"), uv0.open_lev))

			return
		end

		uv2:sender26512()
		uv2:openElfinTreeStepWindow(false)
	end, true)
	slot0:addGlobalEvent(BackpackEvent.ADD_GOODS, function (slot0, slot1)
		if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
			return
		end

		uv0:checkNeedUpdateItemNum(slot1)
	end)
	slot0:addGlobalEvent(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
		if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
			return
		end

		uv0:checkNeedUpdateItemNum(slot1)
	end)
	slot0:addGlobalEvent(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
		if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
			return
		end

		uv0:checkNeedUpdateItemNum(slot1)
	end)
end

function ElfinTreeStepWindow.checkNeedUpdateItemNum(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	slot2 = false

	for slot6, slot7 in pairs(slot1) do
		if slot7.config then
			for slot11, slot12 in pairs(slot0.cost_item_bid_list) do
				if slot12 == slot7.config.id then
					slot2 = true

					break
				end
			end
		end

		if slot2 then
			break
		end
	end

	if slot2 then
		slot0:updateCostItemNum()
	end
end

function ElfinTreeStepWindow.openRootWnd(slot0)
	slot0:setData()
	addRedPointToNodeByStatus(slot0.break_btn, uv0:getElfinRedStatusByRedBid(HeroConst.RedPointType.eElfin_tree_lvup), 10, 10)
end

function ElfinTreeStepWindow.updateOpenLev(slot0)
	if not slot0.cur_step_cfg then
		return
	end

	for slot5, slot6 in pairs(slot0.cur_step_cfg.step_cond) do
		if slot6[1] == "role_lev" then
			slot0.open_lev = slot6[2]
		end
	end

	if slot0.open_lev and slot0.role_vo and slot0.role_vo.lev < slot0.open_lev then
		slot0.break_btn_lab:setString(uv0(TI18N("%d级唤醒"), slot0.open_lev))
		setChildUnEnabled(true, slot0.break_btn)
		slot0.break_btn_lab:disableEffect(cc.LabelEffect.OUTLINE)
	else
		slot0.break_btn_lab:setString(TI18N("唤醒"))
		setChildUnEnabled(false, slot0.break_btn)
		slot0.break_btn_lab:enableOutline(Config.ColorData.data_color4[263], 2)
	end
end

function ElfinTreeStepWindow.setData(slot0)
	if not uv0:getElfinTreeData() or next(slot1) == nil then
		return
	end

	slot2 = slot1.lev
	slot3 = slot1.break_lev

	if not Config.SpriteData.data_tree_step[slot3] or not Config.SpriteData.data_tree_step[slot3 + 1] then
		return
	end

	slot0.cur_step_cfg = slot4

	for slot9 = 1, 5 do
		if slot0.attr_objects[slot9] then
			if slot9 == 1 then
				slot10.attr_name:setString(TI18N("等级上限:"))
				slot10.attr_left_val:setString(slot4.lev_max)
				slot10.attr_right_val:setString(slot5.lev_max)
			elseif slot5.all_attr[slot9 - 1] then
				slot13 = slot11[2]

				loadSpriteTexture(slot10.attr_icon, PathTool.getResFrame("common", PathTool.getAttrIconByStr(slot12)), LOADTEXT_TYPE_PLIST)
				slot10.attr_name:setString(Config.AttrData.data_key_to_name[slot12])
				slot10.attr_left_val:setString(slot1[slot11[1]] or 0)
				slot10.attr_right_val:setString(uv0:getElfinTreeNextAttrVal(slot12, slot2, slot3 + 1))
			end
		end
	end

	if slot4.skill_num < slot5.skill_num then
		slot0.elfin_panel:setVisible(true)
		slot0.elfin_pos_txt:setString(slot5.skill_num)
		slot0.lock_txt:setString(uv1(TI18N("%s阶解锁"), StringUtil.numToChinese(slot5.count)))
		slot0:handleEffect(true)
		commonShowEmptyIcon(slot0.image_bg_pos, false)
	else
		slot0:handleEffect(false)
		slot0.elfin_panel:setVisible(false)
		commonShowEmptyIcon(slot0.image_bg_pos, true, {
			scale = 0.6,
			text = TI18N("什么都没有")
		})
	end

	for slot9, slot10 in ipairs(slot4.expend) do
		uv2(slot0.cost_item_bid_list, slot10[1])
	end

	slot0:updateCostItemNum()
	slot0:updateOpenLev()
end

function ElfinTreeStepWindow.updateCostItemNum(slot0)
	if not slot0.cur_step_cfg then
		return
	end

	for slot4, slot5 in pairs(slot0.cost_item_list) do
		slot5:setVisible(false)
	end

	for slot4, slot5 in ipairs(slot0.cur_step_cfg.expend) do
		slot6 = slot5[1]
		slot7 = slot5[2]

		if not slot0.cost_item_list[slot4] then
			slot8 = BackPackItem.new(true, true, nil, 0.9, nil, true)

			slot0.main_container:addChild(slot8)

			slot0.cost_item_list[slot4] = slot8
		end

		slot8:setPosition(cc.p(80 + (slot4 - 1) * 120, 100))
		slot8:setData(Config.ItemData.data_get_data(slot6))
		slot8:setNeedNum(slot7, BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot5[1]))
		slot8:setVisible(true)
	end
end

function ElfinTreeStepWindow.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.pos_effect then
			slot0.pos_effect:clearTracks()
			slot0.pos_effect:removeFromParent()

			slot0.pos_effect = nil
		end
	elseif not tolua.isnull(slot0.pos_node) and slot0.pos_effect == nil then
		slot0.pos_effect = createEffectSpine(Config.EffectData.data_effect_info[1351], cc.p(0, 0), cc.p(0.5, 0.5), true, PlayerAction.action)

		slot0.pos_node:addChild(slot0.pos_effect)
	end
end

function ElfinTreeStepWindow.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.cost_item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	slot0:handleEffect(false)
	uv0:openElfinTreeStepWindow(false)
end
