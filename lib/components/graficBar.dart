// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class graficBar extends StatelessWidget {
  final double value;
  final List groupedTransaction;
  final int index;
  final double percentage;

  const graficBar(
    this.value,
    this.groupedTransaction,
    this.index,
    this.percentage,
  );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(child: Text(value.toStringAsFixed(2))),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            SizedBox(
              height: constraints.maxHeight * 0.6,
              width: 10,
              child: Stack(alignment: Alignment.bottomLeft, children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromRGBO(220, 220, 220, 1)),
                ),
                FractionallySizedBox(
                  heightFactor: percentage,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                )
              ]),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(child: Text(groupedTransaction[index]["day"])),
            ),
          ],
        );
      },
    );
  }
}
