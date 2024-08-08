
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
        
        
 -- models/clean_column_names.sql

{%set source_table='export_athanor' %}

with source as (
    select * from {{ source('raw',source_table) }}
),

renamed_columns as (
 select
  {% for col in adapter.get_columns_in_relation(source('raw',source_table)) %}
   {% if ' ' in col.name %}
    {{ col.name | replace(' ', '_') }} as {{ col.name }}
   {% else %}
    {{ col.name }}
   {% endif %}
  {% endfor %}
 from source
)
select * from renamed_columns




       
   
/*   WITH source AS (
   SELECT
       [PES NUMERO],
       [PES DATE ENTREE
   FROM raw.export_athanor]
)*/



/*, transformed AS (
   SELECT
       RENAME [PES NUMERO] TO PES_NUMERO;       
   FROM source
)
SELECT
   *
FROM transformed */
