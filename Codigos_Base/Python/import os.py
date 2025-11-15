import os

# Lista de programas para instalar (nomes como no Winget)
programas = [
    "Google.Chrome",
    "Microsoft.VisualStudioCode",
    "7zip.7zip",
    "Git.Git",
    "Python.Python.3.12"
]

for app in programas:
    print(f"🔧 Instalando {app}...")
    os.system(f"winget install -e --id {app} -h")  # -h = modo silencioso