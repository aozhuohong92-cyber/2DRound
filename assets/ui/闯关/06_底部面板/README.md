# 06 底部面板

| 内容 | 状态 | 来源 |
|---|---|---|
| 面板 battle_button_list.csb | 已确认 | SI4YKjtXKGfkpPZhfeZcJEE6b4gGZbox/battle/battle_button_list.csb（真机已加载） |
| 标题 title_pass「伟大航路3」/ 描述《ONE PIECE》 | 近似 | title_pass 节点；描述为代码内创建，覆盖显示 |
| 详情 / 快速挂机 / 奖励栏框 / WANTED 板 | 近似 | CSB 内节点，P0 曾隐藏，参考模式重新显示，位置未设备验证 |
| 挑战BOSS 按钮 | 已确认 | guildsign_battle_boss_btn；仅入口门控 + 固定回放 |
| 奖励 4 格图标 | 缺资源 | resource/item/{3,7,10001,29997}.png；3.png（钻石）已接入，其余 3 个缺 |
| BOSS 悬赏人像 | 缺资源 | resource/headicon/b<head_icon>.jpg |
| 「我要变强」encounter_btn | 占位 | 参考图无此项，保持隐藏 |

- 面板位置 panel:setPosition(width/2, -33)，层级 5，低于底栏 10。
- 奖励 show_items 前 4 项：钻石、远航情报、突破卡、3星随机碎片。
