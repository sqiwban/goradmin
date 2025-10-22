@echo off
chcp 1251 >nul

:: �������� ���� ��������������
NET FILE >nul 2>&1
if %errorlevel% == 0 (
    goto :menu
) else (
    echo ������ ���� ��������������...
    PowerShell -Command "Start-Process cmd -ArgumentList '/c ""%~0""' -Verb RunAs"
    exit /b
)

:menu
cls
echo ===============================================
echo    ���������� TAP ����������
echo ===============================================
echo.
echo [1] - �������� TAP �������
echo [2] - ������� ��� TAP ��������
echo [3] - �����
echo.
set /p choice="�������� �������� (1-3): "

if "%choice%"=="1" goto add_tap
if "%choice%"=="2" goto del_tap
if "%choice%"=="3" exit /b

echo �������� �����! ������� ����� �������...
pause >nul
goto menu

:add_tap
echo.
echo ���������� TAP ������������ Ethernet ��������...
"C:\Program Files\TAP-Windows\bin\tapinstall.exe" install "C:\Program Files\TAP-Windows\driver\OemVista.inf" tap0901
echo.
echo ������! ������� ����� �������...
pause >nul
goto menu

:del_tap
echo.
echo ===============================================
echo          ��������������!
echo ===============================================
echo ���� ������ ������ ��� TAP ����������� ��������.
echo ��� ����������� �������� ����������� ��������� ���������.
echo.
set /p confirm="�� �������, ��� ������ ����������? (y/N): "
if /i not "%confirm%"=="y" (
    echo �������� ��������.
    pause >nul
    goto menu
)

echo.
echo �������� TAP ���������...
"C:\Program Files\TAP-Windows\bin\tapinstall.exe" remove tap0901
echo.
echo ������! ������� ����� �������...
pause >nul
goto menu