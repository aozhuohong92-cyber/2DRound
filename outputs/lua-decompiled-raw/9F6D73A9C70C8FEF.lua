WorldmapModel = WorldmapModel or BaseClass()

function WorldmapModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function WorldmapModel.config(slot0)
end

function WorldmapModel.__delete(slot0)
end
