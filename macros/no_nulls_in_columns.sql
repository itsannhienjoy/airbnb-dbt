{% test no_nulls_in_columns(model) %}

WITH validation_errors AS (
    SELECT *
    FROM {{ model }}
    WHERE
    {% set columns = adapter.get_columns_in_relation(model) %}
    {% for col in columns %}
        {{ col.name }} IS NULL
        {% if not loop.last %} OR {% endif %}
    {% endfor %}
)

SELECT * FROM validation_errors

{% endtest %}
