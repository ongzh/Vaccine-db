CONNECT TO cs421;


INSERT INTO Priority (Category,Rank) VALUES ('Healthcare','1');
INSERT INTO Priority (Category,Rank) VALUES ('Elderly','1');
INSERT INTO Priority (Category,Rank) VALUES ('Immunologically Compromised','1');
INSERT INTO Priority (Category,Rank) VALUES ('Teacher','2');
INSERT INTO Priority (Category,Rank) VALUES ('Children ','2');
INSERT INTO Priority (Category,Rank) VALUES ('Proximity to First','2');
INSERT INTO Priority (Category,Rank) VALUES ('Essential Service','3');
INSERT INTO Priority (Category,Rank) VALUES ('Proximity to Second','3');
INSERT INTO Priority (Category,Rank) VALUES ('Everyone Else','4');

INSERT INTO Person (healthnum,name,gender,dob,phone,regdate,postalcode,street,city,category) VALUES ('100-000-000','Jane Doe','Female','1992-06-05','418-868-3390','2020-06-18','H4A 1H3','4827 Sherbrooke Ouest','Montreal','Teacher');
INSERT INTO Person (healthnum,name,gender,dob,phone,regdate,postalcode,street,city,category) VALUES ('100-000-001','Tevie Molina','Male','1971-08-07','514-647-4769','2020-04-16','G5R 3E9','2144 Boulevard Lafleche','Riviere Du Loup','Teacher');
INSERT INTO Person (healthnum,name,gender,dob,phone,regdate,postalcode,street,city,category) VALUES ('100-000-002','Bjorn Lovell','Male','1976-05-04','418-802-2930','2020-05-16','J4T 2W7','3115 Rue William Saint-Hubert ','Longueui','Teacher');
INSERT INTO Person (healthnum,name,gender,dob,phone,regdate,postalcode,street,city,category) VALUES ('100-000-003','Tadhg Willis','Male','1975-07-06','819-970-7084','2020-09-16','H2R 2E7','7503 Rue St Denis','Montreal','Essential Service');
INSERT INTO Person (healthnum,name,gender,dob,phone,regdate,postalcode,street,city,category) VALUES ('100-000-004','Christos Gallagher','Male','1976-09-08','819-572-4637','2020-03-04','H4X 1T8','251 Av Percival Montreal Ouest','Montreal','Essential Service');
INSERT INTO Person (healthnum,name,gender,dob,phone,regdate,postalcode,street,city,category) VALUES ('100-000-005','Faisal Huang','Male','1946-10-22','514-242-2584','2020-04-25','H3A 1B3','410 Sherbrooke Street ouest','Montreal','Elderly');
INSERT INTO Person (healthnum,name,gender,dob,phone,regdate,postalcode,street,city,category) VALUES ('100-000-006','Russell Enriquez','Male','1940-11-08','450-512-6421','2020-07-05','J4H 3G2','510 Rue Saint-Alexandre','Longueuil','Elderly');
INSERT INTO Person (healthnum,name,gender,dob,phone,regdate,postalcode,street,city,category) VALUES ('100-000-007','Colleen Gilmour','Female','1989-02-27','450-679-7335','2020-09-14','J4H 1M3','165 rue Saint-Charles','Longueuil','Everyone Else');
INSERT INTO Person (healthnum,name,gender,dob,phone,regdate,postalcode,street,city,category) VALUES ('100-000-008','Amelia Lancaster','Female','1993-12-10','418-841-6453','2020-06-07','J2N 1X1','7766 George Street Lasalle','Montreal','Everyone Else');
INSERT INTO Person (healthnum,name,gender,dob,phone,regdate,postalcode,street,city,category) VALUES ('100-000-009','April Mayo','Female','1999-02-04','468-031-7920','2020-09-10','H3A 0A4','441 Avenue President Kennedy','Montreal','Essential Service');
INSERT INTO Person (healthnum,name,gender,dob,phone,regdate,postalcode,street,city,category) VALUES ('100-000-010','Cassian Munoz','Male','1971-09-07','450-312-6421','2020-07-05','H3A 1A8','1100 Dr Penfield Ave','Montreal','Healthcare');
INSERT INTO Person (healthnum,name,gender,dob,phone,regdate,postalcode,street,city,category) VALUES ('100-000-011','Beatrix Dillon','Female','1976-04-04','450-620-7335','2020-07-06','H3A 1A8','1101 Dr Penfield Ave','Montreal','Healthcare');
INSERT INTO Person (healthnum,name,gender,dob,phone,regdate,postalcode,street,city,category) VALUES ('100-000-012','Melissa Milne','Female','1975-02-06','418-330-6453','2020-07-07','H3A 1A8','1102 Dr Penfield Ave','Montreal','Healthcare');
INSERT INTO Person (healthnum,name,gender,dob,phone,regdate,postalcode,street,city,category) VALUES ('100-000-013','Lewie Obrien','Male','1976-05-08','468-011-7920','2020-07-08','H3A 1A8','1103 Dr Penfield Ave','Montreal','Healthcare');
INSERT INTO Person (healthnum,name,gender,dob,phone,regdate,postalcode,street,city,category) VALUES ('100-000-014','Adelina Mcgregor','Female','1976-05-09','468-011-7921','2020-07-09','J8L 2Z6','111 Rue Gregoire Gatineau','Gatineau','Healthcare');
INSERT INTO Person (healthnum,name,gender,dob,phone,regdate,postalcode,street,city,category) VALUES ('100-000-015','Patrik Mccarty','Female','1976-05-10','468-011-7922','2020-07-10','J8L 2K8','363 Rue des Pins Gatineau','Gatineau','Healthcare');

