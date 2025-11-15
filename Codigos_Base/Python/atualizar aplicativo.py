import os
import datetime

# Cria log da execução
log_file = f"atualizacao_log_{datetime.date.today()}.txt"

def atualizar_programas():
    print("🔄 Atualizando todos os programas com Winget...\n")
    comando = "winget upgrade --all -h"  # -h = modo silencioso
    resultado = os.system(comando)

    if resultado == 0:
        print("\n✅ Todos os programas foram atualizados com sucesso!")
    else:
        print("\n⚠️ Ocorreu um erro ao atualizar alguns programas.")

    # Salva log
    with open(log_file, "a", encoding="utf-8") as log:
        log.write(f"Execução em {datetime.datetime.now()} - Código de retorno: {resultado}\n")

if __name__ == "__main__":
    atualizar_programas()