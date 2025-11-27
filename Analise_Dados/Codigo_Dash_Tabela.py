import matplotlib.pyplot as plt
from datetime import datetime

# Exemplo de dataframe (no Power BI use df = dataset.copy())
df_tabela = df[["Nome do Computador", "Número de Série"]].copy()
df_tabela["Última Atualização"] = datetime.now().strftime("%d/%m/%Y %H:%M")

# Criar figura
fig, ax = plt.subplots(figsize=(12, 4))
ax.axis("off")

# Criar tabela estilizada
tabela = ax.table(
    cellText=df_tabela.values,
    colLabels=df_tabela.columns,
    cellLoc="center",
    loc="center"
)

# Estilo moderno
tabela.auto_set_font_size(False)
tabela.set_fontsize(12)
tabela.scale(1.2, 1.2)

# Cores
for (row, col), cell in tabela.get_celld().items():
    if row == 0:  # cabeçalho
        cell.set_text_props(weight="bold", color="white")
        cell.set_facecolor("#0a3d3f")
    else:  # linhas alternadas
        cell.set_facecolor("#e0f2f1" if row % 2 == 0 else "#ffffff")
        cell.set_text_props(color="#0a3d3f")

# ✅ Título acima da tabela
fig.suptitle(
    "Tabela Moderna – Computadores, Nº de Série e Última Atualização",
    fontsize=18, fontweight="bold", color="#0a3d3f", y=1.02
)

plt.tight_layout()
plt.show()