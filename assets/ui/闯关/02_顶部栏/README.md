# 02 顶部栏

| 内容 | 状态 | 来源 |
|---|---|---|
| 头像容器 head_container | 近似 | mainui_view.csb/top_container；头像图为 CSB 示例 |
| 昵称 name_label / 等级 lev_label | 近似 | 参考图示例值：流年灬贝克 / 124 |
| 战力 fight_label | 近似 | 参考图示例值：1643 |
| 金币/钻石/第三货币 wealth_label_1..3 | 近似 | 参考图示例值：8000 / 3601 / 181 |
| 经验条 exp_bar | 近似 | mainui_view.csb |

- 复用主城同一个 mainui_view.csb 与 mainui/common 图集，不在此重复拷贝：见 ../../主城/底部导航/共用原资源/。
- 数值来自 src/offline/drama_reference.lua，仅显示，不写存档。
- 闯关页隐藏了活动/红包/提示等主城专属容器。
