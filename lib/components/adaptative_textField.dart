import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeTextField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final Function onSubmitted;
  final TextInputType keyboardType ;

  AdaptativeTextField({
    this.text,
    this.controller,
    this.onSubmitted,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
          ),
          child: CupertinoTextField(
              placeholder: text,
              controller: controller,
              onSubmitted: onSubmitted,
              keyboardType: keyboardType,
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
            ),
        )
        : TextField(
            controller: controller,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(labelText: text),
            keyboardType: keyboardType,
          );
  }
}
