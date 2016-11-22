view: vendor_service {
  sql_table_name: dbo.VendorService ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: amount {
    hidden: yes
    type: number
    sql: ${TABLE}.Amount ;;
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
    hidden: yes
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.CreateDate ;;
  }

  dimension: create_user {
    hidden: yes
    type: string
    sql: ${TABLE}.CreateUser ;;
  }

  dimension: customer_id {
    type: number
    hidden: yes
    sql: ${TABLE}.CustomerID ;;
  }

  dimension: customer_segment_id {
    type: number
    hidden: yes
    sql: ${TABLE}.CustomerSegmentID ;;
  }

  dimension: data_source_id {
    type: number
    hidden: yes
    sql: ${TABLE}.DataSourceID ;;
  }

  dimension: equipment_type {
    type: string
    sql: ${TABLE}.EquipmentType ;;
  }

  dimension: exception_id {
    type: number
    hidden: yes
    sql: ${TABLE}.ExceptionID ;;
  }

  dimension: exception_notes {
    hidden: yes
    type: string
    sql: ${TABLE}.ExceptionNotes ;;
  }

  dimension: file_import_log_id {
    type: number
    hidden: yes
    sql: ${TABLE}.FileImportLogID ;;
  }

  dimension: hauler_name {
    type: string
    sql: ${TABLE}.HaulerName ;;
  }

  dimension: include_rec_in_summary {
    type: string
    sql: ${TABLE}.IncludeRecInSummary ;;
  }

  dimension_group: invoice {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.InvoiceDate ;;
  }

  dimension: invoice_number {
    type: string
    sql: ${TABLE}.InvoiceNumber ;;
  }

  dimension: item_id {
    type: number
    hidden: yes
    sql: ${TABLE}.ItemID ;;
  }

  dimension: manifest_number {
    type: string
    sql: ${TABLE}.ManifestNumber ;;
  }

  dimension: recycle_center_id {
    type: number
    hidden: yes
    sql: ${TABLE}.RecycleCenterID ;;
  }

  dimension: service_category_id {
    type: number
    hidden: yes
    sql: ${TABLE}.ServiceCategoryID ;;
  }

  dimension_group: service {
    type: time
    timeframes: [date, week, month, month_name, year]
    convert_tz: no
    sql: ${TABLE}.ServiceDate ;;
  }

  dimension: service_type {
    type: string
    sql: ${TABLE}.ServiceType ;;
  }

  dimension: transaction_id {
    type: number
    hidden: yes
    sql: ${TABLE}.Transaction_ID ;;
  }

  dimension: transaction_line_id {
    hidden: yes
    type: number
    sql: ${TABLE}.Transaction_Line_ID ;;
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

  dimension: vendor_id {
    type: number
    hidden: yes
    sql: ${TABLE}.VendorID ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_collected_units {
    type: sum
    sql: ${collected_units} ;;
    value_format_name: decimal_2
    drill_fields: [detail*]
  }

  measure: total_amount {
    type: sum
    sql: ${amount} ;;
    value_format_name: decimal_2
    drill_fields: [detail*]
  }

  measure: percentageRecycle {
    type: number
    sql: category_recycling.Percentage ;;
  }

  measure: Units_Recycled {
    type: number
    sql: ${total_collected_units} * ${percentageRecycle} ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [id, hauler_name, customer.name, customer_segment.level_name, vendor.id, vendor.name, service_category.display_name, recycle_center.name, service_category_attribute_value.count, service_category_attribute_value_bk.count, vendor_service_excess_columns.count]
  }
}
