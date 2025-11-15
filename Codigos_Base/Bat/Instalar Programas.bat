@@@@
@ECHO off
net session >nul 2>&1
IF "%ERRORLEVEL%" EQU "2" (msg * Execute este Script como Administrador!&exit)
set count=0
SETLOCAL
SET YourCOMPANY=""
SET YourUF=""
SET AnalysisIP=""
SET DeployRoot=""
cls
FOR /f "tokens=4-7 delims=^[.^] " %%i in ('ver') DO (IF %%i==Version (SET SysVer=%%j.%%k) ELSE (SET SysVer=%%i.%%j))
IF "%SysVer%" EQU "6.3" (SET SysVer=6.1)
IF "%SysVer%" EQU "6.1" (GOTO START-W7) ELSE (GOTO START-W10)
::##########################################  IDENTIFICACAO DA UNIDADE  ############################################
:ANALISIS
FOR /f "delims=[] tokens=2" %%a IN ('ping -4 -n 1 %ComputerName% ^| findstr [') DO SET NetworkIP=%%a
FOR /f "tokens=1,2 delims=." %%a in ("%NetworkIP%") DO (SET AnalysisIP=%%a.%%b)
::####################################################  SC-SPC  ####################################################
IF "%AnalysisIP%" EQU "10.11" (
	SET YourCOMPANY=Santa Cruz
	SET YourUF=Sao Paulo - Osasco
	SET DeployRoot=\\10.11.4.99\Publico$\Programas
	SET Serv=HFSPCSCAPPXE
	GOTO MENU
)
::####################################################  SC-VLO  ####################################################
IF "%AnalysisIP%" EQU "10.12" (
	SET YourCOMPANY=Santa Cruz
	SET YourUF=Sao Paulo - Vila Olimpia
	SET DeployRoot=\\10.12.0.210\Publico$\Programas
	SET Serv=HFVLOSCAPPXE
	GOTO MENU
)
::####################################################  SC-SPI  ####################################################
IF "%AnalysisIP%" EQU "10.16" (
	SET YourCOMPANY=Santa Cruz
	SET YourUF=Sao Paulo - Araraquara
	SET DeployRoot=\\10.16.1.210\Publico$\Programas
	SET Serv=HFSPISCAPPXE
	GOTO MENU
)
::####################################################  SC-RJ  #####################################################
IF "%AnalysisIP%" EQU "10.22" (
	SET YourCOMPANY=Santa Cruz
	SET YourUF=Rio de Janeiro
	SET DeployRoot=\\10.22.0.210\Publico$\Programas
	SET Serv=HFRJSCAPPXE
	GOTO MENU
)
::####################################################  SC-ES  #####################################################
IF "%AnalysisIP%" EQU "10.27" (
	SET YourCOMPANY=Santa Cruz
	SET YourUF=Espirito Santo
	SET DeployRoot=\\10.27.0.210\Publico$\Programas
	SET Serv=HFESSCAPPXE
	GOTO MENU
)
::####################################################  OP-ES  #####################################################
IF "%AnalysisIP%" EQU "10.28" (
	SET YourCOMPANY=Oncoprod
	SET YourUF=Espirito Santo
	SET DeployRoot=\\10.28.0.210\Publico$\Programas
	SET Serv=HFESOPAPPXE
	GOTO MENU
)
::####################################################  SC-MG  #####################################################
IF "%AnalysisIP%" EQU "10.31" (
	SET YourCOMPANY=Santa Cruz
	SET YourUF=Minas Gerais
	SET DeployRoot=\\10.31.0.210\Publico$\Programas
	SET Serv=HFMGSCAPPXE
	GOTO MENU
)
::####################################################  SC-PR  #####################################################
IF "%AnalysisIP%" EQU "10.41" (
	SET YourCOMPANY=Santa Cruz
	SET YourUF=Parana
	SET DeployRoot=\\10.41.0.210\Publico$\Programas
	SET Serv=HFPRSCAPPXE
	GOTO MENU
)
::####################################################  SC-SC  #####################################################
IF "%AnalysisIP%" EQU "10.48" (
	SET YourCOMPANY=Santa Cruz
	SET YourUF=Santa Catarina
	SET DeployRoot=\\10.48.0.210\MDTx64$\Applications
	SET Serv=HFSCSCAPPXE
	GOTO MENU
)
::####################################################  SC-RS  #####################################################
IF "%AnalysisIP%" EQU "10.51" (
	SET YourCOMPANY=Santa Cruz
	SET YourUF=Rio Grande do Sul
	SET DeployRoot=\\10.51.0.210\Publico$\Programas
	SET Serv=HFRSSCAPPXE
	GOTO MENU
)
::####################################################  SC-DF  #####################################################
IF "%AnalysisIP%" EQU "10.61" (
	SET YourCOMPANY=Santa Cruz
	SET YourUF=Distrito Federal
	SET DeployRoot=\\10.61.0.210\Publico$\Programas
	SET Serv=HFDFSCAPPXE
	GOTO MENU
)
::####################################################  SC-GO  #####################################################
IF "%AnalysisIP%" EQU "10.62" (
	SET YourCOMPANY=Santa Cruz
	SET YourUF=Goias
	SET DeployRoot=\\10.62.0.210\Publico$\Programas
	SET Serv=HFGOSCAPPXE
	GOTO MENU
)
::####################################################  SC-BA  #####################################################
IF "%AnalysisIP%" EQU "10.71" (
	SET YourCOMPANY=Santa Cruz
	SET YourUF=Bahia
	SET DeployRoot=\\10.71.0.210\Publico$\Programas
	SET Serv=HFBASCAPPXE
	GOTO MENU
)
::####################################################  SC-SE  #####################################################
IF "%AnalysisIP%" EQU "10.79" (
	SET YourCOMPANY=Santa Cruz
	SET YourUF=Sergipe
	SET DeployRoot=\\10.79.0.210\Publico$\Programas
	SET Serv=HFSESCAPPXE
	GOTO MENU
)
::####################################################  SC-PE  #####################################################
IF "%AnalysisIP%" EQU "10.81" (
	SET YourCOMPANY=Santa Cruz
	SET YourUF=Pernanbuco
	SET DeployRoot=\\10.81.0.210\Publico$\Programas
	SET Serv=HFPESCAPPXE
	GOTO MENU
)
::####################################################  SC-AL  #####################################################
IF "%AnalysisIP%" EQU "10.82" (
	SET YourCOMPANY=Santa Cruz
	SET YourUF=Alagoas
	SET DeployRoot=\\10.82.0.210\Publico$\Programas
	SET Serv=HFALSCAPPXE
	GOTO MENU
)
::####################################################  SC-PB  #####################################################
IF "%AnalysisIP%" EQU "10.83" (
	SET YourCOMPANY=Santa Cruz
	SET YourUF=Paraiba
	SET DeployRoot=\\10.83.0.210\Publico$\Programas
	SET Serv=HFPBSCAPPXE
	GOTO MENU
)
::####################################################  SC-RN  #####################################################
IF "%AnalysisIP%" EQU "10.84" (
	SET YourCOMPANY=Santa Cruz
	SET YourUF=Rio Grande do Norte
	SET DeployRoot=\\10.84.0.210\Publico$\Programas
	SET Serv=HFRNSCAPPXE
	GOTO MENU
)
::####################################################  SC-AM  #####################################################
IF "%AnalysisIP%" EQU "10.92" (
	SET YourCOMPANY=Santa Cruz
	SET YourUF=Amazonas
	SET DeployRoot=\\10.92.0.210\Publico$\Programas
	SET Serv=HFAMSCAPPXE
	GOTO MENU
)
::####################################################  PP-PR  #####################################################
IF "%AnalysisIP%" EQU "10.91" (
	SET YourCOMPANY=Panpharma
	SET YourUF=Para
	SET DeployRoot=\\10.91.0.210\Publico$\Programas
	SET Serv=HFPAPPAPPXE
	GOTO MENU
)
::####################################################  PP-MG  #####################################################
IF "%AnalysisIP%" EQU "10.131" (
	SET YourCOMPANY=Panpharma
	SET YourUF=Minas Gerais
	SET DeployRoot=\\10.131.0.210\Publico$\Programas
	SET Serv=HFMGPPAPPXE
	GOTO MENU
)
::####################################################  PP-PR  #####################################################
IF "%AnalysisIP%" EQU "10.141" (
	SET YourCOMPANY=Panpharma
	SET YourUF=Parana
	SET DeployRoot=\\10.141.0.210\Publico$\Programas
	SET Serv=HFPRPPAPPXE
	GOTO MENU
)
::####################################################  PP-RS  #####################################################
IF "%AnalysisIP%" EQU "10.151" (
	SET YourCOMPANY=Panpharma
	SET YourUF=Rio Grande do Sul
	SET DeployRoot=\\10.151.0.210\Publico$\Programas
	SET Serv=HFRSPPAPPXE
	GOTO MENU
)
::####################################################  PP-MT  #####################################################

