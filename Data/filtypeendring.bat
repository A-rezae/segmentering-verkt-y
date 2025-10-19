@echo off
setlocal enabledelayedexpansion
 
REM Sett mappen her
set "C:\Users\Ahmad\OneDrive\Skrivebord\Samling\Samlings_uke1\gruppe-oppgave 1\bilder"
 
cd /d "%folder%"
 
for %%f in (*.HEIC) do (
    ren "%%f" "%%~nf.PNG"
)
 
echo Ferdig! Alle .HEIC er nå .PNG (kun endret filendelse, ikke format).
pause