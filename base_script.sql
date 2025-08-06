CREATE TABLE Clienti2 (
    ID_Client NUMBER(10),       
    Nume VARCHAR2(20),         
    Prenume VARCHAR2(20),      
    Email VARCHAR2(50),
    Telefon VARCHAR2(10),              
    Data_inregistrarii DATE,
    constraint pk_id_client primary key (ID_Client),
    constraint ck_data_inregistrarii check (Data_inregistrarii between
    to_date('01.01.1970','dd.mm.yyyy') and to_date('24.12.2024', 'dd.mm.yyyy')));

select * from clienti2;

--2.Tabela Furnizori2
CREATE TABLE Furnizori2 (
    ID_Furnizor NUMBER(3),    
    Nume_Furnizor VARCHAR2(20),
    Email VARCHAR2(50),       
    Telefon VARCHAR2(15),
    constraint pk_id_furnizor primary key(ID_Furnizor)
);

--3.Tabela Produse2
CREATE TABLE Produse2 (
    ID_Produs NUMBER(5),     
    Denumire VARCHAR2(50),   
    Categorie VARCHAR2(30),    
    Pret NUMBER(4),    
    Cantitate_Stoc NUMBER(3),     
    ID_Furnizor NUMBER(3), 
    constraint pk_id_produs primary key(ID_Produs),
    constraint fk_id_furnizor foreign key (ID_Furnizor) references Furnizori2(ID_Furnizor) 
);

--4.Tabela Comenzi2
CREATE TABLE Comenzi2 (
    ID_Comanda NUMBER(10),   
    ID_Client NUMBER(10),                  
    Status VARCHAR2(20),
    Total NUMBER(4),          
    constraint pk_id_comanda primary key (id_comanda),
    constraint fk_id_client foreign key (id_client) references clienti2(id_client)
);

--5.Tabela Detalii_Comanda2
CREATE TABLE Detalii_Comanda2 (    
    ID_Comanda NUMBER(10),                
    ID_Produs NUMBER(5),    
    Cantitate NUMBER(3),          
    Pret_Unitar NUMBER(4),
    Valoare_produs NUMBER(7),           
    constraint fk_id_comanda foreign key (ID_Comanda) references Comenzi2(ID_Comanda),
    constraint fk_id_produs foreign key (ID_Produs) references Produse2(ID_Produs) 
);

--6.Tabela Plati2
CREATE TABLE Plati2 (
    ID_Comanda NUMBER(10),                 
    Metoda VARCHAR2(20),      
    Data_Plata DATE DEFAULT SYSDATE,    
    Suma NUMBER(5),       
    Status VARCHAR2(20), 
    constraint fk_id_comanda_plati foreign key (ID_Comanda) references Comenzi2(ID_Comanda) 
);
commit;




alter table clienti2 modify email varchar2(80);
alter table clienti2 add parola varchar2(20);
alter table clienti2 add constraint uq_parola unique(parola);
select * from user_constraints where table_name = 'COMENZI2';
alter table clienti2 add adresa varchar2(50);
alter table clienti2 rename column Data_inregistrarii to Data_client;
alter table comenzi2 add data_comenzii date;
alter table comenzi2 add data_livrarii date;
alter table comenzi2 add constraint ck_data_livrarii
check ((extract(day from data_livrarii) - extract(day from data_comenzii)) < 10);
alter table comenzi2 drop constraint ck_data_livrarii;
alter table clienti2 drop constraint uq_parola;
alter table plati2 add constraint uq_comanda unique(id_comanda);
alter table plati2 drop constraint uq_comanda;
alter table detalii_comanda2 add cod_reducere char(10);
alter table clienti2 drop column parola;

insert into clienti2 (ID_Client, Nume, Prenume, Email, Telefon, Data_client, 
Adresa) values (1, 'Oniceanu', 'Georgiana', 'oniceanugeorgiana23@stud.ase.ro', 
'07xxxxxxxx', to_date('07.08.2023','dd.mm.yyyy'), 'Strada Oltenitei');

insert into clienti2 (ID_Client, Nume, Prenume, Email, Telefon, Data_client, Adresa)
values (2, 'Popescu', 'Calin', 'calinpopescu@yahoo.com', '0777777777', 
to_date('12.04.2024', 'dd.mm.yyyy'), 'Strada Timisoara');

insert into clienti2 (ID_Client, Nume, Prenume, Email, Telefon, Data_client, 
 Adresa) values (3, 'Costin', 'Georgian', 'costingeorgian@yahoo.com', 
'0777777888', to_date('12.05.2022', 'dd.mm.yyyy'), 'Strada Lalelelor');

insert into clienti2 (ID_Client, Nume, Prenume, Email, Telefon, Data_client, Adresa)
values (4, 'Brancoveanu', 'Constantin', 'constantinbrancoveanu@yahoo.com', '0666666666', 
to_date('13.09.2009', 'dd.mm.yyyy'), 'Strada Brancoveanu');

insert into clienti2 (ID_Client, Nume, Prenume, Email, Telefon, Data_client, Adresa)
values (5, 'Teclu', 'Nicolae', 'nicolaeteclu@yahoo.com', '0777777777', 
to_date('21.04.2012', 'dd.mm.yyyy'), 'Strada Timisoara');

insert into clienti2 (ID_Client, Nume, Prenume, Email, Telefon, Data_client, Adresa)
values (6, 'Leonida', 'Dimitrie', 'dimitrieleonida@yahoo.com', '0333333333', 
to_date('25.12.2018', 'dd.mm.yyyy'), 'Strada Oltenitei');

insert into clienti2 (ID_Client, Nume, Prenume, Email, Telefon, Data_client, Adresa)
values (7, 'Arghezi', 'Tudor', 'tudorarghezi@yahoo.com', '0722222222', 
to_date('12.12.2012', 'dd.mm.yyyy'), 'Strada Turnu Magurele');

insert into clienti2 (ID_Client, Nume, Prenume, Email, Telefon, Data_client, Adresa)
values (8, 'Bravu', 'Mihai', 'mihaibravu@yahoo.com', '0755555555', 
to_date('09.09.2019', 'dd.mm.yyyy'), 'Strada Zambilelor');

 insert into clienti2 (ID_Client, Nume, Prenume, Email, Telefon, Data_client, Adresa)
values (9, 'Grigorescu', 'Nicolae', 'nicolaegrigorescu@yahoo.com', '0777777777', 
to_date('12.05.2023', 'dd.mm.yyyy'), 'Strada Florilor');

