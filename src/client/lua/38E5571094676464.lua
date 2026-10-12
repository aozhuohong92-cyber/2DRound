slot1 = HomeworldController:getInstance():getModel()
slot2 = string.format
HomeworldMyUnitItem = class("HomeworldMyUnitItem", function ()
	return ccui.Widget:create()
end)

function HomeworldMyUnitItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function HomeworldMyUnitItem.configUI(slot0)
	slot0.size = cc.size(155, 172)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("homeworld/homeworld_my_unit_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot2

	slot0.container:setSwallowTouches(false)

	slot0.sp_icon = slot2:getChildByName("sp_icon")

	slot0.sp_icon:setScale(0.75)

	slot0.sell_btn = slot2:getChildByName("sell_btn")
	slot0.image_tips = slot2:getChildByName("image_tips")

	slot0.image_tips:getChildByName("label"):setString(TI18N("已装饰所有"))

	slot0.name_txt = slot2:getChildByName("name_txt")
	slot0.num_txt = slot2:getChildByName("num_txt")
end

function HomeworldMyUnitItem.register_event(slot0)
	registerButtonEventListener(slot0.container, function ()
		if uv0.data.have_num <= 0 then
			return
		end

		if uv0.click_callback and uv0.data then
			uv0.click_callback(uv0.data.base_id)
		end
	end, true, nil, nil, nil, 0.5, true)
	registerButtonEventListener(slot0.sell_btn, function ()
		if not uv0.data then
			return
		end

		slot0 = 0

		if ((uv0.data.bag_num >= uv0.data.have_num or uv0.data.bag_num) and uv0.data.have_num) <= 0 then
			message(TI18N("没有可出售的家具"))

			return
		end

		if uv0.data.have_num > 0 then
			BackpackController:getInstance():openItemSellPanel(true, uv0.data, BackPackConst.Bag_Code.HOME, 2)
		end
	end, true)
end

function HomeworldMyUnitItem.setData(slot0, slot1)
	if slot1 ~= nil then
		slot0.data = slot1
		slot0.unit_cfg = Config.HomeData.data_home_unit(slot1.base_id)

		slot0.container:setName("guide_my_unit_" .. slot1.base_id)
		slot0:refreshItemInfo()
	end
end

function HomeworldMyUnitItem.refreshItemInfo(slot0)
	if not slot0.data or not slot0.unit_cfg then
		return
	end

	if slot0.unit_cfg.icon and (not slot0.cur_res_icon or slot0.cur_res_icon ~= slot0.unit_cfg.icon) then
		slot0.cur_res_icon = slot0.unit_cfg.icon

		loadSpriteTexture(slot0.sp_icon, PathTool.getFurnitureNormalRes(slot0.unit_cfg.icon), LOADTEXT_TYPE)
	end

	slot0.name_txt:setString(slot0.unit_cfg.name)

	if Config.ItemData.data_get_data(slot0.unit_cfg.bid) then
		slot0.name_txt:setTextColor(BackPackConst.getBlackQualityColorC4B(slot1.quality))
	end

	slot0:updateUnitNum()
end

function HomeworldMyUnitItem.updateUnitNum(slot0)
	if not slot0.data then
		return
	end

	if slot0.data.have_num - slot0.data.bag_num > 0 then
		slot0.num_txt:setString(uv0(TI18N("数量:%d+%d"), slot1, slot2))
	else
		slot0.num_txt:setString(uv0(TI18N("数量:%d"), slot0.data.have_num))
	end

	slot0.image_tips:setVisible(slot0.data.have_num == 0)
end

function HomeworldMyUnitItem.addCallBack(slot0, slot1)
	slot0.click_callback = slot1
end

function HomeworldMyUnitItem.suspendAllActions(slot0)
end

function HomeworldMyUnitItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
