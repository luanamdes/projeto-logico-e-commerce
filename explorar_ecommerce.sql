-- Testes extras para explorar o modelo

-- Recuperações simples com SELECT Statement
-- Filtros com WHERE Statement
-- Expressões para gerar atributos derivados
-- Ordenações dos dados com ORDER BY
-- Condições de filtros aos grupos – HAVING Statement
-- Junções entre tabelas para fornecer uma perspectiva mais complexa dos dados

-- Recuperar nomes e categorias de todos os produtos cadastrados.
SELECT
ProductName,
Category
FROM product;

-- Recuperar toda a tabela de Estoque.
SELECT *
FROM productspoStatustorage;

-- Recuperar ordens que ainda não foram finalizadas.
SELECT 
idOrder,
OrdersStatus
FROM Orders
WHERE OrdersStatus NOT LIKE 'Finalizado';

-- Recuperar clientes cadastrados como Pessoa Física (CPF).
SELECT
concat(FirstName, ' ', LastName) AS ClientName,
CPF
FROM client
WHERE CPF IS NOT NULL;

-- Valor do pedido + frete.
SELECT 
o.idOrder,
o.FreightValue,
p.LimitAvailable,
(o.FreightValue + p.LimitAvailable) AS ValorTotal
FROM orders AS o
INNER JOIN payments p ON o.idPayment = p.idPayment
ORDER BY ValorTotal DESC;

-- Valor total da compra, calculando Preço Unitário do produto * Quantidade do Pedido + Frete.
SELECT 
o.idOrder,
SUM(p.UnitPrice * po.poQuantity) + o.FreightValue AS ValorTotal
FROM orders AS o
JOIN productOrder AS po
ON o.idOrder = po.idOrder
JOIN product AS p
ON po.idProduct = p.idProduct
GROUP BY o.idOrder
ORDER BY ValorTotal DESC;

-- Diferença entre o ValorTotal e o Limite disponível nos meios de pagamento de cada cliente.
SELECT 
o.idOrder,
o.idClient,
SUM(p.UnitPrice * po.poQuantity) + o.FreightValue AS ValorTotal,
py.LimitAvailable
FROM orders AS o
JOIN productOrder AS po
ON o.idOrder = po.idOrder
JOIN product AS p
ON po.idProduct = p.idProduct
JOIN payments AS py
ON py.idclient = o.idclient
GROUP BY o.idOrder, o.idclient, py.limitavailable;

-- Pedidos que contém mais de um produto
SELECT 
o.idOrder,
COUNT(po.idProduct) AS QtdeProdutos
FROM orders AS o
JOIN productOrder AS po
ON o.idOrder = po.idOrder
GROUP BY o.idOrder
HAVING QtdeProdutos > 1;






