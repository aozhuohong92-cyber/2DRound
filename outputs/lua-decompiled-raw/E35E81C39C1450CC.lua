HomePetInteractionTipsPanel = HomePetInteractionTipsPanel or BaseClass(BaseView)
slot1 = HomepetController:getInstance():getModel()
slot2 = string.format

function HomePetInteractionTipsPanel.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {}
	slot0.layout_name = "homepet/home_pet_interaction_tips_panel"
end

function HomePetInteractionTipsPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot1 = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot1:getChildByName("win_title")

	slot0.title:setString(TI18N("提 示"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.left_btn = slot0.main_container:getChildByName("left_btn")

	slot0.left_btn:getChildByName("label"):setString(TI18N("取 消"))

	slot0.right_btn = slot0.main_container:getChildByName("right_btn")

	slot0.right_btn:getChildByName("label"):setString(TI18N("确 定"))

	slot0.tips_name = createRichLabel(26, cc.c4b(100, 50, 35, 255), cc.p(0.5, 0.5), cc.p(339, 239), 6, nil, 900)

	slot0.main_container:addChild(slot0.tips_name)

	slot0.tips_cost = createRichLabel(26, cc.c4b(149, 83, 34, 255), cc.p(0.5, 0.5), cc.p(339, 194), 6, nil, 900)

	slot0.main_container:addChild(slot0.tips_cost)
end

function HomePetInteractionTipsPanel.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openHomePetInteractionTipsPanel(false)
	end, true, 2)
	registerButtonEventListener(slot0.left_btn, function ()
		uv0:openHomePetInteractionTipsPanel(false)
	end, true, 1)
	registerButtonEventListener(slot0.right_btn, function ()
		uv0:onRightBtn()
	end, true, 1)

	if slot0.homepet_vo and slot0.home_pet_vo_attt_event == nil then
		slot0.home_pet_vo_attt_event = slot0.homepet_vo:Bind(HomepetEvent.HOME_PET_VO_ATTR_EVENT, function (slot0, slot1)
			if slot0 == "vigor" then
				uv0:updateVigor()
			end
		end)
	end
end

function HomePetInteractionTipsPanel.onRightBtn(slot0, slot1)
	uv0:sender26104()
end

function HomePetInteractionTipsPanel.openRootWnd(slot0, slot1)
	slot0.homepet_vo = uv0:getHomePetVo()

	if not slot0.homepet_vo then
		return
	end

	if not Config.HomePetData.data_interaction_info[(slot1 or {}).id or 1] then
		return
	end

	if slot4.type == 1 then
		return
	end

	slot0.tips_name:setString(uv1(TI18N("准备给<div fontcolor=#d95014>%s</div>准备点零花钱吗？"), slot0.homepet_vo:getPetName()))

	if next(slot4.expend) ~= nil then
		slot6 = slot4.expend[1]

		slot0.tips_cost:setString(TI18N(string.format("零花钱：<img src=%s scale=0.3 visible=true /> %s (随机)", PathTool.getItemRes(Config.ItemData.data_get_data(slot6[1]).icon), slot6[2])))
	end
end

function HomePetInteractionTipsPanel.close_callback(slot0)
	uv0:openHomePetInteractionTipsPanel(false)
end
