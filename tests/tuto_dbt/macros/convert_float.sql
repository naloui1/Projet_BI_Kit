{% macro convert_float(data) %}
    CAST(REPLACE( {{ data }}, ',', '.') AS FLOAT) 
{% endmacro %}