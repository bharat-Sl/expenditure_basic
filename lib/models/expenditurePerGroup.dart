import 'dart:ui';

class ExpenditurePerGroup {
  int expenditure;
  String group;
  Color color;
  static int totalExpense = 0;
  ExpenditurePerGroup(
      {required this.expenditure, required this.group, required this.color}) {
    totalExpense += expenditure;
  }
}
