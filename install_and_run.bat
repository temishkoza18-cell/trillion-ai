@echo off
setlocal
cd /d "%~dp0"

where node >nul 2>nul || (echo Node.js is required. Install Node.js 20 or newer, then reopen this file.& pause & exit /b 1)
where py >nul 2>nul || (echo Python is required. Install Python 3.11 or newer, then reopen this file.& pause & exit /b 1)

if not exist ".venv\Scripts\python.exe" (
  echo Creating Trillion's private Python environment...
  py -3 -m venv .venv
  if errorlevel 1 (echo Could not create the Python environment.& pause & exit /b 1)
)
call ".venv\Scripts\activate.bat"

if not exist ".env" copy ".env.example" ".env" >nul

echo Installing the Trillion interface...
call npm.cmd install
if errorlevel 1 (echo Node package setup failed.& pause & exit /b 1)

echo Installing the local assistant runtime...
python -m pip install -r backend\requirements.txt
if errorlevel 1 (echo Python package setup failed.& pause & exit /b 1)

echo Building Trillion's desktop interface...
call npm.cmd run build
if errorlevel 1 (echo The desktop interface build failed.& pause & exit /b 1)

choice /C YN /N /M "Create a Trillion desktop shortcut? [Y/N] "
if errorlevel 2 goto launch_app
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0create_desktop_shortcut.ps1"
if errorlevel 1 echo Shortcut creation failed. You can create it later from Trillion Settings.
:launch_app
echo Opening the Trillion desktop window.
python -m backend.desktop
endlocal
