# 模拟器验收与启动方式

## 模拟器黑屏解决与复验通过（2026-10-12）

同一 APK 改用 `-gpu swiftshader -no-snapshot` 冷启动后正常显示；未修改业务代码、APK 或 AVD 的持久配置。自动图形后端/快照兼容性是疑点，尚未单独区分两者。以后关闭该 AVD 后运行 `./outputs/offline-client/start-emulator.sh`，使用已验证的启动组合；脚本保留应用数据，不清数据。

Android 11、1080×2280 模拟器上，预览标题、未开放说明、七槽底栏与挑战提示均已截图核对。进入 5 次、返回 5 次、挑战提示 1 次；Lua/UI 与 OpenGL 错误均为 0，未生成正式存档。证据见 `stage3-emulator/verification.json`；先前黑屏记录保留为 `verification-black-screen.json`。C/D 仍未开始。
