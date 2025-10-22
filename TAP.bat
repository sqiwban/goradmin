@echo off
chcp 1251 >nul

:: Проверка прав администратора
NET FILE >nul 2>&1
if %errorlevel% == 0 (
    goto :menu
) else (
    echo Запрос прав администратора...
    PowerShell -Command "Start-Process cmd -ArgumentList '/c ""%~0""' -Verb RunAs"
    exit /b
)

:menu
cls
echo ===============================================
echo    УПРАВЛЕНИЕ TAP АДАПТЕРАМИ
echo ===============================================
echo.
echo [1] - Добавить TAP адаптер
echo [2] - Удалить ВСЕ TAP адаптеры
echo [3] - Выход
echo.
set /p choice="Выберите действие (1-3): "

if "%choice%"=="1" goto add_tap
if "%choice%"=="2" goto del_tap
if "%choice%"=="3" exit /b

echo Неверный выбор! Нажмите любую клавишу...
pause >nul
goto menu

:add_tap
echo.
echo Добавление TAP виртуального Ethernet адаптера...
"C:\Program Files\TAP-Windows\bin\tapinstall.exe" install "C:\Program Files\TAP-Windows\driver\OemVista.inf" tap0901
echo.
echo Готово! Нажмите любую клавишу...
pause >nul
goto menu

:del_tap
echo.
echo ===============================================
echo          ПРЕДУПРЕЖДЕНИЕ!
echo ===============================================
echo Этот скрипт удалит ВСЕ TAP виртуальные адаптеры.
echo Для выборочного удаления используйте Диспетчер устройств.
echo.
set /p confirm="Вы уверены, что хотите продолжить? (y/N): "
if /i not "%confirm%"=="y" (
    echo Операция отменена.
    pause >nul
    goto menu
)

echo.
echo Удаление TAP адаптеров...
"C:\Program Files\TAP-Windows\bin\tapinstall.exe" remove tap0901
echo.
echo Готово! Нажмите любую клавишу...
pause >nul
goto menu