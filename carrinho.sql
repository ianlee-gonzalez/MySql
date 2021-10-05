/**

Carrinho de compras
@author ianlee
*/

create database carrinhodecompras;
use carrinhodecompras;
create table carrinho(
codigo int primary key auto_increment,
produto varchar(50) not null ,
    quantidade varchar(100) not null,
    valor varchar(5) 
);
alter table carrinho modify column produto  varchar(250) not null ;
use carrinhodecompras;

-- CRUD Read
-- selecionar todos os registros (dados) da tabela
select * from contatos;
-- CRUD CREATE 
insert into carrinho (produto,quantidade,valor)
values('Cachorro  ',1,0);
-- CRUD  Read 
select *from carrinho;

-- Operaçoes Matematicas no banco de dados 
select sum(valor *quantidade) as total from carrinho;