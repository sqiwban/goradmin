@echo off
chcp 1251 >nul
setlocal

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ������ ���� ��������������...
    powershell -Command "Start-Process cmd -ArgumentList '/c %~0' -Verb RunAs"
    exit /b
)

echo ����� �������������� ��������!
echo.

echo ��������� ������ ������...
net stop "Spooler" >nul
if %errorLevel% equ 0 (
    echo ������ ������ ������� �����������.
) else (
    echo �� ������� ���������� ������ ������. ��� ������: %errorLevel%
    pause
    exit /b
)

echo.
timeout /t 3 /nobreak >nul
echo.

echo ������ ������ ������...
net start "Spooler" >nul
if %errorLevel% equ 0 (
    echo ������ ������ ������� ��������.
) else (
    echo �� ������� ��������� ������ ������. ��� ������: %errorLevel%
    pause
    exit /b
)

echo.
echo ������ ������ ������� ������������!
pause