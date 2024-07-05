{% macro my_dynamic_column(column_name) %}
    CASE
        WHEN {{ column_name }} = 'success' THEN 'OK'
        WHEN {{ column_name }} = 'fail' THEN 'notok1'
        ELSE 'other'
    END
{% endmacro %}