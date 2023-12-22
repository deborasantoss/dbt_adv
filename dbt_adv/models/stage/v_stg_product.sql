
{% set yaml_metadata %}
source_model: stg_product
derived_columns:
    SOURCE: "!WEBSHOP-PRODUCT"
    LOAD_DATETIME: "CREATED_AT"
    EFFECTIVE_FROM: "CREATED_AT"
    EFFECTIVE_TO: ifnull(lag("CREATED_AT") over (partition by "PRODUCT_ID" order by "MODIFIED_AT" desc), '9999-12-31 23:59:59.999999')
hashed_columns:
  PRODUCT_HK: "PRODUCT_ID"
  BRAND_HK: "BRAND_ID"
  PRODUCT_HASHDIFF:
    is_hashdiff: true
    columns:
      - "PRODUCT_ID"
      - "PRODUCT_NAME"
      - "PRODUCT_DESCRIPTION"
      - "EAN"
      - "PRICE"
      - "SOURCE"
      - "DISCOUNT_PERCENT"
      - "BRAND_ID"
      - "INVENTORY"
      - "PUBLISHED"
      - "EFFECTIVE_FROM"
      - "EFFECTIVE_TO"
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
