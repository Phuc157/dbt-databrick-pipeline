{# {% set roles = ['data analyst', 'data engineer', 'data scientist']%}    #}

{% set roles = dbt_utils.get_column_values(table=ref('stg_job_postings'), column='search_term') %}

{% for role in roles -%}
SELECT
    search_term,
    COUNT(*) AS postings
FROM {{ref('stg_job_postings')}}
{# WHERE search_term = '{{ role | title }}' #}
WHERE search_term = '{{ role }}'
GROUP BY ALL
{{ "UNION ALL" if not loop.last }}
{% endfor %}