view: vendor {
  sql_table_name: dbo.Vendor ;;

  dimension: id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.ID ;;
  }

  dimension_group: create {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.CreateDate ;;
  }

  dimension: create_user {
    #X# Invalid LookML inside "dimension": {"type":null}
    hidden: yes
    sql: ${TABLE}.CreateUser ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: net_suite_id {
    type: number
    hidden: yes
    sql: ${TABLE}.NetSuiteId ;;
  }

  dimension: phaseware_id {
    type: number
    hidden: yes
    sql: ${TABLE}.PhasewareId ;;
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
    fields: [id, name, net_suite_item_mapping.count, staging_file_load.count, staging_msw.count, staging_mswraw.count, vendor_service.count, vendor_service_bak.count]
  }
}
