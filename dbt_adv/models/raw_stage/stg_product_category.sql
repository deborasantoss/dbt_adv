with product_category as (

    select * from {{ source('dbt_dv', 'productcategory') }}
)
select 
    distinct
    id as product_category_id,
    created_at,
    modified_at,
    category_id,
    product_id

from product_category
