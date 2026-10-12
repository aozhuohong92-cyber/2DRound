CrossgroundItem = class("CrossgroundItem", function ()
	return ccui.Widget:create()
end)
slot0 = CrossgroundController:getInstance()
slot1 = string.format
slot2 = table.insert
slot3 = table.sort

function CrossgroundItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function CrossgroundItem.configUI(slot0)
	slot0.size = cc.size(687, 214)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("crossground/crossground_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")

	slot2:setSwallowTouches(false)

	slot0.container = slot2
	slot0.item_bg = slot0.container:getChildByName("item_bg")
	slot0.open_desc = slot0.container:getChildByName("open_desc")

	slot0.open_desc:setAnchorPoint(cc.p(0, 1))
	slot0.open_desc:setPosition(30, 145)

	slot0.lock_layer = slot0.container:getChildByName("lock_layer")
	slot0.item_scrollview = slot0.container:getChildByName("item_scrollview")

	slot0.item_scrollview:setScrollBarEnabled(false)

	slot0.join_desc = createRichLabel(22, cc.c4b(255, 255, 255, 255), cc.p(0, 0.5), cc.p(30, 30), nil, nil, 1000)

	slot0.container:addChild(slot0.join_desc)

	slot0.container_1 = slot0.root_wnd:getChildByName("container_1")

	if slot0.container_1 then
		slot0.item_obj_list = {}
		slot6 = "item_bg"
		item_bg = slot0.container_1:getChildByName(slot6)

		for slot6 = 1, 2 do
			slot7 = slot0.container_1:getChildByName("item" .. slot6)
			slot8 = {
				container = slot7
			}

			slot8.container:setSwallowTouches(false)

			slot8.item_bg = item_bg
			slot8.open_desc = slot7:getChildByName("open_desc")

			slot8.open_desc:setAnchorPoint(cc.p(0, 1))
			slot8.open_desc:setPosition(30, 145)

			slot8.lock_layer = slot7:getChildByName("lock_layer")
			slot8.item_scrollview = slot7:getChildByName("item_scrollview")

			slot8.item_scrollview:setScrollBarEnabled(false)

			if slot6 == 2 then
				slot8.join_desc = createRichLabel(22, cc.c4b(255, 255, 255, 255), cc.p(0, 0.5), cc.p(0, 30), nil, nil, 1000)
			else
				slot8.join_desc = createRichLabel(22, cc.c4b(255, 255, 255, 255), cc.p(0, 0.5), cc.p(30, 30), nil, nil, 1000)
			end

			slot7:addChild(slot8.join_desc)

			slot0.item_obj_list[slot6] = slot8
		end

		slot0.container_1:setVisible(false)
	end
end

function CrossgroundItem.register_event(slot0)
	function slot4(slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		elseif slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 then
				playButtonSound2()

				if uv0.open_status and uv0.data then
					uv1:onClickCrossgroundItem(uv0.data.id)
				end
			end
		end
	end

	slot0.container:addTouchEventListener(slot4)

	for slot4, slot5 in ipairs(slot0.item_obj_list) do
		slot5.container:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.began then
				uv0.touch_began = slot0:getTouchBeganPosition()
			elseif slot1 == ccui.TouchEventType.ended then
				uv0.touch_end = slot0:getTouchEndPosition()
				slot2 = true

				if uv0.touch_began ~= nil then
					slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
				end

				if slot2 then
					playButtonSound2()

					if uv0.open_status and uv0.data then
						uv1:onClickCrossgroundItem(uv0.data.id)
					end
				end
			end
		end)
	end
end

function CrossgroundItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.cross_data = slot1

	if slot1.data and next(slot2) ~= nil then
		if #slot2 == 1 then
			slot0.container:setVisible(true)
			slot0.container_1:setVisible(false)
			slot0:setItemData(slot0, slot2[1], true)
		else
			slot0.container:setVisible(false)
			slot0.container_1:setVisible(true)
			uv0(slot2, function (slot0, slot1)
				return slot0.index < slot1.index
			end)
			slot0:setItemData(slot0.item_obj_list[1], slot2[1], true)
			slot0:setItemData(slot0.item_obj_list[2], slot2[2])
		end
	end

	slot0:updateRedStatus()
