import os
import datetime
import tkinter as tk
from tkinter import messagebox, scrolledtext

LOG_FILE = f"log_gerenciador_{datetime.date.today()}.txt"


# =========================================================
# Função de log (print + arquivo + GUI)
# =========================================================
def log(mensagem: str):
    console.insert(tk.END, f"{mensagem}\n")
    console.see(tk.END)
    with open(LOG_FILE, "a", encoding="utf-8") as f:
        f.write(f"[{datetime.datetime.now()}] {mensagem}\n")
    root.update()


# =========================================================
# Ações principais
# =========================================================
def instalar_programas():
    if not os.path.exists("programas.txt"):
        log("⚠️ Arquivo 'programas.txt' não encontrado! Criando modelo...")
        with open("programas.txt", "w", encoding="utf-8") as f:
            f.write("Google.Chrome\nMicrosoft.VisualStudioCode\nGit.Git\nPython.Python.3.12\n")
        messagebox.showinfo(
            "Arquivo criado",
            "O arquivo 'programas.txt' foi criado.\nEdite-o para adicionar os programas desejados."
        )
        return

    with open("programas.txt", "r", encoding="utf-8") as f:
        programas = [p.strip() for p in f if p.strip()]

    log("🚀 Iniciando instalação dos programas...\n")

    for app in programas:
        log(f"🔧 Instalando {app} ...")
        resultado = os.system(f"winget install -e --id {app} -h")
        if resultado == 0:
            log(f"✅ {app} instalado com sucesso!\n")
        else:
            log(f"❌ Erro ao instalar {app}.\n")

    messagebox.showinfo("Concluído", "Instalação finalizada! Veja o log na tela.")


def atualizar_programas():
    log("🔄 Atualizando todos os programas via Winget...\n")
    resultado = os.system("winget upgrade --all -h")
    if resultado == 0:
        log("✅ Todos os programas foram atualizados com sucesso!\n")
        messagebox.showinfo("Sucesso", "Todos os programas foram atualizados!")
    else:
        log("⚠️ Alguns programas podem não ter sido atualizados.\n")
        messagebox.showwarning("Aviso", "Alguns programas podem não ter sido atualizados.")


def verificar_programas():
    log("🔍 Verificando atualizações disponíveis...\n")
    os.system("winget upgrade")
    log("✅ Verificação concluída. Veja a saída acima.\n")


def limpar_console():
    console.delete(1.0, tk.END)


def sair():
    if messagebox.askyesno("Sair", "Deseja realmente fechar o gerenciador?"):
        root.destroy()


# =========================================================
# Interface gráfica (Tkinter)
# =========================================================
root = tk.Tk()
root.title("🧰 Gerenciador de Programas (Winget)")
root.geometry("700x500")
root.resizable(False, False)

# Título
tk.Label(root, text="Gerenciador de Programas - Power by Winget", font=("Segoe UI", 14, "bold")).pack(pady=10)

# Botões
frame_botoes = tk.Frame(root)
frame_botoes.pack(pady=5)

btn_instalar = tk.Button(frame_botoes, text="📦 Instalar Programas", width=25, command=instalar_programas)
btn_atualizar = tk.Button(frame_botoes, text="🔄 Atualizar Programas", width=25, command=atualizar_programas)
btn_verificar = tk.Button(frame_botoes, text="🔍 Verificar Atualizações", width=25, command=verificar_programas)
btn_limpar = tk.Button(frame_botoes, text="🧹 Limpar Log", width=25, command=limpar_console)
btn_sair = tk.Button(frame_botoes, text="❌ Sair", width=25, command=sair)

btn_instalar.grid(row=0, column=0, padx=5, pady=5)
btn_atualizar.grid(row=0, column=1, padx=5, pady=5)
btn_verificar.grid(row=1, column=0, padx=5, pady=5)
btn_limpar.grid(row=1, column=1, padx=5, pady=5)
btn_sair.grid(row=2, column=0, columnspan=2, pady=5)

# Área de log
tk.Label(root, text="🧾 Log de Execução:", font=("Segoe UI", 11, "bold")).pack()
console = scrolledtext.ScrolledText(root, width=80, height=15, font=("Consolas", 10))
console.pack(pady=5)

# Rodapé
tk.Label(root, text="© 2025 - Moises Piva | Gerenciador Power by Python + Winget", font=("Segoe UI", 8)).pack(side=tk.BOTTOM, pady=5)

root.mainloop()