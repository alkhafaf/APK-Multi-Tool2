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
:noproj
echo Please Select A Project To Work On (Option #9)
PAUSE
goto restart
:switchc
set /a dec+=1 
if (%dec%)==(3) (set /a dec=0)
goto MAINMENU
:cleanp
echo 1. Clean This Project's Folder
echo 2. Clean All Apk's in Modding Folder
echo 3. Clean All OGG's in OGG Folder
echo 4. Clean All Apk's in Optimize Folder
echo 5. Clean All Apk's in Signing Folder
echo 6. Clean All Projects
echo 7. Clean All Folders/Files
echo 8. Go Back To Main Menu
SET /P menuna=Please make your decision:
echo Clearing Directories
IF %menuna%==1 (
if %capp%==None goto noproj
rmdir /S /Q %userprofile%\apktool > nul
rmdir /S /Q projects\%capp% > nul
mkdir projects\%capp%
)
IF %menuna%==2 (
rmdir /S /Q %userprofile%\apktool > nul
rmdir /S /Q place-apk-here-for-modding > nul
mkdir place-apk-here-for-modding
)
IF %menuna%==3 (
rmdir /S /Q place-ogg-here > nul
mkdir place-ogg-here
)
IF %menuna%==4 (
rmdir /S /Q place-apk-here-to-batch-optimize > nul
mkdir place-apk-here-to-batch-optimize
)
IF %menuna%==5 (
rmdir /S /Q place-apk-here-for-signing > nul
mkdir place-apk-here-for-signing
)
IF %menuna%==7 (
rmdir /S /Q %userprofile%\apktool > nul
rmdir /S /Q projects\%capp% > nul
mkdir projects\%capp%
rmdir /S /Q place-apk-here-for-modding > nul
mkdir place-apk-here-for-modding
rmdir /S /Q place-ogg-here > nul
mkdir place-ogg-here
rmdir /S /Q place-apk-here-to-batch-optimize > nul
mkdir place-apk-here-to-batch-optimize
rmdir /S /Q place-apk-here-for-signing > nul
mkdir place-apk-here-for-signing
rmdir /S /Q %userprofile%\apktool > nul
rmdir /S /Q projects > nul
mkdir projects
)
IF %menuna%==6 (
rmdir /S /Q %userprofile%\apktool > nul
rmdir /S /Q projects > nul
mkdir projects
)
goto MAINMENU
:about
cls
echo About
echo -----
type other\version.txt
echo Tips
echo ----
echo 1. If Modifying system apps, never resign them unless you want to resign all
echo apk's that share its shared:uid
echo 2. If decompiling/recompiling system apps and if AndroidManifest.xml was not
echo preserved from the original apk, then either push the apk when in recovery or
echo by doing :
echo adb remount
echo adb shell stop
echo adb push something.apk /wherever/something.apk
echo adb shell start
echo 3. Decompiling a themed apk is not possible, you must get the original unthemed
echo apk, then decompile, make your theme/xml changes and recompile
echo 4. If you're stuck and the log doesnot give you any indication as to what you 
echo are doing wrong, then post in the thread http://www.tiny.cc/apkmanager
echo Make sure u include ur APK-Multi-Tool.log, and if its not a editing problem i.e 
echo its something regarding when u push it to your phone, then post ur adb log 
echo as well. To do so 
echo follow these steps :
echo 1. Connect ur phone to ur pc
echo 2. Push/install the app on your phone
echo 3. Select "Create Log" option on this menu
echo 4. Let the new window run for 10 seconds, then close it
echo Once done, you will find a adblog.txt in the root folder
echo Upload that as well.
echo.
echo 1. Create log
echo 2. Go back to main menu
SET /P menunr=Please make your decision:
IF %menunr%==1 (Start ""%~dp0other\adb.exe" Log" other\signer 2)
goto MAINMENU
:filesel
cls
set /A count=0
FOR %%F IN (place-apk-here-for-modding/*.apk) DO (
set /A count+=1
set a!count!=%%F
if /I !count! LEQ 9 (echo ^- !count!  - %%F )
if /I !count! GTR 10 (echo ^- !count! - %%F )
)
echo.
echo Choose the app to be set as current project?
set /P INPUT=Enter It's Number: %=%
if /I %INPUT% GTR !count! (goto chc)
if /I %INPUT% LSS 1 (goto chc)
set capp=!a%INPUT%!
set jar=0
set ext=jar
IF "!capp:%ext%=!" NEQ "%capp%" set jar=1
goto MAINMENU
:chc
set capp=None
goto MAINMENU
rem :bins
rem echo Waiting for device
rem "%~dp0other\adb.exe" wait-for-device
rem echo Installing Apks
rem FOR %%F IN ("%~dp0place-apk-here-for-signing\*.apk") DO "%~dp0other\adb.exe" install -r "%%F"
rem goto MAINMENU
:heap
set /P INPUT=Enter max size for java heap space in megabytes (eg 512) : %=%
set heapy=%INPUT%
cls
goto MAINMENU
:usrcomp
set /P INPUT=Enter Compression Level (0-9) : %=%
set usrc=%INPUT%
cls
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
ECHO * Compression: %usrc% ^* Heap Size: %heapy%mb ^                                       *
ECHO ***************************************************************************************
ECHO * Decompile : %decs% ^* App: %capp%                        *
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
ECHO * 0. ORIGINAL EDITOR                                                                  *
ECHO *    This is the original editor scripts that you used for editing(ba)smali           *
ECHO *    This mode only system files will have the keep folder options                    *
ECHO ***************************************************************************************
ECHO * 1. NEW EDITOR                                                                       *
ECHO *    This is the NEW editor scripts that you used for editing(ba)smali                *
ECHO *    This mode Both (non)system files will have the keep folder options               *
ECHO ***************************************************************************************
ECHO * 2. DEBUGING MODE                                                                    *
ECHO *    This feature not only allows eding of the images it also allows you to edit      *
ECHO *    the sourcecode of the select apk to make actual code changes                     *
ECHO ***************************************************************************************
ECHO * 3. VERBOSE MODE                                                                     *
ECHO *    This feature allows you to port entire themes from one rom to another            *
ECHO *    without the need to resign the apk files making fast easy rom theme ports        *
ECHO ***************************************************************************************
SET /P menunr=Please make your decision:
IF %menunr%==0 (goto MENU01A)
IF %menunr%==1 (goto MENU01B)
IF %menunr%==2 (goto MENU01C)
IF %menunr%==3 (goto MENU01D)
:WHAT
ECHO ***************************************************************************************
ECHO *       You went crazy and entered something that wasnt part of the menu options      *
ECHO ***************************************************************************************
PAUSE
goto MENU01
:MENU01A
cd "%~dp0"
set menunr=GARBAGE01A
cls
ECHO ***************************************************************************************
ECHO *                       Advanced Tasks Such As Code Editing                           *
ECHO ***************************************************************************************
ECHO *                                   ORIGINAL EDITOR                                   *
ECHO ***************************************************************************************
ECHO * Compression: %usrc% ^* Heap Size: %heapy%mb ^                                       *
ECHO ***************************************************************************************
ECHO * Decompile : %decs% ^* App: %capp%                        *
ECHO ***************************************************************************************
ECHO * 0.   Decompile apk                                                                  *
ECHO * 1.   Decompile apk (with dependencies) (For proprietary ROM apks)                   *
ECHO * 2.   Compile apk                                                                    *
ECHO * 3.   Sign apk                                                                       *
ECHO * 4.   Install apk                                                                    *
ECHO * 5.   Compile apk / Sign apk / Install apk (Non System Apps Only)                    *
ECHO * 6.   Back to Editor Menu                                                            *
ECHO ***************************************************************************************
SET /P menunr=Please make your decision:
IF %menunr%==0 (goto de)
IF %menunr%==1 (goto ded)
IF %menunr%==2 (goto co)
IF %menunr%==3 (goto si)
IF %menunr%==4 (goto ins)
IF %menunr%==5 (goto all)
IF %menunr%==5 (goto MENU01)
:WHAT
ECHO ***************************************************************************************
ECHO *       You went crazy and entered something that wasnt part of the menu options      *
ECHO ***************************************************************************************
PAUSE
goto MENU01A
:MENU01B
ECHO ***************************************************************************************
ECHO *                                     COMING SOON                                     *
ECHO ***************************************************************************************
PAUSE
goto MENU01
:MENU01C
ECHO ***************************************************************************************
ECHO *                                     COMING SOON                                     *
ECHO ***************************************************************************************
PAUSE
goto MENU01
:MENU01D
ECHO ***************************************************************************************
ECHO *                                     COMING SOON                                     *
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