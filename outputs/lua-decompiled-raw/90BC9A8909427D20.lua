PrimusMainWindow = PrimusMainWindow or BaseClass(BaseView)
slot0 = table.sort
slot1 = string.format

function PrimusMainWindow.__init(slot0)
	slot0.ctrl = PrimusController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.win_type = WinType.Full
	slot0.layout_name = "primus/primus_main_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("primus", "primus"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/primus", "primus_bigbg_1", false),
			type = ResourcesType.single
		}
	}
	slot0.station_list = {}
	slot0.tips_list = {}
	slot0.is_have_title = false
end

function PrimusMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg/primus", "primus_bigbg_1", false), LOADTEXT_TYPE)
	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")

	slot0.main_panel:setLocalZOrder(2)

	slot0.explain_btn = slot0.main_panel:getChildByName("explain_btn")
	slot0.title_bg = slot0.main_panel:getChildByName("title_bg")

	slot0.title_bg:getChildByName("title_lab"):setString(TI18N("霸气修炼"))

	slot0.exit_btn = slot0.title_bg:getChildByName("exit_btn")

	slot0.exit_btn:getChildByName("text"):setString(TI18N(" "))
	slot0.exit_btn:setPositionY(slot0.exit_btn:getPositionY() + 20)

	slot4 = "tips_panel"
	slot0.tips_panel = slot0.main_panel:getChildByName(slot4)

	slot0:adaptationScreen()

	for slot4 = 1, 6 do
		slot5 = slot0.main_panel:getChildByName("station_lay_" .. slot4)
		slot6 = {
			station_lay = slot5,
			title_img = slot5:getChildByName("title_img")
		}
		slot6.title_img_y = slot6.title_img:getPositionY()
		slot6.mode_node = slot5:getChildByName("mode_node")
		slot6.name = slot5:getChildByName("name")
		slot0.station_list[slot4] = slot6
	end

	for slot4 = 1, 3 do
		slot0.tips_list[slot4] = slot0.tips_panel:getChildByName("tips_node_" .. slot4)
	end

	slot0.tips_panel:getChildByName("title"):setString(TI18N("挑战条件:"))
	slot0:initTipsInfo()
	slot0:addEffect()
end

function PrimusMainWindow.adaptationScreen(slot0)
	slot1 = display.getTop(slot0.main_container)
	slot2 = display.getBottom(slot0.main_container)
	slot3 = display.getLeft(slot0.main_container)
	slot5 = MainuiController:getInstance():getMainUi():getBottomHeight()

	slot0.title_bg:setAnchorPoint(cc.p(0.5, 1))
	slot0.title_bg:setPosition(cc.p(360, slot1 - MainuiController:getInstance():getMainUi():getTopViewHeight() - 10))

	if slot1 <= SCREEN_HEIGHT then
		slot0.title_bg:setScale(display.getMaxScale())
	end

	slot0.explain_btn:setAnchorPoint(cc.p(0.5, 1))
	slot0.explain_btn:setPositionY(slot6)
	slot0.tips_panel:setPosition(cc.p(slot3 + 2, slot2 + slot5 + 8))
end

