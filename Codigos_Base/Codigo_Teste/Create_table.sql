CREATE DATABASE sistema;

USE sistema;

CREATE TABLE estatisticas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuarios INT,
    projetos INT,
    mensagens INT,
    receita DECIMAL(10,2)
);

-- Inserindo valores de exemplo
INSERT INTO estatisticas (usuarios, projetos, mensagens, receita)
VALUES (120, 15, 34, 7850.50);
