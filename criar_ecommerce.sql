-- Criação do banco de dados para o cenário de E-commerce
CREATE DATABASE ecommerce;
USE ecommerce;

-- Criar tabela cliente
CREATE TABLE client (
idClient INT AUTO_INCREMENT PRIMARY KEY,
FirstName VARCHAR (15),
Minit CHAR (4),
LastName VARCHAR (20),
CPF CHAR (11),
CNPJ CHAR (14),
Address VARCHAR (100),
CONSTRAINT unique_cpf_client UNIQUE (CPF),
CONSTRAINT unique_cnpj_client UNIQUE (CNPJ),
CONSTRAINT chk_cpf_cnpj CHECK (
(CPF IS NOT NULL AND CNPJ IS NULL) OR 
(CPF IS NULL AND CNPJ IS NOT NULL))
);
-- Criar tabela produto
CREATE TABLE product (
idProduct INT AUTO_INCREMENT PRIMARY KEY,
ProductName VARCHAR (50) NOT NULL,
Category ENUM ('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis', 'Livros') NOT NULL,
Avaliacao FLOAT DEFAULT 0,
Size VARCHAR (10),
UnitPrice FLOAT NOT NULL
);

-- Criar tabela pagamentos
CREATE TABLE payments (
idPayment INT AUTO_INCREMENT PRIMARY KEY,
idClient INT,
TypePayment ENUM ('PIX', 'Boleto', 'Cartão', 'Gift Card'),
LimitAvailable FLOAT,
CONSTRAINT fk_payment_client FOREIGN KEY (idClient) REFERENCES client (idClient)
);

-- Criar tabela pedidos
CREATE TABLE orders (
idOrder INT AUTO_INCREMENT PRIMARY KEY,
idClient INT,
OrdersStatus ENUM ('Cancelado', 'Confirmado', 'Em processamento', 'Finalizado') DEFAULT 'Em processamento',
OrdersDescription VARCHAR (255),
FreightValue FLOAT DEFAULT 10,
idPayment INT,
CONSTRAINT fk_orders_client FOREIGN KEY (idClient) REFERENCES client (idClient),
CONSTRAINT fk_orders_payment FOREIGN KEY (idPayment) REFERENCES payments (idPayment)
);

-- Criar tabela estoque
CREATE TABLE productStorage (
idProdStorage INT AUTO_INCREMENT PRIMARY KEY,
StorageLocation VARCHAR (255) NOT NULL,
Quantity INT DEFAULT 0
);

-- Criar tabela fornecedor
CREATE TABLE supplier (
idSupplier INT AUTO_INCREMENT PRIMARY KEY,
SocialName VARCHAR (255) NOT NULL,
CNPJ CHAR (14) NOT NULL,
Contact CHAR (11) NOT NULL,
CONSTRAINT unique_supplier UNIQUE (CNPJ)
);

-- Criar tabela vendedor
CREATE TABLE seller (
idSeller INT AUTO_INCREMENT PRIMARY KEY,
SocialName VARCHAR (255) NOT NULL,
AbstName VARCHAR (255),
CNPJ CHAR (14),
CPF CHAR (11),
Location VARCHAR (255),
Contact VARCHAR (11) NOT NULL,
CONSTRAINT unique_cnpj_seller UNIQUE (CNPJ),
CONSTRAINT unique_cpf_seller UNIQUE (CPF),
CONSTRAINT chk_cpf_cnpj_seller CHECK (
(CPF IS NOT NULL AND CNPJ IS NULL) OR 
(CPF IS NULL AND CNPJ IS NOT NULL))
);
-- Criar tabela produto/vendedor
CREATE TABLE productSeller (
idSeller INT,
idProduct INT,
prodQuantity INT DEFAULT 1,
PRIMARY KEY (idSeller, idProduct),
CONSTRAINT fk_product_seller FOREIGN KEY (idSeller) REFERENCES seller (idSeller),
CONSTRAINT fk_product_product FOREIGN KEY (idProduct) REFERENCES product (idProduct)
);

-- Criar tabela produto/fornecedor
CREATE TABLE productSupplier (
idSupplier INT,
idProduct INT,
pQuantity INT DEFAULT 1,
PRIMARY KEY (idSupplier, idProduct),
CONSTRAINT fk_product_supplier FOREIGN KEY (idSupplier) REFERENCES supplier (idSupplier),
CONSTRAINT fk_product_supplier_product FOREIGN KEY (idProduct) REFERENCES product (idProduct)
);

-- Criar tabela produto/pedido
CREATE TABLE productOrder (
idProduct INT,
idOrder INT,
poQuantity INT NOT NULL,
poStatus ENUM ('Disponível', 'Sem estoque') DEFAULT 'Disponível',
PRIMARY KEY (idProduct, idOrder),
CONSTRAINT fk_po_product FOREIGN KEY (idProduct) REFERENCES product (idProduct),
CONSTRAINT fk_po_order FOREIGN KEY (idOrder) REFERENCES orders (idOrder)
);

-- Criar tabela localização/estoque
CREATE TABLE storageLocation (
idProduct INT,
idStorage INT,
PRIMARY KEY (idProduct, idStorage),
CONSTRAINT fk_location_product FOREIGN KEY (idProduct) REFERENCES product(idProduct),
CONSTRAINT fk_location_storage FOREIGN KEY (idStorage) REFERENCES productStorage(idProdStorage)
);
