CREATE DATABASE PRODUTOS;
USE PRODUTOS;

CREATE TABLE produtos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome_do_produto VARCHAR(255) NOT NULL,
    data_validade DATE NOT NULL,
    preco DECIMAL(10, 5) NOT NULL
);


INSERT INTO produtos (nome_do_produto, data_validade, preco)
VALUES ('Produto A', '2023-07-22', 50.99),
       ('Produto B', '2023-02-14', 75.50),
       ('Produto C', '2023-11-07', 120.00);
       

DELIMITER //

CREATE TRIGGER valida_data_validade
BEFORE INSERT ON produtos
FOR EACH ROW
BEGIN
    IF NEW.data_validade < CURDATE() THEN
        SIGNAL SQLSTATE '75000'
        SET MESSAGE_TEXT = 'Erro:Produto fora da validade não pode ser vendido';
    END IF;
END;
//

DELIMITER ;


SHOW CREATE TRIGGER valida_data_validade;

SELECT * FROM produtos;