INSERT INTO Location (name,street,postalcode,city) VALUES ('Jewish General','3755 chemin de la Cote-Sainte-Catherine','H3T 1E2','Montreal');
INSERT INTO Location (name,street,postalcode,city) VALUES ('Mount Sinai',' 5690 Cavendish Blvd, Côte Saint-Luc','H4W 1S7','Montreal');
INSERT INTO Location (name,street,postalcode,city) VALUES ('Montreal General','1650 Cedar Ave','H3G 1A4','Montreal');
INSERT INTO Location (name,street,postalcode,city) VALUES ('Wakefield Memorial','101 Chemin Burnside','J0X 3G0','Gatineau');
INSERT INTO Location (name,street,postalcode,city) VALUES ('Royal Victoria','1001 Decarie Blvd','H4A 3J1','Montreal');


INSERT INTO Vaccine (vname,reqdose,wtime) VALUES ('Pfizer Bio-Ntech','2','21');
INSERT INTO Vaccine (vname,reqdose,wtime) VALUES ('Moderna','2','28');
INSERT INTO Vaccine (vname,reqdose,wtime) VALUES ('Sinovac','2','14');
INSERT INTO Vaccine (vname,reqdose,wtime) VALUES ('Novavax','2','31');
INSERT INTO Vaccine (vname,reqdose,wtime) VALUES ('AstraZeneca','2','93');

INSERT INTO Batch (vname,bnum,manudate,expdate,bcount,lname) VALUES ('Pfizer Bio-Ntech','1','2020-11-01','2021-10-24','2000','Jewish General');
INSERT INTO Batch (vname,bnum,manudate,expdate,bcount,lname) VALUES ('Pfizer Bio-Ntech','2','2020-12-06','2021-11-05','2000','Jewish General');
INSERT INTO Batch (vname,bnum,manudate,expdate,bcount,lname) VALUES ('Novavax','1','2020-12-23','2021-10-28','3000','Montreal General');
INSERT INTO Batch (vname,bnum,manudate,expdate,bcount,lname) VALUES ('Novavax','2','2020-11-18','2021-11-26','3000','Montreal General');
INSERT INTO Batch (vname,bnum,manudate,expdate,bcount,lname) VALUES ('Sinovac','1','2020-11-27','2021-10-04','2500','Royal Victoria');

