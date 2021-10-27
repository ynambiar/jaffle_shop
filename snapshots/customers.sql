{% snapshot customers_snapshot %}
    {{
        config(
          target_schema='analytics',
          unique_key='id',
          strategy='check',
          check_cols=['id'],
        )
    }}
    -- Pro-Tip: Use sources in snapshots!
    select * from {{ source('jaffle_shop', 'customers') }}
{% endsnapshot %}