drop table if exists global_freelancers ;
Create table global_freelancers 
(freelancer_ID varchar(20),
name varchar(200),	
gender varchar(100),
age	int, 
country	varchar(200),
language varchar(200),
primary_skill varchar(200),
years_of_experience int,	
hourly_rate varchar(200),
rating float,
is_active varchar(200),
client_satisfaction varchar(200)
);

--1.1000 rows(all)
SELECT * FROM global_freelancers ;

--2.standardize_gender_column
create view Cleaned_gender_view as 
select gender ,
case 
 when gender in ('F','f','female','FEMALE','Female')
 then 'Female'
 when gender in('m','M','male','MALE','Male')
 then 'Male'
 when gender is NULL
 then NULL
 else 'Other'
End as Cleaned_Gender
from global_freelancers;

--3.Upadating DevOps to Developers
update global_freelancers set primary_skill= 'Developers' 
where primary_skill= 'DevOps'; 

--4.Proper case primary_skill
select INITCAP(primary_skill) as Propercase_skill FROM global_freelancers;

--5.Standardize names to proper case format
create view Cleaned_name as 
select name, initcap(trim(regexp_replace
(regexp_replace(name,
'^(Mr\.?|Ms\.?|Mrs\.?|Dr\.?|Miss)\s+','','i'),
'\s+(DDS|MD|PhD|DVM|Jr\.?|III)$','','i'))) 
as cleaned_Name from global_freelancers;

--6.Standardize hourly rate field for financial analysis
update global_freelancers set
hourly_rate=replace(replace(replace(hourly_rate,'$',''),'USD',''),' ','');

--7.Handle missing age values by imputing mean age
Drop view if exists age_cleaned_view; 
create view age_cleaned_view  as
select age,(coalesce(age, (select cast(avg(age)as int) from global_freelancers))) as age_cleaned
from global_freelancers;

--8.Convert mixed boolean values into consistent YES/NO labels
create view Cleaned_is_active as
select is_active,
case 
when lower(is_active) in ('1','yes','y','true') 
then 'YES'
when lower(is_active) in ('0','no','n','false') 
then 'NO'
else 'UNKNOWN'
end
from global_freelancers;

--9.Median hourly rate of freelancers is 40 USD
select percentile_cont(0.5)
within group(order by cast(replace(replace(replace(hourly_rate,'$',''),'USD',''),' ','')as int))
from global_freelancers;

--10.Handle missing hourly_rate values by filling with median value (40)
drop view if exists cleaned_hourly_rate ;
create view cleaned_hourly_rate as
select hourly_rate, coalesce(cast(hourly_rate as int),40) as cleaned_hourly_rate from global_freelancers;

--11.Median client_satisfaction of freelancer is 79%
select percentile_cont(0.5)
within group(order by cast(NULLIF(replace(client_satisfaction,'%','' ),'')as int))
from global_freelancers;

--12.Remove % and replace NULL client_satisfaction with 79
drop view if exists cleaned_client_satisfaction_view;
create view cleaned_client_satisfaction_view as 
select client_satisfaction,coalesce(cast(replace(client_satisfaction,'%','')as int),79) as cleaned_client_satisfaction
from global_freelancers;

--13.replace NULL Rating with Median Rating of freelancer
create view cleaned_rating_view as 
select rating, coalesce(rating,(select percentile_cont(0.5)
within group(order by rating)
from global_freelancers 
where rating is not null)) as cleaned_rating
from global_freelancers;


--14.Handle missing years_of_experience by imputing median using CTE
drop view if exists cleaned_years_of_experience_view;
create view cleaned_years_of_experience_view as
with median_yrexp_ as (
select percentile_cont(0.5)
within group(order by years_of_experience) as med_exp
from global_freelancers 
)
select 
glo.years_of_experience, coalesce(glo.years_of_experience,med.med_exp)
as cleaned_years_of_experience
from global_freelancers as glo cross join median_yrexp_ as med;






--original view
SELECT * FROM global_freelancers;

--Cleaned view
select * from cleaned_years_of_experience_view;
select * from cleaned_rating_view;
select * from cleaned_client_satisfaction_view;
select * from cleaned_hourly_rate;
select * from cleaned_is_active;
select * from age_cleaned_view;
select * from cleaned_name;
select * from cleaned_gender_view;



