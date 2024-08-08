
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
        
        
{%set source_table='export_athanor_caracterisations' %}

with table_temporaire as (
    select * from {{ source('raw',source_table) }}
                        ),

renamed_and_converted_columns as (
 select
    "FIQ_PES" as pesee_id,
    "FAMILLE_MATERIAUX" as famille_materiaux,
    {{ convert_date('"FIQ_DATE_TRI"') }} as date_tri,
    {{ convert_float('"POIDS_VRAC"') }} as poids_caracterise
    
 from table_temporaire
)


select * from renamed_and_converted_columns


