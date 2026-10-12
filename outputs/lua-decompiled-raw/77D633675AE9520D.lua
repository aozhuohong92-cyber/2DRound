CrossgroundModel = CrossgroundModel or BaseClass()

function CrossgroundModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function CrossgroundModel.config(slot0)
end

function CrossgroundModel.__delete(slot0)
end
