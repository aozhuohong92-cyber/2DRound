StoneDungeonItem = class("StoneDungeonItem", function ()
	return ccui.Widget:create()
end)
slot0 = 0.8
slot2 = Stone_dungeonController:getInstance():getModel()
slot3 = string.format

function StoneDungeonItem.ctor(slot0)
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.item_list = {}

	slot0:configUI()
	slot0:registerEvent()
end

function StoneDungeonItem.configUI(slot0)
	slot0._rootWnd = createCSBNote(PathTool.getTargetCSB("stonedungeon/stone_dungeon_item"))

	slot0:setAnchorPoint(cc.p(0, 1))
	slot0:addChild(slot0._rootWnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(616, 125))

	slot0.container = slot0._rootWnd:getChildByName("root")
	slot0._itemScrollview = slot0.container:getChildByName("item_scrollview")

	slot0._itemScrollview:setScrollBarEnabled(false)
	slot0._itemScrollview:setSwallowTouches(false)

	slot0.diff_lev = slot0.container:getChildByName("diff_lev")
	slot0.diff_text = slot0.diff_lev:getChildByName("Text_1")
	slot0.jian = slot0.container:getChildByName("Sprite_1")

	slot0.jian:setVisible(false)

	slot0.btnClear = slot0.container:getChildByName("btnClear")
	slot0.textClear = createRichLabel(24, 1, cc.p(0.5, 0.5), cc.p(slot0.btnClear:getContentSize().width * 0.5, slot0.btnClear:getContentSize().height * 0.5), nil, nil, 500)

	slot0.btnClear:addChild(slot0.textClear)
	slot0.btnClear:setVisible(false)
	slot0.textClear:setString(TI18N("<div fontcolor=#ffffff outline=2,#020019>扫荡</div>"))

	slot0.btnChange = slot0.container:getChildByName("btnChange")
	slot0.textChange = createRichLabel(24, 1, cc.p(0.5, 0.5), cc.p(slot0.btnChange:getContentSize().width * 0.5, slot0.btnChange:getContentSize().height * 0.5), nil, nil, 500)

	slot0.btnChange:addChild(slot0.textChange)
	slot0.btnChange:setVisible(false)
	slot0.textChange:setString(TI18N("<div fontcolor=#ffffff outline=2,#020019>挑战</div>"))

	slot0.textNumber = slot0.container:getChildByName("textNumber")

	slot0.textNumber:setString("")
	UITool.SetLightColor(slot0.textNumber)
end

function StoneDungeonItem.setExtendData(slot0, slot1)
	slot0.expend = slot1.expend
	slot0.free_count = slot1.count
	slot0.title_pos = slot1.title_pos
end

function StoneDungeonItem.setData(slot0, slot1)
	slot0:setChangeData(slot1)
end

function StoneDungeonItem.setChangeData(slot0, slot1)
	slot0.dungeonData = slot1

	if slot1.title_name ~= "" then
		slot0.diff_text:setString(slot1.title_name)
	else
		slot0.diff_text:setString("")
	end

	if slot0.title_pos == slot1.difficulty then
		slot0.jian:setVisible(true)
	else
		slot0.jian:setVisible(false)
	end

	slot0.btnChange:setVisible(false)
	slot0.btnClear:setVisible(false)
	slot0.diff_text:setColor(Config.ColorData.data_color4[253 + slot1.difficulty])
	slot0.textNumber:setString(uv0(TI18N("战力%d开启"), slot1.power or 0))
	slot0.textNumber:setVisible(true)

	slot2 = 1

	setChildUnEnabled(false, slot0.btnChange)

	if uv1:getPassClearanceID(slot1.id) and slot3.status == 1 then
		if slot1.power <= slot0.role_vo.max_power then
			slot0.textNumber:setVisible(false)
			slot0.btnClear:setVisible(true)

			if slot0.free_count == 0 then
				slot0.textClear:setString(uv0(TI18N("<img src=%s visible=true scale=0.25 /><div fontcolor=#ffffff outline=2,#294A15>%s 扫荡</div>"), PathTool.getItemRes(15), slot0.expend))
			else
				slot0.textClear:setString(TI18N("<div fontcolor=#ffffff outline=2,#294A15>扫荡</div>"))
			end
		else
			slot0.btnClear:setVisible(false)
			slot0.btnChange:setVisible(true)
			slot0.textChange:setString(TI18N("<div fontcolor=#ffffff >未开启</div>"))
			setChildUnEnabled(true, slot0.btnChange)
		end

		slot2 = nil
	else
		slot0.btnClear:setVisible(false)

		if slot1.power <= slot0.role_vo.max_power then
			slot0.textNumber:setVisible(false)
			slot0.btnChange:setVisible(true)

			slot4 = false

			if slot0.role_vo.lev < slot1.lev_limit then
				slot0.textChange:setString(uv0(TI18N("<div fontcolor=#ffffff >%d级开启</div>"), slot1.lev_limit))

				slot4 = true
			elseif slot0.free_count == 0 then
				slot0.textChange:setString(uv0(TI18N("<img src=%s visible=true scale=0.25 /><div fontcolor=#ffffff outline=2,#294A15>%s 挑战</div>"), PathTool.getItemRes(15), slot0.expend))
			else
				slot0.textChange:setString(TI18N("<div fontcolor=#ffffff outline=2,#294A15>挑战</div>"))
			end

			setChildUnEnabled(slot4, slot0.btnChange)
		else
			slot0.btnChange:setVisible(true)

			slot4 = TI18N("<div fontcolor=#ffffff >未开启</div>")

			if slot0.role_vo.lev < slot1.lev_limit then
				slot4 = uv0(TI18N("<div fontcolor=#ffffff >%d级开启</div>"), slot1.lev_limit)
			end

			slot0.textChange:setString(slot4)
			setChildUnEnabled(true, slot0.btnChange)
		end
	end

	slot7 = PathTool.getResFrame("activity", slot1.pis_str)
	slot8 = LOADTEXT_TYPE_PLIST

	loadSpriteTexture(slot0.diff_lev, slot7, slot8)

	for slot7, slot8 in pairs(slot0.item_list) do
		slot8:setVisible(false)
	end

	slot0:firstAward(slot2)
	slot0:showAward(slot2)

	if slot1 and slot1.id and slot0.btnChange then
		slot0.btnChange:setName("stone_change_btn_" .. slot1.id)
	end
