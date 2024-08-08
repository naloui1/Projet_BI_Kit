
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(
        materialized='table',
        schema='staging'
        )}}
        
        
{%set source_table='export_athanor' %}

with table_temporaire as (
    select * from {{ source('raw',source_table) }}
                        ),

renamed_columns as (
 select
    "PES_NUMERO" as pesee_id,
    "PES_POIDS_NET" as poids_net_pesee
 from table_temporaire
)


select * from renamed_columns


