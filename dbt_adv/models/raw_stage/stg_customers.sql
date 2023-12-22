with customers as (
          select * from {{ source('dbt_dv', 'customer') }}
      )

      select 
        id as customer_id, 
        created_at,
        modified_at,
        name,
        email,
        phone_number
        
      from customers