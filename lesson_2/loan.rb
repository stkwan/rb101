# User input: loan amount, APR, and loan duration
# Verify loan amount is a number
# Verify APR is a number and convert it to a percent
# Verify that loan duration is a number
# Return: monthly interest rate, loan duration in months, and montly payment
# Use the formula to obtian monthly payment: m = p * (j / (1 - (1 + j)**(-n)))

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(number)
  number.to_i != 0
end

def apr_to_decimal(number)
  number.to_f / 100
end

prompt("Welcome to Loan Calculator!")

loop do
  prompt("Enter the loan amount:")
  loan_amount = ''
  loop do
    loan_amount = gets.chomp
    if valid_number?(loan_amount)
      break
    else
      prompt("Hmm... that's not a valid entry, please try again.")
    end
  end
  loan_amount = loan_amount.to_i
  prompt("Enter the Annual Percentage Rate (APR) as a whole number:")
  apr_input = ''
  loop do
    apr_input = gets.chomp
    if valid_number?(apr_input)
      break
    else
      prompt("Hmm... that's not a valid entry, please try again.")
    end
  end
  annual_pr = apr_to_decimal(apr_input)
  prompt("Enter the loan duration in years:")
  duration_in_years = ''
  loop do
    duration_in_years = gets.chomp
    if valid_number?(duration_in_years)
      break
    else
      prompt("Hmm... that's not a valid entry, please try again.")
    end
  end
  duration_in_months = duration_in_years.to_i * 12
  monthly_rate = annual_pr / 12
  monthly_payment = loan_amount * (monthly_rate / (1 - (1 + monthly_rate)**(-duration_in_months)))
  output = <<-MSG
    For a loan of $#{loan_amount}, APR of #{annual_pr}%, over #{duration_in_years} years:
    Your monthly interest rate is:   #{monthly_rate}
    Your loan duration in months is: #{duration_in_months}
    Your monthly payment is:         #{monthly_payment}  
  MSG
  prompt(output)
  prompt("Enter Y to perform another loan calcuation or any key to exit:")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
