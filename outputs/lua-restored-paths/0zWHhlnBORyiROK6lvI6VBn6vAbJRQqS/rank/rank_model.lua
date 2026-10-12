RankModel = RankModel or BaseClass()

function RankModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function RankModel.config(slot0)
end

function RankModel.__delete(slot0)
end
