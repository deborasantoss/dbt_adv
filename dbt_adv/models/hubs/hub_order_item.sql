{%- set source_model = "v_stg_order_item" -%}
{%- set src_pk = "ORDER_HK" -%}
{%- set src_nk = "PRODUCT_ID", 'ORDER_ID' -%}
{%- set src_ldts = "LOAD_DATETIME" -%}
{%- set src_source = "SOURCE" -%}

{{ automate_dv.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                   src_source=src_source, source_model=source_model) }}