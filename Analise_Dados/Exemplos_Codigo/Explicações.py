import pandas as pd import matplotlib.pyplot as plt import seaborn as sns
#Copiar dados enviados pelo Power BI
df = dataset.copy()
Estilo visual
sns.set(style="whitegrid")
Criar figura com 4 gráficos
fig, axes = plt.subplots(2, 2, figsize=(16, 10)) fig.suptitle("Dashboard de Inventário de Computadores", fontsize=18)
============================
✅ KPI – Totais
============================
total_computadores = df["Nome do Computador"].nunique() total_marcas = df["Marca"].nunique() total_fabricantes = df["Fabricante"].nunique() total_modelos = df["Modelo"].nunique()
kpi_text = ( f"Total Computadores: {total_computadores}\n" f"Total Marcas: {total_marcas}\n" f"Total Fabricantes: {total_fabricantes}\n" f"Total Modelos: {total_modelos}" )
axes[0, 0].text(0.5, 0.5, kpi_text, fontsize=16, ha="center", va="center") axes[0, 0].set_title("KPIs Gerais") axes[0, 0].axis("off")
============================
✅ Gráfico de Pizza – Fabricantes
============================
df_fab = df["Fabricante"].value_counts()
axes[0, 1].pie( df_fab.values, labels=df_fab.index, autopct="%1.1f%%", colors=sns.color_palette("Greens", len(df_fab)) ) axes[0, 1].set_title("Distribuição por Fabricante")
============================
✅ Gráfico de Barras – Modelos
============================
df_modelo = df["Modelo"].value_counts().reset_index() df_modelo.columns = ["Modelo", "Quantidade"]
sns.barplot( data=df_modelo, x="Quantidade", y="Modelo", palette="Blues_r", ax=axes[1, 0] ) axes[1, 0].set_title("Quantidade por Modelo") axes[1, 0].set_xlabel("Quantidade") axes[1, 0].set_ylabel("Modelo")
============================
✅ Gráfico – Nome do Computador
============================
df_pc = df["Nome do Computador"].value_counts().reset_index() df_pc.columns = ["Nome do Computador", "Quantidade"]
sns.barplot( data=df_pc, x="Quantidade", y="Nome do Computador", palette="Purples_r", ax=axes[1, 1] ) axes[1, 1].set_title("Quantidade por Nome do Computador") axes[1, 1].set_xlabel("Quantidade") axes[1, 1].set_ylabel("Nome do Computador")
plt.tight_layout() plt.show() adicionar a Coluna Sistema Operacional
