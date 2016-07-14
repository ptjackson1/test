- view: aging_data
  sql_table_name: dbo.AgingData
  fields:

  - measure: 31_to_60
    type: number
    sql: ${TABLE}."Age31-60"

  - dimension: age6190
    type: number
    sql: ${TABLE}."Age61-90"

  - dimension: age90_plus
    type: number
    sql: ${TABLE}.Age90Plus

  - dimension: age_current
    type: number
    sql: ${TABLE}.AgeCurrent

  - dimension: client_name
    type: string
    sql: ${TABLE}.ClientName

  - dimension_group: create
    type: time
    timeframes: [month,year]
    convert_tz: false
    sql: ${TABLE}.CreateDate

  - measure: count
    type: count
    drill_fields: [client_name]

