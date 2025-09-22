-- População das tabelas criadas anteriormente

-- Cliente

DESC client;

INSERT INTO client (FirstName, Minit, LastName, CPF, CNPJ, Address) VALUES
('Ana', 'M', 'Silva', '12345678901', NULL, 'Rua das Flores, 100'),
('Bruno', 'C', 'Almeida', '98765432100', NULL, 'Av. Paulista, 200'),
('Carla', 'A', 'Souza', '45678912345', NULL, 'Rua Central, 50'),
('Loja', NULL, 'XPTO', NULL, '12345678000199', 'Rua das Lojas, 10'),
('Mercado', NULL, 'BomPreco', NULL, '98765432000111', 'Av. Brasil, 400');

DESC client;

-- Produto

DESC product;

INSERT INTO product (ProductName, Category, Avaliacao, Size, UnitPrice) VALUES
('Smartphone Galaxy', 'Eletrônico', 4.5, '15cm', 2500),
('Camiseta Nike', 'Vestimenta', 4.2, 'M', 120),
('Boneca Barbie', 'Brinquedos', 4.8, '30cm', 150),
('Arroz Tio João 5kg', 'Alimentos', 4.0, '5kg', 25),
('Sofá Retrátil', 'Móveis', 4.6, '3m', 1800),
('Livro Dom Casmurro', 'Livros', 4.9, '14x21cm', 45),
('Fone Bluetooth', 'Eletrônico', 4.3, '10cm', 200),
('Tênis Adidas', 'Vestimenta', 4.4, '42', 350);

DESC product;

-- Pagamentos

DESC payments;

INSERT INTO payments (idClient, TypePayment, LimitAvailable) VALUES
(1, 'Cartão', 2600.00),
(2, 'PIX', 500.00),
(3, 'Boleto', 1000.00),
(4, 'Cartão', 8000.00),
(5, 'Gift Card', 600.00);

DESC payments;

-- Pedidos

DESC orders;

INSERT INTO orders (idClient, OrdersStatus, OrdersDescription, FreightValue, idPayment) VALUES
(1, 'Confirmado', 'Compra de Smartphone Galaxy', 20.00, 1),
(2, 'Em processamento', 'Compra de Camiseta Nike e Boneca Barbie', 15.00, 2),
(3, 'Finalizado', 'Compra de Livro Dom Casmurro', 12.00, 3),
(4, 'Confirmado', 'Compra de Sofá Retrátil e Arroz', 50.00, 4),
(5, 'Em processamento', 'Compra de Fone Bluetooth e Tênis Adidas', 25.00, 5);

DESC orders;

-- Estoque

DESC productStorage;

INSERT INTO productStorage (StorageLocation, Quantity) VALUES
('Depósito SP - Zona Leste', 300),
('Depósito RJ - Centro', 200),
('Depósito BH - Pampulha', 150),
('Depósito Curitiba - CIC', 400),
('Depósito POA - Zona Norte', 250);

DESC productStorage;

-- Fornecedor

DESC supplier;

INSERT INTO supplier (SocialName, CNPJ, Contact) VALUES
('Tech Distribuidora LTDA', '11223344556677', '11987654321'),
('Moda Importações SA', '22334455667788', '11912345678'),
('Editora Nacional', '33445566778899', '21999887766'),
('Alimentos Brasil LTDA', '44556677889900', '11955554444'),
('Móveis Planejados SA', '55667788990011', '31966665555');

DESC supplier;

-- Vendedor

DESC seller;

INSERT INTO seller (SocialName, AbstName, CNPJ, CPF, Location, Contact) VALUES
('Loja Eletrônicos ME', 'Eletrônicos ME', '66778899001122', NULL, 'São Paulo', '11911112222'),
('Roupas Online LTDA', 'Moda Rápida', NULL, '11122233344', 'Rio de Janeiro', '21933334444'),
('Livros & Cia', 'LivrosCia', '77889900112233', NULL, 'Belo Horizonte', '31955556666'),
('Mercado Popular', 'Mercadão', NULL, '22233344455', 'Curitiba', '41977778888'),
('Móveis & Estilo', 'MoveisEstilo', '88990011223344', NULL, 'Porto Alegre', '51999990000');

DESC seller;

-- Produto/Fornecedor

DESC productSupplier;

INSERT INTO productSupplier (idSupplier, idProduct, pQuantity) VALUES
(1, 1, 50),
(2, 2, 200),
(2, 3, 100),
(4, 4, 300),
(5, 5, 20),
(3, 6, 500),
(1, 7, 80),
(2, 8, 150);

DESC productSupplier;

-- Produto/Fornecedor

DESC productSeller;

INSERT INTO productSeller (idSeller, idProduct, prodQuantity) VALUES
(1, 1, 20),
(2, 2, 50),
(2, 3, 30),
(4, 4, 100),
(5, 5, 15),
(3, 6, 40),
(1, 7, 25),
(2, 8, 60);

DESC productSeller;

-- Produto/Pedido

DESC productOrder;

INSERT INTO productOrder (idProduct, idOrder, poQuantity, poStatus) VALUES
(1, 1, 1, 'Disponível'),
(2, 2, 2, 'Disponível'),
(3, 2, 1, 'Disponível'),
(6, 3, 1, 'Disponível'),
(5, 4, 1, 'Disponível'),
(4, 4, 3, 'Disponível'),
(7, 5, 1, 'Disponível'),
(8, 5, 1, 'Disponível');

DESC productOrder;

-- Localização/Estoque

DESC storageLocation;

INSERT INTO storageLocation (idProduct, idStorage) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 4),
(5, 5),
(6, 3),
(7, 1),
(8, 2);

DESC storageLocation;