Config = Config or {}
Config.DayGoalsSecondData = Config.DayGoalsSecondData or {}
Config.DayGoalsSecondData.data_constant_length = 3
Config.DayGoalsSecondData.data_constant = {
	over_time = {
		val = 7,
		label = "over_time",
		desc = "结束时间"
	},
	task_total = {
		val = 88,
		label = "task_total",
		desc = "全目标总任务数量"
	},
	rule_desc = {
		val = 1,
		label = "rule_desc",
		desc = "1.全民探索根据天数开放，玩家完成任务后，可在第七天开始领取终极大奖；\n2.全民探索内的任务均从活动开启时计算；\n3.活动7天后（即第8天0点）关闭，奖励只可领取一次，领取后继续完成任务不可补充领取奖励;(福利领取、半价折扣不计算在内)"
	}
}
Config.DayGoalsSecondData.data_welfarecollection_length = 7
Config.DayGoalsSecondData.data_welfarecollection = {
	{
		{
			desc = "登陆1次",
			show_icon = "",
			goal_id = 20000,
			day = 1,
			condition = {
				{
					"login",
					1
				}
			},
			award1 = {
				{
					2,
					20
				}
			}
		},
		{
			desc = "等级达到39级",
			show_icon = "",
			goal_id = 20004,
			day = 1,
			condition = {
				{
					"evt_levup",
					39
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					1,
					10000
				}
			}
		}
	},
	[7] = {
		{
			desc = "登陆1次",
			show_icon = "",
			goal_id = 80000,
			day = 7,
			condition = {
				{
					"login",
					7
				}
			},
			award1 = {
				{
					2,
					20
				}
			}
		},
		{
			desc = "等级达到45级",
			show_icon = "",
			goal_id = 80004,
			day = 7,
			condition = {
				{
					"evt_levup",
					45
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					1,
					35000
				}
			}
		}
	},
	[6] = {
		{
			desc = "登陆1次",
			show_icon = "",
			goal_id = 70000,
			day = 6,
			condition = {
				{
					"login",
					6
				}
			},
			award1 = {
				{
					2,
					20
				}
			}
		},
		{
			desc = "等级达到44级",
			show_icon = "",
			goal_id = 70004,
			day = 6,
			condition = {
				{
					"evt_levup",
					44
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					1,
					30000
				}
			}
		}
	},
	[5] = {
		{
			desc = "登陆1次",
			show_icon = "",
			goal_id = 60000,
			day = 5,
			condition = {
				{
					"login",
					5
				}
			},
			award1 = {
				{
					2,
					20
				}
			}
		},
		{
			desc = "等级达到43级",
			show_icon = "",
			goal_id = 60004,
			day = 5,
			condition = {
				{
					"evt_levup",
					43
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					1,
					25000
				}
			}
		}
	},
	[4] = {
		{
			desc = "登陆1次",
			show_icon = "",
			goal_id = 50000,
			day = 4,
			condition = {
				{
					"login",
					4
				}
			},
			award1 = {
				{
					2,
					20
				}
			}
		},
		{
			desc = "等级达到42级",
			show_icon = "",
			goal_id = 50004,
			day = 4,
			condition = {
				{
					"evt_levup",
					42
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					1,
					20000
				}
			}
		}
	},
	[3] = {
		{
			desc = "登陆1次",
			show_icon = "",
			goal_id = 40000,
			day = 3,
			condition = {
				{
					"login",
					3
				}
			},
			award1 = {
				{
					2,
					20
				}
			}
		},
		{
			desc = "等级达到41级",
			show_icon = "",
			goal_id = 40004,
			day = 3,
			condition = {
				{
					"evt_levup",
					41
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					1,
					18000
				}
			}
		}
	},
	[2] = {
		{
			desc = "登陆1次",
			show_icon = "",
			goal_id = 30000,
			day = 2,
			condition = {
				{
					"login",
					2
				}
			},
			award1 = {
				{
					2,
					20
				}
			}
		},
		{
			desc = "等级达到40级",
			show_icon = "",
			goal_id = 30004,
			day = 2,
			condition = {
				{
					"evt_levup",
					40
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					1,
					15000
				}
			}
		}
	}
}
Config.DayGoalsSecondData.data_growthtarget_length = 7
Config.DayGoalsSecondData.data_growthtarget = {
	{
		{
			target_type = 1,
			desc = "通关第七章北裂境平原",
			goal_id = 11010,
			show_icon = "juqing",
			day = 1,
			lev = 1,
			type_name = "剧情副本",
			progress = {
				{
					cli_label = "evt_dungeon_pass",
					target = 3,
					target_val = 1,
					param = {
						{
							"chapter",
							10708
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 1,
			desc = "通关第八章落日森卡莉法",
			goal_id = 11020,
			show_icon = "juqing",
			day = 1,
			lev = 1,
			type_name = "剧情副本",
			progress = {
				{
					cli_label = "evt_dungeon_pass",
					target = 3,
					target_val = 1,
					param = {
						{
							"chapter",
							10808
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 1,
			desc = "通关第九章叹息山脉",
			goal_id = 11030,
			show_icon = "juqing",
			day = 1,
			lev = 1,
			type_name = "剧情副本",
			progress = {
				{
					cli_label = "evt_dungeon_pass",
					target = 3,
					target_val = 1,
					param = {
						{
							"chapter",
							10908
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 1,
			desc = "通关第十章司法岛后",
			goal_id = 11040,
			show_icon = "juqing",
			day = 1,
			lev = 1,
			type_name = "剧情副本",
			progress = {
				{
					cli_label = "evt_dungeon_pass",
					target = 3,
					target_val = 1,
					param = {
						{
							"chapter",
							11008
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 1,
			desc = "通关第十一章萨隆米亚神庙",
			goal_id = 11050,
			show_icon = "juqing",
			day = 1,
			lev = 1,
			type_name = "剧情副本",
			progress = {
				{
					cli_label = "evt_dungeon_pass",
					target = 3,
					target_val = 1,
					param = {
						{
							"chapter",
							11108
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 1,
			desc = "通关第十二章特洛伊群岛",
			goal_id = 11060,
			show_icon = "juqing",
			day = 1,
			lev = 1,
			type_name = "剧情副本",
			progress = {
				{
					cli_label = "evt_dungeon_pass",
					target = 3,
					target_val = 1,
					param = {
						{
							"chapter",
							11208
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 2,
			desc = "通关第七章龙鸣之地",
			goal_id = 11070,
			show_icon = "juqing",
			day = 1,
			lev = 1,
			type_name = "地下城副本",
			progress = {
				{
					cli_label = "evt_dungeon_pass",
					target = 3,
					target_val = 1,
					param = {
						{
							"chapter",
							20705
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 2,
			desc = "通关第八章地下陵墓",
			goal_id = 11080,
			show_icon = "juqing",
			day = 1,
			lev = 1,
			type_name = "地下城副本",
			progress = {
				{
					cli_label = "evt_dungeon_pass",
					target = 3,
					target_val = 1,
					param = {
						{
							"chapter",
							20805
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 2,
			desc = "通关第九章炼狱熔炉",
			goal_id = 11090,
			show_icon = "juqing",
			day = 1,
			lev = 1,
			type_name = "地下城副本",
			progress = {
				{
					cli_label = "evt_dungeon_pass",
					target = 3,
					target_val = 1,
					param = {
						{
							"chapter",
							20905
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 2,
			desc = "通关第十章烈焰峡谷",
			goal_id = 11100,
			show_icon = "juqing",
			day = 1,
			lev = 1,
			type_name = "地下城副本",
			progress = {
				{
					cli_label = "evt_dungeon_pass",
					target = 3,
					target_val = 1,
					param = {
						{
							"chapter",
							21005
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 2,
			desc = "通关第十一章幽冥神庙",
			goal_id = 11110,
			show_icon = "juqing",
			day = 1,
			lev = 1,
			type_name = "地下城副本",
			progress = {
				{
					cli_label = "evt_dungeon_pass",
					target = 3,
					target_val = 1,
					param = {
						{
							"chapter",
							21105
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 2,
			desc = "通关第十二章地心熔岩",
			goal_id = 11120,
			show_icon = "juqing",
			day = 1,
			lev = 1,
			type_name = "地下城副本",
			progress = {
				{
					cli_label = "evt_dungeon_pass",
					target = 3,
					target_val = 1,
					param = {
						{
							"chapter",
							21205
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		}
	},
	[7] = {
		{
			target_type = 1,
			desc = "友好值消耗5000点",
			goal_id = 18010,
			show_icon = "shenge",
			day = 7,
			lev = 1,
			type_name = "友好值消耗",
			progress = {
				{
					cli_label = "evt_loss_hero_soul",
					target = 0,
					target_val = 5000,
					param = {}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 1,
			desc = "友好值消耗10000点",
			goal_id = 18020,
			show_icon = "shenge",
			day = 7,
			lev = 1,
			type_name = "友好值消耗",
			progress = {
				{
					cli_label = "evt_loss_hero_soul",
					target = 0,
					target_val = 10000,
					param = {}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					2000
				}
			}
		},
		{
			target_type = 1,
			desc = "友好值消耗15000点",
			goal_id = 18030,
			show_icon = "shenge",
			day = 7,
			lev = 1,
			type_name = "友好值消耗",
			progress = {
				{
					cli_label = "evt_loss_hero_soul",
					target = 0,
					target_val = 15000,
					param = {}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					5000
				}
			}
		},
		{
			target_type = 1,
			desc = "友好值消耗20000点",
			goal_id = 18040,
			show_icon = "shenge",
			day = 7,
			lev = 1,
			type_name = "友好值消耗",
			progress = {
				{
					cli_label = "evt_loss_hero_soul",
					target = 0,
					target_val = 20000,
					param = {}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10201,
					1
				}
			}
		},
		{
			target_type = 1,
			desc = "友好值消耗25000点",
			goal_id = 18050,
			show_icon = "shenge",
			day = 7,
			lev = 1,
			type_name = "友好值消耗",
			progress = {
				{
					cli_label = "evt_loss_hero_soul",
					target = 0,
					target_val = 25000,
					param = {}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10201,
					1
				}
			}
		},
		{
			target_type = 1,
			desc = "友好值消耗30000点",
			goal_id = 18060,
			show_icon = "shenge",
			day = 7,
			lev = 1,
			type_name = "友好值消耗",
			progress = {
				{
					cli_label = "evt_loss_hero_soul",
					target = 0,
					target_val = 30000,
					param = {}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 2,
			desc = "消耗1000钻",
			goal_id = 18070,
			show_icon = "shenmi",
			day = 7,
			lev = 17,
			type_name = "钻石消耗",
			progress = {
				{
					cli_label = "evt_loss_gold_day_goals2",
					target = 0,
					target_val = 1000,
					param = {}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 2,
			desc = "消耗2000钻",
			goal_id = 18080,
			show_icon = "shenmi",
			day = 7,
			lev = 17,
			type_name = "钻石消耗",
			progress = {
				{
					cli_label = "evt_loss_gold_day_goals2",
					target = 0,
					target_val = 2000,
					param = {}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 2,
			desc = "消耗4000钻",
			goal_id = 18090,
			show_icon = "shenmi",
			day = 7,
			lev = 17,
			type_name = "钻石消耗",
			progress = {
				{
					cli_label = "evt_loss_gold_day_goals2",
					target = 0,
					target_val = 4000,
					param = {}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 2,
			desc = "消耗8000钻",
			goal_id = 18100,
			show_icon = "shenmi",
			day = 7,
			lev = 17,
			type_name = "钻石消耗",
			progress = {
				{
					cli_label = "evt_loss_gold_day_goals2",
					target = 0,
					target_val = 8000,
					param = {}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 2,
			desc = "消耗12000钻",
			goal_id = 18110,
			show_icon = "shenmi",
			day = 7,
			lev = 17,
			type_name = "钻石消耗",
			progress = {
				{
					cli_label = "evt_loss_gold_day_goals2",
					target = 0,
					target_val = 12000,
					param = {}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 2,
			desc = "消耗15000钻",
			goal_id = 18120,
			show_icon = "shenmi",
			day = 7,
			lev = 17,
			type_name = "钻石消耗",
			progress = {
				{
					cli_label = "evt_loss_gold_day_goals2",
					target = 0,
					target_val = 15000,
					param = {}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		}
	},
	[6] = {
		{
			target_type = 1,
			desc = "布阵战力达到150000",
			goal_id = 17010,
			show_icon = "buzhen",
			day = 6,
			lev = 26,
			type_name = "战力提升",
			progress = {
				{
					cli_label = "evt_power",
					target = 3,
					target_val = 1,
					param = {
						{
							"power",
							150000
						}
					}
				}
			},
			award1 = {
				{
					30111,
					2
				},
				{
					2,
					20
				}
			}
		},
		{
			target_type = 1,
			desc = "布阵战力达到170000",
			goal_id = 17020,
			show_icon = "buzhen",
			day = 6,
			lev = 26,
			type_name = "战力提升",
			progress = {
				{
					cli_label = "evt_power",
					target = 3,
					target_val = 1,
					param = {
						{
							"power",
							170000
						}
					}
				}
			},
			award1 = {
				{
					30111,
					2
				},
				{
					2,
					20
				}
			}
		},
		{
			target_type = 1,
			desc = "布阵战力达到200000",
			goal_id = 17030,
			show_icon = "buzhen",
			day = 6,
			lev = 26,
			type_name = "战力提升",
			progress = {
				{
					cli_label = "evt_power",
					target = 3,
					target_val = 1,
					param = {
						{
							"power",
							200000
						}
					}
				}
			},
			award1 = {
				{
					30111,
					2
				},
				{
					2,
					20
				}
			}
		},
		{
			target_type = 1,
			desc = "布阵战力达到230000",
			goal_id = 17040,
			show_icon = "buzhen",
			day = 6,
			lev = 26,
			type_name = "战力提升",
			progress = {
				{
					cli_label = "evt_power",
					target = 3,
					target_val = 1,
					param = {
						{
							"power",
							230000
						}
					}
				}
			},
			award1 = {
				{
					10200,
					1
				},
				{
					2,
					20
				}
			}
		},
		{
			target_type = 1,
			desc = "布阵战力达到250000",
			goal_id = 17050,
			show_icon = "buzhen",
			day = 6,
			lev = 26,
			type_name = "战力提升",
			progress = {
				{
					cli_label = "evt_power",
					target = 3,
					target_val = 1,
					param = {
						{
							"power",
							250000
						}
					}
				}
			},
			award1 = {
				{
					10200,
					1
				},
				{
					2,
					20
				}
			}
		},
		{
			target_type = 1,
			desc = "布阵战力达到280000",
			goal_id = 17060,
			show_icon = "buzhen",
			day = 6,
			lev = 26,
			type_name = "战力提升",
			progress = {
				{
					cli_label = "evt_power",
					target = 3,
					target_val = 1,
					param = {
						{
							"power",
							280000
						}
					}
				}
			},
			award1 = {
				{
					10210,
					1
				},
				{
					2,
					20
				}
			}
		},
		{
			target_type = 1,
			desc = "布阵战力达到300000",
			goal_id = 17070,
			show_icon = "buzhen",
			day = 6,
			lev = 26,
			type_name = "战力提升",
			progress = {
				{
					cli_label = "evt_power",
					target = 3,
					target_val = 1,
					param = {
						{
							"power",
							300000
						}
					}
				}
			},
			award1 = {
				{
					30110,
					3
				},
				{
					2,
					20
				}
			}
		},
		{
			target_type = 2,
			desc = "高级召唤10次",
			goal_id = 17080,
			show_icon = "summon",
			day = 6,
			lev = 25,
			type_name = "实力提升",
			progress = {
				{
					cli_label = "evt_partner_summon",
					target = 0,
					target_val = 10,
					param = {
						{
							"type",
							2
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 2,
			desc = "高级召唤30次",
			goal_id = 17100,
			show_icon = "summon",
			day = 6,
			lev = 25,
			type_name = "实力提升",
			progress = {
				{
					cli_label = "evt_partner_summon",
					target = 0,
					target_val = 30,
					param = {
						{
							"type",
							2
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 2,
			desc = "高级召唤60次",
			goal_id = 17120,
			show_icon = "summon",
			day = 6,
			lev = 25,
			type_name = "实力提升",
			progress = {
				{
					cli_label = "evt_partner_summon",
					target = 0,
					target_val = 60,
					param = {
						{
							"type",
							2
						}
					}
				}
			},
			award1 = {
				{
					2,
					30
				},
				{
					10,
					1500
				}
			}
		},
		{
			target_type = 2,
			desc = "高级召唤90次",
			goal_id = 17130,
			show_icon = "summon",
			day = 6,
			lev = 25,
			type_name = "实力提升",
			progress = {
				{
					cli_label = "evt_partner_summon",
					target = 0,
					target_val = 90,
					param = {
						{
							"type",
							2
						}
					}
				}
			},
			award1 = {
				{
					2,
					50
				},
				{
					10,
					3000
				}
			}
		},
		{
			target_type = 2,
			desc = "神技高级铸造5次",
			goal_id = 17140,
			show_icon = "shenqi_zhuzao",
			day = 6,
			lev = 28,
			type_name = "实力提升",
			progress = {
				{
					cli_label = "evt_artifact_summon",
					target = 0,
					target_val = 5,
					param = {
						{
							"type",
							2
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					1,
					30000
				}
			}
		},
		{
			target_type = 2,
			desc = "神技高级铸造10次",
			goal_id = 17150,
			show_icon = "shenqi_zhuzao",
			day = 6,
			lev = 28,
			type_name = "实力提升",
			progress = {
				{
					cli_label = "evt_artifact_summon",
					target = 0,
					target_val = 10,
					param = {
						{
							"type",
							2
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					1,
					50000
				}
			}
		},
		{
			target_type = 2,
			desc = "神技高级铸造20次",
			goal_id = 17160,
			show_icon = "shenqi_zhuzao",
			day = 6,
			lev = 28,
			type_name = "实力提升",
			progress = {
				{
					cli_label = "evt_artifact_summon",
					target = 0,
					target_val = 20,
					param = {
						{
							"type",
							2
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10207,
					1
				}
			}
		},
		{
			target_type = 2,
			desc = "神技高级铸造30次",
			goal_id = 17170,
			show_icon = "shenqi_zhuzao",
			day = 6,
			lev = 28,
			type_name = "实力提升",
			progress = {
				{
					cli_label = "evt_artifact_summon",
					target = 0,
					target_val = 30,
					param = {
						{
							"type",
							2
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10207,
					1
				}
			}
		}
	},
	[5] = {
		{
			target_type = 1,
			desc = "通关冒险难度巨龙",
			goal_id = 16010,
			show_icon = "dragon",
			day = 5,
			lev = 28,
			type_name = "副本通关",
			progress = {
				{
					cli_label = "evt_dungeon_pass",
					target = 6,
					target_val = 1,
					param = {
						{
							"difficulty",
							3
						}
					}
				}
			},
			award1 = {
				{
					2,
					10
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 1,
			desc = "通关困难难度巨龙",
			goal_id = 16020,
			show_icon = "dragon",
			day = 5,
			lev = 28,
			type_name = "副本通关",
			progress = {
				{
					cli_label = "evt_dungeon_pass",
					target = 6,
					target_val = 1,
					param = {
						{
							"difficulty",
							4
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 1,
			desc = "通关王者难度巨龙",
			goal_id = 16030,
			show_icon = "dragon",
			day = 5,
			lev = 28,
			type_name = "副本通关",
			progress = {
				{
					cli_label = "evt_dungeon_pass",
					target = 6,
					target_val = 1,
					param = {
						{
							"difficulty",
							5
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1500
				}
			}
		},
		{
			target_type = 1,
			desc = "通关冒险难度凤凰",
			goal_id = 16040,
			show_icon = "titan",
			day = 5,
			lev = 28,
			type_name = "副本通关",
			progress = {
				{
					cli_label = "evt_dungeon_pass",
					target = 5,
					target_val = 1,
					param = {
						{
							"difficulty",
							3
						}
					}
				}
			},
			award1 = {
				{
					2,
					30
				},
				{
					10,
					1500
				}
			}
		},
		{
			target_type = 1,
			desc = "通关困难难度凤凰",
			goal_id = 16050,
			show_icon = "titan",
			day = 5,
			lev = 28,
			type_name = "副本通关",
			progress = {
				{
					cli_label = "evt_dungeon_pass",
					target = 5,
					target_val = 1,
					param = {
						{
							"difficulty",
							4
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 1,
			desc = "通关王者难度凤凰",
			goal_id = 16060,
			show_icon = "titan",
			day = 5,
			lev = 28,
			type_name = "副本通关",
			progress = {
				{
					cli_label = "evt_dungeon_pass",
					target = 5,
					target_val = 1,
					param = {
						{
							"difficulty",
							5
						}
					}
				}
			},
			award1 = {
				{
					2,
					50
				},
				{
					10,
					5000
				}
			}
		},
		{
			target_type = 2,
			desc = "参加12次天梯对决",
			goal_id = 16070,
			show_icon = "tianti",
			day = 5,
			lev = 28,
			type_name = "竞技挑战",
			progress = {
				{
					cli_label = "evt_sky_ladder_fight",
					target = 0,
					target_val = 12,
					param = {}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					5000
				}
			}
		},
		{
			target_type = 2,
			desc = "参加24次天梯对决",
			goal_id = 16071,
			show_icon = "tianti",
			day = 5,
			lev = 28,
			type_name = "竞技挑战",
			progress = {
				{
					cli_label = "evt_sky_ladder_fight",
					target = 0,
					target_val = 24,
					param = {}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					5000
				}
			}
		},
		{
			target_type = 2,
			desc = "参加3次众神战场",
			goal_id = 16080,
			show_icon = "zhongshen",
			day = 5,
			lev = 28,
			type_name = "竞技挑战",
			progress = {
				{
					cli_label = "evt_zs_war_fight",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					5000
				}
			}
		},
		{
			target_type = 2,
			desc = "参加5次众神战场",
			goal_id = 16081,
			show_icon = "zhongshen",
			day = 5,
			lev = 28,
			type_name = "竞技挑战",
			progress = {
				{
					cli_label = "evt_zs_war_fight",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					5000
				}
			}
		}
	},
	[4] = {
		{
			target_type = 1,
			desc = "击败大陆野怪20次",
			goal_id = 15010,
			show_icon = "zhuxiao",
			day = 4,
			lev = 17,
			type_name = "诸神小怪",
			progress = {
				{
					cli_label = "evt_combat_start",
					target = 0,
					target_val = 20,
					param = {
						{
							"world_unit_type",
							3
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 1,
			desc = "击败大陆野怪40次",
			goal_id = 15020,
			show_icon = "zhuxiao",
			day = 4,
			lev = 17,
			type_name = "诸神小怪",
			progress = {
				{
					cli_label = "evt_combat_start",
					target = 0,
					target_val = 40,
					param = {
						{
							"world_unit_type",
							3
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 1,
			desc = "击败大陆野怪60次",
			goal_id = 15030,
			show_icon = "zhuxiao",
			day = 4,
			lev = 17,
			type_name = "诸神小怪",
			progress = {
				{
					cli_label = "evt_combat_start",
					target = 0,
					target_val = 60,
					param = {
						{
							"world_unit_type",
							3
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 1,
			desc = "击败大陆野怪80次",
			goal_id = 15040,
			show_icon = "zhuxiao",
			day = 4,
			lev = 17,
			type_name = "诸神小怪",
			progress = {
				{
					cli_label = "evt_combat_start",
					target = 0,
					target_val = 80,
					param = {
						{
							"world_unit_type",
							3
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 1,
			desc = "击败大陆野怪100次",
			goal_id = 15050,
			show_icon = "zhuxiao",
			day = 4,
			lev = 17,
			type_name = "诸神小怪",
			progress = {
				{
					cli_label = "evt_combat_start",
					target = 0,
					target_val = 100,
					param = {
						{
							"world_unit_type",
							3
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 2,
			desc = "击败大陆boss1次",
			goal_id = 15060,
			show_icon = "zhuboss",
			day = 4,
			lev = 17,
			type_name = "诸神boss",
			progress = {
				{
					cli_label = "evt_combat_start",
					target = 0,
					target_val = 1,
					param = {
						{
							"world_unit_type",
							4
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 2,
			desc = "击败大陆boss3次",
			goal_id = 15070,
			show_icon = "zhuboss",
			day = 4,
			lev = 17,
			type_name = "诸神boss",
			progress = {
				{
					cli_label = "evt_combat_start",
					target = 0,
					target_val = 3,
					param = {
						{
							"world_unit_type",
							4
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 2,
			desc = "击败大陆boss6次",
			goal_id = 15080,
			show_icon = "zhuboss",
			day = 4,
			lev = 17,
			type_name = "诸神boss",
			progress = {
				{
					cli_label = "evt_combat_start",
					target = 0,
					target_val = 6,
					param = {
						{
							"world_unit_type",
							4
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 2,
			desc = "击败大陆boss9次",
			goal_id = 15090,
			show_icon = "zhuboss",
			day = 4,
			lev = 18,
			type_name = "诸神boss",
			progress = {
				{
					cli_label = "evt_combat_start",
					target = 0,
					target_val = 9,
					param = {
						{
							"world_unit_type",
							4
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 2,
			desc = "击败大陆boss15次",
			goal_id = 15100,
			show_icon = "zhuboss",
			day = 4,
			lev = 18,
			type_name = "诸神boss",
			progress = {
				{
					cli_label = "evt_combat_start",
					target = 0,
					target_val = 15,
					param = {
						{
							"world_unit_type",
							4
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 2,
			desc = "击败大陆boss25次",
			goal_id = 15110,
			show_icon = "zhuboss",
			day = 4,
			lev = 18,
			type_name = "诸神boss",
			progress = {
				{
					cli_label = "evt_combat_start",
					target = 0,
					target_val = 25,
					param = {
						{
							"world_unit_type",
							4
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		}
	},
	[3] = {
		{
			target_type = 1,
			desc = "装备洗练5次",
			goal_id = 14010,
			show_icon = "partner_jinjie",
			day = 3,
			lev = 1,
			type_name = "装备培养",
			progress = {
				{
					cli_label = "evt_eqm_wash",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10214,
					5
				}
			}
		},
		{
			target_type = 1,
			desc = "装备洗练10次",
			goal_id = 14030,
			show_icon = "partner_jinjie",
			day = 3,
			lev = 1,
			type_name = "装备培养",
			progress = {
				{
					cli_label = "evt_eqm_wash",
					target = 0,
					target_val = 10,
					param = {}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10214,
					5
				}
			}
		},
		{
			target_type = 1,
			desc = "装备洗练20次",
			goal_id = 14040,
			show_icon = "partner_jinjie",
			day = 3,
			lev = 1,
			type_name = "装备培养",
			progress = {
				{
					cli_label = "evt_eqm_wash",
					target = 0,
					target_val = 20,
					param = {}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10214,
					10
				}
			}
		},
		{
			target_type = 1,
			desc = "装备洗练30次",
			goal_id = 14050,
			show_icon = "partner_jinjie",
			day = 3,
			lev = 1,
			type_name = "装备培养",
			progress = {
				{
					cli_label = "evt_eqm_wash",
					target = 0,
					target_val = 30,
					param = {}
				}
			},
			award1 = {
				{
					2,
					50
				},
				{
					10214,
					10
				}
			}
		},
		{
			target_type = 1,
			desc = "装备精炼1次",
			goal_id = 14061,
			show_icon = "partner_zb",
			day = 3,
			lev = 28,
			type_name = "装备培养",
			progress = {
				{
					cli_label = "evt_eqm_refine",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10200,
					1
				}
			}
		},
		{
			target_type = 1,
			desc = "装备精炼3次",
			goal_id = 14062,
			show_icon = "partner_zb",
			day = 3,
			lev = 28,
			type_name = "装备培养",
			progress = {
				{
					cli_label = "evt_eqm_refine",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10200,
					1
				}
			}
		},
		{
			target_type = 1,
			desc = "制作1次光环",
			goal_id = 14065,
			show_icon = "yjs_halo",
			day = 3,
			lev = 28,
			type_name = "英雄培养",
			progress = {
				{
					cli_label = "evt_halo_compose",
					target = 0,
					target_val = 1,
					param = {}
				}
			},
			award1 = {
				{
					15002,
					4
				},
				{
					15010,
					2
				}
			}
		},
		{
			target_type = 1,
			desc = "光环精炼2次",
			goal_id = 14066,
			show_icon = "partner_jinjie",
			day = 3,
			lev = 28,
			type_name = "英雄培养",
			progress = {
				{
					cli_label = "evt_halo_refine",
					target = 0,
					target_val = 2,
					param = {}
				}
			},
			award1 = {
				{
					15002,
					2
				},
				{
					15010,
					1
				}
			}
		},
		{
			target_type = 2,
			desc = "通关异界裂缝3次",
			goal_id = 14070,
			show_icon = "yijie",
			day = 3,
			lev = 22,
			type_name = "异界裂缝",
			progress = {
				{
					cli_label = "evt_farplane_fight",
					target = 0,
					target_val = 3,
					param = {}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 2,
			desc = "通关异界裂缝6次",
			goal_id = 14080,
			show_icon = "yijie",
			day = 3,
			lev = 22,
			type_name = "异界裂缝",
			progress = {
				{
					cli_label = "evt_farplane_fight",
					target = 0,
					target_val = 6,
					param = {}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 2,
			desc = "通关异界裂缝9次",
			goal_id = 14090,
			show_icon = "yijie",
			day = 3,
			lev = 22,
			type_name = "异界裂缝",
			progress = {
				{
					cli_label = "evt_farplane_fight",
					target = 0,
					target_val = 9,
					param = {}
				}
			},
			award1 = {
				{
					2,
					40
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 2,
			desc = "通关异界裂缝12次",
			goal_id = 14100,
			show_icon = "yijie",
			day = 3,
			lev = 22,
			type_name = "异界裂缝",
			progress = {
				{
					cli_label = "evt_farplane_fight",
					target = 0,
					target_val = 12,
					param = {}
				}
			},
			award1 = {
				{
					2,
					40
				},
				{
					10,
					1000
				}
			}
		}
	},
	[2] = {
		{
			target_type = 1,
			desc = "1个英雄达到紫色+3",
			goal_id = 13010,
			show_icon = "partner_jinjie",
			day = 2,
			lev = 1,
			type_name = "英雄阶级",
			progress = {
				{
					cli_label = "evt_partner",
					target = 0,
					target_val = 1,
					param = {
						{
							"quality",
							9
						}
					}
				}
			},
			award1 = {
				{
					30111,
					2
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 1,
			desc = "3个英雄达到紫色+3",
			goal_id = 13020,
			show_icon = "partner_jinjie",
			day = 2,
			lev = 1,
			type_name = "英雄阶级",
			progress = {
				{
					cli_label = "evt_partner",
					target = 0,
					target_val = 3,
					param = {
						{
							"quality",
							9
						}
					}
				}
			},
			award1 = {
				{
					30111,
					3
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 1,
			desc = "5个英雄达到紫色+3",
			goal_id = 13030,
			show_icon = "partner_jinjie",
			day = 2,
			lev = 1,
			type_name = "英雄阶级",
			progress = {
				{
					cli_label = "evt_partner",
					target = 0,
					target_val = 3,
					param = {
						{
							"quality",
							9
						}
					}
				}
			},
			award1 = {
				{
					30110,
					2
				},
				{
					10,
					1000
				}
			}
		},
		{
			target_type = 1,
			desc = "1个英雄达到橙色",
			goal_id = 13040,
			show_icon = "partner_jinjie",
			day = 2,
			lev = 1,
			type_name = "英雄阶级",
			progress = {
				{
					cli_label = "evt_partner",
					target = 0,
					target_val = 1,
					param = {
						{
							"quality",
							10
						}
					}
				}
			},
			award1 = {
				{
					30110,
					3
				},
				{
					10,
					2000
				}
			}
		},
		{
			target_type = 1,
			desc = "3个英雄达到橙色",
			goal_id = 13050,
			show_icon = "partner_jinjie",
			day = 2,
			lev = 1,
			type_name = "英雄阶级",
			progress = {
				{
					cli_label = "evt_partner",
					target = 0,
					target_val = 3,
					param = {
						{
							"quality",
							10
						}
					}
				}
			},
			award1 = {
				{
					30110,
					3
				},
				{
					10,
					2000
				}
			}
		},
		{
			target_type = 1,
			desc = "5个英雄达到橙色",
			goal_id = 13060,
			show_icon = "partner_jinjie",
			day = 2,
			lev = 16,
			type_name = "英雄阶级",
			progress = {
				{
					cli_label = "evt_partner",
					target = 0,
					target_val = 5,
					param = {
						{
							"quality",
							10
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10302,
					5
				}
			}
		},
		{
			target_type = 2,
			desc = "拥有5个3星",
			goal_id = 13070,
			show_icon = "partner_xingji",
			day = 2,
			lev = 16,
			type_name = "英雄培养",
			progress = {
				{
					cli_label = "evt_partner",
					target = 0,
					target_val = 5,
					param = {
						{
							"star",
							3
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10302,
					5
				}
			}
		},
		{
			target_type = 2,
			desc = "拥有1个4星",
			goal_id = 13080,
			show_icon = "partner_xingji",
			day = 2,
			lev = 16,
			type_name = "英雄培养",
			progress = {
				{
					cli_label = "evt_partner",
					target = 0,
					target_val = 1,
					param = {
						{
							"star",
							4
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10302,
					5
				}
			}
		},
		{
			target_type = 2,
			desc = "拥有2个4星",
			goal_id = 13090,
			show_icon = "partner_xingji",
			day = 2,
			lev = 16,
			type_name = "英雄培养",
			progress = {
				{
					cli_label = "evt_partner",
					target = 0,
					target_val = 2,
					param = {
						{
							"star",
							4
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					10200,
					1
				}
			}
		},
		{
			target_type = 2,
			desc = "拥有3个4星",
			goal_id = 13100,
			show_icon = "partner_xingji",
			day = 2,
			lev = 16,
			type_name = "英雄培养",
			progress = {
				{
					cli_label = "evt_partner",
					target = 0,
					target_val = 3,
					param = {
						{
							"star",
							4
						}
					}
				}
			},
			award1 = {
				{
					2,
					30
				},
				{
					10200,
					2
				}
			}
		},
		{
			target_type = 2,
			desc = "拥有1个5星",
			goal_id = 13110,
			show_icon = "partner_xingji",
			day = 2,
			lev = 16,
			type_name = "英雄培养",
			progress = {
				{
					cli_label = "evt_partner",
					target = 0,
					target_val = 1,
					param = {
						{
							"star",
							5
						}
					}
				}
			},
			award1 = {
				{
					2,
					50
				},
				{
					10200,
					5
				}
			}
		},
		{
			target_type = 2,
			desc = "拥有1个6星",
			goal_id = 13120,
			show_icon = "partner_xingji",
			day = 2,
			lev = 16,
			type_name = "英雄培养",
			progress = {
				{
					cli_label = "evt_partner",
					target = 0,
					target_val = 1,
					param = {
						{
							"star",
							6
						}
					}
				}
			},
			award1 = {
				{
					2,
					100
				},
				{
					10201,
					1
				}
			}
		},
		{
			target_type = 2,
			desc = "1个英雄达到觉醒+1",
			goal_id = 13130,
			show_icon = "partner_juexing",
			day = 2,
			lev = 28,
			type_name = "英雄培养",
			progress = {
				{
					cli_label = "evt_partner",
					target = 0,
					target_val = 1,
					param = {
						{
							"awaken",
							1
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					15000,
					5
				}
			}
		},
		{
			target_type = 2,
			desc = "3个英雄达到觉醒+1",
			goal_id = 13140,
			show_icon = "partner_juexing",
			day = 2,
			lev = 28,
			type_name = "英雄培养",
			progress = {
				{
					cli_label = "evt_partner",
					target = 0,
					target_val = 3,
					param = {
						{
							"awaken",
							1
						}
					}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					15000,
					10
				}
			}
		},
		{
			target_type = 2,
			desc = "英雄神技强化5次",
			goal_id = 13180,
			show_icon = "shenqi",
			day = 2,
			lev = 28,
			type_name = "英雄培养",
			progress = {
				{
					cli_label = "evt_artifact_enhance",
					target = 0,
					target_val = 5,
					param = {}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					15041,
					1
				}
			}
		},
		{
			target_type = 2,
			desc = "英雄神技强化10次",
			goal_id = 13181,
			show_icon = "shenqi",
			day = 2,
			lev = 28,
			type_name = "英雄培养",
			progress = {
				{
					cli_label = "evt_artifact_enhance",
					target = 0,
					target_val = 10,
					param = {}
				}
			},
			award1 = {
				{
					2,
					20
				},
				{
					15041,
					1
				}
			}
		}
	}
}
Config.DayGoalsSecondData.data_halfdiscount_length = 7
Config.DayGoalsSecondData.data_halfdiscount = {
	{
		icon = "action_gift_4",
		price2 = 900,
		price1 = 1800,
		award1_name = "符石礼包",
		day = 1,
		award1 = {
			{
				10212,
				1
			},
			{
				10211,
				1
			},
			{
				10401,
				1
			}
		}
	},
	{
		icon = "action_gift_12",
		price2 = 500,
		price1 = 1000,
		award1_name = "觉醒礼包",
		day = 2,
		award1 = {
			{
				15000,
				100
			}
		}
	},
	{
		icon = "action_gift_14",
		price2 = 600,
		price1 = 1200,
		award1_name = "洗练精炼礼包",
		day = 3,
		award1 = {
			{
				10214,
				30
			},
			{
				80005,
				1
			}
		}
	},
	{
		icon = "action_gift_13",
		price2 = 1000,
		price1 = 2000,
		award1_name = "光环礼包",
		day = 4,
		award1 = {
			{
				10466,
				1
			},
			{
				15010,
				2
			},
			{
				15002,
				4
			}
		}
	},
	{
		icon = "action_gift_11",
		price2 = 750,
		price1 = 1500,
		award1_name = "神技铸造礼包",
		day = 5,
		award1 = {
			{
				10207,
				10
			}
		}
	},
	{
		icon = "action_gift_10",
		price2 = 1600,
		price1 = 3200,
		award1_name = "随机三星神技礼包",
		day = 6,
		award1 = {
			{
				10464,
				1
			},
			{
				15042,
				10
			}
		}
	},
	{
		icon = "action_gift_15",
		price2 = 1200,
		price1 = 2400,
		award1_name = "友好值积分礼包",
		day = 7,
		award1 = {
			{
				13,
				4800
			}
		}
	}
}
Config.DayGoalsSecondData.data_all_target_length = 1
Config.DayGoalsSecondData.data_all_target = {
	[88] = {
		id = 88,
		award = {
			{
				20084,
				80
			}
		}
	}
}
