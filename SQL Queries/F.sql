SELECT Hospital_Name, COUNT(Doctor.Hospital_ID) FROM Hospital,Doctor,Appointment
Where Hospital.Hospital_ID = Doctor.Hospital_ID AND Doctor.Doc_ID = Appointment.Doc_ID
Group BY Hospital_Name