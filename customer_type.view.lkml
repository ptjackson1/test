view: customer_type {
  sql_table_name: dbo.CustomerType ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
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

  dimension: customer_profile_id {
    type: number
    # hidden: true
    sql: ${TABLE}.CustomerProfileID ;;
  }

  dimension: customer_type {
    type: string
    sql: ${TABLE}.CustomerType ;;
  }

  dimension: image_name {
    type: string
    sql: ${TABLE}.ImageName ;;
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
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [id, image_name, customer_profile.id, customer_profile.name, customer_profile.image_name, customer.count, customer_type_categories.count, customer_type_customer_segments.count, walmart_master.count]
  }
}
