# Defina o nome do repositório e usuário
$usuario = "MPC9427"
$repositorio = "Projetos Sistemas"

# Caminho temporário para clonar o Wiki
$wikiPath = "$env:TEMP\$repositorio-wiki"

# Clona o repositório Wiki
git clone "https://github.com/MPC9427/Projetos-Sistemas.wiki.git" $wikiPath

# Navega até o diretório clonado
Set-Location $wikiPath

# Remove todos os arquivos do Wiki
git rm -r *

# Commit da exclusão
git commit -m "Removendo todo o conteúdo do Wiki"

# Push para o repositório Wiki
git push

# Volta ao diretório anterior
Pop-Location

# Remove o diretório temporário
Remove-Item -Recurse -Force $wikiPath

Write-Host "Wiki limpo com sucesso!"