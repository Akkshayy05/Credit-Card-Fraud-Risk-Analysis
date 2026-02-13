select class,amount
from (
    select *,dense_rank()over(partition by class order by amount desc)rn
	from transactions
)
where rn<=5