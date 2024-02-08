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

-- exercicio Delete

select * from tbl_autores;

insert into tbl_autores (sobrenomeautor, nomeautor) 
values
('king', 'Stephen');

select * from tbl_editoras;
insert into tbl_editoras (nomeeditora) values ('Scribner');

select * from tbl_assuntos;
insert into tbl_assuntos (assunto) values ('Terror');

insert into tbl_livros (NomeLivro, ISBN13, DataPub, PrecoLivro, NumeroPaginas, IdEditora, IdAssunto)
values
('It', '9781501182099', '2017-04-11', 48.74, 1000, 
(select ideditora from tbl_editoras where nomeeditora = 'Scribner'), 
(select idassunto from tbl_assuntos where assunto = 'Terror')
);

-- Verificar registros corretos

select * from tbl_livros;

select * from tbl_editoras;
delete from tbl_editoras where  NomeEditora = 'Scribner';

delete from tbl_autores where nomeautor = 'Stephen';
delete from tbl_autores where nomeautor = 'Stephen' and SobrenomeAutor = 'King' ; 
select * from tbl_autores;

select nomeautor, SobrenomeAutor from tbl_autores;

select * from tbl_livros;

select * from tbl_livros order by NomeLivro asc;

select * from tbl_livros order by NomeLivro desc;

select nomelivro, ideditora from tbl_livros order by IdEditora;

select nomelivro, precolivro from tbl_livros order by PrecoLivro desc;

select nomelivro, datapub, idassunto from tbl_livros order by IdAssunto, NomeLivro;


### Limitar número de registros - LIMIT ###
-- Retornar os dois livros mais baratos da tabela de livros:

select * from tbl_livros order by NomeLivro;

select nomelivro, precolivro from tbl_livros order by PrecoLivro limit 2;

select nomelivro, precolivro from tbl_livros order by PrecoLivro desc limit 3;
select * from tbl_livros;

-- 3, 4 e 5º livros com maior numero de pagina
select nomelivro, numeropaginas from tbl_livros 
order by NumeroPaginas desc limit  2, 3;



select nomelivro, datapub from tbl_livros where IdEditora = 2;

select idautor, nomeautor from tbl_autores where SobrenomeAutor = 'Stanek';
select * from tbl_autores where SobrenomeAutor = 'Stanek';

-- Indices

alter table tbl_editoras add index inomeeditora (nomeeditora);
show index from tbl_editoras;
explain select * from tbl_editoras where nomeeditora = 'Springer';
create index idx_editora on tbl_editoras (nomeeditora);
drop index idx_editora on tbl_editoras;
drop index inomeeditora on tbl_editoras;


-- Exemplos – AND, OR e NOT
SELECT IdLivro, NomeLivro, IdEditora FROM tbl_Livros
WHERE IdLivro > 2 AND IdEditora < 4;
SELECT IdLivro, NomeLivro, IdEditora FROM tbl_Livros
WHERE IdLivro > 2 OR IdEditora < 4;
SELECT IdLivro, NomeLivro, IdEditora FROM tbl_Livros
WHERE NOT IdEditora = 10;
SELECT IdLivro, NomeLivro, IdEditora FROM tbl_Livros
WHERE IdLivro > 2 AND NOT IdEditora <= 4;
 
### Aliases com as - apelido

select nomelivro  as livro from tbl_livros where IdLivro > 2;

SELECT NomeAutor AS Nome,SobrenomeAutor Sobrenome FROM tbl_Autores AS Autores;
SELECT NomeLivro AS Livro, PrecoLivro AS 'Preço do Livro'
FROM tbl_Livros AS Livros ORDER BY 'Preço do Livro' DESC;


###LISTA DE EXERCICIOS ORDER BY
-- Todas os dados da tabela de editoras

select * FROM tbl_editoras;
-- Somente os nomes de editoras da tabela de editoras, em ordem alfabética;
select nomeeditora as editoras from tbl_editoras order by editoras asc;
-- Nomes de livros, preços e datas de publicação, em ordem inversa de data de publicação (do mais recente para o mais antigo)
select nomelivro, precolivro, datapub from tbl_livros order by DataPub desc;
-- Nomes e sobrenomes de autores, em ordem alfabética de sobrenomes Nomes de livros, IDs de assuntos e editora, sem ordem definida.
select nomeautor, sobrenomeautor from tbl_autores order by SobrenomeAutor asc;
select nomelivro, idassunto, ideditora from tbl_livros;
-- Lista de assuntos em ordem alfabética.
select assunto from tbl_assuntos order by assunto asc;

select * from tbl_autores;

select count(*) as total from  tbl_autores;

select * from tbl_livros;
select count(ideditora) from tbl_livros;
select count(distinct ideditora) from tbl_livros;

select precolivro from tbl_livros;

select max(precolivro) as 'livro mais caro' from tbl_livros;
select min(precolivro) as 'livro mais barato' from tbl_livros;
select avg(precolivro) as 'Média valor livro' from tbl_livros;
select sum(precolivro) as 'total gasto livros' from tbl_livros;
select sum(precolivro) / count(*)  from tbl_livros;

select count(*) as 'Quant.livros', sum(numeropaginas) as 'páginas totais',
avg(numeropaginas) as 'Média de pags.' from tbl_livros; 

## Exercícios - Funções de Agregação
-- Escreva uma consulta que retorne o preço total dos livros publicados pela editora de ID igual a 3
SELECT SUM(PrecoLivro) AS PrecoTotal
FROM tbl_Livros
WHERE IdEditora = 3;
-- Escreva uma consulta que retorne a média de preços dos livros publicados pelas editoras de IDs iguais a 2 e 3
select * from  tbl_livros;

SELECT AVG(PrecoLivro) AS MediaPreco
FROM tbl_Livros
-- WHERE IdEditora IN (2, 3);
where ideditora =2 or ideditora = 3;

-- Retorne o nome e o preço do livro mais caro na tabela de livros.
SELECT NomeLivro, PrecoLivro
FROM tbl_Livros
WHERE PrecoLivro = (SELECT MAX(PrecoLivro) FROM tbl_Livros);

