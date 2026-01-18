@echo off
echo Installing Image Rating Platform Dependencies...
echo.

echo Installing Backend Dependencies...
cd "%~dp0"
call npm install
if errorlevel 1 (
    echo Backend installation failed!
    pause
    exit /b 1
)

echo.
echo Installing Frontend Dependencies...
cd client
call npm install
if errorlevel 1 (
    echo Frontend installation failed!
    pause
    exit /b 1
)

cd ..
echo.
echo ========================================
echo Installation Complete!
echo ========================================
echo.
echo To start the application, run: start.bat
echo.
pause
