@echo off
echo "正在执行 auto-convert.bat..." >> conversion.log

:: 检查 `mihomo.exe` 是否存在
if not exist "config\mihomo.exe" (
    echo "⚠️ 错误：未找到 mihomo.exe！" >> conversion.log
    exit 255
)

:: 测试 `mihomo.exe` 是否能运行
echo "测试 mihomo.exe..." >> conversion.log
config\mihomo.exe --help >> conversion.log 2>&1
if errorlevel 1 (
    echo "⚠️ 错误：mihomo.exe 无法运行！" >> conversion.log
    exit 255
)

:: 开始转换
echo "执行规则转换..." >> conversion.log
config\mihomo.exe convert-ruleset domain yaml rules\input.yaml rules\mrs\output.mrs >> conversion.log 2>&1

:: 检查是否生成 `.mrs` 文件
if not exist "rules\mrs\output.mrs" (
    echo "⚠️ 错误：未生成 .mrs 文件！" >> conversion.log
    exit 255
)

echo "✅ 规则转换成功！" >> conversion.log
