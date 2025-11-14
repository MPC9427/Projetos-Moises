import subprocess

def git_automacao(mensagem_commit):
    try:
        # Adiciona todos os arquivos
        subprocess.run(["git", "add", "."], check=True)

        # Faz o commit com a mensagem fornecida
        subprocess.run(["git", "commit", "-m", mensagem_commit], check=True)

        # Faz o push para a branch main
        subprocess.run(["git", "push", "origin", "main"], check=True)

        print("✅ Commit e push realizados com sucesso!")
    except subprocess.CalledProcessError as e:
        print(f"❌ Erro ao executar comando Git: {e}")

# Exemplo de uso
mensagem = input("Digite a mensagem do commit: ")
git_automacao(mensagem)