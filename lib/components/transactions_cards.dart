import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expenses/models/transactions.dart';

class TrasactionsCards extends StatelessWidget {
  final Function deleteTx;
  final Transaction tr;

  TrasactionsCards(this.deleteTx, this.tr);

  @override
  Widget build(BuildContext context) {
    return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          child: Text(
                            "R\$ ${tr.value.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Quicksand",
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat('dd/MM/yyyy').format(tr.date),
                    ),
                    trailing: MediaQuery.of(context).size.width < 400
                        ? IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => deleteTx(tr.id),
                            color: Colors.grey,
                          )
                        : TextButton.icon(
                            icon: const Icon(Icons.delete),
                            label: const Text("Excluir"),
                            onPressed: () => deleteTx(tr.id),
                          ),
                  ),
                );;
  }
}