PrimusChallengeResultWindow = PrimusChallengeResultWindow or BaseClass(BaseView)
slot0 = PrimusController:getInstance()

function PrimusChallengeResultWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Tips
	slot0.layout_name = "primus/primus_challenge_result_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("levupgrade", "levupgrade"),
			type = ResourcesType.plist
		}
	}
end

function PrimusChallengeResultWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.title_container = slot0.main_container:getChildByName("title_container")
	slot0.title_width = slot0.title_container:getContentSize().width
	slot0.title_height = slot0.title_container:getContentSize().height
	slot0.title_img = slot0.main_container:getChildByName("title_img")
	slot0.harm_btn = slot0.main_container:getChildByName("harm_btn")

	slot0.harm_btn:setVisible(false)
	slot0.harm_btn:getChildByName("harm_lab"):setString(TI18N("数据统计"))

	slot0.list_view = slot0.root_wnd:getChildByName("list_view")
	slot0.scroll_view = CommonScrollViewLayout.new(slot0.list_view, nil, , , slot0.list_view:getContentSize(), {
		start_y = 8,
		item_width = 720,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 43,
		space_y = 12,
		col = 1,
		need_dynamic = true,
		item_class = PrimusChallengeResultItem
	})
	slot0.item = slot0.root_wnd:getChildByName("item")
	slot0.goto_btn = slot0.main_container:getChildByName("goto_btn")

	slot0.goto_btn:getChildByName("label"):setString(TI18N("前往装备称号"))

	slot0.comfirm_btn = slot0.main_container:getChildByName("comfirm_btn")

	slot0.comfirm_btn:getChildByName("label"):setString(TI18N("确 定"))
end

function PrimusChallengeResultWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		playCloseSound()

		if slot1 == ccui.TouchEventType.ended then
			uv0:openPrimusChallengeResultWindow(false)
		end
	end)
	registerButtonEventListener(slot0.goto_btn, handler(slot0, slot0._onGoToEquipTitle), false, 2)
	registerButtonEventListener(slot0.comfirm_btn, function ()
		uv0:openPrimusChallengeResultWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.harm_btn, handler(slot0, slot0._onClickHarmBtn), true)
end

function PrimusChallengeResultWindow._onClickHarmBtn(slot0)
	if slot0.data and next(slot0.data) ~= nil then
		BattleController:getInstance():openBattleHarmInfoView(true, slot0.data)
	end
end

function PrimusChallengeResultWindow._onGoToEquipTitle(slot0)
	uv0:openPrimusChallengeResultWindow(false)
	RoleController:getInstance():openRoleDecorateView(true, 4)
end

function PrimusChallengeResultWindow.openRootWnd(slot0, slot1)
	playOtherSound("c_get")
	slot0:handleEffect(true)

	if slot1 then
		slot0.data = slot1

		slot0.harm_btn:setVisible(true)
	end

	slot0.local_data = Config.PrimusData.data_upgrade[slot1.pos]

	if slot0.local_data then
		slot2 = Config.HonorData.data_title[slot0.local_data.honor_id]

		slot0.scroll_view:setData(slot2.attr, nil, , slot0.item)

		if slot2 and slot0.title_img then
			slot0.item_load = loadSpriteTextureFromCDN(slot0.title_img, PathTool.getTargetRes("honor", "txt_cn_honor_" .. slot2.res_id, false, false), ResourcesType.single, slot0.item_load)
		end
	end
end

function PrimusChallengeResultWindow.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0.title_container) and slot0.play_effect == nil then
		slot0.play_effect = createEffectSpine(PathTool.getEffectRes(274), cc.p(slot0.title_width * 0.5, slot0.title_height * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action_3)

		slot0.title_container:addChild(slot0.play_effect, 1)
	end
end

function PrimusChallengeResultWindow.close_callback(slot0)
	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()
	end

	slot0.scroll_view = nil

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	uv0:openPrimusChallengeResultWindow(false)
end

PrimusChallengeResultItem = class("PrimusChallengeResultItem", function ()
	return ccui.Layout:create()
end)

function PrimusChallengeResultItem.ctor(slot0)
	slot0.is_completed = false
end

function PrimusChallengeResultItem.setExtendData(slot0, slot1)
	if not tolua.isnull(slot1) and slot0.root_wnd == nil then
		slot0.is_completed = true
		slot2 = slot1:getContentSize()

		slot0:setAnchorPoint(cc.p(0.5, 0.5))
		slot0:setContentSize(slot2)

		slot0.root_wnd = slot1:clone()

		slot0.root_wnd:setVisible(true)
		slot0.root_wnd:setAnchorPoint(0.5, 0.5)
		slot0.root_wnd:setPosition(slot2.width * 0.5, slot2.height * 0.5)
		slot0.root_wnd:setCascadeOpacityEnabled(true)
		slot0:addChild(slot0.root_wnd)

		slot0.init_pos_y = slot0.root_wnd:getPositionY()
		slot0.item_name = slot0.root_wnd:getChildByName("item_name")
		slot0.item_num = slot0.root_wnd:getChildByName("item_num")

		slot0:playEnterActions()
	end
end

function PrimusChallengeResultItem.playEnterActions(slot0)
	slot0.root_wnd:setPositionX(200)
	slot0.root_wnd:setOpacity(0)
	slot0.root_wnd:runAction(cc.Sequence:create(cc.Spawn:create(cc.MoveTo:create(0.2, cc.p(460, slot0.init_pos_y)), cc.FadeIn:create(0.2)), cc.MoveTo:create(0.1, cc.p(360, slot0.init_pos_y))))
end

function PrimusChallengeResultItem.setData(slot0, slot1)
	slot0.data = slot1

	if slot1 then
		slot0.item_name:setString(Config.AttrData.data_key_to_name[slot1[1]])

		if PartnerCalculate.isShowPerByStr(slot1[1]) then
			slot0.item_num:setString(slot1[2] / 10 .. "%")
		else
			slot0.item_num:setString(slot1[2])
		end
	end
end

function PrimusChallengeResultItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
