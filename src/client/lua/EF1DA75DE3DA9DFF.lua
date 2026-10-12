StoryController = StoryController or BaseClass(BaseController)

function StoryController.config(slot0)
	slot0.model = StoryModel.New(slot0)
	slot0.view = StoryView.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function StoryController.getModel(slot0)
	return slot0.model
end

function StoryController.registerEvents(slot0)
end

function StoryController.registerProtocals(slot0)
	slot0:RegisterProtocal(11101, "handle_11101")
	slot0:RegisterProtocal(11102, "handle_11102")
	slot0:RegisterProtocal(11100, "handle_11100")
end

function StoryController.getView(slot0)
	return slot0.view
end

function StoryController.openView(slot0)
	if slot0.view ~= nil then
		slot0.view:open()
	end
end

function StoryController.closeView(slot0)
	if slot0.view ~= nil then
		slot0.view:close()
	end
end

function StoryController.send_11100(slot0, slot1, slot2)
	slot0:SendProtocal(11100, {
		drama_bid = slot1,
		step_id = slot2
	})
end

function StoryController.handle_11100(slot0, slot1)
	if slot0.view then
		slot0.view:playStepOver()
	end
end

function StoryController.handle_11101(slot0, slot1)
	if slot0.model then
		slot0.model:setCurStory(slot1)
	end
end

function StoryController.send_11102(slot0, slot1)
	slot0:SendProtocal(11102, {
		drama_bid = slot1
	})
end

function StoryController.handle_11102(slot0, slot1)
	if slot0.model and slot1.code == 1 then
		GlobalEvent:getInstance():Fire(StoryEvent.SKIP_STORY)
	end
end

function StoryController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end

function StoryController.isInStory(slot0)
	if slot0.model == nil then
		return false
	end

	return slot0.model:isStoryState()
end
