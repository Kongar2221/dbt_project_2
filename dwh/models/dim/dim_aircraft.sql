{{ config(materialized = 'incremental',
          unique_key = 'aircraft_code',
          pre_hook = [
         "{% if not is_incremental() %} insert into {{ this }} 
         (aircraft_code, model_en, model_ru, flight_range, seat_no, are_conditions) 
         values ('-1', 'NA', 'NA', 'NA', 'NA', 'NA') {% endif %}"
    ],
    post_hook = ["{{ log_model('end') }}"]
  ) 
}}

select  ac.aircraft_code, ac.model ->> 'en' as model_en,
        ac.model ->> 'ru' as model_ru,
        case 
            when ac.range > 5000 then 'high'
            else 'low'
        end as flight_range,
        s.seat_no, s.fare_conditions,
        cast('{{ run_started_at }}' as timestamp) 
        at time zone 'UTC' as etl_time_utc
from {{ source('stg_airport', 'aircrafts_data') }} as ac
    left join {{ source('stg_airport', 'seats') }} as s
    on ac.aircraft_code = s.aircraft_code