insert into clienti2 (ID_Client, Nume, Prenume, Email, Telefon, Data_client, Adresa)
values (10, 'Saligny', 'Anghel', 'anghelsaligny@yahoo.com', '07x4567', 
to_date('22.07.2024', 'dd.mm.yyyy'), 'Strada Timisoara');

insert into Furnizori2 (ID_Furnizor, Nume_Furnizor, Email, Telefon)
values (1, 'Furnizor 1', 'furnizor1@email.com', '0123456789');
insert into Furnizori2 (ID_Furnizor, Nume_Furnizor, Email, Telefon)
values (2, 'Furnizor 2', 'furnizor2@email.com', '0123456790');
insert into Furnizori2 (ID_Furnizor, Nume_Furnizor, Email, Telefon)
values (3, 'Furnizor 3', 'furnizor3@email.com', '0123456791');
insert into Furnizori2 (ID_Furnizor, Nume_Furnizor, Email, Telefon)
values (4, 'Furnizor 4', 'furnizor4@email.com', '0123456792');
insert into Furnizori2 (ID_Furnizor, Nume_Furnizor, Email, Telefon)
values (5, 'Furnizor 5', 'furnizor5@email.com', '0123456793');
insert into Furnizori2 (ID_Furnizor, Nume_Furnizor, Email, Telefon)
values (6, 'Furnizor 6', 'furnizor6@email.com', '0123456794');
insert into Furnizori2 (ID_Furnizor, Nume_Furnizor, Email, Telefon)
values (7, 'Furnizor 7', 'furnizor7@email.com', '0123456795');
insert into Furnizori2 (ID_Furnizor, Nume_Furnizor, Email, Telefon)
values (8, 'Furnizor 8', 'furnizor8@email.com', '0123456796');
insert into Furnizori2 (ID_Furnizor, Nume_Furnizor, Email, Telefon)
values (9, 'Furnizor 9', 'furnizor9@email.com', '0123456797');
insert into Furnizori2 (ID_Furnizor, Nume_Furnizor, Email, Telefon)
values (10, 'Furnizor 10', 'furnizor10@email.com', '0123456798');

INSERT INTO Produse2 (ID_Produs, Denumire, Categorie, Pret, Cantitate_Stoc, ID_Furnizor) 
VALUES (1, 'Hrană uscată Royal Canin Adult', 'Hrană pentru câini', 150, 100, 1);

INSERT INTO Produse2 (ID_Produs, Denumire, Categorie, Pret, Cantitate_Stoc, ID_Furnizor) 
VALUES (2, 'Hrană umedă Whiskas cu pui', 'Hrană pentru pisici', 80, 200, 2);

INSERT INTO Produse2 (ID_Produs, Denumire, Categorie, Pret, Cantitate_Stoc, ID_Furnizor) 
VALUES (3, 'Jucărie mingiuță din cauciuc', 'Jucării', 25, 300, 3);

INSERT INTO Produse2 (ID_Produs, Denumire, Categorie, Pret, Cantitate_Stoc, ID_Furnizor) 
VALUES (4, 'Lesă retractabilă 5m', 'Accesorii pentru câini', 120, 50, 4);

INSERT INTO Produse2 (ID_Produs, Denumire, Categorie, Pret, Cantitate_Stoc, ID_Furnizor) 
VALUES (5, 'Culcuș moale pentru pisici', 'Mobilier pentru animale', 200, 30, 5);

INSERT INTO Produse2 (ID_Produs, Denumire, Categorie, Pret, Cantitate_Stoc, ID_Furnizor) 
VALUES (6, 'Acvariu de sticlă 60L', 'Produse pentru pești', 400, 15, 6);

INSERT INTO Produse2 (ID_Produs, Denumire, Categorie, Pret, Cantitate_Stoc, ID_Furnizor) 
VALUES (7, 'Hrănitor automat pentru câini', 'Accesorii pentru câini', 350, 20, 7);

INSERT INTO Produse2 (ID_Produs, Denumire, Categorie, Pret, Cantitate_Stoc, ID_Furnizor) 
VALUES (8, 'Pieptene anti-noduri pentru pisici', 'Îngrijire', 45, 80, 8);

INSERT INTO Produse2 (ID_Produs, Denumire, Categorie, Pret, Cantitate_Stoc, ID_Furnizor) 
VALUES (9, 'Ham ajustabil pentru iepuri', 'Accesorii pentru animale mici', 60, 40, 9);

INSERT INTO Produse2 (ID_Produs, Denumire, Categorie, Pret, Cantitate_Stoc, ID_Furnizor) 
VALUES (10, 'Filtru extern pentru acvariu', 'Produse pentru pești', 300, 10, 10);

INSERT INTO Comenzi2 (ID_Comanda, ID_Client, Status, Total, Data_Comenzii, Data_Livrarii) 
VALUES (1, 1, 'Finalizată', 250, TO_DATE('10.12.2023', 'DD.MM.YYYY'), TO_DATE('15.12.2023', 'DD.MM.YYYY'));

INSERT INTO Comenzi2 (ID_Comanda, ID_Client, Status, Total, Data_Comenzii, Data_Livrarii) 
VALUES (2, 2, 'În procesare', 150, TO_DATE('12.12.2023', 'DD.MM.YYYY'), TO_DATE('16.12.2023', 'DD.MM.YYYY'));

INSERT INTO Comenzi2 (ID_Comanda, ID_Client, Status, Total, Data_Comenzii, Data_Livrarii) 
VALUES (3, 3, 'Finalizată', 300, TO_DATE('15.12.2023', 'DD.MM.YYYY'), TO_DATE('19.12.2023', 'DD.MM.YYYY'));

INSERT INTO Comenzi2 (ID_Comanda, ID_Client, Status, Total, Data_Comenzii, Data_Livrarii) 
VALUES (4, 4, 'Anulată', 400, TO_DATE('18.12.2023', 'DD.MM.YYYY'), NULL);

INSERT INTO Comenzi2 (ID_Comanda, ID_Client, Status, Total, Data_Comenzii, Data_Livrarii) 
VALUES (5, 5, 'Finalizată', 175, TO_DATE('20.12.2023', 'DD.MM.YYYY'), TO_DATE('24.12.2023', 'DD.MM.YYYY'));

INSERT INTO Comenzi2 (ID_Comanda, ID_Client, Status, Total, Data_Comenzii, Data_Livrarii) 
VALUES (6, 6, 'În procesare', 100, TO_DATE('22.12.2023', 'DD.MM.YYYY'), TO_DATE('26.12.2023', 'DD.MM.YYYY'));

