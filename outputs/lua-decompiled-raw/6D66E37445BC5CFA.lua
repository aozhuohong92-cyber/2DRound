SourceItem = class("SourceItem", function ()
	return ccui.Widget:create()
end)
slot0 = BackpackController:getInstance()
slot1 = BackpackController:getInstance():getModel()
SourceItem.WIDTH = 554
SourceItem.HEIGHT = 115

function SourceItem.ctor(slot0, slot1, slot2)
	slot0.bid = slot1
	slot0.need_item_list = slot2

	slot0:configUI()
	slot0:registerEvent()
end

function SourceItem.configUI(slot0, ...)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("tips/source_item"))

	slot0:setAnchorPoint(cc.p(0, 1))
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(slot0.WIDTH, slot0.HEIGHT))

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.desc = slot0.main_container:getChildByName("desc")
	slot0.goto_btn = slot0.main_container:getChildByName("goto_btn")

	slot0.goto_btn:setTitleText(TI18N("前往"))

	slot0.unlock_label = slot0.main_container:getChildByName("unlock_label")

	slot0.unlock_label:setString(TI18N("未开启"))

	slot0.goto_btn.label = slot0.goto_btn:getTitleRenderer()

	if slot0.goto_btn.label ~= nil then
		slot0.goto_btn.label:enableOutline(cc.c4b(41, 74, 21, 255), 2)
	end

	slot0.tag = slot0.main_container:getChildByName("tag")
	slot0.label = slot0.tag:getChildByName("label")

	slot0.label:setString(TI18N("推荐"))
	slot0.tag:setVisible(false)
end

function SourceItem.setCloseCallBack(slot0, slot1)
	slot0.closeCallBack = slot1
end

function SourceItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1.infon_data

	slot0.goto_btn:setTag(2000 + (slot0.data.id or 0))
	slot0.desc:setString(slot0.data.name)

	if slot1[2] then
		if slot1[2] == 0 then
			slot0.tag:setVisible(false)
		else
			slot0.tag:setVisible(true)
		end
	end

	if slot1.is_lock == TRUE then
		slot0.goto_btn:setVisible(false)
		slot0.unlock_label:setVisible(true)
		slot0.unlock_label:setString(slot1.str)
	else
		if slot0.data.evt_type == "" then
			slot0.goto_btn:setVisible(false)
		else
			slot0.goto_btn:setVisible(true)
		end

		slot0.unlock_label:setVisible(false)
	end
end

function SourceItem.registerEvent(slot0)
	if slot0.goto_btn then
		slot0.goto_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:clickBtn()

				if uv0.closeCallBack then
					uv0.closeCallBack()
				else
					uv1:openTipsSource(false)
				end

				TipsManager:getInstance():hideTips()
			end
		end)
	end
end

function SourceItem.clickBtn(slot0)
	uv0:gotoItemSources(slot0.data.evt_type, slot0.data.extend, slot0.bid, slot0.need_item_list)
	GlobalEvent:getInstance():Fire(TipsEvent.TipsGoToEvent)
end

function SourceItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
