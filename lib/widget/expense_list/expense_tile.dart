import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_3/models/record.dart';

//import 'package:google_fonts/google_fonts.dart';
class ExpenseTile extends StatelessWidget {
  const ExpenseTile({super.key, required this.expense});
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              expense.title,
              style: GoogleFonts.pacifico(fontSize: 28,fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  '\$ ${expense.value.toStringAsFixed(2)}',
                  style: GoogleFonts.firaCode(),
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(expense.date),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
