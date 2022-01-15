CONNECT TO cs421;


CREATE TABLE Priority
(
 category VARCHAR(30) NOT NULL,
 rank INTEGER,
 PRIMARY KEY (category));

CREATE TABLE Person
(
 healthnum VARCHAR(15) NOT NULL,
 name VARCHAR(30) NOT NULL,
 gender VARCHAR(6),
 dob DATE,
 phone VARCHAR(15),
 regdate DATE,
 postalcode VARCHAR(10),
 street VARCHAR(50),
 city VARCHAR(20),
 category VARCHAR(30) NOT NULL,
 PRIMARY KEY (healthnum),
 FOREIGN KEY (category)
 REFERENCES Priority);

CREATE TABLE Nurse
(
 license VARCHAR(15) NOT NULL
 ,name VARCHAR(30) NOT NULL
 ,employer VARCHAR(30)
 ,PRIMARY KEY (license)
);

CREATE TABLE Location
(
 name VARCHAR(30) NOT NULL,
 street VARCHAR(50) NOT NULL,
 postalcode VARCHAR(10) NOT NULL,
 city VARCHAR(15) NOT NULL,
 PRIMARY KEY(name)
);

CREATE TABLE Schedule
(
 name VARCHAR(30) NOT NULL,
 sdate DATE NOT NULL,
 capacity INTEGER NOT NULL,
 PRIMARY KEY (name,sdate),
 FOREIGN KEY (name)
 REFERENCES Location);

CREATE TABLE NurseAssigned
(
 license VARCHAR(15) NOT NULL,
 name VARCHAR(30) NOT NULL,
 sdate DATE NOT NULL,
 PRIMARY KEY (license,name,sdate),
 FOREIGN KEY (name,sdate) REFERENCES Schedule);

CREATE TABLE Slot
(
 name VARCHAR(30) NOT NULL,
 sdate DATE NOT NULL,
 slotid INTEGER NOT NULL,
 time TIME NOT NULL,
 PRIMARY KEY (name,sdate,slotid),
 FOREIGN KEY (name,sdate) REFERENCES Schedule);

CREATE TABLE SlotAllocation
(
 healthnum VARCHAR(15) NOT NULL,
 name VARCHAR(30) NOT NULL,
 sdate DATE NOT NULL,
 slotid INTEGER NOT NULL,
 adate DATE NOT NULL,
 PRIMARY KEY (healthnum,name,sdate,slotid),
 FOREIGN KEY (healthnum) REFERENCES Person,
 FOREIGN KEY (name,sdate,slotid) REFERENCES Slot
);

CREATE TABLE Works 
(
 license VARCHAR(15) NOT NULL,
 name VARCHAR(30) NOT NULL,
 sdate DATE NOT NULL,
 slotid INTEGER NOT NULL,
 PRIMARY KEY (license,name,sdate,slotid),
 FOREIGN KEY (name,sdate,slotid) REFERENCES Slot
);

CREATE TABLE Vaccine
(
 vname VARCHAR(20) NOT NULL,
 reqdose INTEGER NOT NULL,
 wtime INTEGER NOT NULL,
 PRIMARY KEY (vname)
);

CREATE TABLE Batch
(
 vname VARCHAR(20) NOT NULL,
 bnum VARCHAR(20) NOT NULL,
 manudate DATE  NOT NULL,
 expdate DATE NOT NULL, 
 bcount INTEGER NOT NULL,
 lname VARCHAR(30) NOT NULL,
 PRIMARY KEY (vname,bnum),
 FOREIGN KEY (vname) REFERENCES Vaccine,
 FOREIGN KEY (lname) REFERENCES Location
);

CREATE TABLE Vial
(
 vname VARCHAR(20) NOT NULL,
 bnum VARCHAR(20) NOT NULL,
 vialnum INTEGER NOT NULL,
 license VARCHAR(15) NOT NULL,
 healthnum VARCHAR(15) NOT NULL,
 name VARCHAR(30) NOT NULL,
 sdate DATE NOT NULL,
 slotid INTEGER NOT NULL,
 PRIMARY KEY (vname, bnum,vialnum),
 FOREIGN KEY (vname,bnum) REFERENCES batch,
 FOREIGN KEY (name,sdate,slotid) REFERENCES SLOT 
);


