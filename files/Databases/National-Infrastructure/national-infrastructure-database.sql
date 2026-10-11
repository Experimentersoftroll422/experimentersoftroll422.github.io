
CREATE DATABASE nationaldatabase;
USE nationaldatabase;
CREATE TABLE Provinces(
	ProvinceID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	ProvinceName VARCHAR(30),
    ProvinceTax INT
);



    CREATE TABLE Projects(
	ProjectID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ProjectName VARCHAR (100) NOT NULL,
    ProjectStart DATE,
    ProjectEnd DATE,
    ProjectBudget INT,
    ProjectStatus ENUM ('Completed', 'Operational', 'Halted', 'Cancelled', 'Pending Approval') NOT NULL,
	ProvinceID INT,
    FOREIGN KEY (ProvinceID) REFERENCES Provinces(ProvinceID)
    
);#5+ planned JSON, 5 current XML


CREATE TABLE Warehouses(
WarehouseID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
WarehouseSQFT FLOAT NOT NULL,
WarehouseAddress VARCHAR (200) NOT NULL,
ProvinceID INT, FOREIGN KEY (ProvinceID) REFERENCES Provinces(ProvinceID)
);
CREATE TABLE STORAGE(
ProjectID INT NOT NULL,
WarehouseID INT NOT NULL,
PRIMARY KEY (ProjectID, WarehouseID),
FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID) ON DELETE CASCADE,
FOREIGN KEY (WarehouseID) REFERENCES Warehouses(WarehouseID) ON DELETE CASCADE
);

CREATE TABLE Contractors(
	ContractorID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	ContractorName VARCHAR(30),
	ContractorType ENUM('OilProcessing','Infastructure','Transportation','logistics') NOT NULL,
    ContractorHQ VARCHAR(30),
	ContractorPrice INT
);
CREATE TABLE ProjectAssignment(
	ProjectID INT NOT NULL,
	ContractorID INT NOT NULL,
	PRIMARY KEY (ProjectID,ContractorID),
	FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID) ON DELETE CASCADE,
	FOREIGN KEY (ContractorID) REFERENCES Contractors(ContractorID) ON DELETE CASCADE
);

INSERT INTO Provinces(ProvinceID, Provincename,ProvinceTax)
Values(1,'British Columbia',12),
	(2,  'Alberta',5),
    (3, 'Saskatchewan',11),
    (4, 'Manitoba',12),
    (5, 'Ontario',13),
    (6, 'Quebec',15),
    (7, 'New Brunswick',15),
    (8, 'Prince Edward Island',15),
    (9, 'Newfoundland & Labrabor',15),
    (10, 'Nova Scotia',14),
    (11, 'Northwest Territories',5),
    (12, 'Yukon',5),
    (13, 'Nunavut',5);
    
INSERT INTO PROJECTS(ProjectID, ProjectName,  ProjectStart, ProjectEnd, ProjectBudget, ProjectStatus, ProvinceID) VALUES
(1, "Northern Refinary Upgrade", "2023-01-15", "2025-09-30",45000000, "Operational", 2),
(2, "Alberta Pipeline Loop", "2022-06-10", "2025-02-28", 120000000, "Operational", 2),
(3, "East Coast Tank Expansion", "2023-03-01", "2024-12-15", 38000000, "Completed", 10),
(4, "Prairie Crude Storage Build", "2021-09-15", "2023-11-01",22000000, "Completed", 3),
(5, "Western Refinery Turnaround", "2024-04-01", "2024-10-15", 15000000, "Operational", 1),
(6, "Arctic Fuel Depot Project", "2026-05-05", "2028-07-30", 90000000, "Pending Approval",13),
(7, "Coastal Marine Terminal Upgrade", "2026-05-10", "2028-12-20", 68000000, "Pending Approval",7),
(8, "Bitumen Rail Loading Facility", "2027-01-01", "2029-05-30", 54000000, "Pending Approval", 2),
(9, "Saskatchewan Refinery Expansion", "2026-09-15", "2030-08-01", 160000000, "Pending Approval",3),
(10, "Atlantic Crude Offloading Dock", "2027-04-01", "2029-03-10", 30000000, "Pending Approval",7),
(11, "Northern Logistics Hub", "2026-11-01", "2029-12-31", 75000000, "Pending Approval",11),
(12, "Oil Sands Processing Line 4", "2027-06-12", "2031-11-15", 210000000, "Pending Approval",2),
(13, "Trans-Prairie Fuel Corridor", "2026-08-20", "2030-06-30", 180000000, "Pending Approval", 4),
(14, "Maritime Refinery Decommission", "2027-03-01", "2028-12-01", 26000000, "Pending Approval", 10),
(15, "Quebec Petrochemical Connector", "2028-06-15", "2031-09-30", 82000000, "Pending Approval",6);



INSERT INTO Contractors(ContractorName, ContractorType, ContractorHQ, ContractorPrice)
VALUES
('Northern Oil Systems', 'OilProcessing', 'Calgary', 4800000),
('Prairie Infrastructure Ltd', 'Infastructure', 'Regina', 3500000),
('TransCanada Movers', 'Transportation', 'Winnipeg', 2900000),
('EastCoast Logistics', 'logistics', 'Halifax', 2200000),
('Maple Refinery Services', 'OilProcessing', 'Edmonton', 4100000),
('Great Lakes Transport', 'Transportation', 'Toronto', 2700000),
('Western Build Group', 'Infastructure', 'Vancouver', 3600000),
('Atlantic Storage Corp', 'logistics', 'St. John’s', 2400000),
('Suncore Engineering', 'OilProcessing', 'Fort McMurray', 5400000),
('Polar Freight Lines', 'Transportation', 'YellowKnife', 650000);

INSERT INTO Warehouses (WarehouseID, WarehouseSQFT, WarehouseAddress, ProvinceID)
VALUES
(1, 185000.50, '4201 91A Street NW, Edmonton, Alberta',2),
(2, 132500.00, '2550 52 Avenue SE, Calgary, Alberta', 2),
(3, 98000.75, '1030 McDonald Street, Regina, Saskatchewan', 3),
(4, 210500.20, '4500 Christie Street, Toronto, Ontario', 5),
(5, 165300.00, '789 Industrial Way, Fort McMurray, Alberta',2),
(6, 254000.90, '1120 Derwent Way, Delta, British Columbia',1),
(7, 147800.40, '320 Higney Avenue, Dartmouth, Nova Scotia', 10),
(8, 201500.00, '75 Akerley Boulevard, Halifax, Nova Scotia', 10),
(9, 176250.60, '12 Allston Street, Saint John, New Brunswick',7),
(10, 229900.00, '55 Clyde Avenue, Mount Pearl, Newfoundland',9);    


INSERT INTO STORAGE (ProjectID, WarehouseID) VALUES 
(1, 2), (2,1), (3,7),(4,3),(5,6);


INSERT INTO ProjectAssignment VALUES
(1,1), (2,5), (3,4),(4,2), (5,7);

SELECT * FROM projectassignment;
SELECT * FROM Provinces;
Select * From Contractors;
SELECT * FROM Projects;
SeLECT * from warehouses;

#drop database nationaldatabase;


