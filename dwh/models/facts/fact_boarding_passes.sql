{{
  config(
    materialized = 'incremental',
    unique_key   = ['ticket_no','flight_id','boarding_no'],
    post_hook    = ['{{ manual_refresh(this) }}', '{{ log_model("end") }}']
  )
}}
with stg as (
  select bp.ticket_no, bp.flight_id, bp.boarding_no,
         bp.seat_no, tf.fare_conditions, tf.amount,
         bp.last_update, cast('{{ run_started_at }}' as timestamp)
                                 at time zone 'UTC' as etl_time_utc
  from {{ source('stg', 'boarding_passes') }} as bp
    left join {{ source('stg', 'ticket_flights') }} as tf
        on bp.ticket_no = tf.ticket_no
    and bp.flight_id  = tf.flight_id
)

select * from stg
{% if is_incremental() %}
  where last_update > (select max(last_update) from {{ this }})
{% endif %}
