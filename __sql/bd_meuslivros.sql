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