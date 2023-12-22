with payment_provider as (

     select * from {{ source('dbt_dv', 'paymentprovider') }}
)

select 
    id as provider_id,
    created_at,
    modified_at,
    name as provider_name,
    cast(fixed_payment_costs as numeric(38,2)) as fixed_payment_costs,
    cast(percentage_payment_costs as numeric(38,2)) as percentage_payment_costs

from payment_provider