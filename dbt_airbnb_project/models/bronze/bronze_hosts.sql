{{
    config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key='HOST_ID'
    )
}}
{% set column = 'CREATED_AT' %}

SELECT * FROM {{ source('staging','hosts') }}
{% if is_incremental() %}

WHERE {{column}} > (SELECT MAX({{column}}) FROM {{this}})

{% endif %}