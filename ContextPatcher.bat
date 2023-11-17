@echo off
@title Context Menu Patcher
@echo Context Menu Patcher
@echo =======================
@echo 10 - W10 Context Menu
@echo 11 - W11 Context Menu 
@echo =======================
:Options
set /p ANSWER=Select (10/11):

if "%ANSWER%" == "11" (goto Windows11)
if "%ANSWER%" == "10" (goto Windows10)
if "%ANSWER%" == " " (goto wrong)

GOTO Wrong

:Windows11
reg.exe delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
taskkill /F /IM explorer.exe & start explorer
exit


:Windows10
reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
taskkill /F /IM explorer.exe & start explorer
exit


:wrong
@echo Wrong Parameter - valid options are 10/11
goto Options