drop table if exists locadoraCarros;
create database locadoraCarros;
use locadoraCarros;

create table if not exists Pagamento(
	Cod_pagamento int(10),
    Data_pag date,
    Valor_pag float,
    Forma_pag character,
    primary key (Cod_pagamento),
    foreign key (Cod_cliente) references Cliente (Cod_cliente)
);

insert into Pagamento(Cod_pagamento, Data_pag, Valor_pag, Forma_pag) values
(1234567891, 2026/03/18, 193.99, "d" ),
(1234567892, 2026/03/17, 193.99, "c" ),
(1234567893, 2026/03/16, 193.99, "d" ),
(1234567894, 2026/03/15, 193.99, "d" ),
(1234567895, 2026/03/14, 193.99, "d" ),
(1234567896, 2026/03/13, 193.99, "c" ),
(1234567897, 2026/03/12, 193.99, "c" ),
(1234567898, 2026/03/11, 193.99, "d" ),
(1234567899, 2026/03/10, 193.99, "d" ),
(1234567811, 2026/03/9, 193.99, "d" ),
(1234567822, 2026/03/8, 193.99, "c" ),
(1234567833, 2026/03/7, 193.99, "d" ),
(1234567844, 2026/03/6, 193.99, "c" ),
(1234567855, 2026/03/5, 193.99, "d" ),
(1234567866, 2026/03/4, 193.99, "p" );

create table if not exists Multa(
	Data_multa date,
    Valor_multa float,
    Cod_multa int(10),
    primary key (Cod_multa),
    foreign key (Cod_cliente) references Cliente (Cod_cliente)
);

insert into multa(Data_multa, Valor_multa, Cod_multa) values
(2026/01/1, 185.99, 1234567891),
(2026/01/2, 285.99, 1234567892),
(2026/01/3, 385.99, 1234567893),
(2026/01/4, 75.99, 1234567894),
(2026/01/5, 65.99, 1234567895),
(2026/01/6, 45.99, 1234567896),
(2026/01/7, 55.99, 1234567897),
(2026/01/8, 65.99, 1234567898),
(2026/01/9, 75.99, 1234567899),
(2026/01/10, 185.99, 1234567810),
(2026/01/11, 285.99, 1234567811),
(2026/01/12, 185.99, 1234567820),
(2026/01/13, 285.99, 1234567830),
(2026/01/14, 185.99, 1234567840),
(2026/01/15, 285.99, 1234567850);

create table if not exists Cliente(
	Cod_cliente int(10),
    Cpf_cliente int(11),
    inadimplencia varchar(255),
    primary key (Cod_cliente)
);

insert into Cliente (Cod_cliente, Cpf_cliente, inadimplencia) values
(1234567891, 12345567891, "sim"),
(1234567892, 12345567892, "nao"), 
(1234567893, 12345567893, "nao"),
(1234567894, 12345567894, "sim"),
(1234567895, 12345567895, "sim"),
(1234567896, 12345567896, "nao"),
(1234567897, 12345567897, "sim"),
(1234567898, 12345567898, "nao"),
(1234567899, 12345567899, "sim"),
(1234567810, 12345567810, "nao"),
(1234567820, 12345567820, "sim"),
(1234567830, 12345567830, "nao"),
(1234567840, 12345567840, "sim"),
(1234567850, 12345567850, "nao"),
(1234567860, 12345567860, "nao");

create table if not exists ContratoLoc(
	Cod_locacao int (10),
    Data_devolucao date,
    kmI float,
    tipoDoSeguro varchar(255),
    Data_retirada date,
    Combustivel_inicial varchar(255),
    primary key (Cod_locacao),
    foreign key (Cod_cliente) references Cliente (Cod_cliente)
);