INSERT INTO Comenzi2 (ID_Comanda, ID_Client, Status, Total, Data_Comenzii, Data_Livrarii) 
VALUES (7, 7, 'În așteptare', 225, TO_DATE('24.12.2023', 'DD.MM.YYYY'), TO_DATE('29.12.2023', 'DD.MM.YYYY'));

INSERT INTO Comenzi2 (ID_Comanda, ID_Client, Status, Total, Data_Comenzii, Data_Livrarii) 
VALUES (8, 8, 'Finalizată', 350, TO_DATE('26.12.2023', 'DD.MM.YYYY'), TO_DATE('30.12.2023', 'DD.MM.YYYY'));

INSERT INTO Comenzi2 (ID_Comanda, ID_Client, Status, Total, Data_Comenzii, Data_Livrarii) 
VALUES (9, 9, 'În procesare', 125, TO_DATE('28.12.2023', 'DD.MM.YYYY'), TO_DATE('02.01.2024', 'DD.MM.YYYY'));

INSERT INTO Comenzi2 (ID_Comanda, ID_Client, Status, Total, Data_Comenzii, Data_Livrarii) 
VALUES (10, 10, 'Finalizată', 275, TO_DATE('30.12.2023', 'DD.MM.YYYY'), TO_DATE('04.01.2024', 'DD.MM.YYYY'));

INSERT INTO Detalii_Comanda2 (ID_Comanda, ID_Produs, Cantitate, Pret_Unitar, Valoare_Produs, Cod_Reducere)
VALUES (1, 1, 2, 50, 100, 'REDUCERE10');
INSERT INTO Detalii_Comanda2 (ID_Comanda, ID_Produs, Cantitate, Pret_Unitar, Valoare_Produs, Cod_Reducere)
VALUES (2, 2, 3, 50, 150, NULL);
INSERT INTO Detalii_Comanda2 (ID_Comanda, ID_Produs, Cantitate, Pret_Unitar, Valoare_Produs, Cod_Reducere)
VALUES (3, 3, 1, 150, 150, 'REDUCERE5');
INSERT INTO Detalii_Comanda2 (ID_Comanda, ID_Produs, Cantitate, Pret_Unitar, Valoare_Produs, Cod_Reducere)
VALUES (4, 4, 2, 100, 200, 'FREESHIP');
INSERT INTO Detalii_Comanda2 (ID_Comanda, ID_Produs, Cantitate, Pret_Unitar, Valoare_Produs, Cod_Reducere)
VALUES (5, 5, 1, 100, 100, 'SPECIAL20');
INSERT INTO Detalii_Comanda2 (ID_Comanda, ID_Produs, Cantitate, Pret_Unitar, Valoare_Produs, Cod_Reducere)
VALUES (6, 6, 4, 50, 200, 'SPECIAL30');
INSERT INTO Detalii_Comanda2 (ID_Comanda, ID_Produs, Cantitate, Pret_Unitar, Valoare_Produs, Cod_Reducere)
VALUES (7, 7, 1, 175, 175, 'FREESHIP');
INSERT INTO Detalii_Comanda2 (ID_Comanda, ID_Produs, Cantitate, Pret_Unitar, Valoare_Produs, Cod_Reducere)
VALUES (8, 8, 2, 50, 100, NULL);
INSERT INTO Detalii_Comanda2 (ID_Comanda, ID_Produs, Cantitate, Pret_Unitar, Valoare_Produs, Cod_Reducere)
VALUES (9, 9, 3, 75, 225, 'VIP15');
INSERT INTO Detalii_Comanda2 (ID_Comanda, ID_Produs, Cantitate, Pret_Unitar, Valoare_Produs, Cod_Reducere)
VALUES (10, 10, 5, 70, 350, NULL);

INSERT INTO Plati2 (ID_Comanda, Metoda, Data_Plata, Suma, Status) 
VALUES (1, 'Card bancar', TO_DATE('12.12.2023', 'DD.MM.YYYY'), 250, 'Finalizată');

INSERT INTO Plati2 (ID_Comanda, Metoda, Data_Plata, Suma, Status) 
VALUES (2, 'Transfer bancar', TO_DATE('15.12.2023', 'DD.MM.YYYY'), 150, 'În așteptare');

INSERT INTO Plati2 (ID_Comanda, Metoda, Data_Plata, Suma, Status) 
VALUES (3, 'Ramburs', TO_DATE('18.12.2023', 'DD.MM.YYYY'), 300, 'Finalizată');

INSERT INTO Plati2 (ID_Comanda, Metoda, Data_Plata, Suma, Status) 
VALUES (4, 'PayPal', TO_DATE('20.12.2023', 'DD.MM.YYYY'), 400, 'Anulată');

INSERT INTO Plati2 (ID_Comanda, Metoda, Data_Plata, Suma, Status) 
VALUES (5, 'Card bancar', TO_DATE('22.12.2023', 'DD.MM.YYYY'), 175, 'Finalizată');

INSERT INTO Plati2 (ID_Comanda, Metoda, Data_Plata, Suma, Status) 
VALUES (6, 'Ramburs', TO_DATE('25.12.2023', 'DD.MM.YYYY'), 100, 'Finalizată');

INSERT INTO Plati2 (ID_Comanda, Metoda, Data_Plata, Suma, Status) 
VALUES (7, 'Card bancar', TO_DATE('27.12.2023', 'DD.MM.YYYY'), 225, 'În procesare');

INSERT INTO Plati2 (ID_Comanda, Metoda, Data_Plata, Suma, Status) 
VALUES (8, 'Transfer bancar', TO_DATE('28.12.2023', 'DD.MM.YYYY'), 350, 'Finalizată');

INSERT INTO Plati2 (ID_Comanda, Metoda, Data_Plata, Suma, Status) 
VALUES (9, 'PayPal', TO_DATE('30.12.2023', 'DD.MM.YYYY'), 125, 'În așteptare');

INSERT INTO Plati2 (ID_Comanda, Metoda, Data_Plata, Suma, Status) 
VALUES (10, 'Ramburs', TO_DATE('31.12.2023', 'DD.MM.YYYY'), 275, 'Finalizată');





insert into clienti2 (ID_Client, Nume, Prenume, Email, Telefon, Data_client, 
Adresa) values (1, 'Oniceanu', 'Georgiana', 'oniceanugeorgiana23@stud.ase.ro', 
'07xxxxxxxx', to_date('07.08.2023','dd.mm.yyyy'), 'Strada Oltenitei');

