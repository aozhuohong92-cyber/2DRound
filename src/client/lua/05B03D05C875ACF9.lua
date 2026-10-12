RenderMgr = RenderMgr or BaseClass()
RenderMgr.RENDER_MANAGER_TIMER = "RenderMgr.RENDER_MANAGER_TIMER"
RenderMgr.REPORT_SYS_TIME = "RenderMgr.REPORT_SYS_TIME"

function RenderMgr.__init(slot0)
	if RenderMgr.Instance ~= nil then
		error("[RenderMgr] is singleton")

		return
	end

	RenderMgr.Instance = slot0
	slot0.count = 0
	slot0.dic = {}
	slot0.funDic = {}
	slot0.next_do_list = {}
	slot0.isStop = true
	slot0.cd_check = 0
	slot0.game_net = GameNet:getInstance()
	slot0.dispatcher = GlobalEvent:getInstance()
	slot0.sharedScheduler = cc.Director:getInstance():getScheduler()
end

function RenderMgr.getInstance(slot0)
	if RenderMgr.Instance == nil then
		RenderMgr.New()
	end

	return RenderMgr.Instance
end

function RenderMgr.start(slot0)
	if slot0.isStop == false then
		return
	end

	slot0.isStop = false

	if slot0.schedule_ == nil then
		slot0.schedule_ = slot0.sharedScheduler:scheduleScriptFunc(function (slot0)
			uv0:update(slot0)
		end, 0, false)
	end
end

function RenderMgr.stop(slot0)
	if slot0.isStop == true then
		return
	end

	slot0.isStop = true

	if slot0.schedule_ then
		slot0.sharedScheduler:unscheduleScriptEntry(slot0.schedule_)
	end

	slot0.schedule_ = nil
end

function RenderMgr.frameAddCall(slot0, slot1, slot2)
	if slot1 and slot2 and slot0.funDic[slot2] == nil then
		slot0.funDic[slot2] = slot1
	end
end

function RenderMgr.frameRemoveCall(slot0, slot1)
	if slot1 and slot0.funDic[slot1] then
		slot0.funDic[slot1] = nil
	end
end

function RenderMgr.getRenderCallById(slot0, slot1)
	return slot0.funDic[slot1]
end

function RenderMgr.add(slot0, slot1)
	if slot1.update == nil then
		print("[RenderMgr]>>worning: " .. tostring(slot1) .. "not update function, I can't render it!!!!!")

		return
	end

	slot0.count = slot0.count + 1
	slot0.dic[slot1] = slot1
end

function RenderMgr.remove(slot0, slot1)
	if slot0.dic[slot1] ~= nil then
		slot0.count = slot0.count - 1
		slot0.dic[slot1] = nil
	end
end

function RenderMgr.update(slot0, slot1)
	for slot5, slot6 in pairs(slot0.dic) do
		if slot6 ~= nil then
			slot6:update(slot1)
		end
	end

	for slot5, slot6 in pairs(slot0.funDic) do
		if slot6 ~= nil then
			slot6(slot1)
		end
	end

	if #slot0.next_do_list > 0 then
		slot2 = table.remove(slot0.next_do_list, 1)

		slot2[1](slot2[2])
	end
end

function RenderMgr.reportClock(slot0)
end

function RenderMgr.doNextFrame(slot0, slot1, slot2)
	table.insert(slot0.next_do_list, {
		slot1,
		slot2
	})
end

function RenderMgr.clear(slot0)
	slot0:stop()

	slot0.cd_check = 0
	slot0.count = 0
	slot0.dic = {}
	slot0.funDic = {}
	slot0.next_do_list = {}
end
