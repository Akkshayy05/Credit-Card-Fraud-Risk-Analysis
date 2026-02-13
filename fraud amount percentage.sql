SELECT 
    ROUND(
        (SUM(CASE WHEN class = 1 THEN amount ELSE 0 END)::numeric * 100.0) 
        / SUM(amount)::numeric ,
        4
    ) AS fraud_amount_percentage
FROM transactions;
