{%- set source_model = "v_stg_product_category" -%}
{%- set src_pk = "PRODUCT_CATEGORY_HK"   -%}
{%- set src_fk = ["PRODUCT_HK", "CATEGORY_HK", "EFFECTIVE_TO"] -%}
{%- set src_ldts = "LOAD_DATETIME" -%}
{%- set src_source = "SOURCE" -%}

{{ automate_dv.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                    src_source=src_source, source_model=source_model) }}