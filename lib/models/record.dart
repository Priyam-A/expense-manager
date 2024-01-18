import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMMMd();
const uuid = Uuid();
enum Category {food, leisure, travel, work}
const categoryIcons = {
  Category.food : Icons.lunch_dining_outlined,
  Category.leisure: Icons.bed_outlined,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work_outline,
};
class Expense {
  Expense({
    required this.value,
    required this.title,
    required this.dateTime,
    required this.category
  }) : id = uuid.v4();

  final String id;
  final double value;
  final String title;
  final DateTime dateTime;
  final Category category; 

  String get date => formatter.format(dateTime);
}

class CollectedExpenses{
  CollectedExpenses(this.expList, this.cat);

  CollectedExpenses.fromCat(List<Expense> expList1, this.cat) : expList = expList1.where((element) => element.category == cat).toList();

  final List<Expense> expList;
  final Category cat;

  double get totalExpense {
    double sum = 0;
    for (Expense item in expList){
      sum+=item.value;
    }
    return sum;
  }
  }
