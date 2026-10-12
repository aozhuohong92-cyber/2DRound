-- B-stage presentation rules for the offline drama preview.
-- This module is intentionally free of engine calls so the mapping can be
-- tested without a device. It never reads or writes the normal save state.
local M = {}

M.banner_title = '离线预览'
M.banner_detail = '固定演出 · 奖励与进度尚未开放'
M.challenge_text = '挑战BOSS'
M.challenge_message = '离线预览：挑战尚未开放'
M.region_title = '悬赏与奖励'
M.region_detail = '尚未接入'

-- These CSB nodes either contain editor/template content, belong to features
-- that require real reward or progression data, or expose buttons that have no
-- offline implementation yet. Keep them out of the preview instead of letting
-- empty slots or baked labels imply that the features are available.
M.hidden_nodes = {
    'image_bg',
    'image_bg_8_0',
    'image_boss',
    'reward_layout',
    'item_scrollview',
    'title_reward',
    'desc_panel',
    'detail_btn',
    'guidesign_battle_quick_btn',
    'encounter_btn',
    'next_battle_time',
}

-- Reference-screenshot mode: the panel shows title, description, detail, quick-hang,
-- WANTED board and the timer like the original; only the controls with no offline
-- implementation or no recoverable data stay hidden (item list and portrait are
-- drawn as labelled placeholders by drama_reference_view).
M.reference_hidden_nodes = {
    'image_boss',
    'item_scrollview',
    'encounter_btn',
}

function M.title(fixture)
    assert(type(fixture) == 'table', 'drama fixture is required')
    assert(type(fixture.name) == 'string' and fixture.name ~= '', 'drama fixture name is required')
    return fixture.name
end

function M.banner_text()
    return M.banner_title .. ' · ' .. M.banner_detail
end

return M
