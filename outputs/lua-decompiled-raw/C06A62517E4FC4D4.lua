slot0 = Area_sceneController:getInstance()
slot1 = string.format
AreaBuildItem = AreaBuildItem or BaseClass()

function AreaBuildItem.__init(slot0, slot1, slot2)
	slot0.data = slot1 or {}
	slot0.area_type = slot2 or Area_sceneConst.Area_Type.Shop
	slot0.can_click = false
	slot0.is_build = slot0.data.type == BuildItemType.build
	slot0.red_data = {}

	slot0:createRootwnd()
end

function AreaBuildItem.createRootwnd(slot0)
	slot0.size = cc.size(80, 80)
	slot0.root = ccui.Widget:create()

	slot0.root:setAnchorPoint(0.5, 0.5)
	slot0.root:setContentSize(slot0.size)

	if slot0.is_build == true then
		slot0.name_bg = createImage(slot0.root, PathTool.getResFrame("common", "common_1049"), slot0.data.name_x or 0, slot0.data.name_y or 0, cc.p(0.5, 0.5), true, 9, true)

		slot0.name_bg:setContentSize(cc.size(149, 41))
		slot0.name_bg:setTouchEnabled(true)
		registerButtonEventListener(slot0.name_bg, handler(slot0, slot0.onClickBuild), true)

		slot0.name_txt = createLabel(20, cc.c4b(255, 255, 255, 255), cc.c4b(2, 0, 20, 255), 74.5, 20.5, slot0.data.name or "", slot0.name_bg, 2, cc.p(0.5, 0.5))

		slot0.name_txt:setLocalZOrder(9)
		slot0:createBuild()
	else
		slot0:createEffect()
	end
end

function AreaBuildItem.createBuild(slot0)
	if slot0.build_icon then
		return
	end

	slot0.build_icon = createImage(slot0.root, nil, slot0.size.width * 0.5, slot0.size.height * 0.5, cc.p(0.5, 0.5), false)

	slot0.build_icon:setVisible(false)
	slot0.build_icon:setOpacity(125)
	slot0.build_icon:setScale(2)
	slot0.build_icon:ignoreContentAdaptWithSize(true)

	slot0.build_load = loadImageTextureFromCDN(slot0.build_icon, uv0("resource/area_scene/build/build_%s.png", slot0.data.res), ResourcesType.single, slot0.build_load, nil, function ()
		slot0 = uv0.build_icon:getContentSize()
		uv0.touch_layer = ccui.Layout:create()

		uv0.touch_layer:setAnchorPoint(cc.p(0.5, 0.5))
		uv0.touch_layer:setPosition(uv0.size.width * 0.5, uv0.size.height * 0.5)
		uv0.touch_layer:setTouchEnabled(true)
		uv0.touch_layer:setSwallowTouches(false)
		uv0.touch_layer:setContentSize(cc.size(slot0.width * 6 / 5, slot0.height * 6 / 5))

		if uv0.data then
			uv0.touch_layer:setName("guide_build_" .. uv0.data.bid)
		end

		uv0.root:addChild(uv0.touch_layer)
		uv0.touch_layer:addTouchEventListener(function (slot0, slot1)
			uv0:onTouchItem(slot0, slot1)
		end)
	end)
end

function AreaBuildItem.onTouchItem(slot0, slot1, slot2)
	if slot2 == ccui.TouchEventType.began then
		slot0.touch_began = slot1:getTouchBeganPosition()

		slot0.build_icon:setVisible(true)
	elseif slot2 == ccui.TouchEventType.moved then
		-- Nothing
	elseif slot2 == ccui.TouchEventType.canceled then
		slot0.build_icon:setVisible(false)
	elseif slot2 == ccui.TouchEventType.ended then
		slot0.build_icon:setVisible(false)

		slot3 = slot1:getTouchEndPosition()

		if slot0.touch_began and slot3 and (math.abs(slot3.x - slot0.touch_began.x) > 20 or math.abs(slot3.y - slot0.touch_began.y) > 20) then
			return
		end

		playButtonSound2()
		slot0:onClickBuild()
	end
end

function AreaBuildItem.createEffect(slot0)
	slot0.effect = createEffectSpine(slot0.data.res, cc.p(slot0.size.width * 0.5, slot0.size.height * 0.5), cc.p(0.5, 0.5), true, PlayerAction.action)

	slot0.root:addChild(slot0.effect)
end

function AreaBuildItem.onClickBuild(slot0)
	if slot0.data.bid == Area_sceneConst.Shop_Type.skin then
		if Config.ChargeMallData.data_const.skin_mall_lev and RoleController:getInstance():getRoleVo().lev < slot2.val then
			message(slot2.desc)

			return
		end
	elseif slot0.data.bid == Area_sceneConst.Shop_Type.plume then
		slot3, slot4 = MainuiController:getInstance():checkIsOpenByActivate(Config.ExchangeData.data_shop_list[MallConst.MallType.PlumeShop].limit)

		if not slot3 then
			message(slot4)

			return
		end
	end

	uv0:onClickAreaBuildById(slot0.area_type, slot0.data.bid)
end

function AreaBuildItem.setParentWnd(slot0, slot1)
	if tolua.isnull(slot1) then
		return
	end

	slot0.parent_wnd = slot1

	if slot0.data ~= nil then
		slot0.root:setPosition(slot0.data.x, slot0.data.y)
		slot0.parent_wnd:addChild(slot0.root, 1)
	end
end

function AreaBuildItem.setRedStatus(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		slot7 = false

		for slot11, slot12 in pairs(slot0.red_data) do
			if slot12.bid == slot6.bid then
				slot12.status = slot6.status
				slot7 = true

				break
			end
		end

		if not slot7 then
			table.insert(slot0.red_data, slot6)
		end
	end

	slot2 = false

	for slot6, slot7 in pairs(slot0.red_data) do
		if slot7.status == true then
			slot2 = true

			break
		end
	end

	addRedPointToNodeByStatus(slot0.name_bg, slot2, 4, 7)
end

function AreaBuildItem.getData(slot0)
	return slot0.data
end

function AreaBuildItem.getRoot(slot0)
	return slot0.root
end

function AreaBuildItem.__delete(slot0)
	if slot0.build_load then
		slot0.build_load:DeleteMe()

		slot0.build_load = nil
	end

	if slot0.effect then
		slot0.effect:setVisible(false)
		slot0.effect:clearTracks()
		slot0.effect:runAction(cc.RemoveSelf:create(true))
	end

	if slot0.root:getParent() then
		slot0.root:removeAllChildren()
		slot0.root:removeFromParent()
	end
end
