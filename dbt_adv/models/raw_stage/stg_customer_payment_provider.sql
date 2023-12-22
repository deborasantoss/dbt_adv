with customer_payment_provider as (
select * from {{ source('dbt_dv', 'customerpaymentprovider') }}
)

select 
  id as payment_provider_id, 
  created_at,
  modified_at,
  customer_id,
  cast(provider as int) as provider_id,
  account_no
  
from customer_payment_provider