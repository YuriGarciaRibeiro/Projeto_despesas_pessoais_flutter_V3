// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptativeButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  AdaptativeButton({this.text,this.onPressed});


  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ?
    CupertinoButton(
      child: Text(text),
      onPressed: onPressed,
    ) 
    : ElevatedButton(
      child: Text(text),
      onPressed: onPressed,
    );
  }
}