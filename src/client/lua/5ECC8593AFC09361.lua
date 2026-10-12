LevupgradeModel = LevupgradeModel or BaseClass()

function LevupgradeModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function LevupgradeModel.config(slot0)
end

function LevupgradeModel.__delete(slot0)
end
