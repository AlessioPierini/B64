@echo off
@title BaseConverter
echo Made by Void
echo.
echo.

:select
cls
CHOICE /N /C:123 /M "Codificare [1], Decodificare [2] o Uscire [3]?"

IF ERRORLEVEL 3 goto EXC
IF ERRORLEVEL 2 goto DEC
IF ERRORLEVEL 1 goto COD

:COD
cls
echo Copia percorso file o trascinalo dentro..
echo .
set/p "data=>"
@certutil -encode %data% tmp.b64 && findstr /v /c:- tmp.b64 > %data%.b64 && del tmp.b64 
goto select
cls

:DEC
cls
echo Scegliere il file da decodificare o trascinalo dentro
set/p "data=>"
echo Decodifica in corso...
echo attendere..
@certutil -decode %data% %data%.txt
cls

echo Desideri convertire il file in un formato diverso?
CHOICE /N /C:12 /M "SI [1] o NO [2]?"
IF ERRORLEVEL 2 goto ncon
IF ERRORLEVEL 1 goto ycon

:ncon
cls
goto select

:ycon
echo In che formato desideri convertire il file?
CHOICE /N /C:12345 /M "DOCX [1], XLSX [2], PDF [3], JPG [4] o MP3 [5]?"

IF ERRORLEVEL 5 goto MP3
IF ERRORLEVEL 4 goto JPG
IF ERRORLEVEL 3 goto PDF
IF ERRORLEVEL 2 goto XLSX
IF ERRORLEVEL 1 goto DOCX

:DOCX
echo Inserisci il file da convertire...
set/p "data=>"
echo Conversione in corso...
@ren "%data%" "FileConvertito.docx"
cls
goto select

:XLSX
echo Inserisci il file da convertire...
set/p "data=>"
echo Conversione in corso...
@ren "%data%" "FileConvertito.xlsx"
cls
goto select

:PDF
echo Inserisci il file da convertire...
set/p "data=>"
echo Conversione in corso...
@ren "%data%" "FileConvertito.pdf"
cls
goto select

:JPG
echo Inserisci il file da convertire...
set/p "data=>"
echo Conversione in corso...
@ren "%data%" "FileConvertito.JPG"
cls
goto select

:MP3
echo Inserisci il file da convertire...
set/p "data=>"
echo Conversione in corso...
@ren "%data%" "FileConvertito.mp3"
cls
goto select

:EXC
exit