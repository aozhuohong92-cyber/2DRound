GuideModel = GuideModel or BaseClass()

function GuideModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function GuideModel.config(slot0)
end

function GuideModel.setGuideID(slot0, slot1)
	slot0.guide_id = slot1
end

function GuideModel.getGuideID(slot0)
	return slot0.guide_id
end

function GuideModel.__delete(slot0)
end
