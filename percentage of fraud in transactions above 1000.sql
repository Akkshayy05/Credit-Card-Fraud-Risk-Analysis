/*percentage of fraud in transactions above 1000*/
select round(sum(case when class = 1 then 1 else 0 end )*100.0/count(*),4) as fraud_percent_above1000
from (
     select class,amount
	 from transactions
	 where amount>1000
)