view: service_type_mapping {
  sql_table_name: dbo.ServiceTypeMapping ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: active {
    type: string
    sql: ${TABLE}.Active ;;
  }

  dimension_group: create {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.CreateDate ;;
  }

  dimension: create_user {
    type: string
    sql: ${TABLE}.CreateUser ;;
  }

  dimension: service_category_id {
    type: number
    # hidden: true
    sql: ${TABLE}.ServiceCategoryID ;;
  }

  dimension: service_type {
    type: string
    sql: ${TABLE}.ServiceType ;;
  }

  dimension_group: update {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.UpdateDate ;;
  }

  dimension: update_user {
    type: string
    sql: ${TABLE}.UpdateUser ;;
  }

  measure: count {
    type: count
    drill_fields: [id, service_category.id, service_category.display_name]
  }
}
