# frozen_string_literal: true

module ValidateTransaction
  def validate_deposit(amount)
    raise 'You entered an invalid value, please put in an integer instead' unless amount.is_a? Integer
    raise 'Amount must be greater than zero' unless amount.positive?
  end

  def validate_withdrawal(amount, _balance)
    raise 'You entered an invalid value, please put in an integer instead' unless amount.is_a? Integer
    raise 'Amount must be greater than zero\n' unless amount.positive?
    raise 'Not enough money in your account to withdraw this amount' if @balance < @amount
  end
end
