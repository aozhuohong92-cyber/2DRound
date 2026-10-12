LimitTimeActionModel = LimitTimeActionModel or BaseClass()

function LimitTimeActionModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function LimitTimeActionModel.config(slot0)
end

function FestivalActionModel.__delete(slot0)
end
