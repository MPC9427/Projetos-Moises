1. Gráfico de Linha (Matplotlib)

import matplotlib.pyplot as plt

x = [1, 2, 3, 4, 5]
y = [10, 20, 15, 30, 25]

plt.plot(x, y, marker='o', color='blue')
plt.title("Gráfico de Linha")
plt.xlabel("Eixo X")
plt.ylabel("Eixo Y")
plt.grid(True)
plt.show()



📈 2. Gráfico de Barras

import matplotlib.pyplot as plt

categorias = ["A", "B", "C", "D"]
valores = [40, 25, 60, 30]

plt.bar(categorias, valores, color='green')
plt.title("Gráfico de Barras")
plt.xlabel("Categorias")
plt.ylabel("Valores")
plt.show()



📉 3. Gráfico de Dispersão (Scatter)
import matplotlib.pyplot as plt

x = [5, 7, 8, 7, 2, 17, 2, 9]
y = [99, 86, 87, 88, 100, 86, 103, 87]

plt.scatter(x, y, color='red')
plt.title("Gráfico de Dispersão")
plt.xlabel("X")
plt.ylabel("Y")
plt.show()



🎨 4. Gráfico com Seaborn (mais bonito)

import seaborn as sns
import matplotlib.pyplot as plt

tips = sns.load_dataset("tips")

sns.barplot(data=tips, x="day", y="total_bill", hue="sex")
plt.title("Conta Total por Dia")
plt.show()




