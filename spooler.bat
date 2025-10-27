@echo off
chcp 1251 >nul
setlocal

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Запрос прав администратора...
    powershell -Command "Start-Process cmd -ArgumentList '/c %~0' -Verb RunAs"
    exit /b
)

echo Права администратора получены!
echo.

echo Остановка службы печати...
net stop "Spooler" >nul
if %errorLevel% equ 0 (
    echo Служба печати успешно остановлена.
) else (
    echo Не удалось остановить службу печати. Код ошибки: %errorLevel%
    pause
    exit /b
)

echo.
timeout /t 3 /nobreak >nul
echo.

echo Запуск службы печати...
net start "Spooler" >nul
if %errorLevel% equ 0 (
    echo Служба печати успешно запущена.
) else (
    echo Не удалось запустить службу печати. Код ошибки: %errorLevel%
    pause
    exit /b
)

echo.
echo Служба печати успешно перезапущена!
pause