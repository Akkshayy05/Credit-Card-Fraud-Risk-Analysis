/*highest fraud transaction*/
select Amount
from transactions
where class = 1
order by Amount desc
limit 1;