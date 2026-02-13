/*FRAUD PERCENTAGE*/
SELECT round(sum(case when class = 1 then 1 else 0 end)*100.0/count(class),2) as Fraud_Percentage
from transactions