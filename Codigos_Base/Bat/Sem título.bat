@echo off

set Hora=%time%
set /p Nome=Usuario :
set /p senha=Senha  :
set dados=Usuario : %Nome% Senha: %senha%

echo %dados%
echo %Hora%
  
pause >nul