{{
    config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key='LISTING_ID'
    )
}}
{% set column = 'CREATED_AT' %}

SELECT * FROM {{ source('staging','listings') }}
{% if is_incremental() %}

WHERE {{column}} > (SELECT MAX({{column}}) FROM {{this}})

{% endif %}