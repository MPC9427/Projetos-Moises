Dim fso, origem, destino
origem = "C:\Users\moises.costa\Desktop\Notas"
destino = "C:\Users\moises.costa\Desktop\Backup"

Set fso = CreateObject("Scripting.FileSystemObject")
If Not fso.FolderExists(destino) Then
    fso.CreateFolder destino
End If

fso.CopyFolder origem, destino, True
MsgBox "Backup concluído com sucesso!"
