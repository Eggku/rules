@echo off
setlocal enabledelayedexpansion

:: 明确工作目录
cd /d %~dp0
echo 当前目录：%cd%

:: 设置路径变量
set "RULES_DIR=%GITHUB_WORKSPACE%\rules"
set "OUTPUT_DIR=%RULES_DIR%\mrs"
set "LOG_FILE=%GITHUB_WORKSPACE%\conversion.log"
set "MIHOMO_EXE=%GITHUB_WORKSPACE%\config\mihomo.exe"

:: 创建mrs目录（如果不存在）
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

echo 转换日志 > "%LOG_FILE%"
echo 开始时间: %date% %time% >> "%LOG_FILE%"
echo ============================== >> "%LOG_FILE%"

:: 遍历所有 .yaml 文件
for /r "%RULES_DIR%" %%f in (*.yaml) do (
    set "ip_found=0"
    call :check_ip_rule "%%f"
    set "filename=%%~nf"
    set "out_file=%OUTPUT_DIR%\!filename!.mrs"

    echo 正在转换 %%~nxf >> "%LOG_FILE%"
    if !ip_found! equ 1 (
        "%MIHOMO_EXE%" convert-ruleset ipcidr yaml "%%f" "!out_file!"
    ) else (
        "%MIHOMO_EXE%" convert-ruleset domain yaml "%%f" "!out_file!"
    )

    if errorlevel 1 (
        echo [失败] %%~nxf >> "%LOG_FILE%"
        exit /b 1
    ) else (
        echo [成功] %%~nxf >> "%LOG_FILE%"
    )
    echo ------------------------------ >> "%LOG_FILE%"
)

:: 显示生成的文件列表
dir /b "%OUTPUT_DIR%" >> "%LOG_FILE%"
echo 转换完成！ >> "%LOG_FILE%"
exit /b 0

:check_ip_rule
:: 子程序：检查是否包含 IP 段规则
setlocal
findstr /r /c:"^  - [0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*/[0-9][0-9]*" %1 >nul
if %errorlevel% equ 0 (
    endlocal & set ip_found=1
) else (
    endlocal & set ip_found=0
)
exit /b
