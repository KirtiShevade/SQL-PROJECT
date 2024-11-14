Create Database Hospital_Management;
use Hospital_Management;
#To show all data from the table
select * from Patient_Demographics$;

#To check the patient with certain criteria like age, gendre.
select Patient_ID, Name 
from Patient_Demographics$
where age > 40 and Gender = 'Male'

# Analyse patient from different demographics
select name, age
from Patient_Demographics$
where address = 'Mumbai'and Gender = 'male';

select name,age
from Patient_Demographics$
where address != 'pune';

select * from Hospital_Admission$;

# view the patient count with certain conditions
select count(*) patient_ID
from Hospital_Admission$
where Admission_Date between '2023-05-01' and '2023-06-30';

select count(*) patient_ID
from Hospital_Admission$
where Admission_Date between '2023-05-01' and '2023-06-30'
and department = 'Neurology';


Select MONTH(Admission_Date)as Admission,
       count (*) as Total_Admission
from Hospital_Admission$
Group by Month(Admission_Date)
order by total_admission desc;

SELECT * FROM Diagnosis$;
select * from Patient_Demographics$;
select * from Treatment$;

#common diagosis by age group 
select Patient_Demographics$.Patient_ID,Patient_Demographics$.Age,Patient_Demographics$.Gender,
Diagnosis$.Primary_Diagnosis
from Patient_Demographics$
cross join Diagnosis$
order by age asc;

#patient who received specific treatment
select Diagnosis$.Admission_ID,Diagnosis$.Primary_Diagnosis,Treatment$.Treatment_Name
from Diagnosis$
inner join Treatment$
on Diagnosis$.Admission_ID = Treatment$.Admission_ID
where Treatment$.Treatment_Name = 'surgery';

select * from Medications$;
#find most prescribed medicine 
select Medication_Name,
  count (Medication_Name) as Medicine_Count
from Medications$
group by Medication_Name
order by Medicine_Count asc;

# calculate Average treatment duration refering Medication
select Medication_Name,
       avg(DatedIFF(Day,Start_Date,End_Date)) as avg_date
from Medications$
group by Medication_Name;

select * from discharge_info$;
SELECT discharge_ID, discharge_date, discharge_status
FROM discharge_info$
where day(Discharge_Date) between 1 and 10 
order by Discharge_Date asc
OFFSET 3 ROWS FETCH NEXT 10 ROWS ONLY;






   
    
 