INSERT INTO Schedule (name,sdate,capacity) VALUES ('Jewish General','2021-01-24','2');
INSERT INTO Schedule (name,sdate,capacity) VALUES ('Jewish General','2021-01-26','2');
INSERT INTO Schedule (name,sdate,capacity) VALUES ('Montreal General','2021-02-01','1');
INSERT INTO Schedule (name,sdate,capacity) VALUES ('Montreal General','2021-02-06','1');
INSERT INTO Schedule (name,sdate,capacity) VALUES ('Royal Victoria','2021-02-06','1');
INSERT INTO Schedule (name,sdate,capacity) VALUES ('Jewish General','2021-03-20','3');
INSERT INTO Schedule (name,sdate,capacity) VALUES ('Jewish General','2021-02-16','2');

INSERT INTO Nurse (license,name,employer) VALUES ('000-000-001','Cassian Munoz','Jewish General');
INSERT INTO Nurse (license,name,employer) VALUES ('000-000-002','Beatrix Dillon','Royal Victoria');
INSERT INTO Nurse (license,name,employer) VALUES ('000-000-003','Melissa Milne','Jewish General');
INSERT INTO Nurse (license,name,employer) VALUES ('000-000-004','Adelina Mcgregor','Wakefield Memorial');
INSERT INTO Nurse (license,name,employer) VALUES ('000-000-005','Patrik Mccarty','Wakefield Memorial');
INSERT INTO Nurse (license,name,employer) VALUES ('000-000-006','Lewie Obrien','Jewish General');

INSERT INTO NurseAssigned (license,name,sdate) VALUES ('000-000-006','Jewish General','2021-01-24');
INSERT INTO NurseAssigned (license,name,sdate) VALUES ('000-000-002','Jewish General','2021-01-24');
INSERT INTO NurseAssigned (license,name,sdate) VALUES ('000-000-006','Jewish General','2021-01-26');
INSERT INTO NurseAssigned (license,name,sdate) VALUES ('000-000-004','Montreal General','2021-02-01');
INSERT INTO NurseAssigned (license,name,sdate) VALUES ('000-000-005','Montreal General','2021-02-06');
INSERT INTO NurseAssigned (license,name,sdate) VALUES ('000-000-002','Royal Victoria','2021-02-06');
INSERT INTO NurseAssigned (license,name,sdate) VALUES ('000-000-003','Jewish General','2021-02-16');
INSERT INTO NurseAssigned (license,name,sdate) VALUES ('000-000-004','Jewish General','2021-02-16');

INSERT INTO Slot (name,sdate,slotid,time) VALUES ('Jewish General','2021-01-24','1','12:00:00');
INSERT INTO Slot (name,sdate,slotid,time) VALUES ('Jewish General','2021-01-24','2','12:30:00');
INSERT INTO Slot (name,sdate,slotid,time) VALUES ('Jewish General','2021-01-26','1','12:00:00');
INSERT INTO Slot (name,sdate,slotid,time) VALUES ('Jewish General','2021-01-26','2','12:30:00');
INSERT INTO Slot (name,sdate,slotid,time) VALUES ('Montreal General','2021-02-01','1','14:00:00');
INSERT INTO Slot (name,sdate,slotid,time) VALUES ('Montreal General','2021-02-06','1','14:00:00');
INSERT INTO Slot (name,sdate,slotid,time) VALUES ('Royal Victoria','2021-02-06','1','13:00:00');
INSERT INTO Slot (name,sdate,slotid,time) VALUES ('Jewish General','2021-03-20','1','13:00:00');
INSERT INTO Slot (name,sdate,slotid,time) VALUES ('Jewish General','2021-03-20','2','13:30:00');
INSERT INTO Slot (name,sdate,slotid,time) VALUES ('Jewish General','2021-03-20','3','14:00:00');
INSERT INTO Slot (name,sdate,slotid,time) VALUES ('Jewish General','2021-02-16','1','12:00:00');
INSERT INTO Slot (name,sdate,slotid,time) VALUES ('Jewish General','2021-02-16','2','12:30:00');

