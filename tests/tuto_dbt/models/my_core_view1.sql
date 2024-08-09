
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
)

select t1.date_tri, 

  t1.famille_materiaux,
  sum(t1.poids_caracterise::numeric) /sum (DISTINCT t2.poids_net_pesee)
  
from my_caracterisation t1 
left join my_pesee t2
on t1.pesee_id = t2.pesee_id
group by t1.date_tri,        
        t1.famille_materiaux
order by t1.date_tri ASC





