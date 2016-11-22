view: customer_segment {
  sql_table_name: dbo.CustomerSegment ;;

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

  dimension: customer_profile_id {
    type: number
    hidden: yes
    sql: ${TABLE}.CustomerProfileID ;;
  }

  dimension: end_year_mo {
    type: number
    hidden: yes
    sql: ${TABLE}.EndYearMo ;;
  }

  dimension: level_name {
    type: string
    sql: ${TABLE}.LevelName ;;
  }

  dimension: parent_id {
    type: number
    hidden: yes
    sql: ${TABLE}.ParentID ;;
  }

  dimension: start_year_mo {
    type: number
    hidden: yes
    sql: ${TABLE}.StartYearMo ;;
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
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [id, level_name, customer_profile.id, customer_profile.name, customer_profile.image_name, customer.count, customer_bak.count, customer_type_customer_segments.count, user_geoaccess.count, vendor_service.count, walmart_master.count]
  }
}
