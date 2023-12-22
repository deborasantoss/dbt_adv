{{ config(materialized='table') }}

{%- set datepart = "day" -%}
{%- set start_date = "TO_DATE('2023/01/01', 'yyyy/mm/dd')" -%}
{# {%- set end_date =  -%} #}

WITH as_of_date AS (
    {{ dbt_utils.date_spine(datepart=datepart, 
                            start_date=start_date,
                            end_date="(select current_date " | string + ")") }}
)

SELECT DATE_{{datepart}} as AS_OF_DATE FROM as_of_date