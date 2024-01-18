import 'package:flutter/material.dart';
//import 'package:project_3/widget/chart/chart.dart';
import 'package:project_3/widget/chart/chart1.dart';
import 'package:project_3/widget/expense_list/expense_view.dart';
import 'package:project_3/models/record.dart';
import 'package:project_3/widget/new_expense.dart';

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<ExpenseTracker> {
  final List<Expense> _expenseList = [ 
    Expense(
      title: 'Flutter',
      value: 25,
      category: Category.work,
      dateTime: DateTime.now(),
    ),
    Expense(
      title: 'Movie',
      value: 40,
      category: Category.leisure,
      dateTime: DateTime.now(),
    )
  ];

  Widget _noExpenses() => const Center(child: Text("Hoarding those \$ bills??"));

  void _removeExpense(Expense dataToBeDeleted) {
    var idx = _expenseList.indexOf(dataToBeDeleted);
    setState(() {
      _expenseList.remove(dataToBeDeleted);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("Expense deleted..."),
        action: SnackBarAction(
          label: 'Undo?',
          onPressed: () {
            setState(() {
              _expenseList.insert(idx, dataToBeDeleted);
            });
          },
        ),
      ),
    );
  }

  void _addExpense(Expense receivedData) {
    setState(() {
      _expenseList.add(receivedData);
    });
  }

  void _openExpenseAdder() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(addExpense: _addExpense),
    );
  }
  
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Manager"),
        actions: [
          IconButton(
            onPressed: _openExpenseAdder,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: MediaQuery.of(context).size.width<600? Column(
        children: [
          Chart(
           // expenses: 
            _expenseList),
          Expanded(
              child: _expenseList.isEmpty
                  ? _noExpenses()
                  : ExpenseView(
                      expenseList: _expenseList,
                      deleteExpense: _removeExpense,
                    )),
        ],
      )
      :Row(
        children: [
          Expanded(
            child: Chart(
             // expenses: 
              _expenseList),
          ),
          Expanded(
              child: _expenseList.isEmpty
                  ? _noExpenses()
                  : ExpenseView(
                      expenseList: _expenseList,
                      deleteExpense: _removeExpense,
                    )),
        ],
      ),
    );
  }
}
