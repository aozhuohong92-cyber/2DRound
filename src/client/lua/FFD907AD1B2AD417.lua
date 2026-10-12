StoryModel = StoryModel or BaseClass()

function StoryModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function StoryModel.config(slot0)
	slot0.cur_story_bid = nil
	slot0.cur_story = nil
	slot0.cur_act_list = nil
	slot0.is_story_state = false
	slot0.is_story_fight = false
	slot0.temp_story_list = {}
end

function StoryModel.setCurStory(slot0, slot1)
	if slot0.is_story_state == true then
		if slot0.cur_story_bid == slot1.drama_bid then
			return
		end

		for slot5, slot6 in ipairs(slot0.temp_story_list) do
			if slot6.drama_bid == slot1.drama_bid then
				return
			end
		end

		table.insert(slot0.temp_story_list, slot1)

		return
	end

	slot0.cur_story_bid = slot1.drama_bid
	slot0.cur_story = Config.DramaData.data_get[slot1.drama_bid]

	if slot0.cur_story and next(slot0.cur_story.act) ~= nil then
		slot0.cur_act_list = slot0.cur_story.act

		GlobalEvent:getInstance():Fire(StoryEvent.READ_CONFIG_COMPLETE)
	else
		slot0.ctrl:send_11100(slot0.cur_story_bid, 0)
	end
end

function StoryModel.isPlayNextStory(slot0)
	if #slot0.temp_story_list > 0 then
		slot0:setCurStory(table.remove(slot0.temp_story_list, 1))
	end
end

function StoryModel.getCurStoryBid(slot0)
	return slot0.cur_story_bid
end

function StoryModel.getCurStory(slot0)
	return slot0.cur_story
end

function StoryModel.getCurActList(slot0)
	return slot0.cur_act_list
end

function StoryModel.setStoryState(slot0, slot1)
	slot0.is_story_state = slot1

	if slot1 == false then
		GlobalEvent:getInstance():Fire(StoryEvent.STORY_OVER)
		slot0:isPlayNextStory()
	end
end

function StoryModel.isStoryState(slot0)
	return slot0.is_story_state
end

function StoryModel.setStoryFight(slot0, slot1)
	slot0.is_story_fight = slot1
end

function StoryModel.isStoryFight(slot0)
	return slot0.is_story_fight
end

function StoryModel.clearActData(slot0)
	slot0.cur_story_bid = nil
	slot0.cur_story = nil
	slot0.cur_act_list = nil
end

function StoryModel.__delete(slot0)
end
