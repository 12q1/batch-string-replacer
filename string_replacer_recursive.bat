::Put this file in the directory you want it to run in
@echo off
echo Starting string replacer...

setlocal EnableExtensions DisableDelayedExpansion

set "search=somestring"
:: change 'somestring' with your original path
set "replace=anotherstring"
:: change 'anotherstring' to your desired path

set "targetFile=*.mod"
:: searches for all files with the extension '.mod'
set "rootDir=."

for /R "%rootDir%" %%j in ("%targetFile%") do (
    for /f "delims=" %%i in ('type "%%~j" ^& break ^> "%%~j"') do (
        set "line=%%i"
        setlocal EnableDelayedExpansion
        set "line=!line:%search%=%replace%!"
        >>"%%~j" echo(!line!
        endlocal
    )
)

echo Finished replacing strings

endlocal