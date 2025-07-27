{{ log_model("start") }}
{{ 
  config(
    materialized = 'incremental',
    unique_key   = 'ticket_no',
    post_hook    = ['{{ manual_refresh(this) }}',
                    '{{ log_model("end") }}']
  )
}}

with stg as (
  select t.ticket_no, b.book_ref, b.book_date,
         b.total_amount, t.passenger_id, t.passenger_name,
         t.contact_data::json ->> 'email' as email,
         t.contact_data::json ->> 'phone' as phone,
         t.last_update,
         cast('{{ run_started_at }}' as timestamp)
          at time zone 'UTC' as etl_time_utc
  from {{ source('stg', 'tickets') }}   as t
    join {{ source('stg', 'bookings') }}  as b
      on t.book_ref = b.book_ref
)

select * from stg
{% if is_incremental() %}
  where last_update > (select max(last_update) from {{ this }})
{% endif %}
