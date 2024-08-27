@echo off
:: 检查是否提供了 IMG_PATH 参数
if "%~1"=="" (
    echo 请提供boot.img文件的路径作为参数！
    exit /b 1
)

:: 获取当前批处理文件所在的目录
set "SCRIPT_DIR=%~dp0"

:: 将相对路径转换为绝对路径
for %%I in ("%~1") do (
    set "IMG_PATH=%%~fI"
    set "OUTPUT_DIR=%%~dpI%%~nI"
)

:: 创建输出目录（如果不存在）
if not exist "%OUTPUT_DIR%" (
    mkdir "%OUTPUT_DIR%"
)

:: 解包 boot.img 到输出目录
cd "%OUTPUT_DIR%"
"%SCRIPT_DIR%magiskboot" unpack "%IMG_PATH%"

echo 解包完成，文件已解包到 "%OUTPUT_DIR%" 目录中。
