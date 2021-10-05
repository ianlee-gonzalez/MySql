/**

Agenda de contatos
@author ianlee
*/

-- exibir banco de dados do servidor
show databases;
-- criar um banco de dados
create database dbagenda;
-- excluir um banco de dados
drop database dbteste;
-- selecionar o banco de dados 
use dbagenda;

-- verificar tabelas existentes
show tables;
-- criando uma tabela
-- toda tabela precisa ter uma chave primaria (PK)
-- tipo de dados ->números inteiros
-- primary key -> transforma este campo em chave primaria 
-- auto_increment -> numeração automatica
-- varchar (tipo de dados  equivalente a String )(50) numero maximo de caracteres)
-- not null -> preenchimento obrigatorio
-- unique -> nao permite valores duplicados na tabela
 

create table contatos(
	id int primary key auto_increment,
    nome varchar(50) not null ,
    fone varchar(15) not null,
    email varchar(50) unique
);
-- alterar o nome de um campo na tabela
alter table contatos change nome contato varchar(50) not null;
show tables;
-- descriçao da tabela
describe contatos;

-- adicionar uma nova coluna 
alter table contatos add column obs varchar (250);
-- adicionar uma nova coluna em um local especifico da tabela
alter table contatos add column fone2 varchar(15) after fone;
-- modificar o tipo de dados da coluna
alter table contatos modify column email varchar(100) not null ;
-- excluir uma coluna da tabela
alter table contatos drop column obs;
-- excluir a tabela
drop table contatos;
