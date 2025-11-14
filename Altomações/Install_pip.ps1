# Verifica se o Python está instalado
$pythonPath = Get-Command python -ErrorAction SilentlyContinue
if (-not $pythonPath) {
    Write-Host "Python não está instalado. Por favor, instale o Python em https://www.python.org/downloads/"
    exit
}

# Verifica se o pip está disponível
$pipPath = Get-Command pip -ErrorAction SilentlyContinue
if (-not $pipPath) {
    Write-Host "pip não está disponível diretamente. Tentando localizar via Python..."

    # Tenta localizar o pip via Python
    $pipViaPython = python -m pip --version
    if ($pipViaPython) {
        Write-Host "pip está disponível via 'python -m pip'."
    } else {
        Write-Host "pip não está instalado. Instalando pip..."
        python -m ensurepip --default-pip
    }
}

# Adiciona o caminho do Scripts ao PATH do usuário
$pythonScriptsPath = "$($pythonPath.Source.Replace('python.exe',''))Scripts"
$envPath = [Environment]::GetEnvironmentVariable("Path", "User")

if ($envPath -notlike "*$pythonScriptsPath*") {
    [Environment]::SetEnvironmentVariable("Path", "$envPath;$pythonScriptsPath", "User")
    Write-Host "Caminho do pip adicionado ao PATH do usuário. Reinicie o PowerShell para aplicar."
} else {
    Write-Host "O caminho do pip já está no PATH."
}

