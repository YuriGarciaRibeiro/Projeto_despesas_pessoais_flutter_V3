// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:expenses/components/graficBar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Grafic extends StatefulWidget {
  List compras;

  Grafic(this.compras);

  @override
  State<Grafic> createState() => _GraficState();
}

class _GraficState extends State<Grafic> {
  List<Map<String, Object>> get groupedTransaction {
    // ignore: missing_return
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0.0;

      for (var i = 0; i < widget.compras.length; i++) {
        bool sameDay = widget.compras[i].date.day == weekDay.day;
        bool sameMonth = widget.compras[i].date.month == weekDay.month;
        bool sameYear = widget.compras[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += widget.compras[i].value;
        }
      }

      return {"day": DateFormat.E().format(weekDay)[0], "value": totalSum};
    }).reversed.toList();
  }

  _valorTotal() {
    double total = 0.0;

    for (var i = 0; i < groupedTransaction.length; i++) {
      total += groupedTransaction[i]["value"];
    }
    return total;
  }

  _gerarColunas() {
    var colunas = [];

    for (var i = 0; i < 7; i++) {
      double value = groupedTransaction[i]["value"];
      var percentage = value / _valorTotal();
      colunas.add(
        Flexible(
            fit: FlexFit.tight,
            child: graficBar(value, groupedTransaction, i,
                _valorTotal() == 0 ? 0 : percentage)),
      );
    }

    return colunas;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ..._gerarColunas(),
          ],
        ),
      ),
    );
  }
}
