import 'package:flutter/material.dart';

void showSnackBar(BuildContext context ,String Msg) {
  ScaffoldMessenger.of(context).showSnackBar( SnackBar(
      content: Text(Msg)));
}