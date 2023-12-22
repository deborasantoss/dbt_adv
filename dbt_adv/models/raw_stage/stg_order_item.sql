with orderid as (
          select * from {{ source('dbt_dv', 'orderitem') }}
      )

      select 
        id as order_item_id, 
        created_at,
        modified_at,
        order_id,
        product_id,
        quantity, 
        price,
        source
        
      from orderid