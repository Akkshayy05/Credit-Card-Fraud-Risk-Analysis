SELECT 
    CASE 
        WHEN amount < 50 THEN 'Low'
        WHEN amount BETWEEN 50 AND 500 THEN 'Medium'
        ELSE 'High'
    END AS risk_category,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN class = 1 THEN 1 ELSE 0 END) AS fraud_count,
    ROUND(
        (SUM(CASE WHEN class = 1 THEN 1 ELSE 0 END) * 100.0) / COUNT(*),
        4
    ) AS fraud_percentage
FROM transactions
GROUP BY risk_category
ORDER BY fraud_percentage DESC;
