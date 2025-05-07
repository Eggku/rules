@echo off
setlocal enabledelayedexpansion

:: ========================
:: 环境变量定义
:: ========================
set "WORKSPACE=%~dp0.."
set "RULES_DIR=%WORKSPACE%\rules"
set "OUTPUT_DIR=%RULES_DIR%\mrs"
set "LOG_FILE=%WORKSPACE%\conversion.log"
set "MIHOMO_EXE=%WORKSPACE%\config\mihomo.exe"

:: ========================
:: 初始化日志
:: ========================
echo [%date% %time%] 转换日志 > "%LOG_FILE%"
echo 工作区路径: %WORKSPACE% >> "%LOG_FILE%"
echo 输入目录: %RULES_DIR% >> "%LOG_FILE%"
echo 输出目录: %OUTPUT_DIR% >> "%LOG_FILE%"

:: ========================
:: 目录验证
:: ========================
if not exist "%RULES_DIR%" (
  echo [ERROR] 规则目录不存在 >> "%LOG_FILE%"
  exit /b 1
)

if not exist "%MIHOMO_EXE%" (
  echo [ERROR] mihomo.exe 未找到 >> "%LOG_FILE%"
  exit /b 1
)

:: ========================
:: 核心转换逻辑
:: ========================
for /r "%RULES_DIR%" %%f in (*.yaml) do (
  set "input_file=%%~f"
  set "output_file=%OUTPUT_DIR%\%%~nf.mrs"

  echo 正在转换: %%~nxf >> "%LOG_FILE%"
  
  "%MIHOMO_EXE%" convert-ruleset ^
    --type domain ^
    --input-format yaml ^
    --output-format binary ^
    "!input_file!" "!output_file!" 2>&1 >> "%LOG_FILE%"

  if !errorlevel! neq 0 (
    echo [FAILED] 转换失败: %%~nxf >> "%LOG_FILE%"
    exit /b 1
  )
  echo [SUCCESS] 生成: !output_file! >> "%LOG_FILE%"
)

:: ========================
:: 最终验证
:: ========================
dir /b "%OUTPUT_DIR%\*.mrs" >nul
if %errorlevel% neq 0 (
  echo [ERROR] 未生成任何 .mrs 文件 >> "%LOG_FILE%"
  exit 1
)

echo [%date% %time%] 转换完成 >> "%LOG_FILE%"
exit 0
