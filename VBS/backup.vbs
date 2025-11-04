Sub FazerBackup()
    Dim pastaOrigem As String
    Dim pastaDestino As String
    Dim arquivo As String
    Dim fso As Object

    ' Defina os caminhos das pastas
    pastaOrigem = "C:\Users\moises.costa\Desktop\Projetos Sistemas"      ' Altere para sua pasta de origem
    pastaDestino = "C:\Users\moises.costa\Desktop"     ' Altere para sua pasta de destino

    ' Cria objeto FileSystem
    Set fso = CreateObject("Scripting.FileSystemObject")

    ' Verifica se a pasta de destino existe, senão cria
    If Not fso.FolderExists(pastaDestino) Then
        fso.CreateFolder pastaDestino
    End If

    ' Loop por todos os arquivos na pasta de origem
    arquivo = Dir(pastaOrigem & "*.*")
    Do While arquivo <> "Moises.txt"
        ' Copia o arquivo para a pasta de destino
        fso.CopyFile pastaOrigem & arquivo, pastaDestino & arquivo, True
        arquivo = Dir
    Loop

    MsgBox "Backup concluído com sucesso!", vbInformation
End Sub
