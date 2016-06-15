- view: client_monthly_totals
  sql_table_name: dbo.ClientMonthlyTotals
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.ID

  - dimension: acctg_category
    type: string
    sql: ${TABLE}.AcctgCategory

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
    type: string
    sql: ${TABLE}.IncomeOrExpense
    
  - dimension: income_amount
    type: number
    sql: |
      CASE 
        WHEN ${income_or_expense} = 'i'
        THEN ${amount}
      END
      
  - dimension: expense_amount
    type: number
    sql: |
      CASE 
        WHEN ${income_or_expense} = 'e'
        THEN ${amount}
      END
      
  - dimension: line_of_business
    type: string
    sql: ${TABLE}.lineofbusiness
      
  - measure: count
    type: count_distinct
    drill_fields: [id, client_name]

  - measure: total_income 
    type: sum
    sql: ${income_amount}
    value_format_name: usd
    
  - measure: total_expense
    type: sum
    sql: ${expense_amount}
    value_format_name: usd
    
  - measure: Gross_Profit
    type: number
    sql: ${total_income}-${total_expense}
    value_format_name: usd
    
  - measure: Gross_Margin
    type: number
    sql: (100.00 * ${total_expense}/NULLIF(${total_income}, 0)-100) * -1 
    #sql: |
     # CASE 
      #  WHEN ${total_income}=0
      #  THEN ${total_income}
      #  ELSE ${total_expense}/${total_income} - 1
      #  END
    
    value_format: '0.000'
    
  
    
