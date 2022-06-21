# frozen_string_literal: true

require 'transaction'

describe Transaction do
  let(:transaction) { Transaction.new(100, 100) }
  it 'records the date of the transaction' do
    expect(transaction.date).to eq Date.today.strftime('%d/%m/%Y')
  end
  it 'records transaction\'s credit correctly' do
    expect(transaction.credit).to eq 100
  end
  it 'records transaction\'s correctly' do
    expect(transaction.debit).to eq nil
  end
end
