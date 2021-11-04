/**

Sistema para gestão de uma assistencia técnica de celulares
@author ianlee
*/
create database dbcel;
use dbcel;
drop database dbcel;

create table funcionarios( 
	idfunc int primary key auto_increment,
	usuario varchar(50) not null , 
	login varchar (50) not null unique,
	senha varchar (250) not null ,
	perfil varchar (50) not null,
	nome varchar (30) not null,
	doc varchar(11) not null unique,
	cep char(8) not null,
	posicao varchar(30)   not null,
	fone varchar(15) not null
 );
 drop table funcionarios;
 insert into funcionarios(usuario,login,senha,perfil,nome,doc,cep,posicao,fone)
values('IAN LEE GONZALEZ GONZALEZ','ianlee',md5('123456'),'administrador','Ian Lee Gonzalez Gonzalez','1111212',12345678,'Dono','111111');
  insert into funcionarios(usuario,login,senha,perfil,nome,doc,cep,posicao,fone)
values('Jady Martins ','jadyjacke',md5('123456'),'operador','Jady Martins','22222',2222,'Tecnica','22222');
 select * from funcionarios;
 create table clientes(
	idcli int primary key	 auto_increment,
	cliente varchar(50)not null,
	cpf char(11) not null unique ,
	cep char(8),
	endereco varchar(50) not null,
	numero varchar (12) not null,
	complemento varchar(30),
	bairro varchar(50) not null,
	cidade varchar(50) not null,
	uf char(2) not null,
	fone varchar(15) not null,
	email varchar(100) unique 
 );
 insert into clientes(cliente,cpf,cep,endereco,numero,complemento,bairro,cidade,uf,fone,email) 
 values ('gggg','44444444444','03059010','ruanenhuma','2','ddd','kkk','dddd','SP','1111111111','EMAIL');
 select * from clientes where cliente=1;
 
 use dbcel;
 select * from clientes;
 select * from clientes where cliente like "?%";
 select * from clientes;
 
 insert into clientes(cliente,cpf,cep,endereco,numero,complemento,bairro,cidade,uf,fone)
 values('Arigartor',111111111,11111111,'Rua Aligartor ','1','Ao lado do Cindaquiu','Tatuapé','São Paulo','SP','111111111');
 insert into clientes(cliente,cpf,cep,endereco,numero,complemento,bairro,cidade,uf,fone)
 values('Cindaquiu',22222222222,22222222,'Rua Aligartor','2','Do lado do Aligartor','Tatuapé','São Paulo','SP','222222222');
 insert into clientes(cliente,cpf,cep,endereco,numero,complemento,bairro,cidade,uf,fone)
 values('Echi',3333333333,33333333,'Paleti','3','Perto de uma casa','Tatuapé','São Paulo','SP','333333333');
 insert into clientes(cliente,cpf,cep,endereco,numero,complemento,bairro,cidade,uf,fone)
 values('May',4444444444,44444444,'Paleti','4','Perto de um Prédio','Tatuapé','São Paulo','SP','444444444');
 insert into clientes(cliente,cpf,cep,endereco,numero,complemento,bairro,cidade,uf,fone)
 values('teste1',5555555555,55555555,'endereço1','numero1','complemento1','bairro1','cidade1','SP','555555555');
 insert into clientes(cliente,cpf,cep,endereco,numero,complemento,bairro,cidade,uf,fone)
 values('teste2',6666666666,66666666,'endereço2','numero2','complemento2','bairro2','cidade2','SP','666666666');
 insert into clientes(cliente,cpf,cep,endereco,numero,complemento,bairro,cidade,uf,fone)
 values('teste3',7777777777,77777777,'endereço3','numero3','complemento3','bairro3','cidade3','SP','777777777');
 insert into clientes(cliente,cpf,cep,endereco,numero,complemento,bairro,cidade,uf,fone)
 values('teste4',8888888888,88888888,'endereço4','numero4','complemento4','bairro4','cidade4','SP','888888888');
 insert into clientes(cliente,cpf,cep,endereco,numero,complemento,bairro,cidade,uf,fone)
 values('teste5',9999999999,99999999,'endereço5','numero5','complemento5','bairro5','cidade5','SP','999999999');
 select * from clientes;
 
 create table tbos(
	idfunc int ,
	os int primary key auto_increment,
	dataos timestamp default current_timestamp,
	idcli int not null,
	garantia date ,
	marca varchar(50) not null ,
   modelo varchar (50) ,
   defeitocli varchar (50) not null,
   defeitotec varchar (50) ,
   obs varchar(150),
   valor decimal (10,2),
   statusos varchar (30) not null,
   dataretirada date ,
   acessorios varchar(100) ,
   pecas decimal (10,2),
   formadepagamento varchar(20),
   senhacel varchar (30) ,
  foreign key (idcli) references clientes(idcli),
  foreign key (idfunc) references funcionarios(idfunc)
  );
  drop table tbos;
  
  insert into tbos(idcli,idfunc,marca,defeitocli,defeitotec,obs,valor,statusos,formadepagamento)
  values(1,2,'Motorola','tela quebrada','tela trincada','sem obs',300.00,'aguardando retirada','dinheiro');
insert into tbos(idcli,idfunc,marca,defeitocli,defeitotec,obs,valor,statusos,acessorios,modelo)
values(2,2,'Sansung','nao liga','Falta de bateria','comprar um carregador compativel',50,'retirado','Capinha cor de pele','Pocket');
insert into tbos(idcli,idfunc,marca,defeitocli,defeitotec,obs,valor,statusos,acessorios,modelo)
values(3,2,'Iphone','Nao faz ligaçoes','Nao tem chip','comprar um chip',50,'retirado','Capinha preta','S6');
insert into tbos(idcli,idfunc,marca,defeitocli,defeitotec,obs,valor,statusos,formadepagamento)
  values(4,2,'Sony','nao conecta na rede','defeito no sistema operacional','sem obs',100,'na bancada','dinheiro');
select * from tbos;


-- Relatorio De clientes que estamos aguardando o pagamento
select  tbos.os,date_format(tbos.dataos,'%d/%m/%Y - %H:%i')as data_os,
tbos.marca,tbos.valor,tbos.statusos,tbos.defeitocli,tbos.idcli,
 clientes.cliente as Nome
 from tbos inner join clientes 
 on tbos.idcli=clientes.idcli
 where statusos='aguardando retirada'; 
  -- Relatorio Faturamento total
  select sum(valor) as faturamento from tbos where statusos='retirado';
  -- Relatorio de clientes pendentes de atendimento
  select  tbos.os,date_format(tbos.dataos,'%d/%m/%Y - %H:%i')as data_os,
tbos.marca,tbos.valor,tbos.statusos,tbos.defeitocli,tbos.idcli,
 clientes.cliente as Nome
 from tbos inner join clientes 
 on tbos.idcli=clientes.idcli
 where statusos='na bancada';

 
  
 

 
  
  
  
  
  
  
  
  
  
 
  
 
  
  
  
 
