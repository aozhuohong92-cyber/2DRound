# 恢复工具说明

这些是本次分析使用/重建的工具，不是原游戏的开发工程。

## 解码

`recover_lua.py` 和 `decode.c` 针对此次 APK，使用已经从其原生加载逻辑确认的参数。输入是解压后的 APK 目录，输出为标准 LuaJIT 字节码。需要 Python 3 和 clang。

```sh
python3 recover_lua.py /path/to/apk-extracted /path/to/bytecode-output
```

工具会检查 LuaJIT 文件头，不执行游戏逻辑，不访问游戏服务器。其他版本 APK 的参数可能不同，不保证适用。

## 反编译

本目录 `luajit-decompiler/` 是 LJD 源码及本次 writer 修正，保留上游许可证。单文件示例：

```sh
python3 luajit-decompiler/main.py -f /path/to/input.luac -o /path/to/output.lua
```

必须结合退出码、文件是否完整、LuaJIT 语法检查和指令比较判断结果。`-c` 可生成容错输出，但不表示恢复成功。

`writer-fixes.patch` 保存了相对下载版本的变更：重复 AST 参数的逐位置输出、匿名函数被调用时的括号、语句结尾分隔、保留早返回后的不可达字节码所需的词法块。

## 语法检查

使用 LuaJIT 运行 `check_syntax.lua`，从标准输入逐行读取文件路径。脚本只调用 `loadfile`，不调用加载出的函数，因此不运行游戏内容。

## 文件名恢复

`resource_hash.py` 是从该 APK 重建的资源名哈希。`main.luac` 可得到 `D6D87D9149AFCAB5`；对每条候选路径必须匹配到真实包内文件后才算恢复成功。

`restore_names_analysis.py`、`build_index_analysis.py` 是分析过程脚本，预期从包含 `outputs/` 的原工作目录启动。它们用于生成路径映射/索引，最终结果已经随交付提供。

`native-analysis/hash-emulation-proof.py` 是分析取证脚本，依赖原工作目录的 unicorn/pyelftools 和 ELF；日常解码不需要运行它。
