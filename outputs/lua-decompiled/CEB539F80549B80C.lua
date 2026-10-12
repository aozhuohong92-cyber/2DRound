EquipmakeModel = EquipmakeModel or BaseClass()

function EquipmakeModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function EquipmakeModel.config(slot0)
end

function EquipmakeModel.__delete(slot0)
end
