CheckDescPanel = class("CheckDescPanel", function ()
	return ccui.Layout:create()
end)

function CheckDescPanel.ctor(slot0, slot1)
	slot0.data = slot1
	slot0.empty_res = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3")
	slot0.size = cc.size(645, 420)

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0:setPosition(cc.p(slot0.size.width / 2, slot0.size.height / 2))
	slot0:createDescPanel()
	slot0:registerEvent()
end

function CheckDescPanel.createDescPanel(slot0)
	slot1 = cc.size(623, 426)
	slot0.main_panel = ccui.Widget:create()

	slot0.main_panel:setContentSize(slot1)
	slot0:addChild(slot0.main_panel)
	slot0.main_panel:setPosition(cc.p(slot0.size.width / 2, 220))
	createImage(slot0.main_panel, PathTool.getResFrame("common", "common_90024"), slot1.width / 2, slot1.height / 2, cc.p(0.5, 0.5), true, 0, true):setContentSize(slot1)
	createImage(slot0.main_panel, PathTool.getResFrame("common", "common_90025"), slot1.width / 2, 378, cc.p(0.5, 0), true, 0, true):setContentSize(cc.size(617, 44))

	slot7 = createImage(slot0.main_panel, PathTool.getResFrame("pokedex", "pokedex_5"), 15, 380, cc.p(0, 0), true, 1, false)

	createLabel(26, Config.ColorData.data_color4[175], nil, 75, 386, "", slot0.main_panel, 0, cc.p(0, 0)):setString(TI18N("英雄传记"))

	slot0.desc_scorll = createScrollView(620, 340, 0, 20, slot0.main_panel, ccui.ScrollViewDir.vertical)
	slot0.desc_label = createRichLabel(24, Config.ColorData.data_color4[175], cc.p(0, 1), cc.p(20, 350), 10, 0, 580)

	slot0.desc_scorll:addChild(slot0.desc_label)

	slot9 = false

	if not Config.PartnerData.data_pokedex[slot0.data.bid] then
		return
	end

	slot12 = ""

	if (slot10.lock or {})[1] then
		if type(slot11[1]) == "number" and slot11[1] == 1 then
			slot9 = not (PokedexController:getInstance():getModel():isHavePartner(slot0.data.bid) or false)
			slot12 = TI18N("获得英雄解锁该英雄传记")
		elseif type(slot11[1]) == "table" then
			if (slot11[1][1] or 0) == 2 then
				slot12 = TI18N("该英雄星数达到") .. (slot11[1][2] or 0) .. TI18N("星解锁传记")
				slot9 = true

				if slot13 == true then
					-- Nothing
				end
			elseif slot14 == 3 then
				slot12 = TI18N("该英雄突破+") .. slot15 .. TI18N("解锁传记")
				slot9 = true

				if slot13 == true then
					-- Nothing
				end
			end
		end

		slot0:showEmptyIcon(slot9, slot12)
	end

	if slot9 == true then
		slot0.desc_label:setString("")

		return
	end

	if slot10 then
		slot0.desc_label:setString(slot10.desc or "")
		slot0.desc_scorll:setInnerContainerSize(cc.size(slot0.desc_scorll:getContentSize().width, math.max(slot0.desc_label:getSize().height, slot0.desc_scorll:getContentSize().height)))
		slot0.desc_label:setPositionY(slot0.desc_scorll:getContentSize().height)
	end
end

function CheckDescPanel.showEmptyIcon(slot0, slot1, slot2)
	if not slot0.empty_con and slot1 == false then
		return
	end

	if not slot0.empty_con then
		slot3 = cc.size(200, 200)
		slot0.empty_con = ccui.Widget:create()

		slot0.empty_con:setContentSize(slot3)
		slot0.empty_con:setPosition(cc.p(310, 220))
		slot0.main_panel:addChild(slot0.empty_con, 100)

		slot4 = createImage(slot0.empty_con, slot0.empty_res, slot3.width / 2, slot3.height / 2, cc.p(0.5, 0.5), false)
		slot0.empty_label = createLabel(24, Config.ColorData.data_color4[175], nil, slot3.width / 2, -10, "", slot0.empty_con, 0, cc.p(0.5, 0))
	end

	slot0.empty_label:setString(slot2 or "")
	slot0.empty_con:setVisible(slot1)
end

function CheckDescPanel.registerEvent(slot0)
end

function CheckDescPanel.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
