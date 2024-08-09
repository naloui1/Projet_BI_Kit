
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
    select * from {{ ref('my_caracterisation') }} /* ref le fichier sql qui permet de creer la bD my caracterisation*/
),
my_pesee as (
    select * from {{ ref('my_pesee') }}
)


SELECT t1.date_tri,
    t1.famille_materiaux,
    sum(t1.poids_caracterise::numeric) / sum(DISTINCT t2.poids_net_pesee)::numeric * 1000::numeric AS calculated_div
   FROM my_caracterisation t1
     LEFT JOIN my_pesee t2 ON t1.pesee_id = t2.pesee_id
  WHERE t1.date_tri <> '2023-06-21'::date
  GROUP BY t1.date_tri, t1.famille_materiaux
  ORDER BY t1.date_tri









