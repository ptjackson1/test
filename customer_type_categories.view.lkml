view: customer_type_categories {
  sql_table_name: dbo.CustomerTypeCategories ;;

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

  dimension: customer_type_id {
    type: number
    # hidden: true
    sql: ${TABLE}.CustomerTypeID ;;
  }

  dimension: service_category_id {
    type: number
    # hidden: true
    sql: ${TABLE}.ServiceCategoryID ;;
  }

  measure: count {
    type: count
    drill_fields: [id, customer_type.id, customer_type.image_name, service_category.id, service_category.display_name]
  }
}
