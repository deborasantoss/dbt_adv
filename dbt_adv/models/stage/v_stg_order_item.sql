
{% set yaml_metadata %}
source_model: stg_order_item
derived_columns:
    SOURCE: "!WEBSHOP-ORDERS-ITEM"
    LOAD_DATETIME: "CREATED_AT"
    EFFECTIVE_FROM: "CREATED_AT"
hashed_columns:
  ORDER_HK: "ORDER_ID"
  PRODUCT_HK: "PRODUCT_ID"
  ITEM_HASHDIFF:
    is_hashdiff: true
    columns:
      - "ORDER_ITEM_ID"
      - "ORDER_ID"
      - "PRODUCT_ID"
      - "QUANTITY"
      - "PRICE"
      - "EFFECTIVE_FROM"
{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}
{% set source_model = metadata_dict['source_model'] %}
{% set derived_columns = metadata_dict['derived_columns'] %}
{% set hashed_columns = metadata_dict['hashed_columns'] %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=source_model,
                     derived_columns=derived_columns,
                     null_columns=null_columns,
                     hashed_columns=hashed_columns,
                     ranked_columns=ranked_columns) }}
