@shift
@echo off
mode con: cols=50 lines=15  
color 0f
title Spotify Windows Hosts Advertisements Blocker

:menu                                           
echo *************************************************
echo * Spotify Windows Hosts Advertisements Blocker  *
echo *       Made by GabryProject (01/10/2016)       *
echo *        Recoded by TimmyS (10/07/2018)         *
echo *************************************************
echo.
echo *************************************************
echo *                     MENU                      *
echo *************************************************
echo * 1) Block Spotify Advertisements               *
echo * 2) Revert Windows Hosts File Changes          *
echo * 3) Information About Spotify Premium          *
echo * 4) Exit                                       *
echo *************************************************
set /p var=Select an Option [1-4]: 
if "%var%"=="1" goto BlockAdsSpotify
if "%var%"=="2" goto RestoreAds
if "%var%"=="3" goto MoreInfoSpotifyPremium
if "%var%"=="4" goto Exit

:error
cls
echo *************************************************
echo *         SELECTED OPTION IS NOT VALID!         *
echo *************************************************
goto menu

:BlockAdsSpotify
echo *************************************************
echo * Terminating Spotify.exe if it Exists...       *
echo *************************************************
tasklist | find /i "spotify.exe" && taskkill /im spotify.exe /F
echo *************************************************
echo * Backing up Windows Hosts File if it Exists... *
echo *************************************************
IF NOT EXIST %SystemRoot%\system32\drivers\etc\hosts.backup copy %SystemRoot%\system32\drivers\etc\hosts %SystemRoot%\system32\drivers\etc\hosts.backup
echo *************************************************
echo * Adding Domains to Windows Hosts File...       *
echo *************************************************
echo. >>"%SystemRoot%\system32\drivers\etc\hosts"
echo. >>"%SystemRoot%\system32\drivers\etc\hosts"
echo #------------------------------>>"%SystemRoot%\system32\drivers\etc\hosts"
echo #Spotify Advertisements Domains>>"%SystemRoot%\system32\drivers\etc\hosts"
echo 0.0.0.0 adclick.g.doublecklick.net>>"%SystemRoot%\system32\drivers\etc\hosts"
echo 0.0.0.0 googleads.g.doubleclick.net>>"%SystemRoot%\system32\drivers\etc\hosts"
echo 0.0.0.0 http://www.googleadservices.com>>"%SystemRoot%\system32\drivers\etc\hosts"
echo 0.0.0.0 pubads.g.doubleclick.net>>"%SystemRoot%\system32\drivers\etc\hosts"
echo 0.0.0.0 securepubads.g.doubleclick.net>>"%SystemRoot%\system32\drivers\etc\hosts"
echo 0.0.0.0 pagead2.googlesyndication.com>>"%SystemRoot%\system32\drivers\etc\hosts"
echo 0.0.0.0 spclient.wg.spotify.com>>"%SystemRoot%\system32\drivers\etc\hosts"
echo 0.0.0.0 audio2.spotify.com>>"%SystemRoot%\system32\drivers\etc\hosts"
echo #------------------------------>>"%SystemRoot%\system32\drivers\etc\hosts"
echo *************************************************
echo * Deleting File Ad.spa...                       *
echo *************************************************
IF EXIST %appdata%\Spotify\Apps\ad.spa del /f /q %appdata%\Spotify\Apps\ad.spa
echo *************************************************
echo * Creating File Ad.spa...                       *
echo *************************************************
echo. >%appdata%\Spotify\Apps\ad.spa
echo *************************************************
echo * Renewing the DNS Cache...                     *
echo *************************************************
ipconfig /flushdns
echo *************************************************
echo * Executing Spotify.exe...                      *
echo *************************************************
IF NOT EXIST %appdata%\Spotify\Spotify.exe echo Notice: Spotify.exe was not found, please run Spotify manually.
IF EXIST %appdata%\Spotify\Spotify.exe start %appdata%\Spotify\Spotify.exe
echo.
echo *************************************************
echo *                                               *
echo *   Spotify Advertisements Have Been Blocked    *
echo *                                               *
echo *************************************************
echo.
echo Press any key to return to the menu.
pause > nul
cls
goto menu

