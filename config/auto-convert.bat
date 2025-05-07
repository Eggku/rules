@echo off
:: 文件名: auto-convert.bat
:: 功能: 自动转换 `.yaml` 规则至 `.mrs`，并存储到 `rules\mrs` 目录

setlocal enabledelayedexpansion

:: 设置路径
set "RULES_DIR=rules"
set "OUTPUT_DIR=%RULES_DIR%\mrs"
set "LOG_FILE=conversion.log"

:: 创建mrs目录（如果不存在）
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

echo 转换日志 > "%LOG_FILE%"
echo 开始时间: %date% %time% >> "%LOG_FILE%"
echo ==============================

:: 遍历所有 `.yaml` 文件
for /r "%RULES_DIR%" %%f in (*.yaml) do (
    set "ip_found=0"

    :: 检查是否为 IP 规则（排除注释干扰）
    findstr /r /c:"^  - [0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*/[0-9][0-9]*" "%%f" >nul
    if !errorlevel! equ 0 set ip_found=1

    :: 生成输出文件路径
    set "filename=%%~nf"
    set "out_file=%OUTPUT_DIR%\!filename!.mrs"

    :: 执行转换
    if !ip_found! equ 1 (
        echo [IP规则] 转换: %%~nxf → \mrs\!filename!.mrs
        mihomo convert-ruleset ipcidr yaml "%%f" "!out_file!"
    ) else (
        echo [域名规则] 转换: %%~nxf → \mrs\!filename!.mrs
        mihomo convert-ruleset domain yaml "%%f" "!out_file!"
    )

    :: 检测错误
    if errorlevel 1 (
        echo [失败] %%~nxf >> "%LOG_FILE%"
        echo █ 文件结构问题检测 █
        echo 问题文件: %%~nxf
        echo 快速验证:
        echo mihomo convert-ruleset test yaml "%%f"
        timeout /t 5
    ) else (
        echo [成功] %%~nxf >> "%LOG_FILE%"
    )
    echo ------------------------------
)

:: 显示生成的文件列表
echo 生成文件列表: >> "%LOG_FILE%"
dir /b "%OUTPUT_DIR%" >> "%LOG_FILE%"

echo 转换完成！
echo 结束时间: %date% %time% >> "%LOG_FILE%"
start "" "%OUTPUT_DIR%"
notepad "%LOG_FILE%"