insert into contratoLoc(Cod_locacao, Data_devolucao, kmI, tipoDoSeguro, Data_retirada, Combustivel_inicial) values
	(1234567890, 2026/04/01, 1312.2, "completo", 2025/12/01, "91l"),
    (1234567891, 2026/04/02, 133.5, "completo", 2025/12/02, "91l"),
    (1234567892, 2026/04/03, 1113.2, "completo", 2025/12/03, "93l"),
    (1234567893, 2026/04/04, 1331.2, "completo", 2025/12/04, "94l"),
    (1234567894, 2026/04/05, 13.2, "completo", 2025/12/05, "95l"),
    (1234567895, 2026/04/06, 1331.2, "completo", 2025/12/06, "96l"),
    (1234567896, 2026/04/07, 1123.2, "completo", 2025/12/07, "97l"),
    (1234567897, 2026/04/08, 1317.2, "completo", 2025/12/08, "98l"),
    (1234567898, 2026/04/09, 1973.2, "completo", 2025/12/09, "92l"),
    (1234567899, 2026/04/10, 1367.2, "completo", 2025/12/10, "91l"),
    (1234567810, 2026/04/11, 1473.2, "completo", 2025/12/11, "92l"),
    (1234567820, 2026/04/12, 1385.2, "completo", 2025/12/12, "93l"),
    (1234567830, 2026/04/13, 1337.2, "completo", 2025/12/13, "94l"),
    (1234567840, 2026/04/14, 1343.2, "completo", 2025/12/14, "91l"),
    (1234567850, 2026/04/15, 745.2, "completo", 2025/12/15, "92l");
    
create table if not exists Devolucao(
	Cod_devolucao int (10),
    Valor_ad float,
    kmF float,
    Combustivel_final varchar(255),
    primary key (Cod_devolucao),
    foreign key (kmI, Data_devolucao) references ContratoLoc(kmI, Data_devolucao),
    foreign key (Cod_cliente) references Cliente (Cod_cliente)
);

insert into Devolucao(Cod_devolucao, Valor_ad, kmF, Combustivel_final) values
(1234567890, 12.3, 1100, "9l"),
(1234567891, 12.3, 1200, "11l"),
(1234567892, 12.3, 1010, "19l"),
(1234567893, 12.3, 1020, "9l"),
(1234567894, 12.3, 1040, "1l"),
(1234567895, 12.3, 1030, "9l"),
(1234567896, 12.3, 1050, "7l"),
(1234567897, 12.3, 1070, "9l"),
(1234567898, 12.3, 1060, "5l"),
(1234567899, 12.3, 1090, "9l"),
(1234567810, 12.3, 1010, "4l"),
(1234567820, 12.3, 1020, "9l"),
(1234567830, 12.3, 1025, "9l"),
(1234567840, 12.3, 1010, "6l"),
(1234567850, 12.3, 1001, "9l");


create table if not exists Funcionario(
	Telefone_func varchar(14),
    Cod_func int (10),
    CPF_func int(11),
    primary key (Cod_func),
    foreign key (Cod_devolucao) references Devolucao(Cod_devolucao)
);

insert into Funcionari(Telefone_func, Cod_func, CPF_func) values
("+5512345678980", 1234567890, 12134567890),
("+5512345678981", 1234567891, 12134567891),
("+5512345678982", 1234567892, 12134567892),
("+5512345678983", 1234567893, 12134567893),
("+5512345678984", 1234567894, 12134567894),
("+5512345678985", 1234567895, 12134567895),
("+5512345678986", 1234567896, 12134567896),
("+5512345678987", 1234567897, 12134567897),
("+5512345678988", 1234567898, 12134567898),
("+5512345678989", 1234567899, 12134567899),
("+5512345678910", 1234567810, 12134567810),
("+5512345678920", 1234567820, 12134567820),
("+5512345678930", 1234567830, 12134567830),
("+5512345678940", 1234567840, 12134567840),
("+5512345678950", 1234567850, 12134567850);

create table if not exists Veiculo(
	Cod_veic int (10),
    Cor_veic varchar(255),
    Placa_veic varchar(30),
    primary key (Cod_veic),
	foreign key (Cod_cliente) references Cliente (Cod_cliente)
);

insert into Veiculo(Cod_veic, Cor_veic, Placa_veic) values
(1234567890, "preto", "1234-Abcd"),
(1234567891, "vermelho", "1234-Abce"), 
(1234567892, "amarelo", "1234-Abcf"),
(1234567893, "preto", "1234-Abcg"),
(1234567894, "vermelho", "1234-hbcd"),
(1234567895, "amarelo", "1234-Aicd"),
(1234567896, "vermelho", "1234-jbcd"),
(1234567897, "amarelo", "1234-Akcd"),
(1234567898, "preto", "1234-Abcl"),
(1234567899, "amarelo", "1234-Amcd"),
(1234567810, "vermelho", "1234-nbcd"), 
(1234567820, "preto", "1234-Abco"),
(1234567830, "preto", "1234-Abcp"),
(1234567840, "vermelho", "1234-qbcd"),
(1234567850, "preto", "1234-Abcr");

