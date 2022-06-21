# lib/account.rb

# frozen_string_literal: true

require_relative 'transaction'
require_relative 'bank_statement'
require_relative 'validate_transaction'

class Account
  include ValidateTransaction
  attr_reader :balance

  STARTING_BALANCE = 0

  def initialize()
    @statement = BankStatement.new
    @balance = STARTING_BALANCE
  end

  def deposit(amount)
    validate_deposit(amount)
    @balance += amount
    add_transaction_to_statement(amount)
  rescue StandardError => e
    puts e
  end

  def withdrawal(amount)
    validate_deposit(amount)
    @amount = amount
    validate_withdrawal(@amount, balance)
    @balance -= amount
    add_transaction_to_statement(-amount)
  rescue StandardError => e
    puts e
  end

  def statement_output
    puts 'date || credit || debit || balance'
    puts @statement.display
  end

  private

  def add_transaction_to_statement(amount)
    transaction = Transaction.new(amount, @balance)
    @statement.add_transaction(transaction)
  end
end
