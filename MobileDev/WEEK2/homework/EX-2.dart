class BankAccount {
  final String _accountId;
  final String _accountOwner;
  double _balance;
  BankAccount(this._accountId, this._accountOwner, [this._balance = 0.0]);
  String get accountId => _accountId;
  String get accountOwner => _accountOwner;
  double get balance => _balance;

  double Balance() {
    return _balance;
  }

  void withdraw(double amount) {
    if (amount < 0) {
      throw ArgumentError("withdraw amount be greater than 0");
    }
    _balance -= amount;
  }

  void credit(double amount) {
    if (amount < 0) {
      throw ArgumentError("credit amount be greater than 0");
    }
    _balance += amount;
  }
}

class Bank {
  final String _name;
  final List<BankAccount> _bankAccount = [];
  Bank({required this._name});
  String get name => _name;

  BankAccount createAccount(String accountId, String accountOwner) {
    for (final bankAccount in _bankAccount) {
      if (bankAccount.accountId == accountId) {
        throw Exception('Account ID already exists');
      }
    }
    var account = BankAccount(accountId, accountOwner);
    _bankAccount.add(account);
    return account;
  }
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount("100", 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount("100", 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
