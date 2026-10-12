slot1 = ElfinController:getInstance():getModel()
slot2 = string.format
ElfinRouseItem = class("ElfinRouseItem", function ()
	return ccui.Widget:create()
end)

function ElfinRouseItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()

	slot0.elfin_step_list = {}
end

function ElfinRouseItem.configUI(slot0)
	slot0.size = cc.size(80, 80)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("elfin/elfin_rouse_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot2
	slot0.pos_node = slot2:getChildByName("pos_node")
	slot0.pos_icon = slot2:getChildByName("pos_icon")
	slot0.image_bottom = slot2:getChildByName("image_bottom")
	slot0.pos_bg_sp = slot2:getChildByName("pos_bg_sp")
	slot0.lock_sp = slot2:getChildByName("lock_sp")
	slot0.add_btn = slot2:getChildByName("add_btn")
	slot0.pos_txt = slot2:getChildByName("pos_txt")
	slot0.lock_txt = slot2:getChildByName("lock_txt")
end

function ElfinRouseItem.register_event(slot0)
	registerButtonEventListener(slot0.add_btn, function ()
		uv0:onClickAddBtn()
	end, true)
	registerButtonEventListener(slot0.container, function ()
		uv0:onClickItem()
	end, true)
end

function ElfinRouseItem.onClickAddBtn(slot0)
	uv0:openElfinChooseWindow(true, {
		elfin_pos = slot0.elfin_pos
	})
end

function ElfinRouseItem.onClickItem(slot0)
	if slot0.is_lock and slot0.need_step then
		message(uv0(TI18N("佩罗娜达到%s阶解锁"), StringUtil.numToChinese(slot0.need_step)))

		return
	end

	if slot0.elfin_bid == 0 or not Config.SpriteData.data_elfin_com[slot0.elfin_bid] then
		if slot0.elfin_bid ~= 0 then
			-- Nothing
		end

		uv1:openElfinChooseWindow(true, {
			elfin_pos = slot0.elfin_pos,
			elfin_bid = slot0.elfin_bid
		})
	else
		uv1:openElfinCompoundWindow(true, slot0.elfin_bid, slot0.elfin_pos)
	end
end

function ElfinRouseItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = slot1.elfin_bid

	slot0:checkShowHigherEffect(slot2)

	slot0.elfin_bid = slot2
	slot0.elfin_pos = slot1.elfin_pos or 1
	slot0.need_step = slot1.need_step or 1
	slot0.is_lock = true

	if slot2 then
		slot0.is_lock = false
	end

	slot0:handleEffect(not slot0.is_lock)
	slot0:showElfinStep(false)

	if not slot2 then
		if slot0.icon_clipNode then
			slot0.icon_clipNode:setVisible(false)
		end

		slot0.pos_bg_sp:setVisible(false)
		slot0.add_btn:setVisible(false)
		slot0.pos_txt:setVisible(false)
		slot0.image_bottom:setVisible(true)
		slot0.lock_sp:setVisible(true)
		slot0.lock_txt:setVisible(true)
		slot0.lock_txt:setString(uv0(TI18N("%s阶解锁"), StringUtil.numToChinese(slot4)))
	else
		slot0.pos_txt:setString(slot3)
		slot0.lock_sp:setVisible(false)
		slot0.pos_bg_sp:setVisible(true)
		slot0.pos_txt:setVisible(true)

		if slot2 == 0 or not Config.SpriteData.data_elfin_data(slot2) then
			slot0.add_btn:setVisible(true)
			slot0.image_bottom:setVisible(false)
			slot0.lock_txt:setVisible(false)

			if slot0.icon_clipNode then
				slot0.icon_clipNode:setVisible(false)
			end
		else
			slot0.cur_elfin_cfg = slot5

			slot0.add_btn:setVisible(false)

			if Config.ItemData.data_get_data(slot2) then
				if not slot0.icon_clipNode then
					slot0.icon_clipNode = cc.ClippingNode:create(createSprite(PathTool.getResFrame("elfin", "elfin_1012"), 40, 40, nil, cc.p(0.5, 0.5)))

					slot0.icon_clipNode:setAnchorPoint(cc.p(0.5, 0.5))
					slot0.icon_clipNode:setContentSize(cc.size(80, 80))
					slot0.icon_clipNode:setCascadeOpacityEnabled(true)
					slot0.icon_clipNode:setAlphaThreshold(0)
					slot0.pos_icon:addChild(slot0.icon_clipNode)

					slot0.image_icon = createImage(slot0.icon_clipNode, nil, 40, 40, cc.p(0.5, 0.5), false)

					slot0.image_icon:setScale(0.7)
				end

				slot0.icon_clipNode:setVisible(true)
				slot0.image_icon:loadTexture(PathTool.getItemRes(slot6.icon), LOADTEXT_TYPE)
				slot0:showElfinStep(true, slot6.eqm_jie)
				slot0.lock_txt:setString(slot6.name)
				slot0.image_bottom:setVisible(true)
				slot0.lock_txt:setVisible(true)
			end
		end
	end

	slot0:updateResStatus()
end

function ElfinRouseItem.updateResStatus(slot0)
	slot1 = false

	if slot0.elfin_bid and slot0.elfin_bid == 0 and uv0:getElfinRedStatusByRedBid(HeroConst.RedPointType.eElfin_empty_pos) then
		slot1 = true
	elseif slot0.elfin_bid and slot0.cur_elfin_cfg then
		if Config.SpriteData.data_elfin_com[slot0.elfin_bid] and slot2.expend and next(slot2.expend) ~= nil then
			slot1 = true

			for slot6, slot7 in pairs(slot2.expend) do
				if BackpackController:getInstance():getModel():getItemNumByBid(slot7[1]) < slot7[2] then
					slot1 = false
				end
			end
		end

		if slot1 == false then
			for slot7, slot8 in pairs(BackpackController:getInstance():getModel():getAllBackPackArray(BackPackConst.item_tab_type.ELFIN) or {}) do
				if Config.SpriteData.data_elfin_data(slot8.base_id) and slot9.sprite_type == slot0.cur_elfin_cfg.sprite_type and slot0.cur_elfin_cfg.step < slot9.step then
					slot1 = true

					break
				end
			end
		end
	end

	addRedPointToNodeByStatus(slot0.container, slot1)
end

function ElfinRouseItem.showElfinStep(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot0.elfin_step_list) do
		slot7:setVisible(false)
	end

	if slot1 == true then
		slot3 = 15
		slot4 = slot0.size.width * 0.5 - slot2 * slot3 * 0.5 + slot3 * 0.5

		for slot8 = 1, slot2 do
			if not slot0.elfin_step_list[slot8] then
				slot0.elfin_step_list[slot8] = createImage(slot0.container, PathTool.getResFrame("common", "common_90032"), 0, 0, cc.p(0.5, 0.5), true, 0, false)
			end

			slot0.elfin_step_list[slot8]:setVisible(true)
			slot0.elfin_step_list[slot8]:setPosition(slot4 + (slot8 - 1) * slot3, 5)
		end
	end
end

function ElfinRouseItem.handleEffect(slot0, slot1)
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

function ElfinRouseItem.checkShowHigherEffect(slot0, slot1)
	if not slot1 or slot1 == 0 then
		return
	end

	if slot0.elfin_bid and slot0.elfin_bid == 0 then
		slot0:showHigherEffect(true)
	else
		slot3 = Config.SpriteData.data_elfin_data(slot0.elfin_bid)

		if Config.SpriteData.data_elfin_data(slot1) and slot3 and slot3.step < slot2.step then
			slot0:showHigherEffect(true)
		end
	end
end

function ElfinRouseItem.showHigherEffect(slot0, slot1)
	if slot1 == false then
		if slot0.higher_effect then
			slot0.higher_effect:clearTracks()
			slot0.higher_effect:removeFromParent()

			slot0.higher_effect = nil
		end
	else
		if not tolua.isnull(slot0.container) and slot0.higher_effect == nil then
			slot0.higher_effect = createEffectSpine(PathTool.getEffectRes(185), cc.p(slot0.size.width * 0.5, slot0.size.height * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action)

			slot0.higher_effect:setScale(0.5)
			slot0.container:addChild(slot0.higher_effect)
		elseif slot0.higher_effect then
			slot0.higher_effect:setToSetupPose()
			slot0.higher_effect:setAnimation(0, PlayerAction.action, false)
		end

		playOtherSound("c_levelup")
	end
end

function ElfinRouseItem.DeleteMe(slot0)
	slot0:handleEffect(false)
	slot0:showHigherEffect(false)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
