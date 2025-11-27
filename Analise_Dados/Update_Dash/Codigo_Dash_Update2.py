
#CÓDIGO PROFISSIONALIZADO

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns


# Copiar dados enviados pelo Power BI
df = dataset.copy()

# ============================
# 🎨 Estilo visual profissional
# ============================
sns.set_theme(style="whitegrid")
plt.rcParams["axes.titlesize"] = 14
plt.rcParams["axes.labelsize"] = 12
plt.rcParams["figure.facecolor"] = "white"

# Criar figura com 4 gráficos
fig, axes = plt.subplots(2, 2, figsize=(18, 11))
fig.suptitle("Dashboard de Inventário de Computadores", fontsize=20, fontweight="bold")

# ============================
# ✅ KPI – Totais
# ============================
total_computadores = df["Nome do Computador"].nunique()
total_marcas = df["Marca"].nunique()
total_fabricantes = df["Fabricante"].nunique()
total_modelos = df["Modelo"].nunique()
total_sistemas = df["Sistema Operacional"].nunique()

kpi_text = (
    f"📌 Total Computadores: {total_computadores}\n"
    f"🏷️ Total Marcas: {total_marcas}\n"
    f"🏭 Total Fabricantes: {total_fabricantes}\n"
    f"💻 Total Modelos: {total_modelos}\n"
    f"🖥️ Total Sistemas Operacionais: {total_sistemas}"
)

axes[0, 0].text(0.5, 0.5, kpi_text, fontsize=16, ha="center", va="center", fontweight="bold")
axes[0, 0].set_title("KPIs Gerais", fontweight="bold")
axes[0, 0].axis("off")

# ============================
# ✅ Gráfico de Pizza – Fabricantes
# ============================
df_fab = df["Fabricante"].value_counts()

colors = sns.color_palette("Greens_r", len(df_fab))

axes[0, 1].pie(
    df_fab.values,
    labels=df_fab.index,
    autopct="%1.1f%%",
    startangle=90,
    pctdistance=0.85,
    colors=colors
)

# Círculo central para efeito "donut"
centre_circle = plt.Circle((0,0),0.60,fc='white')
axes[0, 1].add_artist(centre_circle)

axes[0, 1].set_title("Distribuição por Fabricante", fontweight="bold")

# ============================
# ✅ Gráfico de Barras – Marcas
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

# Mostrar valores nas barras
for i, v in enumerate(df_marca["Quantidade"]):
    axes[1, 0].text(v + 0.1, i, str(v), va="center")

# ============================
# ✅ Gráfico – Sistema Operacional
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

# Mostrar valores nas barras
for i, v in enumerate(df_so["Quantidade"]):
    axes[1, 1].text(v + 0.1, i, str(v), va="center")

plt.tight_layout()
plt.show()
