view: customer_profile {
  sql_table_name: dbo.CustomerProfile ;;

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

  dimension: derive_ssrvolume {
    type: string
    hidden: yes
    sql: ${TABLE}.DeriveSSRVolume ;;
  }

  dimension: documents_url {
    type: string
    hidden: yes
    sql: ${TABLE}.DocumentsURL ;;
  }

  dimension: entity_id {
    type: number
    hidden: yes
    sql: ${TABLE}.EntityID ;;
  }

  dimension: image_name {
    type: string
    hidden: yes
    sql: ${TABLE}.ImageName ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: net_suite_parent_id {
    type: number
    hidden: yes
    sql: ${TABLE}.NetSuiteParentID ;;
  }

  dimension: phaseware_parent_id {
    type: number
    hidden: yes
    sql: ${TABLE}.PhasewareParentID ;;
  }

  dimension: some_other_prefs {
    type: string
    hidden: yes
    sql: ${TABLE}.SomeOtherPrefs ;;
  }

  dimension_group: update {
    type: time
    timeframes: [time, date, week, month]
    hidden: yes
    sql: ${TABLE}.UpdateDate ;;
  }

  dimension: update_user {
    type: string
    hidden: yes
    sql: ${TABLE}.UpdateUser ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [id, name, image_name, customer.count, customer_bak.count, customer_categories.count, customer_documents.count, customer_segment.count, customer_segment_label.count, customer_type.count, file_import_log.count, file_import_log_bak.count, file_import_log_bak0925.count, user_customers.count, walmart_master.count]
  }
}
