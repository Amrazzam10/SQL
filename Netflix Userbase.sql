use [Netflix Userbase]
select * from [Netflix Userbase]


--Average Age by Country
select country, avg (age) as avarge_age 
from [Netflix Userbase]
group by Country

--Total Monthly Revenue by Subscription Type
select [Subscription_Type], sum (Monthly_Revenue) as total_revenue 
from
[Netflix Userbase]
group by [Subscription_Type]
order by total_revenue 
---
--Average Age by Country:

select country, avg (age)AverageAge
from [Netflix Userbase]
group by Country 
order by AverageAge
---

--Number of Subscribers by Gender:
select gender , count (user_id) as SubscribersCountbygender
from [Netflix Userbase]
group by Gender

--Top Countries by Monthly Revenue:
 select country, sum(monthly_revenue) as TotalRevenue
 from [Netflix Userbase]
 group by Country 
 order by TotalRevenue desc

-- avg monthly_revenue_by_device
 select device , avg (monthly_revenue) as monthly_revenue_by_device
 from [Netflix Userbase]
 group by device
 order by monthly_revenue_by_device
 --- Join Date Distribution:

 select year (Join_Date) as Joinyear , count (user_id) as NewSubscribers
 from [Netflix Userbase]
 group by Join_Date 
 
 ---- Subscription Type Distribution by Gender:
select gender, Subscription_Type , COUNT (user_id) as SubscribersCountbyGender
from [Netflix Userbase]
group by Gender, Subscription_Type

--Average Monthly Revenue by Device Type:
select device , avg(Monthly_Revenue) as AverageMonthlyRevenuebyDeviceType
from [Netflix Userbase]
group by Device

--Top  Countries with the Highest Monthly Revenue :
select country , sum (Monthly_Revenue) as Highest_Monthly_Revenue
from [Netflix Userbase] 
group by Country 
order by Highest_Monthly_Revenue desc

--Average Plan Duration by Age Group:
select 
case 
 WHEN Age < 18 THEN 'Under 18'
    WHEN Age >= 18 AND Age < 30 THEN '18-29'
    WHEN Age >= 30 AND Age < 45 THEN '30-44'
    WHEN Age >= 45 THEN '45+'
    ELSE 'Unknown' 
	end as age_group ,
	avg(Monthly_Revenue) as  AvgPlanDuration
	from [Netflix Userbase]
	group by age
	order by age_group

--Average Monthly Revenue by Subscription Type and Country:

select Subscription_Type, country , avg (Monthly_Revenue)
as AvgRevenueperSubscriptionTypeandcountry
from [Netflix Userbase]
group by Subscription_Type, country

--- Count of Users by Country and Gender:
select country,gender, count(user_id) as usercount 
from [Netflix Userbase]
group by  country,gender 
order by  usercount  desc

--User Demographics in the Top 3 Revenue-Generating Countries:
select country, avg (age) as avgage , avg (Monthly_Revenue) as AvgRevenue
from [Netflix Userbase]
where Country in ('United States','Canada','Spain')
group by Country

--- rank of Subscription_Type
select Subscription_Type, count (user_id) as Subscription_Type_rank
from [Netflix Userbase]
group by Subscription_Type 
--Subscription_Type_rank per country
select (country) , Subscription_Type, count (user_id) as Subscription_Type_rank
from [Netflix Userbase]
group by Country,  Subscription_Type


--