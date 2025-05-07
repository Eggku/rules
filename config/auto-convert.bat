@echo off
:: 文件名: auto-convert.bat
:: 功能: 自动转换 .yaml 规则至 .mrs 并存储到 `rules\mrs` 目录

setlocal enabledelayedexpansion

:: 设置路径
set "RULES_DIR=%GITHUB_WORKSPACE%\rules"
set "OUTPUT_DIR=%RULES_DIR%\mrs"
set "LOG_FILE=%GITHUB_WORKSPACE%\conversion.log"
set "MIHOMO_EXE=%GITHUB_WORKSPACE%\config\mihomo.exe"

:: 确保 `.mrs` 目录存在
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

echo 转换日志 > "%LOG_FILE%"
echo 开始时间: %date% %time% >> "%LOG_FILE%"
echo ==============================

:: 确保 `mihomo.exe` 可以运行
config\mihomo.exe -v >> "%LOG_FILE%" 2>&1
if errorlevel 1 (
    echo "⚠️ 错误：mihomo.exe 无法运行！" >> "%LOG_FILE%"
    exit 255
)

:: 遍历所有 `.yaml` 文件
for /r "%RULES_DIR%" %%f in (*.yaml) do (
    set "filename=%%~nf"
    set "out_file=%OUTPUT_DIR%\!filename!.mrs"

    :: 执行转换
    echo "正在转换 %%~nxf ..." >> "%LOG_FILE%"
    config\mihomo.exe -f "%%f" convert-ruleset domain yaml "%%f" "!out_file!" >> "%LOG_FILE%" 2>&1

    :: 检测错误
    if errorlevel 1 (
        echo "[失败] %%~nxf" >> "%LOG_FILE%"
        exit 1
    ) else (
        echo "[成功] %%~nxf" >> "%LOG_FILE%"
    )
    echo ------------------------------
)

:: 显示生成的 `.mrs` 文件列表
echo "生成的文件列表：" >> "%LOG_FILE%"
dir /b "%OUTPUT_DIR%" >> "%LOG_FILE%"
echo "转换完成！" >> "%LOG_FILE%"
