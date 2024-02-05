-- Cria o banco de dados
create database db_MeusLivros;

-- Retorna todas os bancos de dados
SHOW DATABASES;

-- Seleciona o banco de dados db_MeusLivros
use db_MeusLivros;

-- Retorna o banco de dados selecionado
SELECT DATABASE();

-- criar a tabela autor

CREATE TABLE tbl_Autores (
IdAutor SMALLINT AUTO_INCREMENT,
NomeAutor VARCHAR(50) NOT NULL,
SobrenomeAutor VARCHAR(60) NOT NULL,
CONSTRAINT pk_id_autor PRIMARY KEY (IdAutor)
);

-- Descreve os campos da tabela tbl_autores
DESCRIBE tbl_autores;

SHOW COLUMNS FROM tbl_autores;

-- Criar tabela editoras

create table tbl_Editoras (
IdEditora smallint primary key auto_increment,
NomeEditora varchar(50) not null
);

-- Criando a tabela assuntos

create table tbl_Assuntos (
IdAssunto tinyint auto_increment,
Assunto varchar(25) not null,
constraint pk_id_assunto primary key (IdAssunto)
);

-- Criando a tabela livros

create table tbl_Livros(
IdLivro smallint not null auto_increment,
NomeLivro varchar(70) not null,
ISBN13 varchar(13) not null,
DataPub date,
PrecoLivro decimal(10,2) not null,
NumeroPaginas smallint not null,
IdEditora smallint not null,
IdAssunto tinyint not null,
constraint pk_id_livro primary key (IdLivro),
CONSTRAINT fk_id_editora FOREIGN KEY (IdEditora) REFERENCES tbl_Editoras
(IdEditora) ON DELETE CASCADE,
CONSTRAINT fk_id_assunto FOREIGN KEY (IdAssunto) REFERENCES tbl_Assuntos
(IdAssunto) ON DELETE CASCADE
);

use db_meuslivros;

Create table tbl_LivrosAutores (
IdLivro smallint not null,
IdAutor smallint not null,
constraint pk_id_livro_autor primary key (IdLivro, IdAutor),
constraint fk_id_livros foreign key (idLivro) references tbl_Livros (IdLivro),
constraint fk_id_autores foreign key (IdAutor) references tbl_Autores (IdAutor)
);

-- Mostrar todas as tabelas criadas 

Show tables;


/*Criar a tabela emprestimo
*/

CREATE TABLE Emprestimo (
IdEmprestimo TINYINT PRIMARY KEY,
NomeLivro VARCHAR (60) NOT NULL,
NomeEmprestador VARCHAR (50) NOT NULL,
DataEmprestimo DATE NOT NULL,
Duracao TINYINT NOT NULL );


rename table emprestimo to tbl_emprestimos;

select * from tbl_livros;


alter table tbl_livros add Edicao tinyint;
alter table tbl_livros drop column Edicao;

describe tbl_emprestimos;
alter table tbl_emprestimos modify column idemprestimo smallint;

drop table tbl_emprestimos;


INSERT INTO tbl_autores (NomeAutor, SobrenomeAutor)
values
('Daniel', 'Barret'),
('Gerald', 'Carter'),
('Mark', 'Sobell'),
('William', 'Stanek'), 
('Richard', 'Blum'), 
('Christine', 'Bresnahan'),
('Richard', 'Silverman'),
 ('Robert', 'Byrnes'), 
 ('Jay', 'Ts'),
('Robert', 'Eckstein'), 
('Paul', 'Horowitz'), 
('Winfield', 'Hill'),
('Joel', 'Murach'), 
('Paul', 'Scherz'), 
('Simon', 'Monk');

select * from tbl_autores;

insert into tbl_editoras (NomeEditora)
values
('Prentice Hall'), 
('O´Reilly'),
('Microsoft Press'), 
('Wiley'),
('Mc Graw Hill'), 
('Bookman'),
('Novatec'), 
('Apress'),
('Sybex'),
('Mike Murach and Associates');

select * from tbl_editoras;




insert into tbl_Assuntos (Assunto)
values
('Ficção'), ('Botânica'),
('Eletrônica'), ('Matemática'),
('Aventura'), ('Literatura'),
('Informática'), ('Suspense');



INSERT INTO tbl_Livros (NomeLivro, ISBN13, DataPub, PrecoLivro, NumeroPaginas, IdAssunto, IdEditora)
VALUES
('Linux Command Line and Shell Scripting','9781118983843', '20150109', 165.55, 816, 7, 4),
('SSH, the Secure Shell','9780596008956', '20050517', 295.41, 672, 7, 2),
('Using Samba','9780596002565', '20031221', 158.76, 449, 7, 2),
('A Arte da Eletrônica', '9788582604342', '20170308', 176.71, 1160, 7, 6),
('Windows Server 2012 Inside Out','9780735666313', '20130125', 179.51, 1584, 7, 3),
('Murach´s MySQL','9781943872367', '20190501', 227.64, 650, 7, 10),
('Practical Electronics for Inventors', '9781259587542', '20160711', 119.58, 1056, 3, 5);


select * from tbl_livros;

update tbl_livros set NomeLivro = 'SSH, o Shell Seguro' where idLivro = 2;
update tbl_livros set PrecoLivro = PrecoLivro + 10 where idLivro = 1;

select * from tbl_assuntos;

-- CUIDADOOOOOOO UPDATE SEM WHERE 
update tbl_assuntos set assunto = 'Biologia';
-- TODOS OS ITENS DA TBL_ASSUNTOS FORAM ALTERADOS PARA 'BIOLOGIA'

update tbl_Assuntos  set Assunto = 'Ficção' where idassunto = 1; 
update tbl_Assuntos  set Assunto = 'Botânica' where idassunto = 2; 
update tbl_Assuntos  set Assunto = 'Eletrônica' where idassunto = 3; 
update tbl_Assuntos  set Assunto = 'Matemática' where idassunto = 4; 
update tbl_Assuntos  set Assunto = 'Aventura' where idassunto = 5; 
update tbl_Assuntos  set Assunto = 'Literatura' where idassunto = 6; 
update tbl_Assuntos  set Assunto = 'Informática' where idassunto = 7; 
update tbl_Assuntos  set Assunto = 'Suspense' where idassunto = 8; 

-- UPDADE CORRETO
update tbl_assuntos set assunto = 'Biologia' where idassunto = 2;

select * from tbl_editoras;

insert into tbl_editoras (nomeeditora) values ('Bóson Editorial');

delete from tbl_editoras where IdEditora = 12;

CREATE TABLE tbl_emprestimo (
    IdEmprestimo TINYINT PRIMARY KEY,
    NomeLivro VARCHAR(60) NOT NULL,
    NomeEmprestador VARCHAR(50) NOT NULL
);

insert into tbl_emprestimo (Idemprestimo, nomelivro, nomeemprestador)
value 
(20 , 'o cortiço', 'joao da silva'),
(21, 'a moreninha', 'Marcos de souza'),
(22, 'macunaíma', 'Ana de Abreu');

select * from tbl_emprestimo;

truncate table tbl_emprestimo; 

drop table tbl_emprestimo; 