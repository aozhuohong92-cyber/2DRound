PlanesHireHeroItem = class("PlanesHireHeroItem", function ()
	return ccui.Widget:create()
end)

function PlanesHireHeroItem.ctor(slot0)
	slot0:configUI()
	slot0:registerEvent()
end

function PlanesHireHeroItem.configUI(slot0)
	slot0.size = cc.size(597, 141)

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("planes/planes_hire_hero_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot2
	slot0.chose_btn = slot2:getChildByName("chose_btn")

	slot0.chose_btn:setSelected(false)

	slot0.name_txt = slot2:getChildByName("name_txt")
	slot0.atk_txt = slot2:getChildByName("atk_txt")
	slot0.check_btn = slot2:getChildByName("check_btn")
end

function PlanesHireHeroItem.registerEvent(slot0)
	slot0.chose_btn:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			if uv0.callback then
				uv0:callback(true)
			end
		elseif slot1 == ccui.CheckBoxEventType.unselected and uv0.callback then
			uv0:callback(false)
		end
	end)
	registerButtonEventListener(slot0.check_btn, handler(slot0, slot0.onClickCheckBtn), true)
end

function PlanesHireHeroItem.onClickCheckBtn(slot0)
	if slot0.data then
		HeroController:getInstance():openHeroTipsPanel(true, slot0.data)
	end
end

function PlanesHireHeroItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	if not Config.PartnerData.data_partner_base[slot1.bid] then
		return
	end

	slot0.data = slot1

	if not slot0.hero_item then
		slot0.hero_item = HeroExhibitionItem.new(0.9)

		slot0.hero_item:setPosition(160, 70)
		slot0.container:addChild(slot0.hero_item)
	end

	slot0.hero_item:setData(slot1)
	slot0.name_txt:setString(slot2.name)
	slot0.atk_txt:setString(slot1.power or 0)
end

function PlanesHireHeroItem.setIsSelect(slot0, slot1)
	slot0.chose_btn:setSelected(slot1)
end

function PlanesHireHeroItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function PlanesHireHeroItem.getHireHeropos(slot0)
	if slot0.data then
		return slot0.data.pos
	end
end

function PlanesHireHeroItem.DeleteMe(slot0)
	if slot0.hero_item then
		slot0.hero_item:DeleteMe()

		slot0.hero_item = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
