import pandas as pd
from tkinter import Tk, messagebox
from tkinter.filedialog import askopenfilename, asksaveasfilename
import os

def ler_xls_ou_tsv(caminho):
    """
    Tenta ler como .xls (todas as abas).
    Se falhar, tenta como TSV (utf-16, \t).
    Retorna:
      - dict {nome_aba: DataFrame} se Excel
      - dict {"Planilha1": DataFrame} se TSV
    """
    # Primeira tentativa: Excel .xls
    try:
        df_dict = pd.read_excel(caminho, sheet_name=None, engine="xlrd")
        return df_dict
    except Exception as e_excel:
        # Segunda tentativa: arquivo texto tabulado (TSV) UTF-16
        try:
            df = pd.read_csv(caminho, sep="\t", encoding="utf-16")
            return {"Planilha1": df}
        except Exception as e_tsv:
            raise RuntimeError(
                f"Não foi possível ler o arquivo como .xls nem como TSV.\n\n"
                f"Erro Excel: {e_excel}\nErro TSV: {e_tsv}"
            )

def converter_xls_para_xlsx_gui():
    root = Tk()
    root.withdraw()

    try:
        # Selecionar arquivo de origem
        origem = askopenfilename(
            title="Selecione o arquivo .xls (ou TSV) para converter",
            filetypes=[("Arquivos Excel 97-2003", "*.xls"),
                       ("Arquivos de texto (TSV/CSV)", "*.txt *.tsv *.csv"),
                       ("Todos os arquivos", ".")]
        )
        if not origem:
            messagebox.showinfo("Cancelado", "Nenhum arquivo selecionado.")
            return

        # Sugerir destino .xlsx
        sugestao_saida = os.path.splitext(origem)[0] + ".xlsx"
        destino = asksaveasfilename(
            title="Escolha onde salvar o arquivo convertido (.xlsx)",
            defaultextension=".xlsx",
            initialfile=os.path.basename(sugestao_saida),
            filetypes=[("Excel Workbook", "*.xlsx")]
        )
        if not destino:
            messagebox.showinfo("Cancelado", "Destino não selecionado.")
            return

        # Ler origem (xls verdadeiro ou TSV)
        df_dict = ler_xls_ou_tsv(origem)

        # Gravar .xlsx
        with pd.ExcelWriter(destino, engine="openpyxl") as writer:
            for nome_aba, df in df_dict.items():
                df.to_excel(writer, sheet_name=nome_aba, index=False)

        messagebox.showinfo("Sucesso", f"Conversão concluída!\n\nArquivo salvo em:\n{destino}")

    except Exception as e:
        messagebox.showerror("Erro na conversão", f"Ocorreu um erro:\n{e}")

if _name_ == "_main_":
    converter_xls_para_xlsx_gui()


print(f"Conversão concluída com sucesso! Arquivo salvo como: {arquivo_destino}")