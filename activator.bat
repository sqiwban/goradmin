@echo off
chcp 1251 >nul

echo ===============================================
echo          ������ ����������
echo ===============================================
echo.

set /p confirm="�� �������, ��� ������ ����������? (y/N): "
if /i not "%confirm%"=="y" (
    echo �������� ��������.
    pause
    exit /b
)

NET FILE >nul 2>&1
if %errorlevel% == 0 (
    echo ������ � ������� ��������������...
) else (
    echo ������ ���� ��������������...
    PowerShell -Command "Start-Process cmd -ArgumentList '/c ""%~0""' -Verb RunAs"
    exit /b
)

echo ���������� �������...
PowerShell -Command "irm https://get.activated.win | iex"
pause