insert into clienti2 (ID_Client, Nume, Prenume, Email, Telefon, Data_client, Adresa)
values (2, 'Popescu', 'Calin', 'calinpopescu@yahoo.com', '0777777777', 
to_date('12.04.2024', 'dd.mm.yyyy'), 'Strada Timisoara');

insert into clienti2 (ID_Client, Nume, Prenume, Email, Telefon, Data_client, 
 Adresa) values (3, 'Costin', 'Georgian', 'costingeorgian@yahoo.com', 
'0777777888', to_date('12.05.2022', 'dd.mm.yyyy'),'Strada Lalelelor');

insert into clienti2 (ID_Client, Nume, Prenume, Email, Telefon, Data_client, Adresa)
values (4, 'Brancoveanu', 'Constantin', 'constantinbrancoveanu@yahoo.com', '0666666666', 
to_date('13.09.2009', 'dd.mm.yyyy'), 'Strada Brancoveanu');

insert into clienti2 (ID_Client, Nume, Prenume, Email, Telefon, Data_client, Adresa)
values (5, 'Teclu', 'Nicolae', 'nicolaeteclu@yahoo.com', '0777777777', 
to_date('21.04.2012', 'dd.mm.yyyy'), 'Strada Timisoara');

insert into clienti2 (ID_Client, Nume, Prenume, Email, Telefon, Data_client, Adresa)
values (6, 'Leonida', 'Dimitrie', 'dimitrieleonida@yahoo.com', '0333333333', 
to_date('25.12.2018', 'dd.mm.yyyy'), 'Strada Oltenitei');

insert into clienti2 (ID_Client, Nume, Prenume, Email, Telefon, Data_client, Adresa)
values (7, 'Arghezi', 'Tudor', 'tudorarghezi@yahoo.com', '0722222222', 
to_date('12.12.2012', 'dd.mm.yyyy'), 'Strada Turnu Magurele');

insert into clienti2 (ID_Client, Nume, Prenume, Email, Telefon, Data_client, Adresa)
values (8, 'Bravu', 'Mihai', 'mihaibravu@yahoo.com', '0755555555', 
to_date('09.09.2019', 'dd.mm.yyyy'), 'Strada Zambilelor');

 insert into clienti2 (ID_Client, Nume, Prenume, Email, Telefon, Data_client, Adresa)
values (9, 'Grigorescu', 'Nicolae', 'nicolaegrigorescu@yahoo.com', '0777777777', 
to_date('12.05.2023', 'dd.mm.yyyy'), 'Strada Florilor');

insert into clienti2 (ID_Client, Nume, Prenume, Email, Telefon, Data_client, Adresa)
values (10, 'Saligny', 'Anghel', 'anghelsaligny@yahoo.com', '07x4567', 
to_date('22.07.2024', 'dd.mm.yyyy'), 'Strada Timisoara');
 
insert into Furnizori2 (ID_Furnizor, Nume_Furnizor, Email, Telefon)
values (1, 'Furnizor 1', 'furnizor1@email.com', '0123456789');
insert into Furnizori2 (ID_Furnizor, Nume_Furnizor, Email, Telefon)
values (2, 'Furnizor 2', 'furnizor2@email.com', '0123456790');
insert into Furnizori2 (ID_Furnizor, Nume_Furnizor, Email, Telefon)
values (3, 'Furnizor 3', 'furnizor3@email.com', '0123456791');
insert into Furnizori2 (ID_Furnizor, Nume_Furnizor, Email, Telefon)
values (4, 'Furnizor 4', 'furnizor4@email.com', '0123456792');
insert into Furnizori2 (ID_Furnizor, Nume_Furnizor, Email, Telefon)
values (5, 'Furnizor 5', 'furnizor5@email.com', '0123456793');
insert into Furnizori2 (ID_Furnizor, Nume_Furnizor, Email, Telefon)
values (6, 'Furnizor 6', 'furnizor6@email.com', '0123456794');
insert into Furnizori2 (ID_Furnizor, Nume_Furnizor, Email, Telefon)
values (7, 'Furnizor 7', 'furnizor7@email.com', '0123456795');
insert into Furnizori2 (ID_Furnizor, Nume_Furnizor, Email, Telefon)
values (8, 'Furnizor 8', 'furnizor8@email.com', '0123456796');
insert into Furnizori2 (ID_Furnizor, Nume_Furnizor, Email, Telefon)
values (9, 'Furnizor 9', 'furnizor9@email.com', '0123456797');
insert into Furnizori2 (ID_Furnizor, Nume_Furnizor, Email, Telefon)
values (10, 'Furnizor 10', 'furnizor10@email.com', '0123456798');
 
INSERT INTO Produse2 (ID_Produs, Denumire, Categorie, Pret, Cantitate_Stoc, ID_Furnizor) VALUES (1, 'Hrană uscată Royal Canin Adult', 'Hrană pentru câini', 150, 100, 1);
INSERT INTO Produse2 (ID_Produs, Denumire, Categorie, Pret, Cantitate_Stoc, ID_Furnizor) VALUES (2, 'Hrană umedă Whiskas cu pui', 'Hrană pentru pisici', 80, 200, 2);
INSERT INTO Produse2 (ID_Produs, Denumire, Categorie, Pret, Cantitate_Stoc, ID_Furnizor) VALUES (3, 'Jucărie mingiuță din cauciuc', 'Jucării', 25, 300, 3);
INSERT INTO Produse2 (ID_Produs, Denumire, Categorie, Pret, Cantitate_Stoc, ID_Furnizor) VALUES (4, 'Lesă retractabilă 5m', 'Accesorii pentru câini', 120, 50, 4);
INSERT INTO Produse2 (ID_Produs, Denumire, Categorie, Pret, Cantitate_Stoc, ID_Furnizor) VALUES (5, 'Culcuș moale pentru pisici', 'Mobilier pentru animale', 200, 30, 5);
INSERT INTO Produse2 (ID_Produs, Denumire, Categorie, Pret, Cantitate_Stoc, ID_Furnizor) VALUES (6, 'Acvariu de sticlă 60L', 'Produse pentru pești', 400, 15, 6);
INSERT INTO Produse2 (ID_Produs, Denumire, Categorie, Pret, Cantitate_Stoc, ID_Furnizor) VALUES (7, 'Hrănitor automat pentru câini', 'Accesorii pentru câini', 350, 20, 7);
INSERT INTO Produse2 (ID_Produs, Denumire, Categorie, Pret, Cantitate_Stoc, ID_Furnizor) VALUES (8, 'Pieptene anti-noduri pentru pisici', 'Îngrijire', 45, 80, 8);
INSERT INTO Produse2 (ID_Produs, Denumire, Categorie, Pret, Cantitate_Stoc, ID_Furnizor) VALUES (9, 'Ham ajustabil pentru iepuri', 'Accesorii pentru animale mici', 60, 40, 9);
INSERT INTO Produse2 (ID_Produs, Denumire, Categorie, Pret, Cantitate_Stoc, ID_Furnizor) VALUES (10, 'Filtru extern pentru acvariu', 'Produse pentru pești', 300, 10, 10);
 

