Dim pastaOrigem, pastaDestino, fso, pasta, arquivo, dataLimite, logFile, logText, novoNome, timestamp

pastaOrigem = "C:\Users\moises.costa\Desktop\"
pastaDestino = "C:\Users\moises.costa\Desktop\Backup\"
dataLimite = Now - 1 ' Últimas 24 horas
timestamp = Replace(FormatDateTime(Now, 2), "/", "-") & "_" & Replace(FormatDateTime(Now, 4), ":", "-")
logFile = pastaDestino & "backup_log_" & timestamp & ".txt"
logText = ""

On Error Resume Next
Set fso = CreateObject("Scripting.FileSystemObject")

If Not fso.FolderExists(pastaDestino) Then
    fso.CreateFolder pastaDestino
End If

Set pasta = fso.GetFolder(pastaOrigem)

For Each arquivo In pasta.Files
    If LCase(fso.GetFileName(arquivo)) <> "moises.txt" Then
        If LCase(fso.GetExtensionName(arquivo)) = "txt" Then
            If arquivo.DateLastModified >= dataLimite Then
                novoNome = fso.GetBaseName(arquivo) & "_" & timestamp & "." & fso.GetExtensionName(arquivo)
                fso.CopyFile arquivo.Path, pastaDestino & novoNome, True
                logText = logText & "Copiado: " & arquivo.Name & " como " & novoNome & vbCrLf
            End If
        End If
    End If
Next

If logText <> "" Then
    Dim log
    Set log = fso.CreateTextFile(logFile, True)
    log.WriteLine "Backup realizado em " & Now
    log.WriteLine logText
    log.Close
    MsgBox "Backup concluído com sucesso!" & vbCrLf & "Log salvo em: " & logFile
Else
    MsgBox "Nenhum arquivo para backup nas últimas 24 horas."
End If





