MergeserverModel = MergeserverModel or BaseClass()

function MergeserverModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function MergeserverModel.config(slot0)
end

function MergeserverModel.setVotingStatus(slot0, slot1)
	slot0.vote_status = slot1
end

function MergeserverModel.getVotingStatus(slot0)
	if slot0.flag == nil then
		return
	end

	return slot0.vote_status
end

function MergeserverModel.setMainuiAction(slot0, slot1)
	GlobalEvent:getInstance():Fire(MergeserverEvent.vote_mergeAction_event, slot1)
end

function MergeserverModel.setResult(slot0, slot1)
	if slot1 ~= nil or next(slot1) ~= nil then
		slot0.result = {
			flag = slot1.flag,
			id = slot1.id,
			agreepoints = slot1.agreepoints,
			disagreepoints = slot1.disagreepoints
		}
	end
end

function MergeserverModel.getResult(slot0)
	return slot0.result
end

function MergeserverModel.setCountDownTime(slot0, slot1, slot2)
	if tolua.isnull(slot1) then
		return
	end

	doStopAllActions(slot1)

	if slot2 > 0 then
		slot0:setTimeFormatString(slot1, slot2)
		slot1:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				doStopAllActions(uv1)
				uv1:setString("00:00:00")
			else
				uv2:setTimeFormatString(uv1, uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(slot1, slot2)
	end
end

function MergeserverModel.setTimeFormatString(slot0, slot1, slot2)
	if slot2 > 0 then
		slot1:setString(TimeTool.GetTimeFormatDayIIIIIIII(slot2))
	else
		doStopAllActions(slot1)
		slot1:setString("00:00:00")
	end
end

function MergeserverModel.__delete(slot0)
end
