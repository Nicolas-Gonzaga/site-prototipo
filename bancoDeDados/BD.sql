CREATE DATABASE eKran;
USE eKran;

CREATE TABLE Perfil (
	idPerfil INT PRIMARY KEY AUTO_INCREMENT, 
    permissoes VARCHAR(15)
) AUTO_INCREMENT = 10000;

SELECT * FROM Perfil;

CREATE TABLE Empresa (
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
	nomeEmpresa VARCHAR(45)
) AUTO_INCREMENT = 100;

SELECT * FROM Empresa;

CREATE TABLE Cadastro (
	idCadastro INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(45),
    email VARCHAR(45),
    senha VARCHAR(45),
    fkPerfil INT,
	FOREIGN KEY (fkPerfil) REFERENCES Perfil (idPerfil),
    fkEmpresa INT,
    FOREIGN KEY (fkEmpresa) REFERENCES Empresa (idEmpresa)
) AUTO_INCREMENT = 10000;

SELECT * FROM Cadastro;

CREATE TABLE Maquina (
	idMaquina INT PRIMARY KEY AUTO_INCREMENT,
    localMaquina VARCHAR(45),
    tipoMaquina VARCHAR(10),
    sistemaOperacional VARCHAR(8),
    statusMaquina CHAR(1),
    fkEmpresa INT,
    FOREIGN KEY (fkEmpresa) REFERENCES Empresa (idEmpresa),
    fkServidorTotem INT,
    FOREIGN KEY (fkServidorTotem) REFERENCES Maquina (idMaquina)
) AUTO_INCREMENT = 10000;

SELECT * FROM Maquina;

CREATE TABLE Leitura (
	idLeitura BIGINT PRIMARY KEY AUTO_INCREMENT,
    fkMaquina INT,
    FOREIGN KEY (fkMaquina) REFERENCES Maquina (idMaquina),
    CPUM DECIMAL (5,2),
    RAM DECIMAL (5,2),
    DISC DECIMAL (5,2),
    TEMP INT,
    horario DATETIME
) AUTO_INCREMENT = 100000;

SELECT * FROM Leitura;

INSERT INTO Perfil VALUES (NULL, 'ADM'),
						  (NULL, 'DEV'),
                          (NULL, 'USER');
SELECT * FROM Perfil;
		
INSERT INTO Empresa VALUES (NULL, 'Latam Airlines'),
						   (NULL, 'Emirates Airlines'),
                           (NULL, 'France Airlines'),
                           (NULL, 'Gol Airlines');
                           
SELECT * FROM Empresa;

INSERT INTO Cadastro VALUES (NULL, 'João Perez', 'joao.perez@gmail.com', 'NovaSenha123', 10000, 101),
							(NULL, 'Maria dos Santos', 'santos_maria1992@gmail.com', '123987654BTH', 10001, 102);
                            
SELECT * FROM Cadastro;

INSERT INTO Maquina VALUES (NULL, 'Santiago', 'Servidor', 'Windows', 'S', 101, NULL),
						   (NULL, 'Guarulhos', 'Totem', 'Windows', 'S', 101, 10000);
						
SELECT * FROM Maquina;

INSERT INTO Leitura VALUES (NULL, 10001, 100.00, 80.50, 75.50, 35, '2022-08-17 23:55');

SELECT * FROM Leitura;