function PrimusMainWindow.register_event(slot0)
	registerButtonEventListener(slot0.exit_btn, handler(slot0, slot0._onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.explain_btn, function (slot0, slot1, slot2)
		TipsManager:getInstance():showCommonTips(Config.PrimusData.data_const.game_rule.desc, slot1:getTouchBeganPosition(), nil, , 500)
	end, false, 1)
end

function PrimusMainWindow._onClickBtnClose(slot0)
	slot0.ctrl:openPrimusMainWindow(false)
end

function PrimusMainWindow._onClickByPosIndex(slot0, slot1)
	if slot0.station_list and slot0.station_list[slot1] and slot0.station_list[slot1].sever_data then
		slot0.ctrl:openPrimusChallengePanel(true, slot0.station_list[slot1].sever_data, slot0.is_have_title)
	end
end

function PrimusMainWindow.addEffect(slot0)
	slot0.size = slot0.main_container:getSize()

	if slot0.scene_effect_1 == nil then
		slot0.scene_effect_1 = createEffectSpine(PathTool.getEffectRes(305), cc.p(slot0.size.width * 0.5, slot0.size.height * 0.5), cc.p(0.5, 0.5), true, PlayerAction.action)

		slot0.background:addChild(slot0.scene_effect_1, 1)
	end

	if slot0.scene_effect_2 == nil then
		slot0.scene_effect_2 = createEffectSpine(PathTool.getEffectRes(306), cc.p(slot0.size.width * 0.5, slot0.size.height * 0.5), cc.p(0.5, 0.5), true, PlayerAction.action)

		slot0.background:addChild(slot0.scene_effect_2, 1)
	end

	if slot0.scene_effect_3 == nil then
		slot0.scene_effect_3 = createEffectSpine(PathTool.getEffectRes(307), cc.p(slot0.size.width * 0.5, slot0.size.height * 0.5), cc.p(0.5, 0.5), true, PlayerAction.action)

		slot0.main_container:addChild(slot0.scene_effect_3, 1)
	end
end

function PrimusMainWindow.openRootWnd(slot0)
	slot0.ctrl:requestPrimusChallengeCount()
	slot0.ctrl:sender20701()
	slot0.model:setFirstLogin(false)
end

function PrimusMainWindow.setData(slot0, slot1)
	slot0.is_have_title = false

	uv0(slot1.list, function (slot0, slot1)
		return slot0.pos < slot1.pos
	end)

	if not slot0.station_list then
		return
	end

	for slot5, slot6 in ipairs(slot1.list) do
		if slot0.station_list[slot6.pos] then
			slot0.station_list[slot6.pos].sever_data = slot6
			slot0.station_list[slot6.pos].local_data = Config.PrimusData.data_upgrade[slot6.pos]

			slot0:updateStationInfoByPos(slot6.pos)
			registerButtonEventListener(slot0.station_list[slot5].station_lay, function ()
				uv0:_onClickByPosIndex(uv1.pos)
			end, false, 2)
		end
	end
end

function PrimusMainWindow.updateStationInfoByPos(slot0, slot1)
	if not slot0.station_list[slot1] then
		return
	end

	if not slot2.sever_data then
		return
	end

	slot4 = false

	if slot2.local_data then
		slot5 = Config.HonorData.data_title[slot2.local_data.honor_id]
		slot6 = 0

		if Config.LooksData.data_data[slot3.look_id] then
			slot6 = slot7.offset_y or 0
		end

		slot2.title_img:setPositionY(slot2.title_img_y + slot6)

		if slot5 then
			slot2.item_load = loadSpriteTextureFromCDN(slot2.title_img, PathTool.getPlistImgForDownLoad("honor", "txt_cn_honor_" .. slot5.res_id, false, false), ResourcesType.single, slot2.item_load)
		end
	end

	if slot3.name == nil or slot3.name == "" then
		slot2.name:setString(TI18N("虚位以待"))
		slot2.name:setColor(cc.c3b(255, 255, 255))
		slot0:updateSpine(slot0:getLookIdByData(slot2) or 340502, slot1)
	else
		slot2.name:setString(slot3.name)

		if RoleController:getInstance():getRoleVo() and slot3.rid == slot5.rid and slot3.srv_id == slot5.srv_id then
			slot0.is_have_title = true
			slot4 = true

			slot2.name:setColor(cc.c3b(20, 255, 50))
		else
			slot2.name:setColor(cc.c3b(255, 226, 64))
		end

		slot0:updateSpine(slot3.look_id, slot1, slot4)
	end
end

function PrimusMainWindow.getLookIdByData(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = slot1.sever_data

	if slot1.unit_data_list == nil then
		slot1.unit_data_list = {}

		for slot7, slot8 in pairs(Config.PrimusData.data_unitdata) do
			if slot2.pos == slot8.pos then
				table.insert(slot1.unit_data_list, slot8)
			end
		end

		table.sort(slot1.unit_data_list, function (slot0, slot1)
			return slot0.min < slot1.min
		end)
	end

	slot3 = slot2.num
	slot4 = nil
	slot5 = #slot1.unit_data_list

	for slot9, slot10 in ipairs(slot1.unit_data_list) do
		if slot10.min <= slot3 and slot3 <= slot10.max then
			slot4 = slot10

			break
		end

		if slot9 == slot5 then
			slot4 = slot10
		end
	end

	if slot4 == nil then
		return
	end

	return slot4.look_id
end

function PrimusMainWindow.updateSpine(slot0, slot1, slot2, slot3)
	if not slot0.station_list[slot2] then
		return
	end

	slot5 = 0

	function slot6()
		if not uv0.spine then
			if not uv1 and (uv2 == 500131 or uv2 == 500132) then
				uv2 = 500001
			end

			uv0.spine = BaseRole.new(BaseRole.type.role, uv2)

			uv0.spine:setAnimation(0, PlayerAction.show, true)
			uv0.spine:setCascade(true)
			uv0.spine:setPosition(cc.p(0, -65))
			uv0.spine:setScale(0.4)
			uv0.spine:setAnchorPoint(cc.p(0.5, 0.5))
			uv0.mode_node:addChild(uv0.spine)
			uv0.spine:setCascade(true)
			uv0.spine:setOpacity(0)
			uv0.spine:runAction(cc.FadeIn:create(0.2))
		end
	end

	if slot4.spine then
		slot4.spine:setCascade(true)
		slot4.spine:runAction(cc.Sequence:create(cc.FadeOut:create(0.2), cc.CallFunc:create(function ()
			doStopAllActions(uv0.spine)
			uv0.spine:removeFromParent()

			uv0.spine = nil

			uv1()
		end)))
	else
		slot6()
	end
end

function PrimusMainWindow.initTipsInfo(slot0)
	if not slot0.tips_list then
		return
	end

	for slot5, slot6 in ipairs({
		1,
		2,
		4
	}) do
		slot7 = Config.PrimusData.data_upgrade[slot6]

		if slot0.tips_list[slot5] and slot7 then
			slot9 = createRichLabel(22, 1, cc.p(0, 0), cc.p(0, 0), nil, , 500)

			slot9:setString(uv0(TI18N("%s:竞技场排行<div fontcolor=#14ff32>前%s名</div>"), slot7.name, slot7.arena_rank))
			slot0.tips_list[slot5]:addChild(slot9)
		end
	end
end

function PrimusMainWindow.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.station_list) do
		if slot5.spine then
			slot5.spine:DeleteMe()

			slot5.spine = nil
		end

		if slot5.item_load then
			slot5.item_load:DeleteMe()

			slot5.item_load = nil
		end
	end

	slot0.station_item = nil

	slot0.ctrl:openPrimusMainWindow(false)
end
