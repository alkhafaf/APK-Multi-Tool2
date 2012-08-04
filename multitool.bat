@echo off
setlocal enabledelayedexpansion
COLOR 0A
if (%1)==(0) goto skipme
if (%1) neq () goto adbi
echo -------------------------------------------------------------------------- >> ApkMultiTool2.log
echo ^|%date% -- %time%^| >> ApkMultiTool2.log
echo -------------------------------------------------------------------------- >> ApkMultiTool2.log
multitool 0 2>> ApkMultiTool2.log



:error

:skipme
cd "%~dp0"
mode con:cols=90 lines=50



cls
set usrc=9
set dec=0
set capp=None
set heapy=512
set jar=0
java -version 
if errorlevel 1 goto errjava
other\adb version 
if errorlevel 1 goto erradb
set /A count=0
FOR %%F IN (place-apk-here-for-modding/*.apk) DO (
set /A count+=1
set tmpstore=%%~nF%%~xF
)
if %count%==1 (set capp=%tmpstore%)

:skipme2
cls
ECHO ***************************************************************************************
ECHO *                             APKTOOL MULTI-TOOLS2                                    *
ECHO ***************************************************************************************
ECHO *                    Written By Gerald Wayne Baggett Jr {Raziel23x                    *
ECHO ***************************************************************************************
ECHO *                           Website: http://apkmultitool.com                          *
ECHO ***************************************************************************************
ECHO *           Empowering you to Do Your BEST where ever the path may lead you           *
ECHO ***************************************************************************************
ECHO *  Whether you're doing basic image editing or editing the smali or XML files, on     *
ECHO *  average u have to use (Brut.all or JF's smali/baksmali) awesome tool to extract    *
ECHO *  the apk, edit it, then sign the apk and then adb push/install it. This process is  * 
ECHO *  quite tiresome if you are testing a method that needs fine tweaking.               *
ECHO ***************************************************************************************
ECHO *  This script should make the process a LOT smoother.                                *
ECHO *  There is an option of compiling/signing/installing all in one step                 *
ECHO ***************************************************************************************
ECHO *  Special Thanks:                                                                    *
ECHO ***************************************************************************************
ECHO *  Goes to Daneshm90 the Original Writer of Apk Manager                               *
ECHO *  Goes to Brut.all for his awesome tool.                                             *
ECHO *  Goes to iBotPeaches for his awesome updates to Brut.all awesome tool.              *
ECHO *  Goes to JF for of course, smali/baksmali                                           *
ECHO ***************************************************************************************
ECHO *  Private Testes Special Thanks:                                                     *
ECHO ***************************************************************************************
ECHO *  Windows Testers:                                                                   *
ECHO ***************************************************************************************
ECHO *  Goes to Purian23                                                                   *
ECHO ***************************************************************************************
ECHO *  Linux Testers:                                                                     *
ECHO ***************************************************************************************
ECHO *  Goes to Crush2Push                                                                 *
ECHO ***************************************************************************************
PAUSE
:MAINMENU
if %dec%==0 (set decs=Sources and Resources)
if %dec%==1 (set decs=Sources)
if %dec%==2 (set decs=Resources)
cd "%~dp0"
set menunr=GARBAGE
cls
ECHO ***************************************************************************************
ECHO *                             APKTOOL MULTI-TOOLS2                                    *
ECHO ***************************************************************************************
ECHO * Compression: %usrc% ^* Heap Size: %heapy%mb ^                                       *
ECHO ***************************************************************************************
ECHO * Decompile : %decs% ^* App: %capp%                        *
ECHO ***************************************************************************************
ECHO * 0. IMAGE EDITING                                                                    *
ECHO *    This feature allows you to edit images without the need to decompile the apk     *
ECHO *    files making simple image changes such as icones and basic image editing         *
ECHO ***************************************************************************************
ECHO * 1. CODE EDITING                                                                     *
ECHO *    This feature not only allows eding of the images it also allows you to edit      *
ECHO *    the sourcecode of the select apk to make actual code changes                     *
ECHO ***************************************************************************************
ECHO * 2. ROM THEME PORTER                                                                 *
ECHO *    This feature allows you to port entire themes from one rom to another            *
ECHO *    without the need to resign the apk files making fast easy rom theme ports        *
ECHO ***************************************************************************************
ECHO * 3.  BATCH OPERATIONS                                                                *
ECHO *                                                                                     *
ECHO *                                                                                     *
ECHO ***************************************************************************************
ECHO * 4.  SETUP OPERATIONS                                                                *
ECHO *                                                                                     *
ECHO *                                                                                     *
ECHO ***************************************************************************************
ECHO *                                       SETTINGS                                      *
ECHO ***************************************************************************************
ECHO * 5.   Clean Files/Folders                                                            *
ECHO * 6.   Select compression level for apk's                                             *
ECHO * 7.   Set Max Memory Size (Only use if getting stuck at decompiling/compiling)       *
ECHO * 8.   Read Log                                                                       *
ECHO * 9.   Set current project                                                            *
ECHO * 10.  About / Tips / Debug Section                                                   *
ECHO * 11.  Switch decompile mode                                                          *
ECHO * 00.  Quit                                                                           *
ECHO ***************************************************************************************
SET /P menunr=Please make your decision:
IF %menunr%==0 (goto MENU00)
IF %menunr%==1 (goto MENU01)
IF %menunr%==2 (goto MENU02)
IF %menunr%==3 (goto MENU03)
IF %menunr%==4 (goto MENU04)
IF %menunr%==5 (goto cleanp)
IF %menunr%==6 (goto usrcomp)
IF %menunr%==7 (goto heap)
IF %menunr%==8 (goto logr)
IF %menunr%==9 (goto filesel)
IF %menunr%==10 (goto about)
IF %menunr%==11 (goto switchc)
IF %menunr%==00 (goto quit)
if %capp%==None goto noproj
:WHAT
ECHO ***************************************************************************************
ECHO *       You went crazy and entered something that wasnt part of the menu options      *
ECHO ***************************************************************************************
PAUSE
goto MAINMENU
:MENU00
if %dec%==0 (set decs=Sources and Resources)
if %dec%==1 (set decs=Sources)
if %dec%==2 (set decs=Resources)
cd "%~dp0"
set menunr=GARBAGE00
cls
ECHO ***************************************************************************************
ECHO *                             APKTOOL MULTI-TOOLS2                                    *
ECHO ***************************************************************************************
ECHO * Compression: %usrc% ^* Heap Size: %heapy%mb ^* Decompile : %decs% ^* App: %capp%    *
ECHO ***************************************************************************************
ECHO *                       Simple Tasks Such As Image Editing                            *
ECHO ***************************************************************************************
ECHO * 0    Adb pull                                                                       *
ECHO * 1    Extract apk                                                                    *
ECHO * 2    Optimize images inside                                                         *
ECHO * 3    Zip apk                                                                        * 
ECHO * 4    Sign apk (Don't do this if its a system apk)                                   *
ECHO * 5    Zipalign apk (Do once apk is created/signed)                                   *
ECHO * 6    Install apk (Don't do this if system apk, do adb push)                         *
ECHO * 7    Zip / Sign / Install apk (All in one step)                                     *
ECHO * 8    Adb push (Only for system apk)                                                 *
ECHO ***************************************************************************************
SET /P menunr=Please make your decision:
IF %menunr%==0 (goto AP)
IF %menunr%==1 (goto EX)
IF %menunr%==2 (goto OPT)
IF %menunr%==3 (goto ZIP)
IF %menunr%==4 (goto SI)
IF %menunr%==5 (goto ZIPA)
IF %menunr%==6 (goto INS)
IF %menunr%==7 (goto ALLI)
IF %menunr%==8 (goto APU)
:WHAT
ECHO ***************************************************************************************
ECHO *       You went crazy and entered something that wasnt part of the menu options      *
ECHO ***************************************************************************************
PAUSE
goto MENU00
:MENU01
cd "%~dp0"
set menunr=GARBAGE01
cls
ECHO ***************************************************************************************
ECHO *                       Advanced Tasks Such As Code Editing                           *
ECHO ***************************************************************************************
ECHO * Compression: %usrc% ^* Heap Size: %heapy%mb ^* Decompile : %desecs% ^* App: %capp%    *
ECHO ***************************************************************************************
ECHO * 9    Decompile apk                                                                  *
ECHO * 10   Decompile apk (with dependencies) (For proprietary ROM apks)                   *
ECHO * 11   Compile apk                                                                    *
ECHO * 12   Sign apk                                                                       *
ECHO * 13   Install apk                                                                    *
ECHO * 14   Compile apk / Sign apk / Install apk (Non System Apps Only)                    *
ECHO *                                                                                     *
ECHO ***************************************************************************************
SET /P menunr=Please make your decision:
IF %menunr%==9 (goto de)
IF %menunr%==10 (goto ded)
IF %menunr%==11 (goto co)
IF %menunr%==12 (goto si)
IF %menunr%==13 (goto ins)
IF %menunr%==14 (goto all)
:WHAT
ECHO ***************************************************************************************
ECHO *       You went crazy and entered something that wasnt part of the menu options      *
ECHO ***************************************************************************************
PAUSE
goto MENU01
:MENU02
cd "%~dp0"
set menunr=GARBAGE02
cls
ECHO ***************************************************************************************
ECHO *                   BATCH OPERATIONS FOR PORTING THEMES BETWEEN ROMS                  *
ECHO ***************************************************************************************
ECHO * 1    Batch Theme Image Transfer (Read the Instructions before using this feature)   *
ECHO *                                                                                     *
ECHO *       Experimental use with caution                                                 *
ECHO *       This tool makes the process of transferring images from one APK file to       *
ECHO *       another APK File of the same file making it easier to update themes or even   *
ECHO *       transferring a theme update.zip of one ROM to another Rom allowing the        *
ECHO *       porting of theme to be much faster.                                           *
ECHO *      (Note: You will have to manually replace the progress_horizontals.xml from     *
ECHO *       the framework-res since this file is needed with Theme Changes)               *
ECHO *                                                                                     *
ECHO ***************************************************************************************
ECHO * 2    Batch Theme Image Optimize (Read the Instructions before using this feature)   *
ECHO *                                                                                     *
ECHO *      Experimental use with caution                                                  *
ECHO *      This tool makes the process of transferring images from one APK file to        *
ECHO *      another APK File of the same file making it easier to update themes or even    *
ECHO *      transferring a theme update.zip of one ROM to another Rom allowing the         *
ECHO *      porting of theme to be much faster.                                            *
ECHO *     (Note: You will have to manually replace the progress_horizontals.xml from      *
ECHO *      the framework-res since this file is needed with Theme Changes)                *
ECHO *                                                                                     *
ECHO ***************************************************************************************
ECHO *   3    Batch Theme Image Zipalign (Read the Instructions before using this feature) *
ECHO *                                                                                     *
ECHO *        Experimental use with caution                                                *
ECHO *        This tool makes the process of transferring images from one APK file to      *
ECHO *        another APK File of the same file making it easier to update themes or even  *
ECHO *        transferring a theme update.zip of one ROM to another Rom allowing the       *
ECHO *        porting of theme to be much faster.                                          *
ECHO *       (Note: You will have to manually replace the progress_horizontals.xml from    *
ECHO *        the framework-res since this file is needed with Theme Changes)              *
ECHO *                                                                                     *
ECHO ***************************************************************************************
SET /P menunr=Please make your decision:
IF %menunr%==0 (goto btit)
IF %menunr%==1 (goto btio)
IF %menunr%==2 (goto btiz)
:WHAT
ECHO ***************************************************************************************
ECHO *       You went crazy and entered something that wasnt part of the menu options      *
ECHO ***************************************************************************************
PAUSE
goto MENU02
:MENU03
cd "%~dp0"
set menunr=GARBAGE03
cls
ECHO ***************************************************************************************
ECHO * 3  BATCH OPERATIONS                                                                 *
ECHO *                                                                                     *
ECHO ***************************************************************************************
ECHO *                                                                                     *
ECHO * 0   Batch Optimize Apk (inside place-apk-here-to-batch-optimize only)               *
ECHO * 1   Sign an apk(Batch support)(inside place-apk-here-for-signing folder only)       *
ECHO * 2   Batch optimize ogg files (inside place-ogg-here only)                           *
ECHO *                                                                                     *
ECHO ***************************************************************************************
SET /P menunr=Please make your decision:
IF %menunr%==0 (goto bopt)
IF %menunr%==1 (goto asi)
IF %menunr%==2 (goto ogg)
:WHAT
ECHO ***************************************************************************************
ECHO *       You went crazy and entered something that wasnt part of the menu options      *
ECHO ***************************************************************************************
PAUSE
goto MENU03
:MENU04
cd "%~dp0"
set menunr=GARBAGE04
cls
ECHO ***************************************************************************************
ECHO *                              APK MULTI-TOOL SETUP FILE                              *
ECHO ***************************************************************************************
ECHO * 1. Check for update                                                                 *
ECHO *    This Will Check if there is a update to the main program                         *
ECHO ***************************************************************************************
ECHO * 2. Installing Framework-Res                                                         *
ECHO *    This Will install one of the Framwork-Res Files for 1.x/2.x/3.x/4.x              *
ECHO *    This Feature also will install any of the other Dependencies needed              *
ECHO *    In order to use this feature make sure to drop all of the needed files           *
ECHO *    into the platform-tools Folder or else this script will not find them            *
ECHO ***************************************************************************************
ECHO * 3. Setup Directories                                                                *
ECHO *    This will setup the appropate directories needed by Apk Multi-Tools              *
ECHO *    (This script only needs to be ran for first time users do not use if your        * 
ECHO *     Just updating from previous Version)                                            *
ECHO ***************************************************************************************
SET /P menunr=Please make your decision:
IF %menunr%==1 (goto CHECKUPDATE)
IF %menunr%==2 (goto FRAMRES)
IF %menunr%==3 (goto SETDIR)
:WHAT
ECHO ***************************************************************************************
ECHO *       You went crazy and entered something that wasnt part of the menu options      *
ECHO ***************************************************************************************
PAUSE
goto MENU04



:errjava
cls
echo Java was not found, you will not be able to sign apks or use apktool
PAUSE
goto skipme2
:erradb
cls
echo Adb was not found, you will not be able to manipulate the files on your phone
PAUSE
goto skipme2
:noproj
echo Please Select A Project To Work On (Option #9)
PAUSE
goto MAINMENU