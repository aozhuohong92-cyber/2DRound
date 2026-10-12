# 航海冒险客户端还原

项目根目录：`/Users/mountainwalkeralliance/Documents/code/海贼王`

## 目录

- `outputs/lua-restored-paths/`：按已恢复模块路径整理的 Lua 代码。
- `outputs/lua-decompiled/`：反编译 Lua；部分语义仍需修复。
- `outputs/lua-bytecode/`、`lua-disassembly/`、`lua-partial/`：解码字节码、反汇编与未完整恢复材料。
- `outputs/android-decompiled/`、`android-resources/`：Java 反编译和 Android 资源。
- `outputs/apk-extracted/`：解包后的原始资源、DEX 与原生库。
- `outputs/native-analysis/`、`recovery-tools/`：原生分析和资源恢复工具。
- `outputs/offline-client/`：当前真机离线客户端工程和 APK。
- `outputs/video-review/`：参考录屏分析和抽帧。
- `outputs/新窗口接续.md`：开发接续记录。
- `work/`：中间文件、构建缓存、解包材料、MCP 安装及 Python 环境。
- `NewProject/`：迁移前已存在的 Cocos Creator 项目，保持原样。

## 构建

在项目根目录运行：

```sh
python3 outputs/offline-client/build.py
```

产物：`outputs/offline-client/offline-client.apk`。使用独立包名 `org.local.onepiece.offline`，不覆盖原游戏。

前轮已在真机验证自定义 Lua 入口和原始背景。第一阶段角色/CSB/字体集成及离线基础框架已完成本地检查，当前 APK 未做设备验证；完整新手流程仍在开发。原生库与 DEX 复用原包，尚无完整原生源码及服务端。

## 角色与验收入口

- [角色资源目录](outputs/角色资源/README.md)
- [路飞：动作与技能](outputs/角色资源/路飞/README.md)
- [第一阶段真机验收](outputs/offline-client/device-acceptance/验收报告.md)

最新：第一阶段资源和离线框架已通过真机基础验收，仍需处理顶部黑边；完整技能和新手流程尚未完成。

最新开发版：[路飞技能演出与长屏调整](outputs/offline-client/技能演出开发记录.md)，已通过本地检查，尚未设备复测。
