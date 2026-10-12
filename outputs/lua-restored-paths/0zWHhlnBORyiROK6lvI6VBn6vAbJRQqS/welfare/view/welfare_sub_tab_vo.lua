WelfareSubTabVo = WelfareSubTabVo or BaseClass(EventDispatcher)

function WelfareSubTabVo.__init(slot0)
	slot0.bid = 0
	slot0.sort_val = 0
	slot0.title = ""
	slot0.ico = ""
	slot0.type_ico = 0
	slot0.panel_type = 0
	slot0.reward_title = ""
	slot0.aim_title = ""
	slot0.title2 = ""
	slot0.top_banner = ""
	slot0.rule_str = ""
	slot0.time_str = ""
	slot0.bottom_alert = ""
	slot0.channel_ban = ""
	slot0.remain_sec = 0
	slot0.tips_status = false
end

function WelfareSubTabVo.update(slot0, slot1)
	if slot1 then
		for slot5, slot6 in pairs(slot1) do
			slot0:setParam(slot5, slot6)
		end
	end
end

function WelfareSubTabVo.setTipsStatus(slot0, slot1)
	slot0.tips_status = slot1 ~= FALSE
end

function WelfareSubTabVo.setParam(slot0, slot1, slot2)
	if slot0[slot1] ~= slot2 then
		slot0[slot1] = slot2
	end
end
