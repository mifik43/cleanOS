@echo off
REM Очистка временных файлов системы и браузеров
REM Версия 1.4

echo Начало очистки системы...
echo ----------------------------

del /f /s /q "%userprofile%\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*"
del /f /s /q "%userprofile%\AppData\Roaming\Microsoft\Windows\Cookies\*.*"
del /f /s /q "%SYSTEMDRIVE%\SoftwareDistribution\Download\SharedFileCache\*.*"
del /f /s /q "%SYSTEMDRIVE%\Temp\*.*"
del /f /s /q "%WINDIR%\Temp\*.*"
del /f /s /q "%WINDIR%\Prefetch\*.*"
del /f /s /q "%TEMP%\*.*"
del /f /s /q "%SystemRoot%\TEMP\*.*"
del /f /s /q "%userprofile%\AppData\Local\Temp\*.*"

REM Универсальные пути для браузеров
del /f /s /q "%userprofile%\AppData\Local\Google\Chrome\User Data\Default\Cache\*.*"
del /f /s /q "%userprofile%\AppData\Local\Google\Chrome\User Data\Default\Media Cache\*.*"
del /f /s /q "%userprofile%\AppData\Local\Yandex\YandexBrowser\User Data\Default\Cache\*.*"
del /f /s /q "%userprofile%\AppData\Local\Opera Software\Opera Stable\Cache\*.*"
del /f /s /q "%userprofile%\AppData\Local\Mozilla\Firefox\Profiles\*.default\OfflineCache\*.*"
del /f /s /q "%userprofile%\AppData\Local\Mozilla\Firefox\Profiles\*.default\startupCache\*.*"

REM Очистка очереди печати
echo Остановка службы печати...
net stop spooler /y >nul 2>&1
echo Очистка файлов печати...
del /f /q "%WINDIR%\System32\spool\PRINTERS\*.*" 2>nul
echo Запуск службы печати...
net start spooler >nul 2>&1

REM Опасные команды (Запуск от администратора)
del /f /s /q "%WINDIR%\Installer\*.*" 2>nul

REM 2. Очистка корзины (все пользователи)
echo Очистка корзины... 
for %%d in (%systemdrive%) do (
    rd /s /q "%%d\$Recycle.bin" 2>nul
    echo Корзина на диске %%d очищена
)

echo ----------------------------
echo Очистка завершена!

