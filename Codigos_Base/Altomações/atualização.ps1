# Navega até o diretório do repositório (ajuste conforme necessário)
Set-Location "C:\Users\moises.costa\Desktop\Projetos Sistemas"

# Adiciona todos os arquivos modificados
git add .

# Solicita uma mensagem de commit ao usuário
$commitMessage = Read-Host "Sucesso"

# Realiza o commit com a mensagem fornecida
git commit -m "$commitMessage"

# Envia as alterações para o repositório remoto (branch principal)
git push origin main