# 航海冒险：反编译交付入口

已恢复 2,135 个非空 Lua 脚本及 1 个空脚本，2,136 个文件全部通过语法检查；另外 10 个保留字节码与完整指令转储，等待人工恢复。Android 层导出 2,029 个 Java 文件，其中 59 个文件带反编译警告。

## 先看这些

- [框架、技术、资源与恢复边界](/Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/反编译分析报告.md)
- [复刻实施计划与优先任务](/Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/复刻实施计划.md)
- [你需要录制的内容](/Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/试玩录屏清单.md)
- [Lua 代码索引](/Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/代码索引.md)
- [未完整恢复的 10 个脚本](/Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/待恢复代码清单.md)
- [下载代码与分析材料压缩包](/Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/反编译代码与分析材料.zip)

## 直接打开代码

- [Lua 启动入口 main.lua](/Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/lua-restored-paths/main.lua)
- [屏幕适配与框架配置](/Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/lua-restored-paths/config_init.lua)
- [游戏配置](/Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/lua-restored-paths/config.lua)
- [资源与版本更新](/Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/lua-restored-paths/file_update.lua)
- [模块装载表](/Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/lua-restored-paths/mmtZgQAwkKz4pG9sW05wVoadNxAlGKg9/module_include.lua)
- [网络协议字段定义](/Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/lua-restored-paths/mmtZgQAwkKz4pG9sW05wVoadNxAlGKg9/net/proto_mate.lua)
- [战斗控制器 BattleController](/Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/lua-decompiled/CA695FEA1FF5802A.lua)
- [Android 与 Lua 的桥接接口](/Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/android-decompiled/sources/com/game/core/GameHelper.java)
- [可读 AndroidManifest](/Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/android-resources/resources/AndroidManifest.xml)

## 资源与证据

- [完整 APK 解包目录：原始素材、DEX、原生库](/Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/apk-extracted)
- [完整资源索引](/Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/asset-catalog.json)
- [3,619 条经过哈希匹配的资源路径](/Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/resource-name-map.json)
- [逐 Lua 文件的最终恢复状态](/Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/recovery-status.json)
- [语法与字节码验证结果](/Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/verification-summary.json)
- [解码、反编译与验证工具说明](/Users/mountainwalkeralliance/Documents/Codex/2026-10-11/ba/outputs/recovery-tools/README.md)

压缩包包含代码、字节码、路径索引、报告、工具和原生分析证据；体积较大的原始美术音频素材放在完整解包目录中，没有重复塞进代码压缩包。

这些材料不是可直接构建运行的原始工程。语法通过不代表玩法等价；完整服务端源码、原始 C++ 工程和构建配置未从 APK 恢复。先按计划验证启动、资源加载和单场战斗。
