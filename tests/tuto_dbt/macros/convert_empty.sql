{% macro convert_empty(column) %}

case 
	when {{ column }} is null or {{ column }} = '' then 'Autres'
	else {{ column }}
end 

{% endmacro %}
