
#✅ Código atualizado com tqdm

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from tqdm import tqdm
import time

for i in tqdm(range(10), desc="Processando"):
    time.sleep(0.5)  # simula uma tarefa


# Copiar dados enviados pelo Power BI
try:
    df = dataset.copy()
except NameError:
    # Primeiro tenta carregar um CSV chamado 'dataset.csv' como fallback
    try:
        df = pd.read_csv("dataset.csv")
    except Exception:
        # Se não houver CSV, cria um DataFrame vazio com as colunas esperadas para evitar erros posteriores
        df = pd.DataFrame(columns=[
            "Nome do Computador",
            "Marca",
            "Fabricante",
            "Modelo",
            "Sistema Operacional"
        ])
# 🎨 Estilo visual premium
sns.set_theme(style="whitegrid")
plt.rcParams["axes.titlesize"] = 15
plt.rcParams["axes.labelsize"] = 12
plt.rcParams["figure.facecolor"] = "white"
plt.rcParams["axes.facecolor"] = "white"

# Paletas modernas
palette_teal = sns.color_palette("crest", 10)
palette_green = sns.color_palette("Greens_r", 10)

# Criar figura com 3 linhas x 2 colunas (6 gráficos)
fig, axes = plt.subplots(3, 2, figsize=(20, 14))
fig.suptitle("Dashboard Executivo – Inventário de Computadores", fontsize=24, fontweight="bold", color="#0a3d3f")

# ============================
# ✅ KPI – Totais com tqdm
# ============================
resultados = {}
for coluna in tqdm(["Nome do Computador", "Marca", "Fabricante", "Modelo", "Sistema Operacional"], desc="Calculando KPIs"):
    resultados[coluna] = df[coluna].nunique()

kpi_text = (
    f" Computadores: {resultados['Nome do Computador']}\n"
    f" Marcas: {resultados['Marca']}\n"
    f"Fabricantes: {resultados['Fabricante']}\n"
    f"Modelos: {resultados['Modelo']}\n"
    f"Sistemas Operacionais: {resultados['Sistema Operacional']}"
)

axes[0, 0].text(
    0.5, 0.5, kpi_text,
    fontsize=18, ha="center", va="center",
    fontweight="bold", color="#0a3d3f",
    bbox=dict(facecolor="#e0f2f1", edgecolor="none", boxstyle="round,pad=1"))
axes[0, 0].set_title("KPIs Gerais", fontweight="bold", color="#0a3d3f")
axes[0, 0].axis("off")

# ============================
# ✅ Donut Chart – Fabricantes
# ============================
df_fab = df["Fabricante"].value_counts()
colors = sns.color_palette("crest", len(df_fab))
wedges, texts, autotexts = axes[0, 1].pie(
    df_fab.values,
    labels=df_fab.index,
    autopct="%1.1f%%",
    startangle=90,
    pctdistance=0.80,
    colors=colors,
    textprops={"color": "#0a3d3f", "fontsize": 11}
)
centre_circle = plt.Circle((0, 0), 0.55, fc="white")
axes[0, 1].add_artist(centre_circle)
axes[0, 1].set_title("Distribuição por Fabricante", fontweight="bold", color="#0a3d3f")

# ============================
# ✅ Barras – Marcas
# ============================
df_marca = df["Marca"].value_counts().reset_index()
df_marca.columns = ["Marca", "Quantidade"]
sns.barplot(data=df_marca, x="Quantidade", y="Marca", palette=palette_teal, ax=axes[1, 0])
axes[1, 0].set_title("Quantidade por Marca", fontweight="bold", color="#0a3d3f")
for i, v in enumerate(df_marca["Quantidade"]):
    axes[1, 0].text(v + 0.3, i, str(v), va="center", fontsize=11, color="#0a3d3f")


# ============================
# ✅ Barras – Sistema Operacional
# ============================
df_so = df["Sistema Operacional"].value_counts().reset_index()
df_so.columns = ["Sistema Operacional", "Quantidade"]
sns.barplot(data=df_so, x="Quantidade", y="Sistema Operacional", palette="Greens", ax=axes[2, 0])
axes[2, 0].set_title("Quantidade por Sistema Operacional", fontweight="bold", color="#0a3d3f")
for i, v in enumerate(df_so["Quantidade"]):
    axes[2, 0].text(v + 0.3, i, str(v), va="center", fontsize=11, color="#0a3d3f")


plt.tight_layout()
plt.show()
