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
  number = number.to_i
  if number.nil? || number <= 0
    false
  else
    true
  end
end

def apr_to_decimal(number)
  number.to_f / 100
end

prompt("Welcome to Loan Calculator!")
prompt("---------------------------")

loop do
  prompt("Enter loan amount:")
  loan_amount = ''
  loop do
    loan_amount = gets.chomp
    if valid_number?(loan_amount)
      break
    else
      prompt("Hmm... that's not a valid entry, please try again.")
    end
  end
  prompt("Enter the Annual Percentage Rate (APR):")
  prompt("(Example: 5 for 5% or 2.5 for 2.5%)")
  apr_input = ''
  loop do
    apr_input = gets.chomp
    if valid_number?(apr_input)
      break
    else
      prompt("Hmm... that's not a valid entry, please try again.")
    end
  end
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
  annual_pr = apr_to_decimal(apr_input)
  monthly_rate = annual_pr / 12
  loan_amount = loan_amount.to_i
  duration_in_months = duration_in_years.to_i * 12
  monthly_payment = loan_amount *
                    (monthly_rate /
                    (1 - (1 + monthly_rate)**(-duration_in_months)))
  prompt("Your monthly payment is: #{monthly_payment.round(2)}")
  prompt("Enter Y to perform another loan calcuation or any key to exit:")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for using Loan Calculator!")
prompt("Good bye!")
