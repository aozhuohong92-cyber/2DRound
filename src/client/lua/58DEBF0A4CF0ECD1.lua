PokedexItem = class("PokedexItem", function ()
	return ccui.Widget:create()
end)
slot0 = PokedexController:getInstance()
slot1 = PokedexController:getInstance():getModel()

function PokedexItem.ctor(slot0, slot1)
	if slot1 == nil then
		slot0.can_bind_event = true
	else
		slot0.can_bind_event = slot1
	end

	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function PokedexItem.config(slot0)
	slot0.ctrl = PartnerController:getInstance()
	slot0.size = cc.size(194, 300)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.is_show_point = false

	slot0:retain()

	slot0.is_can_call = false
	slot0.is_have = false
	slot0.star_list = {}
end

function PokedexItem.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("pokedex/pokedex_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.label_panel = slot0.main_panel:getChildByName("label_panel")
	slot0.head_bg = slot0.main_panel:getChildByName("res_icon")

	slot0.head_bg:setCascadeOpacityEnabled(true)

	slot0.rare_type = slot0.main_panel:getChildByName("rare_type")
	slot0.hero_type = slot0.main_panel:getChildByName("hero_type")
	slot0.hero_name = slot0.label_panel:getChildByName("name")
	slot0.hero_lev = slot0.label_panel:getChildByName("need_lev")
	slot0.add_btn = slot0.main_panel:getChildByName("add_btn")
	slot0.chips_bg = slot0.main_panel:getChildByName("chips")
	slot0.dsiband_summon_btn = slot0.main_panel:getChildByName("dsiband_summon_btn")
	slot0.star_con = ccui.Widget:create()

	slot0.main_panel:addChild(slot0.star_con)
	slot0:createProgressBar()
end

function PokedexItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot0.item_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("bigbg/partnercard", "partnercard_" .. slot1.bid), ResourcesType.single, function ()
		if not tolua.isnull(uv0.head_bg) then
			loadSpriteTexture(uv0.head_bg, uv1, LOADTEXT_TYPE)
			uv0.head_bg:setScale(0.55)
			uv0.head_bg:setCascadeOpacityEnabled(true)
			uv0:showHaveIcon()

			if uv0.load_fun then
				uv0:load_fun()
			end
		end
	end, slot0.item_load)

	slot0:createStar(slot1.show_star)
	slot0.hero_name:setString(slot1.name or "")
	slot0.hero_lev:setString(slot1.limit_lev or 1)
	slot0.hero_type:loadTexture(PathTool.getResFrame("common", "common_900" .. 45 + (slot1.type or 0)), LOADTEXT_TYPE_PLIST)
	slot0.rare_type:loadTexture(PathTool.getResFrame("common", "common_9003" .. 4 - (slot1.rare_type or 3)), LOADTEXT_TYPE_PLIST)
	slot0.progress:setVisible(not slot0.is_have)
	slot0.add_btn:setVisible(not slot0.is_have)
	slot0.progress_bg:setVisible(not slot0.is_have)
	slot0.chips_bg:setVisible(not slot0.is_have)

	if slot0.is_have == false and uv0:isDisbandPartner(slot1.bid) == true then
		slot0.dsiband_summon_btn:setVisible(true)
	else
		slot0.dsiband_summon_btn:setVisible(false)
	end
end

function PokedexItem.createProgressBar(slot0)
	slot1 = slot0.main_panel:getContentSize()
	slot2, slot0.progress = createLoadingBar(PathTool.getResFrame("common", "common_90005"), PathTool.getResFrame("common", "common_90006"), cc.size(104, 24), slot0.main_panel, cc.p(0.5, 1), 93, -10, true)
	slot0.progress_bg = slot2
	slot0.progress_label = createLabel(18, Config.ColorData.data_color4[1], Config.ColorData.data_color4[9], slot2:getContentSize().width / 2, slot2:getContentSize().height / 2 + 2, "", slot2, 2, cc.p(0.5, 0.5))
