PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Patient_Information (
    PID INTEGER PRIMARY KEY,
    f_name TEXT NOT NULL,
    l_name TEXT NOT NULL,
    height_inches INTEGER,
    weight_pounds INTEGER,
    race TEXT,
    age INTEGER,
    gender TEXT,
    FOREIGN KEY (PID) REFERENCES Participant_Information (PID)
);
INSERT INTO Patient_Information VALUES(1,'Ashley','Pritchard',66,128,'Caucasian',24,'Female');
INSERT INTO Patient_Information VALUES(2,'Gavin','N',67,130,'Caucasian',24,'Male');
INSERT INTO Patient_Information VALUES(3,'Dave','N',68,175,'Caucasian',40,'Male');
CREATE TABLE Patient_Medical (
    PID INTEGER PRIMARY KEY,
    Amputation TEXT CHECK (Amputation IN ('Yes', 'No')),
    Diabetes TEXT CHECK (Diabetes IN ('Yes', 'No')),
    Injury_to_intact_limb TEXT,
    FOREIGN KEY (PID) REFERENCES Participant_Information (PID)
);
INSERT INTO Patient_Medical VALUES(1,'No','No',NULL);
INSERT INTO Patient_Medical VALUES(2,'Yes','No','Broke left foot 1 year ago');
INSERT INTO Patient_Medical VALUES(3,'No','Yes',NULL);
CREATE TABLE Left_Before_Tests (
    TID INTEGER PRIMARY KEY,
    PID INTEGER NOT NULL,
    left_leg_amputated TEXT CHECK (left_leg_amputated IN ('Yes', 'No')),
    Heart_rate INTEGER NOT NULL,
    Blood_pressure TEXT NOT NULL,
    Femoral_artery_bf TEXT NOT NULL,
    Temp_LL_fib_head TEXT NOT NULL,
    Temp_LL_med_condyle TEXT NOT NULL,
    Trans_epidural_wl TEXT NOT NULL,
    FOREIGN KEY (PID) REFERENCES Participant_Information (PID)
);
INSERT INTO Left_Before_Tests VALUES(11,1,'No',70,'120/80','Normal','98.6','98.6','20.0');
INSERT INTO Left_Before_Tests VALUES(21,2,'No',59,'120/85','Normal','98.6','97.8','22.0');
INSERT INTO Left_Before_Tests VALUES(31,3,'No',72,'125/82','Normal','97.3','99.4','18.5');
CREATE TABLE Left_During_Tests (
    TID INTEGER PRIMARY KEY,
    PID INTEGER NOT NULL,
     left_leg_amputated TEXT CHECK (left_leg_amputated IN ('Yes', 'No')),
    Femoral_artery_bf TEXT NOT NULL,
    Temp_LL_fib_head TEXT NOT NULL,
    Temp_LL_med_condyle TEXT NOT NULL,
    Trans_epidural_wl TEXT NOT NULL,
    FOREIGN KEY (PID) REFERENCES Participant_Information (PID)
);
INSERT INTO Left_During_Tests VALUES(12,1,'No','Normal','100.6','101.0','21.0');
INSERT INTO Left_During_Tests VALUES(32,3,'No','Normal','100.9','102.1','19.5');
CREATE TABLE Left_After_Tests (
    TID INTEGER PRIMARY KEY,
    PID INTEGER NOT NULL,
    left_leg_amputated TEXT CHECK (left_leg_amputated IN ('Yes', 'No')),
    Femoral_artery_bf TEXT NOT NULL,
    Temp_LL_fib_head TEXT NOT NULL,
    Temp_LL_med_condyle TEXT NOT NULL,
    Trans_epidural_wl TEXT NOT NULL,
    Time_to_return_to_ct TEXT,
    FOREIGN KEY (PID) REFERENCES Participant_Information (PID)
);
INSERT INTO Left_After_Tests VALUES(13,1,'No','Normal','97.2','99.2','19.0','30');
INSERT INTO Left_After_Tests VALUES(23,2,'No','Normal','98.6','98.6','20.0','35');
INSERT INTO Left_After_Tests VALUES(33,3,'No','Low','100.2','102.2','19.5','40');
CREATE TABLE Right_Before_Tests (
    TID INTEGER PRIMARY KEY,
    PID INTEGER NOT NULL,
    right_leg_amputated TEXT CHECK (right_leg_amputated IN ('Yes', 'No')),
    Heart_rate INTEGER NOT NULL,
    Blood_pressure TEXT NOT NULL,
    Femoral_artery_bf TEXT NOT NULL,
    Temp_LL_fib_head TEXT NOT NULL,
    Temp_LL_med_condyle TEXT NOT NULL,
    Trans_epidural_wl TEXT NOT NULL,
    FOREIGN KEY (PID) REFERENCES Participant_Information (PID)
);
INSERT INTO Right_Before_Tests VALUES(111,1,'No',70,'120/80','Normal','98.6','98.6','20.0');
INSERT INTO Right_Before_Tests VALUES(121,2,'Yes',59,'120/85','Low','98.6','82.8','22.0');
INSERT INTO Right_Before_Tests VALUES(131,3,'No',72,'125/82','Normal','96.8','98.8','18.5');
CREATE TABLE Right_During_Tests (
    TID INTEGER PRIMARY KEY,
    PID INTEGER NOT NULL,
    right_leg_amputated TEXT CHECK (right_leg_amputated IN ('Yes', 'No')),
    Femoral_artery_bf TEXT NOT NULL,
    Temp_LL_fib_head TEXT NOT NULL,
    Temp_LL_med_condyle TEXT NOT NULL,
    Trans_epidural_wl TEXT NOT NULL,
    FOREIGN KEY (PID) REFERENCES Participant_Information (PID)
);
INSERT INTO Right_During_Tests VALUES(112,1,'No','Normal','100.6','101.0','21.0');
INSERT INTO Right_During_Tests VALUES(132,3,'No','Normal','100.9','102.1','19.5');
CREATE TABLE Right_After_Tests (
    TID INTEGER PRIMARY KEY,
    PID INTEGER NOT NULL,
    right_leg_amputated TEXT CHECK (right_leg_amputated IN ('Yes', 'No')),
    Femoral_artery_bf TEXT NOT NULL,
    Temp_LL_fib_head TEXT NOT NULL,
    Temp_LL_med_condyle TEXT NOT NULL,
    Trans_epidural_wl TEXT NOT NULL,
    Time_to_return_to_ct TEXT,
    FOREIGN KEY (PID) REFERENCES Participant_Information (PID)
);
INSERT INTO Right_After_Tests VALUES(113,1,'No','Normal','97.2','97.3','19.0','31');
INSERT INTO Right_After_Tests VALUES(123,2,'Yes','Low','100.2','100.6','21.0','45');
INSERT INTO Right_After_Tests VALUES(133,3,'No','Low','100.9','99.9','19.5','47');
CREATE TABLE Project_Information (
    Project_ID INTEGER PRIMARY KEY
);
INSERT INTO Project_Information VALUES(1);
INSERT INTO Project_Information VALUES(2);
INSERT INTO Project_Information VALUES(3);
CREATE TABLE Biomechanics (
    Biomech_PM INTEGER PRIMARY KEY,
    Project_ID INTEGER NOT NULL,
    FOREIGN KEY (Project_ID) REFERENCES Project_Information (Project_ID)
);
INSERT INTO Biomechanics VALUES(987,1);
CREATE TABLE Blood (
    Blood_PM INTEGER PRIMARY KEY,
    Project_ID INTEGER NOT NULL,
    FOREIGN KEY (Project_ID) REFERENCES Project_Information (Project_ID)
);
INSERT INTO Blood VALUES(876,2);
CREATE TABLE Temperature (
    Temp_PM INTEGER PRIMARY KEY,
    Project_ID INTEGER NOT NULL,
    FOREIGN KEY (Project_ID) REFERENCES Project_Information (Project_ID)
);
INSERT INTO Temperature VALUES(765,3);
CREATE TABLE Participant_Information (
    PID INTEGER NOT NULL,
    Project_ID INTEGER NOT NULL,
    Enrollment_date TEXT NOT NULL,
    PRIMARY KEY (PID, Project_ID),
    FOREIGN KEY (Project_ID) REFERENCES Project_Information (Project_ID)
);
INSERT INTO Participant_Information VALUES(1,1,'2024-01-01');
INSERT INTO Participant_Information VALUES(1,2,'2024-01-01');
INSERT INTO Participant_Information VALUES(1,3,'2024-01-01');
INSERT INTO Participant_Information VALUES(2,1,'2024-02-01');
INSERT INTO Participant_Information VALUES(2,2,'2024-02-01');
INSERT INTO Participant_Information VALUES(2,3,'2024-02-01');
INSERT INTO Participant_Information VALUES(3,2,'2024-03-01');
INSERT INTO Participant_Information VALUES(3,3,'2024-02-01');
COMMIT;
