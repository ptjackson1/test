view: client_facts {
  derived_table: {
    sql: SELECT clientname
      , MAX(lineofbusiness) as LOB
      , SUM(CASE WHEN IncomeOrExpense = 'i' THEN Amount END) as total_income
      , SUM(CASE WHEN IncomeOrExpense = 'e' THEN Amount END) as total_expense

      FROM dbo.ClientMonthlyTotals
      GROUP BY clientname
       ;;
  }

  dimension: clientname {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.clientname ;;
  }

  dimension: lob {
    type: string
    sql: ${TABLE}.LOB ;;
  }

  dimension: total_income {
    type: number
    sql: ${TABLE}.total_income ;;
  }

  dimension: total_expense {
    type: number
    sql: ${TABLE}.total_expense ;;
  }

  dimension: income_score {
    sql: CASE
        WHEN ${total_income} < 50000
        THEN 10
        WHEN ${total_income} < 100000
        THEN 20
        WHEN ${total_income} >= 100000
        THEN 40
      END
       ;;
  }

  dimension: expense_score {
    sql: CASE
        WHEN ${total_expense} < 50000
        THEN 10
        WHEN ${total_expense} < 100000
        THEN 20
        WHEN ${total_expense} >= 100000
        THEN 40
      END
       ;;
  }

  dimension: LOB_score {
    sql: CASE
        WHEN ${lob} = 'Solid Waste'
        THEN 10
        WHEN ${lob} = 'Organic'
        THEN 20
        WHEN ${lob} = 'Auto'
        THEN 40
      END
       ;;
  }

  dimension: account_score {
    type: number
    sql: ${income_score} + ${expense_score} + ${LOB_score} ;;
  }

  dimension: account_tier {
    type: string
    sql: CASE
        WHEN ${account_score} < 50 THEN 3
        WHEN ${account_score} < 80 THEN 2
        WHEN ${account_score} >= 80 THEN 1
        ELSE 3
      END
       ;;
    html: {% if value == 3 %}
        <div style="color: black; background-color: #dc7350; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
      {% elsif value == 2 %}
        <div style="color: black; background-color: #e9b404; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
      {% else %}
        <div style="color: black; background-color: #49cec1; margin: 0; border-radius: 5px; text-align:center">{{ value }}</div>
      {% endif %}
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [clientname, lob, total_income, total_expense]
  }
}
