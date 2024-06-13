CREATE TABLE Segment
(	
	Segment_No INT UNIQUE IDENTITY(2,3) NOT NULL,
	Location_Name VARCHAR(255) NOT NULL,

	Primary Key(Segment_No)
);

CREATE TABLE Hospital
(	
	Hospital_ID VARCHAR(5) UNIQUE NOT NULL,
	Hospital_Name VARCHAR(255) NOT NULL,
	Contact_NO VARCHAR(10) NOT NULL,
	Segment_No INT IDENTITY(2,3) NOT NULL,

	Primary Key(Hospital_ID),
	Foreign Key(Segment_No) References Segment
);

CREATE TABLE Person
(
	P_ID VARCHAR(3) UNIQUE NOT NULL,
	P_Name VARCHAR(255) NOT NULL,
	P_Surname VARCHAR(255) NOT NULL,
	P_Type VARCHAR(255) NOT NULL,

	Primary Key(P_ID)
);

CREATE TABLE Doctor
(
	Doc_ID VARCHAR(6) UNIQUE NOT NULL,
	Med_LIcense VARCHAR(8) NOT NULL,
	Hospital_ID VARCHAR(5) NOT NULL,
	P_ID VARCHAR(3) NOT NULL,

	Primary Key(Doc_ID),
	Foreign Key(Hospital_ID) References Hospital,
	Foreign Key(P_ID) References Person
);

CREATE TABLE Patient
(
	Patient_ID VARCHAR(13) UNIQUE NOT NULL,
	Age INT NOT NULL,
	P_ID VARCHAR(3) NOT NULL,

	Primary Key(Patient_ID),
	Foreign Key(P_ID) References Person
);

CREATE TABLE Appointment
(
	App_NO INT UNIQUE IDENTITY(1,4) NOT NULL,
	Patient_ID VARCHAR(13) NOT NULL,
	Doc_ID VARCHAR(6) NOT NULL,
	App_Date DATE NOT NULL,
	Rate INT CHECK(RATE >= 0 AND RATE <= 10) NOT NULL,

	Primary Key(App_NO),

	Foreign Key(Doc_ID) References Doctor,
	Foreign Key(Patient_ID) References Patient
);
