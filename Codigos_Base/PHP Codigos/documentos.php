<?php

include 'includes/conexao.php';
$result = $conn->query("SELECT * FROM documentos_ti ORDER BY data_upload DESC");

while ($doc = $result->fetch_assoc()) {
  echo "<p><a href='{$doc['caminho']}' download>{$doc['nome_arquivo']}</a> - {$doc['tecnico']} - {$doc['data_upload']}</p>";
}
?>
