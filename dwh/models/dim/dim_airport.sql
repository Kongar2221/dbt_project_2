{{ 
  config(
    materialized = 'incremental',
    unique_key = 'airport_code',
    pre_hook = [
      "{% if not is_incremental() %} insert into {{ this }} 
      (airport_code, airport_name_en, airport_name_ru, airport_city) 
      values ('-1', 'NA', 'NA', 'NA') {% endif %}"
    ],
    post_hook = ["{{ log_model('end') }}"]
  ) 
}}

select
    ad.airport_code,
    ad.airport_name ->> 'en' as airport_name_en,
    ad.airport_name ->> 'ru' as airport_name_ru,
    ad.city ->> 'en' as airport_city,
    cast('{{ run_started_at }}' as timestamp) at time zone 'UTC' as etl_time_utc
from {{ source('stg_airport', 'airports_data') }} as ad
