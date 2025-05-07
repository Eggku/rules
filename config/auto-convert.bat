@echo off
setlocal enabledelayedexpansion

:: 自动定位当前脚本路径
set "SCRIPT_DIR=%~dp0"
set "RULES_DIR=%SCRIPT_DIR%\..\rules"
set "OUTPUT_DIR=%RULES_DIR%\mrs"
set "LOG_FILE=%SCRIPT_DIR%\..\conversion.log"
set "MIHOMO_EXE=%SCRIPT_DIR%\mihomo.exe"

:: 创建输出目录
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

echo 转换日志 > "%LOG_FILE%"
echo 开始时间: %date% %time% >> "%LOG_FILE%"
echo ============================== >> "%LOG_FILE%"

for /r "%RULES_DIR%" %%f in (*.yaml) do (
    set "ip_found=0"
    call :check_ip_rule "%%f"
    set "filename=%%~nf"
    set "out_file=%OUTPUT_DIR%\!filename!.mrs"

    echo 正在转换 %%~nxf >> "%LOG_FILE%"
    if !ip_found! equ 1 (
        "%MIHOMO_EXE%" convert-ruleset ipcidr yaml "%%f" "!out_file!" >> "%LOG_FILE%" 2>&1
    ) else (
        "%MIHOMO_EXE%" convert-ruleset domain yaml "%%f" "!out_file!" >> "%LOG_FILE%" 2>&1
    )

    if exist "!out_file!" (
        echo [成功] %%~nxf >> "%LOG_FILE%"
    ) else (
        echo [失败] %%~nxf - 未生成输出文件 >> "%LOG_FILE%"
    )

    echo ------------------------------ >> "%LOG_FILE%"
)

dir /b "%OUTPUT_DIR%" >> "%LOG_FILE%"
echo 转换完成！ >> "%LOG_FILE%"
exit /b 0

:check_ip_rule
setlocal
findstr /r /c:"^  - [0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*/[0-9][0-9]*" %1 >nul
if %errorlevel% equ 0 (
    endlocal & set ip_found=1
) else (
    endlocal & set ip_found=0
)
exit /b
