select
  {{ dbt_utils.star(from=ref('stg_sample_external'), quote_identifiers=False) }}
from {{ ref('stg_sample_external') }}
