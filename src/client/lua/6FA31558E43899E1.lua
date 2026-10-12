Config = Config or {}
Config.QuestData = Config.QuestData or {}
Config.QuestData.data_get_length = 12
Config.QuestData.data_get = {
	[90000] = {
		lev = 3,
		id = 90000,
		name = "日常登录",
		res = "quest_item_zhaohuan",
		desc = "日常登录1次",
		progress = {
			{
				cli_label = "evt_cli_loaded",
				target = 0,
				target_val = 1,
				param = {}
			}
		},
		extra = {},
		commit_rewards = {
			{
				3,
				20
			},
			{
				9,
				5
			}
		}
	},
	[90001] = {
		lev = 5,
		id = 90001,
		name = "好友赠送",
		res = "quest_item_haoyou",
		desc = "每天赠送好友友情点5次",
		progress = {
			{
				cli_label = "evt_friend_present",
				target = 14,
				target_val = 5,
				param = {}
			}
		},
		extra = {},
		commit_rewards = {
			{
				14,
				100
			},
			{
				9,
				5
			}
		}
	},
	[90003] = {
		lev = 1,
		id = 90003,
		name = "召唤",
		res = "quest_item_yingxiong",
		desc = "进行3次召唤",
		progress = {
			{
				cli_label = "evt_recruit",
				target = 0,
				target_val = 3,
				param = {}
			}
		},
		extra = {},
		commit_rewards = {
			{
				3,
				20
			},
			{
				9,
				10
			}
		}
	},
	[90005] = {
		lev = 8,
		id = 90005,
		name = "竞技场",
		res = "quest_item_jianzhu",
		desc = "参与3次竞技场挑战",
		progress = {
			{
				cli_label = "evt_arena_fight",
				target = 0,
				target_val = 3,
				param = {}
			}
		},
		extra = {},
		commit_rewards = {
			{
				10103,
				2
			},
			{
				9,
				15
			}
		}
	},
	[90007] = {
		lev = 1,
		id = 90007,
		name = "快速作战",
		res = "quest_item_zhaohuan",
		desc = "快速作战5次",
		progress = {
			{
				cli_label = "evt_dungeon_fast_combat",
				target = 0,
				target_val = 5,
				param = {}
			}
		},
		extra = {},
		commit_rewards = {
			{
				3,
				30
			},
			{
				9,
				15
			}
		}
	},
	[90012] = {
		lev = 6,
		id = 90012,
		name = "海底监狱挑战",
		res = "quest_item_heian",
		desc = "挑战或扫荡海底监狱任意层3次",
		progress = {
			{
				cli_label = "evt_star_tower_pass",
				target = 0,
				target_val = 3,
				param = {}
			}
		},
		extra = {},
		commit_rewards = {
			{
				10001,
				20
			},
			{
				9,
				10
			}
		}
	},
	[90013] = {
		lev = 6,
		id = 90013,
		name = "公会Boss",
		res = "quest_item_guild",
		desc = "挑战任意公会Boss3次",
		progress = {
			{
				cli_label = "evt_guild_dun_fight",
				target = 0,
				target_val = 3,
				param = {}
			}
		},
		extra = {},
		commit_rewards = {
			{
				10,
				50
			},
			{
				9,
				15
			}
		}
	},
	[90014] = {
		lev = 6,
		id = 90014,
		name = "公会捐献",
		res = "quest_item_guild",
		desc = "进行1次公会捐献",
		progress = {
			{
				cli_label = "evt_guild_donate",
				target = 0,
				target_val = 1,
				param = {}
			}
		},
		extra = {},
		commit_rewards = {
			{
				10401,
				1
			},
			{
				9,
				10
			}
		}
	},
	[90018] = {
		lev = 25,
		id = 90018,
		name = "无尽试炼",
		res = "quest_item_dixia",
		desc = "参与1次无尽试炼",
		progress = {
			{
				cli_label = "evt_endless_fight",
				target = 0,
				target_val = 1,
				param = {}
			}
		},
		extra = {},
		commit_rewards = {
			{
				37001,
				1
			},
			{
				9,
				10
			}
		}
	},
	[90020] = {
		lev = 6,
		id = 90020,
		name = "悬赏任务",
		res = "quest_item_guild",
		desc = "接取3次远航订单",
		progress = {
			{
				cli_label = "evt_shipping",
				target = 0,
				target_val = 3,
				param = {}
			}
		},
		extra = {},
		commit_rewards = {
			{
				1,
				40000
			},
			{
				9,
				10
			}
		}
	},
	[90023] = {
		lev = 15,
		id = 90023,
		name = "神技副本",
		res = "quest_item_heian",
		desc = "参与2次日常副本",
		progress = {
			{
				cli_label = "evt_dungeon_stone_fight",
				target = 0,
				target_val = 2,
				param = {}
			}
		},
		extra = {},
		commit_rewards = {
			{
				37001,
				1
			},
			{
				9,
				10
			}
		}
	},
	[90024] = {
		lev = 30,
		id = 90024,
		name = "装备合成",
		res = "quest_item_heian",
		desc = "在锻造屋合成1次装备",
		progress = {
			{
				cli_label = "evt_equipment_compound",
				target = 0,
				target_val = 1,
				param = {}
			}
		},
		extra = {},
		commit_rewards = {
			{
				1,
				30000
			},
			{
				9,
				20
			}
		}
	}
}

