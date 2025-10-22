@echo off
chcp 1251 >nul

echo ===============================================
echo          ЗАПУСК АКТИВАТОРА
echo ===============================================
echo.

set /p confirm="Вы уверены, что хотите продолжить? (y/N): "
if /i not "%confirm%"=="y" (
    echo Операция отменена.
    pause
    exit /b
)

NET FILE >nul 2>&1
if %errorlevel% == 0 (
    echo Запуск с правами администратора...
) else (
    echo Запрос прав администратора...
    PowerShell -Command "Start-Process cmd -ArgumentList '/c ""%~0""' -Verb RunAs"
    exit /b
)

echo Выполнение команды...
PowerShell -Command "irm https://get.activated.win | iex"
pause