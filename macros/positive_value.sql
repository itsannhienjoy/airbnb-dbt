{% test positive_value(model, column_name) %}

select
    {{ column_name }} as value
from {{ model }}
where {{ column_name }} < 1

{% endtest %}