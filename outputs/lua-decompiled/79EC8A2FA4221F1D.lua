BattlePkResultView = BattlePkResultView or BaseClass(BaseView)

function BattlePkResultView.__init(slot0, slot1, slot2)
	slot0.result = slot1
	slot0.x = 100
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.is_running = true
	slot0.partner_list = {}
	slot0.item_list = {}
	slot0.is_stop = false
	slot0.is_open_box = false
	slot0.win_type = WinType.Tips
	slot0.fight_type = slot2
	slot0.layout_name = "battle/battle_pk_result_view"
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.effect_list = {}
	slot0.is_full_screen = false
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("battle", "battle"),
			type = ResourcesType.plist
		}
	}
	slot0.star = 0
end

function BattlePkResultView.openRootWnd(slot0, slot1)
	slot0:setData(slot1)

	slot0.fight_type = slot1.combat_type
end

function BattlePkResultView.open_callback(slot0)
	slot1 = ""

	playOtherSound("b_win", AudioManager.AUDIO_TYPE.BATTLE)

	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.source_container = slot0.root_wnd:getChildByName("container")
	slot0.title_container = slot0.source_container:getChildByName("title_container")
	slot0.title_width = slot0.title_container:getContentSize().width
	slot0.title_height = slot0.title_container:getContentSize().height
	slot0.world_btn = slot0.source_container:getChildByName("world_btn")

	slot0.world_btn:setTitleText(TI18N("世界分享"))

	slot0.world_btn.label = slot0.world_btn:getTitleRenderer()

	if slot0.world_btn.label ~= nil then
		slot0.world_btn.label:enableOutline(cc.c3b(2, 0, 25), 2)
	end

	slot0.guild_btn = slot0.source_container:getChildByName("guild_btn")

	slot0.guild_btn:setTitleText(TI18N("公会分享"))

	slot0.guild_btn.label = slot0.guild_btn:getTitleRenderer()

	if slot0.guild_btn.label ~= nil then
		slot0.guild_btn.label:enableOutline(cc.c3b(2, 0, 25), 2)
	end

	slot0.record_btn = slot0.source_container:getChildByName("record_btn")

	slot0.record_btn:setTitleText(TI18N("回放"))

	slot0.record_btn.label = slot0.record_btn:getTitleRenderer()

	if slot0.record_btn.label ~= nil then
		slot0.record_btn.label:enableOutline(cc.c3b(2, 0, 25), 2)
	end

	slot0.harm_btn = slot0.source_container:getChildByName("harm_btn")

	slot0.harm_btn:setVisible(false)
	slot0.harm_btn:getChildByName("harm_lab"):setString(TI18N("数据统计"))
end

function BattlePkResultView.register_event(slot0)
	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				BattleController:getInstance():openFinishView(false, uv0.fight_type)
			end
		end)
	end

	if slot0.world_btn then
		slot0.world_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if uv0.data then
					if uv0._is_cross then
						BattleController:getInstance():on20034(uv0.data.replay_id, ChatConst.Channel.Cross, uv0.data.def_name, BattleConst.ShareType.SharePk)
					else
						BattleController:getInstance():on20034(uv0.data.replay_id, ChatConst.Channel.World, uv0.data.def_name, BattleConst.ShareType.SharePk)
					end
				end

				BattleController:getInstance():openFinishView(false, uv0.fight_type)
			end
		end)
	end

	if slot0.guild_btn then
		slot0.guild_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				if RoleController:getInstance():getRoleVo() and slot2.gid ~= 0 and slot2.gsrv_id ~= "" then
					BattleController:getInstance():on20034(uv0.data.replay_id, ChatConst.Channel.Gang, uv0.data.def_name, BattleConst.ShareType.SharePk)
				else
					message(TI18N("暂无公会"))
				end
			end
		end)
	end

	if slot0.record_btn then
		slot0.record_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				BattleController:getInstance():openFinishView(false, uv0.fight_type)

				if uv0.data then
					BattleController:getInstance():csRecordBattle(uv0.data.replay_id)
				end
			end
		end)
	end

	if slot0.harm_btn then
		registerButtonEventListener(slot0.harm_btn, handler(slot0, slot0._onClickHarmBtn), true)
	end
end

function BattlePkResultView._onClickHarmBtn(slot0)
	if slot0.data and next(slot0.data) ~= nil then
		BattleController:getInstance():openBattleHarmInfoView(true, slot0.data, {
			fight_type = slot0.fight_type
		})
	end
end

function BattlePkResultView.setData(slot0, slot1)
	if slot1 then
		slot0.data = slot1 or {}

		slot0:handleEffect(true)
		slot0.harm_btn:setVisible(true)

		slot0._is_cross = false

		if slot1.is_province and slot1.is_province == 1 then
			slot0._is_cross = true

			slot0.world_btn:setTitleText(TI18N("跨服分享"))
		end
	end
end

function BattlePkResultView.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0.title_container) and slot0.play_effect == nil then
		if slot0.data.result == 1 then
			slot0.play_effect = createEffectSpine(PathTool.getEffectRes(103), cc.p(slot0.title_width * 0.5, slot0.title_height * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action_2)
		else
			slot0.play_effect = createEffectSpine(PathTool.getEffectRes(104), cc.p(slot0.title_width * 0.5, slot0.title_height * 0.5 + 40), cc.p(0.5, 0.5), false, PlayerAction.action)
		end

		slot0.title_container:addChild(slot0.play_effect, 1)
	end
end

function BattlePkResultView.close_callback(slot0)
	slot0:handleEffect(false)

	if BattleController:getInstance():getModel():getBattleScene() and BattleController:getInstance():getIsSameBattleType(slot0.fight_type) then
		BattleController:getInstance():getModel():result({
			combat_type = slot0.fight_type,
			result = slot0.result
		}, slot0.is_leave_self)
	end
end
