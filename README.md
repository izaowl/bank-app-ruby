# banking-app-ruby

I built a simple Banking App which calculates balance of the Bank Account. You can enter deposits and withdrawals and it will then print a statement with each transaction and the date when the transaction was entered, latest transaction first.
My code was developed in Ruby, tested using Rspec. In order to run it and it's tests please follow my instructions:

### Requirements

- You should be able to interact with your code via a REPL like IRB. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Preparing your machine to run my code
- Clone the repo
```
git clone https://github.com/izaowl/bank-app-ruby.git
```
- Navigate to the directory "bank-app-ruby"
- Install the Gems 
```
bundle install
```
### How to interract with my code

* Open terminal and make sure you are in the main directory bank-app-ruby
* paste this command into your terminal: irb -r ./lib/Account.rb
* you can start interracting with my app by running the following commands and methods:

```
account = Account.new()           // to create new account
account.deposit(1000)             // to deposit money
account.account.deposit(2000)     // to withdraw money
account.balance()                 // to obtain balance
account.statement_output()        // to obtain statement
```
### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2023  
**And** a deposit of 2000 on 13-01-2023  
**And** a withdrawal of 500 on 14-01-2023  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00

```
This screenshot illustrates my output:
![Alt text](/images/Screenshot_of_IRB_output.png?raw=true "Ruby IRB output")

### Test coverage
![Alt text](/images/Screenshot_of_test_coverage.png?raw=true "Code coverage")


### User Stories

```
As person with Bank Account
So I can keep track of my funds
I want to be able to see balance on my account

As person with Bank Account
So I can make save money
I want to be able to deposit my money

As person with Bank Account
So I can make save money
I want to be able to withdraw my money

As person with Bank Account
So I can make sure all transactions are correct
I want to see my bank statement with all details of withdrawals and deposits
```

### Domain Model


| Class         | Account                                                                    |
|---------------|----------------------------------------------------------------------------|
| Properties    | balance                                        |
| Actions       | constructor, deposit, withdrawal, statement_output, _add_transaction_to_statement |                        |

| Class         | Transaction                  |
|---------------|------------------------------|
| Properties    | date, amount, currentBalance |
| Actions       | Constructor                  |

| Class         | BankStatement
|---------------|---------------------------------------------------------------------------------------------------------------------------|
| Properties    |   n/a                                                                                                                     | 
| Actions       | printStatement, formatStatementOutput, formatEachTransaction, formatCreditTransaction , formatDebitTransaction, addHeader |


### Edge cases added to my code and not included in initial requirements:
* check for negative withdrawals
* check for validity of the string, i.e. it has to be an Integer
* check if there is enough money in account to withdraw