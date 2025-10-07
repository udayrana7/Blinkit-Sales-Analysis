# BlinkIt Data
select * from BlinkITData;

# No of rows
select count(*) as total_rows from BlinkITData;

# DATA CLEANING
#Checking for wrong item values
select distinct(Item_Fat_Content) from BlinkITData;

# Updating the values
UPDATE BlinkITData
set Item_Fat_Content =
Case 
when Item_Fat_Content IN ('LF','low fat') then 'Low Fat'
when Item_Fat_Content = 'reg' then 'Regular'
else Item_Fat_Content 
End


#KPI's Requirements
# Total Sales
select CAST(Sum(Sales) as decimal(10,2)) as Total_Sales from BlinkITData;

# Average Sales
select cast(avg(Sales) as decimal(10,2)) as Avg_Sales from BlinkITData;

# Average Rating
select cast(avg(Rating) as decimal(10,2)) as Avg_Rating from BlinkITData;

# Number of Items
select count(*) as No_Of_Items from BlinkITData;

# FILTERED KPI VALUES
# Lets assume we have to find above values for Item_Fat_Content = Low Fat
# Total Sales for Low Fat
select CAST(Sum(Sales) as decimal(10,2)) as Low_fat_content_Sales from BlinkITData
where Item_Fat_Content = 'Low Fat'

# Average Sales for Low Fat
select cast(avg(Sales) as decimal(10,2)) as Low_fat_content_Avg_Sales from BlinkITData where Item_Fat_Content = 'Low Fat'

# Average Rating for Low Fat 
select cast(avg(Rating) as decimal(10,2)) as Low_fat_content_Avg_Rating from BlinkITData where Item_Fat_Content = 'Low Fat'

# Number of Items for Low Fat 
select count(*) as No_Of_Low_fat_content_Items from BlinkITData where Item_Fat_Content = 'Low Fat'

# Lets assume we have to find above values for Outlet_Establishment_Year = 2022
# KPI's Requirements
# Total Sales for Outlet_Establishment_Year = 2022
select CAST(Sum(Sales) as decimal(10,2)) as Total_Sales from BlinkITData where Outlet_Establishment_Year = 2022

# Average Sales for Outlet_Establishment_Year = 2022
select cast(avg(Sales) as decimal(10,2)) as Avg_Sales from BlinkITData where Outlet_Establishment_Year = 2022

# Average Rating for Outlet_Establishment_Year = 2022
select cast(avg(Rating) as decimal(10,2)) as Avg_Rating from BlinkITData where Outlet_Establishment_Year = 2022

# Number of Items for Outlet_Establishment_Year = 2022
select count(*) as No_Of_Items from BlinkITData where Outlet_Establishment_Year = 2022


# KPI Values by Fat content
select Item_Fat_Content , cast(sum(sales) as decimal(10,2)) as Total_Sales,
                         cast(avg(Sales) as decimal(10,2)) as Avg_Sales,
	                     cast(avg(Rating) as decimal(10,2)) as Avg_Rating,
	                     count(*) as No_Of_Items
from BlinkITData group by Item_Fat_Content 
order by Total_Sales desc;

# KPI Values by Item Type
select Item_Type , cast(sum(sales) as decimal(10,2)) as Total_Sales,
                         cast(avg(Sales) as decimal(10,2)) as Avg_Sales,
	                     cast(avg(Rating) as decimal(10,2)) as Avg_Rating,
	                     count(*) as No_Of_Items
from BlinkITData group by Item_Type 
order by Total_Sales desc;

# KPI Values by Fat Content and Outlet
select Outlet_Location_Type, Item_Fat_Content, cast(sum(sales) as decimal(10,2)) as Total_Sales,
                         cast(avg(Sales) as decimal(10,2)) as Avg_Sales,
	                     cast(avg(Rating) as decimal(10,2)) as Avg_Rating,
	                     count(*) as No_Of_Items
from BlinkITData group by Outlet_Location_Type, Item_Fat_Content 
order by Total_Sales desc;

# KPI Values by Outlet Establishment Year
select Outlet_Establishment_Year , cast(sum(sales) as decimal(10,2)) as Total_Sales,
                         cast(avg(Sales) as decimal(10,2)) as Avg_Sales,
	                     cast(avg(Rating) as decimal(10,2)) as Avg_Rating,
	                     count(*) as No_Of_Items
from BlinkITData group by Outlet_Establishment_Year
order by Outlet_Establishment_Year;

# Percentage of Sales by Outlet Size
select Outlet_Size,
Cast(Sum(sales) as decimal(10,2)) as Outlet_Total_Sales,
Cast(Sum(sales)* 100/(select Sum(sales) from BlinkITData) as decimal(10,2)) as Percentage_of_sales
from BlinkITData
group by Outlet_Size;

# KPI Values by Outlet Location
select Outlet_Location_Type , cast(sum(sales) as decimal(10,2)) as Total_Sales,
                         cast(avg(Sales) as decimal(10,2)) as Avg_Sales,
	                     cast(avg(Rating) as decimal(10,2)) as Avg_Rating,
	                     count(*) as No_Of_Items
from BlinkITData group by Outlet_Location_Type;

# KPI Values by Outlet Type
select Outlet_Type, cast(sum(sales) as decimal(10,2)) as Total_Sales,
                         cast(avg(Sales) as decimal(10,2)) as Avg_Sales,
	                     cast(avg(Rating) as decimal(10,2)) as Avg_Rating,
	                     count(*) as No_Of_Items
from BlinkITData group by Outlet_Type
order by Outlet_Type;