create table if not exists Preventiva(
	Cod_prevent int(10),
    Data_prevent date,
    Custo_prevent float,
    primary key (Cod_prevent),
    foreign key (Cod_func) references Funcionario (Cod_func)
);

insert into Preventiva (Cod_prevent, Data_prevent, Custo_prevent) values
(1234567890, 2026/01/01, 450.20),
(1234567890, 2026/01/01, 450.20),
(1234567890, 2026/01/01, 450.20),
(1234567890, 2026/01/01, 450.20),
(1234567890, 2026/01/01, 450.20),
(1234567890, 2026/01/01, 450.20),
(1234567890, 2026/01/01, 450.20),
(1234567890, 2026/01/01, 450.20),
(1234567890, 2026/01/01, 450.20),
(1234567890, 2026/01/01, 450.20),
(1234567890, 2026/01/01, 450.20),
(1234567890, 2026/01/01, 450.20),
(1234567890, 2026/01/01, 450.20),
(1234567890, 2026/01/01, 450.20),
(1234567890, 2026/01/01, 450.20);

create table if not exists Corretiva(
	Cod_corret int(10),
    Data_corret date,
    Custo_corret float,
    primary key (Cod_corret),
    foreign key (Cod_func) references Funcionario (Cod_func)
);

insert into Corretiva (Cod_corret, Data_corret, Custo_corret) values
(1234567890, 2026/02/01, 550.20),
(1234567891, 2026/02/01, 650.20),
(1234567892, 2026/02/01, 550.20),
(1234567893, 2026/02/01, 450.20),
(1234567894, 2026/02/01, 750.20),
(1234567895, 2026/02/01, 450.20),
(1234567896, 2026/02/01, 550.20),
(1234567897, 2026/02/01, 550.20),
(1234567898, 2026/02/01, 650.20),
(1234567899, 2026/02/01, 750.20),
(1234567810, 2026/02/01, 650.20),
(1234567820, 2026/02/01, 550.20),
(1234567830, 2026/02/01, 650.20),
(1234567840, 2026/02/01, 550.20),
(1234567850, 2026/02/01, 650.20);

create table if not exists CatVeic(
	Valor_Diario float,
    Cod_catVeiculo int(10),
	Cat_capacidade int(100),
    primary key (Cod_catVeiculo),
    foreign key (Cod_pagamento) references Pagamento (Cod_pagamento)
);

insert into Catveic(Valor_Diario, Cod_catVeiculo, Cat_capacidade) values
(110.00, 1234567890, 9),
(120.00, 1234567891, 12),
(130.00, 1234567892, 9),
(140.00, 1234567893, 5),
(150.00, 1234567894, 9),
(160.00, 1234567895, 12),
(170.00, 1234567896, 9),
(180.00, 1234567897, 12),
(190.00, 1234567898, 5),
(112.00, 1234567899, 9),
(122.00, 1234567810, 12),
(133.00, 1234567820, 9),
(145.00, 1234567830, 12),
(155.00, 1234567840, 5),
(166.00, 1234567850, 9);

create table if not exists Histkm(
	Cod_historicoKm varchar(255),
    primary key (Cod_historicoKm),
    foreign key (kmF) references Devolucao(KmF),
    foreign key (KmI) references ContratoLoc(kmI),
    foreign key (Cod_cliente) references Cliente (Cod_cliente)
);

insert into Histkm(Cod_historicoKm) values
("1902km"),
("1903km"),
("1904km"),
("1905km"),
("1906km"),
("1907km"),
("1908km"),
("1909km"),
("1900km"),
("1901km"),
("1912km"),
("1922km"),
("1932km"),
("1942km"),
("1952km");

select*from Pagamento;
select*from Multa;
select*from Cliente;
select*from ContratoLoc;
select*from Devolucao;
select*from Funcionario;
select*from Veiculo;
select*from Preventiva;
select*from Corretiva;
select*from CatVeic;
select*from Histkm;