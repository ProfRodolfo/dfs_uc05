create database olamundo2;
create database olamundo3;
create database olamundo4;
drop database olamundo4;
show databases;
drop database olamundo3;

create schema sucos;

use sucos;

-- sou um comentário
/*
Sou um comentário
de 
várias linha

*/

create table tbcliente
( cpf varchar (11),
nome varchar (100),
endereco varchar (150),
idade smallint);

create table tbfuncionario
( cpf varchar (11),
nome varchar (100),
endereco varchar (150),
idade smallint);


show tables;

drop table tbfuncionario;

drop table novatabela;
drop table tbcliente;
drop table tbfuncionario;

show tables;

-- Criar a tabela de cliente

create  table tbcliente
( CPF VARCHAR(11),
NOME VARCHAR(150),
ENDERECO1 VARCHAR(150),
ENDERECO2 VARCHAR(150),
BAIRRO VARCHAR (50),
CIDADE VARCHAR(50),
ESTADO VARCHAR(50),
CEP VARCHAR(8),
IDADE SMALLINT,
SEXO VARCHAR(1), 
LIMITE_CREDITO FLOAT,
VOLUME_COMPRA FLOAT,
PRIMEIRA_COMPRA BIT);

SHOW TABLEs;

select * from tbcliente;

