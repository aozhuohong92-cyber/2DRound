LookModel = LookModel or BaseClass()

function LookModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function LookModel.config(slot0)
end

function LookModel.__delete(slot0)
end
