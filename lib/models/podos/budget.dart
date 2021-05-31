import 'package:xafe/models/enums/budget.dart';
import 'package:xafe/utils/intl_formatter.dart';

class Budget {
  String name;
  num amount;
  num? amountSpent;
  BudgetInterval interval;

  Budget({
    required this.name,
    required this.amount,
    required this.interval,
    this.amountSpent,
  });

  double get spentFraction {
    final fraction = (amountSpent ?? 0) / amount;
    if (fraction > 1) return 1;
    return fraction;
  }

  String get formattedAmount {
    final _amount = XfFormatter.formatCurrencyLong(amount);

    return "$_amount/$intervalName";
  }

  String get amountSpentFormatted {
    return XfFormatter.formatCurrencyLong(amountSpent ?? 0, spaceIcon: true);
  }

  String get intervalName {
    switch (interval) {
      case BudgetInterval.Daily:
        return "day";
      case BudgetInterval.Weekly:
        return "week";
      case BudgetInterval.Monthly:
        return "month";
    }
  }
}

class BudgetExpense {
  String name;
  num amount;
  DateTime _createdAt;
  String imageUrl;

  BudgetExpense({
    required this.name,
    required this.amount,
    required this.imageUrl,
  }) : _createdAt = DateTime.now();

  String get dateCreated {
    return XfFormatter.formatDate(
      _createdAt.toIso8601String(),
      format: "dd/mm/yy",
    );
  }

  String get formattedAmount {
    return XfFormatter.formatCurrency(amount);
  }
}

class BudgetExpenseCategory {
  String name;
  DateTime _createdAt;
  String imageUrl;

  BudgetExpenseCategory({
    required this.name,
    required this.imageUrl,
  }) : _createdAt = DateTime.now();

  String get dateCreated {
    return XfFormatter.formatDate(
      _createdAt.toIso8601String(),
      format: "dd/mm/yy",
    );
  }
}
