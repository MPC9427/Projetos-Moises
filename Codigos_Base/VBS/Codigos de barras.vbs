' Script VBS para gerar código de barras com ActiveBarcode
Dim shell, codigo, comando

codigo = InputBox("Digite o número para gerar o código de barras:", "Gerador de Código de Barras")

If codigo <> "" Then
    Set shell = CreateObject("WScript.Shell")
    comando = """C:\Program Files\ActiveBarcode\ActiveBarcodeCLI.exe"" /barcode:Code128 /text:" & codigo & " /width:400 /height:150 /outfile:C:\Temp\codigo.png"
    shell.Run comando, 1, True
    MsgBox "Código de barras gerado com sucesso em C:\Temp\codigo.png", vbInformation, "Concluído"
Else
    MsgBox "Nenhum código foi inserido.", vbExclamation, "Cancelado"
End If

