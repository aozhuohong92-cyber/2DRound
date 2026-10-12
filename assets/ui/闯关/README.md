# 闯关界面资源归档（第一版入口与返回）

本目录只归档当前已经接入并在真机加载成功的闯关资源。第一版范围是：
主城中央草帽骷髅进入闯关预览，以及点击底部“主城”返回；不包含挑战、
战斗演出、结算、奖励或正式进度。

## 已确认默认画面

原代码不是先打开章节地图弹窗。调用链为：

1. `main_ui_view.lua` 中央槽位调用 `requestOpenBattleRelevanceWindow(Darma)`。
2. `mainui_controller.lua` 发送 `send20060(Darma)`。
3. `battle_controller.lua:handle20060` 收到 Darma 后调用
   `openBattleView(true)`。
4. `BattleController:createMap` 创建 `BattleSceneNewView`。
5. `BattleSceneNewView:createHorizontalMap` 对 Darma 加载 `m_bg`、`map_bg`，
   并调用 `BattleDramaController:openBattleDramaUI`。
6. `battle_drama_top_view.lua` 加载 `battledrama` 图集和
   `battle/battle_button_list`，在战斗背景上创建关卡、挑战及奖励区域。

首章 `Config.DungeonData.data_drama_world_info[1][1]` 的 `map_id=10008`；
离线预览使用首关记录 `dun_id=10010`、`next_id=10020`。这些值只写入
`src/offline/drama_fixture.lua`，不写入正常存档。

## 分类

| 分类 | 资源 | 用途 |
|---|---|---|
| 闯关主界面/背景 | `resource/bigbg/battle_bg/10008/m_bg.jpg` | 远层森林背景，原坐标 y=736 |
| 闯关主界面/背景 | `resource/bigbg/battle_bg/10008/map_bg.png` | 近层森林背景，原坐标 y=40 |
| 闯关主界面/关键按钮 | `SI4YKjtXKGfkpPZhfeZcJEE6b4gGZbox/battle/battle_button_list.csb` | 挑战、奖励、详情等底部面板 |
| 闯关主界面/关键按钮 | `resource/battledrama/battledrama.plist` / `.png` | 底部面板及关卡 UI 帧 |
| 闯关主界面/预留战斗UI | `resource/battle/battle.plist` / `.png` | 后续战斗视图所需图集，本轮仅随包 |
| 闯关主界面/装饰背景 | `resource/bigbg/pattern/pattern_3.png` | 原顶部界面资源；本轮顶部暂不处理 |
| 闯关主界面/复用底栏 | `mainui_view.csb` + `mainui.plist` / `.png` | 保持确认版本的七个底部图标不变 |

完整逻辑路径、原文件、包内路径、SHA256 和依赖见
`资源清单.json`。资源仍以原加密字节复制，不转换成编辑器预览图。

## 本轮代码映射

| 文件 | 作用 |
|---|---|
| `outputs/offline-client/src/offline/drama_resources.lua` | 10008 背景、CSB、plist 路径 |
| `outputs/offline-client/src/offline/drama_fixture.lua` | 明确标记的首关离线预览数据 |
| `outputs/offline-client/src/offline/drama_scene.lua` | 背景层级、横向重复和原按钮 CSB |
| `outputs/offline-client/src/offline/main_city.lua` | 中央导航回调；可复用原底栏、隐藏主城地图/顶部 |
| `outputs/offline-client/src/offline/route.lua` | 阻止重复点击和重入建场景 |
| `outputs/offline-client/src/main.lua` | 主城 ↔ 闯关场景调度 |

## 待确认

- 原顶部头像、货币和活动信息栏未实现。
- 章节地图弹窗未实现；原默认入口已核实为战斗场景，不是该弹窗。
- 挑战按钮不进入战斗，不发送网络消息，不改存档，不发奖励。
- 原地图名称弹出动画和右上“退出”键未逐项还原。
- 中央图标继续使用已验收的 `action1`；本轮没有切换 `action2`。
