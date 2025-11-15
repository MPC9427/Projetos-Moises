@echo off

color 02
mode 50,10

title %date:/=-% - %time:~0,5%

set /p nome=Digite seu nome:
set /p "sobrenome=Digite seu Sobrenome: "
set /p "idade=Digite sue Idade: "
set /p "sexo=Digite seu sexo: "

set /p nome_comp= %nome% %sobrenome%

cls

echo.
echo COLUNA 01           COLUNA 02
echo.
echo Nome:               %nome%
echo Sobrenome:          %sobrenome%
echo Nome Completo:      %nome_comp%
echo Idade:              %idade%
echo Sexo:               %sexo%

pause>nul