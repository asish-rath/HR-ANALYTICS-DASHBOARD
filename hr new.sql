select * from hr_data;

# sum of employee count by Education 
select sum(Employee_Count) from hr_data;  # 1470
select sum(Employee_Count) from hr_data where Education = 'High School';   # 170
select sum(Employee_Count) from hr_data where Education = 'Associates Degree';  #282 

# sum of employee count by Department 1st Kpi
select sum(Employee_Count) from hr_data where Department = 'sales' ; # 446 
select sum(Employee_Count) from hr_data where Department = 'R&D' ; # 961 

-- Sum of Attrition count 2nd KPI
select count(Attrition) from hr_data where Attrition = 'Yes' and Education = 'Associates Degree';   -- 44
select count(Attrition) from hr_data where Attrition = 'Yes' and Education = 'High School' and Department = 'R&D' ;  -- 19

-- Sum of Attrition Rate --3RD kpi
select round(((select count(Attrition) from hr_data where Attrition = 'Yes') / sum(Employee_Count)* 100) , 2 ) from hr_data;  -- 16.12%
select round(((select count(Attrition) from hr_data where Attrition = 'Yes' and Department = 'sales') / sum(Employee_Count)* 100) , 2) from hr_data where Department = 'sales' ;  -- 20.63%
select round(((select count(Attrition)from hr_data where Attrition = 'Yes' and Education = 'Associates Degree' and Department = 'R&D')
/ sum(Employee_Count)* 100),2) from hr_data where Education = 'Associates Degree' and Department = 'R&D'; -- 12.64% 
select round(((select count(Attrition) from hr_data where Attrition = 'Yes'and Department = 'sales') / sum(Employee_Count)* 100),2) from hr_data where Department = 'sales';

-- Active Employee 4th KPI
select sum(Employee_Count) - (select count(Attrition) from hr_data where Attrition = 'yes')from hr_data ; -- 1233
select sum(Employee_Count) - (select count(Attrition) from hr_data where Attrition = 'Yes' and Education = 'High School')
from hr_data where Education = 'High School'; -- 139

-- Avg Employee 5th Kpi
select round(avg(age),0) from hr_data;  -- 37
select round(avg(age),0) from hr_data where Education = 'High School'; -- 32
select round(avg(age),0) from hr_data where Education = 'High School' and Department = 'R&D' ; -- 32

-- No of Employee By age group
select CF_age_band, sum(Employee_Count) from hr_data where Gender = 'Male' and Department = 'R&D'
group by CF_age_band
order by CF_age_band ;

-- sum of attrition by education field 
select Education_Field, count(Attrition)  from hr_data where Attrition = 'Yes' and Department = 'Sales'
group by Education_Field
order by count(Attrition) desc;

-- Attrition count by diffrent Age Group --
select CF_age_band,Gender,count(Attrition)
from hr_data where Attrition = 'Yes' 
group by CF_age_band,Gender
order by  CF_age_band,Gender ;

