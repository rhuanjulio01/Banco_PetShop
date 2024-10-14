----PRIMEIRO----
select cpf, nome, dataAdm, salario, Departamento_idDepartamento 
from empregado 
where dataAdm >= '2019-01-01' AND dataAdm <= '2022-03-31';
----SEGUNDO----
select cpf, nome, dataAdm, salario, Departamento_idDepartamento 
from empregado
where salario<(select AVG(salario) from empregado) order by nome;
----TERCEIRO---
select nome

