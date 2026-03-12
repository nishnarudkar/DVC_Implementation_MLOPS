@echo off
REM DagHub Setup Script for Windows
REM This script helps you connect your project to DagHub

echo === DagHub Setup ===
echo.

set /p DAGSHUB_USER="Enter your DagHub username: "
set /p DAGSHUB_REPO="Enter your DagHub repository name: "
set /p DAGSHUB_TOKEN="Enter your DagHub token: "

echo.
echo Configuring DVC remote...
dvc remote add origin https://dagshub.com/%DAGSHUB_USER%/%DAGSHUB_REPO%.dvc
dvc remote modify origin --local auth basic
dvc remote modify origin --local user %DAGSHUB_USER%
dvc remote modify origin --local password %DAGSHUB_TOKEN%

echo Configuring Git remote...
git remote add origin https://dagshub.com/%DAGSHUB_USER%/%DAGSHUB_REPO%.git

echo.
echo Setup complete!
echo.
echo Next steps:
echo 1. git add .
echo 2. git commit -m "Initial commit"
echo 3. git push -u origin main
echo 4. dvc push
echo.
pause
