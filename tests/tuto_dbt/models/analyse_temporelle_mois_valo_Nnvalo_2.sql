
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
        


with my_caracterisation as (
    select * from {{ ref('my_caracterisation') }}
),
my_pesee as (
    select * from {{ ref('my_pesee') }}
),
aggregated_data AS (
    SELECT
        date_trunc('month', t1.date_tri::timestamp with time zone) AS month,
        CASE
            WHEN t1.famille_materiaux::text <> 'Materiaux non valorisables'::text THEN 'Materiaux Valorisable'
            ELSE 'Materiaux non valorisables'
        END AS famille_materiaux,
        COUNT(DISTINCT t2.pesee_id) AS num_pesee_ids,
        SUM(t1.poids_caracterise::numeric) AS total_poids_caracterise,
        SUM(t2.poids_net_pesee::numeric) AS total_poids_net_pesee
    FROM my_caracterisation t1
    LEFT JOIN my_pesee t2 ON t1.pesee_id = t2.pesee_id
    WHERE t1.date_tri <> '2023-06-21'
    GROUP BY
        date_trunc('month', t1.date_tri::timestamp with time zone),
        CASE
            WHEN t1.famille_materiaux::text <> 'Materiaux non valorisables'::text THEN 'Materiaux Valorisable'
            ELSE 'Materiaux non valorisables'
        END
)
SELECT
    month,
    famille_materiaux,
    CASE
        WHEN num_pesee_ids = 1 THEN total_poids_caracterise / total_poids_net_pesee * 1000
        ELSE total_poids_caracterise / total_poids_net_pesee * 1000
    END AS calculated_div
FROM aggregated_data


