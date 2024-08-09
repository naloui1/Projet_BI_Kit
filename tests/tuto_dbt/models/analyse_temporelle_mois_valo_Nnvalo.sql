
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(
        materialized='view',
        schema='core'
        )}}
        


with my_analyse_temporelle_mois as (
    select * from {{ ref('analyse_temporelle_mois') }}
)

SELECT month,
        CASE
            WHEN famille_materiaux::text <> 'Materiaux non valorisables'::text THEN 'Materiaux Valorisable'::text
            ELSE 'Materiaux non valorisables'::text
        END AS famille_materiaux,
    sum(calculated_div) AS total_value
   FROM my_analyse_temporelle_mois
  GROUP BY month, famille_materiaux



