@echo off
setlocal enabledelayedexpansion

:: ========================
:: 配置绝对路径
:: ========================
set "ROOT_DIR=%GITHUB_WORKSPACE%"
set "RULES_DIR=%ROOT_DIR%\rules"
set "OUTPUT_DIR=%RULES_DIR%\mrs"
set "LOG_FILE=%ROOT_DIR%\conversion.log"
set "MIHOMO_EXE=%ROOT_DIR%\config\mihomo.exe"

:: ========================
:: 初始化日志和目录
:: ========================
echo [%date% %time%] 开始转换 > "%LOG_FILE%"
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

:: ========================
:: 关键文件检查
:: ========================
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
    --input-format yaml ^
    --output-format binary ^
    --type domain ^
    "!input_file!" "!output_file!" 2>&1 >> "%LOG_FILE%"

  if !errorlevel! neq 0 (
    echo [FAILED] 转换失败: %%~nxf >> "%LOG_FILE%"
    exit /b 1
  ) else (
    echo [SUCCESS] 生成: !output_file! >> "%LOG_FILE%"
  )
)

:: ========================
:: 最终验证
:: ========================
dir /b "%OUTPUT_DIR%" > nul
if %errorlevel% neq 0 (
  echo [ERROR] 输出目录为空！ >> "%LOG_FILE%"
  exit 1
)

echo [%date% %time%] 转换完成 >> "%LOG_FILE%"
exit 0
