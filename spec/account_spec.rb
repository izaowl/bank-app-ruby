# frozen_string_literal: true

require 'account'

describe Account do
  let(:account) { Account.new }
  describe '#initialize' do
    it 'inialises account with a default balance of 0' do
      expect(account.balance).to eq 0
    end
  end
  describe '#deposit' do
    it 'accepts deposit' do
      account.deposit(50)
      expect(account.balance).to eq 50
    end
    it 'doesn\'t accept deposit of a negative amount' do
      expect { account.deposit(-100) }
        .to output("Amount must be greater than zero\n").to_stdout
    end
    it 'doesn\'t let user deposit zero' do
      expect { account.deposit(0) }
        .to output("Amount must be greater than zero\n").to_stdout
    end
    it 'doesn\'t let user enter an invalid character' do
      expect { account.deposit(' ') }
        .to output("You entered an invalid value, please put in an integer instead\n").to_stdout
    end
  end
  describe '#withdrawal ' do
    it 'accepts withdrawals' do
      account.deposit(100)
      account.withdrawal(50)
      expect(account.balance).to eq(50)
    end
    it 'doesn\'t let withdrawals larger than available balance' do
      expect { account.withdrawal(50) }
        .to output("Not enough money in your account to withdraw this amount\n").to_stdout
    end
    it 'Doesn\'t allow special characters or spaces' do
      expect { account.withdrawal('   ') }
        .to output("You entered an invalid value, please put in an integer instead\n").to_stdout
    end
    it 'doesn\'t accept a negative amount' do
      expect { account.withdrawal(-50) }
        .to output("Amount must be greater than zero\n").to_stdout
    end
    it 'doesn\'t accept zero' do
      expect { account.withdrawal(0) }
        .to output("Amount must be greater than zero\n").to_stdout
    end
  end

  describe '#print_statement' do
    it 'displays header and transactions' do
      account.deposit(200)
      account.withdrawal(50)
      expect { account.statement_output }.to output("date || credit || debit || balance
#{Date.today.strftime('%d/%m/%Y')} ||  || £50.00 || £150.00
#{Date.today.strftime('%d/%m/%Y')} || £200.00 ||  || £200.00
").to_stdout
    end
  end
end
