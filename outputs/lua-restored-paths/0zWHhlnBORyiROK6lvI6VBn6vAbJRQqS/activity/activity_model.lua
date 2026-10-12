ActivityModel = ActivityModel or BaseClass()

function ActivityModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function ActivityModel.config(slot0)
end

function ActivityModel.__delete(slot0)
end
