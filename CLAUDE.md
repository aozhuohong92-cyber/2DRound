# 2DRound 开发说明

## 项目定位

这是一个客户端还原、技术学习和离线原型项目。仓库中的部分源码和素材来自原客户端的反编译、解包与资源恢复；请先确认仓库所有者拥有相应授权，并始终遵守适用法律和第三方许可。

## 工作边界

- 只修改仓库中已经存在的源码、配置、文档和素材。
- 不要重新解包 APK、重新反编译、绕过保护或连接原游戏服务端。
- 不要为了开发而重新提取原游戏资源；优先使用 `assets/`、`src/`、`docs/reference-video/` 和 `outputs/` 中已有文件。
- 保持独立包名 `org.local.onepiece.offline`，不要覆盖原游戏。
- 保留 `README.md` 中的来源、授权和目录说明，不要删除或伪装项目来源。

## 建议入口

- `README.md`：项目结构与构建入口。
- `outputs/offline-client/`：当前可运行的离线客户端工程。
- `outputs/offline-client/实施任务.md`：当前开发任务。
- `outputs/offline-client/技能演出开发记录.md`：最近完成的技能演出工作。
- `outputs/新窗口接续.md`：整体开发接续记录。
- `assets/characters/`：角色动作、技能和音频素材。
- `assets/ui/`：界面和主城导航素材。
- `docs/reference-video/`：参考视频分析与抽帧。

## 开发方式

- 先阅读相关 README、任务记录和参考视频资料，再检查实现差异。
- 每轮先给出简短计划，然后直接修改代码、运行可用的本地验证并说明结果。
- 缺素材或配置时先记录缺口，不要重新从 APK 提取。
- 构建命令：`python3 outputs/offline-client/build.py`。
