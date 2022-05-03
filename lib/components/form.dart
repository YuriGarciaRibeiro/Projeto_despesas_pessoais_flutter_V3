// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'adaptative_button.dart';
import 'adaptative_textField.dart';
import 'adataptative_date_picker.dart';

class FormNameAmount extends StatefulWidget {
  final void Function(String, double, DateTime) addTransaction;

  FormNameAmount(this.addTransaction);

  @override
  State<FormNameAmount> createState() => _FormNameAmountState();
}

class _FormNameAmountState extends State<FormNameAmount> {
  final _tittleController = TextEditingController();

  final _valueController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    if (_tittleController.text.isEmpty ||
        double.parse(_valueController.text) <= 0 ||
        _selectedDate == null) {
      return;
    }

    widget.addTransaction(_tittleController.text,
        double.tryParse(_valueController.text) ?? 0.0, _selectedDate);
  }

  

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              AdaptativeTextField(
                text: 'Título',
                controller: _tittleController,
                onSubmitted: (_) => _submitForm(),
              ),
              AdaptativeTextField(
                controller: _valueController,
                onSubmitted: (_) => _submitForm(),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                text: "Valor (R\$)",
              ),
              AdaptativeDatePicker(
                selectedDate: _selectedDate,
                onDateChanged: (newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AdaptativeButton(
                    text: "Adicionar Transação",
                    onPressed: _submitForm,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
