CREATE TABLE usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100),
  email VARCHAR(100) UNIQUE,
  senha VARCHAR(255)
);

CREATE TABLE documentos_ti (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome_arquivo VARCHAR(255),
  caminho VARCHAR(255),
  data_upload DATETIME,
  tecnico VARCHAR(100)
);