INSERT INTO Comenzi2 (ID_Comanda, ID_Client, Status, Total, Data_Comenzii, Data_Livrarii) VALUES (1, 1, 'Finalizată', 250, TO_DATE('10.12.2023', 'DD.MM.YYYY'), TO_DATE('15.12.2023', 'DD.MM.YYYY'));

INSERT INTO Comenzi2 (ID_Comanda, ID_Client, Status, Total, Data_Comenzii, Data_Livrarii) VALUES (2, 2, 'În procesare', 150, TO_DATE('12.12.2023', 'DD.MM.YYYY'), TO_DATE('16.12.2023', 'DD.MM.YYYY'));

INSERT INTO Comenzi2 (ID_Comanda, ID_Client, Status, Total, Data_Comenzii, Data_Livrarii) VALUES (3, 3, 'Finalizată', 300, TO_DATE('15.12.2023', 'DD.MM.YYYY'), TO_DATE('19.12.2023', 'DD.MM.YYYY'));

INSERT INTO Comenzi2 (ID_Comanda, ID_Client, Status, Total, Data_Comenzii, Data_Livrarii) VALUES (4, 4, 'Anulată', 400, TO_DATE('18.12.2023', 'DD.MM.YYYY'), NULL);

INSERT INTO Comenzi2 (ID_Comanda, ID_Client, Status, Total, Data_Comenzii, Data_Livrarii) VALUES (5, 5, 'Finalizată', 175, TO_DATE('20.12.2023', 'DD.MM.YYYY'), TO_DATE('24.12.2023', 'DD.MM.YYYY'));

INSERT INTO Comenzi2 (ID_Comanda, ID_Client, Status, Total, Data_Comenzii, Data_Livrarii) VALUES (6, 6, 'În procesare', 100, TO_DATE('22.12.2023', 'DD.MM.YYYY'), TO_DATE('26.12.2023', 'DD.MM.YYYY'));

INSERT INTO Comenzi2 (ID_Comanda, ID_Client, Status, Total, Data_Comenzii, Data_Livrarii) VALUES (7, 7, 'În așteptare', 225, TO_DATE('24.12.2023', 'DD.MM.YYYY'), TO_DATE('29.12.2023', 'DD.MM.YYYY'));

INSERT INTO Comenzi2 (ID_Comanda, ID_Client, Status, Total, Data_Comenzii, Data_Livrarii) VALUES (8, 8, 'Finalizată', 350, TO_DATE('26.12.2023', 'DD.MM.YYYY'), TO_DATE('30.12.2023', 'DD.MM.YYYY'));

INSERT INTO Comenzi2 (ID_Comanda, ID_Client, Status, Total, Data_Comenzii, Data_Livrarii) VALUES (9, 9, 'În procesare', 125, TO_DATE('28.12.2023', 'DD.MM.YYYY'), TO_DATE('02.01.2024', 'DD.MM.YYYY'));

INSERT INTO Comenzi2 (ID_Comanda, ID_Client, Status, Total, Data_Comenzii, Data_Livrarii) VALUES (10, 10, 'Finalizată', 275, TO_DATE('30.12.2023', 'DD.MM.YYYY'), TO_DATE('04.01.2024', 'DD.MM.YYYY'));


INSERT INTO Detalii_Comanda2 (ID_Comanda, ID_Produs, Cantitate, Pret_Unitar, Valoare_Produs, Cod_Reducere)
VALUES (1, 1, 2, 50, 100, 'REDUCERE10');
INSERT INTO Detalii_Comanda2 (ID_Comanda, ID_Produs, Cantitate, Pret_Unitar, Valoare_Produs, Cod_Reducere)
VALUES (1, 2, 3, 50, 150, NULL);
INSERT INTO Detalii_Comanda2 (ID_Comanda, ID_Produs, Cantitate, Pret_Unitar, Valoare_Produs, Cod_Reducere)
VALUES (2, 3, 1, 150, 150, 'REDUCERE5');
INSERT INTO Detalii_Comanda2 (ID_Comanda, ID_Produs, Cantitate, Pret_Unitar, Valoare_Produs, Cod_Reducere)
VALUES (3, 4, 2, 100, 200, NULL);
INSERT INTO Detalii_Comanda2 (ID_Comanda, ID_Produs, Cantitate, Pret_Unitar, Valoare_Produs, Cod_Reducere)
VALUES (3, 5, 1, 100, 100, 'SPECIAL20');
INSERT INTO Detalii_Comanda2 (ID_Comanda, ID_Produs, Cantitate, Pret_Unitar, Valoare_Produs, Cod_Reducere)
VALUES (4, 6, 4, 50, 200, NULL);
INSERT INTO Detalii_Comanda2 (ID_Comanda, ID_Produs, Cantitate, Pret_Unitar, Valoare_Produs, Cod_Reducere)
VALUES (5, 7, 1, 175, 175, 'FREESHIP');
INSERT INTO Detalii_Comanda2 (ID_Comanda, ID_Produs, Cantitate, Pret_Unitar, Valoare_Produs, Cod_Reducere)
VALUES (6, 8, 2, 50, 100, NULL);
INSERT INTO Detalii_Comanda2 (ID_Comanda, ID_Produs, Cantitate, Pret_Unitar, Valoare_Produs, Cod_Reducere)
VALUES (7, 9, 3, 75, 225, 'VIP15');
INSERT INTO Detalii_Comanda2 (ID_Comanda, ID_Produs, Cantitate, Pret_Unitar, Valoare_Produs, Cod_Reducere)
VALUES (8, 10, 5, 70, 350, NULL);
 
