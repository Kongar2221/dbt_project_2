{% macro log_model(stage) %}
  {{ log(
       "dbt: model '" ~ this.name ~ "' " ~ (stage | upper) ~ " at " ~ modules.datetime.datetime.utcnow(),
       info=true
     )
  }}
{% endmacro %}
