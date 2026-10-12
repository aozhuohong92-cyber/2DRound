ElementEctypeItem = class("ElementEctypeItem", function ()
	return ccui.Widget:create()
end)
slot1 = ElementController:getInstance():getModel()

function ElementEctypeItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function ElementEctypeItem.configUI(slot0)
	slot0.size = cc.size(720, 132)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("element/element_ectype_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot2
	slot0.sp_first = slot2:getChildByName("sp_first")
	slot0.index_txt = slot2:getChildByName("index_txt")
	slot0.atk_num = slot2:getChildByName("atk_num")
	slot0.desc_txt = slot2:getChildByName("desc_txt")
	slot0.sp_lock = slot2:getChildByName("sp_lock")
	slot0.btn_challenge = slot2:getChildByName("btn_challenge")
	slot3 = slot0.btn_challenge:getChildByName("label")

	slot3:setString(TI18N("挑战"))
	slot3:setTextColor(Config.ColorData.data_color4[1])
	slot3:enableOutline(Config.ColorData.data_color4[264], 2)

	slot0.btn_sweep = slot2:getChildByName("btn_sweep")
	slot4 = slot0.btn_sweep:getChildByName("label")

	slot4:setString(TI18N("扫荡"))
	slot4:setTextColor(Config.ColorData.data_color4[1])
	slot4:enableOutline(Config.ColorData.data_color4[263], 2)

	slot5 = slot2:getChildByName("item_list")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot5, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot5:getContentSize(), {
		start_y = 0,
		start_x = 0,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.6,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.6,
		item_height = BackPackItem.Height * 0.6
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function ElementEctypeItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_challenge, function ()
		slot0 = {
			ele_type = uv0.ele_type,
			customs_id = uv0.customs_id + 1,
			limit_desc = uv0.data.limit_desc,
			limit = uv0.data.limit
		}
		slot1 = nil

		if uv0.ele_type == ElementConst.Ele_Type.Water then
			slot1 = PartnerConst.Fun_Form.ElementWater
		elseif uv0.ele_type == ElementConst.Ele_Type.Fire then
			slot1 = PartnerConst.Fun_Form.ElementFire
		elseif uv0.ele_type == ElementConst.Ele_Type.Wind then
			slot1 = PartnerConst.Fun_Form.ElementWind
		elseif uv0.ele_type == ElementConst.Ele_Type.Light then
			slot1 = PartnerConst.Fun_Form.ElementLight
		elseif uv0.ele_type == ElementConst.Ele_Type.Dark then
			slot1 = PartnerConst.Fun_Form.ElementDark
		end

		HeroController:getInstance():openFormGoFightPanel(true, slot1, slot0)
	end, true)
	registerButtonEventListener(slot0.btn_sweep, function ()
		if uv0.ele_type and uv0.data then
			uv1:checkSweepHeaven(uv0.ele_type, uv0.data.id)
		end
	end, true)
end

function ElementEctypeItem.setExtendData(slot0, slot1)
	slot0.customs_id = slot1.customs_id
	slot0.ele_type = slot1.ele_type
end

function ElementEctypeItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.index_txt:setString(slot1.id)
	slot0.atk_num:setString(slot1.power)
	slot0.desc_txt:setString(slot1.limit_desc)

	slot2 = slot1.auto_reward

	if slot1.id <= slot0.customs_id then
		slot0.sp_first:setVisible(false)
		slot0.sp_lock:setVisible(false)
		slot0.btn_challenge:setVisible(false)
		slot0.btn_sweep:setVisible(true)
		slot0.desc_txt:setVisible(false)
	elseif slot1.id == slot0.customs_id + 1 then
		slot2 = slot1.first_reward

		slot0.sp_first:setVisible(true)
		slot0.sp_lock:setVisible(false)
		slot0.btn_challenge:setVisible(true)
		slot0.btn_sweep:setVisible(false)
		slot0.desc_txt:setVisible(true)
	else
		slot2 = slot1.first_reward

		slot0.sp_first:setVisible(true)
		slot0.sp_lock:setVisible(true)
		slot0.btn_challenge:setVisible(false)
		slot0.btn_sweep:setVisible(false)
		slot0.desc_txt:setVisible(false)
	end

	slot3 = {}

	for slot7, slot8 in pairs(slot2) do
		slot11 = deepCopy(Config.ItemData.data_get_data(slot8[1]))
		slot11.quantity = slot8[2]

		table.insert(slot3, slot11)
	end

	slot0.item_scrollview:setData(slot3)
	slot0.item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
			slot5:setDefaultTip()
		end
	end)
end

function ElementEctypeItem.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
