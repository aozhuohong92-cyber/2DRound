BarrageModel = BarrageModel or BaseClass()

function BarrageModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function BarrageModel.config(slot0)
end

function BarrageModel.__delete(slot0)
end
