@echo off
set /a count=1
:loop
echo Contador: %count%
set /a count+=1
if %count% LEQ 5 goto loop
echo Fim do loop!
pause