end

function CrossgroundItem.setItemData(slot0, slot1, slot2, slot3)
	if not slot1 then
		return
	end

	if not slot2 then
		return
	end

	slot1.data = slot2

	if slot3 then
		slot1.bg_load = loadImageTextureFromCDN(slot1.item_bg, PathTool.getPlistImgForDownLoad("bigbg/crossground", string.format("txt_cn_crossground_%s", slot2.groud)), ResourcesType.single, slot1.bg_load)
	end

	slot1.join_desc:setString(slot2.desc)

	slot4 = true
	slot6 = slot2.open_limit[1]
	slot7 = slot2.open_limit[2]

	for slot11, slot12 in ipairs(slot2.open_limit) do
		if slot12[1] == "world_lev" then
			if RoleController:getInstance():getModel():getWorldLev() < slot12[2] then
				slot4 = false

				uv1({}, uv0(TI18N("世界等级达到%d级开启\n(当前为%s级)"), slot12[2], slot13))
			end
		elseif slot12[1] == "lev" and RoleController:getInstance():getRoleVo() and slot13.lev < slot12[2] then
			slot4 = false

			uv1(slot5, uv0(TI18N("角色等级达到%d级开启"), slot12[2]))
		end
	end

	if slot2.id == 1002 and ElitematchController:getInstance():getModel():getSCData().state == 0 then
		slot4 = false

		uv1(slot5, TI18N("该玩法将在下周一开启"))
	end

	slot8 = ""

	if not slot4 and slot5[1] then
		slot8 = slot5[1]
	end

	slot1.open_status = slot4

	if slot4 then
		slot9 = {}

		for slot13, slot14 in pairs(slot2.award) do
			uv1(slot9, {
				slot14,
				1
			})
		end

		slot1.item_list = commonShowSingleRowItemList(slot1.item_scrollview, slot1.item_list, slot9, {
			scale = 0.65
		})

		slot1.item_scrollview:setVisible(true)
		slot1.open_desc:setVisible(false)
		slot1.lock_layer:setVisible(false)
		slot0:updateArenaPeakInfo(slot1, slot2)
	else
		slot1.open_desc:setVisible(true)
		slot1.open_desc:setString(slot8)
		slot1.item_scrollview:setVisible(false)
		slot1.lock_layer:setVisible(true)
	end
end

function CrossgroundItem.updateArenaPeakInfo(slot0, slot1, slot2)
	if not slot1 or not slot2 then
		return
	end

	if not slot1.open_status then
		return
	end

	if slot2.id == CrossgroundConst.Ground_Type.peakChampion then
		if slot1.match_img == nil then
			slot1.match_img = createSprite(PathTool.getResFrame("crossground", "crossground_1005"), 343, 172, slot1.container, cc.p(1, 0.5))
			slot1.match_label = createLabel(20, cc.c3b(255, 255, 255), cc.c3b(89, 24, 24), 300, 173, ArenapeakchampionController:getInstance():getModel():getMacthSingleText(), slot1.container, 2, cc.p(0.5, 0.5))

			slot0:showArenaPeakEffect(true, slot1.container)
		elseif slot1.match_label then
			slot1.match_label:setString(slot4)
		end
	elseif slot2.id == CrossgroundConst.Ground_Type.CrossArena then
		if ArenapeakchampionController:getInstance():getModel():isBeforeOpenMacthTime() then
			if slot1.match_img == nil then
				slot1.match_img = createSprite(PathTool.getResFrame("crossground", "crossground_1005"), 94, 172, slot1.container, cc.p(0, 0.5))

				slot1.match_img:setScaleX(-1)

				slot1.match_label = createLabel(20, cc.c3b(255, 255, 255), cc.c3b(89, 24, 24), 44, 173, TI18N("巅峰赛季"), slot1.container, 2, cc.p(0.5, 0.5))
			else
				if slot1.match_img then
					slot1.match_img:setVisible(true)
				end

				if slot1.match_label then
					slot1.match_label:setVisible(true)
				end
			end

			slot0:showCrossArenaEffect(true, slot1.container)
		else
			if slot1.match_img then
				slot1.match_img:setVisible(false)
			end

			if slot1.match_label then
				slot1.match_label:setVisible(false)
			end

			slot0:showCrossArenaEffect(false, slot1.container)
		end
	end
