{{ config(materialized='view') }}

with source_item as (
    select 1 as id
    union all
    select null as id
)
select * from source_item

-- final as (
    
-- )

-- select * from  final