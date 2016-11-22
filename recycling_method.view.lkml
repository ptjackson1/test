view: recycling_method {
  sql_table_name: dbo.RecyclingMethod ;;

  dimension: id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.ID ;;
  }

  dimension_group: create {
    type: time
    hidden: yes
    timeframes: [time, date, week, month]
    sql: ${TABLE}.CreateDate ;;
  }

  dimension: create_user {
    type: string
    hidden: yes
    sql: ${TABLE}.CreateUser ;;
  }

  dimension: description {
    type: string
    hidden: yes
    sql: ${TABLE}.Description ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension_group: update {
    type: time
    hidden: yes
    timeframes: [time, date, week, month]
    sql: ${TABLE}.UpdateDate ;;
  }

  dimension: update_user {
    type: string
    hidden: yes
    sql: ${TABLE}.UpdateUser ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, category_recycling.count, recycling_method_summary.count]
  }
}
