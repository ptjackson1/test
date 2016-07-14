- view: aging_data
  sql_table_name: dbo.AgingData
  fields:

  - measure: 1_to_30
    type: sum
    sql: ${TABLE}."Age1-30"

  - measure: 31_to_60
    type: sum
    sql: ${TABLE}."Age31-60"

  - measure: 61_to_90
    type: sum
    sql: ${TABLE}."Age61-90"

  - measure: 90_plus
    type: sum 
    sql: ${TABLE}.Age90Plus

  - measure: age_current
    type: sum
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

  - measure: total_owed 
    type: sum
    sql: Age90Plus + "Age61-90" +  AgeCurrent + "Age31-60" + "Age1-30"
    
  - measure: total_over_30_days
    type: sum
    sql: Age90Plus + "Age61-90" +  "Age31-60" + "Age1-30"
    
   