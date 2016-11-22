view: recycling_method_summary {
  sql_table_name: dbo.RecyclingMethodSummary ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: collected_units {
    type: number
    sql: ${TABLE}.CollectedUnits ;;
  }

  dimension: collected_uom {
    type: string
    sql: ${TABLE}.CollectedUOM ;;
  }

  dimension_group: create {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.CreateDate ;;
  }

  dimension: customer_id {
    type: number
    # hidden: true
    sql: ${TABLE}.CustomerID ;;
  }

  dimension: recycling_method_id {
    type: number
    # hidden: true
    sql: ${TABLE}.RecyclingMethodID ;;
  }

  dimension: rpt_month {
    type: number
    sql: ${TABLE}.RptMonth ;;
  }

  dimension: rpt_year {
    type: number
    sql: ${TABLE}.RptYear ;;
  }

  dimension: rpt_year_mo {
    type: number
    sql: ${TABLE}.RptYearMo ;;
  }

  dimension: service_category_id {
    type: number
    # hidden: true
    sql: ${TABLE}.ServiceCategoryID ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [id, customer.id, customer.name, recycling_method.id, recycling_method.name, service_category.id, service_category.display_name]
  }
}
