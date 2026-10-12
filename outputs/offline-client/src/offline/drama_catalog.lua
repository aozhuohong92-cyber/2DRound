-- Verified original fields; these are references, not executable combat/reward rules.
-- `enemy` comes from the unit tables (unit_data1.lua); attributes/skills are NOT recovered.
return {
    source = 'dungeon_data.lua:2618-2632,2933,3204,3502',
    [10010] = {id=10010, name='伟大航路1', mode=1, chapter_id=1, map_id=10008,
        next_id=10020, unit_id=20101, power=327, lev_limit=1,
        show_items={{3,1},{7,1},{10001,1},{29903,1},{40101,1},{40201,1},{40301,1},{40401,1}},
        battle = {bg_music='b_001', source='battle_bg_data.lua:270'},
        enemy = {
            group_source = 'unit_data1.lua:7170',
            unit_id = 20101, name = '海贼1号', formation = {1, 1}, boss_id = 101011,
            monsters = {
                {bid=101011, name='海贼1号', body_id='H30012', lev=1, career=3, camp_type=1,
                 model_size=1000, head_icon='10101', source='unit_data1.lua:22257'},
            },
        }},
    -- Reference-screenshot stage. Fields from dungeon_data.lua:2922; enemy attributes unknown.
    [10030] = {id=10030, name='伟大航路3', mode=1, chapter_id=1, map_id=10008,
        next_id=10040, unit_id=20103, power=980, lev_limit=1, pos={646,368},
        hook_items={{5,10},{22,35},{1,210},{7,10}},
        show_items={{3,1},{7,1},{10001,1},{29903,1},{40101,1},{40201,1},{40301,1},{40401,1}},
        enemy = {
            group_source = 'unit_data1.lua (unit 20103)',
            unit_id = 20103, name = '索隆', formation = {1, 1}, boss_id = 101031,
            monsters = {
                {bid=101031, body_id='H30022', source='unit_data1.lua:20103 monster1'},
                {bid=101032, source='unit_data1.lua:20103 monster2 (fields not read)'},
            },
        }},
    [10020] = {id=10020, name='伟大航路2', mode=1, chapter_id=1, map_id=10008,
        next_id=10030, unit_id=20102, power=410, lev_limit=1,
        show_items={{3,1},{7,1},{10001,1},{29903,1},{40101,1},{40201,1},{40301,1},{40401,1}}},
}
