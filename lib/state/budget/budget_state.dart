import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:xafe/models/enums/budget.dart';
import 'package:xafe/models/podos/budget.dart';

class BudgetState extends ChangeNotifier {
  static BudgetState? _instance;

  static BudgetState get instance {
    if (_instance == null) {
      _instance = BudgetState();
    }
    return _instance ?? BudgetState();
  }

  num get expenses {
    return mockBudgets.map((it) => it.amountSpent).reduce((p, n) => (p ?? 0) + (n ?? 0)) ?? 0;
  }

  num get income {
    return mockBudgets.map((it) => it.amount).reduce((p, n) => (p) + (n));
  }

  num get revenue {
    return expenses + income;
  }

  List<Budget> get mockBudgets {
    return [
      Budget(
        name: "Groceries",
        amount: 40,
        interval: BudgetInterval.Monthly,
        amountSpent: 35,
      ),
      Budget(
        name: "Family",
        amount: 1000,
        interval: BudgetInterval.Monthly,
        amountSpent: 850,
      ),
      Budget(
        name: "Kids",
        amount: 35,
        interval: BudgetInterval.Monthly,
        amountSpent: 2,
      ),
      Budget(
        name: "Clothing",
        amount: 235,
        interval: BudgetInterval.Monthly,
        amountSpent: 50,
      ),
    ];
  }

  List<BudgetExpense> get mockExpenses {
    return [
      BudgetExpense(
        name: "Gelery",
        amount: 14.99,
        imageUrl: "https://res.cloudinary.com/jesse-dirisu/image/upload/v1622395520/drumstick.png",
      ),
      BudgetExpense(
        name: "Tomatoes",
        amount: 14.99,
        imageUrl: "https://res.cloudinary.com/jesse-dirisu/image/upload/v1622395520/drumstick.png",
      ),
      BudgetExpense(
        name: "Milk",
        amount: 14.99,
        imageUrl: "https://res.cloudinary.com/jesse-dirisu/image/upload/v1622395520/drumstick.png",
      ),
      BudgetExpense(
        name: "Uber Fares",
        amount: 14.99,
        imageUrl: "https://res.cloudinary.com/jesse-dirisu/image/upload/v1622395520/airplane.png",
      ),
    ];
  }

  List<BudgetExpenseCategory> get mockExpenseCategories {
    return [
      BudgetExpenseCategory(
        name: "Food",
        imageUrl: "https://res.cloudinary.com/jesse-dirisu/image/upload/v1622395520/drumstick.png",
      ),
      BudgetExpenseCategory(
        name: "Fashion",
        imageUrl: "https://res.cloudinary.com/jesse-dirisu/image/upload/v1622395520/drumstick.png",
      ),
      BudgetExpenseCategory(
        name: "Transport",
        imageUrl: "https://res.cloudinary.com/jesse-dirisu/image/upload/v1622395520/airplane.png",
      ),
      BudgetExpenseCategory(
        name: "Sports",
        imageUrl: "https://res.cloudinary.com/jesse-dirisu/image/upload/v1622395520/airplane.png",
      ),
    ];
  }
}
