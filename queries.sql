-- 1. List all patients with their assigned doctor
SELECT 
    p.Name AS PatientName,
    d.Name AS DoctorName,
    d.Specialization
FROM 
    Patients p
JOIN 
    Appointments a ON p.PatientID = a.PatientID
JOIN 
    Doctors d ON a.DoctorID = d.DoctorID;

-- 2. Total billing per patient
SELECT 
    p.Name AS PatientName,
    SUM(b.Amount) AS TotalAmount
FROM 
    Patients p
JOIN 
    Billing b ON p.PatientID = b.PatientID
GROUP BY 
    p.PatientID;

-- 3. Patients who have been prescribed a specific medication
SELECT 
    p.Name,
    m.MedicationName
FROM 
    Patients p
JOIN 
    Medications m ON p.PatientID = m.PatientID
WHERE 
    m.MedicationName = 'Atenolol';

-- 4. Appointments scheduled for a specific date
SELECT 
    a.Date,
    a.Time,
    p.Name AS PatientName,
    d.Name AS DoctorName
FROM 
    Appointments a
JOIN 
    Patients p ON a.PatientID = p.PatientID
JOIN 
    Doctors d ON a.DoctorID = d.DoctorID
WHERE 
    a.Date = '2025-07-21';

-- 5. Count of appointments for each doctor
SELECT 
    d.Name,
    COUNT(a.AppointmentID) AS NumberOfAppointments
FROM 
    Doctors d
LEFT JOIN 
    Appointments a ON d.DoctorID = a.DoctorID
GROUP BY 
    d.DoctorID;

-- 6. List of all medications for each patient
SELECT 
    p.Name AS PatientName,
    m.MedicationName,
    m.Dosage
FROM 
    Patients p
JOIN 
    Medications m ON p.PatientID = m.PatientID;

-- 7. Patients with billing amount greater than 1500
SELECT 
    p.Name,
    b.Amount
FROM 
    Patients p
JOIN 
    Billing b ON p.PatientID = b.PatientID
WHERE 
    b.Amount > 1500;

-- 8. Doctors who have no appointments
SELECT 
    d.Name
FROM 
    Doctors d
LEFT JOIN 
    Appointments a ON d.DoctorID = a.DoctorID
WHERE 
    a.AppointmentID IS NULL;

-- 9. Latest appointment for each patient
SELECT 
    p.Name,
    MAX(a.Date) AS LatestAppointment
FROM 
    Patients p
JOIN 
    Appointments a ON p.PatientID = a.PatientID
GROUP BY 
    p.PatientID;

-- 10. Patients without medications
SELECT 
    p.Name
FROM 
    Patients p
LEFT JOIN 
    Medications m ON p.PatientID = m.PatientID
WHERE 
    m.MedicationID IS NULL;
