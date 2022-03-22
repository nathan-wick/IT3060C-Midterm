USE ProfessionalServicesCompany

DROP TABLE IF EXISTS ProjectServices, Services, EmployeeProjects, Projects, Clients, Employees, Addresses, Roles;

CREATE TABLE Roles (
    RoleID INT IDENTITY(1,1) PRIMARY KEY,
    RoleName VARCHAR(50),
    RoleLevel SMALLINT
);

CREATE TABLE Addresses (
    AddressID INT IDENTITY(1,1) PRIMARY KEY,
    Street VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Country VARCHAR(50)
);

CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    RoleID INT FOREIGN KEY REFERENCES Roles(RoleID),
    AddressID INT FOREIGN KEY REFERENCES Addresses(AddressID),
    EmployeeName VARCHAR(50)
);

CREATE TABLE Clients (
    ClientID INT IDENTITY(1,1) PRIMARY KEY,
    AddressID INT FOREIGN KEY REFERENCES Addresses(AddressID),
    ClientName VARCHAR(50)
);

CREATE TABLE Projects (
    ProjectID INT IDENTITY(1,1) PRIMARY KEY,
    ClientID INT FOREIGN KEY REFERENCES Clients(ClientID),
    ProjectName VARCHAR(50),
    ProjectStartDate DATE,
    ProjectEndDate DATE,
    TotalProjectHours INT,
    AverageProjectHourlyBillingRate MONEY
);

CREATE TABLE EmployeeProjects (
    EmployeeProjectID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT FOREIGN KEY REFERENCES Employees(EmployeeID),
    ProjectID INT FOREIGN KEY REFERENCES Projects(projectID),
    EmployeeHourlyPayRate MONEY
);

CREATE TABLE Services (
    ServiceID INT IDENTITY(1,1) PRIMARY KEY,
    ServiceName VARCHAR(50),
    ServicesOnProject VARCHAR(150)
);

CREATE TABLE ProjectServices (
    ProjectServiceID INT IDENTITY(1,1) PRIMARY KEY,
    ProjectID INT FOREIGN KEY REFERENCES Projects(projectID),
    ServiceID INT FOREIGN KEY REFERENCES Services(ServiceID)
);