@echo off
echo Starting Image Rating Platform...
echo.

echo Starting MongoDB (if not already running)...
start "MongoDB" cmd /c "echo MongoDB should be running on mongodb://localhost:27017"

echo.
echo Starting Backend Server...
start "Backend Server" cmd /k "cd /d %~dp0 && npm start"

timeout /t 3 /nobreak >nul

echo.
echo Starting Frontend Development Server...
start "Frontend Server" cmd /k "cd /d %~dp0client && npm start"

echo.
echo ========================================
echo Servers are starting...
echo ========================================
echo Backend: http://localhost:5001
echo Frontend: http://localhost:3001
echo.
echo Press any key to exit (servers will continue running)
pause >nul
