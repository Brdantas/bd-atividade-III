CREATE DATABASE ESTOQUE;
USE ESTOQUE;


CREATE TABLE produtos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome_do_produto VARCHAR(255) NOT NULL,
    quantidade_em_estoque INT NOT NULL
);


INSERT INTO produtos (nome_do_produto, quantidade_em_estoque)
VALUES ('Produto A', 6),
       ('Produto B', 9),
       ('Produto C', 4),
       ('Produto D', 10),
       ('Produto E', 3);



CREATE VIEW vw_estoque_insuficiente
AS
SELECT * FROM produtos
WHERE quantidade_em_estoque < 5;


SELECT * FROM vw_estoque_insuficiente;

