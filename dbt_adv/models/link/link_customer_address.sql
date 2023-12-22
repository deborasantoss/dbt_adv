
{%- set source_model = "v_stg_customer_address" -%}
{%- set src_pk = "CUSTOMER_ADDRESS_HK"   -%}
{%- set src_fk = ["CUSTOMER_HK", "CUSTOMER_ID"] -%}
{%- set src_ldts = "LOAD_DATETIME" -%}
{%- set src_source = "SOURCE" -%}

{{ automate_dv.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                    src_source=src_source, source_model=source_model) }}
