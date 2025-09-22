-- Testes sugeridos pelo desafio

-- Quantos pedidos foram feitos por cada cliente?
SELECT 
idClient, COUNT(idOrder) as 'NumPedidos'
FROM Orders
GROUP BY idClient;

-- Algum vendedor também é fornecedor?
SELECT
sl.idSeller,
sl.SocialName AS SellerName,
sl.CNPJ AS SellerCNPJ,
sp.idSupplier,
sp.SocialName AS SupplierName,
sp.CNPJ AS SupplierCNPJ
FROM seller AS sl
JOIN supplier AS sp
ON sl.CNPJ = sp.CNPJ;

-- Relação de produtos fornecedores e estoques;
SELECT 
pd.idProduct,
pd.ProductName,
psp.idSupplier,
sp.SocialName AS SupplierName,
ps.StorageLocation,
ps.Quantity
FROM product AS pd
JOIN productSupplier AS psp 
ON pd.idProduct = psp.idProduct
JOIN supplier AS sp
ON psp.idSupplier = sp.idSupplier
JOIN storageLocation AS sl
ON pd.idProduct = sl.idProduct
JOIN productStorage AS ps
ON sl.idStorage = ps.idProdStorage;

-- Relação de nomes dos fornecedores e nomes dos produtos;
SELECT
s.SocialName AS SupplierName,
p.ProductName
FROM supplier AS s
JOIN productsupplier AS ps
ON s.idSupplier = ps.idSupplier
JOIN product AS p
ON p.idProduct = ps.idProduct;