end

function PokedexItem.showHaveIcon(slot0)
	slot1 = slot0.is_have or false

	setChildUnEnabled(not slot1, slot0.head_bg)

	slot2 = ""

	slot0:showCallIcon(false)

	if slot1 == false then
		if (BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot0.data.chips_id or 0) or 0) >= (slot0.data.chips_num or 0) then
			slot0:showCallIcon(true)
		end

		slot0.progress:setVisible(true)
		slot0.progress:setPercent(slot4 / slot5 * 100)
		slot0.progress_label:setString(slot4 .. "/" .. slot5)
	else
		slot0.progress:setVisible(false)
	end
end

function PokedexItem.changeHaveStatus(slot0, slot1)
	slot0.is_have = slot1 or false
end

function PokedexItem.showCallIcon(slot0, slot1)
	if not slot0.call_icon and slot1 == false then
		return
	end

	if not slot0.call_icon then
		slot0.select_bg = ccui.Layout:create()

		slot0.select_bg:setContentSize(cc.size(180, 47))
		slot0.select_bg:setAnchorPoint(cc.p(0.5, 0))
		slot0.select_bg:setPosition(cc.p(slot0.size.width / 2, 140))
		slot0.main_panel:addChild(slot0.select_bg)
		showLayoutRect(slot0.select_bg, 160)

		slot0.call_icon = createImage(slot0.main_panel, PathTool.getResFrame("pokedex", "txt_cn_pokedex_2"), slot0.size.width / 2, 145, cc.p(0.5, 0), true, 0, false)
	end

	slot0.call_icon:setVisible(slot1)
	slot0.select_bg:setVisible(slot1)

	slot0.is_can_call = slot1

	slot0.call_icon:stopAllActions()
	slot0.call_icon:setOpacity(255)

	if slot1 == true then
		breatheShineAction(slot0.call_icon, 1.5, 1.5)
	end
end

function PokedexItem.createStar(slot0, slot1)
	slot0.star_con:setContentSize(cc.size(14 * (slot1 or 0), 15))
	slot0.star_con:setPosition(cc.p(slot0.size.width / 2, 60))

	for slot6 = 1, slot1 do
		if not slot0.star_list[slot6] then
			slot8 = createImage(slot0.star_con, PathTool.getResFrame("common", "common_90013"), 0, slot2.height / 2, cc.p(0, 0.5), true, 0, false)

			slot8:setScale(1.1)

			slot0.star_list[slot6] = slot8
		end

		slot0.star_list[slot6]:setVisible(true)
		slot0.star_list[slot6]:setPosition(cc.p((slot6 - 1) * 19 - 3, slot2.height / 2))
	end
end

function PokedexItem.registerEvents(slot0)
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 == true then
				playButtonSound2()

				if uv0.is_can_call == true then
					return
				end

				if uv0.call_fun then
					uv0:call_fun(uv0.data)
				end
			end
		elseif slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		end
	end)
	slot0.add_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if not uv0.data then
				return
			end

			BackpackController:getInstance():openTipsSource(true, Config.ItemData.data_get_data(uv0.data.chips_id or 0))
		end
	end)
	slot0.dsiband_summon_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if not uv0.data then
				return
			end
		end
	end)
end

function PokedexItem.clickHandler(slot0)
	if slot0.call_fun then
		slot0:call_fun(slot0.data)
	end
end

function PokedexItem.addCallBack(slot0, slot1)
	slot0.call_fun = slot1
end

function PokedexItem.addLoadCallBack(slot0, slot1)
	slot0.load_fun = slot1
end

function PokedexItem.getIsCall(slot0)
	return slot0.is_can_call or false
end

function PokedexItem.setSelectStatus(slot0, slot1)
	slot0.select_bg:setVisible(slot1)
end

function PokedexItem.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function PokedexItem.suspendAllActions(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end
end

function PokedexItem.DeleteMe(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()
	end

	slot0.item_load = nil

	slot0:removeFromParent()
end
