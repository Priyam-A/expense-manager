import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar(this.val, {super.key});
  final double val;
  @override
  Widget build(BuildContext context) {
   
    return Expanded(
      child: FractionallySizedBox(
          widthFactor: 1.0,
          heightFactor: val,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
            ),
          ),
        ),
    );
  }
}
