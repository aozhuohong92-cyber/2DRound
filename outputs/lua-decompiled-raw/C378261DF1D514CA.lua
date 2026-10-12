HomePetItemSellPanel = HomePetItemSellPanel or BaseClass(BaseView)
slot0 = HomepetController:getInstance()

function HomePetItemSellPanel.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {}
	slot0.layout_name = "homepet/home_pet_item_sell_panel"
	slot0.max_count = 10
	slot0.cur_count = 1
end

function HomePetItemSellPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot1 = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot1:getChildByName("win_title")

	slot0.title:setString(TI18N("珍品出售"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.cancel_btn = slot0.main_container:getChildByName("cancel_btn")

	slot0.cancel_btn:getChildByName("label"):setString(TI18N("取 消"))

	slot0.comfirm_btn = slot0.main_container:getChildByName("comfirm_btn")

	slot0.comfirm_btn:getChildByName("label"):setString(TI18N("出 售"))

	slot0.item_node = slot0.main_container:getChildByName("item_node")
	slot0.item = BackPackItem.new(true, false, nil, 0.8)

	slot0.item_node:addChild(slot0.item)

	slot2 = slot0.main_container:getChildByName("item_bg")
	slot0.btn_redu = slot2:getChildByName("btn_redu")
	slot0.btn_add = slot2:getChildByName("btn_add")
	slot0.btn_max = slot2:getChildByName("btn_max")
	slot0.item_icon = slot0.main_container:getChildByName("item_icon")
	slot0.cur_count_label = slot0.main_container:getChildByName("cur_count")
	slot0.total_count_label = slot0.main_container:getChildByName("total_count")

	slot0.main_container:getChildByName("num_key"):setString(TI18N("数量:"))
	slot0.main_container:getChildByName("total_key"):setString(TI18N("总价:"))
end

function HomePetItemSellPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:onClosedBtn()
	end, false, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:onClosedBtn()
	end, true, 2)
	registerButtonEventListener(slot0.cancel_btn, function ()
		uv0:onClosedBtn()
	end, true, 1)
	registerButtonEventListener(slot0.comfirm_btn, function ()
		uv0:onComfirmBtn()
	end, true, 1)
	registerButtonEventListener(slot0.btn_redu, function ()
		uv0:onReduBtn()
	end, true, 1)
	registerButtonEventListener(slot0.btn_add, function ()
		uv0:onAddBtn()
	end, true, 1)
	registerButtonEventListener(slot0.btn_max, function ()
		uv0:onMaxBtn()
	end, true, 1)
end

function HomePetItemSellPanel.onClosedBtn(slot0)
	uv0:openHomePetItemSellPanel(false)
end

function HomePetItemSellPanel.onMaxBtn(slot0)
	if not slot0.goods_vo then
		return
	end

	slot0.cur_count = slot0.max_count

	slot0:updateLabelNum(slot0.cur_count)
end

function HomePetItemSellPanel.onReduBtn(slot0)
	if not slot0.goods_vo then
		return
	end

	slot0.cur_count = slot0.cur_count - 1

	if slot0.cur_count < 1 then
		slot0.cur_count = 1
	end

	slot0:updateLabelNum(slot0.cur_count)
end

function HomePetItemSellPanel.onAddBtn(slot0)
	if not slot0.goods_vo then
		return
	end

	slot0.cur_count = slot0.cur_count + 1

	if slot0.max_count < slot0.cur_count then
		slot0.cur_count = slot0.max_count
	end

	slot0:updateLabelNum(slot0.cur_count)
end

function HomePetItemSellPanel.updateLabelNum(slot0, slot1)
	if slot0.max_count <= 1 then
		slot0:setTouchEnable_Redu(true)
		slot0:setTouchEnable_Add(true)
		slot0.cur_count_label:setString(1)

		if slot0.goods_vo and slot0.goods_vo.config and next(slot0.goods_vo.config.value) ~= nil then
			slot0.total_count_label:setString(slot0.goods_vo.config.value[1][2])
		end

		return
	end

	if slot1 <= 1 then
		slot0:setTouchEnable_Redu(true)
		slot0:setTouchEnable_Add(false)
	elseif slot1 == slot0.max_count then
		slot0:setTouchEnable_Redu(false)
		slot0:setTouchEnable_Add(true)
	else
		slot0:setTouchEnable_Redu(false)
		slot0:setTouchEnable_Add(false)
	end

	slot0.cur_count_label:setString(slot1)

	if slot0.goods_vo and slot0.goods_vo.config and next(slot0.goods_vo.config.value) ~= nil then
		slot0.total_count_label:setString(slot1 * slot0.goods_vo.config.value[1][2])
	end
end

function HomePetItemSellPanel.setTouchEnable_Add(slot0, slot1)
	setChildUnEnabled(slot1, slot0.btn_add)
	slot0.btn_add:setTouchEnabled(not slot1)
end

function HomePetItemSellPanel.setTouchEnable_Redu(slot0, slot1)
	setChildUnEnabled(slot1, slot0.btn_redu)
	slot0.btn_redu:setTouchEnabled(not slot1)
end

function HomePetItemSellPanel.onComfirmBtn(slot0)
	if slot0.goods_vo then
		BackpackController:getInstance():sender10522(BackPackConst.Bag_Code.PETBACKPACK, {
			{
				id = slot0.goods_vo.id,
				bid = slot0.goods_vo.base_id,
				num = slot0.cur_count
			}
		})
	end

	slot0:onClosedBtn()
end

function HomePetItemSellPanel.openRootWnd(slot0, slot1)
	slot0.goods_vo = (slot1 or {}).goods_vo

	if not slot0.goods_vo then
		return
	end

	if not slot0.goods_vo.config then
		return
	end

	slot0.max_count = slot2.max_count or 0
	slot0.cur_count = 1

	if slot0.max_count <= 0 then
		slot0.cur_count = 0
	end

	slot0.item:setData(slot0.goods_vo)
	slot0.item:setGoodsName(slot0.goods_vo.config.name, nil, 24, cc.c4b(149, 83, 34, 255))

	if next(slot0.goods_vo.config.value) ~= nil then
		loadSpriteTexture(slot0.item_icon, PathTool.getItemRes(Config.ItemData.data_get_data(slot0.goods_vo.config.value[1][1]).icon), LOADTEXT_TYPE)
	end

	slot0:updateLabelNum(slot0.cur_count)
end

function HomePetItemSellPanel.close_callback(slot0)
	if slot0.item then
		slot0.item:DeleteMe()

		slot0.item = nil
	end

	uv0:openHomePetItemSellPanel(false)
end
