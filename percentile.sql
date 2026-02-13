WITH ranked_transactions AS (
    SELECT 
        amount,
        class,
        NTILE(100) OVER (ORDER BY amount DESC) AS percentile_group
    FROM transactions
)
SELECT 
    percentile_group,
    COUNT(*) AS total_txns,
    SUM(CASE WHEN class = 1 THEN 1 ELSE 0 END) AS fraud_count,
    ROUND(
        (SUM(CASE WHEN class = 1 THEN 1 ELSE 0 END)::numeric * 100.0) / COUNT(*)::numeric,
        4
    ) AS fraud_percentage
FROM ranked_transactions
WHERE percentile_group = 1
GROUP BY percentile_group;
