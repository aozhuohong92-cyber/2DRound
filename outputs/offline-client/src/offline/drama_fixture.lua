-- Explicit offline preview data for the first-round drama entry/return flow.
-- These values come from Config.DungeonData.data_drama_world_info and the
-- first chapter's data_drama_dungeon_info record. They are not written to the
-- normal save and must not be treated as proof of server progression.
return {
    preview = true,
    source = {
        world = 'Config.DungeonData.data_drama_world_info[1][1]',
        dungeon = 'Config.DungeonData.data_drama_dungeon_info_table[10010]',
    },
    mode = 1,
    chapter_id = 1,
    chapter_name = '伟大航路',
    map_id = 10008,
    dun_id = 10010,
    next_id = 10020,
    name = '伟大航路1',
    pos = {800, 320},
}
