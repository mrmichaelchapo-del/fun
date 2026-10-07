@echo off
REM Build script for Fun desktop app (Windows)

set APP_NAME=Fun
set SRC_DIR=src
set OUT_DIR=build
set ASSETS_DIR=assets

if exist "%OUT_DIR%" rmdir /s /q "%OUT_DIR%"
mkdir "%OUT_DIR%"

echo Compiling ActionScript...
mxmlc -source-path="%SRC_DIR%" -library-path+="%ASSETS_DIR%" -output="%OUT_DIR%\%APP_NAME%.swf" -static-link-runtime-shared-libraries=true -target-player=11.1 -swf-version=14 -default-background-color=0xF0F0F0 "%SRC_DIR%\Main.as"

if errorlevel 1 (
    echo Build failed.
    exit /b 1
)

echo Build complete: %OUT_DIR%\%APP_NAME%.swf