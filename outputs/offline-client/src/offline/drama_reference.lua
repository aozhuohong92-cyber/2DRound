-- Display-only sample values taken from the user's reference screenshot of the
-- drama screen (stage "伟大航路3"). They are NOT real save data, never written to
-- offline-state, and exist only so the screen can be compared with the reference.
-- `missing` lists original resources that are not in the local resource set; those
-- spots are drawn as labelled placeholders until the files are copied back.
return {
    note = '参考截图示例值，仅用于显示，不写存档',
    stage = {
        preview = true, reference = true,
        source = {
            dungeon = 'Config.DungeonData.data_drama_dungeon_info_table[10030]',
            world = 'Config.DungeonData.data_drama_world_info[1][1]',
        },
        mode = 1, chapter_id = 1, chapter_name = '伟大航路',
        map_id = 10008, dun_id = 10030, next_id = 10040,
        name = '伟大航路3', pos = {646, 368},
    },
    top = {name = '流年灬贝克', level = 124, power = 1643, wealth = {8000, 3601, 181}},
    gift = {amount = 5000, text = '可领取', item_id = 3},
    voyage = {name = '远航', value = 200},
    desc = '《ONE PIECE》',
    -- hook_items of 10030: {{5,10},{22,35},{1,210},{7,10}}; order follows the reference.
    income = {
        {item_id = 7, label = '情报', text = '10/m'},
        {item_id = 1, label = '金币', text = '210/m'},
        {item_id = 22, label = 'EXP', text = '35/m'},
        {item_id = 5, label = 'EXP', text = '10/m'},
    },
    hook_up = '挂机UP',
    chest_time = '12:00',
    -- show_items of 10030 (first four are visible in the reference).
    rewards = {
        {id = 3, icon = 3, name = '钻石', count = 1},
        {id = 7, icon = 7, name = '远航情报', count = 1},
        {id = 10001, icon = 10001, name = '突破卡', count = 1},
        {id = 29903, icon = 29997, name = '3星随机碎片', count = 1},
    },
    missing = {
        'SI4YKjtXKGfkpPZhfeZcJEE6b4gGZbox/battle/battle_resources_collect.csb',
        'SI4YKjtXKGfkpPZhfeZcJEE6b4gGZbox/battledrama/battle_drama_qingbao_node.csb',
        'resource/headicon/b<boss head_icon>.jpg (BOSS 悬赏人像)',
        'resource/bigbg/battle_bg/10008/blayer/small_map.jpg (小地图底图)',
        'resource/item/{3,7,10001,29997}.png 与 hook 物品 {1,5,7,22} 图标',
        'Spine: H30022 (敌方 索隆组) / 战场其余角色',
        'effect 282 (宝箱 Spine)',
    },
}
