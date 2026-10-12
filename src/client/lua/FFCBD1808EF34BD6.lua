slot1 = HeavenController:getInstance():getModel()
slot2 = table.sort
slot3 = string.format
HeavenMainChapter = class("HeavenMainChapter", function ()
	return ccui.Widget:create()
end)

function HeavenMainChapter.ctor(slot0)
	slot0.chapter_list = {}
	slot0.line_list = {}

	slot0:configUI()
	slot0:register_event()
end

function HeavenMainChapter.configUI(slot0)
	slot0.size = cc.size(720, 840)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.container = ccui.Layout:create()

	slot0.container:setTouchEnabled(true)
	slot0.container:setContentSize(slot0.size)
	slot0.container:setAnchorPoint(0, 0)
	slot0:addChild(slot0.container)
end

function HeavenMainChapter.setExtendData(slot0, slot1)
	slot0.last_chapter_id = slot1 or 1
end

function HeavenMainChapter.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = slot1.chapter_datas or {}
	slot0.c_type = 1

	if (slot1.index or 1) % 2 == 0 then
		slot0.c_type = 2
	end

	for slot7, slot8 in pairs(slot0.line_list) do
		slot8:setVisible(false)
	end

	slot4 = true

	for slot8, slot9 in pairs(slot0.chapter_list) do
		slot4 = false

		slot9:setVisible(false)
	end

	for slot8, slot9 in ipairs(slot2) do
		if slot4 then
			delayRun(slot0.container, slot8 * 2 / display.DEFAULT_FPS, function ()
				uv0:createChapterItem(uv1, uv2)
			end)
		else
			slot0:createChapterItem(slot8, slot9)
		end
	end
end

function HeavenMainChapter.createChapterLine(slot0, slot1)
	slot2 = HeavenConst.Chapter_Line_Info_1

	if slot0.c_type ~= 1 then
		slot2 = HeavenConst.Chapter_Line_Info_2
	end

	if slot2[slot1] then
		slot4 = slot3[1]
		slot5 = slot3[2]
		slot6 = slot3[3]

		if not slot0.line_list[slot1] then
			slot0.line_list[slot1] = createImage(slot0.container, PathTool.getResFrame("heaven", "heaven_1001"), slot4.x, slot4.y, cc.p(0.5, 0.5), true, 1, true)
		end

		slot7:setPosition(slot4)
		slot7:setContentSize(cc.size(slot5, 9))
		slot7:setRotation(slot6)
		slot7:setVisible(true)
	end
end

function HeavenMainChapter.createChapterItem(slot0, slot1, slot2)
	if not slot0.chapter_list[slot1] then
		slot3 = HeavenChapterItem.new()

		slot0.container:addChild(slot3, 2)

		slot0.chapter_list[slot1] = slot3
	end

	slot3:setVisible(true)
	slot3:setData(slot2, slot1, slot0.c_type)

	if slot0.last_chapter_id and slot0.last_chapter_id ~= slot2.id then
		slot0:createChapterLine(slot1)
	end
end

function HeavenMainChapter.register_event(slot0)
end

