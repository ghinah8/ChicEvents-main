// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class textfield extends StatelessWidget {
  textfield(
      {this.onchange, this.hint, required this.lab, this.obscuretext = false});
  String? hint;
  String? lab;
  Function(String)? onchange;
  bool? obscuretext;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscuretext!,
      // ignore: body_might_complete_normally_nullable
      validator: (data) {
        if (data!.isEmpty) return 'this field is required';
      },
      onChanged: onchange,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xff4b173d),
          )),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xff4b173d),
          )),
          label: Text(
            lab!,
            style: const TextStyle(
              color: Color(0xff4b173d),
            ),
          ),
          border: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xff4b173d),
          )),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Color(0xff4b173d),
          )),
    );
  }
}
