import 'package:flutter/material.dart';
import 'package:project_3/models/record.dart';
import 'package:project_3/widget/chart/chart_bar.dart';


class Chart extends StatelessWidget {
  const Chart(this.expList, {super.key});

  final List<Expense> expList;

  /*
  Map<Category, double> get totals{
      Map<Category,double> totals;
      totals = {
        for (Category cat in Category.values)
          cat: collectedExpenses.fromCat(expList, cat).totalExpense,
      };
      return totals;
  }
  */

  List<CollectedExpenses> get totals {
    return [

      CollectedExpenses.fromCat(expList, Category.food),
      CollectedExpenses.fromCat(expList, Category.leisure),
      CollectedExpenses.fromCat(expList, Category.travel),
      CollectedExpenses.fromCat(expList, Category.work),
    ];
  }

  double get maxTotal{
      double max = totals[0].totalExpense;
      for (int i=0; i<Category.values.length;i++){
        if (totals[i].totalExpense>max){
          max = totals[i].totalExpense;
        }
      }
      return max;
    }
  @override
  Widget build(BuildContext context) {

    /*
    Map<Category, double> totals = {
      for (Category cat in Category.values)
        cat: collectedExpenses.fromCat(expList, cat).totalExpense,
    };
    */

    

    return Container(
      height: 180,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.0)
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            for (int i=0; i<Category.values.length; i++)
              //SizedBox(
               // width: 40,
                //child: 
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      //mainAxisSize: MainAxisSize.min,
                      children: [
                        //Text(totals[i].totalExpense.toString()),
                       // SizedBox(height: 15),
                        ChartBar((totals[i].totalExpense)/maxTotal),
                        const SizedBox(height:15),
                        Icon(categoryIcons[totals[i].cat]),
                      ],
                    ),
                ),
            //  ),
              
          ],
        ),
      );
  }
}
