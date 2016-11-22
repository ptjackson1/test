view: service_request {
  sql_table_name: dbo.ServiceRequest ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: classification {
    type: string
    sql: ${TABLE}.Classification ;;
  }

  dimension_group: close {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.CloseDate ;;
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

  dimension: customer_id {
    type: number
    hidden: yes
    sql: ${TABLE}.CustomerID ;;
  }

  dimension: data_source_id {
    type: number
    hidden: yes
    sql: ${TABLE}.DataSourceID ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.Description ;;
  }

  dimension: file_import_log_id {
    type: number
    hidden: yes
    sql: ${TABLE}.FileImportLogID ;;
  }

  dimension: incident_id {
    type: number
    sql: ${TABLE}.IncidentID ;;
  }

  dimension: line_of_business {
    type: string
    sql: ${TABLE}.LineOfBusiness ;;
  }

  dimension_group: modified {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.ModifiedDate ;;
  }

  dimension_group: open {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.OpenDate ;;
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

  dimension: store_no {
    type: string
    sql: ${TABLE}.StoreNo ;;
  }

  dimension: vendor_name {
    type: string
    sql: ${TABLE}.VendorName ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [id, vendor_name, customer.id, customer.name, data_source.id, file_import_log.id, file_import_log.file_name]
  }
}
