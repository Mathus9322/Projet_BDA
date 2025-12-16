CREATE DATABASE AgroGraph
    DEFAULT CHARACTER SET = 'utf8mb4';

USE AgroGraph;


CREATE TABLE Produit(
    id int PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(20) UNIQUE NOT NULL
);


CREATE TABLE Variete(
    id int PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(30) UNIQUE NOT NULL,
    prix FLOAT NOT NULL,
    quantite int,
    idProduit int,
    CHECK (quantite >= 0 AND prix >=0),
    FOREIGN KEY (idProduit) REFERENCES Produit(id)
);

CREATE TABLE Client(
    id int PRIMARY KEY AUTO_INCREMENT,
    prenom VARCHAR(30) NOT NULL,
    nom VARCHAR(20) NOT NULL,
    telephone VARCHAR(20) NOT NULL,
    adresse VARCHAR(30) NOT NULL    
);



CREATE TABLE Vente(
    id int PRIMARY KEY AUTO_INCREMENT,
    dateVente DATE NOT NULL,
    quantiteVente int NOT NULL,
    idVariete int,
    idClient int,
    CHECK(quantiteVente >=0),
    FOREIGN KEY (idClient) REFERENCES Client(id),
    FOREIGN KEY (idVariete) REFERENCES Variete(id)
);


INSERT INTO Produit (nom) VALUES 
('Pomme'),
('Banane'),
('Orange'),
('Fraise'),
('Raisin');

INSERT INTO Variete (nom, prix, quantite, idProduit) VALUES 
('Golden', 2.5, 100, 1),
('Cavendish', 1.2, 150, 2),
('Navel', 3.0, 200, 3),
('Gariguette', 4.5, 80, 4),
('Muscat', 5.0, 60, 5);
INSERT INTO Client (prenom, nom, telephone, adresse) VALUES 
('Alice', 'Dupont', '0123456789', '123 Rue A'),
('Bob', 'Martin', '0987654321', '456 Rue B'),
('Charlie', 'Durand', '0147258369', '789 Rue C');  

INSERT INTO Vente (dateVente, quantiteVente, idVariete, idClient) VALUES 
('2024-01-15', 10, 1, 1),
('2024-01-16', 20, 2, 2),
('2024-01-17', 15, 3, 3),
('2024-01-18', 5, 4, 1),
('2024-01-19', 8, 5, 2);
INSERT INTO Vente (dateVente, quantiteVente, idVariete, idClient) VALUES 
('2024-01-15', 12, 1, 1),
('2024-01-15', 8, 2, 2),
('2024-01-15', 15, 3, 3),
('2024-01-15', 10, 4, 1),
('2024-01-15', 11, 5, 2),
('2024-01-15', 9, 1, 3),
('2024-01-15', 13, 2, 1),
('2024-01-15', 14, 3, 2),
('2024-01-15', 12, 4, 3),
('2024-01-15', 10, 5, 1),
('2024-01-16', 11, 1, 2),
('2024-01-16', 9, 2, 3),
('2024-01-16', 12, 3, 1),
('2024-01-16', 13, 4, 2),
('2024-01-16', 10, 5, 3),
('2024-01-16', 14, 1, 1),
('2024-01-16', 8, 2, 2),
('2024-01-16', 11, 3, 3),
('2024-01-16', 15, 4, 1),
('2024-01-16', 12, 5, 2),
('2024-01-17', 10, 1, 3),
('2024-01-17', 13, 2, 1),
('2024-01-17', 9, 3, 2),
('2024-01-17', 11, 4, 3),
('2024-01-17', 14, 5, 1),
('2024-01-17', 12, 1, 2),
('2024-01-17', 10, 2, 3),
('2024-01-17', 15, 3, 1),
('2024-01-17', 13, 4, 2),
('2024-01-17', 11, 5, 3),
('2024-01-18', 12, 1, 1),
('2024-01-18', 10, 2, 2),
('2024-01-18', 14, 3, 3),
('2024-01-18', 9, 4, 1),
('2024-01-18', 13, 5, 2),
('2024-01-18', 11, 1, 3),
('2024-01-18', 15, 2, 1),
('2024-01-18', 10, 3, 2),
('2024-01-18', 12, 4, 3),
('2024-01-18', 14, 5, 1),
('2024-01-19', 13, 1, 2),
('2024-01-19', 11, 2, 3),
('2024-01-19', 10, 3, 1),
('2024-01-19', 12, 4, 2),
('2024-01-19', 15, 5, 3),
('2024-01-19', 9, 1, 1),
('2024-01-19', 14, 2, 2),
('2024-01-19', 11, 3, 3),
('2024-01-19', 13, 4, 1),
('2024-01-19', 10, 5, 2);


select * from client;
select * from produit;
select * from variete order by id;
select * from vente;


select p.nom as Produit, SUM(v.quantiteVente * vr.prix) as Chiffre_Affaires
from Vente v
join Variete vr on v.idVariete = vr.id
join Produit p on vr.idProduit = p.id
group by p.nom;

select v.dateVente as Jour, SUM(v.quantiteVente * vr.prix) as Chiffre_Affaires
from Vente v
join Variete vr on v.idVariete = vr.id
join Produit p on vr.idProduit = p.id
group by v.dateVente;