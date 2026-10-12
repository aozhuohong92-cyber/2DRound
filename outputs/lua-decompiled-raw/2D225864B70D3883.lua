PlayEffectView = PlayEffectView or BaseClass(BaseView)

function PlayEffectView.__init(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot0.ctrl = slot1
	slot0.win_type = WinType.Full
	slot0.effect_name = slot2
	slot0.x = x
	slot0.y = y
	slot0.finish_call = slot3
	slot0.isgore_playing = slot4
	slot0.ignore_battle = slot5
	slot0.delay_play = slot6
	slot0.action_name = slot7
	slot0.layout_name = "mainui/play_effect_view"
end

function PlayEffectView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")
	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
end

function PlayEffectView.open(slot0, slot1)
	BaseView.open(slot0)
	slot0:createEffect()
end

function PlayEffectView.createEffect(slot0)
	slot0.body = createEffectSpine(slot0.effect_name, cc.p(slot0.main_panel:getContentSize().width / 2, slot0.main_panel:getContentSize().height / 2), cc.p(0.5, 0.5), true, slot0.action_name, nil, )

	slot0.main_panel:addChild(slot0.body)
	slot0.body:registerSpineEventHandler(function (slot0)
		if slot0.animation == uv0.action_name then
			if uv0.body then
				uv0.body:clearTracks()
				uv0.body:runAction(cc.RemoveSelf:create(true))
			end

			delayOnce(function ()
				if uv0.finish_call then
					uv0:finish_call()
				end

				uv0.ctrl:openPlayEffectView(false)
			end, 0.1)
		end
	end, sp.EventType.ANIMATION_COMPLETE)
end

function PlayEffectView.register_event(slot0)
end

function PlayEffectView.close_callback(slot0)
	slot0.ctrl:openPlayEffectView(false)
end
