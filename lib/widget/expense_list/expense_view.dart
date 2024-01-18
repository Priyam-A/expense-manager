import 'package:flutter/material.dart';
import 'package:project_3/models/record.dart';
import 'package:project_3/widget/expense_list/expense_tile.dart';

class ExpenseView extends StatelessWidget {
  const ExpenseView({super.key, required this.expenseList, required this.deleteExpense});
  final List<Expense> expenseList;
  final void Function(Expense exp) deleteExpense; 
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenseList[index]),
        onDismissed: (direction) => deleteExpense(expenseList[index]),
        background: Container(color: Theme.of(context).colorScheme.error),
        child: ExpenseTile(
          expense: expenseList[index],
        ),
      ),
      itemCount: expenseList.length,
    );
  }
}
