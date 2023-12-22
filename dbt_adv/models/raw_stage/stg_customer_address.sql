   with customeraddress as (
      select * from {{ source('dbt_dv', 'customeraddress') }}
      )

      select 
        id as customer_address_id,
        created_at,
        modified_at,
        customer_id,
        street, 
        cast(number as int) as address_number, 
        city,
        cast(postal_code as int) as postal_code,
        country
        
      from customeraddress
      qualify row_number() over (partition by customer_id, id order by null) =1 