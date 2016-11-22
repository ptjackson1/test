view: service_category {
  sql_table_name: dbo.ServiceCategory ;;

  dimension: id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.ID ;;
  }

  dimension: active {
    type: string
    sql: ${TABLE}.Active ;;
  }

  dimension: avg_collected_units {
    type: number
    sql: ${TABLE}.AvgCollectedUnits ;;
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

  dimension: display_name {
    type: string
    sql: ${TABLE}.DisplayName ;;
  }

  dimension: line_of_business_id {
    type: number
    hidden: yes
    sql: ${TABLE}.LineOfBusinessID ;;
  }

  dimension: service_category {
    type: string
    sql: ${TABLE}.ServiceCategory ;;
  }

  dimension_group: update {
    type: time
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
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [id, display_name, line_of_business.id, category_recycling.count, container.count, customer_categories.count, customer_type_categories.count, exception.count, recycling_method_summary.count, service_category_attribute.count, service_type_mapping.count, user_data_access.count, vendor_service.count, vendor_service_bak.count, vendor_service_summary.count]
  }
}
