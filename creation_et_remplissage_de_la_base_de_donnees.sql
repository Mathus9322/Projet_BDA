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
    FOREIGN KEY (idVariete) REFERENCES Variete(id)=
);