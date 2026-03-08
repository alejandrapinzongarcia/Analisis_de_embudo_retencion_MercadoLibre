-- =====================================================
-- USER RETENTION BY COUNTRY
-- Measure retention at different time intervals
-- =====================================================

SELECT
    country,

    ROUND(
        100.0 * COUNT(DISTINCT CASE
            WHEN day_after_signup >= 7 AND active = 1
            THEN user_id END
        ) / NULLIF(COUNT(DISTINCT user_id),0),
    1) AS retention_d7,

    ROUND(
        100.0 * COUNT(DISTINCT CASE
            WHEN day_after_signup >= 14 AND active = 1
            THEN user_id END
        ) / NULLIF(COUNT(DISTINCT user_id),0),
    1) AS retention_d14

FROM mercadolibre_retention

GROUP BY country
ORDER BY country;