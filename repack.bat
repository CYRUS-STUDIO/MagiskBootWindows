@echo off
:: ����Ƿ��ṩ�˽��Ŀ¼·����Ϊ����
if "%~1"=="" (
    echo ���ṩ���Ŀ¼��·����Ϊ������
    exit /b 1
)

:: ��ȡ��ǰ�������ļ����ڵ�Ŀ¼
set "SCRIPT_DIR=%~dp0"

:: �����·��ת��Ϊ����·������ȡ���Ŀ¼����
for %%I in ("%~1\.") do (
    set "UNPACK_DIR=%%~fI"
    set "UNPACK_NAME=%%~nxI"
)

:: ����Ƿ�ɹ���ȡĿ¼����
if "%UNPACK_NAME%"=="" (
    echo �޷���ȡ���Ŀ¼�����ƣ�
    exit /b 1
)

:: ��ȡ UNPACK_DIR �ĸ�Ŀ¼·��
for %%I in ("%UNPACK_DIR%\..") do (
    set "PARENT_DIR=%%~fI"
)

:: �����µ� BOOT_IMG ·����λ�� UNPACK_DIR �ĸ�Ŀ¼
set "BOOT_IMG=%PARENT_DIR%\%UNPACK_NAME%.img"

:: �л������Ŀ¼
cd "%UNPACK_DIR%"

:: ����� boot.img
"%SCRIPT_DIR%magiskboot" repack "%BOOT_IMG%"

echo �����ɣ��µ� "%BOOT_IMG%" �����ɲ������ "%UNPACK_DIR%"��
