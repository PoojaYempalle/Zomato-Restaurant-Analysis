Create database Zomato_Restaurants_Analysis;

use Zomato_Restaurants_Analysis;
select * from maindata;
select* from country;


/* Q1  Find the Numbers of Resturants based on City and Country.*/

                   /*CITY*/
select city, count(RestaurantID) as Number_Of_Resturants
from maindata
group by city; 

                 /*COUNTRY*/
SELECT  countryName, count(RestaurantId) from maindata M
left join COUNTRY C ON M.CountryCode = C.CountryID
GROUP BY COUNTRYNAME;

/* Q2  Numbers of Resturants opening based on Year , Quarter , Month*/

                      /*TOTAL RESTAURANTS OPENED YEARWISE*/
                      
select Year, count(*) as RestaurantCount
from maindata
where YEAR IS NOT NULL
group by year 
order by RestaurantCount DESC;

					 /* TOTAL RESTAURANTS OPENED MONTHWISE*/

select Year, Month_Name, count(*) as RestaurantCount
from maindata
group by Year, Month_Name
order by Year,RestaurantCount DESC;

                     /* Q3 TOTAL RESTURANT OPENED QUARTERWISE*/

SELECT Year,Quarter, count(*)  as RestaurantCount
from maindata
where quarter IS NOT NULL
Group by Year, Quarter
Order by Year,Quarter ASC;


                     /* Q4 Count of Resturants based on Ratings*/
                     
    select Rating as Rating,
    count(*) as RestaurantCount
    from maindata
    where Rating is NOT NULL
    GROUP BY Rating
    order by Rating ASC;
    
                    
                    /* Q5 Percentage of Resturants based on "Has_Table_booking"*/
                    
 select Has_Table_booking,
count(*) as TotalRestaurants,
Round(( count(*) / (select count(*) from maindata)) * 100, 2) as Percentage
from maindata
group by Has_Table_booking;

 
                   /* Q6 Percentage of Resturants based on "Has_Online_delivery"*/
		
select Has_Online_delivery,
count(*) as TotalRestaurants,
Round(( count(*) / (select count(*) from maindata)) * 100, 2) as Percentage
from maindata
group by Has_Online_delivery;

             

                  /* Q7 Create buckets based on Average Price of reasonable size and find out how many resturants falls in each buckets*/

SELECT Price_range, count(*) as TotalRestaurants
from(
select
    CASE
        WHEN Average_Cost_for_two between 0 AND 300  THEN '0-300'
        WHEN Average_Cost_for_two between 301 AND 600  THEN '301-600'
        WHEN Average_Cost_for_two between 601 AND 1000  THEN '601-1000'
        ELSE '1001+'
    END AS price_range
FROM maindata) as Num_Resturants
GROUP BY Price_range;

                 /*TOTAL Restaurants*/
select  count(RestaurantID) as TotalRestaurants
 from maindata;


                   /*TOTAL Cuisines*/
select  count(distinct( Cuisines)) as TotalCuisines
from maindata;

                   /* TOTAL City*/
select  count(distinct(City )) as TotalCity
from maindata;






 
 








