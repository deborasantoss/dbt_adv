{{ config(materialized="bridge_incremental") }}

{%- set yaml_metadata -%}
source_model: v_stg_product_category
src_pk: PRODUCT_CATEGORY_HK
src_ldts: LOAD_DATETIME
as_of_dates_table: as_of_date
bridge_walk:
  v_stg_product_category:
    bridge_link_pk: PRODUCT_HK
    bridge_end_date: EFFECTIVE_TO
    bridge_load_date: LOAD_DATETIME
    link_table: v_stg_product_category
    link_pk: PRODUCT_HK
    link_fk1: CATEGORY_ID
    eff_sat_table: sat_product
    eff_sat_pk: PRODUCT_HK
    eff_sat_end_date: EFFECTIVE_TO
    eff_sat_load_date: LOAD_DATETIME
  v_stg_product_category:
    bridge_link_pk: CATEGORY_HK
    bridge_end_date: EFFECTIVE_TO
    bridge_load_date: EFFECTIVE_FROM
    link_table: v_stg_product_category
    link_pk: CATEGORY_HK
    link_fk1: PRODUCT_ID
    eff_sat_table: sat_category
    eff_sat_pk: CATEGORY_HK
    eff_sat_end_date: EFFECTIVE_TO
    eff_sat_load_date: LOAD_DATETIME 
stage_tables_ldts:
  v_stg_product_category: LOAD_DATETIME
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_model = metadata_dict["source_model"] %}
{% set src_pk = metadata_dict["src_pk"] %}
{% set src_ldts = metadata_dict["src_ldts"] %}
{% set as_of_dates_table = metadata_dict["as_of_dates_table"] %}
{% set bridge_walk = metadata_dict["bridge_walk"] %}
{% set stage_tables_ldts = metadata_dict["stage_tables_ldts"] %}

{{ automate_dv.bridge(source_model=source_model, src_pk=src_pk,
                      src_ldts=src_ldts,
                      bridge_walk=bridge_walk,
                      as_of_dates_table=as_of_dates_table,
                      stage_tables_ldts=stage_tables_ldts) }}
