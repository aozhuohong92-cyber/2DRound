StrongerSecItem = class("StrongerSecItem", function ()
	return ccui.Widget:create()
end)

function StrongerSecItem.ctor(slot0)
	slot0.ctrl = StrongerController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.role_vo = RoleController:getInstance():getRoleVo()

	slot0:configUI()
	slot0:register_event()
end

function StrongerSecItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("stronger/stronger_sec_item"))

	slot0:setAnchorPoint(cc.p(0, 1))
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(585, 118))

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0.main_container:setTouchEnabled(true)
	slot0.main_container:setSwallowTouches(false)

	slot0.name = slot0.main_container:getChildByName("name")

	UITool.SetTitleColor(slot0.name)

	slot0.title = slot0.main_container:getChildByName("title")

	slot0.title:setString(TI18N("当前评分/本服最高："))
	slot0.title:setTextColor(cc.c4b(71, 44, 30, 255))

	slot0.btn = slot0.main_container:getChildByName("btn")

	slot0.btn:setTitleText(TI18N("前往"))

	slot0.btn.label = slot0.btn:getTitleRenderer()

	if slot0.btn.label ~= nil then
		slot0.btn.label:enableOutline(cc.c4b(2, 0, 25, 255), 2)
	end

	slot0.bar_bg = slot0.main_container:getChildByName("bar_bg")
	slot0.loadingbar = slot0.main_container:getChildByName("loadingbar")

	slot0.loadingbar:setScale9Enabled(true)

	slot0.light = slot0.loadingbar:getChildByName("light")
	slot0.bar_exp = slot0.main_container:getChildByName("bar_exp")
	slot0.need = createRichLabel(20, 175, cc.p(0, 0.5), cc.p(480, 29))

	slot0.main_container:addChild(slot0.need)

	slot0.tag = slot0.main_container:getChildByName("tag")
	slot0.tag_label = slot0.main_container:getChildByName("tag_label")

	slot0.tag:setVisible(false)
	slot0.tag_label:setVisible(false)

	slot0.goods_icon = slot0.main_container:getChildByName("goods_icon")
end

function StrongerSecItem.register_event(slot0)
	slot0.btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data.evt_type then
				uv0.ctrl:clickCallBack(uv0.data.evt_type)
			end
		end
	end)
end

function StrongerSecItem.setData(slot0, slot1)
	slot0.data = slot1

	slot0.name:setString(slot1.name)

	if slot1.icon then
		loadSpriteTexture(slot0.goods_icon, PathTool.getItemRes(slot1.icon), LOADTEXT_TYPE)
	end
end

function StrongerSecItem.updateData(slot0, slot1, slot2)
	if slot1 == nil or slot2 == nil then
		return
	end

	slot3 = 0

	if slot2 == 0 then
		slot2 = slot1
	end

	if slot2 ~= 0 and slot1 ~= 0 then
		slot3 = slot1 / slot2 * 100
	end

	slot0.bar_exp:setString(slot1 .. "/" .. slot2)
	slot0.loadingbar:setPercent(slot3)

	if slot3 == 0 or slot3 == 100 then
		slot0.light:setVisible(false)
	else
		slot0.light:setVisible(true)
		slot0.light:setPositionX(slot0.loadingbar:getContentSize().width * slot3 / 100)
	end

	slot0.tag:setVisible(false)
	slot0.tag_label:setVisible(false)

	if slot2 ~= 0 then
		slot4, slot5 = slot0:getTagAndDesc(slot3)

		slot0.need:setString(slot5)

		if slot4 == 1 then
			slot0.tag:setVisible(true)
			slot0.tag_label:setVisible(true)
			slot0.tag_label:setString(TI18N("急需"))
			slot0.tag_label:enableOutline(Config.ColorData.data_color4[201], 1)
		elseif slot4 == 2 then
			slot0.tag:setVisible(true)
			slot0.tag_label:setVisible(true)
			slot0.tag_label:setString(TI18N("推荐"))
			slot0.tag_label:enableOutline(Config.ColorData.data_color4[200], 1)
		else
			slot0.tag:setVisible(false)
			slot0.tag_label:setVisible(false)
			slot0.tag_label:disableEffect(cc.LabelEffect.OUTLINE)
		end
	end
end

function StrongerSecItem.getTagAndDesc(slot0, slot1)
	for slot5, slot6 in pairs(Config.StrongerData.data_catalg_score) do
		if slot6.type == 3 then
			if slot6.bigger ~= 0 then
				if slot6.min ~= 0 then
					if slot6.bigger <= slot1 and slot1 < slot6.min then
						return slot6.tag, slot6.desc
					end
				elseif slot6.less ~= 0 then
					if slot1 <= slot6.less and slot6.bigger <= slot1 then
						return slot6.tag, slot6.desc
					end
				elseif slot6.bigger <= slot1 then
					return slot6.tag, slot6.desc
				end
			elseif slot6.max ~= 0 then
				if slot6.min ~= 0 then
					if slot6.max < slot1 and slot1 < slot6.min then
						return slot6.tag, slot6.desc
					end
				elseif slot6.less ~= 0 then
					if slot1 <= slot6.less and slot6.max < slot1 then
						return slot6.tag, slot6.desc
					end
				elseif slot6.max < slot1 then
					return slot6.tag, slot6.desc
				end
			elseif slot6.min ~= 0 then
				if slot1 < slot6.min then
					return slot6.tag, slot6.desc
				end
			elseif slot6.less ~= 0 and slot1 <= slot6.less then
				return slot6.tag, slot6.desc
			end
		end
	end

	return 0, ""
end

function StrongerSecItem.hideBg(slot0)
	slot0.bar_bg:setVisible(false)
	slot0.loadingbar:setVisible(false)
	slot0.need:setVisible(false)
	slot0.bar_exp:setVisible(false)
	slot0.btn:setPosition(cc.p(503, 60))
	slot0.title:setPositionY(35)
	slot0.title:setString(slot0.data.desc)
end

function StrongerSecItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
