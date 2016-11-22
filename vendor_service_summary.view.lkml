view: vendor_service_summary {
  sql_table_name: dbo.VendorServiceSummary ;;

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

  dimension: create_user {
    type: string
    sql: ${TABLE}.CreateUser ;;
  }

  dimension: customer_id {
    type: number
    # hidden: true
    sql: ${TABLE}.CustomerID ;;
  }

  dimension: derived_value {
    type: string
    sql: ${TABLE}.DerivedValue ;;
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
    drill_fields: [id, customer.id, customer.name, service_category.id, service_category.display_name]
  }
}
