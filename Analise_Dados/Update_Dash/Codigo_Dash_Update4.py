import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np

# Copiar dados enviados pelo Power BI (tenta usar 'dataset' vindo do Power BI, senão faz fallback)
df = dataset.copy()

# ============================
# 🎨 Estilo visual moderno (verde/teal)
# ============================
sns.set_theme(style="whitegrid")
plt.rcParams["axes.titlesize"] = 15
plt.rcParams["axes.labelsize"] = 12
plt.rcParams["figure.facecolor"] = "white"
plt.rcParams["axes.facecolor"] = "white"
plt.rcParams["text.color"] = "#1f2e2e"

# Paleta moderna verde/teal
palette_teal = sns.color_palette("crest", 10)
palette_green = sns.color_palette("Greens_r", 10)

# Criar figura com 4 gráficos
fig, axes = plt.subplots(2, 2, figsize=(18, 11))
fig.suptitle("Dashboard de Inventário de Computadores", fontsize=22, fontweight="bold", color="#0a3d3f")

# ============================
# ✅ KPI – Totais
# ============================
total_computadores = df["Nome do Computador"].nunique()
total_marcas = df["Marca"].nunique()
total_fabricantes = df["Fabricante"].nunique()
total_modelos = df["Modelo"].nunique()
total_sistemas = df["Sistema Operacional"].nunique()

kpi_text = (
    f"🖥️ Computadores: {total_computadores}\n"
    f"🏷️ Marcas: {total_marcas}\n"
    f"🏭 Fabricantes: {total_fabricantes}\n"
    f"💻 Modelos: {total_modelos}\n"
    f"🧩 Sistemas Operacionais: {total_sistemas}"
)

axes[0, 0].text(
    0.5, 0.5, kpi_text,
    fontsize=17,
    ha="center",
    va="center",
    fontweight="bold",
    color="#0a3d3f"
)
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
# ✅ Barras – Marcas (gradiente verde)
# ============================
df_marca = df["Marca"].value_counts().reset_index()
df_marca.columns = ["Marca", "Quantidade"]

sns.barplot(
    data=df_marca,
    x="Quantidade",
    y="Marca",
    palette=palette_teal,
    ax=axes[1, 0]
)

axes[1, 0].set_title("Quantidade por Marca", fontweight="bold", color="#0a3d3f")
axes[1, 0].set_xlabel("Quantidade")
axes[1, 0].set_ylabel("Marca")

for i, v in enumerate(df_marca["Quantidade"]):
    axes[1, 0].text(v + 0.2, i, str(v), va="center", fontsize=11, color="#0a3d3f")

# ============================
# ✅ Barras – Sistema Operacional (verde escuro)
# ============================
df_so = df["Sistema Operacional"].value_counts().reset_index()
df_so.columns = ["Sistema Operacional", "Quantidade"]

sns.barplot(
    data=df_so,
    x="Quantidade",
    y="Sistema Operacional",
    palette=palette_green,
    ax=axes[1, 1]
)

axes[1, 1].set_title("Quantidade por Sistema Operacional", fontweight="bold", color="#0a3d3f")
axes[1, 1].set_xlabel("Quantidade")
axes[1, 1].set_ylabel("Sistema Operacional")

for i, v in enumerate(df_so["Quantidade"]):
    axes[1, 1].text(v + 0.2, i, str(v), va="center", fontsize=11, color="#0a3d3f")

plt.tight_layout()
plt.show()
