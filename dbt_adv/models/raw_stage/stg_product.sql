 with product as (
      select * from {{ source('dbt_dv', 'product') }}
      )

      select 
        id as product_id, 
        created_at,
        modified_at,
        name as product_name,
        description as product_description,
        "EAN" as ean,
        cast(price as numeric(38,2)) as price,
        cast(discount_percent as numeric(38,2)) as discount_percent,
        brand_id,
        inventory,
        published
        
      from product