end

function CrossgroundItem.showArenaPeakEffect(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.arenapeak_effect == nil then
			if not slot2 then
				return
			end

			slot3 = slot0.container:getContentSize()
			slot0.arenapeak_effect = createEffectSpine("E27404", cc.p(297, 172), cc.p(0.5, 0.5), true, PlayerAction.action)

			slot2:addChild(slot0.arenapeak_effect, 1)
		end
	elseif slot0.arenapeak_effect then
		slot0.arenapeak_effect:setVisible(false)
		slot0.arenapeak_effect:removeFromParent()

		slot0.arenapeak_effect = nil
	end
end

function CrossgroundItem.showCrossArenaEffect(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.corssarena_effect == nil then
			if not slot2 then
				return
			end

			slot3 = slot0.container:getContentSize()
			slot0.corssarena_effect = createEffectSpine("E27404", cc.p(48, 172), cc.p(0.5, 0.5), true, PlayerAction.action)

			slot0.corssarena_effect:setScaleX(-1)
			slot2:addChild(slot0.corssarena_effect, 1)
		end
	elseif slot0.corssarena_effect then
		slot0.corssarena_effect:setVisible(false)
		slot0.corssarena_effect:removeFromParent()

		slot0.corssarena_effect = nil
	end
end

function CrossgroundItem.updateRedStatus(slot0)
	if slot0.cross_data and slot0.cross_data.data and next(slot1) ~= nil then
		if #slot1 == 1 then
			slot0:updateRedStatusBydata(slot0, slot1[1])
		else
			uv0(slot1, function (slot0, slot1)
				return slot0.index < slot1.index
			end)
			slot0:updateRedStatusBydata(slot0.item_obj_list[1], slot1[1])
			slot0:updateRedStatusBydata(slot0.item_obj_list[2], slot1[2])
		end
	end
end

function CrossgroundItem.updateRedStatusBydata(slot0, slot1, slot2)
	if slot2 then
		slot3 = false

		if slot2.id == CrossgroundConst.Ground_Type.Ladder then
			slot3 = LadderController:getInstance():getModel():checkLadderRedStatus()
		elseif slot2.id == CrossgroundConst.Ground_Type.EliteMatch then
			slot3 = ElitematchController:getInstance():getModel():getElitematchTotalRedPoint()
		elseif slot2.id == CrossgroundConst.Ground_Type.CrossArena then
			slot3 = CrossarenaController:getInstance():getModel():checkCrossarenaRedStatus()
		elseif slot2.id == CrossgroundConst.Ground_Type.CrossChampion then
			slot3 = CrosschampionController:getInstance():getModel():checkCrosschampionRedStatus()
		elseif slot2.id == CrossgroundConst.Ground_Type.Arenateam then
			slot3 = ArenateamController:getInstance():getModel():checkArenateamTotalRedPoint()
		elseif slot2.id == CrossgroundConst.Ground_Type.peakChampion then
			slot3 = ArenapeakchampionController:getInstance():getModel():checkPeakChampionTotalRedPoint()
		end

		addRedPointToNodeByStatus(slot1.container, slot3, nil, nil, 99, 2)
	end
end

function CrossgroundItem.DeleteMe(slot0)
	slot0:showArenaPeakEffect(false)
	slot0:showCrossArenaEffect(false)

	if slot0.award_scrollview then
		slot0.award_scrollview:DeleteMe()

		slot0.award_scrollview = nil
	end

	if slot0.bg_load then
		slot0.bg_load:DeleteMe()

		slot0.bg_load = nil
	end

	if slot0.item_list then
		for slot4, slot5 in ipairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end

	if slot0.item_obj_list then
		for slot4, slot5 in ipairs(slot0.item_obj_list) do
			if slot5.item_list then
				for slot9, slot10 in ipairs(slot5.item_list) do
					slot10:DeleteMe()
				end

				slot5.item_list = nil
			end

			if slot5.bg_load then
				slot5.bg_load:DeleteMe()

				slot5.bg_load = nil
			end
		end
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
