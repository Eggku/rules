@echo off
:: �ļ���: auto-convert.bat
:: ����: �Զ�ת�� `.yaml` ������ `.mrs`�����洢�� `rules\mrs` Ŀ¼

setlocal enabledelayedexpansion

:: ����·��
set "RULES_DIR=rules"
set "OUTPUT_DIR=%RULES_DIR%\mrs"
set "LOG_FILE=conversion.log"

:: ����mrsĿ¼����������ڣ�
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

echo ת����־ > "%LOG_FILE%"
echo ��ʼʱ��: %date% %time% >> "%LOG_FILE%"
echo ==============================

:: �������� `.yaml` �ļ�
for /r "%RULES_DIR%" %%f in (*.yaml) do (
    set "ip_found=0"

    :: ����Ƿ�Ϊ IP �����ų�ע�͸��ţ�
    findstr /r /c:"^  - [0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*/[0-9][0-9]*" "%%f" >nul
    if !errorlevel! equ 0 set ip_found=1

    :: ��������ļ�·��
    set "filename=%%~nf"
    set "out_file=%OUTPUT_DIR%\!filename!.mrs"

    :: ִ��ת��
    if !ip_found! equ 1 (
        echo [IP����] ת��: %%~nxf �� \mrs\!filename!.mrs
        mihomo convert-ruleset ipcidr yaml "%%f" "!out_file!"
    ) else (
        echo [��������] ת��: %%~nxf �� \mrs\!filename!.mrs
        mihomo convert-ruleset domain yaml "%%f" "!out_file!"
    )

    :: ������
    if errorlevel 1 (
        echo [ʧ��] %%~nxf >> "%LOG_FILE%"
        echo �� �ļ��ṹ������ ��
        echo �����ļ�: %%~nxf
        echo ������֤:
        echo mihomo convert-ruleset test yaml "%%f"
        timeout /t 5
    ) else (
        echo [�ɹ�] %%~nxf >> "%LOG_FILE%"
    )
    echo ------------------------------
)

:: ��ʾ���ɵ��ļ��б�
echo �����ļ��б�: >> "%LOG_FILE%"
dir /b "%OUTPUT_DIR%" >> "%LOG_FILE%"

echo ת����ɣ�
echo ����ʱ��: %date% %time% >> "%LOG_FILE%"
start "" "%OUTPUT_DIR%"
notepad "%LOG_FILE%"
