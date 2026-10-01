// Question 3: Classes & Objects (Difficulty: 3/5) ⭐⭐⭐
/**
 * EXPECTED OUTPUT:
 * Account: 12345, Holder: Alice, Type: Savings, Balance: 800.0
 * Account: 67890, Holder: Bob, Type: Checking, Balance: 400.0
 * Account: 11111, Holder: Charlie, Type: Savings, Balance: 2000.0
 * Insufficient funds for withdrawal of 1000.0 from account 67890
 */

class BankAccount {
  // Properties
  String accountNumber;
  String accountHolder;
  double balance;
  String accountType;

  // Constructor
  BankAccount(this.accountNumber, this.accountHolder, this.accountType)
      : balance = 0.0;

  // Deposit money
  void deposit(double amount) {
    balance += amount;
  }

  // Withdraw money
  void withdraw(double amount) {
    if (balance >= amount) {
      balance -= amount;
    } else {
      print(
          "Insufficient funds for withdrawal of $amount from account $accountNumber");
    }
  }

  // Get current balance
  double getBalance() {
    return balance;
  }

  // Display account information
  void displayAccountInfo() {
    print(
        "Account: $accountNumber, Holder: $accountHolder, Type: $accountType, Balance: $balance");
  }
}

void main() {
  // Create 3 bank accounts
  BankAccount account1 =
      BankAccount("12345", "Alice", "Savings");

  BankAccount account2 =
      BankAccount("67890", "Bob", "Checking");

  BankAccount account3 =
      BankAccount("11111", "Charlie", "Savings");

  // Deposit money
  account1.deposit(1000.0);
  account2.deposit(500.0);
  account3.deposit(2000.0);

  // Withdraw money
  account1.withdraw(200.0);
  account2.withdraw(100.0);

  // Display account information
  account1.displayAccountInfo();
  account2.displayAccountInfo();
  account3.displayAccountInfo();

  // Demonstrate insufficient funds
  account2.withdraw(1000.0);
}