:RestoreAds
echo *************************************************
echo * Terminating Spotify.exe if it Exists...       *
echo *************************************************
tasklist | find /i "spotify.exe" && taskkill /im spotify.exe /F
echo *************************************************
echo * Deleting Windows Hosts File...                *
echo *************************************************
del /f /q %SystemRoot%\system32\drivers\etc\hosts
echo *************************************************
echo * Creating New Windows Hosts File...            *
echo *************************************************
echo # Copyright (c) 1993-2009 Microsoft Corp. >>"%SystemRoot%\system32\drivers\etc\hosts"
echo # >>"%SystemRoot%\system32\drivers\etc\hosts"
echo # This is a sample HOSTS file used by Microsoft TCP/IP for Windows. >>"%SystemRoot%\system32\drivers\etc\hosts"
echo # >>"%SystemRoot%\system32\drivers\etc\hosts"
echo # This file contains the mappings of IP addresses to host names. Each >>"%SystemRoot%\system32\drivers\etc\hosts"
echo # entry should be kept on an individual line. The IP address should >>"%SystemRoot%\system32\drivers\etc\hosts"
echo # be placed in the first column followed by the corresponding host name. >>"%SystemRoot%\system32\drivers\etc\hosts"
echo # The IP address and the host name should be separated by at least one >>"%SystemRoot%\system32\drivers\etc\hosts"
echo # space. >>"%SystemRoot%\system32\drivers\etc\hosts"
echo # >>"%SystemRoot%\system32\drivers\etc\hosts"
echo # Additionally, comments (such as these) may be inserted on individual >>"%SystemRoot%\system32\drivers\etc\hosts"
echo # lines or following the machine name denoted by a '#' symbol. >>"%SystemRoot%\system32\drivers\etc\hosts"
echo # >>"%SystemRoot%\system32\drivers\etc\hosts"
echo # For example: >>"%SystemRoot%\system32\drivers\etc\hosts"
echo # >>"%SystemRoot%\system32\drivers\etc\hosts"
echo #      102.54.94.97     rhino.acme.com          # source server >>"%SystemRoot%\system32\drivers\etc\hosts"
echo #       38.25.63.10     x.acme.com              # x client host >>"%SystemRoot%\system32\drivers\etc\hosts"
echo # localhost name resolution is handle within DNS itself. >>"%SystemRoot%\system32\drivers\etc\hosts"
echo #       127.0.0.1       localhost >>"%SystemRoot%\system32\drivers\etc\hosts"
echo #       ::1             localhost >>"%SystemRoot%\system32\drivers\etc\hosts"
echo *************************************************
echo * Deleting File Ad.spa...                       *
echo *************************************************
IF EXIST %appdata%\Spotify\Apps\ad.spa del /f /q %appdata%\Spotify\Apps\ad.spa
echo *************************************************
echo * Renewing the DNS Cache...                     *
echo *************************************************
ipconfig /flushdns
echo *************************************************
echo * Executing Spotify.exe...                      *
echo *************************************************
IF NOT EXIST %appdata%\Spotify\Spotify.exe echo Aviso: Notice: Spotify.exe was not found, please run Spotify manually.
IF EXIST %appdata%\Spotify\Spotify.exe start %appdata%\Spotify\Spotify.exe
echo.
echo *************************************************
echo *                                               *
echo *   Spotify Advertisements Have Been Restored   *
echo *                                               *
echo *************************************************
echo.
echo Press any key to return to the menu.
pause > nul
cls
goto menu

:MoreInfoSpotifyPremium
start "" "https://www.spotify.com/us/premium/"
cls
goto menu

:Exit
exit