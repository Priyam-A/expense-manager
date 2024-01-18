//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_3/models/record.dart';

final formatter = DateFormat.yMMMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.addExpense});

  final void Function(Expense exp) addExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _textController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedType = Category.work;

  void _createDatePicker() async {
    DateTime now = DateTime.now();
    DateTime firstDate = DateTime(now.year - 1, now.month, now.day + 1);
    DateTime lastDate = DateTime(now.year + 1, now.month, now.day - 1);
    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
      initialDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpese() {
    final enteredAmount = double.tryParse(_amountController.text);
    final enteredTitle = _textController.text;
    final isInvalidText = _textController.text.trim().isEmpty;
    final isInvalidAmt = enteredAmount == null || enteredAmount <= 0;
    final isInvalidDate = _selectedDate == null;
    if (isInvalidText || isInvalidDate || isInvalidAmt) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid Input!!!"),
          content: const Text("Please enter all the data correctly..."),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text("Okay"),
            )
          ],
        ),
      );
      return;
    } else {
      Expense exp = Expense(
        category: _selectedType,
        dateTime: _selectedDate!,
        value: enteredAmount,
        title: enteredTitle,
      );
      widget.addExpense(exp);
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyBoardSpace = MediaQuery.of(context).viewInsets.bottom;
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 16, 20, keyBoardSpace + 16),
          child: Column(
            children: [
              TextField(
                controller: _textController,
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Title'),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _amountController,
                      keyboardType: const TextInputType.numberWithOptions(),
                      decoration: const InputDecoration(
                        prefix: Text('\$ '),
                        label: Text('Amount'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          _selectedDate == null
                              ? 'Select Date'
                              : formatter.format(_selectedDate!),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        IconButton(
                          onPressed: _createDatePicker,
                          icon: const Icon(Icons.calendar_month),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DropdownButton(
                    items: Category.values
                        .map(
                          (item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item.name.toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(
                          () {
                            _selectedType = value;
                          },
                        );
                      }
                    },
                    value: _selectedType,
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: _submitExpese,
                    child: const Text(
                      "Submit",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Cancel",
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
