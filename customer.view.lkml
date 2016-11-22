view: customer {
  sql_table_name: dbo.Customer ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.Address ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
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

  dimension: customer_segment_id {
    type: number
    hidden: yes
    sql: ${TABLE}.CustomerSegmentID ;;
  }

  dimension: customer_type_id {
    type: number
    hidden: yes
    sql: ${TABLE}.CustomerTypeID ;;
  }

  dimension: has_organics {
    type: string
    sql: ${TABLE}.HasOrganics ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.Location ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: net_suite_id {
    type: number
    hidden: yes
    sql: ${TABLE}.NetSuiteID ;;
  }

  dimension: phaseware_id {
    type: number
    hidden: yes
    sql: ${TABLE}.PhasewareId ;;
  }

  dimension: site_type {
    type: string
    sql: ${TABLE}.SiteType ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
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

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.Zip ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [id, name, customer_profile.id, customer_profile.name, customer_profile.image_name, customer_segment.id, customer_segment.level_name, customer_type.id, customer_type.image_name, container.count, food_rescue.count, recycling_method_summary.count, recycling_percentage.count, service_request.count, staging_msw.count, staging_mswraw.count, sustainability.count, user_geoaccess.count, vendor_service.count, vendor_service_bak.count, vendor_service_summary.count]
  }

  set: detail2 {
    fields: [id, name]
  }
}
