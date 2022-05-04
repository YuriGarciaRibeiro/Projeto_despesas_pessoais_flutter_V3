// ignore_for_file: prefer_const_constructors

import 'package:expenses/models/transactions.dart';
import 'package:flutter/material.dart';

import '../models/transactions.dart';
import 'no_transactions.dart';
import 'transactions_cards.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: transactions.isEmpty
          ? LayoutBuilder(builder: ((context, constraints) {
              return NoTransactions(constraints);
            }))
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final tr = transactions[index];
                return TrasactionsCards(deleteTx, tr);
              },
            ),
    );
  }
}
