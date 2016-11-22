view: category_recycling {
  sql_table_name: dbo.CategoryRecycling ;;

  dimension: id {
    type: number
    primary_key: yes
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

  dimension: percentage {
    type: number
    sql: ${TABLE}.Percentage ;;
  }

  dimension: recycling_method_id {
    type: number
    hidden: yes
    sql: ${TABLE}.RecyclingMethodID ;;
  }

  dimension: service_category_id {
    type: number
    hidden: yes
    sql: ${TABLE}.ServiceCategoryID ;;
  }

  measure: percentageRecycle {
    type: number
    sql: ${TABLE}.Percentage ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [id, service_category.id, service_category.display_name, recycling_method.id, recycling_method.name, recycling_percentage.count]
  }
}