IF "%AnalysisIP%" EQU "10.165" (
	SET YourCOMPANY=Panpharma
	SET YourUF=Mato Grosso
	SET DeployRoot=\\10.165.0.210\Publico$\Programas
	SET Serv=HFMTPPAPPXE
	GOTO MENU
)
::####################################################  PP-MS  #####################################################
IF "%AnalysisIP%" EQU "10.167" (
	SET YourCOMPANY=Panpharma
	SET YourUF=Mato Grosso do Sul
	SET DeployRoot=\\10.167.0.210\Publico$\Programas
	SET Serv=HFMSPPAPPXE
	GOTO MENU
)
::####################################################  PP-PE  #####################################################
IF "%AnalysisIP%" EQU "10.181" (
	SET YourCOMPANY=Panpharma
	SET YourUF=Pernanbuco
	SET DeployRoot=\\10.181.0.210\Publico$\Programas
	SET Serv=HFPEPPAPPXE
	GOTO MENU
)
::####################################################  PP-CE  #####################################################
IF "%AnalysisIP%" EQU "10.185" (
	SET YourCOMPANY=Panpharma
	SET YourUF=Ceara
	SET DeployRoot=\\10.185.0.210\Publico$\Programas
	SET Serv=HFCEPPAPPXE
	GOTO MENU
)
::####################################################  PP-SPC  ####################################################
IF "%AnalysisIP%" EQU "10.211" (
	SET YourCOMPANY=Panpharma
	SET YourUF=Sao Paulo - Jundiai
	SET DeployRoot=\\10.211.0.210\Publico$\Programas
	SET Serv=HFSPCPPAPPXE
	GOTO MENU
)
::####################################################  PP-RJ  #####################################################
IF "%AnalysisIP%" EQU "10.221" (
	SET YourCOMPANY=Panpharma
	SET YourUF=Rio de Janeiro
	SET DeployRoot=\\10.221.0.210\Publico$\Programas
	SET Serv=HFRJPPAPPXE
	GOTO MENU
)
::####################################################  PP-ES  #####################################################
IF "%AnalysisIP%" EQU "10.227" (
	SET YourCOMPANY=Panpharma
	SET YourUF=Espirito Santo
	SET DeployRoot=\\10.227.0.210\Publico$\Programas
	SET Serv=HFESPPAPPXE
	GOTO MENU
)
::#####################################################  ERRO  #####################################################
IF "%DeployRoot%" EQU "" (
	mode con cols=60 lines=15
	cls
	ECHO:
	ECHO  Unidade nao IdentIFicada, verifique sua configuracao de rede.
	ECHO:
	ECHO  Obs: Utilize apenas a rede Cabeada ou GSC-ADM e desabilite
	ECHO  os demais Adaptadores de rede como Hyper-V...
	ECHO:
	ECHO:
	ECHO  Apos verificar precione qualquer tecla para tentar novamente...
	pause
	cls
)
GOTO ANALISIS
::################################################  MENU INICIAL  ##################################################
:MENU
title %YourCOMPANY%  ^>  %YourUF%
mode con cols=54 lines=40
color 0F
cls
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO   лллллл        PADRONIZACAO DE EQUIPAMENTOS) ELSE (ECHO    [41m      [40m[36m        PADRONIZACAO DE EQUIPAMENTOS)
IF "%SysVer%" EQU "6.1" (ECHO   лл  лл) ELSE (ECHO    [41m  [40m  [41m  [40m)
IF "%SysVer%" EQU "6.1" (ECHO                     Marca: %YourCOMPANY%) ELSE (ECHO          [36m           Marca: [33m%YourCOMPANY%)
IF "%SysVer%" EQU "6.1" (ECHO   лл  лл           Estado: %YourUF%) ELSE (ECHO    [41m  [40m  [41m  [40m[36m          Estado: [33m%YourUF%)
IF "%SysVer%" EQU "6.1" (ECHO   лллллл         Servidor: %Serv%) ELSE (ECHO    [41m      [40m[36m        Servidor: [33m%Serv%)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO  лллллллллллллллллллллллллллллллллллллллллллллллллллл) ELSE (ECHO  [41m                                                    [40m)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO  Escolha o Programa Desejado e aperte ENTER) ELSE (ECHO [36m Escolha o Programa Desejado e aperte ENTER)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO  [01] ^=^> 7 Zip) ELSE (ECHO [36m [[33m01[36m] ^=^> 7 Zip)
IF "%SysVer%" EQU "6.1" (ECHO  [02] ^=^> Adoti 4.9.0 Rev 5315) ELSE (ECHO [36m [[33m02[36m] ^=^> Adoti 4.9.0 Rev 5315)
IF "%SysVer%" EQU "6.1" (ECHO  [03] ^=^> DanfeView) ELSE (ECHO [36m [[33m03[36m] ^=^> DanfeView)
IF "%SysVer%" EQU "6.1" (ECHO  [04] ^=^> Microsoft Office +) ELSE (ECHO [36m [[33m04[36m] ^=^> Microsoft Office [33m+)
IF "%SysVer%" EQU "6.1" (ECHO  [05] ^=^> Microsoft Teams) ELSE (ECHO [36m [[33m05[36m] ^=^> Microsoft Teams)
IF "%SysVer%" EQU "6.1" (ECHO  [06] ^=^> MicroSIP - Ramal) ELSE (ECHO [36m [[33m06[36m] ^=^> MicroSIP - Ramal)
IF "%SysVer%" EQU "6.1" (ECHO  [07] ^=^> Navegadores +) ELSE (ECHO [36m [[33m07[36m] ^=^> Navegadores [33m+)
IF "%SysVer%" EQU "6.1" (ECHO  [08] ^=^> OpenVPN Connect V3) ELSE (ECHO [36m [[33m08[36m] ^=^> OpenVPN Connect V3)
IF "%SysVer%" EQU "6.1" (ECHO  [09] ^=^> PDF +) ELSE (ECHO [36m [[33m09[36m] ^=^> PDF [33m+)
IF "%SysVer%" EQU "6.1" (ECHO  [10] ^=^> Reconectar WIFi) ELSE (ECHO [36m [[33m10[36m] ^=^> Reconectar WIFi)
IF "%SysVer%" EQU "6.1" (ECHO  [11] ^=^> Sap Gui 7.40 Patch 19) ELSE (ECHO [36m [[33m11[36m] ^=^> Sap Gui 7.40 Patch 19)
IF "%SysVer%" EQU "6.1" (ECHO  [12] ^=^> Sap Text Editor) ELSE (ECHO [36m [[33m12[36m] ^=^> Sap Text Editor)
IF "%SysVer%" EQU "6.1" (ECHO  [13] ^=^> Sisfat +) ELSE (ECHO [36m [[33m13[36m] ^=^> Sisfat [33m+)
IF "%SysVer%" EQU "6.1" (ECHO  [14] ^=^> Sites +) ELSE (ECHO [36m [[33m14[36m] ^=^> Sites [33m+)
IF "%SysVer%" EQU "6.1" (ECHO  [15] ^=^> Smart Gate) ELSE (ECHO [36m [[33m15[36m] ^=^> Smart Gate)
IF "%SysVer%" EQU "6.1" (ECHO  [16] ^=^> Trend Micro Apex One) ELSE (ECHO [36m [[33m16[36m] ^=^> Trend Micro Apex One)
IF "%SysVer%" EQU "6.1" (ECHO  [17] ^=^> UniDanfe) ELSE (ECHO [36m [[33m17[36m] ^=^> UniDanfe)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO  [18] ^=^> Configuracoes Padroes) ELSE (ECHO [36m [[33m18[36m] ^=^> Configuracoes Padroes)
ECHO:
set /p opcao= * 
IF %opcao% equ 1 GOTO 7ZIP
IF %opcao% equ 2 GOTO ADOTI
IF %opcao% equ 3 GOTO DANFEVIEW
IF %opcao% equ 4 GOTO MENUOFFICE
IF %opcao% equ 5 GOTO TEAMS
IF %opcao% equ 6 GOTO MICROSIP
IF %opcao% equ 7 GOTO MENUNAVEGADORES
IF %opcao% equ 8 GOTO OPENVPN
IF %opcao% equ 9 GOTO MENUPDF
IF %opcao% equ 10 GOTO RECONECTARWIFI
IF %opcao% equ 11 GOTO SAP
IF %opcao% equ 12 GOTO SAPEDITOR
IF %opcao% equ 13 GOTO MENUSISFAT
IF %opcao% equ 14 GOTO MENUSITES
IF %opcao% equ 15 GOTO SMARTGATE
IF %opcao% equ 16 GOTO TREND
IF %opcao% equ 17 GOTO UNIDANFE
IF %opcao% equ 18 GOTO MENUCONFIG
IF NOT %opcao% equ 18 GOTO ERRO
::##############################################  SUB-MENU OFFICE  #################################################
:MENUOFFICE
mode con cols=54 lines=35
cls
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO   лллллл        PADRONIZACAO DE EQUIPAMENTOS) ELSE (ECHO    [41m      [40m[36m        PADRONIZACAO DE EQUIPAMENTOS)
IF "%SysVer%" EQU "6.1" (ECHO   лл  лл) ELSE (ECHO    [41m  [40m  [41m  [40m)
IF "%SysVer%" EQU "6.1" (ECHO                     Marca: %YourCOMPANY%) ELSE (ECHO          [36m           Marca: [33m%YourCOMPANY%)
IF "%SysVer%" EQU "6.1" (ECHO   лл  лл           Estado: %YourUF%) ELSE (ECHO    [41m  [40m  [41m  [40m[36m          Estado: [33m%YourUF%)
IF "%SysVer%" EQU "6.1" (ECHO   лллллл         Servidor: %Serv%) ELSE (ECHO    [41m      [40m[36m        Servidor: [33m%Serv%)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO  лллллллллллллллллллллллллллллллллллллллллллллллллллл) ELSE (ECHO  [41m                                                    [40m)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO                   MICROSOFT OFFICE) ELSE (ECHO [36m                  MICROSOFT OFFICE)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO  Escolha o Navegador Desejado) ELSE (ECHO [36m Escolha o Navegador Desejado)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO  [01] ^=^> Microsoft Office 2010 Standard) ELSE (ECHO [36m [[33m01[36m] ^=^> Microsoft Office 2010 Standard)
IF "%SysVer%" EQU "6.1" (ECHO  [02] ^=^> Microsoft Office 2013 Standard) ELSE (ECHO [36m [[33m02[36m] ^=^> Microsoft Office 2013 Standard)
IF "%SysVer%" EQU "6.1" (ECHO  [03] ^=^> Microsoft Office 2016 Standard) ELSE (ECHO [36m [[33m03[36m] ^=^> Microsoft Office 2016 Standard)
IF "%SysVer%" EQU "6.1" (ECHO  [04] ^=^> Microsoft Office 365 ProPlus) ELSE (ECHO [36m [[33m04[36m] ^=^> Microsoft Office 365 ProPlus)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO  [00] ^=^> MENU Principal) ELSE (ECHO [36m [[33m00[36m] ^=^> MENU Principal)
ECHO:
GOTO OFFICECHOICE

:OFFICECHOICE
CHOICE /C 01234 /N /M "* Selecione uma das opcoes do MENU acima: "
IF "%ERRORLEVEL%" EQU "1" GOTO MENU
IF "%ERRORLEVEL%" EQU "2" GOTO OFFICE2010
IF "%ERRORLEVEL%" EQU "3" GOTO OFFICE2013
IF "%ERRORLEVEL%" EQU "4" GOTO OFFICE2016
IF "%ERRORLEVEL%" EQU "5" GOTO OFFICE365
GOTO OFFICECHOICE
::############################################  SUB-MENU NAVEGADORES  ##############################################
:MENUNAVEGADORES
mode con cols=54 lines=28
cls
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO   лллллл        PADRONIZACAO DE EQUIPAMENTOS) ELSE (ECHO    [41m      [40m[36m        PADRONIZACAO DE EQUIPAMENTOS)
IF "%SysVer%" EQU "6.1" (ECHO   лл  лл) ELSE (ECHO    [41m  [40m  [41m  [40m)
IF "%SysVer%" EQU "6.1" (ECHO                     Marca: %YourCOMPANY%) ELSE (ECHO          [36m           Marca: [33m%YourCOMPANY%)
IF "%SysVer%" EQU "6.1" (ECHO   лл  лл           Estado: %YourUF%) ELSE (ECHO    [41m  [40m  [41m  [40m[36m          Estado: [33m%YourUF%)
IF "%SysVer%" EQU "6.1" (ECHO   лллллл         Servidor: %Serv%) ELSE (ECHO    [41m      [40m[36m        Servidor: [33m%Serv%)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO  лллллллллллллллллллллллллллллллллллллллллллллллллллл) ELSE (ECHO  [41m                                                    [40m)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO                      NAVEGADORES) ELSE (ECHO [36m                     NAVEGADORES)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO  Escolha o Navegador Desejado) ELSE (ECHO [36m Escolha o Navegador Desejado)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO  [01] ^=^> Google Chrome) ELSE (ECHO [36m [[33m01[36m] ^=^> Google Chrome)
IF "%SysVer%" EQU "6.1" (ECHO  [02] ^=^> Mozila Firefox) ELSE (ECHO [36m [[33m02[36m] ^=^> Mozila Firefox)
IF "%SysVer%" EQU "6.1" (ECHO  [03] ^=^> Microsoft Edge) ELSE (ECHO [36m [[33m03[36m] ^=^> Microsoft Edge)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO  [00] ^=^> MENU Principal) ELSE (ECHO [36m [[33m00[36m] ^=^> MENU Principal)
ECHO:
GOTO NAVECHOICE

:NAVECHOICE
CHOICE /C 0123 /N /M "* Selecione uma das opcoes do MENU acima: "
IF "%ERRORLEVEL%" EQU "1" GOTO MENU
IF "%ERRORLEVEL%" EQU "2" GOTO CHROME
IF "%ERRORLEVEL%" EQU "3" GOTO FIREFOX
IF "%ERRORLEVEL%" EQU "4" GOTO EDGE
GOTO NAVECHOICE
::################################################  SUB-MENU PDF  ##################################################
:MENUPDF
mode con cols=54 lines=27
cls
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO   лллллл        PADRONIZACAO DE EQUIPAMENTOS) ELSE (ECHO    [41m      [40m[36m        PADRONIZACAO DE EQUIPAMENTOS)
IF "%SysVer%" EQU "6.1" (ECHO   лл  лл) ELSE (ECHO    [41m  [40m  [41m  [40m)
IF "%SysVer%" EQU "6.1" (ECHO                     Marca: %YourCOMPANY%) ELSE (ECHO          [36m           Marca: [33m%YourCOMPANY%)
IF "%SysVer%" EQU "6.1" (ECHO   лл  лл           Estado: %YourUF%) ELSE (ECHO    [41m  [40m  [41m  [40m[36m          Estado: [33m%YourUF%)
IF "%SysVer%" EQU "6.1" (ECHO   лллллл         Servidor: %Serv%) ELSE (ECHO    [41m      [40m[36m        Servidor: [33m%Serv%)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO  лллллллллллллллллллллллллллллллллллллллллллллллллллл) ELSE (ECHO  [41m                                                    [40m)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO                         PDF) ELSE (ECHO [36m                        PDF)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO  Escolha o Programa Desejado) ELSE (ECHO [36m Escolha o Programa Desejado)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO  [01] ^=^> Adobe Reader) ELSE (ECHO [36m [[33m01[36m] ^=^> Adobe Reader)
IF "%SysVer%" EQU "6.1" (ECHO  [02] ^=^> PDF Creator) ELSE (ECHO [36m [[33m02[36m] ^=^> PDF Creator)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO  [00] ^=^> MENU Principal) ELSE (ECHO [36m [[33m00[36m] ^=^> MENU Principal)
ECHO:
GOTO PDFCHOICE

:PDFCHOICE
CHOICE /C 012 /N /M "* Selecione uma das opcoes do MENU acima: "
IF "%ERRORLEVEL%" EQU "1" GOTO MENU
IF "%ERRORLEVEL%" EQU "2" GOTO ADOBEREADER
IF "%ERRORLEVEL%" EQU "3" GOTO PDFCREATOR
GOTO PDFCHOICE
::##############################################  SUB-MENU SISFAT  #################################################
:MENUSISFAT
mode con cols=54 lines=27
cls
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO   лллллл        PADRONIZACAO DE EQUIPAMENTOS) ELSE (ECHO    [41m      [40m[36m        PADRONIZACAO DE EQUIPAMENTOS)
IF "%SysVer%" EQU "6.1" (ECHO   лл  лл) ELSE (ECHO    [41m  [40m  [41m  [40m)
IF "%SysVer%" EQU "6.1" (ECHO                     Marca: %YourCOMPANY%) ELSE (ECHO          [36m           Marca: [33m%YourCOMPANY%)
IF "%SysVer%" EQU "6.1" (ECHO   лл  лл           Estado: %YourUF%) ELSE (ECHO    [41m  [40m  [41m  [40m[36m          Estado: [33m%YourUF%)
IF "%SysVer%" EQU "6.1" (ECHO   лллллл         Servidor: %Serv%) ELSE (ECHO    [41m      [40m[36m        Servidor: [33m%Serv%)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO  лллллллллллллллллллллллллллллллллллллллллллллллллллл) ELSE (ECHO  [41m                                                    [40m)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO                        SISFAT) ELSE (ECHO [36m                       SISFAT)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO  Escolha o Programa Desejado) ELSE (ECHO [36m Escolha o Programa Desejado)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO  [01] ^=^> Sisfat Comercial) ELSE (ECHO [36m [[33m01[36m] ^=^> Sisfat Comercial)
IF "%SysVer%" EQU "6.1" (ECHO  [02] ^=^> Sisfat Logistica) ELSE (ECHO [36m [[33m02[36m] ^=^> Sisfat Logistica)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO  [00] ^=^> MENU Principal) ELSE (ECHO [36m [[33m00[36m] ^=^> MENU Principal)
ECHO:
GOTO SISFATCHOICE

:SISFATCHOICE
CHOICE /C 012 /N /M "* Selecione uma das opcoes do MENU acima: "
IF "%ERRORLEVEL%" EQU "1" GOTO MENU
IF "%ERRORLEVEL%" EQU "2" GOTO COMERCIAL
IF "%ERRORLEVEL%" EQU "3" GOTO LOGISTICA
GOTO SISFATCHOICE
::###############################################  SUB-MENU SITES  #################################################
:MENUSITES
mode con cols=54 lines=31
cls
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO   лллллл        PADRONIZACAO DE EQUIPAMENTOS) ELSE (ECHO    [41m      [40m[36m        PADRONIZACAO DE EQUIPAMENTOS)
IF "%SysVer%" EQU "6.1" (ECHO   лл  лл) ELSE (ECHO    [41m  [40m  [41m  [40m)
IF "%SysVer%" EQU "6.1" (ECHO                     Marca: %YourCOMPANY%) ELSE (ECHO          [36m           Marca: [33m%YourCOMPANY%)
IF "%SysVer%" EQU "6.1" (ECHO   лл  лл           Estado: %YourUF%) ELSE (ECHO    [41m  [40m  [41m  [40m[36m          Estado: [33m%YourUF%)
IF "%SysVer%" EQU "6.1" (ECHO   лллллл         Servidor: %Serv%) ELSE (ECHO    [41m      [40m[36m        Servidor: [33m%Serv%)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO  лллллллллллллллллллллллллллллллллллллллллллллллллллл) ELSE (ECHO  [41m                                                    [40m)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO                        SITES) ELSE (ECHO [36m                       SITES)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO  Escolha o Site Desejado) ELSE (ECHO [36m Escolha o Site Desejado)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO  [01] ^=^> ITSM) ELSE (ECHO [36m [[33m01[36m] ^=^> ITSM)
IF "%SysVer%" EQU "6.1" (ECHO  [02] ^=^> PFAT Producao Oncoprod) ELSE (ECHO [36m [[33m02[36m] ^=^> PFAT Producao Oncoprod)
IF "%SysVer%" EQU "6.1" (ECHO  [03] ^=^> PFAT Producao Panpharma) ELSE (ECHO [36m [[33m03[36m] ^=^> PFAT Producao Panpharma)
IF "%SysVer%" EQU "6.1" (ECHO  [04] ^=^> PFAT Producao Santa Cruz) ELSE (ECHO [36m [[33m04[36m] ^=^> PFAT Producao Santa Cruz)
IF "%SysVer%" EQU "6.1" (ECHO  [05] ^=^> Ponto WEB) ELSE (ECHO [36m [[33m05[36m] ^=^> Ponto WEB)
IF "%SysVer%" EQU "6.1" (ECHO  [06] ^=^> Vortice) ELSE (ECHO [36m [[33m06[36m] ^=^> Vortice)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO  [00] ^=^> MENU Principal) ELSE (ECHO [36m [[33m00[36m] ^=^> MENU Principal)
ECHO:
GOTO SITECHOICE

:SITECHOICE
CHOICE /C 0123456 /N /M "* Selecione uma das opcoes do MENU acima: "
IF "%ERRORLEVEL%" EQU "1" GOTO MENU
IF "%ERRORLEVEL%" EQU "2" GOTO ITSM
IF "%ERRORLEVEL%" EQU "3" GOTO PFATOP
IF "%ERRORLEVEL%" EQU "4" GOTO PFATPP
IF "%ERRORLEVEL%" EQU "5" GOTO PFATSC
IF "%ERRORLEVEL%" EQU "6" GOTO PONTOWEB
IF "%ERRORLEVEL%" EQU "7" GOTO VORTICE
GOTO SITECHOICE
::##################################################  PROGRAMAS  ###################################################
:7ZIP
Set AppPatch=7 ZIP\7z2107-x64.msi
ECHO:
IF Not Exist "%DeployRoot%\%AppPatch%" (ECHO  O Servidor %Serv%, nao possui este programa!& timeout /NOBREAK /T 3 >nul& GOTO MENU)
ECHO  Instalando 7 Zip ...
msiexec /i "%DeployRoot%\%AppPatch%" /qb /norestart >Nul
GOTO MENU

:ADOTI
ECHO:
ECHO  Instalando Adoti ...
net use X: \\10.41.12.172\NetMan$ /user:GRUPOSC\logisticasc a123456* >Nul
call X:\quick_install.bat >Nul
net use X: /DELETE /Y >Nul
GOTO MENU

:DANFEVIEW
Set AppPatch=Danfe View\idanfeview.exe
ECHO:
IF Not Exist "%DeployRoot%\%AppPatch%" (ECHO  O Servidor %Serv%, nao possui este programa!& timeout /NOBREAK /T 3 >nul& GOTO MENU)
ECHO  Instalando Danfe View 2.7.3 ...
"%DeployRoot%\%AppPatch%" /SILENT /SUPPRESSMSGBOXES /NORESTART >Nul
GOTO MENU

:OFFICE2010
Set AppPatch=Microsoft Office 2010 Standard\setup.exe
ECHO:
IF Not Exist "%DeployRoot%\%AppPatch%" (ECHO  O Servidor %Serv%, nao possui este programa!& timeout /NOBREAK /T 3 >nul& GOTO MENU)
ECHO  Instalando Microsoft Office 2010 Standard ...
"%DeployRoot%\%AppPatch%" /config "%DeployRoot%\Microsoft Office 2010 Standard\Standard.WW\config.xml" >Nul
ECHO:
ECHO  Ativando Microsoft Office 2010 Standard ...
ECHO:
cscript.exe "C:\Program Files\Microsoft Office\Office14\OSPP.vbs" /act >Nul
cscript.exe "C:\Program Files\Microsoft Office\Office14\OSPP.vbs" /dstatus | find /i "LICENSED" > NUL && ECHO  Ativado com Sucesso!|| ECHO  Falha na Ativacao!
timeout /NOBREAK /T 3 >nul
GOTO MENU

:OFFICE2013
Set AppPatch=Microsoft Office 2013 Standard\setup.exe
ECHO:
IF Not Exist "%DeployRoot%\%AppPatch%" (ECHO  O Servidor %Serv%, nao possui este programa!& timeout /NOBREAK /T 3 >nul& GOTO MENU)
ECHO  Instalando Microsoft Office 2013 Standard ...
"%DeployRoot%\%AppPatch%" /config "%DeployRoot%\Microsoft Office 2013 Standard\standard.ww\config.xml" >Nul
ECHO:
ECHO  Ativando Microsoft Office 2013 Standard ...
ECHO:
cscript.exe "C:\Program Files\Microsoft Office\Office15\OSPP.vbs" /act >Nul
cscript.exe "C:\Program Files\Microsoft Office\Office15\OSPP.vbs" /dstatus | find /i "LICENSED" > NUL && ECHO  Ativado com Sucesso!|| ECHO  Falha na Ativacao!
timeout /NOBREAK /T 3 >nul
GOTO MENU

:OFFICE2016
Set AppPatch=Microsoft Office 2016 Standard\setup.exe
ECHO:
IF Not Exist "%DeployRoot%\%AppPatch%" (ECHO  O Servidor %Serv%, nao possui este programa!& timeout /NOBREAK /T 3 >nul& GOTO MENU)
ECHO  Instalando Microsoft Office 2016 Standard ...
"%DeployRoot%\%AppPatch%" /config "%DeployRoot%\Microsoft Office 2016 Standard\standard.ww\config.xml" >Nul
"%DeployRoot%\KB5001998\KB5001998.exe" /quiet >Nul
ECHO:
ECHO  Ativando Microsoft Office 2016 Standard ...
ECHO:
cscript.exe "C:\Program Files\Microsoft Office\Office16\OSPP.vbs" /act >Nul
cscript.exe "C:\Program Files\Microsoft Office\Office16\OSPP.vbs" /dstatus | find /i "LICENSED" > NUL && ECHO  Ativado com Sucesso!|| ECHO  Falha na Ativacao!
timeout /NOBREAK /T 3 >nul
GOTO MENU

:OFFICE365
Set AppPatch=Microsoft Office 365 ProPlus\setup.exe
ECHO:
IF Not Exist "%DeployRoot%\%AppPatch%" (ECHO  O Servidor %Serv%, nao possui este programa!& timeout /NOBREAK /T 3 >nul& GOTO MENU)
FOR /f "tokens=4-7 delims=^[.^] " %%i in ('ver') DO (IF %%i==Version (SET SysVer=%%j.%%k) ELSE (SET SysVer=%%i.%%j))
IF "%SysVer%" EQU "6.1" (ECHO Este Instalador e incompativel&ECHO com seu sistema Operacional! &GOTO MENU)
ECHO  Instalando Office 365 Pro Plus ...
"%DeployRoot%\%AppPatch%" /configure "%DeployRoot%\Microsoft Office 365 ProPlus\installOfficeProPlus64.xml" >Nul
GOTO MENU

:TEAMS
Set AppPatch=Microsoft Teams\Teams_windows_x64.msi
ECHO:
IF Not Exist "%DeployRoot%\%AppPatch%" (ECHO  O Servidor %Serv%, nao possui este programa!& timeout /NOBREAK /T 3 >nul& GOTO MENU)
ECHO  Instalando Microsoft Teams ...
msiexec /i "%DeployRoot%\%AppPatch%" OPTIONS="noAutoStart=true" ALLUSERS=1 /qn /norestart >Nul
GOTO MENU

:MICROSIP
Set AppPatch=MicroSIP
ECHO:
IF Not Exist "%DeployRoot%\%AppPatch%" (ECHO  O Servidor %Serv%, nao possui este programa!& timeout /NOBREAK /T 3 >nul& GOTO MENU)
ECHO  Configurando MicroSIP ...
xcopy.exe "%DeployRoot%\%AppPatch%\*.*" "C:\ProgramData\GSC\MicroSIP\" /Q /H /E /I /Y >Nul
C:\ProgramData\GSC\MicroSIP\MicroSIP.bat >Nul
del "C:\Users\%username%\AppData\Local\MicroSIP\Install.bat" /S /Q >Nul
cscript.exe "C:\Users\%username%\AppData\Local\MicroSIP\shortcut.vbs" >Nul
REG LOAD HKU\TEMP "C:\Users\Default\ntuser.dat"
REG ADD HKU\TEMP\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v !MicroSIP /t REG_SZ /d "C:\ProgramData\GSC\MicroSIP\MicroSIP.bat"
REG UNLOAD HKU\TEMP
GOTO MENU

:CHROME
Set AppPatch=Google Chrome\googlechromestandaloneenterprise64.msi
ECHO:
IF Not Exist "%DeployRoot%\%AppPatch%" (ECHO  O Servidor %Serv%, nao possui este programa!& timeout /NOBREAK /T 3 >nul& GOTO MENU)
ECHO  Instalando Google Chrome ...
msiexec /i "%DeployRoot%\%AppPatch%" /qn /norestart >Nul
GOTO MENU

:FIREFOX
Set AppPatch=Mozila Firefox\Firefox Setup.msi
ECHO:
IF Not Exist "%DeployRoot%\%AppPatch%" (ECHO  O Servidor %Serv%, nao possui este programa!& timeout /NOBREAK /T 3 >nul& GOTO MENU)
ECHO  Instalando Mozila Firefox ...
msiexec /i "%DeployRoot%\%AppPatch%" /qn /norestart >Nul
GOTO MENU

:EDGE
Set AppPatch=Microsoft Edge\MicrosoftEdgeEnterpriseX64.msi
ECHO:
IF Not Exist "%DeployRoot%\%AppPatch%" (ECHO  O Servidor %Serv%, nao possui este programa!& timeout /NOBREAK /T 3 >nul& GOTO MENU)
ECHO  Instalando Microsoft Edge ...
msiexec /i "%DeployRoot%\%AppPatch%" /qn /norestart >Nul
GOTO MENU

:OPENVPN
Set AppPatch=OpenVPN\openvpn-connect.msi
ECHO:
IF Not Exist "%DeployRoot%\%AppPatch%" (ECHO  O Servidor %Serv%, nao possui este programa!& timeout /NOBREAK /T 3 >nul& GOTO MENU)
ECHO  Instalando OpenVPN Connect V3
msiexec /i "%DeployRoot%\%AppPatch%" /quiet /norestart >Nul
GOTO MENU

:ADOBEREADER
Set AppPatch=Adobe Reader DC\AdobeReader_setup.exe
ECHO:
IF Not Exist "%DeployRoot%\%AppPatch%" (ECHO  O Servidor %Serv%, nao possui este programa!& timeout /NOBREAK /T 3 >nul& GOTO MENU)
ECHO  Instalando Adobe Reader DC ...
"%DeployRoot%\%AppPatch%" /sAll /rs /msi EULA_ACCEPT=YES >Nul
GOTO MENU

:PDFCREATOR
Set AppPatch=PDF Creator\PDFCreator-2_5_2-Setup.exe
ECHO:
IF Not Exist "%DeployRoot%\%AppPatch%" (ECHO  O Servidor %Serv%, nao possui este programa!& timeout /NOBREAK /T 3 >nul& GOTO MENU)
ECHO  Instalando PDF Creator ...
"%DeployRoot%\%AppPatch%"/Printername="Imprimir em PDF" /Lang=PortugueseBrazil /noreboot /components=program,pdfarchitect,pdfarchitect\firefox,pdfarchitect\internetexplorer /silent >Nul
GOTO MENU

:RECONECTARWIFI
Set AppPatch=Reconectar Wi-Fi
ECHO:
IF Not Exist "%DeployRoot%\%AppPatch%" (ECHO  O Servidor %Serv%, nao possui este programa!& timeout /NOBREAK /T 3 >nul& GOTO MENU)
ECHO  Configurando Reconectar Wi-Fi ...
timeout /NOBREAK /T 2 >nul
xcopy "%DeployRoot%\%AppPatch%\*.*" "C:\ProgramData\GSC\Wi-Fi\" /Q /H /E /I /Y >Nul
del "C:\ProgramData\GSC\Wi-Fi\install.bat" /S /Q >Nul
REG LOAD HKU\TEMP "C:\Users\Default\ntuser.dat" >Nul
REG ADD HKU\TEMP\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v !WIFi /t REG_SZ /d "C:\ProgramData\GSC\Wi-Fi\shortcut.vbs" /f >Nul
REG UNLOAD HKU\TEMP >Nul
cscript.exe "C:\ProgramData\GSC\Wi-Fi\shortcut.vbs" >Nul
attrib +H +S "C:\ProgramData\GSC" >Nul
GOTO MENU

:COMERCIAL
Set AppPatch=Sisfat Comercial
ECHO:
IF Not Exist "%DeployRoot%\%AppPatch%" (ECHO  O Servidor %Serv%, nao possui este programa!& timeout /NOBREAK /T 3 >nul& GOTO MENU)
ECHO  Configurando Sisfat COMERCIAL ...
timeout /NOBREAK /T 2 >nul
IF exist "C:\Putty" (RD /S /Q "C:\Putty") >Nul
xcopy.exe "%DeployRoot%\%AppPatch%\*.*" "C:\Putty\" /Q /H /E /I /Y >Nul
REG LOAD HKU\TEMP "C:\Users\Default\ntuser.dat" >Nul
REG ADD HKU\TEMP\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v !Sisfat_CO /t REG_SZ /d "C:\Putty\comercial_new.bat" /f >Nul
REG ADD HKU\TEMP\Software\Microsoft\Windows\CurrentVersion\RunOnce /v !Sisfat_CO_Shortcut /t REG_SZ /d "C:\Putty\comercial.vbs" /f >Nul
REG UNLOAD HKU\TEMP >Nul
reg import C:\Putty\comercial.reg >Nul
cscript.exe "C:\Putty\comercial.vbs" >Nul
GOTO MENU

:LOGISTICA
Set AppPatch=Sisfat Logistica
ECHO:
IF Not Exist "%DeployRoot%\%AppPatch%" (ECHO  O Servidor %Serv%, nao possui este programa!& timeout /NOBREAK /T 3 >nul& GOTO MENU)
ECHO  Configurando Sisfat LOGISTICA ...
timeout /NOBREAK /T 2 >nul
IF exist "C:\Putty" (RD /S /Q "C:\Putty") >Nul
xcopy.exe "%DeployRoot%\%AppPatch%\*.*" "C:\Putty\" /Q /H /E /I /Y >Nul
REG LOAD HKU\TEMP "C:\Users\Default\ntuser.dat" >Nul
REG ADD HKU\TEMP\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v !Sisfat_LO /t REG_SZ /d "C:\Putty\logistica_new.bat" /f >Nul
REG ADD HKU\TEMP\Software\Microsoft\Windows\CurrentVersion\RunOnce /v !Sisfat_LO_Shortcut /t REG_SZ /d "C:\Putty\logistica.vbs" /f >Nul
REG UNLOAD HKU\TEMPreg import C:\Putty\logistica.reg >Nul
cscript.exe "C:\Putty\logistica.vbs" >Nul
GOTO MENU

:SAP
Set AppPatch=SAP GUI 740
ECHO:
IF Not Exist "%DeployRoot%\%AppPatch%" (ECHO  O Servidor %Serv%, nao possui este programa!& timeout /NOBREAK /T 3 >nul& GOTO MENU)
ECHO  Instalando SAP GUI 7.40 Patch 19...
"%DeployRoot%\%AppPatch%\Setup\NwSapSetup.exe" /Product="SAPGUI+SAPWUS+SCE" /nodlg >Nul
"%DeployRoot%\%AppPatch%\SAP Patch 19\gui740_19-10013011.exe" /nodlg >Nul
"%DeployRoot%\%AppPatch%\SAPSPrint\Setup\NwSapSetup.exe" /all /nodlg >Nul
cacls C:\Users\Public\Desktop /E /P Todos:F >Nul
Del "C:\Users\Public\Desktop\*.*" /S /Q >Nul
cscript.exe "%DeployRoot%\%AppPatch%\Shortcut.vbs" >Nul
cacls C:\Users\Public\Desktop /E /R Todos >Nul
GOTO MENU

:SAPEDITOR
Set AppPatch=Sap Text Editor\Setup.exe
ECHO:
IF Not Exist "%DeployRoot%\%AppPatch%" (ECHO  O Servidor %Serv%, nao possui este programa!& timeout /NOBREAK /T 3 >nul& GOTO MENU)
ECHO  Instalando SAP TextEditor...
"%DeployRoot%\%AppPatch%" /nodlg >Nul
GOTO MENU

:ITSM
ECHO:
IF Not Exist "%DeployRoot%\ITSM" (ECHO  O Servidor %Serv%, nao possui este programa!& timeout /NOBREAK /T 3 >nul& GOTO MENU)
ECHO Criando Atalho ITSM ...
timeout /NOBREAK /T 2 >nul
xcopy.exe "%DeployRoot%\ITSM\*.*" "C:\ProgramData\GSC\ITSM\" /Q /H /E /I /Y >Nul
REG LOAD HKU\TEMP "C:\Users\Default\ntuser.dat" >Nul
REG ADD HKU\TEMP\Software\Microsoft\Windows\CurrentVersion\RunOnce /v !ITSM_Shortcut /t REG_SZ /d "C:\ProgramData\GSC\ITSM\Shortcut.vbs" /f >Nul
REG UNLOAD HKU\TEMP >Nul
cscript.exe "C:\ProgramData\GSC\ITSM\Shortcut.vbs" >Nul
attrib +H +S "C:\ProgramData\GSC" >Nul
GOTO MENU

:PFATOP
ECHO:
IF Not Exist "%DeployRoot%\PFAT-OP" (ECHO  O Servidor %Serv%, nao possui este programa!& timeout /NOBREAK /T 3 >nul& GOTO MENU)
ECHO Criando Atalho PFAT Producao Oncoprod ...
timeout /NOBREAK /T 2 >nul
xcopy.exe "%DeployRoot%\PFAT-OP\*.*" "C:\ProgramData\GSC\PFAT-OP\" /Q /H /E /I /Y >Nul
REG LOAD HKU\TEMP "C:\Users\Default\ntuser.dat" >Nul
REG ADD HKU\TEMP\Software\Microsoft\Windows\CurrentVersion\RunOnce /v !PFAT_OP_Shortcut /t REG_SZ /d "C:\ProgramData\GSC\PFAT-OP\Shortcut.vbs" /f >Nul
REG UNLOAD HKU\TEMP >Nul
cscript.exe "C:\ProgramData\GSC\PFAT-OP\Shortcut.vbs" >Nul
attrib +H +S "C:\ProgramData\GSC" >Nul
GOTO MENU

:PFATPP
ECHO:
IF Not Exist "%DeployRoot%\PFAT-PP" (ECHO  O Servidor %Serv%, nao possui este programa!& timeout /NOBREAK /T 3 >nul& GOTO MENU)
ECHO Criando Atalho PFAT Producao Panpharma ...
timeout /NOBREAK /T 2 >nul
xcopy.exe "%DeployRoot%\PFAT-PP\*.*" "C:\ProgramData\GSC\PFAT-PP\" /Q /H /E /I /Y >Nul
REG LOAD HKU\TEMP "C:\Users\Default\ntuser.dat" >Nul
REG ADD HKU\TEMP\Software\Microsoft\Windows\CurrentVersion\RunOnce /v !PFAT_PP_Shortcut /t REG_SZ /d "C:\ProgramData\GSC\PFAT-PP\Shortcut.vbs" /f >Nul
REG UNLOAD HKU\TEMP >Nul
cscript.exe "C:\ProgramData\GSC\PFAT-PP\Shortcut.vbs" >Nul
attrib +H +S "C:\ProgramData\GSC" >Nul
GOTO MENU

:PFATSC
ECHO:
IF Not Exist "%DeployRoot%\PFAT-SC" (ECHO  O Servidor %Serv%, nao possui este programa!& timeout /NOBREAK /T 3 >nul& GOTO MENU)
ECHO Criando Atalho PFAT Producao Santa Cruz ...
timeout /NOBREAK /T 2 >nul
xcopy.exe "%DeployRoot%\PFAT-SC\*.*" "C:\ProgramData\GSC\PFAT-SC\" /Q /H /E /I /Y >Nul
REG LOAD HKU\TEMP "C:\Users\Default\ntuser.dat" >Nul
REG ADD HKU\TEMP\Software\Microsoft\Windows\CurrentVersion\RunOnce /v !PFAT_SC_Shortcut /t REG_SZ /d "C:\ProgramData\GSC\PFAT-SC\Shortcut.vbs" /f >Nul
REG UNLOAD HKU\TEMP >Nul
cscript.exe "C:\ProgramData\GSC\PFAT-SC\Shortcut.vbs" >Nul
attrib +H +S "C:\ProgramData\GSC" >Nul
GOTO MENU

:PONTOWEB
ECHO:
IF Not Exist "%DeployRoot%\Ponto WEB" (ECHO  O Servidor %Serv%, nao possui este programa!& timeout /NOBREAK /T 3 >nul& GOTO MENU)
ECHO Criando Atalho Ponto WEB ...
timeout /NOBREAK /T 2 >nul
xcopy.exe "%DeployRoot%\Ponto WEB\*.*" "C:\ProgramData\GSC\Ponto WEB\"  /Q /H /E /I /Y >Nul
REG LOAD HKU\TEMP "C:\Users\Default\ntuser.dat" >Nul
REG ADD HKU\TEMP\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v !PontoShortcut /t REG_SZ /d "C:\ProgramData\GSC\Ponto WEB\shortcut.vbs" /f >Nul
REG UNLOAD HKU\TEMP >Nul
cscript.exe "C:\ProgramData\GSC\Ponto WEB\shortcut.vbs" >Nul
attrib +H +S "C:\ProgramData\GSC" >Nul
GOTO MENU

:VORTICE
ECHO:
IF Not Exist "%DeployRoot%\Vortice" (ECHO  O Servidor %Serv%, nao possui este programa!& timeout /NOBREAK /T 3 >nul& GOTO MENU)
ECHO Criando Atalho Vortice ...
timeout /NOBREAK /T 2 >nul
xcopy.exe "%DeployRoot%\Vortice\*.*" "C:\ProgramData\GSC\Vortice\"  /Q /H /E /I /Y >Nul
REG LOAD HKU\TEMP "C:\Users\Default\ntuser.dat" >Nul
REG ADD HKU\TEMP\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v !VorticeShortcut /t REG_SZ /d "C:\ProgramData\GSC\Vortice\shortcut.vbs" /f >Nul
REG UNLOAD HKU\TEMP >Nul
cscript.exe "C:\ProgramData\GSC\Vortice\shortcut.vbs" >Nul
attrib +H +S "C:\ProgramData\GSC" >Nul
GOTO MENU

:SMARTGATE
ECHO:
IF Not Exist "%DeployRoot%\SmartGate" (ECHO  O Servidor %Serv%, nao possui este programa!& timeout /NOBREAK /T 3 >nul& GOTO MENU)
echo  Instalando Agente SmartGate 0.1.12 ...
"%DeployRoot%\SmartGate\VC_redist_x86.exe" /install /passive /norestart >Nul
msiexec /i "%DeployRoot%\SmartGate\smartgate-agente-installer.msi" /qn >Nul
"%ProgramFiles(x86)%\Ahgora Sistemas\Agente Smart Gate\smartgate-agente.exe" credentials a964761 8315c48bc3210d4be4338f5eaae6359c >Nul
echo:
echo  Instalacao Concluida...
timeout /NOBREAK /T 2 >nul
cls
echo:
echo  Verificando Registro...
echo:
reg query "HKLM\SOFTWARE\WOW6432Node\Ahgora Sistemas\Agente Smart Gate" | Find /i "a964761" >nul
timeout /NOBREAK /T 2 >nul
IF %errorlevel% EQU 0 (color 0A&echo  Cod da Empresa Localizado...) else (color 0C&echo  Cod da empresa nao localizado!&echo  Refaca a Instalacao...)
echo:
reg query "HKLM\SOFTWARE\WOW6432Node\Ahgora Sistemas\Agente Smart Gate" | Find /i "8315c48bc3210d4be4338f5eaae6359c" >nul
timeout /NOBREAK /T 2 >nul
IF %errorlevel% EQU 0 (color 0A&echo  Chave de ativacao localizada...) else (color 0C&echo  Chave de ativacao nao localizada!&echo  Refaca a Instalacao...)
echo:
timeout /NOBREAK /T 3 >nul
cls
GOTO MENU

:TREND
Set AppPatch=Trend Micro Apex One\agent_cloud_x64.msi
ECHO:
IF Not Exist "%DeployRoot%\%AppPatch%" (ECHO  O Servidor %Serv%, nao possui este programa!& timeout /NOBREAK /T 3 >nul& GOTO MENU)
ECHO  Instalando Trend Micro Apex One ...
msiexec /i "%DeployRoot%\%AppPatch%" /passive >Nul
GOTO MENU

:UNIDANFE
Set AppPatch=UniDanfe\iunidanfe3.exe
ECHO:
IF Not Exist "%DeployRoot%\%AppPatch%" (ECHO  O Servidor %Serv%, nao possui este programa!& timeout /NOBREAK /T 3 >nul& GOTO MENU)
ECHO  Instalando UniDanfe 3.8.14 ...
"%DeployRoot%\%AppPatch%" /SILENT /SUPPRESSMSGBOXES /NORESTART >Nul
GOTO MENU

::############################################  MENU DE CONFIGURACOES  #############################################
:MENUCONFIG
mode con cols=54 lines=27
cls
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO   лллллл        PADRONIZACAO DE EQUIPAMENTOS) ELSE (ECHO    [41m      [40m[36m        PADRONIZACAO DE EQUIPAMENTOS)
IF "%SysVer%" EQU "6.1" (ECHO   лл  лл) ELSE (ECHO    [41m  [40m  [41m  [40m)
IF "%SysVer%" EQU "6.1" (ECHO                     Marca: %YourCOMPANY%) ELSE (ECHO          [36m           Marca: [33m%YourCOMPANY%)
IF "%SysVer%" EQU "6.1" (ECHO   лл  лл           Estado: %YourUF%) ELSE (ECHO    [41m  [40m  [41m  [40m[36m          Estado: [33m%YourUF%)
IF "%SysVer%" EQU "6.1" (ECHO   лллллл         Servidor: %Serv%) ELSE (ECHO    [41m      [40m[36m        Servidor: [33m%Serv%)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO  лллллллллллллллллллллллллллллллллллллллллллллллллллл) ELSE (ECHO  [41m                                                    [40m)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO                  CONFIGURACOES PADROES) ELSE (ECHO [36m                 CONFIGURACOES PADROES)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO  Escolha as Configuracoes desejadas) ELSE (ECHO [36m Escolha as Configuracoes desejadas)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO  [01] ^=^> Administrativo) ELSE (ECHO [36m [[33m01[36m] ^=^> Administrativo)
IF "%SysVer%" EQU "6.1" (ECHO  [02] ^=^> Logistica) ELSE (ECHO [36m [[33m02[36m] ^=^> Logistica)
IF "%SysVer%" EQU "6.1" (ECHO  [03] ^=^> RH) ELSE (ECHO [36m [[33m03[36m] ^=^> RH)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO  [00] ^=^> MENU Principal) ELSE (ECHO [36m [[33m00[36m] ^=^> MENU Principal)
ECHO:
GOTO CONFIGCHOICE

:CONFIGCHOICE
CHOICE /C 0123 /N /M "* Selecione uma das opcoes do MENU acima: "
::##################################################  CONFIG-ADM  ##################################################
IF "%ERRORLEVEL%" EQU "1" GOTO MENU
IF "%ERRORLEVEL%" EQU "2" (
	IF "%SysVer%" EQU "6.1" (
		xcopy.exe "%DeployRoot%\Scripts\STC Scripts\SAP\W7\ADM\*.*" "C:\Scripts\SAP\" /Q /H /E /I /Y&GOTO CONFIGURAR >Nul
	) ELSE (
		xcopy.exe "%DeployRoot%\Scripts\STC Scripts\SAP\W10\ADM\*.*" "C:\Scripts\SAP\" /Q /H /E /I /Y&GOTO CONFIGURAR >Nul
	)
)
::##################################################  CONFIG-LOG  ##################################################
IF "%ERRORLEVEL%" EQU "3" (
	IF "%SysVer%" EQU "6.1" (
		xcopy.exe "%DeployRoot%\Scripts\STC Scripts\SAP\W7\LOG\*.*" "C:\Scripts\SAP\" /Q /H /E /I /Y&GOTO CONFIGURAR >Nul
	) ELSE (
		xcopy.exe "%DeployRoot%\Scripts\STC Scripts\SAP\W10\LOG\*.*" "C:\Scripts\SAP\" /Q /H /E /I /Y&GOTO CONFIGURAR >Nul
	)
)
::##################################################  CONFIG-ARH  ##################################################
IF "%ERRORLEVEL%" EQU "4" (
	IF "%SysVer%" EQU "6.1" (
		xcopy.exe "%DeployRoot%\Scripts\STC Scripts\SAP\W7\RH\*.*" "C:\Scripts\SAP\" /Q /H /E /I /Y&GOTO CONFIGURAR >Nul
	) ELSE (
		xcopy.exe "%DeployRoot%\Scripts\STC Scripts\SAP\W10\RH\*.*" "C:\Scripts\SAP\" /Q /H /E /I /Y&GOTO CONFIGURAR >Nul
	)
)
GOTO CONFIGCHOICE
::#####################################  CONFIGURACOES PADROES NO EQUIPAMENTO  #####################################
:CONFIGURAR
cacls C:\Users\Public\Desktop /E /P Todos:F >Nul
xcopy.exe "%DeployRoot%\Scripts\STC Scripts\Proxy\Configurar Proxy.vbs" "C:\ProgramData\GSC\Proxy\" /Q /H /E /I /Y >Nul
xcopy.exe "%DeployRoot%\Scripts\Protected Scripts\CertIFicados\*.*" "C:\ProgramData\GSC\CertIFicado\" /Q /H /E /I /Y >Nul
xcopy.exe "%DeployRoot%\Scripts\STC Scripts\services" "C:\Windows\System32\Drivers\etc\" /Q /H /E /I /Y >Nul
xcopy.exe "%DeployRoot%\Scripts\STC Scripts\Detect\*.*" "C:\ProgramData\GSC\Detect\" /Q /H /E /I /Y >Nul
xcopy.exe "%DeployRoot%\Scripts\STC Scripts\IP_Intranet\*.*" "C:\ProgramData\GSC\IP_Intranet\" /Q /H /E /I /Y >Nul
xcopy.exe "%DeployRoot%\Scripts\Protected Scripts\Activate_Windows\Ativar.bat" "%userprofile%\Desktop\" /Q /H /E /I /Y >Nul
reg import "C:\ProgramData\GSC\IP_Intranet\Add_IP_Intranet.reg" >Nul
Del "C:\Users\Public\Desktop\SAP Logon.lnk" /S /Q >Nul
xcopy.exe "%DeployRoot%\Scripts\STC Scripts\Shortcuts\*.*" "C:\Users\Public\Desktop\" /Q /H /E /I /Y >Nul
IF "%SysVer%" EQU "6.1" (
	xcopy.exe "%DeployRoot%\Scripts\STC Scripts\Printers\W7\STC Printers.bat" "C:\ProgramData\GSC\Printers\" /Q /H /E /I /Y >Nul
) ELSE (
	xcopy.exe "%DeployRoot%\Scripts\STC Scripts\Printers\W10\STC Printers.bat" "C:\ProgramData\GSC\Printers\" /Q /H /E /I /Y >Nul
	powershell.exe Enable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol -NoRestart >Nul
)
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v Detect /t REG_SZ /d "C:\ProgramData\GSC\Detect\Detect.vbs" /f >Nul
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f >Nul
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f >Nul
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" /v DisabledComponents /t REG_DWORD /d 0xFF /f >Nul
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v fAllowToGetHelp /t REG_DWORD /d 1 /f >Nul
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v AllowRemoteRPC /t REG_DWORD /d 1 /f >Nul
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v shadow /t REG_DWORD /d 1 /f >Nul
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v fAllowUnsolicited /t REG_DWORD /d 1 /f >Nul
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v fAllowUnsolicitedFullControl /t REG_DWORD /d 1 /f >Nul
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\RAUnsolicit" /v "gruposc.local\Domain Users" /t REG_SZ /f >Nul
REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v "eyeBeam SIP Client" /f >Nul
REG LOAD HKU\TEMP "C:\Users\Default\ntuser.dat" >Nul
REG ADD HKU\TEMP\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v !STCPrinters /t REG_SZ /d "C:\ProgramData\GSC\Printers\STC Printers.bat" /f >Nul
REG ADD HKU\TEMP\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v !IPIntranet /t REG_SZ /d "C:\ProgramData\GSC\IP_Intranet\Add_IP_Intranet.bat" /f >Nul
REG ADD HKU\TEMP\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v !SAPConnections /t REG_SZ /d "C:\Scripts\SAP\SAP.bat" /f >Nul
REG UNLOAD HKU\TEMP >Nul
IF "%SysVer%" EQU "6.1" (
	takeown /F "C:\Windows\System32\oobe" /A /R /D Y
	cacls "C:\Windows\System32\oobe" /E /T /G Administrador:F
	xcopy.exe "%DeployRoot%\Scripts\STC Scripts\Lockscreen\backgroundDefault.jpg" "C:\Windows\System32\oobe\info\backgrounds\" /Q /H /E /I /Y
	REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\Background" /v OEMBackground /t REG_DWORD /d 1 /f
) ELSE (
	takeown /F "C:\ProgramData\Microsoft\Windows\SystemData" /A /R /D Y >Nul
	takeown /F "C:\Windows\Web\Screen" /A /R /D Y >Nul
	cacls "C:\ProgramData\Microsoft\Windows\SystemData" /E /T /G Administrador:F >Nul
	cacls "C:\Windows\Web\Screen" /E /T /G Administrador:F >Nul
	xcopy.exe "%DeployRoot%\Scripts\STC Scripts\Lockscreen\backgroundDefault.jpg" "C:\Windows\Web\Screen\" /Q /H /E /I /Y >Nul
	REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP /f >Nul
	REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP /v LockScreenImagePath /t REG_SZ /d "C:\Windows\Web\Screen\backgroundDefault.jpg" /f >Nul
	REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP /v LockScreenImageUrl /t REG_SZ /d "C:\Windows\Web\Screen\backgroundDefault.jpg" /f >Nul
	REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP /v LockScreenImageStatus /t REG_DWORD /d 1 /f >Nul
	icacls "C:\ProgramData\Microsoft\Windows\SystemData" /reset /t /c /l >Nul
)
cacls C:\Users\Public\Desktop /E /R Todos >Nul
attrib +H +S "C:\ProgramData\GSC" >Nul
attrib +H +S "C:\Scripts" >Nul
GOTO REDE
::#####################################  CONFIGURACOES DE REDE DO EQUIPAMENTO  #####################################
:REDE
mode con cols=54 lines=27
cls
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO   лллллл        PADRONIZACAO DE EQUIPAMENTOS) ELSE (ECHO    [41m      [40m[36m        PADRONIZACAO DE EQUIPAMENTOS)
IF "%SysVer%" EQU "6.1" (ECHO   лл  лл) ELSE (ECHO    [41m  [40m  [41m  [40m)
IF "%SysVer%" EQU "6.1" (ECHO                     Marca: %YourCOMPANY%) ELSE (ECHO          [36m           Marca: [33m%YourCOMPANY%)
IF "%SysVer%" EQU "6.1" (ECHO   лл  лл           Estado: %YourUF%) ELSE (ECHO    [41m  [40m  [41m  [40m[36m          Estado: [33m%YourUF%)
IF "%SysVer%" EQU "6.1" (ECHO   лллллл         Servidor: %Serv%) ELSE (ECHO    [41m      [40m[36m        Servidor: [33m%Serv%)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO  лллллллллллллллллллллллллллллллллллллллллллллллллллл) ELSE (ECHO  [41m                                                    [40m)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO              CONFIGURACOES DE REDE) ELSE (ECHO [36m             CONFIGURACOES DE REDE)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO  Escolha o Equipamento a ser Configurado) ELSE (ECHO [36m Escolha o Equipamento a ser Configurado)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO  [01] ^=^> Desktop - Fixo no CD) ELSE (ECHO [36m [[33m01[36m] ^=^> Desktop - Fixo no CD)
IF "%SysVer%" EQU "6.1" (ECHO  [02] ^=^> Desktop - Home Office) ELSE (ECHO [36m [[33m02[36m] ^=^> Desktop - Home Office)
IF "%SysVer%" EQU "6.1" (ECHO  [03] ^=^> Notebook) ELSE (ECHO [36m [[33m03[36m] ^=^> Notebook)
ECHO:
GOTO REDECHOICE

:REDECHOICE
CHOICE /C 0123 /N /M "* Selecione uma das opcoes do MENU acima: "
IF "%ERRORLEVEL%" EQU "1" GOTO DESKTOP
IF "%ERRORLEVEL%" EQU "2" GOTO NOTEBOOK
IF "%ERRORLEVEL%" EQU "3" GOTO NOTEBOOK
GOTO REDECHOICE
::################################################  CONFIG-DESKTOP  ################################################
:DESKTOP
netsh advfirewall set allprofile state off >Nul
netsh wlan add filter permission=denyall networktype=adhoc >Nul
netsh wlan add filter permission=denyall networktype=infrastructure >Nul
netsh wlan add filter permission=allow ssid=GSC-ADM networktype=infrastructure >Nul
netsh wlan add profile filename="%DeployRoot%\Scripts\Protected Scripts\Wi-Fi-GSC-ADM.xml" USER=all >Nul
GOTO MENU
::###############################################  CONFIG-NOTEBOOK  ################################################
:NOTEBOOK
netsh advfirewall set allprofile state off >Nul
netsh wlan add filter permission=allow ssid=GSC-ADM networktype=infrastructure >Nul
netsh wlan add filter permission=block ssid=GSC-VISITANTES networktype=infrastructure >Nul
netsh wlan add filter permission=block ssid=GSC-COLETOR networktype=infrastructure >Nul
netsh wlan add filter permission=block ssid=GSC-DRM networktype=infrastructure
netsh wlan add profile filename="%DeployRoot%\Scripts\Protected Scripts\Wi-Fi-GSC-ADM.xml" USER=all >Nul
GOTO MENU

:ERRO
mode con cols=54 lines=14
cls
color 4F
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO   лллллл        PADRONIZACAO DE EQUIPAMENTOS) ELSE (ECHO    [41m      [40m[36m        PADRONIZACAO DE EQUIPAMENTOS)
IF "%SysVer%" EQU "6.1" (ECHO   лл  лл) ELSE (ECHO    [41m  [40m  [41m  [40m)
IF "%SysVer%" EQU "6.1" (ECHO                     Marca: %YourCOMPANY%) ELSE (ECHO          [36m           Marca: [33m%YourCOMPANY%)
IF "%SysVer%" EQU "6.1" (ECHO   лл  лл           Estado: %YourUF%) ELSE (ECHO    [41m  [40m  [41m  [40m[36m          Estado: [33m%YourUF%)
IF "%SysVer%" EQU "6.1" (ECHO   лллллл         Servidor: %Serv%) ELSE (ECHO    [41m      [40m[36m        Servidor: [33m%Serv%)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO  лллллллллллллллллллллллллллллллллллллллллллллллллллл) ELSE (ECHO  [41m                                                    [40m)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO                   OPCAO INVALIDA) ELSE (ECHO                  [31m OPCAO INVALIDA)
ECHO:
IF "%SysVer%" EQU "6.1" (ECHO  Escolha uma das opcoes apresentadas!) ELSE (ECHO [31m Escolha uma das opcoes apresentadas!)
ECHO:
timeout /NOBREAK /T 4 >nul
GOTO MENU

:START-W7
title Identificando...
mode con cols=54 lines=5
color 0F
set "X=1"
:1
set /A "Y=%X%+1"
set  "X=%Y%"
IF "%Y%" == "40" (cls& echo:& echo  [л...................] 5%% Carregando...) else (goto 1)
set "X=1"
:2
set /A "Y=%X%+1"
set  "X=%Y%"
IF "%Y%" == "40" (cls& echo:& echo  [лл..................] 10%% Carregando...) else (goto 2)
set "X=1"
:3
set /A "Y=%X%+1"
set  "X=%Y%"
IF "%Y%" == "40" (cls& echo:& echo  [лллллл..............] 30%% Carregando...) else (goto 3)
set "X=1"
:4
set /A "Y=%X%+1"
set  "X=%Y%"
IF "%Y%" == "40" (cls& echo:& echo  [лллллллллл..........] 50%% Carregando...) else (goto 4)
set "X=1"
:5
set /A "Y=%X%+1"
set  "X=%Y%"
IF "%Y%" == "40" (cls& echo:& echo  [лллллллллллллл......] 70%% Carregando...) else (goto 5)
set "X=1"
:6
set /A "Y=%X%+1"
set  "X=%Y%"
IF "%Y%" == "40" (cls& echo:& echo  [лллллллллллллллллл..] 90%% Carregando...) else (goto 6)
set "X=1"
:7
set /A "Y=%X%+1"
set  "X=%Y%"
IF "%Y%" == "40" (cls& echo:& echo  [лллллллллллллллллллл] 100%% Carregando...) else (goto 7)
echo:
echo  Carregado...
timeout /NOBREAK /T 2 >nul
GOTO ANALISIS

:START-W10
title Identificando...
mode con cols=54 lines=4
color 0F
SETLOCAL EnableDelayedExpansion
set /a "processValue=100"
set "bar=л"
set "tbd=."
set "barLength=52"
( set LF=^
%=-----------DO NOT REMOVE THIS LINE. the LF variable is for future use in a function, it's currently useless-----------=%
)
echo:
FOR /F %%B in ('prompt $E ^& ^<nul cmd /k') do set "ESC=%%B"
echo:
for /l %%N in (0,1,%barLength%) do set "emptybar=!emptybar! "
for /l %%N in (0 1 !barLength!) do echo(!LF!%ESC%[2A%ESC%[%%NC%tbd%
for /L %%N in (0 1 %processValue%) do (
  set /a showBar=%%N*barLength/processValue
  set /a percentage=%%N*100/processValue
  echo( Carregando: %%N/%processValue% = !percentage!%%!LF!%ESC%[2A%ESC%[!showBar!C%bar%
  ping -4 -n 1 127.0.0.1 >nul 
)
timeout /NOBREAK /T 2 >nul
ENDLOCAL
GOTO ANALISIS