INSERT INTO Plati2 (ID_Comanda, Metoda, Data_Plata, Suma, Status) 
VALUES (1, 'Card bancar', TO_DATE('12.12.2023', 'DD.MM.YYYY'), 250, 'Finalizată');

INSERT INTO Plati2 (ID_Comanda, Metoda, Data_Plata, Suma, Status) 
VALUES (2, 'Transfer bancar', TO_DATE('15.12.2023', 'DD.MM.YYYY'), 150, 'În așteptare');

INSERT INTO Plati2 (ID_Comanda, Metoda, Data_Plata, Suma, Status) 
VALUES (3, 'Ramburs', TO_DATE('18.12.2023', 'DD.MM.YYYY'), 300, 'Finalizată');

INSERT INTO Plati2 (ID_Comanda, Metoda, Data_Plata, Suma, Status) 
VALUES (4, 'PayPal', TO_DATE('20.12.2023', 'DD.MM.YYYY'), 400, 'Anulată');

INSERT INTO Plati2 (ID_Comanda, Metoda, Data_Plata, Suma, Status) 
VALUES (5, 'Card bancar', TO_DATE('22.12.2023', 'DD.MM.YYYY'), 175, 'Finalizată');

INSERT INTO Plati2 (ID_Comanda, Metoda, Data_Plata, Suma, Status) 
VALUES (6, 'Ramburs', TO_DATE('25.12.2023', 'DD.MM.YYYY'), 100, 'Finalizată');

INSERT INTO Plati2 (ID_Comanda, Metoda, Data_Plata, Suma, Status) 
VALUES (7, 'Card bancar', TO_DATE('27.12.2023', 'DD.MM.YYYY'), 225, 'În procesare');

INSERT INTO Plati2 (ID_Comanda, Metoda, Data_Plata, Suma, Status) 
VALUES (8, 'Transfer bancar', TO_DATE('28.12.2023', 'DD.MM.YYYY'), 350, 'Finalizată');

INSERT INTO Plati2 (ID_Comanda, Metoda, Data_Plata, Suma, Status) 
VALUES (9, 'PayPal', TO_DATE('30.12.2023', 'DD.MM.YYYY'), 125, 'În așteptare');

INSERT INTO Plati2 (ID_Comanda, Metoda, Data_Plata, Suma, Status) 
VALUES (10, 'Ramburs', TO_DATE('31.12.2023', 'DD.MM.YYYY'), 275, 'Finalizată');

INSERT INTO clienti2 (ID_Client, Nume, Prenume, Email, Telefon, Data_client, Adresa) 
VALUES (11, 'Ionescu', 'Maria', 'maria.ionescu@yahoo.com', '0721111111', TO_DATE('15.01.2023', 'DD.MM.YYYY'),  'Strada Rozelor');

INSERT INTO clienti2 (ID_Client, Nume, Prenume, Email, Telefon, Data_client, Adresa) 
VALUES (12, 'Popescu', 'Ion', 'ion.popescu@gmail.com', '0722222222', TO_DATE('20.02.2023', 'DD.MM.YYYY'), 'Strada Trandafirilor');

INSERT INTO clienti2 (ID_Client, Nume, Prenume, Email, Telefon, Data_client,  Adresa) 
VALUES (13, 'Dumitrescu', 'Ana', 'ana.dumitrescu@yahoo.com', '0733333333', TO_DATE('10.03.2023', 'DD.MM.YYYY'),  'Strada Lalelelor');

INSERT INTO clienti2 (ID_Client, Nume, Prenume, Email, Telefon, Data_client, Adresa) 
VALUES (14, 'Georgescu', 'Mihai', 'mihai.georgescu@gmail.com', '0744444444', TO_DATE('05.04.2023', 'DD.MM.YYYY'), 'Strada Narciselor');

INSERT INTO clienti2 (ID_Client, Nume, Prenume, Email, Telefon, Data_client, Adresa) 
VALUES (15, 'Radulescu', 'Elena', 'elena.radulescu@yahoo.com', '0755555555', TO_DATE('12.05.2023', 'DD.MM.YYYY'),  'Strada Ghioceilor');


select * from clienti2;

INSERT INTO Furnizori2 (ID_Furnizor, Nume_Furnizor, Email, Telefon)
VALUES (11, 'PetFood Supreme', 'contact@petfoodsupreme.com', '0211111111');

INSERT INTO Furnizori2 (ID_Furnizor, Nume_Furnizor, Email, Telefon)
VALUES (12, 'Animalis', 'contact@animalis.ro', '0211111112');

INSERT INTO Furnizori2 (ID_Furnizor, Nume_Furnizor, Email, Telefon)
VALUES (13, 'Zooplus', 'romania@zooplus.com', '0211111113');

INSERT INTO Furnizori2 (ID_Furnizor, Nume_Furnizor, Email, Telefon)
VALUES (14, 'PetShop Direct', 'sales@petshopdirect.ro', '0211111114');

INSERT INTO Furnizori2 (ID_Furnizor, Nume_Furnizor, Email, Telefon)
VALUES (15, 'Happy Pet', 'office@happypet.ro', '0211111115');

-- Produse pentru câini
INSERT INTO Produse2 VALUES (12, 'Hrană umedă Pedigree', 'Hrană pentru câini', 65, 120, 12);
INSERT INTO Produse2 VALUES (13, 'Jucărie Os din cauciuc', 'Jucării pentru câini', 35, 200, 13);
INSERT INTO Produse2 VALUES (14, 'Zgardă antiderapantă', 'Accesorii pentru câini', 90, 60, 14);
INSERT INTO Produse2 VALUES (15, 'Shampoo antiparazitar', 'Îngrijire pentru câini', 45, 150, 15);

-- Produse pentru pisici
INSERT INTO Produse2 VALUES (16, 'Hrană uscată Whiskas', 'Hrană pentru pisici', 70, 150, 11);
INSERT INTO Produse2 VALUES (17, 'Hrană umedă Felix', 'Hrană pentru pisici', 55, 180, 12);
INSERT INTO Produse2 VALUES (18, 'Jucărie Pânză de păianjen', 'Jucării pentru pisici', 30, 250, 13);
INSERT INTO Produse2 VALUES (19, 'Pisicărie cu multiple niveluri', 'Mobilier pentru pisici', 450, 20, 14);
INSERT INTO Produse2 VALUES (20, 'Pieptene de metal', 'Îngrijire pentru pisici', 25, 300, 15);

