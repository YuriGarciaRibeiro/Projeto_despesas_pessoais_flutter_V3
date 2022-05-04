import 'package:flutter/material.dart';

class NoTransactions extends StatelessWidget {
  BoxConstraints constraints;

  NoTransactions(this.constraints);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Nenhuma transação cadastrada!",
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: constraints.maxHeight * 0.6,
          child: Image.asset(
            "assets/images/waiting.png",
            fit: BoxFit.cover,
          ),
        ),
      ],
    ); 
  }
}
