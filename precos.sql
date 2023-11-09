CREATE DATABASE PRECO;
USE PRECO;

CREATE TABLE produtos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome_do_produto VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

INSERT INTO produtos (nome_do_produto, preco)
VALUES ('Produto A', 35.00),
       ('Produto B', 95.50),
       ('Produto C', 145.00);
       

DELIMITER //

CREATE TRIGGER aumenta_preco_produto
BEFORE UPDATE ON produtos
FOR EACH ROW
BEGIN
    SET NEW.preco = NEW.preco * 3.1; -- Aumenta o preço em 10%
END;
//

DELIMITER ;


SELECT * FROM produtos;

