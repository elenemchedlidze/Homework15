
--1. Students	გამოიტანეთ ყველა სტუდენტი რომელიც დაიბადა 1990 წლის შემდეგ
select * from Students where DoB like '1990%'
select * from Students where DoB >='19900101' and Dob <='19901231'

--2. Students	გამოიტანეთ  იმ სტუდენთა სახელი გვარი ასაკი(CurrentYear- DoB)  რომლებიც არიან საქართველოდან და ლიბიიდან
select Lastname, Firstname, (Year(GETDATE())- YEAR(DoB)) as Age from Students where Country ='Georgia' or Country ='Libya'

--3. Students	დაამატეთ ახალი სტუდენტი  მონაცემთა ბაზაში ნებისმიერი მონაცემებით 
insert into Students (Lastname, Firstname, DoB, Email, Quiz1,Quiz2,MiddleTest,Country)
output inserted. *
values
('Mchedlidze', 'Elene', '19931212', 'mchedlidzeelene@yahoo.com', '100', '100', '100', 'Georgia')
--4. Students	გამოიტანეთ TOP 5 შედეგის მქონე სტუდენტის სახელი და ქულა  შუალედურზე ([MiddleTest]) მიღებული ქულის მიხედვით (აჩვენეთ ყველა შესაძლო ვარიანტი მაგ : 1 2 3 4 5 5  თუ მომდევნო ელემენტიც 5 ტოლია შედეგი უნდა იყოს 1,2,3,4,5,5
select TOP 5 with ties Firstname, MiddleTest from Students order by MiddleTest desc
--5. Students	წაშალეთ ყველა სტუდენტი რომლებმაც ფინალურზე 19 ქულა მიიღეს და შედეგი გამოიტანეთ OUTPUT სახით
Delete Students
output deleted.*
where FinalTest = 19
--6. Students	განაახლეთ მონაცემები ყველა სტუდენტს რომელსაც  შუალედურზე აქვს მიღებული 1 ქულა ფინალურ შეფასებაში ჩაუწერეთ 0
Update Students set FinalTest=0 where MiddleTest = 1

-- //////////////////////////////////////////////////////////////////////////////////////////

--1. Persons	გამოიტანეთ სრული მონაცემები იმ პირების შესახებ რომელთა პირადი ნომერი PrivateId იწყება 163
select * from Persons where PrivateId like '163%'

--2. Persons	გამოიტანეთ  სრული მონაცემები იმ პირების რომელთა გვარი ემთხვევა იმ ქალაქის სახელწოდებას სადაც ცხოვრობენ
select * from Persons where Lastname = City
--3. Persons	გამოიტანეთ  სრული მონაცემები იმ პირების შესახებ რომლებიც ცხოვრობენ კანადაში ან მონაკოში არ გამოიყენოთ ტოლობა და Like  ოპერატორი
select * from Persons where Country IN ('Monaco', 'Canada')
--4. Persons	გამოიტანეთ იმ პირების სახელი ,გვარი და პირადი ნომერი რომლებსაც არ აქვთ იმეილი.
select Firstname, Lastname, Email from Persons where Email is null

--5. Persons	გამოიტანეთ სრული მონაცემები იმ პირების შესახებ რომლებიც ცხოვრობენ ესპანეთში ან თურქეთში და ხელფასი არის 1000-3000 დიაპაზონში ( არ გამოიყენოთ მეტობა/ნაკლებობის ნიშნები)
select * from Persons where Country IN('Spain', 'Turkey') and Salary between 1000 and 3000
--6. Persons	გამოიტანეთ კომპანიების სახელწოდება რომლებიც შეიცავენ LLC, PC , LLP
select * from Persons  
WHERE WorkPlace LIKE '%LLC%' 
   OR WorkPlace LIKE '%PC%' 
   OR WorkPlace LIKE '%LLP%'

--7. Persons	შეამოწმეთ  რამდენი წერტილს შეიცავს მეილი თუ  წერტილების რაოდენობა მეტია 2 ზე ახალ ველში MAILINFO გამოიტანეთ 'more than 2 dots ' თუ ნაკლები  'less than 2 dots'
SELECT Email,
    CASE 
    WHEN (LEN(Email) - LEN(REPLACE(Email, '.', ''))) > 2 THEN 'more than 2 dots'
    ELSE 'less than 2 dots'
    END AS MAILINFO
FROM 
    Persons;
--8 Persons.	გამოიტანეთ სრული მონაცემები იმ პირების შესახებ რომელთა პინ კოდიც მთავრდება 51
Select * From Persons Where PINcode like '%51'

--9. Persons	დააჯგუფეთ ცხრილი ქვეყნების მიხედვით და გამოიტანეთ საშუალო ხელფასი ქვეყნების მიხედვით
Select Country, AVG(Salary) as AvarageSalary From Persons Group By Country



 