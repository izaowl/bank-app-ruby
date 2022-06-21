# frozen_string_literal: true

require_relative 'bank_statement_enablers'

class BankStatement
  include BankStatementEnablers

  def initialize
    @transaction_history = []
  end

  def add_transaction(transaction)
    @transaction_history << transaction
  end

  def display
    formatted_transactions_history = transaction_history_formatter
    formatted_transactions_history.reverse.map do |transaction|
      "#{format_table(transaction)}\n"
    end
  end
end
