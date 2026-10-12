MainuiModel = MainuiModel or BaseClass()
MainuiModel.DUN_ENTER_BIND_ID = {
	OutsiderCrack = 6,
	Equip = 4,
	Meterial = 2,
	TitanTemple = 1,
	Expedition = 5,
	Trialtower = 3
}

function MainuiModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function MainuiModel.config(slot0)
	slot0.buff_list = {}
end

function MainuiModel.setExtendBuff(slot0, slot1)
	slot0.buff_list = slot1
end

function MainuiModel.getExtendBuff(slot0)
	return slot0.buff_list
end

function MainuiModel.__delete(slot0)
end
