# 航海冒险：反编译交付入口

已恢复 2,135 个非空 Lua 脚本及 1 个空脚本，2,136 个文件全部通过语法检查；另外 10 个保留字节码与完整指令转储，等待人工恢复。Android 层导出 2,029 个 Java 文件，其中 59 个文件带反编译警告。

## 先看这些

- [框架、技术、资源与恢复边界](反编译分析报告.md)
- [复刻实施计划与优先任务](复刻实施计划.md)
- [你需要录制的内容](试玩录屏清单.md)
- [Lua 代码索引](代码索引.md)
- [未完整恢复的 10 个脚本](待恢复代码清单.md)
- 代码与分析材料压缩包默认不入库，避免重复提交已纳入 Git 的源码和资料

## 直接打开代码

- [Lua 启动入口 main.lua](lua-restored-paths/main.lua)
- [屏幕适配与框架配置](lua-restored-paths/config_init.lua)
- [游戏配置](lua-restored-paths/config.lua)
- [资源与版本更新](lua-restored-paths/file_update.lua)
- [模块装载表](lua-restored-paths/mmtZgQAwkKz4pG9sW05wVoadNxAlGKg9/module_include.lua)
- [网络协议字段定义](lua-restored-paths/mmtZgQAwkKz4pG9sW05wVoadNxAlGKg9/net/proto_mate.lua)
- [战斗控制器 BattleController](../src/client/lua/CA695FEA1FF5802A.lua)
- [Android 与 Lua 的桥接接口](../src/client/java/sources/com/game/core/GameHelper.java)
- [可读 AndroidManifest](android-resources/resources/AndroidManifest.xml)

## 资源与证据

- 完整 APK 解包目录 `apk-extracted/` 保留在本地，不纳入 Git
- [完整资源索引](asset-catalog.json)
- [3,619 条经过哈希匹配的资源路径](resource-name-map.json)
- [逐 Lua 文件的最终恢复状态](recovery-status.json)
- [语法与字节码验证结果](verification-summary.json)
- [解码、反编译与验证工具说明](recovery-tools/README.md)

生成的 ZIP、完整解包目录和大型素材不移交 Git；仓库保留可维护的源码、报告和整理后的项目资源。

这些材料不是可直接构建运行的原始工程。语法通过不代表玩法等价；完整服务端源码、原始 C++ 工程和构建配置未从 APK 恢复。先按计划验证启动、资源加载和单场战斗。
