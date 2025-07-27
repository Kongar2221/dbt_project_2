{{ 
  config(
    unique_key='flight_id',
    materialized='incremental',
    post_hook=[
      '{{manual_refresh(this)}}',
      '{{log_model("end")}}'
    ]
  )
}}
with stg as (
  select f.flight_id, f.scheduled_departure, f.scheduled_arrival,
         f.actual_departure, f.actual_arrival, f.status,
         f.last_update, f.aircraft_code, f.departure_airport, f.arrival_airport,
         round(extract(epoch from 
                (f.scheduled_arrival - f.scheduled_departure)
                        ) / 3600.0, 2) as duration_scheduled_hr,
         round(extract(epoch from 
                (f.actual_arrival - f.actual_departure)
                        ) / 3600.0, 2) as duration_actual_hr,
         case
            when (f.actual_arrival is null 
                    or f.actual_departure is null) then 'NA'
            when extract(epoch from (f.actual_arrival - f.actual_departure)) 
                    > extract(epoch from (f.scheduled_arrival - f.scheduled_departure)) then 'longer'
            when extract(epoch from (f.actual_arrival - f.actual_departure)) 
                    < extract(epoch from (f.scheduled_arrival - f.scheduled_departure)) then 'shorter'
         else 'expected'
        end as duration_label,
        current_timestamp at time zone 'UTC' as etl_time_utc
  from {{ source('stg', 'flights') }} f
)
select * from stg
{% if is_incremental() %}
  where last_update > (select max(last_update) from {{ this }})
{% endif %}
