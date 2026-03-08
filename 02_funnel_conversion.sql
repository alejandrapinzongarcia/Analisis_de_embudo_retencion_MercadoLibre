-- =====================================================
-- FUNNEL CONVERSION ANALYSIS
-- Calculate conversion between funnel stages
-- =====================================================

WITH first_visit AS (
    SELECT DISTINCT user_id
    FROM mercadolibre_funnel
    WHERE event_name = 'first_visit'
),

select_item AS (
    SELECT DISTINCT user_id
    FROM mercadolibre_funnel
    WHERE event_name IN ('select_item','select_promotion')
),

add_to_cart AS (
    SELECT DISTINCT user_id
    FROM mercadolibre_funnel
    WHERE event_name = 'add_to_cart'
),

purchase AS (
    SELECT DISTINCT user_id
    FROM mercadolibre_funnel
    WHERE event_name = 'purchase'
)

SELECT
    COUNT(DISTINCT fv.user_id) AS users_first_visit,
    COUNT(DISTINCT si.user_id) AS users_select_item,
    COUNT(DISTINCT atc.user_id) AS users_add_to_cart,
    COUNT(DISTINCT p.user_id) AS users_purchase

FROM first_visit fv
LEFT JOIN select_item si ON fv.user_id = si.user_id
LEFT JOIN add_to_cart atc ON fv.user_id = atc.user_id
LEFT JOIN purchase p ON fv.user_id = p.user_id;