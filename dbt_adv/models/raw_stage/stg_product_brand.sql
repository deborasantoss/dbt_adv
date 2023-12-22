with product_brand as (

    select * from {{ source('dbt_dv', 'productbrand') }}
)
select 

    id as brand_id,
    created_at,
    modified_at,
    name as brand_name

from product_brand