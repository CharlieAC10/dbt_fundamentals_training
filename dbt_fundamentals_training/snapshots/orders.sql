{% {% snapshot orders_snapshot %}

{{
  config(
    target_database='dbt_fundamentals_ca',
    target_schema='snapshots',
    unique_key='id',
    strategy='timestamp',
    updated_at='updated_at  '
    )
}}

select * from {{ source('jaffle_shop', 'orders') }}

{% endsnapshot %}%}