function HeavenMainChapter.DeleteMe(slot0)
	for slot4, slot5 in pairs(slot0.chapter_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end

HeavenChapterItem = class("HeavenChapterItem", function ()
	return ccui.Widget:create()
end)

function HeavenChapterItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function HeavenChapterItem.configUI(slot0)
	slot0.size = cc.size(200, 200)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.container = ccui.Layout:create()

	slot0.container:setTouchEnabled(true)
	slot0.container:setContentSize(slot0.size)
	slot0.container:setAnchorPoint(0.5, 0.5)
	slot0.container:setPosition(cc.p(slot0.size.width / 2, slot0.size.height / 2))
	slot0:addChild(slot0.container)
end

function HeavenChapterItem.register_event(slot0)
	registerButtonEventListener(slot0.container, function ()
		uv0:onClickChapterItem()
	end, true)
end

function HeavenChapterItem.onClickChapterItem(slot0)
	if not slot0.is_open then
		message(slot0.close_msg or "")

		return
	end

	if slot0.config_data then
		uv0:openHeavenChapterWindow(true, slot0.config_data.id)
	end
end

function HeavenChapterItem.onClickAwardItem(slot0)
	if slot0.config_data then
		uv0:openHeavenStarAwardWindow(true, slot0.config_data.id)
	end
end

function HeavenChapterItem.setData(slot0, slot1, slot2, slot3)
	if not slot1 then
		return
	end

	slot0.index = slot2 or 1
	slot0.c_type = slot3 or 1

	if slot0.chapter_vo ~= nil and slot0.update_self_event ~= nil then
		slot0.chapter_vo:UnBind(slot0.update_self_event)

		slot0.update_self_event = nil
	end

	slot0.config_data = slot1
	slot0.chapter_vo = uv0:getChapterDataById(slot1.id)

	if slot0.chapter_vo and slot0.update_self_event == nil then
		slot0.update_self_event = slot0.chapter_vo:Bind(HeavenEvent.Update_Chapter_Vo_Event, function ()
			uv0:updateChapterItem()
		end)
	end

	slot0:updateChapterItem()
end

function HeavenChapterItem.updateChapterItem(slot0)
	if not slot0.config_data then
		return
	end

	slot1 = nil

	if (slot0.c_type ~= 1 or HeavenConst.Chapter_Pos_1[slot0.index]) and HeavenConst.Chapter_Pos_2[slot0.index] then
		slot0:setPosition(slot1)
	end

	if not slot0.chapter_icon then
		slot0.chapter_icon = createImage(slot0.container, nil, slot0.size.width / 2, slot0.size.height / 2, cc.p(0.5, 0.5), false)
	end

	if not slot0.award_icon then
		slot0.award_icon = createImage(slot0.container, PathTool.getResFrame("heaven", "heaven_1003"), slot0.size.width - 24, slot0.size.height - 24, cc.p(0.5, 0.5), true)

		slot0.award_icon:setTouchEnabled(true)
		registerButtonEventListener(slot0.award_icon, function ()
			uv0:onClickAwardItem()
		end, true)
	end

	if not slot0.title_bg then
		slot0.title_bg = createImage(slot0.container, PathTool.getResFrame("heaven", "heaven_1004"), slot0.size.width / 2, 27, cc.p(0.5, 0.5), true, nil, true)

		slot0.title_bg:setCapInsets(cc.rect(22, 17, 1, 1))
		slot0.title_bg:setContentSize(cc.size(156, 34))
	end

	if not slot0.title_txt then
		slot0.title_txt = createLabel(26, cc.c3b(255, 242, 199), cc.c3b(55, 16, 0), slot0.size.width / 2, 27, "", slot0.container, 2, cc.p(0.5, 0.5))
	end

	if slot0.chapter_vo and slot0.chapter_vo.is_finish == HeavenConst.Chapter_Pass_Status.FullPass then
		slot0:showPassIcon(true)
	else
		slot0:showPassIcon(false)
	end

	slot0.bg_load = loadImageTextureFromCDN(slot0.chapter_icon, PathTool.getPlistImgForDownLoad("bigbg/heaven", string.format("heaven_chapter_%d", slot0.config_data.ico or 1)), ResourcesType.single, slot0.bg_load, nil, function ()
		uv0.size = uv0.chapter_icon:getContentSize()

		uv0:setContentSize(uv0.size)
		uv0.container:setContentSize(uv0.size)
		uv0:adjustNodePos()
	end)

	slot0.title_txt:setString(slot0.config_data.type)

	slot0.is_open, slot0.close_msg = uv0:checkHeavenChapterIsOpen(slot0.config_data.id)

	if slot0.is_open then
		setChildUnEnabled(false, slot0.container)
		slot0.award_icon:setVisible(true)
		slot0.title_txt:setVisible(true)
		slot0.title_bg:setVisible(true)
	else
		setChildUnEnabled(true, slot0.container)
		slot0.award_icon:setVisible(false)
		slot0.title_txt:setVisible(false)
		slot0.title_bg:setVisible(false)
		slot0:showPassIcon(false)
	end

	if slot0.award_icon then
		slot4 = false

		if slot0.chapter_vo then
			slot4 = slot0.chapter_vo:getRedStatus()
		end

		addRedPointToNodeByStatus(slot0.award_icon, slot4, 5, 5)
	end
end

function HeavenChapterItem.adjustNodePos(slot0)
	slot0.container:setPosition(cc.p(slot0.size.width / 2, slot0.size.height / 2))
	slot0.chapter_icon:setPosition(cc.p(slot0.size.width / 2, slot0.size.height / 2))
	slot0.title_bg:setPosition(cc.p(slot0.size.width / 2, 27))
	slot0.title_txt:setPosition(cc.p(slot0.size.width / 2, 27))
	slot0.award_icon:setPosition(cc.p(slot0.size.width - 24, slot0.size.height - 24))

	if slot0.pass_icon then
		slot0.pass_icon:setPosition(cc.p(32, slot0.size.height - 30))
	end
end

function HeavenChapterItem.showPassIcon(slot0, slot1)
	if slot1 == true then
		if not slot0.pass_icon then
			slot0.pass_icon = createImage(slot0.container, PathTool.getResFrame("heaven", "txt_cn_heaven_pass"), 25, slot0.size.height - 60, cc.p(0.5, 0.5), true, 2)
		end

		slot0.pass_icon:setVisible(true)
	elseif slot0.pass_icon then
		slot0.pass_icon:setVisible(false)
	end
end

function HeavenChapterItem.DeleteMe(slot0)
	if slot0.bg_load then
		slot0.bg_load:DeleteMe()

		slot0.bg_load = nil
	end

	if slot0.chapter_vo ~= nil and slot0.update_self_event ~= nil then
		slot0.chapter_vo:UnBind(slot0.update_self_event)

		slot0.update_self_event = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
