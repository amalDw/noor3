import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  TextInputType typeOfInput;
  String label;
  TextEditingController cont;
  MyTextField(
      {@required this.typeOfInput, @required this.label, @required this.cont});
  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.all(8),
      child: TextField(
        keyboardType: typeOfInput,
        controller: cont,

        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(9)),
          ),
        ),
      ),
    );
  }
}