function Config.QuestData.data_get_fun(slot0)
	slot1 = Config.QuestData.data_get[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.QuestData.data_get[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.QuestData.data_progress_lable_length = 87
Config.QuestData.data_progress_lable = {
	evt_escort_fight = "evt_escort_fight",
	evt_gain_silver_coin = "evt_gain_silver_coin",
	evt_loss_red_gold_or_gold = "evt_loss_red_gold_or_gold",
	evt_gain_gold = "evt_gain_gold",
	evt_dungeon_stone_fight = "evt_dungeon_stone_fight",
	evt_friend_present = "evt_friend_present",
	evt_formation_level_up = "evt_formation_level_up",
	evt_dungeon_auto = "evt_dungeon_auto",
	evt_cli_loaded = "evt_cli_loaded",
	evt_guild_join = "evt_guild_join",
	evt_adventure_finger_guessing = "evt_adventure_finger_guessing",
	evt_adventure_box = "evt_adventure_box",
	evt_arena_rank = "evt_arena_rank",
	evt_loss_guild = "evt_loss_guild",
	evt_formation_open = "evt_formation_open",
	evt_partner_decompose = "evt_partner_decompose",
	evt_guild_donate = "evt_guild_donate",
	evt_partner_star = "evt_partner_star",
	evt_loss_silver_coin = "evt_loss_silver_coin",
	evt_get_item = "evt_get_item",
	evt_star_divination = "evt_star_divination",
	evt_hallows_all_step = "evt_hallows_all_step",
	evt_star_natal = "evt_star_natal",
	evt_guild_dun_fight = "evt_guild_dun_fight",
	evt_guild_war = "evt_guild_war",
	evt_partner_artifact = "evt_partner_artifact",
	evt_recruit_high = "evt_recruit_high",
	evt_arena_score = "evt_arena_score",
	evt_partner_star_up = "evt_partner_star_up",
	evt_shipping = "evt_shipping",
	evt_partner = "evt_partner",
	evt_adventure_answer_all_right = "evt_adventure_answer_all_right",
	evt_adventure_plunder_result = "evt_adventure_plunder_result",
	evt_sky_ladder_rank = "evt_sky_ladder_rank",
	evt_star_natal_level_up = "evt_star_natal_level_up",
	evt_market_gold_buy = "evt_market_gold_buy",
	evt_expedition_fight = "evt_expedition_fight",
	evt_equipment_compound = "evt_equipment_compound",
	evt_worship = "evt_worship",
	evt_partner_eqm = "evt_partner_eqm",
	evt_get_speciality = "evt_get_speciality",
	evt_adventure_plunder = "evt_adventure_plunder",
	evt_travel_time = "evt_travel_time",
	evt_star_level_up = "evt_star_level_up",
	evt_adventure_kill_mon = "evt_adventure_kill_mon",
	evt_levup = "evt_levup",
	evt_planes_kill_guard = "evt_planes_kill_guard",
	evt_dungeon_enter = "evt_dungeon_enter",
	evt_eqm_sell = "evt_eqm_sell",
	evt_partner_stone_all_lv = "evt_partner_stone_all_lv",
	evt_artifact_compose = "evt_artifact_compose",
	evt_arena_elite_rank = "evt_arena_elite_rank",
	evt_world_boss_fight_ko = "evt_world_boss_fight_ko",
	evt_world_boss_fight = "evt_world_boss_fight",
	evt_market_silver_buy = "evt_market_silver_buy",
	evt_adventure_goto_floor = "evt_adventure_goto_floor",
	evt_arena_fight = "evt_arena_fight",
	evt_partner_levelup = "evt_partner_levelup",
	evt_eqm_compound = "evt_eqm_compound",
	evt_boss_fight_result = "evt_boss_fight_result",
	evt_guild_dun_fight_ko = "evt_guild_dun_fight_ko",
	evt_star_tower_pass = "evt_star_tower_pass",
	evt_boss_fight = "evt_boss_fight",
	evt_endless_fight = "evt_endless_fight",
	evt_market_silver_sold = "evt_market_silver_sold",
	evt_power = "evt_power",
	evt_say = "evt_say",
	evt_star_tower_floor_pass = "evt_star_tower_floor_pass",
	evt_get_furniture = "evt_get_furniture",
	evt_recruit = "evt_recruit",
	evt_market_coin_sold = "evt_market_coin_sold",
	evt_escort_enter = "evt_escort_enter",
	evt_primus_fight = "evt_primus_fight",
	evt_gain_guild = "evt_gain_guild",
	evt_adventure_explore = "evt_adventure_explore",
	evt_partner_enchant_eqm = "evt_partner_enchant_eqm",
	evt_loss_coin = "evt_loss_coin",
	evt_dungeon_pass = "evt_dungeon_pass",
	evt_dungeon_fast_combat = "evt_dungeon_fast_combat",
	evt_endless_pass = "evt_endless_pass",
	evt_gain_coin = "evt_gain_coin",
	evt_friend = "evt_friend",
	evt_friend_sns = "evt_friend_sns",
	evt_mystery_buy = "evt_mystery_buy",
	evt_arena_fight_result = "evt_arena_fight_result"
}
