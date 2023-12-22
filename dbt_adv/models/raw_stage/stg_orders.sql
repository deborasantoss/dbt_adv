with orders as (
          select * from {{ source('dbt_dv', 'orders') }}
      )

      select 
        id as order_id, 
        created_at,
        modified_at,
        customer_id,
        status,
        customer_address_id, 
        source
        
      from orders