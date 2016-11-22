view: sustainability {
  sql_table_name: dbo.Sustainability ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension_group: begin {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.BeginDate ;;
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

  dimension_group: end {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.EndDate ;;
  }

  dimension: equipment {
    type: string
    sql: ${TABLE}.Equipment ;;
  }

  dimension: frequency {
    type: number
    sql: ${TABLE}.Frequency ;;
  }

  dimension: material {
    type: string
    sql: ${TABLE}.Material ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.Quantity ;;
  }

  dimension: size {
    type: number
    sql: ${TABLE}.Size ;;
  }

  dimension: uom {
    type: string
    sql: ${TABLE}.UOM ;;
  }

  dimension_group: update {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.UpdateDate ;;
  }

  dimension: update_user {
    type: string
    sql: ${TABLE}.UpdateUser ;;
  }

  measure: count {
    type: count
    drill_fields: [id, customer.id, customer.name]
  }
}
