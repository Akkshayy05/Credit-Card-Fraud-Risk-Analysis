/*top 10 Highest Transactions Overall*/
Select class, Amount
from transactions
order by Amount desc
limit 10;