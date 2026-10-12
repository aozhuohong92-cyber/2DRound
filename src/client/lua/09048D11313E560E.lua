RoundItem = class("RoundItem", function ()
	return ccui.Layout:create()
end)
RoundItem.Width = 92
RoundItem.Height = 93

function RoundItem.ctor(slot0, slot1, slot2, slot3)
	slot0.click = slot1
	slot0.scale = slot2 or 1
	slot0.scale1 = slot3 or 1
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("backpack/round_item"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0:setTouchEnabled(true)
	slot0:setCascadeOpacityEnabled(true)

	if slot0.scale ~= 1 then
		slot0:setScale(slot0.scale)
	end

	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width / 2, slot0.size.height / 2)
	slot0:addChild(slot0.root_wnd)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.background = slot0.main_container:getChildByName("background")
	slot0.round_bg = slot0.background:getChildByName("round_bg")
	slot0.item_icon = slot0.main_container:getChildByName("icon")

	slot0.item_icon:setScale(slot0.scale1)

	slot0.num_label = slot0.main_container:getChildByName("num")

	slot0.num_label:setString("")

	slot0.num_bg = slot0.main_container:getChildByName("num_bg")
	slot0.num_bg_size = slot0.num_bg:getContentSize()
	slot0.redpoint = slot0.main_container:getChildByName("redpoint")

	slot0.redpoint:setVisible(false)

	slot0.round_res_id = PathTool.getRoundQualityBg(1)

	slot0:registerEvent()
end

function RoundItem.setVisibleRedPoint(slot0, slot1)
	if slot0.redpoint then
		slot0.redpoint:setVisible(slot1 or false)
	end
end

function RoundItem.setVisibleIcon(slot0, slot1)
	if slot0.item_icon then
		slot0.item_icon:setVisible(slot1 or false)
	end
end

function RoundItem.setSelfBackground(slot0, slot1)
	if slot0.round_res_id ~= PathTool.getRoundQualityBg(slot1 or 1) then
		slot0.round_res_id = slot2

		slot0.background:loadTexture(slot0.round_res_id, LOADTEXT_TYPE_PLIST)
	end
end

function RoundItem.setVisibleRoundBG(slot0, slot1)
	if slot0.round_bg then
		slot0.round_bg:setVisible(slot1 or false)
	end
end

function RoundItem.getData(slot0)
	return slot0.data
end

function RoundItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function RoundItem.registerEvent(slot0)
	if slot0.click == true then
		slot0:addTouchEventListener(function (slot0, slot1)
			if uv0.effect == true then
				customClickAction(uv0.main_container, slot1)
			end

			if slot1 == ccui.TouchEventType.ended then
				uv0.touch_end = slot0:getTouchEndPosition()
				slot2 = true

				if uv0.touch_began ~= nil then
					slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
				end

				if slot2 == true then
					playButtonSound2()

					if uv0.btn_call_fun then
						uv0:btn_call_fun()
					else
						if uv0.is_show_tips and uv0.data ~= nil then
							slot3 = uv0.data.bid or uv0.data.base_id or uv0.data.id
							slot4 = 0

							if uv0.data then
								if uv0.data.config and uv0.data.config.type then
									slot4 = uv0.data.config.type
								elseif uv0.data.type then
									slot4 = uv0.data.type
								end
							end

							if BackPackConst.checkIsEquip(slot4) and not uv0.is_spec then
								HeroController:getInstance():openEquipTips(true, uv0.data)
							elseif BackPackConst.checkIsElfin(slot4) then
								TipsManager:getInstance():showElfinTips(slot3)
							else
								slot5 = nil
								slot5 = (not uv0.data.config or uv0.data.config) and Config.ItemData.data_get_data(slot3)

								if uv0.is_show_source == true and slot5.source and next(slot5.source) then
									BackpackController:getInstance():openTipsSource(true, slot5)
								else
									TipsManager:getInstance():showGoodsTips(slot5)
								end
							end

							return
						end

						if uv0.callback then
							uv0:callback()
						end
					end
				end
			elseif slot1 == ccui.TouchEventType.moved then
				-- Nothing
			elseif slot1 == ccui.TouchEventType.began then
				uv0.touch_began = slot0:getTouchBeganPosition()
			elseif slot1 == ccui.TouchEventType.canceled then
				-- Nothing
			end
		end)
	end
end

function RoundItem.setDefaultTip(slot0, slot1)
	if slot1 == nil then
		slot1 = true
	end

	slot0.is_show_tips = slot1
end

function RoundItem.setBaseData(slot0, slot1, slot2)
	if Config.ItemData.data_get_data(slot1) == nil then
		return
	end

	slot0.data = slot3

	slot0.item_icon:setVisible(true)
	loadSpriteTexture(slot0.item_icon, PathTool.getItemRes(slot3.icon, false), LOADTEXT_TYPE)
	slot0:setSelfNum(slot2)
	slot0:setSelfBackground(slot3.quality)
end

function RoundItem.setSelfNum(slot0, slot1)
	slot1 = slot1 or 0

	slot0.num_label:setVisible(slot1 > 1)
	slot0.num_bg:setVisible(slot1 > 1)

	if slot1 > 1 then
		slot0.num_label:setString(slot1)
		slot0:updateNumBGSize()
	end
end

function RoundItem.updateNumBGSize(slot0)
	if slot0.num_label:getContentSize().width < 50 then
		slot2 = 50
	end

	slot0.num_bg:setContentSize(cc.size(slot2 + 6, slot0.num_bg_size.height))
end

function RoundItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
