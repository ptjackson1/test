view: customer_categories {
  sql_table_name: dbo.CustomerCategories ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
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

  dimension: customer_profile_id {
    type: number
    hidden: yes
    sql: ${TABLE}.CustomerProfileID ;;
  }

  dimension: service_category_id {
    type: number
    hidden: yes
    sql: ${TABLE}.ServiceCategoryID ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [id, customer_profile.id, customer_profile.name, customer_profile.image_name, service_category.id, service_category.display_name]
  }
}
