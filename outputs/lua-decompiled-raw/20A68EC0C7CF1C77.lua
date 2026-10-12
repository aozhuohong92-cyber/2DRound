function schedule(slot0, slot1, slot2)
	slot5 = cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(slot2), cc.CallFunc:create(slot1)))

	slot0:runAction(slot5)

	return slot5
end

function performWithDelay(slot0, slot1, slot2)
	slot4 = cc.Sequence:create(cc.DelayTime:create(slot2), cc.CallFunc:create(slot1))

	slot0:runAction(slot4)

	return slot4
end
