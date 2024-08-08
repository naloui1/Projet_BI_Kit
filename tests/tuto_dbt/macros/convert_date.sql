{% macro convert_date(date_string) %}
to_date({{ date_string }}, 'DD/MM/YYYY' )
{% endmacro %}

