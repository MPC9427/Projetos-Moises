<?php
$servername = "localhost";
$username   = "root";      // ou outro usuário
$password   = "";          // senha do MySQL
$dbname     = "sistema";

// Criar conexão
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexão
if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
}

// Buscar dados
$sql = "SELECT usuarios, projetos, mensagens, receita FROM estatisticas ORDER BY id DESC LIMIT 1";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row      = $result->fetch_assoc();
    $usuarios = $row['usuarios'];
    $projetos = $row['projetos'];
    $mensagens = $row['mensagens'];
    $receita  = $row['receita'];
} else {
    $usuarios = $projetos = $mensagens = $receita = 0;
}

$conn->close();
?>


----------------------------------------------------------------------------------------------$_COOKIE
// Arquivo PHP que retorna os dados em JSON (dados.php):

<?php
header('Content-Type: application/json');

// Conexão com MySQL
$conn = new mysqli("localhost", "root", "", "sistema");
if ($conn->connect_error) {
    die(json_encode(["error" => "Falha na conexão"]));
}

$sql = "SELECT usuarios, projetos, mensagens, receita FROM estatisticas ORDER BY id DESC LIMIT 1";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo json_encode($result->fetch_assoc());
} else {
    echo json_encode(["usuarios"=>0,"projetos"=>0,"mensagens"=>0,"receita"=>0]);
}

$conn->close();
