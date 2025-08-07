-- Updating the data type of "joined_bank" from string to date datatype

UPDATE `banking`.`banking_clients`
SET `Joined_Bank` = STR_TO_DATE(`Joined_Bank`, '%d-%m-%Y');


-- Percentage of people's nationality 

SELECT Nationality, ((count(*)/3000)*100) as per_of_natio
FROM banking_clients
group by Nationality;

-- around 44% of data is from Europe
-- 


select occupation, count(*)
from banking_clients
group by occupation;
-- there are so many occupations so we can't practically get insights from that column

select avg(age)
from banking_clients;
-- 51 years is the average age 


-- Changing the GenderID to male and female

UPDATE banking.banking_clients
SET GenderId = CASE
    WHEN GenderId = 1 THEN 'Male'
    WHEN GenderId = 2 THEN 'Female'
    ELSE Joined_Bank
END;

--------------------------------------------------------------

select i.Investment_Advisor,count(*)
from banking_clients b
Join invest_advis i
on b.iaid = i.iaid
group by 1
order by 2 desc;


select credit_cards, ((count(*)/3000) * 100) AS percentage
from banking_clients
group by 1;

-- Around 64% clients have only 1 credit card


select * from banking_clients;

SELECT Loyalty_Classification,((count(*)/3000) * 100) AS percentage
FROM banking_clients
group by 1;

-- almost 45% clients have 'Jade' loyalty_classification

SELECT Fee_Structure, AVG(Saving_Accounts)
FROM banking_clients
GROUP BY 1;

SELECT ClientID, count(ClientID) as count
FROM banking_clients
group by 1
having count > 1;
