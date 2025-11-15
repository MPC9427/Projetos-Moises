1. Função para validar campos de login

function validarLogin(usuario, senha) {
  if (usuario === "" || senha === "") {
    alert("Por favor, preencha todos os campos.");
    return false;
  }
  return true;
}

2. Função para exibir a data atual

function mostrarDataAtual() {
  const hoje = new Date();
  const dataFormatada = hoje.toLocaleDateString('pt-BR');
  document.getElementById("data").textContent = `Data: ${dataFormatada}`;
}
👁️ 3. Função para mostrar/ocultar senha


function alternarSenha() {
  const campoSenha = document.getElementById("senha");
  campoSenha.type = campoSenha.type === "password" ? "text" : "password";
}
⏳ 4. Função para simular carregamento

function mostrarCarregando() {
  document.getElementById("botaoLogin").disabled = true;
  document.getElementById("botaoLogin").textContent = "Entrando...";
}
✅ 5. Função para limpar o formulário

function limparFormulario() {
  document.getElementById("usuario").value = "";
  document.getElementById("senha").value = "";
}