@echo off
setlocal

:: Formatar data e hora (ex: 2025-11-14_00-15-30)
for /f "tokens=1-4 delims=/ " %%a in ("%date%") do (
    set dia=%%a
    set mes=%%b
    set ano=%%c
)
for /f "tokens=1-2 delims=: " %%a in ("%time%") do (
    set hora=%%a
    set minuto=%%b
)
set datahora=%ano%-%mes%-%dia%_%hora%-%minuto%

:: Caminhos
set origem="C:\Users\moises.costa\Desktop\Projetos"
set destino="C:\Users\moises.costa\Desktop\Backup Projeto\Backup_%datahora%.zip"

:: Criar backup com robocopy
robocopy %origem% %destino% /E /MIR /R:3 /W:5

cls
echo Backup concluído com sucesso em %datahora%!
pause
