import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final int amount;
  final double spentPercentage;

  ChartBar(this.label, this.amount, this.spentPercentage);

  @override
  Widget build(BuildContext context) {
    print('Spend: $spentPercentage');
    return Column(
      children: [
        Container(
            height: 20,
            child: FittedBox(child: Text('\u20B9${amount.toString()}'))),
        SizedBox(height: 4),
        Container(
            height: 60,
            width: 10,
            child: Stack(
              children: [
                FractionallySizedBox(
                    heightFactor: spentPercentage,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                    )),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            )),
        SizedBox(height: 4),
        Text(label)
      ],
    );
  }
}
