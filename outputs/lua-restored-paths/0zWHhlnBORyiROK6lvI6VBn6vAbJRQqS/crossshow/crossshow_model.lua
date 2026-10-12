CrossshowModel = CrossshowModel or BaseClass()

function CrossshowModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function CrossshowModel.config(slot0)
end

function CrossshowModel.__delete(slot0)
end
