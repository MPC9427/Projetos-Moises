#CÓDIGO PROFISSIONAL PREMIUM PARA POWER BI

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Copiar dados enviados pelo Power BI
df = dataset.copy()

# ============================
# 🎨 Estilo visual premium
# ============================
sns.set_theme(style="whitegrid")
plt.rcParams["axes.titlesize"] = 15
plt.rcParams["axes.labelsize"] = 12
plt.rcParams["figure.facecolor"] = "white"
plt.rcParams["axes.facecolor"] = "white"

# Criar figura com 4 gráficos
fig, axes = plt.subplots(2, 2, figsize=(18, 11))
fig.suptitle("Dashboard de Inventário de Computadores", fontsize=22, fontweight="bold")

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
    color="#333333"
)
axes[0, 0].set_title("KPIs Gerais", fontweight="bold")
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
    textprops={"color": "#333333", "fontsize": 11}
)

# Círculo central (efeito donut)
centre_circle = plt.Circle((0, 0), 0.55, fc="white")
axes[0, 1].add_artist(centre_circle)

axes[0, 1].set_title("Distribuição por Fabricante", fontweight="bold")

# ============================
# ✅ Barras – Marcas
# ============================
df_marca = df["Marca"].value_counts().reset_index()
df_marca.columns = ["Marca", "Quantidade"]

sns.barplot(
    data=df_marca,
    x="Quantidade",
    y="Marca",
    palette="Blues_r",
    ax=axes[1, 0]
)

axes[1, 0].set_title("Quantidade por Marca", fontweight="bold")
axes[1, 0].set_xlabel("Quantidade")
axes[1, 0].set_ylabel("Marca")

# Rótulos nas barras
for i, v in enumerate(df_marca["Quantidade"]):
    axes[1, 0].text(v + 0.2, i, str(v), va="center", fontsize=11, color="#333333")

# ============================
# ✅ Barras – Sistema Operacional
# ============================
df_so = df["Sistema Operacional"].value_counts().reset_index()
df_so.columns = ["Sistema Operacional", "Quantidade"]

sns.barplot(
    data=df_so,
    x="Quantidade",
    y="Sistema Operacional",
    palette="Purples_r",
    ax=axes[1, 1]
)

axes[1, 1].set_title("Quantidade por Sistema Operacional", fontweight="bold")
axes[1, 1].set_xlabel("Quantidade")
axes[1, 1].set_ylabel("Sistema Operacional")

# Rótulos nas barras
for i, v in enumerate(df_so["Quantidade"]):
    axes[1, 1].text(v + 0.2, i, str(v), va="center", fontsize=11, color="#333333")

plt.tight_layout()
plt.show()