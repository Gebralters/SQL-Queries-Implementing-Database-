SELECT P_Name,P_Surname FROM Person,Doctor,Appointment
Where Person.P_ID = Doctor.P_ID AND Doctor.Doc_ID = Appointment.Doc_ID AND Rate >= 7