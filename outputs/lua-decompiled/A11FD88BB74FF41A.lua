HalidomStepPreView = HalidomStepPreView or BaseClass(BaseView)
slot1 = HalidomController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format

function HalidomStepPreView.__init(slot0)
	slot0.is_full_screen = false
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "hero/halidom_step_preview"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("halidom", "halidom"),
			type = ResourcesType.plist
		}
	}
end

function HalidomStepPreView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("title_label"):setString(TI18N("进阶总览"))

	slot2 = slot1:getChildByName("item_list")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 0,
		item_width = 550,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 130,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_class = HalidomStepPreItem
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function HalidomStepPreView.openRootWnd(slot0, slot1)
	slot0:setData(slot1)
end

function HalidomStepPreView.setData(slot0, slot1)
	if not slot1 then
		return
	end

	if not Config.HalidomData.data_step[slot1] or not Config.HalidomData.data_base[slot1] then
		return
	end

	slot4 = uv0:getHalidomDataById(slot1)
	slot5 = {}

	for slot9, slot10 in pairs(slot2) do
		if slot10.step > 0 then
			deepCopy(slot10).halidom_name = slot3.name

			if slot4 and slot4.step then
				if slot11.step == slot4.step then
					slot11.step_status = 1
				elseif slot4.step < slot11.step then
					slot11.step_status = 2
				else
					slot11.step_status = 0
				end
			else
				slot11.step_status = 0
			end

			uv1(slot5, slot11)
		end
	end

	table.sort(slot5, function (slot0, slot1)
		return slot0.step < slot1.step
	end)
	slot0.item_scrollview:setData(slot5)
end

function HalidomStepPreView.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openHalidomStepPreView(false)
	end, false, 2)
end

function HalidomStepPreView.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	uv0:openHalidomStepPreView(false)
end

HalidomStepPreItem = class("HalidomStepPreItem", function ()
	return ccui.Widget:create()
end)

function HalidomStepPreItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()

	slot0.attr_txt_list = {}
end

function HalidomStepPreItem.configUI(slot0)
	slot0.size = cc.size(550, 130)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("hero/halidom_step_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot2
	slot0.cur_bg = slot2:getChildByName("cur_bg")
	slot0.dis_bg = slot2:getChildByName("dis_bg")
	slot0.name_label = slot2:getChildByName("name_label")
	slot0.sp_cur = slot2:getChildByName("sp_cur")
end

function HalidomStepPreItem.register_event(slot0)
end

function HalidomStepPreItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.name_label:setString(uv0(TI18N("%s%d阶"), slot1.halidom_name, slot1.step))

	slot2 = "ffffff"

	if slot1.step_status == 0 then
		slot0.cur_bg:setVisible(false)
		slot0.dis_bg:setVisible(true)
		slot0.sp_cur:setVisible(false)

		slot2 = "ffffff"
	elseif slot1.step_status == 1 then
		slot0.cur_bg:setVisible(true)
		slot0.dis_bg:setVisible(false)
		slot0.sp_cur:setVisible(true)

		slot2 = "68c74b"
	else
		slot0.cur_bg:setVisible(false)
		slot0.dis_bg:setVisible(true)
		slot0.sp_cur:setVisible(false)

		slot2 = "94CDF3"
	end

	for slot7, slot8 in ipairs(slot1.dynamic_attr) do
		uv1({}, slot8)
	end

	for slot7, slot8 in ipairs(slot1.fixed_attr) do
		uv1(slot3, slot8)
	end

	for slot7, slot8 in pairs(slot0.attr_txt_list) do
		slot8:setVisible(false)
	end

	for slot7, slot8 in ipairs(slot3) do
		slot10 = slot8[2] or 0

		if Config.AttrData.data_key_to_name[slot8[1]] then
			if slot0.attr_txt_list[slot7] == nil then
				slot12 = createRichLabel(22, 1, cc.p(0, 0.5), cc.p(20, 28), nil, nil, 380)

				slot0.container:addChild(slot12)

				slot0.attr_txt_list[slot7] = slot12
			end

			slot13 = 295

			if slot7 % 2 == 1 then
				slot13 = 20
			end

			slot14 = 58

			if slot7 > 2 then
				slot14 = 22
			end

			slot12:setPosition(cc.p(slot13, slot14))
			slot12:setVisible(true)

			slot15 = PathTool.getAttrIconByStr(slot9)

			if PartnerCalculate.isShowPerByStr(slot9) == true then
				slot10 = slot10 / 10 .. "%"
			end

			slot12:setString(uv0("<img src='%s' scale=1 /> <div fontcolor=#%s>  信念%s属性+</div><div fontcolor=#%s>%s</div>", PathTool.getResFrame("common", slot15), slot2, slot11, slot2, tostring(slot10)))
		end
	end
end

function HalidomStepPreItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
