import dash
from dash import dcc, html, Input, Output
import plotly.express as px
import pandas as pd

# ============================
# 1. Carregar dados do Excel
# ============================
df = pd.read_excel("Relatorio_Maquinas.xlsx")

# ============================
# 2. Criar app Dash
# ============================
app = dash.Dash(__name__)

app.layout = html.Div(style={"padding": "20px", "fontFamily": "Arial"}, children=[

    html.H1("Dashboard de Computadores", style={"textAlign": "center"}),

    # ============================
    # 3. Filtros
    # ============================
    html.Div(style={"display": "flex", "gap": "20px"}, children=[
        dcc.Dropdown(
            id="filtro-marca",
            options=[{"label": m, "value": m} for m in sorted(df["Marca"].unique())],
            placeholder="Selecione a Marca",
            style={"width": "300px"}
        ),
        dcc.Dropdown(
            id="filtro-fabricante",
            options=[{"label": f, "value": f} for f in sorted(df["Fabricante"].unique())],
            placeholder="Selecione o Fabricante",
            style={"width": "300px"}
        )
    ]),

    html.Br(),

    # ============================
    # 4. KPIs
    # ============================
    html.Div(style={"display": "flex", "gap": "40px"}, children=[
        html.Div([
            html.H3("Total de Computadores"),
            html.H1(id="kpi-computadores")
        ]),
        html.Div([
            html.H3("Total de Marcas"),
            html.H1(id="kpi-marcas")
        ]),
        html.Div([
            html.H3("Total de Fabricantes"),
            html.H1(id="kpi-fabricantes")
        ]),
        html.Div([
            html.H3("Total de Modelos"),
            html.H1(id="kpi-modelos")
        ])
    ]),

    html.Br(),

    # ============================
    # 5. Gráficos
    # ============================
    html.Div(style={"display": "flex", "gap": "20px"}, children=[
        dcc.Graph(id="grafico-marcas"),
        dcc.Graph(id="grafico-fabricantes")
    ])
])

# ============================
# 6. Callbacks (interatividade)
# ============================
@app.callback(
    [
        Output("kpi-computadores", "children"),
        Output("kpi-marcas", "children"),
        Output("kpi-fabricantes", "children"),
        Output("kpi-modelos", "children"),
        Output("grafico-marcas", "figure"),
        Output("grafico-fabricantes", "figure")
    ],
    [
        Input("filtro-marca", "value"),
        Input("filtro-fabricante", "value")
    ]
)
def atualizar_dashboard(marca, fabricante):

    df_filtrado = df.copy()

    if marca:
        df_filtrado = df_filtrado[df_filtrado["Marca"] == marca]

    if fabricante:
        df_filtrado = df_filtrado[df_filtrado["Fabricante"] == fabricante]

    # KPIs
    total_computadores = df_filtrado["Nome do Computador"].nunique()
    total_marcas = df_filtrado["Marca"].nunique()
    total_fabricantes = df_filtrado["Fabricante"].nunique()
    total_modelos = df_filtrado["Modelo"].nunique()

    # Gráfico 1 - Marcas
    fig_marcas = px.bar(
        df_filtrado.groupby("Marca").size().reset_index(name="Quantidade"),
        x="Marca", y="Quantidade", title="Computadores por Marca"
    )

    # Gráfico 2 - Fabricantes
    fig_fabricantes = px.pie(
        df_filtrado,
        names="Fabricante",
        title="Distribuição por Fabricante"
    )

    return (
        total_computadores,
        total_marcas,
        total_fabricantes,
        total_modelos,
        fig_marcas,
        fig_fabricantes
    )


if __name__ == "__main__":
    app.run_server(debug=True)
