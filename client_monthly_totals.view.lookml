- view: client_monthly_totals
  sql_table_name: dbo.ClientMonthlyTotals
  fields:
  
  - filter: client_select
    suggest_dimension: client_name
    
  - filter: lob_select
    suggest_dimension: line_of_business

  - dimension: id
    hidden: true 
    primary_key: true
    type: number
    sql: ${TABLE}.ID

  - dimension: acctg_category
    type: string
    sql: LTRIM(${TABLE}.AcctgCategory)

  - dimension: amount
    type: number
    sql: ${TABLE}.Amount

  - dimension: client_name
    type: string
    sql: ${TABLE}.ClientName

  - dimension_group: fin
    label: 'Month-year'
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.FinDate

  - dimension: income_or_expense
    hidden: true 
    type: string
    sql: ${TABLE}.IncomeOrExpense
    
  - dimension: income_amount
    hidden: true 
    type: number
    sql: |
      CASE 
        WHEN ${income_or_expense} = 'i'
        THEN ${amount}
      END
      
  - dimension: expense_amount
    hidden: true 
    type: number
    sql: |
      CASE 
        WHEN ${income_or_expense} = 'e'
        THEN ${amount}
      END
      
  - dimension: line_of_business
    type: string
    sql: ${TABLE}.lineofbusiness
    
  - dimension: client_comparitor
    sql: |
      CASE
        WHEN {% condition client_select %} ${client_name} {% endcondition %}
          THEN ${client_name}
        WHEN  {% condition lob_select %} ${line_of_business} {% endcondition %}
          THEN CONCAT('Rest of ', ${line_of_business})
        ELSE 'Rest of Population'
      END  
      
  - measure: count
    type: count_distinct
    sql: ClientName
    drill_fields: [id, client_name]

  - measure: total_income 
    type: sum
    sql: ${income_amount}
    value_format_name: usd
    drill_fields: [id, client_name]
    
  - measure: total_expense
    type: sum
    sql: ${expense_amount}
    value_format_name: usd
    drill_fields: [id, client_name]
    
  - measure: Gross_Profit
    type: number
    sql: ${total_income}-${total_expense}
    value_format_name: usd
    drill_fields: [client_name, amount, month, line_of_business]
    
  - measure: Gross_Margin
    type: number
    sql: (100.00 * ${total_expense}/NULLIF(${total_income}, 0)-100) * -1 
    drill_fields: [id, client_name]
    #sql: |
     # CASE 
      #  WHEN ${total_income}=0
      #  THEN ${total_income}
      #  ELSE ${total_expense}/${total_income} - 1
      #  END
    
    value_format: '0.000'
    
  
    
