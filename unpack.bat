@echo off
:: ����Ƿ��ṩ�� IMG_PATH ����
if "%~1"=="" (
    echo ���ṩboot.img�ļ���·����Ϊ������
    exit /b 1
)

:: ��ȡ��ǰ�������ļ����ڵ�Ŀ¼
set "SCRIPT_DIR=%~dp0"

:: �����·��ת��Ϊ����·��
for %%I in ("%~1") do (
    set "IMG_PATH=%%~fI"
    set "OUTPUT_DIR=%%~dpI%%~nI"
)

:: �������Ŀ¼����������ڣ�
if not exist "%OUTPUT_DIR%" (
    mkdir "%OUTPUT_DIR%"
)

:: ��� boot.img �����Ŀ¼
cd "%OUTPUT_DIR%"
"%SCRIPT_DIR%magiskboot" unpack "%IMG_PATH%"

echo �����ɣ��ļ��ѽ���� "%OUTPUT_DIR%" Ŀ¼�С�
