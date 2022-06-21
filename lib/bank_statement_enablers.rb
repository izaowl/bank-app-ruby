# frozen_string_literal: true

module BankStatementEnablers
  def format_table(info)
    info.join(' || ')
  end

  def format_money_output(amount)
    amount.nil? ? "" : "£#{format('%.2f', amount)}"
  end

  def transaction_history_formatter
    @transaction_history.map do |transaction|
      [transaction.date,
      format_money_output(transaction.credit),
      format_money_output(transaction.debit),
      format_money_output(transaction.balance)]
    end
  end
end
