{% set yaml_metadata %}
source_model: stg_payment_provider
derived_columns:
    SOURCE: "!WEBSHOP-PAYEMENT_PROVIDER"
    LOAD_DATETIME: "CREATED_AT"
    EFFECTIVE_FROM: "CREATED_AT"
hashed_columns:
  PROVIDER_HK: "PROVIDER_ID"
  PROVIDER_HASHDIFF:
    is_hashdiff: true
    columns:
      - "PROVIDER_ID"
      - "PROVIDER_NAME"
      - "FIXED_PAYMENT_COSTS"
      - "PERCENTAGE_PAYMENT_COSTS"
      - "SOURCE"
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