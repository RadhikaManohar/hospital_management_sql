CREATE DATABASE HospitalDB;
USE HospitalDB;

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Specialization VARCHAR(100),
    Phone VARCHAR(15)
);

CREATE TABLE Patients (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    Phone VARCHAR(15)
);

CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    DoctorID INT,
    Date DATE,
    Time TIME,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

CREATE TABLE Medications (
    MedicationID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    MedicationName VARCHAR(100),
    Dosage VARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

CREATE TABLE Billing (
    BillID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    Amount DECIMAL(10,2),
    Date DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

-- Insert sample data

INSERT INTO Doctors (Name, Specialization, Phone) VALUES 
('Dr. Asha Mehta', 'Cardiology', '9876543210'),
('Dr. Rajiv Menon', 'Neurology', '9123456780'),
('Dr. Priya Shah', 'Pediatrics', '9998887776');

INSERT INTO Patients (Name, Age, Gender, Phone) VALUES 
('Ananya Rao', 29, 'Female', '9988776655'),
('Ravi Verma', 45, 'Male', '9876543210'),
('Sanjay Patel', 10, 'Male', '9123456780');

INSERT INTO Appointments (PatientID, DoctorID, Date, Time) VALUES 
(1, 1, '2025-07-20', '10:00:00'),
(2, 2, '2025-07-21', '11:30:00'),
(3, 3, '2025-07-22', '09:00:00');

INSERT INTO Medications (PatientID, MedicationName, Dosage) VALUES 
(1, 'Atenolol', '50mg daily'),
(2, 'Gabapentin', '100mg twice a day'),
(3, 'Amoxicillin', '250mg three times a day');

INSERT INTO Billing (PatientID, Amount, Date) VALUES 
(1, 1500.00, '2025-07-20'),
(2, 2500.00, '2025-07-21'),
(3, 1000.00, '2025-07-22');
