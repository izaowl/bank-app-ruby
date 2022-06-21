# frozen_string_literal: true

require 'bank_statement'

describe BankStatement do
  def transaction_stub(transaction, date, credit, debit, balance)
    allow(transaction).to receive(:date) { date }
    allow(transaction).to receive(:credit) { credit }
    allow(transaction).to receive(:debit) { debit }
    allow(transaction).to receive(:balance) { balance }
  end

  let(:statement) { BankStatement.new }

  it ' has a transaction added to the statement' do
    transaction = double('transaction')
    expect(statement.add_transaction(transaction).length).to eq 1
  end

  it ' has formated transactios pting out to the screen' do
    tran1 = double('transaction')
    tran2 = double('transaction')

    transaction_stub(tran1, '20/01/2022', nil, 150, 150)
    transaction_stub(tran2, '21/01/2022', 100, nil, 250)

    statement.add_transaction(tran1)
    statement.add_transaction(tran2)

    expect(statement.display).to eq(["21/01/2022 || £100.00 ||  || £250.00\n",
                                     "20/01/2022 ||  || £150.00 || £150.00\n"])
  end
end