end

function StoneDungeonItem.firstAward(slot0, slot1)
	if not slot1 then
		return
	end

	if slot0.dungeonData.first_items[1] then
		if not slot0.item_list[1] then
			slot2 = BackPackItem.new(true, true, nil, uv0)

			slot2:setAnchorPoint(0, 0.5)
			slot0._itemScrollview:addChild(slot2)
			slot2:setFirstIcon(true)

			slot0.item_list[1] = slot2
		end

		if slot0.item_list[1] then
			slot0.item_list[1]:setVisible(true)
			slot0.item_list[1]:setPosition(cc.p(4, 47))
			slot0.item_list[1]:setBaseData(slot0.dungeonData.first_items[1][1], slot0.dungeonData.first_items[1][2])
			slot0.item_list[1]:setDefaultTip()
		end
	end
end

function StoneDungeonItem.showAward(slot0, slot1)
	slot2 = slot1 and 1 or 0

	if not slot0.dungeonData.first_items[1] then
		slot2 = 0
		slot1 = nil
	end

	slot8 = cc.size

	slot0._itemScrollview:setInnerContainerSize(slot8(math.max(slot0._itemScrollview:getContentSize().width, 135 * (#slot0.dungeonData.show_items + slot2) * uv0 + (#slot0.dungeonData.show_items + slot2) * 5), slot0._itemScrollview:getContentSize().height))

	for slot8, slot9 in ipairs(slot0.dungeonData.show_items) do
		if not slot0.item_list[1 + slot8] then
			slot10 = BackPackItem.new(true, true, nil, uv0)

			slot10:setAnchorPoint(0, 0.5)
			slot0._itemScrollview:addChild(slot10)

			slot0.item_list[1 + slot8] = slot10
		end

		if slot0.item_list[1 + slot8] then
			if slot1 then
				slot0.item_list[1 + slot8]:setPosition(cc.p(4 * (slot8 + 1) + 109 * slot8, 47))
			else
				slot0.item_list[1 + slot8]:setPosition(cc.p(4 * slot8 + 109 * (slot8 - 1), 47))
			end

			slot0.item_list[1 + slot8]:setVisible(true)
			slot0.item_list[1 + slot8]:setBaseData(slot9[1], slot9[2])
			slot0.item_list[1 + slot8]:setDefaultTip()
		end
	end
end

function StoneDungeonItem.registerEvent(slot0)
	registerButtonEventListener(slot0.btnClear, function ()
		uv0:send13032(uv1.dungeonData.id)
	end, false, 1)
	registerButtonEventListener(slot0.btnChange, function ()
		if uv0.role_vo.lev < uv0.dungeonData.lev_limit then
			message(uv1(TI18N("%d级开启"), uv0.dungeonData.lev_limit))
		else
			uv2:send13031(uv0.dungeonData.id)
		end
	end, false, 1)
end

function StoneDungeonItem.DeleteMe(slot0)
	if slot0.item_list and next(slot0.item_list or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.item_list) do
			if slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	if slot0.updata_role_event then
		GlobalEvent:getInstance():UnBind(slot0.updata_role_event)

		slot0.updata_role_event = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