-- Produse pentru pești
INSERT INTO Produse2 VALUES (21, 'Hrană flakes tropicale', 'Hrană pentru pești', 40, 100, 11);
INSERT INTO Produse2 VALUES (22, 'Acvariu 100L', 'Produse pentru pești', 600, 10, 12);
INSERT INTO Produse2 VALUES (23, 'Filtru intern', 'Produse pentru pești', 120, 30, 13);
INSERT INTO Produse2 VALUES (24, 'Încălzitor 200W', 'Produse pentru pești', 90, 25, 14);
INSERT INTO Produse2 VALUES (25, 'Plantă artificială', 'Produse pentru pești', 35, 50, 15);


-- Comenzi pentru clientul 1 (5 comenzi)
INSERT INTO Comenzi2 VALUES (11, 1, 'Finalizată', 320, TO_DATE('05.01.2024', 'DD.MM.YYYY'), TO_DATE('10.01.2024', 'DD.MM.YYYY'));
INSERT INTO Comenzi2 VALUES (12, 1, 'Finalizată', 180, TO_DATE('15.02.2024', 'DD.MM.YYYY'), TO_DATE('20.02.2024', 'DD.MM.YYYY'));
INSERT INTO Comenzi2 VALUES (13, 1, 'În procesare', 420, TO_DATE('01.03.2024', 'DD.MM.YYYY'), TO_DATE('06.03.2024', 'DD.MM.YYYY'));
INSERT INTO Comenzi2 VALUES (14, 1, 'Finalizată', 95, TO_DATE('10.04.2024', 'DD.MM.YYYY'), TO_DATE('15.04.2024', 'DD.MM.YYYY'));
INSERT INTO Comenzi2 VALUES (15, 1, 'Anulată', 230, TO_DATE('20.05.2024', 'DD.MM.YYYY'), NULL);

-- Comenzi pentru clientul 2 (3 comenzi)
INSERT INTO Comenzi2 VALUES (16, 2, 'Finalizată', 150, TO_DATE('12.01.2024', 'DD.MM.YYYY'), TO_DATE('17.01.2024', 'DD.MM.YYYY'));
INSERT INTO Comenzi2 VALUES (17, 2, 'În așteptare', 280, TO_DATE('25.02.2024', 'DD.MM.YYYY'), TO_DATE('02.03.2024', 'DD.MM.YYYY'));
INSERT INTO Comenzi2 VALUES (18, 2, 'Finalizată', 190, TO_DATE('15.04.2024', 'DD.MM.YYYY'), TO_DATE('20.04.2024', 'DD.MM.YYYY'));

-- Comenzi pentru clientul 3 (4 comenzi)
INSERT INTO Comenzi2 VALUES (19, 3, 'Finalizată', 210, TO_DATE('08.01.2024', 'DD.MM.YYYY'), TO_DATE('13.01.2024', 'DD.MM.YYYY'));
INSERT INTO Comenzi2 VALUES (20, 3, 'Finalizată', 340, TO_DATE('22.02.2024', 'DD.MM.YYYY'), TO_DATE('27.02.2024', 'DD.MM.YYYY'));
INSERT INTO Comenzi2 VALUES (21, 3, 'În procesare', 175, TO_DATE('10.03.2024', 'DD.MM.YYYY'), TO_DATE('15.03.2024', 'DD.MM.YYYY'));
INSERT INTO Comenzi2 VALUES (22, 3, 'Anulată', 420, TO_DATE('05.05.2024', 'DD.MM.YYYY'), NULL);

-- Comenzi pentru clientul 4 (2 comenzi)
INSERT INTO Comenzi2 VALUES (23, 4, 'Finalizată', 380, TO_DATE('18.01.2024', 'DD.MM.YYYY'), TO_DATE('23.01.2024', 'DD.MM.YYYY'));
INSERT INTO Comenzi2 VALUES (24, 4, 'Finalizată', 120, TO_DATE('28.04.2024', 'DD.MM.YYYY'), TO_DATE('03.05.2024', 'DD.MM.YYYY'));

-- Comenzi pentru clientii noi (6 comenzi)
INSERT INTO Comenzi2 VALUES (25, 11, 'Finalizată', 195, TO_DATE('10.02.2024', 'DD.MM.YYYY'), TO_DATE('15.02.2024', 'DD.MM.YYYY'));
INSERT INTO Comenzi2 VALUES (26, 12, 'În procesare', 260, TO_DATE('22.03.2024', 'DD.MM.YYYY'), TO_DATE('27.03.2024', 'DD.MM.YYYY'));
INSERT INTO Comenzi2 VALUES (27, 13, 'Finalizată', 310, TO_DATE('05.04.2024', 'DD.MM.YYYY'), TO_DATE('10.04.2024', 'DD.MM.YYYY'));
INSERT INTO Comenzi2 VALUES (28, 14, 'Finalizată', 145, TO_DATE('15.05.2024', 'DD.MM.YYYY'), TO_DATE('20.05.2024', 'DD.MM.YYYY'));
INSERT INTO Comenzi2 VALUES (29, 15, 'În așteptare', 225, TO_DATE('20.05.2024', 'DD.MM.YYYY'), TO_DATE('25.05.2024', 'DD.MM.YYYY'));
INSERT INTO Comenzi2 VALUES (30, 11, 'Finalizată', 180, TO_DATE('25.05.2024', 'DD.MM.YYYY'), TO_DATE('30.05.2024', 'DD.MM.YYYY'));

-- Detalii pentru comenzile clientului 1
INSERT INTO Detalii_Comanda2 VALUES (11, 1, 1, 150, 150, NULL);
INSERT INTO Detalii_Comanda2 VALUES (11, 3, 2, 25, 50, 'REDUCERE10');
INSERT INTO Detalii_Comanda2 VALUES (11, 8, 1, 45, 45, NULL);
INSERT INTO Detalii_Comanda2 VALUES (12, 2, 3, 80, 240, 'VIP15');
INSERT INTO Detalii_Comanda2 VALUES (12, 5, 1, 200, 200, NULL);
INSERT INTO Detalii_Comanda2 VALUES (13, 4, 2, 120, 240, NULL);
INSERT INTO Detalii_Comanda2 VALUES (13, 6, 1, 400, 400, 'SPECIAL20');
INSERT INTO Detalii_Comanda2 VALUES (14, 3, 1, 25, 25, NULL);
INSERT INTO Detalii_Comanda2 VALUES (14, 8, 2, 45, 90, 'REDUCERE5');
INSERT INTO Detalii_Comanda2 VALUES (15, 7, 1, 350, 350, NULL);

