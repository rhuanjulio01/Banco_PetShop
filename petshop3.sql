
select cpf, nome, dataAdm, salario, Departamento_idDepartamento 
from empregado 
where dataAdm >= '2019-01-01' AND dataAdm <= '2022-03-31';

select
 cpf, nome, dataAdm, salario, Departamento_idDepartamento 
from
 empregado
where salario<(select AVG(salario) from empregado) order by nome;

select
    e.nome AS `Nome Empregado`,
    e.cpf AS `CPF Empregado`,
    e.sexo AS `Sexo`,
    e.salario AS `Salário`,
    COUNT(v.idVenda) AS `Quantidade Vendas`,
    SUM(v.valor) AS `Total Valor Vendido`,
    SUM(v.comissao) AS `Total Comissão das Vendas`
from
    petshop.Empregado e
left join 
    petshop.Venda v ON e.cpf = v.Empregado_cpf
group by 
    e.cpf
order by 
    COUNT(v.idVenda) DESC;




SELECT 
    e.nome AS `Nome Empregado`,
    e.cpf AS `CPF Empregado`,
    e.sexo AS `Sexo`,
    e.salario AS `Salário`,
    COUNT(DISTINCT iv.Venda_idVenda) AS `Quantidade Vendas com Serviço`,
    SUM(iv.valor) AS `Total Valor Vendido com Serviço`,
    SUM(iv.desconto) AS `Total Comissão das Vendas com Serviço`
FROM 
    petshop.Empregado e
JOIN 
    petshop.itensServico iv ON e.cpf = iv.Empregado_cpf
JOIN 
    petshop.Venda v ON iv.Venda_idVenda = v.idVenda
GROUP BY 
    e.cpf
ORDER BY 
    COUNT(DISTINCT iv.Venda_idVenda) DESC;



SELECT 
    e.nome AS `Nome Empregado`,
    e.cpf AS `CPF Empregado`,
    e.sexo AS `Sexo`,
    e.salario AS `Salário`,
    COUNT(DISTINCT iv.Venda_idVenda) AS `Quantidade Vendas com Serviço`,
    SUM(iv.valor) AS `Total Valor Vendido com Serviço`,
    SUM(iv.desconto) AS `Total Comissão das Vendas com Serviço`
FROM 
    petshop.Empregado e
JOIN 
    petshop.itensServico iv ON e.cpf = iv.Empregado_cpf
JOIN 
    petshop.Venda v ON iv.Venda_idVenda = v.idVenda
GROUP BY 
    e.cpf
ORDER BY 
    COUNT(DISTINCT iv.Venda_idVenda) DESC;




SELECT 
    p.nome AS `Nome do Pet`,
    v.data AS `Data do Serviço`,
    s.nome AS `Nome do Serviço`,
    iv.quantidade AS `Quantidade`,
    iv.valor AS `Valor`,
    e.nome AS `Empregado que realizou o Serviço`
FROM 
    petshop.PET p
JOIN 
    petshop.itensServico iv ON p.idPET = iv.PET_idPET
JOIN 
    petshop.Venda v ON iv.Venda_idVenda = v.idVenda
JOIN 
    petshop.Servico s ON iv.Servico_idServico = s.idServico
JOIN 
    petshop.Empregado e ON iv.Empregado_cpf = e.cpf
ORDER BY 
    v.data DESC;




SELECT 
    v.data AS `Data da Venda`,
    v.valor AS `Valor`,
    v.desconto AS `Desconto`,
    (v.valor - v.desconto) AS `Valor Final`,
    e.nome AS `Empregado que realizou a venda`
FROM 
    petshop.Venda v
JOIN 
    petshop.Cliente c ON v.Cliente_cpf = c.cpf
JOIN 
    petshop.Empregado e ON v.Empregado_cpf = e.cpf
ORDER BY 
    v.data DESC;





SELECT 
    s.nome AS `Nome do Serviço`,
    SUM(iv.quantidade) AS `Quantidade Vendas`,
    SUM(iv.valor) AS `Total Valor Vendido`
FROM 
    petshop.Servico s
JOIN 
    petshop.itensServico iv ON s.idServico = iv.Servico_idServico
GROUP BY 
    s.idServico
ORDER BY 
    `Quantidade Vendas` DESC
LIMIT 10;


SELECT 
    f.tipo AS `Tipo Forma Pagamento`,
    COUNT(v.idVenda) AS `Quantidade Vendas`,
    SUM(f.valorPago) AS `Total Valor Vendido`
FROM 
    petshop.FormaPgVenda f
JOIN 
    petshop.Venda v ON f.Venda_idVenda = v.idVenda
GROUP BY 
    f.idFormaPgVenda
ORDER BY 
    `Quantidade Vendas` DESC;



SELECT 
    DATE(v.data) AS `Data Venda`,
    COUNT(v.idVenda) AS `Quantidade de Vendas`,
    SUM(v.valor) AS `Valor Total Venda`
FROM 
    petshop.Venda v
GROUP BY 
    DATE(v.data)
ORDER BY 
    `Data Venda` DESC;




SELECT 
    p.nome AS `Nome Produto`,
    p.valorVenda AS `Valor Produto`,
    p.marca AS `Categoria do Produto`, 
    f.nome AS `Nome Fornecedor`,
    f.email AS `Email Fornecedor`,
    GROUP_CONCAT(DISTINCT t.numero) AS `Telefone Fornecedor`
FROM 
    petshop.Produtos p
JOIN 
    petshop.ItensCompra ic ON p.idProduto = ic.Produtos_idProduto
JOIN 
    petshop.Compras c ON ic.Compras_idCompra = c.idCompra
JOIN 
    petshop.Fornecedor f ON c.Fornecedor_cpf_cnpj = f.cpf_cnpj
LEFT JOIN 
    petshop.Telefone t ON f.cpf_cnpj = t.Fornecedor_cpf_cnpj
GROUP BY 
    p.idProduto, f.nome, f.email
ORDER BY 
    `Nome Produto`;



SELECT 
    p.nome AS `Nome Produto`,
    SUM(iv.quantidade) AS `Quantidade (Total) Vendas`,
    SUM(iv.valor) AS `Valor Total Recebido pela Venda do Produto`
FROM 
    petshop.Produtos p
JOIN 
    petshop.ItensVendaProd iv ON p.idProduto = iv.Produto_idProduto
JOIN 
    petshop.Venda v ON iv.Venda_idVenda = v.idVenda
GROUP BY 
    p.idProduto
ORDER BY 
    `Quantidade (Total) Vendas` DESC;
