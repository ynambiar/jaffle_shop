{% snapshot orders_snapshot %}
    {{
        config(
          target_schema='snapshots',
          unique_key='id',
          strategy='timestamp',
          updated_at='order_date'
        )
    }}
    -- Pro-Tip: Use sources in snapshots!
    select * from {{ source('jaffle_shop', 'orders') }}
{% endsnapshot %}