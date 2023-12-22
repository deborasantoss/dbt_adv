{% set yaml_metadata %}
source_model: stg_customer_payment_provider
derived_columns:
    SOURCE: "!WEBSHOP-CUSTOMERS-PAYMENT"
    LOAD_DATETIME: "CREATED_AT"
    EFFECTIVE_FROM: "CREATED_AT"
    EFFECTIVE_TO: ifnull(lag("CREATED_AT") over (partition by "CUSTOMER_ID" order by "MODIFIED_AT" desc), '9999-12-31')
hashed_columns:
  CUSTOMER_HK: "CUSTOMER_ID"
  PROVIDER_HK: "PROVIDER_ID"
  PAYMENT_HASHDIFF:
    is_hashdiff: true
    columns:
      - "CUSTOMER_ID"
      - "PROVIDER_ID"
      - "ACCOUNT_NO"
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