-- Detalii pentru comenzile clientului 2
INSERT INTO Detalii_Comanda2 VALUES (16, 11, 1, 180, 180, NULL);
INSERT INTO Detalii_Comanda2 VALUES (16, 13, 2, 35, 70, 'REDUCERE10');
INSERT INTO Detalii_Comanda2 VALUES (17, 16, 3, 70, 210, NULL);
INSERT INTO Detalii_Comanda2 VALUES (17, 18, 1, 30, 30, 'VIP15');
INSERT INTO Detalii_Comanda2 VALUES (18, 12, 2, 65, 130, NULL);
INSERT INTO Detalii_Comanda2 VALUES (18, 14, 1, 90, 90, 'REDUCERE5');

-- Detalii pentru comenzile clientului 3
INSERT INTO Detalii_Comanda2 VALUES (19, 15, 1, 45, 45, NULL);
INSERT INTO Detalii_Comanda2 VALUES (19, 17, 3, 55, 165, 'SPECIAL20');
INSERT INTO Detalii_Comanda2 VALUES (20, 19, 1, 450, 450, NULL);
INSERT INTO Detalii_Comanda2 VALUES (20, 20, 2, 25, 50, 'REDUCERE10');
INSERT INTO Detalii_Comanda2 VALUES (21, 21, 1, 40, 40, NULL);
INSERT INTO Detalii_Comanda2 VALUES (21, 23, 1, 120, 120, 'VIP15');
INSERT INTO Detalii_Comanda2 VALUES (22, 22, 1, 600, 600, NULL);

-- Detalii pentru comenzile clientului 4
INSERT INTO Detalii_Comanda2 VALUES (23, 24, 1, 90, 90, NULL);
INSERT INTO Detalii_Comanda2 VALUES (23, 25, 2, 35, 70, 'REDUCERE10');
INSERT INTO Detalii_Comanda2 VALUES (23, 11, 1, 180, 180, NULL);
INSERT INTO Detalii_Comanda2 VALUES (24, 12, 1, 65, 65, NULL);
INSERT INTO Detalii_Comanda2 VALUES (24, 14, 1, 90, 90, 'REDUCERE5');

-- Detalii pentru comenzile clientilor noi
INSERT INTO Detalii_Comanda2 VALUES (25, 16, 2, 70, 140, NULL);
INSERT INTO Detalii_Comanda2 VALUES (25, 18, 1, 30, 30, 'VIP15');
INSERT INTO Detalii_Comanda2 VALUES (26, 17, 3, 55, 165, NULL);
INSERT INTO Detalii_Comanda2 VALUES (26, 19, 1, 450, 450, 'SPECIAL20');
INSERT INTO Detalii_Comanda2 VALUES (27, 20, 4, 25, 100, NULL);
INSERT INTO Detalii_Comanda2 VALUES (27, 21, 1, 40, 40, 'REDUCERE10');
INSERT INTO Detalii_Comanda2 VALUES (28, 22, 1, 600, 600, NULL);
INSERT INTO Detalii_Comanda2 VALUES (28, 23, 1, 120, 120, 'VIP15');
INSERT INTO Detalii_Comanda2 VALUES (29, 24, 1, 90, 90, NULL);
INSERT INTO Detalii_Comanda2 VALUES (29, 25, 3, 35, 105, 'REDUCERE5');
INSERT INTO Detalii_Comanda2 VALUES (30, 11, 1, 180, 180, NULL);

INSERT INTO Plati2 VALUES (11, 'Card bancar', TO_DATE('05.01.2024', 'DD.MM.YYYY'), 320, 'Finalizată');
INSERT INTO Plati2 VALUES (12, 'Ramburs', TO_DATE('15.02.2024', 'DD.MM.YYYY'), 180, 'Finalizată');
INSERT INTO Plati2 VALUES (13, 'Transfer bancar', TO_DATE('01.03.2024', 'DD.MM.YYYY'), 420, 'În procesare');
INSERT INTO Plati2 VALUES (14, 'Card bancar', TO_DATE('10.04.2024', 'DD.MM.YYYY'), 95, 'Finalizată');
INSERT INTO Plati2 VALUES (16, 'PayPal', TO_DATE('12.01.2024', 'DD.MM.YYYY'), 150, 'Finalizată');
INSERT INTO Plati2 VALUES (17, 'Card bancar', TO_DATE('25.02.2024', 'DD.MM.YYYY'), 280, 'În așteptare');
INSERT INTO Plati2 VALUES (18, 'Ramburs', TO_DATE('15.04.2024', 'DD.MM.YYYY'), 190, 'Finalizată');
INSERT INTO Plati2 VALUES (19, 'Transfer bancar', TO_DATE('08.01.2024', 'DD.MM.YYYY'), 210, 'Finalizată');
INSERT INTO Plati2 VALUES (20, 'Card bancar', TO_DATE('22.02.2024', 'DD.MM.YYYY'), 340, 'Finalizată');
INSERT INTO Plati2 VALUES (21, 'PayPal', TO_DATE('10.03.2024', 'DD.MM.YYYY'), 175, 'În procesare');
INSERT INTO Plati2 VALUES (23, 'Ramburs', TO_DATE('18.01.2024', 'DD.MM.YYYY'), 380, 'Finalizată');
INSERT INTO Plati2 VALUES (24, 'Card bancar', TO_DATE('28.04.2024', 'DD.MM.YYYY'), 120, 'Finalizată');
INSERT INTO Plati2 VALUES (25, 'Transfer bancar', TO_DATE('10.02.2024', 'DD.MM.YYYY'), 195, 'Finalizată');
INSERT INTO Plati2 VALUES (26, 'Card bancar', TO_DATE('22.03.2024', 'DD.MM.YYYY'), 260, 'În procesare');
INSERT INTO Plati2 VALUES (27, 'PayPal', TO_DATE('05.04.2024', 'DD.MM.YYYY'), 310, 'Finalizată');
INSERT INTO Plati2 VALUES (28, 'Ramburs', TO_DATE('15.05.2024', 'DD.MM.YYYY'), 145, 'Finalizată');
INSERT INTO Plati2 VALUES (29, 'Card bancar', TO_DATE('20.05.2024', 'DD.MM.YYYY'), 225, 'În așteptare');
INSERT INTO Plati2 VALUES (30, 'Transfer bancar', TO_DATE('25.05.2024', 'DD.MM.YYYY'), 180, 'Finalizată');
