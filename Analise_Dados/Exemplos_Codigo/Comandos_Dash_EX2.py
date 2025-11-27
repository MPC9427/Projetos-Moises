total_sistemas = df["Sistema Operacional"].nunique()

 # f"Total Sistemas Operacionais: {total_sistemas}"


#df_so = df["Sistema Operacional"].value_counts().reset_index()
##
    #  sns.barplot(
    #  data=df_so,
    #  x="Quantidade",
    #  y="Sistema Operacional",
    #  palette="Oranges_r",
    #  ax=axes[1, 1]

axes[1, 1].set_title("Quantidade por Sistema Operacional")
axes[1, 1].set_xlabel("Quantidade")
axes[1, 1].set_ylabel("Sistema Operacional")

plt.tight_layout()
plt.show()
