StarTowerItem = class("StarTowerItem", function ()
	return ccui.Widget:create()
end)
slot0 = Config.StarTowerData.data_tower_base

function StarTowerItem.ctor(slot0)
	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function StarTowerItem.config(slot0)
	slot0.ctrl = StartowerController:getInstance()
	slot0.size = cc.size(360, 1200)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.is_lock = false

	slot0:retain()

	slot0.is_open_tower = true
	slot0.star_list = {}
	slot0.partner_model = nil
end

function StarTowerItem.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("startower/star_tower_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.background = slot0.main_panel:getChildByName("bg")
	slot0.select_bg = slot0.main_panel:getChildByName("select_bg")

	slot0.select_bg:setVisible(false)

	slot0.people_node = slot0.main_panel:getChildByName("people_node")
	slot0.tower_name = slot0.main_panel:getChildByName("name")
	slot0.lock_bg = slot0.main_panel:getChildByName("lock_panel")
	slot0.lock_icon = slot0.lock_bg:getChildByName("lock")
	slot0.pass_icon = slot0.main_panel:getChildByName("pass_icon")

	slot0.pass_icon:setVisible(false)

	slot0._floorAward = slot0.main_panel:getChildByName("floorAward")
	slot0._firstAward = slot0._floorAward:getChildByName("firstAward")

	slot0._floorAward:setVisible(false)
	slot0:countVisible(false)

	slot0.come_label = slot0.main_panel:getChildByName("Image_4")

	slot0.come_label:setVisible(false)
end

function StarTowerItem.countVisible(slot0, slot1)
	slot2 = slot0.main_panel:getChildByName("countBG")

	slot2:setVisible(slot1)

	slot0._textCount = slot2:getChildByName("textCount")

	slot0._textCount:setVisible(slot1)

	slot0._dianmond = slot2:getChildByName("dianmond")

	slot0._dianmond:setVisible(false)
end

function StarTowerItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = uv0[slot1]
	slot0.data = slot2

	slot0.tower_name:setString(slot2.name or "")
	slot0:setName("guildsign_startower_" .. slot2.lev)
	slot0:updateMessage()
end

function StarTowerItem.sweepCount(slot0, slot1)
	slot0.pass_icon:setVisible(false)
	slot0:countVisible(false)

	if slot1 and slot1.lev == (slot0.ctrl:getModel():getNowTowerId() or 0) then
		if (slot0.ctrl:getModel():getTowerLessCount() or 0) <= 0 then
			if slot0.ctrl:getModel():getBuyCount() >= 0 then
				slot0:countVisible(true)
				slot0._dianmond:setVisible(true)

				if Config.StarTowerData.data_tower_buy[(slot0.ctrl:getModel():getBuyCount() or 0) + 1] then
					slot0._textCount:setString(string.format(TI18N("   %d扫荡"), Config.StarTowerData.data_tower_buy[slot5 + 1].expend[1][2] or 0))
				else
					slot0:countVisible(false)
					slot0._dianmond:setVisible(false)
					slot0.pass_icon:setVisible(true)
				end
			else
				slot0:countVisible(false)
				slot0._dianmond:setVisible(false)
				slot0.pass_icon:setVisible(true)
			end
		else
			slot0._textCount:setString(string.format(TI18N("可扫荡%d次"), slot3))
			slot0:countVisible(true)
			slot0._dianmond:setVisible(false)
			slot0.pass_icon:setVisible(false)
		end
	end

	if slot1.lev ~= slot2 and slot1.lev < slot2 then
		slot0.pass_icon:setVisible(true)
	end

	slot3 = slot2
	slot5 = slot2

	if ((slot2 + 1 < #uv0 or #uv0) and slot2 + 1) < slot0.data.lev and slot0.data.lev <= ((slot2 + 6 < #uv0 or #uv0) and slot2 + slot4) then
		if uv0[slot0.data.lev].item_show[1] then
			slot9 = BackPackItem.new(nil, true, nil, 0.6)

			slot9:setDefaultTip()
			slot0._floorAward:addChild(slot9)
			slot0._firstAward:setZOrder(10)
			slot9:setPosition(cc.p(62, 51))
			slot9:setBaseData(slot6[1], slot6[2])
			slot0._floorAward:setVisible(true)
		else
			slot0._floorAward:setVisible(false)
		end
	else
		slot0._floorAward:setVisible(false)
	end
end

function StarTowerItem.updateMessage(slot0)
	if not slot0.data then
		return
	end

	slot2 = false

	if slot0.data.lev <= (slot0.ctrl:getModel():getNowTowerId() or 0) then
		slot2 = true
	end

	slot0.is_pass = slot2

	slot0:sweepCount(slot0.data)

	slot0.is_lock = slot0.data.lev > slot1 + 1

	slot0.lock_icon:setVisible(slot0.is_lock)
	slot0.come_label:setVisible(false)
	doStopAllActions(slot0.come_label)

	slot0.is_open_tower = true

	if slot0.is_pass == false and slot0.is_lock == false then
		slot4 = BattleDramaController:getInstance():getModel():getDramaData()

		if (slot0.data.limit_dun_id or 0) ~= 0 and slot4 and slot4.max_dun_id and slot4.max_dun_id < slot3 then
			slot0.is_open_tower = false

			return
		end

		if slot0.data.lev == slot1 + 1 then
			slot0.come_label:setVisible(true)
			breatheShineAction(slot0.come_label, 1, 1)
			slot0:setSelectStatus(true)
		else
			slot0:setSelectStatus(false)
		end
	else
		slot0:setSelectStatus(false)
	end
end

function StarTowerItem.registerEvents(slot0)
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 == true then
				playButtonSound2()
				uv0:clickHandler()

				if slot0.guide_call_back ~= nil then
					slot0:guide_call_back()
				end
			end
		elseif slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		end
	end)
end

function StarTowerItem.clickHandler(slot0)
	if slot0.call_fun then
		slot0:call_fun(slot0.data)
	end
end

function StarTowerItem.addCallBack(slot0, slot1)
	slot0.call_fun = slot1
end

function StarTowerItem.setSelectStatus(slot0, slot1)
	slot0.select_bg:setVisible(slot1)
end

function StarTowerItem.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function StarTowerItem.getData(slot0)
	return slot0.data
end

function StarTowerItem.clearInfo(slot0)
	slot0:setSelectStatus(false)
	slot0:removeFromParent()
end

function StarTowerItem.runUnLocking(slot0)
	slot0.lock_icon:setVisible(true)
	slot0.lock_icon:runAction(cc.MoveBy:create(5, cc.p(0, 500)))
end

function StarTowerItem.addPeopleAnime(slot0)
	if slot0.data then
		slot0.partner_model = BaseRole.new(BaseRole.type.unit, slot0.data.unit_id, nil, {
			scale = 0.7
		})

		slot0.partner_model:setAnimation(0, PlayerAction.show, true)
		slot0.partner_model:setScale(0.7)
		slot0.people_node:addChild(slot0.partner_model)
		slot0.partner_model:setPosition(cc.p(20, -20))
	end
end

function StarTowerItem.removePeopleAnime(slot0)
	if slot0.partner_model and slot0.partner_model.DeleteMe then
		slot0.partner_model:DeleteMe()

		slot0.partner_model = false
	end
end

function StarTowerItem.DeleteMe(slot0)
	slot0:removeFromParent()
	slot0:removeAllChildren()
	slot0:release()
end
