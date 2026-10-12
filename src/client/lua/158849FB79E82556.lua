RecommandHeroItem = class("RecommandHeroItem", function ()
	return ccui.Widget:create()
end)

function RecommandHeroItem.ctor(slot0)
	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function RecommandHeroItem.config(slot0)
	slot0.size = cc.size(87, 87)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.is_show_point = false
	slot0.star_list = {}
end

function RecommandHeroItem.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("stronger/recommand_hero_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.bg = slot0.main_container:getChildByName("bg")
	slot0.head_bg = slot0.main_container:getChildByName("head_bg")
	slot0.career = slot0.main_container:getChildByName("career")
	slot0.rare_type = slot0.main_container:getChildByName("rare_type")
	slot0.star_con = ccui.Widget:create()

	slot0.main_container:addChild(slot0.star_con)
end

function RecommandHeroItem.setData(slot0, slot1)
	if slot1 == nil or slot1.bid == nil then
		return
	end

	if Config.PartnerData.data_partner_base[slot1.bid] then
		slot0.is_touch = slot1.is_touch or false
		slot0.data = slot2
		slot0.data.is_die = false

		slot0:updateData(slot2)
		slot0:setGrey()
	end
end

function RecommandHeroItem.updateData(slot0, slot1)
	slot2 = slot1.bid or 0

	if slot0.head_id == nil or slot0.head_id ~= nil and slot0.head_id ~= slot2 then
		slot0.head_bg:loadTexture(PathTool.getHeadIcon(slot2), LOADTEXT_TYPE)

		slot0.head_id = slot2
	end

	slot3 = (slot1.rare_type or 1) + 1

	if slot0.quality == nil or slot0.quality ~= nil and slot0.quality ~= slot3 then
		slot0.bg:loadTexture(PathTool.getQualityBg(slot3), LOADTEXT_TYPE_PLIST)

		slot0.quality = slot3
	end

	slot0.career:loadTexture(PathTool.getCareerIcon(slot1.type), LOADTEXT_TYPE_PLIST)
	slot0:createStar(slot1.star)

	if slot0.is_touch and slot0.is_touch == true then
		slot0.is_touch = false

		slot0:clickHandler()
	end

	slot0.rare_type:loadTexture(PathTool.getResFrame("common", "common_9003" .. 4 - (slot1.rare_type or 0)), LOADTEXT_TYPE_PLIST)
	slot0.rare_type:setScale(0.8)

	if slot1.form_type == PartnerConst.Fun_Form.Adventure_Act and not slot1.p_config then
		slot1.p_config = {
			hp_per = 100,
			end_time = 0,
			id = slot1.partner_id
		}
	end
end

function RecommandHeroItem.createStar(slot0, slot1)
	slot0.star_con:setContentSize(cc.size(14 * (slot1 or 0), 15))
	slot0.star_con:setPosition(cc.p(slot0.size.width / 2, 8))

	for slot6 = 1, slot1 do
		if not slot0.star_list[slot6] then
			slot8 = createImage(slot0.star_con, PathTool.getResFrame("common", "common_90013"), 0, slot2.height / 2, cc.p(0, 0.5), true, 0, false)

			slot8:setScale(0.9)

			slot0.star_list[slot6] = slot8
		end

		slot0.star_list[slot6]:setVisible(true)
		slot0.star_list[slot6]:setPosition(cc.p((slot6 - 1) * 14 - 3, slot2.height / 2))
	end
end

function RecommandHeroItem.setGrey(slot0)
	if slot0.data then
		if HeroController:getModel():getHadHeroStarBybid(slot0.data.bid) > 0 then
			setChildUnEnabled(false, slot0)
		else
			setChildUnEnabled(true, slot0)
		end
	end
end

function RecommandHeroItem.registerEvents(slot0)
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 == true then
				playButtonSound2()

				if slot0.guide_call_back ~= nil then
					slot0:guide_call_back()
				end

				if uv0.call_fun then
					uv0:call_fun(uv0.data)
				end
			end
		elseif slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		end
	end)
end

function RecommandHeroItem.clickHandler(slot0)
	if slot0.call_fun then
		slot0:call_fun(slot0.data)
	end
end

function RecommandHeroItem.addCallBack(slot0, slot1)
	slot0.call_fun = slot1
end

function RecommandHeroItem.DeleteMe(slot0)
	if slot0.data then
		slot0.data = nil
	end

	slot0:removeFromParent()
end
