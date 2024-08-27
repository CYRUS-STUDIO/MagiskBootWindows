@echo off
:: 检查是否提供了解包目录路径作为参数
if "%~1"=="" (
    echo 请提供解包目录的路径作为参数！
    exit /b 1
)

:: 获取当前批处理文件所在的目录
set "SCRIPT_DIR=%~dp0"

:: 将相对路径转换为绝对路径并获取解包目录名称
for %%I in ("%~1\.") do (
    set "UNPACK_DIR=%%~fI"
    set "UNPACK_NAME=%%~nxI"
)

:: 检查是否成功获取目录名称
if "%UNPACK_NAME%"=="" (
    echo 无法获取解包目录的名称！
    exit /b 1
)

:: 获取 UNPACK_DIR 的父目录路径
for %%I in ("%UNPACK_DIR%\..") do (
    set "PARENT_DIR=%%~fI"
)

:: 设置新的 BOOT_IMG 路径，位于 UNPACK_DIR 的父目录
set "BOOT_IMG=%PARENT_DIR%\%UNPACK_NAME%.img"

:: 切换到解包目录
cd "%UNPACK_DIR%"

:: 打包回 boot.img
"%SCRIPT_DIR%magiskboot" repack "%BOOT_IMG%"

echo 打包完成，新的 "%BOOT_IMG%" 已生成并存放在 "%UNPACK_DIR%"。
