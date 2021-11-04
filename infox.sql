/**

Sistema para gestao de uma assistencia tecnica de computadores e perifericos 
@author ianlee
*/
 create database dbinfox;
 use dbinfox;
 create table usuarios( 
	id int primary key auto_increment,
	usuario varchar(50) not null , 
	login varchar (50) not null unique,
	senha varchar (250) not null ,
	perfil varchar (50) not null
	);
 -- a linha abaixo insere uma senha com criptografia
 -- md5 (criptografa a senha) 
 insert into usuarios(usuario,login,senha,perfil)
 values('Jose de Assis','admin',md5('123456'),'administrador');
 insert into usuarios(usuario,login,senha,perfil)
 values('Kelly Cristina','kelly',md5('123'),'operador');
 select * from usuarios where id=1;
 -- Selecionando  o usuario  e sua respectiva senha (tela de login)
 select * from usuarios where login='admin' and senha=md5('123456');
 update usuarios set usuario='Kelly Cristina dos Santos',
 login='kellycris',senha=md5('1234'),perfil='operador' where id =2;
 -- char tipo de dados que aceita uma sting de caracteres nao variaveis
 drop table clientes;
 create table clientes(
	idcli int primary key auto_increment,
	nome varchar(50)not null,
    email varchar (50) ,
	cep char(8),
	endereco varchar(50) not null,
	numero varchar (12) not null,
	complemento varchar(30),
	bairro varchar(50) not null,
	cidade varchar(50) not null,
	uf char(2) not null,
	fone varchar(15) not null
	);
    use dbinfox;
    select * from clientes;
    insert into clientes (nome,fone,cep,endereco,numero,complemento,bairro,cidade,uf)
    values('Ian','11981516356',03059010,'endereço1','numero1','complemento1','bairro1','cidade1','SP');
    
 insert into clientes(nome,cep,endereco,numero,complemento,bairro,cidade,uf,fone)
 values('Ian',03059010,'Siqueira Bueno',219,2,'belenzinho','SP','SP',111111111);
 insert into clientes(nome,cep,endereco,numero,complemento,bairro,cidade,uf,fone)
 values('teste1',11111111,'teste1',1,1,'teste1','teste1','11',1);
 insert into clientes(nome,cep,endereco,numero,complemento,bairro,cidade,uf,fone)
 values('teste2',2222222,'teste2',2,2,'teste2','teste2','22',2);
 insert into clientes(nome,cep,endereco,numero,complemento,bairro,cidade,uf,fone)
 values('teste3',333333333,'teste3',3,3,'teste3','teste3','33',3);
 insert into clientes(nome,cep,endereco,numero,complemento,bairro,cidade,uf,fone)
 values('Jady',44444444,'teste4',4,4,'teste4','teste4','44',4);
 insert into clientes(nome,cep,endereco,numero,complemento,bairro,cidade,uf,fone)
 values('ultimo',55555555,'teste5',5,5,'teste5','teste5','55',5);
  -- Foreign key (FK) Cria um relacionamento de 1 para muitos (cliente -tbos)
  drop table tbos;
  create table tbos (	
	os int primary key auto_increment,
	dataos timestamp default current_timestamp,
	tipo varchar(20) not null,
	statusos  varchar(30) not null,
	equipamento varchar(200) not null,
	defeito varchar(200) not null ,
	tecnico varchar(50) ,
	valor decimal (12,2),
	idcli int not null ,
	foreign key (idcli) references clientes(idcli)  
	);
  describe tbos;
  insert into tbos(tipo,statusos,equipamento,defeito,idcli)
  values ('orçamento','bancada','Notebook Lenovo G90','Não liga',1);
  insert into tbos(tipo,statusos,equipamento,defeito,tecnico,valor,idcli)
  values ('orçamento','aguardando aprovaçao','impressora hp2020','papel enroscando','Robson','60',1);
  insert into tbos(tipo,statusos,equipamento,defeito,tecnico,valor,idcli)
  values ('serviço','retirado','Notebook itautec 2500','formataçao do windows','Sirlene','9',2);
   insert into tbos(tipo,statusos,equipamento,defeito,tecnico,valor,idcli)
  values ('serviço','retirado','PC Positivo','Troca de Fonte ','Robson','100',3);
   insert into tbos(tipo,statusos,equipamento,defeito,tecnico,valor,idcli)
  values ('orçamento','aguardando aprovaçao','Notebook Sony','tela quebrada','Sirlene','1500',3);
  select * from tbos;
  -- inner join uniao de tabelas relacionadas para consultas e updates 
  -- relatorio 1 
  select * from tbos inner join clientes
  on tbos.idcli = clientes.idcli;
  -- relatorio 2
 select tbos.equipamento,tbos.defeito,tbos.statusos as status_os,tbos.valor,
 clientes.nome,clientes.fone
 from tbos inner join clientes 
 on tbos.idcli=clientes.idcli
 where statusos='aguardando aprovaçao';
-- relatorio 3 (os,data formatada(dia,mes e ano)equipamento defeito ,valor,nome do cliente) filtrando por retirado
select  tbos.os,date_format(tbos.dataos,'%d/%m/%Y - %H:%i')as data_os,tbos.defeito,tbos.valor,
 clientes.nome as cliente
 from tbos inner join clientes 
 on tbos.idcli=clientes.idcli
 where statusos='retirado';
 
 

 
 
 
 