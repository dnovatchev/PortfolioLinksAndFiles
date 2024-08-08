with digit(num) as 
   (select 0 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9),
   num1_1000 (n) as 
   (select num from 
      (select d3.num * 100 +d2.num *10 + d1.num + 1 as num 
	     from digit d1 cross join digit d2 cross join digit d3
		 ) as x) 
   
	   select top 1000 n from num1_1000 as n1_1000 
	   where (n > 1 and not exists 
	            (select n from num1_1000 
				  where (n between 2 and sqrt(n1_1000.n)) and n1_1000.n % n = 0 ) 
				) 
	  order by n;
