/**

E Commerce
@author ianlee
*/
drop database carrinhodecompras;
create database carrinhodecompras;
use carrinhodecompras;
create table clientes(
idcli int primary key auto_increment,
nome varchar(50) not null,
email varchar (50) unique not null,
senha varchar (250) not null
);
insert into clientes (nome,email,senha)
values ('Jose de assis','jose@email.com',md5('123456'));
describe clientes;
select * from clientes;
create table produtos(
	codigo int primary key auto_increment,
    barcode varchar(50) unique,
    produto varchar(100) not null,
    fabricante varchar(100) not null,
    datacad timestamp default current_timestamp,
    -- date (tipo de dados relacionados a data) yyyymmdd
    dataval date not null ,
    estoque int not null,
    estoquemin int not null,
    medida varchar(50) not null,
    valor decimal(10,2),
    loc varchar(100)
);
describe produtos;
insert into produtos(produto,fabricante,dataval,estoque,estoquemin,medida,valor,loc)
values('Caneta bic azul','BIC',20221005,100,10,'CX',28.75,'setor A p2');
insert into produtos(produto,fabricante,dataval,estoque,estoquemin,medida,valor,loc)
values('Corote','intel',23000202,100,1,'garrafa',3,'setorZ');
insert into produtos(produto,fabricante,dataval,estoque,estoquemin,medida,valor,loc)
values('celular ','asus',20010202,30,2,'CX',300,'setorZ');
insert into produtos(produto,fabricante,dataval,estoque,estoquemin,medida,valor,loc)
values('teste4','teste',20000202,100,1,'teste4',0,'teste4');
insert into produtos(produto,fabricante,dataval,estoque,estoquemin,medida,valor,loc)
values('teste5','teste5',23000202,2,1,'teste5',3,'teste5');
insert into produtos(produto,fabricante,dataval,estoque,estoquemin,medida,valor,loc)
values('teste6','teste6',23000202,100,1,'teste6',3,'teste6');
select * from produtos;
-- inventario do estoque(total)
select * from produtos ;
select sum(valor*estoque) as total from produtos;
-- RELATORIO DE REPOSIÇAO DO ESTOQUE
select * from produtos where estoque > estoquemin;
-- Relatorio de reposiçao do estoque 2 
-- %d dia   %m (mes) %Y(ano 2 digitos) %Y (ANO 4 DIGITOS)
select codigo as código,produto, 
date_format(dataval,'%d/%m/%Y') as data_validade,
estoque,estoquemin as estoque_minimo
from produtos where estoque < estoquemin;
-- Relatorio de produtos vencidos 1 
select codigo as código,produto,
date_format(dataval,'%d/%m/%Y')as data_validade
from produtos;
-- Relatorio de validade dos produtos 2
select codigo as código,produto,
date_format(dataval,'%d/%m/%Y')as data_validade,
datediff(dataval,curdate()) as dias_restantes
from produtos; 

create table pedidos(
pedido int primary key auto_increment,
dataped timestamp default current_timestamp,
total decimal (10,2),
idcli int not null,
foreign key(idcli) references clientes(idcli)
);
insert into pedidos(idcli) values(1);
select * from pedidos;
-- ABERTURA DO PEDIDO 
select 
pedidos.pedido,
date_format(pedidos.dataped,'%d/%m/%Y - %H:%i')as data_pedido,
clientes.nome as cliente,clientes.email as e_mail
from pedidos inner join clientes
on pedidos.idcli=clientes.idcli;
create table carrinho(
pedido int not null ,
codigo int not null,
quantidade int  not null ,
foreign key(pedido) references pedidos(pedido),
foreign key(pedido) references produtos(codigo)
);
select * from carrinho;
insert into carrinho (pedido,codigo,quantidade)
values(1,1,10);
insert into carrinho (pedido,codigo,quantidade)
values(1,2,5);
-- exibir o carrinho 
select
pedidos.pedido,
carrinho.codigo as código,
carrinho.quantidade,
produtos.valor,
produtos.valor * carrinho.quantidade as sub_total,
produtos.produto
from (carrinho inner join pedidos on carrinho.pedido=pedidos.pedido)
inner join produtos on carrinho.codigo=produtos.codigo;
-- total do carrinho 
select sum(produtos.valor* carrinho.quantidade)as total
from carrinho inner join produtos on carrinho.codigo=produtos.codigo;
update carrinho
inner join produtos on carrinho.codigo = produtos.codigo set produtos.estoque=produtos.estoque - carrinho.quantidade
where carrinho .quantidade>0;
select * from produtos ;

-- atualizar o banco de dados após o fechamento do pedido 

