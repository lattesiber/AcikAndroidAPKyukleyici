@echo off
title Acik Android APK Yukleyici
color 0b
chcp 65001 >nul

:menu
cls
echo ======================================================
echo           ACIK ANDROID APK YUKLEYICI
echo ======================================================
echo.
echo [UYARI]: Google, 2026/2027'den itibaren sertifikali 
echo Android cihazlardaki tum uygulamalarin, gelistiricinin 
echo kisisel kimlik bilgilerini dogrudan Google'a 
echo gondermesini gerektirecegini duyurdu.
echo.
echo Bu uygulamanin gelistiricileri bu gereksinimi kabul 
echo etmedigi icin bu uygulama, bu sureden sonra artik 
echo sertifikali Android cihazlarda calismayacaktir.
echo.
echo Android'i acik tutabilmemiz icin su siteyi ziyaret edin:
echo https://keepandroidopen.org/tr/
echo ======================================================
echo.
echo 1) Kurulum (Cihaz Hazirlama Talimatlari)
echo 2) APK Kur
echo 3) Cikis
echo.
set /p secim="Seciminizi yapin (1/2/3): "

if "%secim%"=="1" goto kurulum
if "%secim%"=="2" goto apkkur
if "%secim%"=="3" exit
goto menu

:kurulum
cls
if exist not.txt (
    type not.txt
) else (
    echo [HATA] not.txt dosyasi bulunamadi!
)
echo.
pause
goto menu

:apkkur
cls
echo ======================================================
echo                    APK KURULUMU
echo ======================================================
echo.
set /p apkpath="APK dosyasinin tam yolunu girin (Ornek: C:\dosya\uygulama.apk): "

:: Tirnak isaretlerini temizle (kullanici yolu kopyalarken tirnak eklemis olabilir)
set apkpath=%apkpath:"=%

echo.
echo Kurulum baslatiliyor, lutfen bekleyin...
adb install "%apkpath%"

if %errorlevel% equ 0 (
    echo.
    echo [BASARILI] Uygulama basariyla yuklendi!
) else (
    echo.
    echo [HATA] Uygulama yuklenemedi. 
    echo Lutfen USB baglantisini ve APK yolunu kontrol edin.
)

echo.
pause
goto menu