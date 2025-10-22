@echo off

set first_arg=
set second_arg=

set "first_arg=%~1"
set "second_arg=%~2"

if "%first_arg% %second_arg%" NEQ " " goto continue


goto :eof

:continue
echo %first_arg% %second_arg%|findstr /rc:"^[0-9][0-9]* [0-9][0-9]*$" >NUL&&echo:>NUL || goto :syntaxerror

if %second_arg% LSS %first_arg% set /a result=(%RANDOM%*(first_arg-second_arg)/32768)+second_arg
if %second_arg% GEQ %first_arg% set /a result=(%RANDOM%*(second_arg-first_arg)/32768)+first_arg
echo %RESULT%
goto :eof

:syntaxerror
echo:"%~nx0" [number1] [number2]

echo: Eg. "%~nx0" 2 4
