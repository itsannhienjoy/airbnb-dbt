SELECT *
FROM {{ ref('dim_listings_cleansed' ) }}
INNER JOIN {{ ref('fact_reviews' )}} ref
USING (listing_id)
WHERE l.created_at >= r.review_date