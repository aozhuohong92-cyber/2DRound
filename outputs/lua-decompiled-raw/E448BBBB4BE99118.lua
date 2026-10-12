FestivalActionConst = FestivalActionConst or {}
FestivalActionConst.ColorConst = {
	cc.c4b(100, 50, 35, 255),
	cc.c4b(149, 83, 50, 255),
	cc.c4b(149, 83, 34, 255),
	cc.c4b(95, 213, 76, 255),
	cc.c4b(237, 215, 178, 255),
	cc.c4b(183, 255, 70, 255)
}

function FestivalActionConst.CountDownTime(slot0, slot1)
	slot2 = slot1.less_time or 0
	slot3 = slot1.time_model or 1
	slot4 = slot1.text or ""

	if tolua.isnull(slot0) then
		return
	end

	doStopAllActions(slot0)

	if slot2 > 0 then
		function (slot0)
			if slot0 > 0 then
				if uv0 == 1 then
					uv1:setString(TimeTool.GetTimeFormat(slot0))
				elseif uv0 == 2 then
					uv1:setString(TimeTool.GetTimeFormatDayII(uv2) .. uv3)
				end
			else
				doStopAllActions(uv1)
				uv1:setString("00:00:00")

				if uv0 == 2 then
					FestivalActionController:getInstance():openPersonalGiftView(false)
				end
			end
		end(slot2)
		slot0:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				doStopAllActions(uv1)
				uv1:setString("00:00:00")
			else
				uv2(uv0)
			end
		end))))
	else
		slot5(slot2)
	end
end
