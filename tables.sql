
CREATE DATABASE AdventureTravels;
USE AdventureTravels;

-- Parent Tables
CREATE TABLE Customer (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(15),
    Address TEXT,
    Preferences TEXT
);

CREATE TABLE Destination (
    DestinationID INT AUTO_INCREMENT PRIMARY KEY,
    DestinationName VARCHAR(100) NOT NULL,
    Country VARCHAR(50) NOT NULL,
    Description TEXT
);

CREATE TABLE Transportation (
    TransportationModeID INT AUTO_INCREMENT PRIMARY KEY,
    TransportationType ENUM('Train', 'Bus', 'Flight') NOT NULL,
    CompanyName VARCHAR(100),
    CostPerPerson DECIMAL(10, 2)
);

-- Dependent Tables
CREATE TABLE TravelBooking (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    DestinationID INT NOT NULL,
    BookingDate DATE NOT NULL,
    TransportationModeID INT NOT NULL,
    TotalCost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) ON DELETE CASCADE,
    FOREIGN KEY (DestinationID) REFERENCES Destination(DestinationID) ON DELETE CASCADE,
    FOREIGN KEY (TransportationModeID) REFERENCES Transportation(TransportationModeID) ON DELETE CASCADE
);

CREATE TABLE Payment (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    BookingID INT NOT NULL,
    PaymentDate DATE NOT NULL,
    PaymentAmount DECIMAL(10, 2) NOT NULL,
    PaymentMethod ENUM('Down Payment', 'Full', 'Installment') NOT NULL,
    FOREIGN KEY (BookingID) REFERENCES TravelBooking(BookingID) ON DELETE CASCADE
);