INSERT INTO SlotAllocation (healthnum,name,sdate,slotid,adate) VALUES ('100-000-005','Jewish General','2021-01-24','1','2021-01-14');
INSERT INTO SlotAllocation (healthnum,name,sdate,slotid,adate) VALUES ('100-000-006','Jewish General','2021-01-24','2','2021-01-15');
INSERT INTO SlotAllocation (healthnum,name,sdate,slotid,adate) VALUES ('100-000-001','Jewish General','2021-01-26','1','2021-01-16');
INSERT INTO SlotAllocation (healthnum,name,sdate,slotid,adate) VALUES ('100-000-007','Jewish General','2021-01-26','2','2021-01-17');
INSERT INTO SlotAllocation (healthnum,name,sdate,slotid,adate) VALUES ('100-000-003','Montreal General','2021-02-01','1','2021-01-18');
INSERT INTO SlotAllocation (healthnum,name,sdate,slotid,adate) VALUES ('100-000-014','Montreal General','2021-02-06','1','2021-01-19');
INSERT INTO SlotAllocation (healthnum,name,sdate,slotid,adate) VALUES ('100-000-015','Royal Victoria','2021-02-06','1','2021-01-20');
INSERT INTO SlotAllocation (healthnum,name,sdate,slotid,adate) VALUES ('100-000-005','Jewish General','2021-02-16','1','2021-01-24');
INSERT INTO SlotAllocation (healthnum,name,sdate,slotid,adate) VALUES ('100-000-006','Jewish General','2021-02-16','2','2021-01-25');


INSERT INTO Works (license,name,sdate,slotid) VALUES ('000-000-006','Jewish General','2021-01-24','1');
INSERT INTO Works (license,name,sdate,slotid) VALUES ('000-000-002','Jewish General','2021-01-24','2');
INSERT INTO Works (license,name,sdate,slotid) VALUES ('000-000-006','Jewish General','2021-01-26','1');
INSERT INTO Works (license,name,sdate,slotid) VALUES ('000-000-006','Jewish General','2021-01-26','2');
INSERT INTO Works (license,name,sdate,slotid) VALUES ('000-000-004','Montreal General','2021-02-01','1');
INSERT INTO Works (license,name,sdate,slotid) VALUES ('000-000-005','Montreal General','2021-02-06','1');
INSERT INTO Works (license,name,sdate,slotid) VALUES ('000-000-002','Royal Victoria','2021-02-06','1');
INSERT INTO Works (license,name,sdate,slotid) VALUES ('000-000-003','Jewish General','2021-02-16','1');
INSERT INTO Works (license,name,sdate,slotid) VALUES ('000-000-004','Jewish General','2021-02-16','2');


INSERT INTO Vial (vname,bnum,vialnum,license,healthnum,name,sdate,slotid) VALUES ('Pfizer Bio-Ntech','1','1','000-000-006','100-000-005','Jewish General','2021-01-24','1');
INSERT INTO Vial (vname,bnum,vialnum,license,healthnum,name,sdate,slotid) VALUES ('Pfizer Bio-Ntech','1','2','000-000-002','100-000-006','Jewish General','2021-01-24','2');
INSERT INTO Vial (vname,bnum,vialnum,license,healthnum,name,sdate,slotid) VALUES ('Pfizer Bio-Ntech','1','3','000-000-006','100-000-001','Jewish General','2021-01-26','1');
INSERT INTO Vial (vname,bnum,vialnum,license,healthnum,name,sdate,slotid) VALUES ('Pfizer Bio-Ntech','1','4','000-000-006','100-000-007','Jewish General','2021-01-26','2');
INSERT INTO Vial (vname,bnum,vialnum,license,healthnum,name,sdate,slotid) VALUES ('Novavax','1','1','000-000-004','100-000-003','Montreal General','2021-02-01','1');
INSERT INTO Vial (vname,bnum,vialnum,license,healthnum,name,sdate,slotid) VALUES ('Novavax','1','2','000-000-005','100-000-000','Montreal General','2021-02-06','1');
INSERT INTO Vial (vname,bnum,vialnum,license,healthnum,name,sdate,slotid) VALUES ('Sinovac','1','1','000-000-002','100-000-015','Royal Victoria','2021-02-06','1');
INSERT INTO Vial (vname,bnum,vialnum,license,healthnum,name,sdate,slotid) VALUES ('Pfizer Bio-Ntech','2','1','000-000-003','100-000-005','Jewish General','2021-02-16','1');
INSERT INTO Vial (vname,bnum,vialnum,license,healthnum,name,sdate,slotid) VALUES ('Pfizer Bio-Ntech','2','2','000-000-004','100-000-006','Jewish General','2021-02-16','2');
