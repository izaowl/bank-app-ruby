# frozen_string_literal: true

require 'date'

class Transaction
  attr_reader :date, :credit, :debit, :balance

  def initialize(amount, balance)
    @date = Date.today.strftime('%d/%m/%Y')
    @balance = balance
    debit_or_credit(amount)
  end

  def debit_or_credit(amount)
    if(amount>=0)
      @credit = amount
    else
      @debit = amount.abs
    end
  end
end
