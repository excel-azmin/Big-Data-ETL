with teams as (
    select * from {{ ref('team_location')}}
) 


select * from teams