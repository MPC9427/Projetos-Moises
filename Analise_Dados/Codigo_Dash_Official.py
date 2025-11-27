import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from PIL import Image
import os
from datetime import datetime

# Copiar dados enviados pelo Power BI
df = dataset.copy()

# 🎨 Estilo visual claro (fundo branco)
sns.set_theme(style="whitegrid")
plt.rcParams["axes.titlesize"] = 20
plt.rcParams["axes.labelsize"] = 16
plt.rcParams["figure.facecolor"] = "white"
plt.rcParams["axes.facecolor"] = "white"
plt.rcParams["text.color"] = "#0a3d3f"
plt.rcParams["axes.labelcolor"] = "#0a3d3f"
plt.rcParams["xtick.color"] = "#0a3d3f"
plt.rcParams["ytick.color"] = "#0a3d3f"

# Paletas modernas
palette_teal = sns.color_palette("crest", 10)
palette_green = sns.color_palette("Greens_r", 10)

# Criar subplots apenas para os gráficos desejados
fig, axes = plt.subplots(2, 2, figsize=(18, 12))

# Título principal + subtítulo
fig.suptitle(
    "Dashboard Inventário de Computadores\nDados consolidados de ativos de TI",
    fontsize=25, fontweight="bold", color="#0a3d3f", ha="center"
)

# Ajustar espaçamento para não sobrepor gráficos
plt.subplots_adjust(top=0.85)


# ==========================================
# ✅ Ícone maior no canto superior esquerdo
# ==========================================
logo_path = r"C:\Users\moises.costa\Desktop\Projetos\Analise_Dados\logo.png"
if os.path.isfile(logo_path):
    try:
        img = Image.open(logo_path).convert("RGBA")
        ax_icon = fig.add_axes([0.01, 0.88, 0.12, 0.12])  # logo maior
        ax_icon.imshow(img)
        ax_icon.axis("off")
    except Exception as e:
        print("⚠️ Erro ao carregar o ícone:", e)
else:
    print("⚠️ Ícone não encontrado:", logo_path)

# ===================================
# ✅ KPI – Totais (versão melhorada)
# ===================================
total_computadores = df["Nome do Computador"].nunique()
total_marcas = df["Marca"].nunique()
total_fabricantes = df["Fabricante"].nunique()
total_modelos = df["Modelo"].nunique()
total_sistemas = df["Sistema Operacional"].nunique()

# Lista de KPIs com rótulos e valores
kpis = [
    ("Computadores", total_computadores, "#1a237e"),   # azul escuro
    ("Marcas", total_marcas, "#00695c"),              # verde teal
    ("Fabricantes", total_fabricantes, "#8e24aa"),    # roxo
    ("Modelos", total_modelos, "#ef6c00"),            # laranja
    ("Sistemas Operacionais", total_sistemas, "#c62828") # vermelho
]

# Limpar eixo
axes[0, 0].axis("off")
axes[0, 0].set_title("KPIs Gerais", fontweight="bold", fontsize=24, color="#0a3d3f")

# Plotar cada KPI em linhas separadas
for i, (label, value, color) in enumerate(kpis):
    axes[0, 0].text(
        0.5, 0.9 - i*0.18,   # posição vertical espaçada
        f"{label}: {value}",
        fontsize=20,
        ha="center", va="center",
        fontweight="bold",
        color=color,
        bbox=dict(facecolor="#e0f2f1", edgecolor="none", boxstyle="round,pad=0.5")
    )


# ================================================
# ✅ Donut Chart – Fabricantes (versão melhorada)
# ================================================
df_fab = df["Fabricante"].value_counts().sort_values(ascending=False)
colors = sns.color_palette("crest", len(df_fab))

# Explodir levemente cada fatia
explode = [0.05] * len(df_fab)

wedges, texts, autotexts = axes[0, 1].pie(
    df_fab.values,
    labels=None,  # remove labels diretas para usar legenda
    autopct="%1.1f%%",
    startangle=90,
    pctdistance=0.75,
    explode=explode,
    colors=colors,
    textprops={"color": "#0a3d3f", "fontsize": 14, "weight": "bold"}
)

# Círculo central para efeito donut
centre_circle = plt.Circle((0, 0), 0.55, fc="white")
axes[0, 1].add_artist(centre_circle)

# Legenda externa
axes[0, 1].legend(
    wedges, df_fab.index,
    title="Fabricantes",
    loc="center left",
    bbox_to_anchor=(1, 0, 0.5, 1),
    fontsize=12
)
# Título
axes[0, 1].set_title("Distribuição por Fabricante", fontweight="bold", fontsize=22, color="#0a3d3f")

# ============================
# ✅ Barras – Marcas
# ============================
df_marca = df["Marca"].value_counts().reset_index()
df_marca.columns = ["Marca", "Quantidade"]

sns.barplot(data=df_marca, x="Quantidade", y="Marca", palette=palette_teal, ax=axes[1, 0])
axes[1, 0].set_title("Quantidade por Marca", fontweight="bold", fontsize=22, color="#0a3d3f")
for i, v in enumerate(df_marca["Quantidade"]):
    axes[1, 0].text(v + 0.5, i, str(v), va="center", fontsize=14, color="#0a3d3f")

# =================================
# ✅ Barras – Sistema Operacional
# =================================
df_so = df["Sistema Operacional"].value_counts().reset_index()
df_so.columns = ["Sistema Operacional", "Quantidade"]

sns.barplot(data=df_so, x="Quantidade", y="Sistema Operacional", palette=palette_green, ax=axes[1, 1])
axes[1, 1].set_title("Quantidade por Sistema Operacional", fontweight="bold", fontsize=22, color="#0a3d3f")
for i, v in enumerate(df_so["Quantidade"]):
    axes[1, 1].text(v + 0.5, i, str(v), va="center", fontsize=14, color="#0a3d3f")

# ==============================
# ✅ Card de Última Atualização
# ==============================
ultima_atualizacao = datetime.now().strftime("%d/%m/%Y %H:%M")
ax_update = fig.add_axes([0.75, 0.92, 0.38, 0.12])  # posição no topo direito
ax_update.text(
    0.5, 0.5, f"Última atualização:\n{ultima_atualizacao}",
    fontsize=14, ha="center", va="center",
    fontweight="bold", color="#0a3d3f",
    bbox=dict(facecolor="#e0f2f1", edgecolor="none", boxstyle="round,pad=1"))
ax_update.axis("off")

plt.tight_layout()
plt.show()
