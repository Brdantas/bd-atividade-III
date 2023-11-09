CREATE DATABASE ATUALIZACAO_ESTOQUE;
USE ATUALIZACAO_ESTOQUE;

CREATE TABLE produtos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome_do_produto VARCHAR(255) NOT NULL,
    quantidade_em_estoque INT NOT NULL
);

INSERT INTO produtos (nome_do_produto, quantidade_em_estoque)
VALUES ('Produto A', 200),
       ('Produto B', 30),
       ('Produto C', 150);



DELIMITER //

CREATE TRIGGER atualizacao_estoque AFTER INSERT ON vendas
FOR EACH ROW
BEGIN
    UPDATE produtos
    SET quantidade_em_estoque = quantidade_em_estoque - NEW.quantidade_vendida
    WHERE id = NEW.produto_id;
END;
//

DELIMITER ;


SELECT * FROM produtos;

