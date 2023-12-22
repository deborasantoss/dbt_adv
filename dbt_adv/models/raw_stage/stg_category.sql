with source as (
          select * from {{ source('dbt_dv', 'category') }}
      )

      select 
          id as category_id,
          created_at,
          modified_at,
          name as category_name

      from source
