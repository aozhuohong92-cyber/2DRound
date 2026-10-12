# 航海冒险客户端还原

> 来源与授权说明：本仓库用于本地授权范围内的客户端还原、技术学习和离线原型开发。`src/client/lua/`、`src/client/java/`、`assets/`、`docs/reference-video/` 中的部分内容来自原客户端的反编译、解包和资源恢复；请仅在确有相应授权时使用、修改或分发。
>
> 目录重组：2026-10-12 将原 `outputs/lua-decompiled/`、`outputs/android-decompiled/`、`outputs/界面资源/`、`outputs/角色资源/`、`outputs/video-review/` 分别整理到按用途命名的目录，并同步更新脚本、索引、清单和符号链接。

## 目录

### 客户端源码

- `src/client/lua/`：反编译 Lua 主交付代码；部分语义仍需修复。
- `src/client/java/`：Android Java 反编译代码。
- `outputs/lua-restored-paths/`：按已恢复模块路径整理的 Lua 代码。
- `outputs/lua-bytecode/`、`outputs/lua-disassembly/`、`outputs/lua-partial/`：解码字节码、反汇编与未完整恢复材料。
- `outputs/offline-client/`：当前真机离线客户端工程和构建脚本。

### 素材、参考与证据

- `assets/ui/`：整理后的界面资源。
- `assets/characters/`：角色动作、技能、特效、音频及资源说明。
- `docs/reference-video/`：参考录屏分析、抽帧和模块映射。
- `outputs/native-analysis/`、`outputs/recovery-tools/`：原生分析和资源恢复工具。
- `outputs/新窗口接续.md`：开发接续记录。

### 本地材料

- `outputs/apk-extracted/`：解包后的原始资源、DEX 与原生库；体积较大且不纳入 Git。
- `work/`：中间文件、构建缓存、解包材料、MCP 安装及 Python 环境；不纳入 Git。
- `NewProject/`：迁移前已存在的 Cocos Creator 项目，保持原样。

## 构建

在项目根目录运行：

```sh
python3 outputs/offline-client/build.py
```

产物：`outputs/offline-client/offline-client.apk`。使用独立包名 `org.local.onepiece.offline`，不覆盖原游戏。

前轮已在真机验证自定义 Lua 入口和原始背景。第一阶段角色、CSB、字体集成及离线基础框架已完成本地检查；完整新手流程仍在开发。原生库与 DEX 复用原包，尚无完整原生源码及服务端。

## 角色与验收入口

- [角色资源目录](assets/characters/README.md)
- [路飞：动作与技能](assets/characters/路飞/README.md)
- [第一阶段真机验收](outputs/offline-client/device-acceptance/验收报告.md)
- [路飞技能演出与长屏调整](outputs/offline-client/技能演出开发记录.md)

Git 仓库不包含 `work/`、`outputs/apk-extracted/`、APK、模型及大型构建产物，以保持仓库可克隆并符合 GitHub 文件大小限制。
