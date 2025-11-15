<?php
session_start();
include 'includes/conexao.php';

$tecnico = $_SESSION['usuario'];
$arquivo = $_FILES['documento'];
$nome = $arquivo['name'];
$caminho = 'uploads/' . basename($nome);

if (move_uploaded_file($arquivo['tmp_name'], $caminho)) {
  $sql = "INSERT INTO documentos_ti (nome_arquivo, caminho, data_upload, tecnico)
          VALUES ('$nome', '$caminho', NOW(), '$tecnico')";
  $conn->query($sql);
  echo "Arquivo enviado com sucesso!";
} else {
  echo "Erro ao enviar arquivo.";
}
?>
